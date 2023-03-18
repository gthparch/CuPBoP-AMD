#include <functional>
#include <iostream>
#include <memory>
#include <queue>
#include <set>
#include <unordered_map>
#include <unordered_set>
#include <vector>

#include "llvm/Demangle/Demangle.h"
#include "llvm/IR/DerivedTypes.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/GlobalValue.h"
#include "llvm/IR/IRBuilder.h"
#include "llvm/IR/InstIterator.h"
#include "llvm/IR/Instructions.h"
#include "llvm/IR/Module.h"
#include "llvm/Pass.h"

#include "CooperativeGroupsPass.hpp"

using namespace llvm;
using namespace cupbop::amd::passes;

namespace {
static RegisterPass<CooperativeGroupsPass>
    _("cooperative-groups",
      "Convert operations on CUDA cooperative groups to be AMD compatible");
}; // namespace

char CooperativeGroupsPass::ID = 0;

CooperativeGroupsPass::CooperativeGroupsPass() : ModulePass(ID) {}

bool CooperativeGroupsPass::runOnModule(Module &M) {
    using fn_replacer = std::function<void(Function *)>;
    auto direct_replacement = [](const char *replacementFnName) -> fn_replacer {
        return [=](Function *f) {
            auto M = f->getParent();
            auto repFnCallee =
                M->getOrInsertFunction(replacementFnName, f->getFunctionType());
            auto *repFn = cast<Function>(repFnCallee.getCallee());
            f->replaceAllUsesWith(repFn);
            f->dropAllReferences();
            f->eraseFromParent();
        };
    };
    std::unordered_map<std::string, fn_replacer> known_cg_fns = {
        {"cooperative_groups::__v1::thread_block::thread_rank()",
         direct_replacement("cupbop_cg_thread_block_thread_rank")},
        // Also just getting the thread rank in the block
        {"cooperative_groups::__v1::details::cta::thread_rank()",
         direct_replacement("cupbop_cg_thread_block_thread_rank")},

        {"cooperative_groups::__v1::grid_group::thread_rank() const",
         direct_replacement("cupbop_cg_grid_group_thread_rank")},
        {"cooperative_groups::__v1::grid_group::sync() const",
         direct_replacement("cupbop_cg_grid_group_sync")},
        {"cooperative_groups::__v1::grid_group::size() const",
         direct_replacement("cupbop_cg_grid_group_size")},
        {"cooperative_groups::__v1::grid_group::is_valid() const",
         direct_replacement("cupbop_cg_grid_group_is_valid")},
        {"cooperative_groups::__v1::details::laneid()",
         direct_replacement("cupbop_cg_laneid")},
        {"cooperative_groups::__v1::details::lanemask32_lt()",
         direct_replacement("cupbop_cg_lanemask32_lt")},

        // For grid groups, we cannot completely reuse CUDA's way of
        // constructing it with a pointer read by the kernel (GCN doesn't have
        // it). For this function, we return nullptr instead.
        {"cooperative_groups::__v1::details::get_grid_workspace()",
         [&](Function *F) {
             auto &ctx = F->getContext();
             F->deleteBody();
             IRBuilder<> builder(ctx);
             builder.SetInsertPoint(BasicBlock::Create(ctx, "", F));
             builder.CreateRet(ConstantPointerNull::get(
                 cast<PointerType>(F->getReturnType())));
         }},

        // Replace barrier synchronization so we don't have to change
        // thread_block.sync()
        {"__barrier_sync(unsigned int)", direct_replacement("cupbop_syncwarp")},
        {"__syncwarp(unsigned int)", direct_replacement("cupbop_syncwarp")},
        {"__activemask()", direct_replacement("cupbop_activemask")},
    };
    std::vector<std::pair<fn_replacer, Function *>> pendingOps{};

    // First locate all the symbols we need to replace
    for (Function &fn : M) {
        auto rawFnName = fn.getName().str();
        auto demangledFnName = demangle(rawFnName);
        if (auto replIt = known_cg_fns.find(demangledFnName);
            replIt != known_cg_fns.end()) {
            pendingOps.push_back({replIt->second, &fn});
        }
    }

    // Then replace them one by one, so that we don't have to worry about
    // modifying the function list while iterating over it
    for (auto [repl, fn] : pendingOps) {
        repl(fn);
    }

    return true;
}

bool processFunction(Module &M, Function &F) { return true; }

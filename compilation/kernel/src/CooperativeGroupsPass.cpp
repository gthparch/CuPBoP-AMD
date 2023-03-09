#include <functional>
#include <iostream>
#include <memory>
#include <queue>
#include <set>
#include <unordered_map>
#include <unordered_set>
#include <vector>

#include "llvm/IR/DerivedTypes.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/GlobalValue.h"
#include "llvm/IR/InstIterator.h"
#include "llvm/IR/Instructions.h"
#include "llvm/IR/Module.h"
#include "llvm/Demangle/Demangle.h"
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
    using fn_replacer = std::function<void(Function*)>;
    std::unordered_map<std::string, fn_replacer> known_cg_fns = {
        {"cooperative_groups::__v1::thread_block::thread_rank()", [&](Function *f){
            auto repFnCallee = M.getOrInsertFunction("cupbop_cg_thread_block_thread_rank", f->getFunctionType());
            auto* repFn = cast<Function>(repFnCallee.getCallee());
            f->replaceAllUsesWith(repFn);
            f->dropAllReferences();
            f->eraseFromParent();
        }},
        {"__barrier_sync(unsigned int)", [&](Function *f) {
            auto repFnCallee = M.getOrInsertFunction("cupbop_syncwarp", f->getFunctionType());
            auto* repFn = cast<Function>(repFnCallee.getCallee());
            f->replaceAllUsesWith(repFn);
            f->dropAllReferences();
            f->eraseFromParent();
        }}
    };
    std::vector<std::pair<fn_replacer, Function*>> pendingOps {};
    
    // First locate all the symbols we need to replace
    for (Function& fn : M) {
        auto rawFnName = fn.getName().str();
        auto demangledFnName = demangle(rawFnName);
        if (auto replIt = known_cg_fns.find(demangledFnName); replIt != known_cg_fns.end()) {
            pendingOps.push_back({replIt->second, &fn});
        }
    }

    // Then replace them one by one, so that we don't have to worry about modifying
    // the function list while iterating over it
    for (auto [repl, fn] : pendingOps) {
        repl(fn);
    }

    return true;
}

bool processFunction(Module &M, Function &F) {
    ;
}

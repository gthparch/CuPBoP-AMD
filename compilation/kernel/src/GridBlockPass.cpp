#include <iostream>
#include <memory>
#include <queue>
#include <set>

#include "llvm/IR/DerivedTypes.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/GlobalValue.h"
#include "llvm/IR/IRBuilder.h"
#include "llvm/IR/Instructions.h"
#include "llvm/IR/IntrinsicInst.h"
#include "llvm/IR/Intrinsics.h"
#include "llvm/IR/IntrinsicsAMDGPU.h"
#include "llvm/IR/IntrinsicsNVPTX.h"
#include "llvm/IR/LLVMContext.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/Value.h"
#include "llvm/Pass.h"
#include "llvm/Support/AtomicOrdering.h"

#include "GridBlockPass.hpp"
#include "cupbop_amd.hpp"

using namespace llvm;
using namespace cupbop::amd::passes;

namespace {
static RegisterPass<GridBlockPass>
    grid_block_convert_pass("grid-block-conversion",
                            "Convert Block and Grid Dimensions AMD");

struct op_context {
    std::vector<Instruction *> insts_to_remove;
    llvm::Module &M;
};

using intrinsic_replacer = std::function<void(op_context &, IntrinsicInst &)>;

void replace_intrinsic(op_context &ctx, IntrinsicInst &call,
                       Intrinsic::ID replacement) {
    auto *replacementDeclaration =
        Intrinsic::getDeclaration(&ctx.M, replacement);
    call.setCalledFunction(replacementDeclaration);
}

void replace_call(op_context &ctx, IntrinsicInst &call,
                  llvm::StringRef replacementCallee) {
    auto replacementFunction = ctx.M.getOrInsertFunction(
        replacementCallee, IntegerType::get(getCupbopLLVMContext(), 32));
    call.setCalledFunction(replacementFunction);
}

void replace_barrier(op_context &ctx, IntrinsicInst &call) {
    auto &llvmContext = ctx.M.getContext();
    auto gcnBarrierIntrinsic =
        Intrinsic::getDeclaration(&ctx.M, Intrinsic::amdgcn_s_barrier);
    IRBuilder<> builder(llvmContext);
    auto workgroupSsid = llvmContext.getOrInsertSyncScopeID("workgroup");
    builder.SetInsertPoint(&call);
    builder.CreateFence(AtomicOrdering::Release, workgroupSsid);
    builder.CreateCall(gcnBarrierIntrinsic);
    builder.CreateFence(AtomicOrdering::Acquire, workgroupSsid);
    ctx.insts_to_remove.push_back(&call);
}

intrinsic_replacer direct_replacement(Intrinsic::ID replacement) {
    using namespace std::placeholders;
    return std::bind(replace_intrinsic, _1, _2, replacement);
}

intrinsic_replacer custom_call(llvm::StringRef replacementCallee) {
    using namespace std::placeholders;
    return std::bind(replace_call, _1, _2, replacementCallee);
}
}; // namespace

char GridBlockPass::ID = 0;

GridBlockPass::GridBlockPass() : FunctionPass(ID) {}

bool GridBlockPass::runOnFunction(Function &F) {
    std::unordered_map<Intrinsic::ID, ::intrinsic_replacer> knownIntrinsics = {
        {Intrinsic::nvvm_read_ptx_sreg_tid_x,
         direct_replacement(Intrinsic::amdgcn_workitem_id_x)},
        {Intrinsic::nvvm_read_ptx_sreg_tid_y,
         direct_replacement(Intrinsic::amdgcn_workitem_id_y)},
        {Intrinsic::nvvm_read_ptx_sreg_tid_z,
         direct_replacement(Intrinsic::amdgcn_workitem_id_z)},
        {Intrinsic::nvvm_read_ptx_sreg_ctaid_x,
         direct_replacement(Intrinsic::amdgcn_workgroup_id_x)},
        {Intrinsic::nvvm_read_ptx_sreg_ctaid_y,
         direct_replacement(Intrinsic::amdgcn_workgroup_id_y)},
        {Intrinsic::nvvm_read_ptx_sreg_ctaid_z,
         direct_replacement(Intrinsic::amdgcn_workgroup_id_z)},
        {Intrinsic::nvvm_read_ptx_sreg_ntid_x,
         custom_call("cudaamd.nvvm.read.ptx.sreg.ntid.x")},
        {Intrinsic::nvvm_read_ptx_sreg_ntid_y,
         custom_call("cudaamd.nvvm.read.ptx.sreg.ntid.y")},
        {Intrinsic::nvvm_read_ptx_sreg_ntid_z,
         custom_call("cudaamd.nvvm.read.ptx.sreg.ntid.z")},
        {Intrinsic::nvvm_read_ptx_sreg_nctaid_x,
         custom_call("cudaamd.nvvm.read.ptx.sreg.nctaid.x")},
        {Intrinsic::nvvm_read_ptx_sreg_nctaid_y,
         custom_call("cudaamd.nvvm.read.ptx.sreg.nctaid.y")},
        {Intrinsic::nvvm_read_ptx_sreg_nctaid_z,
         custom_call("cudaamd.nvvm.read.ptx.sreg.nctaid.z")},
        {Intrinsic::nvvm_barrier0, replace_barrier}};
    auto &M = *F.getParent();

    printf("Called replace_intrinsics on %s\n", F.getName().bytes_begin());

    op_context opCtx = {{}, M};

    for (auto &BB : F) {
        for (auto &I : BB) {
            if (auto *call = dyn_cast<IntrinsicInst>(&I)) {
                if (call->getCalledFunction()->getName() == "__nvvm_reflect") {
                }

                if (auto oldIntrinsicId = call->getIntrinsicID()) {
                    auto replacer = knownIntrinsics.find(oldIntrinsicId);
                    if (replacer != knownIntrinsics.end()) {
                        printf("Found new intrinsics to replace...\n");
                        replacer->second(opCtx, *call);
                    }
                }
            }
        }
    }

    for (auto &inst : opCtx.insts_to_remove) {
        inst->eraseFromParent();
    }

    return true;
}

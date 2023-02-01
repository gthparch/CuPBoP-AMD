#include <iostream>
#include <memory>
#include <queue>
#include <set>

#include "llvm/IR/CallingConv.h"
#include "llvm/IR/IRBuilder.h"
#include "llvm/IR/Instructions.h"
#include "llvm/IR/IntrinsicInst.h"
#include "llvm/IR/Intrinsics.h"
#include "llvm/IR/IntrinsicsAMDGPU.h"
#include "llvm/IR/IntrinsicsNVPTX.h"
#include "llvm/IR/Module.h"

#include "llvm/IR/Function.h"
#include "llvm/Pass.h"
#include "llvm/Support/raw_ostream.h"

#include "llvm/CodeGen/GlobalISel/IRTranslator.h"
#include "llvm/CodeGen/GlobalISel/InstructionSelect.h"
#include "llvm/CodeGen/GlobalISel/Legalizer.h"
#include "llvm/CodeGen/GlobalISel/RegBankSelect.h"
#include "llvm/CodeGen/Passes.h"
#include "llvm/CodeGen/TargetPassConfig.h"
#include "llvm/IR/Attributes.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/LegacyPassManager.h"
#include "llvm/Pass.h"
#include "llvm/PassInfo.h"
#include "llvm/Support/CommandLine.h"
#include "llvm/Support/Compiler.h"
#include "llvm/Target/TargetLoweringObjectFile.h"
#include "llvm/Transforms/IPO.h"
#include "llvm/Transforms/IPO/AlwaysInliner.h"
#include "llvm/Transforms/IPO/PassManagerBuilder.h"
#include "llvm/Transforms/Scalar.h"
#include "llvm/Transforms/Scalar/GVN.h"
#include "llvm/Transforms/Vectorize.h"

#include "llvm/ADT/SmallVector.h"
#include "llvm/ADT/Statistic.h"
#include "llvm/Analysis/LoopInfo.h"
#include "llvm/Analysis/LoopPass.h"
#include "llvm/Analysis/PostDominators.h"
#include "llvm/IR/DataLayout.h"
#include "llvm/IR/DerivedTypes.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/GlobalValue.h"
#include "llvm/IR/IRBuilder.h"
#include "llvm/IR/InlineAsm.h"
#include "llvm/IR/Instructions.h"
#include "llvm/IR/LLVMContext.h"
#include "llvm/IR/LegacyPassManager.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/Value.h"
#include "llvm/IR/ValueSymbolTable.h"
#include "llvm/InitializePasses.h"
#include "llvm/PassInfo.h"
#include "llvm/PassRegistry.h"
#include "llvm/Support/CommandLine.h"
#include "llvm/Transforms/IPO/PassManagerBuilder.h"
#include "llvm/Transforms/Utils/BasicBlockUtils.h"
#include "llvm/Transforms/Utils/Cloning.h"
#include "llvm/Transforms/Utils/ValueMapper.h"

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
    };
    auto &M = *F.getParent();

    printf("Called replace_intrinsics on %s\n", F.getName().bytes_begin());

    op_context opCtx = {{}, M};

    for (auto &BB : F) {
        for (auto &I : BB) {
            if (auto *call = dyn_cast<IntrinsicInst>(&I)) {
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

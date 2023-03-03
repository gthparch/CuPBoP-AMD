/**
 *  Add a Pass Manager for Address Space Casting
 *
 */

#include <iostream>
#include <memory>
#include <queue>
#include <set>

#include "llvm/ADT/SmallVector.h"
#include "llvm/ADT/Statistic.h"
#include "llvm/Analysis/LoopInfo.h"
#include "llvm/Analysis/LoopPass.h"
#include "llvm/Analysis/PostDominators.h"
#include "llvm/CodeGen/GlobalISel/IRTranslator.h"
#include "llvm/CodeGen/GlobalISel/InstructionSelect.h"
#include "llvm/CodeGen/GlobalISel/Legalizer.h"
#include "llvm/CodeGen/GlobalISel/RegBankSelect.h"
#include "llvm/CodeGen/Passes.h"
#include "llvm/CodeGen/TargetPassConfig.h"
#include "llvm/IR/Attributes.h"
#include "llvm/IR/CallingConv.h"
#include "llvm/IR/DataLayout.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/GlobalValue.h"
#include "llvm/IR/IRBuilder.h"
#include "llvm/IR/InlineAsm.h"
#include "llvm/IR/InstIterator.h"
#include "llvm/IR/Instructions.h"
#include "llvm/IR/IntrinsicInst.h"
#include "llvm/IR/Intrinsics.h"
#include "llvm/IR/IntrinsicsAMDGPU.h"
#include "llvm/IR/IntrinsicsNVPTX.h"
#include "llvm/IR/LLVMContext.h"
#include "llvm/IR/LegacyPassManager.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/Value.h"
#include "llvm/IR/ValueSymbolTable.h"
#include "llvm/InitializePasses.h"
#include "llvm/Pass.h"
#include "llvm/PassInfo.h"
#include "llvm/PassRegistry.h"
#include "llvm/Support/CommandLine.h"
#include "llvm/Support/Compiler.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/Target/TargetLoweringObjectFile.h"
#include "llvm/Transforms/IPO.h"
#include "llvm/Transforms/IPO/AlwaysInliner.h"
#include "llvm/Transforms/IPO/PassManagerBuilder.h"
#include "llvm/Transforms/Scalar.h"
#include "llvm/Transforms/Scalar/GVN.h"
#include "llvm/Transforms/Utils/BasicBlockUtils.h"
#include "llvm/Transforms/Utils/Cloning.h"
#include "llvm/Transforms/Utils/ValueMapper.h"
#include "llvm/Transforms/Vectorize.h"

#include "AddressSpaceCastPass.hpp"

using namespace llvm;
using namespace cupbop::amd::passes;

// Helper functions in anonymous namespace
namespace {
/// Replace alloca instruction with alloca in private space, then cast to flat
/// space.
static void processPointerAlloca(IRBuilder<> &builder,
                                 const DataLayout &dataLayout,
                                 AllocaInst *allocaInst) {
    // Do nothing if already allocated in alloca address space
    if (allocaInst->getAddressSpace() == dataLayout.getAllocaAddrSpace()) {
        return;
    }

    builder.SetInsertPoint(allocaInst);
    auto *allocatedTy = allocaInst->getAllocatedType();
    auto *replacementAllocaInst =
        builder.CreateAlloca(allocatedTy, dataLayout.getAllocaAddrSpace(),
                             allocaInst->getArraySize(), allocaInst->getName());
    replacementAllocaInst->setAlignment(allocaInst->getAlign());
    auto *addrSpaceCastInst = builder.CreateAddrSpaceCast(
        replacementAllocaInst, allocaInst->getType());
    allocaInst->replaceAllUsesWith(addrSpaceCastInst);
}

/// Fix store instructions that attempts to write to any address space other
/// than the flat address space.
///
/// Change:
///  %2 = alloca ptr, align 8
/// To:
///  %2 = alloca ptr, align 8, addrspace(5)
///  %4 = addrspacecast ptr addrspace(5) %2 to ptr
/// Then replace uses of 2 with 4
static void processPointerStore(IRBuilder<> &builder,
                                const DataLayout &dataLayout,
                                StoreInst *storeInst) {
    // Obtain pointer type
    auto *valueOp = storeInst->getValueOperand();
    auto *valueOpTy = valueOp->getType();

    // TODO: Figure out if its necessary to cast storing from other address spaces to flat
    if (auto valueOpPtrTy = dyn_cast<PointerType>(valueOpTy);
        valueOpPtrTy && valueOpPtrTy->getAddressSpace() ==
                            dataLayout.getDefaultGlobalsAddressSpace()) {
        // Cast to plain address space
        auto *castToTy = PointerType::getWithSamePointeeType(valueOpPtrTy, 0);
        builder.SetInsertPoint(storeInst);
        auto *castedPtr = builder.CreateAddrSpaceCast(valueOp, castToTy);
        storeInst->setOperand(0, castedPtr);
    }
}
}; // namespace

AddressSpaceCastPass::AddressSpaceCastPass() : FunctionPass(ID) {}

bool AddressSpaceCastPass::runOnFunction(Function &F) {
    auto &M = *F.getParent();
    auto &dataLayout = M.getDataLayout();
    std::vector<Instruction *> instsToRemove;
    IRBuilder<> Builder(M.getContext());

    for (auto &inst : instructions(F)) {
        // Allocations of pointer types - needs to be in private address space
        if (auto *allocaInst = dyn_cast<AllocaInst>(&inst);
            allocaInst && allocaInst->getType()->isPointerTy()) {
            processPointerAlloca(Builder, dataLayout, allocaInst);
            instsToRemove.push_back(allocaInst);
        }

        // Storage into pointer types need to be double checked
        if (auto *storeInst = dyn_cast<StoreInst>(&inst); storeInst) {
            processPointerStore(Builder, dataLayout, storeInst);
        }
    }

    for (auto f : instsToRemove) {
        f->dropAllReferences();
        f->eraseFromParent();
    }

    return true;
}

char AddressSpaceCastPass::ID = 0;

namespace {
static RegisterPass<AddressSpaceCastPass>
    address_space_cast("address-space-cast", "Address Space Cast AMD");
}

/**
 *  Add a Pass Manager for Address Space Casting
 *
 */

#include <cstdio>
#include <iostream>
#include <memory>
#include <queue>
#include <set>

#include "llvm/IR/DataLayout.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/GlobalValue.h"
#include "llvm/IR/IRBuilder.h"
#include "llvm/IR/InstIterator.h"
#include "llvm/IR/Instructions.h"
#include "llvm/IR/LLVMContext.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/Value.h"
#include "llvm/Pass.h"
#include "llvm/Support/raw_ostream.h"

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

    // TODO: Figure out if its necessary to cast storing from other address
    // spaces to flat
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

/// Fix getelementptr instructions that uses potentially unsafe addresses
///
/// Change:
///  %2 = getelementptr inbounds ptr, ptr addrspace(1) %0, i64 0
/// To:
///  %2 = addrspacecast ptr addrspace(1) %0 to ptr
///  %3 = getelementptr inbounds ptr, ptr %2, i64 0
/// Then replace uses of 2 with 3
static void processGEP(IRBuilder<> &builder, const DataLayout &dataLayout,
                       GetElementPtrInst *gepInst) {
    auto gepPtrTy = cast<PointerType>(gepInst->getPointerOperandType());
    auto gepPtrAS = gepInst->getPointerAddressSpace();
    auto gepSrcTy = gepInst->getSourceElementType();
    auto gepResTy = gepInst->getResultElementType();

    std::string inst_str;
    raw_string_ostream(inst_str) << *gepInst;

    if (gepPtrAS != 0 && gepSrcTy->isStructTy()) {
        builder.SetInsertPoint(gepInst);
        auto castToTy = PointerType::getWithSamePointeeType(gepPtrTy, 0);
        auto *castedPtr = cast<AddrSpaceCastInst>(builder.CreateAddrSpaceCast(
            gepInst->getPointerOperand(), gepInst->getType()));
        castedPtr->setDebugLoc(DebugLoc());
        gepInst->setOperand(0, castedPtr);

        std::string changed_inst_str;
        raw_string_ostream(changed_inst_str) << *castedPtr << "\n" << *gepInst;
        printf("Changed GEP instruction from:\n>>> %s\nto:\n<<< %s\n", inst_str.c_str(), changed_inst_str.c_str());
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

        // GetElementPtr instructions need to be double checked
        if (auto *gepInst = dyn_cast<GetElementPtrInst>(&inst); gepInst) {
            processGEP(Builder, dataLayout, gepInst);
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

#include <iostream>
#include <memory>

#include "llvm/IR/IRBuilder.h"
#include "llvm/IR/InlineAsm.h"
#include "llvm/IR/InstIterator.h"
#include "llvm/IR/Instructions.h"
#include "llvm/IR/Intrinsics.h"

#include "DeviceTrapPass.hpp"

using namespace llvm;
using namespace cupbop::amd::passes;

namespace {
static RegisterPass<DeviceTrapPass> device_trap_pass(
    "device-trap",
    "Convert CUDA trap instructions to LLVM trap intrinsic references");
}; // namespace

char DeviceTrapPass::ID = 0;

DeviceTrapPass::DeviceTrapPass() : FunctionPass(ID) {}

bool DeviceTrapPass::runOnFunction(Function &F) {
    Module &M = *F.getParent();
    LLVMContext &C = M.getContext();
    IRBuilder<> builder(C);
    std::vector<Instruction *> toEraseInsts{};

    for (auto &inst : instructions(F)) {
        if (auto *callInst = dyn_cast<CallInst>(&inst);
            callInst && callInst->isInlineAsm()) {
            if (handleInlineAsmCall(F, builder, callInst)) {
                toEraseInsts.push_back(callInst);
            }
        }
    }

    for (auto *erasingInst : toEraseInsts) {
        erasingInst->dropAllReferences();
        erasingInst->eraseFromParent();
    }

    return true;
}

bool DeviceTrapPass::handleInlineAsmCall(Function &F, IRBuilder<> &builder,
                                         CallInst *callInst) {
    auto *calledOperand = cast<InlineAsm>(callInst->getCalledOperand());
    auto asmString = calledOperand->getAsmString();

    if (asmString == "trap;") {
        auto *callTy =
            Intrinsic::getType(builder.getContext(), Intrinsic::trap);
        std::vector<Type *> argsTy{};
        std::vector<Value *> args{};
        builder.SetInsertPoint(callInst);
        auto replacement =
            builder.CreateIntrinsic(Intrinsic::trap, argsTy, args);
        callInst->replaceAllUsesWith(replacement);
        return true;
    }

    return false;
}

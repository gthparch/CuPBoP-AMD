#include <iostream>
#include <memory>
#include <queue>
#include <set>
#include <utility>
#include <vector>

#include "llvm/Analysis/ValueTracking.h"
#include "llvm/IR/Constants.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/GlobalValue.h"
#include "llvm/IR/IRBuilder.h"
#include "llvm/IR/Instructions.h"
#include "llvm/IR/LLVMContext.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/Value.h"
#include "llvm/Pass.h"
#include "llvm/Transforms/Utils/AMDGPUEmitPrintf.h"

#include "TransformVPrintfPass.hpp"
#include "utils.hpp"

using namespace llvm;
using namespace cupbop::amd::passes;

namespace {
static RegisterPass<TransformVPrintfPass>
    grid_block_convert_pass("transform-cuda-vprintf",
                            "Convert Block and Grid Dimensions AMD");

/// Backtrace arguments from the vprintf call instruction
static std::vector<Value *>
traceArguments(Module *M, Function *F, CallInst *vprintfCallInst,
               std::vector<Instruction *> &instsToRemove) {
    std::vector<Value *> tracedArgs;
    auto vprintfFormatString = vprintfCallInst->arg_begin()->get();
    auto packedArgumentStruct = (vprintfCallInst->arg_begin() + 1)->get();

    // Stop if no format string was found
    if (!vprintfFormatString) {
        return tracedArgs;
    }

    // Push format string
    tracedArgs.push_back(vprintfFormatString);

    auto *backtraceInst = vprintfCallInst->getPrevNonDebugInstruction();
    while (backtraceInst != nullptr && isa<StoreInst>(backtraceInst)) {
        auto *backtraceStoreInst = cast<StoreInst>(backtraceInst);
        auto *backtraceGepInst = dyn_cast<GetElementPtrInst>(
            backtraceInst->getPrevNonDebugInstruction());
        auto *backtraceArgValue = backtraceStoreInst->getValueOperand();
        backtraceInst = nullptr; // Stop at an invalid position

        if (backtraceArgValue && backtraceGepInst &&
            backtraceGepInst->getPointerOperand() == packedArgumentStruct) {
            auto argPosValue =
                dyn_cast<ConstantInt>((backtraceGepInst->idx_end() - 1)->get());
            if (argPosValue && argPosValue->getBitWidth() == 32) {
                auto argPos = argPosValue->getSExtValue();
                printf("Found argument %ld of type %s\n", argPos,
                       type_to_string(*backtraceArgValue->getType()).c_str());

                if (tracedArgs.size() <= (argPos + 1)) {
                    tracedArgs.resize(argPos + 2, nullptr);
                }

                tracedArgs[argPos + 1] = backtraceArgValue;
                instsToRemove.push_back(backtraceStoreInst);
                instsToRemove.push_back(backtraceGepInst);

                // Continue looking for more arguments
                backtraceInst = backtraceGepInst->getPrevNonDebugInstruction();
            }
        }
    }

    return tracedArgs;
}
}; // namespace

char TransformVPrintfPass::ID = 0;

TransformVPrintfPass::TransformVPrintfPass() : FunctionPass(ID) {}

bool TransformVPrintfPass::runOnFunction(Function &F) {
    printf("Running vprintf pass on function %s\n", F.getName().bytes_begin());
    Module *M = F.getParent();
    IRBuilder<> Builder(M->getContext());
    std::vector<Instruction *> instsToRemove;
    std::vector<std::pair<CallInst *, BasicBlock *>> identifiedVprintfCalls;

    for (auto &bb : F) {
        for (auto &instruction : bb) {
            if (CallInst *callInst = dyn_cast<CallInst>(&instruction)) {
                auto calledFn = callInst->getCalledFunction();
                if (!calledFn)
                    continue;
                auto calledFunctionName = calledFn->getName();
                printf("Called function: %s\n",
                       calledFunctionName.bytes_begin());
                if (calledFunctionName == "vprintf") {
                    identifiedVprintfCalls.push_back(
                        std::make_pair(callInst, &bb));
                }
            }
        }
    }

    for (auto vptCallInfo : identifiedVprintfCalls) {
        auto *callInst = vptCallInfo.first;
        auto *bb = vptCallInfo.second;
        auto tracedArgs = traceArguments(M, &F, callInst, instsToRemove);
        ArrayRef<Value *> assembledArgs(tracedArgs);
        StringRef formatString;
        getConstantStringInfo(tracedArgs[0], formatString);

        if (!formatString.empty()) {
            printf("Identified vprintf call in function %s with format "
                   "string: "
                   "\"%s\"\n",
                   F.getName().bytes_begin(), formatString.bytes_begin());
            printf("Emitting AMDGPU printf call...\n");
            Builder.SetInsertPoint(callInst->getNextNode());
            auto emittedPrintf = emitAMDGPUPrintfCall(Builder, assembledArgs);
            printf("Replacing original call...\n");
            callInst->replaceAllUsesWith(emittedPrintf);
            instsToRemove.push_back(callInst);
        }
    }

    for (auto *inst : instsToRemove) {
        inst->eraseFromParent();
    }

    return true;
}

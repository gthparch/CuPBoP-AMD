/**
 *  Add a Pass Manager for Grid and Block Conversion
 *
 */

#include <iostream>

#include "llvm/IR/Constants.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/Instructions.h"
#include "llvm/IR/IRBuilder.h"
#include "llvm/IR/IntrinsicInst.h"
#include "llvm/IR/Intrinsics.h"
#include "llvm/IR/IntrinsicsAMDGPU.h"
#include "llvm/IR/IntrinsicsNVPTX.h"
#include "llvm/IR/CallingConv.h"

#include "llvm/Pass.h"
#include "llvm/IR/Function.h"
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
#include "llvm/IR/Function.h"
#include "llvm/IR/GlobalValue.h"
#include "llvm/IR/IRBuilder.h"
#include "llvm/IR/InlineAsm.h"
#include "llvm/IR/Instructions.h"
#include "llvm/IR/LLVMContext.h"
#include "llvm/IR/LegacyPassManager.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/ValueSymbolTable.h"
#include "llvm/IR/Value.h"
#include "llvm/IR/DerivedTypes.h"
#include "llvm/InitializePasses.h"
#include "llvm/PassInfo.h"
#include "llvm/PassRegistry.h"
#include "llvm/Support/CommandLine.h"
#include "llvm/Transforms/IPO/PassManagerBuilder.h"
#include "llvm/Transforms/Utils/BasicBlockUtils.h"
#include "llvm/Transforms/Utils/Cloning.h"
#include "llvm/Transforms/Utils/ValueMapper.h"
#include "llvm/Transforms/Utils/AMDGPUEmitPrintf.h"
#include "llvm/Analysis/ValueTracking.h"

#include <iostream>
#include <queue>
#include <memory>
#include <set>
#include <utility>
#include <vector>

#include "cupbop_amd.hpp"
#include "transform_vprintf.hpp"
#include "utils.hpp"

using namespace llvm;

class TransformVPrintfPass : public llvm::FunctionPass
{

public:
  static char ID;

  TransformVPrintfPass() : FunctionPass(ID) {}

  std::vector<Value*> traceArguments(Module *M, Function *F, CallInst *vprintfCallInst, std::vector<Instruction*>& instsToRemove) {
    std::vector<Value*> tracedArgs;
    auto vprintfFormatString = vprintfCallInst->arg_begin()->get();
    auto packedArgumentStruct = (vprintfCallInst->arg_begin() + 1)->get();

    if (!vprintfFormatString) {
      // Return empty args
      return tracedArgs;
    }

    // Push format string
    tracedArgs.push_back(vprintfFormatString);
    
    auto* backtraceInst = vprintfCallInst->getPrevNonDebugInstruction();
    while (backtraceInst != nullptr && isa<StoreInst>(backtraceInst)) {
      auto* backtraceStoreInst = cast<StoreInst>(backtraceInst);
      auto* backtraceGepInst = dyn_cast<GetElementPtrInst>(backtraceInst->getPrevNonDebugInstruction());
      auto* backtraceArgValue = backtraceStoreInst->getValueOperand();
      backtraceInst = nullptr; // Stop at an invalid position

      if (backtraceArgValue && backtraceGepInst && backtraceGepInst->getPointerOperand() == packedArgumentStruct) {
        auto argPosValue = dyn_cast<ConstantInt>((backtraceGepInst->idx_end() - 1)->get());
        if (argPosValue && argPosValue->getBitWidth() == 32) {
          auto argPos = argPosValue->getSExtValue();
          printf("Found argument %ld of type %s\n", argPos, type_to_string(*backtraceArgValue->getType()).c_str());
          
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

  virtual bool runOnFunction(Function &F)
  {
    Module *M = F.getParent();
    IRBuilder<> Builder (M->getContext());
    std::vector<Instruction*> instsToRemove;
    std::vector<std::pair<CallInst*, BasicBlock*>> identifiedVprintfCalls;

    for (auto& bb : F) {
      for (auto& instruction : bb) {
        if (CallInst* callInst = dyn_cast<CallInst>(&instruction)) {
          auto calledFunctionName = callInst->getCalledFunction()->getName();
          if (calledFunctionName == "vprintf") {
            identifiedVprintfCalls.push_back(std::make_pair(callInst, &bb));
          }
        }
      }
    }

    for (auto vptCallInfo : identifiedVprintfCalls) {
      auto* callInst = vptCallInfo.first;
      auto* bb = vptCallInfo.second;
      auto tracedArgs = traceArguments(M, &F, callInst, instsToRemove);
      ArrayRef<Value*> assembledArgs (tracedArgs);
      StringRef formatString;
      getConstantStringInfo(tracedArgs[0], formatString);

      if (!formatString.empty()) {
        printf("Identified vprintf call in function %s with format string: \"%s\"\n", F.getName().bytes_begin(), formatString.bytes_begin());
        printf("Emitting AMDGPU printf call...\n");
        Builder.SetInsertPoint(callInst->getNextNode());
        auto emittedPrintf = emitAMDGPUPrintfCall(Builder, assembledArgs);
        printf("Replacing original call...\n");
        callInst->replaceAllUsesWith(emittedPrintf);
        instsToRemove.push_back(callInst);
      }
    }

    for (auto* inst : instsToRemove) {
      inst->eraseFromParent();
    }

    return true;
  }
};

char TransformVPrintfPass::ID = 0;

namespace
{

  static RegisterPass<TransformVPrintfPass>
      grid_block_convert_pass("transform-cuda-vprintf",
                              "Convert Block and Grid Dimensions AMD");
}

void transform_vprintf_pass(Module &M)
{
  ModulePassManager MPM;
  ModuleAnalysisManager MAM;

  FunctionPassManager FPM;
  llvm::legacy::PassManager passManager;
  llvm::PassManagerBuilder passManagerBuilder;
  auto Registry = PassRegistry::getPassRegistry();

  std::vector<std::string> passes;
  passes.push_back("transform-cuda-vprintf");
  for (auto pass : passes)
  {
    const PassInfo *PIs = Registry->getPassInfo(StringRef(pass));
    if (PIs)
    {
      Pass *thispass = PIs->createPass();
      passManager.add(thispass);
    }
    else
    {
      assert(0 && "Pass not found\n");
    }
  }
  passManager.run(M);
}

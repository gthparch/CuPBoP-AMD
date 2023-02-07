/**
 * Replace all uses of Nvidia atomics
*/

#include <iostream>
#include <memory>
#include <queue>
#include <set>
#include <utility>
#include <vector>

#include "llvm/IR/CallingConv.h"
#include "llvm/IR/Constants.h"
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
#include "llvm/Analysis/ValueTracking.h"
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
#include "llvm/Transforms/Utils/AMDGPUEmitPrintf.h"
#include "llvm/Transforms/Utils/BasicBlockUtils.h"
#include "llvm/Transforms/Utils/Cloning.h"
#include "llvm/Transforms/Utils/ValueMapper.h"

#include "llvm/IR/Module.h"
#include "ChangeAtomics.hpp"
#include "utils.hpp"

using namespace llvm;


void changeAtomics(Module &M) {

  std::cout << "Change Atomics" << std::endl;

 // https://discourse.llvm.org/t/function-call-replacement/41493/7
  llvm::Type *I32 = llvm::Type::getInt32Ty(M.getContext());
  llvm::Type *I32Ptr = llvm::Type::getInt32PtrTy(M.getContext());

  std::vector<Type *> Params;
  Params.push_back(I32Ptr);
  Params.push_back(I32);
  llvm::FunctionType *atomicFnType = FunctionType::get(I32,
          Params, false);
  FunctionCallee fc2 =
            M.getOrInsertFunction("_Z9atomicAddPjj", atomicFnType);
  Function *atomicFn = dyn_cast<Function>(fc2.getCallee());
            
  
  for (Module::iterator i = M.begin(), e = M.end(); i != e; ++i) {
    Function *F = &(*i);
      
    if (!is_cuda_kernel(*F))
      continue;
    
    std::cout << F->getName().str() << std::endl;
    Function::iterator I = F->begin();
    for (Function::iterator E = F->end(); I != E; ++I) {
      for (BasicBlock::iterator BI = I->begin(); BI != I->end(); BI++) {
        if (auto *nvvm_atomic = dyn_cast<CallInst>(BI)) {
          auto func_name = nvvm_atomic->getCalledFunction()->getName();

          // atomicAdd i32
          if (func_name == "_ZL9atomicAddPjj") {
              nvvm_atomic->setCalledFunction(fc2);
          }
        }
      }
    }
  }
  
}
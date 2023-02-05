/**
 * Replace all uses of Nvidia __synthreads()
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
#include "Syncthreads.hpp"
#include "utils.hpp"

using namespace llvm;


void syncthreads(Module &M) {


 

 

  

  if (Function * nvvmBarrier = M.getFunction("llvm.nvvm.barrier0")) {
    //  nvvmBarrier->removeFnAttr(StringRef("convergent nocallback nounwind"));
    llvm::FunctionType *LaunchFun2 = FunctionType::get(Type::getVoidTy(M.getContext()), NULL);

    FunctionCallee fc2 =
        M.getOrInsertFunction("_Z13__syncthreadsv", LaunchFun2);

    Function *sync = dyn_cast<Function>(fc2.getCallee());
    nvvmBarrier->replaceAllUsesWith(sync);
  //   WorkGroup2->setLinkage(GlobalValue::WeakODRLinkage);
  //   WorkGroup2->setVisibility(GlobalValue::HiddenVisibility);
  //   Comdat *co = M.getOrInsertComdat("_Z13__syncthreadsv");
  //   co->setSelectionKind(Comdat::SelectionKind::Any);
  //   WorkGroup2->setComdat(co);
    // llvm::Value * valBarrier = dyn_cast<Value>(nvvmBarrier);
    // valBarrier->setName("_Z13__syncthreadsv");
    // llvm::AttributeList alist = nvvmBarrier->getAttributes();
   
  }
  
  // Comdat *co = M.getOrInsertComdat("_Z13__syncthreadsv");
  // co->setSelectionKind(Comdat::SelectionKind::Any);
  // nvvmBarrier->setComdat(co);




}
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

  llvm::Type *I32 = llvm::Type::getInt32Ty(M.getContext());
  llvm::Type *I32Ptr = llvm::Type::getInt32PtrTy(M.getContext());

  llvm::Type *I64 = llvm::Type::getInt64Ty(M.getContext());
  llvm::Type *I64Ptr = llvm::Type::getInt64PtrTy(M.getContext());

  llvm::Type *Float = llvm::Type::getFloatTy(M.getContext());
  llvm::Type *FloatPtr = llvm::Type::getFloatPtrTy(M.getContext());

  std::vector<Type *> FloatParams;
  FloatParams.push_back(FloatPtr);
  FloatParams.push_back(Float);
  llvm::FunctionType *atomicFnTypeFloat = FunctionType::get(Float,
          FloatParams, false);

  std::vector<Type *> I64Params;
  I64Params.push_back(I64Ptr);
  I64Params.push_back(I64);
  llvm::FunctionType *atomicFnTypeI64 = FunctionType::get(I64,
          I64Params, false);

  std::vector<Type *> I32Params;
  I32Params.push_back(I32Ptr);
  I32Params.push_back(I32);
  llvm::FunctionType *atomicFnTypeI32 = FunctionType::get(I32,
          I32Params, false);


  FunctionCallee atomicAddjj =
            M.getOrInsertFunction("_Z9atomicAddPjj", atomicFnTypeI32);
  Function *atomicFnAddjj = dyn_cast<Function>(atomicAddjj.getCallee());


  FunctionCallee atomicAddii =
            M.getOrInsertFunction("_Z9atomicAddPii", atomicFnTypeI32);
  Function *atomicFnAddii = dyn_cast<Function>(atomicAddii.getCallee());
            
  FunctionCallee atomicAddyy =
            M.getOrInsertFunction("_Z9atomicAddPyy", atomicFnTypeI64);
  Function *atomicFnAddyy = dyn_cast<Function>(atomicAddyy.getCallee());
            
  FunctionCallee atomicAddff =
            M.getOrInsertFunction("_Z9atomicAddPff", atomicFnTypeFloat);
  Function *atomicFnAddff = dyn_cast<Function>(atomicAddff.getCallee());


  FunctionCallee atomicOrii =
            M.getOrInsertFunction("_Z8atomicOrPii", atomicFnTypeI32);
  Function *atomicFnOrii = dyn_cast<Function>(atomicOrii.getCallee());

  FunctionCallee atomicOrjj =
            M.getOrInsertFunction("_Z8atomicOrPjj", atomicFnTypeI32);
  Function *atomicFnOrjj = dyn_cast<Function>(atomicOrii.getCallee());
            
  FunctionCallee atomicOryy =
            M.getOrInsertFunction("_Z8atomicOrPyy", atomicFnTypeI64);
  Function *atomicFnOryy = dyn_cast<Function>(atomicOryy.getCallee());
        

  FunctionCallee atomicAndPii =
            M.getOrInsertFunction("_Z9atomicAndPii", atomicFnTypeI32);
  Function *atomicFnAndii = dyn_cast<Function>(atomicAndPii.getCallee());

  FunctionCallee atomicAndPjj =
            M.getOrInsertFunction("_Z9atomicAndPjj", atomicFnTypeI32);
  Function *atomicFnAndjj = dyn_cast<Function>(atomicAndPjj.getCallee());
            
  FunctionCallee atomicAndPyy =
            M.getOrInsertFunction("_Z9atomicAndPyy", atomicFnTypeI64);
  Function *atomicFnAndyy = dyn_cast<Function>(atomicAndPyy.getCallee());

  


  FunctionCallee atomicExchPii =
            M.getOrInsertFunction("_Z10atomicExchPii", atomicFnTypeI32);
  Function *atomicFnExchPii = dyn_cast<Function>(atomicExchPii.getCallee());


  FunctionCallee atomicExchPjj =
            M.getOrInsertFunction("_Z10atomicExchPjj", atomicFnTypeI32);
  Function *atomicFnExchPjj = dyn_cast<Function>(atomicExchPjj.getCallee());
            
  FunctionCallee atomicExchPyy =
            M.getOrInsertFunction("_Z10atomicExchPyy", atomicFnTypeI64);
  Function *atomicFnExchPyy= dyn_cast<Function>(atomicExchPyy.getCallee());
            
  FunctionCallee atomicExchPff =
            M.getOrInsertFunction("_Z10atomicExchPff", atomicFnTypeFloat);
  Function *atomicFnExchPff = dyn_cast<Function>(atomicExchPff.getCallee());
  
  
  FunctionCallee atomicDecPjj =
            M.getOrInsertFunction("_Z9atomicDecPjj", atomicFnTypeI32);
  Function *atomicFnDecPjj = dyn_cast<Function>(atomicDecPjj.getCallee());

  FunctionCallee atomicIncPjj =
            M.getOrInsertFunction("_Z9atomicIncPjj", atomicFnTypeI32);
  Function *atomicFnIncPjj = dyn_cast<Function>(atomicIncPjj.getCallee());



  FunctionCallee atomicMaxPii =
            M.getOrInsertFunction("_Z9atomicMaxPii", atomicFnTypeI32);
  Function *atomicFnMaxPii = dyn_cast<Function>(atomicMaxPii.getCallee());

  FunctionCallee atomicMaxPjj =
            M.getOrInsertFunction("_Z9atomicMaxPjj", atomicFnTypeI32);
  Function *atomicFnMaxPjj = dyn_cast<Function>(atomicMaxPjj.getCallee());
            
  FunctionCallee atomicMaxPyy =
            M.getOrInsertFunction("_Z9atomicMaxPyy", atomicFnTypeI64);
  Function *atomicFnMaxPyy = dyn_cast<Function>(atomicMaxPyy.getCallee());
            
  
  FunctionCallee atomicMinPii =
            M.getOrInsertFunction("_Z9atomicMinPii", atomicFnTypeI32);
  Function *atomicFnMinPii = dyn_cast<Function>(atomicMinPii.getCallee());

  FunctionCallee atomicMinPjj =
            M.getOrInsertFunction("_Z9atomicMinPjj", atomicFnTypeI32);
  Function *atomicFnMinPjj= dyn_cast<Function>(atomicMinPjj.getCallee());
            
  FunctionCallee atomicMinPyy =
            M.getOrInsertFunction("_Z9atomicMinPyy", atomicFnTypeI64);
  Function *atomicFnMinPyy = dyn_cast<Function>(atomicMinPyy.getCallee());


  FunctionCallee atomicSubPii =
            M.getOrInsertFunction("_Z9atomicSubPii", atomicFnTypeI32);
  Function *atomicFnSubPii = dyn_cast<Function>(atomicSubPii.getCallee());

  FunctionCallee atomicSubPjj =
            M.getOrInsertFunction("_Z9atomicSubPjj", atomicFnTypeI32);
  Function *atomicFnSubPjj= dyn_cast<Function>(atomicSubPjj.getCallee());


  FunctionCallee atomicXorPii =
            M.getOrInsertFunction("_Z9atomicXorPii", atomicFnTypeI32);
  Function *atomicFnXorPii = dyn_cast<Function>(atomicXorPii.getCallee());

  FunctionCallee atomicXorPjj =
            M.getOrInsertFunction("_Z9atomicXorPjj", atomicFnTypeI32);
  Function *atomicFnXorPjj= dyn_cast<Function>(atomicXorPjj.getCallee());
            
  FunctionCallee atomicXorPyy =
            M.getOrInsertFunction("_Z9atomicXorPyy", atomicFnTypeI64);
  Function *atomicFnXorPyy = dyn_cast<Function>(atomicXorPyy.getCallee());
            

  
  std::vector<Type *> I64CasParams;
  I64CasParams.push_back(I64Ptr);
  I64CasParams.push_back(I64);
  I64CasParams.push_back(I64);

  llvm::FunctionType *atomicCASFnTypeI64 = FunctionType::get(I64,
          I64CasParams, false);

  std::vector<Type *> I32CasParams;
  I32CasParams.push_back(I32Ptr);
  I32CasParams.push_back(I32);
  I32CasParams.push_back(I32);

  llvm::FunctionType *atomicCASFnTypeI32 = FunctionType::get(I32,
          I32CasParams, false);


  FunctionCallee atomicCASPiii =
            M.getOrInsertFunction("_Z9atomicCASPiii", atomicCASFnTypeI32);
  Function *atomicFnCASPiii = dyn_cast<Function>(atomicCASPiii.getCallee());

  FunctionCallee atomicCASPjjj =
            M.getOrInsertFunction("_Z9atomicCASPjjj", atomicCASFnTypeI32);
  Function *atomicFnCASPjjj = dyn_cast<Function>(atomicCASPiii.getCallee());
            
  FunctionCallee atomicCASPyyy =
            M.getOrInsertFunction("_Z9atomicCASPyyy", atomicCASFnTypeI64);
  Function *atomicFnCASPyyy = dyn_cast<Function>(atomicCASPyyy.getCallee());

  std::set<Function*> need_remove;

  for (Module::iterator i = M.begin(), e = M.end(); i != e; ++i) {
    Function *F = &(*i);
      
    if (!is_cuda_kernel(*F))
      continue;
    
    std::cout << "Function: " << F->getName().str() << std::endl;
    Function::iterator I = F->begin();
    for (Function::iterator E = F->end(); I != E; ++I) {
      for (BasicBlock::iterator BI = I->begin(); BI != I->end(); BI++) {
        if (auto *nvvm_atomic = dyn_cast<CallInst>(BI)) {
          auto func_name = nvvm_atomic->getCalledFunction()->getName();

          // atomicAdd i32
          if (func_name == "_ZL9atomicAddPjj") {
              need_remove.insert(nvvm_atomic->getCalledFunction());

              nvvm_atomic->setCalledFunction(atomicFnAddjj);

          } else if (func_name == "_ZL9atomicAddPii") {
              need_remove.insert(nvvm_atomic->getCalledFunction());

              nvvm_atomic->setCalledFunction(atomicFnAddii);
          } else if (func_name == "_ZL9atomicAddPyy") {
              need_remove.insert(nvvm_atomic->getCalledFunction());

              nvvm_atomic->setCalledFunction(atomicFnAddyy);

          } else if (func_name == "_ZL9atomicAddPff") {
              need_remove.insert(nvvm_atomic->getCalledFunction());

              nvvm_atomic->setCalledFunction(atomicFnAddff);

          } else if (func_name == "_ZL8atomicOrPii") {
              need_remove.insert(nvvm_atomic->getCalledFunction());

              nvvm_atomic->setCalledFunction(atomicFnOrii);

          } else if (func_name == "_ZL8atomicOrPjj") {
              need_remove.insert(nvvm_atomic->getCalledFunction());

              nvvm_atomic->setCalledFunction(atomicFnOrjj);

          } else if (func_name == "_ZL8atomicOrPyy") {
              need_remove.insert(nvvm_atomic->getCalledFunction());

              nvvm_atomic->setCalledFunction(atomicFnOryy);

          } else if (func_name == "_ZL9atomicAndPii") {
              need_remove.insert(nvvm_atomic->getCalledFunction());

              nvvm_atomic->setCalledFunction(atomicFnAndii);

          } else if (func_name == "_ZL9atomicAndPjj") {
              need_remove.insert(nvvm_atomic->getCalledFunction());

              nvvm_atomic->setCalledFunction(atomicFnAndjj);

          } else if (func_name == "_ZL9atomicAndPyy") {
              need_remove.insert(nvvm_atomic->getCalledFunction());

              nvvm_atomic->setCalledFunction(atomicFnAndyy);

          } else if (func_name == "_ZL10atomicExchPii") {
              need_remove.insert(nvvm_atomic->getCalledFunction());

              nvvm_atomic->setCalledFunction(atomicFnExchPii);

          } else if (func_name == "_ZL10atomicExchPjj") {
              need_remove.insert(nvvm_atomic->getCalledFunction());

              nvvm_atomic->setCalledFunction(atomicFnExchPjj);

          } else if (func_name == "_ZL10atomicExchPyy") {
              need_remove.insert(nvvm_atomic->getCalledFunction());

              nvvm_atomic->setCalledFunction(atomicFnExchPyy);

          } else if (func_name == "_ZL10atomicExchPff") {
              need_remove.insert(nvvm_atomic->getCalledFunction());

              nvvm_atomic->setCalledFunction(atomicFnExchPff);

          } else if (func_name == "_ZL9atomicDecPjj") {
              need_remove.insert(nvvm_atomic->getCalledFunction());

              nvvm_atomic->setCalledFunction(atomicFnDecPjj);
          } else if (func_name == "_ZL9atomicIncPjj") {
              need_remove.insert(nvvm_atomic->getCalledFunction());

              nvvm_atomic->setCalledFunction(atomicFnIncPjj);

          } else if (func_name == "_ZL9atomicMaxPii") {
              need_remove.insert(nvvm_atomic->getCalledFunction());

              nvvm_atomic->setCalledFunction(atomicFnMaxPii);

          } else if (func_name == "_ZL9atomicMaxPjj") {
              need_remove.insert(nvvm_atomic->getCalledFunction());

              nvvm_atomic->setCalledFunction(atomicFnMaxPjj);

          } else if (func_name == "_ZL9atomicMaxPyy") {
              need_remove.insert(nvvm_atomic->getCalledFunction());

              nvvm_atomic->setCalledFunction(atomicFnMaxPyy);

          } else if (func_name == "_ZL9atomicMinPii") {
              need_remove.insert(nvvm_atomic->getCalledFunction());

              nvvm_atomic->setCalledFunction(atomicFnMinPii);
          }
          else if (func_name == "_ZL9atomicMinPjj") {
              need_remove.insert(nvvm_atomic->getCalledFunction());

              nvvm_atomic->setCalledFunction(atomicFnMinPjj);

          } else if (func_name == "_ZL9atomicMinPyy") {
              need_remove.insert(nvvm_atomic->getCalledFunction());

              nvvm_atomic->setCalledFunction(atomicFnMinPyy);

          } else if (func_name == "_ZL9atomicSubPii") {
              need_remove.insert(nvvm_atomic->getCalledFunction());

              nvvm_atomic->setCalledFunction(atomicFnSubPii);

          }  else if (func_name == "_ZL9atomicSubPjj") {
              need_remove.insert(nvvm_atomic->getCalledFunction());

              nvvm_atomic->setCalledFunction(atomicFnSubPjj);

          } else if (func_name == "_ZL9atomicXorPii") {
              need_remove.insert(nvvm_atomic->getCalledFunction());

              nvvm_atomic->setCalledFunction(atomicXorPii);

          } else if (func_name == "_ZL9atomicXorPjj") {
              need_remove.insert(nvvm_atomic->getCalledFunction());

              nvvm_atomic->setCalledFunction(atomicFnXorPjj);

          } else if (func_name == "_ZL9atomicXorPyy") {
              need_remove.insert(nvvm_atomic->getCalledFunction());

              nvvm_atomic->setCalledFunction(atomicFnXorPyy);

          } else if (func_name == "_ZL9atomicCASPiii") {
              need_remove.insert(nvvm_atomic->getCalledFunction());

              nvvm_atomic->setCalledFunction(atomicFnCASPiii);

          } else if (func_name == "_ZL9atomicCASPjjj") {
              need_remove.insert(nvvm_atomic->getCalledFunction());

              nvvm_atomic->setCalledFunction(atomicFnCASPjjj);

          } else if (func_name == "_ZL9atomicCASPyyy") {
              need_remove.insert(nvvm_atomic->getCalledFunction());

              nvvm_atomic->setCalledFunction(atomicFnCASPyyy);

          } 
        }
      }
    }
  }


  // remove Nvidia atomic functions 
  for(auto remove: need_remove) {
    remove->dropAllReferences();
    remove->eraseFromParent();
  }


  
}
/**
 * Replace Cuda Texture
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

void transformTexture(llvm::Module &M) {

  LLVMContext &context = M.getContext();

  /*
  CUDA: @tex = dso_local addrspace(1) externally_initialized global i64 undef, align 4
  (is texture)


  @tex = protected addrspace(1) externally_initialized global %struct.texture undef, align 8
  %struct.texture = type { %struct.textureReference }
  %struct.textureReference = type { i32, i32, i32, [3 x i32], %struct.hipChannelFormatDesc, i32, i32, i32, float, float, float, ptr, i32, i32 }
  %struct.hipChannelFormatDesc = type { i32, i32, i32, i32, i32 }

  */


  // Check all the global variables for texture reference:
  std::cout << "Running Texture Memory Process on Module " << std::endl;

  std::vector<llvm::GlobalVariable*> allTextureMemories = discover_texture_memory(M);
  printf(" %d ", allTextureMemories.size());
  if (allTextureMemories.size() > 0) {


  /* 
    Create 

    %struct.texture = type { %struct.textureReference }
    %struct.textureReference = type { i32, i32, i32, [3 x i32], %struct.hipChannelFormatDesc, i32, i32, i32, float, float, float, ptr, i32, i32 }
    %struct.hipChannelFormatDesc = type { i32, i32, i32, i32, i32 }
  */

  auto intType = IntegerType::get(context, 32); // 32 bits integer
  auto hipChannelFormatDesc = StructType::create(context, "struct.hipChannelFormatDesc"); // Create opaque type
  // auto myStructPtrType = PointerType::get(myStructType, 0); // Initialise the pointer type now
  hipChannelFormatDesc->setBody({intType, intType , intType, intType, intType}, /* packed */ false); // Set the body of the aggregate

  ArrayType* arrayType = ArrayType::get(intType, 3);
  auto floatType = Type::getFloatTy(context);
  auto intPtrType = Type::getInt32PtrTy(context);
  auto textureReference = StructType::create(context, "struct.textureReference");
  textureReference->setBody({intType, intType , intType, arrayType, hipChannelFormatDesc, intType, intType, intType, floatType, floatType, floatType, intPtrType, intType, intType}, /* packed */ false); 

  auto textureStruct = StructType::create(context, "struct.texture");
  textureStruct->setBody({textureReference}, false);


  for(GlobalVariable* global: allTextureMemories) {
    std::string new_name = "cupbop_" + global->getName().str(); 
    std::cout << global->getName().str() << std::endl;
    // Value* v = dyn_cast<Value>(global);

  // Global variable initializer type does not match global variable type!
  // ptr addrspace(1) @cupbob_tex
    auto undef = llvm::UndefValue::get(textureStruct);

    auto gv = new llvm::GlobalVariable(M, textureStruct , false, global->getLinkage(),
                            undef, new_name, NULL,
                            global->getThreadLocalMode(), global->getAddressSpace(), global->isExternallyInitialized());
    
  }

  // Go through the functions 
  // for each tex used in llvm.nvvm.texsurf.handle.internal.p1
  // need to alloc struct.texture in the first block of the function
  // then address space cast the alloc to from address space(5) to genetric ptr

  /*
    %20 = call i64 @llvm.nvvm.texsurf.handle.internal.p1(ptr addrspace(1) @tex)
    store i64 %20, ptr %8, align 4
    %27 = load i64, ptr %8, align 4
    %28 = call noundef i32 @_ZL5tex2DIiEN17__nv_tex_rmet_retIT_E4typeE7textureIS1_Li2EL19cudaTextureReadMode0EEff(i64 %27, float noundef %23, float noundef %26) #4
    store i32 %28, ptr %5, align 4
    %29 = load i32, ptr %5, align 4

    HIP:

    call void @llvm.memcpy.p0.p0.i64(ptr align 8 %16, ptr align 8 addrspacecast (ptr addrspace(1) @tex to ptr), i64 88, i1 false)
    %35 = getelementptr inbounds %struct.texture, ptr %16, i32 0, i32 0
    %36 = load %struct.textureReference, ptr %35, align 8
    %37 = call noundef i32 @_ZL5tex2DIiL18hipTextureReadMode0EEN13__hip_tex_retIT_XT0_EbE4typeE7textureIS2_Li2EXT0_EEff(%struct.textureReference %36, float noundef %31, float noundef %34) #24

  */

  /*



  */

  //
  // Change llvm.nvvm.texsurf.handle.internal.p1 to 
  llvm::IRBuilder<> Builder(M.getContext());
  const DataLayout &DL = M.getDataLayout();

  std::vector<Type *> I32Params;
  I32Params.push_back(I32Ptr);
  I32Params.push_back(I32);
  llvm::FunctionType *atomicFnTypeI32 = FunctionType::get(I32,
          I32Params, false);


  for (Module::iterator i = M.begin(), e = M.end(); i != e; ++i) {
    Function *F = &(*i);
      
    if (!is_cuda_kernel(*F))
      continue;
    
    std::cout << "Function: " << F->getName().str() << std::endl;
    Function::iterator I = F->begin();
    for (Function::iterator E = F->end(); I != E; ++I) {
      BasicBlock::iterator firstBB = E->getFirstInsertionPt();
      auto *first_instr = dyn_cast<Instruction>(firstBB);

      for (BasicBlock::iterator BI = I->begin(); BI != I->end(); BI++) {

         if (auto *nvvm_atomic = dyn_cast<CallInst>(BI)) {
          auto func_name = nvvm_atomic->getCalledFunction()->getName();

          if (func_name == "llvm.nvvm.texsurf.handle.internal.p1") {
            // get the uses of the current instruction return
            Builder.SetInsertPoint(first_instr);     
            AllocaInst *newTextureStruct = Builder.CreateAlloca(textureStruct, DL.getAllocaAddrSpace() , 0, "");
            auto *newtex = Builder.CreateAddrSpaceCast(newTextureStruct, intPtrType); // int32ptr or int64ptr

           // next instruction is store evolving this operand 
           // store i64 %20, ptr %8, align 4

           // call void @llvm.memcpy.p0.p0.i64(ptr align 8 %16, ptr align 8 addrspacecast (ptr addrspace(1) @tex to ptr), i64 88, i1 false)




          } else if (func_name = "_ZL5tex2DIiEN17__nv_tex_rmet_retIT_E4typeE7textureIS1_Li2EL19cudaTextureReadMode0EEff") {
            /*
              %27 = load i64, ptr %8, align 4
              %28 = call noundef i32 @_ZL5tex2DIiEN17__nv_tex_rmet_retIT_E4typeE7textureIS1_Li2EL19cudaTextureReadMode0EEff(i64 %27, float noundef %23, float noundef %26) #4
              store i32 %28, ptr %5, align 4
            */
          }



      }
    }
  }




outs() << M << '\n';



}

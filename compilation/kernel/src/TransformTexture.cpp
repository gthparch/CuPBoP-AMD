/**
 * Replace Cuda Texture
*/

#include <iostream>
#include <memory>
#include <queue>
#include <set>
#include <utility>
#include <vector>
#include <unordered_map>


#include "llvm/IR/CallingConv.h"
#include "llvm/IR/Constants.h"
#include "llvm/IR/IRBuilder.h"
#include "llvm/IR/Instructions.h"
#include "llvm/IR/IntrinsicInst.h"
#include "llvm/IR/Intrinsics.h"
#include "llvm/IR/IntrinsicsAMDGPU.h"
#include "llvm/IR/IntrinsicsNVPTX.h"
#include "llvm/IR/Module.h"
#include <llvm/IR/DerivedTypes.h>

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
  std::vector<Instruction*> need_remove;



  std::vector<llvm::GlobalVariable*> allTextureMemories = discover_texture_memory(M);
  printf(" %d ", allTextureMemories.size());
  
  
  if (allTextureMemories.size() > 0) {


  /* 
    Create 

    %struct.texture = type { %struct.textureReference }
    %struct.textureReference = type { i32, i32, i32, [3 x i32], %struct.hipChannelFormatDesc, i32, i32, i32, float, float, float, ptr, i32, i32 }
    %struct.hipChannelFormatDesc = type { i32, i32, i32, i32, i32 }
  */

  auto int32Type = IntegerType::get(context, 32); // 32 bits integer
  auto hipChannelFormatDesc = StructType::create(context, "struct.hipChannelFormatDesc"); // Create opaque type
  // auto myStructPtrType = PointerType::get(myStructType, 0); // Initialise the pointer type now
  hipChannelFormatDesc->setBody({int32Type, int32Type , int32Type, int32Type, int32Type}, /* packed */ false); // Set the body of the aggregate

  ArrayType* arrayType = ArrayType::get(int32Type, 3);
  auto floatType = Type::getFloatTy(context);
  auto intPtrType = Type::getInt32PtrTy(context);
  auto textureReference = StructType::create(context, "struct.textureReference");
  textureReference->setBody({int32Type, int32Type , int32Type, arrayType, hipChannelFormatDesc, int32Type, int32Type, int32Type, floatType, floatType, floatType, intPtrType, int32Type, int32Type}, /* packed */ false); 

  auto textureStruct = StructType::create(context, "struct.texture");
  textureStruct->setBody({textureReference}, false);
  std::unordered_map<std::string, GlobalVariable*> umap;

  // vector type <4 x i32>   Is Scalable false?
  Type *vectorIntType = VectorType::get(int32Type, 4, false);
  auto unionIntVector = StructType::create(context, "vector.int.union"); 
  unionIntVector->setBody({vectorIntType});

  Type *vectorFloatType = VectorType::get(floatType, 4, false);
  auto unionFloatVector = StructType::create(context, "vector.float.union"); 
  unionFloatVector->setBody({vectorFloatType});

  auto hipVectorBase = StructType::create(context, "struct.HIP_vector_base");
  hipVectorBase->setBody({unionIntVector});

  auto hipVectorType = StructType::create(context, "struct.HIP_vector_type");
  hipVectorType->setBody({hipVectorBase});

  for(GlobalVariable* global: allTextureMemories) {
    std::string new_name = "cupbop_" + global->getName().str(); 
    std::cout << global->getName().str() << std::endl;
    // Value* v = dyn_cast<Value>(global);
    std::string old_name = global->getName().str();
    // Global variable initializer type does not match global variable type!
    // ptr addrspace(1) @cupbob_tex
    auto undef = llvm::UndefValue::get(textureStruct);

    auto gv = new llvm::GlobalVariable(M, textureStruct , false, global->getLinkage(),
                            undef, new_name, NULL,
                            global->getThreadLocalMode(), global->getAddressSpace(), global->isExternallyInitialized());
    // auto gv1 = new llvm::GlobalVariable(M, unionVector , false, global->getLinkage(),
    //                         undef, "testVector", NULL,
    //                         global->getThreadLocalMode(), global->getAddressSpace(), global->isExternallyInitialized());
    umap[global->getName().str()] = gv;
    global->replaceAllUsesWith(gv);
    global->dropAllReferences();
    global->eraseFromParent();
    gv->setName(old_name);

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
  llvm::IRBuilder<> Builder2(M.getContext());

  const DataLayout &DL = M.getDataLayout();

  Type* llvmVoidTy = Type::getVoidTy(context);
  Type* llvmI8PtrTy = Type::getInt8PtrTy(context);
  Type* llvmI64Ty = IntegerType::get(context, 64);
  Type* llvmI1Ty = IntegerType::get(context, 1);

  std::vector<Type *> memcpyParams;
  memcpyParams.push_back(llvmI8PtrTy);
  memcpyParams.push_back(llvmI8PtrTy);
  memcpyParams.push_back(llvmI64Ty);
  memcpyParams.push_back(llvmI1Ty);
  llvm::FunctionType *LLVMmemcpyType = FunctionType::get(llvmVoidTy,
          memcpyParams, false);

  Type *Float = llvm::Type::getFloatTy(M.getContext());

  std::vector<Type *> texture2dIntReadParams;
  texture2dIntReadParams.push_back(textureReference);
  texture2dIntReadParams.push_back(Float);
  texture2dIntReadParams.push_back(Float);
  llvm::FunctionType *LLVM2dIntReadTextureType = FunctionType::get(int32Type,
          texture2dIntReadParams, false);


  std::vector<Type *> texture1dFloatReadParams;
  texture1dFloatReadParams.push_back(textureReference);
  texture1dFloatReadParams.push_back(int32Type);
  llvm::FunctionType *LLVM1dFloatReadTextureType = FunctionType::get(Float,
          texture1dFloatReadParams, false);


  for (Module::iterator i = M.begin(), e = M.end(); i != e; ++i) {
    Function *F = &(*i);
      
    if (!is_cuda_kernel(*F))
      continue;
    
    std::cout << "Function: " << F->getName().str() << std::endl;
    Function::iterator I = F->begin();
    BasicBlock::iterator firstBB = I->getFirstInsertionPt();
    auto *first_instr = dyn_cast<Instruction>(firstBB);
    outs() << " First " << *first_instr << " \n";

    for (Function::iterator E = F->end(); I != E; ++I) {
      Value* textureToBeLoaded;
      for (BasicBlock::iterator BI = I->begin(); BI != I->end(); BI++) {

         if (auto *nvvm_function = dyn_cast<CallInst>(BI)) {
          auto func_name = nvvm_function->getCalledFunction()->getName();

          if (func_name == "llvm.nvvm.texsurf.handle.internal.p1") {
            // get the uses of the current instruction return

            Builder.SetInsertPoint(first_instr);     
            AllocaInst *newTextureStruct = Builder.CreateAlloca(textureStruct, DL.getAllocaAddrSpace() , 0, "");
            auto *newtex = Builder.CreateAddrSpaceCast(newTextureStruct, intPtrType); // int32ptr or int64ptr
            
            // call void @llvm.memcpy.p0.p0.i64(ptr align 8 %16, ptr align 8 addrspacecast (ptr addrspace(1) @tex to ptr), i64 88, i1 false)
         
            FunctionCallee LLVMmemcpyFC = M.getOrInsertFunction("llvm.memcpy.p0.p0.i64", LLVMmemcpyType);
            Function * LLVMmemcpyFn = dyn_cast<Function>(LLVMmemcpyFC.getCallee());
            

            // get the operand of the call function
            llvm::Value* texOperand = nvvm_function->getArgOperand(0);
            outs() << *texOperand << '\n';
            std::unordered_map<std::string,GlobalVariable*>::const_iterator got = umap.find(texOperand->getName().str());
            if ( got == umap.end() ) {
              std::cout << "not found";
              exit(1);
            } else {
                std::cout << " foound " << std::endl;
                SmallVector<Value *, 4> memcpyArgs;
                memcpyArgs.push_back(newtex);
                // ptr align 8 addrspacecast (ptr addrspace(1) @tex to ptr)
                memcpyArgs.push_back(Builder.CreateAddrSpaceCast(got->second,llvmI8PtrTy));
                // i64 88
                llvm::Constant *i64_val = llvm::ConstantInt::get(llvmI64Ty, 88/*value*/, false);
                memcpyArgs.push_back(i64_val);
                // i1 false 
                llvm::Constant *ifalse_val = llvm::ConstantInt::get(llvmI1Ty, 0/*value*/, false);
                memcpyArgs.push_back(ifalse_val);
                Builder.SetInsertPoint(nvvm_function);
                Builder.CreateCall(LLVMmemcpyFn, memcpyArgs);
                Value *i32zero = ConstantInt::get(context, APInt(32, 0));
                Value *indices[2] = {i32zero, i32zero};
                textureToBeLoaded = Builder.CreateGEP(textureReference, newtex, ArrayRef<Value *>(indices, 2) ,"", true);
                // %35 = getelementptr inbounds %struct.texture, ptr %16, i32 0, i32 0
                // %36 = load %struct.textureReference, ptr %35, align 8

                // remove  %29 = call i64 @llvm.nvvm.texsurf.handle.internal.p1(ptr addrspace(1) @tex)
                // store i64 %29, ptr %16, align 

                need_remove.push_back(nvvm_function);
                need_remove.push_back(nvvm_function->getNextNode());
            }
            
          } else if (func_name == "_ZL5tex2DIiEN17__nv_tex_rmet_retIT_E4typeE7textureIS1_Li2EL19cudaTextureReadMode0EEff") {
            /*
              2D Integer ReadMode

              %27 = load i64, ptr %8, align 4
              %28 = call noundef i32 @_ZL5tex2DIiEN17__nv_tex_rmet_retIT_E4typeE7textureIS1_Li2EL19cudaTextureReadMode0EEff(i64 %27, float noundef %23, float noundef %26) #4
              store i32 %28, ptr %5, align 4
            */

            
            LoadInst* loadTexture = dyn_cast<LoadInst>(nvvm_function->getPrevNode());
            Builder.SetInsertPoint(loadTexture);
            LoadInst* newLoadTexture = Builder.CreateLoad(textureReference, textureToBeLoaded);
            loadTexture->replaceAllUsesWith(newLoadTexture);
           
            outs() << *newLoadTexture <<  ' \n';
            need_remove.push_back(nvvm_function->getPrevNode());
       
            FunctionCallee LLVMnewFunFC = M.getOrInsertFunction("_ZL5tex2DIiL18hipTextureReadMode0EEN13__hip_tex_retIT_XT0_EbE4typeE7textureIS2_Li2EXT0_EEff", LLVM2dIntReadTextureType);
            Function* LLVMnewFunFn = dyn_cast<Function>(LLVMnewFunFC.getCallee());
            
            nvvm_function->setCalledFunction(LLVMnewFunFn);


          } else if (func_name == "_ZL10tex1DfetchIfEN17__nv_tex_rmet_retIT_E4typeE7textureIS1_Li1EL19cudaTextureReadMode0EEi") {

              // tex1DFetch (float, 1, readMode)
              LoadInst* loadTexture = dyn_cast<LoadInst>(nvvm_function->getPrevNode());
              Builder.SetInsertPoint(loadTexture);
              LoadInst* newLoadTexture = Builder.CreateLoad(textureReference, textureToBeLoaded);
              loadTexture->replaceAllUsesWith(newLoadTexture);

              outs() << *newLoadTexture <<  ' \n';
              need_remove.push_back(nvvm_function->getPrevNode());

              FunctionCallee LLVMnewFunFC = M.getOrInsertFunction("_ZL10tex1DfetchIfL18hipTextureReadMode0EEN13__hip_tex_retIT_XT0_EbE4typeE7textureIS2_Li1EXT0_EEi", LLVM1dFloatReadTextureType);
              Function* LLVMnewFunFn = dyn_cast<Function>(LLVMnewFunFC.getCallee());
              
              nvvm_function->setCalledFunction(LLVMnewFunFn);

          }
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

  outs() << M << '\n';

}

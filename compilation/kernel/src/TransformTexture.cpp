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

#include "llvm/IR/Constants.h"
#include "llvm/IR/IRBuilder.h"
#include "llvm/IR/Instructions.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/Attributes.h"
#include "llvm/IR/DerivedTypes.h"
#include "llvm/IR/Function.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/IR/Attributes.h"
#include "llvm/IR/Function.h"
#include "llvm/ADT/SmallVector.h"
#include "llvm/IR/DataLayout.h"
#include "llvm/IR/DerivedTypes.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/GlobalValue.h"
#include "llvm/IR/IRBuilder.h"
#include "llvm/IR/Instructions.h"
#include "llvm/IR/LLVMContext.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/Value.h"

#include "TransformTexture.hpp"
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
  printf("Number of Texture Memories %zu \n", allTextureMemories.size());
  
  
  if (allTextureMemories.size() > 0) {


  /* 
    Create these structures from HIP

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

  // vector type <4 x i32> ?
  Type *vectorIntType = VectorType::get(int32Type, 4, false);
  auto unionIntVector = StructType::create(context, "vector.int.union"); 
  unionIntVector->setBody(vectorIntType);

  // vector type <4x float>
  Type *vectorFloat4Type = VectorType::get(floatType, 4, false);
  auto unionFloat4Vector = StructType::create(context, "union.anon"); 
  unionFloat4Vector->setBody(vectorFloat4Type);

  auto hipVectorFloat4Base = StructType::create(context, "struct.HIP_vector_base");
  hipVectorFloat4Base->setBody(unionFloat4Vector);

  auto hipVectorFloat4Type = StructType::create(context, "struct.HIP_vector_type");
  hipVectorFloat4Type->setBody(hipVectorFloat4Base);

  // Type *vectorFloat4Type = VectorType::get(floatType, 4, false);
  // auto unionFloat4Vector = StructType::create(context, "vector.float.union"); 
  // unionFloat4Vector->setBody({vectorFloat4Type});

  // auto hipVectorFloat4Base = StructType::create(context, "struct.HIP_vector_base");
  // hipVectorFloat4Base->setBody({unionFloat4Vector});

  // auto hipVectorFloat4Type = StructType::create(context, "struct.HIP_vector_type");
  // hipVectorFloat4Type->setBody({hipVectorFloat4Base});

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

 
  /*
    Go through the functions 
    for each tex used in llvm.nvvm.texsurf.handle.internal.p1
    need to alloc struct.texture in the first block of the function
    then address space cast the alloc to from address space(5) to genetric ptr


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

  // Change llvm.nvvm.texsurf.handle.internal.p1 to llvm.memcpy.p0.p0.i64
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


  std::vector<Type *> texture1dFloat4ReadParams;
  texture1dFloat4ReadParams.push_back(textureReference);
  texture1dFloat4ReadParams.push_back(int32Type);
  llvm::FunctionType *LLVM1dFloat4ReadTextureType = FunctionType::get(hipVectorFloat4Type,
          texture1dFloat4ReadParams, false);


  
  // _ZN15HIP_vector_typeIfLj4EEaSERKS0_
  std::vector<Type *> float4VectorTypeParams;
  float4VectorTypeParams.push_back(llvmI8PtrTy);
  float4VectorTypeParams.push_back(llvmI8PtrTy);
  llvm::FunctionType *LLVMFloat4VectorType = FunctionType::get(llvmI8PtrTy,
        float4VectorTypeParams, false);




  // map operand of old operand of the last segment of llvm.memcpy to new operand for 
  // functions such as _ZN15HIP_vector_typeIfLj4EEaSERKS0_
  // __cuda_
 

  for (Module::iterator i = M.begin(), e = M.end(); i != e; ++i) {
    Function *F = &(*i);
    std::unordered_map<Value*, Value*> operand_map;
      
    // if (!is_cuda_kernel(*F))
    //   continue;
    if (isCudaBuiltin(F->getName().str()))
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
            // this may not be a global variable 
            llvm::Value* texOperand = nvvm_function->getArgOperand(0);
            outs() << *texOperand << '\n';
            std::unordered_map<std::string,GlobalVariable*>::const_iterator got = umap.find(texOperand->getName().str());
            if ( got == umap.end() ) {
              std::cout << "not found";
              outs() << *F << '\n';
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
           
            outs() << *newLoadTexture <<  " \n";
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

              outs() << *newLoadTexture <<  " \n";
              need_remove.push_back(nvvm_function->getPrevNode());

              FunctionCallee LLVMnewFunFC = M.getOrInsertFunction("_ZL10tex1DfetchIfL18hipTextureReadMode0EEN13__hip_tex_retIT_XT0_EbE4typeE7textureIS2_Li1EXT0_EEi", LLVM1dFloatReadTextureType);
              Function* LLVMnewFunFn = dyn_cast<Function>(LLVMnewFunFC.getCallee());
              
              nvvm_function->setCalledFunction(LLVMnewFunFn);

          } else if (func_name == "_ZL10tex1DfetchI6float4EN17__nv_tex_rmet_retIT_E4typeE7textureIS2_Li1EL19cudaTextureReadMode0EEi") {

              // tex1DFetch (float4, 1, readMode)
              
              // count the vector type 
              errs() << *nvvm_function << '\n';
              Type* t = nvvm_function->getCalledFunction()->getReturnType();
              errs() << *t << '\n';
             
              auto StructTy = dyn_cast<StructType>(t);
 
              int numElementsVector = StructTy->getNumElements();
              std::cout << numElementsVector << std::endl;
              Type* vectorType = StructTy->getStructElementType(0);
              // errs() << * (StructTy->getStructElementType(0)) ;
              //  exit(1);


              LoadInst* loadTexture = dyn_cast<LoadInst>(nvvm_function->getPrevNode());
              Builder.SetInsertPoint(loadTexture);
              LoadInst* newLoadTexture = Builder.CreateLoad(textureReference, textureToBeLoaded);
              loadTexture->replaceAllUsesWith(newLoadTexture);

              outs() << *newLoadTexture <<  " \n";
              need_remove.push_back(nvvm_function->getPrevNode());

              FunctionCallee LLVMnewFunFC = M.getOrInsertFunction("_ZL10tex1DfetchI15HIP_vector_typeIfLj4EEL18hipTextureReadMode0EEN13__hip_tex_retIT_XT0_EbE4typeE7textureIS4_Li1EXT0_EEi", LLVM1dFloat4ReadTextureType);
              Function* LLVMnewFunFn = dyn_cast<Function>(LLVMnewFunFC.getCallee());
              Builder.SetInsertPoint(nvvm_function);
              SmallVector<Value *, 2> texArgs;
              outs() << nvvm_function->getArgOperand(0) << '\n';
              texArgs.push_back(nvvm_function->getArgOperand(0));
              texArgs.push_back(nvvm_function->getArgOperand(1));
              auto newTexCall = Builder.CreateCall(LLVMnewFunFn, texArgs);
              nvvm_function->replaceAllUsesWith(newTexCall);

              // get the next instructions which are 
              // %45 = getelementptr inbounds %struct.float4, ptr %16, i32 0, i32 0
              // %46 = extractvalue %struct.HIP_vector_type %43, 0
              Builder.SetInsertPoint(first_instr);     
              AllocaInst *newVector = Builder.CreateAlloca(hipVectorFloat4Type, DL.getAllocaAddrSpace() , 0, "");
              auto *newVec = Builder.CreateAddrSpaceCast(newVector , intPtrType); // int32ptr or int64ptr
            
               
              GetElementPtrInst* gep = dyn_cast<GetElementPtrInst>(nvvm_function->getNextNode());
              operand_map[gep->getOperand(0)] = newVec;
              Builder.SetInsertPoint(gep);
              Value *i32zero = ConstantInt::get(context, APInt(32, 0));
              Value *indices[2] = {i32zero, i32zero};
              auto vectorToBeExtract = Builder.CreateStructGEP(hipVectorFloat4Type, newVec, 0 /*ArrayRef<Value *>(indices, 2)*/ ,"");

              gep->replaceAllUsesWith(vectorToBeExtract);

              ExtractValueInst* eei = dyn_cast<ExtractValueInst>(gep->getNextNode());
              if (!eei) {
                printf("Null");
              }
              outs() << *eei << '\n';
              // outs() << *(eei->getNextNode()) << '\n';
              // StoreInst* store = dyn_cast<StoreInst>(eei->getNextNode());
            
              // Builder.SetInsertPoint(eei);

              auto newEEV = Builder.CreateExtractValue(newTexCall, ArrayRef<unsigned int>({0}), "");
              auto newStore = Builder.CreateStore(newEEV, vectorToBeExtract);

              // store->replaceAllUsesWith(newStore);
             
        
              // outs() << M << '\n';
              // exit(1);
              // nvvm_function->setCalledFunction(LLVMnewFunFn);

              need_remove.push_back(nvvm_function);
              /*
                Remove the getelementptr, extractvalue, store for each element of the struct

              */
              int ii = 0;
              auto prev = dyn_cast<Instruction>(gep);
              for(ii = 0; ii < numElementsVector*3; ++ii) {
                  need_remove.push_back(prev);
                  prev = prev->getNextNode();
                  if (!prev) break;

              }

              /*
                %45 = getelementptr inbounds %struct.HIP_vector_type, ptr %21, i32 0, i32 0
                %46 = extractvalue %struct.HIP_vector_type %44, 0
                store %struct.HIP_vector_base %46, ptr %45, align 16
              */



          } 
      } else if (auto *getelementpr = dyn_cast<GetElementPtrInst>(BI)) {

            /*
            
              Translate the getelementpr of %struct.float4

              %57 = load ptr, ptr %16, align 8
              %58 = load i64, ptr %14, align 8
              %59 = getelementptr inbounds %struct.float4, ptr %57, i64 %58
              call void @llvm.memcpy.p0.p0.i64(ptr align 16 %59, ptr align 16 %18, i64 16, i1 false)

            */
         
           outs() << *getelementpr << '\n';
          //  outs() << getelementpr->getSourceElementType()->getStructName()<< '\n';
          //  outs() << getelementpr->getOperand(0)->getType()->getStructName().str()<< '\n';
           if(auto StructTy = dyn_cast<StructType>(getelementpr->getSourceElementType()) && getelementpr->getSourceElementType()->getStructName().str() == "struct.float4") {
            printf("88888888888888888888888\n");
            // if the next instruction is llvm.memcpy
            outs() << *getelementpr->getNextNode() << '\n'; 
            if (auto *memcpyFn = dyn_cast<CallInst>(getelementpr->getNextNode())) {
              auto callFnName = memcpyFn->getCalledFunction()->getName();

              if (callFnName == "llvm.memcpy.p0.p0.i64") {
                Builder.SetInsertPoint(getelementpr);
                auto newGEP = Builder.CreateGEP(hipVectorFloat4Type, getelementpr->getOperand(0), ArrayRef<Value *>({getelementpr->getOperand(1)}) ,"", true);
                getelementpr->replaceAllUsesWith(newGEP);
                need_remove.push_back(getelementpr);
                
                // replace memcpy with _ZN15HIP_vector_typeIfLj4EEaSERKS0_

                // llvmI8PtrTy
                FunctionCallee LLVMnewFunFC = M.getOrInsertFunction("_ZN15HIP_vector_typeIfLj4EEaSERKS0_", LLVMFloat4VectorType);
                Function* LLVMnewFunFn = dyn_cast<Function>(LLVMnewFunFC.getCallee());
                // TODO: get dereferenceable from data layout type size DL.getTypeStoreSize(newGEP->getType())
                LLVMnewFunFn->addDereferenceableParamAttr(0,16);
                LLVMnewFunFn->addDereferenceableParamAttr(1,16);
                LLVMnewFunFn->addRetAttr(Attribute::getWithDereferenceableBytes(context, 16));
                SmallVector<Value *, 2> texArgs;

                llvm::Value* texOperand = memcpyFn->getArgOperand(1);
                outs() << *texOperand << '\n';
               
                std::unordered_map<Value*,Value*>::iterator gotValue = operand_map.find(texOperand);
                if ( gotValue == operand_map.end() ) {
                  std::cerr << "not found";
                  outs() << *F << '\n';
                  exit(1);
                } else {
                  texArgs.push_back(newGEP);
                  texArgs.push_back(gotValue->second);
                  auto vectorTypeCall = Builder.CreateCall(LLVMnewFunFn, texArgs);
                  vectorTypeCall->addDereferenceableParamAttr(0,16);
                  vectorTypeCall->addDereferenceableParamAttr(1,16);
                  vectorTypeCall->addRetAttr(Attribute::getWithDereferenceableBytes(context, 16));

                  memcpyFn->replaceAllUsesWith(vectorTypeCall);
                  need_remove.push_back(memcpyFn);

                }
                
              }
           }
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

  // outs() << M << '\n';

}

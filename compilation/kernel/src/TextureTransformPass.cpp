#include <string>

#include <iostream>

#include "llvm/Demangle/Demangle.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/InstIterator.h"
#include "llvm/IR/Instructions.h"

#include "llvm/Transforms/Utils/BasicBlockUtils.h"


#include "TextureTransformPass.hpp"
#include "vectorTypes.hpp"
#include "utils.hpp"


using namespace llvm;
using namespace cupbop::amd::passes;

namespace {
static RegisterPass<TextureTransformPass> texture_transform_pass(
    "cuda-texture-transform",
    "Converts CUDA texture operations to HIP compatible ones");
}; // namespace

char TextureTransformPass::ID = 0;

TextureTransformPass::TextureTransformPass() : ModulePass(ID) {}

bool TextureTransformPass::runOnModule(Module &M) {

    std::set<Instruction*> need_remove;

    std::vector<llvm::GlobalVariable*> allTextureMemories = discover_texture_memory(M);

    if (allTextureMemories.size() > 0) {


        CupbopVectorType* cvt = CupbopVectorType::getInstance();

        auto &context = M.getContext();
        Type* llvmVoidTy = Type::getVoidTy(context);
        Type* llvmI8PtrTy = Type::getInt8PtrTy(context);
        Type* llvmI64Ty = IntegerType::get(context, 64);
        Type* llvmI1Ty = IntegerType::get(context, 1);
        Type* I32 = IntegerType::get(context, 32); // 32 bits integer

        auto floatType = Type::getFloatTy(context);
        auto I32Ptr = Type::getInt32PtrTy(context);
        /* 
            Create these structures from HIP

            %struct.texture = type { %struct.textureReference }
            %struct.textureReference = type { i32, i32, i32, [3 x i32], %struct.hipChannelFormatDesc, i32, i32, i32, float, float, float, ptr, i32, i32 }
            %struct.hipChannelFormatDesc = type { i32, i32, i32, i32, i32 }
        */



        auto hipChannelFormatDesc = StructType::create(context, "struct.hipChannelFormatDesc"); // Create opaque type
        // auto myStructPtrType = PointerType::get(myStructType, 0); // Initialise the pointer type now
        hipChannelFormatDesc->setBody({I32, I32 , I32, I32, I32}, /* packed */ false); // Set the body of the aggregate

        ArrayType* arrayType = ArrayType::get(I32, 3);
       
        auto textureReference = StructType::create(context, "struct.textureReference");
        textureReference->setBody({I32, I32 , I32, arrayType, hipChannelFormatDesc, I32, I32, I32, floatType, floatType, floatType, I32Ptr, I32, I32}, /* packed */ false); 

        auto textureStruct = StructType::create(context, "struct.texture");
        textureStruct->setBody({textureReference}, false);
        std::unordered_map<std::string, GlobalVariable*> umap;



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

        std::vector<Type *> memcpyParams;
        memcpyParams.push_back(llvmI8PtrTy);
        memcpyParams.push_back(llvmI8PtrTy);
        memcpyParams.push_back(llvmI64Ty);
        memcpyParams.push_back(llvmI1Ty);
        llvm::FunctionType *LLVMmemcpyType = FunctionType::get(llvmVoidTy,
                memcpyParams, false);

        std::vector<Type *> texture2dIntReadParams;
        texture2dIntReadParams.push_back(textureReference);
        texture2dIntReadParams.push_back(floatType);
        texture2dIntReadParams.push_back(floatType);
        llvm::FunctionType *LLVM2dIntReadTextureType = FunctionType::get(I32,
                texture2dIntReadParams, false);


        std::vector<Type *> texture1dFloatReadParams;
        texture1dFloatReadParams.push_back(textureReference);
        texture1dFloatReadParams.push_back(I32);
        llvm::FunctionType *LLVM1dFloatReadTextureType = FunctionType::get(floatType,
                texture1dFloatReadParams, false);


        std::vector<Type *> texture1dFloat4ReadParams;
        texture1dFloat4ReadParams.push_back(textureReference);
        texture1dFloat4ReadParams.push_back(I32);
        llvm::FunctionType *LLVM1dFloat4ReadTextureType = FunctionType::get(cvt->getFloat4Type(),
                texture1dFloat4ReadParams, false);


        // _ZN15HIP_vector_typeIfLj4EEaSERKS0_
        std::vector<Type *> float4VectorTypeParams;
        float4VectorTypeParams.push_back(llvmI8PtrTy);
        float4VectorTypeParams.push_back(llvmI8PtrTy);
        llvm::FunctionType *LLVMFloat4VectorType = FunctionType::get(llvmI8PtrTy,
                float4VectorTypeParams, false);


      


        // vector types

        llvm::IRBuilder<> Builder(M.getContext());
        const DataLayout &DL = M.getDataLayout();
        int count = 0;
        // check if the functionis cuda buildin, if so continue
        for (auto &F : M) {
            // check if the function is device function 
            // check if the function uses vector types 
            if (F.getCallingConv() == CallingConv::AMDGPU_KERNEL) {
                // if function has texture annotations:
                std::unordered_map<Value*, Value*> operand_map;

                std::cout << "Function: " << F.getName().str() << std::endl;

                // if (F.getName().str() != "_Z9mergepackPfS_") continue;

                Function::iterator I = F.begin();
                BasicBlock::iterator firstBB = I->getFirstInsertionPt();
                auto *first_instr = dyn_cast<Instruction>(firstBB);
                // outs() << " First " << *first_instr << " \n";
                std::set<Value*> getElementPtrBefore;

                for (Function::iterator E = F.end(); I != E; ++I) {
                    Value* textureToBeLoaded;
                    for (BasicBlock::iterator BI = I->begin(); BI != I->end(); BI++) {
                        // outs() << *BI << " I " << '\n';
                        count += 1;
                        // if (count > 210)  {
                        //     outs() << F << '\n';
                        //     std::exit(1);
                        // }
                        if (auto *nvvm_function = dyn_cast<CallInst>(BI)) {
                            Function *func  = nvvm_function->getCalledFunction();
                            StringRef func_name;
                            if(func != NULL) {
                                func_name = func->getName();
                            } else {
                                Value* v=nvvm_function->getCalledOperand();
                                Value* sv = v->stripPointerCasts();
                                func = dyn_cast<Function>(sv);
                                StringRef fname = sv->getName();
                                func_name =  sv->getName();
                            }
                            outs() << func_name << '\n';

                        // if the function called is a device function 
                        // if the types of the function has changed , need to change the call parameters 
                        // and the return type may need to be changed
                        if (func_name == "llvm.memcpy.p0.p0.i64") { 
                            
                            if (need_remove.find(nvvm_function) != need_remove.end()) continue;
                            // outs() << " 999 " << '\n';

                            /*
                                hybridsort end case
                            */
                            llvm::Value* one_operand = nvvm_function->getArgOperand(1);
                            llvm::Value* zero_operand = nvvm_function->getArgOperand(0);
                            if (getElementPtrBefore.find(one_operand) != getElementPtrBefore.end()) {
                                std::unordered_map<Value*,Value*>::iterator gotValue = operand_map.find(zero_operand);
                                std::unordered_map<Value*,Value*>::iterator gotValue2 = operand_map.find(one_operand);

                                if ( gotValue == operand_map.end() || gotValue2 == operand_map.end() ) {  
                                    outs() << " Unknown Case " << '\n';
                                    std::exit(10);
                                } else {
                                    nvvm_function->setArgOperand(0, gotValue->second);
                                    nvvm_function->setArgOperand(1, gotValue2->second);


                                    Builder.SetInsertPoint(nvvm_function);

                                    FunctionCallee LLVMnewFunFC = M.getOrInsertFunction("_ZN15HIP_vector_typeIfLj4EEaSERKS0_", LLVMFloat4VectorType);
                                    Function* LLVMnewFunFn = dyn_cast<Function>(LLVMnewFunFC.getCallee());
                                    // TODO: get dereferenceable from data layout type size DL.getTypeStoreSize(newGEP->getType())
                                    LLVMnewFunFn->addDereferenceableParamAttr(0,16);
                                    LLVMnewFunFn->addDereferenceableParamAttr(1,16);
                                    LLVMnewFunFn->addRetAttr(Attribute::getWithDereferenceableBytes(context, 16));
                                    SmallVector<Value *, 2> texArgs;

                                
                                    texArgs.push_back(nvvm_function->getArgOperand(0));
                                    texArgs.push_back(nvvm_function->getArgOperand(1));
                                    auto vectorTypeCall = Builder.CreateCall(LLVMnewFunFn, texArgs);
                                    vectorTypeCall->addDereferenceableParamAttr(0,16);
                                    vectorTypeCall->addDereferenceableParamAttr(1,16);
                                    vectorTypeCall->addRetAttr(Attribute::getWithDereferenceableBytes(context, 16));
                                
                                    nvvm_function->replaceAllUsesWith(vectorTypeCall);
                                    need_remove.insert(nvvm_function);

                                }



                            }
                            // outs() << F << '\n';
                            // std::exit(122);


                        //     llvm::Value* first_operand = nvvm_function->getArgOperand(0);

                        //     if (auto addrSpaceCastInstr = dyn_cast<AddrSpaceCastInst>(first_operand)) {
                        //         if (auto allocaInstr = dyn_cast<AllocaInst>(addrSpaceCastInstr->getPointerOperand())) {
                        //             if (allocaInstr->getAllocatedType()->isStructTy()) {
                        //             if (allocaInstr->getAllocatedType()->getStructName().str() == "struct.float4") {
                        //                     Builder.SetInsertPoint(addrSpaceCastInstr);
                        //                     AllocaInst *newVector = Builder.CreateAlloca(cvt->getFloat4Type(), DL.getAllocaAddrSpace() , 0, "");
                        //                     auto *newVec = Builder.CreateAddrSpaceCast(newVector , I32Ptr); // int32ptr or int64ptr
                        //                     operand_map[first_operand] = newVec;
                        //                     // replace all uses
                        //                     addrSpaceCastInstr->replaceAllUsesWith(newVec);
                                            
                        //                     need_remove.insert(addrSpaceCastInstr);
                        //                     need_remove.insert(allocaInstr);

                        //             }

                        //             }
                        //         }
                                
                        //     }


                        //     /*
                        //      %19 = alloca %struct.float4, align 16, addrspace(5)
                        //      %20 = addrspacecast ptr addrspace(5) %19 to ptr

                        //      %13 = alloca %struct.float4, align 16, addrspace(5)
                        //      %14 = addrspacecast ptr addrspace(5) %13 to ptr

                        //      call void @llvm.memcpy.p0.p0.i64(ptr align 16 %20, ptr align 16 %14, i64 16, i1 false)
                            
                            
                        //     %9 = alloca %struct.HIP_vector_type, align 16, addrspace(5)
                        //     %17 = addrspacecast ptr addrspace(5) %9 to ptr

                        //     copy for function call
                        //     call void @llvm.memcpy.p0.p0.i64(ptr align 16 %18, ptr align 16 %15, i64 16, i1 false)
                        //     %41 = getelementptr inbounds %struct.HIP_vector_type, ptr %18, i32 0, i32 0
                        //     %42 = load %struct.HIP_vector_base, ptr %41, align 16
                        //     %43 = call %struct.HIP_vector_type @_Z8sortElem15HIP_vector_typeIfLj4EE(%struct.HIP_vector_base %42) #27
                        //     %44 = getelementptr inbounds %struct.HIP_vector_type, ptr %17, i32 0, i32 0
                        //     %45 = extractvalue %struct.HIP_vector_type %43, 0
                        //     store %struct.HIP_vector_base %45, ptr %44, align 16

                        //     */ 

                        //     // check if the second operand and the first has already been initialized
                        //     llvm::Value* second_operand = nvvm_function->getArgOperand(1);
                        //     std::unordered_map<Value*,Value*>::iterator gotValue = operand_map.find(second_operand);
                        //     if ( gotValue == operand_map.end() ) {
                        //         outs() << "LLVM get second operand not found\n";
                        //         outs() << F << '\n';
                        //         outs() << *nvvm_function << '\n';
                        //         std::exit(1);
                        //     } else {

                        //         // if previous is store instruction 

                        //         /*
                        //             vector type change after textureCall
                        //             %138 = extractvalue %struct.float4 %130, 3
                        //             store float %138, ptr %137, align 4
                        //             call void @llvm.memcpy.p0.p0.i64(ptr align 16 %19, ptr align 16 %21, i64 16, i1 false)
                        //         */
                        //         if (auto gepInstr = dyn_cast<GetElementPtrInst>(nvvm_function->getPrevNode()->getPrevNode() )) {

                        //             if (gepInstr->getArgOperand(0)->getType()->isStructTy()) {
                        //                 if (extractInstr->getAggregateOperand()->getType()->getStructName().str() == "struct.HIP_vector_type") {
                        //                     Builder.SetInsertPoint(nvvm_function);

                        //                     FunctionCallee LLVMnewFunFC = M.getOrInsertFunction("_ZN15HIP_vector_typeIfLj4EEaSERKS0_", LLVMFloat4VectorType);
                        //                     Function* LLVMnewFunFn = dyn_cast<Function>(LLVMnewFunFC.getCallee());
                        //                     // TODO: get dereferenceable from data layout type size DL.getTypeStoreSize(newGEP->getType())
                        //                     LLVMnewFunFn->addDereferenceableParamAttr(0,16);
                        //                     LLVMnewFunFn->addDereferenceableParamAttr(1,16);
                        //                     LLVMnewFunFn->addRetAttr(Attribute::getWithDereferenceableBytes(context, 16));
                        //                     SmallVector<Value *, 2> texArgs;

                                          
                        //                     texArgs.push_back(nvvm_function->getArgOperand(0));
                        //                     texArgs.push_back(gotValue->second);
                        //                     auto vectorTypeCall = Builder.CreateCall(LLVMnewFunFn, texArgs);
                        //                     vectorTypeCall->addDereferenceableParamAttr(0,16);
                        //                     vectorTypeCall->addDereferenceableParamAttr(1,16);
                        //                     vectorTypeCall->addRetAttr(Attribute::getWithDereferenceableBytes(context, 16));
                                           
                        //                     nvvm_function->replaceAllUsesWith(vectorTypeCall);
                        //                     need_remove.insert(nvvm_function);
                                           
                                            
                        //                 } else {
                        //                     outs() << " Unknown Case 1\n";
                        //                     std::exit(1);
                        //                 }
                        //             } else {
                        //                     outs() << " Unknown Case 2\n";
                        //                     std::exit(1);
                        //             }

                        //         } else {
                        //             nvvm_function->setArgOperand(1, gotValue->second);
                        //         }

                                
                        //     }
                                 
                        //     // second operand is addrspacecast instr 
                        //     // alloca instruction is struct.float4 type
                           

                        //     // 
                        //     // outs() << F << '\n';
                        //     // outs() << " there 12 " << '\n';





                        } else 
                        if (func_name == "llvm.nvvm.texsurf.handle.internal.p1") {
                            // get the uses of the current instruction return
                            outs() << " 1 " << '\n';

                            Builder.SetInsertPoint(first_instr);     
                            AllocaInst *newTextureStruct = Builder.CreateAlloca(textureStruct, DL.getAllocaAddrSpace() , 0, "");
                            auto *newtex = Builder.CreateAddrSpaceCast(newTextureStruct, I32Ptr); // int32ptr or int64ptr
                            
                            // call void @llvm.memcpy.p0.p0.i64(ptr align 8 %16, ptr align 8 addrspacecast (ptr addrspace(1) @tex to ptr), i64 88, i1 false)
                        
                            FunctionCallee LLVMmemcpyFC = M.getOrInsertFunction("llvm.memcpy.p0.p0.i64", LLVMmemcpyType);
                            Function * LLVMmemcpyFn = dyn_cast<Function>(LLVMmemcpyFC.getCallee());
                            

                            // get the operand of the call function
                            // this may not be a global variable 
                            llvm::Value* texOperand = nvvm_function->getArgOperand(0);
                            outs() << *texOperand << '\n';
                            std::unordered_map<std::string,GlobalVariable*>::const_iterator got = umap.find(texOperand->getName().str());
                            if ( got == umap.end() ) {
                                outs() << "not found";
                                outs() << F << '\n';
                                std::exit(10);
                            // exit(1);
                            } else {
                                outs() << " foound " << '\n';
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
                                // changed this line
                                textureToBeLoaded = Builder.CreateGEP(textureStruct, newtex, ArrayRef<Value *>(indices, 2) ,"", true);
                                // %35 = getelementptr inbounds %struct.texture, ptr %16, i32 0, i32 0
                                // %36 = load %struct.textureReference, ptr %35, align 8

                                // remove  %29 = call i64 @llvm.nvvm.texsurf.handle.internal.p1(ptr addrspace(1) @tex)
                                // store i64 %29, ptr %16, align 

                                need_remove.insert(nvvm_function);
                                need_remove.insert(nvvm_function->getNextNode());


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
                            need_remove.insert(nvvm_function->getPrevNode());
                    
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
                            need_remove.insert(nvvm_function->getPrevNode());

                            FunctionCallee LLVMnewFunFC = M.getOrInsertFunction("_ZL10tex1DfetchIfL18hipTextureReadMode0EEN13__hip_tex_retIT_XT0_EbE4typeE7textureIS2_Li1EXT0_EEi", LLVM1dFloatReadTextureType);
                            Function* LLVMnewFunFn = dyn_cast<Function>(LLVMnewFunFC.getCallee());
                            
                            nvvm_function->setCalledFunction(LLVMnewFunFn);

                        } else if (func_name == "_ZL10tex1DfetchI6float4EN17__nv_tex_rmet_retIT_E4typeE7textureIS2_Li1EL19cudaTextureReadMode0EEi") {


                            

                            // tex1DFetch (float4, 1, readMode)
                            outs() << " fetch here " << '\n';

                            // outs() << F << '\n';

                            // count the vector type 
                            outs() << *nvvm_function << '\n';
                            Type* t = nvvm_function->getCalledFunction()->getReturnType();
                            outs() << *t << '\n';
                            
                            auto StructTy = dyn_cast<StructType>(t);
                
                            int numElementsVector = StructTy->getNumElements();
                            // std::cout << numElementsVector << std::endl;
                            Type* vectorType = StructTy->getStructElementType(0);
                            // errs() << * (StructTy->getStructElementType(0)) ;
                            //  exit(1);


                            LoadInst* loadTexture = dyn_cast<LoadInst>(nvvm_function->getPrevNode());
                            Builder.SetInsertPoint(loadTexture);
                            LoadInst* newLoadTexture = Builder.CreateLoad(textureReference, textureToBeLoaded);
                            loadTexture->replaceAllUsesWith(newLoadTexture);

                            outs() << *newLoadTexture <<  " \n";
                            need_remove.insert(nvvm_function->getPrevNode());

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
                            AllocaInst *newVector = Builder.CreateAlloca(cvt->getFloat4Type(), DL.getAllocaAddrSpace() , 0, "");
                            auto *newVec = Builder.CreateAddrSpaceCast(newVector , I32Ptr); // int32ptr or int64ptr
                            
                            
                            GetElementPtrInst* gep = dyn_cast<GetElementPtrInst>(nvvm_function->getNextNode());
                            operand_map[gep->getOperand(0)] = newVec;
                            Builder.SetInsertPoint(gep);
                            Value *i32zero = ConstantInt::get(context, APInt(32, 0));
                            Value *indices[2] = {i32zero, i32zero};
                            auto vectorToBeExtract = Builder.CreateStructGEP(cvt->getFloat4Type(), newVec, 0 /*ArrayRef<Value *>(indices, 2)*/ ,"");

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

                            need_remove.insert(nvvm_function);
                            /*
                                Remove the getelementptr, extractvalue, store for each element of the struct

                            */
                            int ii = 0;
                            auto prev = dyn_cast<Instruction>(gep);
                            for(ii = 0; ii < numElementsVector*3; ++ii) {
                                need_remove.insert(prev);
                                
                                outs() << *prev << " need remove " << "\n";
                                prev = prev->getNextNode();
                                if (!prev) break;

                            }
                            

                            // if after store instruction there can be call void @llvm.memcpy.p0.p0.i64(ptr align 16 %19, ptr align 16 %21, i64 16, i1 false)
                            // which changes to   %172 = call noundef nonnull align 16 dereferenceable(16) ptr @_ZN15HIP_vector_typeIfLj4EEaSEOS0_(ptr noundef nonnull align 16 dereferenceable(16) %60, ptr noundef nonnull align 16 dereferenceable(16) %62) #27
                            /*
                                %197 = getelementptr inbounds %struct.float4, ptr %49, i32 0, i32 3
                                %198 = extractvalue %struct.HIP_vector_type %187, 3
                                store float %198, ptr %197, align 4
                                call void @llvm.memcpy.p0.p0.i64(ptr align 16 %45, ptr align 16 %49, i64 16, i1 false)
                            */
                            outs() << " prev " << *prev << '\n';
                            if (auto *memcpyFn = dyn_cast<CallInst>(prev)) {
                                auto callFnName = memcpyFn->getCalledFunction()->getName();
                                outs() << " hhhhh \n";
                                if (callFnName == "llvm.memcpy.p0.p0.i64") {
                                    if (memcpyFn->getArgOperand(1) == gep->getOperand(0)) {
                                        outs() << " hhhhh \n";
                                        if (gep->getSourceElementType()->isStructTy()
                                        && gep->getSourceElementType()->getStructName().str() == "struct.float4") {
                                            outs() << " hhhhh \n";
                                            llvm::Value* first_operand = memcpyFn->getArgOperand(0);

                                            if (auto addrSpaceCastInstr = dyn_cast<AddrSpaceCastInst>(first_operand)) {
                                                if (auto allocaInstr = dyn_cast<AllocaInst>(addrSpaceCastInstr->getPointerOperand())) {
                                                    if (allocaInstr->getAllocatedType()->isStructTy()) {
                                                    if (allocaInstr->getAllocatedType()->getStructName().str() == "struct.float4") {
                                                            Builder.SetInsertPoint(addrSpaceCastInstr);
                                                            AllocaInst *newVector = Builder.CreateAlloca(cvt->getFloat4Type(), DL.getAllocaAddrSpace() , 0, "");
                                                            auto *newVec = Builder.CreateAddrSpaceCast(newVector , I32Ptr); // int32ptr or int64ptr
                                                            operand_map[first_operand] = newVec;
                                                            // replace all uses       
                                                            memcpyFn->setArgOperand(0, newVec);                                                     
                                                            need_remove.insert(addrSpaceCastInstr);
                                                            need_remove.insert(allocaInstr);

                                                    }

                                                    }
                                                }
                                                
                                            }

                                            Builder.SetInsertPoint(prev);

                                            FunctionCallee LLVMnewFunFC = M.getOrInsertFunction("_ZN15HIP_vector_typeIfLj4EEaSERKS0_", LLVMFloat4VectorType);
                                            Function* LLVMnewFunFn = dyn_cast<Function>(LLVMnewFunFC.getCallee());
                                            // TODO: get dereferenceable from data layout type size DL.getTypeStoreSize(newGEP->getType())
                                            LLVMnewFunFn->addDereferenceableParamAttr(0,16);
                                            LLVMnewFunFn->addDereferenceableParamAttr(1,16);
                                            LLVMnewFunFn->addRetAttr(Attribute::getWithDereferenceableBytes(context, 16));
                                            SmallVector<Value *, 2> texArgs;

                                          
                                            texArgs.push_back(memcpyFn->getArgOperand(0));
                                            texArgs.push_back(newVec);
                                            auto vectorTypeCall = Builder.CreateCall(LLVMnewFunFn, texArgs);
                                            vectorTypeCall->addDereferenceableParamAttr(0,16);
                                            vectorTypeCall->addDereferenceableParamAttr(1,16);
                                            vectorTypeCall->addRetAttr(Attribute::getWithDereferenceableBytes(context, 16));
                                           
                                            memcpyFn->replaceAllUsesWith(vectorTypeCall);
                                            need_remove.insert(memcpyFn);
                                           
                                        }
                                        
                                    }

                                    
                                }
                            }
                            /*
                                %45 = getelementptr inbounds %struct.HIP_vector_type, ptr %21, i32 0, i32 0
                                %46 = extractvalue %struct.HIP_vector_type %44, 0
                                store %struct.HIP_vector_base %46, ptr %45, align 16
                            */

                            // outs() << F << '\n';
                            // outs() << " finish two " << '\n';


                        } else  {

                            /*
                                For some reason replace function didn't work with the DeviceVectorArgPass
                                %55 = call %struct.float4 @_Z8sortElem6float4(ptr noundef byval(%struct.float4) align 16 %22) 
                            */

                            // called maybe a device function
                            if (isCudaBuiltin(func_name.str()) || func_name.str().find("HIP_") != std::string::npos) continue;
                            
                            Function *f = M.getFunction(func_name);

                            outs() << f->getName() << " x" << '\n';

                            // go through all the call arg operands if device function 
                            // has struct.float4 arg type or return type
                            // or if the types are different     
                            FunctionType *fType = f->getFunctionType();
                            FunctionType *callFType = func->getFunctionType();
                         
                            // return type
                            Type* returnType = nvvm_function->getType();
                        
                            //Type *ptype = F.getParamByValType();

                            // arg operand types 
                            // nvvm_funcion->getArgOperand(0)->getType()
                            nvvm_function->mutateFunctionType(fType);

                           /*
                            call void @llvm.memcpy.p0.p0.i64(ptr align 16 %33, ptr align 16 %19, i64 16, i1 false)
                            call void @llvm.memcpy.p0.p0.i64(ptr align 16 %34, ptr align 16 %20, i64 16, i1 false)
                            %193 = call %struct.float4 @_Z10getHighest6float4S_(ptr noundef byval(%struct.float4) align 16 %33, ptr noundef byval(%struct.float4) align 16 %34) #6
                           
                            use a queue

                           */
                            auto prevInstr = nvvm_function->getPrevNode();
                            for (int ii = nvvm_function->arg_size()-1; ii >= 0; --ii) {

                                outs() << " arg: " << ii << " " << *prevInstr << "\n";

                                 // if current arg operand is equal to the first arg operand of the llvm.memcpy instruction
                                 // then change the type of the arg operands()
                                  if (auto *memcpyFn = dyn_cast<CallInst>(prevInstr)) {
                                    auto callFnName = memcpyFn->getCalledFunction()->getName();

                                    if (callFnName == "llvm.memcpy.p0.p0.i64") {

                                            llvm::Value* first_operand = memcpyFn->getArgOperand(0);

                                            if (auto addrSpaceCastInstr = dyn_cast<AddrSpaceCastInst>(first_operand)) {
                                                if (auto allocaInstr = dyn_cast<AllocaInst>(addrSpaceCastInstr->getPointerOperand())) {
                                                    if (allocaInstr->getAllocatedType()->isStructTy()) {
                                                    if (allocaInstr->getAllocatedType()->getStructName().str() == "struct.float4") {
                                                    if (nvvm_function->getArgOperand(ii) == memcpyFn->getArgOperand(0)) {
                                                         outs() << " heeere \n";

                                                            Builder.SetInsertPoint(addrSpaceCastInstr);
                                                            AllocaInst *newVector = Builder.CreateAlloca(cvt->getFloat4Type(), DL.getAllocaAddrSpace() , 0, "");
                                                            auto *newVec = Builder.CreateAddrSpaceCast(newVector , I32Ptr); // int32ptr or int64ptr
                                                            operand_map[first_operand] = newVec;
                                                            // replace all uses
                                                            // addrSpaceCastInstr->replaceAllUsesWith(newVec);
                                                            memcpyFn->setArgOperand(0, newVec);                                                     

                                                            need_remove.insert(addrSpaceCastInstr);
                                                            need_remove.insert(allocaInstr);
                                                            prevInstr = prevInstr->getPrevNode();

                                                    }

                                                    } else {
                                                        prevInstr = prevInstr->getPrevNode();
                                                    }
                                                } else {
                                                    prevInstr = prevInstr->getPrevNode();
                                                }
                                                
                                            }

                                            llvm::Value* second_operand = memcpyFn->getArgOperand(1);

                                            std::unordered_map<Value*,Value*>::iterator gotValue = operand_map.find(second_operand);
                                            if ( gotValue == operand_map.end() ) {
                                             outs() << " Unknown Case \n";
                                             std::exit(1);
                                            }

                                            memcpyFn->setArgOperand(1, gotValue->second);
                                           
                                        }
                                    }
                                  }
                                 


                                 if (auto addrSpaceCastInstr = dyn_cast<AddrSpaceCastInst>(nvvm_function->getArgOperand(ii))) {

                                    std::unordered_map<Value*,Value*>::iterator gotValue = operand_map.find(addrSpaceCastInstr);
                                    if ( gotValue == operand_map.end() ) {
                                        outs() << " Device function call: LLVM get second operand not found\n";
                                     
                                        outs() << *nvvm_function << '\n';
                                        outs() << *addrSpaceCastInstr << '\n';
                                       

                                        
                                        if (auto allocaInstr = dyn_cast<AllocaInst>(addrSpaceCastInstr->getPointerOperand())) {
                                            if (allocaInstr->getAllocatedType()->isStructTy()) {
                                            if (allocaInstr->getAllocatedType()->getStructName().str() == "struct.float4") {
                                                    Builder.SetInsertPoint(addrSpaceCastInstr);
                                                    AllocaInst *newVector = Builder.CreateAlloca(cvt->getFloat4Type(), DL.getAllocaAddrSpace() , 0, "");
                                                    auto *newVec = Builder.CreateAddrSpaceCast(newVector , I32Ptr); // int32ptr or int64ptr
                                                    
                                                    // replace all uses
                                                    addrSpaceCastInstr->replaceAllUsesWith(newVec);

                                                    Builder.SetInsertPoint(nvvm_function);    
                                                    auto vectorTypeToGEP = Builder.CreateStructGEP(cvt->getFloat4Type(), newVec, 0 /*ArrayRef<Value *>(indices, 2)*/ ,"");
    
                                                    auto loadVectorType = Builder.CreateLoad(cvt->getFloat4Base(), vectorTypeToGEP);
                                                    nvvm_function->setArgOperand(ii,dyn_cast<Value>(loadVectorType));
                                                    need_remove.insert(addrSpaceCastInstr);
                                                    need_remove.insert(allocaInstr);
                                                    nvvm_function->removeParamAttr(ii,Attribute::AttrKind::ByVal);

                                                    // getelementptr inbounds on it
                                                    // load vector base from vector type and replace it here

                                            } else if (allocaInstr->getAllocatedType()->getStructName().str().find("HIP")) {
                                                 Builder.SetInsertPoint(nvvm_function);  
                                                auto vectorTypeToGEP = Builder.CreateStructGEP(cvt->getFloat4Type(),addrSpaceCastInstr , 0 /*ArrayRef<Value *>(indices, 2)*/ ,"");
 
                                                auto loadVectorType = Builder.CreateLoad(cvt->getFloat4Base(), vectorTypeToGEP);
                                                nvvm_function->setArgOperand(ii,dyn_cast<Value>(loadVectorType));
                                                nvvm_function->removeParamAttr(ii,Attribute::AttrKind::ByVal);

                                              
                                            }

                                            }
                                        }

                                    } else {
                                        Builder.SetInsertPoint(nvvm_function);  

                                        auto vectorTypeToGEP = Builder.CreateStructGEP(cvt->getFloat4Type(), gotValue->second, 0 /*ArrayRef<Value *>(indices, 2)*/ ,"");
 
                                        auto loadVectorType = Builder.CreateLoad(cvt->getFloat4Base(), vectorTypeToGEP);
                                        nvvm_function->setArgOperand(ii,dyn_cast<Value>(loadVectorType));
                                        nvvm_function->removeParamAttr(ii,Attribute::AttrKind::ByVal);
                                        


                                        
                                    }

                                    nvvm_function->removeParamAttr(ii,Attribute::AttrKind::Alignment);
                                }

                            }
                            nvvm_function->setCallingConv(f->getCallingConv());

                            // if returnType was struct.float4
                            // then take out the arguments

                            if (returnType->isStructTy()) {
                                if (returnType->getStructName().str() == "struct.float4") {

                                    /*
                                        %9 = alloca %struct.HIP_vector_type, align 16, addrspace(5)
                                        %17 = addrspacecast ptr addrspace(5) %9 to ptr

                                        %44 = getelementptr inbounds %struct.HIP_vector_type, ptr %17, i32 0, i32 0
                                        %45 = extractvalue %struct.HIP_vector_type %43, 0
                                        store %struct.HIP_vector_base %45, ptr %44, align 16
                                    */
                                    Builder.SetInsertPoint(first_instr);     
                                    AllocaInst *newVector = Builder.CreateAlloca(cvt->getFloat4Type(), DL.getAllocaAddrSpace() , 0, "");
                                    auto *newVec = Builder.CreateAddrSpaceCast(newVector , I32Ptr); // int32ptr or int64ptr


                                    GetElementPtrInst* gep = dyn_cast<GetElementPtrInst>(nvvm_function->getNextNode());
                                    operand_map[gep->getOperand(0)] = newVec;
                                    Builder.SetInsertPoint(gep);
                                    // Value *i32zero = ConstantInt::get(context, APInt(32, 0));
                                    // Value *indices[2] = {i32zero, i32zero};
                                    auto vectorToBeExtract = Builder.CreateStructGEP(cvt->getFloat4Type(), newVec, 0 /*ArrayRef<Value *>(indices, 2)*/ ,"");

                                    gep->replaceAllUsesWith(vectorToBeExtract);

                                    ExtractValueInst* eei = dyn_cast<ExtractValueInst>(gep->getNextNode());
                                    // if (!eei) {
                                    //     printf("Null");
                                    // }
                                    // outs() << *eei << '\n';
                                    // // outs() << *(eei->getNextNode()) << '\n';
                                    // // StoreInst* store = dyn_cast<StoreInst>(eei->getNextNode());
                                    
                                    // // Builder.SetInsertPoint(eei);

                                    auto newEEV = Builder.CreateExtractValue(nvvm_function, ArrayRef<unsigned int>({0}), "");
                                    auto newStore = Builder.CreateStore(newEEV, vectorToBeExtract);

                                    
                                    /*
                                        Remove the getelementptr, extractvalue, store for each element of the struct

                                    */
                                    int ii = 0;
                                    auto prev = dyn_cast<Instruction>(gep);
                                    auto StructTy = dyn_cast<StructType>(returnType);
                
                                    int numElementsVector = StructTy->getNumElements();
                                    for(ii = 0; ii < numElementsVector*3; ++ii) {
                                        need_remove.insert(prev);
                                        
                                        outs() << *prev << " need remove " << "\n";
                                        prev = prev->getNextNode();
                                        if (!prev) break;

                                    }


                                    outs() << " prev " << *prev << '\n';
                                    if (auto *memcpyFn = dyn_cast<CallInst>(prev)) {
                                        auto callFnName = memcpyFn->getCalledFunction()->getName();
                                        outs() << " hhhhh \n";
                                        if (callFnName == "llvm.memcpy.p0.p0.i64") {
                                            if (memcpyFn->getArgOperand(1) == gep->getOperand(0)) {
                                                outs() << " hhhhh \n";

                                               

                                                if (gep->getSourceElementType()->isStructTy()
                                                && gep->getSourceElementType()->getStructName().str() == "struct.float4") {
                                                    outs() << " hhhhh \n";
                                                    llvm::Value* first_operand = memcpyFn->getArgOperand(0);

                                                    
                                                std::unordered_map<Value*,Value*>::iterator gotValue = operand_map.find(memcpyFn->getArgOperand(0));
                                                if ( gotValue == operand_map.end() ) {
                                                    if (auto addrSpaceCastInstr = dyn_cast<AddrSpaceCastInst>(first_operand)) {
                                                        if (auto allocaInstr = dyn_cast<AllocaInst>(addrSpaceCastInstr->getPointerOperand())) {
                                                            if (allocaInstr->getAllocatedType()->isStructTy()) {
                                                            if (allocaInstr->getAllocatedType()->getStructName().str() == "struct.float4") {
                                                                    Builder.SetInsertPoint(addrSpaceCastInstr);
                                                                    AllocaInst *newVector = Builder.CreateAlloca(cvt->getFloat4Type(), DL.getAllocaAddrSpace() , 0, "");
                                                                    auto *newVec = Builder.CreateAddrSpaceCast(newVector , I32Ptr); // int32ptr or int64ptr
                                                                    operand_map[first_operand] = newVec;
                                                                    // replace all uses       
                                                                    memcpyFn->setArgOperand(0, newVec);                                                     
                                                                    need_remove.insert(addrSpaceCastInstr);
                                                                    need_remove.insert(allocaInstr);

                                                            }

                                                            }
                                                        }
                                                        
                                                    }
                                                } else {
                                                    memcpyFn->setArgOperand(0, gotValue->second);                                                     
                                                }

                                                    Builder.SetInsertPoint(prev);

                                                    FunctionCallee LLVMnewFunFC = M.getOrInsertFunction("_ZN15HIP_vector_typeIfLj4EEaSERKS0_", LLVMFloat4VectorType);
                                                    Function* LLVMnewFunFn = dyn_cast<Function>(LLVMnewFunFC.getCallee());
                                                    // TODO: get dereferenceable from data layout type size DL.getTypeStoreSize(newGEP->getType())
                                                    LLVMnewFunFn->addDereferenceableParamAttr(0,16);
                                                    LLVMnewFunFn->addDereferenceableParamAttr(1,16);
                                                    LLVMnewFunFn->addRetAttr(Attribute::getWithDereferenceableBytes(context, 16));
                                                    SmallVector<Value *, 2> texArgs;

                                                
                                                    texArgs.push_back(memcpyFn->getArgOperand(0));
                                                    texArgs.push_back(newVec);
                                                    auto vectorTypeCall = Builder.CreateCall(LLVMnewFunFn, texArgs);
                                                    vectorTypeCall->addDereferenceableParamAttr(0,16);
                                                    vectorTypeCall->addDereferenceableParamAttr(1,16);
                                                    vectorTypeCall->addRetAttr(Attribute::getWithDereferenceableBytes(context, 16));
                                                
                                                    memcpyFn->replaceAllUsesWith(vectorTypeCall);
                                                    need_remove.insert(memcpyFn);
                                                
                                                }
                                                
                                            }

                                            
                                        }
                                    }
                                }
                            }
                             


                            
                            

                            // if (fType != callFType) {
                            //     outs() << "not equal\n";
                            // } else {
                            //     outs() << "not 2equal\n";
                            //     outs() << F << '\n';
                            //     outs() << *nvvm_function << '\n';
                            //     outs() << *nvvm_function->getArgOperand(0)<< '\n';
                            //     outs() << *fType << " " << *nvvm_function->getArgOperand(0)->getType() << " " <<  *nvvm_function->getType() <<  '\n';
                            // }
                            // outs() << F << '\n';
                            // std::exit(14);



                        } 
                    } else if (auto *getelementptr = dyn_cast<GetElementPtrInst>(BI)) {

                            /*
                            
                            Translate the getelementptr of %struct.float4

                            %57 = load ptr, ptr %16, align 8
                            %58 = load i64, ptr %14, align 8
                            %59 = getelementptr inbounds %struct.float4, ptr %57, i64 %58
                            call void @llvm.memcpy.p0.p0.i64(ptr align 16 %59, ptr align 16 %18, i64 16, i1 false)

                            */
                        
                       
                        //  outs() << getelementptr->getSourceElementType()->getStructName()<< '\n';
                        //  outs() << getelementptr->getOperand(0)->getType()->getStructName().str()<< '\n';
                        outs() << " getelementptr here " << '\n';
                        if (need_remove.find(getelementptr) != need_remove.end()) continue;
                        
                        outs() <<" abc " <<  '\n';
                        outs() << *getelementptr << '\n';
                        outs() <<" abc " <<  '\n';

                        if (getelementptr->getSourceElementType()->isStructTy()) {
                        if (auto StructTy = dyn_cast<StructType>(getelementptr->getSourceElementType())) {
                        if( getelementptr->getSourceElementType()->getStructName().str() == "struct.float4") {
                            outs() << " 888888 " << '\n';
                            // if the next instruction is llvm.memcpy
                            outs() << *getelementptr->getNextNode() << '\n'; 
                            if (auto *memcpyFn = dyn_cast<CallInst>(getelementptr->getNextNode())) {
                            auto callFnName = memcpyFn->getCalledFunction()->getName();

                            if (callFnName == "llvm.memcpy.p0.p0.i64") {
                                Builder.SetInsertPoint(getelementptr);
                                auto newGEP = Builder.CreateGEP(cvt->getFloat4Type(), getelementptr->getOperand(0), ArrayRef<Value *>({getelementptr->getOperand(1)}) ,"", true);
                                getelementptr->replaceAllUsesWith(newGEP);
                                need_remove.insert(getelementptr);
                                
                                // replace memcpy with _ZN15HIP_vector_typeIfLj4EEaSERKS0_

                                // llvmI8PtrTy 
                                // some HIP IR uses bottom of these
                                // _ZN15HIP_vector_typeIfLj4EEaSEOS0_ 
                                // _ZN15HIP_vector_typeIfLj4EEaSERKS0_
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
                                    outs() << F << '\n';
                                    // exit(1);
                                } else {
                                texArgs.push_back(newGEP);
                                texArgs.push_back(gotValue->second);
                                auto vectorTypeCall = Builder.CreateCall(LLVMnewFunFn, texArgs);
                                vectorTypeCall->addDereferenceableParamAttr(0,16);
                                vectorTypeCall->addDereferenceableParamAttr(1,16);
                                vectorTypeCall->addRetAttr(Attribute::getWithDereferenceableBytes(context, 16));

                                memcpyFn->replaceAllUsesWith(vectorTypeCall);
                                need_remove.insert(memcpyFn);

                                }
                                
                            } 
                        } else if(getelementptr->getNumIndices() == 1) {
                                // where the argument casted to pointer is the source element of getelementptr
                                //  %111 = getelementptr inbounds %struct.float4, ptr %108, i64 %110
                                //  %116 = getelementptr inbounds %struct.HIP_vector_type, ptr %113, i64 %115
                                getelementptr->setSourceElementType(cvt->getFloat4Type());
                                getelementptr->setResultElementType(cvt->getFloat4Type());
                               

                        } else {
                                Builder.SetInsertPoint(getelementptr);
                                Value *operand_zero = dyn_cast<Value>(getelementptr->getOperand(0));
                                std::unordered_map<Value*,Value*>::iterator gotValue = operand_map.find(operand_zero);
                                if ( gotValue == operand_map.end() ) {
                                    outs() << " Unknown Case 1025 " << '\n';
                                    std::exit(1035);
                                }
                                
                                auto newGep = Builder.CreateStructGEP(cvt->getFloat4Base(), gotValue->second , 0  ,"");
               
                                getElementPtrBefore.insert(getelementptr->getOperand(0));
              
                                llvm::ConstantInt* CI = dyn_cast<llvm::ConstantInt>(getelementptr->getOperand(2));
                                unsigned int secondIndex = CI->getZExtValue();
                                auto newGepUnion = Builder.CreateStructGEP(cvt->getFloat4Struct(), newGep ,secondIndex ,"");
                                getelementptr->replaceAllUsesWith(newGepUnion);
                        
                                need_remove.insert(getelementptr);
                                // outs() << F << " \n";
                                // outs() << " More \n";
                                // std::exit(11);
                        }

                        /*
                            if getelementptr is 0 and 0 ( 2 numbers)
                            %284 = getelementptr inbounds %struct.HIP_vector_type, ptr %75, i32 0, i32 0

                            //  %265 = getelementptr inbounds %struct.HIP_vector_base, ptr %66, i32 0, i32 0
                            // %266 = getelementptr inbounds %struct.anon, ptr %265, i32 0, i32 0
                            // next instruction is load the float
                        */

                        }
                        }
                        }

                        outs() << " out ptr " << '\n';

                        


                    }
                    }
                }


                
               

                // remove 
                 for ( const auto &addrInstr : operand_map ) {
                     if (auto addrSpaceCastInstr = dyn_cast<AddrSpaceCastInst>(addrInstr.first)) {
                        if (auto allocaInstr = dyn_cast<AllocaInst>(addrSpaceCastInstr->getPointerOperand())) {
                            if (allocaInstr->getAllocatedType()->isStructTy()) {
                            if (allocaInstr->getAllocatedType()->getStructName().str() == "struct.float4") {
                                   
                                    
                                    need_remove.insert(addrSpaceCastInstr);
                                    need_remove.insert(allocaInstr);

                            }

                            }
                        }
                        
                    }

                }
                for(auto remove: need_remove) {
                    remove->dropAllReferences();
                    remove->eraseFromParent();
                }
                need_remove.clear();

                // outs() << F << '\n';
                // std::exit(122);

            }
        }
    }
    
   


    // for (auto &inst : instructions(F)) {
    //     if (auto *callInst = dyn_cast<CallInst>(&inst)) {
    //         auto *instCalledFn = callInst->getCalledFunction();
    //         if (instCalledFn) {
    //             auto calledFnName = instCalledFn->getName();
    //             auto demangledFnName = demangle(std::string(calledFnName));
    //             fprintf(stdout, "Fn name %s demangled to %s\n",
    //                     calledFnName.data(), demangledFnName.data());
    //         }
    //     }
    // }


   

    return true;
}

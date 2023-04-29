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
        Type* I8 = IntegerType::get(context, 8); // 32 bits integer


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

        // _ZN15HIP_vector_typeIjLj4EEaSEOS0_
        std::vector<Type *> int4VectorTypeParams;
        int4VectorTypeParams.push_back(llvmI8PtrTy);
        int4VectorTypeParams.push_back(llvmI8PtrTy);
        llvm::FunctionType *LLVMInt4VectorType = FunctionType::get(llvmI8PtrTy,
                int4VectorTypeParams, false);

        std::vector<Type *> int2VectorTypeParams;
        int2VectorTypeParams.push_back(llvmI8PtrTy);
        int2VectorTypeParams.push_back(llvmI8PtrTy);
        llvm::FunctionType *LLVMInt2VectorType = FunctionType::get(llvmI8PtrTy,
                int2VectorTypeParams, false);



        // tex2d uint4
        // _ZL5tex2DI15HIP_vector_typeIjLj4EEL18hipTextureReadMode0EEN13__hip_tex_retIT_XT0_EbE4typeE7textureIS4_Li2EXT0_EEff
        std::vector<Type *> uint4VectorTypeParams;
        uint4VectorTypeParams.push_back(textureReference);
        uint4VectorTypeParams.push_back(floatType);
        uint4VectorTypeParams.push_back(floatType);
        // struct.HIP_vector_type.3
        llvm::FunctionType *LLVMUint4VectorType = FunctionType::get(cvt->getI32_4Type(),
                uint4VectorTypeParams, false);


        // _ZL9make_int2ii
        std::vector<Type *> makeint2Params;
        makeint2Params.push_back(I32);
        makeint2Params.push_back(I32);
        llvm::FunctionType *LLVMint2make = FunctionType::get(ArrayType::get(I32, 2),
                makeint2Params, false);


        std::vector<Type *> makeuchar3Params;
        makeuchar3Params.push_back(I8);
        makeuchar3Params.push_back(I8);
        makeuchar3Params.push_back(I8);
        llvm::FunctionType *LLVMuchar3make = FunctionType::get(I32,
                makeuchar3Params, false);

        llvm::IRBuilder<> Builder(M.getContext());

        std::unordered_map<std::string, FunctionType *> makeVectorFnNames = {
            {"_ZL9make_int2ii", LLVMint2make},
            {"_ZL11make_uchar3hhh", LLVMuchar3make},
        };
       

        for( const std::pair<const std::string, FunctionType *>& n : makeVectorFnNames ) {

            
            Function *makeVec = M.getFunction(n.first);
            FunctionCallee LLVMnewFunFC = M.getOrInsertFunction("_Z_temp_make_vector", n.second);
            Function* LLVMnewFunFn = dyn_cast<Function>(LLVMnewFunFC.getCallee());
                    
            for (User *U : makeVec->users()) {
                if (Instruction *Inst = dyn_cast<Instruction>(U)) {
                    errs() << "F is used in instruction:\n";
                    errs() << *Inst << "\n";

                    auto *callFn = dyn_cast<CallInst>(Inst);
                    Builder.SetInsertPoint(callFn);
                    
                    // get number of operands: ->
                    unsigned int argSize = callFn->arg_size();


                    std::vector<Value*> texArgs;
                    // SmallVector<Value *, argSize> texArgs;
                    for (int ii = 0; ii < argSize; ++ii) {
                        texArgs.push_back(callFn->getArgOperand(ii));
                    }
                    

                    // texArgs.push_back(callFn->getArgOperand(0));
                    // texArgs.push_back(callFn->getArgOperand(1));
                    Value* makeIntCall = Builder.CreateCall(LLVMnewFunFn, texArgs);
                    callFn->replaceAllUsesWith(makeIntCall);
                    callFn->dropAllReferences();
                    callFn->eraseFromParent();
                    makeVec->deleteBody();
                    makeVec->dropAllReferences();
                    makeVec->eraseFromParent();
                    
                    // removeMakeVectorFn.insert(makeIntCall);



                    // change the extractvalue to extractelement

                    // %30 = call [2 x i32] @_ZL9make_int2ii(i32 %28, i32 %29)
                    // %31 = getelementptr inbounds %struct.HIP_vector_base_int.2, ptr %20, i32 0, i32 0
                    // %32 = getelementptr inbounds %struct.i32_2.anon, ptr %31, i32 0, i32 0
                    // %33 = extractvalue [2 x i32] %30, 0
                    // store i32 %33, ptr %32, align 8

                    // getNextNode()
                    // outs() << *makeIntCall->getType() << '\n';
                    // if(makeIntCall->getType()->isArrayTy()) {
                    //     outs() << "is vector type type\n";
                    // }
                    // outs() << cast<VectorType>(makeIntCall->getType())->getElementCount() << " weher\n";





                }
            }
            LLVMnewFunFn->setName(n.first);


        }

        
       
        

        
        // extractvalue don't work with vector types, have to use extract element 

        // for(auto remove: removeMakeVectorFn) {
        //     remove->deleteBody();
        //     remove->dropAllReferences();
        //     remove->eraseFromParent();
        // }
        // removeMakeVectorFn.clear();

        // drop the functions

        // if(makeInt) {
        //     outs() << "here \n";
        //     FunctionCallee LLVMnewFunFC = M.getOrInsertFunction("CUPBOP_temp_makeint", LLVMint2make);
        //     Function* LLVMnewFunFn = dyn_cast<Function>(LLVMnewFunFC.getCallee());
        //     makeInt->replaceAllUsesWith(LLVMnewFunFn);
        //     LLVMnewFunFn->takeName(makeInt);
        //     makeInt->deleteBody();
        //     makeInt->dropAllReferences();
        //     makeInt->eraseFromParent();

        // }


        // vector types

        const DataLayout &DL = M.getDataLayout();
        int count = 0;
        // check if the functionis cuda buildin, if so continue
        for (auto &F : M) {
            // check if the function is device function 
            // check if the function uses vector types 
            std::unordered_map<std::string, FunctionType *>::iterator isVectorFnName = makeVectorFnNames.find(F.getName().str());
            if ( (F.getCallingConv() == CallingConv::AMDGPU_KERNEL || !isCudaBuiltin(F.getName().str())))
             {
                if ((isVectorFnName != makeVectorFnNames.end())) {
                    continue;
                }

                

                // if function has texture annotations:
                std::unordered_map<Value*, Value*> operand_map;

                std::cout << "Texture Transform: Function: " << F.getName().str() << std::endl;

                // if (F.getName().str() != "_Z10set_resultjP11_MatchCoordiiii") continue;
                // outs() << F << '\n';

                Function::iterator I = F.begin();
                BasicBlock::iterator firstBB = I->getFirstInsertionPt();
                auto *first_instr = dyn_cast<Instruction>(firstBB);
                // outs() << " First " << *first_instr << " \n";
                std::set<Value*> getElementPtrBefore;

                for (Function::iterator E = F.end(); I != E; ++I) {
                    Value* textureToBeLoaded;
                    for (BasicBlock::iterator BI = I->begin(); BI != I->end(); BI++) {
                        outs() << *BI << " I " << '\n';
                        count += 1;
                        // if (count > 233)  {
                        //     // outs() << F << '\n';
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


                            // this case is used when after a return of a value vector type which requires
                            // unique hip function or way to copy the value back into the stack or aggregate type
                            // this condition is check, CUDA uses memcpy to copy vector types back to the stack variable



                            
                            if (need_remove.find(nvvm_function) != need_remove.end()) continue;
                            outs() << " 999 " << '\n';

                            /*
                                hybridsort end case

                            */
                            llvm::Value* one_operand = nvvm_function->getArgOperand(1);
                            llvm::Value* zero_operand = nvvm_function->getArgOperand(0);
                             GetElementPtrInst* getPtr = dyn_cast<GetElementPtrInst>(zero_operand);
                            if (getElementPtrBefore.find(one_operand) != getElementPtrBefore.end()) {
                                std::unordered_map<Value*,Value*>::iterator gotValue = operand_map.find(zero_operand);
                                std::unordered_map<Value*,Value*>::iterator gotValue2 = operand_map.find(one_operand);

                                if ( gotValue == operand_map.end() || gotValue2 == operand_map.end() ) {  
                                    outs() << " Unknown Case " << '\n';
                                    // std::exit(10);

                                    // mummergpu case which a struct value is copy to a stack value and passed into a function

                                    /*
                                    
                                    193:                                              ; preds = %182, %179, %176, %173, %170
                                        call void @llvm.memcpy.p0.p0.i64(ptr align 1 %57, ptr align 1 %53, i64 3, i1 false)
                                        call void @_Z14arrayToAddress6uchar3Rj(ptr noundef byval(%struct.uchar3) align 1 %57, ptr noundef nonnull align 4 dereferenceable(4) %29) #8
                                        br label %194
                                    
                                        check if the first operand is a parameter of the call instruction next 
                                        check if the next is a call instruction 
                                        check if the parameter is byval uchar3 type
                                    
                                    */

                                    Instruction* nextInstr = nvvm_function->getNextNode();
                                    if (auto *callInstr = dyn_cast<CallInst>(nextInstr)) {
                                        // first operand 
                                        outs() << callInstr << " uio \n";
                                        if (zero_operand == callInstr->getArgOperand(0)) {


                                            outs() << "there " << "\n";
                                            
                                        }
                                         std::exit(123);

                                    } else if (getPtr) {

                                       
                                        
                                        if (gotValue2 != operand_map.end()) {
                                            // outs() << F << '\n';
                                          
                                        
                                             if (auto addrSpaceCastInstr = dyn_cast<AddrSpaceCastInst>(one_operand)) {
                                              if (auto allocaInstr = dyn_cast<AllocaInst>(addrSpaceCastInstr->getPointerOperand())) {
                                                if (allocaInstr->getAllocatedType()->isStructTy()) {
                                                    if (allocaInstr->getAllocatedType()->getStructName().str() == "struct.int2"
                                                    
                                                    || allocaInstr->getAllocatedType()->getStructName().str() == "struct.HIP_vector_type_int.2") {

                                                        // outs() << "hey\n";
                                                        // std::exit(1);
                                                        nvvm_function->setArgOperand(1, gotValue2->second);
                                                        Builder.SetInsertPoint(nvvm_function);

                                                        FunctionCallee LLVMnewFunFC = M.getOrInsertFunction("_ZN15HIP_vector_typeIiLj2EEaSEOS0_", LLVMInt2VectorType);
                                                        Function* LLVMnewFunFn = dyn_cast<Function>(LLVMnewFunFC.getCallee());
                                                        SmallVector<Value *, 2> texArgs;
                                                        texArgs.push_back(nvvm_function->getArgOperand(0));
                                                        texArgs.push_back(nvvm_function->getArgOperand(1));
                                                        auto vectorTypeCall = Builder.CreateCall(LLVMnewFunFn, texArgs);
                                                        vectorTypeCall->addDereferenceableParamAttr(0,8);
                                                        vectorTypeCall->addDereferenceableParamAttr(1,8);
                                                        vectorTypeCall->addRetAttr(Attribute::getWithDereferenceableBytes(context, 8));
                                                        nvvm_function->replaceAllUsesWith(vectorTypeCall);
                                                        need_remove.insert(nvvm_function);
                                                    }
                                                }
                                                }
                                             }

                                        }
                                        
                                        // _ZN15HIP_vector_typeIiLj2EEaSEOS0_

                                     
                                        // outs() << F << '\n';
                                        //  std::exit(123);


                                    }

                                   

                                    






                                }
                                
                                
                                
                                 
                                 
                                 
                                 else {
                                    outs() << "Memcpy Case As Vector Float" << '\n';

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
                                
                                
                                // else {


                                //     outs() << "Memcpy Case Not Accounted With First Operand" << '\n';
                                // }



                            } else {

                                outs() << "Memcpy Case Not Accounted " << '\n';


                                // %68 = alloca %struct.uchar3, align 1, addrspace(5)
                                // %69 = addrspacecast ptr addrspace(5) %68 to ptr

                                // %183 = getelementptr inbounds %struct._PixelOfChildren, ptr %65, i32 0, i32 0
                                // %184 = getelementptr inbounds %struct.anon.4, ptr %183, i32 0, i32 0

                                // call void @llvm.memcpy.p0.p0.i64(ptr align 1 %69, ptr align 16 %184, i64 3, i1 false)

                                // if copied operand is vector type, do an allocation of it 

                                std::unordered_map<Value*,Value*>::iterator gotValue = operand_map.find(zero_operand);
                                std::unordered_map<Value*,Value*>::iterator gotValue2 = operand_map.find(one_operand);

                                GetElementPtrInst* getPtr = dyn_cast<GetElementPtrInst>(one_operand);
                                if (gotValue != operand_map.end() && gotValue2 != operand_map.end()) {
                                      nvvm_function->setArgOperand(0, gotValue->second);
                                      nvvm_function->setArgOperand(1, gotValue2->second);


                                } else if (gotValue != operand_map.end() 
                                 && (getPtr)) {
                                   
                                    nvvm_function->setArgOperand(0, gotValue->second);
                                } 
                                // else if (gotValue == operand_map.end()) {

                                //     outs() << "theeee\n";
                                //     outs() << *nvvm_function << '\n';
                                //     outs() << "theeee\n";

                                //     // std::exit(21212);



                                
                                //  if (auto addrSpaceCastInstr = dyn_cast<AddrSpaceCastInst>(zero_operand)) {
                                //     if (auto allocaInstr = dyn_cast<AllocaInst>(addrSpaceCastInstr->getPointerOperand())) {
                                //         if (allocaInstr->getAllocatedType()->isStructTy()) {
                                //             if (allocaInstr->getAllocatedType()->getStructName().str() == "struct.uchar3") {

                                //                 // do allocation of the vector type
                                //                 // replace it here 
                                //                Builder.SetInsertPoint(addrSpaceCastInstr);
                                //                 AllocaInst *newVector = Builder.CreateAlloca(cvt->getI8_3Type(), DL.getAllocaAddrSpace() , 0, "");
                                //                 auto *newVec = Builder.CreateAddrSpaceCast(newVector , I32Ptr); // int32ptr or int64ptr
                                //                 operand_map[zero_operand] = newVec;
                                //                 nvvm_function->setArgOperand(0, newVec);

                                //                 // replace all uses
                                //                 // addrSpaceCastInstr->replaceAllUsesWith(newVec);
                                                
                                //                 need_remove.insert(addrSpaceCastInstr);
                                //                 need_remove.insert(allocaInstr);


                                //             }
                                //         }
                                //     }
                                //     } 

                                // } else {

                                //     // outs() << F << '\n';
                                //     // outs() << "332323\n";
                                //     // std::exit(2222);

                                // }

                                if (gotValue2 != operand_map.end()) {
                                    
                                    nvvm_function->setArgOperand(1, gotValue2->second);

                                }



                            }

                            // mummergpu case
                            //   call void @llvm.memcpy.p0.p0.i64(ptr align 8 %29, ptr align 8 %13, i64 8, i1 false)


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
                            
                        } 
                        // else if (func_name == "_ZL9make_int2ii") {

                        // // %23 = call %struct.int2 @_ZL9make_int2ii(i32 noundef %21, i32 noundef %22) #7
                        // // %24 = getelementptr inbounds %struct.int2, ptr %13, i32 0, i32 0
                        // // %25 = extractvalue %struct.int2 %23, 0
                        // // store i32 %25, ptr %24, align 8
                        // // %26 = getelementptr inbounds %struct.int2, ptr %13, i32 0, i32 1
                        // // %27 = extractvalue %struct.int2 %23, 1
                        // // store i32 %27, ptr %26, align 4


                        
                        
                        // }
                        
                        
                         else if (func_name == "_ZL5tex2DIiEN17__nv_tex_rmet_retIT_E4typeE7textureIS1_Li2EL19cudaTextureReadMode0EEff") {
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

                        } 
                        else if ( func_name =="_ZL5tex2DI5uint4EN17__nv_tex_rmet_retIT_E4typeE7textureIS2_Li2EL19cudaTextureReadMode0EEff") {
                            
                            // tex2dfetch uint4, 2, readmode
                            outs() << " fetch here 2222" << '\n';

                            // outs() << F << '\n';

                            // count the vector type 
                            outs() << *nvvm_function << '\n';
                            Type* t = nvvm_function->getCalledFunction()->getReturnType();
                            outs() << *t << '\n';
                            
                            auto StructTy = dyn_cast<StructType>(t);
                
                            int numElementsVector = StructTy->getNumElements();
                            // std::cout << numElementsVector << std::endl;
                            Type* vectorType = StructTy->getStructElementType(0);


                            LoadInst* loadTexture = dyn_cast<LoadInst>(nvvm_function->getPrevNode());
                            Builder.SetInsertPoint(loadTexture);
                            LoadInst* newLoadTexture = Builder.CreateLoad(textureReference, textureToBeLoaded);
                            loadTexture->replaceAllUsesWith(newLoadTexture);

                            outs() << *newLoadTexture <<  " \n";
                            need_remove.insert(nvvm_function->getPrevNode());

                            FunctionCallee LLVMnewFunFC = M.getOrInsertFunction("_ZL5tex2DI15HIP_vector_typeIjLj4EEL18hipTextureReadMode0EEN13__hip_tex_retIT_XT0_EbE4typeE7textureIS4_Li2EXT0_EEff", LLVMUint4VectorType);
                            Function* LLVMnewFunFn = dyn_cast<Function>(LLVMnewFunFC.getCallee());
                            Builder.SetInsertPoint(nvvm_function);
                            SmallVector<Value *, 3> texArgs;
                            outs() << *nvvm_function->getArgOperand(0) << '\n';
                            texArgs.push_back(nvvm_function->getArgOperand(0));
                            texArgs.push_back(nvvm_function->getArgOperand(1));
                            texArgs.push_back(nvvm_function->getArgOperand(2));
                            auto newTexCall = Builder.CreateCall(LLVMnewFunFn, texArgs);
                            nvvm_function->replaceAllUsesWith(newTexCall);

                            // get the next instructions which are 
                            // %45 = getelementptr inbounds %struct.float4, ptr %16, i32 0, i32 0
                            // %46 = ewextractvalue %struct.HIP_vector_type %43, 0

                            // if already have the allocated type // skip
                           
                            
                            GetElementPtrInst* gep = dyn_cast<GetElementPtrInst>(nvvm_function->getNextNode());
                            // outs() << *gep->getSourceElementType();
                            if (gep->getSourceElementType() != cvt->getI32_4Base()) {
                                Builder.SetInsertPoint(first_instr);     
                                AllocaInst *newVector = Builder.CreateAlloca(cvt->getI32_4Type(), DL.getAllocaAddrSpace() , 0, "");
                                auto *newVec = Builder.CreateAddrSpaceCast(newVector , I32Ptr); // int32ptr or int64ptr
                                operand_map[gep->getOperand(0)] = newVec;

                            } else {
                                operand_map[gep->getOperand(0)] = gep->getOperand(0);
                            }
                            
                           


                            Builder.SetInsertPoint(gep);
                            Value *i32zero = ConstantInt::get(context, APInt(32, 0));
                            Value *indices[2] = {i32zero, i32zero};
                            auto vectorToBeExtract = Builder.CreateStructGEP(cvt->getI32_4Type(), operand_map[gep->getOperand(0)], 0 /*ArrayRef<Value *>(indices, 2)*/ ,"");

                            gep->replaceAllUsesWith(vectorToBeExtract);
                          

                            auto newEEV = Builder.CreateExtractValue(newTexCall, ArrayRef<unsigned int>({0}), "");
                            auto newStore = Builder.CreateStore(newEEV, vectorToBeExtract);

                            // store->replaceAllUsesWith(newStore);



                            
                        
                            // outs() << F << '\n';
                            // std::exit(12);

                            need_remove.insert(nvvm_function);
                            /*
                                Remove the getelementptr, extractvalue, store for each element of the struct

                            */
                            int ii = 0;
                            auto prev = dyn_cast<Instruction>(gep);
                            // if processed by device arg pass then, 4 is required at times
                            for(ii = 0; ii < numElementsVector*4; ++ii) {
                                need_remove.insert(prev);
                                
                                outs() << *prev << " need remove " << "\n";
                                prev = prev->getNextNode();
                                if (!prev) break;

                            }

                            outs() << ii << '\n';




                            
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
                            
                            // outs() << ii << '\n';

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


                        } else if (func_name == "_ZL9make_int2ii") {


                            StructType *vecType = cvt->getI32_2Type();
                            StructType *vecBase = cvt->getI32_2Base();
                            StructType *vecUnion = cvt->getI32_2Union();


                            Builder.SetInsertPoint(first_instr);
                            AllocaInst *newAllocaVec = Builder.CreateAlloca(vecType, DL.getAllocaAddrSpace() , 0, "");
                            auto *newVec = Builder.CreateAddrSpaceCast(newAllocaVec , I32Ptr); // int32ptr or int64ptr

                            // operand_map[first_operand] = newVec; // need new vec into the new Operand
                            

                            auto gep = dyn_cast<GetElementPtrInst>(nvvm_function->getNextNode());


                            operand_map[gep->getOperand(0)] = newVec;

                            
                            Builder.SetInsertPoint(gep);


                            auto vectorTypeToGEP = Builder.CreateStructGEP(vecType, newVec, 0 /*ArrayRef<Value *>(indices, 2)*/ ,"");

                            auto vectorToUnion= Builder.CreateStructGEP(vecBase, vectorTypeToGEP, 0  ,"");

                            auto vectorToBase = Builder.CreateStructGEP(vecUnion, vectorToUnion, 0  ,"");
                            auto newStoreI32 = Builder.CreateStore(nvvm_function, vectorToBase);



                            Instruction* prev = gep;
                            getElementPtrBefore.insert(gep->getOperand(0));
                            while (auto getElementPtrNex = dyn_cast<GetElementPtrInst>(prev)) {
                              
                            
                                if (gep->getOperand(0) == getElementPtrNex->getOperand(0)) {
                                        
                                        outs() << "inside2 - " << getElementPtrNex->getNumUses() <<"\n";  
                                        if (prev->hasOneUser()) {
                                        for (User *U : prev->users()) {
                                            outs() << *U << " inside3\n"; 
                                            int numToRemove = 0;
                                            if (auto getElementPtrInst = dyn_cast<GetElementPtrInst>(U)) {
                                                numToRemove = 4;
                                            } else if (auto storeInst = dyn_cast<StoreInst>(U)) {
                                                numToRemove = 3;
                                            }
                                            for(int ii = 0; ii < numToRemove; ++ii) {
                                                need_remove.insert(prev);
                                                outs() << *prev << " need remove " << "\n";
                                                prev = prev->getNextNode();
                                            }
                                        }
                                        } else {
                                            break;
                                        }
                                        
                                        
                                    // std::exit(1111);
                                } else {
                                    break;
                                }
                                
                            } 
                        

                            // 
                            // outs() << F << '\n';

                            //

                            // 
                            // outs() <<  *prev << '\n';
                            // outs() << " hhhhh " << '\n';

                            // outs() << F << '\n';
                            // std::exit(1);



                        } else if (func_name == "_ZL11make_uchar3hhh") {
                            // make uchar's are special cases

                            outs() << F << '\n';
                            outs() << "make char\n";
                         

                            /*
                            %189 = getelementptr inbounds %struct.HIP_vector_base_i8.3, ptr %57, i32 0, i32 0
                            %190 = getelementptr inbounds %struct.i8_3.anon, ptr %189, i32 0, i32 0
                            %191 = extractvalue i32 %188, 0
                            store i8 %191, ptr %190, align 1


                            %207 = getelementptr inbounds %struct.HIP_vector_type, ptr %82, i32 0, i32 0
                            %208 = getelementptr inbounds %struct.HIP_vector_base, ptr %207, i32 0, i32 0
                            %209 = getelementptr inbounds %union.anon.1, ptr %208, i32 0, i32 0
                            %210 = getelementptr inbounds %"struct.HIP_vector_base<unsigned char, 3>::Native_vec_", ptr %209, i32 0, i32 0
                            store i32 %206, ptr %83, align 4
                            call void @llvm.memcpy.p0.p0.i64(ptr align 1 %210, ptr align 4 %83, i64 3, i1 false)
                            call void @llvm.memcpy.p0.p0.i64(ptr align 1 %81, ptr align 1 %82, i64 3, i1 false)
                            
                            81 hipvectortype
                            83 i32
                            82 hipvectortype

                            */
                            StructType* vecType = cvt->getI8_3Type();

                            StructType* vecBase = cvt->getI8_3Base();
                            StructType* vecStruct = cvt->getI8_3Struct();
                            StructType* vecUntion = cvt->getI8_3Union();
                            StructType* vecNative = cvt->getI8_3Native();
                             
                            // alloca i32 
                            Builder.SetInsertPoint(first_instr);
                            AllocaInst *newI32 = Builder.CreateAlloca(I32, DL.getAllocaAddrSpace() , 0, "");
                            auto *newVec = Builder.CreateAddrSpaceCast(newI32 , I32Ptr); // int32ptr or int64ptr

                            // operand_map[first_operand] = newVec; // need new vec into the new Operand
                            

                            auto gep = dyn_cast<GetElementPtrInst>(nvvm_function->getNextNode());
                            Builder.SetInsertPoint(gep);
                            Value * newVec1 = nullptr;
                            if (auto addrSpaceCastInstr = dyn_cast<AddrSpaceCastInst>(gep->getOperand(0))) {
                                if (auto allocaInstr = dyn_cast<AllocaInst>(addrSpaceCastInstr->getPointerOperand())) {
                                if (allocaInstr->getAllocatedType()->isStructTy()) {
                                    if (allocaInstr->getAllocatedType()->getStructName().str() == "struct.uchar3") {
                                            Builder.SetInsertPoint(addrSpaceCastInstr);
                                            AllocaInst *newVector = Builder.CreateAlloca(cvt->getI8_3Type(), DL.getAllocaAddrSpace() , 0, "");
                                            newVec1 = Builder.CreateAddrSpaceCast(newVector , I32Ptr); // int32ptr or int64ptr
                                            operand_map[gep->getOperand(0)] = newVec1;
                                            // replace all uses                                                           
                                            need_remove.insert(addrSpaceCastInstr);
                                            need_remove.insert(allocaInstr);
                                            outs() << "hereeee\n";

                                    }

                                }
                                }
                            }

                            outs() << "wwww\n";
                            if (newVec1 == nullptr) {
                                outs() << "nnnooo\n";
                            }
                             Builder.SetInsertPoint(gep);

                           
                            auto newGepType = Builder.CreateStructGEP(vecType, newVec1 ,0 ,"");
                            auto newGepBase = Builder.CreateStructGEP(vecBase, newGepType ,0 ,"");

                            auto newGepUnion = Builder.CreateStructGEP(vecUntion, newGepBase ,0 ,"");
                            auto newGepNative = Builder.CreateStructGEP(vecNative, newGepUnion ,0 ,"");
                            auto newStoreI32 = Builder.CreateStore(nvvm_function, newVec);


                            // can be rewritten in the future
                            FunctionCallee LLVMmemcpyFC = M.getOrInsertFunction("llvm.memcpy.p0.p0.i64", LLVMmemcpyType);
                            Function * LLVMmemcpyFn = dyn_cast<Function>(LLVMmemcpyFC.getCallee());
                                            
                            SmallVector<Value *, 4> memcpyArgs;
                            memcpyArgs.push_back(newGepNative);
                            // ptr align 8 addrspacecast (ptr addrspace(1) @tex to ptr)
                            memcpyArgs.push_back(newVec);
                            // i64 88
                            llvm::Constant *i64_val = llvm::ConstantInt::get(llvmI64Ty, 3/*value*/, false);
                            memcpyArgs.push_back(i64_val);
                            // i1 false 
                            llvm::Constant *ifalse_val = llvm::ConstantInt::get(llvmI1Ty, 0/*value*/, false);
                            memcpyArgs.push_back(ifalse_val);
                            
                            Builder.CreateCall(LLVMmemcpyFn, memcpyArgs);
                            Instruction* prev = gep;
                            while (auto getElementPtrNex = dyn_cast<GetElementPtrInst>(prev)) {
                              
                            
                                if (gep->getOperand(0) == getElementPtrNex->getOperand(0)) {
                                        
                                        outs() << "inside2 - " << getElementPtrNex->getNumUses() <<"\n";  
                                        if (prev->hasOneUser()) {
                                        for (User *U : prev->users()) {
                                            outs() << *U << " inside3\n"; 
                                            int numToRemove = 0;
                                            if (auto getElementPtrInst = dyn_cast<GetElementPtrInst>(U)) {
                                                numToRemove = 4;
                                            } else if (auto storeInst = dyn_cast<StoreInst>(U)) {
                                                numToRemove = 3;
                                            }
                                            for(int ii = 0; ii < numToRemove; ++ii) {
                                                need_remove.insert(prev);
                                                outs() << *prev << " need remove " << "\n";
                                                prev = prev->getNextNode();
                                            }
                                        }
                                        } else {
                                            break;
                                        }
                                        
                                        
                                    // std::exit(1111);
                                } else {
                                    break;
                                }
                                
                        } 
                        

                            // 
                            // outs() << F << '\n';

                            //

                            // 
                            outs() <<  *prev << '\n';
                            outs() << " hhhhh " << '\n';
                            if(auto *callPrev = dyn_cast<CallInst>(prev)) {
                                llvm::Value* zero_operand = callPrev->getArgOperand(0);
                                llvm::Value* one_operand = callPrev->getArgOperand(1);

                                std::unordered_map<Value*,Value*>::iterator gotValue = operand_map.find(zero_operand);
                                if (gotValue != operand_map.end()) {
                                    callPrev->setArgOperand(0, gotValue->second);
                                } else {
                                    outs() << "Unknown Case\n";
                                }
                                std::unordered_map<Value*,Value*>::iterator gotValue1 = operand_map.find(one_operand);
                                if (gotValue1 != operand_map.end()) {
                                    callPrev->setArgOperand(1, gotValue1->second);
                                } else {
                                    outs() << "Unknown Case\n";
                                }

                                outs() <<  *callPrev << '\n';

                            }
                           
                            // outs() << F << '\n';
                            // std::exit(11); 


                        }
                        
                        else  {

                            /*
                                For some reason replace function didn't work with the DeviceVectorArgPass
                                %55 = call %struct.float4 @_Z8sortElem6float4(ptr noundef byval(%struct.float4) align 16 %22) 
                            */

                            // called maybe a device function, need to map out all the possible device function that are internal somehow
                            if (isCudaBuiltin(func_name.str()) || func_name.str().find("HIP_") != std::string::npos 
                             || 
                            func_name.str().find("_ZL8__umul24jj") != std::string::npos)  {
                                continue;
                            }
                            
                            Function *f = M.getFunction(func_name);

                            outs() << f->getName() << " x" << '\n';

                          

                           
                            // outs() << F << '\n';

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
                            
                            outs() << *returnType << '\n';

                            //  static int ycount = 0;
                            // if (func_name == "_Z14arrayToAddress6uchar3Rj") {
                            //     ycount += 1;
                            //     if (ycount == 2) {
                            //         outs() << " 8898 \n";
                            //          outs() << F << '\n';
                            //         std::exit(1);
                            //     }
                              
                                
                            // }
                            for (int ii = nvvm_function->arg_size()-1; ii >= 0; --ii) {

                                outs() << " arg: " << ii << " " << *prevInstr << "\n";

                                 // if current arg operand is equal to the first arg operand of the llvm.memcpy instruction
                                 // then change the type of the arg operands()
                                  if (auto *memcpyFn = dyn_cast<CallInst>(prevInstr)) {
                                    auto callFnName = memcpyFn->getCalledFunction()->getName();
                                    outs() << "here 2 \n"; 

                                    if (callFnName == "llvm.memcpy.p0.p0.i64") {
                                        outs() << "here 3 \n"; 

                                            llvm::Value* first_operand = memcpyFn->getArgOperand(0);
                                            outs() << *memcpyFn->getArgOperand(0) << '\n';

                                            std::unordered_map<Value*,Value*>::iterator gotValue = operand_map.find(nvvm_function->getArgOperand(ii));
                                            Value* newVec = nullptr;
                                            Type* typeName = nullptr;
                                            if (gotValue != operand_map.end()) {
                                                newVec = gotValue->second;
                                                if (auto addrSpaceCastInstr = dyn_cast<AddrSpaceCastInst>(newVec)) {
                                                     if (auto allocaInstr = dyn_cast<AllocaInst>(addrSpaceCastInstr->getPointerOperand())) {
                                                        if (allocaInstr->getAllocatedType()->isStructTy()) {
                                                            
                                                            typeName = allocaInstr->getAllocatedType();
                                                        }
                                                     }
                                                }
                                                

                                            } else if (first_operand != nvvm_function->getArgOperand(ii)) {
                                                continue;
                                            }

                                            if (auto addrSpaceCastInstr = dyn_cast<AddrSpaceCastInst>(first_operand)) {
                                                outs() << " h 4\n";
                                                if (auto allocaInstr = dyn_cast<AllocaInst>(addrSpaceCastInstr->getPointerOperand())) {
                                                    outs() << " h 5\n";
                                                    if (allocaInstr->getAllocatedType()->isStructTy()) {
                                                        outs() << " h 6\n";
                                                    outs() << *allocaInstr << '\n';
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

                                                    } else if( typeName &&
                                                        typeName->getStructName().str() == "struct.HIP_vector_type_i8.3" ||
                                                    allocaInstr->getAllocatedType()->getStructName().str() == "struct.uchar3"  ) {
                                                        // 
                                                        outs() << "h43 \n";

                                                        Builder.SetInsertPoint(first_instr);

                                                        if (newVec == nullptr) {
                                                            AllocaInst *newVector = Builder.CreateAlloca(cvt->getI8_3Type(), DL.getAllocaAddrSpace() , 0, "");
                                                            newVec = Builder.CreateAddrSpaceCast(newVector , I32Ptr); // int32ptr or int64ptr
                                                            operand_map[first_operand] = newVec;
                                                            memcpyFn->setArgOperand(0, newVec);                                                     

                                                        } else {
                                                            outs() << "h4322 \n";

                                                        }
                                                        outs() << "h43 \n";

                                                        
                                                        AllocaInst *newInt = Builder.CreateAlloca(I32, DL.getAllocaAddrSpace() , 0, "");
                                                        auto *newI32Cast = Builder.CreateAddrSpaceCast(newInt , I32Ptr); // int32ptr or int64ptr

                                                        outs() << "h43 \n";
              
                                                        
                                                        Builder.SetInsertPoint(nvvm_function);

                                                        StructType* vecType = cvt->getI8_3Type();
                                                        StructType* vecBase = cvt->getI8_3Base();
                                                        StructType* vecUnion = cvt->getI8_3Union();
                                                        StructType* vecNative = cvt->getI8_3Native();

                                                        auto vectorTypeToGEP = Builder.CreateStructGEP(vecType, newVec, 0 /*ArrayRef<Value *>(indices, 2)*/ ,"");
                                                        auto vectorToUnion= Builder.CreateStructGEP(vecBase, vectorTypeToGEP, 0  ,"");
                                                        auto vectorToBase = Builder.CreateStructGEP(vecUnion, vectorToUnion, 0  ,"");
                                                        auto vectorToBeStore = Builder.CreateStructGEP(vecNative, vectorToBase, 0  ,"");


                                                        FunctionCallee LLVMmemcpyFC = M.getOrInsertFunction("llvm.memcpy.p0.p0.i64", LLVMmemcpyType);
                                                        Function * LLVMmemcpyFn = dyn_cast<Function>(LLVMmemcpyFC.getCallee());
                                                                        
                                                        SmallVector<Value *, 4> memcpyArgs;
                                                        memcpyArgs.push_back(newI32Cast);
                                                        memcpyArgs.push_back(vectorToBeStore);
                                                        // ptr align 8 addrspacecast (ptr addrspace(1) @tex to ptr)
                                                       
                                                        // i64 88
                                                        llvm::Constant *i64_val = llvm::ConstantInt::get(llvmI64Ty, 3/*value*/, false);
                                                        memcpyArgs.push_back(i64_val);
                                                        // i1 false 
                                                        llvm::Constant *ifalse_val = llvm::ConstantInt::get(llvmI1Ty, 0/*value*/, false);
                                                        memcpyArgs.push_back(ifalse_val);
                                                        
                                                        Builder.CreateCall(LLVMmemcpyFn, memcpyArgs);

                                                        // create load instruction 

                                                        auto loadVectorType = Builder.CreateLoad(I32, newI32Cast);
                                                        nvvm_function->setArgOperand(ii,dyn_cast<Value>(loadVectorType));
                                                        // need_remove.insert(addrSpaceCastInstr);
                                                        // need_remove.insert(allocaInstr);
                                                        nvvm_function->removeParamAttr(ii,Attribute::AttrKind::ByVal);
                                                        nvvm_function->removeParamAttr(ii,Attribute::AttrKind::Alignment);



                                                        prevInstr = prevInstr->getPrevNode();
                                                        continue;
                                                        // outs() << F << '\n';

                                                        // std::exit(111);

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
                                                if (auto addrSpaceCastInstr = dyn_cast<AddrSpaceCastInst>(second_operand)) {
                                                    if (auto allocaInstr = dyn_cast<AllocaInst>(addrSpaceCastInstr)) {
                                                        outs() << "thereee\n";
                                                            if (allocaInstr->getAllocatedType()->isStructTy()) {
                                                                outs() << "thereee\n";
                                                                if (allocaInstr->getAllocatedType()->getStructName().str() == "struct.float4") {
                                                                    outs() << " Case Do Nothing \n";
                                                                } else if (allocaInstr->getAllocatedType()->getStructName().str() == "struct.HIP_vector_type_i8.3") {
                                                                    outs() << " Case Do Nothing \n";
                                                                }
                                                            }
                                                    }
                                                    
                                                } else {

                                                    /*
                                                    
                                                    %408 = getelementptr inbounds %struct._PixelOfNode, ptr %87, i32 0, i32 0
                                                    %409 = getelementptr inbounds %struct.anon.7, ptr %408, i32 0, i32 1
                                                    call void @llvm.memcpy.p0.p0.i64(ptr align 1 %91, ptr align 1 %409, i64 3, i1 false)

                                                    // second operand is just another operand that can be skipped, second operand is copied to the first operand 
                                                    in this case
                                                    
                                                    */
                                                 outs() << *second_operand << '\n'; 
                                                 outs() << " Unknown Case Second Operand of Memcpy 5555\n";
                                                //  outs() << F << "\n";
                                                //  std::exit(1);
                                                }
                                            
                                            } else {
                                                memcpyFn->setArgOperand(1, gotValue->second);
                                            }

                                            
                                           
                                        }
                                    }
                                  } else if (auto addrSpaceCastInstr = dyn_cast<AddrSpaceCastInst>(nvvm_function->getArgOperand(ii))) {

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

                                        // if () {

                                        //} else {
                                            Builder.SetInsertPoint(nvvm_function);  
                                            outs() << " heeeddeere \n";
                                            auto vectorTypeToGEP = Builder.CreateStructGEP(cvt->getFloat4Type(), gotValue->second, 0 /*ArrayRef<Value *>(indices, 2)*/ ,"");
    
                                            auto loadVectorType = Builder.CreateLoad(cvt->getFloat4Base(), vectorTypeToGEP);
                                            nvvm_function->setArgOperand(ii,dyn_cast<Value>(loadVectorType));
                                            nvvm_function->removeParamAttr(ii,Attribute::AttrKind::ByVal);

                                        //}
                                       
                                        


                                        
                                    }

                                    nvvm_function->removeParamAttr(ii,Attribute::AttrKind::Alignment);
                                }

                            }
                            nvvm_function->setCallingConv(f->getCallingConv());

                            // if returnType was struct.float4
                            // then take out the arguments
                            static int yycount = 0;
                            // if (func_name == "_Z14arrayToAddress6uchar3Rj") {
                            //     yycount += 1;
                            //     if (yycount == 2) {
                            //         outs() << " 8898 \n";
                            //          outs() << F << '\n';
                            //         std::exit(1);
                            //     }
                              
                                
                            // }

                            if (returnType->isStructTy()) {


                              
                          


                                StructType* vecType = nullptr;
                                FunctionCallee LLVMnewFunFC = NULL;
                                Function* LLVMnewFunFn = nullptr;
                                if (returnType->getStructName().str() == "struct.float4") {

                                    vecType = cvt->getFloat4Type();
                                    LLVMnewFunFC = M.getOrInsertFunction("_ZN15HIP_vector_typeIfLj4EEaSERKS0_", LLVMFloat4VectorType);
                                   
                                } else if (returnType->getStructName().str() == "struct.uint4") {
                                    outs() << "uint4 type \n";
                                    vecType = cvt->getI32_4Type();
                                    LLVMnewFunFC = M.getOrInsertFunction("_ZN15HIP_vector_typeIjLj4EEaSEOS0_", LLVMInt4VectorType);
                                } else if (returnType->getStructName().str() == "struct.uchar3" ) {
                                    vecType = cvt->getI8_3Type();
                                    LLVMnewFunFC = M.getOrInsertFunction("_ZN15HIP_vector_typeIjLj4EEaSEOS0_", LLVMInt4VectorType);

                                }

                               

                                if (vecType) {

                                    

                                    /*
                                        %9 = alloca %struct.HIP_vector_type, align 16, addrspace(5)
                                        %17 = addrspacecast ptr addrspace(5) %9 to ptr

                                        %44 = getelementptr inbounds %struct.HIP_vector_type, ptr %17, i32 0, i32 0
                                        %45 = extractvalue %struct.HIP_vector_type %43, 0
                                        store %struct.HIP_vector_base %45, ptr %44, align 16
                                    */
                                    Builder.SetInsertPoint(first_instr);     
                                    AllocaInst *newVector = Builder.CreateAlloca(vecType, DL.getAllocaAddrSpace() , 0, "");
                                    auto *newVec = Builder.CreateAddrSpaceCast(newVector , I32Ptr); // int32ptr or int64ptr


                                    GetElementPtrInst* gep = dyn_cast<GetElementPtrInst>(nvvm_function->getNextNode());
                                    operand_map[gep->getOperand(0)] = newVec;
                                    Builder.SetInsertPoint(gep);
                                    // Value *i32zero = ConstantInt::get(context, APInt(32, 0));
                                    // Value *indices[2] = {i32zero, i32zero};
                                    auto vectorToBeExtract = Builder.CreateStructGEP(vecType, newVec, 0 /*ArrayRef<Value *>(indices, 2)*/ ,"");

                                    //gep->replaceAllUsesWith(vectorToBeExtract);

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
                                    // hybridsort case for struct.float4
                                    
                                    int numCounts = 0;
                                    // outs() << F <<"\n";
                                    outs() << *prev << '\n';
                                    while (auto getElementPtrNex = dyn_cast<GetElementPtrInst>(prev)) {
                                            // should only be one uses:
                                            // getelementptr type is the same as as gep
                                            // maybe need better condition checking

                                            /*
                                                %158 = getelementptr inbounds %struct.HIP_vector_base_int.4, ptr %53, i32 0, i32 0
                                                %159 = getelementptr inbounds %struct.i32_4.anon, ptr %158, i32 0, i32 0
                                                %160 = extractvalue %struct.HIP_vector_type_int.4 %155, 0
                                                store i32 %160, ptr %159, align 16
                                            
                                            */
                                        
                                            if (gep->getOperand(0) == getElementPtrNex->getOperand(0)) {
                                                  
                                                  outs() << "inside2 - " << getElementPtrNex->getNumUses() <<"\n";  
                                                  if (prev->hasOneUser()) {
                                                   for (User *U : prev->users()) {
                                                        outs() << *U << " inside3\n"; 
                                                        int numToRemove = 0;
                                                        if (auto getElementPtrInst = dyn_cast<GetElementPtrInst>(U)) {
                                                           numToRemove = 4;
                                                        } else if (auto storeInst = dyn_cast<StoreInst>(U)) {
                                                           numToRemove = 3;
                                                        }
                                                        for(ii = 0; ii < numToRemove; ++ii) {
                                                            need_remove.insert(prev);
                                                            outs() << *prev << " need remove " << "\n";
                                                            prev = prev->getNextNode();
                                                        }
                                                    }
                                                  } else {
                                                    break;
                                                  }
                                                  
                                                    
                                                // std::exit(1111);
                                            } else {
                                                break;
                                            }
                                            
                                    } 
                                  
                                    
                                    // for(ii = 0; ii < numCounts*3; ++ii) {
                                    //     need_remove.insert(prev);
                                    //     // for (User *U : makeInt->users()) {
                                   
                                    //     outs() << *prev << " need remove " << "\n";
                                    //     prev = prev->getNextNode();
                                    //     if (!prev) break;

                                    // }

                                    // if (f->getName() == "_Z7getNodejb") {
                                    //     outs() << *nvvm_function << '\n';
                                    //     outs() << F << '\n';
                                    //     outs() << " hhhhhhhhhhhhhhhh \n";
                                    //     std::exit(33);
                                    // }

                                    outs() << F << '\n';
                                    outs() << " prev " << *prev << '\n';
                                      
                                 
                                    // next instruction maybe not be call instruction, but 
                                    // nested indexted to a specific aggregate type or non-aggregate type
                                    // %166 = getelementptr inbounds %struct._PixelOfChildren, ptr %49, i32 0, i32 0
                                    // call void @llvm.memcpy.p0.p0.i64(ptr align 16 %166, ptr align 16 %51, i64 16, i1 false)
                                    //
                                    //
                                    if(auto *getElementPtrNex = dyn_cast<GetElementPtrInst>(prev)) {
                                        auto nextInst = prev->getNextNode();
                                        outs() << "eeeeeeeeeee\n";
                                        if (nextInst) {
                                            outs() << "eeeeeeeeeee2\n";
                                             if (auto *memcpyFn = dyn_cast<CallInst>(nextInst)) {
                                                    auto callFnName = memcpyFn->getCalledFunction()->getName();
                                                    if (callFnName == "llvm.memcpy.p0.p0.i64") {
                                                        if (memcpyFn->getArgOperand(1) == gep->getOperand(0)) {
                                                                outs() << "hereee\n";
                                                                prev = prev->getNextNode();
                                                        }

                                                    }

                                            
                                             }
                                        }
                                        
                                    }


                                    outs() << " prev " << *prev << '\n';
                                    if (auto *memcpyFn = dyn_cast<CallInst>(prev)) {
                                        auto callFnName = memcpyFn->getCalledFunction()->getName();
                                        outs() << " hhhhh \n";
                                        if (callFnName == "llvm.memcpy.p0.p0.i64") {
                                            if (memcpyFn->getArgOperand(1) == gep->getOperand(0)) {
                                                outs() << " hhhhhttttttt \n";

                                                // std::exit(1);

                                                /*
                                                    First Operand may not be need to allocated as it is from a aggregate type
                                                */

                                               

                                                if (gep->getSourceElementType()->isStructTy()) {
                                                      outs() << " hhheqewhh \n";
                                                    llvm::Value* first_operand = memcpyFn->getArgOperand(0);


                                                    std::unordered_map<Value*,Value*>::iterator gotValue = operand_map.find(memcpyFn->getArgOperand(0));
                                                    if ( gotValue == operand_map.end() ) {
                                                            outs() << " hh444hhh \n";
                                                            if (auto addrSpaceCastInstr = dyn_cast<AddrSpaceCastInst>(first_operand)) {
                                                                if (auto allocaInstr = dyn_cast<AllocaInst>(addrSpaceCastInstr->getPointerOperand())) {
                                                                    if (allocaInstr->getAllocatedType()->isStructTy()) {
                                                                    // if (allocaInstr->getAllocatedType()->getStructName().str() == "struct.float4") {
                                                                            Builder.SetInsertPoint(addrSpaceCastInstr);
                                                                            AllocaInst *newVector = Builder.CreateAlloca(vecType, DL.getAllocaAddrSpace() , 0, "");
                                                                            auto *newVec = Builder.CreateAddrSpaceCast(newVector , I32Ptr); // int32ptr or int64ptr
                                                                            operand_map[first_operand] = newVec;
                                                                            // replace all uses       
                                                                            memcpyFn->setArgOperand(0, newVec);                                                     
                                                                            need_remove.insert(addrSpaceCastInstr);
                                                                            need_remove.insert(allocaInstr);

                                                                    //}

                                                                    }
                                                                }
                                                                
                                                            } else if(auto *getElementPtrNex = dyn_cast<GetElementPtrInst>(first_operand)) {

                                                                // maybe the 
                                                                outs() << " GetElementPtr for llvm.memcpy , no changes needed. \n";
                                                            } else {
                                                                 outs() << " Unknown Case \n";
                                                                 std::exit(12);
                                                            }
                                                    } else {
                                                        // outs() << " hhhh392039\n";
                                                        memcpyFn->setArgOperand(0, gotValue->second);                                                     
                                                    }
                                                    Builder.SetInsertPoint(prev);
                                                   
                                                    // if (gep->getSourceElementType()->getStructName().str() == "struct.float4") {
                                                    outs() << " hhhhh \n";
                                                      
                                                        // _ZN15HIP_vector_typeIjLj4EEaSEOS0_

                                                    LLVMnewFunFn = dyn_cast<Function>(LLVMnewFunFC.getCallee());
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
                                                
                                                    // } else {
                                                    // outs() << F << '\n';
                                                    // std::exit(333);
                                                    // }
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


                            Also cases of getelementptr of nested struct types

                            %struct._PixelOfNode = type { %union.anon.6 }
                            %union.anon.6 = type { %struct.uint4 }
                            %struct.anon.4 = type { %struct.uchar3, %struct.uchar3, %struct.uchar3, %struct.uchar3, %struct.uchar3, i8 }
                            %struct.anon.7 = type { %struct.uchar3, %struct.uchar3, %struct.uchar3, %struct.uchar3, %struct.uchar3, i8 }



                            getElementPtrInst: 

                                
                                # check the result element type
                                %194 = getelementptr inbounds %struct._PixelOfChildren, ptr %79, i32 0, i32 0
                                %195 = getelementptr inbounds %struct.anon.17, ptr %194, i32 0, i32 0
                                call void @llvm.memcpy.p0.p0.i64(ptr align 1 %81, ptr align 16 %195, i64 3, i1 false)
                                br label %211
                                    
                                %250 = getelementptr inbounds %struct._PixelOfNode, ptr %75, i32 0, i32 0
                                %251 = getelementptr inbounds %struct.anon.7, ptr %250, i32 0, i32 3
                                %252 = getelementptr inbounds %struct.uchar3, ptr %251, i32 0, i32 1


                                %245 = getelementptr inbounds %struct._PixelOfNode, ptr %86, i32 0, i32 0
                                %246 = getelementptr inbounds %struct.anon.20, ptr %245, i32 0, i32 2
                                %247 = getelementptr inbounds %struct.HIP_vector_base, ptr %246, i32 0, i32 0
                                %248 = getelementptr inbounds %struct.anon.2, ptr %247, i32 0, i32 1


                            


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

                                } else if (getelementptr->getSourceElementType()->getStructName().str() == "struct.uchar3") {

                                    StructType* vecBase = nullptr;
                                    StructType* vecStruct;
                                    vecBase = cvt->getI8_3Base();
                                    vecStruct = cvt->getI8_3Struct();

                                       if(vecBase) {
                                            Builder.SetInsertPoint(getelementptr);
                                            Value *operand_zero = dyn_cast<Value>(getelementptr->getOperand(0));
                                            auto newGep = Builder.CreateStructGEP(vecBase, operand_zero , 0  ,"");
                                        

                                        
                                            if (getelementptr->getNumIndices() == 2) {
                                                llvm::ConstantInt* CI = dyn_cast<llvm::ConstantInt>(getelementptr->getOperand(2));
                                                unsigned int secondIndex = CI->getZExtValue();

                                            
                                                auto newGepUnion = Builder.CreateStructGEP(vecStruct, newGep ,secondIndex ,"");
                                                getelementptr->replaceAllUsesWith(newGepUnion);
                                        
                                                need_remove.insert(getelementptr);
                                            } else {

                                                // %60 = getelementptr inbounds %struct.float4, ptr %53, i64 %59
                                                // call void @llvm.memcpy.p0.p0.i64(ptr align 16 %60, ptr align 16 %14, i64 16, i1 false)
                                                
                                                // %53 = getelementptr inbounds %struct.HIP_vector_type, ptr %46, i64 %52
                                                // %54 = call noundef nonnull align 16 dereferenceable(16) ptr @_ZN15HIP_vector_typeIfLj4EEaSEOS0_(ptr noundef nonnull align 16 dereferenceable(16) %53, ptr noundef nonnull align 16 dereferenceable(16) %17) #27
                                                outs() << F << '\n';
                                                errs() << "Unknown case for Device Vector Pass\n";
                                                std::exit(1);
                                            }


                                            
                                        }




                                }
                            } 
                        } 


                        /*
                            Copy Element From Struct
                            getelemenptr from stuct
                            then memcpy onto the stack
                        
                        */
                        if (getelementptr->getResultElementType()->isStructTy()) {
                            if (auto StructTy = dyn_cast<StructType>(getelementptr->getResultElementType())) {
                                
                                if( getelementptr->getResultElementType()->getStructName().str() == "struct.uchar3") {
                                    
                                    outs() << "hhhhhh\n";
                                    outs() << *getelementptr->getNextNode() << '\n'; 
                                    if (auto *memcpyFn = dyn_cast<CallInst>(getelementptr->getNextNode())) {
                                        auto callFnName = memcpyFn->getCalledFunction()->getName();

                                        if (callFnName == "llvm.memcpy.p0.p0.i64") {
                                                llvm::Value* first_operand = memcpyFn->getArgOperand(0);
                                                std::unordered_map<Value*,Value*>::iterator gotValue = operand_map.find(first_operand);
                                                if ( gotValue == operand_map.end() ) {
                                                            outs() << " hh444hhh \n";
                                                            if (auto addrSpaceCastInstr = dyn_cast<AddrSpaceCastInst>(memcpyFn->getArgOperand(0))) {
                                                                if (auto allocaInstr = dyn_cast<AllocaInst>(addrSpaceCastInstr->getPointerOperand())) {
                                                                    if (allocaInstr->getAllocatedType()->isStructTy()) {
                                                                        if (allocaInstr->getAllocatedType()->getStructName().str() == "struct.uchar3") {
                                                                                Builder.SetInsertPoint(addrSpaceCastInstr);
                                                                                AllocaInst *newVector = Builder.CreateAlloca(cvt->getI8_3Type(), DL.getAllocaAddrSpace() , 0, "");
                                                                                auto *newVec = Builder.CreateAddrSpaceCast(newVector , I32Ptr); // int32ptr or int64ptr
                                                                                operand_map[first_operand] = newVec;
                                                                                // replace all uses       
                                                                                memcpyFn->setArgOperand(0, newVec);                                                     
                                                                                need_remove.insert(addrSpaceCastInstr);
                                                                                need_remove.insert(allocaInstr);

                                                                        }

                                                                    }
                                                                }
                                                                
                                                            } else if(auto *getElementPtrNex = dyn_cast<GetElementPtrInst>(first_operand)) {

                                                                // maybe the 
                                                                outs() << " GetElementPtr for llvm.memcpy , no changes needed. \n";
                                                            } else {
                                                                 outs() << " Unknown Case \n";
                                                                 std::exit(12);
                                                            }
                                                    } else {
                                                        // outs() << " hhhh392039\n";
                                                        memcpyFn->setArgOperand(0, gotValue->second);                                                     
                                                    }


                                        }
                                    }
                                    }
                                    // std::exit(1222);
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
                                if (allocaInstr->getAllocatedType()->getStructName().str() == "struct.float4"
                                || allocaInstr->getAllocatedType()->getStructName().str() == "struct.uchar3" 
                                || allocaInstr->getAllocatedType()->getStructName().str() == "struct.uint4") {
                                    
                                        
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

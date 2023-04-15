/*

  Walk through device and kernel functions and redefine CUDA vector types to 
  HIP vectors 


*/

#include <iostream>
#include <memory>
#include <queue>
#include <set>
#include <vector>

#include "llvm/ADT/SmallVector.h"
#include "llvm/IR/CallingConv.h"
#include "llvm/IR/DataLayout.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/GlobalValue.h"
#include "llvm/IR/LLVMContext.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/Value.h"
#include "llvm/Pass.h"

#include "DeviceVectorPass.hpp"
#include "utils.hpp"
#include "vectorTypes.hpp"

using namespace llvm;
using namespace cupbop::amd::passes;

VectorPass::VectorPass() :  FunctionPass(ID) {}


bool VectorPass::runOnFunction(Function &F) {
    std::vector<Instruction*>  need_remove = {};

    CupbopVectorType* cvt = CupbopVectorType::getInstance();
    Module *M = F.getParent();
    auto &context = M->getContext();
    Type* llvmVoidTy = Type::getVoidTy(context);
    Type* llvmI8PtrTy = Type::getInt8PtrTy(context);
    Type* llvmI64Ty = IntegerType::get(context, 64);
    Type* llvmI32Ty = IntegerType::get(context, 32);
    Type* llvmI1Ty = IntegerType::get(context, 1);
    auto llvmFloatType = Type::getFloatTy(context);
    auto llvmI32PtrTy= Type::getInt32PtrTy(context);
      
    const DataLayout &DL = M->getDataLayout();


    std::vector<Type *> memcpyParams;
    memcpyParams.push_back(llvmI8PtrTy);
    memcpyParams.push_back(llvmI8PtrTy);
    memcpyParams.push_back(llvmI64Ty);
    memcpyParams.push_back(llvmI1Ty);
    llvm::FunctionType *LLVMmemcpyType = FunctionType::get(llvmVoidTy,
            memcpyParams, false);


    if (F.getCallingConv() != CallingConv::AMDGPU_KERNEL
        && !isCudaBuiltin(F.getName().str())) {


      // if (F.getName().str() != "_Z14arrayToAddress6uchar3Rj") continue;

      std::cout << "Function: " << F.getName().str() << std::endl;

      outs() << F << '\n';
      /*
        First Step:
        If parameter is the already converted  %struct.HIP_vector_base %0,
        we need to add the convertion to local ptr below:
          
          %3 = alloca %struct.HIP_vector_type, align 16, addrspace(5)
          %5 = addrspacecast ptr addrspace(5) %3 to ptr
          %6 = getelementptr inbounds %struct.HIP_vector_type, ptr %5, i32 0, i32 0
          %7 = getelementptr inbounds %struct.HIP_vector_base, ptr %6, i32 0, i32 0
          %8 = getelementptr inbounds %union.anon, ptr %7, i32 0, i32 0
          %9 = getelementptr inbounds %struct.HIP_vector_base, ptr %8, i32 0, i32 0
          %10 = extractvalue %struct.HIP_vector_base %0, 0
          store %union.anon %10, ptr %9, align 16
      */
      llvm::IRBuilder<> Builder(M->getContext());
      Function::iterator ii = F.begin();
      BasicBlock::iterator firstBB = ii->getFirstInsertionPt();
      auto *first_instr = dyn_cast<Instruction>(firstBB);
      std::unordered_map<Value*, Value*> operand_map;
      std::set<Value*> operand_set;

      int index = 0;
      for (Function::arg_iterator I = F.arg_begin(), E = F.arg_end();
        I != E; ++I) {
          
          Type *ArgType = I->getType();
          Value *val = dyn_cast<Value>(I);

          // mummergpu case
          // define dso_local void @_Z14arrayToAddress6uchar3Rj(i32 noundef byval(%struct.uchar3) %0, ptr noundef nonnull align 4 dereferenceable(4) %1)
          StructType* vecType = nullptr;
          StructType* vecBase;
          StructType* vecUnion;
          StructType* vecNative = nullptr;
          Builder.SetInsertPoint(first_instr);  
          
          auto byValAttr = I->getAttribute(Attribute::AttrKind::ByVal);
          auto* byValTy = byValAttr.getValueAsType();
          
          if (byValTy) {
              outs() << *byValTy << '\n';
              if(StructType* StructTy = dyn_cast<StructType>(byValTy)) {
                if (byValTy->getStructName().str().find("struct.uchar3") != std::string::npos) {
                    
                      F.removeParamAttr(index,Attribute::AttrKind::ByVal);

                      vecType = cvt->getI8_3Type();
                      vecBase = cvt->getI8_3Base();
                      vecUnion = cvt->getI8_3Union();
                      vecNative = cvt->getI8_3Native();
                      

                      /*
                        %9 = getelementptr inbounds %struct.HIP_vector_type, ptr %6, i32 0, i32 0
                        %10 = getelementptr inbounds %struct.HIP_vector_base, ptr %9, i32 0, i32 0
                        %11 = getelementptr inbounds %union.anon.1, ptr %10, i32 0, i32 0
                        %12 = getelementptr inbounds %"struct.HIP_vector_base<unsigned char, 3>::Native_vec_", ptr %11, i32 0, i32 0
                        store i32 %0, ptr %7, align 4
                        call void @llvm.memcpy.p0.p0.i64(ptr align 1 %12, ptr align 4 %7, i64 3, i1 false)

                      */
         
                }
              }

          } else if (StructType* StructTy = dyn_cast<StructType>(ArgType)){
            
            if (ArgType->getStructName().str().find("HIP_vector_base_float.4") != std::string::npos) {
                vecType = cvt->getFloat4Type();
                vecBase = cvt->getFloat4Base();
                vecUnion = cvt->getFloat4Union();

                

                // AllocaInst *newVector = Builder.CreateAlloca(cvt->getFloat4Type(), DL.getAllocaAddrSpace() , 0, "");
                // auto *newVec = Builder.CreateAddrSpaceCast(newVector , llvmI32PtrTy); // int32ptr or int64ptr
                // val->replaceAllUsesWith(newVec);
                // auto vectorTypeToGEP = Builder.CreateStructGEP(cvt->getFloat4Type(), newVec, 0 /*ArrayRef<Value *>(indices, 2)*/ ,"");

                // auto vectorToUnion= Builder.CreateStructGEP(cvt->getFloat4Base(), vectorTypeToGEP, 0  ,"");

                // auto vectorToBase = Builder.CreateStructGEP(cvt->getFloat4Union(), vectorToUnion, 0  ,"");
                
                // auto vectorToBeExtract = Builder.CreateStructGEP(cvt->getFloat4Base(), vectorToBase, 0  ,"");

                // auto newEEV = Builder.CreateExtractValue(val, ArrayRef<unsigned int>({0}), "");
               
                // auto newStore = Builder.CreateStore(newEEV, vectorToBeExtract);
            
                // // replace uses of the param with newVec

                
                
          } else if(ArgType->getStructName().str().find("HIP_vector_base_float.2") != std::string::npos) {
               vecType = cvt->getFloat2Type();
                vecBase = cvt->getFloat2Base();
                vecUnion = cvt->getFloat2Union();
          } else if(ArgType->getStructName().str().find("HIP_vector_base_int.4") != std::string::npos) {
                vecType = cvt->getI32_4Type();
                vecBase = cvt->getI32_4Base();
                vecUnion = cvt->getI32_4Union();
          } else if(ArgType->getStructName().str().find("HIP_vector_base_int.2") != std::string::npos) {
                vecType = cvt->getI32_2Type();
                vecBase = cvt->getI32_2Base();
                vecUnion = cvt->getI32_2Union();
          } else if(ArgType->getStructName().str().find("struct.uchar3") != std::string::npos) {
                
                // case maybe wrong
                F.removeParamAttr(index,Attribute::AttrKind::ByVal);

       
                vecType = cvt->getI8_3Type();
                vecBase = cvt->getI8_3Base();
                vecUnion = cvt->getI8_3Union();
                
          }

          
          
      


        }
      
          // getI8_3Native
          if(vecType) {
            AllocaInst *newVector = Builder.CreateAlloca(vecType, DL.getAllocaAddrSpace() , 0, "");
            auto *newVec = Builder.CreateAddrSpaceCast(newVector , llvmI32PtrTy); // int32ptr or int64ptr
            val->replaceAllUsesWith(newVec);

            auto vectorTypeToGEP = Builder.CreateStructGEP(vecType, newVec, 0 /*ArrayRef<Value *>(indices, 2)*/ ,"");

            auto vectorToUnion= Builder.CreateStructGEP(vecBase, vectorTypeToGEP, 0  ,"");

            auto vectorToBase = Builder.CreateStructGEP(vecUnion, vectorToUnion, 0  ,"");
            
            // case currently for uchar3
            if (vecNative) {

              // alloca i32
              // address space cast i32

              AllocaInst *newInt = Builder.CreateAlloca(llvmI32Ty, DL.getAllocaAddrSpace() , 0, "");
              auto *newI32Cast = Builder.CreateAddrSpaceCast(newInt , llvmI32PtrTy); // int32ptr or int64ptr
              
              auto vectorToBeStore = Builder.CreateStructGEP(vecNative, vectorToBase, 0  ,"");

              // auto newEEV = Builder.CreateExtractValue(val, ArrayRef<unsigned int>({0}), "");
              
              auto newStore = Builder.CreateStore(val, newI32Cast);

              //   call void @llvm.memcpy.p0.p0.i64(ptr align 1 %12, ptr align 4 %7, i64 3, i1 false)


              FunctionCallee LLVMmemcpyFC = M->getOrInsertFunction("llvm.memcpy.p0.p0.i64", LLVMmemcpyType);
              Function * LLVMmemcpyFn = dyn_cast<Function>(LLVMmemcpyFC.getCallee());
                            
              SmallVector<Value *, 4> memcpyArgs;
              memcpyArgs.push_back(vectorToBeStore);
              // ptr align 8 addrspacecast (ptr addrspace(1) @tex to ptr)
              memcpyArgs.push_back(newI32Cast);
              // i64 88
              llvm::Constant *i64_val = llvm::ConstantInt::get(llvmI64Ty, 3/*value*/, false);
              memcpyArgs.push_back(i64_val);
              // i1 false 
              llvm::Constant *ifalse_val = llvm::ConstantInt::get(llvmI1Ty, 0/*value*/, false);
              memcpyArgs.push_back(ifalse_val);
            
              Builder.CreateCall(LLVMmemcpyFn, memcpyArgs);



            } else {
              auto vectorToBeExtract = Builder.CreateStructGEP(vecBase, vectorToBase, 0  ,"");

              auto newEEV = Builder.CreateExtractValue(val, ArrayRef<unsigned int>({0}), "");
              
              auto newStore = Builder.CreateStore(newEEV, vectorToBeExtract);
            }
           
          }

         ++index;
      }



      /*
        Second Case:
        

          %17 = getelementptr inbounds %struct.float4, %struct.HIP_vector_base %0, i32 0, i32 1
          %18 = load float, ptr %17, align 4
          br label %22

          Above is converted to below

          %19 = getelementptr inbounds %struct.HIP_vector_base, ptr %5, i32 0, i32 0
          %20 = getelementptr inbounds %struct.anon, ptr %19, i32 0, i32 1
          %21 = load float, ptr %20, align 4, !tbaa !12




        Third case:
            %9 = alloca %struct.float4, align 16, addrspace(5)
            %10 = addrspacecast ptr addrspace(5) %9 to ptr

            %23 = phi contract float [ %18, %16 ], [ %21, %19 ]
            %24 = getelementptr inbounds %struct.float4, ptr %10, i32 0, i32 0
            store float %23, ptr %24, align 16

    
            %2 = alloca %struct.HIP_vector_type, align 16, addrspace(5)

            %4 = addrspacecast ptr addrspace(5) %2 to ptr
            %47 = getelementptr inbounds %struct.HIP_vector_base, ptr %4, i32 0, i32 0
            %48 = getelementptr inbounds %struct.anon, ptr %47, i32 0, i32 1
            store float %46, ptr %48, align 4, !tbaa !12


        Load and Return Case:

            %213 = load %struct.float4, ptr %10, align 16
            ret %struct.float4 %213

            %211 = load %struct.HIP_vector_type, ptr %4, align 16
            ret %struct.HIP_vector_type %211
      */
      // outs() << F << '\n';

       for (auto &BB : F) {
          for (auto &I : BB) {

            if (auto addrSpaceCastInstr = dyn_cast<AddrSpaceCastInst>(&I)) {
              if (auto allocaInstr = dyn_cast<AllocaInst>(addrSpaceCastInstr->getPointerOperand())) {
                 if (allocaInstr->getAllocatedType()->isStructTy()) {
                  StructType* vecType = nullptr;
                  if (allocaInstr->getAllocatedType()->getStructName().str() == "struct.float4") {
                        
                        vecType = cvt->getFloat4Type();
              
                  } else if(allocaInstr->getAllocatedType()->getStructName().str() == "struct.uchar3") {
                    vecType = cvt->getI8_3Type();
                  } else if(allocaInstr->getAllocatedType()->getStructName().str() == "struct.uint4") {
                    vecType = cvt->getI32_4Type();
                  } else if(allocaInstr->getAllocatedType()->getStructName().str() == "struct.int2") {
                    vecType = cvt->getI32_2Type();
                  } else if(allocaInstr->getAllocatedType()->getStructName().str() == "struct.float2") {
                    vecType = cvt->getFloat2Type();
                  }

                  if(vecType) {
                      Builder.SetInsertPoint(addrSpaceCastInstr);
                      AllocaInst *newVector = Builder.CreateAlloca(vecType, DL.getAllocaAddrSpace() , 0, "");
                      auto *newVec = Builder.CreateAddrSpaceCast(newVector , llvmI32PtrTy); // int32ptr or int64ptr
                      
                      // replace all uses
                      addrSpaceCastInstr->replaceAllUsesWith(newVec);
                      
                      need_remove.push_back(addrSpaceCastInstr);
                      need_remove.push_back(allocaInstr);
                  }

                }
              }
             
            }

            



            if (auto *getelementpr = dyn_cast<GetElementPtrInst>(&I)) {

              outs() << *getelementpr << '\n';
              if(auto structTy = dyn_cast<StructType>(getelementpr->getSourceElementType())) {
                StructType* vecBase = nullptr;
                StructType* vecStruct;
                // getelementptr inbounds %struct.float4, %struct.HIP_vector_base %0
                if (getelementpr->getSourceElementType()->getStructName().str() == "struct.float4") {
                  
                  vecBase = cvt->getFloat4Base();
                  vecStruct = cvt->getFloat4Struct();
                  //  outs() << *getelementpr  << " source pass " << '\n';

                 
                  /*
                    %17 = getelementptr inbounds %struct.float4, %struct.HIP_vector_base %0, i32 0, i32 1
                    %18 = load float, ptr %17, align 4
                    br label %22

                    Above is converted to below

                    %19 = getelementptr inbounds %struct.HIP_vector_base, ptr %5, i32 0, i32 0
                    %20 = getelementptr inbounds %struct.anon, ptr %19, i32 0, i32 1
                    %21 = load float, ptr %20, align 4, !tbaa !12
                  */
                 
                           
                } else if (getelementpr->getSourceElementType()->getStructName().str() == "struct.uchar3") {
                  vecBase = cvt->getI8_3Base();
                  vecStruct = cvt->getI8_3Struct();
                } else if (getelementpr->getSourceElementType()->getStructName().str() == "struct.uint4") {
                  vecBase = cvt->getI32_4Base();
                  vecStruct = cvt->getI32_4Struct();
                } else if (getelementpr->getSourceElementType()->getStructName().str() == "struct.int2") {
                  vecBase = cvt->getI32_2Base();
                  vecStruct = cvt->getI32_2Struct();
                } else if (getelementpr->getSourceElementType()->getStructName().str() == "struct.float2") {
                  vecBase = cvt->getFloat2Base();
                  vecStruct = cvt->getFloat2Struct();
                }

                if(vecBase) {
                  Builder.SetInsertPoint(getelementpr);
                  Value *operand_zero = dyn_cast<Value>(getelementpr->getOperand(0));
                  auto newGep = Builder.CreateStructGEP(vecBase, operand_zero , 0  ,"");
               

              
                  if (getelementpr->getNumIndices() == 2) {
                    llvm::ConstantInt* CI = dyn_cast<llvm::ConstantInt>(getelementpr->getOperand(2));
                    unsigned int secondIndex = CI->getZExtValue();

                   
                    auto newGepUnion = Builder.CreateStructGEP(vecStruct, newGep ,secondIndex ,"");
                    getelementpr->replaceAllUsesWith(newGepUnion);
            
                    need_remove.push_back(getelementpr);
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


            } else if (auto *loadInstr = dyn_cast<LoadInst>(&I)) {
              
              /*
                %213 = load %struct.float4, ptr %10, align 16
                ret %struct.float4 %213
              */
              if (loadInstr->getType()->isStructTy()) {
                 StructType* vecType = nullptr;
                  if (loadInstr->getType()->getStructName().str() == "struct.float4") {
                      vecType = cvt->getFloat4Type();      
                  } else if (loadInstr->getType()->getStructName().str() == "struct.uchar3") {

                     // this case might not be the same for HIP as in other types (mummergpu example)
                     vecType = cvt->getI8_3Type();
                  } else if (loadInstr->getType()->getStructName().str() == "struct.uint4") {
                    vecType = cvt->getI32_4Type();
                  } else if (loadInstr->getType()->getStructName().str() == "struct.int2") {
                    vecType = cvt->getI32_2Type();
                  } else if (loadInstr->getType()->getStructName().str() == "struct.float2") {
                    vecType = cvt->getFloat2Type();
                  }

                if(vecType) {
                  Builder.SetInsertPoint(loadInstr);
                  LoadInst* newLoad = Builder.CreateLoad(vecType, loadInstr->getPointerOperand());
                  loadInstr->replaceAllUsesWith(newLoad);
                  need_remove.push_back(loadInstr);
                }
              }

            

           
              
              
            }

              



          }
        }

      }
    

    for(auto remove: need_remove) {
      remove->dropAllReferences();
      remove->eraseFromParent();
    }

    outs() << F << '\n';

    return true;
}

char VectorPass::ID = 0;

namespace {
static RegisterPass<VectorPass>
    vector_pass("vector-pass",
                             "Translate Vectors within the Functions");
}

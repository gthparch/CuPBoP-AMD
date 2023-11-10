// Copyright © 2023
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

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
    Type* llvmI1Ty = IntegerType::get(context, 1);
    auto llvmFloatType = Type::getFloatTy(context);
    auto llvmI32PtrTy= Type::getInt32PtrTy(context);
      
    const DataLayout &DL = M->getDataLayout();


    if (F.getCallingConv() != CallingConv::AMDGPU_KERNEL
        && !isCudaBuiltin(F.getName().str())) {

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

      for (Function::arg_iterator I = F.arg_begin(), E = F.arg_end();
        I != E; ++I) {
          Type *ArgType = I->getType();
          Value *val = dyn_cast<Value>(I);
          if (StructType* StructTy = dyn_cast<StructType>(ArgType)){
            if (ArgType->getStructName().str().find("HIP_vector_base") != std::string::npos) {

                Builder.SetInsertPoint(first_instr);   

                AllocaInst *newVector = Builder.CreateAlloca(cvt->getFloat4Type(), DL.getAllocaAddrSpace() , 0, "");
                auto *newVec = Builder.CreateAddrSpaceCast(newVector , llvmI32PtrTy); // int32ptr or int64ptr
                val->replaceAllUsesWith(newVec);
                auto vectorTypeToGEP = Builder.CreateStructGEP(cvt->getFloat4Type(), newVec, 0 /*ArrayRef<Value *>(indices, 2)*/ ,"");

                auto vectorToUnion= Builder.CreateStructGEP(cvt->getFloat4Base(), vectorTypeToGEP, 0  ,"");

                auto vectorToBase = Builder.CreateStructGEP(cvt->getFloat4Union(), vectorToUnion, 0  ,"");
                
                auto vectorToBeExtract = Builder.CreateStructGEP(cvt->getFloat4Base(), vectorToBase, 0  ,"");

                auto newEEV = Builder.CreateExtractValue(val, ArrayRef<unsigned int>({0}), "");
               
                auto newStore = Builder.CreateStore(newEEV, vectorToBeExtract);
            
                // replace uses of the param with newVec

                
                
          }
      }
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
                  if (allocaInstr->getAllocatedType()->getStructName().str() == "struct.float4") {
                        Builder.SetInsertPoint(addrSpaceCastInstr);
                        AllocaInst *newVector = Builder.CreateAlloca(cvt->getFloat4Type(), DL.getAllocaAddrSpace() , 0, "");
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
               
                // getelementptr inbounds %struct.float4, %struct.HIP_vector_base %0
                if (getelementpr->getSourceElementType()->getStructName().str() == "struct.float4") {
                 
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
                  Builder.SetInsertPoint(getelementpr);
                  Value *operand_zero = dyn_cast<Value>(getelementpr->getOperand(0));
                 
                  auto newGep = Builder.CreateStructGEP(cvt->getFloat4Base(), operand_zero , 0  ,"");
               

              
                  if (getelementpr->getNumIndices() == 2) {
                    llvm::ConstantInt* CI = dyn_cast<llvm::ConstantInt>(getelementpr->getOperand(2));
                    unsigned int secondIndex = CI->getZExtValue();
                    auto newGepUnion = Builder.CreateStructGEP(cvt->getFloat4Struct(), newGep ,secondIndex ,"");
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
                  if (loadInstr->getType()->getStructName().str() == "struct.float4") {
                        Builder.SetInsertPoint(loadInstr);
                        LoadInst* newLoad = Builder.CreateLoad(cvt->getFloat4Type(), loadInstr->getPointerOperand());
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

    return true;
}

char VectorPass::ID = 0;

namespace {
static RegisterPass<VectorPass>
    vector_pass("vector-pass",
                             "Translate Vectors within the Functions");
}

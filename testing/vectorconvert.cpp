// #include <iostream>
// #include <memory>
// #include <queue>
// #include <set>

// #include "llvm/IR/DerivedTypes.h"
// #include "llvm/IR/Function.h"
// #include "llvm/IR/GlobalValue.h"
// #include "llvm/IR/IRBuilder.h"
// #include "llvm/IR/Instructions.h"
// #include "llvm/IR/IntrinsicInst.h"
// #include "llvm/IR/Intrinsics.h"
// #include "llvm/IR/IntrinsicsAMDGPU.h"
// #include "llvm/IR/IntrinsicsNVPTX.h"
// #include "llvm/IR/LLVMContext.h"
// #include "llvm/IR/Module.h"
// #include "llvm/IR/Value.h"
// #include "llvm/Pass.h"
// #include "llvm/Support/AtomicOrdering.h"

// #include "VectorConversionPass.hpp"
// #include "utils.hpp"
// #include "vectorTypes.hpp"

// using namespace llvm;
// using namespace cupbop::amd::passes;
// char VectorPass::ID = 0;

// namespace {
// static RegisterPass<VectorConversionPass>
//     vector_type_convert_pass("vector-type-conversion",
//                             "Convert Vector Types AMD");
// }


// void checkStructType(Type* structType) {


//   // iterate over the elements and check if it is in vectorMap
//   // if it is then map to correct type
//   // std::vector<Type *> newTy;
//   auto structTy = dyn_cast<StructType>(structType);
//   CupbopVectorType* cvt = CupbopVectorType::getInstance();
//   for(StructType::element_iterator i = structTy->element_begin(), e = structTy->element_end(); i != e; ++i) {
//     Type* rt = dyn_cast<Type>(*i);
//     if (rt->isStructTy()) {
//       if (rt->getStructName().str() == "struct.float4") {
//         rt = cvt->getFloat4Type();
//         modifiedStructTypes.insert(structType);
        
//       } else if(rt->getStructName().str() == "struct.uint4") {
//         rt = cvt->getI32_4Type();
//         modifiedStructTypes.insert(structType);

//       } else if(rt->getStructName().str() == "struct.int2") {
//         rt = cvt->getI32_2Type();
//         modifiedStructTypes.insert(structType);

//       } else if(rt->getStructName().str() == "struct.uchar3") {
//         // mummergpu example coverts to i32
//         rt = cvt->getI8_3Type();
//         modifiedStructTypes.insert(structType);

//       }
//     }
//   }
// }

// Function *VectorConversionPass::processKernel(Module &M, Function &F) {


//   Function::iterator I = F.begin();
//   for (Function::iterator E = F.end(); I != E; ++I) {

//       for (BasicBlock::iterator BI = I->begin(); BI != I->end(); BI++) {

//       /*
//         getElementPtrInst: 
        
//       %250 = getelementptr inbounds %struct._PixelOfNode, ptr %75, i32 0, i32 0
//       %251 = getelementptr inbounds %struct.anon.7, ptr %250, i32 0, i32 3
//       %252 = getelementptr inbounds %struct.uchar3, ptr %251, i32 0, i32 1


//       %245 = getelementptr inbounds %struct._PixelOfNode, ptr %86, i32 0, i32 0
//       %246 = getelementptr inbounds %struct.anon.20, ptr %245, i32 0, i32 2
//       %247 = getelementptr inbounds %struct.HIP_vector_base, ptr %246, i32 0, i32 0
//       %248 = getelementptr inbounds %struct.anon.2, ptr %247, i32 0, i32 1


//         memcpy

//       %68 = alloca %struct.uchar3, align 1, addrspace(5)
//       %69 = addrspacecast ptr addrspace(5) %68 to ptr

//       %183 = getelementptr inbounds %struct._PixelOfChildren, ptr %65, i32 0, i32 0
//       %184 = getelementptr inbounds %struct.anon.4, ptr %183, i32 0, i32 0

//       call void @llvm.memcpy.p0.p0.i64(ptr align 1 %69, ptr align 16 %184, i64 3, i1 false)
      
//       */
//       if (auto gep = dyn_cast<GetElementPtrInst>(BI)) {

//           //  get elementptr instruction
//           if (gep->getSourceElementType()->isStructTy()) {
//              structTypes.insert(gep->getSourceElementType());

//              // check if source element is in the list of manipulated elements
//              // change the getelementptr instruction to different type

//              // check the result of the getelementptr type
//              // check the uses 


//           }

//           if (gep->getResultElementType()->isStructTy())  {
//              structTypes.insert(gep->getResultElementType());
//           }
//         }
//       }

//   }
   

// }

// bool VectorConversionPass::runOnModule(Module &M) {

//   for (auto &F : M) {
//         if (F.getCallingConv() == CallingConv::AMDGPU_KERNEL
//         && !isCudaBuiltin(F.getName().str())) {

//           processKernel(M, F);

//         }
//     }

//     return true;


// }

/**
 * Replace Cuda VectorTypes in Aggregate Types
 * https://stackoverflow.com/questions/73766532/in-llvm-how-to-get-all-the-struct-types-in-a-program
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

#include "utils.hpp"
#include "vectorTypes.hpp"
#include "VectorAggregateTypeConv.hpp"

using namespace llvm;

// recursively iterate the struct bodies to check for vector types
void traverseStructType(Type* structType, std::set<Type*>& modifiedStructTypes) {


  // iterate over the elements and check if it is in vectorMap
  // if it is then map to correct type
  std::vector<Type *> newTy;
  auto structTy = dyn_cast<StructType>(structType);
  CupbopVectorType* cvt = CupbopVectorType::getInstance();
  for(StructType::element_iterator i = structTy->element_begin(), e = structTy->element_end(); i != e; ++i) {
    Type* rt = dyn_cast<Type>(*i);
    if (rt->isStructTy()) {
      if (rt->getStructName().str() == "struct.float4") {
        rt = cvt->getFloat4Type();
        modifiedStructTypes.insert(structType);
       
      } else if(rt->getStructName().str() == "struct.uint4") {
        rt = cvt->getI32_4Type();
        modifiedStructTypes.insert(structType);

      } else if(rt->getStructName().str() == "struct.int2") {
        rt = cvt->getI32_2Type();
        modifiedStructTypes.insert(structType);

      } else if(rt->getStructName().str() == "struct.uchar3") {
        // mummergpu example coverts to i32
        rt = cvt->getI8_3Type();
        modifiedStructTypes.insert(structType);
      }
    }
    newTy.push_back(rt);
  }
  structTy->setBody(newTy, false);
}

void ConvertVector(llvm::Module& M) {

  std::set<Type*> structTypes;
  std::set<Type*> modifiedStructTypes;
   for (Module::iterator i = M.begin(), e = M.end(); i != e; ++i) {
    Function *F = &(*i);
    Function::iterator I = F->begin();
     for (Function::iterator E = F->end(); I != E; ++I) {

      for (BasicBlock::iterator BI = I->begin(); BI != I->end(); BI++) {

        // alloca instruction get type
        if(auto allocaInstr = dyn_cast<AllocaInst>(BI)) {

          if (allocaInstr->getAllocatedType()->isStructTy()) {
            structTypes.insert(allocaInstr->getAllocatedType());
          }

        } else if (auto gep = dyn_cast<GetElementPtrInst>(BI)) {

          //  get elementptr instruction
          if (gep->getSourceElementType()->isStructTy()) {
             structTypes.insert(gep->getSourceElementType());
          }

          if (gep->getResultElementType()->isStructTy())  {
             structTypes.insert(gep->getResultElementType());
          }
        }
      }

     }
   }

  for( auto s: structTypes) {
    outs() << *s <<'\n';
    traverseStructType(s, modifiedStructTypes);
    outs() << *s <<'\n';
   }

   for( auto s: modifiedStructTypes) {
    outs() << " Modified: " << *s << '\n';
   }


}

void ConvertVectorCheck(llvm::Module& M) {

  for (Module::iterator i = M.begin(), e = M.end(); i != e; ++i) {
    Function *F = &(*i);
    Function::iterator I = F->begin();
    // if(F->getName().str() != "_Z15mummergpuKernelPvPcS0_PKiS2_ii") continue;

     for (Function::iterator E = F->end(); I != E; ++I) {

      for (BasicBlock::iterator BI = I->begin(); BI != I->end(); BI++) {

        // alloca instruction get type
        // if(auto allocaInstr = dyn_cast<AllocaInst>(BI)) {

        //   if (allocaInstr->getAllocatedType()->isStructTy()) {
        //     structTypes.insert(allocaInstr->getAllocatedType());
        //   }

        // } else 
        
        if (auto GEP = dyn_cast<GetElementPtrInst>(BI)) {

          //  get elementptr instruction
          // if (gep->getSourceElementType()->isStructTy()) {
          //    structTypes.insert(gep->getSourceElementType());
          // }

          // if (gep->getResultElementType()->isStructTy())  {
          //    structTypes.insert(gep->getResultElementType());
          // }
          // outs() << " GEP: "  << *GEP << '\n';
          SmallVector<Value *, 16> Idxs(GEP->indices());
          Type *ElTy =
              GetElementPtrInst::getIndexedType(GEP->getSourceElementType(), Idxs);
          
          if (GEP->getType()->isPtrOrPtrVectorTy()) {
            if (GEP->getResultElementType() != ElTy) {
              
            
              // outs() << *GEP->getResultElementType() << '\n';
              // outs() << *ElTy << '\n';

              GEP->setResultElementType(ElTy);

              // std::exit(111);
            }
          } else {
            outs() << "Uncheck Case in VectorConversion Check: "  <<*GEP->getType() << '\n';
            std::exit(121);
          }
        
      }

     }
   }
 


}
}
// VectorConversions::VectorConversions(llvm::Function &F) {
//   Function::iterator I = F.begin();
//      for (Function::iterator E = F.end(); I != E; ++I) {

//       for (BasicBlock::iterator BI = I->begin(); BI != I->end(); BI++) {

//         // alloca instruction get type
//         if(auto allocaInstr = dyn_cast<AllocaInst>(BI)) {

//           if (allocaInstr->getAllocatedType()->isStructTy()) {
//             structTypes.insert(allocaInstr->getAllocatedType());
//           }

//         } else if (auto gep = dyn_cast<GetElementPtrInst>(BI)) {

//           //  get elementptr instruction
//           if (gep->getSourceElementType()->isStructTy()) {
//              structTypes.insert(gep->getSourceElementType());
//           }

//           if (gep->getResultElementType()->isStructTy())  {
//              structTypes.insert(gep->getResultElementType());
//           }
//         }
//       }

//      }
// }



// VectorConversions::VectorConversions(llvm::Module &M) {
  
//    std::set<Type*> structTypes;
//    std::set<Type*> modifiedStructTypes;
//    for (Module::iterator i = M.begin(), e = M.end(); i != e; ++i) {
//     Function *F = &(*i);
//     Function::iterator I = F->begin();
//      for (Function::iterator E = F->end(); I != E; ++I) {

//       for (BasicBlock::iterator BI = I->begin(); BI != I->end(); BI++) {

//         // alloca instruction get type
//         if(auto allocaInstr = dyn_cast<AllocaInst>(BI)) {

//           if (allocaInstr->getAllocatedType()->isStructTy()) {
//             structTypes.insert(allocaInstr->getAllocatedType());
//           }

//         } else if (auto gep = dyn_cast<GetElementPtrInst>(BI)) {

//           //  get elementptr instruction
//           if (gep->getSourceElementType()->isStructTy()) {
//              structTypes.insert(gep->getSourceElementType());
//           }

//           if (gep->getResultElementType()->isStructTy())  {
//              structTypes.insert(gep->getResultElementType());
//           }
//         }
//       }

//      }
//    }

   
//   //  for( auto s: structTypes) {
//   //   outs() << *s <<'\n';
//   //   traverseStructType(s, modifiedStructTypes);
//   //   outs() << *s <<'\n';
//   //  }

//   //  for( auto s: modifiedStructTypes) {
//   //   outs() << " Modified: " << *s << '\n';
//   //  }

// }



// // recursively iterate the struct bodies to check for vector types
// void VectorConversions::getStructTypes(Type* structType) {


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

// void VectorConversions::modifyTypes() {
//   for( auto s: structTypes) {
//     outs() << *s <<'\n';
//     modifyStructType(s);
//     outs() << *s <<'\n';
//   }
// }

// void VectorConversions::getModifiableStructTypes() {
//   for( auto s: structTypes) {
//     outs() << *s <<'\n';
//     getStructTypes(s);
//     outs() << *s <<'\n';
//   }
// }

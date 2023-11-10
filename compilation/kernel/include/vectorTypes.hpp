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

#pragma once

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

using namespace llvm;

class CupbopVectorType {
   public:
    Type *vectorFloat4Type;
    StructType *unionFloat4Vector;
    StructType *hipVectorFloat4Base;
    StructType *hipVectorFloat4Type; 
    StructType *structFloat4;
    static CupbopVectorType *getInstance() {
      if (!instance) {
        instance = new CupbopVectorType();
       
      }
      return instance;
    }

    void setModule(llvm::Module &M) {
      auto &context = M.getContext();
      // set all vector types
      auto floatType = Type::getFloatTy(context);
      vectorFloat4Type = VectorType::get(floatType, 4, false);
      unionFloat4Vector = StructType::create(context, "union.anon"); 
      unionFloat4Vector->setBody(vectorFloat4Type);

      hipVectorFloat4Base = StructType::create(context, "struct.HIP_vector_base");
      hipVectorFloat4Base->setBody(unionFloat4Vector);

      hipVectorFloat4Type = StructType::create(context, "struct.HIP_vector_type");
      hipVectorFloat4Type->setBody(hipVectorFloat4Base);

      structFloat4 = StructType::create(context, "struct.anon");
      structFloat4->setBody({floatType, floatType , floatType, floatType}, /* packed */ false); // Set the body of the aggregate


   
    }

    StructType* getFloat4Base() {
      return hipVectorFloat4Base;
    }

    StructType* getFloat4Type() {
      return hipVectorFloat4Type;
    }

    StructType* getFloat4Union() {
      return unionFloat4Vector;
    }

    StructType* getFloat4Struct() {
      return structFloat4;
    }

    private:
    static CupbopVectorType *instance;
    CupbopVectorType() {}

   
  // Type *vectorFloat4Type = VectorType::get(floatType, 4, false);
  // auto unionFloat4Vector = StructType::create(context, "union.anon"); 
  // unionFloat4Vector->setBody(vectorFloat4Type);

};



// // vector type <4 x i32> ?
// Type *vectorIntType = VectorType::get(int32Type, 4, false);
// auto unionIntVector = StructType::create(context, "vector.int.union"); 
// unionIntVector->setBody(vectorIntType);

// // vector type <4x float>
// Type *vectorFloat4Type = VectorType::get(floatType, 4, false);
// auto unionFloat4Vector = StructType::create(context, "union.anon"); 
// unionFloat4Vector->setBody(vectorFloat4Type);

// auto hipVectorFloat4Base = StructType::create(context, "struct.HIP_vector_base");
// hipVectorFloat4Base->setBody(unionFloat4Vector);

// auto hipVectorFloat4Type = StructType::create(context, "struct.HIP_vector_type");
// hipVectorFloat4Type->setBody(hipVectorFloat4Base);



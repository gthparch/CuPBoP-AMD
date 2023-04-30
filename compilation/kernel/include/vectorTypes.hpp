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

#include <unordered_set>
using namespace llvm;

/*
  TODO: use map

*/

class CupbopVectorType {
   public:
    Type *vectorFloat_4Type;
    Type *vectorI32_4Type;
    Type *vectorI8_3Type;
    Type *vectorI32_2Type;
    Type *vectorFloat_2Type;

    Type *arrayI8_3Type;

    StructType *unionFloat4Vector;
    StructType *hipVectorFloat4Base;
    StructType *hipVectorFloat4Type; 
    StructType *structFloat4;

    StructType *Float_2;
    StructType *hipVectorFloat_2Base;
    StructType *hipVectorFloat_2Type;
    StructType *unionFloat_2Vector;

    StructType *I8_3;
    StructType *hipVectorI8_3Base;
    StructType *hipVectorI8_3Type;
    StructType *unionI8_3Vector;
    StructType *hipVectorNativeI8_3Base;

    StructType *I32_4;
    StructType *hipVectorI32_4Base;
    StructType *hipVectorI32_4Type;
    StructType *unionI32_4Vector;

    StructType *I32_2;
    StructType *hipVectorI32_2Base;
    StructType *hipVectorI32_2Type;
    StructType *unionI32_2Vector;

    std::unordered_set<std::string> cudaVectorTypes { 
      "struct.uchar3", 
      "struct.uint4", 
      "struct.int2",
      "struct.float4"
    };

    // named structs specific to the Module (StringMap<StructType *> llvm::LLVMContextImpl::NamedStructTypes)

    // StructType
    // StructType
    // StructType 
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
      auto I32 = Type::getInt32Ty(context);
      auto I8 = Type::getInt8Ty(context);
   
   
      // float4
      vectorFloat_4Type = VectorType::get(floatType, 4, false);
      unionFloat4Vector = StructType::create(context, "union_float4.anon"); 
      unionFloat4Vector->setBody(vectorFloat_4Type);

      hipVectorFloat4Base = StructType::create(context, "struct.HIP_vector_base_float.4");
      hipVectorFloat4Base->setBody(unionFloat4Vector);

      hipVectorFloat4Type = StructType::create(context, "struct.HIP_vector_type_float.4");
      hipVectorFloat4Type->setBody(hipVectorFloat4Base);

      structFloat4 = StructType::create(context, "struct.float4.anon");
      structFloat4->setBody({floatType, floatType , floatType, floatType}, /* packed */ false); // Set the body of the aggregate


      // float2
      vectorFloat_2Type = VectorType::get(floatType, 2, false);
      unionFloat_2Vector = StructType::create(context, "union_float2.anon"); 
      unionFloat_2Vector->setBody(vectorFloat_2Type);

      hipVectorFloat_2Base = StructType::create(context, "struct.HIP_vector_base_float.2");
      hipVectorFloat_2Base->setBody(unionFloat_2Vector);

      hipVectorFloat_2Type = StructType::create(context, "struct.HIP_vector_type_float.2");
      hipVectorFloat_2Type->setBody(hipVectorFloat_2Base);

      Float_2 = StructType::create(context, "struct.float2.anon");
      Float_2->setBody({floatType, floatType }, /* packed */ false); // Set the body of the aggregate

      //uint4
      vectorI32_4Type = VectorType::get(I32, 4, false);
      unionI32_4Vector = StructType::create(context, "union_i32_4.anon"); 
      unionI32_4Vector->setBody( vectorI32_4Type);

      hipVectorI32_4Base = StructType::create(context, "struct.HIP_vector_base_int.4");
      hipVectorI32_4Base->setBody(unionI32_4Vector);

      hipVectorI32_4Type = StructType::create(context, "struct.HIP_vector_type_int.4");
      hipVectorI32_4Type->setBody(hipVectorI32_4Base);

      I32_4 = StructType::create(context, "struct.i32_4.anon");
      I32_4->setBody({I32, I32, I32, I32 }, /* packed */ false); // Set the body of the aggregate


      //uint2
      vectorI32_2Type = VectorType::get(I32, 2, false);
      unionI32_2Vector = StructType::create(context, "union_I32_2.anon"); 
      unionI32_2Vector->setBody( vectorI32_2Type);

      hipVectorI32_2Base = StructType::create(context, "struct.HIP_vector_base_int.2");
      hipVectorI32_2Base->setBody(unionI32_2Vector);

      hipVectorI32_2Type = StructType::create(context, "struct.HIP_vector_type_int.2");
      hipVectorI32_2Type->setBody(hipVectorI32_2Base);

      I32_2 = StructType::create(context, "struct.i32_2.anon");
      I32_2->setBody({I32, I32}, /* packed */ false); // Set the body of the aggregate




      // uchar3 // has another layer // type { [3 x i8] }
      arrayI8_3Type = ArrayType::get(I8, 3);
      hipVectorNativeI8_3Base = StructType::create(context, "struct.HIP_Native_vector_base_i8.3"); 
      hipVectorNativeI8_3Base->setBody(arrayI8_3Type);

      vectorI8_3Type = VectorType::get(I8, 3, false);

      unionI8_3Vector = StructType::create(context, "union_i8_3.anon"); 
      unionI8_3Vector->setBody(hipVectorNativeI8_3Base);

     
      hipVectorI8_3Base = StructType::create(context, "struct.HIP_vector_base_i8.3");
      hipVectorI8_3Base->setBody(unionI8_3Vector);

      hipVectorI8_3Type = StructType::create(context, "struct.HIP_vector_type_i8.3");
      hipVectorI8_3Type->setBody(hipVectorI8_3Base);

      I8_3 = StructType::create(context, "struct.i8_3.anon");
      I8_3->setBody({I8, I8, I8}, /* packed */ false); // Set the body of the aggregate


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

    StructType* getFloat2Struct() {
      return Float_2;
    }

    StructType* getFloat2Base() {
      return hipVectorFloat_2Base;
    }

    StructType* getFloat2Type() {
      return hipVectorFloat_2Type;
    }

    StructType* getFloat2Union() {
      return unionFloat_2Vector;
    }

    StructType* getI8_3Struct() {
      return I8_3;
    }

    StructType* getI8_3Base() {
      return hipVectorI8_3Base;
    }

    StructType* getI8_3Type() {
      return hipVectorI8_3Type;
    }

    StructType* getI8_3Union() {
      return unionI8_3Vector;
    }

    // Maybe char specific
    StructType* getI8_3Native() {
      return hipVectorNativeI8_3Base;
    }

    StructType* getI32_4Struct() {
      return I32_4;
    }

    StructType* getI32_4Base() {
      return hipVectorI32_4Base;
    }

    StructType* getI32_4Type() {
      return hipVectorI32_4Type;
    }

    StructType* getI32_4Union() {
      return unionI32_4Vector;
    }

    StructType* getI32_2Struct() {
      return I32_2;
    }

    StructType* getI32_2Base() {
      return hipVectorI32_2Base;
    }

    StructType* getI32_2Type() {
      return hipVectorI32_2Type;
    }

    StructType* getI32_2Union() {
      return unionI32_2Vector;
    }

    private:
    static CupbopVectorType *instance;
    CupbopVectorType() {}


};



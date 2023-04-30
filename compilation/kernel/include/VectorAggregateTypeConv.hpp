#pragma once
#include "llvm/IR/Module.h"

// class VectorConversions {

//   public:
//   VectorConversions(llvm::Module &M);
//   VectorConversions(llvm::Function &F);
//   void modifyTypes();
//   void getModifiableStructTypes();

//   private:
//   std::set<Type*> structTypes;
//   std::set<Type*> modifiedStructTypes;
//   void getStructTypes(Type* structType);
//   void modifyStructType(Type* structType);
  
// };
void ConvertVector(llvm::Module&);
void ConvertVectorCheck(llvm::Module&);
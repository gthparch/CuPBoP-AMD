
#pragma once
#include "llvm/IR/Instructions.h"
#include "llvm/IR/LLVMContext.h"
#include "llvm/IR/Module.h"
#include "llvm/Pass.h"

namespace cupbop {
namespace amd {
namespace passes {
class GridBlockPass : public llvm::FunctionPass {
  public:
    static char ID;
    
    GridBlockPass();
    virtual bool runOnFunction(llvm::Function &F);
};
} // namespace passes
} // namespace amd
} // namespace cupbop

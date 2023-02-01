#pragma once

#include "llvm/IR/Function.h"
#include "llvm/IR/Instructions.h"
#include "llvm/IR/LLVMContext.h"
#include "llvm/IR/Module.h"
#include "llvm/Pass.h"

namespace cupbop {
namespace amd {
namespace passes {
class CUDA2AMDKernelFormatPass : public llvm::FunctionPass {
  public:
    static char ID;
    CUDA2AMDKernelFormatPass();
    virtual bool runOnFunction(llvm::Function &F);
};
} // namespace passes
} // namespace amd
} // namespace cupbop

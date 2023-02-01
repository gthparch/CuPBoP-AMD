#pragma once

#include "llvm/IR/Function.h"
#include "llvm/IR/Instructions.h"
#include "llvm/IR/LLVMContext.h"
#include "llvm/IR/Module.h"
#include "llvm/Pass.h"

namespace cupbop {
namespace amd {
namespace passes {
class CUDA2AMDModuleFormatPass : public llvm::ModulePass {
  public:
    static char ID;
    CUDA2AMDModuleFormatPass();
    virtual bool runOnModule(llvm::Module &M);
};
} // namespace passes
} // namespace amd
} // namespace cupbop

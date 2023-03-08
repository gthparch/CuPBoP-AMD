#pragma once
#include "llvm/Pass.h"

namespace cupbop {
namespace amd {
namespace passes {
class SharedMemoryPass : public llvm::ModulePass {
  public:
    static char ID;
    
    SharedMemoryPass();
    virtual bool runOnModule(llvm::Module &M);
};
} // namespace passes
} // namespace amd
} // namespace cupbop

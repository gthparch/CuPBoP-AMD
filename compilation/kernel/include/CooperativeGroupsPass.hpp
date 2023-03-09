#pragma once
#include "llvm/Pass.h"

namespace cupbop {
namespace amd {
namespace passes {
class CooperativeGroupsPass : public llvm::ModulePass {
  public:
    static char ID;
    
    CooperativeGroupsPass();
    virtual bool runOnModule(llvm::Module &M);

  private:
    bool processFunction(llvm::Module &M, llvm::Function &F);
};
} // namespace passes
} // namespace amd
} // namespace cupbop


#pragma once
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

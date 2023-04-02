
#pragma once
#include "llvm/Pass.h"

namespace cupbop {
namespace amd {
namespace passes {
class VectorPass : public llvm::FunctionPass {
  public:
    static char ID;
    
    VectorPass();
    virtual bool runOnFunction(llvm::Function &F);
};
} // namespace passes
} // namespace amd
} // namespace cupbop


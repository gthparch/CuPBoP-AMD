#pragma once
#include "llvm/Pass.h"

namespace cupbop {
namespace amd {
namespace passes {
class AddressSpaceCastPass : public llvm::FunctionPass {
  public:
    static char ID;
    AddressSpaceCastPass();
    virtual bool runOnFunction(llvm::Function &F);
};
} // namespace passes
} // namespace amd
} // namespace cupbop

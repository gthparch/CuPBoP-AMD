#pragma once
#include "llvm/Pass.h"

namespace cupbop {
namespace amd {
namespace passes {
class TransformVPrintfPass : public llvm::FunctionPass {
  public:
    static char ID;
    TransformVPrintfPass();
    virtual bool runOnFunction(llvm::Function &F);
};
} // namespace passes
}; // namespace amd
}; // namespace cupbop

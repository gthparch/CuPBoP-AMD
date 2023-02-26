#pragma once

#include "llvm/Pass.h"

namespace cupbop {
namespace amd {
namespace passes {
class TextureTransformPass : public llvm::FunctionPass {
  public:
    static char ID;
    
    TextureTransformPass();
    virtual bool runOnFunction(llvm::Function &F);
};
} // namespace passes
} // namespace amd
} // namespace cupbop

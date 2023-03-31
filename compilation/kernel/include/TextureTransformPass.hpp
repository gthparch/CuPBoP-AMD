#pragma once
#include "llvm/Pass.h"

namespace cupbop {
namespace amd {
namespace passes {
class TextureTransformPass : public llvm::ModulePass  {
  public:
    static char ID;
    
    TextureTransformPass();
    virtual bool runOnModule(llvm::Module &M);
};
} // namespace passes
} // namespace amd
} // namespace cupbop

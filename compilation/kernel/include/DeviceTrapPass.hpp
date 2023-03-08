#pragma once

#include "llvm/Pass.h"
#include "llvm/IR/IRBuilder.h"

// Forward declarations
namespace llvm {
  class Function;
  class CallInst;
}

namespace cupbop {
namespace amd {
namespace passes {
/// \brief This pass adds the proper address space attributes to the kernel arguments.
///
/// This pass uses the calling convention of the functions to detect kernels. So the proper
/// pass that transforms the calling convention of the kernels must be run before this pass.
class DeviceTrapPass : public llvm::FunctionPass {
  public:
    static char ID;
    DeviceTrapPass();
    virtual bool runOnFunction(llvm::Function &M);
  
  private:
    bool handleInlineAsmCall(llvm::Function &F, llvm::IRBuilder<> &builder, llvm::CallInst *callInst);
};
} // namespace passes
} // namespace amd
} // namespace cupbop

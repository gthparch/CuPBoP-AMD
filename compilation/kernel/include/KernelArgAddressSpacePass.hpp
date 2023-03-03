#pragma once
#include "llvm/Pass.h"

namespace cupbop {
namespace amd {
namespace passes {
/// \brief This pass adds the proper address space attributes to the kernel arguments.
///
/// This pass uses the calling convention of the functions to detect kernels. So the proper
/// pass that transforms the calling convention of the kernels must be run before this pass.
class KernelArgAddressSpacePass : public llvm::ModulePass {
  public:
    static char ID;
    KernelArgAddressSpacePass();
    virtual bool runOnModule(llvm::Module &M);
  
  private:
    llvm::Function* processKernel(llvm::Module &M, llvm::Function &F);
};
} // namespace passes
} // namespace amd
} // namespace cupbop

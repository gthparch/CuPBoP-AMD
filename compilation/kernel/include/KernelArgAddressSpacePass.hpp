// Copyright © 2023
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

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

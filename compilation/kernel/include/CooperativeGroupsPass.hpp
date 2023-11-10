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

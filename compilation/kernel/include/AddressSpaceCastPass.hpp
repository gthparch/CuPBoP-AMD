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
/// @brief Adds the proper address space casts to pointer operations.
///
/// This pass adds the proper address space casts to pointer operations.
/// * Alloca instructions are replaced with an alloca in the private address
/// space. This is required because alloca in the flat space will error out with
/// the AMDGPU backend.
/// * Store instructions that writes to a non-flatspace pointer are prepended by
/// a cast operation, which casts the pointer to the flat space.
/// * GEP instructions that indexes into a non-flatspace pointer are prepended
/// by a cast operation, which casts the first pointer to the flat space.
class AddressSpaceCastPass : public llvm::FunctionPass {
  public:
    static char ID;
    AddressSpaceCastPass();
    virtual bool runOnFunction(llvm::Function &F);
};
} // namespace passes
} // namespace amd
} // namespace cupbop

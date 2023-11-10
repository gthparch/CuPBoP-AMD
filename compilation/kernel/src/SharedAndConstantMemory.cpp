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

/**
 * Constant and Dynamic Shared Memory Changes
 */

#include <iostream>
#include <memory>
#include <queue>
#include <set>
#include <utility>
#include <vector>

#include "llvm/IR/DerivedTypes.h"
#include "llvm/IR/GlobalValue.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/Value.h"
#include "llvm/Pass.h"

#include "SharedMemory.hpp"

using namespace llvm;
using namespace cupbop::amd::passes;

namespace {
static RegisterPass<SharedMemoryPass>
    cudaamd_shared_memory_pass("cudaamd-shared-memory-pass",
                               "Set proper metadata for CUDA shared memories");
}; // namespace

char SharedMemoryPass::ID = 0;

SharedMemoryPass::SharedMemoryPass() : ModulePass(ID) {}

bool SharedMemoryPass::runOnModule(Module &M) {
    std::cout << "Running Shared Memory Process on Module " << std::endl;

    for (auto I = M.global_begin(), E = M.global_end(); I != E; ++I) {
        if (GlobalVariable *constant_memory = dyn_cast<GlobalVariable>(I)) {
            if (auto PT = dyn_cast<PointerType>(I->getType())) {
                unsigned AS = PT->getAddressSpace();
                if (AS == 3) {
                    std::cout << "Shared Memory Variable: "
                              << constant_memory->getName().str() << std::endl;
                    if (constant_memory->hasInternalLinkage()) {
                        // change alignment to 16
                        constant_memory->setAlignment(MaybeAlign(16));
                    } else if (constant_memory->hasExternalLinkage()) {
                        // dynamic shared memory : change dso_local to hidden
                        constant_memory->setDSOLocal(false);
                        constant_memory->setVisibility(
                            llvm::GlobalValue::VisibilityTypes::
                                HiddenVisibility);
                    }
                } else if (AS == 4) {
                    if (constant_memory->hasExternalLinkage()) {
                        std::cout << "Constant Memory Variable: "
                                  << constant_memory->getName().str()
                                  << std::endl;
                        constant_memory->setAlignment(MaybeAlign(16));
                    }
                }
            }
        }
    }

    return true;
}
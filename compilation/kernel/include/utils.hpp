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
#include "llvm/IR/Module.h"
#include "llvm/IR/GlobalVariable.h"

std::vector<llvm::Function*> discover_cuda_kernels(llvm::Module&);
std::vector<llvm::GlobalVariable*> discover_texture_memory(llvm::Module&);
void VerifyModule(llvm::Module&);
std::string type_to_string(llvm::Type&);
bool is_cuda_kernel(llvm::Function &F);
std::string llvm_to_string(const llvm::Value &V);
std::string llvm_type_to_string(const llvm::Type &Ty);
bool isCudaBuiltin(std::string  functionName); 

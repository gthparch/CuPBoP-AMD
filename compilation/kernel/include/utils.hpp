#pragma once

#include "llvm/IR/Instructions.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/GlobalVariable.h"


std::vector<llvm::Function*> discover_cuda_kernels(llvm::Module&);
std::vector<llvm::GlobalVariable*> discover_texture_memory(llvm::Module&);
void VerifyModule(llvm::Module&);
std::string type_to_string(llvm::Type&);
bool is_cuda_kernel(llvm::Function &F);

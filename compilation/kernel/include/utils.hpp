#pragma once

#include "llvm/IR/Instructions.h"
#include "llvm/IR/Module.h"

std::vector<llvm::Function*> discover_cuda_kernels(llvm::Module&);
void VerifyModule(llvm::Module&);
std::string type_to_string(llvm::Type&);

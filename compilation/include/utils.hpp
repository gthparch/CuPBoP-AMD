#pragma once

#include "llvm/IR/Instructions.h"
#include "llvm/IR/Module.h"

std::vector<llvm::Function*> discover_cuda_kernels(llvm::Module&);

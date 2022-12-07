#pragma once

#include "llvm/IR/Instructions.h"
#include "llvm/IR/Module.h"



void init_amdgpu(llvm::Module& M);
void replace_intrinsics(llvm::Module&, llvm::Function&);
void convert_kernel(llvm::Module&, llvm::Function&);



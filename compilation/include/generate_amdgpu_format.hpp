#pragma once

#include "llvm/IR/Instructions.h"
#include "llvm/IR/Module.h"

void generate_amdgpu_format(llvm::Module&);
void replace_intrinsics(llvm::Module&, llvm::Function&);
void convert_kernel(llvm::Module&, llvm::Function&);


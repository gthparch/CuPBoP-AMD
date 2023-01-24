#pragma once
#include "llvm/IR/Instructions.h"
#include "llvm/IR/LLVMContext.h"
#include "llvm/IR/Module.h"


void address_space_pass(llvm::Module& M);
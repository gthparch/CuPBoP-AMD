#pragma once
#include "llvm/ADT/StringRef.h"
#include "llvm/IR/Module.h"

void fatbin_convert(llvm::StringRef Filename, llvm::Module &M);

// std::string str (mb.getBufferStart(), getBufferEnd());
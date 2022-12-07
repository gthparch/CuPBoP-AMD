
#include "llvm/IR/Module.h"
#include "llvm/ADT/StringRef.h"
#include <llvm/IRReader/IRReader.h>
#include <llvm/IR/LLVMContext.h>
#include <llvm/Support/SourceMgr.h>
#include <llvm/Support/ToolOutputFile.h>
#include <llvm/Bitcode/BitcodeWriter.h>
#include <llvm/Support/FileSystem.h>

void fatbin_convert(llvm::StringRef Filename, llvm::Module& M);

// std::string str (mb.getBufferStart(), getBufferEnd());
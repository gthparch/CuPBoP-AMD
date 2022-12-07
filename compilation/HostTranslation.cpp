
#include <iostream>
#include <cassert>
#include <string>

#include <llvm/IR/Module.h>
#include <llvm/IRReader/IRReader.h>
#include <llvm/IR/LLVMContext.h>
#include <llvm/Support/SourceMgr.h>
#include <llvm/Support/ToolOutputFile.h>
#include <llvm/Bitcode/BitcodeWriter.h>
#include <llvm/Support/FileSystem.h>

#include "cupbop_amd.hpp"
#include "fatbin_convert.hpp"

using namespace llvm;


LLVMContext& getCupbopLLVMContext() {
    static LLVMContext context;
    return context;
}

int main(const int argc, const char* argv[]) {
  // host file, fatbin file
  assert(argc == 3);

  // Parse File
  SMDiagnostic diagOut;
  auto M = parseIRFile(argv[1], diagOut, getCupbopLLVMContext());

  if (!M) {
      diagOut.print(argv[0], errs());
      return 1;
  }

  fatbin_convert(argv[2], *M);



  return 0;



}
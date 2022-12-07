
#include "llvm/IR/Module.h"
#include "llvm/ADT/StringRef.h"
#include <llvm/IRReader/IRReader.h>
#include <llvm/IR/LLVMContext.h>
#include <llvm/Support/SourceMgr.h>
#include <llvm/Support/ToolOutputFile.h>
#include <llvm/Bitcode/BitcodeWriter.h>
#include <llvm/Support/FileSystem.h>

#include <fstream>

#include "fatbin_convert.hpp" 

using namespace std;

using namespace llvm;

void fatbin_convert(llvm::StringRef FileName, Module& M) {


  llvm::ErrorOr<std::unique_ptr<llvm::MemoryBuffer>> GpuBinaryOrErr =
      llvm::MemoryBuffer::getFileOrSTDIN(FileName);
  if (std::error_code EC = GpuBinaryOrErr.getError()) {
    errs() << " Fat binary file cannot open.\n";
  }

  // convert fat binary to string 
  std::unique_ptr< MemoryBuffer > mb = std::move(*GpuBinaryOrErr);
  std::string str (mb->getBufferStart(), mb->getBufferEnd());


  std::ofstream myfile;
  myfile.open ("fatbintest.txt");
  myfile << str;
  myfile.close();
  

  // check the string fat binary


  
}
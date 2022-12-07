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

// #include "cupbop_amd.hpp"
// #include "kernel_translator.hpp"
#include "init_amdgpu.hpp"
#include "generate_amdgpu_format.hpp"

using namespace llvm;

LLVMContext& getCupbopLLVMContext() {
    static LLVMContext context;
    return context;
}

int main(const int argc, const char* argv[]) {
    assert(argc == 2);

    // Parse File
    SMDiagnostic diagOut;
    auto M = parseIRFile(argv[1], diagOut, getCupbopLLVMContext());

    if (!M) {
        diagOut.print(argv[0], errs());
        return 1;
    }

    // Remove Metadata
    init_amdgpu(*M);
   
    // generate AMD GPU format
    generate_amdgpu_format(*M);

    // Optimize Kernel Code 







    //Write to Output
    std::error_code writeError;
    auto outputFilename = std::string(argv[1]) + ".translated_test.bc";
    ToolOutputFile toolOutput (outputFilename.data(), writeError, sys::fs::OF_None);
    WriteBitcodeToFile(*M, toolOutput.os());
    toolOutput.keep();

    return 0;
}

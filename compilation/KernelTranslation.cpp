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
#include "kernel_translator.hpp"

using namespace llvm;
using namespace cupbop::kernel;
using namespace cupbop::amd::kernel;

LLVMContext& getCupbopLLVMContext() {
    static LLVMContext context;
    return context;
}

int main(const int argc, const char* argv[]) {
    assert(argc == 2);

    SMDiagnostic diagOut;
    auto M = parseIRFile(argv[1], diagOut, getCupbopLLVMContext());

    if (!M) {
        diagOut.print(argv[0], errs());
        return 1;
    }

    transform_metadata(*M);

    std::vector<llvm::Function*> kernels = discover_cuda_kernels(*M);

    for (auto* kernel : kernels) {
        convert_kernel(*M, *kernel);
        replace_intrinsics(*M, *kernel);
    }

    std::error_code writeError;
    auto outputFilename = std::string(argv[1]) + ".translated.bc";
    ToolOutputFile toolOutput (outputFilename.data(), writeError, sys::fs::OF_None);
    WriteBitcodeToFile(*M, toolOutput.os());
    toolOutput.keep();

    return 0;
}

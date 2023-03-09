#include <cassert>
#include <iostream>
#include <string>

#include "llvm/Analysis/CGSCCPassManager.h"
#include "llvm/Bitcode/BitcodeWriter.h"
#include "llvm/IR/LLVMContext.h"
#include "llvm/IR/LegacyPassManager.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/PassManager.h"
#include "llvm/IRReader/IRReader.h"
#include "llvm/PassInfo.h"
#include "llvm/PassRegistry.h"
#include "llvm/Passes/OptimizationLevel.h"
#include "llvm/Support/CommandLine.h"
#include "llvm/Support/FileSystem.h"
#include "llvm/Support/SourceMgr.h"
#include "llvm/Support/ToolOutputFile.h"
#include "llvm/Transforms/Utils/BasicBlockUtils.h"

#include "ChangeAtomics.hpp"
#include "TransformTexture.hpp"
#include "cupbop_amd.hpp"
#include "utils.hpp"

using namespace llvm;

LLVMContext &getCupbopLLVMContext() {
    static LLVMContext context;
    return context;
}

Pass *createRegisteredPass(std::string id) {
    static auto registry = PassRegistry::getPassRegistry();
    const PassInfo *registeredPassInfo = registry->getPassInfo(StringRef(id));
    assert(registeredPassInfo != nullptr);
    return registeredPassInfo->createPass();
}

int main(const int argc, const char *argv[]) {
    assert(argc == 2);

    // Parse File
    SMDiagnostic diagOut;

    auto M = parseIRFile(argv[1], diagOut, getCupbopLLVMContext());

    if (!M) {
        diagOut.print(argv[0], errs());
        return 1;
    }

    legacy::PassManager PM, MetadataPM;

    // First run the metadata passes
    PM.add(createRegisteredPass("cuda2amd-module-format"));
    PM.add(createRegisteredPass("cuda2amd-kernel-format"));
    PM.add(createRegisteredPass("grid-block-conversion"));
    PM.add(createRegisteredPass("transform-cuda-vprintf"));
    PM.add(createRegisteredPass("transform-cuda-math-fn"));
    PM.add(createRegisteredPass("cudaamd-shared-memory-pass"));
    PM.add(createRegisteredPass("cuda-texture-transform"));
    PM.add(createRegisteredPass("kernel-arg-address-space"));
    PM.add(createRegisteredPass("address-space-cast"));
    PM.add(createRegisteredPass("device-trap"));
    PM.add(createRegisteredPass("cooperative-groups"));

    PM.run(*M);

    // Change Atomics
    changeAtomics(*M);

    // Transform Texture Memory
    transformTexture(*M);

    VerifyModule(*M);

    // Write to Output
    std::error_code writeError;
    auto outputFilename = std::string(argv[1]) + ".translated_test.bc";
    ToolOutputFile toolOutput(outputFilename.data(), writeError,
                              sys::fs::OF_None);
    WriteBitcodeToFile(*M, toolOutput.os());
    toolOutput.keep();

    return 0;
}

// Copyright © 2023
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

#include <cassert>
#include <cstdlib>
#include <iostream>
#include <string>
#include <unistd.h>

#include "llvm/Bitcode/BitcodeWriter.h"
#include "llvm/IR/LLVMContext.h"
#include "llvm/IR/Module.h"
#include "llvm/IRReader/IRReader.h"
#include "llvm/Support/FileSystem.h"
#include "llvm/Support/SourceMgr.h"
#include "llvm/Support/ToolOutputFile.h"

#include "cupbop_amd.hpp"
#include "fatbin_convert.hpp"

using namespace llvm;

LLVMContext &getCupbopLLVMContext() {
    static LLVMContext context;
    return context;
}

int main(const int argc, const char *argv[]) {
    // host file, fatbin file
    printf("argc=%d\n", argc);
    assert(argc == 3);

    // Parse File
    SMDiagnostic diagOut;
    auto M = parseIRFile(argv[1], diagOut, getCupbopLLVMContext());

    if (!M) {
        diagOut.print(argv[0], errs());
        return 1;
    }

    fatbin_convert(argv[2], *M);

    // remove currently unused functions:

    // std::set<Function*> need_remove;

    // Write to Output
    {
        std::error_code writeError;
        auto outputFilename = std::string(argv[1]) + ".translated_test.bc";
        ToolOutputFile toolOutput(outputFilename.data(), writeError,
                              sys::fs::OF_None);
        WriteBitcodeToFile(*M, toolOutput.os());
        toolOutput.keep();
        toolOutput.os().flush();
        toolOutput.os().close();
    }

    fprintf(stdout, "Conversion done.");

    // TODO: diagnose why LLVM cleanup fails.
    std::quick_exit(0);
    return 0;
}

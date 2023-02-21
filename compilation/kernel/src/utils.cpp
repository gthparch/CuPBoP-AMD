#include "llvm/Bitcode/BitcodeWriter.h"
#include "llvm/IR/Constants.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/GlobalValue.h"
#include "llvm/IR/IRBuilder.h"
#include "llvm/IR/InlineAsm.h"
#include "llvm/IR/Instructions.h"
#include "llvm/IR/LLVMContext.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/Verifier.h"
#include "llvm/IRReader/IRReader.h"
#include "llvm/Support/ToolOutputFile.h"
#include "llvm/Transforms/Utils/Cloning.h"
#include "llvm/Transforms/Utils/ValueMapper.h"
#include <iostream>

#include "utils.hpp"

using namespace llvm;

std::string type_to_string(Type &T) {
    std::string type_str;
    llvm::raw_string_ostream rso(type_str);
    T.print(rso);
    return type_str;
}

bool is_cuda_kernel(Function &F) {
    auto &M = *F.getParent();
    auto allCudaKernelsInModule = discover_cuda_kernels(M);
    return std::find(allCudaKernelsInModule.begin(),
                     allCudaKernelsInModule.end(),
                     &F) != allCudaKernelsInModule.end();
}

std::vector<Function *> discover_cuda_kernels(Module &M) {
    std::vector<Function *> kernels;
    auto *nvvmAnnotation = M.getNamedMetadata("nvvm.annotations");

    if (nvvmAnnotation == nullptr) {
        fprintf(stderr, "No nvvm.annotations metadata found in module! No "
                        "kernels will be translated.\n");
        return kernels;
    }

    auto numKernels = nvvmAnnotation->getNumOperands();
    for (unsigned int i = 0; i < numKernels; ++i) {
        auto *metadataNode = nvvmAnnotation->getOperand(i);
        if (!metadataNode || metadataNode->getNumOperands() != 3) {
            continue;
        }

        auto *metadataClassification =
            dyn_cast<MDString>(metadataNode->getOperand(1));

        if (metadataClassification &&
            metadataClassification->getString() == "kernel") {
            auto *metadatFnValue =
                dyn_cast<ValueAsMetadata>(metadataNode->getOperand(0));
            auto *fn = dyn_cast<Function>(metadatFnValue->getValue());
            if (fn) {
                kernels.push_back(fn);
            }
        }
    }

    return kernels;
}

void VerifyModule(llvm::Module &M) {
    std::string msg;
    llvm::raw_string_ostream os(msg);
    if (llvm::verifyModule(M, &(llvm::errs())))
        llvm::report_fatal_error(os.str().c_str());
}
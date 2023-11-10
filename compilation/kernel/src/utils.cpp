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

#include <iostream>

#include "llvm/IR/Function.h"
#include "llvm/IR/GlobalValue.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/Verifier.h"

#include "utils.hpp"
#include <string_view>

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

std::vector<GlobalVariable *> discover_texture_memory(Module &M) {
    std::vector<GlobalVariable *> texture;
    auto *nvvmAnnotation = M.getNamedMetadata("nvvm.annotations");
    if (!nvvmAnnotation) {
        return texture;
    }

    auto numTextures = nvvmAnnotation->getNumOperands();

    if (nvvmAnnotation == nullptr) {
        fprintf(stderr, "No nvvm.annotations metadata found in module! No "
                        "texture memory will be translated.\n");
        return texture;
    }

    for (unsigned int i = 0; i < numTextures; ++i) {
        auto *metadataNode = nvvmAnnotation->getOperand(i);
        if (!metadataNode || metadataNode->getNumOperands() != 3) {
            continue;
        }

        auto *metadataClassification =
            dyn_cast<MDString>(metadataNode->getOperand(1));

        if (metadataClassification &&
            metadataClassification->getString() == "texture") {
            auto *metadatFnValue =
                dyn_cast<ValueAsMetadata>(metadataNode->getOperand(0));
            auto *fn = dyn_cast<GlobalVariable>(metadatFnValue->getValue());
            if (fn) {
                texture.push_back(fn);
            }
        }
    }

    return texture;
}

/*
    function with string "__cuda_" maybe cuda builtin
*/

bool isCudaBuiltin(std::string  functionName) {

    if (functionName.find("__cuda_") != std::string::npos) {
        return true;
    }
    if (functionName.find("_builtin_") != std::string::npos) {
        return true;
    }
    if (functionName.find("__nv_") != std::string::npos) {
        return true;
    }
    if (functionName.find("llvm.") != std::string::npos) {
        return true;
    }
     if (functionName.find(".nvvm.") != std::string::npos) {
        return true;
    }

    return false;
}


void VerifyModule(llvm::Module &M) {
    fprintf(stdout, "Verifying module...\n");
    std::string msg;
    llvm::raw_string_ostream os(msg);
    if (llvm::verifyModule(M, &os))
        llvm::report_fatal_error(os.str().c_str());
}

std::string llvm_to_string(const llvm::Value &V) {
    std::string res;
    llvm::raw_string_ostream(res) << V;
    return res;
}

std::string llvm_type_to_string(const llvm::Type &Ty) {
    std::string res;
    llvm::raw_string_ostream(res) << Ty;
    return res;
}

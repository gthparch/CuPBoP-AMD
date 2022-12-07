#include "llvm/IR/Module.h"

#include "utils.hpp"

using namespace llvm;

std::vector<Function*> discover_cuda_kernels(Module& M) {
    std::vector<Function*> kernels;
    auto* nvvmAnnotation = M.getNamedMetadata("nvvm.annotations");
    auto numKernels = nvvmAnnotation->getNumOperands();

    if (nvvmAnnotation == nullptr) {
        fprintf(stderr, "No nvvm.annotations metadata found in module! No kernels will be translated.\n");
        return kernels;
    }

    for (unsigned int i = 0; i < numKernels; ++i) {
        auto* metadataNode = nvvmAnnotation->getOperand(i);
        if (!metadataNode || metadataNode->getNumOperands() != 3) {
            continue;
        }

        auto* metadataClassification = dyn_cast<MDString>(metadataNode->getOperand(1));

        if (metadataClassification && metadataClassification->getString() == "kernel") {
            auto* metadatFnValue = dyn_cast<ValueAsMetadata>(metadataNode->getOperand(0));
            auto* fn = dyn_cast<Function>(metadatFnValue->getValue());
            if (fn) {
                kernels.push_back(fn);
            }
        }
    }

    return kernels;
}

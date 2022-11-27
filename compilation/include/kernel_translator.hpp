#pragma once

#include "llvm/IR/Instructions.h"
#include "llvm/IR/Module.h"

namespace cupbop::amd::kernel {
    void transform_metadata(llvm::Module&);
    void replace_intrinsics(llvm::Module&, llvm::Function&);
    void convert_kernel(llvm::Module&, llvm::Function&);
}

namespace cupbop::kernel {
    std::vector<llvm::Function*> discover_cuda_kernels(llvm::Module&);
}

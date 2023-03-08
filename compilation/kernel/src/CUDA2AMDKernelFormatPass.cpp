#include <functional>
#include <string>
#include <unordered_map>

#include "llvm/IR/CallingConv.h"
#include "llvm/Pass.h"

#include "CUDA2AMDKernelFormatPass.hpp"
#include "utils.hpp"

using namespace llvm;
using namespace cupbop::amd::passes;

namespace {
static RegisterPass<CUDA2AMDKernelFormatPass>
    cuda2amd_module_format("cuda2amd-kernel-format", "Transform kernel format");
}

char CUDA2AMDKernelFormatPass::ID = 0;

CUDA2AMDKernelFormatPass::CUDA2AMDKernelFormatPass() : FunctionPass(ID) {}

bool CUDA2AMDKernelFormatPass::runOnFunction(Function &F) {
    SmallVector<std::pair<unsigned, MDNode *>, 4> MDs;
    F.getAllMetadata(MDs);
    // for (auto &MD : MDs) {
    //     F.setMetadata(MD.first, NULL);
    // }
    F.removeFnAttr("target-features");
    F.removeFnAttr("target-cpu");

    if (is_cuda_kernel(F)) {
        printf("Identified a new cuda kernel %s\n", F.getName().bytes_begin());
        F.setCallingConv(CallingConv::AMDGPU_KERNEL);
    }

    return true;
}

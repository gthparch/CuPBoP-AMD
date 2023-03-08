#include <functional>
#include <string>
#include <unordered_map>

#include "llvm/IR/Module.h"
#include "llvm/Pass.h"

#include "CUDA2AMDModuleFormatPass.hpp"

using namespace llvm;
using namespace cupbop::amd::passes;

namespace {
static RegisterPass<CUDA2AMDModuleFormatPass> cuda2amd_module_format(
    "cuda2amd-module-format",
    "Transform module format to be compatible with AMDGPU");
} // namespace

char CUDA2AMDModuleFormatPass::ID = 0;

CUDA2AMDModuleFormatPass::CUDA2AMDModuleFormatPass() : llvm::ModulePass(ID) {}

bool CUDA2AMDModuleFormatPass::runOnModule(llvm::Module &M) {
    // Set correct data layout and update triples
    M.setDataLayout("e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5"
                    ":32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48"
                    ":64-v96:128-v192:256-v256:256-v512:512-v1024"
                    ":1024-v2048:2048-n32:64-S32-A5-G1-ni:7");
    M.setTargetTriple("amdgcn-amd-amdhsa");
    return true;
}

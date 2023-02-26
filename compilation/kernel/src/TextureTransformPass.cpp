#include <string>

#include "llvm/Demangle/Demangle.h"
#include "llvm/IR/Instructions.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/InstIterator.h"
#include "llvm/Transforms/Utils/BasicBlockUtils.h"

#include "TextureTransformPass.hpp"
#include "utils.hpp"

using namespace llvm;
using namespace cupbop::amd::passes;

namespace {
static RegisterPass<TextureTransformPass>
    texture_transform_pass("cuda-texture-transform",
                            "Converts CUDA texture operations to HIP compatible ones");
}; // namespace

char TextureTransformPass::ID = 0;

TextureTransformPass::TextureTransformPass() : FunctionPass(ID) {}

bool TextureTransformPass::runOnFunction(Function &F) {
    for (auto& inst : instructions(F)) {
        if (auto* callInst = dyn_cast<CallInst>(&inst)) {
            auto* instCalledFn = callInst->getCalledFunction();
            if (instCalledFn) {
                auto calledFnName = instCalledFn->getName();
                auto demangledFnName = demangle(std::string(calledFnName));
                fprintf(stdout, "Fn name %s demangled to %s\n", calledFnName.data(), demangledFnName.data());
            }
        }
    }
    return true;
}

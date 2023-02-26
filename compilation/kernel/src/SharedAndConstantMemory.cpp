/**
 * Constant and Dynamic Shared Memory Changes
 */

#include <iostream>
#include <memory>
#include <queue>
#include <set>
#include <utility>
#include <vector>

#include "llvm/IR/CallingConv.h"
#include "llvm/IR/Constants.h"
#include "llvm/IR/IRBuilder.h"
#include "llvm/IR/Instructions.h"
#include "llvm/IR/IntrinsicInst.h"
#include "llvm/IR/Intrinsics.h"
#include "llvm/IR/IntrinsicsAMDGPU.h"
#include "llvm/IR/IntrinsicsNVPTX.h"
#include "llvm/IR/Module.h"

#include "llvm/IR/Function.h"
#include "llvm/Pass.h"
#include "llvm/Support/raw_ostream.h"

#include "llvm/CodeGen/GlobalISel/IRTranslator.h"
#include "llvm/CodeGen/GlobalISel/InstructionSelect.h"
#include "llvm/CodeGen/GlobalISel/Legalizer.h"
#include "llvm/CodeGen/GlobalISel/RegBankSelect.h"
#include "llvm/CodeGen/Passes.h"
#include "llvm/CodeGen/TargetPassConfig.h"
#include "llvm/IR/Attributes.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/LegacyPassManager.h"
#include "llvm/Pass.h"
#include "llvm/PassInfo.h"
#include "llvm/Support/CommandLine.h"
#include "llvm/Support/Compiler.h"
#include "llvm/Target/TargetLoweringObjectFile.h"
#include "llvm/Transforms/IPO.h"
#include "llvm/Transforms/IPO/AlwaysInliner.h"
#include "llvm/Transforms/IPO/PassManagerBuilder.h"
#include "llvm/Transforms/Scalar.h"
#include "llvm/Transforms/Scalar/GVN.h"
#include "llvm/Transforms/Vectorize.h"

#include "llvm/ADT/SmallVector.h"
#include "llvm/ADT/Statistic.h"
#include "llvm/Analysis/LoopInfo.h"
#include "llvm/Analysis/LoopPass.h"
#include "llvm/Analysis/PostDominators.h"
#include "llvm/Analysis/ValueTracking.h"
#include "llvm/IR/DataLayout.h"
#include "llvm/IR/DerivedTypes.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/GlobalValue.h"
#include "llvm/IR/IRBuilder.h"
#include "llvm/IR/InlineAsm.h"
#include "llvm/IR/Instructions.h"
#include "llvm/IR/LLVMContext.h"
#include "llvm/IR/LegacyPassManager.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/Value.h"
#include "llvm/IR/ValueSymbolTable.h"
#include "llvm/InitializePasses.h"
#include "llvm/PassInfo.h"
#include "llvm/PassRegistry.h"
#include "llvm/Support/CommandLine.h"
#include "llvm/Transforms/IPO/PassManagerBuilder.h"
#include "llvm/Transforms/Utils/AMDGPUEmitPrintf.h"
#include "llvm/Transforms/Utils/BasicBlockUtils.h"
#include "llvm/Transforms/Utils/Cloning.h"
#include "llvm/Transforms/Utils/ValueMapper.h"

#include "SharedMemory.hpp"
#include "utils.hpp"
#include "llvm/IR/Module.h"

using namespace llvm;
using namespace cupbop::amd::passes;

namespace {
static RegisterPass<SharedMemoryPass>
    cudaamd_shared_memory_pass("cudaamd-shared-memory-pass",
                            "Set proper metadata for CUDA shared memories");
}; // namespace

char SharedMemoryPass::ID = 0;

SharedMemoryPass::SharedMemoryPass() : ModulePass(ID) {}

bool SharedMemoryPass::runOnModule(Module &M) {
    std::cout << "Running Shared Memory Process on Module " << std::endl;

    for (auto I = M.global_begin(), E = M.global_end(); I != E; ++I) {
        if (GlobalVariable *constant_memory = dyn_cast<GlobalVariable>(I)) {
            if (auto PT = dyn_cast<PointerType>(I->getType())) {
                unsigned AS = PT->getAddressSpace();
                if (AS == 3) {
                    std::cout << "Shared Memory Variable: "
                              << constant_memory->getName().str() << std::endl;
                    if (constant_memory->hasInternalLinkage()) {
                        // change alignment to 16
                        constant_memory->setAlignment(MaybeAlign(16));
                    } else if (constant_memory->hasExternalLinkage()) {
                        // dynamic shared memory : change dso_local to hidden
                        constant_memory->setDSOLocal(false);
                        constant_memory->setVisibility(
                            llvm::GlobalValue::VisibilityTypes::
                                HiddenVisibility);
                    }
                } else if (AS == 4) {
                    if (constant_memory->hasExternalLinkage()) {
                         std::cout << "Constant Memory Variable: "
                              << constant_memory->getName().str() << std::endl;
                        constant_memory->setAlignment(MaybeAlign(16));
                        
                    }


                }
            }
        }
    }

    return true;
}
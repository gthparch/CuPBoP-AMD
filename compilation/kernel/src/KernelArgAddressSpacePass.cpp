#include <iostream>
#include <memory>
#include <queue>
#include <set>
#include <vector>

#include "llvm/ADT/SmallVector.h"
#include "llvm/ADT/Statistic.h"
#include "llvm/Analysis/LoopInfo.h"
#include "llvm/Analysis/LoopPass.h"
#include "llvm/Analysis/PostDominators.h"
#include "llvm/CodeGen/GlobalISel/IRTranslator.h"
#include "llvm/CodeGen/GlobalISel/InstructionSelect.h"
#include "llvm/CodeGen/GlobalISel/Legalizer.h"
#include "llvm/CodeGen/GlobalISel/RegBankSelect.h"
#include "llvm/CodeGen/Passes.h"
#include "llvm/CodeGen/TargetPassConfig.h"
#include "llvm/IR/Attributes.h"
#include "llvm/IR/CallingConv.h"
#include "llvm/IR/DataLayout.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/GlobalValue.h"
#include "llvm/IR/IRBuilder.h"
#include "llvm/IR/InlineAsm.h"
#include "llvm/IR/Instructions.h"
#include "llvm/IR/IntrinsicInst.h"
#include "llvm/IR/Intrinsics.h"
#include "llvm/IR/IntrinsicsAMDGPU.h"
#include "llvm/IR/IntrinsicsNVPTX.h"
#include "llvm/IR/LLVMContext.h"
#include "llvm/IR/LegacyPassManager.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/Value.h"
#include "llvm/IR/ValueSymbolTable.h"
#include "llvm/InitializePasses.h"
#include "llvm/Pass.h"
#include "llvm/PassInfo.h"
#include "llvm/PassRegistry.h"
#include "llvm/Support/CommandLine.h"
#include "llvm/Support/Compiler.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/Target/TargetLoweringObjectFile.h"
#include "llvm/Transforms/IPO.h"
#include "llvm/Transforms/IPO/AlwaysInliner.h"
#include "llvm/Transforms/IPO/PassManagerBuilder.h"
#include "llvm/Transforms/Scalar.h"
#include "llvm/Transforms/Scalar/GVN.h"
#include "llvm/Transforms/Utils/BasicBlockUtils.h"
#include "llvm/Transforms/Utils/Cloning.h"
#include "llvm/Transforms/Utils/ValueMapper.h"
#include "llvm/Transforms/Vectorize.h"

#include "KernelArgAddressSpacePass.hpp"

using namespace llvm;
using namespace cupbop::amd::passes;

KernelArgAddressSpacePass::KernelArgAddressSpacePass() : ModulePass(ID) {}

Function *KernelArgAddressSpacePass::processKernel(Module &M, Function &F) {
    auto &context = M.getContext();
    const auto &dataLayout = M.getDataLayout();
    auto *FTy = F.getFunctionType();
    std::vector<Type *> modifiedParamsTy = {};

    // Add global address space attribute to all pointer arguments to the kernel
    for (auto *paramTy : FTy->params()) {
        if (paramTy->isPointerTy()) {
            auto *ptrTy = cast<PointerType>(paramTy);
            auto *modifiedPtrTy = PointerType::getWithSamePointeeType(
                ptrTy, dataLayout.getDefaultGlobalsAddressSpace());
            modifiedParamsTy.push_back(modifiedPtrTy);
        } else {
            modifiedParamsTy.push_back(paramTy);
        }
    }

    auto *replacementFTy = FunctionType::get(FTy->getReturnType(),
                                             modifiedParamsTy, FTy->isVarArg());
    auto *replacementF =
        Function::Create(replacementFTy, F.getLinkage(), F.getAddressSpace());
    replacementF->copyAttributesFrom(&F);
    replacementF->setCallingConv(F.getCallingConv());
    replacementF->setComdat(F.getComdat());

    // Add the cloned function to the module, taking its name and basic blocks.
    M.getFunctionList().insert(F.getIterator(), replacementF);
    replacementF->takeName(&F);
    replacementF->getBasicBlockList().splice(replacementF->begin(),
                                             F.getBasicBlockList());
    
    // Replace all uses of the parameters from the old function with the new one.
    for (llvm::Function::arg_iterator orgArgIt = F.arg_begin(),
                                      orgArgEnd = F.arg_end(),
                                      newArgIt = replacementF->arg_begin();
         orgArgIt != orgArgEnd; ++orgArgIt, ++newArgIt) {
        newArgIt->takeName(&*orgArgIt);
        orgArgIt->replaceAllUsesWith(newArgIt);
    }

    // Also, we need to remove all metadata from the old function so if any of the metadata
    // must be unique, we won't be violating that constraint.
    SmallVector<std::pair<unsigned, MDNode*>, 4> MDs;
    F.getAllMetadata(MDs);
    for (auto &MD : MDs) {
        replacementF->setMetadata(MD.first, nullptr);
    }

    return replacementF;
}

bool KernelArgAddressSpacePass::runOnModule(Module &M) {
    std::vector<Function*> fnToBeRemoved = {};

    for (auto &F : M) {
        if (F.getCallingConv() == CallingConv::AMDGPU_KERNEL) {
            auto *replacementFn = processKernel(M, F);

            if (replacementFn) {
                F.replaceAllUsesWith(replacementFn);
                F.dropAllReferences();
                fnToBeRemoved.push_back(&F);
            }
        }
    }

    for (auto *fn : fnToBeRemoved) {
        fn->eraseFromParent();
    }

    return true;
}

char KernelArgAddressSpacePass::ID = 0;

namespace {
static RegisterPass<KernelArgAddressSpacePass>
    kernel_arg_address_space("kernel-arg-address-space",
                             "Address Space Cast AMD");
}

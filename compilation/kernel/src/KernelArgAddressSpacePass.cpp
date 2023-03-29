#include <iostream>
#include <memory>
#include <queue>
#include <set>
#include <vector>

#include "llvm/ADT/SmallVector.h"
#include "llvm/IR/CallingConv.h"
#include "llvm/IR/DataLayout.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/GlobalValue.h"
#include "llvm/IR/LLVMContext.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/Value.h"
#include "llvm/Pass.h"

#include "KernelArgAddressSpacePass.hpp"
#include "utils.hpp"

using namespace llvm;
using namespace cupbop::amd::passes;

KernelArgAddressSpacePass::KernelArgAddressSpacePass() : ModulePass(ID) {}

Function *KernelArgAddressSpacePass::processKernel(Module &M, Function &F) {
    auto &context = M.getContext();
    const auto &dataLayout = M.getDataLayout();
    auto *FTy = F.getFunctionType();
    std::vector<Type *> modifiedParamsTy = {};

    // Add global address space attribute to all pointer arguments to the kernel
    // for (auto *paramTy : FTy->params()) {
    //     auto paramTyStr = llvm_type_to_string(*paramTy);
    //     if (paramTy->isPointerTy()) {
    //         auto *ptrTy = cast<PointerType>(paramTy);
    //         auto *modifiedPtrTy = PointerType::getWithSamePointeeType(
    //             ptrTy, dataLayout.getDefaultGlobalsAddressSpace());
    //         modifiedParamsTy.push_back(modifiedPtrTy);
    //     } else {
    //         modifiedParamsTy.push_back(paramTy);
    //     }
    // }

    for (auto argIt = F.arg_begin(), argEnd = F.arg_end(); argIt != argEnd; ++argIt) {
        auto* arg = &*argIt;
        auto* argTy = arg->getType();

        if (argTy->isPointerTy()) {
            auto *ptrTy = cast<PointerType>(argTy);
            auto ptrAS = dataLayout.getDefaultGlobalsAddressSpace();

            // For pass by-value arguments, use constant address space and change it to by-ref instead.
            if (arg->hasByValAttr()) {
                ptrAS = 4; // Constant address space
                auto byValAttr = arg->getAttribute(Attribute::AttrKind::ByVal);
                auto* byValTy = byValAttr.getValueAsType();
                arg->removeAttr(Attribute::AttrKind::ByVal);
                auto byRefAttr = Attribute::getWithByRefType(context, byValTy);
                arg->addAttr(byRefAttr);
            }

            auto *modifiedPtrTy = PointerType::getWithSamePointeeType(ptrTy, ptrAS);
            modifiedParamsTy.push_back(modifiedPtrTy);
        } else {
            modifiedParamsTy.push_back(argTy);
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

    // Replace all uses of the parameters from the old function with the new
    // one.
    for (llvm::Function::arg_iterator orgArgIt = F.arg_begin(),
                                      orgArgEnd = F.arg_end(),
                                      newArgIt = replacementF->arg_begin();
         orgArgIt != orgArgEnd; ++orgArgIt, ++newArgIt) {
        newArgIt->takeName(&*orgArgIt);
        orgArgIt->replaceAllUsesWith(newArgIt);
    }

    // Also, we need to remove all metadata from the old function so if any of
    // the metadata must be unique, we won't be violating that constraint.
    SmallVector<std::pair<unsigned, MDNode *>, 4> MDs;
    F.getAllMetadata(MDs);
    for (auto &MD : MDs) {
        replacementF->setMetadata(MD.first, nullptr);
    }

    return replacementF;
}

bool KernelArgAddressSpacePass::runOnModule(Module &M) {
    std::vector<Function *> fnToBeRemoved = {};

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

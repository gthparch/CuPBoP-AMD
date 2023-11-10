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

#include "DeviceVectorArgPass.hpp"
#include "utils.hpp"
#include "vectorTypes.hpp"

using namespace llvm;
using namespace cupbop::amd::passes;

// Walk through device and kernel functions and redefine CUDA vector types to HIP vectors

VectorArgPass::VectorArgPass() : ModulePass(ID) {}

/*
  Return Type and the Parameter Types are Vectors 
*/
Function *VectorArgPass::processKernel(Module &M, Function &F) {
    auto &context = M.getContext();
    const auto &dataLayout = M.getDataLayout();
    auto *FTy = F.getFunctionType();
    std::vector<Type *> modifiedParamsTy = {};

    // Check if any params are vectors and add then to modify param list
    std::cout << "Process Device Side Vector Function Type " << F.getName().str()  << std::endl;
    
    CupbopVectorType* cvt = CupbopVectorType::getInstance();
    bool vectorContinue = false;
    for (auto *paramTy : FTy->params()) {
      
      if(paramTy->isPointerTy()) {
        Type *ptype = F.getParamByValType(modifiedParamsTy.size());
        if (StructType* StructTy = (ptype != nullptr ? dyn_cast<StructType>(ptype) : nullptr)){
          if (ptype->getStructName().str() == "struct.float4") {
            modifiedParamsTy.push_back(cvt->getFloat4Base());
            vectorContinue = true;
          } else {
            modifiedParamsTy.push_back(paramTy);
          }
        } else {
            modifiedParamsTy.push_back(paramTy);
        }
      } else {
            modifiedParamsTy.push_back(paramTy);
      }
    }

    // Check if return type is vector type
    Type* rt = FTy->getReturnType();
   
    if (auto StructTy = dyn_cast<StructType>(rt)) {
      if (rt->getStructName().str() == "struct.float4") {
        rt = cvt->getFloat4Type();
        vectorContinue = true;
      }
    }
    if (!vectorContinue) {
      return nullptr;
    }
    

    auto *replacementFTy = FunctionType::get(rt,
                                             modifiedParamsTy, FTy->isVarArg());
    auto *replacementF =
        Function::Create(replacementFTy, F.getLinkage(), F.getAddressSpace());
    
    // Remove ByVal attributes from arugments:
    // replacementF->copyAttributesFrom(&F);

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

bool VectorArgPass::runOnModule(Module &M) {
    std::vector<Function *> fnToBeRemoved = {};

    for (auto &F : M) {
        if (F.getCallingConv() != CallingConv::AMDGPU_KERNEL
        && !isCudaBuiltin(F.getName().str())) {

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

char VectorArgPass::ID = 0;

namespace {
static RegisterPass<VectorArgPass>
    vector_arg("vector-arg",
                             "Translate Vectors Params and Return Type");
}

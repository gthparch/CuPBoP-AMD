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

#include "llvm/ADT/StringRef.h"
#include "llvm/IR/Constant.h"
#include "llvm/IR/Constants.h"
#include "llvm/IR/DerivedTypes.h"
#include "llvm/IR/LLVMContext.h"
#include "llvm/IR/Module.h"
#include "llvm/Support/ErrorOr.h"
#include "llvm/Support/MemoryBuffer.h"
#include "llvm/Support/raw_ostream.h"

#include <fstream>
#include <iostream>

#include "fatbin_convert.hpp"

using namespace std;
using namespace llvm;

void fatbin_convert(llvm::StringRef FileName, Module &M) {
    llvm::ErrorOr<std::unique_ptr<llvm::MemoryBuffer>> GpuBinaryOrErr =
        llvm::MemoryBuffer::getFileOrSTDIN(FileName);
    if (std::error_code EC = GpuBinaryOrErr.getError()) {
        errs() << " Fat binary file cannot open.\n";
    }

    // convert fat binary to string
    std::unique_ptr<MemoryBuffer> mb = std::move(*GpuBinaryOrErr);
    const std::string str(mb->getBuffer());

    // Clang CodeGen
    const unsigned HIPCodeObjectAlign = 4096;
    const char *FatbinConstantName = ".hip_fatbin";
    const char *FatbinSectionName = ".hipFatBinSegment";
    constexpr unsigned HIPFatMagic = 0x48495046;

    auto charType = llvm::IntegerType::get(M.getContext(), 8);
    auto stringType = llvm::ArrayType::get(charType, str.length());

    Constant *StrConstant =
        ConstantDataArray::getString(M.getContext(), str, true);

    GlobalVariable *GV = new GlobalVariable(M, StrConstant->getType(), true,
                                            GlobalValue::InternalLinkage,
                                            StrConstant, "", nullptr);
    GV->setName("_cupbop_amdgpu_fatbin_wrapper");

    GV->setSection(FatbinSectionName);
    // // Mark the address as used which make sure that this section isn't
    // // merged and we will really have it in the object file.
    GV->setUnnamedAddr(llvm::GlobalValue::UnnamedAddr::None);

    GV->setAlignment(llvm::Align(HIPCodeObjectAlign));

    // gets 0x0 for some reason
    // llvm::GlobalVariable* cuda_fatbin_wrapper =
    // M.getGlobalVariable("__cuda_fatbin_wrapper");

    // TODO: proper size types
    llvm::IntegerType *SizeTy = llvm::Type::getInt32Ty(M.getContext());
    llvm::Constant *Zeros[] = {llvm::ConstantInt::get(SizeTy, 0),
                               llvm::ConstantInt::get(SizeTy, 0)};

    std::set<llvm::GlobalVariable *> need_remove;

    // assigned the str to global variable in the host llvm
    for (auto &global : M.getGlobalList()) {
        if (global.hasName()) {
            printf("%s\n", global.getName().bytes_begin());

            if (global.getName().str() == "__cuda_fatbin_wrapper") {
                // errs() << *global.getOperand(0) << " \n";
                ConstantStruct *CS = cast<ConstantStruct>(global.getOperand(0));

                // 1212764230
                // change the fat magic of the wrapper to 1212764230
                CS->setOperand(
                    0, ConstantInt::get(Type::getInt32Ty(M.getContext()),
                                        HIPFatMagic, false));

                // change ptr @1 to ptr @_cupbop_amdgpu_fatbin_wrapper
                llvm::Constant *const_ptr =
                    llvm::ConstantExpr::getGetElementPtr(GV->getValueType(), GV,
                                                         Zeros);
                CS->setOperand(2, const_ptr);

                // change section to hipFatBinSegment
                global.setSection(FatbinSectionName);
            } else {
                errs() << " No __cuda_fatbin_wrapper or bug.\n";
            }
        } else if (!global.getType()->isVoidTy()) {
            // remove cuda fatbinary
            if (global.getSection() == ".nv_fatbin") {
                need_remove.insert(&global);
            }
        }
    }

    for (auto f : need_remove) {
        f->dropAllReferences();
        f->eraseFromParent();
    }
}

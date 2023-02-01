/**
 *  Add a Pass Manager for Address Space Casting
 *
 */

#include <iostream>

#include "llvm/IR/CallingConv.h"
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

// #include "AMDGPUTargetMachine.h"
// #include "AMDGPU.h"
// #include "AMDGPUAliasAnalysis.h"
// #include "AMDGPUCallLowering.h"
// #include "AMDGPUInstructionSelector.h"
// #include "AMDGPULegalizerInfo.h"
// #include "AMDGPUMacroFusion.h"
// #include "AMDGPUTargetObjectFile.h"
// #include "AMDGPUTargetTransformInfo.h"
// #include "GCNIterativeScheduler.h"
// #include "GCNSchedStrategy.h"
// #include "R600MachineScheduler.h"
// #include "SIMachineScheduler.h"
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
// #include "llvm/Support/TargetRegistry.h"
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
#include "llvm/IR/DataLayout.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/GlobalValue.h"
#include "llvm/IR/IRBuilder.h"
#include "llvm/IR/InlineAsm.h"
#include "llvm/IR/Instructions.h"
#include "llvm/IR/LLVMContext.h"
#include "llvm/IR/LegacyPassManager.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/ValueSymbolTable.h"
#include "llvm/InitializePasses.h"
#include "llvm/PassInfo.h"
#include "llvm/PassRegistry.h"
#include "llvm/Support/CommandLine.h"
#include "llvm/Transforms/IPO/PassManagerBuilder.h"
#include "llvm/Transforms/Utils/BasicBlockUtils.h"
#include "llvm/Transforms/Utils/Cloning.h"
#include "llvm/Transforms/Utils/ValueMapper.h"

#include "llvm/IR/Value.h"
#include <iostream>
#include <queue>

#include "AddressSpaceCastPass.hpp"
#include <memory>
#include <set>

using namespace llvm;
using namespace cupbop::amd::passes;

AddressSpaceCastPass::AddressSpaceCastPass() : FunctionPass(ID) {}

bool AddressSpaceCastPass::runOnFunction(Function &F) {
    if (F.getCallingConv() != CallingConv::AMDGPU_KERNEL)
        return 0;

    printf("Address Space Cast on %s\n", F.getName().bytes_begin());

    Module *M = F.getParent();
    LLVMContext &Context = M->getContext();
    const DataLayout &DL = M->getDataLayout();

    const ValueSymbolTable *vst = F.getValueSymbolTable();
    // for (ValueMap::iterator ii = vst.arg_begin(), ee = vst.arg_end();
    // ii != ee; ++ii) {

    // }
    Function &ImplFunction = F;

    FunctionType *FTy = F.getFunctionType();
    std::vector<Type *> newParams;

    for (FunctionType::param_iterator ii = FTy->param_begin(),
                                      ee = FTy->param_end();
         ii != ee; ++ii) {

        printf("here \n");
        Type *ArgType = *ii;
        if (ArgType->isPointerTy()) {
            Type *NewPtrTy = PointerType::getWithSamePointeeType(
                cast<PointerType>(ArgType), DL.getDefaultGlobalsAddressSpace());
            // v->mutateType(NewPtrTy);

            newParams.emplace_back(NewPtrTy);
        }
        // ii->replaceAllUsesWith(v);
        Type *ArgType2 = *ii;
        std::string type_str;
        llvm::raw_string_ostream rso(type_str);
        ArgType2->print(rso);
        std::cout << rso.str() << " 1 " << std::endl;
    }
    // std::vector<Type*> Params(FTy->param_begin(), FTy->param_end());

    // Loop over the arguments and change address space casting
    FunctionType *NFTy =
        FunctionType::get(FTy->getReturnType(), newParams, FTy->isVarArg());
    unsigned NumArgs = newParams.size();

    printf(" Args Number %d ", NumArgs);

    // check new params

    // llvm::PAListPtr PAL = F.getParamAttrs().addAttr(newParams.size(),
    // llvm::ParamAttr::ByVal);

    Function *NF = Function::Create(NFTy, F.getLinkage(), F.getAddressSpace());
    NF->copyAttributesFrom(&F);
    NF->setComdat(F.getComdat());
    F.getParent()->getFunctionList().insert(F.getIterator(), NF);
    NF->takeName(&F);

    for (llvm::Function::arg_iterator AI = F.arg_begin(), AE = F.arg_end(),
                                      NAI = NF->arg_begin();
         AI != AE; ++AI, ++NAI) {
        std::cout << AI->getName().str() << std::endl;

        NAI->takeName(AI);
    }

    NF->getBasicBlockList().splice(NF->begin(), F.getBasicBlockList());

    for (llvm::Function::arg_iterator I = F.arg_begin(), E = F.arg_end(),
                                      NI = NF->arg_begin();
         I != E; ++I, ++NI)
        I->replaceAllUsesWith(NI);

    F.replaceAllUsesWith(NF);
    // F.eraseFromParent(); // segFaults

    // have set of Values for the arguments of the function
    std::set<llvm::Value *> arg_set;
    for (llvm::Function::arg_iterator I = NF->arg_begin(), E = NF->arg_end();
         I != E; ++I) {

        llvm::Value *v = I;
        arg_set.insert(v);
    }

    // if argument is address space (1) needs to addrspacecast it to ptr

    // change
    // %2 = alloca ptr, align 8
    // to
    // %2 = alloca ptr, align 8, addrspace(5)
    // %4 = addrspacecast ptr addrspace(5) %2 to ptr
    // replaces uses of 2 with 4

    std::vector<llvm::Instruction *> need_remove;

    llvm::IRBuilder<> Builder(M->getContext());

    for (Function::iterator FI = NF->begin(); FI != NF->end(); ++FI) {
        for (BasicBlock::iterator BBI = FI->begin(); BBI != FI->end(); ++BBI) {
            // alloca instructiony
            Instruction *inst = &(*BBI);
            outs() << "Instruction: " << *BBI << "\n";
            if (llvm::AllocaInst *alloc =
                    llvm::dyn_cast<llvm::AllocaInst>(inst)) {
                // create new alloc instruction -
                Type *allocaType = alloc->getType();

                std::string type_str;
                llvm::raw_string_ostream rso(type_str);
                allocaType->print(rso);
                std::cout << rso.str() << " 4 " << std::endl;

                if (allocaType->isPointerTy()) {
                    Type *newType = PointerType::getWithSamePointeeType(
                        cast<PointerType>(allocaType), DL.getAllocaAddrSpace());

                    Builder.SetInsertPoint(alloc);

                    AllocaInst *new_arr = Builder.CreateAlloca(
                        newType, nullptr, alloc->getName().str());
                    new_arr->setAlignment(alloc->getAlign());

                    // address space cast to ptr (generic address space of 0)

                    auto *new_addr =
                        Builder.CreateAddrSpaceCast(new_arr, allocaType);

                    // replace the uses of
                    alloc->replaceAllUsesWith(new_addr);
                }

                need_remove.emplace_back(alloc);
            }
            // if instruction is store %0 , %X with 0 as a ptr addrspace(1) %0
            // such as strore ptr addrspace(1) %0, ptr %3, align 8
            // need replace use with address space cast
            if (llvm::StoreInst *storeInst =
                    llvm::dyn_cast<llvm::StoreInst>(inst)) {

                llvm::Value *sv = storeInst->getOperand(0);

                if (arg_set.find(sv) != arg_set.end()) {
                    // address space cast to ptr (generic address space of 0)
                    outs() << "Instruction2: " << *BBI << "\n";
                    outs() << *sv << " \n";
                    Type *svType = sv->getType();
                    if (svType->isPointerTy()) {

                        Type *newType = PointerType::getWithSamePointeeType(
                            cast<PointerType>(svType), 0);

                        auto *new_addr =
                            Builder.CreateAddrSpaceCast(sv, newType);

                        // replace the uses of
                        sv->replaceUsesWithIf(new_addr, [&](Use &U) {
                            auto *Instr = dyn_cast<Instruction>(U.getUser());
                            if (Instr == new_addr) {
                                return false;
                            }
                            return true;
                        });
                    }
                }
            }
        }
    }

    // remove the change address space cast instructions

    // delete no uses

    for (auto f : need_remove) {
        f->dropAllReferences();
        f->eraseFromParent();
    }

    outs() << *NF << " /n ";

    return 1;
}

char AddressSpaceCastPass::ID = 0;

namespace {
static RegisterPass<AddressSpaceCastPass>
    address_space_cast("address-space-cast", "Address Space Cast AMD");
}

void address_space_pass(Module &M) {
    ModulePassManager MPM;
    ModuleAnalysisManager MAM;

    FunctionPassManager FPM;
    llvm::legacy::PassManager passManager;
    llvm::PassManagerBuilder passManagerBuilder;
    auto Registry = PassRegistry::getPassRegistry();

    // We can add passes at certain extension points.
    passManagerBuilder.addExtension(
        PassManagerBuilder::EP_CGSCCOptimizerLate,
        [](const llvm::PassManagerBuilder &passManagerBuilder,
           llvm::legacy::PassManagerBase &passManager) {
            passManager.add(createInferAddressSpacesPass());
        });

    passManagerBuilder.populateModulePassManager(passManager);
    passManager.run(M);

    std::vector<std::string> passes;
    passes.push_back("address-space-cast");
    for (auto pass : passes) {
        const PassInfo *PIs = Registry->getPassInfo(StringRef(pass));
        if (PIs) {
            Pass *thispass = PIs->createPass();
            passManager.add(thispass);
        } else {
            assert(0 && "Pass not found\n");
        }
    }
    passManager.run(M);
}

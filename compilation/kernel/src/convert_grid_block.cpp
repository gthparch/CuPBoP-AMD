/**
 *  Add a Pass Manager for Grid and Block Conversion
 * 
 */

#include <iostream>

#include "llvm/IR/Module.h"
#include "llvm/IR/Instructions.h"
#include "llvm/IR/IRBuilder.h"
#include "llvm/IR/IntrinsicInst.h"
#include "llvm/IR/Intrinsics.h"
#include "llvm/IR/IntrinsicsAMDGPU.h"
#include "llvm/IR/IntrinsicsNVPTX.h"
#include "llvm/IR/CallingConv.h"

#include "llvm/Pass.h"
#include "llvm/IR/Function.h"
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

#include <memory>
#include "convert_grid_block.hpp"
#include <set>



using namespace llvm;


class GridBlockPass : public llvm::FunctionPass {


public:
  static char ID;

  GridBlockPass() : FunctionPass(ID) {}


  virtual bool runOnFunction(Function &F) {

    if (F.getCallingConv() != CallingConv::AMDGPU_KERNEL)
      return 0;

    printf("Grid and Dimension Conversion on %s\n", F.getName());

    Module *M = F.getParent();
    LLVMContext &Context = M->getContext();
    const DataLayout &DL = M->getDataLayout();

    Function& ImplFunction = F;
    
    FunctionType *FTy = F.getFunctionType();
    std::vector<Type*> newParams;


    // grid block coversion 

    // outs() << *NF << " /n ";

    return 1;
  }


};

char GridBlockPass::ID = 0;

namespace {

static RegisterPass<GridBlockPass>
    grid_block_convert_pass("grid-block-conversion",
                            "Convert Block and Grid Dimensions AMD");
}


void grid_block_pass(Module& M) {

// First we need to add the functions to get the grid blocks
// from the device  






ModulePassManager MPM;
ModuleAnalysisManager MAM;

FunctionPassManager FPM;
llvm::legacy::PassManager passManager;
llvm::PassManagerBuilder passManagerBuilder;
auto Registry = PassRegistry::getPassRegistry();


 std::vector<std::string> passes;
 passes.push_back("grid-block-conversion");
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



 

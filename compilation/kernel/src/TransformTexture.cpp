/**
 * Replace Cuda Texture
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

#include "llvm/IR/Module.h"
#include "ChangeAtomics.hpp"
#include "utils.hpp"

using namespace llvm;

void transformTexture(llvm::Module &M) {

  LLVMContext &context = M.getContext();

/*
CUDA: @tex = dso_local addrspace(1) externally_initialized global i64 undef, align 4
(is texture)


@tex = protected addrspace(1) externally_initialized global %struct.texture undef, align 8
%struct.texture = type { %struct.textureReference }
%struct.textureReference = type { i32, i32, i32, [3 x i32], %struct.hipChannelFormatDesc, i32, i32, i32, float, float, float, ptr, i32, i32 }
%struct.hipChannelFormatDesc = type { i32, i32, i32, i32, i32 }

*/


// Check all the global variables for texture reference:
std::cout << "Running Texture Memory Process on Module " << std::endl;

std::vector<llvm::GlobalVariable*> allTextureMemories = discover_texture_memory(M);
printf(" %d ", allTextureMemories.size());
if (allTextureMemories.size() > 0) {
  /* 
    Create 

    %struct.texture = type { %struct.textureReference }
    %struct.textureReference = type { i32, i32, i32, [3 x i32], %struct.hipChannelFormatDesc, i32, i32, i32, float, float, float, ptr, i32, i32 }
    %struct.hipChannelFormatDesc = type { i32, i32, i32, i32, i32 }
  */

auto intType = IntegerType::get(context, 32); // 32 bits integer
auto myStructType = StructType::create(context, "struct.hipChannelFormatDesc"); // Create opaque type
// auto myStructPtrType = PointerType::get(myStructType, 0); // Initialise the pointer type now
myStructType->setBody({intType, intType , intType, intType, intType}, /* packed */ false); // Set the body of the aggregate

for(GlobalVariable* global: allTextureMemories) {
  std::string new_name = "cupbob_" + global->getName().str(); 
  std::cout << global->getName().str() << std::endl;
  // Value* v = dyn_cast<Value>(global);

  auto gv = new llvm::GlobalVariable(M, myStructType , false, global->getLinkage(),
                           global->getInitializer(), new_name, NULL,
                           global->getThreadLocalMode(), global->getAddressSpace(), global->isExternallyInitialized());
  
  // v->mutateType(myStructType);


}

}




outs() << M << '\n';



}

#include <unordered_map>
#include <string>
#include <functional>

#include "llvm/IR/Module.h"
#include "llvm/IR/Instructions.h"
#include "llvm/IR/IRBuilder.h"
#include "llvm/IR/IntrinsicInst.h"
#include "llvm/IR/Intrinsics.h"
#include "llvm/IR/IntrinsicsAMDGPU.h"
#include "llvm/IR/IntrinsicsNVPTX.h"
#include "llvm/IR/CallingConv.h"

#include "init_amdgpu.hpp"
#include "utils.hpp"



using namespace llvm;

void remove_metadata(Module& M) {
  SmallVector<std::pair<unsigned, MDNode *>, 4> MDs;
  for (Module::iterator i = M.begin(), e = M.end(); i != e; ++i) {
    Function *F = &(*i);
    F->getAllMetadata(MDs);
    for (auto &MD : MDs) {
      
      F->setMetadata(MD.first, NULL);
    }
    F->removeFnAttr("target-features");
    F->removeFnAttr("target-cpu");
  }
}

void convert_kernel(Module& M, Function& kernel) {
    kernel.setCallingConv(CallingConv::AMDGPU_KERNEL);
    kernel.removeFnAttr("target-cpu");
    kernel.removeFnAttr("target-features");
}

void insert_amdgpu_kernel(Module& M) {
  std::vector<llvm::Function*> kernels = discover_cuda_kernels(M);

  //Replace the Kernels 
  for (auto* kernel : kernels) {
      convert_kernel(M, *kernel);
  }
}

void init_amdgpu(Module& M) {

  // metadata
  remove_metadata(M);

  // insert amdgpu_kernel to kernel function
  insert_amdgpu_kernel(M);

  



}
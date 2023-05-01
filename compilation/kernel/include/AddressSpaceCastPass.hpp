#pragma once
#include "llvm/Pass.h"

namespace cupbop {
namespace amd {
namespace passes {
/// @brief Adds the proper address space casts to pointer operations.
///
/// This pass adds the proper address space casts to pointer operations.
/// * Alloca instructions are replaced with an alloca in the private address
/// space. This is required because alloca in the flat space will error out with
/// the AMDGPU backend.
/// * Store instructions that writes to a non-flatspace pointer are prepended by
/// a cast operation, which casts the pointer to the flat space.
/// * GEP instructions that indexes into a non-flatspace pointer are prepended
/// by a cast operation, which casts the first pointer to the flat space.
class AddressSpaceCastPass : public llvm::FunctionPass {
  public:
    static char ID;
    AddressSpaceCastPass();
    virtual bool runOnFunction(llvm::Function &F);
};
} // namespace passes
} // namespace amd
} // namespace cupbop

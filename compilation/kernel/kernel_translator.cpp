#include <unordered_map>
#include <string>
#include <functional>

#include <llvm/IR/Module.h>
#include <llvm/IR/Instructions.h>
#include <llvm/IR/IRBuilder.h>
#include <llvm/IR/IntrinsicInst.h>
#include <llvm/IR/Intrinsics.h>
#include <llvm/IR/IntrinsicsAMDGPU.h>
#include <llvm/IR/IntrinsicsNVPTX.h>
#include <llvm/IR/CallingConv.h>

#include "cupbop_amd.hpp"
#include "kernel_translator.hpp"

using namespace llvm;
using namespace cupbop::kernel;
using namespace cupbop::amd::kernel;

namespace {
    struct op_context {
        std::vector<Instruction*> insts_to_remove;
        llvm::Module& M;
    };

    using intrinsic_replacer = std::function<void(op_context&, IntrinsicInst&)>;

    void replace_intrinsic(op_context& ctx, IntrinsicInst& call, Intrinsic::ID replacement) {
        // IRBuilder<> builder(ctx.M.getContext());
        // builder.SetInsertPoint(&call);
        auto* replacementDeclaration = Intrinsic::getDeclaration(&ctx.M, replacement);
        call.setCalledFunction(replacementDeclaration);
    }

    intrinsic_replacer direct_replacement(Intrinsic::ID replacement) {
        using namespace std::placeholders;
        return std::bind(replace_intrinsic, _1, _2, replacement);
    }
};

void cupbop::amd::kernel::transform_metadata(Module& M) {
    M.setDataLayout(
        "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5"
        ":32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48"
        ":64-v96:128-v192:256-v256:256-v512:512-v1024"
        ":1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
    );
    M.setTargetTriple("amdgcn-amd-amdhsa");
}

void cupbop::amd::kernel::replace_intrinsics(Module& M, Function& kernel) {
    std::unordered_map<Intrinsic::ID, ::intrinsic_replacer> knownIntrinsics = {
        { Intrinsic::nvvm_read_ptx_sreg_tid_x, direct_replacement(Intrinsic::amdgcn_workitem_id_x) },
        { Intrinsic::nvvm_read_ptx_sreg_tid_y, direct_replacement(Intrinsic::amdgcn_workitem_id_y) },
        { Intrinsic::nvvm_read_ptx_sreg_tid_z, direct_replacement(Intrinsic::amdgcn_workitem_id_z) },
        { Intrinsic::nvvm_read_ptx_sreg_ctaid_x, direct_replacement(Intrinsic::amdgcn_workgroup_id_x) },
        { Intrinsic::nvvm_read_ptx_sreg_ctaid_y, direct_replacement(Intrinsic::amdgcn_workgroup_id_y) },
        { Intrinsic::nvvm_read_ptx_sreg_ctaid_z, direct_replacement(Intrinsic::amdgcn_workgroup_id_z) }
    };

    op_context opCtx = { {}, M };

    for (auto& BB : kernel) {
        for (auto& I : BB) {
            if (auto* call = dyn_cast<IntrinsicInst>(&I)) {
                if (auto oldIntrinsicId = call->getIntrinsicID()) {
                    auto replacer = knownIntrinsics.find(oldIntrinsicId);
                    if (replacer != knownIntrinsics.end()) {
                        replacer->second(opCtx, *call);
                    }
                }
            }
        }
    }

    for (auto& inst : opCtx.insts_to_remove) {
        inst->eraseFromParent();
    }
}

void cupbop::amd::kernel::convert_kernel(Module& M, Function& kernel) {
    kernel.setCallingConv(CallingConv::AMDGPU_KERNEL);
    kernel.removeFnAttr("target-cpu");
    kernel.removeFnAttr("target-features");
}

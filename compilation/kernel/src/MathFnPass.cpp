#include <iostream>
#include <memory>
#include <queue>
#include <set>
#include <unordered_map>
#include <unordered_set>

#include "llvm/IR/DerivedTypes.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/GlobalValue.h"
#include "llvm/IR/InstIterator.h"
#include "llvm/IR/Instructions.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/Value.h"
#include "llvm/Pass.h"
#include "llvm/Support/Casting.h"

#include "MathFnPass.hpp"

using namespace llvm;
using namespace cupbop::amd::passes;

namespace {
static RegisterPass<MathFnPass>
    grid_block_convert_pass("transform-cuda-math-fn",
                            "Convert calls to builtin CUDA math functions");
}; // namespace

char MathFnPass::ID = 0;

MathFnPass::MathFnPass() : FunctionPass(ID) {}

bool MathFnPass::runOnFunction(Function &F) {
    // Math functions declared in nvvm that are re-implemented with cudaamd-math
    static std::unordered_map<std::string, std::string> cudaamd_replacements = {
        // { "__nv_sinf", "llvm.sin.f32" },
        // { "__nv_cosf", "llvm.cos.f32" }
    };

    // Symbols that are implemented by cuda2gcn bitcode
    static std::unordered_set<std::string> cuda2gcn_replacements = {
        "__nv_brev",
        "__nv_brevll",
        "__nv_clz",
        "__nv_clzll",
        "__nv_ffs",
        "__nv_ffsll",
        "__nv_popc",
        "__nv_popcll",
        "__nv_double2float_rd",
        "__nv_double2float_rn",
        "__nv_double2float_ru",
        "__nv_double2float_rz",
        "__nv_double2int_rd",
        "__nv_double2int_rn",
        "__nv_double2int_ru",
        "__nv_double2int_rz",
        "__nv_float2int_rd",
        "__nv_float2int_rn",
        "__nv_float2int_ru",
        "__nv_float2int_rz",
        "__nv_int2float_rd",
        "__nv_int2float_rn",
        "__nv_int2float_ru",
        "__nv_int2float_rz",
        "__nv_double2uint_rd",
        "__nv_double2uint_rn",
        "__nv_double2uint_ru",
        "__nv_double2uint_rz",
        "__nv_float2uint_rd",
        "__nv_float2uint_rn",
        "__nv_float2uint_ru",
        "__nv_float2uint_rz",
        "__nv_uint2double_rd",
        "__nv_uint2double_rn",
        "__nv_uint2double_ru",
        "__nv_uint2double_rz",
        "__nv_uint2float_rd",
        "__nv_uint2float_rn",
        "__nv_uint2float_ru",
        "__nv_uint2float_rz",
        "__nv_double2ll_rd",
        "__nv_double2ll_rn",
        "__nv_double2ll_ru",
        "__nv_double2ll_rz",
        "__nv_float2ll_rd",
        "__nv_float2ll_rn",
        "__nv_float2ll_ru",
        "__nv_float2ll_rz",
        "__nv_double2ull_rd",
        "__nv_double2ull_rn",
        "__nv_double2ull_ru",
        "__nv_double2ull_rz",
        "__nv_float2ull_rd",
        "__nv_float2ull_rn",
        "__nv_float2ull_ru",
        "__nv_float2ull_rz",
        "__nv_ll2double_rd",
        "__nv_ll2double_rn",
        "__nv_ll2double_ru",
        "__nv_ll2double_rz",
        "__nv_ll2float_rd",
        "__nv_ll2float_rn",
        "__nv_ll2float_ru",
        "__nv_ll2float_rz",
        "__nv_ull2double_rd",
        "__nv_ull2double_rn",
        "__nv_ull2double_ru",
        "__nv_ull2double_rz",
        "__nv_ull2float_rd",
        "__nv_ull2float_rn",
        "__nv_ull2float_ru",
        "__nv_ull2float_rz",
        "__nv_finitef",
        "__nv_isfinited",
        "__nv_isinfd",
        "__nv_isinff",
        "__nv_isnand",
        "__nv_isnanf",
        "__nv_nan",
        "__nv_nanf",
        "__nv_abs",
        "__nv_llabs",
        "__nv_max",
        "__nv_llmax",
        "__nv_ullmax",
        "__nv_umax",
        "__nv_min",
        "__nv_llmin",
        "__nv_ullmin",
        "__nv_umin",
        "__nv_sad",
        "__nv_usad",
        "__nv_float2half_rn",
        "__nv_half2float",
        "__nv_mul24",
        "__nv_umul24",
        "__nv_mul64hi",
        "__nv_mulhi",
        "__nv_umul64hi",
        "__nv_umulhi",
        "__nv_acos",
        "__nv_acosf",
        "__nv_acosh",
        "__nv_acoshf",
        "__nv_asin",
        "__nv_asinf",
        "__nv_asinh",
        "__nv_asinhf",
        "__nv_atan",
        "__nv_atanf",
        "__nv_atan2",
        "__nv_atan2f",
        "__nv_atanh",
        "__nv_atanhf",
        "__nv_cbrt",
        "__nv_cbrtf",
        "__nv_ceil",
        "__nv_ceilf",
        "__nv_copysign",
        "__nv_copysignf",
        "__nv_cos",
        "__nv_cosf",
        "__nv_cosh",
        "__nv_coshf",
        "__nv_cospi",
        "__nv_cospif",
        "__nv_erf",
        "__nv_erff",
        "__nv_erfc",
        "__nv_erfcf",
        "__nv_erfcinv",
        "__nv_erfcinvf",
        "__nv_erfcx",
        "__nv_erfcxf",
        "__nv_erfinv",
        "__nv_erfinvf",
        "__nv_exp",
        "__nv_expf",
        "__nv_exp10",
        "__nv_exp10f",
        "__nv_exp2",
        "__nv_exp2f",
        "__nv_expm1",
        "__nv_expm1f",
        "__nv_fabs",
        "__nv_fabsf",
        "__nv_fdim",
        "__nv_fdimf",
        "__nv_floor",
        "__nv_floorf",
        "__nv_fma",
        "__nv_fmaf",
        "__nv_fmax",
        "__nv_fmaxf",
        "__nv_fmin",
        "__nv_fminf",
        "__nv_fmod",
        "__nv_fmodf",
        "__nv_hypot",
        "__nv_hypotf",
        "__nv_j0",
        "__nv_j0f",
        "__nv_j1",
        "__nv_j1f",
        "__nv_lgamma",
        "__nv_lgammaf",
        "__nv_log",
        "__nv_logf",
        "__nv_log10",
        "__nv_log10f",
        "__nv_log1p",
        "__nv_log1pf",
        "__nv_log2",
        "__nv_log2f",
        "__nv_logb",
        "__nv_logbf",
        "__nv_pow",
        "__nv_powf",
        "__nv_rcbrt",
        "__nv_rcbrtf",
        "__nv_remainder",
        "__nv_remainderf",
        "__nv_rhypot",
        "__nv_rhypotf",
        "__nv_nearbyint",
        "__nv_nearbyintf",
        "__nv_nextafter",
        "__nv_nextafterf",
        "__nv_rint",
        "__nv_rintf",
        "__nv_round",
        "__nv_roundf",
        "__nv_rsqrt",
        "__nv_rsqrtf",
        "__nv_scalbn",
        "__nv_scalbnf",
        "__nv_sin",
        "__nv_sinf",
        "__nv_sinh",
        "__nv_sinhf",
        "__nv_sinpi",
        "__nv_sinpif",
        "__nv_sqrt",
        "__nv_sqrtf",
        "__nv_tan",
        "__nv_tanf",
        "__nv_tanh",
        "__nv_tanhf",
        "__nv_tgamma",
        "__nv_tgammaf",
        "__nv_trunc",
        "__nv_truncf",
        "__nv_y0",
        "__nv_y0f",
        "__nv_y1",
        "__nv_y1f",
        "__nv_cyl_bessel_i0",
        "__nv_cyl_bessel_i0f",
        "__nv_cyl_bessel_i1",
        "__nv_cyl_bessel_i1f",
        "__nv_frexp",
        "__nv_frexpf",
        "__nv_ilogb",
        "__nv_ilogbf",
        "__nv_ldexp",
        "__nv_ldexpf",
        "__nv_modf",
        "__nv_modff",
        "__nv_norm3d",
        "__nv_norm3df",
        "__nv_norm4d",
        "__nv_norm4df",
        "__nv_normcdf",
        "__nv_normcdff",
        "__nv_normcdfinv",
        "__nv_normcdfinvf",
        "__nv_powi",
        "__nv_powif",
        "__nv_remquo",
        "__nv_remquof",
        "__nv_saturatef",
        "__nv_signbitd",
        "__nv_signbitf",
        "__nv_sincos",
        "__nv_sincosf",
        "__nv_sincospi",
        "__nv_sincosfpif",
        "__nv_fast_cosf",
        "__nv_fast_exp10f",
        "__nv_fast_expf",
        "__nv_fast_log10f",
        "__nv_fast_log2f",
        "__nv_fast_logf",
        "__nv_fast_powf",
        "__nv_fast_sinf",
        "__nv_fast_tanf",
        "__nv_fast_fdividef",
        "__nv_fast_sincosf",
        "__nv_double_as_longlong",
        "__nv_float_as_int",
        "__nv_float_as_uint",
        "__nv_int_as_float",
        "__nv_longlong_as_double",
        "__nv_uint_as_float",
        "__nv_double2hiint",
        "__nv_double2loint",
        "__nv_hiloint2double",
        "__nv_llrint",
        "__nv_llrintf",
        "__nv_llround",
        "__nv_llroundf",
    };

    auto &M = *F.getParent();
    std::set<Function *> fnToRemove{};
    std::set<Function *> fnToExternalize{};

    printf("math fn pass\n");

    for (auto &instIt : instructions(F)) {
        auto *callInst = dyn_cast<CallInst>(&instIt);
        if (!callInst)
            continue;

        auto *calledFn = callInst->getCalledFunction();
        if (!calledFn)
            continue;

        auto calledFnName = std::string(calledFn->getName());

        // Find re-implemented replacement
        auto foundReimplementedReIt = cudaamd_replacements.find(calledFnName);
        if (foundReimplementedReIt != cudaamd_replacements.end()) {
            auto &foundReimplementedRe = foundReimplementedReIt->second;
            printf("Replacing call to %s with %s...\n", calledFnName.c_str(),
                   foundReimplementedRe.c_str());
            auto replacementDecl = M.getOrInsertFunction(
                foundReimplementedRe, calledFn->getFunctionType());
            callInst->setCalledFunction(replacementDecl);
            fnToRemove.insert(calledFn);
            continue;
        }

        auto foundDeviceLibReIt = cuda2gcn_replacements.find(calledFnName);
        if (foundDeviceLibReIt != cuda2gcn_replacements.end()) {
            printf(
                "Replacing call to %s with external linkages to cuda2gcn...\n",
                calledFnName.c_str());
            fnToExternalize.insert(calledFn);
        }
    }

    // Erase re-implemented FNs
    for (auto *removingFn : fnToRemove) {
        removingFn->eraseFromParent();
    }

    for (auto *externalizingFn : fnToExternalize) {
        externalizingFn->deleteBody();
    }

    return true;
}

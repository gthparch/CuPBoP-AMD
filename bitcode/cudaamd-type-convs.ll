; Bitcode implementations of various type conversions implemented with NVVM intrinsics
source_filename = "llvm-link"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
; declare i32 @llvm.nvvm.f2i.rn.ftz(float) #5
; define linkonce_odr protected i32 @cudaamd.nvvm.f2i.rn.ftz(float noundef %input) {
;     ; float to integer, round to even (.rn)
;     %input.rounded = call float @llvm.roundeven.f32(float %input)
; }

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
; declare i32 @llvm.nvvm.f2i.rn(float) #5

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
; declare float @llvm.nvvm.fma.rn.ftz.f(float, float, float) #5

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
; declare float @llvm.nvvm.fma.rn.f(float, float, float) #5

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
; declare float @llvm.nvvm.fabs.ftz.f(float) #5

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
; declare float @llvm.nvvm.fabs.f(float) #5

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
; declare float @llvm.nvvm.mul.rn.ftz.f(float, float) #5

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
; declare float @llvm.nvvm.mul.rn.f(float, float) #5

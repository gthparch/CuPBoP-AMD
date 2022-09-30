; ModuleID = 'vecAdd-cuda-nvptx64-nvidia-cuda-sm_35.bc'
source_filename = "vecAdd.cu"
target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

%struct.__cuda_builtin_blockDim_t = type { i8 }
%struct.__cuda_builtin_blockIdx_t = type { i8 }
%struct.__cuda_builtin_threadIdx_t = type { i8 }

@blockDim = extern_weak dso_local addrspace(1) global %struct.__cuda_builtin_blockDim_t, align 1
@blockIdx = extern_weak dso_local addrspace(1) global %struct.__cuda_builtin_blockIdx_t, align 1
@threadIdx = extern_weak dso_local addrspace(1) global %struct.__cuda_builtin_threadIdx_t, align 1

; Function Attrs: convergent mustprogress noinline norecurse nounwind optnone
define dso_local void @_Z6vecAddPiS_S_i(i32* noundef %0, i32* noundef %1, i32* noundef %2, i32 noundef %3) #0 {
  %5 = alloca i32*, align 8
  %6 = alloca i32*, align 8
  %7 = alloca i32*, align 8
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  store i32* %0, i32** %5, align 8
  store i32* %1, i32** %6, align 8
  store i32* %2, i32** %7, align 8
  store i32 %3, i32* %8, align 4
  %10 = call i32 @llvm.nvvm.read.ptx.sreg.ntid.x() #2
  %11 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #2
  %12 = mul i32 %10, %11
  %13 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x() #2
  %14 = add i32 %12, %13
  store i32 %14, i32* %9, align 4
  %15 = load i32, i32* %9, align 4
  %16 = icmp slt i32 %15, 10
  br i1 %16, label %17, label %33

17:                                               ; preds = %4
  %18 = load i32*, i32** %5, align 8
  %19 = load i32, i32* %9, align 4
  %20 = sext i32 %19 to i64
  %21 = getelementptr inbounds i32, i32* %18, i64 %20
  %22 = load i32, i32* %21, align 4
  %23 = load i32*, i32** %6, align 8
  %24 = load i32, i32* %9, align 4
  %25 = sext i32 %24 to i64
  %26 = getelementptr inbounds i32, i32* %23, i64 %25
  %27 = load i32, i32* %26, align 4
  %28 = add nsw i32 %22, %27
  %29 = load i32*, i32** %7, align 8
  %30 = load i32, i32* %9, align 4
  %31 = sext i32 %30 to i64
  %32 = getelementptr inbounds i32, i32* %29, i64 %31
  store i32 %28, i32* %32, align 4
  br label %33

33:                                               ; preds = %17, %4
  ret void
}

; Function Attrs: nounwind readnone speculatable
declare i32 @llvm.nvvm.read.ptx.sreg.ntid.x() #1

; Function Attrs: nounwind readnone speculatable
declare i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #1

; Function Attrs: nounwind readnone speculatable
declare i32 @llvm.nvvm.read.ptx.sreg.tid.x() #1

attributes #0 = { convergent mustprogress noinline norecurse nounwind optnone "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="sm_35" "target-features"="+ptx75,+sm_35" }
attributes #1 = { nounwind readnone speculatable }
attributes #2 = { nounwind }

!llvm.module.flags = !{!0, !1, !2, !3}
!nvvm.annotations = !{!4}
!llvm.ident = !{!5, !6}

!0 = !{i32 2, !"SDK Version", [2 x i32] [i32 11, i32 5]}
!1 = !{i32 1, !"wchar_size", i32 4}
!2 = !{i32 4, !"nvvm-reflect-ftz", i32 0}
!3 = !{i32 7, !"frame-pointer", i32 2}
!4 = !{void (i32*, i32*, i32*, i32)* @_Z6vecAddPiS_S_i, !"kernel", i32 1}
!5 = !{!"AMD clang version 14.0.0 (https://github.com/RadeonOpenCompute/llvm-project roc-5.2.0 22204 50d6d5d5b608d2abd6af44314abc6ad20036af3b)"}
!6 = !{!"clang version 3.8.0 (tags/RELEASE_380/final)"}

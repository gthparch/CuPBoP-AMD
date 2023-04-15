; Function Attrs: convergent mustprogress noinline nounwind optnone
; ModuleID = 'mummergpu_kernel-cuda-nvptx64-nvidia-cuda-sm_35.bc'
source_filename = "mummergpu_kernel.cu"
target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

%struct.__cuda_builtin_blockIdx_t = type { i8 }
%struct.__cuda_builtin_blockDim_t = type { i8 }
%struct.__cuda_builtin_threadIdx_t = type { i8 }
%struct.TextureAddress = type { %union.anon }
%union.anon = type { i32 }
%struct.anon = type { i16, i16 }
%struct.uchar3 = type { i8, i8, i8 }
%struct.uint4 = type { i32, i32, i32, i32 }
%struct.int2 = type { i32, i32 }
%struct._MatchCoord = type { %union.anon.0 }
%union.anon.0 = type { %struct.int2 }
%struct._PixelOfChildren = type { %union.anon.2 }
%union.anon.2 = type { %struct.uint4 }
%struct._PixelOfNode = type { %union.anon.6 }
%union.anon.6 = type { %struct.uint4 }
%struct.anon.4 = type { %struct.uchar3, %struct.uchar3, %struct.uchar3, %struct.uchar3, %struct.uchar3, i8 }
%struct.anon.7 = type { %struct.uchar3, %struct.uchar3, %struct.uchar3, %struct.uchar3, %struct.uchar3, i8 }
%struct.MatchInfo = type { i32, i32, %struct.TextureAddress, i32, i16, i16 }
%struct.anon.5 = type { %struct.uchar3, [12 x i8], i8 }
%struct.Alignment = type { i32, i16 }

$_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_xEv = comdat any

$_ZN25__cuda_builtin_blockDim_t17__fetch_builtin_xEv = comdat any

$_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_xEv = comdat any

@nodetex = dso_local addrspace(1) externally_initialized global i64 undef, align 4
@childrentex = dso_local addrspace(1) externally_initialized global i64 undef, align 4
@reftex = dso_local addrspace(1) externally_initialized global i64 undef, align 4
@qrytex = dso_local addrspace(1) externally_initialized global i64 undef, align 4
@blockIdx = extern_weak dso_local addrspace(1) global %struct.__cuda_builtin_blockIdx_t, align 1
@blockDim = extern_weak dso_local addrspace(1) global %struct.__cuda_builtin_blockDim_t, align 1
@threadIdx = extern_weak dso_local addrspace(1) global %struct.__cuda_builtin_threadIdx_t, align 1
@llvm.compiler.used = appending global [2 x ptr] [ptr addrspacecast (ptr addrspace(1) @nodetex to ptr), ptr addrspacecast (ptr addrspace(1) @childrentex to ptr)], section "llvm.metadata"


; Function Attrs: convergent mustprogress noinline nounwind optnone
define dso_local void @_Z10set_resultjP11_MatchCoordiiii(i32 noundef %0, ptr noundef %1, i32 noundef %2, i32 noundef %3, i32 noundef %4, i32 noundef %5) #0 {
  %7 = alloca i32, align 4
  %8 = alloca ptr, align 8
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca %struct.int2, align 8
  store i32 %0, ptr %7, align 4
  store ptr %1, ptr %8, align 8
  store i32 %2, ptr %9, align 4
  store i32 %3, ptr %10, align 4
  store i32 %4, ptr %11, align 4
  store i32 %5, ptr %12, align 4
  %14 = load i32, ptr %10, align 4
  %15 = load i32, ptr %11, align 4
  %16 = icmp sgt i32 %14, %15
  br i1 %16, label %17, label %30

17:                                               ; preds = %6
  %18 = load i32, ptr %12, align 4
  %19 = load i32, ptr %9, align 4
  %20 = or i32 %19, %18
  store i32 %20, ptr %9, align 4
  %21 = load i32, ptr %7, align 4
  %22 = load i32, ptr %9, align 4
  %23 = call %struct.int2 @_ZL9make_int2ii(i32 noundef %21, i32 noundef %22) #7
  %24 = getelementptr inbounds %struct.int2, ptr %13, i32 0, i32 0
  %25 = extractvalue %struct.int2 %23, 0
  store i32 %25, ptr %24, align 8
  %26 = getelementptr inbounds %struct.int2, ptr %13, i32 0, i32 1
  %27 = extractvalue %struct.int2 %23, 1
  store i32 %27, ptr %26, align 4
  %28 = load ptr, ptr %8, align 8
  %29 = getelementptr inbounds %struct._MatchCoord, ptr %28, i32 0, i32 0
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %29, ptr align 8 %13, i64 8, i1 false)
  br label %33

30:                                               ; preds = %6
  br label %31

31:                                               ; preds = %30
  br label %32

32:                                               ; preds = %31
  br label %33

33:                                               ; preds = %32, %17
  ret void
}

; Function Attrs: convergent mustprogress noinline nounwind optnone
define internal %struct.int2 @_ZL9make_int2ii(i32 noundef %0, i32 noundef %1) #0 {
  %3 = alloca %struct.int2, align 8
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  store i32 %0, ptr %4, align 4
  store i32 %1, ptr %5, align 4
  %6 = load i32, ptr %4, align 4
  %7 = getelementptr inbounds %struct.int2, ptr %3, i32 0, i32 0
  store i32 %6, ptr %7, align 8
  %8 = load i32, ptr %5, align 4
  %9 = getelementptr inbounds %struct.int2, ptr %3, i32 0, i32 1
  store i32 %8, ptr %9, align 4
  %10 = load %struct.int2, ptr %3, align 8
  ret %struct.int2 %10
}

; Function Attrs: argmemonly nocallback nofree nounwind willreturn
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #3


; Function Attrs: nounwind readnone
declare i64 @llvm.nvvm.texsurf.handle.internal.p1(ptr addrspace(1)) #2

attributes #0 = { convergent mustprogress noinline nounwind optnone "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="sm_35" "target-features"="+ptx75,+sm_35" }
attributes #1 = { alwaysinline convergent mustprogress nounwind "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="sm_35" "target-features"="+ptx75,+sm_35" }
attributes #2 = { nounwind readnone }
attributes #3 = { argmemonly nocallback nofree nounwind willreturn }
attributes #4 = { convergent mustprogress noinline norecurse nounwind optnone "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="sm_35" "target-features"="+ptx75,+sm_35" }
attributes #5 = { nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #6 = { alwaysinline convergent nounwind "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #7 = { convergent nounwind }
attributes #8 = { convergent nounwind readnone }

!llvm.module.flags = !{!0, !1, !2, !3}
!nvvm.annotations = !{!4, !5, !6, !7}
!llvm.ident = !{!11, !12}

!0 = !{i32 2, !"SDK Version", [2 x i32] [i32 11, i32 5]}
!1 = !{i32 1, !"wchar_size", i32 4}
!2 = !{i32 4, !"nvvm-reflect-ftz", i32 0}
!3 = !{i32 7, !"frame-pointer", i32 2}
!4 = !{ptr addrspace(1) @nodetex, !"texture", i32 1}
!5 = !{ptr addrspace(1) @childrentex, !"texture", i32 1}
!6 = !{ptr addrspace(1) @reftex, !"texture", i32 1}
!7 = !{ptr addrspace(1) @qrytex, !"texture", i32 1}
!11 = !{!"clang version 16.0.0 (https://github.com/llvm/llvm-project 809855b56f06dd7182685f88fbbc64111df9339a)"}
!12 = !{!"clang version 3.8.0 (tags/RELEASE_380/final)"}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.mustprogress"}
!15 = distinct !{!15, !14}
!16 = distinct !{!16, !14}
!17 = distinct !{!17, !14}
!18 = distinct !{!18, !14}
!19 = !{i64 685421}
!20 = !{i64 738119}
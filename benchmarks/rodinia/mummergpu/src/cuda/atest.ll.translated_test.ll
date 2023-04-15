; ModuleID = 'atest.ll.translated_test.bc'
source_filename = "mummergpu_kernel.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%struct.__cuda_builtin_blockIdx_t = type { i8 }
%struct.__cuda_builtin_blockDim_t = type { i8 }
%struct.__cuda_builtin_threadIdx_t = type { i8 }
%struct.texture = type { %struct.textureReference }
%struct.textureReference = type { i32, i32, i32, [3 x i32], %struct.hipChannelFormatDesc, i32, i32, i32, float, float, float, ptr, i32, i32 }
%struct.hipChannelFormatDesc = type { i32, i32, i32, i32, i32 }
%struct.HIP_vector_type_int.2 = type { %struct.HIP_vector_base_int.2 }
%struct.HIP_vector_base_int.2 = type { %union_I32_2.anon }
%union_I32_2.anon = type { <2 x i32> }
%struct.int2 = type { i32, i32 }
%struct.i32_2.anon = type { i32, i32 }
%struct._MatchCoord = type { %union.anon.0 }
%union.anon.0 = type { %struct.int2 }

@blockIdx = extern_weak dso_local addrspace(1) global %struct.__cuda_builtin_blockIdx_t, align 1
@blockDim = extern_weak dso_local addrspace(1) global %struct.__cuda_builtin_blockDim_t, align 1
@threadIdx = extern_weak dso_local addrspace(1) global %struct.__cuda_builtin_threadIdx_t, align 1
@llvm.compiler.used = appending global [2 x ptr] [ptr addrspacecast (ptr addrspace(1) @nodetex to ptr), ptr addrspacecast (ptr addrspace(1) @childrentex to ptr)], section "llvm.metadata"
@nodetex = addrspace(1) externally_initialized global %struct.texture undef
@childrentex = addrspace(1) externally_initialized global %struct.texture undef
@reftex = addrspace(1) externally_initialized global %struct.texture undef
@qrytex = addrspace(1) externally_initialized global %struct.texture undef

; Function Attrs: convergent mustprogress noinline nounwind optnone
define dso_local void @_Z10set_resultjP11_MatchCoordiiii(i32 noundef %0, ptr noundef %1, i32 noundef %2, i32 noundef %3, i32 noundef %4, i32 noundef %5) #0 {
  %7 = alloca i32, align 4, addrspace(5)
  %8 = addrspacecast ptr addrspace(5) %7 to ptr
  %9 = alloca ptr, align 8, addrspace(5)
  %10 = addrspacecast ptr addrspace(5) %9 to ptr
  %11 = alloca i32, align 4, addrspace(5)
  %12 = addrspacecast ptr addrspace(5) %11 to ptr
  %13 = alloca i32, align 4, addrspace(5)
  %14 = addrspacecast ptr addrspace(5) %13 to ptr
  %15 = alloca i32, align 4, addrspace(5)
  %16 = addrspacecast ptr addrspace(5) %15 to ptr
  %17 = alloca i32, align 4, addrspace(5)
  %18 = addrspacecast ptr addrspace(5) %17 to ptr
  %19 = alloca %struct.HIP_vector_type_int.2, align 8, addrspace(5)
  %20 = addrspacecast ptr addrspace(5) %19 to ptr
  store i32 %0, ptr %8, align 4
  store ptr %1, ptr %10, align 8
  store i32 %2, ptr %12, align 4
  store i32 %3, ptr %14, align 4
  store i32 %4, ptr %16, align 4
  store i32 %5, ptr %18, align 4
  %21 = load i32, ptr %14, align 4
  %22 = load i32, ptr %16, align 4
  %23 = icmp sgt i32 %21, %22
  br i1 %23, label %24, label %39

24:                                               ; preds = %6
  %25 = load i32, ptr %18, align 4
  %26 = load i32, ptr %12, align 4
  %27 = or i32 %26, %25
  store i32 %27, ptr %12, align 4
  %28 = load i32, ptr %8, align 4
  %29 = load i32, ptr %12, align 4
  %30 = call %struct.int2 @_ZL9make_int2ii(i32 noundef %28, i32 noundef %29) #3
  %31 = getelementptr inbounds %struct.HIP_vector_base_int.2, ptr %20, i32 0, i32 0
  %32 = getelementptr inbounds %struct.i32_2.anon, ptr %31, i32 0, i32 0
  %33 = extractvalue %struct.int2 %30, 0
  store i32 %33, ptr %32, align 8
  %34 = getelementptr inbounds %struct.HIP_vector_base_int.2, ptr %20, i32 0, i32 0
  %35 = getelementptr inbounds %struct.i32_2.anon, ptr %34, i32 0, i32 1
  %36 = extractvalue %struct.int2 %30, 1
  store i32 %36, ptr %35, align 4
  %37 = load ptr, ptr %10, align 8
  %38 = getelementptr inbounds %struct._MatchCoord, ptr %37, i32 0, i32 0
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %38, ptr align 8 %20, i64 8, i1 false)
  br label %42

39:                                               ; preds = %6
  br label %40

40:                                               ; preds = %39
  br label %41

41:                                               ; preds = %40
  br label %42

42:                                               ; preds = %41, %24
  ret void
}

; Function Attrs: convergent mustprogress noinline nounwind optnone
define internal %struct.HIP_vector_type_int.2 @_ZL9make_int2ii(i32 noundef %0, i32 noundef %1) #0 {
  %3 = alloca %struct.HIP_vector_type_int.2, align 8, addrspace(5)
  %4 = addrspacecast ptr addrspace(5) %3 to ptr
  %5 = alloca i32, align 4, addrspace(5)
  %6 = addrspacecast ptr addrspace(5) %5 to ptr
  %7 = alloca i32, align 4, addrspace(5)
  %8 = addrspacecast ptr addrspace(5) %7 to ptr
  store i32 %0, ptr %6, align 4
  store i32 %1, ptr %8, align 4
  %9 = load i32, ptr %6, align 4
  %10 = getelementptr inbounds %struct.HIP_vector_base_int.2, ptr %4, i32 0, i32 0
  %11 = getelementptr inbounds %struct.i32_2.anon, ptr %10, i32 0, i32 0
  store i32 %9, ptr %11, align 8
  %12 = load i32, ptr %8, align 4
  %13 = getelementptr inbounds %struct.HIP_vector_base_int.2, ptr %4, i32 0, i32 0
  %14 = getelementptr inbounds %struct.i32_2.anon, ptr %13, i32 0, i32 1
  store i32 %12, ptr %14, align 4
  %15 = load %struct.HIP_vector_type_int.2, ptr %4, align 8
  ret %struct.HIP_vector_type_int.2 %15
}

; Function Attrs: argmemonly nocallback nofree nounwind willreturn
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #1

; Function Attrs: nounwind readnone
declare i64 @llvm.nvvm.texsurf.handle.internal.p1(ptr addrspace(1)) #2

declare i32 @_Z9atomicAddPjj(ptr, i32)

declare i32 @_Z9atomicAddPii(ptr, i32)

declare i64 @_Z9atomicAddPyy(ptr, i64)

declare float @_Z9atomicAddPff(ptr, float)

declare i32 @_Z8atomicOrPii(ptr, i32)

declare i32 @_Z8atomicOrPjj(ptr, i32)

declare i64 @_Z8atomicOrPyy(ptr, i64)

declare i32 @_Z9atomicAndPii(ptr, i32)

declare i32 @_Z9atomicAndPjj(ptr, i32)

declare i64 @_Z9atomicAndPyy(ptr, i64)

declare i32 @_Z10atomicExchPii(ptr, i32)

declare i32 @_Z10atomicExchPjj(ptr, i32)

declare i64 @_Z10atomicExchPyy(ptr, i64)

declare float @_Z10atomicExchPff(ptr, float)

declare i32 @_Z9atomicDecPjj(ptr, i32)

declare i32 @_Z9atomicIncPjj(ptr, i32)

declare i32 @_Z9atomicMaxPii(ptr, i32)

declare i32 @_Z9atomicMaxPjj(ptr, i32)

declare i64 @_Z9atomicMaxPyy(ptr, i64)

declare i32 @_Z9atomicMinPii(ptr, i32)

declare i32 @_Z9atomicMinPjj(ptr, i32)

declare i64 @_Z9atomicMinPyy(ptr, i64)

declare i32 @_Z9atomicSubPii(ptr, i32)

declare i32 @_Z9atomicSubPjj(ptr, i32)

declare i32 @_Z9atomicXorPii(ptr, i32)

declare i32 @_Z9atomicXorPjj(ptr, i32)

declare i64 @_Z9atomicXorPyy(ptr, i64)

declare i32 @_Z9atomicCASPiii(ptr, i32, i32)

declare i32 @_Z9atomicCASPjjj(ptr, i32, i32)

declare i64 @_Z9atomicCASPyyy(ptr, i64, i64)

attributes #0 = { convergent mustprogress noinline nounwind optnone "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" }
attributes #1 = { argmemonly nocallback nofree nounwind willreturn }
attributes #2 = { nounwind readnone }
attributes #3 = { convergent nounwind }

!llvm.module.flags = !{!0, !1, !2, !3}
!nvvm.annotations = !{!4, !5, !6, !7}
!llvm.ident = !{!8, !9}

!0 = !{i32 2, !"SDK Version", [2 x i32] [i32 11, i32 5]}
!1 = !{i32 1, !"wchar_size", i32 4}
!2 = !{i32 4, !"nvvm-reflect-ftz", i32 0}
!3 = !{i32 7, !"frame-pointer", i32 2}
!4 = !{ptr addrspace(1) @nodetex, !"texture", i32 1}
!5 = !{ptr addrspace(1) @childrentex, !"texture", i32 1}
!6 = !{ptr addrspace(1) @reftex, !"texture", i32 1}
!7 = !{ptr addrspace(1) @qrytex, !"texture", i32 1}
!8 = !{!"clang version 16.0.0 (https://github.com/llvm/llvm-project 809855b56f06dd7182685f88fbbc64111df9339a)"}
!9 = !{!"clang version 3.8.0 (tags/RELEASE_380/final)"}

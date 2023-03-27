
; __CLANG_OFFLOAD_BUNDLE____START__ hip-amdgcn-amd-amdhsa-gfx90a
; ModuleID = 'main.cpp'
source_filename = "main.cpp"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%0 = type { i16, i16, i16, i16, i16, i16, i32, i32, i32, i32, i32, i64, ptr addrspace(1), i64, %1 }
%1 = type { i64 }
%"struct.__HIP_Coordinates<__HIP_ThreadIdx>::__X" = type { i8 }
%"struct.__HIP_Coordinates<__HIP_BlockIdx>::__X" = type { i8 }
%"struct.__HIP_Coordinates<__HIP_BlockDim>::__X" = type { i8 }

$_ZN17__HIP_CoordinatesI15__HIP_ThreadIdxE1xE = comdat any

$_ZN17__HIP_CoordinatesI14__HIP_BlockIdxE1xE = comdat any

$_ZN17__HIP_CoordinatesI14__HIP_BlockDimE1xE = comdat any

@_ZN17__HIP_CoordinatesI15__HIP_ThreadIdxE1xE = weak protected addrspace(4) externally_initialized constant %"struct.__HIP_Coordinates<__HIP_ThreadIdx>::__X" undef, comdat, align 1
@_ZN17__HIP_CoordinatesI14__HIP_BlockIdxE1xE = weak protected addrspace(4) externally_initialized constant %"struct.__HIP_Coordinates<__HIP_BlockIdx>::__X" undef, comdat, align 1
@_ZN17__HIP_CoordinatesI14__HIP_BlockDimE1xE = weak protected addrspace(4) externally_initialized constant %"struct.__HIP_Coordinates<__HIP_BlockDim>::__X" undef, comdat, align 1
@llvm.compiler.used = appending addrspace(1) global [3 x ptr] [ptr addrspacecast (ptr addrspace(4) @_ZN17__HIP_CoordinatesI14__HIP_BlockDimE1xE to ptr), ptr addrspacecast (ptr addrspace(4) @_ZN17__HIP_CoordinatesI14__HIP_BlockIdxE1xE to ptr), ptr addrspacecast (ptr addrspace(4) @_ZN17__HIP_CoordinatesI15__HIP_ThreadIdxE1xE to ptr)], section "llvm.metadata"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z8kernel_aPiS_S_(ptr addrspace(1) nocapture noundef readonly %0, ptr addrspace(1) nocapture noundef readonly %1, ptr addrspace(1) nocapture noundef writeonly %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = tail call align 4 dereferenceable(64) ptr addrspace(4) @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr inbounds %0, ptr addrspace(4) %6, i64 0, i32 6
  %8 = load i32, ptr addrspace(4) %7, align 4, !tbaa !5
  %9 = getelementptr i8, ptr addrspace(4) %6, i64 4
  %10 = load i16, ptr addrspace(4) %9, align 4, !range !14, !invariant.load !15
  %11 = zext i16 %10 to i32
  %12 = mul i32 %5, %11
  %13 = sub i32 %8, %12
  %14 = tail call i32 @llvm.umin.i32(i32 %13, i32 %11)
  %15 = mul i32 %14, %5
  %16 = add i32 %15, %4
  %17 = sext i32 %16 to i64
  %18 = getelementptr inbounds i32, ptr addrspace(1) %0, i64 %17
  %19 = load i32, ptr addrspace(1) %18, align 4, !tbaa !16, !amdgpu.noclobber !15
  %20 = mul nsw i32 %16, %19
  %21 = getelementptr inbounds i32, ptr addrspace(1) %1, i64 %17
  %22 = load i32, ptr addrspace(1) %21, align 4, !tbaa !16, !amdgpu.noclobber !15
  %23 = add nsw i32 %20, %22
  %24 = getelementptr inbounds i32, ptr addrspace(1) %2, i64 %17
  store i32 %23, ptr addrspace(1) %24, align 4, !tbaa !16
  ret void
}

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z8kernel_bPiS_S_(ptr addrspace(1) nocapture noundef readonly %0, ptr addrspace(1) nocapture noundef readonly %1, ptr addrspace(1) nocapture noundef writeonly %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = tail call align 4 dereferenceable(64) ptr addrspace(4) @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr inbounds %0, ptr addrspace(4) %6, i64 0, i32 6
  %8 = load i32, ptr addrspace(4) %7, align 4, !tbaa !5
  %9 = getelementptr i8, ptr addrspace(4) %6, i64 4
  %10 = load i16, ptr addrspace(4) %9, align 4, !range !14, !invariant.load !15
  %11 = zext i16 %10 to i32
  %12 = mul i32 %5, %11
  %13 = sub i32 %8, %12
  %14 = tail call i32 @llvm.umin.i32(i32 %13, i32 %11)
  %15 = mul i32 %14, %5
  %16 = add i32 %15, %4
  %17 = sext i32 %16 to i64
  %18 = getelementptr inbounds i32, ptr addrspace(1) %0, i64 %17
  %19 = load i32, ptr addrspace(1) %18, align 4, !tbaa !16, !amdgpu.noclobber !15
  %20 = getelementptr inbounds i32, ptr addrspace(1) %1, i64 %17
  %21 = load i32, ptr addrspace(1) %20, align 4, !tbaa !16, !amdgpu.noclobber !15
  %22 = mul nsw i32 %16, %21
  %23 = add nsw i32 %22, %19
  %24 = getelementptr inbounds i32, ptr addrspace(1) %2, i64 %17
  store i32 %23, ptr addrspace(1) %24, align 4, !tbaa !16
  ret void
}

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z8kernel_cPiS_S_(ptr addrspace(1) nocapture noundef readonly %0, ptr addrspace(1) nocapture noundef readonly %1, ptr addrspace(1) nocapture noundef writeonly %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = tail call align 4 dereferenceable(64) ptr addrspace(4) @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr inbounds %0, ptr addrspace(4) %6, i64 0, i32 6
  %8 = load i32, ptr addrspace(4) %7, align 4, !tbaa !5
  %9 = getelementptr i8, ptr addrspace(4) %6, i64 4
  %10 = load i16, ptr addrspace(4) %9, align 4, !range !14, !invariant.load !15
  %11 = zext i16 %10 to i32
  %12 = mul i32 %5, %11
  %13 = sub i32 %8, %12
  %14 = tail call i32 @llvm.umin.i32(i32 %13, i32 %11)
  %15 = mul i32 %14, %5
  %16 = add i32 %15, %4
  %17 = sext i32 %16 to i64
  %18 = getelementptr inbounds i32, ptr addrspace(1) %0, i64 %17
  %19 = load i32, ptr addrspace(1) %18, align 4, !tbaa !16, !amdgpu.noclobber !15
  %20 = getelementptr inbounds i32, ptr addrspace(1) %1, i64 %17
  %21 = load i32, ptr addrspace(1) %20, align 4, !tbaa !16, !amdgpu.noclobber !15
  %22 = add nsw i32 %21, %19
  %23 = getelementptr inbounds i32, ptr addrspace(1) %2, i64 %17
  store i32 %22, ptr addrspace(1) %23, align 4, !tbaa !16
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 ptr addrspace(4) @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.umin.i32(i32, i32) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn "amdgpu-flat-work-group-size"="1,1024" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx90a" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot3-insts,+dot4-insts,+dot5-insts,+dot6-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+gfx90a-insts,+mai-insts,+s-memrealtime,+s-memtime-inst" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 16.0.0 (https://github.com/llvm/llvm-project 809855b56f06dd7182685f88fbbc64111df9339a)"}
!4 = !{i32 0, i32 1024}
!5 = !{!6, !10, i64 12}
!6 = !{!"hsa_kernel_dispatch_packet_s", !7, i64 0, !7, i64 2, !7, i64 4, !7, i64 6, !7, i64 8, !7, i64 10, !10, i64 12, !10, i64 16, !10, i64 20, !10, i64 24, !10, i64 28, !11, i64 32, !12, i64 40, !11, i64 48, !13, i64 56}
!7 = !{!"short", !8, i64 0}
!8 = !{!"omnipotent char", !9, i64 0}
!9 = !{!"Simple C/C++ TBAA"}
!10 = !{!"int", !8, i64 0}
!11 = !{!"long", !8, i64 0}
!12 = !{!"any pointer", !8, i64 0}
!13 = !{!"hsa_signal_s", !11, i64 0}
!14 = !{i16 1, i16 1025}
!15 = !{}
!16 = !{!17, !17, i64 0}
!17 = !{!"int", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}

; __CLANG_OFFLOAD_BUNDLE____END__ hip-amdgcn-amd-amdhsa-gfx90a

; __CLANG_OFFLOAD_BUNDLE____START__ host-x86_64-unknown-linux-gnu
; ModuleID = 'main.cpp'
source_filename = "main.cpp"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.dim3 = type { i32, i32, i32 }

$__hip_gpubin_handle = comdat any

@_Z8kernel_aPiS_S_ = constant ptr @_Z23__device_stub__kernel_aPiS_S_, align 8
@_Z8kernel_bPiS_S_ = constant ptr @_Z23__device_stub__kernel_bPiS_S_, align 8
@_Z8kernel_cPiS_S_ = constant ptr @_Z23__device_stub__kernel_cPiS_S_, align 8
@.str = private unnamed_addr constant [57 x i8] c"\0AError at index %d: expected %d, got %d (a = %d, b = %d)\00", align 1
@stdout = external local_unnamed_addr global ptr, align 8
@.str.1 = private unnamed_addr constant [77 x i8] c"sizeof(hipStream_t)=%lu, sizeof(hipGraph_t)=%lu, sizeof(hipGraphExec_t)=%lu\0A\00", align 1
@.str.2 = private unnamed_addr constant [44 x i8] c"\0DLaunching instance %d/%d with %d inputs...\00", align 1
@0 = private unnamed_addr constant [18 x i8] c"_Z8kernel_aPiS_S_\00", align 1
@1 = private unnamed_addr constant [18 x i8] c"_Z8kernel_bPiS_S_\00", align 1
@2 = private unnamed_addr constant [18 x i8] c"_Z8kernel_cPiS_S_\00", align 1
@__hip_fatbin = external constant i8, section ".hip_fatbin"
@__hip_fatbin_wrapper = internal constant { i32, i32, ptr, ptr } { i32 1212764230, i32 1, ptr @__hip_fatbin, ptr null }, section ".hipFatBinSegment", align 8
@__hip_gpubin_handle = linkonce hidden local_unnamed_addr global ptr null, comdat, align 8
@llvm.global_ctors = appending global [1 x { i32, ptr, ptr }] [{ i32, ptr, ptr } { i32 65535, ptr @__hip_module_ctor, ptr null }]

; Function Attrs: norecurse uwtable
define dso_local void @_Z23__device_stub__kernel_aPiS_S_(ptr noundef %0, ptr noundef %1, ptr noundef %2) #0 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca %struct.dim3, align 8
  %8 = alloca %struct.dim3, align 8
  %9 = alloca i64, align 8
  %10 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8, !tbaa !5
  store ptr %1, ptr %5, align 8, !tbaa !5
  store ptr %2, ptr %6, align 8, !tbaa !5
  %11 = alloca [3 x ptr], align 16
  store ptr %4, ptr %11, align 16
  %12 = getelementptr inbounds ptr, ptr %11, i64 1
  store ptr %5, ptr %12, align 8
  %13 = getelementptr inbounds ptr, ptr %11, i64 2
  store ptr %6, ptr %13, align 16
  %14 = call i32 @__hipPopCallConfiguration(ptr nonnull %7, ptr nonnull %8, ptr nonnull %9, ptr nonnull %10)
  %15 = load i64, ptr %9, align 8
  %16 = load ptr, ptr %10, align 8
  %17 = load i64, ptr %7, align 8
  %18 = getelementptr inbounds i8, ptr %7, i64 8
  %19 = load i32, ptr %18, align 8
  %20 = load i64, ptr %8, align 8
  %21 = getelementptr inbounds i8, ptr %8, i64 8
  %22 = load i32, ptr %21, align 8
  %23 = call noundef i32 @hipLaunchKernel(ptr noundef nonnull @_Z8kernel_aPiS_S_, i64 %17, i32 %19, i64 %20, i32 %22, ptr noundef nonnull %11, i64 noundef %15, ptr noundef %16)
  ret void
}

declare i32 @__hipPopCallConfiguration(ptr, ptr, ptr, ptr) local_unnamed_addr

declare i32 @hipLaunchKernel(ptr, i64, i32, i64, i32, ptr, i64, ptr) local_unnamed_addr

; Function Attrs: norecurse uwtable
define dso_local void @_Z23__device_stub__kernel_bPiS_S_(ptr noundef %0, ptr noundef %1, ptr noundef %2) #0 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca %struct.dim3, align 8
  %8 = alloca %struct.dim3, align 8
  %9 = alloca i64, align 8
  %10 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8, !tbaa !5
  store ptr %1, ptr %5, align 8, !tbaa !5
  store ptr %2, ptr %6, align 8, !tbaa !5
  %11 = alloca [3 x ptr], align 16
  store ptr %4, ptr %11, align 16
  %12 = getelementptr inbounds ptr, ptr %11, i64 1
  store ptr %5, ptr %12, align 8
  %13 = getelementptr inbounds ptr, ptr %11, i64 2
  store ptr %6, ptr %13, align 16
  %14 = call i32 @__hipPopCallConfiguration(ptr nonnull %7, ptr nonnull %8, ptr nonnull %9, ptr nonnull %10)
  %15 = load i64, ptr %9, align 8
  %16 = load ptr, ptr %10, align 8
  %17 = load i64, ptr %7, align 8
  %18 = getelementptr inbounds i8, ptr %7, i64 8
  %19 = load i32, ptr %18, align 8
  %20 = load i64, ptr %8, align 8
  %21 = getelementptr inbounds i8, ptr %8, i64 8
  %22 = load i32, ptr %21, align 8
  %23 = call noundef i32 @hipLaunchKernel(ptr noundef nonnull @_Z8kernel_bPiS_S_, i64 %17, i32 %19, i64 %20, i32 %22, ptr noundef nonnull %11, i64 noundef %15, ptr noundef %16)
  ret void
}

; Function Attrs: norecurse uwtable
define dso_local void @_Z23__device_stub__kernel_cPiS_S_(ptr noundef %0, ptr noundef %1, ptr noundef %2) #0 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca %struct.dim3, align 8
  %8 = alloca %struct.dim3, align 8
  %9 = alloca i64, align 8
  %10 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8, !tbaa !5
  store ptr %1, ptr %5, align 8, !tbaa !5
  store ptr %2, ptr %6, align 8, !tbaa !5
  %11 = alloca [3 x ptr], align 16
  store ptr %4, ptr %11, align 16
  %12 = getelementptr inbounds ptr, ptr %11, i64 1
  store ptr %5, ptr %12, align 8
  %13 = getelementptr inbounds ptr, ptr %11, i64 2
  store ptr %6, ptr %13, align 16
  %14 = call i32 @__hipPopCallConfiguration(ptr nonnull %7, ptr nonnull %8, ptr nonnull %9, ptr nonnull %10)
  %15 = load i64, ptr %9, align 8
  %16 = load ptr, ptr %10, align 8
  %17 = load i64, ptr %7, align 8
  %18 = getelementptr inbounds i8, ptr %7, i64 8
  %19 = load i32, ptr %18, align 8
  %20 = load i64, ptr %8, align 8
  %21 = getelementptr inbounds i8, ptr %8, i64 8
  %22 = load i32, ptr %21, align 8
  %23 = call noundef i32 @hipLaunchKernel(ptr noundef nonnull @_Z8kernel_cPiS_S_, i64 %17, i32 %19, i64 %20, i32 %22, ptr noundef nonnull %11, i64 noundef %15, ptr noundef %16)
  ret void
}

; Function Attrs: mustprogress uwtable
define dso_local void @_Z14prepare_inputsPiS_S_S_(ptr noundef %0, ptr noundef %1, ptr noundef %2, ptr noundef %3) local_unnamed_addr #1 {
  br label %8

5:                                                ; preds = %8
  %6 = tail call i32 @hipMemcpy(ptr noundef %2, ptr noundef nonnull %0, i64 noundef 16384, i32 noundef 1)
  %7 = tail call i32 @hipMemcpy(ptr noundef %3, ptr noundef nonnull %1, i64 noundef 16384, i32 noundef 1)
  ret void

8:                                                ; preds = %4, %8
  %9 = phi i64 [ 0, %4 ], [ %16, %8 ]
  %10 = tail call i32 @rand() #10
  %11 = srem i32 %10, 100
  %12 = getelementptr inbounds i32, ptr %0, i64 %9
  store i32 %11, ptr %12, align 4, !tbaa !9
  %13 = tail call i32 @rand() #10
  %14 = srem i32 %13, 100
  %15 = getelementptr inbounds i32, ptr %1, i64 %9
  store i32 %14, ptr %15, align 4, !tbaa !9
  %16 = add nuw nsw i64 %9, 1
  %17 = icmp eq i64 %16, 4096
  br i1 %17, label %5, label %8, !llvm.loop !11
}

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0(i64 immarg, ptr nocapture) #2

; Function Attrs: nounwind
declare i32 @rand() local_unnamed_addr #3

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0(i64 immarg, ptr nocapture) #2

declare i32 @hipMemcpy(ptr noundef, ptr noundef, i64 noundef, i32 noundef) local_unnamed_addr #4

; Function Attrs: mustprogress nofree nounwind uwtable
define dso_local void @_Z14verify_outputsPiS_S_(ptr nocapture noundef readonly %0, ptr nocapture noundef readonly %1, ptr nocapture noundef readonly %2) local_unnamed_addr #5 {
  br label %5

4:                                                ; preds = %21
  ret void

5:                                                ; preds = %3, %21
  %6 = phi i64 [ 0, %3 ], [ %7, %21 ]
  %7 = add nuw nsw i64 %6, 1
  %8 = getelementptr inbounds i32, ptr %0, i64 %6
  %9 = load i32, ptr %8, align 4, !tbaa !9
  %10 = getelementptr inbounds i32, ptr %1, i64 %6
  %11 = load i32, ptr %10, align 4, !tbaa !9
  %12 = add nsw i32 %11, %9
  %13 = trunc i64 %7 to i32
  %14 = mul nsw i32 %12, %13
  %15 = getelementptr inbounds i32, ptr %2, i64 %6
  %16 = load i32, ptr %15, align 4, !tbaa !9
  %17 = icmp eq i32 %16, %14
  br i1 %17, label %21, label %18

18:                                               ; preds = %5
  %19 = trunc i64 %6 to i32
  %20 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull @.str, i32 noundef %19, i32 noundef %14, i32 noundef %16, i32 noundef %9, i32 noundef %11)
  br label %21

21:                                               ; preds = %18, %5
  %22 = icmp eq i64 %7, 4096
  br i1 %22, label %4, label %5, !llvm.loop !13
}

; Function Attrs: nofree nounwind
declare noundef i32 @printf(ptr nocapture noundef readonly, ...) local_unnamed_addr #6

; Function Attrs: norecurse uwtable
define dso_local noundef i32 @main() local_unnamed_addr #0 {
  %1 = alloca ptr, align 8
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  %4 = alloca %struct.dim3, align 8
  %5 = alloca %struct.dim3, align 8
  %6 = alloca i64, align 8
  %7 = alloca ptr, align 8
  %8 = alloca [3 x ptr], align 16
  %9 = alloca ptr, align 8
  %10 = alloca ptr, align 8
  %11 = alloca ptr, align 8
  %12 = alloca %struct.dim3, align 8
  %13 = alloca %struct.dim3, align 8
  %14 = alloca i64, align 8
  %15 = alloca ptr, align 8
  %16 = alloca [3 x ptr], align 16
  %17 = alloca ptr, align 8
  %18 = alloca ptr, align 8
  %19 = alloca ptr, align 8
  %20 = alloca %struct.dim3, align 8
  %21 = alloca %struct.dim3, align 8
  %22 = alloca i64, align 8
  %23 = alloca ptr, align 8
  %24 = alloca [3 x ptr], align 16
  %25 = alloca ptr, align 8
  %26 = alloca ptr, align 8
  %27 = alloca ptr, align 8
  %28 = alloca ptr, align 8
  %29 = alloca ptr, align 8
  %30 = alloca i64, align 8
  %31 = alloca ptr, align 8
  %32 = alloca ptr, align 8
  %33 = alloca ptr, align 8
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %25) #10
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %26) #10
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %27) #10
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %28) #10
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %29) #10
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %30) #10
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %31) #10
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %32) #10
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %33) #10
  %34 = load ptr, ptr @stdout, align 8, !tbaa !5
  %35 = tail call i32 (ptr, ptr, ...) @fprintf(ptr noundef %34, ptr noundef nonnull @.str.1, i64 noundef 8, i64 noundef 8, i64 noundef 8)
  %36 = call i64 @time(ptr noundef nonnull %30) #10
  %37 = trunc i64 %36 to i32
  call void @srand(i32 noundef %37) #10
  %38 = call noalias dereferenceable_or_null(16384) ptr @malloc(i64 noundef 16384) #11
  %39 = call noalias dereferenceable_or_null(16384) ptr @malloc(i64 noundef 16384) #11
  %40 = call noalias dereferenceable_or_null(16384) ptr @malloc(i64 noundef 16384) #11
  %41 = call i32 @hipMalloc(ptr noundef nonnull %25, i64 noundef 16384)
  %42 = call i32 @hipMalloc(ptr noundef nonnull %26, i64 noundef 16384)
  %43 = call i32 @hipMalloc(ptr noundef nonnull %27, i64 noundef 16384)
  %44 = call i32 @hipMalloc(ptr noundef nonnull %28, i64 noundef 16384)
  %45 = call i32 @hipMalloc(ptr noundef nonnull %29, i64 noundef 16384)
  %46 = call i32 @hipStreamCreate(ptr noundef nonnull %31)
  %47 = load ptr, ptr %31, align 8, !tbaa !5
  %48 = call i32 @hipStreamBeginCapture(ptr noundef %47, i32 noundef 0)
  %49 = load ptr, ptr %31, align 8, !tbaa !5
  %50 = call i32 @__hipPushCallConfiguration(i64 4294967424, i32 1, i64 4294967328, i32 1, i64 noundef 0, ptr noundef %49)
  %51 = icmp eq i32 %50, 0
  br i1 %51, label %52, label %68

52:                                               ; preds = %0
  %53 = load ptr, ptr %25, align 8, !tbaa !5
  %54 = load ptr, ptr %26, align 8, !tbaa !5
  %55 = load ptr, ptr %27, align 8, !tbaa !5
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %17)
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %18)
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %19)
  call void @llvm.lifetime.start.p0(i64 12, ptr nonnull %20)
  call void @llvm.lifetime.start.p0(i64 12, ptr nonnull %21)
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %22)
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %23)
  call void @llvm.lifetime.start.p0(i64 24, ptr nonnull %24)
  store ptr %53, ptr %17, align 8, !tbaa !5
  store ptr %54, ptr %18, align 8, !tbaa !5
  store ptr %55, ptr %19, align 8, !tbaa !5
  store ptr %17, ptr %24, align 16
  %56 = getelementptr inbounds ptr, ptr %24, i64 1
  store ptr %18, ptr %56, align 8
  %57 = getelementptr inbounds ptr, ptr %24, i64 2
  store ptr %19, ptr %57, align 16
  %58 = call i32 @__hipPopCallConfiguration(ptr nonnull %20, ptr nonnull %21, ptr nonnull %22, ptr nonnull %23)
  %59 = load i64, ptr %22, align 8
  %60 = load ptr, ptr %23, align 8
  %61 = load i64, ptr %20, align 8
  %62 = getelementptr inbounds i8, ptr %20, i64 8
  %63 = load i32, ptr %62, align 8
  %64 = load i64, ptr %21, align 8
  %65 = getelementptr inbounds i8, ptr %21, i64 8
  %66 = load i32, ptr %65, align 8
  %67 = call noundef i32 @hipLaunchKernel(ptr noundef nonnull @_Z8kernel_aPiS_S_, i64 %61, i32 %63, i64 %64, i32 %66, ptr noundef nonnull %24, i64 noundef %59, ptr noundef %60)
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %17)
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %18)
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %19)
  call void @llvm.lifetime.end.p0(i64 12, ptr nonnull %20)
  call void @llvm.lifetime.end.p0(i64 12, ptr nonnull %21)
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %22)
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %23)
  call void @llvm.lifetime.end.p0(i64 24, ptr nonnull %24)
  br label %68

68:                                               ; preds = %0, %52
  %69 = load ptr, ptr %31, align 8, !tbaa !5
  %70 = call i32 @__hipPushCallConfiguration(i64 4294967424, i32 1, i64 4294967328, i32 1, i64 noundef 0, ptr noundef %69)
  %71 = icmp eq i32 %70, 0
  br i1 %71, label %72, label %88

72:                                               ; preds = %68
  %73 = load ptr, ptr %25, align 8, !tbaa !5
  %74 = load ptr, ptr %26, align 8, !tbaa !5
  %75 = load ptr, ptr %28, align 8, !tbaa !5
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %9)
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %10)
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %11)
  call void @llvm.lifetime.start.p0(i64 12, ptr nonnull %12)
  call void @llvm.lifetime.start.p0(i64 12, ptr nonnull %13)
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %14)
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %15)
  call void @llvm.lifetime.start.p0(i64 24, ptr nonnull %16)
  store ptr %73, ptr %9, align 8, !tbaa !5
  store ptr %74, ptr %10, align 8, !tbaa !5
  store ptr %75, ptr %11, align 8, !tbaa !5
  store ptr %9, ptr %16, align 16
  %76 = getelementptr inbounds ptr, ptr %16, i64 1
  store ptr %10, ptr %76, align 8
  %77 = getelementptr inbounds ptr, ptr %16, i64 2
  store ptr %11, ptr %77, align 16
  %78 = call i32 @__hipPopCallConfiguration(ptr nonnull %12, ptr nonnull %13, ptr nonnull %14, ptr nonnull %15)
  %79 = load i64, ptr %14, align 8
  %80 = load ptr, ptr %15, align 8
  %81 = load i64, ptr %12, align 8
  %82 = getelementptr inbounds i8, ptr %12, i64 8
  %83 = load i32, ptr %82, align 8
  %84 = load i64, ptr %13, align 8
  %85 = getelementptr inbounds i8, ptr %13, i64 8
  %86 = load i32, ptr %85, align 8
  %87 = call noundef i32 @hipLaunchKernel(ptr noundef nonnull @_Z8kernel_bPiS_S_, i64 %81, i32 %83, i64 %84, i32 %86, ptr noundef nonnull %16, i64 noundef %79, ptr noundef %80)
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %9)
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %10)
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %11)
  call void @llvm.lifetime.end.p0(i64 12, ptr nonnull %12)
  call void @llvm.lifetime.end.p0(i64 12, ptr nonnull %13)
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %14)
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %15)
  call void @llvm.lifetime.end.p0(i64 24, ptr nonnull %16)
  br label %88

88:                                               ; preds = %68, %72
  %89 = load ptr, ptr %31, align 8, !tbaa !5
  %90 = call i32 @__hipPushCallConfiguration(i64 4294967424, i32 1, i64 4294967328, i32 1, i64 noundef 0, ptr noundef %89)
  %91 = icmp eq i32 %90, 0
  br i1 %91, label %92, label %108

92:                                               ; preds = %88
  %93 = load ptr, ptr %27, align 8, !tbaa !5
  %94 = load ptr, ptr %28, align 8, !tbaa !5
  %95 = load ptr, ptr %29, align 8, !tbaa !5
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %1)
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %2)
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %3)
  call void @llvm.lifetime.start.p0(i64 12, ptr nonnull %4)
  call void @llvm.lifetime.start.p0(i64 12, ptr nonnull %5)
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %6)
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %7)
  call void @llvm.lifetime.start.p0(i64 24, ptr nonnull %8)
  store ptr %93, ptr %1, align 8, !tbaa !5
  store ptr %94, ptr %2, align 8, !tbaa !5
  store ptr %95, ptr %3, align 8, !tbaa !5
  store ptr %1, ptr %8, align 16
  %96 = getelementptr inbounds ptr, ptr %8, i64 1
  store ptr %2, ptr %96, align 8
  %97 = getelementptr inbounds ptr, ptr %8, i64 2
  store ptr %3, ptr %97, align 16
  %98 = call i32 @__hipPopCallConfiguration(ptr nonnull %4, ptr nonnull %5, ptr nonnull %6, ptr nonnull %7)
  %99 = load i64, ptr %6, align 8
  %100 = load ptr, ptr %7, align 8
  %101 = load i64, ptr %4, align 8
  %102 = getelementptr inbounds i8, ptr %4, i64 8
  %103 = load i32, ptr %102, align 8
  %104 = load i64, ptr %5, align 8
  %105 = getelementptr inbounds i8, ptr %5, i64 8
  %106 = load i32, ptr %105, align 8
  %107 = call noundef i32 @hipLaunchKernel(ptr noundef nonnull @_Z8kernel_cPiS_S_, i64 %101, i32 %103, i64 %104, i32 %106, ptr noundef nonnull %8, i64 noundef %99, ptr noundef %100)
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %1)
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %2)
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %3)
  call void @llvm.lifetime.end.p0(i64 12, ptr nonnull %4)
  call void @llvm.lifetime.end.p0(i64 12, ptr nonnull %5)
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %6)
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %7)
  call void @llvm.lifetime.end.p0(i64 24, ptr nonnull %8)
  br label %108

108:                                              ; preds = %92, %88
  %109 = load ptr, ptr %31, align 8, !tbaa !5
  %110 = call i32 @hipStreamEndCapture(ptr noundef %109, ptr noundef nonnull %32)
  %111 = load ptr, ptr %32, align 8, !tbaa !5
  %112 = call i32 @hipGraphInstantiate(ptr noundef nonnull %33, ptr noundef %111, ptr noundef null, ptr noundef null, i64 noundef 0)
  br label %130

113:                                              ; preds = %175
  %114 = icmp eq i32 %133, 4096
  br i1 %114, label %115, label %130, !llvm.loop !14

115:                                              ; preds = %113
  %116 = load ptr, ptr @stdout, align 8, !tbaa !5
  %117 = call i32 @fputc(i32 10, ptr %116)
  %118 = load ptr, ptr %31, align 8, !tbaa !5
  %119 = call i32 @hipStreamDestroy(ptr noundef %118)
  call void @free(ptr noundef nonnull %38) #10
  call void @free(ptr noundef nonnull %39) #10
  call void @free(ptr noundef nonnull %40) #10
  %120 = load ptr, ptr %25, align 8, !tbaa !5
  %121 = call i32 @hipFree(ptr noundef %120)
  %122 = load ptr, ptr %26, align 8, !tbaa !5
  %123 = call i32 @hipFree(ptr noundef %122)
  %124 = load ptr, ptr %27, align 8, !tbaa !5
  %125 = call i32 @hipFree(ptr noundef %124)
  %126 = load ptr, ptr %28, align 8, !tbaa !5
  %127 = call i32 @hipFree(ptr noundef %126)
  %128 = load ptr, ptr %29, align 8, !tbaa !5
  %129 = call i32 @hipFree(ptr noundef %128)
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %33) #10
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %32) #10
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %31) #10
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %30) #10
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %29) #10
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %28) #10
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %27) #10
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %26) #10
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %25) #10
  ret i32 0

130:                                              ; preds = %108, %113
  %131 = phi i32 [ 0, %108 ], [ %133, %113 ]
  %132 = load ptr, ptr @stdout, align 8, !tbaa !5
  %133 = add nuw nsw i32 %131, 1
  %134 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %132, ptr noundef nonnull @.str.2, i32 noundef %133, i32 noundef 4096, i32 noundef 4096)
  %135 = load ptr, ptr @stdout, align 8, !tbaa !5
  %136 = call i32 @fflush(ptr noundef %135)
  %137 = load ptr, ptr %25, align 8, !tbaa !5
  %138 = load ptr, ptr %26, align 8, !tbaa !5
  br label %139

139:                                              ; preds = %139, %130
  %140 = phi i64 [ 0, %130 ], [ %147, %139 ]
  %141 = call i32 @rand() #10
  %142 = srem i32 %141, 100
  %143 = getelementptr inbounds i32, ptr %38, i64 %140
  store i32 %142, ptr %143, align 4, !tbaa !9
  %144 = call i32 @rand() #10
  %145 = srem i32 %144, 100
  %146 = getelementptr inbounds i32, ptr %39, i64 %140
  store i32 %145, ptr %146, align 4, !tbaa !9
  %147 = add nuw nsw i64 %140, 1
  %148 = icmp eq i64 %147, 4096
  br i1 %148, label %149, label %139, !llvm.loop !11

149:                                              ; preds = %139
  %150 = call i32 @hipMemcpy(ptr noundef %137, ptr noundef nonnull %38, i64 noundef 16384, i32 noundef 1)
  %151 = call i32 @hipMemcpy(ptr noundef %138, ptr noundef nonnull %39, i64 noundef 16384, i32 noundef 1)
  %152 = load ptr, ptr %33, align 8, !tbaa !5
  %153 = load ptr, ptr %31, align 8, !tbaa !5
  %154 = call i32 @hipGraphLaunch(ptr noundef %152, ptr noundef %153)
  %155 = load ptr, ptr %31, align 8, !tbaa !5
  %156 = call i32 @hipStreamSynchronize(ptr noundef %155)
  %157 = load ptr, ptr %29, align 8, !tbaa !5
  %158 = call i32 @hipMemcpy(ptr noundef %40, ptr noundef %157, i64 noundef 16384, i32 noundef 2)
  br label %159

159:                                              ; preds = %175, %149
  %160 = phi i64 [ 0, %149 ], [ %161, %175 ]
  %161 = add nuw nsw i64 %160, 1
  %162 = getelementptr inbounds i32, ptr %38, i64 %160
  %163 = load i32, ptr %162, align 4, !tbaa !9
  %164 = getelementptr inbounds i32, ptr %39, i64 %160
  %165 = load i32, ptr %164, align 4, !tbaa !9
  %166 = add nsw i32 %165, %163
  %167 = trunc i64 %161 to i32
  %168 = mul nsw i32 %166, %167
  %169 = getelementptr inbounds i32, ptr %40, i64 %160
  %170 = load i32, ptr %169, align 4, !tbaa !9
  %171 = icmp eq i32 %170, %168
  br i1 %171, label %175, label %172

172:                                              ; preds = %159
  %173 = trunc i64 %160 to i32
  %174 = call i32 (ptr, ...) @printf(ptr noundef nonnull @.str, i32 noundef %173, i32 noundef %168, i32 noundef %170, i32 noundef %163, i32 noundef %165)
  br label %175

175:                                              ; preds = %172, %159
  %176 = icmp eq i64 %161, 4096
  br i1 %176, label %113, label %159, !llvm.loop !14
}

; Function Attrs: nofree nounwind
declare noundef i32 @fprintf(ptr nocapture noundef, ptr nocapture noundef readonly, ...) local_unnamed_addr #6

; Function Attrs: nounwind
declare void @srand(i32 noundef) local_unnamed_addr #3

; Function Attrs: nounwind
declare i64 @time(ptr noundef) local_unnamed_addr #3

; Function Attrs: inaccessiblememonly mustprogress nofree nounwind willreturn allockind("alloc,uninitialized") allocsize(0)
declare noalias noundef ptr @malloc(i64 noundef) local_unnamed_addr #7

declare i32 @hipMalloc(ptr noundef, i64 noundef) local_unnamed_addr #4

declare i32 @hipStreamCreate(ptr noundef) local_unnamed_addr #4

declare i32 @hipStreamBeginCapture(ptr noundef, i32 noundef) local_unnamed_addr #4

declare i32 @__hipPushCallConfiguration(i64, i32, i64, i32, i64 noundef, ptr noundef) local_unnamed_addr #4

declare i32 @hipStreamEndCapture(ptr noundef, ptr noundef) local_unnamed_addr #4

declare i32 @hipGraphInstantiate(ptr noundef, ptr noundef, ptr noundef, ptr noundef, i64 noundef) local_unnamed_addr #4

; Function Attrs: nofree nounwind
declare noundef i32 @fflush(ptr nocapture noundef) local_unnamed_addr #6

declare i32 @hipGraphLaunch(ptr noundef, ptr noundef) local_unnamed_addr #4

declare i32 @hipStreamSynchronize(ptr noundef) local_unnamed_addr #4

declare i32 @hipStreamDestroy(ptr noundef) local_unnamed_addr #4

; Function Attrs: inaccessiblemem_or_argmemonly mustprogress nounwind willreturn allockind("free")
declare void @free(ptr allocptr nocapture noundef) local_unnamed_addr #8

declare i32 @hipFree(ptr noundef) local_unnamed_addr #4

declare i32 @__hipRegisterFunction(ptr, ptr, ptr, ptr, i32, ptr, ptr, ptr, ptr, ptr) local_unnamed_addr

declare ptr @__hipRegisterFatBinary(ptr) local_unnamed_addr

define internal void @__hip_module_ctor() {
  %1 = load ptr, ptr @__hip_gpubin_handle, align 8
  %2 = icmp eq ptr %1, null
  br i1 %2, label %3, label %5

3:                                                ; preds = %0
  %4 = tail call ptr @__hipRegisterFatBinary(ptr nonnull @__hip_fatbin_wrapper)
  store ptr %4, ptr @__hip_gpubin_handle, align 8
  br label %5

5:                                                ; preds = %3, %0
  %6 = phi ptr [ %4, %3 ], [ %1, %0 ]
  %7 = tail call i32 @__hipRegisterFunction(ptr %6, ptr nonnull @_Z8kernel_aPiS_S_, ptr nonnull @0, ptr nonnull @0, i32 -1, ptr null, ptr null, ptr null, ptr null, ptr null)
  %8 = tail call i32 @__hipRegisterFunction(ptr %6, ptr nonnull @_Z8kernel_bPiS_S_, ptr nonnull @1, ptr nonnull @1, i32 -1, ptr null, ptr null, ptr null, ptr null, ptr null)
  %9 = tail call i32 @__hipRegisterFunction(ptr %6, ptr nonnull @_Z8kernel_cPiS_S_, ptr nonnull @2, ptr nonnull @2, i32 -1, ptr null, ptr null, ptr null, ptr null, ptr null)
  %10 = tail call i32 @atexit(ptr nonnull @__hip_module_dtor)
  ret void
}

declare void @__hipUnregisterFatBinary(ptr) local_unnamed_addr

define internal void @__hip_module_dtor() {
  %1 = load ptr, ptr @__hip_gpubin_handle, align 8
  %2 = icmp eq ptr %1, null
  br i1 %2, label %4, label %3

3:                                                ; preds = %0
  tail call void @__hipUnregisterFatBinary(ptr nonnull %1)
  store ptr null, ptr @__hip_gpubin_handle, align 8
  br label %4

4:                                                ; preds = %3, %0
  ret void
}

declare i32 @atexit(ptr) local_unnamed_addr

; Function Attrs: nofree nounwind
declare noundef i32 @fputc(i32 noundef, ptr nocapture noundef) local_unnamed_addr #9

attributes #0 = { norecurse uwtable "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { mustprogress uwtable "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { argmemonly mustprogress nocallback nofree nosync nounwind willreturn }
attributes #3 = { nounwind "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { mustprogress nofree nounwind uwtable "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nofree nounwind "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { inaccessiblememonly mustprogress nofree nounwind willreturn allockind("alloc,uninitialized") allocsize(0) "alloc-family"="malloc" "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #8 = { inaccessiblemem_or_argmemonly mustprogress nounwind willreturn allockind("free") "alloc-family"="malloc" "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #9 = { nofree nounwind }
attributes #10 = { nounwind }
attributes #11 = { nounwind allocsize(0) }

!llvm.module.flags = !{!0, !1, !2, !3}
!llvm.ident = !{!4}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{!"clang version 16.0.0 (https://github.com/llvm/llvm-project 809855b56f06dd7182685f88fbbc64111df9339a)"}
!5 = !{!6, !6, i64 0}
!6 = !{!"any pointer", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C++ TBAA"}
!9 = !{!10, !10, i64 0}
!10 = !{!"int", !7, i64 0}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
!13 = distinct !{!13, !12}
!14 = distinct !{!14, !12}

; __CLANG_OFFLOAD_BUNDLE____END__ host-x86_64-unknown-linux-gnu

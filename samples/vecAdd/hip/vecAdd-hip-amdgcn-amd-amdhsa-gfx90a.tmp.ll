; ModuleID = 'vecAdd-hip-amdgcn-amd-amdhsa-gfx90a.tmp.bc'
source_filename = "vecAdd.cpp"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%"struct.__HIP_Coordinates<__HIP_BlockDim>::__X" = type { i8 }
%"struct.__HIP_Coordinates<__HIP_BlockIdx>::__X" = type { i8 }
%"struct.__HIP_Coordinates<__HIP_ThreadIdx>::__X" = type { i8 }

$_ZN17__HIP_CoordinatesI14__HIP_BlockDimE1xE = comdat any

$_ZN17__HIP_CoordinatesI14__HIP_BlockIdxE1xE = comdat any

$_ZN17__HIP_CoordinatesI15__HIP_ThreadIdxE1xE = comdat any

@_ZN17__HIP_CoordinatesI14__HIP_BlockDimE1xE = weak protected addrspace(4) externally_initialized constant %"struct.__HIP_Coordinates<__HIP_BlockDim>::__X" undef, comdat, align 1
@_ZN17__HIP_CoordinatesI14__HIP_BlockIdxE1xE = weak protected addrspace(4) externally_initialized constant %"struct.__HIP_Coordinates<__HIP_BlockIdx>::__X" undef, comdat, align 1
@_ZN17__HIP_CoordinatesI15__HIP_ThreadIdxE1xE = weak protected addrspace(4) externally_initialized constant %"struct.__HIP_Coordinates<__HIP_ThreadIdx>::__X" undef, comdat, align 1
@llvm.compiler.used = appending addrspace(1) global [3 x i8*] [i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds (%"struct.__HIP_Coordinates<__HIP_BlockDim>::__X", %"struct.__HIP_Coordinates<__HIP_BlockDim>::__X" addrspace(4)* @_ZN17__HIP_CoordinatesI14__HIP_BlockDimE1xE, i32 0, i32 0) to i8*), i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds (%"struct.__HIP_Coordinates<__HIP_BlockIdx>::__X", %"struct.__HIP_Coordinates<__HIP_BlockIdx>::__X" addrspace(4)* @_ZN17__HIP_CoordinatesI14__HIP_BlockIdxE1xE, i32 0, i32 0) to i8*), i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds (%"struct.__HIP_Coordinates<__HIP_ThreadIdx>::__X", %"struct.__HIP_Coordinates<__HIP_ThreadIdx>::__X" addrspace(4)* @_ZN17__HIP_CoordinatesI15__HIP_ThreadIdxE1xE, i32 0, i32 0) to i8*)], section "llvm.metadata"

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z6vecAddPiS_S_i(i32 addrspace(1)* nocapture noundef readonly %0, i32 addrspace(1)* nocapture noundef readonly %1, i32 addrspace(1)* nocapture noundef writeonly %2, i32 noundef %3) local_unnamed_addr #0 {
  %5 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x() #2
  %7 = getelementptr i8, i8 addrspace(4)* %5, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !4, !invariant.load !5
  %10 = zext i16 %9 to i32
  %11 = mul i32 %6, %10
  %12 = tail call i32 @llvm.amdgcn.workitem.id.x() #2, !range !6
  %13 = add i32 %11, %12
  %14 = icmp slt i32 %13, 10
  %15 = sext i32 %13 to i64
  br i1 %14, label %16, label %23

16:                                               ; preds = %4
  %17 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %15
  %18 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %15
  %19 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %15
  %20 = load i32, i32 addrspace(1)* %19, align 4, !tbaa !7
  %21 = load i32, i32 addrspace(1)* %18, align 4, !tbaa !7
  %22 = add nsw i32 %21, %20
  store i32 %22, i32 addrspace(1)* %17, align 4, !tbaa !7
  br label %23

23:                                               ; preds = %16, %4
  ret void
}

; Function Attrs: nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn "amdgpu-flat-work-group-size"="1,1024" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx90a" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot3-insts,+dot4-insts,+dot5-insts,+dot6-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+gfx90a-insts,+mai-insts,+s-memrealtime,+s-memtime-inst" "uniform-work-group-size"="true" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { nounwind }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"AMD clang version 14.0.0 (https://github.com/RadeonOpenCompute/llvm-project roc-5.2.0 22204 50d6d5d5b608d2abd6af44314abc6ad20036af3b)"}
!4 = !{i16 1, i16 1025}
!5 = !{}
!6 = !{i32 0, i32 1024}
!7 = !{!8, !8, i64 0}
!8 = !{!"int", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}

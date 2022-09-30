; ModuleID = 'vector_add_kernel.cl'
source_filename = "vector_add_kernel.cl"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-unknown-amdhsa-opencl"

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @vector_add(i32 addrspace(1)* nocapture noundef readonly %0, i32 addrspace(1)* nocapture noundef readonly %1, i32 addrspace(1)* nocapture noundef writeonly %2) local_unnamed_addr #0 !kernel_arg_addr_space !4 !kernel_arg_access_qual !5 !kernel_arg_type !6 !kernel_arg_base_type !6 !kernel_arg_type_qual !7 {
  %4 = tail call i8 addrspace(4)* @llvm.amdgcn.implicitarg.ptr() #2
  %5 = bitcast i8 addrspace(4)* %4 to i64 addrspace(4)*
  %6 = load i64, i64 addrspace(4)* %5, align 8, !tbaa !8
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.x() #2
  %8 = tail call align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2
  %9 = getelementptr i8, i8 addrspace(4)* %8, i64 4
  %10 = bitcast i8 addrspace(4)* %9 to i16 addrspace(4)*
  %11 = load i16, i16 addrspace(4)* %10, align 4
  %12 = zext i16 %11 to i32
  %13 = mul i32 %7, %12
  %14 = tail call i32 @llvm.amdgcn.workitem.id.x() #2, !range !12
  %15 = add i32 %13, %14
  %16 = zext i32 %15 to i64
  %17 = add i64 %6, %16
  %18 = shl i64 %17, 32
  %19 = ashr exact i64 %18, 32
  %20 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %19
  %21 = load i32, i32 addrspace(1)* %20, align 4, !tbaa !13
  %22 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %19
  %23 = load i32, i32 addrspace(1)* %22, align 4, !tbaa !13
  %24 = add nsw i32 %23, %21
  %25 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %19
  store i32 %24, i32 addrspace(1)* %25, align 4, !tbaa !13
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.implicitarg.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 1, i32 2}
!3 = !{!"AMD clang version 14.0.0 (https://github.com/RadeonOpenCompute/llvm-project roc-5.2.0 22204 50d6d5d5b608d2abd6af44314abc6ad20036af3b)"}
!4 = !{i32 1, i32 1, i32 1}
!5 = !{!"none", !"none", !"none"}
!6 = !{!"int*", !"int*", !"int*"}
!7 = !{!"", !"", !""}
!8 = !{!9, !9, i64 0}
!9 = !{!"long", !10, i64 0}
!10 = !{!"omnipotent char", !11, i64 0}
!11 = !{!"Simple C/C++ TBAA"}
!12 = !{i32 0, i32 1024}
!13 = !{!14, !14, i64 0}
!14 = !{!"int", !10, i64 0}

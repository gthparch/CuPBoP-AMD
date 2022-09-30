; ModuleID = 'vector_add_kernel.cl'
source_filename = "vector_add_kernel.cl"
target datalayout = "e-p:32:32-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx-nvidia-nvcl"

; Function Attrs: convergent mustprogress nofree noinline norecurse nounwind willreturn
define dso_local spir_kernel void @vector_add(i32 addrspace(1)* nocapture noundef readonly %0, i32 addrspace(1)* nocapture noundef readonly %1, i32 addrspace(1)* nocapture noundef writeonly %2) local_unnamed_addr #0 !kernel_arg_addr_space !5 !kernel_arg_access_qual !6 !kernel_arg_type !7 !kernel_arg_base_type !7 !kernel_arg_type_qual !8 {
  %4 = tail call i32 @_Z13get_global_idj(i32 noundef 0) #2
  %5 = getelementptr inbounds i32, i32 addrspace(1)* %0, i32 %4
  %6 = load i32, i32 addrspace(1)* %5, align 4, !tbaa !9
  %7 = getelementptr inbounds i32, i32 addrspace(1)* %1, i32 %4
  %8 = load i32, i32 addrspace(1)* %7, align 4, !tbaa !9
  %9 = add nsw i32 %8, %6
  %10 = getelementptr inbounds i32, i32 addrspace(1)* %2, i32 %4
  store i32 %9, i32 addrspace(1)* %10, align 4, !tbaa !9
  ret void
}

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare dso_local i32 @_Z13get_global_idj(i32 noundef) local_unnamed_addr #1

attributes #0 = { convergent mustprogress nofree noinline norecurse nounwind willreturn "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-features"="+ptx32,+sm_20" "uniform-work-group-size"="true" }
attributes #1 = { convergent mustprogress nofree nounwind readnone willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-features"="+ptx32,+sm_20" }
attributes #2 = { convergent nounwind readnone willreturn }

!nvvm.annotations = !{!0}
!llvm.module.flags = !{!1, !2}
!opencl.ocl.version = !{!3}
!llvm.ident = !{!4}

!0 = !{void (i32 addrspace(1)*, i32 addrspace(1)*, i32 addrspace(1)*)* @vector_add, !"kernel", i32 1}
!1 = !{i32 1, !"wchar_size", i32 4}
!2 = !{i32 7, !"frame-pointer", i32 2}
!3 = !{i32 1, i32 2}
!4 = !{!"AMD clang version 14.0.0 (https://github.com/RadeonOpenCompute/llvm-project roc-5.2.0 22204 50d6d5d5b608d2abd6af44314abc6ad20036af3b)"}
!5 = !{i32 1, i32 1, i32 1}
!6 = !{!"none", !"none", !"none"}
!7 = !{!"int*", !"int*", !"int*"}
!8 = !{!"", !"", !""}
!9 = !{!10, !10, i64 0}
!10 = !{!"int", !11, i64 0}
!11 = !{!"omnipotent char", !12, i64 0}
!12 = !{!"Simple C/C++ TBAA"}

; ModuleID = 'empty-cuda-nvptx64-nvidia-cuda-sm_35.bc'
source_filename = "empty.cu"
target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

; Function Attrs: convergent mustprogress noinline norecurse nounwind optnone
define dso_local void @_Z6vecAddPi(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  store i32 10, ptr %3, align 4
  ret void
}

attributes #0 = { convergent mustprogress noinline norecurse nounwind optnone "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="sm_35" "target-features"="+ptx75,+sm_35" }

!llvm.module.flags = !{!0, !1, !2, !3}
!nvvm.annotations = !{!4}
!llvm.ident = !{!5, !6}

!0 = !{i32 2, !"SDK Version", [2 x i32] [i32 11, i32 5]}
!1 = !{i32 1, !"wchar_size", i32 4}
!2 = !{i32 4, !"nvvm-reflect-ftz", i32 0}
!3 = !{i32 7, !"frame-pointer", i32 2}
!4 = !{ptr @_Z6vecAddPi, !"kernel", i32 1}
!5 = !{!"clang version 16.0.0 (https://github.com/llvm/llvm-project.git 159fb378f779ac79f7d456ea233892ad526b56d8)"}
!6 = !{!"clang version 3.8.0 (tags/RELEASE_380/final)"}

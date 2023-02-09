; Bitcode implementations of AMD GPU atomics
source_filename = "llvm-link"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

$_Z8atomicOrPii = comdat any

$_Z8atomicOrPjj = comdat any

$_Z8atomicOrPyy = comdat any

$_Z9atomicAddPii = comdat any

$_Z9atomicAddPjj = comdat any

$_Z9atomicAddPyy = comdat any

$_Z9atomicAddPff = comdat any

$_Z9atomicAndPii = comdat any

$_Z9atomicAndPjj = comdat any

$_Z9atomicAndPyy = comdat any

$_Z9atomicCASPiii = comdat any

$_Z9atomicCASPjjj = comdat any

$_Z9atomicCASPyyy = comdat any

$_Z10atomicExchPii = comdat any

$_Z10atomicExchPjj = comdat any

$_Z10atomicExchPyy = comdat any

$_Z10atomicExchPff = comdat any

$_Z9atomicDecPjj = comdat any

$_Z9atomicIncPjj = comdat any

$_Z9atomicMaxPii = comdat any

$_Z9atomicMaxPjj = comdat any

$_Z9atomicMaxPyy = comdat any

$_Z9atomicMinPii = comdat any

$_Z9atomicMinPjj = comdat any

$_Z9atomicMinPyy = comdat any

$_Z9atomicSubPii = comdat any

$_Z9atomicSubPjj = comdat any

$_Z9atomicXorPii = comdat any

$_Z9atomicXorPjj = comdat any

$_Z9atomicXorPyy = comdat any

; Function Attrs: convergent inlinehint mustprogress nounwind
define linkonce_odr hidden noundef i32 @_Z9atomicAddPii(ptr noundef %0, i32 noundef %1) #5 comdat {
  %3 = alloca i32, align 4, addrspace(5)
  %4 = alloca ptr, align 8, addrspace(5)
  %5 = alloca i32, align 4, addrspace(5)
  %6 = alloca i32, align 4, addrspace(5)
  %7 = alloca i32, align 4, addrspace(5)
  %8 = addrspacecast ptr addrspace(5) %3 to ptr
  %9 = addrspacecast ptr addrspace(5) %4 to ptr
  %10 = addrspacecast ptr addrspace(5) %5 to ptr
  %11 = addrspacecast ptr addrspace(5) %6 to ptr
  %12 = addrspacecast ptr addrspace(5) %7 to ptr
  store ptr %0, ptr %9, align 8, !tbaa !5
  store i32 %1, ptr %10, align 4, !tbaa !9
  %13 = load ptr, ptr %9, align 8, !tbaa !5
  %14 = load i32, ptr %10, align 4, !tbaa !9
  store i32 %14, ptr %11, align 4, !tbaa !9
  %15 = load i32, ptr %11, align 4
  %16 = atomicrmw add ptr %13, i32 %15 syncscope("agent-one-as") monotonic, align 4
  store i32 %16, ptr %12, align 4
  %17 = load i32, ptr %12, align 4, !tbaa !9
  ret i32 %17
}

; Function Attrs: convergent inlinehint mustprogress nounwind
define linkonce_odr hidden noundef i32 @_Z9atomicAddPjj(ptr noundef %0, i32 noundef %1) #5 comdat {
  %3 = alloca i32, align 4, addrspace(5)
  %4 = alloca ptr, align 8, addrspace(5)
  %5 = alloca i32, align 4, addrspace(5)
  %6 = alloca i32, align 4, addrspace(5)
  %7 = alloca i32, align 4, addrspace(5)
  %8 = addrspacecast ptr addrspace(5) %3 to ptr
  %9 = addrspacecast ptr addrspace(5) %4 to ptr
  %10 = addrspacecast ptr addrspace(5) %5 to ptr
  %11 = addrspacecast ptr addrspace(5) %6 to ptr
  %12 = addrspacecast ptr addrspace(5) %7 to ptr
  store ptr %0, ptr %9, align 8, !tbaa !5
  store i32 %1, ptr %10, align 4, !tbaa !9
  %13 = load ptr, ptr %9, align 8, !tbaa !5
  %14 = load i32, ptr %10, align 4, !tbaa !9
  store i32 %14, ptr %11, align 4, !tbaa !9
  %15 = load i32, ptr %11, align 4
  %16 = atomicrmw add ptr %13, i32 %15 syncscope("agent-one-as") monotonic, align 4
  store i32 %16, ptr %12, align 4
  %17 = load i32, ptr %12, align 4, !tbaa !9
  ret i32 %17
}

; Function Attrs: convergent inlinehint mustprogress nounwind
define linkonce_odr hidden noundef i64 @_Z9atomicAddPyy(ptr noundef %0, i64 noundef %1) #5 comdat {
  %3 = alloca i64, align 8, addrspace(5)
  %4 = alloca ptr, align 8, addrspace(5)
  %5 = alloca i64, align 8, addrspace(5)
  %6 = alloca i64, align 8, addrspace(5)
  %7 = alloca i64, align 8, addrspace(5)
  %8 = addrspacecast ptr addrspace(5) %3 to ptr
  %9 = addrspacecast ptr addrspace(5) %4 to ptr
  %10 = addrspacecast ptr addrspace(5) %5 to ptr
  %11 = addrspacecast ptr addrspace(5) %6 to ptr
  %12 = addrspacecast ptr addrspace(5) %7 to ptr
  store ptr %0, ptr %9, align 8, !tbaa !5
  store i64 %1, ptr %10, align 8, !tbaa !19
  %13 = load ptr, ptr %9, align 8, !tbaa !5
  %14 = load i64, ptr %10, align 8, !tbaa !19
  store i64 %14, ptr %11, align 8, !tbaa !19
  %15 = load i64, ptr %11, align 8
  %16 = atomicrmw add ptr %13, i64 %15 syncscope("agent-one-as") monotonic, align 8
  store i64 %16, ptr %12, align 8
  %17 = load i64, ptr %12, align 8, !tbaa !19
  ret i64 %17
}

; Function Attrs: convergent inlinehint mustprogress nounwind
define linkonce_odr hidden noundef float @_Z9atomicAddPff(ptr noundef %0, float noundef %1) #5 comdat {
  %3 = alloca float, align 4, addrspace(5)
  %4 = alloca ptr, align 8, addrspace(5)
  %5 = alloca float, align 4, addrspace(5)
  %6 = alloca float, align 4, addrspace(5)
  %7 = alloca float, align 4, addrspace(5)
  %8 = addrspacecast ptr addrspace(5) %3 to ptr
  %9 = addrspacecast ptr addrspace(5) %4 to ptr
  %10 = addrspacecast ptr addrspace(5) %5 to ptr
  %11 = addrspacecast ptr addrspace(5) %6 to ptr
  %12 = addrspacecast ptr addrspace(5) %7 to ptr
  store ptr %0, ptr %9, align 8, !tbaa !5
  store float %1, ptr %10, align 4, !tbaa !21
  %13 = load ptr, ptr %9, align 8, !tbaa !5
  %14 = load float, ptr %10, align 4, !tbaa !21
  store float %14, ptr %11, align 4, !tbaa !21
  %15 = load float, ptr %11, align 4
  %16 = atomicrmw fadd ptr %13, float %15 syncscope("agent-one-as") monotonic, align 4
  store float %16, ptr %12, align 4
  %17 = load float, ptr %12, align 4, !tbaa !21
  ret float %17
}

; Function Attrs: convergent inlinehint mustprogress nounwind
define linkonce_odr hidden noundef i32 @_Z8atomicOrPii(ptr noundef %0, i32 noundef %1) #5 comdat {
  %3 = alloca i32, align 4, addrspace(5)
  %4 = alloca ptr, align 8, addrspace(5)
  %5 = alloca i32, align 4, addrspace(5)
  %6 = alloca i32, align 4, addrspace(5)
  %7 = alloca i32, align 4, addrspace(5)
  %8 = addrspacecast ptr addrspace(5) %3 to ptr
  %9 = addrspacecast ptr addrspace(5) %4 to ptr
  %10 = addrspacecast ptr addrspace(5) %5 to ptr
  %11 = addrspacecast ptr addrspace(5) %6 to ptr
  %12 = addrspacecast ptr addrspace(5) %7 to ptr
  store ptr %0, ptr %9, align 8, !tbaa !5
  store i32 %1, ptr %10, align 4, !tbaa !9
  %13 = load ptr, ptr %9, align 8, !tbaa !5
  %14 = load i32, ptr %10, align 4, !tbaa !9
  store i32 %14, ptr %11, align 4, !tbaa !9
  %15 = load i32, ptr %11, align 4
  %16 = atomicrmw or ptr %13, i32 %15 syncscope("agent-one-as") monotonic, align 4
  store i32 %16, ptr %12, align 4
  %17 = load i32, ptr %12, align 4, !tbaa !9
  ret i32 %17
}

; Function Attrs: convergent inlinehint mustprogress nounwind
define linkonce_odr hidden noundef i32 @_Z8atomicOrPjj(ptr noundef %0, i32 noundef %1) #5 comdat {
  %3 = alloca i32, align 4, addrspace(5)
  %4 = alloca ptr, align 8, addrspace(5)
  %5 = alloca i32, align 4, addrspace(5)
  %6 = alloca i32, align 4, addrspace(5)
  %7 = alloca i32, align 4, addrspace(5)
  %8 = addrspacecast ptr addrspace(5) %3 to ptr
  %9 = addrspacecast ptr addrspace(5) %4 to ptr
  %10 = addrspacecast ptr addrspace(5) %5 to ptr
  %11 = addrspacecast ptr addrspace(5) %6 to ptr
  %12 = addrspacecast ptr addrspace(5) %7 to ptr
  store ptr %0, ptr %9, align 8, !tbaa !5
  store i32 %1, ptr %10, align 4, !tbaa !9
  %13 = load ptr, ptr %9, align 8, !tbaa !5
  %14 = load i32, ptr %10, align 4, !tbaa !9
  store i32 %14, ptr %11, align 4, !tbaa !9
  %15 = load i32, ptr %11, align 4
  %16 = atomicrmw or ptr %13, i32 %15 syncscope("agent-one-as") monotonic, align 4
  store i32 %16, ptr %12, align 4
  %17 = load i32, ptr %12, align 4, !tbaa !9
  ret i32 %17
}

; Function Attrs: convergent inlinehint mustprogress nounwind
define linkonce_odr hidden noundef i64 @_Z8atomicOrPyy(ptr noundef %0, i64 noundef %1) #5 comdat {
  %3 = alloca i64, align 8, addrspace(5)
  %4 = alloca ptr, align 8, addrspace(5)
  %5 = alloca i64, align 8, addrspace(5)
  %6 = alloca i64, align 8, addrspace(5)
  %7 = alloca i64, align 8, addrspace(5)
  %8 = addrspacecast ptr addrspace(5) %3 to ptr
  %9 = addrspacecast ptr addrspace(5) %4 to ptr
  %10 = addrspacecast ptr addrspace(5) %5 to ptr
  %11 = addrspacecast ptr addrspace(5) %6 to ptr
  %12 = addrspacecast ptr addrspace(5) %7 to ptr
  store ptr %0, ptr %9, align 8, !tbaa !5
  store i64 %1, ptr %10, align 8, !tbaa !19
  %13 = load ptr, ptr %9, align 8, !tbaa !5
  %14 = load i64, ptr %10, align 8, !tbaa !19
  store i64 %14, ptr %11, align 8, !tbaa !19
  %15 = load i64, ptr %11, align 8
  %16 = atomicrmw or ptr %13, i64 %15 syncscope("agent-one-as") monotonic, align 8
  store i64 %16, ptr %12, align 8
  %17 = load i64, ptr %12, align 8, !tbaa !19
  ret i64 %17
}


; Function Attrs: convergent inlinehint mustprogress nounwind
define linkonce_odr hidden noundef i32 @_Z9atomicAndPii(ptr noundef %0, i32 noundef %1) #5 comdat {
  %3 = alloca i32, align 4, addrspace(5)
  %4 = alloca ptr, align 8, addrspace(5)
  %5 = alloca i32, align 4, addrspace(5)
  %6 = alloca i32, align 4, addrspace(5)
  %7 = alloca i32, align 4, addrspace(5)
  %8 = addrspacecast ptr addrspace(5) %3 to ptr
  %9 = addrspacecast ptr addrspace(5) %4 to ptr
  %10 = addrspacecast ptr addrspace(5) %5 to ptr
  %11 = addrspacecast ptr addrspace(5) %6 to ptr
  %12 = addrspacecast ptr addrspace(5) %7 to ptr
  store ptr %0, ptr %9, align 8, !tbaa !5
  store i32 %1, ptr %10, align 4, !tbaa !9
  %13 = load ptr, ptr %9, align 8, !tbaa !5
  %14 = load i32, ptr %10, align 4, !tbaa !9
  store i32 %14, ptr %11, align 4, !tbaa !9
  %15 = load i32, ptr %11, align 4
  %16 = atomicrmw and ptr %13, i32 %15 syncscope("agent-one-as") monotonic, align 4
  store i32 %16, ptr %12, align 4
  %17 = load i32, ptr %12, align 4, !tbaa !9
  ret i32 %17
}

; Function Attrs: convergent inlinehint mustprogress nounwind
define linkonce_odr hidden noundef i32 @_Z9atomicAndPjj(ptr noundef %0, i32 noundef %1) #5 comdat {
  %3 = alloca i32, align 4, addrspace(5)
  %4 = alloca ptr, align 8, addrspace(5)
  %5 = alloca i32, align 4, addrspace(5)
  %6 = alloca i32, align 4, addrspace(5)
  %7 = alloca i32, align 4, addrspace(5)
  %8 = addrspacecast ptr addrspace(5) %3 to ptr
  %9 = addrspacecast ptr addrspace(5) %4 to ptr
  %10 = addrspacecast ptr addrspace(5) %5 to ptr
  %11 = addrspacecast ptr addrspace(5) %6 to ptr
  %12 = addrspacecast ptr addrspace(5) %7 to ptr
  store ptr %0, ptr %9, align 8, !tbaa !5
  store i32 %1, ptr %10, align 4, !tbaa !9
  %13 = load ptr, ptr %9, align 8, !tbaa !5
  %14 = load i32, ptr %10, align 4, !tbaa !9
  store i32 %14, ptr %11, align 4, !tbaa !9
  %15 = load i32, ptr %11, align 4
  %16 = atomicrmw and ptr %13, i32 %15 syncscope("agent-one-as") monotonic, align 4
  store i32 %16, ptr %12, align 4
  %17 = load i32, ptr %12, align 4, !tbaa !9
  ret i32 %17
}

; Function Attrs: convergent inlinehint mustprogress nounwind
define linkonce_odr hidden noundef i64 @_Z9atomicAndPyy(ptr noundef %0, i64 noundef %1) #5 comdat {
  %3 = alloca i64, align 8, addrspace(5)
  %4 = alloca ptr, align 8, addrspace(5)
  %5 = alloca i64, align 8, addrspace(5)
  %6 = alloca i64, align 8, addrspace(5)
  %7 = alloca i64, align 8, addrspace(5)
  %8 = addrspacecast ptr addrspace(5) %3 to ptr
  %9 = addrspacecast ptr addrspace(5) %4 to ptr
  %10 = addrspacecast ptr addrspace(5) %5 to ptr
  %11 = addrspacecast ptr addrspace(5) %6 to ptr
  %12 = addrspacecast ptr addrspace(5) %7 to ptr
  store ptr %0, ptr %9, align 8, !tbaa !5
  store i64 %1, ptr %10, align 8, !tbaa !19
  %13 = load ptr, ptr %9, align 8, !tbaa !5
  %14 = load i64, ptr %10, align 8, !tbaa !19
  store i64 %14, ptr %11, align 8, !tbaa !19
  %15 = load i64, ptr %11, align 8
  %16 = atomicrmw and ptr %13, i64 %15 syncscope("agent-one-as") monotonic, align 8
  store i64 %16, ptr %12, align 8
  %17 = load i64, ptr %12, align 8, !tbaa !19
  ret i64 %17
}

; Function Attrs: convergent inlinehint mustprogress nounwind
define linkonce_odr hidden noundef i32 @_Z9atomicCASPiii(ptr noundef %0, i32 noundef %1, i32 noundef %2) #5 comdat {
  %4 = alloca i32, align 4, addrspace(5)
  %5 = alloca ptr, align 8, addrspace(5)
  %6 = alloca i32, align 4, addrspace(5)
  %7 = alloca i32, align 4, addrspace(5)
  %8 = alloca i32, align 4, addrspace(5)
  %9 = alloca i8, align 1, addrspace(5)
  %10 = addrspacecast ptr addrspace(5) %4 to ptr
  %11 = addrspacecast ptr addrspace(5) %5 to ptr
  %12 = addrspacecast ptr addrspace(5) %6 to ptr
  %13 = addrspacecast ptr addrspace(5) %7 to ptr
  %14 = addrspacecast ptr addrspace(5) %8 to ptr
  %15 = addrspacecast ptr addrspace(5) %9 to ptr
  store ptr %0, ptr %11, align 8, !tbaa !5
  store i32 %1, ptr %12, align 4, !tbaa !9
  store i32 %2, ptr %13, align 4, !tbaa !9
  %16 = load ptr, ptr %11, align 8, !tbaa !5
  %17 = load i32, ptr %13, align 4, !tbaa !9
  store i32 %17, ptr %14, align 4, !tbaa !9
  %18 = load i32, ptr %12, align 4
  %19 = load i32, ptr %14, align 4
  %20 = cmpxchg ptr %16, i32 %18, i32 %19 syncscope("agent-one-as") monotonic monotonic, align 4
  %21 = extractvalue { i32, i1 } %20, 0
  %22 = extractvalue { i32, i1 } %20, 1
  br i1 %22, label %24, label %23

23:                                               ; preds = %3
  store i32 %21, ptr %12, align 4
  br label %24

24:                                               ; preds = %23, %3
  %25 = zext i1 %22 to i8
  store i8 %25, ptr %15, align 1, !tbaa !23
  %26 = load i8, ptr %15, align 1, !tbaa !23
  %27 = trunc i8 %26 to i1
  %28 = load i32, ptr %12, align 4, !tbaa !9
  ret i32 %28
}

; Function Attrs: convergent inlinehint mustprogress nounwind
define linkonce_odr hidden noundef i32 @_Z9atomicCASPjjj(ptr noundef %0, i32 noundef %1, i32 noundef %2) #5 comdat {
  %4 = alloca i32, align 4, addrspace(5)
  %5 = alloca ptr, align 8, addrspace(5)
  %6 = alloca i32, align 4, addrspace(5)
  %7 = alloca i32, align 4, addrspace(5)
  %8 = alloca i32, align 4, addrspace(5)
  %9 = alloca i8, align 1, addrspace(5)
  %10 = addrspacecast ptr addrspace(5) %4 to ptr
  %11 = addrspacecast ptr addrspace(5) %5 to ptr
  %12 = addrspacecast ptr addrspace(5) %6 to ptr
  %13 = addrspacecast ptr addrspace(5) %7 to ptr
  %14 = addrspacecast ptr addrspace(5) %8 to ptr
  %15 = addrspacecast ptr addrspace(5) %9 to ptr
  store ptr %0, ptr %11, align 8, !tbaa !5
  store i32 %1, ptr %12, align 4, !tbaa !9
  store i32 %2, ptr %13, align 4, !tbaa !9
  %16 = load ptr, ptr %11, align 8, !tbaa !5
  %17 = load i32, ptr %13, align 4, !tbaa !9
  store i32 %17, ptr %14, align 4, !tbaa !9
  %18 = load i32, ptr %12, align 4
  %19 = load i32, ptr %14, align 4
  %20 = cmpxchg ptr %16, i32 %18, i32 %19 syncscope("agent-one-as") monotonic monotonic, align 4
  %21 = extractvalue { i32, i1 } %20, 0
  %22 = extractvalue { i32, i1 } %20, 1
  br i1 %22, label %24, label %23

23:                                               ; preds = %3
  store i32 %21, ptr %12, align 4
  br label %24

24:                                               ; preds = %23, %3
  %25 = zext i1 %22 to i8
  store i8 %25, ptr %15, align 1, !tbaa !23
  %26 = load i8, ptr %15, align 1, !tbaa !23
  %27 = trunc i8 %26 to i1
  %28 = load i32, ptr %12, align 4, !tbaa !9
  ret i32 %28
}

; Function Attrs: convergent inlinehint mustprogress nounwind
define linkonce_odr hidden noundef i64 @_Z9atomicCASPyyy(ptr noundef %0, i64 noundef %1, i64 noundef %2) #5 comdat {
  %4 = alloca i64, align 8, addrspace(5)
  %5 = alloca ptr, align 8, addrspace(5)
  %6 = alloca i64, align 8, addrspace(5)
  %7 = alloca i64, align 8, addrspace(5)
  %8 = alloca i64, align 8, addrspace(5)
  %9 = alloca i8, align 1, addrspace(5)
  %10 = addrspacecast ptr addrspace(5) %4 to ptr
  %11 = addrspacecast ptr addrspace(5) %5 to ptr
  %12 = addrspacecast ptr addrspace(5) %6 to ptr
  %13 = addrspacecast ptr addrspace(5) %7 to ptr
  %14 = addrspacecast ptr addrspace(5) %8 to ptr
  %15 = addrspacecast ptr addrspace(5) %9 to ptr
  store ptr %0, ptr %11, align 8, !tbaa !5
  store i64 %1, ptr %12, align 8, !tbaa !19
  store i64 %2, ptr %13, align 8, !tbaa !19
  %16 = load ptr, ptr %11, align 8, !tbaa !5
  %17 = load i64, ptr %13, align 8, !tbaa !19
  store i64 %17, ptr %14, align 8, !tbaa !19
  %18 = load i64, ptr %12, align 8
  %19 = load i64, ptr %14, align 8
  %20 = cmpxchg ptr %16, i64 %18, i64 %19 syncscope("agent-one-as") monotonic monotonic, align 8
  %21 = extractvalue { i64, i1 } %20, 0
  %22 = extractvalue { i64, i1 } %20, 1
  br i1 %22, label %24, label %23

23:                                               ; preds = %3
  store i64 %21, ptr %12, align 8
  br label %24

24:                                               ; preds = %23, %3
  %25 = zext i1 %22 to i8
  store i8 %25, ptr %15, align 1, !tbaa !23
  %26 = load i8, ptr %15, align 1, !tbaa !23
  %27 = trunc i8 %26 to i1
  %28 = load i64, ptr %12, align 8, !tbaa !19
  ret i64 %28
}

; Function Attrs: convergent inlinehint mustprogress nounwind
define linkonce_odr hidden noundef i32 @_Z10atomicExchPii(ptr noundef %0, i32 noundef %1) #5 comdat {
  %3 = alloca i32, align 4, addrspace(5)
  %4 = alloca ptr, align 8, addrspace(5)
  %5 = alloca i32, align 4, addrspace(5)
  %6 = alloca i32, align 4, addrspace(5)
  %7 = alloca i32, align 4, addrspace(5)
  %8 = addrspacecast ptr addrspace(5) %3 to ptr
  %9 = addrspacecast ptr addrspace(5) %4 to ptr
  %10 = addrspacecast ptr addrspace(5) %5 to ptr
  %11 = addrspacecast ptr addrspace(5) %6 to ptr
  %12 = addrspacecast ptr addrspace(5) %7 to ptr
  store ptr %0, ptr %9, align 8, !tbaa !5
  store i32 %1, ptr %10, align 4, !tbaa !9
  %13 = load ptr, ptr %9, align 8, !tbaa !5
  %14 = load i32, ptr %10, align 4, !tbaa !9
  store i32 %14, ptr %11, align 4, !tbaa !9
  %15 = load i32, ptr %11, align 4
  %16 = atomicrmw xchg ptr %13, i32 %15 syncscope("agent-one-as") monotonic, align 4
  store i32 %16, ptr %12, align 4
  %17 = load i32, ptr %12, align 4, !tbaa !9
  ret i32 %17
}

; Function Attrs: convergent inlinehint mustprogress nounwind
define linkonce_odr hidden noundef i32 @_Z10atomicExchPjj(ptr noundef %0, i32 noundef %1) #5 comdat {
  %3 = alloca i32, align 4, addrspace(5)
  %4 = alloca ptr, align 8, addrspace(5)
  %5 = alloca i32, align 4, addrspace(5)
  %6 = alloca i32, align 4, addrspace(5)
  %7 = alloca i32, align 4, addrspace(5)
  %8 = addrspacecast ptr addrspace(5) %3 to ptr
  %9 = addrspacecast ptr addrspace(5) %4 to ptr
  %10 = addrspacecast ptr addrspace(5) %5 to ptr
  %11 = addrspacecast ptr addrspace(5) %6 to ptr
  %12 = addrspacecast ptr addrspace(5) %7 to ptr
  store ptr %0, ptr %9, align 8, !tbaa !5
  store i32 %1, ptr %10, align 4, !tbaa !9
  %13 = load ptr, ptr %9, align 8, !tbaa !5
  %14 = load i32, ptr %10, align 4, !tbaa !9
  store i32 %14, ptr %11, align 4, !tbaa !9
  %15 = load i32, ptr %11, align 4
  %16 = atomicrmw xchg ptr %13, i32 %15 syncscope("agent-one-as") monotonic, align 4
  store i32 %16, ptr %12, align 4
  %17 = load i32, ptr %12, align 4, !tbaa !9
  ret i32 %17
}

; Function Attrs: convergent inlinehint mustprogress nounwind
define linkonce_odr hidden noundef i64 @_Z10atomicExchPyy(ptr noundef %0, i64 noundef %1) #5 comdat {
  %3 = alloca i64, align 8, addrspace(5)
  %4 = alloca ptr, align 8, addrspace(5)
  %5 = alloca i64, align 8, addrspace(5)
  %6 = alloca i64, align 8, addrspace(5)
  %7 = alloca i64, align 8, addrspace(5)
  %8 = addrspacecast ptr addrspace(5) %3 to ptr
  %9 = addrspacecast ptr addrspace(5) %4 to ptr
  %10 = addrspacecast ptr addrspace(5) %5 to ptr
  %11 = addrspacecast ptr addrspace(5) %6 to ptr
  %12 = addrspacecast ptr addrspace(5) %7 to ptr
  store ptr %0, ptr %9, align 8, !tbaa !5
  store i64 %1, ptr %10, align 8, !tbaa !19
  %13 = load ptr, ptr %9, align 8, !tbaa !5
  %14 = load i64, ptr %10, align 8, !tbaa !19
  store i64 %14, ptr %11, align 8, !tbaa !19
  %15 = load i64, ptr %11, align 8
  %16 = atomicrmw xchg ptr %13, i64 %15 syncscope("agent-one-as") monotonic, align 8
  store i64 %16, ptr %12, align 8
  %17 = load i64, ptr %12, align 8, !tbaa !19
  ret i64 %17
}

; Function Attrs: convergent inlinehint mustprogress nounwind
define linkonce_odr hidden noundef float @_Z10atomicExchPff(ptr noundef %0, float noundef %1) #5 comdat {
  %3 = alloca float, align 4, addrspace(5)
  %4 = alloca ptr, align 8, addrspace(5)
  %5 = alloca float, align 4, addrspace(5)
  %6 = alloca float, align 4, addrspace(5)
  %7 = alloca float, align 4, addrspace(5)
  %8 = addrspacecast ptr addrspace(5) %3 to ptr
  %9 = addrspacecast ptr addrspace(5) %4 to ptr
  %10 = addrspacecast ptr addrspace(5) %5 to ptr
  %11 = addrspacecast ptr addrspace(5) %6 to ptr
  %12 = addrspacecast ptr addrspace(5) %7 to ptr
  store ptr %0, ptr %9, align 8, !tbaa !5
  store float %1, ptr %10, align 4, !tbaa !21
  %13 = load ptr, ptr %9, align 8, !tbaa !5
  %14 = load float, ptr %10, align 4, !tbaa !21
  store float %14, ptr %11, align 4, !tbaa !21
  %15 = load i32, ptr %11, align 4
  %16 = atomicrmw xchg ptr %13, i32 %15 syncscope("agent-one-as") monotonic, align 4
  store i32 %16, ptr %12, align 4
  %17 = load float, ptr %12, align 4, !tbaa !21
  ret float %17
}

; Function Attrs: convergent inlinehint mustprogress nounwind
define linkonce_odr hidden noundef i32 @_Z9atomicDecPjj(ptr noundef %0, i32 noundef %1) #5 comdat {
  %3 = alloca i32, align 4, addrspace(5)
  %4 = alloca ptr, align 8, addrspace(5)
  %5 = alloca i32, align 4, addrspace(5)
  %6 = addrspacecast ptr addrspace(5) %3 to ptr
  %7 = addrspacecast ptr addrspace(5) %4 to ptr
  %8 = addrspacecast ptr addrspace(5) %5 to ptr
  store ptr %0, ptr %7, align 8, !tbaa !5
  store i32 %1, ptr %8, align 4, !tbaa !9
  %9 = load ptr, ptr %7, align 8, !tbaa !5
  %10 = load i32, ptr %8, align 4, !tbaa !9
  %11 = call noundef i32 @llvm.amdgcn.atomic.dec.i32.p0(ptr noundef %9, i32 noundef %10, i32 noundef 0, i32 noundef 1, i1 noundef zeroext false) #20
  ret i32 %11
}

; Function Attrs: convergent inlinehint mustprogress nounwind
define linkonce_odr hidden noundef i32 @_Z9atomicIncPjj(ptr noundef %0, i32 noundef %1) #5 comdat {
  %3 = alloca i32, align 4, addrspace(5)
  %4 = alloca ptr, align 8, addrspace(5)
  %5 = alloca i32, align 4, addrspace(5)
  %6 = addrspacecast ptr addrspace(5) %3 to ptr
  %7 = addrspacecast ptr addrspace(5) %4 to ptr
  %8 = addrspacecast ptr addrspace(5) %5 to ptr
  store ptr %0, ptr %7, align 8, !tbaa !5
  store i32 %1, ptr %8, align 4, !tbaa !9
  %9 = load ptr, ptr %7, align 8, !tbaa !5
  %10 = load i32, ptr %8, align 4, !tbaa !9
  %11 = call noundef i32 @llvm.amdgcn.atomic.inc.i32.p0(ptr noundef %9, i32 noundef %10, i32 noundef 0, i32 noundef 1, i1 noundef zeroext false) #20
  ret i32 %11
}

; Function Attrs: convergent inlinehint mustprogress nounwind
define linkonce_odr hidden noundef i32 @_Z9atomicMaxPii(ptr noundef %0, i32 noundef %1) #5 comdat {
  %3 = alloca i32, align 4, addrspace(5)
  %4 = alloca ptr, align 8, addrspace(5)
  %5 = alloca i32, align 4, addrspace(5)
  %6 = alloca i32, align 4, addrspace(5)
  %7 = alloca i32, align 4, addrspace(5)
  %8 = addrspacecast ptr addrspace(5) %3 to ptr
  %9 = addrspacecast ptr addrspace(5) %4 to ptr
  %10 = addrspacecast ptr addrspace(5) %5 to ptr
  %11 = addrspacecast ptr addrspace(5) %6 to ptr
  %12 = addrspacecast ptr addrspace(5) %7 to ptr
  store ptr %0, ptr %9, align 8, !tbaa !5
  store i32 %1, ptr %10, align 4, !tbaa !9
  %13 = load ptr, ptr %9, align 8, !tbaa !5
  %14 = load i32, ptr %10, align 4, !tbaa !9
  store i32 %14, ptr %11, align 4, !tbaa !9
  %15 = load i32, ptr %11, align 4
  %16 = atomicrmw max ptr %13, i32 %15 syncscope("agent-one-as") monotonic, align 4
  store i32 %16, ptr %12, align 4
  %17 = load i32, ptr %12, align 4, !tbaa !9
  ret i32 %17
}

; Function Attrs: convergent inlinehint mustprogress nounwind
define linkonce_odr hidden noundef i32 @_Z9atomicMaxPjj(ptr noundef %0, i32 noundef %1) #5 comdat {
  %3 = alloca i32, align 4, addrspace(5)
  %4 = alloca ptr, align 8, addrspace(5)
  %5 = alloca i32, align 4, addrspace(5)
  %6 = alloca i32, align 4, addrspace(5)
  %7 = alloca i32, align 4, addrspace(5)
  %8 = addrspacecast ptr addrspace(5) %3 to ptr
  %9 = addrspacecast ptr addrspace(5) %4 to ptr
  %10 = addrspacecast ptr addrspace(5) %5 to ptr
  %11 = addrspacecast ptr addrspace(5) %6 to ptr
  %12 = addrspacecast ptr addrspace(5) %7 to ptr
  store ptr %0, ptr %9, align 8, !tbaa !5
  store i32 %1, ptr %10, align 4, !tbaa !9
  %13 = load ptr, ptr %9, align 8, !tbaa !5
  %14 = load i32, ptr %10, align 4, !tbaa !9
  store i32 %14, ptr %11, align 4, !tbaa !9
  %15 = load i32, ptr %11, align 4
  %16 = atomicrmw umax ptr %13, i32 %15 syncscope("agent-one-as") monotonic, align 4
  store i32 %16, ptr %12, align 4
  %17 = load i32, ptr %12, align 4, !tbaa !9
  ret i32 %17
}

; Function Attrs: convergent inlinehint mustprogress nounwind
define linkonce_odr hidden noundef i64 @_Z9atomicMaxPyy(ptr noundef %0, i64 noundef %1) #5 comdat {
  %3 = alloca i64, align 8, addrspace(5)
  %4 = alloca ptr, align 8, addrspace(5)
  %5 = alloca i64, align 8, addrspace(5)
  %6 = alloca i64, align 8, addrspace(5)
  %7 = alloca i64, align 8, addrspace(5)
  %8 = addrspacecast ptr addrspace(5) %3 to ptr
  %9 = addrspacecast ptr addrspace(5) %4 to ptr
  %10 = addrspacecast ptr addrspace(5) %5 to ptr
  %11 = addrspacecast ptr addrspace(5) %6 to ptr
  %12 = addrspacecast ptr addrspace(5) %7 to ptr
  store ptr %0, ptr %9, align 8, !tbaa !5
  store i64 %1, ptr %10, align 8, !tbaa !19
  %13 = load ptr, ptr %9, align 8, !tbaa !5
  %14 = load i64, ptr %10, align 8, !tbaa !19
  store i64 %14, ptr %11, align 8, !tbaa !19
  %15 = load i64, ptr %11, align 8
  %16 = atomicrmw umax ptr %13, i64 %15 syncscope("agent-one-as") monotonic, align 8
  store i64 %16, ptr %12, align 8
  %17 = load i64, ptr %12, align 8, !tbaa !19
  ret i64 %17
}


; Function Attrs: convergent inlinehint mustprogress nounwind
define linkonce_odr hidden noundef i32 @_Z9atomicMinPii(ptr noundef %0, i32 noundef %1) #5 comdat {
  %3 = alloca i32, align 4, addrspace(5)
  %4 = alloca ptr, align 8, addrspace(5)
  %5 = alloca i32, align 4, addrspace(5)
  %6 = alloca i32, align 4, addrspace(5)
  %7 = alloca i32, align 4, addrspace(5)
  %8 = addrspacecast ptr addrspace(5) %3 to ptr
  %9 = addrspacecast ptr addrspace(5) %4 to ptr
  %10 = addrspacecast ptr addrspace(5) %5 to ptr
  %11 = addrspacecast ptr addrspace(5) %6 to ptr
  %12 = addrspacecast ptr addrspace(5) %7 to ptr
  store ptr %0, ptr %9, align 8, !tbaa !5
  store i32 %1, ptr %10, align 4, !tbaa !9
  %13 = load ptr, ptr %9, align 8, !tbaa !5
  %14 = load i32, ptr %10, align 4, !tbaa !9
  store i32 %14, ptr %11, align 4, !tbaa !9
  %15 = load i32, ptr %11, align 4
  %16 = atomicrmw min ptr %13, i32 %15 syncscope("agent-one-as") monotonic, align 4
  store i32 %16, ptr %12, align 4
  %17 = load i32, ptr %12, align 4, !tbaa !9
  ret i32 %17
}

; Function Attrs: convergent inlinehint mustprogress nounwind
define linkonce_odr hidden noundef i32 @_Z9atomicMinPjj(ptr noundef %0, i32 noundef %1) #5 comdat {
  %3 = alloca i32, align 4, addrspace(5)
  %4 = alloca ptr, align 8, addrspace(5)
  %5 = alloca i32, align 4, addrspace(5)
  %6 = alloca i32, align 4, addrspace(5)
  %7 = alloca i32, align 4, addrspace(5)
  %8 = addrspacecast ptr addrspace(5) %3 to ptr
  %9 = addrspacecast ptr addrspace(5) %4 to ptr
  %10 = addrspacecast ptr addrspace(5) %5 to ptr
  %11 = addrspacecast ptr addrspace(5) %6 to ptr
  %12 = addrspacecast ptr addrspace(5) %7 to ptr
  store ptr %0, ptr %9, align 8, !tbaa !5
  store i32 %1, ptr %10, align 4, !tbaa !9
  %13 = load ptr, ptr %9, align 8, !tbaa !5
  %14 = load i32, ptr %10, align 4, !tbaa !9
  store i32 %14, ptr %11, align 4, !tbaa !9
  %15 = load i32, ptr %11, align 4
  %16 = atomicrmw umin ptr %13, i32 %15 syncscope("agent-one-as") monotonic, align 4
  store i32 %16, ptr %12, align 4
  %17 = load i32, ptr %12, align 4, !tbaa !9
  ret i32 %17
}

; Function Attrs: convergent inlinehint mustprogress nounwind
define linkonce_odr hidden noundef i64 @_Z9atomicMinPyy(ptr noundef %0, i64 noundef %1) #5 comdat {
  %3 = alloca i64, align 8, addrspace(5)
  %4 = alloca ptr, align 8, addrspace(5)
  %5 = alloca i64, align 8, addrspace(5)
  %6 = alloca i64, align 8, addrspace(5)
  %7 = alloca i64, align 8, addrspace(5)
  %8 = addrspacecast ptr addrspace(5) %3 to ptr
  %9 = addrspacecast ptr addrspace(5) %4 to ptr
  %10 = addrspacecast ptr addrspace(5) %5 to ptr
  %11 = addrspacecast ptr addrspace(5) %6 to ptr
  %12 = addrspacecast ptr addrspace(5) %7 to ptr
  store ptr %0, ptr %9, align 8, !tbaa !5
  store i64 %1, ptr %10, align 8, !tbaa !19
  %13 = load ptr, ptr %9, align 8, !tbaa !5
  %14 = load i64, ptr %10, align 8, !tbaa !19
  store i64 %14, ptr %11, align 8, !tbaa !19
  %15 = load i64, ptr %11, align 8
  %16 = atomicrmw umin ptr %13, i64 %15 syncscope("agent-one-as") monotonic, align 8
  store i64 %16, ptr %12, align 8
  %17 = load i64, ptr %12, align 8, !tbaa !19
  ret i64 %17
}

; Function Attrs: convergent inlinehint mustprogress nounwind
define linkonce_odr hidden noundef i32 @_Z9atomicSubPii(ptr noundef %0, i32 noundef %1) #5 comdat {
  %3 = alloca i32, align 4, addrspace(5)
  %4 = alloca ptr, align 8, addrspace(5)
  %5 = alloca i32, align 4, addrspace(5)
  %6 = alloca i32, align 4, addrspace(5)
  %7 = alloca i32, align 4, addrspace(5)
  %8 = addrspacecast ptr addrspace(5) %3 to ptr
  %9 = addrspacecast ptr addrspace(5) %4 to ptr
  %10 = addrspacecast ptr addrspace(5) %5 to ptr
  %11 = addrspacecast ptr addrspace(5) %6 to ptr
  %12 = addrspacecast ptr addrspace(5) %7 to ptr
  store ptr %0, ptr %9, align 8, !tbaa !5
  store i32 %1, ptr %10, align 4, !tbaa !9
  %13 = load ptr, ptr %9, align 8, !tbaa !5
  %14 = load i32, ptr %10, align 4, !tbaa !9
  %15 = sub nsw i32 0, %14
  store i32 %15, ptr %11, align 4, !tbaa !9
  %16 = load i32, ptr %11, align 4
  %17 = atomicrmw add ptr %13, i32 %16 syncscope("agent-one-as") monotonic, align 4
  store i32 %17, ptr %12, align 4
  %18 = load i32, ptr %12, align 4, !tbaa !9
  ret i32 %18
}

; Function Attrs: convergent inlinehint mustprogress nounwind
define linkonce_odr hidden noundef i32 @_Z9atomicSubPjj(ptr noundef %0, i32 noundef %1) #5 comdat {
  %3 = alloca i32, align 4, addrspace(5)
  %4 = alloca ptr, align 8, addrspace(5)
  %5 = alloca i32, align 4, addrspace(5)
  %6 = alloca i32, align 4, addrspace(5)
  %7 = alloca i32, align 4, addrspace(5)
  %8 = addrspacecast ptr addrspace(5) %3 to ptr
  %9 = addrspacecast ptr addrspace(5) %4 to ptr
  %10 = addrspacecast ptr addrspace(5) %5 to ptr
  %11 = addrspacecast ptr addrspace(5) %6 to ptr
  %12 = addrspacecast ptr addrspace(5) %7 to ptr
  store ptr %0, ptr %9, align 8, !tbaa !5
  store i32 %1, ptr %10, align 4, !tbaa !9
  %13 = load ptr, ptr %9, align 8, !tbaa !5
  %14 = load i32, ptr %10, align 4, !tbaa !9
  %15 = sub i32 0, %14
  store i32 %15, ptr %11, align 4, !tbaa !9
  %16 = load i32, ptr %11, align 4
  %17 = atomicrmw add ptr %13, i32 %16 syncscope("agent-one-as") monotonic, align 4
  store i32 %17, ptr %12, align 4
  %18 = load i32, ptr %12, align 4, !tbaa !9
  ret i32 %18
}

; Function Attrs: convergent inlinehint mustprogress nounwind
define linkonce_odr hidden noundef i32 @_Z9atomicXorPii(ptr noundef %0, i32 noundef %1) #5 comdat {
  %3 = alloca i32, align 4, addrspace(5)
  %4 = alloca ptr, align 8, addrspace(5)
  %5 = alloca i32, align 4, addrspace(5)
  %6 = alloca i32, align 4, addrspace(5)
  %7 = alloca i32, align 4, addrspace(5)
  %8 = addrspacecast ptr addrspace(5) %3 to ptr
  %9 = addrspacecast ptr addrspace(5) %4 to ptr
  %10 = addrspacecast ptr addrspace(5) %5 to ptr
  %11 = addrspacecast ptr addrspace(5) %6 to ptr
  %12 = addrspacecast ptr addrspace(5) %7 to ptr
  store ptr %0, ptr %9, align 8, !tbaa !5
  store i32 %1, ptr %10, align 4, !tbaa !9
  %13 = load ptr, ptr %9, align 8, !tbaa !5
  %14 = load i32, ptr %10, align 4, !tbaa !9
  store i32 %14, ptr %11, align 4, !tbaa !9
  %15 = load i32, ptr %11, align 4
  %16 = atomicrmw xor ptr %13, i32 %15 syncscope("agent-one-as") monotonic, align 4
  store i32 %16, ptr %12, align 4
  %17 = load i32, ptr %12, align 4, !tbaa !9
  ret i32 %17
}

; Function Attrs: convergent inlinehint mustprogress nounwind
define linkonce_odr hidden noundef i32 @_Z9atomicXorPjj(ptr noundef %0, i32 noundef %1) #5 comdat {
  %3 = alloca i32, align 4, addrspace(5)
  %4 = alloca ptr, align 8, addrspace(5)
  %5 = alloca i32, align 4, addrspace(5)
  %6 = alloca i32, align 4, addrspace(5)
  %7 = alloca i32, align 4, addrspace(5)
  %8 = addrspacecast ptr addrspace(5) %3 to ptr
  %9 = addrspacecast ptr addrspace(5) %4 to ptr
  %10 = addrspacecast ptr addrspace(5) %5 to ptr
  %11 = addrspacecast ptr addrspace(5) %6 to ptr
  %12 = addrspacecast ptr addrspace(5) %7 to ptr
  store ptr %0, ptr %9, align 8, !tbaa !5
  store i32 %1, ptr %10, align 4, !tbaa !9
  %13 = load ptr, ptr %9, align 8, !tbaa !5
  %14 = load i32, ptr %10, align 4, !tbaa !9
  store i32 %14, ptr %11, align 4, !tbaa !9
  %15 = load i32, ptr %11, align 4
  %16 = atomicrmw xor ptr %13, i32 %15 syncscope("agent-one-as") monotonic, align 4
  store i32 %16, ptr %12, align 4
  %17 = load i32, ptr %12, align 4, !tbaa !9
  ret i32 %17
}

; Function Attrs: convergent inlinehint mustprogress nounwind
define linkonce_odr hidden noundef i64 @_Z9atomicXorPyy(ptr noundef %0, i64 noundef %1) #5 comdat {
  %3 = alloca i64, align 8, addrspace(5)
  %4 = alloca ptr, align 8, addrspace(5)
  %5 = alloca i64, align 8, addrspace(5)
  %6 = alloca i64, align 8, addrspace(5)
  %7 = alloca i64, align 8, addrspace(5)
  %8 = addrspacecast ptr addrspace(5) %3 to ptr
  %9 = addrspacecast ptr addrspace(5) %4 to ptr
  %10 = addrspacecast ptr addrspace(5) %5 to ptr
  %11 = addrspacecast ptr addrspace(5) %6 to ptr
  %12 = addrspacecast ptr addrspace(5) %7 to ptr
  store ptr %0, ptr %9, align 8, !tbaa !5
  store i64 %1, ptr %10, align 8, !tbaa !19
  %13 = load ptr, ptr %9, align 8, !tbaa !5
  %14 = load i64, ptr %10, align 8, !tbaa !19
  store i64 %14, ptr %11, align 8, !tbaa !19
  %15 = load i64, ptr %11, align 8
  %16 = atomicrmw xor ptr %13, i64 %15 syncscope("agent-one-as") monotonic, align 8
  store i64 %16, ptr %12, align 8
  %17 = load i64, ptr %12, align 8, !tbaa !19
  ret i64 %17
}

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.umin.i64(i64, i64) #18

; Function Attrs: argmemonly nounwind willreturn
declare i32 @llvm.amdgcn.atomic.dec.i32.p0(ptr nocapture, i32, i32 immarg, i32 immarg, i1 immarg) #19

; Function Attrs: argmemonly nounwind willreturn
declare i32 @llvm.amdgcn.atomic.inc.i32.p0(ptr nocapture, i32, i32 immarg, i32 immarg, i1 immarg) #19


attributes #0 = { convergent mustprogress noinline nounwind "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx90a" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot3-insts,+dot4-insts,+dot5-insts,+dot6-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+gfx90a-insts,+mai-insts,+s-memrealtime,+s-memtime-inst" }
attributes #1 = { argmemonly nocallback nofree nosync nounwind willreturn }
attributes #2 = { argmemonly nocallback nofree nounwind willreturn }
attributes #3 = { cold noreturn nounwind }
attributes #4 = { convergent mustprogress norecurse nounwind "amdgpu-flat-work-group-size"="1,1024" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx90a" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot3-insts,+dot4-insts,+dot5-insts,+dot6-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+gfx90a-insts,+mai-insts,+s-memrealtime,+s-memtime-inst" "uniform-work-group-size"="true" }
attributes #5 = { convergent inlinehint mustprogress nounwind "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx90a" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot3-insts,+dot4-insts,+dot5-insts,+dot6-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+gfx90a-insts,+mai-insts,+s-memrealtime,+s-memtime-inst" }
attributes #6 = { convergent norecurse nounwind "frame-pointer"="none" "min-legal-vector-width"="128" "no-trapping-math"="true" "stack-protector-buffer-size"="8" }
attributes #7 = { nounwind readnone speculatable willreturn }
attributes #8 = { convergent noinline norecurse nounwind optnone "frame-pointer"="none" "min-legal-vector-width"="128" "no-trapping-math"="true" "stack-protector-buffer-size"="8" }
attributes #9 = { alwaysinline convergent mustprogress nofree norecurse nosync nounwind readnone willreturn "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" }
attributes #10 = { convergent norecurse nounwind "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" }
attributes #11 = { convergent nounwind readnone willreturn }
attributes #12 = { argmemonly convergent mustprogress nofree norecurse nosync nounwind readonly willreturn "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" }
attributes #13 = { convergent mustprogress nofree norecurse nounwind willreturn "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" }
attributes #14 = { nounwind willreturn }
attributes #15 = { nounwind }
attributes #16 = { nounwind readonly }
attributes #17 = { nounwind readnone willreturn }
attributes #18 = { nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #19 = { argmemonly nounwind willreturn }
attributes #20 = { convergent nounwind }
attributes #21 = { convergent }

!llvm.module.flags = !{!0, !1, !2}
!llvm.ident = !{!3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3}
!opencl.ocl.version = !{!4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4}

!0 = !{i32 1, !"amdgpu_code_object_version", i32 400}
!1 = !{i32 1, !"wchar_size", i32 4}
!2 = !{i32 8, !"PIC Level", i32 1}
!3 = !{!"clang version 16.0.0 (https://github.com/llvm/llvm-project.git 159fb378f779ac79f7d456ea233892ad526b56d8)"}
!4 = !{i32 2, i32 0}
!5 = !{!6, !6, i64 0}
!6 = !{!"any pointer", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C++ TBAA"}
!9 = !{!10, !10, i64 0}
!10 = !{!"int", !7, i64 0}
!11 = !{!12, !12, i64 0}
!12 = !{!"long", !7, i64 0}
!13 = !{!7, !7, i64 0}
!14 = distinct !{!14, !15}
!15 = !{!"llvm.loop.mustprogress"}
!16 = distinct !{!16, !15}
!17 = distinct !{!17, !15}
!18 = distinct !{!18, !15}
!19 = !{!20, !20, i64 0}
!20 = !{!"long long", !7, i64 0}
!21 = !{!22, !22, i64 0}
!22 = !{!"float", !7, i64 0}
!23 = !{!24, !24, i64 0}
!24 = !{!"bool", !7, i64 0}
!25 = !{!26, !26, i64 0}
!26 = !{!"int", !27, i64 0}
!27 = !{!"omnipotent char", !28, i64 0}
!28 = !{!"Simple C/C++ TBAA"}
!29 = !{!30, !30, i64 0}
!30 = !{!"long", !27, i64 0}
!31 = !{!32, !32, i64 0}
!32 = !{!"any pointer", !27, i64 0}
!33 = !{!34, !32, i64 0}
!34 = !{!"", !32, i64 0, !32, i64 8, !35, i64 16, !30, i64 24, !30, i64 32, !30, i64 40}
!35 = !{!"hsa_signal_s", !30, i64 0}
!36 = !{!34, !30, i64 40}
!37 = !{!34, !32, i64 8}
!38 = !{!27, !27, i64 0}
!39 = !{!40, !40, i64 0}
!40 = !{!"bool", !27, i64 0}
!41 = !{i64 2662}
!42 = !{!"exec"}
!43 = !{!44, !26, i64 16}
!44 = !{!"", !30, i64 0, !30, i64 8, !26, i64 16, !26, i64 20}
!45 = !{!44, !30, i64 8}
!46 = !{!44, !26, i64 20}
!47 = !{!44, !30, i64 0}
!48 = !{!49, !30, i64 16}
!49 = !{!"amd_signal_s", !30, i64 0, !27, i64 8, !30, i64 16, !26, i64 24, !26, i64 28, !30, i64 32, !30, i64 40, !27, i64 48, !27, i64 56}
!50 = !{!49, !26, i64 24}


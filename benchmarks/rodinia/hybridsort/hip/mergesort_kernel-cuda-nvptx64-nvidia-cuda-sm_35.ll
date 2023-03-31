; ModuleID = 'mergesort_kernel-cuda-nvptx64-nvidia-cuda-sm_35.bc'
source_filename = "mergesort_kernel.cu"
target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

%struct.__cuda_builtin_blockIdx_t = type { i8 }
%struct.__cuda_builtin_blockDim_t = type { i8 }
%struct.__cuda_builtin_threadIdx_t = type { i8 }
%struct.float4 = type { float, float, float, float }

$_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_xEv = comdat any

$_ZN25__cuda_builtin_blockDim_t17__fetch_builtin_xEv = comdat any

$_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_xEv = comdat any

$_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_yEv = comdat any

@tex = dso_local addrspace(1) externally_initialized global i64 undef, align 4
@txt = dso_local addrspace(1) externally_initialized global i64 undef, align 4
@constStartAddr = dso_local addrspace(4) externally_initialized global [1025 x i32] zeroinitializer, align 4
@finalStartAddr = dso_local addrspace(4) externally_initialized global [1025 x i32] zeroinitializer, align 4
@nullElems = dso_local addrspace(4) externally_initialized global [1024 x i32] zeroinitializer, align 4
@blockIdx = extern_weak dso_local addrspace(1) global %struct.__cuda_builtin_blockIdx_t, align 1
@blockDim = extern_weak dso_local addrspace(1) global %struct.__cuda_builtin_blockDim_t, align 1
@threadIdx = extern_weak dso_local addrspace(1) global %struct.__cuda_builtin_threadIdx_t, align 1
@llvm.compiler.used = appending global [4 x ptr] [ptr addrspacecast (ptr addrspace(1) @tex to ptr), ptr addrspacecast (ptr addrspace(4) @constStartAddr to ptr), ptr addrspacecast (ptr addrspace(4) @finalStartAddr to ptr), ptr addrspacecast (ptr addrspace(4) @nullElems to ptr)], section "llvm.metadata"

; Function Attrs: convergent mustprogress noinline nounwind optnone
define dso_local %struct.float4 @_Z8sortElem6float4(ptr noundef byval(%struct.float4) align 16 %0) #0 {
  %2 = alloca %struct.float4, align 16
  %3 = getelementptr inbounds %struct.float4, ptr %0, i32 0, i32 0
  %4 = load float, ptr %3, align 16
  %5 = getelementptr inbounds %struct.float4, ptr %0, i32 0, i32 1
  %6 = load float, ptr %5, align 4
  %7 = fcmp contract ogt float %4, %6
  br i1 %7, label %8, label %11



8:                                                ; preds = %1
  %9 = getelementptr inbounds %struct.float4, ptr %0, i32 0, i32 1
  %10 = load float, ptr %9, align 4
  br label %14

11:                                               ; preds = %1
  %12 = getelementptr inbounds %struct.float4, ptr %0, i32 0, i32 0
  %13 = load float, ptr %12, align 16
  br label %14

14:                                               ; preds = %11, %8
  %15 = phi contract float [ %10, %8 ], [ %13, %11 ]
  %16 = getelementptr inbounds %struct.float4, ptr %2, i32 0, i32 0
  store float %15, ptr %16, align 16
  %17 = getelementptr inbounds %struct.float4, ptr %0, i32 0, i32 1
  %18 = load float, ptr %17, align 4
  %19 = getelementptr inbounds %struct.float4, ptr %0, i32 0, i32 0
  %20 = load float, ptr %19, align 16
  %21 = fcmp contract ogt float %18, %20
  br i1 %21, label %22, label %25

22:                                               ; preds = %14
  %23 = getelementptr inbounds %struct.float4, ptr %0, i32 0, i32 1
  %24 = load float, ptr %23, align 4
  br label %28

25:                                               ; preds = %14
  %26 = getelementptr inbounds %struct.float4, ptr %0, i32 0, i32 0
  %27 = load float, ptr %26, align 16
  br label %28

28:                                               ; preds = %25, %22
  %29 = phi contract float [ %24, %22 ], [ %27, %25 ]
  %30 = getelementptr inbounds %struct.float4, ptr %2, i32 0, i32 1
  store float %29, ptr %30, align 4
  %31 = getelementptr inbounds %struct.float4, ptr %0, i32 0, i32 2
  %32 = load float, ptr %31, align 8
  %33 = getelementptr inbounds %struct.float4, ptr %0, i32 0, i32 3
  %34 = load float, ptr %33, align 4
  %35 = fcmp contract ogt float %32, %34
  br i1 %35, label %36, label %39

36:                                               ; preds = %28
  %37 = getelementptr inbounds %struct.float4, ptr %0, i32 0, i32 3
  %38 = load float, ptr %37, align 4
  br label %42

39:                                               ; preds = %28
  %40 = getelementptr inbounds %struct.float4, ptr %0, i32 0, i32 2
  %41 = load float, ptr %40, align 8
  br label %42

42:                                               ; preds = %39, %36
  %43 = phi contract float [ %38, %36 ], [ %41, %39 ]
  %44 = getelementptr inbounds %struct.float4, ptr %2, i32 0, i32 2
  store float %43, ptr %44, align 8
  %45 = getelementptr inbounds %struct.float4, ptr %0, i32 0, i32 3
  %46 = load float, ptr %45, align 4
  %47 = getelementptr inbounds %struct.float4, ptr %0, i32 0, i32 2
  %48 = load float, ptr %47, align 8
  %49 = fcmp contract ogt float %46, %48
  br i1 %49, label %50, label %53

50:                                               ; preds = %42
  %51 = getelementptr inbounds %struct.float4, ptr %0, i32 0, i32 3
  %52 = load float, ptr %51, align 4
  br label %56

53:                                               ; preds = %42
  %54 = getelementptr inbounds %struct.float4, ptr %0, i32 0, i32 2
  %55 = load float, ptr %54, align 8
  br label %56

56:                                               ; preds = %53, %50
  %57 = phi contract float [ %52, %50 ], [ %55, %53 ]
  %58 = getelementptr inbounds %struct.float4, ptr %2, i32 0, i32 3
  store float %57, ptr %58, align 4
  %59 = getelementptr inbounds %struct.float4, ptr %2, i32 0, i32 0
  %60 = load float, ptr %59, align 16
  %61 = getelementptr inbounds %struct.float4, ptr %2, i32 0, i32 2
  %62 = load float, ptr %61, align 8
  %63 = fcmp contract ogt float %60, %62
  br i1 %63, label %64, label %67

64:                                               ; preds = %56
  %65 = getelementptr inbounds %struct.float4, ptr %2, i32 0, i32 2
  %66 = load float, ptr %65, align 8
  br label %70

67:                                               ; preds = %56
  %68 = getelementptr inbounds %struct.float4, ptr %2, i32 0, i32 0
  %69 = load float, ptr %68, align 16
  br label %70

70:                                               ; preds = %67, %64
  %71 = phi contract float [ %66, %64 ], [ %69, %67 ]
  %72 = getelementptr inbounds %struct.float4, ptr %0, i32 0, i32 0
  store float %71, ptr %72, align 16
  %73 = getelementptr inbounds %struct.float4, ptr %2, i32 0, i32 1
  %74 = load float, ptr %73, align 4
  %75 = getelementptr inbounds %struct.float4, ptr %2, i32 0, i32 3
  %76 = load float, ptr %75, align 4
  %77 = fcmp contract ogt float %74, %76
  br i1 %77, label %78, label %81

78:                                               ; preds = %70
  %79 = getelementptr inbounds %struct.float4, ptr %2, i32 0, i32 3
  %80 = load float, ptr %79, align 4
  br label %84

81:                                               ; preds = %70
  %82 = getelementptr inbounds %struct.float4, ptr %2, i32 0, i32 1
  %83 = load float, ptr %82, align 4
  br label %84

84:                                               ; preds = %81, %78
  %85 = phi contract float [ %80, %78 ], [ %83, %81 ]
  %86 = getelementptr inbounds %struct.float4, ptr %0, i32 0, i32 1
  store float %85, ptr %86, align 4
  %87 = getelementptr inbounds %struct.float4, ptr %2, i32 0, i32 2
  %88 = load float, ptr %87, align 8
  %89 = getelementptr inbounds %struct.float4, ptr %2, i32 0, i32 0
  %90 = load float, ptr %89, align 16
  %91 = fcmp contract ogt float %88, %90
  br i1 %91, label %92, label %95

92:                                               ; preds = %84
  %93 = getelementptr inbounds %struct.float4, ptr %2, i32 0, i32 2
  %94 = load float, ptr %93, align 8
  br label %98

95:                                               ; preds = %84
  %96 = getelementptr inbounds %struct.float4, ptr %2, i32 0, i32 0
  %97 = load float, ptr %96, align 16
  br label %98

98:                                               ; preds = %95, %92
  %99 = phi contract float [ %94, %92 ], [ %97, %95 ]
  %100 = getelementptr inbounds %struct.float4, ptr %0, i32 0, i32 2
  store float %99, ptr %100, align 8
  %101 = getelementptr inbounds %struct.float4, ptr %2, i32 0, i32 3
  %102 = load float, ptr %101, align 4
  %103 = getelementptr inbounds %struct.float4, ptr %2, i32 0, i32 1
  %104 = load float, ptr %103, align 4
  %105 = fcmp contract ogt float %102, %104
  br i1 %105, label %106, label %109

106:                                              ; preds = %98
  %107 = getelementptr inbounds %struct.float4, ptr %2, i32 0, i32 3
  %108 = load float, ptr %107, align 4
  br label %112

109:                                              ; preds = %98
  %110 = getelementptr inbounds %struct.float4, ptr %2, i32 0, i32 1
  %111 = load float, ptr %110, align 4
  br label %112

112:                                              ; preds = %109, %106
  %113 = phi contract float [ %108, %106 ], [ %111, %109 ]
  %114 = getelementptr inbounds %struct.float4, ptr %0, i32 0, i32 3
  store float %113, ptr %114, align 4
  %115 = getelementptr inbounds %struct.float4, ptr %0, i32 0, i32 0
  %116 = load float, ptr %115, align 16
  %117 = getelementptr inbounds %struct.float4, ptr %2, i32 0, i32 0
  store float %116, ptr %117, align 16
  %118 = getelementptr inbounds %struct.float4, ptr %0, i32 0, i32 1
  %119 = load float, ptr %118, align 4
  %120 = getelementptr inbounds %struct.float4, ptr %0, i32 0, i32 2
  %121 = load float, ptr %120, align 8
  %122 = fcmp contract ogt float %119, %121
  br i1 %122, label %123, label %126

123:                                              ; preds = %112
  %124 = getelementptr inbounds %struct.float4, ptr %0, i32 0, i32 2
  %125 = load float, ptr %124, align 8
  br label %129

126:                                              ; preds = %112
  %127 = getelementptr inbounds %struct.float4, ptr %0, i32 0, i32 1
  %128 = load float, ptr %127, align 4
  br label %129

129:                                              ; preds = %126, %123
  %130 = phi contract float [ %125, %123 ], [ %128, %126 ]
  %131 = getelementptr inbounds %struct.float4, ptr %2, i32 0, i32 1
  store float %130, ptr %131, align 4
  %132 = getelementptr inbounds %struct.float4, ptr %0, i32 0, i32 2
  %133 = load float, ptr %132, align 8
  %134 = getelementptr inbounds %struct.float4, ptr %0, i32 0, i32 1
  %135 = load float, ptr %134, align 4
  %136 = fcmp contract ogt float %133, %135
  br i1 %136, label %137, label %140

137:                                              ; preds = %129
  %138 = getelementptr inbounds %struct.float4, ptr %0, i32 0, i32 2
  %139 = load float, ptr %138, align 8
  br label %143

140:                                              ; preds = %129
  %141 = getelementptr inbounds %struct.float4, ptr %0, i32 0, i32 1
  %142 = load float, ptr %141, align 4
  br label %143

143:                                              ; preds = %140, %137
  %144 = phi contract float [ %139, %137 ], [ %142, %140 ]
  %145 = getelementptr inbounds %struct.float4, ptr %2, i32 0, i32 2
  store float %144, ptr %145, align 8
  %146 = getelementptr inbounds %struct.float4, ptr %0, i32 0, i32 3
  %147 = load float, ptr %146, align 4
  %148 = getelementptr inbounds %struct.float4, ptr %2, i32 0, i32 3
  store float %147, ptr %148, align 4
  %149 = load %struct.float4, ptr %2, align 16
  ret %struct.float4 %149
}

; Function Attrs: convergent mustprogress noinline nounwind optnone
define dso_local %struct.float4 @_Z9getLowest6float4S_(ptr noundef byval(%struct.float4) align 16 %0, ptr noundef byval(%struct.float4) align 16 %1) #0 {
  %3 = alloca %struct.float4, align 16
  %4 = getelementptr inbounds %struct.float4, ptr %0, i32 0, i32 0
  %5 = load float, ptr %4, align 16
  %6 = getelementptr inbounds %struct.float4, ptr %1, i32 0, i32 3
  %7 = load float, ptr %6, align 4
  %8 = fcmp contract olt float %5, %7
  br i1 %8, label %9, label %12

9:                                                ; preds = %2
  %10 = getelementptr inbounds %struct.float4, ptr %0, i32 0, i32 0
  %11 = load float, ptr %10, align 16
  br label %15

12:                                               ; preds = %2
  %13 = getelementptr inbounds %struct.float4, ptr %1, i32 0, i32 3
  %14 = load float, ptr %13, align 4
  br label %15

15:                                               ; preds = %12, %9
  %16 = phi contract float [ %11, %9 ], [ %14, %12 ]
  %17 = getelementptr inbounds %struct.float4, ptr %0, i32 0, i32 0
  store float %16, ptr %17, align 16
  %18 = getelementptr inbounds %struct.float4, ptr %0, i32 0, i32 1
  %19 = load float, ptr %18, align 4
  %20 = getelementptr inbounds %struct.float4, ptr %1, i32 0, i32 2
  %21 = load float, ptr %20, align 8
  %22 = fcmp contract olt float %19, %21
  br i1 %22, label %23, label %26

23:                                               ; preds = %15
  %24 = getelementptr inbounds %struct.float4, ptr %0, i32 0, i32 1
  %25 = load float, ptr %24, align 4
  br label %29

26:                                               ; preds = %15
  %27 = getelementptr inbounds %struct.float4, ptr %1, i32 0, i32 2
  %28 = load float, ptr %27, align 8
  br label %29

29:                                               ; preds = %26, %23
  %30 = phi contract float [ %25, %23 ], [ %28, %26 ]
  %31 = getelementptr inbounds %struct.float4, ptr %0, i32 0, i32 1
  store float %30, ptr %31, align 4
  %32 = getelementptr inbounds %struct.float4, ptr %0, i32 0, i32 2
  %33 = load float, ptr %32, align 8
  %34 = getelementptr inbounds %struct.float4, ptr %1, i32 0, i32 1
  %35 = load float, ptr %34, align 4
  %36 = fcmp contract olt float %33, %35
  br i1 %36, label %37, label %40

37:                                               ; preds = %29
  %38 = getelementptr inbounds %struct.float4, ptr %0, i32 0, i32 2
  %39 = load float, ptr %38, align 8
  br label %43

40:                                               ; preds = %29
  %41 = getelementptr inbounds %struct.float4, ptr %1, i32 0, i32 1
  %42 = load float, ptr %41, align 4
  br label %43

43:                                               ; preds = %40, %37
  %44 = phi contract float [ %39, %37 ], [ %42, %40 ]
  %45 = getelementptr inbounds %struct.float4, ptr %0, i32 0, i32 2
  store float %44, ptr %45, align 8
  %46 = getelementptr inbounds %struct.float4, ptr %0, i32 0, i32 3
  %47 = load float, ptr %46, align 4
  %48 = getelementptr inbounds %struct.float4, ptr %1, i32 0, i32 0
  %49 = load float, ptr %48, align 16
  %50 = fcmp contract olt float %47, %49
  br i1 %50, label %51, label %54

51:                                               ; preds = %43
  %52 = getelementptr inbounds %struct.float4, ptr %0, i32 0, i32 3
  %53 = load float, ptr %52, align 4
  br label %57

54:                                               ; preds = %43
  %55 = getelementptr inbounds %struct.float4, ptr %1, i32 0, i32 0
  %56 = load float, ptr %55, align 16
  br label %57

57:                                               ; preds = %54, %51
  %58 = phi contract float [ %53, %51 ], [ %56, %54 ]
  %59 = getelementptr inbounds %struct.float4, ptr %0, i32 0, i32 3
  store float %58, ptr %59, align 4
  call void @llvm.memcpy.p0.p0.i64(ptr align 16 %3, ptr align 16 %0, i64 16, i1 false)
  %60 = load %struct.float4, ptr %3, align 16
  ret %struct.float4 %60
}

; Function Attrs: argmemonly nocallback nofree nounwind willreturn
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #1

; Function Attrs: convergent mustprogress noinline nounwind optnone
define dso_local %struct.float4 @_Z10getHighest6float4S_(ptr noundef byval(%struct.float4) align 16 %0, ptr noundef byval(%struct.float4) align 16 %1) #0 {
  %3 = alloca %struct.float4, align 16
  %4 = getelementptr inbounds %struct.float4, ptr %0, i32 0, i32 3
  %5 = load float, ptr %4, align 4
  %6 = getelementptr inbounds %struct.float4, ptr %1, i32 0, i32 0
  %7 = load float, ptr %6, align 16
  %8 = fcmp contract oge float %5, %7
  br i1 %8, label %9, label %12

9:                                                ; preds = %2
  %10 = getelementptr inbounds %struct.float4, ptr %0, i32 0, i32 3
  %11 = load float, ptr %10, align 4
  br label %15

12:                                               ; preds = %2
  %13 = getelementptr inbounds %struct.float4, ptr %1, i32 0, i32 0
  %14 = load float, ptr %13, align 16
  br label %15

15:                                               ; preds = %12, %9
  %16 = phi contract float [ %11, %9 ], [ %14, %12 ]
  %17 = getelementptr inbounds %struct.float4, ptr %1, i32 0, i32 0
  store float %16, ptr %17, align 16
  %18 = getelementptr inbounds %struct.float4, ptr %0, i32 0, i32 2
  %19 = load float, ptr %18, align 8
  %20 = getelementptr inbounds %struct.float4, ptr %1, i32 0, i32 1
  %21 = load float, ptr %20, align 4
  %22 = fcmp contract oge float %19, %21
  br i1 %22, label %23, label %26

23:                                               ; preds = %15
  %24 = getelementptr inbounds %struct.float4, ptr %0, i32 0, i32 2
  %25 = load float, ptr %24, align 8
  br label %29

26:                                               ; preds = %15
  %27 = getelementptr inbounds %struct.float4, ptr %1, i32 0, i32 1
  %28 = load float, ptr %27, align 4
  br label %29

29:                                               ; preds = %26, %23
  %30 = phi contract float [ %25, %23 ], [ %28, %26 ]
  %31 = getelementptr inbounds %struct.float4, ptr %1, i32 0, i32 1
  store float %30, ptr %31, align 4
  %32 = getelementptr inbounds %struct.float4, ptr %0, i32 0, i32 1
  %33 = load float, ptr %32, align 4
  %34 = getelementptr inbounds %struct.float4, ptr %1, i32 0, i32 2
  %35 = load float, ptr %34, align 8
  %36 = fcmp contract oge float %33, %35
  br i1 %36, label %37, label %40

37:                                               ; preds = %29
  %38 = getelementptr inbounds %struct.float4, ptr %0, i32 0, i32 1
  %39 = load float, ptr %38, align 4
  br label %43

40:                                               ; preds = %29
  %41 = getelementptr inbounds %struct.float4, ptr %1, i32 0, i32 2
  %42 = load float, ptr %41, align 8
  br label %43

43:                                               ; preds = %40, %37
  %44 = phi contract float [ %39, %37 ], [ %42, %40 ]
  %45 = getelementptr inbounds %struct.float4, ptr %1, i32 0, i32 2
  store float %44, ptr %45, align 8
  %46 = getelementptr inbounds %struct.float4, ptr %0, i32 0, i32 0
  %47 = load float, ptr %46, align 16
  %48 = getelementptr inbounds %struct.float4, ptr %1, i32 0, i32 3
  %49 = load float, ptr %48, align 4
  %50 = fcmp contract oge float %47, %49
  br i1 %50, label %51, label %54

51:                                               ; preds = %43
  %52 = getelementptr inbounds %struct.float4, ptr %0, i32 0, i32 0
  %53 = load float, ptr %52, align 16
  br label %57

54:                                               ; preds = %43
  %55 = getelementptr inbounds %struct.float4, ptr %1, i32 0, i32 3
  %56 = load float, ptr %55, align 4
  br label %57

57:                                               ; preds = %54, %51
  %58 = phi contract float [ %53, %51 ], [ %56, %54 ]
  %59 = getelementptr inbounds %struct.float4, ptr %1, i32 0, i32 3
  store float %58, ptr %59, align 4
  call void @llvm.memcpy.p0.p0.i64(ptr align 16 %3, ptr align 16 %1, i64 16, i1 false)
  %60 = load %struct.float4, ptr %3, align 16
  ret %struct.float4 %60
}

; Function Attrs: convergent mustprogress noinline norecurse nounwind optnone
define dso_local void @_Z14mergeSortFirstP6float4i(ptr noundef %0, i32 noundef %1) #2 {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca %struct.float4, align 16
  %7 = alloca i64, align 4
  %8 = alloca %struct.float4, align 16
  %9 = alloca %struct.float4, align 16
  store ptr %0, ptr %3, align 8
  store i32 %1, ptr %4, align 4
  %10 = call noundef i32 @_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_xEv() #6
  store i32 %10, ptr %5, align 4
  %11 = load i32, ptr %5, align 4
  %12 = call noundef i32 @_ZN25__cuda_builtin_blockDim_t17__fetch_builtin_xEv() #6
  %13 = mul i32 %11, %12
  %14 = call noundef i32 @_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_xEv() #6
  %15 = add i32 %13, %14
  %16 = load i32, ptr %4, align 4
  %17 = sdiv i32 %16, 4
  %18 = icmp ult i32 %15, %17
  br i1 %18, label %19, label %53

19:                                               ; preds = %2
  %20 = call i64 @llvm.nvvm.texsurf.handle.internal.p1(ptr addrspace(1) @tex)
  store i64 %20, ptr %7, align 4
  %21 = load i32, ptr %5, align 4
  %22 = call noundef i32 @_ZN25__cuda_builtin_blockDim_t17__fetch_builtin_xEv() #6
  %23 = mul i32 %21, %22
  %24 = call noundef i32 @_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_xEv() #6
  %25 = add i32 %23, %24
  %26 = load i64, ptr %7, align 4
  %27 = call %struct.float4 @_ZL10tex1DfetchI6float4EN17__nv_tex_rmet_retIT_E4typeE7textureIS2_Li1EL19cudaTextureReadMode0EEi(i64 %26, i32 noundef %25) #6
  %28 = getelementptr inbounds %struct.float4, ptr %6, i32 0, i32 0
  %29 = extractvalue %struct.float4 %27, 0
  store float %29, ptr %28, align 16
  %30 = getelementptr inbounds %struct.float4, ptr %6, i32 0, i32 1
  %31 = extractvalue %struct.float4 %27, 1
  store float %31, ptr %30, align 4
  %32 = getelementptr inbounds %struct.float4, ptr %6, i32 0, i32 2
  %33 = extractvalue %struct.float4 %27, 2
  store float %33, ptr %32, align 8
  %34 = getelementptr inbounds %struct.float4, ptr %6, i32 0, i32 3
  %35 = extractvalue %struct.float4 %27, 3
  store float %35, ptr %34, align 4
  call void @llvm.memcpy.p0.p0.i64(ptr align 16 %9, ptr align 16 %6, i64 16, i1 false)
  %36 = call %struct.float4 @_Z8sortElem6float4(ptr noundef byval(%struct.float4) align 16 %9) #6
  %37 = getelementptr inbounds %struct.float4, ptr %8, i32 0, i32 0
  %38 = extractvalue %struct.float4 %36, 0
  store float %38, ptr %37, align 16
  %39 = getelementptr inbounds %struct.float4, ptr %8, i32 0, i32 1
  %40 = extractvalue %struct.float4 %36, 1
  store float %40, ptr %39, align 4
  %41 = getelementptr inbounds %struct.float4, ptr %8, i32 0, i32 2
  %42 = extractvalue %struct.float4 %36, 2
  store float %42, ptr %41, align 8
  %43 = getelementptr inbounds %struct.float4, ptr %8, i32 0, i32 3
  %44 = extractvalue %struct.float4 %36, 3
  store float %44, ptr %43, align 4
  %45 = load ptr, ptr %3, align 8
  %46 = load i32, ptr %5, align 4
  %47 = call noundef i32 @_ZN25__cuda_builtin_blockDim_t17__fetch_builtin_xEv() #6
  %48 = mul i32 %46, %47
  %49 = call noundef i32 @_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_xEv() #6
  %50 = add i32 %48, %49
  %51 = zext i32 %50 to i64
  %52 = getelementptr inbounds %struct.float4, ptr %45, i64 %51
  call void @llvm.memcpy.p0.p0.i64(ptr align 16 %52, ptr align 16 %8, i64 16, i1 false)
  br label %53

53:                                               ; preds = %19, %2
  ret void
}

; Function Attrs: alwaysinline convergent mustprogress nounwind
define linkonce_odr dso_local noundef i32 @_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_xEv() #3 comdat align 2 {
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x()
  ret i32 %1
}

; Function Attrs: alwaysinline convergent mustprogress nounwind
define linkonce_odr dso_local noundef i32 @_ZN25__cuda_builtin_blockDim_t17__fetch_builtin_xEv() #3 comdat align 2 {
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.ntid.x()
  ret i32 %1
}

; Function Attrs: alwaysinline convergent mustprogress nounwind
define linkonce_odr dso_local noundef i32 @_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_xEv() #3 comdat align 2 {
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x()
  ret i32 %1
}

; Function Attrs: alwaysinline convergent mustprogress nounwind
define internal %struct.float4 @_ZL10tex1DfetchI6float4EN17__nv_tex_rmet_retIT_E4typeE7textureIS2_Li1EL19cudaTextureReadMode0EEi(i64 %0, i32 noundef %1) #3 {
  %3 = alloca %struct.float4, align 16
  %4 = alloca i64, align 4
  %5 = alloca i32, align 4
  %6 = alloca i64, align 4
  store i64 %0, ptr %4, align 4
  store i32 %1, ptr %5, align 4
  %7 = load i64, ptr %4, align 4
  store i64 %7, ptr %6, align 4
  %8 = load i32, ptr %5, align 4
  %9 = load i64, ptr %6, align 4
  call void @_ZN12_GLOBAL__N_110__cuda_tex11__tex_fetchINS0_5__TagILi95EEE6float47textureIS4_Li1EL19cudaTextureReadMode0EEJiEEEvPT0_T1_DpT2_(ptr noundef %3, i64 %9, i32 noundef %8) #6
  %10 = load %struct.float4, ptr %3, align 16
  ret %struct.float4 %10
}

; Function Attrs: nounwind readnone
declare i64 @llvm.nvvm.texsurf.handle.internal.p1(ptr addrspace(1)) #4

; Function Attrs: convergent mustprogress noinline norecurse nounwind optnone
define dso_local void @_Z13mergeSortPassP6float4ii(ptr noundef %0, i32 noundef %1, i32 noundef %2) #2 {
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca ptr, align 8
  %13 = alloca i32, align 4
  %14 = alloca %struct.float4, align 16
  %15 = alloca i64, align 4
  %16 = alloca i32, align 4
  %17 = alloca i32, align 4
  %18 = alloca i32, align 4
  %19 = alloca %struct.float4, align 16
  %20 = alloca %struct.float4, align 16
  %21 = alloca %struct.float4, align 16
  %22 = alloca i64, align 4
  %23 = alloca %struct.float4, align 16
  %24 = alloca i64, align 4
  %25 = alloca %struct.float4, align 16
  %26 = alloca i64, align 4
  %27 = alloca %struct.float4, align 16
  %28 = alloca i64, align 4
  %29 = alloca %struct.float4, align 16
  %30 = alloca %struct.float4, align 16
  %31 = alloca %struct.float4, align 16
  %32 = alloca %struct.float4, align 16
  %33 = alloca %struct.float4, align 16
  %34 = alloca %struct.float4, align 16
  %35 = alloca %struct.float4, align 16
  %36 = alloca %struct.float4, align 16
  %37 = alloca %struct.float4, align 16
  %38 = alloca %struct.float4, align 16
  %39 = alloca i8, align 1
  %40 = alloca i8, align 1
  store ptr %0, ptr %4, align 8
  store i32 %1, ptr %5, align 4
  store i32 %2, ptr %6, align 4
  %41 = call noundef i32 @_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_xEv() #6
  %42 = call noundef i32 @_ZN25__cuda_builtin_blockDim_t17__fetch_builtin_xEv() #6
  %43 = mul i32 %41, %42
  %44 = call noundef i32 @_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_xEv() #6
  %45 = add i32 %43, %44
  store i32 %45, ptr %7, align 4
  %46 = load i32, ptr %7, align 4
  %47 = load i32, ptr %6, align 4
  %48 = sdiv i32 %46, %47
  store i32 %48, ptr %8, align 4
  %49 = load i32, ptr %8, align 4
  %50 = icmp sge i32 %49, 1024
  br i1 %50, label %51, label %52

51:                                               ; preds = %3
  br label %287

52:                                               ; preds = %3
  %53 = load i32, ptr %7, align 4
  %54 = load i32, ptr %8, align 4
  %55 = load i32, ptr %6, align 4
  %56 = mul nsw i32 %54, %55
  %57 = sub nsw i32 %53, %56
  store i32 %57, ptr %9, align 4
  %58 = load i32, ptr %8, align 4
  %59 = sext i32 %58 to i64
  %60 = getelementptr inbounds [1025 x i32], ptr addrspacecast (ptr addrspace(4) @constStartAddr to ptr), i64 0, i64 %59
  %61 = load i32, ptr %60, align 4
  %62 = load i32, ptr %9, align 4
  %63 = load i32, ptr %5, align 4
  %64 = mul nsw i32 %62, %63
  %65 = add nsw i32 %61, %64
  store i32 %65, ptr %10, align 4
  %66 = load i32, ptr %10, align 4
  %67 = load i32, ptr %5, align 4
  %68 = sdiv i32 %67, 2
  %69 = add nsw i32 %66, %68
  store i32 %69, ptr %11, align 4
  %70 = load ptr, ptr %4, align 8
  %71 = load i32, ptr %10, align 4
  %72 = sext i32 %71 to i64
  %73 = getelementptr inbounds %struct.float4, ptr %70, i64 %72
  store ptr %73, ptr %12, align 8
  %74 = load i32, ptr %10, align 4
  %75 = load i32, ptr %8, align 4
  %76 = add nsw i32 %75, 1
  %77 = sext i32 %76 to i64
  %78 = getelementptr inbounds [1025 x i32], ptr addrspacecast (ptr addrspace(4) @constStartAddr to ptr), i64 0, i64 %77
  %79 = load i32, ptr %78, align 4
  %80 = icmp sge i32 %74, %79
  br i1 %80, label %81, label %82

81:                                               ; preds = %52
  br label %287

82:                                               ; preds = %52
  %83 = load i32, ptr %11, align 4
  %84 = load i32, ptr %8, align 4
  %85 = add nsw i32 %84, 1
  %86 = sext i32 %85 to i64
  %87 = getelementptr inbounds [1025 x i32], ptr addrspacecast (ptr addrspace(4) @constStartAddr to ptr), i64 0, i64 %86
  %88 = load i32, ptr %87, align 4
  %89 = icmp sge i32 %83, %88
  br i1 %89, label %90, label %124

90:                                               ; preds = %82
  store i32 0, ptr %13, align 4
  br label %91

91:                                               ; preds = %120, %90
  %92 = load i32, ptr %13, align 4
  %93 = load i32, ptr %8, align 4
  %94 = add nsw i32 %93, 1
  %95 = sext i32 %94 to i64
  %96 = getelementptr inbounds [1025 x i32], ptr addrspacecast (ptr addrspace(4) @constStartAddr to ptr), i64 0, i64 %95
  %97 = load i32, ptr %96, align 4
  %98 = load i32, ptr %10, align 4
  %99 = sub nsw i32 %97, %98
  %100 = icmp slt i32 %92, %99
  br i1 %100, label %101, label %123

101:                                              ; preds = %91
  %102 = call i64 @llvm.nvvm.texsurf.handle.internal.p1(ptr addrspace(1) @tex)
  store i64 %102, ptr %15, align 4
  %103 = load i32, ptr %10, align 4
  %104 = load i32, ptr %13, align 4
  %105 = add nsw i32 %103, %104
  %106 = load i64, ptr %15, align 4
  %107 = call %struct.float4 @_ZL10tex1DfetchI6float4EN17__nv_tex_rmet_retIT_E4typeE7textureIS2_Li1EL19cudaTextureReadMode0EEi(i64 %106, i32 noundef %105) #6
  %108 = getelementptr inbounds %struct.float4, ptr %14, i32 0, i32 0
  %109 = extractvalue %struct.float4 %107, 0
  store float %109, ptr %108, align 16
  %110 = getelementptr inbounds %struct.float4, ptr %14, i32 0, i32 1
  %111 = extractvalue %struct.float4 %107, 1
  store float %111, ptr %110, align 4
  %112 = getelementptr inbounds %struct.float4, ptr %14, i32 0, i32 2
  %113 = extractvalue %struct.float4 %107, 2
  store float %113, ptr %112, align 8
  %114 = getelementptr inbounds %struct.float4, ptr %14, i32 0, i32 3
  %115 = extractvalue %struct.float4 %107, 3
  store float %115, ptr %114, align 4
  %116 = load ptr, ptr %12, align 8
  %117 = load i32, ptr %13, align 4
  %118 = sext i32 %117 to i64
  %119 = getelementptr inbounds %struct.float4, ptr %116, i64 %118
  call void @llvm.memcpy.p0.p0.i64(ptr align 16 %119, ptr align 16 %14, i64 16, i1 false)
  br label %120

120:                                              ; preds = %101
  %121 = load i32, ptr %13, align 4
  %122 = add nsw i32 %121, 1
  store i32 %122, ptr %13, align 4
  br label %91, !llvm.loop !11

123:                                              ; preds = %91
  br label %287

124:                                              ; preds = %82
  store i32 0, ptr %16, align 4
  store i32 0, ptr %17, align 4
  store i32 0, ptr %18, align 4
  %125 = call i64 @llvm.nvvm.texsurf.handle.internal.p1(ptr addrspace(1) @tex)
  store i64 %125, ptr %22, align 4
  %126 = load i32, ptr %10, align 4
  %127 = load i32, ptr %16, align 4
  %128 = add nsw i32 %126, %127
  %129 = load i64, ptr %22, align 4
  %130 = call %struct.float4 @_ZL10tex1DfetchI6float4EN17__nv_tex_rmet_retIT_E4typeE7textureIS2_Li1EL19cudaTextureReadMode0EEi(i64 %129, i32 noundef %128) #6
  %131 = getelementptr inbounds %struct.float4, ptr %21, i32 0, i32 0
  %132 = extractvalue %struct.float4 %130, 0
  store float %132, ptr %131, align 16
  %133 = getelementptr inbounds %struct.float4, ptr %21, i32 0, i32 1
  %134 = extractvalue %struct.float4 %130, 1
  store float %134, ptr %133, align 4
  %135 = getelementptr inbounds %struct.float4, ptr %21, i32 0, i32 2
  %136 = extractvalue %struct.float4 %130, 2
  store float %136, ptr %135, align 8
  %137 = getelementptr inbounds %struct.float4, ptr %21, i32 0, i32 3
  %138 = extractvalue %struct.float4 %130, 3
  store float %138, ptr %137, align 4
  call void @llvm.memcpy.p0.p0.i64(ptr align 16 %19, ptr align 16 %21, i64 16, i1 false)
  %139 = call i64 @llvm.nvvm.texsurf.handle.internal.p1(ptr addrspace(1) @tex)
  store i64 %139, ptr %24, align 4
  %140 = load i32, ptr %11, align 4
  %141 = load i32, ptr %17, align 4
  %142 = add nsw i32 %140, %141
  %143 = load i64, ptr %24, align 4
  %144 = call %struct.float4 @_ZL10tex1DfetchI6float4EN17__nv_tex_rmet_retIT_E4typeE7textureIS2_Li1EL19cudaTextureReadMode0EEi(i64 %143, i32 noundef %142) #6
  %145 = getelementptr inbounds %struct.float4, ptr %23, i32 0, i32 0
  %146 = extractvalue %struct.float4 %144, 0
  store float %146, ptr %145, align 16
  %147 = getelementptr inbounds %struct.float4, ptr %23, i32 0, i32 1
  %148 = extractvalue %struct.float4 %144, 1
  store float %148, ptr %147, align 4
  %149 = getelementptr inbounds %struct.float4, ptr %23, i32 0, i32 2
  %150 = extractvalue %struct.float4 %144, 2
  store float %150, ptr %149, align 8
  %151 = getelementptr inbounds %struct.float4, ptr %23, i32 0, i32 3
  %152 = extractvalue %struct.float4 %144, 3
  store float %152, ptr %151, align 4
  call void @llvm.memcpy.p0.p0.i64(ptr align 16 %20, ptr align 16 %23, i64 16, i1 false)
  br label %153

153:                                              ; preds = %124, %280
  %154 = call i64 @llvm.nvvm.texsurf.handle.internal.p1(ptr addrspace(1) @tex)
  store i64 %154, ptr %26, align 4
  %155 = load i32, ptr %10, align 4
  %156 = load i32, ptr %16, align 4
  %157 = add nsw i32 %155, %156
  %158 = add nsw i32 %157, 1
  %159 = load i64, ptr %26, align 4
  %160 = call %struct.float4 @_ZL10tex1DfetchI6float4EN17__nv_tex_rmet_retIT_E4typeE7textureIS2_Li1EL19cudaTextureReadMode0EEi(i64 %159, i32 noundef %158) #6
  %161 = getelementptr inbounds %struct.float4, ptr %25, i32 0, i32 0
  %162 = extractvalue %struct.float4 %160, 0
  store float %162, ptr %161, align 16
  %163 = getelementptr inbounds %struct.float4, ptr %25, i32 0, i32 1
  %164 = extractvalue %struct.float4 %160, 1
  store float %164, ptr %163, align 4
  %165 = getelementptr inbounds %struct.float4, ptr %25, i32 0, i32 2
  %166 = extractvalue %struct.float4 %160, 2
  store float %166, ptr %165, align 8
  %167 = getelementptr inbounds %struct.float4, ptr %25, i32 0, i32 3
  %168 = extractvalue %struct.float4 %160, 3
  store float %168, ptr %167, align 4
  %169 = call i64 @llvm.nvvm.texsurf.handle.internal.p1(ptr addrspace(1) @tex)
  store i64 %169, ptr %28, align 4
  %170 = load i32, ptr %11, align 4
  %171 = load i32, ptr %17, align 4
  %172 = add nsw i32 %170, %171
  %173 = add nsw i32 %172, 1
  %174 = load i64, ptr %28, align 4
  %175 = call %struct.float4 @_ZL10tex1DfetchI6float4EN17__nv_tex_rmet_retIT_E4typeE7textureIS2_Li1EL19cudaTextureReadMode0EEi(i64 %174, i32 noundef %173) #6
  %176 = getelementptr inbounds %struct.float4, ptr %27, i32 0, i32 0
  %177 = extractvalue %struct.float4 %175, 0
  store float %177, ptr %176, align 16
  %178 = getelementptr inbounds %struct.float4, ptr %27, i32 0, i32 1
  %179 = extractvalue %struct.float4 %175, 1
  store float %179, ptr %178, align 4
  %180 = getelementptr inbounds %struct.float4, ptr %27, i32 0, i32 2
  %181 = extractvalue %struct.float4 %175, 2
  store float %181, ptr %180, align 8
  %182 = getelementptr inbounds %struct.float4, ptr %27, i32 0, i32 3
  %183 = extractvalue %struct.float4 %175, 3
  store float %183, ptr %182, align 4
  call void @llvm.memcpy.p0.p0.i64(ptr align 16 %30, ptr align 16 %19, i64 16, i1 false)
  call void @llvm.memcpy.p0.p0.i64(ptr align 16 %31, ptr align 16 %20, i64 16, i1 false)
  %184 = call %struct.float4 @_Z9getLowest6float4S_(ptr noundef byval(%struct.float4) align 16 %30, ptr noundef byval(%struct.float4) align 16 %31) #6
  %185 = getelementptr inbounds %struct.float4, ptr %29, i32 0, i32 0
  %186 = extractvalue %struct.float4 %184, 0
  store float %186, ptr %185, align 16
  %187 = getelementptr inbounds %struct.float4, ptr %29, i32 0, i32 1
  %188 = extractvalue %struct.float4 %184, 1
  store float %188, ptr %187, align 4
  %189 = getelementptr inbounds %struct.float4, ptr %29, i32 0, i32 2
  %190 = extractvalue %struct.float4 %184, 2
  store float %190, ptr %189, align 8
  %191 = getelementptr inbounds %struct.float4, ptr %29, i32 0, i32 3
  %192 = extractvalue %struct.float4 %184, 3
  store float %192, ptr %191, align 4
  call void @llvm.memcpy.p0.p0.i64(ptr align 16 %33, ptr align 16 %19, i64 16, i1 false)
  call void @llvm.memcpy.p0.p0.i64(ptr align 16 %34, ptr align 16 %20, i64 16, i1 false)
  %193 = call %struct.float4 @_Z10getHighest6float4S_(ptr noundef byval(%struct.float4) align 16 %33, ptr noundef byval(%struct.float4) align 16 %34) #6
  %194 = getelementptr inbounds %struct.float4, ptr %32, i32 0, i32 0
  %195 = extractvalue %struct.float4 %193, 0
  store float %195, ptr %194, align 16
  %196 = getelementptr inbounds %struct.float4, ptr %32, i32 0, i32 1
  %197 = extractvalue %struct.float4 %193, 1
  store float %197, ptr %196, align 4
  %198 = getelementptr inbounds %struct.float4, ptr %32, i32 0, i32 2
  %199 = extractvalue %struct.float4 %193, 2
  store float %199, ptr %198, align 8
  %200 = getelementptr inbounds %struct.float4, ptr %32, i32 0, i32 3
  %201 = extractvalue %struct.float4 %193, 3
  store float %201, ptr %200, align 4
  call void @llvm.memcpy.p0.p0.i64(ptr align 16 %36, ptr align 16 %29, i64 16, i1 false)
  %202 = call %struct.float4 @_Z8sortElem6float4(ptr noundef byval(%struct.float4) align 16 %36) #6
  %203 = getelementptr inbounds %struct.float4, ptr %35, i32 0, i32 0
  %204 = extractvalue %struct.float4 %202, 0
  store float %204, ptr %203, align 16
  %205 = getelementptr inbounds %struct.float4, ptr %35, i32 0, i32 1
  %206 = extractvalue %struct.float4 %202, 1
  store float %206, ptr %205, align 4
  %207 = getelementptr inbounds %struct.float4, ptr %35, i32 0, i32 2
  %208 = extractvalue %struct.float4 %202, 2
  store float %208, ptr %207, align 8
  %209 = getelementptr inbounds %struct.float4, ptr %35, i32 0, i32 3
  %210 = extractvalue %struct.float4 %202, 3
  store float %210, ptr %209, align 4
  call void @llvm.memcpy.p0.p0.i64(ptr align 16 %19, ptr align 16 %35, i64 16, i1 false)
  call void @llvm.memcpy.p0.p0.i64(ptr align 16 %38, ptr align 16 %32, i64 16, i1 false)
  %211 = call %struct.float4 @_Z8sortElem6float4(ptr noundef byval(%struct.float4) align 16 %38) #6
  %212 = getelementptr inbounds %struct.float4, ptr %37, i32 0, i32 0
  %213 = extractvalue %struct.float4 %211, 0
  store float %213, ptr %212, align 16
  %214 = getelementptr inbounds %struct.float4, ptr %37, i32 0, i32 1
  %215 = extractvalue %struct.float4 %211, 1
  store float %215, ptr %214, align 4
  %216 = getelementptr inbounds %struct.float4, ptr %37, i32 0, i32 2
  %217 = extractvalue %struct.float4 %211, 2
  store float %217, ptr %216, align 8
  %218 = getelementptr inbounds %struct.float4, ptr %37, i32 0, i32 3
  %219 = extractvalue %struct.float4 %211, 3
  store float %219, ptr %218, align 4
  call void @llvm.memcpy.p0.p0.i64(ptr align 16 %20, ptr align 16 %37, i64 16, i1 false)
  %220 = load ptr, ptr %12, align 8
  %221 = load i32, ptr %18, align 4
  %222 = add nsw i32 %221, 1
  store i32 %222, ptr %18, align 4
  %223 = sext i32 %221 to i64
  %224 = getelementptr inbounds %struct.float4, ptr %220, i64 %223
  call void @llvm.memcpy.p0.p0.i64(ptr align 16 %224, ptr align 16 %19, i64 16, i1 false)
  %225 = load i32, ptr %16, align 4
  %226 = add nsw i32 %225, 1
  %227 = load i32, ptr %5, align 4
  %228 = sdiv i32 %227, 2
  %229 = icmp slt i32 %226, %228
  %230 = zext i1 %229 to i8
  store i8 %230, ptr %39, align 1
  %231 = load i32, ptr %17, align 4
  %232 = add nsw i32 %231, 1
  %233 = load i32, ptr %5, align 4
  %234 = sdiv i32 %233, 2
  %235 = icmp slt i32 %232, %234
  br i1 %235, label %236, label %247

236:                                              ; preds = %153
  %237 = load i32, ptr %11, align 4
  %238 = load i32, ptr %17, align 4
  %239 = add nsw i32 %237, %238
  %240 = add nsw i32 %239, 1
  %241 = load i32, ptr %8, align 4
  %242 = add nsw i32 %241, 1
  %243 = sext i32 %242 to i64
  %244 = getelementptr inbounds [1025 x i32], ptr addrspacecast (ptr addrspace(4) @constStartAddr to ptr), i64 0, i64 %243
  %245 = load i32, ptr %244, align 4
  %246 = icmp slt i32 %240, %245
  br label %247

247:                                              ; preds = %236, %153
  %248 = phi i1 [ false, %153 ], [ %246, %236 ]
  %249 = zext i1 %248 to i8
  store i8 %249, ptr %40, align 1
  %250 = load i8, ptr %39, align 1
  %251 = trunc i8 %250 to i1
  br i1 %251, label %252, label %272

252:                                              ; preds = %247
  %253 = load i8, ptr %40, align 1
  %254 = trunc i8 %253 to i1
  br i1 %254, label %255, label %268

255:                                              ; preds = %252
  %256 = getelementptr inbounds %struct.float4, ptr %25, i32 0, i32 0
  %257 = load float, ptr %256, align 16
  %258 = getelementptr inbounds %struct.float4, ptr %27, i32 0, i32 0
  %259 = load float, ptr %258, align 16
  %260 = fcmp contract olt float %257, %259
  br i1 %260, label %261, label %264

261:                                              ; preds = %255
  %262 = load i32, ptr %16, align 4
  %263 = add nsw i32 %262, 1
  store i32 %263, ptr %16, align 4
  call void @llvm.memcpy.p0.p0.i64(ptr align 16 %19, ptr align 16 %25, i64 16, i1 false)
  br label %267

264:                                              ; preds = %255
  %265 = load i32, ptr %17, align 4
  %266 = add nsw i32 %265, 1
  store i32 %266, ptr %17, align 4
  call void @llvm.memcpy.p0.p0.i64(ptr align 16 %19, ptr align 16 %27, i64 16, i1 false)
  br label %267

267:                                              ; preds = %264, %261
  br label %271

268:                                              ; preds = %252
  %269 = load i32, ptr %16, align 4
  %270 = add nsw i32 %269, 1
  store i32 %270, ptr %16, align 4
  call void @llvm.memcpy.p0.p0.i64(ptr align 16 %19, ptr align 16 %25, i64 16, i1 false)
  br label %271

271:                                              ; preds = %268, %267
  br label %280

272:                                              ; preds = %247
  %273 = load i8, ptr %40, align 1
  %274 = trunc i8 %273 to i1
  br i1 %274, label %275, label %278

275:                                              ; preds = %272
  %276 = load i32, ptr %17, align 4
  %277 = add nsw i32 %276, 1
  store i32 %277, ptr %17, align 4
  call void @llvm.memcpy.p0.p0.i64(ptr align 16 %19, ptr align 16 %27, i64 16, i1 false)
  br label %279

278:                                              ; preds = %272
  br label %281

279:                                              ; preds = %275
  br label %280

280:                                              ; preds = %279, %271
  br label %153, !llvm.loop !13

281:                                              ; preds = %278
  %282 = load ptr, ptr %12, align 8
  %283 = load i32, ptr %18, align 4
  %284 = add nsw i32 %283, 1
  store i32 %284, ptr %18, align 4
  %285 = sext i32 %283 to i64
  %286 = getelementptr inbounds %struct.float4, ptr %282, i64 %285
  call void @llvm.memcpy.p0.p0.i64(ptr align 16 %286, ptr align 16 %20, i64 16, i1 false)
  br label %287

287:                                              ; preds = %281, %123, %81, %51
  ret void
}

; Function Attrs: convergent mustprogress noinline norecurse nounwind optnone
define dso_local void @_Z9mergepackPfS_(ptr noundef %0, ptr noundef %1) #2 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %7 = call noundef i32 @_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_xEv() #6
  %8 = call noundef i32 @_ZN25__cuda_builtin_blockDim_t17__fetch_builtin_xEv() #6
  %9 = mul i32 %7, %8
  %10 = call noundef i32 @_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_xEv() #6
  %11 = add i32 %9, %10
  store i32 %11, ptr %5, align 4
  %12 = call noundef i32 @_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_yEv() #6
  store i32 %12, ptr %6, align 4
  %13 = load i32, ptr %6, align 4
  %14 = sext i32 %13 to i64
  %15 = getelementptr inbounds [1025 x i32], ptr addrspacecast (ptr addrspace(4) @finalStartAddr to ptr), i64 0, i64 %14
  %16 = load i32, ptr %15, align 4
  %17 = load i32, ptr %5, align 4
  %18 = add nsw i32 %16, %17
  %19 = load i32, ptr %6, align 4
  %20 = add nsw i32 %19, 1
  %21 = sext i32 %20 to i64
  %22 = getelementptr inbounds [1025 x i32], ptr addrspacecast (ptr addrspace(4) @finalStartAddr to ptr), i64 0, i64 %21
  %23 = load i32, ptr %22, align 4
  %24 = icmp sge i32 %18, %23
  br i1 %24, label %25, label %26

25:                                               ; preds = %2
  br label %52

26:                                               ; preds = %2
  %27 = load ptr, ptr %3, align 8
  %28 = load i32, ptr %6, align 4
  %29 = sext i32 %28 to i64
  %30 = getelementptr inbounds [1025 x i32], ptr addrspacecast (ptr addrspace(4) @constStartAddr to ptr), i64 0, i64 %29
  %31 = load i32, ptr %30, align 4
  %32 = mul nsw i32 %31, 4
  %33 = load i32, ptr %6, align 4
  %34 = sext i32 %33 to i64
  %35 = getelementptr inbounds [1024 x i32], ptr addrspacecast (ptr addrspace(4) @nullElems to ptr), i64 0, i64 %34
  %36 = load i32, ptr %35, align 4
  %37 = add nsw i32 %32, %36
  %38 = load i32, ptr %5, align 4
  %39 = add nsw i32 %37, %38
  %40 = sext i32 %39 to i64
  %41 = getelementptr inbounds float, ptr %27, i64 %40
  %42 = load float, ptr %41, align 4
  %43 = load ptr, ptr %4, align 8
  %44 = load i32, ptr %6, align 4
  %45 = sext i32 %44 to i64
  %46 = getelementptr inbounds [1025 x i32], ptr addrspacecast (ptr addrspace(4) @finalStartAddr to ptr), i64 0, i64 %45
  %47 = load i32, ptr %46, align 4
  %48 = load i32, ptr %5, align 4
  %49 = add nsw i32 %47, %48
  %50 = sext i32 %49 to i64
  %51 = getelementptr inbounds float, ptr %43, i64 %50
  store float %42, ptr %51, align 4
  br label %52

52:                                               ; preds = %26, %25
  ret void
}

; Function Attrs: alwaysinline convergent mustprogress nounwind
define linkonce_odr dso_local noundef i32 @_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_yEv() #3 comdat align 2 {
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.y()
  ret i32 %1
}

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #5

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.nvvm.read.ptx.sreg.ntid.x() #5

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.nvvm.read.ptx.sreg.tid.x() #5

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.nvvm.read.ptx.sreg.ctaid.y() #5

; Function Attrs: convergent mustprogress noinline nounwind optnone
define internal void @_ZN12_GLOBAL__N_110__cuda_tex11__tex_fetchINS0_5__TagILi95EEE6float47textureIS4_Li1EL19cudaTextureReadMode0EEJiEEEvPT0_T1_DpT2_(ptr noundef %0, i64 %1, i32 noundef %2) #0 {
  %4 = alloca ptr, align 8
  %5 = alloca i64, align 4
  %6 = alloca i32, align 4
  %7 = alloca %struct.float4, align 16
  %8 = alloca %struct.float4, align 16
  %9 = alloca i64, align 4
  store ptr %0, ptr %4, align 8
  store i64 %1, ptr %5, align 4
  store i32 %2, ptr %6, align 4
  %10 = load i64, ptr %5, align 4
  store i64 %10, ptr %9, align 4
  %11 = load i64, ptr %9, align 4
  %12 = call noundef i64 @_ZN12_GLOBAL__N_110__cuda_tex19__tex_handle_to_objI7textureI6float4Li1EL19cudaTextureReadMode0EEEEyT_(i64 %11) #6
  %13 = load i32, ptr %6, align 4
  %14 = call %struct.float4 @_ZN12_GLOBAL__N_110__cuda_tex14__tex_fetch_v4INS0_5__TagILi95EEEE5__runI6float4EET_yi(i64 noundef %12, i32 noundef %13) #6
  %15 = getelementptr inbounds %struct.float4, ptr %8, i32 0, i32 0
  %16 = extractvalue %struct.float4 %14, 0
  store float %16, ptr %15, align 16
  %17 = getelementptr inbounds %struct.float4, ptr %8, i32 0, i32 1
  %18 = extractvalue %struct.float4 %14, 1
  store float %18, ptr %17, align 4
  %19 = getelementptr inbounds %struct.float4, ptr %8, i32 0, i32 2
  %20 = extractvalue %struct.float4 %14, 2
  store float %20, ptr %19, align 8
  %21 = getelementptr inbounds %struct.float4, ptr %8, i32 0, i32 3
  %22 = extractvalue %struct.float4 %14, 3
  store float %22, ptr %21, align 4
  %23 = call %struct.float4 @_ZN12_GLOBAL__N_110__cuda_tex9__convertI6float4S2_E5__runILi4EEES2_S2_(ptr noundef byval(%struct.float4) align 16 %8) #6
  %24 = getelementptr inbounds %struct.float4, ptr %7, i32 0, i32 0
  %25 = extractvalue %struct.float4 %23, 0
  store float %25, ptr %24, align 16
  %26 = getelementptr inbounds %struct.float4, ptr %7, i32 0, i32 1
  %27 = extractvalue %struct.float4 %23, 1
  store float %27, ptr %26, align 4
  %28 = getelementptr inbounds %struct.float4, ptr %7, i32 0, i32 2
  %29 = extractvalue %struct.float4 %23, 2
  store float %29, ptr %28, align 8
  %30 = getelementptr inbounds %struct.float4, ptr %7, i32 0, i32 3
  %31 = extractvalue %struct.float4 %23, 3
  store float %31, ptr %30, align 4
  %32 = load ptr, ptr %4, align 8
  call void @llvm.memcpy.p0.p0.i64(ptr align 16 %32, ptr align 16 %7, i64 16, i1 false)
  ret void
}

; Function Attrs: convergent mustprogress noinline nounwind optnone
define internal %struct.float4 @_ZN12_GLOBAL__N_110__cuda_tex9__convertI6float4S2_E5__runILi4EEES2_S2_(ptr noundef byval(%struct.float4) align 16 %0) #0 align 2 {
  %2 = alloca %struct.float4, align 16
  %3 = getelementptr inbounds %struct.float4, ptr %2, i32 0, i32 0
  %4 = getelementptr inbounds %struct.float4, ptr %0, i32 0, i32 0
  %5 = load float, ptr %4, align 16
  store float %5, ptr %3, align 16
  %6 = getelementptr inbounds %struct.float4, ptr %2, i32 0, i32 1
  %7 = getelementptr inbounds %struct.float4, ptr %0, i32 0, i32 1
  %8 = load float, ptr %7, align 4
  store float %8, ptr %6, align 4
  %9 = getelementptr inbounds %struct.float4, ptr %2, i32 0, i32 2
  %10 = getelementptr inbounds %struct.float4, ptr %0, i32 0, i32 2
  %11 = load float, ptr %10, align 8
  store float %11, ptr %9, align 8
  %12 = getelementptr inbounds %struct.float4, ptr %2, i32 0, i32 3
  %13 = getelementptr inbounds %struct.float4, ptr %0, i32 0, i32 3
  %14 = load float, ptr %13, align 4
  store float %14, ptr %12, align 4
  %15 = load %struct.float4, ptr %2, align 16
  ret %struct.float4 %15
}

; Function Attrs: convergent mustprogress noinline nounwind optnone
define internal %struct.float4 @_ZN12_GLOBAL__N_110__cuda_tex14__tex_fetch_v4INS0_5__TagILi95EEEE5__runI6float4EET_yi(i64 noundef %0, i32 noundef %1) #0 align 2 {
  %3 = alloca %struct.float4, align 16
  %4 = alloca i64, align 8
  %5 = alloca i32, align 4
  store i64 %0, ptr %4, align 8
  store i32 %1, ptr %5, align 4
  %6 = getelementptr inbounds %struct.float4, ptr %3, i32 0, i32 0
  %7 = getelementptr inbounds %struct.float4, ptr %3, i32 0, i32 1
  %8 = getelementptr inbounds %struct.float4, ptr %3, i32 0, i32 2
  %9 = getelementptr inbounds %struct.float4, ptr %3, i32 0, i32 3
  %10 = load i64, ptr %4, align 8
  %11 = load i32, ptr %5, align 4
  %12 = call { float, float, float, float } asm "tex.1d.v4.f32.s32\09{$0, $1, $2, $3}, [$4, {$5}];", "=f,=f,=f,=f,l,r"(i64 %10, i32 %11) #7, !srcloc !14
  %13 = extractvalue { float, float, float, float } %12, 0
  %14 = extractvalue { float, float, float, float } %12, 1
  %15 = extractvalue { float, float, float, float } %12, 2
  %16 = extractvalue { float, float, float, float } %12, 3
  store float %13, ptr %6, align 16
  store float %14, ptr %7, align 4
  store float %15, ptr %8, align 8
  store float %16, ptr %9, align 4
  %17 = load %struct.float4, ptr %3, align 16
  ret %struct.float4 %17
}

; Function Attrs: convergent mustprogress noinline nounwind optnone
define internal noundef i64 @_ZN12_GLOBAL__N_110__cuda_tex19__tex_handle_to_objI7textureI6float4Li1EL19cudaTextureReadMode0EEEEyT_(i64 %0) #0 {
  %2 = alloca i64, align 4
  %3 = alloca i64, align 8
  store i64 %0, ptr %2, align 4
  %4 = load i64, ptr %2, align 4
  %5 = call i64 asm "mov.b64 $0, $1; ", "=l,l"(i64 %4) #7, !srcloc !15
  store i64 %5, ptr %3, align 8
  %6 = load i64, ptr %3, align 8
  ret i64 %6
}

attributes #0 = { convergent mustprogress noinline nounwind optnone "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="sm_35" "target-features"="+ptx75,+sm_35" }
attributes #1 = { argmemonly nocallback nofree nounwind willreturn }
attributes #2 = { convergent mustprogress noinline norecurse nounwind optnone "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="sm_35" "target-features"="+ptx75,+sm_35" }
attributes #3 = { alwaysinline convergent mustprogress nounwind "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="sm_35" "target-features"="+ptx75,+sm_35" }
attributes #4 = { nounwind readnone }
attributes #5 = { nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #6 = { convergent nounwind }
attributes #7 = { convergent nounwind readnone }

!llvm.module.flags = !{!0, !1, !2, !3}
!nvvm.annotations = !{!4, !5, !6, !7, !8}
!llvm.ident = !{!9, !10}

!0 = !{i32 2, !"SDK Version", [2 x i32] [i32 11, i32 5]}
!1 = !{i32 1, !"wchar_size", i32 4}
!2 = !{i32 4, !"nvvm-reflect-ftz", i32 0}
!3 = !{i32 7, !"frame-pointer", i32 2}
!4 = !{ptr addrspace(1) @tex, !"texture", i32 1}
!5 = !{ptr addrspace(1) @txt, !"texture", i32 1}
!6 = !{ptr @_Z14mergeSortFirstP6float4i, !"kernel", i32 1}
!7 = !{ptr @_Z13mergeSortPassP6float4ii, !"kernel", i32 1}
!8 = !{ptr @_Z9mergepackPfS_, !"kernel", i32 1}
!9 = !{!"clang version 16.0.0 (https://github.com/llvm/llvm-project 809855b56f06dd7182685f88fbbc64111df9339a)"}
!10 = !{!"clang version 3.8.0 (tags/RELEASE_380/final)"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
!13 = distinct !{!13, !12}
!14 = !{i64 672300}
!15 = !{i64 738119}

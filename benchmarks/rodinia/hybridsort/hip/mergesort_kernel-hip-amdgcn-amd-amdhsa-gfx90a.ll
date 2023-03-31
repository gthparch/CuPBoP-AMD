; ModuleID = 'mergesort_kernel-hip-amdgcn-amd-amdhsa-gfx90a.bc'
source_filename = "mergesort_kernel.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%0 = type { ptr addrspace(1), ptr addrspace(1), %1, i64, i64, i64 }
%1 = type { i64 }
%2 = type { i64, i64, i32, i32 }
%3 = type { [64 x [8 x i64]] }
%4 = type { i64, %1, i64, i32, i32, i64, i64, %5, [2 x i32] }
%5 = type { ptr addrspace(1) }
%6 = type { i16, i16, i16, i16, i16, i16, i32, i32, i32, i32, i32, i64, ptr addrspace(1), i64, %1 }
%struct.texture = type { %struct.textureReference }
%struct.textureReference = type { i32, i32, i32, [3 x i32], %struct.hipChannelFormatDesc, i32, i32, i32, float, float, float, ptr, i32, i32 }
%struct.hipChannelFormatDesc = type { i32, i32, i32, i32, i32 }
%struct.texture.0 = type { %struct.textureReference }
%struct.__HIP_Coordinates = type { i8 }
%"struct.__HIP_Coordinates<__HIP_BlockIdx>::__X" = type { i8 }
%struct.__HIP_Coordinates.1 = type { i8 }
%"struct.__HIP_Coordinates<__HIP_BlockDim>::__X" = type { i8 }
%struct.__HIP_Coordinates.2 = type { i8 }
%"struct.__HIP_Coordinates<__HIP_ThreadIdx>::__X" = type { i8 }
%"struct.__HIP_Coordinates<__HIP_BlockIdx>::__Y" = type { i8 }
%struct.HIP_vector_type = type { %struct.HIP_vector_base }
%struct.HIP_vector_base = type { %union.anon }
%union.anon = type { <4 x float> }
%struct.anon = type { float, float, float, float }
%struct.__HIP_BlockIdx = type { i8 }
%struct.__HIP_BlockDim = type { i8 }
%struct.__HIP_ThreadIdx = type { i8 }
%union.anon.3 = type { <4 x float> }

$_ZNK17__HIP_CoordinatesI14__HIP_BlockIdxE3__XcvjEv = comdat any

$_ZNK17__HIP_CoordinatesI14__HIP_BlockDimE3__XcvjEv = comdat any

$_ZNK17__HIP_CoordinatesI15__HIP_ThreadIdxE3__XcvjEv = comdat any

$_ZN15HIP_vector_typeIfLj4EEaSEOS0_ = comdat any

$_ZN15HIP_vector_typeIfLj4EEaSERKS0_ = comdat any

$_ZNK17__HIP_CoordinatesI14__HIP_BlockIdxE3__YcvjEv = comdat any

$_ZN15HIP_vector_baseIfLj4EEaSERKS0_ = comdat any

$_ZNK14__HIP_BlockIdxclEj = comdat any

$_ZNK14__HIP_BlockDimclEj = comdat any

$_ZNK15__HIP_ThreadIdxclEj = comdat any

$_Z7mapFromI15HIP_vector_typeIfLj4EEDv4_fENSt9enable_ifIXooooooeqstT_stNS4_10value_typeEsr3std7is_sameIS5_iEE5valuesr3std7is_sameIS5_jEE5valuesr3std7is_sameIS5_fEE5valueEKS4_E4typeERKT0_ = comdat any

$_ZN17__HIP_CoordinatesI14__HIP_BlockIdxE1xE = comdat any

$_ZN17__HIP_CoordinatesI14__HIP_BlockDimE1xE = comdat any

$_ZN17__HIP_CoordinatesI15__HIP_ThreadIdxE1xE = comdat any

$_ZN17__HIP_CoordinatesI14__HIP_BlockIdxE1yE = comdat any

@__const.__assert_fail.fmt = private unnamed_addr addrspace(4) constant [47 x i8] c"%s:%u: %s: Device-side assertion `%s' failed.\0A\00", align 16
@tex = protected addrspace(1) externally_initialized global %struct.texture undef, align 8
@txt = protected addrspace(1) externally_initialized global %struct.texture.0 undef, align 8
@constStartAddr = protected addrspace(4) externally_initialized global [1025 x i32] zeroinitializer, align 16
@finalStartAddr = protected addrspace(4) externally_initialized global [1025 x i32] zeroinitializer, align 16
@nullElems = protected addrspace(4) externally_initialized global [1024 x i32] zeroinitializer, align 16
@_ZL8blockIdx = internal addrspace(4) constant %struct.__HIP_Coordinates undef, align 1
@_ZN17__HIP_CoordinatesI14__HIP_BlockIdxE1xE = weak protected addrspace(4) externally_initialized constant %"struct.__HIP_Coordinates<__HIP_BlockIdx>::__X" undef, comdat, align 1
@_ZL8blockDim = internal addrspace(4) constant %struct.__HIP_Coordinates.1 undef, align 1
@_ZN17__HIP_CoordinatesI14__HIP_BlockDimE1xE = weak protected addrspace(4) externally_initialized constant %"struct.__HIP_Coordinates<__HIP_BlockDim>::__X" undef, comdat, align 1
@_ZL9threadIdx = internal addrspace(4) constant %struct.__HIP_Coordinates.2 undef, align 1
@_ZN17__HIP_CoordinatesI15__HIP_ThreadIdxE1xE = weak protected addrspace(4) externally_initialized constant %"struct.__HIP_Coordinates<__HIP_ThreadIdx>::__X" undef, comdat, align 1
@_ZN17__HIP_CoordinatesI14__HIP_BlockIdxE1yE = weak protected addrspace(4) externally_initialized constant %"struct.__HIP_Coordinates<__HIP_BlockIdx>::__Y" undef, comdat, align 1
@llvm.compiler.used = appending addrspace(1) global [8 x ptr] [ptr addrspacecast (ptr addrspace(1) @tex to ptr), ptr addrspacecast (ptr addrspace(4) @constStartAddr to ptr), ptr addrspacecast (ptr addrspace(4) @finalStartAddr to ptr), ptr addrspacecast (ptr addrspace(4) @nullElems to ptr), ptr addrspacecast (ptr addrspace(4) @_ZN17__HIP_CoordinatesI14__HIP_BlockIdxE1xE to ptr), ptr addrspacecast (ptr addrspace(4) @_ZN17__HIP_CoordinatesI14__HIP_BlockDimE1xE to ptr), ptr addrspacecast (ptr addrspace(4) @_ZN17__HIP_CoordinatesI15__HIP_ThreadIdxE1xE to ptr), ptr addrspacecast (ptr addrspace(4) @_ZN17__HIP_CoordinatesI14__HIP_BlockIdxE1yE to ptr)], section "llvm.metadata"
@__oclc_wavefrontsize64 = internal local_unnamed_addr addrspace(4) constant i8 1, align 1
@__oclc_ABI_version = internal local_unnamed_addr addrspace(4) constant i32 400, align 4

; Function Attrs: convergent mustprogress noreturn nounwind
define weak void @__cxa_pure_virtual() #0 {
  call void @llvm.trap()
  unreachable
}

; Function Attrs: cold noreturn nounwind
declare void @llvm.trap() #1

; Function Attrs: convergent mustprogress noreturn nounwind
define weak void @__cxa_deleted_virtual() #0 {
  call void @llvm.trap()
  unreachable
}

; Function Attrs: convergent mustprogress noinline nounwind
define weak hidden void @__assert_fail(ptr noundef %0, ptr noundef %1, i32 noundef %2, ptr noundef %3) #2 {
  %5 = alloca ptr, align 8, addrspace(5)
  %6 = alloca ptr, align 8, addrspace(5)
  %7 = alloca i32, align 4, addrspace(5)
  %8 = alloca ptr, align 8, addrspace(5)
  %9 = alloca [47 x i8], align 16, addrspace(5)
  %10 = alloca i64, align 8, addrspace(5)
  %11 = alloca i32, align 4, addrspace(5)
  %12 = alloca ptr, align 8, addrspace(5)
  %13 = alloca ptr, align 8, addrspace(5)
  %14 = alloca ptr, align 8, addrspace(5)
  %15 = alloca ptr, align 8, addrspace(5)
  %16 = addrspacecast ptr addrspace(5) %5 to ptr
  %17 = addrspacecast ptr addrspace(5) %6 to ptr
  %18 = addrspacecast ptr addrspace(5) %7 to ptr
  %19 = addrspacecast ptr addrspace(5) %8 to ptr
  %20 = addrspacecast ptr addrspace(5) %9 to ptr
  %21 = addrspacecast ptr addrspace(5) %10 to ptr
  %22 = addrspacecast ptr addrspace(5) %11 to ptr
  %23 = addrspacecast ptr addrspace(5) %12 to ptr
  %24 = addrspacecast ptr addrspace(5) %13 to ptr
  %25 = addrspacecast ptr addrspace(5) %14 to ptr
  %26 = addrspacecast ptr addrspace(5) %15 to ptr
  store ptr %0, ptr %16, align 8, !tbaa !4
  store ptr %1, ptr %17, align 8, !tbaa !4
  store i32 %2, ptr %18, align 4, !tbaa !8
  store ptr %3, ptr %19, align 8, !tbaa !4
  call void @llvm.lifetime.start.p5(i64 47, ptr addrspace(5) %9) #22
  call void @llvm.memcpy.p0.p4.i64(ptr align 16 %20, ptr addrspace(4) align 16 @__const.__assert_fail.fmt, i64 47, i1 false)
  call void @llvm.lifetime.start.p5(i64 8, ptr addrspace(5) %10) #22
  %27 = call i64 @__ockl_fprintf_stderr_begin() #27
  store i64 %27, ptr %21, align 8, !tbaa !10
  call void @llvm.lifetime.start.p5(i64 4, ptr addrspace(5) %11) #22
  store i32 0, ptr %22, align 4, !tbaa !8
  br label %28

28:                                               ; preds = %4
  call void @llvm.lifetime.start.p5(i64 8, ptr addrspace(5) %12) #22
  %29 = getelementptr inbounds [47 x i8], ptr %20, i64 0, i64 0
  store ptr %29, ptr %23, align 8, !tbaa !4
  br label %30

30:                                               ; preds = %35, %28
  %31 = load ptr, ptr %23, align 8, !tbaa !4
  %32 = getelementptr inbounds i8, ptr %31, i32 1
  store ptr %32, ptr %23, align 8, !tbaa !4
  %33 = load i8, ptr %31, align 1, !tbaa !12
  %34 = icmp ne i8 %33, 0
  br i1 %34, label %35, label %36

35:                                               ; preds = %30
  br label %30, !llvm.loop !13

36:                                               ; preds = %30
  %37 = load ptr, ptr %23, align 8, !tbaa !4
  %38 = getelementptr inbounds [47 x i8], ptr %20, i64 0, i64 0
  %39 = ptrtoint ptr %37 to i64
  %40 = ptrtoint ptr %38 to i64
  %41 = sub i64 %39, %40
  %42 = trunc i64 %41 to i32
  store i32 %42, ptr %22, align 4, !tbaa !8
  call void @llvm.lifetime.end.p5(i64 8, ptr addrspace(5) %12) #22
  br label %43

43:                                               ; preds = %36
  br label %44

44:                                               ; preds = %43
  %45 = load i64, ptr %21, align 8, !tbaa !10
  %46 = getelementptr inbounds [47 x i8], ptr %20, i64 0, i64 0
  %47 = load i32, ptr %22, align 4, !tbaa !8
  %48 = sext i32 %47 to i64
  %49 = call i64 @__ockl_fprintf_append_string_n(i64 noundef %45, ptr noundef %46, i64 noundef %48, i32 noundef 0) #27
  store i64 %49, ptr %21, align 8, !tbaa !10
  br label %50

50:                                               ; preds = %44
  call void @llvm.lifetime.start.p5(i64 8, ptr addrspace(5) %13) #22
  %51 = load ptr, ptr %17, align 8, !tbaa !4
  store ptr %51, ptr %24, align 8, !tbaa !4
  br label %52

52:                                               ; preds = %57, %50
  %53 = load ptr, ptr %24, align 8, !tbaa !4
  %54 = getelementptr inbounds i8, ptr %53, i32 1
  store ptr %54, ptr %24, align 8, !tbaa !4
  %55 = load i8, ptr %53, align 1, !tbaa !12
  %56 = icmp ne i8 %55, 0
  br i1 %56, label %57, label %58

57:                                               ; preds = %52
  br label %52, !llvm.loop !15

58:                                               ; preds = %52
  %59 = load ptr, ptr %24, align 8, !tbaa !4
  %60 = load ptr, ptr %17, align 8, !tbaa !4
  %61 = ptrtoint ptr %59 to i64
  %62 = ptrtoint ptr %60 to i64
  %63 = sub i64 %61, %62
  %64 = trunc i64 %63 to i32
  store i32 %64, ptr %22, align 4, !tbaa !8
  call void @llvm.lifetime.end.p5(i64 8, ptr addrspace(5) %13) #22
  br label %65

65:                                               ; preds = %58
  br label %66

66:                                               ; preds = %65
  %67 = load i64, ptr %21, align 8, !tbaa !10
  %68 = load ptr, ptr %17, align 8, !tbaa !4
  %69 = load i32, ptr %22, align 4, !tbaa !8
  %70 = sext i32 %69 to i64
  %71 = call i64 @__ockl_fprintf_append_string_n(i64 noundef %67, ptr noundef %68, i64 noundef %70, i32 noundef 0) #27
  store i64 %71, ptr %21, align 8, !tbaa !10
  %72 = load i64, ptr %21, align 8, !tbaa !10
  %73 = load i32, ptr %18, align 4, !tbaa !8
  %74 = zext i32 %73 to i64
  %75 = call i64 @__ockl_fprintf_append_args(i64 noundef %72, i32 noundef 1, i64 noundef %74, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i32 noundef 0) #27
  store i64 %75, ptr %21, align 8, !tbaa !10
  br label %76

76:                                               ; preds = %66
  call void @llvm.lifetime.start.p5(i64 8, ptr addrspace(5) %14) #22
  %77 = load ptr, ptr %19, align 8, !tbaa !4
  store ptr %77, ptr %25, align 8, !tbaa !4
  br label %78

78:                                               ; preds = %83, %76
  %79 = load ptr, ptr %25, align 8, !tbaa !4
  %80 = getelementptr inbounds i8, ptr %79, i32 1
  store ptr %80, ptr %25, align 8, !tbaa !4
  %81 = load i8, ptr %79, align 1, !tbaa !12
  %82 = icmp ne i8 %81, 0
  br i1 %82, label %83, label %84

83:                                               ; preds = %78
  br label %78, !llvm.loop !16

84:                                               ; preds = %78
  %85 = load ptr, ptr %25, align 8, !tbaa !4
  %86 = load ptr, ptr %19, align 8, !tbaa !4
  %87 = ptrtoint ptr %85 to i64
  %88 = ptrtoint ptr %86 to i64
  %89 = sub i64 %87, %88
  %90 = trunc i64 %89 to i32
  store i32 %90, ptr %22, align 4, !tbaa !8
  call void @llvm.lifetime.end.p5(i64 8, ptr addrspace(5) %14) #22
  br label %91

91:                                               ; preds = %84
  br label %92

92:                                               ; preds = %91
  %93 = load i64, ptr %21, align 8, !tbaa !10
  %94 = load ptr, ptr %19, align 8, !tbaa !4
  %95 = load i32, ptr %22, align 4, !tbaa !8
  %96 = sext i32 %95 to i64
  %97 = call i64 @__ockl_fprintf_append_string_n(i64 noundef %93, ptr noundef %94, i64 noundef %96, i32 noundef 0) #27
  store i64 %97, ptr %21, align 8, !tbaa !10
  br label %98

98:                                               ; preds = %92
  call void @llvm.lifetime.start.p5(i64 8, ptr addrspace(5) %15) #22
  %99 = load ptr, ptr %16, align 8, !tbaa !4
  store ptr %99, ptr %26, align 8, !tbaa !4
  br label %100

100:                                              ; preds = %105, %98
  %101 = load ptr, ptr %26, align 8, !tbaa !4
  %102 = getelementptr inbounds i8, ptr %101, i32 1
  store ptr %102, ptr %26, align 8, !tbaa !4
  %103 = load i8, ptr %101, align 1, !tbaa !12
  %104 = icmp ne i8 %103, 0
  br i1 %104, label %105, label %106

105:                                              ; preds = %100
  br label %100, !llvm.loop !17

106:                                              ; preds = %100
  %107 = load ptr, ptr %26, align 8, !tbaa !4
  %108 = load ptr, ptr %16, align 8, !tbaa !4
  %109 = ptrtoint ptr %107 to i64
  %110 = ptrtoint ptr %108 to i64
  %111 = sub i64 %109, %110
  %112 = trunc i64 %111 to i32
  store i32 %112, ptr %22, align 4, !tbaa !8
  call void @llvm.lifetime.end.p5(i64 8, ptr addrspace(5) %15) #22
  br label %113

113:                                              ; preds = %106
  br label %114

114:                                              ; preds = %113
  %115 = load i64, ptr %21, align 8, !tbaa !10
  %116 = load ptr, ptr %16, align 8, !tbaa !4
  %117 = load i32, ptr %22, align 4, !tbaa !8
  %118 = sext i32 %117 to i64
  %119 = call i64 @__ockl_fprintf_append_string_n(i64 noundef %115, ptr noundef %116, i64 noundef %118, i32 noundef 1) #27
  call void @llvm.trap()
  call void @llvm.lifetime.end.p5(i64 4, ptr addrspace(5) %11) #22
  call void @llvm.lifetime.end.p5(i64 8, ptr addrspace(5) %10) #22
  call void @llvm.lifetime.end.p5(i64 47, ptr addrspace(5) %9) #22
  ret void
}

; Function Attrs: argmemonly nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p5(i64 immarg, ptr addrspace(5) nocapture) #3

; Function Attrs: argmemonly nocallback nofree nounwind willreturn
declare void @llvm.memcpy.p0.p4.i64(ptr noalias nocapture writeonly, ptr addrspace(4) noalias nocapture readonly, i64, i1 immarg) #4

; Function Attrs: argmemonly nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p5(i64 immarg, ptr addrspace(5) nocapture) #3

; Function Attrs: convergent mustprogress noinline nounwind
define weak hidden void @__assertfail(ptr noundef %0, ptr noundef %1, i32 noundef %2, ptr noundef %3, i64 noundef %4) #2 {
  %6 = alloca ptr, align 8, addrspace(5)
  %7 = alloca ptr, align 8, addrspace(5)
  %8 = alloca i32, align 4, addrspace(5)
  %9 = alloca ptr, align 8, addrspace(5)
  %10 = alloca i64, align 8, addrspace(5)
  %11 = addrspacecast ptr addrspace(5) %6 to ptr
  %12 = addrspacecast ptr addrspace(5) %7 to ptr
  %13 = addrspacecast ptr addrspace(5) %8 to ptr
  %14 = addrspacecast ptr addrspace(5) %9 to ptr
  %15 = addrspacecast ptr addrspace(5) %10 to ptr
  store ptr %0, ptr %11, align 8, !tbaa !4
  store ptr %1, ptr %12, align 8, !tbaa !4
  store i32 %2, ptr %13, align 4, !tbaa !8
  store ptr %3, ptr %14, align 8, !tbaa !4
  store i64 %4, ptr %15, align 8, !tbaa !10
  call void @llvm.trap()
  ret void
}

; Function Attrs: convergent mustprogress nounwind
define hidden %struct.HIP_vector_type @_Z8sortElem15HIP_vector_typeIfLj4EE(%struct.HIP_vector_base %0) #5 {
  %2 = alloca %struct.HIP_vector_type, align 16, addrspace(5)
  %3 = alloca %struct.HIP_vector_type, align 16, addrspace(5)
  %4 = addrspacecast ptr addrspace(5) %2 to ptr
  %5 = addrspacecast ptr addrspace(5) %3 to ptr
  %6 = getelementptr inbounds %struct.HIP_vector_type, ptr %5, i32 0, i32 0
  %7 = getelementptr inbounds %struct.HIP_vector_base, ptr %6, i32 0, i32 0
  %8 = getelementptr inbounds %union.anon, ptr %7, i32 0, i32 0
  %9 = getelementptr inbounds %struct.HIP_vector_base, ptr %8, i32 0, i32 0
  %10 = extractvalue %struct.HIP_vector_base %0, 0
  store %union.anon %10, ptr %9, align 16
  %11 = getelementptr inbounds %struct.HIP_vector_base, ptr %5, i32 0, i32 0
  %12 = getelementptr inbounds %struct.anon, ptr %11, i32 0, i32 0
  %13 = load float, ptr %12, align 16, !tbaa !12
  %14 = getelementptr inbounds %struct.HIP_vector_base, ptr %5, i32 0, i32 0
  %15 = getelementptr inbounds %struct.anon, ptr %14, i32 0, i32 1
  %16 = load float, ptr %15, align 4, !tbaa !12
  %17 = fcmp contract ogt float %13, %16
  br i1 %17, label %18, label %22
  

18:                                               ; preds = %1
  %19 = getelementptr inbounds %struct.HIP_vector_base, ptr %5, i32 0, i32 0
  %20 = getelementptr inbounds %struct.anon, ptr %19, i32 0, i32 1
  %21 = load float, ptr %20, align 4, !tbaa !12
  br label %26

22:                                               ; preds = %1
  %23 = getelementptr inbounds %struct.HIP_vector_base, ptr %5, i32 0, i32 0
  %24 = getelementptr inbounds %struct.anon, ptr %23, i32 0, i32 0
  %25 = load float, ptr %24, align 16, !tbaa !12
  br label %26

26:                                               ; preds = %22, %18
  %27 = phi contract float [ %21, %18 ], [ %25, %22 ]
  %28 = getelementptr inbounds %struct.HIP_vector_base, ptr %4, i32 0, i32 0
  %29 = getelementptr inbounds %struct.anon, ptr %28, i32 0, i32 0
  store float %27, ptr %29, align 16, !tbaa !12
  %30 = getelementptr inbounds %struct.HIP_vector_base, ptr %5, i32 0, i32 0
  %31 = getelementptr inbounds %struct.anon, ptr %30, i32 0, i32 1
  %32 = load float, ptr %31, align 4, !tbaa !12
  %33 = getelementptr inbounds %struct.HIP_vector_base, ptr %5, i32 0, i32 0
  %34 = getelementptr inbounds %struct.anon, ptr %33, i32 0, i32 0
  %35 = load float, ptr %34, align 16, !tbaa !12
  %36 = fcmp contract ogt float %32, %35
  br i1 %36, label %37, label %41

37:                                               ; preds = %26
  %38 = getelementptr inbounds %struct.HIP_vector_base, ptr %5, i32 0, i32 0
  %39 = getelementptr inbounds %struct.anon, ptr %38, i32 0, i32 1
  %40 = load float, ptr %39, align 4, !tbaa !12
  br label %45

41:                                               ; preds = %26
  %42 = getelementptr inbounds %struct.HIP_vector_base, ptr %5, i32 0, i32 0
  %43 = getelementptr inbounds %struct.anon, ptr %42, i32 0, i32 0
  %44 = load float, ptr %43, align 16, !tbaa !12
  br label %45

45:                                               ; preds = %41, %37
  %46 = phi contract float [ %40, %37 ], [ %44, %41 ]
  %47 = getelementptr inbounds %struct.HIP_vector_base, ptr %4, i32 0, i32 0
  %48 = getelementptr inbounds %struct.anon, ptr %47, i32 0, i32 1
  store float %46, ptr %48, align 4, !tbaa !12
  %49 = getelementptr inbounds %struct.HIP_vector_base, ptr %5, i32 0, i32 0
  %50 = getelementptr inbounds %struct.anon, ptr %49, i32 0, i32 2
  %51 = load float, ptr %50, align 8, !tbaa !12
  %52 = getelementptr inbounds %struct.HIP_vector_base, ptr %5, i32 0, i32 0
  %53 = getelementptr inbounds %struct.anon, ptr %52, i32 0, i32 3
  %54 = load float, ptr %53, align 4, !tbaa !12
  %55 = fcmp contract ogt float %51, %54
  br i1 %55, label %56, label %60

56:                                               ; preds = %45
  %57 = getelementptr inbounds %struct.HIP_vector_base, ptr %5, i32 0, i32 0
  %58 = getelementptr inbounds %struct.anon, ptr %57, i32 0, i32 3
  %59 = load float, ptr %58, align 4, !tbaa !12
  br label %64

60:                                               ; preds = %45
  %61 = getelementptr inbounds %struct.HIP_vector_base, ptr %5, i32 0, i32 0
  %62 = getelementptr inbounds %struct.anon, ptr %61, i32 0, i32 2
  %63 = load float, ptr %62, align 8, !tbaa !12
  br label %64

64:                                               ; preds = %60, %56
  %65 = phi contract float [ %59, %56 ], [ %63, %60 ]
  %66 = getelementptr inbounds %struct.HIP_vector_base, ptr %4, i32 0, i32 0
  %67 = getelementptr inbounds %struct.anon, ptr %66, i32 0, i32 2
  store float %65, ptr %67, align 8, !tbaa !12
  %68 = getelementptr inbounds %struct.HIP_vector_base, ptr %5, i32 0, i32 0
  %69 = getelementptr inbounds %struct.anon, ptr %68, i32 0, i32 3
  %70 = load float, ptr %69, align 4, !tbaa !12
  %71 = getelementptr inbounds %struct.HIP_vector_base, ptr %5, i32 0, i32 0
  %72 = getelementptr inbounds %struct.anon, ptr %71, i32 0, i32 2
  %73 = load float, ptr %72, align 8, !tbaa !12
  %74 = fcmp contract ogt float %70, %73
  br i1 %74, label %75, label %79

75:                                               ; preds = %64
  %76 = getelementptr inbounds %struct.HIP_vector_base, ptr %5, i32 0, i32 0
  %77 = getelementptr inbounds %struct.anon, ptr %76, i32 0, i32 3
  %78 = load float, ptr %77, align 4, !tbaa !12
  br label %83

79:                                               ; preds = %64
  %80 = getelementptr inbounds %struct.HIP_vector_base, ptr %5, i32 0, i32 0
  %81 = getelementptr inbounds %struct.anon, ptr %80, i32 0, i32 2
  %82 = load float, ptr %81, align 8, !tbaa !12
  br label %83

83:                                               ; preds = %79, %75
  %84 = phi contract float [ %78, %75 ], [ %82, %79 ]
  %85 = getelementptr inbounds %struct.HIP_vector_base, ptr %4, i32 0, i32 0
  %86 = getelementptr inbounds %struct.anon, ptr %85, i32 0, i32 3
  store float %84, ptr %86, align 4, !tbaa !12
  %87 = getelementptr inbounds %struct.HIP_vector_base, ptr %4, i32 0, i32 0
  %88 = getelementptr inbounds %struct.anon, ptr %87, i32 0, i32 0
  %89 = load float, ptr %88, align 16, !tbaa !12
  %90 = getelementptr inbounds %struct.HIP_vector_base, ptr %4, i32 0, i32 0
  %91 = getelementptr inbounds %struct.anon, ptr %90, i32 0, i32 2
  %92 = load float, ptr %91, align 8, !tbaa !12
  %93 = fcmp contract ogt float %89, %92
  br i1 %93, label %94, label %98

94:                                               ; preds = %83
  %95 = getelementptr inbounds %struct.HIP_vector_base, ptr %4, i32 0, i32 0
  %96 = getelementptr inbounds %struct.anon, ptr %95, i32 0, i32 2
  %97 = load float, ptr %96, align 8, !tbaa !12
  br label %102

98:                                               ; preds = %83
  %99 = getelementptr inbounds %struct.HIP_vector_base, ptr %4, i32 0, i32 0
  %100 = getelementptr inbounds %struct.anon, ptr %99, i32 0, i32 0
  %101 = load float, ptr %100, align 16, !tbaa !12
  br label %102

102:                                              ; preds = %98, %94
  %103 = phi contract float [ %97, %94 ], [ %101, %98 ]
  %104 = getelementptr inbounds %struct.HIP_vector_base, ptr %5, i32 0, i32 0
  %105 = getelementptr inbounds %struct.anon, ptr %104, i32 0, i32 0
  store float %103, ptr %105, align 16, !tbaa !12
  %106 = getelementptr inbounds %struct.HIP_vector_base, ptr %4, i32 0, i32 0
  %107 = getelementptr inbounds %struct.anon, ptr %106, i32 0, i32 1
  %108 = load float, ptr %107, align 4, !tbaa !12
  %109 = getelementptr inbounds %struct.HIP_vector_base, ptr %4, i32 0, i32 0
  %110 = getelementptr inbounds %struct.anon, ptr %109, i32 0, i32 3
  %111 = load float, ptr %110, align 4, !tbaa !12
  %112 = fcmp contract ogt float %108, %111
  br i1 %112, label %113, label %117

113:                                              ; preds = %102
  %114 = getelementptr inbounds %struct.HIP_vector_base, ptr %4, i32 0, i32 0
  %115 = getelementptr inbounds %struct.anon, ptr %114, i32 0, i32 3
  %116 = load float, ptr %115, align 4, !tbaa !12
  br label %121

117:                                              ; preds = %102
  %118 = getelementptr inbounds %struct.HIP_vector_base, ptr %4, i32 0, i32 0
  %119 = getelementptr inbounds %struct.anon, ptr %118, i32 0, i32 1
  %120 = load float, ptr %119, align 4, !tbaa !12
  br label %121

121:                                              ; preds = %117, %113
  %122 = phi contract float [ %116, %113 ], [ %120, %117 ]
  %123 = getelementptr inbounds %struct.HIP_vector_base, ptr %5, i32 0, i32 0
  %124 = getelementptr inbounds %struct.anon, ptr %123, i32 0, i32 1
  store float %122, ptr %124, align 4, !tbaa !12
  %125 = getelementptr inbounds %struct.HIP_vector_base, ptr %4, i32 0, i32 0
  %126 = getelementptr inbounds %struct.anon, ptr %125, i32 0, i32 2
  %127 = load float, ptr %126, align 8, !tbaa !12
  %128 = getelementptr inbounds %struct.HIP_vector_base, ptr %4, i32 0, i32 0
  %129 = getelementptr inbounds %struct.anon, ptr %128, i32 0, i32 0
  %130 = load float, ptr %129, align 16, !tbaa !12
  %131 = fcmp contract ogt float %127, %130
  br i1 %131, label %132, label %136

132:                                              ; preds = %121
  %133 = getelementptr inbounds %struct.HIP_vector_base, ptr %4, i32 0, i32 0
  %134 = getelementptr inbounds %struct.anon, ptr %133, i32 0, i32 2
  %135 = load float, ptr %134, align 8, !tbaa !12
  br label %140

136:                                              ; preds = %121
  %137 = getelementptr inbounds %struct.HIP_vector_base, ptr %4, i32 0, i32 0
  %138 = getelementptr inbounds %struct.anon, ptr %137, i32 0, i32 0
  %139 = load float, ptr %138, align 16, !tbaa !12
  br label %140

140:                                              ; preds = %136, %132
  %141 = phi contract float [ %135, %132 ], [ %139, %136 ]
  %142 = getelementptr inbounds %struct.HIP_vector_base, ptr %5, i32 0, i32 0
  %143 = getelementptr inbounds %struct.anon, ptr %142, i32 0, i32 2
  store float %141, ptr %143, align 8, !tbaa !12
  %144 = getelementptr inbounds %struct.HIP_vector_base, ptr %4, i32 0, i32 0
  %145 = getelementptr inbounds %struct.anon, ptr %144, i32 0, i32 3
  %146 = load float, ptr %145, align 4, !tbaa !12
  %147 = getelementptr inbounds %struct.HIP_vector_base, ptr %4, i32 0, i32 0
  %148 = getelementptr inbounds %struct.anon, ptr %147, i32 0, i32 1
  %149 = load float, ptr %148, align 4, !tbaa !12
  %150 = fcmp contract ogt float %146, %149
  br i1 %150, label %151, label %155

151:                                              ; preds = %140
  %152 = getelementptr inbounds %struct.HIP_vector_base, ptr %4, i32 0, i32 0
  %153 = getelementptr inbounds %struct.anon, ptr %152, i32 0, i32 3
  %154 = load float, ptr %153, align 4, !tbaa !12
  br label %159

155:                                              ; preds = %140
  %156 = getelementptr inbounds %struct.HIP_vector_base, ptr %4, i32 0, i32 0
  %157 = getelementptr inbounds %struct.anon, ptr %156, i32 0, i32 1
  %158 = load float, ptr %157, align 4, !tbaa !12
  br label %159

159:                                              ; preds = %155, %151
  %160 = phi contract float [ %154, %151 ], [ %158, %155 ]
  %161 = getelementptr inbounds %struct.HIP_vector_base, ptr %5, i32 0, i32 0
  %162 = getelementptr inbounds %struct.anon, ptr %161, i32 0, i32 3
  store float %160, ptr %162, align 4, !tbaa !12
  %163 = getelementptr inbounds %struct.HIP_vector_base, ptr %5, i32 0, i32 0
  %164 = getelementptr inbounds %struct.anon, ptr %163, i32 0, i32 0
  %165 = load float, ptr %164, align 16, !tbaa !12
  %166 = getelementptr inbounds %struct.HIP_vector_base, ptr %4, i32 0, i32 0
  %167 = getelementptr inbounds %struct.anon, ptr %166, i32 0, i32 0
  store float %165, ptr %167, align 16, !tbaa !12
  %168 = getelementptr inbounds %struct.HIP_vector_base, ptr %5, i32 0, i32 0
  %169 = getelementptr inbounds %struct.anon, ptr %168, i32 0, i32 1
  %170 = load float, ptr %169, align 4, !tbaa !12
  %171 = getelementptr inbounds %struct.HIP_vector_base, ptr %5, i32 0, i32 0
  %172 = getelementptr inbounds %struct.anon, ptr %171, i32 0, i32 2
  %173 = load float, ptr %172, align 8, !tbaa !12
  %174 = fcmp contract ogt float %170, %173
  br i1 %174, label %175, label %179

175:                                              ; preds = %159
  %176 = getelementptr inbounds %struct.HIP_vector_base, ptr %5, i32 0, i32 0
  %177 = getelementptr inbounds %struct.anon, ptr %176, i32 0, i32 2
  %178 = load float, ptr %177, align 8, !tbaa !12
  br label %183

179:                                              ; preds = %159
  %180 = getelementptr inbounds %struct.HIP_vector_base, ptr %5, i32 0, i32 0
  %181 = getelementptr inbounds %struct.anon, ptr %180, i32 0, i32 1
  %182 = load float, ptr %181, align 4, !tbaa !12
  br label %183

183:                                              ; preds = %179, %175
  %184 = phi contract float [ %178, %175 ], [ %182, %179 ]
  %185 = getelementptr inbounds %struct.HIP_vector_base, ptr %4, i32 0, i32 0
  %186 = getelementptr inbounds %struct.anon, ptr %185, i32 0, i32 1
  store float %184, ptr %186, align 4, !tbaa !12
  %187 = getelementptr inbounds %struct.HIP_vector_base, ptr %5, i32 0, i32 0
  %188 = getelementptr inbounds %struct.anon, ptr %187, i32 0, i32 2
  %189 = load float, ptr %188, align 8, !tbaa !12
  %190 = getelementptr inbounds %struct.HIP_vector_base, ptr %5, i32 0, i32 0
  %191 = getelementptr inbounds %struct.anon, ptr %190, i32 0, i32 1
  %192 = load float, ptr %191, align 4, !tbaa !12
  %193 = fcmp contract ogt float %189, %192
  br i1 %193, label %194, label %198

194:                                              ; preds = %183
  %195 = getelementptr inbounds %struct.HIP_vector_base, ptr %5, i32 0, i32 0
  %196 = getelementptr inbounds %struct.anon, ptr %195, i32 0, i32 2
  %197 = load float, ptr %196, align 8, !tbaa !12
  br label %202

198:                                              ; preds = %183
  %199 = getelementptr inbounds %struct.HIP_vector_base, ptr %5, i32 0, i32 0
  %200 = getelementptr inbounds %struct.anon, ptr %199, i32 0, i32 1
  %201 = load float, ptr %200, align 4, !tbaa !12
  br label %202

202:                                              ; preds = %198, %194
  %203 = phi contract float [ %197, %194 ], [ %201, %198 ]
  %204 = getelementptr inbounds %struct.HIP_vector_base, ptr %4, i32 0, i32 0
  %205 = getelementptr inbounds %struct.anon, ptr %204, i32 0, i32 2
  store float %203, ptr %205, align 8, !tbaa !12
  %206 = getelementptr inbounds %struct.HIP_vector_base, ptr %5, i32 0, i32 0
  %207 = getelementptr inbounds %struct.anon, ptr %206, i32 0, i32 3
  %208 = load float, ptr %207, align 4, !tbaa !12
  %209 = getelementptr inbounds %struct.HIP_vector_base, ptr %4, i32 0, i32 0
  %210 = getelementptr inbounds %struct.anon, ptr %209, i32 0, i32 3
  store float %208, ptr %210, align 4, !tbaa !12
  %211 = load %struct.HIP_vector_type, ptr %4, align 16
  ret %struct.HIP_vector_type %211
}

; Function Attrs: convergent mustprogress nounwind
define hidden %struct.HIP_vector_type @_Z9getLowest15HIP_vector_typeIfLj4EES0_(%struct.HIP_vector_base %0, %struct.HIP_vector_base %1) #5 {
  %3 = alloca %struct.HIP_vector_type, align 16, addrspace(5)
  %4 = alloca %struct.HIP_vector_type, align 16, addrspace(5)
  %5 = alloca %struct.HIP_vector_type, align 16, addrspace(5)
  %6 = addrspacecast ptr addrspace(5) %3 to ptr
  %7 = addrspacecast ptr addrspace(5) %4 to ptr
  %8 = addrspacecast ptr addrspace(5) %5 to ptr
  %9 = getelementptr inbounds %struct.HIP_vector_type, ptr %7, i32 0, i32 0
  %10 = getelementptr inbounds %struct.HIP_vector_base, ptr %9, i32 0, i32 0
  %11 = getelementptr inbounds %union.anon, ptr %10, i32 0, i32 0
  %12 = getelementptr inbounds %struct.HIP_vector_base, ptr %11, i32 0, i32 0
  %13 = extractvalue %struct.HIP_vector_base %0, 0
  store %union.anon %13, ptr %12, align 16
  %14 = getelementptr inbounds %struct.HIP_vector_type, ptr %8, i32 0, i32 0
  %15 = getelementptr inbounds %struct.HIP_vector_base, ptr %14, i32 0, i32 0
  %16 = getelementptr inbounds %union.anon, ptr %15, i32 0, i32 0
  %17 = getelementptr inbounds %struct.HIP_vector_base, ptr %16, i32 0, i32 0
  %18 = extractvalue %struct.HIP_vector_base %1, 0
  store %union.anon %18, ptr %17, align 16
  %19 = getelementptr inbounds %struct.HIP_vector_base, ptr %7, i32 0, i32 0
  %20 = getelementptr inbounds %struct.anon, ptr %19, i32 0, i32 0
  %21 = load float, ptr %20, align 16, !tbaa !12
  %22 = getelementptr inbounds %struct.HIP_vector_base, ptr %8, i32 0, i32 0
  %23 = getelementptr inbounds %struct.anon, ptr %22, i32 0, i32 3
  %24 = load float, ptr %23, align 4, !tbaa !12
  %25 = fcmp contract olt float %21, %24
  br i1 %25, label %26, label %30

26:                                               ; preds = %2
  %27 = getelementptr inbounds %struct.HIP_vector_base, ptr %7, i32 0, i32 0
  %28 = getelementptr inbounds %struct.anon, ptr %27, i32 0, i32 0
  %29 = load float, ptr %28, align 16, !tbaa !12
  br label %34

30:                                               ; preds = %2
  %31 = getelementptr inbounds %struct.HIP_vector_base, ptr %8, i32 0, i32 0
  %32 = getelementptr inbounds %struct.anon, ptr %31, i32 0, i32 3
  %33 = load float, ptr %32, align 4, !tbaa !12
  br label %34

34:                                               ; preds = %30, %26
  %35 = phi contract float [ %29, %26 ], [ %33, %30 ]
  %36 = getelementptr inbounds %struct.HIP_vector_base, ptr %7, i32 0, i32 0
  %37 = getelementptr inbounds %struct.anon, ptr %36, i32 0, i32 0
  store float %35, ptr %37, align 16, !tbaa !12
  %38 = getelementptr inbounds %struct.HIP_vector_base, ptr %7, i32 0, i32 0
  %39 = getelementptr inbounds %struct.anon, ptr %38, i32 0, i32 1
  %40 = load float, ptr %39, align 4, !tbaa !12
  %41 = getelementptr inbounds %struct.HIP_vector_base, ptr %8, i32 0, i32 0
  %42 = getelementptr inbounds %struct.anon, ptr %41, i32 0, i32 2
  %43 = load float, ptr %42, align 8, !tbaa !12
  %44 = fcmp contract olt float %40, %43
  br i1 %44, label %45, label %49

45:                                               ; preds = %34
  %46 = getelementptr inbounds %struct.HIP_vector_base, ptr %7, i32 0, i32 0
  %47 = getelementptr inbounds %struct.anon, ptr %46, i32 0, i32 1
  %48 = load float, ptr %47, align 4, !tbaa !12
  br label %53

49:                                               ; preds = %34
  %50 = getelementptr inbounds %struct.HIP_vector_base, ptr %8, i32 0, i32 0
  %51 = getelementptr inbounds %struct.anon, ptr %50, i32 0, i32 2
  %52 = load float, ptr %51, align 8, !tbaa !12
  br label %53

53:                                               ; preds = %49, %45
  %54 = phi contract float [ %48, %45 ], [ %52, %49 ]
  %55 = getelementptr inbounds %struct.HIP_vector_base, ptr %7, i32 0, i32 0
  %56 = getelementptr inbounds %struct.anon, ptr %55, i32 0, i32 1
  store float %54, ptr %56, align 4, !tbaa !12
  %57 = getelementptr inbounds %struct.HIP_vector_base, ptr %7, i32 0, i32 0
  %58 = getelementptr inbounds %struct.anon, ptr %57, i32 0, i32 2
  %59 = load float, ptr %58, align 8, !tbaa !12
  %60 = getelementptr inbounds %struct.HIP_vector_base, ptr %8, i32 0, i32 0
  %61 = getelementptr inbounds %struct.anon, ptr %60, i32 0, i32 1
  %62 = load float, ptr %61, align 4, !tbaa !12
  %63 = fcmp contract olt float %59, %62
  br i1 %63, label %64, label %68

64:                                               ; preds = %53
  %65 = getelementptr inbounds %struct.HIP_vector_base, ptr %7, i32 0, i32 0
  %66 = getelementptr inbounds %struct.anon, ptr %65, i32 0, i32 2
  %67 = load float, ptr %66, align 8, !tbaa !12
  br label %72

68:                                               ; preds = %53
  %69 = getelementptr inbounds %struct.HIP_vector_base, ptr %8, i32 0, i32 0
  %70 = getelementptr inbounds %struct.anon, ptr %69, i32 0, i32 1
  %71 = load float, ptr %70, align 4, !tbaa !12
  br label %72

72:                                               ; preds = %68, %64
  %73 = phi contract float [ %67, %64 ], [ %71, %68 ]
  %74 = getelementptr inbounds %struct.HIP_vector_base, ptr %7, i32 0, i32 0
  %75 = getelementptr inbounds %struct.anon, ptr %74, i32 0, i32 2
  store float %73, ptr %75, align 8, !tbaa !12
  %76 = getelementptr inbounds %struct.HIP_vector_base, ptr %7, i32 0, i32 0
  %77 = getelementptr inbounds %struct.anon, ptr %76, i32 0, i32 3
  %78 = load float, ptr %77, align 4, !tbaa !12
  %79 = getelementptr inbounds %struct.HIP_vector_base, ptr %8, i32 0, i32 0
  %80 = getelementptr inbounds %struct.anon, ptr %79, i32 0, i32 0
  %81 = load float, ptr %80, align 16, !tbaa !12
  %82 = fcmp contract olt float %78, %81
  br i1 %82, label %83, label %87

83:                                               ; preds = %72
  %84 = getelementptr inbounds %struct.HIP_vector_base, ptr %7, i32 0, i32 0
  %85 = getelementptr inbounds %struct.anon, ptr %84, i32 0, i32 3
  %86 = load float, ptr %85, align 4, !tbaa !12
  br label %91

87:                                               ; preds = %72
  %88 = getelementptr inbounds %struct.HIP_vector_base, ptr %8, i32 0, i32 0
  %89 = getelementptr inbounds %struct.anon, ptr %88, i32 0, i32 0
  %90 = load float, ptr %89, align 16, !tbaa !12
  br label %91

91:                                               ; preds = %87, %83
  %92 = phi contract float [ %86, %83 ], [ %90, %87 ]
  %93 = getelementptr inbounds %struct.HIP_vector_base, ptr %7, i32 0, i32 0
  %94 = getelementptr inbounds %struct.anon, ptr %93, i32 0, i32 3
  store float %92, ptr %94, align 4, !tbaa !12
  call void @llvm.memcpy.p0.p0.i64(ptr align 16 %6, ptr align 16 %7, i64 16, i1 false)
  %95 = load %struct.HIP_vector_type, ptr %6, align 16
  ret %struct.HIP_vector_type %95
}

; Function Attrs: argmemonly nocallback nofree nounwind willreturn
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #4

; Function Attrs: convergent mustprogress nounwind
define hidden %struct.HIP_vector_type @_Z10getHighest15HIP_vector_typeIfLj4EES0_(%struct.HIP_vector_base %0, %struct.HIP_vector_base %1) #5 {
  %3 = alloca %struct.HIP_vector_type, align 16, addrspace(5)
  %4 = alloca %struct.HIP_vector_type, align 16, addrspace(5)
  %5 = alloca %struct.HIP_vector_type, align 16, addrspace(5)
  %6 = addrspacecast ptr addrspace(5) %3 to ptr
  %7 = addrspacecast ptr addrspace(5) %4 to ptr
  %8 = addrspacecast ptr addrspace(5) %5 to ptr
  %9 = getelementptr inbounds %struct.HIP_vector_type, ptr %7, i32 0, i32 0
  %10 = getelementptr inbounds %struct.HIP_vector_base, ptr %9, i32 0, i32 0
  %11 = getelementptr inbounds %union.anon, ptr %10, i32 0, i32 0
  %12 = getelementptr inbounds %struct.HIP_vector_base, ptr %11, i32 0, i32 0
  %13 = extractvalue %struct.HIP_vector_base %0, 0
  store %union.anon %13, ptr %12, align 16
  %14 = getelementptr inbounds %struct.HIP_vector_type, ptr %8, i32 0, i32 0
  %15 = getelementptr inbounds %struct.HIP_vector_base, ptr %14, i32 0, i32 0
  %16 = getelementptr inbounds %union.anon, ptr %15, i32 0, i32 0
  %17 = getelementptr inbounds %struct.HIP_vector_base, ptr %16, i32 0, i32 0
  %18 = extractvalue %struct.HIP_vector_base %1, 0
  store %union.anon %18, ptr %17, align 16
  %19 = getelementptr inbounds %struct.HIP_vector_base, ptr %7, i32 0, i32 0
  %20 = getelementptr inbounds %struct.anon, ptr %19, i32 0, i32 3
  %21 = load float, ptr %20, align 4, !tbaa !12
  %22 = getelementptr inbounds %struct.HIP_vector_base, ptr %8, i32 0, i32 0
  %23 = getelementptr inbounds %struct.anon, ptr %22, i32 0, i32 0
  %24 = load float, ptr %23, align 16, !tbaa !12
  %25 = fcmp contract oge float %21, %24
  br i1 %25, label %26, label %30

26:                                               ; preds = %2
  %27 = getelementptr inbounds %struct.HIP_vector_base, ptr %7, i32 0, i32 0
  %28 = getelementptr inbounds %struct.anon, ptr %27, i32 0, i32 3
  %29 = load float, ptr %28, align 4, !tbaa !12
  br label %34

30:                                               ; preds = %2
  %31 = getelementptr inbounds %struct.HIP_vector_base, ptr %8, i32 0, i32 0
  %32 = getelementptr inbounds %struct.anon, ptr %31, i32 0, i32 0
  %33 = load float, ptr %32, align 16, !tbaa !12
  br label %34

34:                                               ; preds = %30, %26
  %35 = phi contract float [ %29, %26 ], [ %33, %30 ]
  %36 = getelementptr inbounds %struct.HIP_vector_base, ptr %8, i32 0, i32 0
  %37 = getelementptr inbounds %struct.anon, ptr %36, i32 0, i32 0
  store float %35, ptr %37, align 16, !tbaa !12
  %38 = getelementptr inbounds %struct.HIP_vector_base, ptr %7, i32 0, i32 0
  %39 = getelementptr inbounds %struct.anon, ptr %38, i32 0, i32 2
  %40 = load float, ptr %39, align 8, !tbaa !12
  %41 = getelementptr inbounds %struct.HIP_vector_base, ptr %8, i32 0, i32 0
  %42 = getelementptr inbounds %struct.anon, ptr %41, i32 0, i32 1
  %43 = load float, ptr %42, align 4, !tbaa !12
  %44 = fcmp contract oge float %40, %43
  br i1 %44, label %45, label %49

45:                                               ; preds = %34
  %46 = getelementptr inbounds %struct.HIP_vector_base, ptr %7, i32 0, i32 0
  %47 = getelementptr inbounds %struct.anon, ptr %46, i32 0, i32 2
  %48 = load float, ptr %47, align 8, !tbaa !12
  br label %53

49:                                               ; preds = %34
  %50 = getelementptr inbounds %struct.HIP_vector_base, ptr %8, i32 0, i32 0
  %51 = getelementptr inbounds %struct.anon, ptr %50, i32 0, i32 1
  %52 = load float, ptr %51, align 4, !tbaa !12
  br label %53

53:                                               ; preds = %49, %45
  %54 = phi contract float [ %48, %45 ], [ %52, %49 ]
  %55 = getelementptr inbounds %struct.HIP_vector_base, ptr %8, i32 0, i32 0
  %56 = getelementptr inbounds %struct.anon, ptr %55, i32 0, i32 1
  store float %54, ptr %56, align 4, !tbaa !12
  %57 = getelementptr inbounds %struct.HIP_vector_base, ptr %7, i32 0, i32 0
  %58 = getelementptr inbounds %struct.anon, ptr %57, i32 0, i32 1
  %59 = load float, ptr %58, align 4, !tbaa !12
  %60 = getelementptr inbounds %struct.HIP_vector_base, ptr %8, i32 0, i32 0
  %61 = getelementptr inbounds %struct.anon, ptr %60, i32 0, i32 2
  %62 = load float, ptr %61, align 8, !tbaa !12
  %63 = fcmp contract oge float %59, %62
  br i1 %63, label %64, label %68

64:                                               ; preds = %53
  %65 = getelementptr inbounds %struct.HIP_vector_base, ptr %7, i32 0, i32 0
  %66 = getelementptr inbounds %struct.anon, ptr %65, i32 0, i32 1
  %67 = load float, ptr %66, align 4, !tbaa !12
  br label %72

68:                                               ; preds = %53
  %69 = getelementptr inbounds %struct.HIP_vector_base, ptr %8, i32 0, i32 0
  %70 = getelementptr inbounds %struct.anon, ptr %69, i32 0, i32 2
  %71 = load float, ptr %70, align 8, !tbaa !12
  br label %72

72:                                               ; preds = %68, %64
  %73 = phi contract float [ %67, %64 ], [ %71, %68 ]
  %74 = getelementptr inbounds %struct.HIP_vector_base, ptr %8, i32 0, i32 0
  %75 = getelementptr inbounds %struct.anon, ptr %74, i32 0, i32 2
  store float %73, ptr %75, align 8, !tbaa !12
  %76 = getelementptr inbounds %struct.HIP_vector_base, ptr %7, i32 0, i32 0
  %77 = getelementptr inbounds %struct.anon, ptr %76, i32 0, i32 0
  %78 = load float, ptr %77, align 16, !tbaa !12
  %79 = getelementptr inbounds %struct.HIP_vector_base, ptr %8, i32 0, i32 0
  %80 = getelementptr inbounds %struct.anon, ptr %79, i32 0, i32 3
  %81 = load float, ptr %80, align 4, !tbaa !12
  %82 = fcmp contract oge float %78, %81
  br i1 %82, label %83, label %87

83:                                               ; preds = %72
  %84 = getelementptr inbounds %struct.HIP_vector_base, ptr %7, i32 0, i32 0
  %85 = getelementptr inbounds %struct.anon, ptr %84, i32 0, i32 0
  %86 = load float, ptr %85, align 16, !tbaa !12
  br label %91

87:                                               ; preds = %72
  %88 = getelementptr inbounds %struct.HIP_vector_base, ptr %8, i32 0, i32 0
  %89 = getelementptr inbounds %struct.anon, ptr %88, i32 0, i32 3
  %90 = load float, ptr %89, align 4, !tbaa !12
  br label %91

91:                                               ; preds = %87, %83
  %92 = phi contract float [ %86, %83 ], [ %90, %87 ]
  %93 = getelementptr inbounds %struct.HIP_vector_base, ptr %8, i32 0, i32 0
  %94 = getelementptr inbounds %struct.anon, ptr %93, i32 0, i32 3
  store float %92, ptr %94, align 4, !tbaa !12
  call void @llvm.memcpy.p0.p0.i64(ptr align 16 %6, ptr align 16 %8, i64 16, i1 false)
  %95 = load %struct.HIP_vector_type, ptr %6, align 16
  ret %struct.HIP_vector_type %95
}

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z14mergeSortFirstP15HIP_vector_typeIfLj4EEi(ptr addrspace(1) noundef %0, i32 noundef %1) #6 {
  %3 = alloca ptr, align 8, addrspace(5)
  %4 = alloca ptr, align 8, addrspace(5)
  %5 = alloca i32, align 4, addrspace(5)
  %6 = alloca i32, align 4, addrspace(5)
  %7 = alloca %struct.HIP_vector_type, align 16, addrspace(5)
  %8 = alloca %struct.texture, align 8, addrspace(5)
  %9 = alloca %struct.HIP_vector_type, align 16, addrspace(5)
  %10 = alloca %struct.HIP_vector_type, align 16, addrspace(5)
  %11 = addrspacecast ptr addrspace(5) %3 to ptr
  %12 = addrspacecast ptr addrspace(5) %4 to ptr
  %13 = addrspacecast ptr addrspace(5) %5 to ptr
  %14 = addrspacecast ptr addrspace(5) %6 to ptr
  %15 = addrspacecast ptr addrspace(5) %7 to ptr
  %16 = addrspacecast ptr addrspace(5) %8 to ptr
  %17 = addrspacecast ptr addrspace(5) %9 to ptr
  %18 = addrspacecast ptr addrspace(5) %10 to ptr
  %19 = addrspacecast ptr addrspace(1) %0 to ptr
  store ptr %19, ptr %11, align 8
  %20 = load ptr, ptr %11, align 8, !tbaa !4
  store ptr %20, ptr %12, align 8, !tbaa !4
  store i32 %1, ptr %13, align 4, !tbaa !8
  call void @llvm.lifetime.start.p5(i64 4, ptr addrspace(5) %6) #22
  %21 = call noundef i32 @_ZNK17__HIP_CoordinatesI14__HIP_BlockIdxE3__XcvjEv(ptr noundef nonnull align 1 dereferenceable(1) addrspacecast (ptr addrspace(4) @_ZN17__HIP_CoordinatesI14__HIP_BlockIdxE1xE to ptr)) #27
  store i32 %21, ptr %14, align 4, !tbaa !8
  %22 = load i32, ptr %14, align 4, !tbaa !8
  %23 = call noundef i32 @_ZNK17__HIP_CoordinatesI14__HIP_BlockDimE3__XcvjEv(ptr noundef nonnull align 1 dereferenceable(1) addrspacecast (ptr addrspace(4) @_ZN17__HIP_CoordinatesI14__HIP_BlockDimE1xE to ptr)) #27
  %24 = mul i32 %22, %23
  %25 = call noundef i32 @_ZNK17__HIP_CoordinatesI15__HIP_ThreadIdxE3__XcvjEv(ptr noundef nonnull align 1 dereferenceable(1) addrspacecast (ptr addrspace(4) @_ZN17__HIP_CoordinatesI15__HIP_ThreadIdxE1xE to ptr)) #27
  %26 = add i32 %24, %25
  %27 = load i32, ptr %13, align 4, !tbaa !8
  %28 = sdiv i32 %27, 4
  %29 = icmp ult i32 %26, %28
  br i1 %29, label %30, label %55

30:                                               ; preds = %2
  call void @llvm.lifetime.start.p5(i64 16, ptr addrspace(5) %7) #22
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %16, ptr align 8 addrspacecast (ptr addrspace(1) @tex to ptr), i64 88, i1 false)
  %31 = load i32, ptr %14, align 4, !tbaa !8
  %32 = call noundef i32 @_ZNK17__HIP_CoordinatesI14__HIP_BlockDimE3__XcvjEv(ptr noundef nonnull align 1 dereferenceable(1) addrspacecast (ptr addrspace(4) @_ZN17__HIP_CoordinatesI14__HIP_BlockDimE1xE to ptr)) #27
  %33 = mul i32 %31, %32
  %34 = call noundef i32 @_ZNK17__HIP_CoordinatesI15__HIP_ThreadIdxE3__XcvjEv(ptr noundef nonnull align 1 dereferenceable(1) addrspacecast (ptr addrspace(4) @_ZN17__HIP_CoordinatesI15__HIP_ThreadIdxE1xE to ptr)) #27
  %35 = add i32 %33, %34
  %36 = getelementptr inbounds %struct.texture, ptr %16, i32 0, i32 0
  %37 = load %struct.textureReference, ptr %36, align 8
  %38 = call %struct.HIP_vector_type @_ZL10tex1DfetchI15HIP_vector_typeIfLj4EEL18hipTextureReadMode0EEN13__hip_tex_retIT_XT0_EbE4typeE7textureIS4_Li1EXT0_EEi(%struct.textureReference %37, i32 noundef %35) #27
  %39 = getelementptr inbounds %struct.HIP_vector_type, ptr %15, i32 0, i32 0
  %40 = extractvalue %struct.HIP_vector_type %38, 0
  store %struct.HIP_vector_base %40, ptr %39, align 16
  call void @llvm.lifetime.start.p5(i64 16, ptr addrspace(5) %9) #22
  call void @llvm.memcpy.p0.p0.i64(ptr align 16 %18, ptr align 16 %15, i64 16, i1 false)
  %41 = getelementptr inbounds %struct.HIP_vector_type, ptr %18, i32 0, i32 0
  %42 = load %struct.HIP_vector_base, ptr %41, align 16
  %43 = call %struct.HIP_vector_type @_Z8sortElem15HIP_vector_typeIfLj4EE(%struct.HIP_vector_base %42) #27
  %44 = getelementptr inbounds %struct.HIP_vector_type, ptr %17, i32 0, i32 0
  %45 = extractvalue %struct.HIP_vector_type %43, 0
  store %struct.HIP_vector_base %45, ptr %44, align 16
  %46 = load ptr, ptr %12, align 8, !tbaa !4
  %47 = load i32, ptr %14, align 4, !tbaa !8
  %48 = call noundef i32 @_ZNK17__HIP_CoordinatesI14__HIP_BlockDimE3__XcvjEv(ptr noundef nonnull align 1 dereferenceable(1) addrspacecast (ptr addrspace(4) @_ZN17__HIP_CoordinatesI14__HIP_BlockDimE1xE to ptr)) #27
  %49 = mul i32 %47, %48
  %50 = call noundef i32 @_ZNK17__HIP_CoordinatesI15__HIP_ThreadIdxE3__XcvjEv(ptr noundef nonnull align 1 dereferenceable(1) addrspacecast (ptr addrspace(4) @_ZN17__HIP_CoordinatesI15__HIP_ThreadIdxE1xE to ptr)) #27
  %51 = add i32 %49, %50
  %52 = zext i32 %51 to i64
  %53 = getelementptr inbounds %struct.HIP_vector_type, ptr %46, i64 %52
  %54 = call noundef nonnull align 16 dereferenceable(16) ptr @_ZN15HIP_vector_typeIfLj4EEaSEOS0_(ptr noundef nonnull align 16 dereferenceable(16) %53, ptr noundef nonnull align 16 dereferenceable(16) %17) #27
  call void @llvm.lifetime.end.p5(i64 16, ptr addrspace(5) %9) #22
  call void @llvm.lifetime.end.p5(i64 16, ptr addrspace(5) %7) #22
  br label %55

55:                                               ; preds = %30, %2
  call void @llvm.lifetime.end.p5(i64 4, ptr addrspace(5) %6) #22
  ret void
}

; Function Attrs: convergent mustprogress nounwind
define linkonce_odr hidden noundef i32 @_ZNK17__HIP_CoordinatesI14__HIP_BlockIdxE3__XcvjEv(ptr noundef nonnull align 1 dereferenceable(1) %0) #5 comdat align 2 {
  %2 = alloca i32, align 4, addrspace(5)
  %3 = alloca ptr, align 8, addrspace(5)
  %4 = alloca %struct.__HIP_BlockIdx, align 1, addrspace(5)
  %5 = addrspacecast ptr addrspace(5) %2 to ptr
  %6 = addrspacecast ptr addrspace(5) %3 to ptr
  %7 = addrspacecast ptr addrspace(5) %4 to ptr
  store ptr %0, ptr %6, align 8, !tbaa !4
  %8 = load ptr, ptr %6, align 8
  call void @llvm.lifetime.start.p5(i64 1, ptr addrspace(5) %4) #22
  %9 = call noundef i32 @_ZNK14__HIP_BlockIdxclEj(ptr noundef nonnull align 1 dereferenceable(1) %7, i32 noundef 0) #27
  call void @llvm.lifetime.end.p5(i64 1, ptr addrspace(5) %4) #22
  ret i32 %9
}

; Function Attrs: convergent mustprogress nounwind
define linkonce_odr hidden noundef i32 @_ZNK17__HIP_CoordinatesI14__HIP_BlockDimE3__XcvjEv(ptr noundef nonnull align 1 dereferenceable(1) %0) #5 comdat align 2 {
  %2 = alloca i32, align 4, addrspace(5)
  %3 = alloca ptr, align 8, addrspace(5)
  %4 = alloca %struct.__HIP_BlockDim, align 1, addrspace(5)
  %5 = addrspacecast ptr addrspace(5) %2 to ptr
  %6 = addrspacecast ptr addrspace(5) %3 to ptr
  %7 = addrspacecast ptr addrspace(5) %4 to ptr
  store ptr %0, ptr %6, align 8, !tbaa !4
  %8 = load ptr, ptr %6, align 8
  call void @llvm.lifetime.start.p5(i64 1, ptr addrspace(5) %4) #22
  %9 = call noundef i32 @_ZNK14__HIP_BlockDimclEj(ptr noundef nonnull align 1 dereferenceable(1) %7, i32 noundef 0) #27
  call void @llvm.lifetime.end.p5(i64 1, ptr addrspace(5) %4) #22
  ret i32 %9
}

; Function Attrs: convergent mustprogress nounwind
define linkonce_odr hidden noundef i32 @_ZNK17__HIP_CoordinatesI15__HIP_ThreadIdxE3__XcvjEv(ptr noundef nonnull align 1 dereferenceable(1) %0) #5 comdat align 2 {
  %2 = alloca i32, align 4, addrspace(5)
  %3 = alloca ptr, align 8, addrspace(5)
  %4 = alloca %struct.__HIP_ThreadIdx, align 1, addrspace(5)
  %5 = addrspacecast ptr addrspace(5) %2 to ptr
  %6 = addrspacecast ptr addrspace(5) %3 to ptr
  %7 = addrspacecast ptr addrspace(5) %4 to ptr
  store ptr %0, ptr %6, align 8, !tbaa !4
  %8 = load ptr, ptr %6, align 8
  call void @llvm.lifetime.start.p5(i64 1, ptr addrspace(5) %4) #22
  %9 = call noundef i32 @_ZNK15__HIP_ThreadIdxclEj(ptr noundef nonnull align 1 dereferenceable(1) %7, i32 noundef 0) #27
  call void @llvm.lifetime.end.p5(i64 1, ptr addrspace(5) %4) #22
  ret i32 %9
}

; Function Attrs: alwaysinline convergent mustprogress nounwind
define internal %struct.HIP_vector_type @_ZL10tex1DfetchI15HIP_vector_typeIfLj4EEL18hipTextureReadMode0EEN13__hip_tex_retIT_XT0_EbE4typeE7textureIS4_Li1EXT0_EEi(%struct.textureReference %0, i32 noundef %1) #7 {
  %3 = alloca %struct.HIP_vector_type, align 16, addrspace(5)
  %4 = alloca %struct.texture, align 8, addrspace(5)
  %5 = alloca i32, align 4, addrspace(5)
  %6 = alloca ptr addrspace(4), align 8, addrspace(5)
  %7 = alloca ptr addrspace(4), align 8, addrspace(5)
  %8 = alloca <4 x float>, align 16, addrspace(5)
  %9 = alloca i32, align 4, addrspace(5)
  %10 = addrspacecast ptr addrspace(5) %3 to ptr
  %11 = addrspacecast ptr addrspace(5) %4 to ptr
  %12 = addrspacecast ptr addrspace(5) %5 to ptr
  %13 = addrspacecast ptr addrspace(5) %6 to ptr
  %14 = addrspacecast ptr addrspace(5) %7 to ptr
  %15 = addrspacecast ptr addrspace(5) %8 to ptr
  %16 = getelementptr inbounds %struct.texture, ptr %11, i32 0, i32 0
  %17 = getelementptr inbounds %struct.textureReference, ptr %16, i32 0, i32 0
  %18 = extractvalue %struct.textureReference %0, 0
  store i32 %18, ptr %17, align 8
  %19 = getelementptr inbounds %struct.textureReference, ptr %16, i32 0, i32 1
  %20 = extractvalue %struct.textureReference %0, 1
  store i32 %20, ptr %19, align 4
  %21 = getelementptr inbounds %struct.textureReference, ptr %16, i32 0, i32 2
  %22 = extractvalue %struct.textureReference %0, 2
  store i32 %22, ptr %21, align 8
  %23 = getelementptr inbounds %struct.textureReference, ptr %16, i32 0, i32 3
  %24 = extractvalue %struct.textureReference %0, 3
  store [3 x i32] %24, ptr %23, align 4
  %25 = getelementptr inbounds %struct.textureReference, ptr %16, i32 0, i32 4
  %26 = extractvalue %struct.textureReference %0, 4
  store %struct.hipChannelFormatDesc %26, ptr %25, align 8
  %27 = getelementptr inbounds %struct.textureReference, ptr %16, i32 0, i32 5
  %28 = extractvalue %struct.textureReference %0, 5
  store i32 %28, ptr %27, align 4
  %29 = getelementptr inbounds %struct.textureReference, ptr %16, i32 0, i32 6
  %30 = extractvalue %struct.textureReference %0, 6
  store i32 %30, ptr %29, align 8
  %31 = getelementptr inbounds %struct.textureReference, ptr %16, i32 0, i32 7
  %32 = extractvalue %struct.textureReference %0, 7
  store i32 %32, ptr %31, align 4
  %33 = getelementptr inbounds %struct.textureReference, ptr %16, i32 0, i32 8
  %34 = extractvalue %struct.textureReference %0, 8
  store float %34, ptr %33, align 8
  %35 = getelementptr inbounds %struct.textureReference, ptr %16, i32 0, i32 9
  %36 = extractvalue %struct.textureReference %0, 9
  store float %36, ptr %35, align 4
  %37 = getelementptr inbounds %struct.textureReference, ptr %16, i32 0, i32 10
  %38 = extractvalue %struct.textureReference %0, 10
  store float %38, ptr %37, align 8
  %39 = getelementptr inbounds %struct.textureReference, ptr %16, i32 0, i32 11
  %40 = extractvalue %struct.textureReference %0, 11
  store ptr %40, ptr %39, align 8
  %41 = getelementptr inbounds %struct.textureReference, ptr %16, i32 0, i32 12
  %42 = extractvalue %struct.textureReference %0, 12
  store i32 %42, ptr %41, align 8
  %43 = getelementptr inbounds %struct.textureReference, ptr %16, i32 0, i32 13
  %44 = extractvalue %struct.textureReference %0, 13
  store i32 %44, ptr %43, align 4
  store i32 %1, ptr %12, align 4, !tbaa !8
  call void @llvm.lifetime.start.p5(i64 8, ptr addrspace(5) %6) #22
  %45 = getelementptr inbounds %struct.textureReference, ptr %11, i32 0, i32 11
  %46 = load ptr, ptr %45, align 8, !tbaa !18
  %47 = addrspacecast ptr %46 to ptr addrspace(4)
  store ptr addrspace(4) %47, ptr %13, align 8, !tbaa !4
  call void @llvm.lifetime.start.p5(i64 8, ptr addrspace(5) %7) #22
  %48 = load ptr addrspace(4), ptr %13, align 8, !tbaa !4
  %49 = getelementptr inbounds i32, ptr addrspace(4) %48, i64 12
  store ptr addrspace(4) %49, ptr %14, align 8, !tbaa !4
  call void @llvm.lifetime.start.p5(i64 16, ptr addrspace(5) %8) #22
  %50 = load ptr addrspace(4), ptr %13, align 8, !tbaa !4
  %51 = load i32, ptr %12, align 4, !tbaa !8
  %52 = call contract <4 x float> @__ockl_image_load_1Db(ptr addrspace(4) noundef %50, i32 noundef %51) #27
  store <4 x float> %52, ptr %15, align 16, !tbaa !12
  %53 = call %struct.HIP_vector_type @_Z7mapFromI15HIP_vector_typeIfLj4EEDv4_fENSt9enable_ifIXooooooeqstT_stNS4_10value_typeEsr3std7is_sameIS5_iEE5valuesr3std7is_sameIS5_jEE5valuesr3std7is_sameIS5_fEE5valueEKS4_E4typeERKT0_(ptr noundef nonnull align 16 dereferenceable(16) %15) #27
  %54 = getelementptr inbounds %struct.HIP_vector_type, ptr %10, i32 0, i32 0
  %55 = extractvalue %struct.HIP_vector_type %53, 0
  store %struct.HIP_vector_base %55, ptr %54, align 16
  call void @llvm.lifetime.end.p5(i64 16, ptr addrspace(5) %8) #22
  call void @llvm.lifetime.end.p5(i64 8, ptr addrspace(5) %7) #22
  call void @llvm.lifetime.end.p5(i64 8, ptr addrspace(5) %6) #22
  %56 = load %struct.HIP_vector_type, ptr %10, align 16
  ret %struct.HIP_vector_type %56
}

; Function Attrs: convergent nounwind
define linkonce_odr hidden noundef nonnull align 16 dereferenceable(16) ptr @_ZN15HIP_vector_typeIfLj4EEaSEOS0_(ptr noundef nonnull align 16 dereferenceable(16) %0, ptr noundef nonnull align 16 dereferenceable(16) %1) #8 comdat align 2 {
  %3 = alloca ptr, align 8, addrspace(5)
  %4 = alloca ptr, align 8, addrspace(5)
  %5 = alloca ptr, align 8, addrspace(5)
  %6 = addrspacecast ptr addrspace(5) %3 to ptr
  %7 = addrspacecast ptr addrspace(5) %4 to ptr
  %8 = addrspacecast ptr addrspace(5) %5 to ptr
  store ptr %0, ptr %7, align 8, !tbaa !4
  store ptr %1, ptr %8, align 8, !tbaa !4
  %9 = load ptr, ptr %7, align 8
  %10 = load ptr, ptr %8, align 8, !tbaa !4
  %11 = call noundef nonnull align 16 dereferenceable(16) ptr @_ZN15HIP_vector_baseIfLj4EEaSERKS0_(ptr noundef nonnull align 16 dereferenceable(16) %9, ptr noundef nonnull align 16 dereferenceable(16) %10) #27
  ret ptr %9
}

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z13mergeSortPassP15HIP_vector_typeIfLj4EEii(ptr addrspace(1) noundef %0, i32 noundef %1, i32 noundef %2) #6 {
  %4 = alloca ptr, align 8, addrspace(5)
  %5 = alloca ptr, align 8, addrspace(5)
  %6 = alloca i32, align 4, addrspace(5)
  %7 = alloca i32, align 4, addrspace(5)
  %8 = alloca i32, align 4, addrspace(5)
  %9 = alloca i32, align 4, addrspace(5)
  %10 = alloca i32, align 4, addrspace(5)
  %11 = alloca i32, align 4, addrspace(5)
  %12 = alloca i32, align 4, addrspace(5)
  %13 = alloca i32, align 4, addrspace(5)
  %14 = alloca ptr, align 8, addrspace(5)
  %15 = alloca i32, align 4, addrspace(5)
  %16 = alloca %struct.HIP_vector_type, align 16, addrspace(5)
  %17 = alloca %struct.texture, align 8, addrspace(5)
  %18 = alloca i32, align 4, addrspace(5)
  %19 = alloca i32, align 4, addrspace(5)
  %20 = alloca i32, align 4, addrspace(5)
  %21 = alloca %struct.HIP_vector_type, align 16, addrspace(5)
  %22 = alloca %struct.HIP_vector_type, align 16, addrspace(5)
  %23 = alloca %struct.HIP_vector_type, align 16, addrspace(5)
  %24 = alloca %struct.texture, align 8, addrspace(5)
  %25 = alloca %struct.HIP_vector_type, align 16, addrspace(5)
  %26 = alloca %struct.texture, align 8, addrspace(5)
  %27 = alloca %struct.HIP_vector_type, align 16, addrspace(5)
  %28 = alloca %struct.texture, align 8, addrspace(5)
  %29 = alloca %struct.HIP_vector_type, align 16, addrspace(5)
  %30 = alloca %struct.texture, align 8, addrspace(5)
  %31 = alloca %struct.HIP_vector_type, align 16, addrspace(5)
  %32 = alloca %struct.HIP_vector_type, align 16, addrspace(5)
  %33 = alloca %struct.HIP_vector_type, align 16, addrspace(5)
  %34 = alloca %struct.HIP_vector_type, align 16, addrspace(5)
  %35 = alloca %struct.HIP_vector_type, align 16, addrspace(5)
  %36 = alloca %struct.HIP_vector_type, align 16, addrspace(5)
  %37 = alloca %struct.HIP_vector_type, align 16, addrspace(5)
  %38 = alloca %struct.HIP_vector_type, align 16, addrspace(5)
  %39 = alloca %struct.HIP_vector_type, align 16, addrspace(5)
  %40 = alloca %struct.HIP_vector_type, align 16, addrspace(5)
  %41 = alloca i8, align 1, addrspace(5)
  %42 = alloca i8, align 1, addrspace(5)
  %43 = addrspacecast ptr addrspace(5) %4 to ptr
  %44 = addrspacecast ptr addrspace(5) %5 to ptr
  %45 = addrspacecast ptr addrspace(5) %6 to ptr
  %46 = addrspacecast ptr addrspace(5) %7 to ptr
  %47 = addrspacecast ptr addrspace(5) %8 to ptr
  %48 = addrspacecast ptr addrspace(5) %9 to ptr
  %49 = addrspacecast ptr addrspace(5) %10 to ptr
  %50 = addrspacecast ptr addrspace(5) %11 to ptr
  %51 = addrspacecast ptr addrspace(5) %12 to ptr
  %52 = addrspacecast ptr addrspace(5) %13 to ptr
  %53 = addrspacecast ptr addrspace(5) %14 to ptr
  %54 = addrspacecast ptr addrspace(5) %15 to ptr
  %55 = addrspacecast ptr addrspace(5) %16 to ptr
  %56 = addrspacecast ptr addrspace(5) %17 to ptr
  %57 = addrspacecast ptr addrspace(5) %18 to ptr
  %58 = addrspacecast ptr addrspace(5) %19 to ptr
  %59 = addrspacecast ptr addrspace(5) %20 to ptr
  %60 = addrspacecast ptr addrspace(5) %21 to ptr
  %61 = addrspacecast ptr addrspace(5) %22 to ptr
  %62 = addrspacecast ptr addrspace(5) %23 to ptr
  %63 = addrspacecast ptr addrspace(5) %24 to ptr
  %64 = addrspacecast ptr addrspace(5) %25 to ptr
  %65 = addrspacecast ptr addrspace(5) %26 to ptr
  %66 = addrspacecast ptr addrspace(5) %27 to ptr
  %67 = addrspacecast ptr addrspace(5) %28 to ptr
  %68 = addrspacecast ptr addrspace(5) %29 to ptr
  %69 = addrspacecast ptr addrspace(5) %30 to ptr
  %70 = addrspacecast ptr addrspace(5) %31 to ptr
  %71 = addrspacecast ptr addrspace(5) %32 to ptr
  %72 = addrspacecast ptr addrspace(5) %33 to ptr
  %73 = addrspacecast ptr addrspace(5) %34 to ptr
  %74 = addrspacecast ptr addrspace(5) %35 to ptr
  %75 = addrspacecast ptr addrspace(5) %36 to ptr
  %76 = addrspacecast ptr addrspace(5) %37 to ptr
  %77 = addrspacecast ptr addrspace(5) %38 to ptr
  %78 = addrspacecast ptr addrspace(5) %39 to ptr
  %79 = addrspacecast ptr addrspace(5) %40 to ptr
  %80 = addrspacecast ptr addrspace(5) %41 to ptr
  %81 = addrspacecast ptr addrspace(5) %42 to ptr
  %82 = addrspacecast ptr addrspace(1) %0 to ptr
  store ptr %82, ptr %43, align 8
  %83 = load ptr, ptr %43, align 8, !tbaa !4
  store ptr %83, ptr %44, align 8, !tbaa !4
  store i32 %1, ptr %45, align 4, !tbaa !8
  store i32 %2, ptr %46, align 4, !tbaa !8
  call void @llvm.lifetime.start.p5(i64 4, ptr addrspace(5) %8) #22
  %84 = call noundef i32 @_ZNK17__HIP_CoordinatesI14__HIP_BlockIdxE3__XcvjEv(ptr noundef nonnull align 1 dereferenceable(1) addrspacecast (ptr addrspace(4) @_ZN17__HIP_CoordinatesI14__HIP_BlockIdxE1xE to ptr)) #27
  %85 = call noundef i32 @_ZNK17__HIP_CoordinatesI14__HIP_BlockDimE3__XcvjEv(ptr noundef nonnull align 1 dereferenceable(1) addrspacecast (ptr addrspace(4) @_ZN17__HIP_CoordinatesI14__HIP_BlockDimE1xE to ptr)) #27
  %86 = mul i32 %84, %85
  %87 = call noundef i32 @_ZNK17__HIP_CoordinatesI15__HIP_ThreadIdxE3__XcvjEv(ptr noundef nonnull align 1 dereferenceable(1) addrspacecast (ptr addrspace(4) @_ZN17__HIP_CoordinatesI15__HIP_ThreadIdxE1xE to ptr)) #27
  %88 = add i32 %86, %87
  store i32 %88, ptr %47, align 4, !tbaa !8
  call void @llvm.lifetime.start.p5(i64 4, ptr addrspace(5) %9) #22
  %89 = load i32, ptr %47, align 4, !tbaa !8
  %90 = load i32, ptr %46, align 4, !tbaa !8
  %91 = sdiv i32 %89, %90
  store i32 %91, ptr %48, align 4, !tbaa !8
  %92 = load i32, ptr %48, align 4, !tbaa !8
  %93 = icmp sge i32 %92, 1024
  br i1 %93, label %94, label %95

94:                                               ; preds = %3
  store i32 1, ptr %49, align 4
  br label %307

95:                                               ; preds = %3
  call void @llvm.lifetime.start.p5(i64 4, ptr addrspace(5) %11) #22
  %96 = load i32, ptr %47, align 4, !tbaa !8
  %97 = load i32, ptr %48, align 4, !tbaa !8
  %98 = load i32, ptr %46, align 4, !tbaa !8
  %99 = mul nsw i32 %97, %98
  %100 = sub nsw i32 %96, %99
  store i32 %100, ptr %50, align 4, !tbaa !8
  call void @llvm.lifetime.start.p5(i64 4, ptr addrspace(5) %12) #22
  %101 = load i32, ptr %48, align 4, !tbaa !8
  %102 = sext i32 %101 to i64
  %103 = getelementptr inbounds [1025 x i32], ptr addrspacecast (ptr addrspace(4) @constStartAddr to ptr), i64 0, i64 %102
  %104 = load i32, ptr %103, align 4, !tbaa !8
  %105 = load i32, ptr %50, align 4, !tbaa !8
  %106 = load i32, ptr %45, align 4, !tbaa !8
  %107 = mul nsw i32 %105, %106
  %108 = add nsw i32 %104, %107
  store i32 %108, ptr %51, align 4, !tbaa !8
  call void @llvm.lifetime.start.p5(i64 4, ptr addrspace(5) %13) #22
  %109 = load i32, ptr %51, align 4, !tbaa !8
  %110 = load i32, ptr %45, align 4, !tbaa !8
  %111 = sdiv i32 %110, 2
  %112 = add nsw i32 %109, %111
  store i32 %112, ptr %52, align 4, !tbaa !8
  call void @llvm.lifetime.start.p5(i64 8, ptr addrspace(5) %14) #22
  %113 = load ptr, ptr %44, align 8, !tbaa !4
  %114 = load i32, ptr %51, align 4, !tbaa !8
  %115 = sext i32 %114 to i64
  %116 = getelementptr inbounds %struct.HIP_vector_type, ptr %113, i64 %115
  store ptr %116, ptr %53, align 8, !tbaa !4
  %117 = load i32, ptr %51, align 4, !tbaa !8
  %118 = load i32, ptr %48, align 4, !tbaa !8
  %119 = add nsw i32 %118, 1
  %120 = sext i32 %119 to i64
  %121 = getelementptr inbounds [1025 x i32], ptr addrspacecast (ptr addrspace(4) @constStartAddr to ptr), i64 0, i64 %120
  %122 = load i32, ptr %121, align 4, !tbaa !8
  %123 = icmp sge i32 %117, %122
  br i1 %123, label %124, label %125

124:                                              ; preds = %95
  store i32 1, ptr %49, align 4
  br label %306

125:                                              ; preds = %95
  %126 = load i32, ptr %52, align 4, !tbaa !8
  %127 = load i32, ptr %48, align 4, !tbaa !8
  %128 = add nsw i32 %127, 1
  %129 = sext i32 %128 to i64
  %130 = getelementptr inbounds [1025 x i32], ptr addrspacecast (ptr addrspace(4) @constStartAddr to ptr), i64 0, i64 %129
  %131 = load i32, ptr %130, align 4, !tbaa !8
  %132 = icmp sge i32 %126, %131
  br i1 %132, label %133, label %163

133:                                              ; preds = %125
  call void @llvm.lifetime.start.p5(i64 4, ptr addrspace(5) %15) #22
  store i32 0, ptr %54, align 4, !tbaa !8
  br label %134

134:                                              ; preds = %159, %133
  %135 = load i32, ptr %54, align 4, !tbaa !8
  %136 = load i32, ptr %48, align 4, !tbaa !8
  %137 = add nsw i32 %136, 1
  %138 = sext i32 %137 to i64
  %139 = getelementptr inbounds [1025 x i32], ptr addrspacecast (ptr addrspace(4) @constStartAddr to ptr), i64 0, i64 %138
  %140 = load i32, ptr %139, align 4, !tbaa !8
  %141 = load i32, ptr %51, align 4, !tbaa !8
  %142 = sub nsw i32 %140, %141
  %143 = icmp slt i32 %135, %142
  br i1 %143, label %145, label %144

144:                                              ; preds = %134
  store i32 2, ptr %49, align 4
  call void @llvm.lifetime.end.p5(i64 4, ptr addrspace(5) %15) #22
  br label %162

145:                                              ; preds = %134
  call void @llvm.lifetime.start.p5(i64 16, ptr addrspace(5) %16) #22
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %56, ptr align 8 addrspacecast (ptr addrspace(1) @tex to ptr), i64 88, i1 false)
  %146 = load i32, ptr %51, align 4, !tbaa !8
  %147 = load i32, ptr %54, align 4, !tbaa !8
  %148 = add nsw i32 %146, %147
  %149 = getelementptr inbounds %struct.texture, ptr %56, i32 0, i32 0
  %150 = load %struct.textureReference, ptr %149, align 8
  %151 = call %struct.HIP_vector_type @_ZL10tex1DfetchI15HIP_vector_typeIfLj4EEL18hipTextureReadMode0EEN13__hip_tex_retIT_XT0_EbE4typeE7textureIS4_Li1EXT0_EEi(%struct.textureReference %150, i32 noundef %148) #27
  %152 = getelementptr inbounds %struct.HIP_vector_type, ptr %55, i32 0, i32 0
  %153 = extractvalue %struct.HIP_vector_type %151, 0
  store %struct.HIP_vector_base %153, ptr %152, align 16
  %154 = load ptr, ptr %53, align 8, !tbaa !4
  %155 = load i32, ptr %54, align 4, !tbaa !8
  %156 = sext i32 %155 to i64
  %157 = getelementptr inbounds %struct.HIP_vector_type, ptr %154, i64 %156
  %158 = call noundef nonnull align 16 dereferenceable(16) ptr @_ZN15HIP_vector_typeIfLj4EEaSEOS0_(ptr noundef nonnull align 16 dereferenceable(16) %157, ptr noundef nonnull align 16 dereferenceable(16) %55) #27
  call void @llvm.lifetime.end.p5(i64 16, ptr addrspace(5) %16) #22
  br label %159

159:                                              ; preds = %145
  %160 = load i32, ptr %54, align 4, !tbaa !8
  %161 = add nsw i32 %160, 1
  store i32 %161, ptr %54, align 4, !tbaa !8
  br label %134, !llvm.loop !26

162:                                              ; preds = %144
  store i32 1, ptr %49, align 4
  br label %306

163:                                              ; preds = %125
  call void @llvm.lifetime.start.p5(i64 4, ptr addrspace(5) %18) #22
  store i32 0, ptr %57, align 4, !tbaa !8
  call void @llvm.lifetime.start.p5(i64 4, ptr addrspace(5) %19) #22
  store i32 0, ptr %58, align 4, !tbaa !8
  call void @llvm.lifetime.start.p5(i64 4, ptr addrspace(5) %20) #22
  store i32 0, ptr %59, align 4, !tbaa !8
  call void @llvm.lifetime.start.p5(i64 16, ptr addrspace(5) %21) #22
  call void @llvm.lifetime.start.p5(i64 16, ptr addrspace(5) %22) #22
  call void @llvm.lifetime.start.p5(i64 16, ptr addrspace(5) %23) #22
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %63, ptr align 8 addrspacecast (ptr addrspace(1) @tex to ptr), i64 88, i1 false)
  %164 = load i32, ptr %51, align 4, !tbaa !8
  %165 = load i32, ptr %57, align 4, !tbaa !8
  %166 = add nsw i32 %164, %165
  %167 = getelementptr inbounds %struct.texture, ptr %63, i32 0, i32 0
  %168 = load %struct.textureReference, ptr %167, align 8
  %169 = call %struct.HIP_vector_type @_ZL10tex1DfetchI15HIP_vector_typeIfLj4EEL18hipTextureReadMode0EEN13__hip_tex_retIT_XT0_EbE4typeE7textureIS4_Li1EXT0_EEi(%struct.textureReference %168, i32 noundef %166) #27
  %170 = getelementptr inbounds %struct.HIP_vector_type, ptr %62, i32 0, i32 0
  %171 = extractvalue %struct.HIP_vector_type %169, 0
  store %struct.HIP_vector_base %171, ptr %170, align 16
  %172 = call noundef nonnull align 16 dereferenceable(16) ptr @_ZN15HIP_vector_typeIfLj4EEaSEOS0_(ptr noundef nonnull align 16 dereferenceable(16) %60, ptr noundef nonnull align 16 dereferenceable(16) %62) #27
  call void @llvm.lifetime.end.p5(i64 16, ptr addrspace(5) %23) #22
  call void @llvm.lifetime.start.p5(i64 16, ptr addrspace(5) %25) #22
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %65, ptr align 8 addrspacecast (ptr addrspace(1) @tex to ptr), i64 88, i1 false)
  %173 = load i32, ptr %52, align 4, !tbaa !8
  %174 = load i32, ptr %58, align 4, !tbaa !8
  %175 = add nsw i32 %173, %174
  %176 = getelementptr inbounds %struct.texture, ptr %65, i32 0, i32 0
  %177 = load %struct.textureReference, ptr %176, align 8
  %178 = call %struct.HIP_vector_type @_ZL10tex1DfetchI15HIP_vector_typeIfLj4EEL18hipTextureReadMode0EEN13__hip_tex_retIT_XT0_EbE4typeE7textureIS4_Li1EXT0_EEi(%struct.textureReference %177, i32 noundef %175) #27
  %179 = getelementptr inbounds %struct.HIP_vector_type, ptr %64, i32 0, i32 0
  %180 = extractvalue %struct.HIP_vector_type %178, 0
  store %struct.HIP_vector_base %180, ptr %179, align 16
  %181 = call noundef nonnull align 16 dereferenceable(16) ptr @_ZN15HIP_vector_typeIfLj4EEaSEOS0_(ptr noundef nonnull align 16 dereferenceable(16) %61, ptr noundef nonnull align 16 dereferenceable(16) %64) #27
  call void @llvm.lifetime.end.p5(i64 16, ptr addrspace(5) %25) #22
  br label %182

182:                                              ; preds = %298, %163
  br label %183

183:                                              ; preds = %182
  call void @llvm.lifetime.start.p5(i64 16, ptr addrspace(5) %27) #22
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %67, ptr align 8 addrspacecast (ptr addrspace(1) @tex to ptr), i64 88, i1 false)
  %184 = load i32, ptr %51, align 4, !tbaa !8
  %185 = load i32, ptr %57, align 4, !tbaa !8
  %186 = add nsw i32 %184, %185
  %187 = add nsw i32 %186, 1
  %188 = getelementptr inbounds %struct.texture, ptr %67, i32 0, i32 0
  %189 = load %struct.textureReference, ptr %188, align 8
  %190 = call %struct.HIP_vector_type @_ZL10tex1DfetchI15HIP_vector_typeIfLj4EEL18hipTextureReadMode0EEN13__hip_tex_retIT_XT0_EbE4typeE7textureIS4_Li1EXT0_EEi(%struct.textureReference %189, i32 noundef %187) #27
  %191 = getelementptr inbounds %struct.HIP_vector_type, ptr %66, i32 0, i32 0
  %192 = extractvalue %struct.HIP_vector_type %190, 0
  store %struct.HIP_vector_base %192, ptr %191, align 16
  call void @llvm.lifetime.start.p5(i64 16, ptr addrspace(5) %29) #22
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %69, ptr align 8 addrspacecast (ptr addrspace(1) @tex to ptr), i64 88, i1 false)
  %193 = load i32, ptr %52, align 4, !tbaa !8
  %194 = load i32, ptr %58, align 4, !tbaa !8
  %195 = add nsw i32 %193, %194
  %196 = add nsw i32 %195, 1
  %197 = getelementptr inbounds %struct.texture, ptr %69, i32 0, i32 0
  %198 = load %struct.textureReference, ptr %197, align 8
  %199 = call %struct.HIP_vector_type @_ZL10tex1DfetchI15HIP_vector_typeIfLj4EEL18hipTextureReadMode0EEN13__hip_tex_retIT_XT0_EbE4typeE7textureIS4_Li1EXT0_EEi(%struct.textureReference %198, i32 noundef %196) #27
  %200 = getelementptr inbounds %struct.HIP_vector_type, ptr %68, i32 0, i32 0
  %201 = extractvalue %struct.HIP_vector_type %199, 0
  store %struct.HIP_vector_base %201, ptr %200, align 16
  call void @llvm.lifetime.start.p5(i64 16, ptr addrspace(5) %31) #22
  call void @llvm.memcpy.p0.p0.i64(ptr align 16 %71, ptr align 16 %60, i64 16, i1 false)
  call void @llvm.memcpy.p0.p0.i64(ptr align 16 %72, ptr align 16 %61, i64 16, i1 false)
  %202 = getelementptr inbounds %struct.HIP_vector_type, ptr %71, i32 0, i32 0
  %203 = load %struct.HIP_vector_base, ptr %202, align 16
  %204 = getelementptr inbounds %struct.HIP_vector_type, ptr %72, i32 0, i32 0
  %205 = load %struct.HIP_vector_base, ptr %204, align 16
  %206 = call %struct.HIP_vector_type @_Z9getLowest15HIP_vector_typeIfLj4EES0_(%struct.HIP_vector_base %203, %struct.HIP_vector_base %205) #27
  %207 = getelementptr inbounds %struct.HIP_vector_type, ptr %70, i32 0, i32 0
  %208 = extractvalue %struct.HIP_vector_type %206, 0
  store %struct.HIP_vector_base %208, ptr %207, align 16
  call void @llvm.lifetime.start.p5(i64 16, ptr addrspace(5) %34) #22
  call void @llvm.memcpy.p0.p0.i64(ptr align 16 %74, ptr align 16 %60, i64 16, i1 false)
  call void @llvm.memcpy.p0.p0.i64(ptr align 16 %75, ptr align 16 %61, i64 16, i1 false)
  %209 = getelementptr inbounds %struct.HIP_vector_type, ptr %74, i32 0, i32 0
  %210 = load %struct.HIP_vector_base, ptr %209, align 16
  %211 = getelementptr inbounds %struct.HIP_vector_type, ptr %75, i32 0, i32 0
  %212 = load %struct.HIP_vector_base, ptr %211, align 16
  %213 = call %struct.HIP_vector_type @_Z10getHighest15HIP_vector_typeIfLj4EES0_(%struct.HIP_vector_base %210, %struct.HIP_vector_base %212) #27
  %214 = getelementptr inbounds %struct.HIP_vector_type, ptr %73, i32 0, i32 0
  %215 = extractvalue %struct.HIP_vector_type %213, 0
  store %struct.HIP_vector_base %215, ptr %214, align 16
  call void @llvm.lifetime.start.p5(i64 16, ptr addrspace(5) %37) #22
  call void @llvm.memcpy.p0.p0.i64(ptr align 16 %77, ptr align 16 %70, i64 16, i1 false)
  %216 = getelementptr inbounds %struct.HIP_vector_type, ptr %77, i32 0, i32 0
  %217 = load %struct.HIP_vector_base, ptr %216, align 16
  %218 = call %struct.HIP_vector_type @_Z8sortElem15HIP_vector_typeIfLj4EE(%struct.HIP_vector_base %217) #27
  %219 = getelementptr inbounds %struct.HIP_vector_type, ptr %76, i32 0, i32 0
  %220 = extractvalue %struct.HIP_vector_type %218, 0
  store %struct.HIP_vector_base %220, ptr %219, align 16
  %221 = call noundef nonnull align 16 dereferenceable(16) ptr @_ZN15HIP_vector_typeIfLj4EEaSEOS0_(ptr noundef nonnull align 16 dereferenceable(16) %60, ptr noundef nonnull align 16 dereferenceable(16) %76) #27
  call void @llvm.lifetime.end.p5(i64 16, ptr addrspace(5) %37) #22
  call void @llvm.lifetime.start.p5(i64 16, ptr addrspace(5) %39) #22
  call void @llvm.memcpy.p0.p0.i64(ptr align 16 %79, ptr align 16 %73, i64 16, i1 false)
  %222 = getelementptr inbounds %struct.HIP_vector_type, ptr %79, i32 0, i32 0
  %223 = load %struct.HIP_vector_base, ptr %222, align 16
  %224 = call %struct.HIP_vector_type @_Z8sortElem15HIP_vector_typeIfLj4EE(%struct.HIP_vector_base %223) #27
  %225 = getelementptr inbounds %struct.HIP_vector_type, ptr %78, i32 0, i32 0
  %226 = extractvalue %struct.HIP_vector_type %224, 0
  store %struct.HIP_vector_base %226, ptr %225, align 16
  %227 = call noundef nonnull align 16 dereferenceable(16) ptr @_ZN15HIP_vector_typeIfLj4EEaSEOS0_(ptr noundef nonnull align 16 dereferenceable(16) %61, ptr noundef nonnull align 16 dereferenceable(16) %78) #27
  call void @llvm.lifetime.end.p5(i64 16, ptr addrspace(5) %39) #22
  %228 = load ptr, ptr %53, align 8, !tbaa !4
  %229 = load i32, ptr %59, align 4, !tbaa !8
  %230 = add nsw i32 %229, 1
  store i32 %230, ptr %59, align 4, !tbaa !8
  %231 = sext i32 %229 to i64
  %232 = getelementptr inbounds %struct.HIP_vector_type, ptr %228, i64 %231
  %233 = call noundef nonnull align 16 dereferenceable(16) ptr @_ZN15HIP_vector_typeIfLj4EEaSERKS0_(ptr noundef nonnull align 16 dereferenceable(16) %232, ptr noundef nonnull align 16 dereferenceable(16) %60) #27
  call void @llvm.lifetime.start.p5(i64 1, ptr addrspace(5) %41) #22
  call void @llvm.lifetime.start.p5(i64 1, ptr addrspace(5) %42) #22
  %234 = load i32, ptr %57, align 4, !tbaa !8
  %235 = add nsw i32 %234, 1
  %236 = load i32, ptr %45, align 4, !tbaa !8
  %237 = sdiv i32 %236, 2
  %238 = icmp slt i32 %235, %237
  %239 = zext i1 %238 to i8
  store i8 %239, ptr %80, align 1, !tbaa !27
  %240 = load i32, ptr %58, align 4, !tbaa !8
  %241 = add nsw i32 %240, 1
  %242 = load i32, ptr %45, align 4, !tbaa !8
  %243 = sdiv i32 %242, 2
  %244 = icmp slt i32 %241, %243
  br i1 %244, label %245, label %256

245:                                              ; preds = %183
  %246 = load i32, ptr %52, align 4, !tbaa !8
  %247 = load i32, ptr %58, align 4, !tbaa !8
  %248 = add nsw i32 %246, %247
  %249 = add nsw i32 %248, 1
  %250 = load i32, ptr %48, align 4, !tbaa !8
  %251 = add nsw i32 %250, 1
  %252 = sext i32 %251 to i64
  %253 = getelementptr inbounds [1025 x i32], ptr addrspacecast (ptr addrspace(4) @constStartAddr to ptr), i64 0, i64 %252
  %254 = load i32, ptr %253, align 4, !tbaa !8
  %255 = icmp slt i32 %249, %254
  br label %256

256:                                              ; preds = %245, %183
  %257 = phi i1 [ false, %183 ], [ %255, %245 ]
  %258 = zext i1 %257 to i8
  store i8 %258, ptr %81, align 1, !tbaa !27
  %259 = load i8, ptr %80, align 1, !tbaa !27, !range !29
  %260 = trunc i8 %259 to i1
  br i1 %260, label %261, label %286

261:                                              ; preds = %256
  %262 = load i8, ptr %81, align 1, !tbaa !27, !range !29
  %263 = trunc i8 %262 to i1
  br i1 %263, label %264, label %281

264:                                              ; preds = %261
  %265 = getelementptr inbounds %struct.HIP_vector_base, ptr %66, i32 0, i32 0
  %266 = getelementptr inbounds %struct.anon, ptr %265, i32 0, i32 0
  %267 = load float, ptr %266, align 16, !tbaa !12
  %268 = getelementptr inbounds %struct.HIP_vector_base, ptr %68, i32 0, i32 0
  %269 = getelementptr inbounds %struct.anon, ptr %268, i32 0, i32 0
  %270 = load float, ptr %269, align 16, !tbaa !12
  %271 = fcmp contract olt float %267, %270
  br i1 %271, label %272, label %276

272:                                              ; preds = %264
  %273 = load i32, ptr %57, align 4, !tbaa !8
  %274 = add nsw i32 %273, 1
  store i32 %274, ptr %57, align 4, !tbaa !8
  %275 = call noundef nonnull align 16 dereferenceable(16) ptr @_ZN15HIP_vector_typeIfLj4EEaSERKS0_(ptr noundef nonnull align 16 dereferenceable(16) %60, ptr noundef nonnull align 16 dereferenceable(16) %66) #27
  br label %280

276:                                              ; preds = %264
  %277 = load i32, ptr %58, align 4, !tbaa !8
  %278 = add nsw i32 %277, 1
  store i32 %278, ptr %58, align 4, !tbaa !8
  %279 = call noundef nonnull align 16 dereferenceable(16) ptr @_ZN15HIP_vector_typeIfLj4EEaSERKS0_(ptr noundef nonnull align 16 dereferenceable(16) %60, ptr noundef nonnull align 16 dereferenceable(16) %68) #27
  br label %280

280:                                              ; preds = %276, %272
  br label %285

281:                                              ; preds = %261
  %282 = load i32, ptr %57, align 4, !tbaa !8
  %283 = add nsw i32 %282, 1
  store i32 %283, ptr %57, align 4, !tbaa !8
  %284 = call noundef nonnull align 16 dereferenceable(16) ptr @_ZN15HIP_vector_typeIfLj4EEaSERKS0_(ptr noundef nonnull align 16 dereferenceable(16) %60, ptr noundef nonnull align 16 dereferenceable(16) %66) #27
  br label %285

285:                                              ; preds = %281, %280
  br label %295

286:                                              ; preds = %256
  %287 = load i8, ptr %81, align 1, !tbaa !27, !range !29
  %288 = trunc i8 %287 to i1
  br i1 %288, label %289, label %293

289:                                              ; preds = %286
  %290 = load i32, ptr %58, align 4, !tbaa !8
  %291 = add nsw i32 %290, 1
  store i32 %291, ptr %58, align 4, !tbaa !8
  %292 = call noundef nonnull align 16 dereferenceable(16) ptr @_ZN15HIP_vector_typeIfLj4EEaSERKS0_(ptr noundef nonnull align 16 dereferenceable(16) %60, ptr noundef nonnull align 16 dereferenceable(16) %68) #27
  br label %294

293:                                              ; preds = %286
  store i32 6, ptr %49, align 4
  br label %296

294:                                              ; preds = %289
  br label %295

295:                                              ; preds = %294, %285
  store i32 0, ptr %49, align 4
  br label %296

296:                                              ; preds = %295, %293
  call void @llvm.lifetime.end.p5(i64 1, ptr addrspace(5) %42) #22
  call void @llvm.lifetime.end.p5(i64 1, ptr addrspace(5) %41) #22
  call void @llvm.lifetime.end.p5(i64 16, ptr addrspace(5) %34) #22
  call void @llvm.lifetime.end.p5(i64 16, ptr addrspace(5) %31) #22
  call void @llvm.lifetime.end.p5(i64 16, ptr addrspace(5) %29) #22
  call void @llvm.lifetime.end.p5(i64 16, ptr addrspace(5) %27) #22
  %297 = load i32, ptr %49, align 4
  switch i32 %297, label %310 [
    i32 0, label %298
    i32 6, label %299
  ]

298:                                              ; preds = %296
  br label %182, !llvm.loop !30

299:                                              ; preds = %296
  %300 = load ptr, ptr %53, align 8, !tbaa !4
  %301 = load i32, ptr %59, align 4, !tbaa !8
  %302 = add nsw i32 %301, 1
  store i32 %302, ptr %59, align 4, !tbaa !8
  %303 = sext i32 %301 to i64
  %304 = getelementptr inbounds %struct.HIP_vector_type, ptr %300, i64 %303
  %305 = call noundef nonnull align 16 dereferenceable(16) ptr @_ZN15HIP_vector_typeIfLj4EEaSERKS0_(ptr noundef nonnull align 16 dereferenceable(16) %304, ptr noundef nonnull align 16 dereferenceable(16) %61) #27
  call void @llvm.lifetime.end.p5(i64 16, ptr addrspace(5) %22) #22
  call void @llvm.lifetime.end.p5(i64 16, ptr addrspace(5) %21) #22
  call void @llvm.lifetime.end.p5(i64 4, ptr addrspace(5) %20) #22
  call void @llvm.lifetime.end.p5(i64 4, ptr addrspace(5) %19) #22
  call void @llvm.lifetime.end.p5(i64 4, ptr addrspace(5) %18) #22
  store i32 0, ptr %49, align 4
  br label %306

306:                                              ; preds = %299, %162, %124
  call void @llvm.lifetime.end.p5(i64 8, ptr addrspace(5) %14) #22
  call void @llvm.lifetime.end.p5(i64 4, ptr addrspace(5) %13) #22
  call void @llvm.lifetime.end.p5(i64 4, ptr addrspace(5) %12) #22
  call void @llvm.lifetime.end.p5(i64 4, ptr addrspace(5) %11) #22
  br label %307

307:                                              ; preds = %306, %94
  call void @llvm.lifetime.end.p5(i64 4, ptr addrspace(5) %9) #22
  call void @llvm.lifetime.end.p5(i64 4, ptr addrspace(5) %8) #22
  %308 = load i32, ptr %49, align 4
  switch i32 %308, label %310 [
    i32 0, label %309
    i32 1, label %309
  ]

309:                                              ; preds = %307, %307
  ret void

310:                                              ; preds = %307, %296
  unreachable
}

; Function Attrs: convergent nounwind
define linkonce_odr hidden noundef nonnull align 16 dereferenceable(16) ptr @_ZN15HIP_vector_typeIfLj4EEaSERKS0_(ptr noundef nonnull align 16 dereferenceable(16) %0, ptr noundef nonnull align 16 dereferenceable(16) %1) #8 comdat align 2 {
  %3 = alloca ptr, align 8, addrspace(5)
  %4 = alloca ptr, align 8, addrspace(5)
  %5 = alloca ptr, align 8, addrspace(5)
  %6 = addrspacecast ptr addrspace(5) %3 to ptr
  %7 = addrspacecast ptr addrspace(5) %4 to ptr
  %8 = addrspacecast ptr addrspace(5) %5 to ptr
  store ptr %0, ptr %7, align 8, !tbaa !4
  store ptr %1, ptr %8, align 8, !tbaa !4
  %9 = load ptr, ptr %7, align 8
  %10 = load ptr, ptr %8, align 8, !tbaa !4
  %11 = call noundef nonnull align 16 dereferenceable(16) ptr @_ZN15HIP_vector_baseIfLj4EEaSERKS0_(ptr noundef nonnull align 16 dereferenceable(16) %9, ptr noundef nonnull align 16 dereferenceable(16) %10) #27
  ret ptr %9
}

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z9mergepackPfS_(ptr addrspace(1) noundef %0, ptr addrspace(1) noundef %1) #9 {
  %3 = alloca ptr, align 8, addrspace(5)
  %4 = alloca ptr, align 8, addrspace(5)
  %5 = alloca ptr, align 8, addrspace(5)
  %6 = alloca ptr, align 8, addrspace(5)
  %7 = alloca i32, align 4, addrspace(5)
  %8 = alloca i32, align 4, addrspace(5)
  %9 = alloca i32, align 4, addrspace(5)
  %10 = addrspacecast ptr addrspace(5) %3 to ptr
  %11 = addrspacecast ptr addrspace(5) %4 to ptr
  %12 = addrspacecast ptr addrspace(5) %5 to ptr
  %13 = addrspacecast ptr addrspace(5) %6 to ptr
  %14 = addrspacecast ptr addrspace(5) %7 to ptr
  %15 = addrspacecast ptr addrspace(5) %8 to ptr
  %16 = addrspacecast ptr addrspace(5) %9 to ptr
  %17 = addrspacecast ptr addrspace(1) %0 to ptr
  store ptr %17, ptr %10, align 8
  %18 = load ptr, ptr %10, align 8, !tbaa !4
  %19 = addrspacecast ptr addrspace(1) %1 to ptr
  store ptr %19, ptr %11, align 8
  %20 = load ptr, ptr %11, align 8, !tbaa !4
  store ptr %18, ptr %12, align 8, !tbaa !4
  store ptr %20, ptr %13, align 8, !tbaa !4
  call void @llvm.lifetime.start.p5(i64 4, ptr addrspace(5) %7) #22
  %21 = call noundef i32 @_ZNK17__HIP_CoordinatesI14__HIP_BlockIdxE3__XcvjEv(ptr noundef nonnull align 1 dereferenceable(1) addrspacecast (ptr addrspace(4) @_ZN17__HIP_CoordinatesI14__HIP_BlockIdxE1xE to ptr)) #27
  %22 = call noundef i32 @_ZNK17__HIP_CoordinatesI14__HIP_BlockDimE3__XcvjEv(ptr noundef nonnull align 1 dereferenceable(1) addrspacecast (ptr addrspace(4) @_ZN17__HIP_CoordinatesI14__HIP_BlockDimE1xE to ptr)) #27
  %23 = mul i32 %21, %22
  %24 = call noundef i32 @_ZNK17__HIP_CoordinatesI15__HIP_ThreadIdxE3__XcvjEv(ptr noundef nonnull align 1 dereferenceable(1) addrspacecast (ptr addrspace(4) @_ZN17__HIP_CoordinatesI15__HIP_ThreadIdxE1xE to ptr)) #27
  %25 = add i32 %23, %24
  store i32 %25, ptr %14, align 4, !tbaa !8
  call void @llvm.lifetime.start.p5(i64 4, ptr addrspace(5) %8) #22
  %26 = call noundef i32 @_ZNK17__HIP_CoordinatesI14__HIP_BlockIdxE3__YcvjEv(ptr noundef nonnull align 1 dereferenceable(1) addrspacecast (ptr addrspace(4) @_ZN17__HIP_CoordinatesI14__HIP_BlockIdxE1yE to ptr)) #27
  store i32 %26, ptr %15, align 4, !tbaa !8
  %27 = load i32, ptr %15, align 4, !tbaa !8
  %28 = sext i32 %27 to i64
  %29 = getelementptr inbounds [1025 x i32], ptr addrspacecast (ptr addrspace(4) @finalStartAddr to ptr), i64 0, i64 %28
  %30 = load i32, ptr %29, align 4, !tbaa !8
  %31 = load i32, ptr %14, align 4, !tbaa !8
  %32 = add nsw i32 %30, %31
  %33 = load i32, ptr %15, align 4, !tbaa !8
  %34 = add nsw i32 %33, 1
  %35 = sext i32 %34 to i64
  %36 = getelementptr inbounds [1025 x i32], ptr addrspacecast (ptr addrspace(4) @finalStartAddr to ptr), i64 0, i64 %35
  %37 = load i32, ptr %36, align 4, !tbaa !8
  %38 = icmp sge i32 %32, %37
  br i1 %38, label %39, label %40

39:                                               ; preds = %2
  store i32 1, ptr %16, align 4
  br label %66

40:                                               ; preds = %2
  %41 = load ptr, ptr %12, align 8, !tbaa !4
  %42 = load i32, ptr %15, align 4, !tbaa !8
  %43 = sext i32 %42 to i64
  %44 = getelementptr inbounds [1025 x i32], ptr addrspacecast (ptr addrspace(4) @constStartAddr to ptr), i64 0, i64 %43
  %45 = load i32, ptr %44, align 4, !tbaa !8
  %46 = mul nsw i32 %45, 4
  %47 = load i32, ptr %15, align 4, !tbaa !8
  %48 = sext i32 %47 to i64
  %49 = getelementptr inbounds [1024 x i32], ptr addrspacecast (ptr addrspace(4) @nullElems to ptr), i64 0, i64 %48
  %50 = load i32, ptr %49, align 4, !tbaa !8
  %51 = add nsw i32 %46, %50
  %52 = load i32, ptr %14, align 4, !tbaa !8
  %53 = add nsw i32 %51, %52
  %54 = sext i32 %53 to i64
  %55 = getelementptr inbounds float, ptr %41, i64 %54
  %56 = load float, ptr %55, align 4, !tbaa !31
  %57 = load ptr, ptr %13, align 8, !tbaa !4
  %58 = load i32, ptr %15, align 4, !tbaa !8
  %59 = sext i32 %58 to i64
  %60 = getelementptr inbounds [1025 x i32], ptr addrspacecast (ptr addrspace(4) @finalStartAddr to ptr), i64 0, i64 %59
  %61 = load i32, ptr %60, align 4, !tbaa !8
  %62 = load i32, ptr %14, align 4, !tbaa !8
  %63 = add nsw i32 %61, %62
  %64 = sext i32 %63 to i64
  %65 = getelementptr inbounds float, ptr %57, i64 %64
  store float %56, ptr %65, align 4, !tbaa !31
  store i32 0, ptr %16, align 4
  br label %66

66:                                               ; preds = %40, %39
  call void @llvm.lifetime.end.p5(i64 4, ptr addrspace(5) %8) #22
  call void @llvm.lifetime.end.p5(i64 4, ptr addrspace(5) %7) #22
  %67 = load i32, ptr %16, align 4
  switch i32 %67, label %69 [
    i32 0, label %68
    i32 1, label %68
  ]

68:                                               ; preds = %66, %66
  ret void

69:                                               ; preds = %66
  unreachable
}

; Function Attrs: convergent mustprogress nounwind
define linkonce_odr hidden noundef i32 @_ZNK17__HIP_CoordinatesI14__HIP_BlockIdxE3__YcvjEv(ptr noundef nonnull align 1 dereferenceable(1) %0) #5 comdat align 2 {
  %2 = alloca i32, align 4, addrspace(5)
  %3 = alloca ptr, align 8, addrspace(5)
  %4 = alloca %struct.__HIP_BlockIdx, align 1, addrspace(5)
  %5 = addrspacecast ptr addrspace(5) %2 to ptr
  %6 = addrspacecast ptr addrspace(5) %3 to ptr
  %7 = addrspacecast ptr addrspace(5) %4 to ptr
  store ptr %0, ptr %6, align 8, !tbaa !4
  %8 = load ptr, ptr %6, align 8
  call void @llvm.lifetime.start.p5(i64 1, ptr addrspace(5) %4) #22
  %9 = call noundef i32 @_ZNK14__HIP_BlockIdxclEj(ptr noundef nonnull align 1 dereferenceable(1) %7, i32 noundef 1) #27
  call void @llvm.lifetime.end.p5(i64 1, ptr addrspace(5) %4) #22
  ret i32 %9
}

; Function Attrs: convergent mustprogress nounwind
define linkonce_odr hidden noundef nonnull align 16 dereferenceable(16) ptr @_ZN15HIP_vector_baseIfLj4EEaSERKS0_(ptr noundef nonnull align 16 dereferenceable(16) %0, ptr noundef nonnull align 16 dereferenceable(16) %1) #5 comdat align 2 {
  %3 = alloca ptr, align 8, addrspace(5)
  %4 = alloca ptr, align 8, addrspace(5)
  %5 = alloca ptr, align 8, addrspace(5)
  %6 = addrspacecast ptr addrspace(5) %3 to ptr
  %7 = addrspacecast ptr addrspace(5) %4 to ptr
  %8 = addrspacecast ptr addrspace(5) %5 to ptr
  store ptr %0, ptr %7, align 8, !tbaa !4
  store ptr %1, ptr %8, align 8, !tbaa !4
  %9 = load ptr, ptr %7, align 8
  %10 = load ptr, ptr %8, align 8, !tbaa !4
  %11 = getelementptr inbounds %struct.HIP_vector_base, ptr %10, i32 0, i32 0
  %12 = load <4 x float>, ptr %11, align 16, !tbaa !12
  %13 = getelementptr inbounds %struct.HIP_vector_base, ptr %9, i32 0, i32 0
  store <4 x float> %12, ptr %13, align 16, !tbaa !12
  ret ptr %9
}

; Function Attrs: convergent mustprogress nounwind
define linkonce_odr hidden noundef i32 @_ZNK14__HIP_BlockIdxclEj(ptr noundef nonnull align 1 dereferenceable(1) %0, i32 noundef %1) #5 comdat align 2 {
  %3 = alloca i32, align 4, addrspace(5)
  %4 = alloca ptr, align 8, addrspace(5)
  %5 = alloca i32, align 4, addrspace(5)
  %6 = addrspacecast ptr addrspace(5) %3 to ptr
  %7 = addrspacecast ptr addrspace(5) %4 to ptr
  %8 = addrspacecast ptr addrspace(5) %5 to ptr
  store ptr %0, ptr %7, align 8, !tbaa !4
  store i32 %1, ptr %8, align 4, !tbaa !8
  %9 = load ptr, ptr %7, align 8
  %10 = load i32, ptr %8, align 4, !tbaa !8
  %11 = call i64 @__ockl_get_group_id(i32 noundef %10) #18
  %12 = trunc i64 %11 to i32
  ret i32 %12
}

; Function Attrs: convergent mustprogress nounwind
define linkonce_odr hidden noundef i32 @_ZNK14__HIP_BlockDimclEj(ptr noundef nonnull align 1 dereferenceable(1) %0, i32 noundef %1) #5 comdat align 2 {
  %3 = alloca i32, align 4, addrspace(5)
  %4 = alloca ptr, align 8, addrspace(5)
  %5 = alloca i32, align 4, addrspace(5)
  %6 = addrspacecast ptr addrspace(5) %3 to ptr
  %7 = addrspacecast ptr addrspace(5) %4 to ptr
  %8 = addrspacecast ptr addrspace(5) %5 to ptr
  store ptr %0, ptr %7, align 8, !tbaa !4
  store i32 %1, ptr %8, align 4, !tbaa !8
  %9 = load ptr, ptr %7, align 8
  %10 = load i32, ptr %8, align 4, !tbaa !8
  %11 = call i64 @__ockl_get_local_size(i32 noundef %10) #18
  %12 = trunc i64 %11 to i32
  ret i32 %12
}

; Function Attrs: convergent mustprogress nounwind
define linkonce_odr hidden noundef i32 @_ZNK15__HIP_ThreadIdxclEj(ptr noundef nonnull align 1 dereferenceable(1) %0, i32 noundef %1) #5 comdat align 2 {
  %3 = alloca i32, align 4, addrspace(5)
  %4 = alloca ptr, align 8, addrspace(5)
  %5 = alloca i32, align 4, addrspace(5)
  %6 = addrspacecast ptr addrspace(5) %3 to ptr
  %7 = addrspacecast ptr addrspace(5) %4 to ptr
  %8 = addrspacecast ptr addrspace(5) %5 to ptr
  store ptr %0, ptr %7, align 8, !tbaa !4
  store i32 %1, ptr %8, align 4, !tbaa !8
  %9 = load ptr, ptr %7, align 8
  %10 = load i32, ptr %8, align 4, !tbaa !8
  %11 = call i64 @__ockl_get_local_id(i32 noundef %10) #18
  %12 = trunc i64 %11 to i32
  ret i32 %12
}

; Function Attrs: alwaysinline convergent mustprogress nounwind
define linkonce_odr hidden %struct.HIP_vector_type @_Z7mapFromI15HIP_vector_typeIfLj4EEDv4_fENSt9enable_ifIXooooooeqstT_stNS4_10value_typeEsr3std7is_sameIS5_iEE5valuesr3std7is_sameIS5_jEE5valuesr3std7is_sameIS5_fEE5valueEKS4_E4typeERKT0_(ptr noundef nonnull align 16 dereferenceable(16) %0) #10 comdat {
  %2 = alloca %struct.HIP_vector_type, align 16, addrspace(5)
  %3 = alloca ptr, align 8, addrspace(5)
  %4 = alloca %union.anon.3, align 16, addrspace(5)
  %5 = alloca i32, align 4, addrspace(5)
  %6 = addrspacecast ptr addrspace(5) %2 to ptr
  %7 = addrspacecast ptr addrspace(5) %3 to ptr
  %8 = addrspacecast ptr addrspace(5) %4 to ptr
  store ptr %0, ptr %7, align 8, !tbaa !4
  call void @llvm.lifetime.start.p5(i64 16, ptr addrspace(5) %4) #22
  %9 = load ptr, ptr %7, align 8, !tbaa !4
  %10 = load <4 x float>, ptr %9, align 16, !tbaa !12
  store <4 x float> %10, ptr %8, align 16, !tbaa !12
  call void @llvm.memcpy.p0.p0.i64(ptr align 16 %6, ptr align 16 %8, i64 16, i1 false)
  call void @llvm.lifetime.end.p5(i64 16, ptr addrspace(5) %4) #22
  %11 = load %struct.HIP_vector_type, ptr %6, align 16
  ret %struct.HIP_vector_type %11
}

; Function Attrs: convergent mustprogress nofree norecurse nounwind readonly willreturn
define internal <4 x float> @__ockl_image_load_1Db(ptr addrspace(4) nocapture noundef readonly %0, i32 noundef %1) #11 {
  %3 = load <4 x i32>, ptr addrspace(4) %0, align 16, !tbaa !32
  %4 = tail call <4 x float> @llvm.amdgcn.struct.buffer.load.format.v4f32(<4 x i32> noundef %3, i32 noundef %1, i32 noundef 0, i32 noundef 0, i32 noundef 0) #28
  ret <4 x float> %4
}

; Function Attrs: nounwind readonly willreturn
declare <4 x float> @llvm.amdgcn.struct.buffer.load.format.v4f32(<4 x i32>, i32, i32, i32, i32 immarg) #12

; Function Attrs: convergent norecurse nounwind
define internal i64 @__ockl_fprintf_stderr_begin() #13 {
  %1 = tail call <2 x i64> @__ockl_hostcall_preview(i32 noundef 2, i64 noundef 33, i64 noundef 1, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #27
  %2 = extractelement <2 x i64> %1, i64 0
  ret i64 %2
}

; Function Attrs: convergent norecurse nounwind
define internal <2 x i64> @__ockl_hostcall_preview(i32 noundef %0, i64 noundef %1, i64 noundef %2, i64 noundef %3, i64 noundef %4, i64 noundef %5, i64 noundef %6, i64 noundef %7, i64 noundef %8) local_unnamed_addr #13 {
  %10 = load i32, ptr addrspace(4) @__oclc_ABI_version, align 4, !tbaa !35
  %11 = icmp slt i32 %10, 500
  %12 = tail call ptr addrspace(4) @llvm.amdgcn.implicitarg.ptr()
  %13 = select i1 %11, i64 3, i64 10
  %14 = getelementptr inbounds i64, ptr addrspace(4) %12, i64 %13
  %15 = load i64, ptr addrspace(4) %14, align 8, !tbaa !37
  %16 = inttoptr i64 %15 to ptr addrspace(1)
  %17 = addrspacecast ptr addrspace(1) %16 to ptr
  %18 = tail call <2 x i64> @__ockl_hostcall_internal(ptr noundef %17, i32 noundef %0, i64 noundef %1, i64 noundef %2, i64 noundef %3, i64 noundef %4, i64 noundef %5, i64 noundef %6, i64 noundef %7, i64 noundef %8) #27
  ret <2 x i64> %18
}

; Function Attrs: nounwind readnone speculatable willreturn
declare align 4 ptr addrspace(4) @llvm.amdgcn.implicitarg.ptr() #14

; Function Attrs: convergent noinline norecurse nounwind optnone
define internal <2 x i64> @__ockl_hostcall_internal(ptr noundef %0, i32 noundef %1, i64 noundef %2, i64 noundef %3, i64 noundef %4, i64 noundef %5, i64 noundef %6, i64 noundef %7, i64 noundef %8, i64 noundef %9) local_unnamed_addr #15 {
  %11 = alloca ptr, align 8, addrspace(5)
  %12 = alloca i32, align 4, addrspace(5)
  %13 = alloca i64, align 8, addrspace(5)
  %14 = alloca i64, align 8, addrspace(5)
  %15 = alloca i64, align 8, addrspace(5)
  %16 = alloca i64, align 8, addrspace(5)
  %17 = alloca i64, align 8, addrspace(5)
  %18 = alloca i64, align 8, addrspace(5)
  %19 = alloca i64, align 8, addrspace(5)
  %20 = alloca i64, align 8, addrspace(5)
  %21 = alloca i32, align 4, addrspace(5)
  %22 = alloca i32, align 4, addrspace(5)
  %23 = alloca ptr addrspace(1), align 8, addrspace(5)
  %24 = alloca i64, align 8, addrspace(5)
  %25 = alloca ptr addrspace(1), align 8, addrspace(5)
  %26 = alloca ptr addrspace(1), align 8, addrspace(5)
  %27 = alloca <2 x i64>, align 16, addrspace(5)
  store ptr %0, ptr addrspace(5) %11, align 8, !tbaa !39
  store i32 %1, ptr addrspace(5) %12, align 4, !tbaa !35
  store i64 %2, ptr addrspace(5) %13, align 8, !tbaa !37
  store i64 %3, ptr addrspace(5) %14, align 8, !tbaa !37
  store i64 %4, ptr addrspace(5) %15, align 8, !tbaa !37
  store i64 %5, ptr addrspace(5) %16, align 8, !tbaa !37
  store i64 %6, ptr addrspace(5) %17, align 8, !tbaa !37
  store i64 %7, ptr addrspace(5) %18, align 8, !tbaa !37
  store i64 %8, ptr addrspace(5) %19, align 8, !tbaa !37
  store i64 %9, ptr addrspace(5) %20, align 8, !tbaa !37
  call void @llvm.lifetime.start.p5(i64 4, ptr addrspace(5) %21) #22
  %28 = call i32 @__ockl_lane_u32() #29
  store i32 %28, ptr addrspace(5) %21, align 4, !tbaa !35
  %29 = load i32, ptr addrspace(5) %21, align 4, !tbaa !35
  %30 = call fastcc i32 @0(i32 noundef %29) #29
  store i32 %30, ptr addrspace(5) %21, align 4, !tbaa !35
  call void @llvm.lifetime.start.p5(i64 4, ptr addrspace(5) %22) #22
  %31 = load i32, ptr addrspace(5) %21, align 4, !tbaa !35
  %32 = call i32 @llvm.amdgcn.readfirstlane(i32 %31)
  store i32 %32, ptr addrspace(5) %22, align 4, !tbaa !35
  call void @llvm.lifetime.start.p5(i64 8, ptr addrspace(5) %23) #22
  %33 = load ptr, ptr addrspace(5) %11, align 8, !tbaa !39
  %34 = addrspacecast ptr %33 to ptr addrspace(1)
  store ptr addrspace(1) %34, ptr addrspace(5) %23, align 8, !tbaa !39
  call void @llvm.lifetime.start.p5(i64 8, ptr addrspace(5) %24) #22
  %35 = load ptr addrspace(1), ptr addrspace(5) %23, align 8, !tbaa !39
  %36 = load i32, ptr addrspace(5) %21, align 4, !tbaa !35
  %37 = load i32, ptr addrspace(5) %22, align 4, !tbaa !35
  %38 = call fastcc i64 @1(ptr addrspace(1) noundef %35, i32 noundef %36, i32 noundef %37) #29
  store i64 %38, ptr addrspace(5) %24, align 8, !tbaa !37
  call void @llvm.lifetime.start.p5(i64 8, ptr addrspace(5) %25) #22
  %39 = load ptr addrspace(1), ptr addrspace(5) %23, align 8, !tbaa !39
  %40 = load i64, ptr addrspace(5) %24, align 8, !tbaa !37
  %41 = load ptr addrspace(1), ptr addrspace(1) %39, align 8, !tbaa !41
  %42 = getelementptr i8, ptr addrspace(1) %39, i64 40
  %43 = load i64, ptr addrspace(1) %42, align 8, !tbaa !44
  %44 = call fastcc ptr addrspace(1) @2(ptr addrspace(1) %41, i64 %43, i64 noundef %40) #29
  store ptr addrspace(1) %44, ptr addrspace(5) %25, align 8, !tbaa !39
  call void @llvm.lifetime.start.p5(i64 8, ptr addrspace(5) %26) #22
  %45 = load ptr addrspace(1), ptr addrspace(5) %23, align 8, !tbaa !39
  %46 = load i64, ptr addrspace(5) %24, align 8, !tbaa !37
  %47 = getelementptr i8, ptr addrspace(1) %45, i64 8
  %48 = load ptr addrspace(1), ptr addrspace(1) %47, align 8, !tbaa !45
  %49 = getelementptr i8, ptr addrspace(1) %45, i64 40
  %50 = load i64, ptr addrspace(1) %49, align 8, !tbaa !44
  %51 = call fastcc ptr addrspace(1) @3(ptr addrspace(1) %48, i64 %50, i64 noundef %46) #29
  store ptr addrspace(1) %51, ptr addrspace(5) %26, align 8, !tbaa !39
  %52 = load ptr addrspace(1), ptr addrspace(5) %25, align 8, !tbaa !39
  %53 = load ptr addrspace(1), ptr addrspace(5) %26, align 8, !tbaa !39
  %54 = load i32, ptr addrspace(5) %12, align 4, !tbaa !35
  %55 = load i64, ptr addrspace(5) %13, align 8, !tbaa !37
  %56 = load i64, ptr addrspace(5) %14, align 8, !tbaa !37
  %57 = load i64, ptr addrspace(5) %15, align 8, !tbaa !37
  %58 = load i64, ptr addrspace(5) %16, align 8, !tbaa !37
  %59 = load i64, ptr addrspace(5) %17, align 8, !tbaa !37
  %60 = load i64, ptr addrspace(5) %18, align 8, !tbaa !37
  %61 = load i64, ptr addrspace(5) %19, align 8, !tbaa !37
  %62 = load i64, ptr addrspace(5) %20, align 8, !tbaa !37
  %63 = load i32, ptr addrspace(5) %21, align 4, !tbaa !35
  %64 = load i32, ptr addrspace(5) %22, align 4, !tbaa !35
  call fastcc void @4(ptr addrspace(1) noundef %52, ptr addrspace(1) noundef %53, i32 noundef %54, i64 noundef %55, i64 noundef %56, i64 noundef %57, i64 noundef %58, i64 noundef %59, i64 noundef %60, i64 noundef %61, i64 noundef %62, i32 noundef %63, i32 noundef %64) #29
  %65 = load ptr addrspace(1), ptr addrspace(5) %23, align 8, !tbaa !39
  %66 = load i64, ptr addrspace(5) %24, align 8, !tbaa !37
  %67 = load i32, ptr addrspace(5) %21, align 4, !tbaa !35
  %68 = load i32, ptr addrspace(5) %22, align 4, !tbaa !35
  call fastcc void @5(ptr addrspace(1) noundef %65, i64 noundef %66, i32 noundef %67, i32 noundef %68) #29
  call void @llvm.lifetime.start.p5(i64 16, ptr addrspace(5) %27) #22
  %69 = load ptr addrspace(1), ptr addrspace(5) %25, align 8, !tbaa !39
  %70 = load ptr addrspace(1), ptr addrspace(5) %26, align 8, !tbaa !39
  %71 = load i32, ptr addrspace(5) %21, align 4, !tbaa !35
  %72 = load i32, ptr addrspace(5) %22, align 4, !tbaa !35
  %73 = call fastcc <2 x i64> @6(ptr addrspace(1) noundef %69, ptr addrspace(1) noundef %70, i32 noundef %71, i32 noundef %72) #29
  store <2 x i64> %73, ptr addrspace(5) %27, align 16, !tbaa !32
  %74 = load ptr addrspace(1), ptr addrspace(5) %23, align 8, !tbaa !39
  %75 = load i64, ptr addrspace(5) %24, align 8, !tbaa !37
  %76 = load i32, ptr addrspace(5) %21, align 4, !tbaa !35
  %77 = load i32, ptr addrspace(5) %22, align 4, !tbaa !35
  call fastcc void @7(ptr addrspace(1) noundef %74, i64 noundef %75, i32 noundef %76, i32 noundef %77) #29
  %78 = load <2 x i64>, ptr addrspace(5) %27, align 16, !tbaa !32
  call void @llvm.lifetime.end.p5(i64 16, ptr addrspace(5) %27) #22
  call void @llvm.lifetime.end.p5(i64 8, ptr addrspace(5) %26) #22
  call void @llvm.lifetime.end.p5(i64 8, ptr addrspace(5) %25) #22
  call void @llvm.lifetime.end.p5(i64 8, ptr addrspace(5) %24) #22
  call void @llvm.lifetime.end.p5(i64 8, ptr addrspace(5) %23) #22
  call void @llvm.lifetime.end.p5(i64 4, ptr addrspace(5) %22) #22
  call void @llvm.lifetime.end.p5(i64 4, ptr addrspace(5) %21) #22
  ret <2 x i64> %78
}

; Function Attrs: alwaysinline convergent mustprogress nofree norecurse nosync nounwind readnone willreturn
define internal i32 @__ockl_lane_u32() local_unnamed_addr #16 {
  %1 = load i8, ptr addrspace(4) @__oclc_wavefrontsize64, align 1, !tbaa !46, !range !29
  %2 = icmp eq i8 %1, 0
  %3 = tail call i32 @llvm.amdgcn.mbcnt.lo(i32 -1, i32 0)
  br i1 %2, label %6, label %4

4:                                                ; preds = %0
  %5 = tail call i32 @llvm.amdgcn.mbcnt.hi(i32 -1, i32 %3)
  br label %6

6:                                                ; preds = %4, %0
  %7 = phi i32 [ %5, %4 ], [ %3, %0 ]
  ret i32 %7
}

; Function Attrs: convergent norecurse nounwind
define internal fastcc i32 @0(i32 noundef %0) unnamed_addr #17 {
  %2 = tail call i32 asm sideeffect "; ockl readfirstlane hoisting hack $0", "=v,0"(i32 %0) #27, !srcloc !48
  ret i32 %2
}

; Function Attrs: convergent nounwind readnone willreturn
declare i32 @llvm.amdgcn.readfirstlane(i32) #18

; Function Attrs: convergent norecurse nounwind
define internal fastcc i64 @1(ptr addrspace(1) nocapture noundef %0, i32 noundef %1, i32 noundef %2) unnamed_addr #17 {
  %4 = icmp eq i32 %1, %2
  br i1 %4, label %5, label %29

5:                                                ; preds = %3
  %6 = getelementptr inbounds %0, ptr addrspace(1) %0, i64 0, i32 3
  %7 = load atomic i64, ptr addrspace(1) %6 syncscope("one-as") acquire, align 8
  %8 = getelementptr i8, ptr addrspace(1) %0, i64 40
  %9 = load ptr addrspace(1), ptr addrspace(1) %0, align 8, !tbaa !41
  %10 = load i64, ptr addrspace(1) %8, align 8, !tbaa !44
  %11 = and i64 %10, %7
  %12 = getelementptr inbounds %2, ptr addrspace(1) %9, i64 %11
  %13 = load atomic i64, ptr addrspace(1) %12 syncscope("one-as") monotonic, align 8
  %14 = cmpxchg ptr addrspace(1) %6, i64 %7, i64 %13 syncscope("one-as") acquire monotonic, align 8
  %15 = extractvalue { i64, i1 } %14, 1
  br i1 %15, label %26, label %16

16:                                               ; preds = %16, %5
  %17 = phi { i64, i1 } [ %24, %16 ], [ %14, %5 ]
  %18 = extractvalue { i64, i1 } %17, 0
  tail call void @llvm.amdgcn.s.sleep(i32 1)
  %19 = load ptr addrspace(1), ptr addrspace(1) %0, align 8, !tbaa !41
  %20 = load i64, ptr addrspace(1) %8, align 8, !tbaa !44
  %21 = and i64 %20, %18
  %22 = getelementptr inbounds %2, ptr addrspace(1) %19, i64 %21
  %23 = load atomic i64, ptr addrspace(1) %22 syncscope("one-as") monotonic, align 8
  %24 = cmpxchg ptr addrspace(1) %6, i64 %18, i64 %23 syncscope("one-as") acquire monotonic, align 8
  %25 = extractvalue { i64, i1 } %24, 1
  br i1 %25, label %26, label %16

26:                                               ; preds = %16, %5
  %27 = phi { i64, i1 } [ %14, %5 ], [ %24, %16 ]
  %28 = extractvalue { i64, i1 } %27, 0
  br label %29

29:                                               ; preds = %26, %3
  %30 = phi i64 [ %28, %26 ], [ 0, %3 ]
  %31 = trunc i64 %30 to i32
  %32 = lshr i64 %30, 32
  %33 = trunc i64 %32 to i32
  %34 = tail call i32 @llvm.amdgcn.readfirstlane(i32 %31)
  %35 = tail call i32 @llvm.amdgcn.readfirstlane(i32 %33)
  %36 = zext i32 %35 to i64
  %37 = shl nuw i64 %36, 32
  %38 = zext i32 %34 to i64
  %39 = or i64 %37, %38
  ret i64 %39
}

; Function Attrs: argmemonly convergent mustprogress nofree norecurse nosync nounwind readonly willreturn
define internal fastcc ptr addrspace(1) @2(ptr addrspace(1) %0, i64 %1, i64 noundef %2) unnamed_addr #19 {
  %4 = and i64 %2, %1
  %5 = getelementptr inbounds %2, ptr addrspace(1) %0, i64 %4
  ret ptr addrspace(1) %5
}

; Function Attrs: argmemonly convergent mustprogress nofree norecurse nosync nounwind readonly willreturn
define internal fastcc ptr addrspace(1) @3(ptr addrspace(1) %0, i64 %1, i64 noundef %2) unnamed_addr #19 {
  %4 = and i64 %2, %1
  %5 = getelementptr inbounds %3, ptr addrspace(1) %0, i64 %4
  ret ptr addrspace(1) %5
}

; Function Attrs: convergent mustprogress nofree norecurse nounwind willreturn
define internal fastcc void @4(ptr addrspace(1) nocapture noundef writeonly %0, ptr addrspace(1) nocapture noundef writeonly %1, i32 noundef %2, i64 noundef %3, i64 noundef %4, i64 noundef %5, i64 noundef %6, i64 noundef %7, i64 noundef %8, i64 noundef %9, i64 noundef %10, i32 noundef %11, i32 noundef %12) unnamed_addr #20 {
  %14 = tail call i64 @llvm.read_register.i64(metadata !49) #29
  %15 = icmp eq i32 %11, %12
  br i1 %15, label %16, label %20

16:                                               ; preds = %13
  %17 = getelementptr inbounds %2, ptr addrspace(1) %0, i64 0, i32 3
  %18 = getelementptr inbounds %2, ptr addrspace(1) %0, i64 0, i32 1
  %19 = getelementptr inbounds %2, ptr addrspace(1) %0, i64 0, i32 2
  store i32 %2, ptr addrspace(1) %19, align 8, !tbaa !50
  store i64 %14, ptr addrspace(1) %18, align 8, !tbaa !52
  store i32 1, ptr addrspace(1) %17, align 4, !tbaa !53
  br label %20

20:                                               ; preds = %16, %13
  %21 = zext i32 %11 to i64
  %22 = getelementptr inbounds [64 x [8 x i64]], ptr addrspace(1) %1, i64 0, i64 %21
  store i64 %3, ptr addrspace(1) %22, align 8, !tbaa !37
  %23 = getelementptr inbounds i64, ptr addrspace(1) %22, i64 1
  store i64 %4, ptr addrspace(1) %23, align 8, !tbaa !37
  %24 = getelementptr inbounds i64, ptr addrspace(1) %22, i64 2
  store i64 %5, ptr addrspace(1) %24, align 8, !tbaa !37
  %25 = getelementptr inbounds i64, ptr addrspace(1) %22, i64 3
  store i64 %6, ptr addrspace(1) %25, align 8, !tbaa !37
  %26 = getelementptr inbounds i64, ptr addrspace(1) %22, i64 4
  store i64 %7, ptr addrspace(1) %26, align 8, !tbaa !37
  %27 = getelementptr inbounds i64, ptr addrspace(1) %22, i64 5
  store i64 %8, ptr addrspace(1) %27, align 8, !tbaa !37
  %28 = getelementptr inbounds i64, ptr addrspace(1) %22, i64 6
  store i64 %9, ptr addrspace(1) %28, align 8, !tbaa !37
  %29 = getelementptr inbounds i64, ptr addrspace(1) %22, i64 7
  store i64 %10, ptr addrspace(1) %29, align 8, !tbaa !37
  ret void
}

; Function Attrs: convergent norecurse nounwind
define internal fastcc void @5(ptr addrspace(1) nocapture noundef %0, i64 noundef %1, i32 noundef %2, i32 noundef %3) unnamed_addr #17 {
  %5 = icmp eq i32 %2, %3
  br i1 %5, label %6, label %24

6:                                                ; preds = %4
  %7 = getelementptr inbounds %0, ptr addrspace(1) %0, i64 0, i32 4
  %8 = load atomic i64, ptr addrspace(1) %7 syncscope("one-as") monotonic, align 8
  %9 = load ptr addrspace(1), ptr addrspace(1) %0, align 8, !tbaa !41
  %10 = getelementptr i8, ptr addrspace(1) %0, i64 40
  %11 = load i64, ptr addrspace(1) %10, align 8, !tbaa !44
  %12 = and i64 %11, %1
  %13 = getelementptr inbounds %2, ptr addrspace(1) %9, i64 %12
  store i64 %8, ptr addrspace(1) %13, align 8, !tbaa !54
  %14 = cmpxchg ptr addrspace(1) %7, i64 %8, i64 %1 syncscope("one-as") release monotonic, align 8
  %15 = extractvalue { i64, i1 } %14, 1
  br i1 %15, label %21, label %16

16:                                               ; preds = %16, %6
  %17 = phi { i64, i1 } [ %19, %16 ], [ %14, %6 ]
  %18 = extractvalue { i64, i1 } %17, 0
  tail call void @llvm.amdgcn.s.sleep(i32 1)
  store i64 %18, ptr addrspace(1) %13, align 8, !tbaa !54
  %19 = cmpxchg ptr addrspace(1) %7, i64 %18, i64 %1 syncscope("one-as") release monotonic, align 8
  %20 = extractvalue { i64, i1 } %19, 1
  br i1 %20, label %21, label %16

21:                                               ; preds = %16, %6
  %22 = getelementptr inbounds %0, ptr addrspace(1) %0, i64 0, i32 2
  %23 = load i64, ptr addrspace(1) %22, align 8
  tail call void @__ockl_hsa_signal_add(i64 %23, i64 noundef 1, i32 noundef 3) #27
  br label %24

24:                                               ; preds = %21, %4
  ret void
}

; Function Attrs: convergent norecurse nounwind
define internal fastcc <2 x i64> @6(ptr addrspace(1) nocapture noundef readonly %0, ptr addrspace(1) nocapture noundef readonly %1, i32 noundef %2, i32 noundef %3) unnamed_addr #13 {
  %5 = icmp eq i32 %2, %3
  %6 = getelementptr inbounds %2, ptr addrspace(1) %0, i64 0, i32 3
  br label %7

7:                                                ; preds = %15, %4
  br i1 %5, label %8, label %11

8:                                                ; preds = %7
  %9 = load atomic i32, ptr addrspace(1) %6 syncscope("one-as") acquire, align 4
  %10 = and i32 %9, 1
  br label %11

11:                                               ; preds = %8, %7
  %12 = phi i32 [ %10, %8 ], [ 1, %7 ]
  %13 = tail call i32 @llvm.amdgcn.readfirstlane(i32 %12)
  %14 = icmp eq i32 %13, 0
  br i1 %14, label %16, label %15

15:                                               ; preds = %11
  tail call void @llvm.amdgcn.s.sleep(i32 1)
  br label %7

16:                                               ; preds = %11
  %17 = zext i32 %2 to i64
  %18 = getelementptr inbounds [8 x i64], ptr addrspace(1) %1, i64 %17
  %19 = getelementptr inbounds i64, ptr addrspace(1) %18, i64 1
  %20 = load i64, ptr addrspace(1) %18, align 8, !tbaa !37
  %21 = load i64, ptr addrspace(1) %19, align 8, !tbaa !37
  %22 = insertelement <2 x i64> undef, i64 %20, i64 0
  %23 = insertelement <2 x i64> %22, i64 %21, i64 1
  ret <2 x i64> %23
}

; Function Attrs: convergent norecurse nounwind
define internal fastcc void @7(ptr addrspace(1) nocapture noundef %0, i64 noundef %1, i32 noundef %2, i32 noundef %3) unnamed_addr #17 {
  %5 = icmp eq i32 %2, %3
  br i1 %5, label %6, label %25

6:                                                ; preds = %4
  %7 = getelementptr %0, ptr addrspace(1) %0, i64 0, i32 5
  %8 = load i64, ptr addrspace(1) %7, align 8, !tbaa !44
  %9 = add i64 %8, 1
  %10 = add i64 %9, %1
  %11 = icmp eq i64 %10, 0
  %12 = select i1 %11, i64 %9, i64 %10
  %13 = getelementptr inbounds %0, ptr addrspace(1) %0, i64 0, i32 3
  %14 = load atomic i64, ptr addrspace(1) %13 syncscope("one-as") monotonic, align 8
  %15 = load ptr addrspace(1), ptr addrspace(1) %0, align 8, !tbaa !41
  %16 = and i64 %12, %8
  %17 = getelementptr inbounds %2, ptr addrspace(1) %15, i64 %16
  store i64 %14, ptr addrspace(1) %17, align 8, !tbaa !54
  %18 = cmpxchg ptr addrspace(1) %13, i64 %14, i64 %12 syncscope("one-as") release monotonic, align 8
  %19 = extractvalue { i64, i1 } %18, 1
  br i1 %19, label %25, label %20

20:                                               ; preds = %20, %6
  %21 = phi { i64, i1 } [ %23, %20 ], [ %18, %6 ]
  %22 = extractvalue { i64, i1 } %21, 0
  tail call void @llvm.amdgcn.s.sleep(i32 1)
  store i64 %22, ptr addrspace(1) %17, align 8, !tbaa !54
  %23 = cmpxchg ptr addrspace(1) %13, i64 %22, i64 %12 syncscope("one-as") release monotonic, align 8
  %24 = extractvalue { i64, i1 } %23, 1
  br i1 %24, label %25, label %20

25:                                               ; preds = %20, %6, %4
  ret void
}

; Function Attrs: nounwind willreturn
declare void @llvm.amdgcn.s.sleep(i32 immarg) #21

; Function Attrs: convergent norecurse nounwind
define internal void @__ockl_hsa_signal_add(i64 %0, i64 noundef %1, i32 noundef %2) local_unnamed_addr #17 {
  %4 = inttoptr i64 %0 to ptr addrspace(1)
  %5 = getelementptr inbounds %4, ptr addrspace(1) %4, i64 0, i32 1
  switch i32 %2, label %6 [
    i32 1, label %8
    i32 2, label %8
    i32 3, label %10
    i32 4, label %12
    i32 5, label %14
  ]

6:                                                ; preds = %3
  %7 = atomicrmw add ptr addrspace(1) %5, i64 %1 syncscope("one-as") monotonic, align 8
  br label %16

8:                                                ; preds = %3, %3
  %9 = atomicrmw add ptr addrspace(1) %5, i64 %1 syncscope("one-as") acquire, align 8
  br label %16

10:                                               ; preds = %3
  %11 = atomicrmw add ptr addrspace(1) %5, i64 %1 syncscope("one-as") release, align 8
  br label %16

12:                                               ; preds = %3
  %13 = atomicrmw add ptr addrspace(1) %5, i64 %1 syncscope("one-as") acq_rel, align 8
  br label %16

14:                                               ; preds = %3
  %15 = atomicrmw add ptr addrspace(1) %5, i64 %1 seq_cst, align 8
  br label %16

16:                                               ; preds = %14, %12, %10, %8, %6
  %17 = getelementptr inbounds %4, ptr addrspace(1) %4, i64 0, i32 2
  %18 = load i64, ptr addrspace(1) %17, align 16, !tbaa !55
  %19 = icmp eq i64 %18, 0
  br i1 %19, label %27, label %20

20:                                               ; preds = %16
  %21 = inttoptr i64 %18 to ptr addrspace(1)
  %22 = getelementptr inbounds %4, ptr addrspace(1) %4, i64 0, i32 3
  %23 = load i32, ptr addrspace(1) %22, align 8, !tbaa !57
  %24 = zext i32 %23 to i64
  store atomic i64 %24, ptr addrspace(1) %21 syncscope("one-as") release, align 8
  %25 = tail call i32 @llvm.amdgcn.readfirstlane(i32 %23)
  %26 = and i32 %25, 255
  tail call void @llvm.amdgcn.s.sendmsg(i32 1, i32 %26)
  br label %27

27:                                               ; preds = %20, %16
  ret void
}

; Function Attrs: nounwind
declare void @llvm.amdgcn.s.sendmsg(i32 immarg, i32) #22

; Function Attrs: nounwind readonly
declare i64 @llvm.read_register.i64(metadata) #23

; Function Attrs: nounwind readnone willreturn
declare i32 @llvm.amdgcn.mbcnt.lo(i32, i32) #24

; Function Attrs: nounwind readnone willreturn
declare i32 @llvm.amdgcn.mbcnt.hi(i32, i32) #24

; Function Attrs: convergent norecurse nounwind
define internal i64 @__ockl_fprintf_append_args(i64 noundef %0, i32 noundef %1, i64 noundef %2, i64 noundef %3, i64 noundef %4, i64 noundef %5, i64 noundef %6, i64 noundef %7, i64 noundef %8, i32 noundef %9) #13 {
  %11 = icmp eq i32 %9, 0
  %12 = or i64 %0, 2
  %13 = select i1 %11, i64 %0, i64 %12
  %14 = and i64 %13, -225
  %15 = zext i32 %1 to i64
  %16 = shl nuw nsw i64 %15, 5
  %17 = or i64 %14, %16
  %18 = tail call <2 x i64> @__ockl_hostcall_preview(i32 noundef 2, i64 noundef %17, i64 noundef %2, i64 noundef %3, i64 noundef %4, i64 noundef %5, i64 noundef %6, i64 noundef %7, i64 noundef %8) #27
  %19 = extractelement <2 x i64> %18, i64 0
  ret i64 %19
}

; Function Attrs: convergent norecurse nounwind
define internal i64 @__ockl_fprintf_append_string_n(i64 noundef %0, ptr noundef readonly %1, i64 noundef %2, i32 noundef %3) #13 {
  %5 = icmp eq i32 %3, 0
  %6 = or i64 %0, 2
  %7 = select i1 %5, i64 %0, i64 %6
  %8 = icmp eq ptr %1, null
  br i1 %8, label %9, label %13

9:                                                ; preds = %4
  %10 = and i64 %7, -225
  %11 = or i64 %10, 32
  %12 = tail call <2 x i64> @__ockl_hostcall_preview(i32 noundef 2, i64 noundef %11, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #27
  br label %454

13:                                               ; preds = %4
  %14 = and i64 %7, 2
  %15 = and i64 %7, -3
  %16 = insertelement <2 x i64> <i64 poison, i64 0>, i64 %15, i64 0
  br label %17

17:                                               ; preds = %443, %13
  %18 = phi i64 [ %2, %13 ], [ %451, %443 ]
  %19 = phi ptr [ %1, %13 ], [ %452, %443 ]
  %20 = phi <2 x i64> [ %16, %13 ], [ %450, %443 ]
  %21 = icmp ugt i64 %18, 56
  %22 = extractelement <2 x i64> %20, i64 0
  %23 = or i64 %22, %14
  %24 = insertelement <2 x i64> poison, i64 %23, i64 0
  %25 = select i1 %21, <2 x i64> %20, <2 x i64> %24
  %26 = tail call i64 @llvm.umin.i64(i64 %18, i64 56)
  %27 = trunc i64 %26 to i32
  %28 = extractelement <2 x i64> %25, i64 0
  %29 = icmp ugt i32 %27, 7
  br i1 %29, label %32, label %30

30:                                               ; preds = %17
  %31 = icmp eq i32 %27, 0
  br i1 %31, label %85, label %72

32:                                               ; preds = %17
  %33 = load i8, ptr %19, align 1, !tbaa !32
  %34 = zext i8 %33 to i64
  %35 = getelementptr inbounds i8, ptr %19, i64 1
  %36 = load i8, ptr %35, align 1, !tbaa !32
  %37 = zext i8 %36 to i64
  %38 = shl nuw nsw i64 %37, 8
  %39 = or i64 %38, %34
  %40 = getelementptr inbounds i8, ptr %19, i64 2
  %41 = load i8, ptr %40, align 1, !tbaa !32
  %42 = zext i8 %41 to i64
  %43 = shl nuw nsw i64 %42, 16
  %44 = or i64 %39, %43
  %45 = getelementptr inbounds i8, ptr %19, i64 3
  %46 = load i8, ptr %45, align 1, !tbaa !32
  %47 = zext i8 %46 to i64
  %48 = shl nuw nsw i64 %47, 24
  %49 = or i64 %44, %48
  %50 = getelementptr inbounds i8, ptr %19, i64 4
  %51 = load i8, ptr %50, align 1, !tbaa !32
  %52 = zext i8 %51 to i64
  %53 = shl nuw nsw i64 %52, 32
  %54 = or i64 %49, %53
  %55 = getelementptr inbounds i8, ptr %19, i64 5
  %56 = load i8, ptr %55, align 1, !tbaa !32
  %57 = zext i8 %56 to i64
  %58 = shl nuw nsw i64 %57, 40
  %59 = or i64 %54, %58
  %60 = getelementptr inbounds i8, ptr %19, i64 6
  %61 = load i8, ptr %60, align 1, !tbaa !32
  %62 = zext i8 %61 to i64
  %63 = shl nuw nsw i64 %62, 48
  %64 = or i64 %59, %63
  %65 = getelementptr inbounds i8, ptr %19, i64 7
  %66 = load i8, ptr %65, align 1, !tbaa !32
  %67 = zext i8 %66 to i64
  %68 = shl nuw i64 %67, 56
  %69 = or i64 %64, %68
  %70 = add nsw i32 %27, -8
  %71 = getelementptr inbounds i8, ptr %19, i64 8
  br label %85

72:                                               ; preds = %72, %30
  %73 = phi i32 [ %83, %72 ], [ 0, %30 ]
  %74 = phi i64 [ %82, %72 ], [ 0, %30 ]
  %75 = zext i32 %73 to i64
  %76 = getelementptr inbounds i8, ptr %19, i64 %75
  %77 = load i8, ptr %76, align 1, !tbaa !32
  %78 = zext i8 %77 to i64
  %79 = shl i32 %73, 3
  %80 = zext i32 %79 to i64
  %81 = shl nuw i64 %78, %80
  %82 = or i64 %81, %74
  %83 = add nuw nsw i32 %73, 1
  %84 = icmp eq i32 %83, %27
  br i1 %84, label %85, label %72

85:                                               ; preds = %72, %32, %30
  %86 = phi ptr [ %71, %32 ], [ %19, %30 ], [ %19, %72 ]
  %87 = phi i32 [ %70, %32 ], [ 0, %30 ], [ 0, %72 ]
  %88 = phi i64 [ %69, %32 ], [ 0, %30 ], [ %82, %72 ]
  %89 = icmp ugt i32 %87, 7
  br i1 %89, label %92, label %90

90:                                               ; preds = %85
  %91 = icmp eq i32 %87, 0
  br i1 %91, label %145, label %132

92:                                               ; preds = %85
  %93 = load i8, ptr %86, align 1, !tbaa !32
  %94 = zext i8 %93 to i64
  %95 = getelementptr inbounds i8, ptr %86, i64 1
  %96 = load i8, ptr %95, align 1, !tbaa !32
  %97 = zext i8 %96 to i64
  %98 = shl nuw nsw i64 %97, 8
  %99 = or i64 %98, %94
  %100 = getelementptr inbounds i8, ptr %86, i64 2
  %101 = load i8, ptr %100, align 1, !tbaa !32
  %102 = zext i8 %101 to i64
  %103 = shl nuw nsw i64 %102, 16
  %104 = or i64 %99, %103
  %105 = getelementptr inbounds i8, ptr %86, i64 3
  %106 = load i8, ptr %105, align 1, !tbaa !32
  %107 = zext i8 %106 to i64
  %108 = shl nuw nsw i64 %107, 24
  %109 = or i64 %104, %108
  %110 = getelementptr inbounds i8, ptr %86, i64 4
  %111 = load i8, ptr %110, align 1, !tbaa !32
  %112 = zext i8 %111 to i64
  %113 = shl nuw nsw i64 %112, 32
  %114 = or i64 %109, %113
  %115 = getelementptr inbounds i8, ptr %86, i64 5
  %116 = load i8, ptr %115, align 1, !tbaa !32
  %117 = zext i8 %116 to i64
  %118 = shl nuw nsw i64 %117, 40
  %119 = or i64 %114, %118
  %120 = getelementptr inbounds i8, ptr %86, i64 6
  %121 = load i8, ptr %120, align 1, !tbaa !32
  %122 = zext i8 %121 to i64
  %123 = shl nuw nsw i64 %122, 48
  %124 = or i64 %119, %123
  %125 = getelementptr inbounds i8, ptr %86, i64 7
  %126 = load i8, ptr %125, align 1, !tbaa !32
  %127 = zext i8 %126 to i64
  %128 = shl nuw i64 %127, 56
  %129 = or i64 %124, %128
  %130 = add nsw i32 %87, -8
  %131 = getelementptr inbounds i8, ptr %86, i64 8
  br label %145

132:                                              ; preds = %132, %90
  %133 = phi i32 [ %143, %132 ], [ 0, %90 ]
  %134 = phi i64 [ %142, %132 ], [ 0, %90 ]
  %135 = zext i32 %133 to i64
  %136 = getelementptr inbounds i8, ptr %86, i64 %135
  %137 = load i8, ptr %136, align 1, !tbaa !32
  %138 = zext i8 %137 to i64
  %139 = shl i32 %133, 3
  %140 = zext i32 %139 to i64
  %141 = shl nuw i64 %138, %140
  %142 = or i64 %141, %134
  %143 = add nuw nsw i32 %133, 1
  %144 = icmp eq i32 %143, %87
  br i1 %144, label %145, label %132

145:                                              ; preds = %132, %92, %90
  %146 = phi ptr [ %131, %92 ], [ %86, %90 ], [ %86, %132 ]
  %147 = phi i32 [ %130, %92 ], [ 0, %90 ], [ 0, %132 ]
  %148 = phi i64 [ %129, %92 ], [ 0, %90 ], [ %142, %132 ]
  %149 = icmp ugt i32 %147, 7
  br i1 %149, label %152, label %150

150:                                              ; preds = %145
  %151 = icmp eq i32 %147, 0
  br i1 %151, label %205, label %192

152:                                              ; preds = %145
  %153 = load i8, ptr %146, align 1, !tbaa !32
  %154 = zext i8 %153 to i64
  %155 = getelementptr inbounds i8, ptr %146, i64 1
  %156 = load i8, ptr %155, align 1, !tbaa !32
  %157 = zext i8 %156 to i64
  %158 = shl nuw nsw i64 %157, 8
  %159 = or i64 %158, %154
  %160 = getelementptr inbounds i8, ptr %146, i64 2
  %161 = load i8, ptr %160, align 1, !tbaa !32
  %162 = zext i8 %161 to i64
  %163 = shl nuw nsw i64 %162, 16
  %164 = or i64 %159, %163
  %165 = getelementptr inbounds i8, ptr %146, i64 3
  %166 = load i8, ptr %165, align 1, !tbaa !32
  %167 = zext i8 %166 to i64
  %168 = shl nuw nsw i64 %167, 24
  %169 = or i64 %164, %168
  %170 = getelementptr inbounds i8, ptr %146, i64 4
  %171 = load i8, ptr %170, align 1, !tbaa !32
  %172 = zext i8 %171 to i64
  %173 = shl nuw nsw i64 %172, 32
  %174 = or i64 %169, %173
  %175 = getelementptr inbounds i8, ptr %146, i64 5
  %176 = load i8, ptr %175, align 1, !tbaa !32
  %177 = zext i8 %176 to i64
  %178 = shl nuw nsw i64 %177, 40
  %179 = or i64 %174, %178
  %180 = getelementptr inbounds i8, ptr %146, i64 6
  %181 = load i8, ptr %180, align 1, !tbaa !32
  %182 = zext i8 %181 to i64
  %183 = shl nuw nsw i64 %182, 48
  %184 = or i64 %179, %183
  %185 = getelementptr inbounds i8, ptr %146, i64 7
  %186 = load i8, ptr %185, align 1, !tbaa !32
  %187 = zext i8 %186 to i64
  %188 = shl nuw i64 %187, 56
  %189 = or i64 %184, %188
  %190 = add nsw i32 %147, -8
  %191 = getelementptr inbounds i8, ptr %146, i64 8
  br label %205

192:                                              ; preds = %192, %150
  %193 = phi i32 [ %203, %192 ], [ 0, %150 ]
  %194 = phi i64 [ %202, %192 ], [ 0, %150 ]
  %195 = zext i32 %193 to i64
  %196 = getelementptr inbounds i8, ptr %146, i64 %195
  %197 = load i8, ptr %196, align 1, !tbaa !32
  %198 = zext i8 %197 to i64
  %199 = shl i32 %193, 3
  %200 = zext i32 %199 to i64
  %201 = shl nuw i64 %198, %200
  %202 = or i64 %201, %194
  %203 = add nuw nsw i32 %193, 1
  %204 = icmp eq i32 %203, %147
  br i1 %204, label %205, label %192

205:                                              ; preds = %192, %152, %150
  %206 = phi ptr [ %191, %152 ], [ %146, %150 ], [ %146, %192 ]
  %207 = phi i32 [ %190, %152 ], [ 0, %150 ], [ 0, %192 ]
  %208 = phi i64 [ %189, %152 ], [ 0, %150 ], [ %202, %192 ]
  %209 = icmp ugt i32 %207, 7
  br i1 %209, label %212, label %210

210:                                              ; preds = %205
  %211 = icmp eq i32 %207, 0
  br i1 %211, label %265, label %252

212:                                              ; preds = %205
  %213 = load i8, ptr %206, align 1, !tbaa !32
  %214 = zext i8 %213 to i64
  %215 = getelementptr inbounds i8, ptr %206, i64 1
  %216 = load i8, ptr %215, align 1, !tbaa !32
  %217 = zext i8 %216 to i64
  %218 = shl nuw nsw i64 %217, 8
  %219 = or i64 %218, %214
  %220 = getelementptr inbounds i8, ptr %206, i64 2
  %221 = load i8, ptr %220, align 1, !tbaa !32
  %222 = zext i8 %221 to i64
  %223 = shl nuw nsw i64 %222, 16
  %224 = or i64 %219, %223
  %225 = getelementptr inbounds i8, ptr %206, i64 3
  %226 = load i8, ptr %225, align 1, !tbaa !32
  %227 = zext i8 %226 to i64
  %228 = shl nuw nsw i64 %227, 24
  %229 = or i64 %224, %228
  %230 = getelementptr inbounds i8, ptr %206, i64 4
  %231 = load i8, ptr %230, align 1, !tbaa !32
  %232 = zext i8 %231 to i64
  %233 = shl nuw nsw i64 %232, 32
  %234 = or i64 %229, %233
  %235 = getelementptr inbounds i8, ptr %206, i64 5
  %236 = load i8, ptr %235, align 1, !tbaa !32
  %237 = zext i8 %236 to i64
  %238 = shl nuw nsw i64 %237, 40
  %239 = or i64 %234, %238
  %240 = getelementptr inbounds i8, ptr %206, i64 6
  %241 = load i8, ptr %240, align 1, !tbaa !32
  %242 = zext i8 %241 to i64
  %243 = shl nuw nsw i64 %242, 48
  %244 = or i64 %239, %243
  %245 = getelementptr inbounds i8, ptr %206, i64 7
  %246 = load i8, ptr %245, align 1, !tbaa !32
  %247 = zext i8 %246 to i64
  %248 = shl nuw i64 %247, 56
  %249 = or i64 %244, %248
  %250 = add nsw i32 %207, -8
  %251 = getelementptr inbounds i8, ptr %206, i64 8
  br label %265

252:                                              ; preds = %252, %210
  %253 = phi i32 [ %263, %252 ], [ 0, %210 ]
  %254 = phi i64 [ %262, %252 ], [ 0, %210 ]
  %255 = zext i32 %253 to i64
  %256 = getelementptr inbounds i8, ptr %206, i64 %255
  %257 = load i8, ptr %256, align 1, !tbaa !32
  %258 = zext i8 %257 to i64
  %259 = shl i32 %253, 3
  %260 = zext i32 %259 to i64
  %261 = shl nuw i64 %258, %260
  %262 = or i64 %261, %254
  %263 = add nuw nsw i32 %253, 1
  %264 = icmp eq i32 %263, %207
  br i1 %264, label %265, label %252

265:                                              ; preds = %252, %212, %210
  %266 = phi ptr [ %251, %212 ], [ %206, %210 ], [ %206, %252 ]
  %267 = phi i32 [ %250, %212 ], [ 0, %210 ], [ 0, %252 ]
  %268 = phi i64 [ %249, %212 ], [ 0, %210 ], [ %262, %252 ]
  %269 = icmp ugt i32 %267, 7
  br i1 %269, label %272, label %270

270:                                              ; preds = %265
  %271 = icmp eq i32 %267, 0
  br i1 %271, label %325, label %312

272:                                              ; preds = %265
  %273 = load i8, ptr %266, align 1, !tbaa !32
  %274 = zext i8 %273 to i64
  %275 = getelementptr inbounds i8, ptr %266, i64 1
  %276 = load i8, ptr %275, align 1, !tbaa !32
  %277 = zext i8 %276 to i64
  %278 = shl nuw nsw i64 %277, 8
  %279 = or i64 %278, %274
  %280 = getelementptr inbounds i8, ptr %266, i64 2
  %281 = load i8, ptr %280, align 1, !tbaa !32
  %282 = zext i8 %281 to i64
  %283 = shl nuw nsw i64 %282, 16
  %284 = or i64 %279, %283
  %285 = getelementptr inbounds i8, ptr %266, i64 3
  %286 = load i8, ptr %285, align 1, !tbaa !32
  %287 = zext i8 %286 to i64
  %288 = shl nuw nsw i64 %287, 24
  %289 = or i64 %284, %288
  %290 = getelementptr inbounds i8, ptr %266, i64 4
  %291 = load i8, ptr %290, align 1, !tbaa !32
  %292 = zext i8 %291 to i64
  %293 = shl nuw nsw i64 %292, 32
  %294 = or i64 %289, %293
  %295 = getelementptr inbounds i8, ptr %266, i64 5
  %296 = load i8, ptr %295, align 1, !tbaa !32
  %297 = zext i8 %296 to i64
  %298 = shl nuw nsw i64 %297, 40
  %299 = or i64 %294, %298
  %300 = getelementptr inbounds i8, ptr %266, i64 6
  %301 = load i8, ptr %300, align 1, !tbaa !32
  %302 = zext i8 %301 to i64
  %303 = shl nuw nsw i64 %302, 48
  %304 = or i64 %299, %303
  %305 = getelementptr inbounds i8, ptr %266, i64 7
  %306 = load i8, ptr %305, align 1, !tbaa !32
  %307 = zext i8 %306 to i64
  %308 = shl nuw i64 %307, 56
  %309 = or i64 %304, %308
  %310 = add nsw i32 %267, -8
  %311 = getelementptr inbounds i8, ptr %266, i64 8
  br label %325

312:                                              ; preds = %312, %270
  %313 = phi i32 [ %323, %312 ], [ 0, %270 ]
  %314 = phi i64 [ %322, %312 ], [ 0, %270 ]
  %315 = zext i32 %313 to i64
  %316 = getelementptr inbounds i8, ptr %266, i64 %315
  %317 = load i8, ptr %316, align 1, !tbaa !32
  %318 = zext i8 %317 to i64
  %319 = shl i32 %313, 3
  %320 = zext i32 %319 to i64
  %321 = shl nuw i64 %318, %320
  %322 = or i64 %321, %314
  %323 = add nuw nsw i32 %313, 1
  %324 = icmp eq i32 %323, %267
  br i1 %324, label %325, label %312

325:                                              ; preds = %312, %272, %270
  %326 = phi ptr [ %311, %272 ], [ %266, %270 ], [ %266, %312 ]
  %327 = phi i32 [ %310, %272 ], [ 0, %270 ], [ 0, %312 ]
  %328 = phi i64 [ %309, %272 ], [ 0, %270 ], [ %322, %312 ]
  %329 = icmp ugt i32 %327, 7
  br i1 %329, label %332, label %330

330:                                              ; preds = %325
  %331 = icmp eq i32 %327, 0
  br i1 %331, label %385, label %372

332:                                              ; preds = %325
  %333 = load i8, ptr %326, align 1, !tbaa !32
  %334 = zext i8 %333 to i64
  %335 = getelementptr inbounds i8, ptr %326, i64 1
  %336 = load i8, ptr %335, align 1, !tbaa !32
  %337 = zext i8 %336 to i64
  %338 = shl nuw nsw i64 %337, 8
  %339 = or i64 %338, %334
  %340 = getelementptr inbounds i8, ptr %326, i64 2
  %341 = load i8, ptr %340, align 1, !tbaa !32
  %342 = zext i8 %341 to i64
  %343 = shl nuw nsw i64 %342, 16
  %344 = or i64 %339, %343
  %345 = getelementptr inbounds i8, ptr %326, i64 3
  %346 = load i8, ptr %345, align 1, !tbaa !32
  %347 = zext i8 %346 to i64
  %348 = shl nuw nsw i64 %347, 24
  %349 = or i64 %344, %348
  %350 = getelementptr inbounds i8, ptr %326, i64 4
  %351 = load i8, ptr %350, align 1, !tbaa !32
  %352 = zext i8 %351 to i64
  %353 = shl nuw nsw i64 %352, 32
  %354 = or i64 %349, %353
  %355 = getelementptr inbounds i8, ptr %326, i64 5
  %356 = load i8, ptr %355, align 1, !tbaa !32
  %357 = zext i8 %356 to i64
  %358 = shl nuw nsw i64 %357, 40
  %359 = or i64 %354, %358
  %360 = getelementptr inbounds i8, ptr %326, i64 6
  %361 = load i8, ptr %360, align 1, !tbaa !32
  %362 = zext i8 %361 to i64
  %363 = shl nuw nsw i64 %362, 48
  %364 = or i64 %359, %363
  %365 = getelementptr inbounds i8, ptr %326, i64 7
  %366 = load i8, ptr %365, align 1, !tbaa !32
  %367 = zext i8 %366 to i64
  %368 = shl nuw i64 %367, 56
  %369 = or i64 %364, %368
  %370 = add nsw i32 %327, -8
  %371 = getelementptr inbounds i8, ptr %326, i64 8
  br label %385

372:                                              ; preds = %372, %330
  %373 = phi i32 [ %383, %372 ], [ 0, %330 ]
  %374 = phi i64 [ %382, %372 ], [ 0, %330 ]
  %375 = zext i32 %373 to i64
  %376 = getelementptr inbounds i8, ptr %326, i64 %375
  %377 = load i8, ptr %376, align 1, !tbaa !32
  %378 = zext i8 %377 to i64
  %379 = shl i32 %373, 3
  %380 = zext i32 %379 to i64
  %381 = shl nuw i64 %378, %380
  %382 = or i64 %381, %374
  %383 = add nuw nsw i32 %373, 1
  %384 = icmp eq i32 %383, %327
  br i1 %384, label %385, label %372

385:                                              ; preds = %372, %332, %330
  %386 = phi ptr [ %371, %332 ], [ %326, %330 ], [ %326, %372 ]
  %387 = phi i32 [ %370, %332 ], [ 0, %330 ], [ 0, %372 ]
  %388 = phi i64 [ %369, %332 ], [ 0, %330 ], [ %382, %372 ]
  %389 = icmp ugt i32 %387, 7
  br i1 %389, label %392, label %390

390:                                              ; preds = %385
  %391 = icmp eq i32 %387, 0
  br i1 %391, label %443, label %430

392:                                              ; preds = %385
  %393 = load i8, ptr %386, align 1, !tbaa !32
  %394 = zext i8 %393 to i64
  %395 = getelementptr inbounds i8, ptr %386, i64 1
  %396 = load i8, ptr %395, align 1, !tbaa !32
  %397 = zext i8 %396 to i64
  %398 = shl nuw nsw i64 %397, 8
  %399 = or i64 %398, %394
  %400 = getelementptr inbounds i8, ptr %386, i64 2
  %401 = load i8, ptr %400, align 1, !tbaa !32
  %402 = zext i8 %401 to i64
  %403 = shl nuw nsw i64 %402, 16
  %404 = or i64 %399, %403
  %405 = getelementptr inbounds i8, ptr %386, i64 3
  %406 = load i8, ptr %405, align 1, !tbaa !32
  %407 = zext i8 %406 to i64
  %408 = shl nuw nsw i64 %407, 24
  %409 = or i64 %404, %408
  %410 = getelementptr inbounds i8, ptr %386, i64 4
  %411 = load i8, ptr %410, align 1, !tbaa !32
  %412 = zext i8 %411 to i64
  %413 = shl nuw nsw i64 %412, 32
  %414 = or i64 %409, %413
  %415 = getelementptr inbounds i8, ptr %386, i64 5
  %416 = load i8, ptr %415, align 1, !tbaa !32
  %417 = zext i8 %416 to i64
  %418 = shl nuw nsw i64 %417, 40
  %419 = or i64 %414, %418
  %420 = getelementptr inbounds i8, ptr %386, i64 6
  %421 = load i8, ptr %420, align 1, !tbaa !32
  %422 = zext i8 %421 to i64
  %423 = shl nuw nsw i64 %422, 48
  %424 = or i64 %419, %423
  %425 = getelementptr inbounds i8, ptr %386, i64 7
  %426 = load i8, ptr %425, align 1, !tbaa !32
  %427 = zext i8 %426 to i64
  %428 = shl nuw i64 %427, 56
  %429 = or i64 %424, %428
  br label %443

430:                                              ; preds = %430, %390
  %431 = phi i32 [ %441, %430 ], [ 0, %390 ]
  %432 = phi i64 [ %440, %430 ], [ 0, %390 ]
  %433 = zext i32 %431 to i64
  %434 = getelementptr inbounds i8, ptr %386, i64 %433
  %435 = load i8, ptr %434, align 1, !tbaa !32
  %436 = zext i8 %435 to i64
  %437 = shl i32 %431, 3
  %438 = zext i32 %437 to i64
  %439 = shl nuw i64 %436, %438
  %440 = or i64 %439, %432
  %441 = add nuw nsw i32 %431, 1
  %442 = icmp eq i32 %441, %387
  br i1 %442, label %443, label %430

443:                                              ; preds = %430, %392, %390
  %444 = phi i64 [ %429, %392 ], [ 0, %390 ], [ %440, %430 ]
  %445 = shl nuw nsw i64 %26, 2
  %446 = add nuw nsw i64 %445, 28
  %447 = and i64 %446, 480
  %448 = and i64 %28, -225
  %449 = or i64 %448, %447
  %450 = tail call <2 x i64> @__ockl_hostcall_preview(i32 noundef 2, i64 noundef %449, i64 noundef %88, i64 noundef %148, i64 noundef %208, i64 noundef %268, i64 noundef %328, i64 noundef %388, i64 noundef %444) #27
  %451 = sub i64 %18, %26
  %452 = getelementptr inbounds i8, ptr %19, i64 %26
  %453 = icmp eq i64 %451, 0
  br i1 %453, label %454, label %17

454:                                              ; preds = %443, %9
  %455 = phi <2 x i64> [ %12, %9 ], [ %450, %443 ]
  %456 = extractelement <2 x i64> %455, i64 0
  ret i64 %456
}

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.umin.i64(i64, i64) #25

; Function Attrs: convergent mustprogress nofree norecurse nosync nounwind readnone willreturn
define internal i64 @__ockl_get_local_size(i32 noundef %0) #26 {
  switch i32 %0, label %76 [
    i32 0, label %2
    i32 1, label %26
    i32 2, label %51
  ]

2:                                                ; preds = %1
  %3 = load i32, ptr addrspace(4) @__oclc_ABI_version, align 4, !tbaa !35
  %4 = icmp slt i32 %3, 500
  br i1 %4, label %5, label %17

5:                                                ; preds = %2
  %6 = tail call align 4 dereferenceable(64) ptr addrspace(4) @llvm.amdgcn.dispatch.ptr()
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %8 = getelementptr i8, ptr addrspace(4) %6, i64 4
  %9 = load i16, ptr addrspace(4) %8, align 4, !range !58, !invariant.load !59
  %10 = zext i16 %9 to i32
  %11 = getelementptr inbounds %6, ptr addrspace(4) %6, i64 0, i32 6
  %12 = load i32, ptr addrspace(4) %11, align 4, !tbaa !60
  %13 = mul i32 %7, %10
  %14 = sub i32 %12, %13
  %15 = tail call i32 @llvm.umin.i32(i32 %14, i32 %10)
  %16 = zext i32 %15 to i64
  br label %76

17:                                               ; preds = %2
  %18 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %19 = tail call ptr addrspace(4) @llvm.amdgcn.implicitarg.ptr()
  %20 = load i32, ptr addrspace(4) %19, align 4, !tbaa !35
  %21 = icmp ult i32 %18, %20
  %22 = select i1 %21, i64 6, i64 9
  %23 = getelementptr inbounds i16, ptr addrspace(4) %19, i64 %22
  %24 = load i16, ptr addrspace(4) %23, align 2, !tbaa !63
  %25 = zext i16 %24 to i64
  br label %76

26:                                               ; preds = %1
  %27 = load i32, ptr addrspace(4) @__oclc_ABI_version, align 4, !tbaa !35
  %28 = icmp slt i32 %27, 500
  br i1 %28, label %29, label %41

29:                                               ; preds = %26
  %30 = tail call align 4 dereferenceable(64) ptr addrspace(4) @llvm.amdgcn.dispatch.ptr()
  %31 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %32 = getelementptr i8, ptr addrspace(4) %30, i64 6
  %33 = load i16, ptr addrspace(4) %32, align 2, !range !58, !invariant.load !59
  %34 = zext i16 %33 to i32
  %35 = getelementptr inbounds %6, ptr addrspace(4) %30, i64 0, i32 7
  %36 = load i32, ptr addrspace(4) %35, align 8, !tbaa !64
  %37 = mul i32 %31, %34
  %38 = sub i32 %36, %37
  %39 = tail call i32 @llvm.umin.i32(i32 %38, i32 %34)
  %40 = zext i32 %39 to i64
  br label %76

41:                                               ; preds = %26
  %42 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %43 = tail call ptr addrspace(4) @llvm.amdgcn.implicitarg.ptr()
  %44 = getelementptr inbounds i32, ptr addrspace(4) %43, i64 1
  %45 = load i32, ptr addrspace(4) %44, align 4, !tbaa !35
  %46 = icmp ult i32 %42, %45
  %47 = select i1 %46, i64 7, i64 10
  %48 = getelementptr inbounds i16, ptr addrspace(4) %43, i64 %47
  %49 = load i16, ptr addrspace(4) %48, align 2, !tbaa !63
  %50 = zext i16 %49 to i64
  br label %76

51:                                               ; preds = %1
  %52 = load i32, ptr addrspace(4) @__oclc_ABI_version, align 4, !tbaa !35
  %53 = icmp slt i32 %52, 500
  br i1 %53, label %54, label %66

54:                                               ; preds = %51
  %55 = tail call align 4 dereferenceable(64) ptr addrspace(4) @llvm.amdgcn.dispatch.ptr()
  %56 = tail call i32 @llvm.amdgcn.workgroup.id.z()
  %57 = getelementptr i8, ptr addrspace(4) %55, i64 8
  %58 = load i16, ptr addrspace(4) %57, align 4, !range !58, !invariant.load !59
  %59 = zext i16 %58 to i32
  %60 = getelementptr inbounds %6, ptr addrspace(4) %55, i64 0, i32 8
  %61 = load i32, ptr addrspace(4) %60, align 4, !tbaa !65
  %62 = mul i32 %56, %59
  %63 = sub i32 %61, %62
  %64 = tail call i32 @llvm.umin.i32(i32 %63, i32 %59)
  %65 = zext i32 %64 to i64
  br label %76

66:                                               ; preds = %51
  %67 = tail call i32 @llvm.amdgcn.workgroup.id.z()
  %68 = tail call ptr addrspace(4) @llvm.amdgcn.implicitarg.ptr()
  %69 = getelementptr inbounds i32, ptr addrspace(4) %68, i64 2
  %70 = load i32, ptr addrspace(4) %69, align 4, !tbaa !35
  %71 = icmp ult i32 %67, %70
  %72 = select i1 %71, i64 8, i64 11
  %73 = getelementptr inbounds i16, ptr addrspace(4) %68, i64 %72
  %74 = load i16, ptr addrspace(4) %73, align 2, !tbaa !63
  %75 = zext i16 %74 to i64
  br label %76

76:                                               ; preds = %66, %54, %41, %29, %17, %5, %1
  %77 = phi i64 [ 1, %1 ], [ %16, %5 ], [ %25, %17 ], [ %40, %29 ], [ %50, %41 ], [ %65, %54 ], [ %75, %66 ]
  ret i64 %77
}

; Function Attrs: nounwind readnone speculatable willreturn
declare align 4 ptr addrspace(4) @llvm.amdgcn.dispatch.ptr() #14

; Function Attrs: nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #14

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.umin.i32(i32, i32) #25

; Function Attrs: nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #14

; Function Attrs: nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.z() #14

; Function Attrs: convergent mustprogress nofree norecurse nosync nounwind readnone willreturn
define internal i64 @__ockl_get_local_id(i32 noundef %0) #26 {
  switch i32 %0, label %8 [
    i32 0, label %2
    i32 1, label %4
    i32 2, label %6
  ]

2:                                                ; preds = %1
  %3 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !66
  br label %8

4:                                                ; preds = %1
  %5 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !66
  br label %8

6:                                                ; preds = %1
  %7 = tail call i32 @llvm.amdgcn.workitem.id.z(), !range !66
  br label %8

8:                                                ; preds = %6, %4, %2, %1
  %9 = phi i32 [ %7, %6 ], [ %5, %4 ], [ %3, %2 ], [ 0, %1 ]
  %10 = zext i32 %9 to i64
  ret i64 %10
}

; Function Attrs: nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #14

; Function Attrs: nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #14

; Function Attrs: nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.z() #14

; Function Attrs: convergent mustprogress nofree norecurse nosync nounwind readnone willreturn
define internal i64 @__ockl_get_group_id(i32 noundef %0) #26 {
  switch i32 %0, label %8 [
    i32 0, label %2
    i32 1, label %4
    i32 2, label %6
  ]

2:                                                ; preds = %1
  %3 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  br label %8

4:                                                ; preds = %1
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  br label %8

6:                                                ; preds = %1
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.z()
  br label %8

8:                                                ; preds = %6, %4, %2, %1
  %9 = phi i32 [ %7, %6 ], [ %5, %4 ], [ %3, %2 ], [ 0, %1 ]
  %10 = zext i32 %9 to i64
  ret i64 %10
}

attributes #0 = { convergent mustprogress noreturn nounwind "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx90a" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot3-insts,+dot4-insts,+dot5-insts,+dot6-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+gfx90a-insts,+mai-insts,+s-memrealtime,+s-memtime-inst" }
attributes #1 = { cold noreturn nounwind }
attributes #2 = { convergent mustprogress noinline nounwind "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx90a" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot3-insts,+dot4-insts,+dot5-insts,+dot6-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+gfx90a-insts,+mai-insts,+s-memrealtime,+s-memtime-inst" }
attributes #3 = { argmemonly nocallback nofree nosync nounwind willreturn }
attributes #4 = { argmemonly nocallback nofree nounwind willreturn }
attributes #5 = { convergent mustprogress nounwind "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx90a" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot3-insts,+dot4-insts,+dot5-insts,+dot6-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+gfx90a-insts,+mai-insts,+s-memrealtime,+s-memtime-inst" }
attributes #6 = { convergent mustprogress norecurse nounwind "amdgpu-flat-work-group-size"="1,1024" "frame-pointer"="none" "min-legal-vector-width"="128" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx90a" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot3-insts,+dot4-insts,+dot5-insts,+dot6-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+gfx90a-insts,+mai-insts,+s-memrealtime,+s-memtime-inst" "uniform-work-group-size"="true" }
attributes #7 = { alwaysinline convergent mustprogress nounwind "frame-pointer"="none" "min-legal-vector-width"="128" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx90a" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot3-insts,+dot4-insts,+dot5-insts,+dot6-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+gfx90a-insts,+mai-insts,+s-memrealtime,+s-memtime-inst" }
attributes #8 = { convergent nounwind "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx90a" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot3-insts,+dot4-insts,+dot5-insts,+dot6-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+gfx90a-insts,+mai-insts,+s-memrealtime,+s-memtime-inst" }
attributes #9 = { convergent mustprogress norecurse nounwind "amdgpu-flat-work-group-size"="1,1024" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx90a" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot3-insts,+dot4-insts,+dot5-insts,+dot6-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+gfx90a-insts,+mai-insts,+s-memrealtime,+s-memtime-inst" "uniform-work-group-size"="true" }
attributes #10 = { alwaysinline convergent mustprogress nounwind "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx90a" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot3-insts,+dot4-insts,+dot5-insts,+dot6-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+gfx90a-insts,+mai-insts,+s-memrealtime,+s-memtime-inst" }
attributes #11 = { convergent mustprogress nofree norecurse nounwind readonly willreturn "frame-pointer"="none" "min-legal-vector-width"="128" "no-trapping-math"="true" "stack-protector-buffer-size"="8" }
attributes #12 = { nounwind readonly willreturn }
attributes #13 = { convergent norecurse nounwind "frame-pointer"="none" "min-legal-vector-width"="128" "no-trapping-math"="true" "stack-protector-buffer-size"="8" }
attributes #14 = { nounwind readnone speculatable willreturn }
attributes #15 = { convergent noinline norecurse nounwind optnone "frame-pointer"="none" "min-legal-vector-width"="128" "no-trapping-math"="true" "stack-protector-buffer-size"="8" }
attributes #16 = { alwaysinline convergent mustprogress nofree norecurse nosync nounwind readnone willreturn "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" }
attributes #17 = { convergent norecurse nounwind "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" }
attributes #18 = { convergent nounwind readnone willreturn }
attributes #19 = { argmemonly convergent mustprogress nofree norecurse nosync nounwind readonly willreturn "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" }
attributes #20 = { convergent mustprogress nofree norecurse nounwind willreturn "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" }
attributes #21 = { nounwind willreturn }
attributes #22 = { nounwind }
attributes #23 = { nounwind readonly }
attributes #24 = { nounwind readnone willreturn }
attributes #25 = { nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #26 = { convergent mustprogress nofree norecurse nosync nounwind readnone willreturn "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" }
attributes #27 = { convergent nounwind }
attributes #28 = { convergent nounwind readonly willreturn }
attributes #29 = { convergent }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2}
!opencl.ocl.version = !{!3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{!"clang version 16.0.0 (https://github.com/llvm/llvm-project 809855b56f06dd7182685f88fbbc64111df9339a)"}
!3 = !{i32 2, i32 0}
!4 = !{!5, !5, i64 0}
!5 = !{!"any pointer", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C++ TBAA"}
!8 = !{!9, !9, i64 0}
!9 = !{!"int", !6, i64 0}
!10 = !{!11, !11, i64 0}
!11 = !{!"long", !6, i64 0}
!12 = !{!6, !6, i64 0}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.mustprogress"}
!15 = distinct !{!15, !14}
!16 = distinct !{!16, !14}
!17 = distinct !{!17, !14}
!18 = !{!19, !5, i64 72}
!19 = !{!"_ZTS16textureReference", !9, i64 0, !20, i64 4, !21, i64 8, !6, i64 12, !22, i64 24, !9, i64 44, !9, i64 48, !21, i64 52, !24, i64 56, !24, i64 60, !24, i64 64, !5, i64 72, !9, i64 80, !25, i64 84}
!20 = !{!"_ZTS18hipTextureReadMode", !6, i64 0}
!21 = !{!"_ZTS20hipTextureFilterMode", !6, i64 0}
!22 = !{!"_ZTS20hipChannelFormatDesc", !9, i64 0, !9, i64 4, !9, i64 8, !9, i64 12, !23, i64 16}
!23 = !{!"_ZTS20hipChannelFormatKind", !6, i64 0}
!24 = !{!"float", !6, i64 0}
!25 = !{!"_ZTS15hipArray_Format", !6, i64 0}
!26 = distinct !{!26, !14}
!27 = !{!28, !28, i64 0}
!28 = !{!"bool", !6, i64 0}
!29 = !{i8 0, i8 2}
!30 = distinct !{!30, !14}
!31 = !{!24, !24, i64 0}
!32 = !{!33, !33, i64 0}
!33 = !{!"omnipotent char", !34, i64 0}
!34 = !{!"Simple C/C++ TBAA"}
!35 = !{!36, !36, i64 0}
!36 = !{!"int", !33, i64 0}
!37 = !{!38, !38, i64 0}
!38 = !{!"long", !33, i64 0}
!39 = !{!40, !40, i64 0}
!40 = !{!"any pointer", !33, i64 0}
!41 = !{!42, !40, i64 0}
!42 = !{!"", !40, i64 0, !40, i64 8, !43, i64 16, !38, i64 24, !38, i64 32, !38, i64 40}
!43 = !{!"hsa_signal_s", !38, i64 0}
!44 = !{!42, !38, i64 40}
!45 = !{!42, !40, i64 8}
!46 = !{!47, !47, i64 0}
!47 = !{!"bool", !33, i64 0}
!48 = !{i64 2509}
!49 = !{!"exec"}
!50 = !{!51, !36, i64 16}
!51 = !{!"", !38, i64 0, !38, i64 8, !36, i64 16, !36, i64 20}
!52 = !{!51, !38, i64 8}
!53 = !{!51, !36, i64 20}
!54 = !{!51, !38, i64 0}
!55 = !{!56, !38, i64 16}
!56 = !{!"amd_signal_s", !38, i64 0, !33, i64 8, !38, i64 16, !36, i64 24, !36, i64 28, !38, i64 32, !38, i64 40, !33, i64 48, !33, i64 56}
!57 = !{!56, !36, i64 24}
!58 = !{i16 1, i16 1025}
!59 = !{}
!60 = !{!61, !36, i64 12}
!61 = !{!"hsa_kernel_dispatch_packet_s", !62, i64 0, !62, i64 2, !62, i64 4, !62, i64 6, !62, i64 8, !62, i64 10, !36, i64 12, !36, i64 16, !36, i64 20, !36, i64 24, !36, i64 28, !38, i64 32, !40, i64 40, !38, i64 48, !43, i64 56}
!62 = !{!"short", !33, i64 0}
!63 = !{!62, !62, i64 0}
!64 = !{!61, !36, i64 16}
!65 = !{!61, !36, i64 20}
!66 = !{i32 0, i32 1024}

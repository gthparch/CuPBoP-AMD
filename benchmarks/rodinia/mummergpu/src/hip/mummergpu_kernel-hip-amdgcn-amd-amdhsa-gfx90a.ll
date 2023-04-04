; ModuleID = 'mummergpu_kernel-hip-amdgcn-amd-amdhsa-gfx90a.bc'
source_filename = "mummergpu_kernel.cu"
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
%struct.__HIP_Coordinates.13 = type { i8 }
%"struct.__HIP_Coordinates<__HIP_BlockDim>::__X" = type { i8 }
%struct.__HIP_Coordinates.14 = type { i8 }
%"struct.__HIP_Coordinates<__HIP_ThreadIdx>::__X" = type { i8 }
%struct.TextureAddress = type { %union.anon }
%union.anon = type { i32 }
%struct.anon = type { i16, i16 }
%struct.HIP_vector_type = type { %struct.HIP_vector_base }
%struct.HIP_vector_base = type { %union.anon.1 }
%union.anon.1 = type { %"struct.HIP_vector_base<unsigned char, 3>::Native_vec_" }
%"struct.HIP_vector_base<unsigned char, 3>::Native_vec_" = type { [3 x i8] }
%struct.anon.2 = type { i8, i8, i8 }
%struct.HIP_vector_type.3 = type { %struct.HIP_vector_base.4 }
%struct.HIP_vector_base.4 = type { %union.anon.5 }
%union.anon.5 = type { <4 x i32> }
%struct.HIP_vector_type.23 = type { %struct.HIP_vector_base.24 }
%struct.HIP_vector_base.24 = type { %union.anon.25 }
%union.anon.25 = type { <2 x float> }
%struct.HIP_vector_type.8 = type { %struct.HIP_vector_base.9 }
%struct.HIP_vector_base.9 = type { %union.anon.10 }
%union.anon.10 = type { <2 x i32> }
%struct._MatchCoord = type { %union.anon.7 }
%union.anon.7 = type { %struct.HIP_vector_type.8 }
%struct._PixelOfChildren = type { %union.anon.15 }
%union.anon.15 = type { %struct.HIP_vector_type.3 }
%struct._PixelOfNode = type { %union.anon.19 }
%union.anon.19 = type { %struct.HIP_vector_type.3 }
%struct.anon.17 = type { %struct.HIP_vector_type, %struct.HIP_vector_type, %struct.HIP_vector_type, %struct.HIP_vector_type, %struct.HIP_vector_type, i8 }
%struct.anon.20 = type { %struct.HIP_vector_type, %struct.HIP_vector_type, %struct.HIP_vector_type, %struct.HIP_vector_type, %struct.HIP_vector_type, i8 }
%struct.__HIP_BlockIdx = type { i8 }
%struct.__HIP_BlockDim = type { i8 }
%struct.__HIP_ThreadIdx = type { i8 }
%struct.MatchInfo = type { i32, i32, %struct.TextureAddress, i32, i16, i16 }
%struct.anon.18 = type { %struct.HIP_vector_type, [12 x i8], i8 }
%struct.Alignment = type { i32, i16 }
%union.anon.27 = type { <4 x float> }

$_ZN15HIP_vector_typeIiLj2EEaSEOS0_ = comdat any

$_ZNK17__HIP_CoordinatesI14__HIP_BlockIdxE3__XcvjEv = comdat any

$_ZNK17__HIP_CoordinatesI14__HIP_BlockDimE3__XcvjEv = comdat any

$_ZNK17__HIP_CoordinatesI15__HIP_ThreadIdxE3__XcvjEv = comdat any

$_ZN15HIP_vector_typeIjLj4EEaSEOS0_ = comdat any

$_ZN15HIP_vector_typeIiLj2EEC2IJiiELPv0EEEDpT_ = comdat any

$_ZN15HIP_vector_baseIiLj2EEC2Eii = comdat any

$_ZN15HIP_vector_baseIiLj2EEaSERKS0_ = comdat any

$_ZN15HIP_vector_baseIjLj4EEaSERKS0_ = comdat any

$_ZN15HIP_vector_typeIhLj3EEC2IJhhhELPv0EEEDpT_ = comdat any

$_ZN15HIP_vector_baseIhLj3EEC2Ehhh = comdat any

$_ZN15HIP_vector_baseIhLj3EE11Native_vec_C2Ehhh = comdat any

$_ZN15HIP_vector_typeIfLj2EEC2IJffELPv0EEEDpT_ = comdat any

$_Z7mapFromI15HIP_vector_typeIjLj4EEDv4_fENSt9enable_ifIXooooooeqstT_stNS4_10value_typeEsr3std7is_sameIS5_iEE5valuesr3std7is_sameIS5_jEE5valuesr3std7is_sameIS5_fEE5valueEKS4_E4typeERKT0_ = comdat any

$_ZN15HIP_vector_baseIfLj2EEC2Eff = comdat any

$_ZNK14__HIP_BlockIdxclEj = comdat any

$_ZNK14__HIP_BlockDimclEj = comdat any

$_ZNK15__HIP_ThreadIdxclEj = comdat any

$_ZN17__HIP_CoordinatesI14__HIP_BlockIdxE1xE = comdat any

$_ZN17__HIP_CoordinatesI14__HIP_BlockDimE1xE = comdat any

$_ZN17__HIP_CoordinatesI15__HIP_ThreadIdxE1xE = comdat any

@__const.__assert_fail.fmt = private unnamed_addr addrspace(4) constant [47 x i8] c"%s:%u: %s: Device-side assertion `%s' failed.\0A\00", align 16
@nodetex = protected addrspace(1) externally_initialized global %struct.texture undef, align 8
@childrentex = protected addrspace(1) externally_initialized global %struct.texture undef, align 8
@reftex = protected addrspace(1) externally_initialized global %struct.texture.0 undef, align 8
@qrytex = protected addrspace(1) externally_initialized global %struct.texture.0 undef, align 8
@_ZL8blockIdx = internal addrspace(4) constant %struct.__HIP_Coordinates undef, align 1
@_ZN17__HIP_CoordinatesI14__HIP_BlockIdxE1xE = weak protected addrspace(4) externally_initialized constant %"struct.__HIP_Coordinates<__HIP_BlockIdx>::__X" undef, comdat, align 1
@_ZL8blockDim = internal addrspace(4) constant %struct.__HIP_Coordinates.13 undef, align 1
@_ZN17__HIP_CoordinatesI14__HIP_BlockDimE1xE = weak protected addrspace(4) externally_initialized constant %"struct.__HIP_Coordinates<__HIP_BlockDim>::__X" undef, comdat, align 1
@_ZL9threadIdx = internal addrspace(4) constant %struct.__HIP_Coordinates.14 undef, align 1
@_ZN17__HIP_CoordinatesI15__HIP_ThreadIdxE1xE = weak protected addrspace(4) externally_initialized constant %"struct.__HIP_Coordinates<__HIP_ThreadIdx>::__X" undef, comdat, align 1
@llvm.compiler.used = appending addrspace(1) global [5 x ptr] [ptr addrspacecast (ptr addrspace(1) @nodetex to ptr), ptr addrspacecast (ptr addrspace(1) @childrentex to ptr), ptr addrspacecast (ptr addrspace(4) @_ZN17__HIP_CoordinatesI14__HIP_BlockIdxE1xE to ptr), ptr addrspacecast (ptr addrspace(4) @_ZN17__HIP_CoordinatesI14__HIP_BlockDimE1xE to ptr), ptr addrspacecast (ptr addrspace(4) @_ZN17__HIP_CoordinatesI15__HIP_ThreadIdxE1xE to ptr)], section "llvm.metadata"
@__oclc_wavefrontsize64 = internal local_unnamed_addr addrspace(4) constant i8 1, align 1
@__oclc_ISA_version = internal local_unnamed_addr addrspace(4) constant i32 9010, align 4
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
  call void @llvm.lifetime.start.p5(i64 47, ptr addrspace(5) %9) #27
  call void @llvm.memcpy.p0.p4.i64(ptr align 16 %20, ptr addrspace(4) align 16 @__const.__assert_fail.fmt, i64 47, i1 false)
  call void @llvm.lifetime.start.p5(i64 8, ptr addrspace(5) %10) #27
  %27 = call i64 @__ockl_fprintf_stderr_begin() #30
  store i64 %27, ptr %21, align 8, !tbaa !10
  call void @llvm.lifetime.start.p5(i64 4, ptr addrspace(5) %11) #27
  store i32 0, ptr %22, align 4, !tbaa !8
  br label %28

28:                                               ; preds = %4
  call void @llvm.lifetime.start.p5(i64 8, ptr addrspace(5) %12) #27
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
  call void @llvm.lifetime.end.p5(i64 8, ptr addrspace(5) %12) #27
  br label %43

43:                                               ; preds = %36
  br label %44

44:                                               ; preds = %43
  %45 = load i64, ptr %21, align 8, !tbaa !10
  %46 = getelementptr inbounds [47 x i8], ptr %20, i64 0, i64 0
  %47 = load i32, ptr %22, align 4, !tbaa !8
  %48 = sext i32 %47 to i64
  %49 = call i64 @__ockl_fprintf_append_string_n(i64 noundef %45, ptr noundef %46, i64 noundef %48, i32 noundef 0) #30
  store i64 %49, ptr %21, align 8, !tbaa !10
  br label %50

50:                                               ; preds = %44
  call void @llvm.lifetime.start.p5(i64 8, ptr addrspace(5) %13) #27
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
  call void @llvm.lifetime.end.p5(i64 8, ptr addrspace(5) %13) #27
  br label %65

65:                                               ; preds = %58
  br label %66

66:                                               ; preds = %65
  %67 = load i64, ptr %21, align 8, !tbaa !10
  %68 = load ptr, ptr %17, align 8, !tbaa !4
  %69 = load i32, ptr %22, align 4, !tbaa !8
  %70 = sext i32 %69 to i64
  %71 = call i64 @__ockl_fprintf_append_string_n(i64 noundef %67, ptr noundef %68, i64 noundef %70, i32 noundef 0) #30
  store i64 %71, ptr %21, align 8, !tbaa !10
  %72 = load i64, ptr %21, align 8, !tbaa !10
  %73 = load i32, ptr %18, align 4, !tbaa !8
  %74 = zext i32 %73 to i64
  %75 = call i64 @__ockl_fprintf_append_args(i64 noundef %72, i32 noundef 1, i64 noundef %74, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i32 noundef 0) #30
  store i64 %75, ptr %21, align 8, !tbaa !10
  br label %76

76:                                               ; preds = %66
  call void @llvm.lifetime.start.p5(i64 8, ptr addrspace(5) %14) #27
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
  call void @llvm.lifetime.end.p5(i64 8, ptr addrspace(5) %14) #27
  br label %91

91:                                               ; preds = %84
  br label %92

92:                                               ; preds = %91
  %93 = load i64, ptr %21, align 8, !tbaa !10
  %94 = load ptr, ptr %19, align 8, !tbaa !4
  %95 = load i32, ptr %22, align 4, !tbaa !8
  %96 = sext i32 %95 to i64
  %97 = call i64 @__ockl_fprintf_append_string_n(i64 noundef %93, ptr noundef %94, i64 noundef %96, i32 noundef 0) #30
  store i64 %97, ptr %21, align 8, !tbaa !10
  br label %98

98:                                               ; preds = %92
  call void @llvm.lifetime.start.p5(i64 8, ptr addrspace(5) %15) #27
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
  call void @llvm.lifetime.end.p5(i64 8, ptr addrspace(5) %15) #27
  br label %113

113:                                              ; preds = %106
  br label %114

114:                                              ; preds = %113
  %115 = load i64, ptr %21, align 8, !tbaa !10
  %116 = load ptr, ptr %16, align 8, !tbaa !4
  %117 = load i32, ptr %22, align 4, !tbaa !8
  %118 = sext i32 %117 to i64
  %119 = call i64 @__ockl_fprintf_append_string_n(i64 noundef %115, ptr noundef %116, i64 noundef %118, i32 noundef 1) #30
  call void @llvm.trap()
  call void @llvm.lifetime.end.p5(i64 4, ptr addrspace(5) %11) #27
  call void @llvm.lifetime.end.p5(i64 8, ptr addrspace(5) %10) #27
  call void @llvm.lifetime.end.p5(i64 47, ptr addrspace(5) %9) #27
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
define hidden noundef i32 @_Z7addr2idj(i32 noundef %0) #5 {
  %2 = alloca i32, align 4, addrspace(5)
  %3 = alloca i32, align 4, addrspace(5)
  %4 = alloca i32, align 4, addrspace(5)
  %5 = alloca i32, align 4, addrspace(5)
  %6 = alloca i32, align 4, addrspace(5)
  %7 = alloca i32, align 4, addrspace(5)
  %8 = addrspacecast ptr addrspace(5) %2 to ptr
  %9 = addrspacecast ptr addrspace(5) %3 to ptr
  %10 = addrspacecast ptr addrspace(5) %4 to ptr
  %11 = addrspacecast ptr addrspace(5) %5 to ptr
  %12 = addrspacecast ptr addrspace(5) %6 to ptr
  store i32 %0, ptr %9, align 4, !tbaa !8
  call void @llvm.lifetime.start.p5(i64 4, ptr addrspace(5) %4) #27
  %13 = load i32, ptr %9, align 4, !tbaa !8
  %14 = lshr i32 %13, 16
  %15 = and i32 %14, 31
  store i32 %15, ptr %10, align 4, !tbaa !8
  call void @llvm.lifetime.start.p5(i64 4, ptr addrspace(5) %5) #27
  %16 = load i32, ptr %9, align 4, !tbaa !8
  %17 = lshr i32 %16, 16
  %18 = lshr i32 %17, 5
  store i32 %18, ptr %11, align 4, !tbaa !8
  call void @llvm.lifetime.start.p5(i64 4, ptr addrspace(5) %6) #27
  %19 = load i32, ptr %9, align 4, !tbaa !8
  %20 = and i32 %19, 65535
  %21 = shl i32 %20, 5
  %22 = load i32, ptr %10, align 4, !tbaa !8
  %23 = add i32 %21, %22
  store i32 %23, ptr %12, align 4, !tbaa !8
  %24 = load i32, ptr %12, align 4, !tbaa !8
  %25 = load i32, ptr %11, align 4, !tbaa !8
  %26 = shl i32 %25, 17
  %27 = add nsw i32 %24, %26
  call void @llvm.lifetime.end.p5(i64 4, ptr addrspace(5) %6) #27
  call void @llvm.lifetime.end.p5(i64 4, ptr addrspace(5) %5) #27
  call void @llvm.lifetime.end.p5(i64 4, ptr addrspace(5) %4) #27
  ret i32 %27
}

; Function Attrs: convergent mustprogress nounwind
define hidden i32 @_Z7id2addri(i32 noundef %0) #5 {
  %2 = alloca %struct.TextureAddress, align 4, addrspace(5)
  %3 = alloca i32, align 4, addrspace(5)
  %4 = alloca i32, align 4, addrspace(5)
  %5 = alloca i32, align 4, addrspace(5)
  %6 = alloca i32, align 4, addrspace(5)
  %7 = addrspacecast ptr addrspace(5) %2 to ptr
  %8 = addrspacecast ptr addrspace(5) %3 to ptr
  %9 = addrspacecast ptr addrspace(5) %4 to ptr
  %10 = addrspacecast ptr addrspace(5) %5 to ptr
  store i32 %0, ptr %8, align 4, !tbaa !8
  call void @llvm.lifetime.start.p5(i64 4, ptr addrspace(5) %4) #27
  %11 = load i32, ptr %8, align 4, !tbaa !8
  %12 = and i32 %11, 131071
  store i32 %12, ptr %9, align 4, !tbaa !8
  call void @llvm.lifetime.start.p5(i64 4, ptr addrspace(5) %5) #27
  %13 = load i32, ptr %8, align 4, !tbaa !8
  %14 = ashr i32 %13, 17
  store i32 %14, ptr %10, align 4, !tbaa !8
  %15 = load i32, ptr %10, align 4, !tbaa !8
  %16 = shl i32 %15, 5
  %17 = load i32, ptr %9, align 4, !tbaa !8
  %18 = and i32 %17, 31
  %19 = add nsw i32 %16, %18
  %20 = trunc i32 %19 to i16
  %21 = getelementptr inbounds %struct.TextureAddress, ptr %7, i32 0, i32 0
  %22 = getelementptr inbounds %struct.anon, ptr %21, i32 0, i32 1
  store i16 %20, ptr %22, align 2, !tbaa !12
  %23 = load i32, ptr %9, align 4, !tbaa !8
  %24 = ashr i32 %23, 5
  %25 = trunc i32 %24 to i16
  %26 = getelementptr inbounds %struct.TextureAddress, ptr %7, i32 0, i32 0
  %27 = getelementptr inbounds %struct.anon, ptr %26, i32 0, i32 0
  store i16 %25, ptr %27, align 4, !tbaa !12
  call void @llvm.lifetime.end.p5(i64 4, ptr addrspace(5) %5) #27
  call void @llvm.lifetime.end.p5(i64 4, ptr addrspace(5) %4) #27
  %28 = getelementptr inbounds %struct.TextureAddress, ptr %7, i32 0, i32 0
  %29 = getelementptr inbounds %union.anon, ptr %28, i32 0, i32 0
  %30 = load i32, ptr %29, align 4
  ret i32 %30
}

; Function Attrs: convergent mustprogress nounwind
define hidden void @_Z14arrayToAddress15HIP_vector_typeIhLj3EERj(i32 %0, ptr noundef nonnull align 4 dereferenceable(4) %1) #5 {
  %3 = alloca %struct.HIP_vector_type, align 1, addrspace(5)
  %4 = alloca i32, align 4, addrspace(5)
  %5 = alloca ptr, align 8, addrspace(5)
  %6 = addrspacecast ptr addrspace(5) %3 to ptr
  %7 = addrspacecast ptr addrspace(5) %4 to ptr
  %8 = addrspacecast ptr addrspace(5) %5 to ptr
  %9 = getelementptr inbounds %struct.HIP_vector_type, ptr %6, i32 0, i32 0
  %10 = getelementptr inbounds %struct.HIP_vector_base, ptr %9, i32 0, i32 0
  %11 = getelementptr inbounds %union.anon.1, ptr %10, i32 0, i32 0
  %12 = getelementptr inbounds %"struct.HIP_vector_base<unsigned char, 3>::Native_vec_", ptr %11, i32 0, i32 0
  store i32 %0, ptr %7, align 4
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %12, ptr align 4 %7, i64 3, i1 false)
  store ptr %1, ptr %8, align 8, !tbaa !4
  %13 = getelementptr inbounds %struct.HIP_vector_base, ptr %6, i32 0, i32 0
  %14 = getelementptr inbounds %struct.anon.2, ptr %13, i32 0, i32 0
  %15 = load i8, ptr %14, align 1, !tbaa !12
  %16 = zext i8 %15 to i32
  %17 = getelementptr inbounds %struct.HIP_vector_base, ptr %6, i32 0, i32 0
  %18 = getelementptr inbounds %struct.anon.2, ptr %17, i32 0, i32 2
  %19 = load i8, ptr %18, align 1, !tbaa !12
  %20 = zext i8 %19 to i32
  %21 = and i32 %20, 15
  %22 = shl i32 %21, 8
  %23 = or i32 %16, %22
  %24 = getelementptr inbounds %struct.HIP_vector_base, ptr %6, i32 0, i32 0
  %25 = getelementptr inbounds %struct.anon.2, ptr %24, i32 0, i32 1
  %26 = load i8, ptr %25, align 1, !tbaa !12
  %27 = zext i8 %26 to i32
  %28 = getelementptr inbounds %struct.HIP_vector_base, ptr %6, i32 0, i32 0
  %29 = getelementptr inbounds %struct.anon.2, ptr %28, i32 0, i32 2
  %30 = load i8, ptr %29, align 1, !tbaa !12
  %31 = zext i8 %30 to i32
  %32 = and i32 %31, 240
  %33 = shl i32 %32, 4
  %34 = or i32 %27, %33
  %35 = shl i32 %34, 16
  %36 = or i32 %23, %35
  %37 = load ptr, ptr %8, align 8, !tbaa !4
  store i32 %36, ptr %37, align 4, !tbaa !8
  ret void
}

; Function Attrs: argmemonly nocallback nofree nounwind willreturn
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #4

; Function Attrs: convergent mustprogress nounwind
define hidden noundef signext i8 @_Z6getRefiPc(i32 noundef %0, ptr noundef %1) #5 {
  %3 = alloca i8, align 1, addrspace(5)
  %4 = alloca i32, align 4, addrspace(5)
  %5 = alloca ptr, align 8, addrspace(5)
  %6 = addrspacecast ptr addrspace(5) %3 to ptr
  %7 = addrspacecast ptr addrspace(5) %4 to ptr
  %8 = addrspacecast ptr addrspace(5) %5 to ptr
  store i32 %0, ptr %7, align 4, !tbaa !8
  store ptr %1, ptr %8, align 8, !tbaa !4
  %9 = load ptr, ptr %8, align 8, !tbaa !4
  %10 = load i32, ptr %7, align 4, !tbaa !8
  %11 = sext i32 %10 to i64
  %12 = getelementptr inbounds i8, ptr %9, i64 %11
  %13 = load i8, ptr %12, align 1, !tbaa !12
  ret i8 %13
}

; Function Attrs: convergent mustprogress nounwind
define hidden noundef signext i8 @_Z2rcc(i8 noundef signext %0) #5 {
  %2 = alloca i8, align 1, addrspace(5)
  %3 = alloca i8, align 1, addrspace(5)
  %4 = addrspacecast ptr addrspace(5) %2 to ptr
  %5 = addrspacecast ptr addrspace(5) %3 to ptr
  store i8 %0, ptr %5, align 1, !tbaa !12
  %6 = load i8, ptr %5, align 1, !tbaa !12
  %7 = sext i8 %6 to i32
  switch i32 %7, label %13 [
    i32 65, label %8
    i32 67, label %9
    i32 71, label %10
    i32 84, label %11
    i32 113, label %12
  ]

8:                                                ; preds = %1
  store i8 84, ptr %4, align 1
  br label %15

9:                                                ; preds = %1
  store i8 71, ptr %4, align 1
  br label %15

10:                                               ; preds = %1
  store i8 67, ptr %4, align 1
  br label %15

11:                                               ; preds = %1
  store i8 65, ptr %4, align 1
  br label %15

12:                                               ; preds = %1
  store i8 0, ptr %4, align 1
  br label %15

13:                                               ; preds = %1
  %14 = load i8, ptr %5, align 1, !tbaa !12
  store i8 %14, ptr %4, align 1
  br label %15

15:                                               ; preds = %13, %12, %11, %10, %9, %8
  %16 = load i8, ptr %4, align 1
  ret i8 %16
}

; Function Attrs: convergent mustprogress nounwind
define hidden %struct.HIP_vector_type.3 @_Z7getNodejb(i32 noundef %0, i1 noundef zeroext %1) #6 {
  %3 = alloca %struct.HIP_vector_type.3, align 16, addrspace(5)
  %4 = alloca i32, align 4, addrspace(5)
  %5 = alloca i8, align 1, addrspace(5)
  %6 = alloca %struct.texture, align 8, addrspace(5)
  %7 = addrspacecast ptr addrspace(5) %3 to ptr
  %8 = addrspacecast ptr addrspace(5) %4 to ptr
  %9 = addrspacecast ptr addrspace(5) %5 to ptr
  %10 = addrspacecast ptr addrspace(5) %6 to ptr
  store i32 %0, ptr %8, align 4, !tbaa !8
  %11 = zext i1 %1 to i8
  store i8 %11, ptr %9, align 1, !tbaa !18
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %10, ptr align 8 addrspacecast (ptr addrspace(1) @nodetex to ptr), i64 88, i1 false)
  %12 = load i32, ptr %8, align 4, !tbaa !8
  %13 = and i32 %12, 65535
  %14 = uitofp i32 %13 to float
  %15 = load i32, ptr %8, align 4, !tbaa !8
  %16 = and i32 %15, -65536
  %17 = lshr i32 %16, 16
  %18 = uitofp i32 %17 to float
  %19 = getelementptr inbounds %struct.texture, ptr %10, i32 0, i32 0
  %20 = load %struct.textureReference, ptr %19, align 8
  %21 = call %struct.HIP_vector_type.3 @_ZL5tex2DI15HIP_vector_typeIjLj4EEL18hipTextureReadMode0EEN13__hip_tex_retIT_XT0_EbE4typeE7textureIS4_Li2EXT0_EEff(%struct.textureReference %20, float noundef %14, float noundef %18) #30
  %22 = getelementptr inbounds %struct.HIP_vector_type.3, ptr %7, i32 0, i32 0
  %23 = extractvalue %struct.HIP_vector_type.3 %21, 0
  store %struct.HIP_vector_base.4 %23, ptr %22, align 16
  %24 = load %struct.HIP_vector_type.3, ptr %7, align 16
  ret %struct.HIP_vector_type.3 %24
}

; Function Attrs: alwaysinline convergent mustprogress nounwind
define internal %struct.HIP_vector_type.3 @_ZL5tex2DI15HIP_vector_typeIjLj4EEL18hipTextureReadMode0EEN13__hip_tex_retIT_XT0_EbE4typeE7textureIS4_Li2EXT0_EEff(%struct.textureReference %0, float noundef %1, float noundef %2) #7 {
  %4 = alloca %struct.HIP_vector_type.3, align 16, addrspace(5)
  %5 = alloca %struct.texture, align 8, addrspace(5)
  %6 = alloca float, align 4, addrspace(5)
  %7 = alloca float, align 4, addrspace(5)
  %8 = alloca ptr addrspace(4), align 8, addrspace(5)
  %9 = alloca ptr addrspace(4), align 8, addrspace(5)
  %10 = alloca <4 x float>, align 16, addrspace(5)
  %11 = alloca %struct.HIP_vector_type.23, align 8, addrspace(5)
  %12 = alloca i32, align 4, addrspace(5)
  %13 = addrspacecast ptr addrspace(5) %4 to ptr
  %14 = addrspacecast ptr addrspace(5) %5 to ptr
  %15 = addrspacecast ptr addrspace(5) %6 to ptr
  %16 = addrspacecast ptr addrspace(5) %7 to ptr
  %17 = addrspacecast ptr addrspace(5) %8 to ptr
  %18 = addrspacecast ptr addrspace(5) %9 to ptr
  %19 = addrspacecast ptr addrspace(5) %10 to ptr
  %20 = addrspacecast ptr addrspace(5) %11 to ptr
  %21 = getelementptr inbounds %struct.texture, ptr %14, i32 0, i32 0
  %22 = getelementptr inbounds %struct.textureReference, ptr %21, i32 0, i32 0
  %23 = extractvalue %struct.textureReference %0, 0
  store i32 %23, ptr %22, align 8
  %24 = getelementptr inbounds %struct.textureReference, ptr %21, i32 0, i32 1
  %25 = extractvalue %struct.textureReference %0, 1
  store i32 %25, ptr %24, align 4
  %26 = getelementptr inbounds %struct.textureReference, ptr %21, i32 0, i32 2
  %27 = extractvalue %struct.textureReference %0, 2
  store i32 %27, ptr %26, align 8
  %28 = getelementptr inbounds %struct.textureReference, ptr %21, i32 0, i32 3
  %29 = extractvalue %struct.textureReference %0, 3
  store [3 x i32] %29, ptr %28, align 4
  %30 = getelementptr inbounds %struct.textureReference, ptr %21, i32 0, i32 4
  %31 = extractvalue %struct.textureReference %0, 4
  store %struct.hipChannelFormatDesc %31, ptr %30, align 8
  %32 = getelementptr inbounds %struct.textureReference, ptr %21, i32 0, i32 5
  %33 = extractvalue %struct.textureReference %0, 5
  store i32 %33, ptr %32, align 4
  %34 = getelementptr inbounds %struct.textureReference, ptr %21, i32 0, i32 6
  %35 = extractvalue %struct.textureReference %0, 6
  store i32 %35, ptr %34, align 8
  %36 = getelementptr inbounds %struct.textureReference, ptr %21, i32 0, i32 7
  %37 = extractvalue %struct.textureReference %0, 7
  store i32 %37, ptr %36, align 4
  %38 = getelementptr inbounds %struct.textureReference, ptr %21, i32 0, i32 8
  %39 = extractvalue %struct.textureReference %0, 8
  store float %39, ptr %38, align 8
  %40 = getelementptr inbounds %struct.textureReference, ptr %21, i32 0, i32 9
  %41 = extractvalue %struct.textureReference %0, 9
  store float %41, ptr %40, align 4
  %42 = getelementptr inbounds %struct.textureReference, ptr %21, i32 0, i32 10
  %43 = extractvalue %struct.textureReference %0, 10
  store float %43, ptr %42, align 8
  %44 = getelementptr inbounds %struct.textureReference, ptr %21, i32 0, i32 11
  %45 = extractvalue %struct.textureReference %0, 11
  store ptr %45, ptr %44, align 8
  %46 = getelementptr inbounds %struct.textureReference, ptr %21, i32 0, i32 12
  %47 = extractvalue %struct.textureReference %0, 12
  store i32 %47, ptr %46, align 8
  %48 = getelementptr inbounds %struct.textureReference, ptr %21, i32 0, i32 13
  %49 = extractvalue %struct.textureReference %0, 13
  store i32 %49, ptr %48, align 4
  store float %1, ptr %15, align 4, !tbaa !20
  store float %2, ptr %16, align 4, !tbaa !20
  call void @llvm.lifetime.start.p5(i64 8, ptr addrspace(5) %8) #27
  %50 = getelementptr inbounds %struct.textureReference, ptr %14, i32 0, i32 11
  %51 = load ptr, ptr %50, align 8, !tbaa !22
  %52 = addrspacecast ptr %51 to ptr addrspace(4)
  store ptr addrspace(4) %52, ptr %17, align 8, !tbaa !4
  call void @llvm.lifetime.start.p5(i64 8, ptr addrspace(5) %9) #27
  %53 = load ptr addrspace(4), ptr %17, align 8, !tbaa !4
  %54 = getelementptr inbounds i32, ptr addrspace(4) %53, i64 12
  store ptr addrspace(4) %54, ptr %18, align 8, !tbaa !4
  call void @llvm.lifetime.start.p5(i64 16, ptr addrspace(5) %10) #27
  %55 = load ptr addrspace(4), ptr %17, align 8, !tbaa !4
  %56 = load ptr addrspace(4), ptr %18, align 8, !tbaa !4
  call void @llvm.lifetime.start.p5(i64 8, ptr addrspace(5) %11) #27
  %57 = load float, ptr %15, align 4, !tbaa !20
  %58 = load float, ptr %16, align 4, !tbaa !20
  call void @_ZN15HIP_vector_typeIfLj2EEC2IJffELPv0EEEDpT_(ptr noundef nonnull align 8 dereferenceable(8) %20, float noundef %57, float noundef %58) #30
  %59 = getelementptr inbounds %struct.HIP_vector_base.24, ptr %20, i32 0, i32 0
  %60 = load <2 x float>, ptr %59, align 8, !tbaa !12
  %61 = call contract <4 x float> @__ockl_image_sample_2D(ptr addrspace(4) noundef %55, ptr addrspace(4) noundef %56, <2 x float> noundef %60) #30
  call void @llvm.lifetime.end.p5(i64 8, ptr addrspace(5) %11) #27
  store <4 x float> %61, ptr %19, align 16, !tbaa !12
  %62 = call %struct.HIP_vector_type.3 @_Z7mapFromI15HIP_vector_typeIjLj4EEDv4_fENSt9enable_ifIXooooooeqstT_stNS4_10value_typeEsr3std7is_sameIS5_iEE5valuesr3std7is_sameIS5_jEE5valuesr3std7is_sameIS5_fEE5valueEKS4_E4typeERKT0_(ptr noundef nonnull align 16 dereferenceable(16) %19) #30
  %63 = getelementptr inbounds %struct.HIP_vector_type.3, ptr %13, i32 0, i32 0
  %64 = extractvalue %struct.HIP_vector_type.3 %62, 0
  store %struct.HIP_vector_base.4 %64, ptr %63, align 16
  call void @llvm.lifetime.end.p5(i64 16, ptr addrspace(5) %10) #27
  call void @llvm.lifetime.end.p5(i64 8, ptr addrspace(5) %9) #27
  call void @llvm.lifetime.end.p5(i64 8, ptr addrspace(5) %8) #27
  %65 = load %struct.HIP_vector_type.3, ptr %13, align 16
  ret %struct.HIP_vector_type.3 %65
}

; Function Attrs: convergent mustprogress nounwind
define hidden %struct.HIP_vector_type.3 @_Z11getChildrenjb(i32 noundef %0, i1 noundef zeroext %1) #6 {
  %3 = alloca %struct.HIP_vector_type.3, align 16, addrspace(5)
  %4 = alloca i32, align 4, addrspace(5)
  %5 = alloca i8, align 1, addrspace(5)
  %6 = alloca %struct.texture, align 8, addrspace(5)
  %7 = addrspacecast ptr addrspace(5) %3 to ptr
  %8 = addrspacecast ptr addrspace(5) %4 to ptr
  %9 = addrspacecast ptr addrspace(5) %5 to ptr
  %10 = addrspacecast ptr addrspace(5) %6 to ptr
  store i32 %0, ptr %8, align 4, !tbaa !8
  %11 = zext i1 %1 to i8
  store i8 %11, ptr %9, align 1, !tbaa !18
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %10, ptr align 8 addrspacecast (ptr addrspace(1) @childrentex to ptr), i64 88, i1 false)
  %12 = load i32, ptr %8, align 4, !tbaa !8
  %13 = and i32 %12, 65535
  %14 = uitofp i32 %13 to float
  %15 = load i32, ptr %8, align 4, !tbaa !8
  %16 = and i32 %15, -65536
  %17 = lshr i32 %16, 16
  %18 = uitofp i32 %17 to float
  %19 = getelementptr inbounds %struct.texture, ptr %10, i32 0, i32 0
  %20 = load %struct.textureReference, ptr %19, align 8
  %21 = call %struct.HIP_vector_type.3 @_ZL5tex2DI15HIP_vector_typeIjLj4EEL18hipTextureReadMode0EEN13__hip_tex_retIT_XT0_EbE4typeE7textureIS4_Li2EXT0_EEff(%struct.textureReference %20, float noundef %14, float noundef %18) #30
  %22 = getelementptr inbounds %struct.HIP_vector_type.3, ptr %7, i32 0, i32 0
  %23 = extractvalue %struct.HIP_vector_type.3 %21, 0
  store %struct.HIP_vector_base.4 %23, ptr %22, align 16
  %24 = load %struct.HIP_vector_type.3, ptr %7, align 16
  ret %struct.HIP_vector_type.3 %24
}

; Function Attrs: convergent mustprogress nounwind
define hidden void @_Z10set_resultjP11_MatchCoordiiii(i32 noundef %0, ptr noundef %1, i32 noundef %2, i32 noundef %3, i32 noundef %4, i32 noundef %5) #5 {
  %7 = alloca i32, align 4, addrspace(5)
  %8 = alloca ptr, align 8, addrspace(5)
  %9 = alloca i32, align 4, addrspace(5)
  %10 = alloca i32, align 4, addrspace(5)
  %11 = alloca i32, align 4, addrspace(5)
  %12 = alloca i32, align 4, addrspace(5)
  %13 = alloca %struct.HIP_vector_type.8, align 8, addrspace(5)
  %14 = addrspacecast ptr addrspace(5) %7 to ptr
  %15 = addrspacecast ptr addrspace(5) %8 to ptr
  %16 = addrspacecast ptr addrspace(5) %9 to ptr
  %17 = addrspacecast ptr addrspace(5) %10 to ptr
  %18 = addrspacecast ptr addrspace(5) %11 to ptr
  %19 = addrspacecast ptr addrspace(5) %12 to ptr
  %20 = addrspacecast ptr addrspace(5) %13 to ptr
  store i32 %0, ptr %14, align 4, !tbaa !8
  store ptr %1, ptr %15, align 8, !tbaa !4
  store i32 %2, ptr %16, align 4, !tbaa !8
  store i32 %3, ptr %17, align 4, !tbaa !8
  store i32 %4, ptr %18, align 4, !tbaa !8
  store i32 %5, ptr %19, align 4, !tbaa !8
  %21 = load i32, ptr %17, align 4, !tbaa !8
  %22 = load i32, ptr %18, align 4, !tbaa !8
  %23 = icmp sgt i32 %21, %22
  br i1 %23, label %24, label %37

24:                                               ; preds = %6
  %25 = load i32, ptr %19, align 4, !tbaa !8
  %26 = load i32, ptr %16, align 4, !tbaa !8
  %27 = or i32 %26, %25
  store i32 %27, ptr %16, align 4, !tbaa !8
  call void @llvm.lifetime.start.p5(i64 8, ptr addrspace(5) %13) #27
  %28 = load i32, ptr %14, align 4, !tbaa !8
  %29 = load i32, ptr %16, align 4, !tbaa !8
  %30 = call [2 x i32] @_ZL9make_int2ii(i32 noundef %28, i32 noundef %29) #30
  %31 = getelementptr inbounds %struct.HIP_vector_type.8, ptr %20, i32 0, i32 0
  %32 = getelementptr inbounds %struct.HIP_vector_base.9, ptr %31, i32 0, i32 0
  %33 = getelementptr inbounds %union.anon.10, ptr %32, i32 0, i32 0
  store [2 x i32] %30, ptr %33, align 8
  %34 = load ptr, ptr %15, align 8, !tbaa !4
  %35 = getelementptr inbounds %struct._MatchCoord, ptr %34, i32 0, i32 0
  %36 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZN15HIP_vector_typeIiLj2EEaSEOS0_(ptr noundef nonnull align 8 dereferenceable(8) %35, ptr noundef nonnull align 8 dereferenceable(8) %20) #30
  call void @llvm.lifetime.end.p5(i64 8, ptr addrspace(5) %13) #27
  br label %40

37:                                               ; preds = %6
  br label %38

38:                                               ; preds = %37
  br label %39

39:                                               ; preds = %38
  br label %40

40:                                               ; preds = %39, %24
  ret void
}

; Function Attrs: convergent inlinehint mustprogress nounwind
define internal [2 x i32] @_ZL9make_int2ii(i32 noundef %0, i32 noundef %1) #8 {
  %3 = alloca %struct.HIP_vector_type.8, align 8, addrspace(5)
  %4 = alloca i32, align 4, addrspace(5)
  %5 = alloca i32, align 4, addrspace(5)
  %6 = addrspacecast ptr addrspace(5) %3 to ptr
  %7 = addrspacecast ptr addrspace(5) %4 to ptr
  %8 = addrspacecast ptr addrspace(5) %5 to ptr
  store i32 %0, ptr %7, align 4, !tbaa !8
  store i32 %1, ptr %8, align 4, !tbaa !8
  %9 = load i32, ptr %7, align 4, !tbaa !8
  %10 = load i32, ptr %8, align 4, !tbaa !8
  call void @_ZN15HIP_vector_typeIiLj2EEC2IJiiELPv0EEEDpT_(ptr noundef nonnull align 8 dereferenceable(8) %6, i32 noundef %9, i32 noundef %10) #30
  %11 = getelementptr inbounds %struct.HIP_vector_type.8, ptr %6, i32 0, i32 0
  %12 = getelementptr inbounds %struct.HIP_vector_base.9, ptr %11, i32 0, i32 0
  %13 = getelementptr inbounds %union.anon.10, ptr %12, i32 0, i32 0
  %14 = load [2 x i32], ptr %13, align 8
  ret [2 x i32] %14
}

; Function Attrs: convergent nounwind
define linkonce_odr hidden noundef nonnull align 8 dereferenceable(8) ptr @_ZN15HIP_vector_typeIiLj2EEaSEOS0_(ptr noundef nonnull align 8 dereferenceable(8) %0, ptr noundef nonnull align 8 dereferenceable(8) %1) #9 comdat align 2 {
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
  %11 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZN15HIP_vector_baseIiLj2EEaSERKS0_(ptr noundef nonnull align 8 dereferenceable(8) %9, ptr noundef nonnull align 8 dereferenceable(8) %10) #30
  ret ptr %9
}

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z15mummergpuKernelPvPcS0_PKiS2_ii(ptr addrspace(1) noundef %0, ptr addrspace(1) noundef %1, ptr addrspace(1) noundef %2, ptr addrspace(1) noundef %3, ptr addrspace(1) noundef %4, i32 noundef %5, i32 noundef %6) #10 {
  %8 = alloca ptr, align 8, addrspace(5)
  %9 = alloca ptr, align 8, addrspace(5)
  %10 = alloca ptr, align 8, addrspace(5)
  %11 = alloca ptr, align 8, addrspace(5)
  %12 = alloca ptr, align 8, addrspace(5)
  %13 = alloca ptr, align 8, addrspace(5)
  %14 = alloca ptr, align 8, addrspace(5)
  %15 = alloca ptr, align 8, addrspace(5)
  %16 = alloca ptr, align 8, addrspace(5)
  %17 = alloca ptr, align 8, addrspace(5)
  %18 = alloca i32, align 4, addrspace(5)
  %19 = alloca i32, align 4, addrspace(5)
  %20 = alloca i32, align 4, addrspace(5)
  %21 = alloca i32, align 4, addrspace(5)
  %22 = alloca i32, align 4, addrspace(5)
  %23 = alloca i32, align 4, addrspace(5)
  %24 = alloca i32, align 4, addrspace(5)
  %25 = alloca i32, align 4, addrspace(5)
  %26 = alloca i32, align 4, addrspace(5)
  %27 = alloca ptr, align 8, addrspace(5)
  %28 = alloca i32, align 4, addrspace(5)
  %29 = alloca i32, align 4, addrspace(5)
  %30 = alloca i32, align 4, addrspace(5)
  %31 = alloca i32, align 4, addrspace(5)
  %32 = alloca i8, align 1, addrspace(5)
  %33 = alloca i32, align 4, addrspace(5)
  %34 = alloca %struct._PixelOfChildren, align 16, addrspace(5)
  %35 = alloca %struct.HIP_vector_type.3, align 16, addrspace(5)
  %36 = alloca %struct.HIP_vector_type, align 1, addrspace(5)
  %37 = alloca %struct.HIP_vector_type, align 1, addrspace(5)
  %38 = alloca i32, align 4, addrspace(5)
  %39 = alloca %struct.HIP_vector_type, align 1, addrspace(5)
  %40 = alloca i32, align 4, addrspace(5)
  %41 = alloca %struct._PixelOfNode, align 16, addrspace(5)
  %42 = alloca %struct.HIP_vector_type.3, align 16, addrspace(5)
  %43 = alloca i32, align 4, addrspace(5)
  %44 = alloca i32, align 4, addrspace(5)
  %45 = alloca i32, align 4, addrspace(5)
  %46 = alloca i32, align 4, addrspace(5)
  %47 = alloca i32, align 4, addrspace(5)
  %48 = alloca i8, align 1, addrspace(5)
  %49 = alloca %struct._PixelOfNode, align 16, addrspace(5)
  %50 = alloca %struct.HIP_vector_type.3, align 16, addrspace(5)
  %51 = alloca %struct.HIP_vector_type, align 1, addrspace(5)
  %52 = alloca i32, align 4, addrspace(5)
  %53 = addrspacecast ptr addrspace(5) %8 to ptr
  %54 = addrspacecast ptr addrspace(5) %9 to ptr
  %55 = addrspacecast ptr addrspace(5) %10 to ptr
  %56 = addrspacecast ptr addrspace(5) %11 to ptr
  %57 = addrspacecast ptr addrspace(5) %12 to ptr
  %58 = addrspacecast ptr addrspace(5) %13 to ptr
  %59 = addrspacecast ptr addrspace(5) %14 to ptr
  %60 = addrspacecast ptr addrspace(5) %15 to ptr
  %61 = addrspacecast ptr addrspace(5) %16 to ptr
  %62 = addrspacecast ptr addrspace(5) %17 to ptr
  %63 = addrspacecast ptr addrspace(5) %18 to ptr
  %64 = addrspacecast ptr addrspace(5) %19 to ptr
  %65 = addrspacecast ptr addrspace(5) %20 to ptr
  %66 = addrspacecast ptr addrspace(5) %21 to ptr
  %67 = addrspacecast ptr addrspace(5) %22 to ptr
  %68 = addrspacecast ptr addrspace(5) %23 to ptr
  %69 = addrspacecast ptr addrspace(5) %24 to ptr
  %70 = addrspacecast ptr addrspace(5) %25 to ptr
  %71 = addrspacecast ptr addrspace(5) %26 to ptr
  %72 = addrspacecast ptr addrspace(5) %27 to ptr
  %73 = addrspacecast ptr addrspace(5) %28 to ptr
  %74 = addrspacecast ptr addrspace(5) %29 to ptr
  %75 = addrspacecast ptr addrspace(5) %30 to ptr
  %76 = addrspacecast ptr addrspace(5) %31 to ptr
  %77 = addrspacecast ptr addrspace(5) %32 to ptr
  %78 = addrspacecast ptr addrspace(5) %33 to ptr
  %79 = addrspacecast ptr addrspace(5) %34 to ptr
  %80 = addrspacecast ptr addrspace(5) %35 to ptr
  %81 = addrspacecast ptr addrspace(5) %36 to ptr
  %82 = addrspacecast ptr addrspace(5) %37 to ptr
  %83 = addrspacecast ptr addrspace(5) %38 to ptr
  %84 = addrspacecast ptr addrspace(5) %39 to ptr
  %85 = addrspacecast ptr addrspace(5) %40 to ptr
  %86 = addrspacecast ptr addrspace(5) %41 to ptr
  %87 = addrspacecast ptr addrspace(5) %42 to ptr
  %88 = addrspacecast ptr addrspace(5) %43 to ptr
  %89 = addrspacecast ptr addrspace(5) %44 to ptr
  %90 = addrspacecast ptr addrspace(5) %45 to ptr
  %91 = addrspacecast ptr addrspace(5) %46 to ptr
  %92 = addrspacecast ptr addrspace(5) %47 to ptr
  %93 = addrspacecast ptr addrspace(5) %48 to ptr
  %94 = addrspacecast ptr addrspace(5) %49 to ptr
  %95 = addrspacecast ptr addrspace(5) %50 to ptr
  %96 = addrspacecast ptr addrspace(5) %51 to ptr
  %97 = addrspacecast ptr addrspace(5) %52 to ptr
  %98 = addrspacecast ptr addrspace(1) %0 to ptr
  store ptr %98, ptr %53, align 8
  %99 = load ptr, ptr %53, align 8, !tbaa !4
  %100 = addrspacecast ptr addrspace(1) %1 to ptr
  store ptr %100, ptr %54, align 8
  %101 = load ptr, ptr %54, align 8, !tbaa !4
  %102 = addrspacecast ptr addrspace(1) %2 to ptr
  store ptr %102, ptr %55, align 8
  %103 = load ptr, ptr %55, align 8, !tbaa !4
  %104 = addrspacecast ptr addrspace(1) %3 to ptr
  store ptr %104, ptr %56, align 8
  %105 = load ptr, ptr %56, align 8, !tbaa !4
  %106 = addrspacecast ptr addrspace(1) %4 to ptr
  store ptr %106, ptr %57, align 8
  %107 = load ptr, ptr %57, align 8, !tbaa !4
  store ptr %99, ptr %58, align 8, !tbaa !4
  store ptr %101, ptr %59, align 8, !tbaa !4
  store ptr %103, ptr %60, align 8, !tbaa !4
  store ptr %105, ptr %61, align 8, !tbaa !4
  store ptr %107, ptr %62, align 8, !tbaa !4
  store i32 %5, ptr %63, align 4, !tbaa !8
  store i32 %6, ptr %64, align 4, !tbaa !8
  call void @llvm.lifetime.start.p5(i64 4, ptr addrspace(5) %20) #27
  %108 = call noundef i32 @_ZNK17__HIP_CoordinatesI14__HIP_BlockIdxE3__XcvjEv(ptr noundef nonnull align 1 dereferenceable(1) addrspacecast (ptr addrspace(4) @_ZN17__HIP_CoordinatesI14__HIP_BlockIdxE1xE to ptr)) #30
  %109 = call noundef i32 @_ZNK17__HIP_CoordinatesI14__HIP_BlockDimE3__XcvjEv(ptr noundef nonnull align 1 dereferenceable(1) addrspacecast (ptr addrspace(4) @_ZN17__HIP_CoordinatesI14__HIP_BlockDimE1xE to ptr)) #30
  %110 = call noundef i32 @_ZL8__umul24jj(i32 noundef %108, i32 noundef %109) #30
  %111 = call noundef i32 @_ZNK17__HIP_CoordinatesI15__HIP_ThreadIdxE3__XcvjEv(ptr noundef nonnull align 1 dereferenceable(1) addrspacecast (ptr addrspace(4) @_ZN17__HIP_CoordinatesI15__HIP_ThreadIdxE1xE to ptr)) #30
  %112 = add i32 %110, %111
  store i32 %112, ptr %65, align 4, !tbaa !8
  %113 = load i32, ptr %65, align 4, !tbaa !8
  %114 = load i32, ptr %63, align 4, !tbaa !8
  %115 = icmp sge i32 %113, %114
  br i1 %115, label %116, label %117

116:                                              ; preds = %7
  store i32 1, ptr %66, align 4
  br label %412

117:                                              ; preds = %7
  br label %118

118:                                              ; preds = %117
  br label %119

119:                                              ; preds = %118
  br label %120

120:                                              ; preds = %119
  %121 = load i32, ptr %65, align 4, !tbaa !8
  %122 = icmp eq i32 %121, 0
  br i1 %122, label %123, label %124

123:                                              ; preds = %120
  br label %124

124:                                              ; preds = %123, %120
  call void @llvm.lifetime.start.p5(i64 4, ptr addrspace(5) %22) #27
  %125 = load ptr, ptr %62, align 8, !tbaa !4
  %126 = load i32, ptr %65, align 4, !tbaa !8
  %127 = sext i32 %126 to i64
  %128 = getelementptr inbounds i32, ptr %125, i64 %127
  %129 = load i32, ptr %128, align 4, !tbaa !8
  store i32 %129, ptr %67, align 4, !tbaa !8
  call void @llvm.lifetime.start.p5(i64 4, ptr addrspace(5) %23) #27
  %130 = load ptr, ptr %61, align 8, !tbaa !4
  %131 = load i32, ptr %65, align 4, !tbaa !8
  %132 = sext i32 %131 to i64
  %133 = getelementptr inbounds i32, ptr %130, i64 %132
  %134 = load i32, ptr %133, align 4, !tbaa !8
  store i32 %134, ptr %68, align 4, !tbaa !8
  call void @llvm.lifetime.start.p5(i64 4, ptr addrspace(5) %24) #27
  store i32 0, ptr %69, align 4, !tbaa !8
  call void @llvm.lifetime.start.p5(i64 4, ptr addrspace(5) %25) #27
  store i32 0, ptr %70, align 4, !tbaa !8
  call void @llvm.lifetime.start.p5(i64 4, ptr addrspace(5) %26) #27
  store i32 0, ptr %71, align 4, !tbaa !8
  call void @llvm.lifetime.start.p5(i64 8, ptr addrspace(5) %27) #27
  %135 = load ptr, ptr %58, align 8, !tbaa !4
  %136 = load i32, ptr %68, align 4, !tbaa !8
  %137 = sext i32 %136 to i64
  %138 = getelementptr inbounds %struct._MatchCoord, ptr %135, i64 %137
  %139 = load i32, ptr %65, align 4, !tbaa !8
  %140 = load i32, ptr %64, align 4, !tbaa !8
  %141 = add nsw i32 %140, 1
  %142 = call noundef i32 @_ZL8__umul24jj(i32 noundef %139, i32 noundef %141) #30
  %143 = sext i32 %142 to i64
  %144 = sub i64 0, %143
  %145 = getelementptr inbounds %struct._MatchCoord, ptr %138, i64 %144
  store ptr %145, ptr %72, align 8, !tbaa !4
  %146 = load i32, ptr %68, align 4, !tbaa !8
  %147 = load ptr, ptr %59, align 8, !tbaa !4
  %148 = sext i32 %146 to i64
  %149 = getelementptr inbounds i8, ptr %147, i64 %148
  store ptr %149, ptr %59, align 8, !tbaa !4
  call void @llvm.lifetime.start.p5(i64 4, ptr addrspace(5) %28) #27
  %150 = load i32, ptr %67, align 4, !tbaa !8
  %151 = load i32, ptr %64, align 4, !tbaa !8
  %152 = sub nsw i32 %150, %151
  store i32 %152, ptr %73, align 4, !tbaa !8
  call void @llvm.lifetime.start.p5(i64 4, ptr addrspace(5) %29) #27
  store i32 0, ptr %74, align 4, !tbaa !8
  br label %153

153:                                              ; preds = %406, %124
  %154 = load i32, ptr %74, align 4, !tbaa !8
  %155 = load i32, ptr %73, align 4, !tbaa !8
  %156 = icmp sle i32 %154, %155
  br i1 %156, label %158, label %157

157:                                              ; preds = %153
  store i32 4, ptr %66, align 4
  call void @llvm.lifetime.end.p5(i64 4, ptr addrspace(5) %29) #27
  br label %411

158:                                              ; preds = %153
  call void @llvm.lifetime.start.p5(i64 4, ptr addrspace(5) %30) #27
  call void @llvm.lifetime.start.p5(i64 4, ptr addrspace(5) %31) #27
  %159 = load i32, ptr %69, align 4, !tbaa !8
  %160 = icmp eq i32 %159, 0
  br i1 %160, label %164, label %161

161:                                              ; preds = %158
  %162 = load i32, ptr %71, align 4, !tbaa !8
  %163 = icmp slt i32 %162, 1
  br i1 %163, label %164, label %165

164:                                              ; preds = %161, %158
  store i32 65536, ptr %69, align 4, !tbaa !8
  store i32 1, ptr %71, align 4, !tbaa !8
  store i32 0, ptr %70, align 4, !tbaa !8
  br label %165

165:                                              ; preds = %164, %161
  call void @llvm.lifetime.start.p5(i64 1, ptr addrspace(5) %32) #27
  %166 = load ptr, ptr %59, align 8, !tbaa !4
  %167 = load i32, ptr %74, align 4, !tbaa !8
  %168 = load i32, ptr %71, align 4, !tbaa !8
  %169 = add nsw i32 %167, %168
  %170 = sext i32 %169 to i64
  %171 = getelementptr inbounds i8, ptr %166, i64 %170
  %172 = load i8, ptr %171, align 1, !tbaa !12
  store i8 %172, ptr %77, align 1, !tbaa !12
  br label %173

173:                                              ; preds = %165
  br label %174

174:                                              ; preds = %173
  br label %175

175:                                              ; preds = %174
  call void @llvm.lifetime.start.p5(i64 4, ptr addrspace(5) %33) #27
  store i32 0, ptr %78, align 4, !tbaa !8
  br label %176

176:                                              ; preds = %369, %175
  %177 = load i8, ptr %77, align 1, !tbaa !12
  %178 = sext i8 %177 to i32
  %179 = icmp ne i32 %178, 0
  br i1 %179, label %180, label %370

180:                                              ; preds = %176
  br label %181

181:                                              ; preds = %180
  br label %182

182:                                              ; preds = %181
  br label %183

183:                                              ; preds = %182
  call void @llvm.lifetime.start.p5(i64 16, ptr addrspace(5) %34) #27
  call void @llvm.lifetime.start.p5(i64 16, ptr addrspace(5) %35) #27
  %184 = load i32, ptr %69, align 4, !tbaa !8
  %185 = call %struct.HIP_vector_type.3 @_Z11getChildrenjb(i32 noundef %184, i1 noundef zeroext false) #30
  %186 = getelementptr inbounds %struct.HIP_vector_type.3, ptr %80, i32 0, i32 0
  %187 = extractvalue %struct.HIP_vector_type.3 %185, 0
  store %struct.HIP_vector_base.4 %187, ptr %186, align 16
  %188 = getelementptr inbounds %struct._PixelOfChildren, ptr %79, i32 0, i32 0
  %189 = call noundef nonnull align 16 dereferenceable(16) ptr @_ZN15HIP_vector_typeIjLj4EEaSEOS0_(ptr noundef nonnull align 16 dereferenceable(16) %188, ptr noundef nonnull align 16 dereferenceable(16) %80) #30
  call void @llvm.lifetime.end.p5(i64 16, ptr addrspace(5) %35) #27
  %190 = load i32, ptr %69, align 4, !tbaa !8
  store i32 %190, ptr %76, align 4, !tbaa !8
  call void @llvm.lifetime.start.p5(i64 3, ptr addrspace(5) %36) #27
  %191 = load i8, ptr %77, align 1, !tbaa !12
  %192 = sext i8 %191 to i32
  switch i32 %192, label %205 [
    i32 65, label %193
    i32 67, label %196
    i32 71, label %199
    i32 84, label %202
  ]

193:                                              ; preds = %183
  %194 = getelementptr inbounds %struct._PixelOfChildren, ptr %79, i32 0, i32 0
  %195 = getelementptr inbounds %struct.anon.17, ptr %194, i32 0, i32 0
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %81, ptr align 16 %195, i64 3, i1 false)
  br label %211

196:                                              ; preds = %183
  %197 = getelementptr inbounds %struct._PixelOfChildren, ptr %79, i32 0, i32 0
  %198 = getelementptr inbounds %struct.anon.17, ptr %197, i32 0, i32 1
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %81, ptr align 1 %198, i64 3, i1 false)
  br label %211

199:                                              ; preds = %183
  %200 = getelementptr inbounds %struct._PixelOfChildren, ptr %79, i32 0, i32 0
  %201 = getelementptr inbounds %struct.anon.17, ptr %200, i32 0, i32 2
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %81, ptr align 2 %201, i64 3, i1 false)
  br label %211

202:                                              ; preds = %183
  %203 = getelementptr inbounds %struct._PixelOfChildren, ptr %79, i32 0, i32 0
  %204 = getelementptr inbounds %struct.anon.17, ptr %203, i32 0, i32 3
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %81, ptr align 1 %204, i64 3, i1 false)
  br label %211

205:                                              ; preds = %183
  call void @llvm.lifetime.start.p5(i64 3, ptr addrspace(5) %37) #27
  %206 = call i32 @_ZL11make_uchar3hhh(i8 noundef zeroext 0, i8 noundef zeroext 0, i8 noundef zeroext 0) #30
  %207 = getelementptr inbounds %struct.HIP_vector_type, ptr %82, i32 0, i32 0
  %208 = getelementptr inbounds %struct.HIP_vector_base, ptr %207, i32 0, i32 0
  %209 = getelementptr inbounds %union.anon.1, ptr %208, i32 0, i32 0
  %210 = getelementptr inbounds %"struct.HIP_vector_base<unsigned char, 3>::Native_vec_", ptr %209, i32 0, i32 0
  store i32 %206, ptr %83, align 4
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %210, ptr align 4 %83, i64 3, i1 false)
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %81, ptr align 1 %82, i64 3, i1 false)
  call void @llvm.lifetime.end.p5(i64 3, ptr addrspace(5) %37) #27
  br label %211

211:                                              ; preds = %205, %202, %199, %196, %193
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %84, ptr align 1 %81, i64 3, i1 false)
  %212 = getelementptr inbounds %struct.HIP_vector_type, ptr %84, i32 0, i32 0
  %213 = getelementptr inbounds %struct.HIP_vector_base, ptr %212, i32 0, i32 0
  %214 = getelementptr inbounds %union.anon.1, ptr %213, i32 0, i32 0
  %215 = getelementptr inbounds %"struct.HIP_vector_base<unsigned char, 3>::Native_vec_", ptr %214, i32 0, i32 0
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %85, ptr align 1 %215, i64 3, i1 false)
  %216 = load i32, ptr %85, align 4
  call void @_Z14arrayToAddress15HIP_vector_typeIhLj3EERj(i32 %216, ptr noundef nonnull align 4 dereferenceable(4) %69) #30
  br label %217

217:                                              ; preds = %211
  br label %218

218:                                              ; preds = %217
  br label %219

219:                                              ; preds = %218
  %220 = load i32, ptr %69, align 4, !tbaa !8
  %221 = icmp eq i32 %220, 0
  br i1 %221, label %222, label %232

222:                                              ; preds = %219
  br label %223

223:                                              ; preds = %222
  br label %224

224:                                              ; preds = %223
  br label %225

225:                                              ; preds = %224
  %226 = load i32, ptr %76, align 4, !tbaa !8
  %227 = load ptr, ptr %72, align 8, !tbaa !4
  %228 = load i32, ptr %71, align 4, !tbaa !8
  %229 = load i32, ptr %64, align 4, !tbaa !8
  call void @_Z10set_resultjP11_MatchCoordiiii(i32 noundef %226, ptr noundef %227, i32 noundef 0, i32 noundef %228, i32 noundef %229, i32 noundef 0) #30
  %230 = load i32, ptr %71, align 4, !tbaa !8
  %231 = sub nsw i32 %230, 1
  store i32 %231, ptr %71, align 4, !tbaa !8
  store i32 0, ptr %70, align 4, !tbaa !8
  store i32 18, ptr %66, align 4
  br label %367

232:                                              ; preds = %219
  call void @llvm.lifetime.start.p5(i64 16, ptr addrspace(5) %41) #27
  call void @llvm.lifetime.start.p5(i64 16, ptr addrspace(5) %42) #27
  %233 = load i32, ptr %69, align 4, !tbaa !8
  %234 = call %struct.HIP_vector_type.3 @_Z7getNodejb(i32 noundef %233, i1 noundef zeroext true) #30
  %235 = getelementptr inbounds %struct.HIP_vector_type.3, ptr %87, i32 0, i32 0
  %236 = extractvalue %struct.HIP_vector_type.3 %234, 0
  store %struct.HIP_vector_base.4 %236, ptr %235, align 16
  %237 = getelementptr inbounds %struct._PixelOfNode, ptr %86, i32 0, i32 0
  %238 = call noundef nonnull align 16 dereferenceable(16) ptr @_ZN15HIP_vector_typeIjLj4EEaSEOS0_(ptr noundef nonnull align 16 dereferenceable(16) %237, ptr noundef nonnull align 16 dereferenceable(16) %87) #30
  call void @llvm.lifetime.end.p5(i64 16, ptr addrspace(5) %42) #27
  %239 = getelementptr inbounds %struct._PixelOfNode, ptr %86, i32 0, i32 0
  %240 = getelementptr inbounds %struct.anon.20, ptr %239, i32 0, i32 2
  %241 = getelementptr inbounds %struct.HIP_vector_base, ptr %240, i32 0, i32 0
  %242 = getelementptr inbounds %struct.anon.2, ptr %241, i32 0, i32 0
  %243 = load i8, ptr %242, align 2, !tbaa !12
  %244 = zext i8 %243 to i32
  %245 = getelementptr inbounds %struct._PixelOfNode, ptr %86, i32 0, i32 0
  %246 = getelementptr inbounds %struct.anon.20, ptr %245, i32 0, i32 2
  %247 = getelementptr inbounds %struct.HIP_vector_base, ptr %246, i32 0, i32 0
  %248 = getelementptr inbounds %struct.anon.2, ptr %247, i32 0, i32 1
  %249 = load i8, ptr %248, align 1, !tbaa !12
  %250 = zext i8 %249 to i32
  %251 = shl i32 %250, 8
  %252 = or i32 %244, %251
  %253 = getelementptr inbounds %struct._PixelOfNode, ptr %86, i32 0, i32 0
  %254 = getelementptr inbounds %struct.anon.20, ptr %253, i32 0, i32 2
  %255 = getelementptr inbounds %struct.HIP_vector_base, ptr %254, i32 0, i32 0
  %256 = getelementptr inbounds %struct.anon.2, ptr %255, i32 0, i32 2
  %257 = load i8, ptr %256, align 2, !tbaa !12
  %258 = zext i8 %257 to i32
  %259 = shl i32 %258, 16
  %260 = or i32 %252, %259
  store i32 %260, ptr %75, align 4, !tbaa !8
  call void @llvm.lifetime.start.p5(i64 4, ptr addrspace(5) %43) #27
  %261 = getelementptr inbounds %struct._PixelOfNode, ptr %86, i32 0, i32 0
  %262 = getelementptr inbounds %struct.anon.20, ptr %261, i32 0, i32 3
  %263 = getelementptr inbounds %struct.HIP_vector_base, ptr %262, i32 0, i32 0
  %264 = getelementptr inbounds %struct.anon.2, ptr %263, i32 0, i32 0
  %265 = load i8, ptr %264, align 1, !tbaa !12
  %266 = zext i8 %265 to i32
  %267 = getelementptr inbounds %struct._PixelOfNode, ptr %86, i32 0, i32 0
  %268 = getelementptr inbounds %struct.anon.20, ptr %267, i32 0, i32 3
  %269 = getelementptr inbounds %struct.HIP_vector_base, ptr %268, i32 0, i32 0
  %270 = getelementptr inbounds %struct.anon.2, ptr %269, i32 0, i32 1
  %271 = load i8, ptr %270, align 1, !tbaa !12
  %272 = zext i8 %271 to i32
  %273 = shl i32 %272, 8
  %274 = or i32 %266, %273
  %275 = getelementptr inbounds %struct._PixelOfNode, ptr %86, i32 0, i32 0
  %276 = getelementptr inbounds %struct.anon.20, ptr %275, i32 0, i32 3
  %277 = getelementptr inbounds %struct.HIP_vector_base, ptr %276, i32 0, i32 0
  %278 = getelementptr inbounds %struct.anon.2, ptr %277, i32 0, i32 2
  %279 = load i8, ptr %278, align 1, !tbaa !12
  %280 = zext i8 %279 to i32
  %281 = shl i32 %280, 16
  %282 = or i32 %274, %281
  store i32 %282, ptr %88, align 4, !tbaa !8
  br label %283

283:                                              ; preds = %232
  br label %284

284:                                              ; preds = %283
  br label %285

285:                                              ; preds = %284
  call void @llvm.lifetime.start.p5(i64 4, ptr addrspace(5) %44) #27
  %286 = load i32, ptr %88, align 4, !tbaa !8
  %287 = load i32, ptr %75, align 4, !tbaa !8
  %288 = sub i32 %286, %287
  %289 = add i32 %288, 1
  store i32 %289, ptr %89, align 4, !tbaa !8
  call void @llvm.lifetime.start.p5(i64 4, ptr addrspace(5) %45) #27
  %290 = load i32, ptr %75, align 4, !tbaa !8
  %291 = load i32, ptr %70, align 4, !tbaa !8
  %292 = add i32 %290, %291
  store i32 %292, ptr %90, align 4, !tbaa !8
  call void @llvm.lifetime.start.p5(i64 4, ptr addrspace(5) %46) #27
  %293 = load i32, ptr %88, align 4, !tbaa !8
  %294 = add i32 %293, 1
  store i32 %294, ptr %91, align 4, !tbaa !8
  call void @llvm.lifetime.start.p5(i64 4, ptr addrspace(5) %47) #27
  %295 = load i32, ptr %70, align 4, !tbaa !8
  %296 = load i32, ptr %89, align 4, !tbaa !8
  %297 = sub nsw i32 %295, %296
  store i32 %297, ptr %92, align 4, !tbaa !8
  %298 = load i32, ptr %70, align 4, !tbaa !8
  %299 = icmp ne i32 %298, 0
  br i1 %299, label %300, label %311

300:                                              ; preds = %285
  %301 = load i32, ptr %90, align 4, !tbaa !8
  %302 = load i32, ptr %91, align 4, !tbaa !8
  %303 = call noundef i32 @_ZL3minii(i32 noundef %301, i32 noundef %302) #30
  store i32 %303, ptr %78, align 4, !tbaa !8
  %304 = load i32, ptr %89, align 4, !tbaa !8
  %305 = load i32, ptr %70, align 4, !tbaa !8
  %306 = call noundef i32 @_ZL3minii(i32 noundef %304, i32 noundef %305) #30
  %307 = load i32, ptr %71, align 4, !tbaa !8
  %308 = add nsw i32 %307, %306
  store i32 %308, ptr %71, align 4, !tbaa !8
  %309 = load i32, ptr %92, align 4, !tbaa !8
  %310 = call noundef i32 @_ZL3maxii(i32 noundef %309, i32 noundef 0) #30
  store i32 %310, ptr %70, align 4, !tbaa !8
  br label %316

311:                                              ; preds = %285
  %312 = load i32, ptr %71, align 4, !tbaa !8
  %313 = add nsw i32 %312, 1
  store i32 %313, ptr %71, align 4, !tbaa !8
  %314 = load i32, ptr %75, align 4, !tbaa !8
  %315 = add i32 %314, 1
  store i32 %315, ptr %78, align 4, !tbaa !8
  br label %316

316:                                              ; preds = %311, %300
  call void @llvm.lifetime.end.p5(i64 4, ptr addrspace(5) %47) #27
  call void @llvm.lifetime.end.p5(i64 4, ptr addrspace(5) %46) #27
  call void @llvm.lifetime.end.p5(i64 4, ptr addrspace(5) %45) #27
  call void @llvm.lifetime.end.p5(i64 4, ptr addrspace(5) %44) #27
  %317 = load ptr, ptr %59, align 8, !tbaa !4
  %318 = load i32, ptr %74, align 4, !tbaa !8
  %319 = load i32, ptr %71, align 4, !tbaa !8
  %320 = add nsw i32 %318, %319
  %321 = sext i32 %320 to i64
  %322 = getelementptr inbounds i8, ptr %317, i64 %321
  %323 = load i8, ptr %322, align 1, !tbaa !12
  store i8 %323, ptr %77, align 1, !tbaa !12
  br label %324

324:                                              ; preds = %364, %316
  %325 = load i32, ptr %78, align 4, !tbaa !8
  %326 = load i32, ptr %88, align 4, !tbaa !8
  %327 = icmp ule i32 %325, %326
  br i1 %327, label %328, label %332

328:                                              ; preds = %324
  %329 = load i8, ptr %77, align 1, !tbaa !12
  %330 = sext i8 %329 to i32
  %331 = icmp ne i32 %330, 0
  br label %332

332:                                              ; preds = %328, %324
  %333 = phi i1 [ false, %324 ], [ %331, %328 ]
  br i1 %333, label %334, label %365

334:                                              ; preds = %332
  call void @llvm.lifetime.start.p5(i64 1, ptr addrspace(5) %48) #27
  %335 = load i32, ptr %78, align 4, !tbaa !8
  %336 = load ptr, ptr %60, align 8, !tbaa !4
  %337 = call noundef signext i8 @_Z6getRefiPc(i32 noundef %335, ptr noundef %336) #30
  store i8 %337, ptr %93, align 1, !tbaa !12
  br label %338

338:                                              ; preds = %334
  br label %339

339:                                              ; preds = %338
  br label %340

340:                                              ; preds = %339
  %341 = load i8, ptr %93, align 1, !tbaa !12
  %342 = sext i8 %341 to i32
  %343 = load i8, ptr %77, align 1, !tbaa !12
  %344 = sext i8 %343 to i32
  %345 = icmp ne i32 %342, %344
  br i1 %345, label %346, label %350

346:                                              ; preds = %340
  br label %347

347:                                              ; preds = %346
  br label %348

348:                                              ; preds = %347
  br label %349

349:                                              ; preds = %348
  store i32 27, ptr %66, align 4
  br label %362

350:                                              ; preds = %340
  %351 = load i32, ptr %71, align 4, !tbaa !8
  %352 = add nsw i32 %351, 1
  store i32 %352, ptr %71, align 4, !tbaa !8
  %353 = load i32, ptr %78, align 4, !tbaa !8
  %354 = add nsw i32 %353, 1
  store i32 %354, ptr %78, align 4, !tbaa !8
  %355 = load ptr, ptr %59, align 8, !tbaa !4
  %356 = load i32, ptr %74, align 4, !tbaa !8
  %357 = load i32, ptr %71, align 4, !tbaa !8
  %358 = add nsw i32 %356, %357
  %359 = sext i32 %358 to i64
  %360 = getelementptr inbounds i8, ptr %355, i64 %359
  %361 = load i8, ptr %360, align 1, !tbaa !12
  store i8 %361, ptr %77, align 1, !tbaa !12
  store i32 0, ptr %66, align 4
  br label %362

362:                                              ; preds = %349, %350
  call void @llvm.lifetime.end.p5(i64 1, ptr addrspace(5) %48) #27
  %363 = load i32, ptr %66, align 4
  switch i32 %363, label %366 [
    i32 0, label %364
  ]

364:                                              ; preds = %362
  br label %324, !llvm.loop !29

365:                                              ; preds = %332
  store i32 0, ptr %66, align 4
  br label %366

366:                                              ; preds = %365, %362
  call void @llvm.lifetime.end.p5(i64 4, ptr addrspace(5) %43) #27
  call void @llvm.lifetime.end.p5(i64 16, ptr addrspace(5) %41) #27
  br label %367

367:                                              ; preds = %225, %366
  call void @llvm.lifetime.end.p5(i64 3, ptr addrspace(5) %36) #27
  call void @llvm.lifetime.end.p5(i64 16, ptr addrspace(5) %34) #27
  %368 = load i32, ptr %66, align 4
  switch i32 %368, label %413 [
    i32 0, label %369
    i32 27, label %374
    i32 18, label %389
  ]

369:                                              ; preds = %367
  br label %176, !llvm.loop !30

370:                                              ; preds = %176
  br label %371

371:                                              ; preds = %370
  br label %372

372:                                              ; preds = %371
  br label %373

373:                                              ; preds = %372
  br label %374

374:                                              ; preds = %373, %367
  %375 = load i32, ptr %69, align 4, !tbaa !8
  %376 = load ptr, ptr %72, align 8, !tbaa !4
  %377 = load i32, ptr %78, align 4, !tbaa !8
  %378 = load i32, ptr %75, align 4, !tbaa !8
  %379 = sub i32 %377, %378
  %380 = load i32, ptr %71, align 4, !tbaa !8
  %381 = load i32, ptr %64, align 4, !tbaa !8
  call void @_Z10set_resultjP11_MatchCoordiiii(i32 noundef %375, ptr noundef %376, i32 noundef %379, i32 noundef %380, i32 noundef %381, i32 noundef 0) #30
  %382 = load i32, ptr %78, align 4, !tbaa !8
  %383 = load i32, ptr %75, align 4, !tbaa !8
  %384 = sub i32 %382, %383
  store i32 %384, ptr %70, align 4, !tbaa !8
  %385 = load i32, ptr %70, align 4, !tbaa !8
  %386 = add nsw i32 %385, 1
  %387 = load i32, ptr %71, align 4, !tbaa !8
  %388 = sub nsw i32 %387, %386
  store i32 %388, ptr %71, align 4, !tbaa !8
  br label %389

389:                                              ; preds = %374, %367
  call void @llvm.lifetime.start.p5(i64 16, ptr addrspace(5) %49) #27
  call void @llvm.lifetime.start.p5(i64 16, ptr addrspace(5) %50) #27
  %390 = load i32, ptr %76, align 4, !tbaa !8
  %391 = call %struct.HIP_vector_type.3 @_Z7getNodejb(i32 noundef %390, i1 noundef zeroext false) #30
  %392 = getelementptr inbounds %struct.HIP_vector_type.3, ptr %95, i32 0, i32 0
  %393 = extractvalue %struct.HIP_vector_type.3 %391, 0
  store %struct.HIP_vector_base.4 %393, ptr %392, align 16
  %394 = getelementptr inbounds %struct._PixelOfNode, ptr %94, i32 0, i32 0
  %395 = call noundef nonnull align 16 dereferenceable(16) ptr @_ZN15HIP_vector_typeIjLj4EEaSEOS0_(ptr noundef nonnull align 16 dereferenceable(16) %394, ptr noundef nonnull align 16 dereferenceable(16) %95) #30
  call void @llvm.lifetime.end.p5(i64 16, ptr addrspace(5) %50) #27
  %396 = getelementptr inbounds %struct._PixelOfNode, ptr %94, i32 0, i32 0
  %397 = getelementptr inbounds %struct.anon.20, ptr %396, i32 0, i32 1
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %96, ptr align 1 %397, i64 3, i1 false)
  %398 = getelementptr inbounds %struct.HIP_vector_type, ptr %96, i32 0, i32 0
  %399 = getelementptr inbounds %struct.HIP_vector_base, ptr %398, i32 0, i32 0
  %400 = getelementptr inbounds %union.anon.1, ptr %399, i32 0, i32 0
  %401 = getelementptr inbounds %"struct.HIP_vector_base<unsigned char, 3>::Native_vec_", ptr %400, i32 0, i32 0
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %97, ptr align 1 %401, i64 3, i1 false)
  %402 = load i32, ptr %97, align 4
  call void @_Z14arrayToAddress15HIP_vector_typeIhLj3EERj(i32 %402, ptr noundef nonnull align 4 dereferenceable(4) %69) #30
  call void @llvm.lifetime.end.p5(i64 16, ptr addrspace(5) %49) #27
  br label %403

403:                                              ; preds = %389
  br label %404

404:                                              ; preds = %403
  br label %405

405:                                              ; preds = %404
  call void @llvm.lifetime.end.p5(i64 4, ptr addrspace(5) %33) #27
  call void @llvm.lifetime.end.p5(i64 1, ptr addrspace(5) %32) #27
  call void @llvm.lifetime.end.p5(i64 4, ptr addrspace(5) %31) #27
  call void @llvm.lifetime.end.p5(i64 4, ptr addrspace(5) %30) #27
  br label %406

406:                                              ; preds = %405
  %407 = load i32, ptr %74, align 4, !tbaa !8
  %408 = add nsw i32 %407, 1
  store i32 %408, ptr %74, align 4, !tbaa !8
  %409 = load ptr, ptr %72, align 8, !tbaa !4
  %410 = getelementptr inbounds %struct._MatchCoord, ptr %409, i64 1
  store ptr %410, ptr %72, align 8, !tbaa !4
  br label %153, !llvm.loop !31

411:                                              ; preds = %157
  store i32 1, ptr %66, align 4
  call void @llvm.lifetime.end.p5(i64 4, ptr addrspace(5) %28) #27
  call void @llvm.lifetime.end.p5(i64 8, ptr addrspace(5) %27) #27
  call void @llvm.lifetime.end.p5(i64 4, ptr addrspace(5) %26) #27
  call void @llvm.lifetime.end.p5(i64 4, ptr addrspace(5) %25) #27
  call void @llvm.lifetime.end.p5(i64 4, ptr addrspace(5) %24) #27
  call void @llvm.lifetime.end.p5(i64 4, ptr addrspace(5) %23) #27
  call void @llvm.lifetime.end.p5(i64 4, ptr addrspace(5) %22) #27
  br label %412

412:                                              ; preds = %411, %116
  call void @llvm.lifetime.end.p5(i64 4, ptr addrspace(5) %20) #27
  ret void

413:                                              ; preds = %367
  unreachable
}

; Function Attrs: convergent inlinehint mustprogress nounwind
define internal noundef i32 @_ZL8__umul24jj(i32 noundef %0, i32 noundef %1) #8 {
  %3 = alloca i32, align 4, addrspace(5)
  %4 = alloca i32, align 4, addrspace(5)
  %5 = alloca i32, align 4, addrspace(5)
  %6 = addrspacecast ptr addrspace(5) %3 to ptr
  %7 = addrspacecast ptr addrspace(5) %4 to ptr
  %8 = addrspacecast ptr addrspace(5) %5 to ptr
  store i32 %0, ptr %7, align 4, !tbaa !8
  store i32 %1, ptr %8, align 4, !tbaa !8
  %9 = load i32, ptr %7, align 4, !tbaa !8
  %10 = load i32, ptr %8, align 4, !tbaa !8
  %11 = call i32 @__ockl_mul24_u32(i32 noundef %9, i32 noundef %10) #23
  ret i32 %11
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
  call void @llvm.lifetime.start.p5(i64 1, ptr addrspace(5) %4) #27
  %9 = call noundef i32 @_ZNK14__HIP_BlockIdxclEj(ptr noundef nonnull align 1 dereferenceable(1) %7, i32 noundef 0) #30
  call void @llvm.lifetime.end.p5(i64 1, ptr addrspace(5) %4) #27
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
  call void @llvm.lifetime.start.p5(i64 1, ptr addrspace(5) %4) #27
  %9 = call noundef i32 @_ZNK14__HIP_BlockDimclEj(ptr noundef nonnull align 1 dereferenceable(1) %7, i32 noundef 0) #30
  call void @llvm.lifetime.end.p5(i64 1, ptr addrspace(5) %4) #27
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
  call void @llvm.lifetime.start.p5(i64 1, ptr addrspace(5) %4) #27
  %9 = call noundef i32 @_ZNK15__HIP_ThreadIdxclEj(ptr noundef nonnull align 1 dereferenceable(1) %7, i32 noundef 0) #30
  call void @llvm.lifetime.end.p5(i64 1, ptr addrspace(5) %4) #27
  ret i32 %9
}

; Function Attrs: convergent nounwind
define linkonce_odr hidden noundef nonnull align 16 dereferenceable(16) ptr @_ZN15HIP_vector_typeIjLj4EEaSEOS0_(ptr noundef nonnull align 16 dereferenceable(16) %0, ptr noundef nonnull align 16 dereferenceable(16) %1) #9 comdat align 2 {
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
  %11 = call noundef nonnull align 16 dereferenceable(16) ptr @_ZN15HIP_vector_baseIjLj4EEaSERKS0_(ptr noundef nonnull align 16 dereferenceable(16) %9, ptr noundef nonnull align 16 dereferenceable(16) %10) #30
  ret ptr %9
}

; Function Attrs: convergent inlinehint mustprogress nounwind
define internal i32 @_ZL11make_uchar3hhh(i8 noundef zeroext %0, i8 noundef zeroext %1, i8 noundef zeroext %2) #8 {
  %4 = alloca %struct.HIP_vector_type, align 1, addrspace(5)
  %5 = alloca i8, align 1, addrspace(5)
  %6 = alloca i8, align 1, addrspace(5)
  %7 = alloca i8, align 1, addrspace(5)
  %8 = alloca i32, align 4, addrspace(5)
  %9 = addrspacecast ptr addrspace(5) %4 to ptr
  %10 = addrspacecast ptr addrspace(5) %5 to ptr
  %11 = addrspacecast ptr addrspace(5) %6 to ptr
  %12 = addrspacecast ptr addrspace(5) %7 to ptr
  %13 = addrspacecast ptr addrspace(5) %8 to ptr
  store i8 %0, ptr %10, align 1, !tbaa !12
  store i8 %1, ptr %11, align 1, !tbaa !12
  store i8 %2, ptr %12, align 1, !tbaa !12
  %14 = load i8, ptr %10, align 1, !tbaa !12
  %15 = load i8, ptr %11, align 1, !tbaa !12
  %16 = load i8, ptr %12, align 1, !tbaa !12
  call void @_ZN15HIP_vector_typeIhLj3EEC2IJhhhELPv0EEEDpT_(ptr noundef nonnull align 1 dereferenceable(3) %9, i8 noundef zeroext %14, i8 noundef zeroext %15, i8 noundef zeroext %16) #30
  %17 = getelementptr inbounds %struct.HIP_vector_type, ptr %9, i32 0, i32 0
  %18 = getelementptr inbounds %struct.HIP_vector_base, ptr %17, i32 0, i32 0
  %19 = getelementptr inbounds %union.anon.1, ptr %18, i32 0, i32 0
  %20 = getelementptr inbounds %"struct.HIP_vector_base<unsigned char, 3>::Native_vec_", ptr %19, i32 0, i32 0
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %13, ptr align 1 %20, i64 3, i1 false)
  %21 = load i32, ptr %13, align 4
  ret i32 %21
}

; Function Attrs: alwaysinline convergent mustprogress nounwind
define internal noundef i32 @_ZL3minii(i32 noundef %0, i32 noundef %1) #11 {
  %3 = alloca i32, align 4, addrspace(5)
  %4 = alloca i32, align 4, addrspace(5)
  %5 = alloca i32, align 4, addrspace(5)
  %6 = addrspacecast ptr addrspace(5) %3 to ptr
  %7 = addrspacecast ptr addrspace(5) %4 to ptr
  %8 = addrspacecast ptr addrspace(5) %5 to ptr
  store i32 %0, ptr %7, align 4, !tbaa !8
  store i32 %1, ptr %8, align 4, !tbaa !8
  %9 = load i32, ptr %7, align 4, !tbaa !8
  %10 = load i32, ptr %8, align 4, !tbaa !8
  %11 = icmp slt i32 %9, %10
  br i1 %11, label %12, label %14

12:                                               ; preds = %2
  %13 = load i32, ptr %7, align 4, !tbaa !8
  br label %16

14:                                               ; preds = %2
  %15 = load i32, ptr %8, align 4, !tbaa !8
  br label %16

16:                                               ; preds = %14, %12
  %17 = phi i32 [ %13, %12 ], [ %15, %14 ]
  ret i32 %17
}

; Function Attrs: alwaysinline convergent mustprogress nounwind
define internal noundef i32 @_ZL3maxii(i32 noundef %0, i32 noundef %1) #11 {
  %3 = alloca i32, align 4, addrspace(5)
  %4 = alloca i32, align 4, addrspace(5)
  %5 = alloca i32, align 4, addrspace(5)
  %6 = addrspacecast ptr addrspace(5) %3 to ptr
  %7 = addrspacecast ptr addrspace(5) %4 to ptr
  %8 = addrspacecast ptr addrspace(5) %5 to ptr
  store i32 %0, ptr %7, align 4, !tbaa !8
  store i32 %1, ptr %8, align 4, !tbaa !8
  %9 = load i32, ptr %7, align 4, !tbaa !8
  %10 = load i32, ptr %8, align 4, !tbaa !8
  %11 = icmp sgt i32 %9, %10
  br i1 %11, label %12, label %14

12:                                               ; preds = %2
  %13 = load i32, ptr %7, align 4, !tbaa !8
  br label %16

14:                                               ; preds = %2
  %15 = load i32, ptr %8, align 4, !tbaa !8
  br label %16

16:                                               ; preds = %14, %12
  %17 = phi i32 [ %13, %12 ], [ %15, %14 ]
  ret i32 %17
}

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z17mummergpuRCKernelP10MatchCoordPcPKiS3_ii(ptr addrspace(1) noundef %0, ptr addrspace(1) noundef %1, ptr addrspace(1) noundef %2, ptr addrspace(1) noundef %3, i32 noundef %4, i32 noundef %5) #12 {
  %7 = alloca ptr, align 8, addrspace(5)
  %8 = alloca ptr, align 8, addrspace(5)
  %9 = alloca ptr, align 8, addrspace(5)
  %10 = alloca ptr, align 8, addrspace(5)
  %11 = alloca ptr, align 8, addrspace(5)
  %12 = alloca ptr, align 8, addrspace(5)
  %13 = alloca ptr, align 8, addrspace(5)
  %14 = alloca ptr, align 8, addrspace(5)
  %15 = alloca i32, align 4, addrspace(5)
  %16 = alloca i32, align 4, addrspace(5)
  %17 = addrspacecast ptr addrspace(5) %7 to ptr
  %18 = addrspacecast ptr addrspace(5) %8 to ptr
  %19 = addrspacecast ptr addrspace(5) %9 to ptr
  %20 = addrspacecast ptr addrspace(5) %10 to ptr
  %21 = addrspacecast ptr addrspace(5) %11 to ptr
  %22 = addrspacecast ptr addrspace(5) %12 to ptr
  %23 = addrspacecast ptr addrspace(5) %13 to ptr
  %24 = addrspacecast ptr addrspace(5) %14 to ptr
  %25 = addrspacecast ptr addrspace(5) %15 to ptr
  %26 = addrspacecast ptr addrspace(5) %16 to ptr
  %27 = addrspacecast ptr addrspace(1) %0 to ptr
  store ptr %27, ptr %17, align 8
  %28 = load ptr, ptr %17, align 8, !tbaa !4
  %29 = addrspacecast ptr addrspace(1) %1 to ptr
  store ptr %29, ptr %18, align 8
  %30 = load ptr, ptr %18, align 8, !tbaa !4
  %31 = addrspacecast ptr addrspace(1) %2 to ptr
  store ptr %31, ptr %19, align 8
  %32 = load ptr, ptr %19, align 8, !tbaa !4
  %33 = addrspacecast ptr addrspace(1) %3 to ptr
  store ptr %33, ptr %20, align 8
  %34 = load ptr, ptr %20, align 8, !tbaa !4
  store ptr %28, ptr %21, align 8, !tbaa !4
  store ptr %30, ptr %22, align 8, !tbaa !4
  store ptr %32, ptr %23, align 8, !tbaa !4
  store ptr %34, ptr %24, align 8, !tbaa !4
  store i32 %4, ptr %25, align 4, !tbaa !8
  store i32 %5, ptr %26, align 4, !tbaa !8
  ret void
}

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z11printKernelP9MatchInfoiP9AlignmentPcPKiS5_iiiii(ptr addrspace(1) noundef %0, i32 noundef %1, ptr addrspace(1) noundef %2, ptr addrspace(1) noundef %3, ptr addrspace(1) noundef %4, ptr addrspace(1) noundef %5, i32 noundef %6, i32 noundef %7, i32 noundef %8, i32 noundef %9, i32 noundef %10) #10 {
  %12 = alloca ptr, align 8, addrspace(5)
  %13 = alloca ptr, align 8, addrspace(5)
  %14 = alloca ptr, align 8, addrspace(5)
  %15 = alloca ptr, align 8, addrspace(5)
  %16 = alloca ptr, align 8, addrspace(5)
  %17 = alloca ptr, align 8, addrspace(5)
  %18 = alloca i32, align 4, addrspace(5)
  %19 = alloca ptr, align 8, addrspace(5)
  %20 = alloca ptr, align 8, addrspace(5)
  %21 = alloca ptr, align 8, addrspace(5)
  %22 = alloca ptr, align 8, addrspace(5)
  %23 = alloca i32, align 4, addrspace(5)
  %24 = alloca i32, align 4, addrspace(5)
  %25 = alloca i32, align 4, addrspace(5)
  %26 = alloca i32, align 4, addrspace(5)
  %27 = alloca i32, align 4, addrspace(5)
  %28 = alloca i32, align 4, addrspace(5)
  %29 = alloca i32, align 4, addrspace(5)
  %30 = alloca i32, align 4, addrspace(5)
  %31 = alloca i8, align 1, addrspace(5)
  %32 = alloca i32, align 4, addrspace(5)
  %33 = alloca i32, align 4, addrspace(5)
  %34 = alloca i32, align 4, addrspace(5)
  %35 = alloca %struct._PixelOfNode, align 16, addrspace(5)
  %36 = alloca %struct.HIP_vector_type.3, align 16, addrspace(5)
  %37 = alloca %struct.HIP_vector_type, align 1, addrspace(5)
  %38 = alloca i32, align 4, addrspace(5)
  %39 = alloca %struct.HIP_vector_type.3, align 16, addrspace(5)
  %40 = alloca i32, align 4, addrspace(5)
  %41 = alloca i8, align 1, addrspace(5)
  %42 = alloca i8, align 1, addrspace(5)
  %43 = alloca %struct.HIP_vector_type.3, align 16, addrspace(5)
  %44 = alloca i32, align 4, addrspace(5)
  %45 = alloca i32, align 4, addrspace(5)
  %46 = alloca i32, align 4, addrspace(5)
  %47 = alloca %struct.HIP_vector_type.3, align 16, addrspace(5)
  %48 = alloca %struct._PixelOfChildren, align 16, addrspace(5)
  %49 = alloca %struct.HIP_vector_type.3, align 16, addrspace(5)
  %50 = alloca i8, align 1, addrspace(5)
  %51 = alloca i32, align 4, addrspace(5)
  %52 = alloca i32, align 4, addrspace(5)
  %53 = alloca i32, align 4, addrspace(5)
  %54 = alloca %struct.HIP_vector_type.3, align 16, addrspace(5)
  %55 = alloca i32, align 4, addrspace(5)
  %56 = alloca %struct.HIP_vector_type, align 1, addrspace(5)
  %57 = alloca i32, align 4, addrspace(5)
  %58 = alloca %struct._PixelOfChildren, align 16, addrspace(5)
  %59 = alloca %struct.HIP_vector_type.3, align 16, addrspace(5)
  %60 = alloca i32, align 4, addrspace(5)
  %61 = alloca i32, align 4, addrspace(5)
  %62 = alloca i32, align 4, addrspace(5)
  %63 = alloca i32, align 4, addrspace(5)
  %64 = alloca %struct.HIP_vector_type, align 1, addrspace(5)
  %65 = alloca i32, align 4, addrspace(5)
  %66 = alloca %struct.HIP_vector_type, align 1, addrspace(5)
  %67 = alloca i32, align 4, addrspace(5)
  %68 = alloca %struct.HIP_vector_type, align 1, addrspace(5)
  %69 = alloca i32, align 4, addrspace(5)
  %70 = alloca %struct.HIP_vector_type, align 1, addrspace(5)
  %71 = alloca i32, align 4, addrspace(5)
  %72 = alloca %struct.HIP_vector_type.3, align 16, addrspace(5)
  %73 = alloca %struct._PixelOfChildren, align 16, addrspace(5)
  %74 = alloca %struct.HIP_vector_type.3, align 16, addrspace(5)
  %75 = alloca i8, align 1, addrspace(5)
  %76 = alloca %struct.HIP_vector_type, align 1, addrspace(5)
  %77 = alloca i32, align 4, addrspace(5)
  %78 = alloca %struct.HIP_vector_type, align 1, addrspace(5)
  %79 = alloca i32, align 4, addrspace(5)
  %80 = alloca %struct.HIP_vector_type, align 1, addrspace(5)
  %81 = alloca i32, align 4, addrspace(5)
  %82 = alloca %struct.HIP_vector_type, align 1, addrspace(5)
  %83 = alloca i32, align 4, addrspace(5)
  %84 = alloca %struct.HIP_vector_type, align 1, addrspace(5)
  %85 = alloca i32, align 4, addrspace(5)
  %86 = alloca %struct.HIP_vector_type.3, align 16, addrspace(5)
  %87 = alloca i32, align 4, addrspace(5)
  %88 = alloca %struct.HIP_vector_type, align 1, addrspace(5)
  %89 = alloca i32, align 4, addrspace(5)
  %90 = alloca %struct.HIP_vector_type.3, align 16, addrspace(5)
  %91 = addrspacecast ptr addrspace(5) %12 to ptr
  %92 = addrspacecast ptr addrspace(5) %13 to ptr
  %93 = addrspacecast ptr addrspace(5) %14 to ptr
  %94 = addrspacecast ptr addrspace(5) %15 to ptr
  %95 = addrspacecast ptr addrspace(5) %16 to ptr
  %96 = addrspacecast ptr addrspace(5) %17 to ptr
  %97 = addrspacecast ptr addrspace(5) %18 to ptr
  %98 = addrspacecast ptr addrspace(5) %19 to ptr
  %99 = addrspacecast ptr addrspace(5) %20 to ptr
  %100 = addrspacecast ptr addrspace(5) %21 to ptr
  %101 = addrspacecast ptr addrspace(5) %22 to ptr
  %102 = addrspacecast ptr addrspace(5) %23 to ptr
  %103 = addrspacecast ptr addrspace(5) %24 to ptr
  %104 = addrspacecast ptr addrspace(5) %25 to ptr
  %105 = addrspacecast ptr addrspace(5) %26 to ptr
  %106 = addrspacecast ptr addrspace(5) %27 to ptr
  %107 = addrspacecast ptr addrspace(5) %28 to ptr
  %108 = addrspacecast ptr addrspace(5) %29 to ptr
  %109 = addrspacecast ptr addrspace(5) %30 to ptr
  %110 = addrspacecast ptr addrspace(5) %31 to ptr
  %111 = addrspacecast ptr addrspace(5) %32 to ptr
  %112 = addrspacecast ptr addrspace(5) %33 to ptr
  %113 = addrspacecast ptr addrspace(5) %34 to ptr
  %114 = addrspacecast ptr addrspace(5) %35 to ptr
  %115 = addrspacecast ptr addrspace(5) %36 to ptr
  %116 = addrspacecast ptr addrspace(5) %37 to ptr
  %117 = addrspacecast ptr addrspace(5) %38 to ptr
  %118 = addrspacecast ptr addrspace(5) %39 to ptr
  %119 = addrspacecast ptr addrspace(5) %40 to ptr
  %120 = addrspacecast ptr addrspace(5) %41 to ptr
  %121 = addrspacecast ptr addrspace(5) %42 to ptr
  %122 = addrspacecast ptr addrspace(5) %43 to ptr
  %123 = addrspacecast ptr addrspace(5) %44 to ptr
  %124 = addrspacecast ptr addrspace(5) %45 to ptr
  %125 = addrspacecast ptr addrspace(5) %46 to ptr
  %126 = addrspacecast ptr addrspace(5) %47 to ptr
  %127 = addrspacecast ptr addrspace(5) %48 to ptr
  %128 = addrspacecast ptr addrspace(5) %49 to ptr
  %129 = addrspacecast ptr addrspace(5) %50 to ptr
  %130 = addrspacecast ptr addrspace(5) %51 to ptr
  %131 = addrspacecast ptr addrspace(5) %52 to ptr
  %132 = addrspacecast ptr addrspace(5) %53 to ptr
  %133 = addrspacecast ptr addrspace(5) %54 to ptr
  %134 = addrspacecast ptr addrspace(5) %55 to ptr
  %135 = addrspacecast ptr addrspace(5) %56 to ptr
  %136 = addrspacecast ptr addrspace(5) %57 to ptr
  %137 = addrspacecast ptr addrspace(5) %58 to ptr
  %138 = addrspacecast ptr addrspace(5) %59 to ptr
  %139 = addrspacecast ptr addrspace(5) %60 to ptr
  %140 = addrspacecast ptr addrspace(5) %61 to ptr
  %141 = addrspacecast ptr addrspace(5) %62 to ptr
  %142 = addrspacecast ptr addrspace(5) %63 to ptr
  %143 = addrspacecast ptr addrspace(5) %64 to ptr
  %144 = addrspacecast ptr addrspace(5) %65 to ptr
  %145 = addrspacecast ptr addrspace(5) %66 to ptr
  %146 = addrspacecast ptr addrspace(5) %67 to ptr
  %147 = addrspacecast ptr addrspace(5) %68 to ptr
  %148 = addrspacecast ptr addrspace(5) %69 to ptr
  %149 = addrspacecast ptr addrspace(5) %70 to ptr
  %150 = addrspacecast ptr addrspace(5) %71 to ptr
  %151 = addrspacecast ptr addrspace(5) %72 to ptr
  %152 = addrspacecast ptr addrspace(5) %73 to ptr
  %153 = addrspacecast ptr addrspace(5) %74 to ptr
  %154 = addrspacecast ptr addrspace(5) %75 to ptr
  %155 = addrspacecast ptr addrspace(5) %76 to ptr
  %156 = addrspacecast ptr addrspace(5) %77 to ptr
  %157 = addrspacecast ptr addrspace(5) %78 to ptr
  %158 = addrspacecast ptr addrspace(5) %79 to ptr
  %159 = addrspacecast ptr addrspace(5) %80 to ptr
  %160 = addrspacecast ptr addrspace(5) %81 to ptr
  %161 = addrspacecast ptr addrspace(5) %82 to ptr
  %162 = addrspacecast ptr addrspace(5) %83 to ptr
  %163 = addrspacecast ptr addrspace(5) %84 to ptr
  %164 = addrspacecast ptr addrspace(5) %85 to ptr
  %165 = addrspacecast ptr addrspace(5) %86 to ptr
  %166 = addrspacecast ptr addrspace(5) %87 to ptr
  %167 = addrspacecast ptr addrspace(5) %88 to ptr
  %168 = addrspacecast ptr addrspace(5) %89 to ptr
  %169 = addrspacecast ptr addrspace(5) %90 to ptr
  %170 = addrspacecast ptr addrspace(1) %0 to ptr
  store ptr %170, ptr %91, align 8
  %171 = load ptr, ptr %91, align 8, !tbaa !4
  %172 = addrspacecast ptr addrspace(1) %2 to ptr
  store ptr %172, ptr %92, align 8
  %173 = load ptr, ptr %92, align 8, !tbaa !4
  %174 = addrspacecast ptr addrspace(1) %3 to ptr
  store ptr %174, ptr %93, align 8
  %175 = load ptr, ptr %93, align 8, !tbaa !4
  %176 = addrspacecast ptr addrspace(1) %4 to ptr
  store ptr %176, ptr %94, align 8
  %177 = load ptr, ptr %94, align 8, !tbaa !4
  %178 = addrspacecast ptr addrspace(1) %5 to ptr
  store ptr %178, ptr %95, align 8
  %179 = load ptr, ptr %95, align 8, !tbaa !4
  store ptr %171, ptr %96, align 8, !tbaa !4
  store i32 %1, ptr %97, align 4, !tbaa !8
  store ptr %173, ptr %98, align 8, !tbaa !4
  store ptr %175, ptr %99, align 8, !tbaa !4
  store ptr %177, ptr %100, align 8, !tbaa !4
  store ptr %179, ptr %101, align 8, !tbaa !4
  store i32 %6, ptr %102, align 4, !tbaa !8
  store i32 %7, ptr %103, align 4, !tbaa !8
  store i32 %8, ptr %104, align 4, !tbaa !8
  store i32 %9, ptr %105, align 4, !tbaa !8
  store i32 %10, ptr %106, align 4, !tbaa !8
  call void @llvm.lifetime.start.p5(i64 4, ptr addrspace(5) %28) #27
  %180 = call noundef i32 @_ZNK17__HIP_CoordinatesI14__HIP_BlockIdxE3__XcvjEv(ptr noundef nonnull align 1 dereferenceable(1) addrspacecast (ptr addrspace(4) @_ZN17__HIP_CoordinatesI14__HIP_BlockIdxE1xE to ptr)) #30
  %181 = call noundef i32 @_ZNK17__HIP_CoordinatesI14__HIP_BlockDimE3__XcvjEv(ptr noundef nonnull align 1 dereferenceable(1) addrspacecast (ptr addrspace(4) @_ZN17__HIP_CoordinatesI14__HIP_BlockDimE1xE to ptr)) #30
  %182 = call noundef i32 @_ZL8__umul24jj(i32 noundef %180, i32 noundef %181) #30
  %183 = call noundef i32 @_ZNK17__HIP_CoordinatesI15__HIP_ThreadIdxE3__XcvjEv(ptr noundef nonnull align 1 dereferenceable(1) addrspacecast (ptr addrspace(4) @_ZN17__HIP_CoordinatesI15__HIP_ThreadIdxE1xE to ptr)) #30
  %184 = add i32 %182, %183
  store i32 %184, ptr %107, align 4, !tbaa !8
  %185 = load i32, ptr %107, align 4, !tbaa !8
  %186 = load i32, ptr %97, align 4, !tbaa !8
  %187 = icmp sge i32 %185, %186
  br i1 %187, label %188, label %189

188:                                              ; preds = %11
  store i32 1, ptr %108, align 4
  br label %911

189:                                              ; preds = %11
  br label %190

190:                                              ; preds = %189
  br label %191

191:                                              ; preds = %190
  br label %192

192:                                              ; preds = %191
  call void @llvm.lifetime.start.p5(i64 4, ptr addrspace(5) %30) #27
  %193 = load ptr, ptr %100, align 8, !tbaa !4
  %194 = load ptr, ptr %96, align 8, !tbaa !4
  %195 = load i32, ptr %107, align 4, !tbaa !8
  %196 = sext i32 %195 to i64
  %197 = getelementptr inbounds %struct.MatchInfo, ptr %194, i64 %196
  %198 = getelementptr inbounds %struct.MatchInfo, ptr %197, i32 0, i32 1
  %199 = load i32, ptr %198, align 4, !tbaa !32
  %200 = zext i32 %199 to i64
  %201 = getelementptr inbounds i32, ptr %193, i64 %200
  %202 = load i32, ptr %201, align 4, !tbaa !8
  store i32 %202, ptr %109, align 4, !tbaa !8
  %203 = load i32, ptr %109, align 4, !tbaa !8
  %204 = load ptr, ptr %99, align 8, !tbaa !4
  %205 = sext i32 %203 to i64
  %206 = getelementptr inbounds i8, ptr %204, i64 %205
  store ptr %206, ptr %99, align 8, !tbaa !4
  br label %207

207:                                              ; preds = %192
  br label %208

208:                                              ; preds = %207
  br label %209

209:                                              ; preds = %208
  call void @llvm.lifetime.start.p5(i64 1, ptr addrspace(5) %31) #27
  %210 = load ptr, ptr %99, align 8, !tbaa !4
  %211 = load ptr, ptr %96, align 8, !tbaa !4
  %212 = load i32, ptr %107, align 4, !tbaa !8
  %213 = sext i32 %212 to i64
  %214 = getelementptr inbounds %struct.MatchInfo, ptr %211, i64 %213
  %215 = getelementptr inbounds %struct.MatchInfo, ptr %214, i32 0, i32 5
  %216 = load i16, ptr %215, align 2, !tbaa !36
  %217 = zext i16 %216 to i64
  %218 = getelementptr inbounds i8, ptr %210, i64 %217
  %219 = load i8, ptr %218, align 1, !tbaa !12
  store i8 %219, ptr %110, align 1, !tbaa !12
  call void @llvm.lifetime.start.p5(i64 4, ptr addrspace(5) %32) #27
  %220 = load ptr, ptr %96, align 8, !tbaa !4
  %221 = load i32, ptr %107, align 4, !tbaa !8
  %222 = sext i32 %221 to i64
  %223 = getelementptr inbounds %struct.MatchInfo, ptr %220, i64 %222
  %224 = getelementptr inbounds %struct.MatchInfo, ptr %223, i32 0, i32 2
  %225 = getelementptr inbounds %struct.TextureAddress, ptr %224, i32 0, i32 0
  %226 = load i32, ptr %225, align 4, !tbaa !12
  store i32 %226, ptr %111, align 4, !tbaa !8
  call void @llvm.lifetime.start.p5(i64 4, ptr addrspace(5) %33) #27
  %227 = load i32, ptr %111, align 4, !tbaa !8
  store i32 %227, ptr %112, align 4, !tbaa !8
  call void @llvm.lifetime.start.p5(i64 4, ptr addrspace(5) %34) #27
  %228 = load i32, ptr %112, align 4, !tbaa !8
  store i32 %228, ptr %113, align 4, !tbaa !8
  call void @llvm.lifetime.start.p5(i64 16, ptr addrspace(5) %35) #27
  call void @llvm.lifetime.start.p5(i64 16, ptr addrspace(5) %36) #27
  %229 = load i32, ptr %112, align 4, !tbaa !8
  %230 = call %struct.HIP_vector_type.3 @_Z7getNodejb(i32 noundef %229, i1 noundef zeroext true) #30
  %231 = getelementptr inbounds %struct.HIP_vector_type.3, ptr %115, i32 0, i32 0
  %232 = extractvalue %struct.HIP_vector_type.3 %230, 0
  store %struct.HIP_vector_base.4 %232, ptr %231, align 16
  %233 = getelementptr inbounds %struct._PixelOfNode, ptr %114, i32 0, i32 0
  %234 = call noundef nonnull align 16 dereferenceable(16) ptr @_ZN15HIP_vector_typeIjLj4EEaSEOS0_(ptr noundef nonnull align 16 dereferenceable(16) %233, ptr noundef nonnull align 16 dereferenceable(16) %115) #30
  call void @llvm.lifetime.end.p5(i64 16, ptr addrspace(5) %36) #27
  br label %235

235:                                              ; preds = %209
  br label %236

236:                                              ; preds = %235
  br label %237

237:                                              ; preds = %236
  br label %238

238:                                              ; preds = %280, %237
  %239 = getelementptr inbounds %struct._PixelOfNode, ptr %114, i32 0, i32 0
  %240 = getelementptr inbounds %struct.anon.20, ptr %239, i32 0, i32 4
  %241 = getelementptr inbounds %struct.HIP_vector_base, ptr %240, i32 0, i32 0
  %242 = getelementptr inbounds %struct.anon.2, ptr %241, i32 0, i32 0
  %243 = load i8, ptr %242, align 4, !tbaa !12
  %244 = zext i8 %243 to i32
  %245 = getelementptr inbounds %struct._PixelOfNode, ptr %114, i32 0, i32 0
  %246 = getelementptr inbounds %struct.anon.20, ptr %245, i32 0, i32 4
  %247 = getelementptr inbounds %struct.HIP_vector_base, ptr %246, i32 0, i32 0
  %248 = getelementptr inbounds %struct.anon.2, ptr %247, i32 0, i32 1
  %249 = load i8, ptr %248, align 1, !tbaa !12
  %250 = zext i8 %249 to i32
  %251 = shl i32 %250, 8
  %252 = or i32 %244, %251
  %253 = getelementptr inbounds %struct._PixelOfNode, ptr %114, i32 0, i32 0
  %254 = getelementptr inbounds %struct.anon.20, ptr %253, i32 0, i32 4
  %255 = getelementptr inbounds %struct.HIP_vector_base, ptr %254, i32 0, i32 0
  %256 = getelementptr inbounds %struct.anon.2, ptr %255, i32 0, i32 2
  %257 = load i8, ptr %256, align 2, !tbaa !12
  %258 = zext i8 %257 to i32
  %259 = shl i32 %258, 16
  %260 = or i32 %252, %259
  %261 = load i32, ptr %106, align 4, !tbaa !8
  %262 = icmp sgt i32 %260, %261
  br i1 %262, label %263, label %281

263:                                              ; preds = %238
  %264 = load i32, ptr %112, align 4, !tbaa !8
  store i32 %264, ptr %113, align 4, !tbaa !8
  %265 = getelementptr inbounds %struct._PixelOfNode, ptr %114, i32 0, i32 0
  %266 = getelementptr inbounds %struct.anon.20, ptr %265, i32 0, i32 0
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %116, ptr align 16 %266, i64 3, i1 false)
  %267 = getelementptr inbounds %struct.HIP_vector_type, ptr %116, i32 0, i32 0
  %268 = getelementptr inbounds %struct.HIP_vector_base, ptr %267, i32 0, i32 0
  %269 = getelementptr inbounds %union.anon.1, ptr %268, i32 0, i32 0
  %270 = getelementptr inbounds %"struct.HIP_vector_base<unsigned char, 3>::Native_vec_", ptr %269, i32 0, i32 0
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %117, ptr align 1 %270, i64 3, i1 false)
  %271 = load i32, ptr %117, align 4
  call void @_Z14arrayToAddress15HIP_vector_typeIhLj3EERj(i32 %271, ptr noundef nonnull align 4 dereferenceable(4) %112) #30
  call void @llvm.lifetime.start.p5(i64 16, ptr addrspace(5) %39) #27
  %272 = load i32, ptr %112, align 4, !tbaa !8
  %273 = call %struct.HIP_vector_type.3 @_Z7getNodejb(i32 noundef %272, i1 noundef zeroext true) #30
  %274 = getelementptr inbounds %struct.HIP_vector_type.3, ptr %118, i32 0, i32 0
  %275 = extractvalue %struct.HIP_vector_type.3 %273, 0
  store %struct.HIP_vector_base.4 %275, ptr %274, align 16
  %276 = getelementptr inbounds %struct._PixelOfNode, ptr %114, i32 0, i32 0
  %277 = call noundef nonnull align 16 dereferenceable(16) ptr @_ZN15HIP_vector_typeIjLj4EEaSEOS0_(ptr noundef nonnull align 16 dereferenceable(16) %276, ptr noundef nonnull align 16 dereferenceable(16) %118) #30
  call void @llvm.lifetime.end.p5(i64 16, ptr addrspace(5) %39) #27
  br label %278

278:                                              ; preds = %263
  br label %279

279:                                              ; preds = %278
  br label %280

280:                                              ; preds = %279
  br label %238, !llvm.loop !37

281:                                              ; preds = %238
  call void @llvm.lifetime.start.p5(i64 4, ptr addrspace(5) %40) #27
  %282 = load i32, ptr %112, align 4, !tbaa !8
  store i32 %282, ptr %119, align 4, !tbaa !8
  %283 = load i32, ptr %113, align 4, !tbaa !8
  store i32 %283, ptr %112, align 4, !tbaa !8
  br label %284

284:                                              ; preds = %281
  br label %285

285:                                              ; preds = %284
  br label %286

286:                                              ; preds = %285
  call void @llvm.lifetime.start.p5(i64 1, ptr addrspace(5) %41) #27
  store i8 65, ptr %120, align 1, !tbaa !12
  call void @llvm.lifetime.start.p5(i64 1, ptr addrspace(5) %42) #27
  store i8 0, ptr %121, align 1, !tbaa !18
  call void @llvm.lifetime.start.p5(i64 16, ptr addrspace(5) %43) #27
  %287 = load i32, ptr %113, align 4, !tbaa !8
  %288 = call %struct.HIP_vector_type.3 @_Z7getNodejb(i32 noundef %287, i1 noundef zeroext true) #30
  %289 = getelementptr inbounds %struct.HIP_vector_type.3, ptr %122, i32 0, i32 0
  %290 = extractvalue %struct.HIP_vector_type.3 %288, 0
  store %struct.HIP_vector_base.4 %290, ptr %289, align 16
  %291 = getelementptr inbounds %struct._PixelOfNode, ptr %114, i32 0, i32 0
  %292 = call noundef nonnull align 16 dereferenceable(16) ptr @_ZN15HIP_vector_typeIjLj4EEaSEOS0_(ptr noundef nonnull align 16 dereferenceable(16) %291, ptr noundef nonnull align 16 dereferenceable(16) %122) #30
  call void @llvm.lifetime.end.p5(i64 16, ptr addrspace(5) %43) #27
  call void @llvm.lifetime.start.p5(i64 4, ptr addrspace(5) %44) #27
  %293 = getelementptr inbounds %struct._PixelOfNode, ptr %114, i32 0, i32 0
  %294 = getelementptr inbounds %struct.anon.20, ptr %293, i32 0, i32 4
  %295 = getelementptr inbounds %struct.HIP_vector_base, ptr %294, i32 0, i32 0
  %296 = getelementptr inbounds %struct.anon.2, ptr %295, i32 0, i32 0
  %297 = load i8, ptr %296, align 4, !tbaa !12
  %298 = zext i8 %297 to i32
  %299 = getelementptr inbounds %struct._PixelOfNode, ptr %114, i32 0, i32 0
  %300 = getelementptr inbounds %struct.anon.20, ptr %299, i32 0, i32 4
  %301 = getelementptr inbounds %struct.HIP_vector_base, ptr %300, i32 0, i32 0
  %302 = getelementptr inbounds %struct.anon.2, ptr %301, i32 0, i32 1
  %303 = load i8, ptr %302, align 1, !tbaa !12
  %304 = zext i8 %303 to i32
  %305 = shl i32 %304, 8
  %306 = or i32 %298, %305
  %307 = getelementptr inbounds %struct._PixelOfNode, ptr %114, i32 0, i32 0
  %308 = getelementptr inbounds %struct.anon.20, ptr %307, i32 0, i32 4
  %309 = getelementptr inbounds %struct.HIP_vector_base, ptr %308, i32 0, i32 0
  %310 = getelementptr inbounds %struct.anon.2, ptr %309, i32 0, i32 2
  %311 = load i8, ptr %310, align 2, !tbaa !12
  %312 = zext i8 %311 to i32
  %313 = shl i32 %312, 16
  %314 = or i32 %306, %313
  %315 = sub nsw i32 %314, 1
  store i32 %315, ptr %123, align 4, !tbaa !8
  call void @llvm.lifetime.start.p5(i64 4, ptr addrspace(5) %45) #27
  store i32 0, ptr %124, align 4, !tbaa !8
  call void @llvm.lifetime.start.p5(i64 4, ptr addrspace(5) %46) #27
  %316 = load ptr, ptr %96, align 8, !tbaa !4
  %317 = load i32, ptr %107, align 4, !tbaa !8
  %318 = sext i32 %317 to i64
  %319 = getelementptr inbounds %struct.MatchInfo, ptr %316, i64 %318
  %320 = getelementptr inbounds %struct.MatchInfo, ptr %319, i32 0, i32 0
  %321 = load i32, ptr %320, align 4, !tbaa !38
  store i32 %321, ptr %125, align 4, !tbaa !8
  %322 = load i32, ptr %113, align 4, !tbaa !8
  %323 = load i32, ptr %111, align 4, !tbaa !8
  %324 = icmp eq i32 %322, %323
  br i1 %324, label %325, label %373

325:                                              ; preds = %286
  %326 = load ptr, ptr %96, align 8, !tbaa !4
  %327 = load i32, ptr %107, align 4, !tbaa !8
  %328 = sext i32 %327 to i64
  %329 = getelementptr inbounds %struct.MatchInfo, ptr %326, i64 %328
  %330 = getelementptr inbounds %struct.MatchInfo, ptr %329, i32 0, i32 4
  %331 = load i16, ptr %330, align 4, !tbaa !39
  %332 = zext i16 %331 to i32
  %333 = icmp sgt i32 %332, 0
  br i1 %333, label %334, label %372

334:                                              ; preds = %325
  call void @llvm.lifetime.start.p5(i64 16, ptr addrspace(5) %47) #27
  %335 = load i32, ptr %119, align 4, !tbaa !8
  %336 = call %struct.HIP_vector_type.3 @_Z7getNodejb(i32 noundef %335, i1 noundef zeroext true) #30
  %337 = getelementptr inbounds %struct.HIP_vector_type.3, ptr %126, i32 0, i32 0
  %338 = extractvalue %struct.HIP_vector_type.3 %336, 0
  store %struct.HIP_vector_base.4 %338, ptr %337, align 16
  %339 = getelementptr inbounds %struct._PixelOfNode, ptr %114, i32 0, i32 0
  %340 = call noundef nonnull align 16 dereferenceable(16) ptr @_ZN15HIP_vector_typeIjLj4EEaSEOS0_(ptr noundef nonnull align 16 dereferenceable(16) %339, ptr noundef nonnull align 16 dereferenceable(16) %126) #30
  call void @llvm.lifetime.end.p5(i64 16, ptr addrspace(5) %47) #27
  %341 = getelementptr inbounds %struct._PixelOfNode, ptr %114, i32 0, i32 0
  %342 = getelementptr inbounds %struct.anon.20, ptr %341, i32 0, i32 4
  %343 = getelementptr inbounds %struct.HIP_vector_base, ptr %342, i32 0, i32 0
  %344 = getelementptr inbounds %struct.anon.2, ptr %343, i32 0, i32 0
  %345 = load i8, ptr %344, align 4, !tbaa !12
  %346 = zext i8 %345 to i32
  %347 = getelementptr inbounds %struct._PixelOfNode, ptr %114, i32 0, i32 0
  %348 = getelementptr inbounds %struct.anon.20, ptr %347, i32 0, i32 4
  %349 = getelementptr inbounds %struct.HIP_vector_base, ptr %348, i32 0, i32 0
  %350 = getelementptr inbounds %struct.anon.2, ptr %349, i32 0, i32 1
  %351 = load i8, ptr %350, align 1, !tbaa !12
  %352 = zext i8 %351 to i32
  %353 = shl i32 %352, 8
  %354 = or i32 %346, %353
  %355 = getelementptr inbounds %struct._PixelOfNode, ptr %114, i32 0, i32 0
  %356 = getelementptr inbounds %struct.anon.20, ptr %355, i32 0, i32 4
  %357 = getelementptr inbounds %struct.HIP_vector_base, ptr %356, i32 0, i32 0
  %358 = getelementptr inbounds %struct.anon.2, ptr %357, i32 0, i32 2
  %359 = load i8, ptr %358, align 2, !tbaa !12
  %360 = zext i8 %359 to i32
  %361 = shl i32 %360, 16
  %362 = or i32 %354, %361
  %363 = sub nsw i32 %362, 1
  %364 = load ptr, ptr %96, align 8, !tbaa !4
  %365 = load i32, ptr %107, align 4, !tbaa !8
  %366 = sext i32 %365 to i64
  %367 = getelementptr inbounds %struct.MatchInfo, ptr %364, i64 %366
  %368 = getelementptr inbounds %struct.MatchInfo, ptr %367, i32 0, i32 4
  %369 = load i16, ptr %368, align 4, !tbaa !39
  %370 = zext i16 %369 to i32
  %371 = add nsw i32 %363, %370
  store i32 %371, ptr %123, align 4, !tbaa !8
  br label %372

372:                                              ; preds = %334, %325
  store i32 1, ptr %124, align 4, !tbaa !8
  br label %373

373:                                              ; preds = %372, %286
  br label %374

374:                                              ; preds = %909, %373
  %375 = load i32, ptr %112, align 4, !tbaa !8
  %376 = load i32, ptr %119, align 4, !tbaa !8
  %377 = icmp ne i32 %375, %376
  br i1 %377, label %378, label %910

378:                                              ; preds = %374
  call void @llvm.lifetime.start.p5(i64 16, ptr addrspace(5) %48) #27
  call void @llvm.lifetime.start.p5(i64 16, ptr addrspace(5) %49) #27
  %379 = load i32, ptr %112, align 4, !tbaa !8
  %380 = call %struct.HIP_vector_type.3 @_Z11getChildrenjb(i32 noundef %379, i1 noundef zeroext true) #30
  %381 = getelementptr inbounds %struct.HIP_vector_type.3, ptr %128, i32 0, i32 0
  %382 = extractvalue %struct.HIP_vector_type.3 %380, 0
  store %struct.HIP_vector_base.4 %382, ptr %381, align 16
  %383 = getelementptr inbounds %struct._PixelOfChildren, ptr %127, i32 0, i32 0
  %384 = call noundef nonnull align 16 dereferenceable(16) ptr @_ZN15HIP_vector_typeIjLj4EEaSEOS0_(ptr noundef nonnull align 16 dereferenceable(16) %383, ptr noundef nonnull align 16 dereferenceable(16) %128) #30
  call void @llvm.lifetime.end.p5(i64 16, ptr addrspace(5) %49) #27
  call void @llvm.lifetime.start.p5(i64 1, ptr addrspace(5) %50) #27
  %385 = getelementptr inbounds %struct._PixelOfChildren, ptr %127, i32 0, i32 0
  %386 = getelementptr inbounds %struct.anon.17, ptr %385, i32 0, i32 5
  %387 = load i8, ptr %386, align 1, !tbaa !12
  store i8 %387, ptr %129, align 1, !tbaa !12
  br label %388

388:                                              ; preds = %378
  br label %389

389:                                              ; preds = %388
  br label %390

390:                                              ; preds = %389
  %391 = load i8, ptr %129, align 1, !tbaa !12
  %392 = icmp ne i8 %391, 0
  br i1 %392, label %396, label %393

393:                                              ; preds = %390
  %394 = load i8, ptr %121, align 1, !tbaa !18, !range !40
  %395 = trunc i8 %394 to i1
  br i1 %395, label %396, label %589

396:                                              ; preds = %393, %390
  %397 = load i8, ptr %129, align 1, !tbaa !12
  %398 = icmp ne i8 %397, 0
  br i1 %398, label %399, label %477

399:                                              ; preds = %396
  %400 = load i8, ptr %129, align 1, !tbaa !12
  %401 = sext i8 %400 to i32
  %402 = load i8, ptr %110, align 1, !tbaa !12
  %403 = sext i8 %402 to i32
  %404 = icmp ne i32 %401, %403
  br i1 %404, label %405, label %477

405:                                              ; preds = %399
  call void @llvm.lifetime.start.p5(i64 4, ptr addrspace(5) %51) #27
  %406 = getelementptr inbounds %struct._PixelOfChildren, ptr %127, i32 0, i32 0
  %407 = getelementptr inbounds %struct.anon.18, ptr %406, i32 0, i32 0
  %408 = getelementptr inbounds %struct.HIP_vector_base, ptr %407, i32 0, i32 0
  %409 = getelementptr inbounds %struct.anon.2, ptr %408, i32 0, i32 0
  %410 = load i8, ptr %409, align 16, !tbaa !12
  %411 = zext i8 %410 to i32
  %412 = getelementptr inbounds %struct._PixelOfChildren, ptr %127, i32 0, i32 0
  %413 = getelementptr inbounds %struct.anon.18, ptr %412, i32 0, i32 0
  %414 = getelementptr inbounds %struct.HIP_vector_base, ptr %413, i32 0, i32 0
  %415 = getelementptr inbounds %struct.anon.2, ptr %414, i32 0, i32 1
  %416 = load i8, ptr %415, align 1, !tbaa !12
  %417 = zext i8 %416 to i32
  %418 = shl i32 %417, 8
  %419 = or i32 %411, %418
  %420 = getelementptr inbounds %struct._PixelOfChildren, ptr %127, i32 0, i32 0
  %421 = getelementptr inbounds %struct.anon.18, ptr %420, i32 0, i32 0
  %422 = getelementptr inbounds %struct.HIP_vector_base, ptr %421, i32 0, i32 0
  %423 = getelementptr inbounds %struct.anon.2, ptr %422, i32 0, i32 2
  %424 = load i8, ptr %423, align 2, !tbaa !12
  %425 = zext i8 %424 to i32
  %426 = shl i32 %425, 16
  %427 = or i32 %419, %426
  store i32 %427, ptr %130, align 4, !tbaa !8
  call void @llvm.lifetime.start.p5(i64 4, ptr addrspace(5) %52) #27
  %428 = load i32, ptr %130, align 4, !tbaa !8
  %429 = sub nsw i32 %428, 1
  %430 = load i32, ptr %102, align 4, !tbaa !8
  %431 = add nsw i32 %429, %430
  store i32 %431, ptr %131, align 4, !tbaa !8
  call void @llvm.lifetime.start.p5(i64 4, ptr addrspace(5) %53) #27
  %432 = load i32, ptr %131, align 4, !tbaa !8
  %433 = load i32, ptr %123, align 4, !tbaa !8
  %434 = add nsw i32 %432, %433
  store i32 %434, ptr %132, align 4, !tbaa !8
  %435 = load i32, ptr %131, align 4, !tbaa !8
  %436 = load i32, ptr %102, align 4, !tbaa !8
  %437 = icmp ne i32 %435, %436
  br i1 %437, label %441, label %438

438:                                              ; preds = %405
  %439 = load i32, ptr %104, align 4, !tbaa !8
  %440 = icmp eq i32 %439, -1
  br i1 %440, label %441, label %476

441:                                              ; preds = %438, %405
  %442 = load i32, ptr %132, align 4, !tbaa !8
  %443 = load i32, ptr %103, align 4, !tbaa !8
  %444 = icmp ne i32 %442, %443
  br i1 %444, label %448, label %445

445:                                              ; preds = %441
  %446 = load i32, ptr %105, align 4, !tbaa !8
  %447 = icmp eq i32 %446, -1
  br i1 %447, label %448, label %476

448:                                              ; preds = %445, %441
  %449 = load i32, ptr %131, align 4, !tbaa !8
  %450 = load i32, ptr %102, align 4, !tbaa !8
  %451 = icmp sgt i32 %449, %450
  br i1 %451, label %452, label %456

452:                                              ; preds = %448
  %453 = load i32, ptr %132, align 4, !tbaa !8
  %454 = load i32, ptr %104, align 4, !tbaa !8
  %455 = icmp slt i32 %453, %454
  br i1 %455, label %475, label %456

456:                                              ; preds = %452, %448
  br label %457

457:                                              ; preds = %456
  br label %458

458:                                              ; preds = %457
  br label %459

459:                                              ; preds = %458
  %460 = load i32, ptr %131, align 4, !tbaa !8
  %461 = load ptr, ptr %98, align 8, !tbaa !4
  %462 = load i32, ptr %125, align 4, !tbaa !8
  %463 = sext i32 %462 to i64
  %464 = getelementptr inbounds %struct.Alignment, ptr %461, i64 %463
  %465 = getelementptr inbounds %struct.Alignment, ptr %464, i32 0, i32 0
  store i32 %460, ptr %465, align 4, !tbaa !41
  %466 = load i32, ptr %123, align 4, !tbaa !8
  %467 = trunc i32 %466 to i16
  %468 = load ptr, ptr %98, align 8, !tbaa !4
  %469 = load i32, ptr %125, align 4, !tbaa !8
  %470 = sext i32 %469 to i64
  %471 = getelementptr inbounds %struct.Alignment, ptr %468, i64 %470
  %472 = getelementptr inbounds %struct.Alignment, ptr %471, i32 0, i32 1
  store i16 %467, ptr %472, align 4, !tbaa !43
  %473 = load i32, ptr %125, align 4, !tbaa !8
  %474 = add nsw i32 %473, 1
  store i32 %474, ptr %125, align 4, !tbaa !8
  br label %475

475:                                              ; preds = %459, %452
  br label %476

476:                                              ; preds = %475, %445, %438
  call void @llvm.lifetime.end.p5(i64 4, ptr addrspace(5) %53) #27
  call void @llvm.lifetime.end.p5(i64 4, ptr addrspace(5) %52) #27
  call void @llvm.lifetime.end.p5(i64 4, ptr addrspace(5) %51) #27
  br label %477

477:                                              ; preds = %476, %399, %396
  store i8 0, ptr %121, align 1, !tbaa !18
  call void @llvm.lifetime.start.p5(i64 16, ptr addrspace(5) %54) #27
  %478 = load i32, ptr %112, align 4, !tbaa !8
  %479 = call %struct.HIP_vector_type.3 @_Z7getNodejb(i32 noundef %478, i1 noundef zeroext true) #30
  %480 = getelementptr inbounds %struct.HIP_vector_type.3, ptr %133, i32 0, i32 0
  %481 = extractvalue %struct.HIP_vector_type.3 %479, 0
  store %struct.HIP_vector_base.4 %481, ptr %480, align 16
  %482 = getelementptr inbounds %struct._PixelOfNode, ptr %114, i32 0, i32 0
  %483 = call noundef nonnull align 16 dereferenceable(16) ptr @_ZN15HIP_vector_typeIjLj4EEaSEOS0_(ptr noundef nonnull align 16 dereferenceable(16) %482, ptr noundef nonnull align 16 dereferenceable(16) %133) #30
  call void @llvm.lifetime.end.p5(i64 16, ptr addrspace(5) %54) #27
  call void @llvm.lifetime.start.p5(i64 4, ptr addrspace(5) %55) #27
  %484 = getelementptr inbounds %struct._PixelOfNode, ptr %114, i32 0, i32 0
  %485 = getelementptr inbounds %struct.anon.20, ptr %484, i32 0, i32 0
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %135, ptr align 16 %485, i64 3, i1 false)
  %486 = getelementptr inbounds %struct.HIP_vector_type, ptr %135, i32 0, i32 0
  %487 = getelementptr inbounds %struct.HIP_vector_base, ptr %486, i32 0, i32 0
  %488 = getelementptr inbounds %union.anon.1, ptr %487, i32 0, i32 0
  %489 = getelementptr inbounds %"struct.HIP_vector_base<unsigned char, 3>::Native_vec_", ptr %488, i32 0, i32 0
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %136, ptr align 1 %489, i64 3, i1 false)
  %490 = load i32, ptr %136, align 4
  call void @_Z14arrayToAddress15HIP_vector_typeIhLj3EERj(i32 %490, ptr noundef nonnull align 4 dereferenceable(4) %134) #30
  call void @llvm.lifetime.start.p5(i64 16, ptr addrspace(5) %58) #27
  call void @llvm.lifetime.start.p5(i64 16, ptr addrspace(5) %59) #27
  %491 = load i32, ptr %134, align 4, !tbaa !8
  %492 = call %struct.HIP_vector_type.3 @_Z11getChildrenjb(i32 noundef %491, i1 noundef zeroext true) #30
  %493 = getelementptr inbounds %struct.HIP_vector_type.3, ptr %138, i32 0, i32 0
  %494 = extractvalue %struct.HIP_vector_type.3 %492, 0
  store %struct.HIP_vector_base.4 %494, ptr %493, align 16
  %495 = getelementptr inbounds %struct._PixelOfChildren, ptr %137, i32 0, i32 0
  %496 = call noundef nonnull align 16 dereferenceable(16) ptr @_ZN15HIP_vector_typeIjLj4EEaSEOS0_(ptr noundef nonnull align 16 dereferenceable(16) %495, ptr noundef nonnull align 16 dereferenceable(16) %138) #30
  call void @llvm.lifetime.end.p5(i64 16, ptr addrspace(5) %59) #27
  call void @llvm.lifetime.start.p5(i64 4, ptr addrspace(5) %60) #27
  call void @llvm.lifetime.start.p5(i64 4, ptr addrspace(5) %61) #27
  call void @llvm.lifetime.start.p5(i64 4, ptr addrspace(5) %62) #27
  call void @llvm.lifetime.start.p5(i64 4, ptr addrspace(5) %63) #27
  %497 = getelementptr inbounds %struct._PixelOfChildren, ptr %137, i32 0, i32 0
  %498 = getelementptr inbounds %struct.anon.17, ptr %497, i32 0, i32 0
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %143, ptr align 16 %498, i64 3, i1 false)
  %499 = getelementptr inbounds %struct.HIP_vector_type, ptr %143, i32 0, i32 0
  %500 = getelementptr inbounds %struct.HIP_vector_base, ptr %499, i32 0, i32 0
  %501 = getelementptr inbounds %union.anon.1, ptr %500, i32 0, i32 0
  %502 = getelementptr inbounds %"struct.HIP_vector_base<unsigned char, 3>::Native_vec_", ptr %501, i32 0, i32 0
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %144, ptr align 1 %502, i64 3, i1 false)
  %503 = load i32, ptr %144, align 4
  call void @_Z14arrayToAddress15HIP_vector_typeIhLj3EERj(i32 %503, ptr noundef nonnull align 4 dereferenceable(4) %139) #30
  %504 = getelementptr inbounds %struct._PixelOfChildren, ptr %137, i32 0, i32 0
  %505 = getelementptr inbounds %struct.anon.17, ptr %504, i32 0, i32 1
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %145, ptr align 1 %505, i64 3, i1 false)
  %506 = getelementptr inbounds %struct.HIP_vector_type, ptr %145, i32 0, i32 0
  %507 = getelementptr inbounds %struct.HIP_vector_base, ptr %506, i32 0, i32 0
  %508 = getelementptr inbounds %union.anon.1, ptr %507, i32 0, i32 0
  %509 = getelementptr inbounds %"struct.HIP_vector_base<unsigned char, 3>::Native_vec_", ptr %508, i32 0, i32 0
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %146, ptr align 1 %509, i64 3, i1 false)
  %510 = load i32, ptr %146, align 4
  call void @_Z14arrayToAddress15HIP_vector_typeIhLj3EERj(i32 %510, ptr noundef nonnull align 4 dereferenceable(4) %140) #30
  %511 = getelementptr inbounds %struct._PixelOfChildren, ptr %137, i32 0, i32 0
  %512 = getelementptr inbounds %struct.anon.17, ptr %511, i32 0, i32 2
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %147, ptr align 2 %512, i64 3, i1 false)
  %513 = getelementptr inbounds %struct.HIP_vector_type, ptr %147, i32 0, i32 0
  %514 = getelementptr inbounds %struct.HIP_vector_base, ptr %513, i32 0, i32 0
  %515 = getelementptr inbounds %union.anon.1, ptr %514, i32 0, i32 0
  %516 = getelementptr inbounds %"struct.HIP_vector_base<unsigned char, 3>::Native_vec_", ptr %515, i32 0, i32 0
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %148, ptr align 1 %516, i64 3, i1 false)
  %517 = load i32, ptr %148, align 4
  call void @_Z14arrayToAddress15HIP_vector_typeIhLj3EERj(i32 %517, ptr noundef nonnull align 4 dereferenceable(4) %141) #30
  %518 = getelementptr inbounds %struct._PixelOfChildren, ptr %137, i32 0, i32 0
  %519 = getelementptr inbounds %struct.anon.17, ptr %518, i32 0, i32 3
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %149, ptr align 1 %519, i64 3, i1 false)
  %520 = getelementptr inbounds %struct.HIP_vector_type, ptr %149, i32 0, i32 0
  %521 = getelementptr inbounds %struct.HIP_vector_base, ptr %520, i32 0, i32 0
  %522 = getelementptr inbounds %union.anon.1, ptr %521, i32 0, i32 0
  %523 = getelementptr inbounds %"struct.HIP_vector_base<unsigned char, 3>::Native_vec_", ptr %522, i32 0, i32 0
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %150, ptr align 1 %523, i64 3, i1 false)
  %524 = load i32, ptr %150, align 4
  call void @_Z14arrayToAddress15HIP_vector_typeIhLj3EERj(i32 %524, ptr noundef nonnull align 4 dereferenceable(4) %142) #30
  %525 = load i32, ptr %139, align 4, !tbaa !8
  %526 = load i32, ptr %112, align 4, !tbaa !8
  %527 = icmp eq i32 %525, %526
  br i1 %527, label %528, label %529

528:                                              ; preds = %477
  store i8 67, ptr %120, align 1, !tbaa !12
  br label %548

529:                                              ; preds = %477
  %530 = load i32, ptr %140, align 4, !tbaa !8
  %531 = load i32, ptr %112, align 4, !tbaa !8
  %532 = icmp eq i32 %530, %531
  br i1 %532, label %533, label %534

533:                                              ; preds = %529
  store i8 71, ptr %120, align 1, !tbaa !12
  br label %547

534:                                              ; preds = %529
  %535 = load i32, ptr %141, align 4, !tbaa !8
  %536 = load i32, ptr %112, align 4, !tbaa !8
  %537 = icmp eq i32 %535, %536
  br i1 %537, label %538, label %539

538:                                              ; preds = %534
  store i8 84, ptr %120, align 1, !tbaa !12
  br label %546

539:                                              ; preds = %534
  %540 = load i32, ptr %142, align 4, !tbaa !8
  %541 = load i32, ptr %112, align 4, !tbaa !8
  %542 = icmp eq i32 %540, %541
  br i1 %542, label %543, label %544

543:                                              ; preds = %539
  store i8 36, ptr %120, align 1, !tbaa !12
  br label %545

544:                                              ; preds = %539
  store i8 1, ptr %121, align 1, !tbaa !18
  br label %545

545:                                              ; preds = %544, %543
  br label %546

546:                                              ; preds = %545, %538
  br label %547

547:                                              ; preds = %546, %533
  br label %548

548:                                              ; preds = %547, %528
  %549 = load i32, ptr %134, align 4, !tbaa !8
  store i32 %549, ptr %112, align 4, !tbaa !8
  %550 = load i32, ptr %124, align 4, !tbaa !8
  %551 = icmp ne i32 %550, 0
  br i1 %551, label %552, label %555

552:                                              ; preds = %548
  %553 = load i32, ptr %124, align 4, !tbaa !8
  %554 = add nsw i32 %553, -1
  store i32 %554, ptr %124, align 4, !tbaa !8
  br label %555

555:                                              ; preds = %552, %548
  %556 = load i32, ptr %124, align 4, !tbaa !8
  %557 = icmp eq i32 %556, 0
  br i1 %557, label %558, label %588

558:                                              ; preds = %555
  call void @llvm.lifetime.start.p5(i64 16, ptr addrspace(5) %72) #27
  %559 = load i32, ptr %112, align 4, !tbaa !8
  %560 = call %struct.HIP_vector_type.3 @_Z7getNodejb(i32 noundef %559, i1 noundef zeroext true) #30
  %561 = getelementptr inbounds %struct.HIP_vector_type.3, ptr %151, i32 0, i32 0
  %562 = extractvalue %struct.HIP_vector_type.3 %560, 0
  store %struct.HIP_vector_base.4 %562, ptr %561, align 16
  %563 = getelementptr inbounds %struct._PixelOfNode, ptr %114, i32 0, i32 0
  %564 = call noundef nonnull align 16 dereferenceable(16) ptr @_ZN15HIP_vector_typeIjLj4EEaSEOS0_(ptr noundef nonnull align 16 dereferenceable(16) %563, ptr noundef nonnull align 16 dereferenceable(16) %151) #30
  call void @llvm.lifetime.end.p5(i64 16, ptr addrspace(5) %72) #27
  %565 = getelementptr inbounds %struct._PixelOfNode, ptr %114, i32 0, i32 0
  %566 = getelementptr inbounds %struct.anon.20, ptr %565, i32 0, i32 4
  %567 = getelementptr inbounds %struct.HIP_vector_base, ptr %566, i32 0, i32 0
  %568 = getelementptr inbounds %struct.anon.2, ptr %567, i32 0, i32 0
  %569 = load i8, ptr %568, align 4, !tbaa !12
  %570 = zext i8 %569 to i32
  %571 = getelementptr inbounds %struct._PixelOfNode, ptr %114, i32 0, i32 0
  %572 = getelementptr inbounds %struct.anon.20, ptr %571, i32 0, i32 4
  %573 = getelementptr inbounds %struct.HIP_vector_base, ptr %572, i32 0, i32 0
  %574 = getelementptr inbounds %struct.anon.2, ptr %573, i32 0, i32 1
  %575 = load i8, ptr %574, align 1, !tbaa !12
  %576 = zext i8 %575 to i32
  %577 = shl i32 %576, 8
  %578 = or i32 %570, %577
  %579 = getelementptr inbounds %struct._PixelOfNode, ptr %114, i32 0, i32 0
  %580 = getelementptr inbounds %struct.anon.20, ptr %579, i32 0, i32 4
  %581 = getelementptr inbounds %struct.HIP_vector_base, ptr %580, i32 0, i32 0
  %582 = getelementptr inbounds %struct.anon.2, ptr %581, i32 0, i32 2
  %583 = load i8, ptr %582, align 2, !tbaa !12
  %584 = zext i8 %583 to i32
  %585 = shl i32 %584, 16
  %586 = or i32 %578, %585
  %587 = sub nsw i32 %586, 1
  store i32 %587, ptr %123, align 4, !tbaa !8
  br label %588

588:                                              ; preds = %558, %555
  call void @llvm.lifetime.end.p5(i64 4, ptr addrspace(5) %63) #27
  call void @llvm.lifetime.end.p5(i64 4, ptr addrspace(5) %62) #27
  call void @llvm.lifetime.end.p5(i64 4, ptr addrspace(5) %61) #27
  call void @llvm.lifetime.end.p5(i64 4, ptr addrspace(5) %60) #27
  call void @llvm.lifetime.end.p5(i64 16, ptr addrspace(5) %58) #27
  call void @llvm.lifetime.end.p5(i64 4, ptr addrspace(5) %55) #27
  br label %909

589:                                              ; preds = %393
  call void @llvm.lifetime.start.p5(i64 16, ptr addrspace(5) %73) #27
  call void @llvm.lifetime.start.p5(i64 16, ptr addrspace(5) %74) #27
  %590 = load i32, ptr %112, align 4, !tbaa !8
  %591 = call %struct.HIP_vector_type.3 @_Z11getChildrenjb(i32 noundef %590, i1 noundef zeroext true) #30
  %592 = getelementptr inbounds %struct.HIP_vector_type.3, ptr %153, i32 0, i32 0
  %593 = extractvalue %struct.HIP_vector_type.3 %591, 0
  store %struct.HIP_vector_base.4 %593, ptr %592, align 16
  %594 = getelementptr inbounds %struct._PixelOfChildren, ptr %152, i32 0, i32 0
  %595 = call noundef nonnull align 16 dereferenceable(16) ptr @_ZN15HIP_vector_typeIjLj4EEaSEOS0_(ptr noundef nonnull align 16 dereferenceable(16) %594, ptr noundef nonnull align 16 dereferenceable(16) %153) #30
  call void @llvm.lifetime.end.p5(i64 16, ptr addrspace(5) %74) #27
  call void @llvm.lifetime.start.p5(i64 1, ptr addrspace(5) %75) #27
  store i8 0, ptr %154, align 1, !tbaa !12
  %596 = load i32, ptr %124, align 4, !tbaa !8
  %597 = icmp eq i32 %596, 0
  br i1 %597, label %598, label %613

598:                                              ; preds = %589
  %599 = load ptr, ptr %99, align 8, !tbaa !4
  %600 = load ptr, ptr %96, align 8, !tbaa !4
  %601 = load i32, ptr %107, align 4, !tbaa !8
  %602 = sext i32 %601 to i64
  %603 = getelementptr inbounds %struct.MatchInfo, ptr %600, i64 %602
  %604 = getelementptr inbounds %struct.MatchInfo, ptr %603, i32 0, i32 5
  %605 = load i16, ptr %604, align 2, !tbaa !36
  %606 = zext i16 %605 to i32
  %607 = load i32, ptr %123, align 4, !tbaa !8
  %608 = add nsw i32 %606, %607
  %609 = add nsw i32 %608, 1
  %610 = sext i32 %609 to i64
  %611 = getelementptr inbounds i8, ptr %599, i64 %610
  %612 = load i8, ptr %611, align 1, !tbaa !12
  store i8 %612, ptr %154, align 1, !tbaa !12
  br label %613

613:                                              ; preds = %598, %589
  br label %614

614:                                              ; preds = %613
  %615 = load i8, ptr %120, align 1, !tbaa !12
  %616 = sext i8 %615 to i32
  %617 = icmp eq i32 %616, 65
  br i1 %617, label %618, label %651

618:                                              ; preds = %614
  %619 = getelementptr inbounds %struct._PixelOfChildren, ptr %152, i32 0, i32 0
  %620 = getelementptr inbounds %struct.anon.17, ptr %619, i32 0, i32 0
  %621 = getelementptr inbounds %struct.HIP_vector_base, ptr %620, i32 0, i32 0
  %622 = getelementptr inbounds %struct.anon.2, ptr %621, i32 0, i32 0
  %623 = load i8, ptr %622, align 16, !tbaa !12
  %624 = icmp ne i8 %623, 0
  br i1 %624, label %639, label %625

625:                                              ; preds = %618
  %626 = getelementptr inbounds %struct._PixelOfChildren, ptr %152, i32 0, i32 0
  %627 = getelementptr inbounds %struct.anon.17, ptr %626, i32 0, i32 0
  %628 = getelementptr inbounds %struct.HIP_vector_base, ptr %627, i32 0, i32 0
  %629 = getelementptr inbounds %struct.anon.2, ptr %628, i32 0, i32 1
  %630 = load i8, ptr %629, align 1, !tbaa !12
  %631 = icmp ne i8 %630, 0
  br i1 %631, label %639, label %632

632:                                              ; preds = %625
  %633 = getelementptr inbounds %struct._PixelOfChildren, ptr %152, i32 0, i32 0
  %634 = getelementptr inbounds %struct.anon.17, ptr %633, i32 0, i32 0
  %635 = getelementptr inbounds %struct.HIP_vector_base, ptr %634, i32 0, i32 0
  %636 = getelementptr inbounds %struct.anon.2, ptr %635, i32 0, i32 2
  %637 = load i8, ptr %636, align 2, !tbaa !12
  %638 = icmp ne i8 %637, 0
  br i1 %638, label %639, label %650

639:                                              ; preds = %632, %625, %618
  br label %640

640:                                              ; preds = %639
  br label %641

641:                                              ; preds = %640
  br label %642

642:                                              ; preds = %641
  %643 = getelementptr inbounds %struct._PixelOfChildren, ptr %152, i32 0, i32 0
  %644 = getelementptr inbounds %struct.anon.17, ptr %643, i32 0, i32 0
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %155, ptr align 16 %644, i64 3, i1 false)
  %645 = getelementptr inbounds %struct.HIP_vector_type, ptr %155, i32 0, i32 0
  %646 = getelementptr inbounds %struct.HIP_vector_base, ptr %645, i32 0, i32 0
  %647 = getelementptr inbounds %union.anon.1, ptr %646, i32 0, i32 0
  %648 = getelementptr inbounds %"struct.HIP_vector_base<unsigned char, 3>::Native_vec_", ptr %647, i32 0, i32 0
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %156, ptr align 1 %648, i64 3, i1 false)
  %649 = load i32, ptr %156, align 4
  call void @_Z14arrayToAddress15HIP_vector_typeIhLj3EERj(i32 %649, ptr noundef nonnull align 4 dereferenceable(4) %112) #30
  br label %801

650:                                              ; preds = %632
  store i8 67, ptr %120, align 1, !tbaa !12
  br label %651

651:                                              ; preds = %650, %614
  %652 = load i8, ptr %120, align 1, !tbaa !12
  %653 = sext i8 %652 to i32
  %654 = icmp eq i32 %653, 67
  br i1 %654, label %655, label %688

655:                                              ; preds = %651
  %656 = getelementptr inbounds %struct._PixelOfChildren, ptr %152, i32 0, i32 0
  %657 = getelementptr inbounds %struct.anon.17, ptr %656, i32 0, i32 1
  %658 = getelementptr inbounds %struct.HIP_vector_base, ptr %657, i32 0, i32 0
  %659 = getelementptr inbounds %struct.anon.2, ptr %658, i32 0, i32 0
  %660 = load i8, ptr %659, align 1, !tbaa !12
  %661 = icmp ne i8 %660, 0
  br i1 %661, label %676, label %662

662:                                              ; preds = %655
  %663 = getelementptr inbounds %struct._PixelOfChildren, ptr %152, i32 0, i32 0
  %664 = getelementptr inbounds %struct.anon.17, ptr %663, i32 0, i32 1
  %665 = getelementptr inbounds %struct.HIP_vector_base, ptr %664, i32 0, i32 0
  %666 = getelementptr inbounds %struct.anon.2, ptr %665, i32 0, i32 1
  %667 = load i8, ptr %666, align 1, !tbaa !12
  %668 = icmp ne i8 %667, 0
  br i1 %668, label %676, label %669

669:                                              ; preds = %662
  %670 = getelementptr inbounds %struct._PixelOfChildren, ptr %152, i32 0, i32 0
  %671 = getelementptr inbounds %struct.anon.17, ptr %670, i32 0, i32 1
  %672 = getelementptr inbounds %struct.HIP_vector_base, ptr %671, i32 0, i32 0
  %673 = getelementptr inbounds %struct.anon.2, ptr %672, i32 0, i32 2
  %674 = load i8, ptr %673, align 1, !tbaa !12
  %675 = icmp ne i8 %674, 0
  br i1 %675, label %676, label %687

676:                                              ; preds = %669, %662, %655
  br label %677

677:                                              ; preds = %676
  br label %678

678:                                              ; preds = %677
  br label %679

679:                                              ; preds = %678
  %680 = getelementptr inbounds %struct._PixelOfChildren, ptr %152, i32 0, i32 0
  %681 = getelementptr inbounds %struct.anon.17, ptr %680, i32 0, i32 1
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %157, ptr align 1 %681, i64 3, i1 false)
  %682 = getelementptr inbounds %struct.HIP_vector_type, ptr %157, i32 0, i32 0
  %683 = getelementptr inbounds %struct.HIP_vector_base, ptr %682, i32 0, i32 0
  %684 = getelementptr inbounds %union.anon.1, ptr %683, i32 0, i32 0
  %685 = getelementptr inbounds %"struct.HIP_vector_base<unsigned char, 3>::Native_vec_", ptr %684, i32 0, i32 0
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %158, ptr align 1 %685, i64 3, i1 false)
  %686 = load i32, ptr %158, align 4
  call void @_Z14arrayToAddress15HIP_vector_typeIhLj3EERj(i32 %686, ptr noundef nonnull align 4 dereferenceable(4) %112) #30
  br label %801

687:                                              ; preds = %669
  store i8 71, ptr %120, align 1, !tbaa !12
  br label %688

688:                                              ; preds = %687, %651
  %689 = load i8, ptr %120, align 1, !tbaa !12
  %690 = sext i8 %689 to i32
  %691 = icmp eq i32 %690, 71
  br i1 %691, label %692, label %725

692:                                              ; preds = %688
  %693 = getelementptr inbounds %struct._PixelOfChildren, ptr %152, i32 0, i32 0
  %694 = getelementptr inbounds %struct.anon.17, ptr %693, i32 0, i32 2
  %695 = getelementptr inbounds %struct.HIP_vector_base, ptr %694, i32 0, i32 0
  %696 = getelementptr inbounds %struct.anon.2, ptr %695, i32 0, i32 0
  %697 = load i8, ptr %696, align 2, !tbaa !12
  %698 = icmp ne i8 %697, 0
  br i1 %698, label %713, label %699

699:                                              ; preds = %692
  %700 = getelementptr inbounds %struct._PixelOfChildren, ptr %152, i32 0, i32 0
  %701 = getelementptr inbounds %struct.anon.17, ptr %700, i32 0, i32 2
  %702 = getelementptr inbounds %struct.HIP_vector_base, ptr %701, i32 0, i32 0
  %703 = getelementptr inbounds %struct.anon.2, ptr %702, i32 0, i32 1
  %704 = load i8, ptr %703, align 1, !tbaa !12
  %705 = icmp ne i8 %704, 0
  br i1 %705, label %713, label %706

706:                                              ; preds = %699
  %707 = getelementptr inbounds %struct._PixelOfChildren, ptr %152, i32 0, i32 0
  %708 = getelementptr inbounds %struct.anon.17, ptr %707, i32 0, i32 2
  %709 = getelementptr inbounds %struct.HIP_vector_base, ptr %708, i32 0, i32 0
  %710 = getelementptr inbounds %struct.anon.2, ptr %709, i32 0, i32 2
  %711 = load i8, ptr %710, align 2, !tbaa !12
  %712 = icmp ne i8 %711, 0
  br i1 %712, label %713, label %724

713:                                              ; preds = %706, %699, %692
  br label %714

714:                                              ; preds = %713
  br label %715

715:                                              ; preds = %714
  br label %716

716:                                              ; preds = %715
  %717 = getelementptr inbounds %struct._PixelOfChildren, ptr %152, i32 0, i32 0
  %718 = getelementptr inbounds %struct.anon.17, ptr %717, i32 0, i32 2
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %159, ptr align 2 %718, i64 3, i1 false)
  %719 = getelementptr inbounds %struct.HIP_vector_type, ptr %159, i32 0, i32 0
  %720 = getelementptr inbounds %struct.HIP_vector_base, ptr %719, i32 0, i32 0
  %721 = getelementptr inbounds %union.anon.1, ptr %720, i32 0, i32 0
  %722 = getelementptr inbounds %"struct.HIP_vector_base<unsigned char, 3>::Native_vec_", ptr %721, i32 0, i32 0
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %160, ptr align 1 %722, i64 3, i1 false)
  %723 = load i32, ptr %160, align 4
  call void @_Z14arrayToAddress15HIP_vector_typeIhLj3EERj(i32 %723, ptr noundef nonnull align 4 dereferenceable(4) %112) #30
  br label %801

724:                                              ; preds = %706
  store i8 84, ptr %120, align 1, !tbaa !12
  br label %725

725:                                              ; preds = %724, %688
  %726 = load i8, ptr %120, align 1, !tbaa !12
  %727 = sext i8 %726 to i32
  %728 = icmp eq i32 %727, 84
  br i1 %728, label %729, label %762

729:                                              ; preds = %725
  %730 = getelementptr inbounds %struct._PixelOfChildren, ptr %152, i32 0, i32 0
  %731 = getelementptr inbounds %struct.anon.17, ptr %730, i32 0, i32 3
  %732 = getelementptr inbounds %struct.HIP_vector_base, ptr %731, i32 0, i32 0
  %733 = getelementptr inbounds %struct.anon.2, ptr %732, i32 0, i32 0
  %734 = load i8, ptr %733, align 1, !tbaa !12
  %735 = icmp ne i8 %734, 0
  br i1 %735, label %750, label %736

736:                                              ; preds = %729
  %737 = getelementptr inbounds %struct._PixelOfChildren, ptr %152, i32 0, i32 0
  %738 = getelementptr inbounds %struct.anon.17, ptr %737, i32 0, i32 3
  %739 = getelementptr inbounds %struct.HIP_vector_base, ptr %738, i32 0, i32 0
  %740 = getelementptr inbounds %struct.anon.2, ptr %739, i32 0, i32 1
  %741 = load i8, ptr %740, align 1, !tbaa !12
  %742 = icmp ne i8 %741, 0
  br i1 %742, label %750, label %743

743:                                              ; preds = %736
  %744 = getelementptr inbounds %struct._PixelOfChildren, ptr %152, i32 0, i32 0
  %745 = getelementptr inbounds %struct.anon.17, ptr %744, i32 0, i32 3
  %746 = getelementptr inbounds %struct.HIP_vector_base, ptr %745, i32 0, i32 0
  %747 = getelementptr inbounds %struct.anon.2, ptr %746, i32 0, i32 2
  %748 = load i8, ptr %747, align 1, !tbaa !12
  %749 = icmp ne i8 %748, 0
  br i1 %749, label %750, label %761

750:                                              ; preds = %743, %736, %729
  br label %751

751:                                              ; preds = %750
  br label %752

752:                                              ; preds = %751
  br label %753

753:                                              ; preds = %752
  %754 = getelementptr inbounds %struct._PixelOfChildren, ptr %152, i32 0, i32 0
  %755 = getelementptr inbounds %struct.anon.17, ptr %754, i32 0, i32 3
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %161, ptr align 1 %755, i64 3, i1 false)
  %756 = getelementptr inbounds %struct.HIP_vector_type, ptr %161, i32 0, i32 0
  %757 = getelementptr inbounds %struct.HIP_vector_base, ptr %756, i32 0, i32 0
  %758 = getelementptr inbounds %union.anon.1, ptr %757, i32 0, i32 0
  %759 = getelementptr inbounds %"struct.HIP_vector_base<unsigned char, 3>::Native_vec_", ptr %758, i32 0, i32 0
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %162, ptr align 1 %759, i64 3, i1 false)
  %760 = load i32, ptr %162, align 4
  call void @_Z14arrayToAddress15HIP_vector_typeIhLj3EERj(i32 %760, ptr noundef nonnull align 4 dereferenceable(4) %112) #30
  br label %801

761:                                              ; preds = %743
  store i8 36, ptr %120, align 1, !tbaa !12
  br label %762

762:                                              ; preds = %761, %725
  %763 = load i8, ptr %120, align 1, !tbaa !12
  %764 = sext i8 %763 to i32
  %765 = icmp eq i32 %764, 36
  br i1 %765, label %766, label %799

766:                                              ; preds = %762
  %767 = getelementptr inbounds %struct._PixelOfChildren, ptr %152, i32 0, i32 0
  %768 = getelementptr inbounds %struct.anon.17, ptr %767, i32 0, i32 4
  %769 = getelementptr inbounds %struct.HIP_vector_base, ptr %768, i32 0, i32 0
  %770 = getelementptr inbounds %struct.anon.2, ptr %769, i32 0, i32 0
  %771 = load i8, ptr %770, align 4, !tbaa !12
  %772 = icmp ne i8 %771, 0
  br i1 %772, label %787, label %773

773:                                              ; preds = %766
  %774 = getelementptr inbounds %struct._PixelOfChildren, ptr %152, i32 0, i32 0
  %775 = getelementptr inbounds %struct.anon.17, ptr %774, i32 0, i32 4
  %776 = getelementptr inbounds %struct.HIP_vector_base, ptr %775, i32 0, i32 0
  %777 = getelementptr inbounds %struct.anon.2, ptr %776, i32 0, i32 1
  %778 = load i8, ptr %777, align 1, !tbaa !12
  %779 = icmp ne i8 %778, 0
  br i1 %779, label %787, label %780

780:                                              ; preds = %773
  %781 = getelementptr inbounds %struct._PixelOfChildren, ptr %152, i32 0, i32 0
  %782 = getelementptr inbounds %struct.anon.17, ptr %781, i32 0, i32 4
  %783 = getelementptr inbounds %struct.HIP_vector_base, ptr %782, i32 0, i32 0
  %784 = getelementptr inbounds %struct.anon.2, ptr %783, i32 0, i32 2
  %785 = load i8, ptr %784, align 2, !tbaa !12
  %786 = icmp ne i8 %785, 0
  br i1 %786, label %787, label %798

787:                                              ; preds = %780, %773, %766
  br label %788

788:                                              ; preds = %787
  br label %789

789:                                              ; preds = %788
  br label %790

790:                                              ; preds = %789
  %791 = getelementptr inbounds %struct._PixelOfChildren, ptr %152, i32 0, i32 0
  %792 = getelementptr inbounds %struct.anon.17, ptr %791, i32 0, i32 4
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %163, ptr align 4 %792, i64 3, i1 false)
  %793 = getelementptr inbounds %struct.HIP_vector_type, ptr %163, i32 0, i32 0
  %794 = getelementptr inbounds %struct.HIP_vector_base, ptr %793, i32 0, i32 0
  %795 = getelementptr inbounds %union.anon.1, ptr %794, i32 0, i32 0
  %796 = getelementptr inbounds %"struct.HIP_vector_base<unsigned char, 3>::Native_vec_", ptr %795, i32 0, i32 0
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %164, ptr align 1 %796, i64 3, i1 false)
  %797 = load i32, ptr %164, align 4
  call void @_Z14arrayToAddress15HIP_vector_typeIhLj3EERj(i32 %797, ptr noundef nonnull align 4 dereferenceable(4) %112) #30
  br label %801

798:                                              ; preds = %780
  br label %799

799:                                              ; preds = %798, %762
  store i8 1, ptr %121, align 1, !tbaa !18
  br label %800

800:                                              ; preds = %799
  br label %801

801:                                              ; preds = %800, %790, %753, %716, %679, %642
  %802 = load i8, ptr %121, align 1, !tbaa !18, !range !40
  %803 = trunc i8 %802 to i1
  br i1 %803, label %908, label %804

804:                                              ; preds = %801
  %805 = load i32, ptr %124, align 4, !tbaa !8
  %806 = icmp eq i32 %805, 0
  br i1 %806, label %807, label %904

807:                                              ; preds = %804
  %808 = load i8, ptr %120, align 1, !tbaa !12
  %809 = sext i8 %808 to i32
  %810 = load i8, ptr %154, align 1, !tbaa !12
  %811 = sext i8 %810 to i32
  %812 = icmp eq i32 %809, %811
  br i1 %812, label %813, label %902

813:                                              ; preds = %807
  call void @llvm.lifetime.start.p5(i64 16, ptr addrspace(5) %86) #27
  %814 = load i32, ptr %112, align 4, !tbaa !8
  %815 = call %struct.HIP_vector_type.3 @_Z7getNodejb(i32 noundef %814, i1 noundef zeroext true) #30
  %816 = getelementptr inbounds %struct.HIP_vector_type.3, ptr %165, i32 0, i32 0
  %817 = extractvalue %struct.HIP_vector_type.3 %815, 0
  store %struct.HIP_vector_base.4 %817, ptr %816, align 16
  %818 = getelementptr inbounds %struct._PixelOfNode, ptr %114, i32 0, i32 0
  %819 = call noundef nonnull align 16 dereferenceable(16) ptr @_ZN15HIP_vector_typeIjLj4EEaSEOS0_(ptr noundef nonnull align 16 dereferenceable(16) %818, ptr noundef nonnull align 16 dereferenceable(16) %165) #30
  call void @llvm.lifetime.end.p5(i64 16, ptr addrspace(5) %86) #27
  %820 = getelementptr inbounds %struct._PixelOfNode, ptr %114, i32 0, i32 0
  %821 = getelementptr inbounds %struct.anon.20, ptr %820, i32 0, i32 4
  %822 = getelementptr inbounds %struct.HIP_vector_base, ptr %821, i32 0, i32 0
  %823 = getelementptr inbounds %struct.anon.2, ptr %822, i32 0, i32 0
  %824 = load i8, ptr %823, align 4, !tbaa !12
  %825 = zext i8 %824 to i32
  %826 = getelementptr inbounds %struct._PixelOfNode, ptr %114, i32 0, i32 0
  %827 = getelementptr inbounds %struct.anon.20, ptr %826, i32 0, i32 4
  %828 = getelementptr inbounds %struct.HIP_vector_base, ptr %827, i32 0, i32 0
  %829 = getelementptr inbounds %struct.anon.2, ptr %828, i32 0, i32 1
  %830 = load i8, ptr %829, align 1, !tbaa !12
  %831 = zext i8 %830 to i32
  %832 = shl i32 %831, 8
  %833 = or i32 %825, %832
  %834 = getelementptr inbounds %struct._PixelOfNode, ptr %114, i32 0, i32 0
  %835 = getelementptr inbounds %struct.anon.20, ptr %834, i32 0, i32 4
  %836 = getelementptr inbounds %struct.HIP_vector_base, ptr %835, i32 0, i32 0
  %837 = getelementptr inbounds %struct.anon.2, ptr %836, i32 0, i32 2
  %838 = load i8, ptr %837, align 2, !tbaa !12
  %839 = zext i8 %838 to i32
  %840 = shl i32 %839, 16
  %841 = or i32 %833, %840
  %842 = sub nsw i32 %841, 1
  store i32 %842, ptr %123, align 4, !tbaa !8
  %843 = load i32, ptr %112, align 4, !tbaa !8
  %844 = load i32, ptr %111, align 4, !tbaa !8
  %845 = icmp eq i32 %843, %844
  br i1 %845, label %846, label %901

846:                                              ; preds = %813
  store i32 1, ptr %124, align 4, !tbaa !8
  %847 = load ptr, ptr %96, align 8, !tbaa !4
  %848 = load i32, ptr %107, align 4, !tbaa !8
  %849 = sext i32 %848 to i64
  %850 = getelementptr inbounds %struct.MatchInfo, ptr %847, i64 %849
  %851 = getelementptr inbounds %struct.MatchInfo, ptr %850, i32 0, i32 4
  %852 = load i16, ptr %851, align 4, !tbaa !39
  %853 = zext i16 %852 to i32
  %854 = icmp sgt i32 %853, 0
  br i1 %854, label %855, label %900

855:                                              ; preds = %846
  call void @llvm.lifetime.start.p5(i64 4, ptr addrspace(5) %87) #27
  %856 = getelementptr inbounds %struct._PixelOfNode, ptr %114, i32 0, i32 0
  %857 = getelementptr inbounds %struct.anon.20, ptr %856, i32 0, i32 0
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %167, ptr align 16 %857, i64 3, i1 false)
  %858 = getelementptr inbounds %struct.HIP_vector_type, ptr %167, i32 0, i32 0
  %859 = getelementptr inbounds %struct.HIP_vector_base, ptr %858, i32 0, i32 0
  %860 = getelementptr inbounds %union.anon.1, ptr %859, i32 0, i32 0
  %861 = getelementptr inbounds %"struct.HIP_vector_base<unsigned char, 3>::Native_vec_", ptr %860, i32 0, i32 0
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %168, ptr align 1 %861, i64 3, i1 false)
  %862 = load i32, ptr %168, align 4
  call void @_Z14arrayToAddress15HIP_vector_typeIhLj3EERj(i32 %862, ptr noundef nonnull align 4 dereferenceable(4) %166) #30
  call void @llvm.lifetime.start.p5(i64 16, ptr addrspace(5) %90) #27
  %863 = load i32, ptr %166, align 4, !tbaa !8
  %864 = call %struct.HIP_vector_type.3 @_Z7getNodejb(i32 noundef %863, i1 noundef zeroext true) #30
  %865 = getelementptr inbounds %struct.HIP_vector_type.3, ptr %169, i32 0, i32 0
  %866 = extractvalue %struct.HIP_vector_type.3 %864, 0
  store %struct.HIP_vector_base.4 %866, ptr %865, align 16
  %867 = getelementptr inbounds %struct._PixelOfNode, ptr %114, i32 0, i32 0
  %868 = call noundef nonnull align 16 dereferenceable(16) ptr @_ZN15HIP_vector_typeIjLj4EEaSEOS0_(ptr noundef nonnull align 16 dereferenceable(16) %867, ptr noundef nonnull align 16 dereferenceable(16) %169) #30
  call void @llvm.lifetime.end.p5(i64 16, ptr addrspace(5) %90) #27
  %869 = getelementptr inbounds %struct._PixelOfNode, ptr %114, i32 0, i32 0
  %870 = getelementptr inbounds %struct.anon.20, ptr %869, i32 0, i32 4
  %871 = getelementptr inbounds %struct.HIP_vector_base, ptr %870, i32 0, i32 0
  %872 = getelementptr inbounds %struct.anon.2, ptr %871, i32 0, i32 0
  %873 = load i8, ptr %872, align 4, !tbaa !12
  %874 = zext i8 %873 to i32
  %875 = getelementptr inbounds %struct._PixelOfNode, ptr %114, i32 0, i32 0
  %876 = getelementptr inbounds %struct.anon.20, ptr %875, i32 0, i32 4
  %877 = getelementptr inbounds %struct.HIP_vector_base, ptr %876, i32 0, i32 0
  %878 = getelementptr inbounds %struct.anon.2, ptr %877, i32 0, i32 1
  %879 = load i8, ptr %878, align 1, !tbaa !12
  %880 = zext i8 %879 to i32
  %881 = shl i32 %880, 8
  %882 = or i32 %874, %881
  %883 = getelementptr inbounds %struct._PixelOfNode, ptr %114, i32 0, i32 0
  %884 = getelementptr inbounds %struct.anon.20, ptr %883, i32 0, i32 4
  %885 = getelementptr inbounds %struct.HIP_vector_base, ptr %884, i32 0, i32 0
  %886 = getelementptr inbounds %struct.anon.2, ptr %885, i32 0, i32 2
  %887 = load i8, ptr %886, align 2, !tbaa !12
  %888 = zext i8 %887 to i32
  %889 = shl i32 %888, 16
  %890 = or i32 %882, %889
  %891 = sub nsw i32 %890, 1
  %892 = load ptr, ptr %96, align 8, !tbaa !4
  %893 = load i32, ptr %107, align 4, !tbaa !8
  %894 = sext i32 %893 to i64
  %895 = getelementptr inbounds %struct.MatchInfo, ptr %892, i64 %894
  %896 = getelementptr inbounds %struct.MatchInfo, ptr %895, i32 0, i32 4
  %897 = load i16, ptr %896, align 4, !tbaa !39
  %898 = zext i16 %897 to i32
  %899 = add nsw i32 %891, %898
  store i32 %899, ptr %123, align 4, !tbaa !8
  call void @llvm.lifetime.end.p5(i64 4, ptr addrspace(5) %87) #27
  br label %900

900:                                              ; preds = %855, %846
  br label %901

901:                                              ; preds = %900, %813
  br label %903

902:                                              ; preds = %807
  store i32 1, ptr %124, align 4, !tbaa !8
  br label %903

903:                                              ; preds = %902, %901
  br label %907

904:                                              ; preds = %804
  %905 = load i32, ptr %124, align 4, !tbaa !8
  %906 = add nsw i32 %905, 1
  store i32 %906, ptr %124, align 4, !tbaa !8
  br label %907

907:                                              ; preds = %904, %903
  store i8 65, ptr %120, align 1, !tbaa !12
  br label %908

908:                                              ; preds = %907, %801
  call void @llvm.lifetime.end.p5(i64 1, ptr addrspace(5) %75) #27
  call void @llvm.lifetime.end.p5(i64 16, ptr addrspace(5) %73) #27
  br label %909

909:                                              ; preds = %908, %588
  call void @llvm.lifetime.end.p5(i64 1, ptr addrspace(5) %50) #27
  call void @llvm.lifetime.end.p5(i64 16, ptr addrspace(5) %48) #27
  br label %374, !llvm.loop !44

910:                                              ; preds = %374
  call void @llvm.lifetime.end.p5(i64 4, ptr addrspace(5) %46) #27
  call void @llvm.lifetime.end.p5(i64 4, ptr addrspace(5) %45) #27
  call void @llvm.lifetime.end.p5(i64 4, ptr addrspace(5) %44) #27
  call void @llvm.lifetime.end.p5(i64 1, ptr addrspace(5) %42) #27
  call void @llvm.lifetime.end.p5(i64 1, ptr addrspace(5) %41) #27
  call void @llvm.lifetime.end.p5(i64 4, ptr addrspace(5) %40) #27
  call void @llvm.lifetime.end.p5(i64 16, ptr addrspace(5) %35) #27
  call void @llvm.lifetime.end.p5(i64 4, ptr addrspace(5) %34) #27
  call void @llvm.lifetime.end.p5(i64 4, ptr addrspace(5) %33) #27
  call void @llvm.lifetime.end.p5(i64 4, ptr addrspace(5) %32) #27
  call void @llvm.lifetime.end.p5(i64 1, ptr addrspace(5) %31) #27
  call void @llvm.lifetime.end.p5(i64 4, ptr addrspace(5) %30) #27
  store i32 0, ptr %108, align 4
  br label %911

911:                                              ; preds = %910, %188
  call void @llvm.lifetime.end.p5(i64 4, ptr addrspace(5) %28) #27
  %912 = load i32, ptr %108, align 4
  switch i32 %912, label %914 [
    i32 0, label %913
    i32 1, label %913
  ]

913:                                              ; preds = %911, %911
  ret void

914:                                              ; preds = %911
  unreachable
}

; Function Attrs: convergent nounwind
define linkonce_odr hidden void @_ZN15HIP_vector_typeIiLj2EEC2IJiiELPv0EEEDpT_(ptr noundef nonnull align 8 dereferenceable(8) %0, i32 noundef %1, i32 noundef %2) unnamed_addr #9 comdat align 2 {
  %4 = alloca ptr, align 8, addrspace(5)
  %5 = alloca i32, align 4, addrspace(5)
  %6 = alloca i32, align 4, addrspace(5)
  %7 = addrspacecast ptr addrspace(5) %4 to ptr
  %8 = addrspacecast ptr addrspace(5) %5 to ptr
  %9 = addrspacecast ptr addrspace(5) %6 to ptr
  store ptr %0, ptr %7, align 8, !tbaa !4
  store i32 %1, ptr %8, align 4, !tbaa !8
  store i32 %2, ptr %9, align 4, !tbaa !8
  %10 = load ptr, ptr %7, align 8
  %11 = load i32, ptr %8, align 4, !tbaa !8
  %12 = load i32, ptr %9, align 4, !tbaa !8
  call void @_ZN15HIP_vector_baseIiLj2EEC2Eii(ptr noundef nonnull align 8 dereferenceable(8) %10, i32 noundef %11, i32 noundef %12) #30
  ret void
}

; Function Attrs: convergent nounwind
define linkonce_odr hidden void @_ZN15HIP_vector_baseIiLj2EEC2Eii(ptr noundef nonnull align 8 dereferenceable(8) %0, i32 noundef %1, i32 noundef %2) unnamed_addr #9 comdat align 2 {
  %4 = alloca ptr, align 8, addrspace(5)
  %5 = alloca i32, align 4, addrspace(5)
  %6 = alloca i32, align 4, addrspace(5)
  %7 = addrspacecast ptr addrspace(5) %4 to ptr
  %8 = addrspacecast ptr addrspace(5) %5 to ptr
  %9 = addrspacecast ptr addrspace(5) %6 to ptr
  store ptr %0, ptr %7, align 8, !tbaa !4
  store i32 %1, ptr %8, align 4, !tbaa !8
  store i32 %2, ptr %9, align 4, !tbaa !8
  %10 = load ptr, ptr %7, align 8
  %11 = getelementptr inbounds %struct.HIP_vector_base.9, ptr %10, i32 0, i32 0
  %12 = load i32, ptr %8, align 4, !tbaa !8
  %13 = insertelement <2 x i32> undef, i32 %12, i32 0
  %14 = load i32, ptr %9, align 4, !tbaa !8
  %15 = insertelement <2 x i32> %13, i32 %14, i32 1
  store <2 x i32> %15, ptr %11, align 8, !tbaa !12
  ret void
}

; Function Attrs: convergent mustprogress nounwind
define linkonce_odr hidden noundef nonnull align 8 dereferenceable(8) ptr @_ZN15HIP_vector_baseIiLj2EEaSERKS0_(ptr noundef nonnull align 8 dereferenceable(8) %0, ptr noundef nonnull align 8 dereferenceable(8) %1) #5 comdat align 2 {
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
  %11 = getelementptr inbounds %struct.HIP_vector_base.9, ptr %10, i32 0, i32 0
  %12 = load <2 x i32>, ptr %11, align 8, !tbaa !12
  %13 = getelementptr inbounds %struct.HIP_vector_base.9, ptr %9, i32 0, i32 0
  store <2 x i32> %12, ptr %13, align 8, !tbaa !12
  ret ptr %9
}

; Function Attrs: convergent mustprogress nounwind
define linkonce_odr hidden noundef nonnull align 16 dereferenceable(16) ptr @_ZN15HIP_vector_baseIjLj4EEaSERKS0_(ptr noundef nonnull align 16 dereferenceable(16) %0, ptr noundef nonnull align 16 dereferenceable(16) %1) #5 comdat align 2 {
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
  %11 = getelementptr inbounds %struct.HIP_vector_base.4, ptr %10, i32 0, i32 0
  %12 = load <4 x i32>, ptr %11, align 16, !tbaa !12
  %13 = getelementptr inbounds %struct.HIP_vector_base.4, ptr %9, i32 0, i32 0
  store <4 x i32> %12, ptr %13, align 16, !tbaa !12
  ret ptr %9
}

; Function Attrs: convergent nounwind
define linkonce_odr hidden void @_ZN15HIP_vector_typeIhLj3EEC2IJhhhELPv0EEEDpT_(ptr noundef nonnull align 1 dereferenceable(3) %0, i8 noundef zeroext %1, i8 noundef zeroext %2, i8 noundef zeroext %3) unnamed_addr #9 comdat align 2 {
  %5 = alloca ptr, align 8, addrspace(5)
  %6 = alloca i8, align 1, addrspace(5)
  %7 = alloca i8, align 1, addrspace(5)
  %8 = alloca i8, align 1, addrspace(5)
  %9 = addrspacecast ptr addrspace(5) %5 to ptr
  %10 = addrspacecast ptr addrspace(5) %6 to ptr
  %11 = addrspacecast ptr addrspace(5) %7 to ptr
  %12 = addrspacecast ptr addrspace(5) %8 to ptr
  store ptr %0, ptr %9, align 8, !tbaa !4
  store i8 %1, ptr %10, align 1, !tbaa !12
  store i8 %2, ptr %11, align 1, !tbaa !12
  store i8 %3, ptr %12, align 1, !tbaa !12
  %13 = load ptr, ptr %9, align 8
  %14 = load i8, ptr %10, align 1, !tbaa !12
  %15 = load i8, ptr %11, align 1, !tbaa !12
  %16 = load i8, ptr %12, align 1, !tbaa !12
  call void @_ZN15HIP_vector_baseIhLj3EEC2Ehhh(ptr noundef nonnull align 1 dereferenceable(3) %13, i8 noundef zeroext %14, i8 noundef zeroext %15, i8 noundef zeroext %16) #30
  ret void
}

; Function Attrs: convergent nounwind
define linkonce_odr hidden void @_ZN15HIP_vector_baseIhLj3EEC2Ehhh(ptr noundef nonnull align 1 dereferenceable(3) %0, i8 noundef zeroext %1, i8 noundef zeroext %2, i8 noundef zeroext %3) unnamed_addr #9 comdat align 2 {
  %5 = alloca ptr, align 8, addrspace(5)
  %6 = alloca i8, align 1, addrspace(5)
  %7 = alloca i8, align 1, addrspace(5)
  %8 = alloca i8, align 1, addrspace(5)
  %9 = addrspacecast ptr addrspace(5) %5 to ptr
  %10 = addrspacecast ptr addrspace(5) %6 to ptr
  %11 = addrspacecast ptr addrspace(5) %7 to ptr
  %12 = addrspacecast ptr addrspace(5) %8 to ptr
  store ptr %0, ptr %9, align 8, !tbaa !4
  store i8 %1, ptr %10, align 1, !tbaa !12
  store i8 %2, ptr %11, align 1, !tbaa !12
  store i8 %3, ptr %12, align 1, !tbaa !12
  %13 = load ptr, ptr %9, align 8
  %14 = getelementptr inbounds %struct.HIP_vector_base, ptr %13, i32 0, i32 0
  %15 = load i8, ptr %10, align 1, !tbaa !12
  %16 = load i8, ptr %11, align 1, !tbaa !12
  %17 = load i8, ptr %12, align 1, !tbaa !12
  call void @_ZN15HIP_vector_baseIhLj3EE11Native_vec_C2Ehhh(ptr noundef nonnull align 1 dereferenceable(3) %14, i8 noundef zeroext %15, i8 noundef zeroext %16, i8 noundef zeroext %17) #30
  ret void
}

; Function Attrs: convergent nounwind
define linkonce_odr hidden void @_ZN15HIP_vector_baseIhLj3EE11Native_vec_C2Ehhh(ptr noundef nonnull align 1 dereferenceable(3) %0, i8 noundef zeroext %1, i8 noundef zeroext %2, i8 noundef zeroext %3) unnamed_addr #9 comdat align 2 {
  %5 = alloca ptr, align 8, addrspace(5)
  %6 = alloca i8, align 1, addrspace(5)
  %7 = alloca i8, align 1, addrspace(5)
  %8 = alloca i8, align 1, addrspace(5)
  %9 = addrspacecast ptr addrspace(5) %5 to ptr
  %10 = addrspacecast ptr addrspace(5) %6 to ptr
  %11 = addrspacecast ptr addrspace(5) %7 to ptr
  %12 = addrspacecast ptr addrspace(5) %8 to ptr
  store ptr %0, ptr %9, align 8, !tbaa !4
  store i8 %1, ptr %10, align 1, !tbaa !12
  store i8 %2, ptr %11, align 1, !tbaa !12
  store i8 %3, ptr %12, align 1, !tbaa !12
  %13 = load ptr, ptr %9, align 8
  %14 = getelementptr inbounds %"struct.HIP_vector_base<unsigned char, 3>::Native_vec_", ptr %13, i32 0, i32 0
  %15 = getelementptr inbounds [3 x i8], ptr %14, i64 0, i64 0
  %16 = load i8, ptr %10, align 1, !tbaa !12
  store i8 %16, ptr %15, align 1, !tbaa !12
  %17 = getelementptr inbounds i8, ptr %15, i64 1
  %18 = load i8, ptr %11, align 1, !tbaa !12
  store i8 %18, ptr %17, align 1, !tbaa !12
  %19 = getelementptr inbounds i8, ptr %17, i64 1
  %20 = load i8, ptr %12, align 1, !tbaa !12
  store i8 %20, ptr %19, align 1, !tbaa !12
  ret void
}

; Function Attrs: convergent nounwind
define linkonce_odr hidden void @_ZN15HIP_vector_typeIfLj2EEC2IJffELPv0EEEDpT_(ptr noundef nonnull align 8 dereferenceable(8) %0, float noundef %1, float noundef %2) unnamed_addr #9 comdat align 2 {
  %4 = alloca ptr, align 8, addrspace(5)
  %5 = alloca float, align 4, addrspace(5)
  %6 = alloca float, align 4, addrspace(5)
  %7 = addrspacecast ptr addrspace(5) %4 to ptr
  %8 = addrspacecast ptr addrspace(5) %5 to ptr
  %9 = addrspacecast ptr addrspace(5) %6 to ptr
  store ptr %0, ptr %7, align 8, !tbaa !4
  store float %1, ptr %8, align 4, !tbaa !20
  store float %2, ptr %9, align 4, !tbaa !20
  %10 = load ptr, ptr %7, align 8
  %11 = load float, ptr %8, align 4, !tbaa !20
  %12 = load float, ptr %9, align 4, !tbaa !20
  call void @_ZN15HIP_vector_baseIfLj2EEC2Eff(ptr noundef nonnull align 8 dereferenceable(8) %10, float noundef %11, float noundef %12) #30
  ret void
}

; Function Attrs: alwaysinline convergent mustprogress nounwind
define linkonce_odr hidden %struct.HIP_vector_type.3 @_Z7mapFromI15HIP_vector_typeIjLj4EEDv4_fENSt9enable_ifIXooooooeqstT_stNS4_10value_typeEsr3std7is_sameIS5_iEE5valuesr3std7is_sameIS5_jEE5valuesr3std7is_sameIS5_fEE5valueEKS4_E4typeERKT0_(ptr noundef nonnull align 16 dereferenceable(16) %0) #11 comdat {
  %2 = alloca %struct.HIP_vector_type.3, align 16, addrspace(5)
  %3 = alloca ptr, align 8, addrspace(5)
  %4 = alloca %union.anon.27, align 16, addrspace(5)
  %5 = alloca i32, align 4, addrspace(5)
  %6 = addrspacecast ptr addrspace(5) %2 to ptr
  %7 = addrspacecast ptr addrspace(5) %3 to ptr
  %8 = addrspacecast ptr addrspace(5) %4 to ptr
  store ptr %0, ptr %7, align 8, !tbaa !4
  call void @llvm.lifetime.start.p5(i64 16, ptr addrspace(5) %4) #27
  %9 = load ptr, ptr %7, align 8, !tbaa !4
  %10 = load <4 x float>, ptr %9, align 16, !tbaa !12
  store <4 x float> %10, ptr %8, align 16, !tbaa !12
  call void @llvm.memcpy.p0.p0.i64(ptr align 16 %6, ptr align 16 %8, i64 16, i1 false)
  call void @llvm.lifetime.end.p5(i64 16, ptr addrspace(5) %4) #27
  %11 = load %struct.HIP_vector_type.3, ptr %6, align 16
  ret %struct.HIP_vector_type.3 %11
}

; Function Attrs: convergent nounwind
define linkonce_odr hidden void @_ZN15HIP_vector_baseIfLj2EEC2Eff(ptr noundef nonnull align 8 dereferenceable(8) %0, float noundef %1, float noundef %2) unnamed_addr #9 comdat align 2 {
  %4 = alloca ptr, align 8, addrspace(5)
  %5 = alloca float, align 4, addrspace(5)
  %6 = alloca float, align 4, addrspace(5)
  %7 = addrspacecast ptr addrspace(5) %4 to ptr
  %8 = addrspacecast ptr addrspace(5) %5 to ptr
  %9 = addrspacecast ptr addrspace(5) %6 to ptr
  store ptr %0, ptr %7, align 8, !tbaa !4
  store float %1, ptr %8, align 4, !tbaa !20
  store float %2, ptr %9, align 4, !tbaa !20
  %10 = load ptr, ptr %7, align 8
  %11 = getelementptr inbounds %struct.HIP_vector_base.24, ptr %10, i32 0, i32 0
  %12 = load float, ptr %8, align 4, !tbaa !20
  %13 = insertelement <2 x float> undef, float %12, i32 0
  %14 = load float, ptr %9, align 4, !tbaa !20
  %15 = insertelement <2 x float> %13, float %14, i32 1
  store <2 x float> %15, ptr %11, align 8, !tbaa !12
  ret void
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
  %11 = call i64 @__ockl_get_group_id(i32 noundef %10) #23
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
  %11 = call i64 @__ockl_get_local_size(i32 noundef %10) #23
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
  %11 = call i64 @__ockl_get_local_id(i32 noundef %10) #23
  %12 = trunc i64 %11 to i32
  ret i32 %12
}

; Function Attrs: convergent mustprogress nofree norecurse nounwind readonly willreturn
define internal <4 x float> @__ockl_image_sample_2D(ptr addrspace(4) nocapture noundef readonly %0, ptr addrspace(4) nocapture noundef readonly %1, <2 x float> noundef %2) #13 {
  %4 = getelementptr inbounds i32, ptr addrspace(4) %0, i64 10
  %5 = load i32, ptr addrspace(4) %4, align 4, !tbaa !45
  %6 = uitofp i32 %5 to float
  %7 = getelementptr inbounds i32, ptr addrspace(4) %0, i64 2
  %8 = load i32, ptr addrspace(4) %7, align 4, !tbaa !45
  %9 = lshr i32 %8, 14
  %10 = and i32 %9, 16383
  %11 = add nuw nsw i32 %10, 1
  %12 = uitofp i32 %11 to float
  %13 = load i32, ptr addrspace(4) %1, align 4, !tbaa !45
  %14 = and i32 %13, 32768
  %15 = icmp eq i32 %14, 0
  %16 = select i1 %15, float %6, float 1.000000e+00
  %17 = select i1 %15, float %12, float 1.000000e+00
  %18 = extractelement <2 x float> %2, i64 0
  %19 = fmul float %18, %16
  %20 = tail call float @llvm.floor.f32(float %19)
  %21 = tail call float @llvm.amdgcn.rcp.f32(float %16)
  %22 = fmul float %21, %20
  %23 = extractelement <2 x float> %2, i64 1
  %24 = fmul float %23, %17
  %25 = tail call float @llvm.floor.f32(float %24)
  %26 = tail call float @llvm.amdgcn.rcp.f32(float %17)
  %27 = fmul float %26, %25
  %28 = getelementptr inbounds i32, ptr addrspace(4) %1, i64 2
  %29 = load i32, ptr addrspace(4) %28, align 4, !tbaa !45
  %30 = and i32 %29, 1048576
  %31 = icmp eq i32 %30, 0
  %32 = select i1 %31, float %22, float %18
  %33 = select i1 %31, float %27, float %23
  %34 = load i32, ptr addrspace(4) @__oclc_ISA_version, align 4, !tbaa !45
  %35 = icmp eq i32 %34, 9010
  %36 = load <8 x i32>, ptr addrspace(4) %0, align 32, !tbaa !49
  %37 = load <4 x i32>, ptr addrspace(4) %1, align 16, !tbaa !49
  br i1 %35, label %40, label %38

38:                                               ; preds = %3
  %39 = tail call fastcc <4 x float> @0(float noundef %32, float noundef %33, <8 x i32> noundef %36, <4 x i32> noundef %37) #17
  br label %42

40:                                               ; preds = %3
  %41 = tail call <4 x float> @llvm.amdgcn.image.sample.2d.v4f32.f32(i32 15, float %32, float %33, <8 x i32> %36, <4 x i32> %37, i1 false, i32 0, i32 0)
  br label %42

42:                                               ; preds = %40, %38
  %43 = phi <4 x float> [ %39, %38 ], [ %41, %40 ]
  ret <4 x float> %43
}

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.floor.f32(float) #14

; Function Attrs: nounwind readnone speculatable willreturn
declare float @llvm.amdgcn.rcp.f32(float) #15

; Function Attrs: convergent mustprogress nofree norecurse nounwind readonly willreturn
define internal fastcc <4 x float> @0(float noundef %0, float noundef %1, <8 x i32> noundef %2, <4 x i32> noundef %3) unnamed_addr #16 {
  %5 = tail call <4 x float> @llvm.amdgcn.image.sample.lz.2d.v4f32.f32(i32 15, float %0, float %1, <8 x i32> %2, <4 x i32> %3, i1 false, i32 0, i32 0)
  ret <4 x float> %5
}

; Function Attrs: nounwind readonly willreturn
declare <4 x float> @llvm.amdgcn.image.sample.2d.v4f32.f32(i32 immarg, float, float, <8 x i32>, <4 x i32>, i1 immarg, i32 immarg, i32 immarg) #17

; Function Attrs: nounwind readonly willreturn
declare <4 x float> @llvm.amdgcn.image.sample.lz.2d.v4f32.f32(i32 immarg, float, float, <8 x i32>, <4 x i32>, i1 immarg, i32 immarg, i32 immarg) #17

; Function Attrs: convergent mustprogress nofree norecurse nosync nounwind readnone willreturn
define internal i32 @__ockl_mul24_u32(i32 noundef %0, i32 noundef %1) #18 {
  %3 = and i32 %0, 16777215
  %4 = and i32 %1, 16777215
  %5 = mul i32 %4, %3
  ret i32 %5
}

; Function Attrs: convergent norecurse nounwind
define internal i64 @__ockl_fprintf_stderr_begin() #19 {
  %1 = tail call <2 x i64> @__ockl_hostcall_preview(i32 noundef 2, i64 noundef 33, i64 noundef 1, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #30
  %2 = extractelement <2 x i64> %1, i64 0
  ret i64 %2
}

; Function Attrs: convergent norecurse nounwind
define internal <2 x i64> @__ockl_hostcall_preview(i32 noundef %0, i64 noundef %1, i64 noundef %2, i64 noundef %3, i64 noundef %4, i64 noundef %5, i64 noundef %6, i64 noundef %7, i64 noundef %8) local_unnamed_addr #19 {
  %10 = load i32, ptr addrspace(4) @__oclc_ABI_version, align 4, !tbaa !45
  %11 = icmp slt i32 %10, 500
  %12 = tail call ptr addrspace(4) @llvm.amdgcn.implicitarg.ptr()
  %13 = select i1 %11, i64 3, i64 10
  %14 = getelementptr inbounds i64, ptr addrspace(4) %12, i64 %13
  %15 = load i64, ptr addrspace(4) %14, align 8, !tbaa !50
  %16 = inttoptr i64 %15 to ptr addrspace(1)
  %17 = addrspacecast ptr addrspace(1) %16 to ptr
  %18 = tail call <2 x i64> @__ockl_hostcall_internal(ptr noundef %17, i32 noundef %0, i64 noundef %1, i64 noundef %2, i64 noundef %3, i64 noundef %4, i64 noundef %5, i64 noundef %6, i64 noundef %7, i64 noundef %8) #30
  ret <2 x i64> %18
}

; Function Attrs: nounwind readnone speculatable willreturn
declare align 4 ptr addrspace(4) @llvm.amdgcn.implicitarg.ptr() #15

; Function Attrs: convergent noinline norecurse nounwind optnone
define internal <2 x i64> @__ockl_hostcall_internal(ptr noundef %0, i32 noundef %1, i64 noundef %2, i64 noundef %3, i64 noundef %4, i64 noundef %5, i64 noundef %6, i64 noundef %7, i64 noundef %8, i64 noundef %9) local_unnamed_addr #20 {
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
  store ptr %0, ptr addrspace(5) %11, align 8, !tbaa !52
  store i32 %1, ptr addrspace(5) %12, align 4, !tbaa !45
  store i64 %2, ptr addrspace(5) %13, align 8, !tbaa !50
  store i64 %3, ptr addrspace(5) %14, align 8, !tbaa !50
  store i64 %4, ptr addrspace(5) %15, align 8, !tbaa !50
  store i64 %5, ptr addrspace(5) %16, align 8, !tbaa !50
  store i64 %6, ptr addrspace(5) %17, align 8, !tbaa !50
  store i64 %7, ptr addrspace(5) %18, align 8, !tbaa !50
  store i64 %8, ptr addrspace(5) %19, align 8, !tbaa !50
  store i64 %9, ptr addrspace(5) %20, align 8, !tbaa !50
  call void @llvm.lifetime.start.p5(i64 4, ptr addrspace(5) %21) #27
  %28 = call i32 @__ockl_lane_u32() #31
  store i32 %28, ptr addrspace(5) %21, align 4, !tbaa !45
  %29 = load i32, ptr addrspace(5) %21, align 4, !tbaa !45
  %30 = call fastcc i32 @1(i32 noundef %29) #31
  store i32 %30, ptr addrspace(5) %21, align 4, !tbaa !45
  call void @llvm.lifetime.start.p5(i64 4, ptr addrspace(5) %22) #27
  %31 = load i32, ptr addrspace(5) %21, align 4, !tbaa !45
  %32 = call i32 @llvm.amdgcn.readfirstlane(i32 %31)
  store i32 %32, ptr addrspace(5) %22, align 4, !tbaa !45
  call void @llvm.lifetime.start.p5(i64 8, ptr addrspace(5) %23) #27
  %33 = load ptr, ptr addrspace(5) %11, align 8, !tbaa !52
  %34 = addrspacecast ptr %33 to ptr addrspace(1)
  store ptr addrspace(1) %34, ptr addrspace(5) %23, align 8, !tbaa !52
  call void @llvm.lifetime.start.p5(i64 8, ptr addrspace(5) %24) #27
  %35 = load ptr addrspace(1), ptr addrspace(5) %23, align 8, !tbaa !52
  %36 = load i32, ptr addrspace(5) %21, align 4, !tbaa !45
  %37 = load i32, ptr addrspace(5) %22, align 4, !tbaa !45
  %38 = call fastcc i64 @2(ptr addrspace(1) noundef %35, i32 noundef %36, i32 noundef %37) #31
  store i64 %38, ptr addrspace(5) %24, align 8, !tbaa !50
  call void @llvm.lifetime.start.p5(i64 8, ptr addrspace(5) %25) #27
  %39 = load ptr addrspace(1), ptr addrspace(5) %23, align 8, !tbaa !52
  %40 = load i64, ptr addrspace(5) %24, align 8, !tbaa !50
  %41 = load ptr addrspace(1), ptr addrspace(1) %39, align 8, !tbaa !54
  %42 = getelementptr i8, ptr addrspace(1) %39, i64 40
  %43 = load i64, ptr addrspace(1) %42, align 8, !tbaa !57
  %44 = call fastcc ptr addrspace(1) @3(ptr addrspace(1) %41, i64 %43, i64 noundef %40) #31
  store ptr addrspace(1) %44, ptr addrspace(5) %25, align 8, !tbaa !52
  call void @llvm.lifetime.start.p5(i64 8, ptr addrspace(5) %26) #27
  %45 = load ptr addrspace(1), ptr addrspace(5) %23, align 8, !tbaa !52
  %46 = load i64, ptr addrspace(5) %24, align 8, !tbaa !50
  %47 = getelementptr i8, ptr addrspace(1) %45, i64 8
  %48 = load ptr addrspace(1), ptr addrspace(1) %47, align 8, !tbaa !58
  %49 = getelementptr i8, ptr addrspace(1) %45, i64 40
  %50 = load i64, ptr addrspace(1) %49, align 8, !tbaa !57
  %51 = call fastcc ptr addrspace(1) @4(ptr addrspace(1) %48, i64 %50, i64 noundef %46) #31
  store ptr addrspace(1) %51, ptr addrspace(5) %26, align 8, !tbaa !52
  %52 = load ptr addrspace(1), ptr addrspace(5) %25, align 8, !tbaa !52
  %53 = load ptr addrspace(1), ptr addrspace(5) %26, align 8, !tbaa !52
  %54 = load i32, ptr addrspace(5) %12, align 4, !tbaa !45
  %55 = load i64, ptr addrspace(5) %13, align 8, !tbaa !50
  %56 = load i64, ptr addrspace(5) %14, align 8, !tbaa !50
  %57 = load i64, ptr addrspace(5) %15, align 8, !tbaa !50
  %58 = load i64, ptr addrspace(5) %16, align 8, !tbaa !50
  %59 = load i64, ptr addrspace(5) %17, align 8, !tbaa !50
  %60 = load i64, ptr addrspace(5) %18, align 8, !tbaa !50
  %61 = load i64, ptr addrspace(5) %19, align 8, !tbaa !50
  %62 = load i64, ptr addrspace(5) %20, align 8, !tbaa !50
  %63 = load i32, ptr addrspace(5) %21, align 4, !tbaa !45
  %64 = load i32, ptr addrspace(5) %22, align 4, !tbaa !45
  call fastcc void @5(ptr addrspace(1) noundef %52, ptr addrspace(1) noundef %53, i32 noundef %54, i64 noundef %55, i64 noundef %56, i64 noundef %57, i64 noundef %58, i64 noundef %59, i64 noundef %60, i64 noundef %61, i64 noundef %62, i32 noundef %63, i32 noundef %64) #31
  %65 = load ptr addrspace(1), ptr addrspace(5) %23, align 8, !tbaa !52
  %66 = load i64, ptr addrspace(5) %24, align 8, !tbaa !50
  %67 = load i32, ptr addrspace(5) %21, align 4, !tbaa !45
  %68 = load i32, ptr addrspace(5) %22, align 4, !tbaa !45
  call fastcc void @6(ptr addrspace(1) noundef %65, i64 noundef %66, i32 noundef %67, i32 noundef %68) #31
  call void @llvm.lifetime.start.p5(i64 16, ptr addrspace(5) %27) #27
  %69 = load ptr addrspace(1), ptr addrspace(5) %25, align 8, !tbaa !52
  %70 = load ptr addrspace(1), ptr addrspace(5) %26, align 8, !tbaa !52
  %71 = load i32, ptr addrspace(5) %21, align 4, !tbaa !45
  %72 = load i32, ptr addrspace(5) %22, align 4, !tbaa !45
  %73 = call fastcc <2 x i64> @7(ptr addrspace(1) noundef %69, ptr addrspace(1) noundef %70, i32 noundef %71, i32 noundef %72) #31
  store <2 x i64> %73, ptr addrspace(5) %27, align 16, !tbaa !49
  %74 = load ptr addrspace(1), ptr addrspace(5) %23, align 8, !tbaa !52
  %75 = load i64, ptr addrspace(5) %24, align 8, !tbaa !50
  %76 = load i32, ptr addrspace(5) %21, align 4, !tbaa !45
  %77 = load i32, ptr addrspace(5) %22, align 4, !tbaa !45
  call fastcc void @8(ptr addrspace(1) noundef %74, i64 noundef %75, i32 noundef %76, i32 noundef %77) #31
  %78 = load <2 x i64>, ptr addrspace(5) %27, align 16, !tbaa !49
  call void @llvm.lifetime.end.p5(i64 16, ptr addrspace(5) %27) #27
  call void @llvm.lifetime.end.p5(i64 8, ptr addrspace(5) %26) #27
  call void @llvm.lifetime.end.p5(i64 8, ptr addrspace(5) %25) #27
  call void @llvm.lifetime.end.p5(i64 8, ptr addrspace(5) %24) #27
  call void @llvm.lifetime.end.p5(i64 8, ptr addrspace(5) %23) #27
  call void @llvm.lifetime.end.p5(i64 4, ptr addrspace(5) %22) #27
  call void @llvm.lifetime.end.p5(i64 4, ptr addrspace(5) %21) #27
  ret <2 x i64> %78
}

; Function Attrs: alwaysinline convergent mustprogress nofree norecurse nosync nounwind readnone willreturn
define internal i32 @__ockl_lane_u32() local_unnamed_addr #21 {
  %1 = load i8, ptr addrspace(4) @__oclc_wavefrontsize64, align 1, !tbaa !59, !range !40
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
define internal fastcc i32 @1(i32 noundef %0) unnamed_addr #22 {
  %2 = tail call i32 asm sideeffect "; ockl readfirstlane hoisting hack $0", "=v,0"(i32 %0) #30, !srcloc !61
  ret i32 %2
}

; Function Attrs: convergent nounwind readnone willreturn
declare i32 @llvm.amdgcn.readfirstlane(i32) #23

; Function Attrs: convergent norecurse nounwind
define internal fastcc i64 @2(ptr addrspace(1) nocapture noundef %0, i32 noundef %1, i32 noundef %2) unnamed_addr #22 {
  %4 = icmp eq i32 %1, %2
  br i1 %4, label %5, label %29

5:                                                ; preds = %3
  %6 = getelementptr inbounds %0, ptr addrspace(1) %0, i64 0, i32 3
  %7 = load atomic i64, ptr addrspace(1) %6 syncscope("one-as") acquire, align 8
  %8 = getelementptr i8, ptr addrspace(1) %0, i64 40
  %9 = load ptr addrspace(1), ptr addrspace(1) %0, align 8, !tbaa !54
  %10 = load i64, ptr addrspace(1) %8, align 8, !tbaa !57
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
  %19 = load ptr addrspace(1), ptr addrspace(1) %0, align 8, !tbaa !54
  %20 = load i64, ptr addrspace(1) %8, align 8, !tbaa !57
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
define internal fastcc ptr addrspace(1) @3(ptr addrspace(1) %0, i64 %1, i64 noundef %2) unnamed_addr #24 {
  %4 = and i64 %2, %1
  %5 = getelementptr inbounds %2, ptr addrspace(1) %0, i64 %4
  ret ptr addrspace(1) %5
}

; Function Attrs: argmemonly convergent mustprogress nofree norecurse nosync nounwind readonly willreturn
define internal fastcc ptr addrspace(1) @4(ptr addrspace(1) %0, i64 %1, i64 noundef %2) unnamed_addr #24 {
  %4 = and i64 %2, %1
  %5 = getelementptr inbounds %3, ptr addrspace(1) %0, i64 %4
  ret ptr addrspace(1) %5
}

; Function Attrs: convergent mustprogress nofree norecurse nounwind willreturn
define internal fastcc void @5(ptr addrspace(1) nocapture noundef writeonly %0, ptr addrspace(1) nocapture noundef writeonly %1, i32 noundef %2, i64 noundef %3, i64 noundef %4, i64 noundef %5, i64 noundef %6, i64 noundef %7, i64 noundef %8, i64 noundef %9, i64 noundef %10, i32 noundef %11, i32 noundef %12) unnamed_addr #25 {
  %14 = tail call i64 @llvm.read_register.i64(metadata !62) #31
  %15 = icmp eq i32 %11, %12
  br i1 %15, label %16, label %20

16:                                               ; preds = %13
  %17 = getelementptr inbounds %2, ptr addrspace(1) %0, i64 0, i32 3
  %18 = getelementptr inbounds %2, ptr addrspace(1) %0, i64 0, i32 1
  %19 = getelementptr inbounds %2, ptr addrspace(1) %0, i64 0, i32 2
  store i32 %2, ptr addrspace(1) %19, align 8, !tbaa !63
  store i64 %14, ptr addrspace(1) %18, align 8, !tbaa !65
  store i32 1, ptr addrspace(1) %17, align 4, !tbaa !66
  br label %20

20:                                               ; preds = %16, %13
  %21 = zext i32 %11 to i64
  %22 = getelementptr inbounds [64 x [8 x i64]], ptr addrspace(1) %1, i64 0, i64 %21
  store i64 %3, ptr addrspace(1) %22, align 8, !tbaa !50
  %23 = getelementptr inbounds i64, ptr addrspace(1) %22, i64 1
  store i64 %4, ptr addrspace(1) %23, align 8, !tbaa !50
  %24 = getelementptr inbounds i64, ptr addrspace(1) %22, i64 2
  store i64 %5, ptr addrspace(1) %24, align 8, !tbaa !50
  %25 = getelementptr inbounds i64, ptr addrspace(1) %22, i64 3
  store i64 %6, ptr addrspace(1) %25, align 8, !tbaa !50
  %26 = getelementptr inbounds i64, ptr addrspace(1) %22, i64 4
  store i64 %7, ptr addrspace(1) %26, align 8, !tbaa !50
  %27 = getelementptr inbounds i64, ptr addrspace(1) %22, i64 5
  store i64 %8, ptr addrspace(1) %27, align 8, !tbaa !50
  %28 = getelementptr inbounds i64, ptr addrspace(1) %22, i64 6
  store i64 %9, ptr addrspace(1) %28, align 8, !tbaa !50
  %29 = getelementptr inbounds i64, ptr addrspace(1) %22, i64 7
  store i64 %10, ptr addrspace(1) %29, align 8, !tbaa !50
  ret void
}

; Function Attrs: convergent norecurse nounwind
define internal fastcc void @6(ptr addrspace(1) nocapture noundef %0, i64 noundef %1, i32 noundef %2, i32 noundef %3) unnamed_addr #22 {
  %5 = icmp eq i32 %2, %3
  br i1 %5, label %6, label %24

6:                                                ; preds = %4
  %7 = getelementptr inbounds %0, ptr addrspace(1) %0, i64 0, i32 4
  %8 = load atomic i64, ptr addrspace(1) %7 syncscope("one-as") monotonic, align 8
  %9 = load ptr addrspace(1), ptr addrspace(1) %0, align 8, !tbaa !54
  %10 = getelementptr i8, ptr addrspace(1) %0, i64 40
  %11 = load i64, ptr addrspace(1) %10, align 8, !tbaa !57
  %12 = and i64 %11, %1
  %13 = getelementptr inbounds %2, ptr addrspace(1) %9, i64 %12
  store i64 %8, ptr addrspace(1) %13, align 8, !tbaa !67
  %14 = cmpxchg ptr addrspace(1) %7, i64 %8, i64 %1 syncscope("one-as") release monotonic, align 8
  %15 = extractvalue { i64, i1 } %14, 1
  br i1 %15, label %21, label %16

16:                                               ; preds = %16, %6
  %17 = phi { i64, i1 } [ %19, %16 ], [ %14, %6 ]
  %18 = extractvalue { i64, i1 } %17, 0
  tail call void @llvm.amdgcn.s.sleep(i32 1)
  store i64 %18, ptr addrspace(1) %13, align 8, !tbaa !67
  %19 = cmpxchg ptr addrspace(1) %7, i64 %18, i64 %1 syncscope("one-as") release monotonic, align 8
  %20 = extractvalue { i64, i1 } %19, 1
  br i1 %20, label %21, label %16

21:                                               ; preds = %16, %6
  %22 = getelementptr inbounds %0, ptr addrspace(1) %0, i64 0, i32 2
  %23 = load i64, ptr addrspace(1) %22, align 8
  tail call void @__ockl_hsa_signal_add(i64 %23, i64 noundef 1, i32 noundef 3) #30
  br label %24

24:                                               ; preds = %21, %4
  ret void
}

; Function Attrs: convergent norecurse nounwind
define internal fastcc <2 x i64> @7(ptr addrspace(1) nocapture noundef readonly %0, ptr addrspace(1) nocapture noundef readonly %1, i32 noundef %2, i32 noundef %3) unnamed_addr #19 {
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
  %20 = load i64, ptr addrspace(1) %18, align 8, !tbaa !50
  %21 = load i64, ptr addrspace(1) %19, align 8, !tbaa !50
  %22 = insertelement <2 x i64> undef, i64 %20, i64 0
  %23 = insertelement <2 x i64> %22, i64 %21, i64 1
  ret <2 x i64> %23
}

; Function Attrs: convergent norecurse nounwind
define internal fastcc void @8(ptr addrspace(1) nocapture noundef %0, i64 noundef %1, i32 noundef %2, i32 noundef %3) unnamed_addr #22 {
  %5 = icmp eq i32 %2, %3
  br i1 %5, label %6, label %25

6:                                                ; preds = %4
  %7 = getelementptr %0, ptr addrspace(1) %0, i64 0, i32 5
  %8 = load i64, ptr addrspace(1) %7, align 8, !tbaa !57
  %9 = add i64 %8, 1
  %10 = add i64 %9, %1
  %11 = icmp eq i64 %10, 0
  %12 = select i1 %11, i64 %9, i64 %10
  %13 = getelementptr inbounds %0, ptr addrspace(1) %0, i64 0, i32 3
  %14 = load atomic i64, ptr addrspace(1) %13 syncscope("one-as") monotonic, align 8
  %15 = load ptr addrspace(1), ptr addrspace(1) %0, align 8, !tbaa !54
  %16 = and i64 %12, %8
  %17 = getelementptr inbounds %2, ptr addrspace(1) %15, i64 %16
  store i64 %14, ptr addrspace(1) %17, align 8, !tbaa !67
  %18 = cmpxchg ptr addrspace(1) %13, i64 %14, i64 %12 syncscope("one-as") release monotonic, align 8
  %19 = extractvalue { i64, i1 } %18, 1
  br i1 %19, label %25, label %20

20:                                               ; preds = %20, %6
  %21 = phi { i64, i1 } [ %23, %20 ], [ %18, %6 ]
  %22 = extractvalue { i64, i1 } %21, 0
  tail call void @llvm.amdgcn.s.sleep(i32 1)
  store i64 %22, ptr addrspace(1) %17, align 8, !tbaa !67
  %23 = cmpxchg ptr addrspace(1) %13, i64 %22, i64 %12 syncscope("one-as") release monotonic, align 8
  %24 = extractvalue { i64, i1 } %23, 1
  br i1 %24, label %25, label %20

25:                                               ; preds = %20, %6, %4
  ret void
}

; Function Attrs: nounwind willreturn
declare void @llvm.amdgcn.s.sleep(i32 immarg) #26

; Function Attrs: convergent norecurse nounwind
define internal void @__ockl_hsa_signal_add(i64 %0, i64 noundef %1, i32 noundef %2) local_unnamed_addr #22 {
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
  %18 = load i64, ptr addrspace(1) %17, align 16, !tbaa !68
  %19 = icmp eq i64 %18, 0
  br i1 %19, label %27, label %20

20:                                               ; preds = %16
  %21 = inttoptr i64 %18 to ptr addrspace(1)
  %22 = getelementptr inbounds %4, ptr addrspace(1) %4, i64 0, i32 3
  %23 = load i32, ptr addrspace(1) %22, align 8, !tbaa !70
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
declare void @llvm.amdgcn.s.sendmsg(i32 immarg, i32) #27

; Function Attrs: nounwind readonly
declare i64 @llvm.read_register.i64(metadata) #28

; Function Attrs: nounwind readnone willreturn
declare i32 @llvm.amdgcn.mbcnt.lo(i32, i32) #29

; Function Attrs: nounwind readnone willreturn
declare i32 @llvm.amdgcn.mbcnt.hi(i32, i32) #29

; Function Attrs: convergent norecurse nounwind
define internal i64 @__ockl_fprintf_append_args(i64 noundef %0, i32 noundef %1, i64 noundef %2, i64 noundef %3, i64 noundef %4, i64 noundef %5, i64 noundef %6, i64 noundef %7, i64 noundef %8, i32 noundef %9) #19 {
  %11 = icmp eq i32 %9, 0
  %12 = or i64 %0, 2
  %13 = select i1 %11, i64 %0, i64 %12
  %14 = and i64 %13, -225
  %15 = zext i32 %1 to i64
  %16 = shl nuw nsw i64 %15, 5
  %17 = or i64 %14, %16
  %18 = tail call <2 x i64> @__ockl_hostcall_preview(i32 noundef 2, i64 noundef %17, i64 noundef %2, i64 noundef %3, i64 noundef %4, i64 noundef %5, i64 noundef %6, i64 noundef %7, i64 noundef %8) #30
  %19 = extractelement <2 x i64> %18, i64 0
  ret i64 %19
}

; Function Attrs: convergent norecurse nounwind
define internal i64 @__ockl_fprintf_append_string_n(i64 noundef %0, ptr noundef readonly %1, i64 noundef %2, i32 noundef %3) #19 {
  %5 = icmp eq i32 %3, 0
  %6 = or i64 %0, 2
  %7 = select i1 %5, i64 %0, i64 %6
  %8 = icmp eq ptr %1, null
  br i1 %8, label %9, label %13

9:                                                ; preds = %4
  %10 = and i64 %7, -225
  %11 = or i64 %10, 32
  %12 = tail call <2 x i64> @__ockl_hostcall_preview(i32 noundef 2, i64 noundef %11, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #30
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
  %33 = load i8, ptr %19, align 1, !tbaa !49
  %34 = zext i8 %33 to i64
  %35 = getelementptr inbounds i8, ptr %19, i64 1
  %36 = load i8, ptr %35, align 1, !tbaa !49
  %37 = zext i8 %36 to i64
  %38 = shl nuw nsw i64 %37, 8
  %39 = or i64 %38, %34
  %40 = getelementptr inbounds i8, ptr %19, i64 2
  %41 = load i8, ptr %40, align 1, !tbaa !49
  %42 = zext i8 %41 to i64
  %43 = shl nuw nsw i64 %42, 16
  %44 = or i64 %39, %43
  %45 = getelementptr inbounds i8, ptr %19, i64 3
  %46 = load i8, ptr %45, align 1, !tbaa !49
  %47 = zext i8 %46 to i64
  %48 = shl nuw nsw i64 %47, 24
  %49 = or i64 %44, %48
  %50 = getelementptr inbounds i8, ptr %19, i64 4
  %51 = load i8, ptr %50, align 1, !tbaa !49
  %52 = zext i8 %51 to i64
  %53 = shl nuw nsw i64 %52, 32
  %54 = or i64 %49, %53
  %55 = getelementptr inbounds i8, ptr %19, i64 5
  %56 = load i8, ptr %55, align 1, !tbaa !49
  %57 = zext i8 %56 to i64
  %58 = shl nuw nsw i64 %57, 40
  %59 = or i64 %54, %58
  %60 = getelementptr inbounds i8, ptr %19, i64 6
  %61 = load i8, ptr %60, align 1, !tbaa !49
  %62 = zext i8 %61 to i64
  %63 = shl nuw nsw i64 %62, 48
  %64 = or i64 %59, %63
  %65 = getelementptr inbounds i8, ptr %19, i64 7
  %66 = load i8, ptr %65, align 1, !tbaa !49
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
  %77 = load i8, ptr %76, align 1, !tbaa !49
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
  %93 = load i8, ptr %86, align 1, !tbaa !49
  %94 = zext i8 %93 to i64
  %95 = getelementptr inbounds i8, ptr %86, i64 1
  %96 = load i8, ptr %95, align 1, !tbaa !49
  %97 = zext i8 %96 to i64
  %98 = shl nuw nsw i64 %97, 8
  %99 = or i64 %98, %94
  %100 = getelementptr inbounds i8, ptr %86, i64 2
  %101 = load i8, ptr %100, align 1, !tbaa !49
  %102 = zext i8 %101 to i64
  %103 = shl nuw nsw i64 %102, 16
  %104 = or i64 %99, %103
  %105 = getelementptr inbounds i8, ptr %86, i64 3
  %106 = load i8, ptr %105, align 1, !tbaa !49
  %107 = zext i8 %106 to i64
  %108 = shl nuw nsw i64 %107, 24
  %109 = or i64 %104, %108
  %110 = getelementptr inbounds i8, ptr %86, i64 4
  %111 = load i8, ptr %110, align 1, !tbaa !49
  %112 = zext i8 %111 to i64
  %113 = shl nuw nsw i64 %112, 32
  %114 = or i64 %109, %113
  %115 = getelementptr inbounds i8, ptr %86, i64 5
  %116 = load i8, ptr %115, align 1, !tbaa !49
  %117 = zext i8 %116 to i64
  %118 = shl nuw nsw i64 %117, 40
  %119 = or i64 %114, %118
  %120 = getelementptr inbounds i8, ptr %86, i64 6
  %121 = load i8, ptr %120, align 1, !tbaa !49
  %122 = zext i8 %121 to i64
  %123 = shl nuw nsw i64 %122, 48
  %124 = or i64 %119, %123
  %125 = getelementptr inbounds i8, ptr %86, i64 7
  %126 = load i8, ptr %125, align 1, !tbaa !49
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
  %137 = load i8, ptr %136, align 1, !tbaa !49
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
  %153 = load i8, ptr %146, align 1, !tbaa !49
  %154 = zext i8 %153 to i64
  %155 = getelementptr inbounds i8, ptr %146, i64 1
  %156 = load i8, ptr %155, align 1, !tbaa !49
  %157 = zext i8 %156 to i64
  %158 = shl nuw nsw i64 %157, 8
  %159 = or i64 %158, %154
  %160 = getelementptr inbounds i8, ptr %146, i64 2
  %161 = load i8, ptr %160, align 1, !tbaa !49
  %162 = zext i8 %161 to i64
  %163 = shl nuw nsw i64 %162, 16
  %164 = or i64 %159, %163
  %165 = getelementptr inbounds i8, ptr %146, i64 3
  %166 = load i8, ptr %165, align 1, !tbaa !49
  %167 = zext i8 %166 to i64
  %168 = shl nuw nsw i64 %167, 24
  %169 = or i64 %164, %168
  %170 = getelementptr inbounds i8, ptr %146, i64 4
  %171 = load i8, ptr %170, align 1, !tbaa !49
  %172 = zext i8 %171 to i64
  %173 = shl nuw nsw i64 %172, 32
  %174 = or i64 %169, %173
  %175 = getelementptr inbounds i8, ptr %146, i64 5
  %176 = load i8, ptr %175, align 1, !tbaa !49
  %177 = zext i8 %176 to i64
  %178 = shl nuw nsw i64 %177, 40
  %179 = or i64 %174, %178
  %180 = getelementptr inbounds i8, ptr %146, i64 6
  %181 = load i8, ptr %180, align 1, !tbaa !49
  %182 = zext i8 %181 to i64
  %183 = shl nuw nsw i64 %182, 48
  %184 = or i64 %179, %183
  %185 = getelementptr inbounds i8, ptr %146, i64 7
  %186 = load i8, ptr %185, align 1, !tbaa !49
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
  %197 = load i8, ptr %196, align 1, !tbaa !49
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
  %213 = load i8, ptr %206, align 1, !tbaa !49
  %214 = zext i8 %213 to i64
  %215 = getelementptr inbounds i8, ptr %206, i64 1
  %216 = load i8, ptr %215, align 1, !tbaa !49
  %217 = zext i8 %216 to i64
  %218 = shl nuw nsw i64 %217, 8
  %219 = or i64 %218, %214
  %220 = getelementptr inbounds i8, ptr %206, i64 2
  %221 = load i8, ptr %220, align 1, !tbaa !49
  %222 = zext i8 %221 to i64
  %223 = shl nuw nsw i64 %222, 16
  %224 = or i64 %219, %223
  %225 = getelementptr inbounds i8, ptr %206, i64 3
  %226 = load i8, ptr %225, align 1, !tbaa !49
  %227 = zext i8 %226 to i64
  %228 = shl nuw nsw i64 %227, 24
  %229 = or i64 %224, %228
  %230 = getelementptr inbounds i8, ptr %206, i64 4
  %231 = load i8, ptr %230, align 1, !tbaa !49
  %232 = zext i8 %231 to i64
  %233 = shl nuw nsw i64 %232, 32
  %234 = or i64 %229, %233
  %235 = getelementptr inbounds i8, ptr %206, i64 5
  %236 = load i8, ptr %235, align 1, !tbaa !49
  %237 = zext i8 %236 to i64
  %238 = shl nuw nsw i64 %237, 40
  %239 = or i64 %234, %238
  %240 = getelementptr inbounds i8, ptr %206, i64 6
  %241 = load i8, ptr %240, align 1, !tbaa !49
  %242 = zext i8 %241 to i64
  %243 = shl nuw nsw i64 %242, 48
  %244 = or i64 %239, %243
  %245 = getelementptr inbounds i8, ptr %206, i64 7
  %246 = load i8, ptr %245, align 1, !tbaa !49
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
  %257 = load i8, ptr %256, align 1, !tbaa !49
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
  %273 = load i8, ptr %266, align 1, !tbaa !49
  %274 = zext i8 %273 to i64
  %275 = getelementptr inbounds i8, ptr %266, i64 1
  %276 = load i8, ptr %275, align 1, !tbaa !49
  %277 = zext i8 %276 to i64
  %278 = shl nuw nsw i64 %277, 8
  %279 = or i64 %278, %274
  %280 = getelementptr inbounds i8, ptr %266, i64 2
  %281 = load i8, ptr %280, align 1, !tbaa !49
  %282 = zext i8 %281 to i64
  %283 = shl nuw nsw i64 %282, 16
  %284 = or i64 %279, %283
  %285 = getelementptr inbounds i8, ptr %266, i64 3
  %286 = load i8, ptr %285, align 1, !tbaa !49
  %287 = zext i8 %286 to i64
  %288 = shl nuw nsw i64 %287, 24
  %289 = or i64 %284, %288
  %290 = getelementptr inbounds i8, ptr %266, i64 4
  %291 = load i8, ptr %290, align 1, !tbaa !49
  %292 = zext i8 %291 to i64
  %293 = shl nuw nsw i64 %292, 32
  %294 = or i64 %289, %293
  %295 = getelementptr inbounds i8, ptr %266, i64 5
  %296 = load i8, ptr %295, align 1, !tbaa !49
  %297 = zext i8 %296 to i64
  %298 = shl nuw nsw i64 %297, 40
  %299 = or i64 %294, %298
  %300 = getelementptr inbounds i8, ptr %266, i64 6
  %301 = load i8, ptr %300, align 1, !tbaa !49
  %302 = zext i8 %301 to i64
  %303 = shl nuw nsw i64 %302, 48
  %304 = or i64 %299, %303
  %305 = getelementptr inbounds i8, ptr %266, i64 7
  %306 = load i8, ptr %305, align 1, !tbaa !49
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
  %317 = load i8, ptr %316, align 1, !tbaa !49
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
  %333 = load i8, ptr %326, align 1, !tbaa !49
  %334 = zext i8 %333 to i64
  %335 = getelementptr inbounds i8, ptr %326, i64 1
  %336 = load i8, ptr %335, align 1, !tbaa !49
  %337 = zext i8 %336 to i64
  %338 = shl nuw nsw i64 %337, 8
  %339 = or i64 %338, %334
  %340 = getelementptr inbounds i8, ptr %326, i64 2
  %341 = load i8, ptr %340, align 1, !tbaa !49
  %342 = zext i8 %341 to i64
  %343 = shl nuw nsw i64 %342, 16
  %344 = or i64 %339, %343
  %345 = getelementptr inbounds i8, ptr %326, i64 3
  %346 = load i8, ptr %345, align 1, !tbaa !49
  %347 = zext i8 %346 to i64
  %348 = shl nuw nsw i64 %347, 24
  %349 = or i64 %344, %348
  %350 = getelementptr inbounds i8, ptr %326, i64 4
  %351 = load i8, ptr %350, align 1, !tbaa !49
  %352 = zext i8 %351 to i64
  %353 = shl nuw nsw i64 %352, 32
  %354 = or i64 %349, %353
  %355 = getelementptr inbounds i8, ptr %326, i64 5
  %356 = load i8, ptr %355, align 1, !tbaa !49
  %357 = zext i8 %356 to i64
  %358 = shl nuw nsw i64 %357, 40
  %359 = or i64 %354, %358
  %360 = getelementptr inbounds i8, ptr %326, i64 6
  %361 = load i8, ptr %360, align 1, !tbaa !49
  %362 = zext i8 %361 to i64
  %363 = shl nuw nsw i64 %362, 48
  %364 = or i64 %359, %363
  %365 = getelementptr inbounds i8, ptr %326, i64 7
  %366 = load i8, ptr %365, align 1, !tbaa !49
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
  %377 = load i8, ptr %376, align 1, !tbaa !49
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
  %393 = load i8, ptr %386, align 1, !tbaa !49
  %394 = zext i8 %393 to i64
  %395 = getelementptr inbounds i8, ptr %386, i64 1
  %396 = load i8, ptr %395, align 1, !tbaa !49
  %397 = zext i8 %396 to i64
  %398 = shl nuw nsw i64 %397, 8
  %399 = or i64 %398, %394
  %400 = getelementptr inbounds i8, ptr %386, i64 2
  %401 = load i8, ptr %400, align 1, !tbaa !49
  %402 = zext i8 %401 to i64
  %403 = shl nuw nsw i64 %402, 16
  %404 = or i64 %399, %403
  %405 = getelementptr inbounds i8, ptr %386, i64 3
  %406 = load i8, ptr %405, align 1, !tbaa !49
  %407 = zext i8 %406 to i64
  %408 = shl nuw nsw i64 %407, 24
  %409 = or i64 %404, %408
  %410 = getelementptr inbounds i8, ptr %386, i64 4
  %411 = load i8, ptr %410, align 1, !tbaa !49
  %412 = zext i8 %411 to i64
  %413 = shl nuw nsw i64 %412, 32
  %414 = or i64 %409, %413
  %415 = getelementptr inbounds i8, ptr %386, i64 5
  %416 = load i8, ptr %415, align 1, !tbaa !49
  %417 = zext i8 %416 to i64
  %418 = shl nuw nsw i64 %417, 40
  %419 = or i64 %414, %418
  %420 = getelementptr inbounds i8, ptr %386, i64 6
  %421 = load i8, ptr %420, align 1, !tbaa !49
  %422 = zext i8 %421 to i64
  %423 = shl nuw nsw i64 %422, 48
  %424 = or i64 %419, %423
  %425 = getelementptr inbounds i8, ptr %386, i64 7
  %426 = load i8, ptr %425, align 1, !tbaa !49
  %427 = zext i8 %426 to i64
  %428 = shl nuw i64 %427, 56
  %429 = or i64 %424, %428
  br label %443

430:                                              ; preds = %430, %390
  %431 = phi i32 [ %441, %430 ], [ 0, %390 ]
  %432 = phi i64 [ %440, %430 ], [ 0, %390 ]
  %433 = zext i32 %431 to i64
  %434 = getelementptr inbounds i8, ptr %386, i64 %433
  %435 = load i8, ptr %434, align 1, !tbaa !49
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
  %450 = tail call <2 x i64> @__ockl_hostcall_preview(i32 noundef 2, i64 noundef %449, i64 noundef %88, i64 noundef %148, i64 noundef %208, i64 noundef %268, i64 noundef %328, i64 noundef %388, i64 noundef %444) #30
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
declare i64 @llvm.umin.i64(i64, i64) #14

; Function Attrs: convergent mustprogress nofree norecurse nosync nounwind readnone willreturn
define internal i64 @__ockl_get_local_size(i32 noundef %0) #18 {
  switch i32 %0, label %76 [
    i32 0, label %2
    i32 1, label %26
    i32 2, label %51
  ]

2:                                                ; preds = %1
  %3 = load i32, ptr addrspace(4) @__oclc_ABI_version, align 4, !tbaa !45
  %4 = icmp slt i32 %3, 500
  br i1 %4, label %5, label %17

5:                                                ; preds = %2
  %6 = tail call align 4 dereferenceable(64) ptr addrspace(4) @llvm.amdgcn.dispatch.ptr()
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %8 = getelementptr i8, ptr addrspace(4) %6, i64 4
  %9 = load i16, ptr addrspace(4) %8, align 4, !range !71, !invariant.load !72
  %10 = zext i16 %9 to i32
  %11 = getelementptr inbounds %6, ptr addrspace(4) %6, i64 0, i32 6
  %12 = load i32, ptr addrspace(4) %11, align 4, !tbaa !73
  %13 = mul i32 %7, %10
  %14 = sub i32 %12, %13
  %15 = tail call i32 @llvm.umin.i32(i32 %14, i32 %10)
  %16 = zext i32 %15 to i64
  br label %76

17:                                               ; preds = %2
  %18 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %19 = tail call ptr addrspace(4) @llvm.amdgcn.implicitarg.ptr()
  %20 = load i32, ptr addrspace(4) %19, align 4, !tbaa !45
  %21 = icmp ult i32 %18, %20
  %22 = select i1 %21, i64 6, i64 9
  %23 = getelementptr inbounds i16, ptr addrspace(4) %19, i64 %22
  %24 = load i16, ptr addrspace(4) %23, align 2, !tbaa !76
  %25 = zext i16 %24 to i64
  br label %76

26:                                               ; preds = %1
  %27 = load i32, ptr addrspace(4) @__oclc_ABI_version, align 4, !tbaa !45
  %28 = icmp slt i32 %27, 500
  br i1 %28, label %29, label %41

29:                                               ; preds = %26
  %30 = tail call align 4 dereferenceable(64) ptr addrspace(4) @llvm.amdgcn.dispatch.ptr()
  %31 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %32 = getelementptr i8, ptr addrspace(4) %30, i64 6
  %33 = load i16, ptr addrspace(4) %32, align 2, !range !71, !invariant.load !72
  %34 = zext i16 %33 to i32
  %35 = getelementptr inbounds %6, ptr addrspace(4) %30, i64 0, i32 7
  %36 = load i32, ptr addrspace(4) %35, align 8, !tbaa !77
  %37 = mul i32 %31, %34
  %38 = sub i32 %36, %37
  %39 = tail call i32 @llvm.umin.i32(i32 %38, i32 %34)
  %40 = zext i32 %39 to i64
  br label %76

41:                                               ; preds = %26
  %42 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %43 = tail call ptr addrspace(4) @llvm.amdgcn.implicitarg.ptr()
  %44 = getelementptr inbounds i32, ptr addrspace(4) %43, i64 1
  %45 = load i32, ptr addrspace(4) %44, align 4, !tbaa !45
  %46 = icmp ult i32 %42, %45
  %47 = select i1 %46, i64 7, i64 10
  %48 = getelementptr inbounds i16, ptr addrspace(4) %43, i64 %47
  %49 = load i16, ptr addrspace(4) %48, align 2, !tbaa !76
  %50 = zext i16 %49 to i64
  br label %76

51:                                               ; preds = %1
  %52 = load i32, ptr addrspace(4) @__oclc_ABI_version, align 4, !tbaa !45
  %53 = icmp slt i32 %52, 500
  br i1 %53, label %54, label %66

54:                                               ; preds = %51
  %55 = tail call align 4 dereferenceable(64) ptr addrspace(4) @llvm.amdgcn.dispatch.ptr()
  %56 = tail call i32 @llvm.amdgcn.workgroup.id.z()
  %57 = getelementptr i8, ptr addrspace(4) %55, i64 8
  %58 = load i16, ptr addrspace(4) %57, align 4, !range !71, !invariant.load !72
  %59 = zext i16 %58 to i32
  %60 = getelementptr inbounds %6, ptr addrspace(4) %55, i64 0, i32 8
  %61 = load i32, ptr addrspace(4) %60, align 4, !tbaa !78
  %62 = mul i32 %56, %59
  %63 = sub i32 %61, %62
  %64 = tail call i32 @llvm.umin.i32(i32 %63, i32 %59)
  %65 = zext i32 %64 to i64
  br label %76

66:                                               ; preds = %51
  %67 = tail call i32 @llvm.amdgcn.workgroup.id.z()
  %68 = tail call ptr addrspace(4) @llvm.amdgcn.implicitarg.ptr()
  %69 = getelementptr inbounds i32, ptr addrspace(4) %68, i64 2
  %70 = load i32, ptr addrspace(4) %69, align 4, !tbaa !45
  %71 = icmp ult i32 %67, %70
  %72 = select i1 %71, i64 8, i64 11
  %73 = getelementptr inbounds i16, ptr addrspace(4) %68, i64 %72
  %74 = load i16, ptr addrspace(4) %73, align 2, !tbaa !76
  %75 = zext i16 %74 to i64
  br label %76

76:                                               ; preds = %66, %54, %41, %29, %17, %5, %1
  %77 = phi i64 [ 1, %1 ], [ %16, %5 ], [ %25, %17 ], [ %40, %29 ], [ %50, %41 ], [ %65, %54 ], [ %75, %66 ]
  ret i64 %77
}

; Function Attrs: nounwind readnone speculatable willreturn
declare align 4 ptr addrspace(4) @llvm.amdgcn.dispatch.ptr() #15

; Function Attrs: nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #15

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.umin.i32(i32, i32) #14

; Function Attrs: nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #15

; Function Attrs: nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.z() #15

; Function Attrs: convergent mustprogress nofree norecurse nosync nounwind readnone willreturn
define internal i64 @__ockl_get_local_id(i32 noundef %0) #18 {
  switch i32 %0, label %8 [
    i32 0, label %2
    i32 1, label %4
    i32 2, label %6
  ]

2:                                                ; preds = %1
  %3 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !79
  br label %8

4:                                                ; preds = %1
  %5 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !79
  br label %8

6:                                                ; preds = %1
  %7 = tail call i32 @llvm.amdgcn.workitem.id.z(), !range !79
  br label %8

8:                                                ; preds = %6, %4, %2, %1
  %9 = phi i32 [ %7, %6 ], [ %5, %4 ], [ %3, %2 ], [ 0, %1 ]
  %10 = zext i32 %9 to i64
  ret i64 %10
}

; Function Attrs: nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #15

; Function Attrs: nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #15

; Function Attrs: nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.z() #15

; Function Attrs: convergent mustprogress nofree norecurse nosync nounwind readnone willreturn
define internal i64 @__ockl_get_group_id(i32 noundef %0) #18 {
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
attributes #6 = { convergent mustprogress nounwind "frame-pointer"="none" "min-legal-vector-width"="128" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx90a" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot3-insts,+dot4-insts,+dot5-insts,+dot6-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+gfx90a-insts,+mai-insts,+s-memrealtime,+s-memtime-inst" }
attributes #7 = { alwaysinline convergent mustprogress nounwind "frame-pointer"="none" "min-legal-vector-width"="128" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx90a" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot3-insts,+dot4-insts,+dot5-insts,+dot6-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+gfx90a-insts,+mai-insts,+s-memrealtime,+s-memtime-inst" }
attributes #8 = { convergent inlinehint mustprogress nounwind "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx90a" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot3-insts,+dot4-insts,+dot5-insts,+dot6-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+gfx90a-insts,+mai-insts,+s-memrealtime,+s-memtime-inst" }
attributes #9 = { convergent nounwind "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx90a" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot3-insts,+dot4-insts,+dot5-insts,+dot6-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+gfx90a-insts,+mai-insts,+s-memrealtime,+s-memtime-inst" }
attributes #10 = { convergent mustprogress norecurse nounwind "amdgpu-flat-work-group-size"="1,1024" "frame-pointer"="none" "min-legal-vector-width"="128" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx90a" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot3-insts,+dot4-insts,+dot5-insts,+dot6-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+gfx90a-insts,+mai-insts,+s-memrealtime,+s-memtime-inst" "uniform-work-group-size"="true" }
attributes #11 = { alwaysinline convergent mustprogress nounwind "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx90a" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot3-insts,+dot4-insts,+dot5-insts,+dot6-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+gfx90a-insts,+mai-insts,+s-memrealtime,+s-memtime-inst" }
attributes #12 = { convergent mustprogress norecurse nounwind "amdgpu-flat-work-group-size"="1,1024" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx90a" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot3-insts,+dot4-insts,+dot5-insts,+dot6-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+gfx90a-insts,+mai-insts,+s-memrealtime,+s-memtime-inst" "uniform-work-group-size"="true" }
attributes #13 = { convergent mustprogress nofree norecurse nounwind readonly willreturn "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" }
attributes #14 = { nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #15 = { nounwind readnone speculatable willreturn }
attributes #16 = { convergent mustprogress nofree norecurse nounwind readonly willreturn "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-features"="+extended-image-insts" }
attributes #17 = { nounwind readonly willreturn }
attributes #18 = { convergent mustprogress nofree norecurse nosync nounwind readnone willreturn "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" }
attributes #19 = { convergent norecurse nounwind "frame-pointer"="none" "min-legal-vector-width"="128" "no-trapping-math"="true" "stack-protector-buffer-size"="8" }
attributes #20 = { convergent noinline norecurse nounwind optnone "frame-pointer"="none" "min-legal-vector-width"="128" "no-trapping-math"="true" "stack-protector-buffer-size"="8" }
attributes #21 = { alwaysinline convergent mustprogress nofree norecurse nosync nounwind readnone willreturn "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" }
attributes #22 = { convergent norecurse nounwind "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" }
attributes #23 = { convergent nounwind readnone willreturn }
attributes #24 = { argmemonly convergent mustprogress nofree norecurse nosync nounwind readonly willreturn "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" }
attributes #25 = { convergent mustprogress nofree norecurse nounwind willreturn "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" }
attributes #26 = { nounwind willreturn }
attributes #27 = { nounwind }
attributes #28 = { nounwind readonly }
attributes #29 = { nounwind readnone willreturn }
attributes #30 = { convergent nounwind }
attributes #31 = { convergent }

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
!18 = !{!19, !19, i64 0}
!19 = !{!"bool", !6, i64 0}
!20 = !{!21, !21, i64 0}
!21 = !{!"float", !6, i64 0}
!22 = !{!23, !5, i64 72}
!23 = !{!"_ZTS16textureReference", !9, i64 0, !24, i64 4, !25, i64 8, !6, i64 12, !26, i64 24, !9, i64 44, !9, i64 48, !25, i64 52, !21, i64 56, !21, i64 60, !21, i64 64, !5, i64 72, !9, i64 80, !28, i64 84}
!24 = !{!"_ZTS18hipTextureReadMode", !6, i64 0}
!25 = !{!"_ZTS20hipTextureFilterMode", !6, i64 0}
!26 = !{!"_ZTS20hipChannelFormatDesc", !9, i64 0, !9, i64 4, !9, i64 8, !9, i64 12, !27, i64 16}
!27 = !{!"_ZTS20hipChannelFormatKind", !6, i64 0}
!28 = !{!"_ZTS15hipArray_Format", !6, i64 0}
!29 = distinct !{!29, !14}
!30 = distinct !{!30, !14}
!31 = distinct !{!31, !14}
!32 = !{!33, !9, i64 4}
!33 = !{!"_ZTS9MatchInfo", !9, i64 0, !9, i64 4, !34, i64 8, !9, i64 12, !35, i64 16, !35, i64 18}
!34 = !{!"_ZTS14TextureAddress", !6, i64 0}
!35 = !{!"short", !6, i64 0}
!36 = !{!33, !35, i64 18}
!37 = distinct !{!37, !14}
!38 = !{!33, !9, i64 0}
!39 = !{!33, !35, i64 16}
!40 = !{i8 0, i8 2}
!41 = !{!42, !9, i64 0}
!42 = !{!"_ZTS9Alignment", !9, i64 0, !35, i64 4}
!43 = !{!42, !35, i64 4}
!44 = distinct !{!44, !14}
!45 = !{!46, !46, i64 0}
!46 = !{!"int", !47, i64 0}
!47 = !{!"omnipotent char", !48, i64 0}
!48 = !{!"Simple C/C++ TBAA"}
!49 = !{!47, !47, i64 0}
!50 = !{!51, !51, i64 0}
!51 = !{!"long", !47, i64 0}
!52 = !{!53, !53, i64 0}
!53 = !{!"any pointer", !47, i64 0}
!54 = !{!55, !53, i64 0}
!55 = !{!"", !53, i64 0, !53, i64 8, !56, i64 16, !51, i64 24, !51, i64 32, !51, i64 40}
!56 = !{!"hsa_signal_s", !51, i64 0}
!57 = !{!55, !51, i64 40}
!58 = !{!55, !53, i64 8}
!59 = !{!60, !60, i64 0}
!60 = !{!"bool", !47, i64 0}
!61 = !{i64 2509}
!62 = !{!"exec"}
!63 = !{!64, !46, i64 16}
!64 = !{!"", !51, i64 0, !51, i64 8, !46, i64 16, !46, i64 20}
!65 = !{!64, !51, i64 8}
!66 = !{!64, !46, i64 20}
!67 = !{!64, !51, i64 0}
!68 = !{!69, !51, i64 16}
!69 = !{!"amd_signal_s", !51, i64 0, !47, i64 8, !51, i64 16, !46, i64 24, !46, i64 28, !51, i64 32, !51, i64 40, !47, i64 48, !47, i64 56}
!70 = !{!69, !46, i64 24}
!71 = !{i16 1, i16 1025}
!72 = !{}
!73 = !{!74, !46, i64 12}
!74 = !{!"hsa_kernel_dispatch_packet_s", !75, i64 0, !75, i64 2, !75, i64 4, !75, i64 6, !75, i64 8, !75, i64 10, !46, i64 12, !46, i64 16, !46, i64 20, !46, i64 24, !46, i64 28, !51, i64 32, !53, i64 40, !51, i64 48, !56, i64 56}
!75 = !{!"short", !47, i64 0}
!76 = !{!75, !75, i64 0}
!77 = !{!74, !46, i64 16}
!78 = !{!74, !46, i64 20}
!79 = !{i32 0, i32 1024}

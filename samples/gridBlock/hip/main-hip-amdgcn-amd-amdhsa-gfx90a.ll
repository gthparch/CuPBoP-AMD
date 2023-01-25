; ModuleID = 'main-hip-amdgcn-amd-amdhsa-gfx90a.bc'
source_filename = "main.cpp"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%0 = type { i16, i16, i16, i16, i16, i16, i32, i32, i32, i32, i32, i64, ptr addrspace(1), i64, %1 }
%1 = type { i64 }
%2 = type { ptr addrspace(1), ptr addrspace(1), %1, i64, i64, i64 }
%3 = type { i64, i64, i32, i32 }
%4 = type { [64 x [8 x i64]] }
%5 = type { i64, %1, i64, i32, i32, i64, i64, %6, [2 x i32] }
%6 = type { ptr addrspace(1) }
%struct.__HIP_Coordinates = type { i8 }
%"struct.__HIP_Coordinates<__HIP_ThreadIdx>::__X" = type { i8 }
%struct.__HIP_Coordinates.0 = type { i8 }
%"struct.__HIP_Coordinates<__HIP_BlockIdx>::__X" = type { i8 }
%struct.__HIP_Coordinates.1 = type { i8 }
%"struct.__HIP_Coordinates<__HIP_BlockDim>::__X" = type { i8 }
%"struct.__HIP_Coordinates<__HIP_BlockIdx>::__Y" = type { i8 }
%"struct.__HIP_Coordinates<__HIP_BlockDim>::__Y" = type { i8 }
%"struct.__HIP_Coordinates<__HIP_ThreadIdx>::__Y" = type { i8 }
%"struct.__HIP_Coordinates<__HIP_BlockIdx>::__Z" = type { i8 }
%"struct.__HIP_Coordinates<__HIP_BlockDim>::__Z" = type { i8 }
%"struct.__HIP_Coordinates<__HIP_ThreadIdx>::__Z" = type { i8 }
%struct.__HIP_Coordinates.2 = type { i8 }
%"struct.__HIP_Coordinates<__HIP_GridDim>::__X" = type { i8 }
%"struct.__HIP_Coordinates<__HIP_GridDim>::__Y" = type { i8 }
%"struct.__HIP_Coordinates<__HIP_GridDim>::__Z" = type { i8 }
%struct.__HIP_ThreadIdx = type { i8 }
%struct.__HIP_BlockIdx = type { i8 }
%struct.__HIP_BlockDim = type { i8 }
%struct.__HIP_GridDim = type { i8 }

$_ZNK17__HIP_CoordinatesI15__HIP_ThreadIdxE3__XcvjEv = comdat any

$_ZNK17__HIP_CoordinatesI14__HIP_BlockIdxE3__XcvjEv = comdat any

$_ZNK17__HIP_CoordinatesI14__HIP_BlockDimE3__XcvjEv = comdat any

$_ZNK17__HIP_CoordinatesI14__HIP_BlockIdxE3__YcvjEv = comdat any

$_ZNK17__HIP_CoordinatesI14__HIP_BlockDimE3__YcvjEv = comdat any

$_ZNK17__HIP_CoordinatesI15__HIP_ThreadIdxE3__YcvjEv = comdat any

$_ZNK17__HIP_CoordinatesI14__HIP_BlockIdxE3__ZcvjEv = comdat any

$_ZNK17__HIP_CoordinatesI14__HIP_BlockDimE3__ZcvjEv = comdat any

$_ZNK17__HIP_CoordinatesI15__HIP_ThreadIdxE3__ZcvjEv = comdat any

$_ZNK17__HIP_CoordinatesI13__HIP_GridDimE3__XcvjEv = comdat any

$_ZNK17__HIP_CoordinatesI13__HIP_GridDimE3__YcvjEv = comdat any

$_ZNK17__HIP_CoordinatesI13__HIP_GridDimE3__ZcvjEv = comdat any

$_ZNK14__HIP_BlockIdxclEj = comdat any

$_ZNK14__HIP_BlockDimclEj = comdat any

$_ZNK15__HIP_ThreadIdxclEj = comdat any

$_ZNK13__HIP_GridDimclEj = comdat any

$_ZN17__HIP_CoordinatesI15__HIP_ThreadIdxE1xE = comdat any

$_ZN17__HIP_CoordinatesI14__HIP_BlockIdxE1xE = comdat any

$_ZN17__HIP_CoordinatesI14__HIP_BlockDimE1xE = comdat any

$_ZN17__HIP_CoordinatesI14__HIP_BlockIdxE1yE = comdat any

$_ZN17__HIP_CoordinatesI14__HIP_BlockDimE1yE = comdat any

$_ZN17__HIP_CoordinatesI15__HIP_ThreadIdxE1yE = comdat any

$_ZN17__HIP_CoordinatesI14__HIP_BlockIdxE1zE = comdat any

$_ZN17__HIP_CoordinatesI14__HIP_BlockDimE1zE = comdat any

$_ZN17__HIP_CoordinatesI15__HIP_ThreadIdxE1zE = comdat any

$_ZN17__HIP_CoordinatesI13__HIP_GridDimE1xE = comdat any

$_ZN17__HIP_CoordinatesI13__HIP_GridDimE1yE = comdat any

$_ZN17__HIP_CoordinatesI13__HIP_GridDimE1zE = comdat any

@__const.__assert_fail.fmt = private unnamed_addr addrspace(4) constant [47 x i8] c"%s:%u: %s: Device-side assertion `%s' failed.\0A\00", align 16
@_ZL9threadIdx = internal addrspace(4) constant %struct.__HIP_Coordinates undef, align 1
@_ZN17__HIP_CoordinatesI15__HIP_ThreadIdxE1xE = weak protected addrspace(4) externally_initialized constant %"struct.__HIP_Coordinates<__HIP_ThreadIdx>::__X" undef, comdat, align 1
@_ZL8blockIdx = internal addrspace(4) constant %struct.__HIP_Coordinates.0 undef, align 1
@_ZN17__HIP_CoordinatesI14__HIP_BlockIdxE1xE = weak protected addrspace(4) externally_initialized constant %"struct.__HIP_Coordinates<__HIP_BlockIdx>::__X" undef, comdat, align 1
@_ZL8blockDim = internal addrspace(4) constant %struct.__HIP_Coordinates.1 undef, align 1
@_ZN17__HIP_CoordinatesI14__HIP_BlockDimE1xE = weak protected addrspace(4) externally_initialized constant %"struct.__HIP_Coordinates<__HIP_BlockDim>::__X" undef, comdat, align 1
@.str = private unnamed_addr addrspace(4) constant [8 x i8] c"tid %d\0A\00", align 1
@_ZN17__HIP_CoordinatesI14__HIP_BlockIdxE1yE = weak protected addrspace(4) externally_initialized constant %"struct.__HIP_Coordinates<__HIP_BlockIdx>::__Y" undef, comdat, align 1
@_ZN17__HIP_CoordinatesI14__HIP_BlockDimE1yE = weak protected addrspace(4) externally_initialized constant %"struct.__HIP_Coordinates<__HIP_BlockDim>::__Y" undef, comdat, align 1
@_ZN17__HIP_CoordinatesI15__HIP_ThreadIdxE1yE = weak protected addrspace(4) externally_initialized constant %"struct.__HIP_Coordinates<__HIP_ThreadIdx>::__Y" undef, comdat, align 1
@_ZN17__HIP_CoordinatesI14__HIP_BlockIdxE1zE = weak protected addrspace(4) externally_initialized constant %"struct.__HIP_Coordinates<__HIP_BlockIdx>::__Z" undef, comdat, align 1
@_ZN17__HIP_CoordinatesI14__HIP_BlockDimE1zE = weak protected addrspace(4) externally_initialized constant %"struct.__HIP_Coordinates<__HIP_BlockDim>::__Z" undef, comdat, align 1
@_ZN17__HIP_CoordinatesI15__HIP_ThreadIdxE1zE = weak protected addrspace(4) externally_initialized constant %"struct.__HIP_Coordinates<__HIP_ThreadIdx>::__Z" undef, comdat, align 1
@_ZL7gridDim = internal addrspace(4) constant %struct.__HIP_Coordinates.2 undef, align 1
@_ZN17__HIP_CoordinatesI13__HIP_GridDimE1xE = weak protected addrspace(4) externally_initialized constant %"struct.__HIP_Coordinates<__HIP_GridDim>::__X" undef, comdat, align 1
@_ZN17__HIP_CoordinatesI13__HIP_GridDimE1yE = weak protected addrspace(4) externally_initialized constant %"struct.__HIP_Coordinates<__HIP_GridDim>::__Y" undef, comdat, align 1
@_ZN17__HIP_CoordinatesI13__HIP_GridDimE1zE = weak protected addrspace(4) externally_initialized constant %"struct.__HIP_Coordinates<__HIP_GridDim>::__Z" undef, comdat, align 1
@.str.1 = private unnamed_addr addrspace(4) constant [21 x i8] c"a: %d, b: %d, c: %d\0A\00", align 1
@llvm.compiler.used = appending addrspace(1) global [12 x ptr] [ptr addrspacecast (ptr addrspace(4) @_ZN17__HIP_CoordinatesI15__HIP_ThreadIdxE1xE to ptr), ptr addrspacecast (ptr addrspace(4) @_ZN17__HIP_CoordinatesI14__HIP_BlockIdxE1xE to ptr), ptr addrspacecast (ptr addrspace(4) @_ZN17__HIP_CoordinatesI14__HIP_BlockDimE1xE to ptr), ptr addrspacecast (ptr addrspace(4) @_ZN17__HIP_CoordinatesI14__HIP_BlockIdxE1yE to ptr), ptr addrspacecast (ptr addrspace(4) @_ZN17__HIP_CoordinatesI14__HIP_BlockDimE1yE to ptr), ptr addrspacecast (ptr addrspace(4) @_ZN17__HIP_CoordinatesI15__HIP_ThreadIdxE1yE to ptr), ptr addrspacecast (ptr addrspace(4) @_ZN17__HIP_CoordinatesI14__HIP_BlockIdxE1zE to ptr), ptr addrspacecast (ptr addrspace(4) @_ZN17__HIP_CoordinatesI14__HIP_BlockDimE1zE to ptr), ptr addrspacecast (ptr addrspace(4) @_ZN17__HIP_CoordinatesI15__HIP_ThreadIdxE1zE to ptr), ptr addrspacecast (ptr addrspace(4) @_ZN17__HIP_CoordinatesI13__HIP_GridDimE1xE to ptr), ptr addrspacecast (ptr addrspace(4) @_ZN17__HIP_CoordinatesI13__HIP_GridDimE1yE to ptr), ptr addrspacecast (ptr addrspace(4) @_ZN17__HIP_CoordinatesI13__HIP_GridDimE1zE to ptr)], section "llvm.metadata"
@__oclc_wavefrontsize64 = internal local_unnamed_addr addrspace(4) constant i8 1, align 1
@__oclc_ABI_version = internal local_unnamed_addr addrspace(4) constant i32 400, align 4

; Function Attrs: convergent mustprogress noinline nounwind
define weak hidden void @__assert_fail(ptr noundef %0, ptr noundef %1, i32 noundef %2, ptr noundef %3) #0 {
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
  store ptr %0, ptr %16, align 8, !tbaa !5
  store ptr %1, ptr %17, align 8, !tbaa !5
  store i32 %2, ptr %18, align 4, !tbaa !9
  store ptr %3, ptr %19, align 8, !tbaa !5
  call void @llvm.lifetime.start.p5(i64 47, ptr addrspace(5) %9) #16
  call void @llvm.memcpy.p0.p4.i64(ptr align 16 %20, ptr addrspace(4) align 16 @__const.__assert_fail.fmt, i64 47, i1 false)
  call void @llvm.lifetime.start.p5(i64 8, ptr addrspace(5) %10) #16
  %27 = call i64 @__ockl_fprintf_stderr_begin() #20
  store i64 %27, ptr %21, align 8, !tbaa !11
  call void @llvm.lifetime.start.p5(i64 4, ptr addrspace(5) %11) #16
  store i32 0, ptr %22, align 4, !tbaa !9
  br label %28

28:                                               ; preds = %4
  call void @llvm.lifetime.start.p5(i64 8, ptr addrspace(5) %12) #16
  %29 = getelementptr inbounds [47 x i8], ptr %20, i64 0, i64 0
  store ptr %29, ptr %23, align 8, !tbaa !5
  br label %30

30:                                               ; preds = %35, %28
  %31 = load ptr, ptr %23, align 8, !tbaa !5
  %32 = getelementptr inbounds i8, ptr %31, i32 1
  store ptr %32, ptr %23, align 8, !tbaa !5
  %33 = load i8, ptr %31, align 1, !tbaa !13
  %34 = icmp ne i8 %33, 0
  br i1 %34, label %35, label %36

35:                                               ; preds = %30
  br label %30, !llvm.loop !14

36:                                               ; preds = %30
  %37 = load ptr, ptr %23, align 8, !tbaa !5
  %38 = getelementptr inbounds [47 x i8], ptr %20, i64 0, i64 0
  %39 = ptrtoint ptr %37 to i64
  %40 = ptrtoint ptr %38 to i64
  %41 = sub i64 %39, %40
  %42 = trunc i64 %41 to i32
  store i32 %42, ptr %22, align 4, !tbaa !9
  call void @llvm.lifetime.end.p5(i64 8, ptr addrspace(5) %12) #16
  br label %43

43:                                               ; preds = %36
  br label %44

44:                                               ; preds = %43
  %45 = load i64, ptr %21, align 8, !tbaa !11
  %46 = getelementptr inbounds [47 x i8], ptr %20, i64 0, i64 0
  %47 = load i32, ptr %22, align 4, !tbaa !9
  %48 = sext i32 %47 to i64
  %49 = call i64 @__ockl_fprintf_append_string_n(i64 noundef %45, ptr noundef %46, i64 noundef %48, i32 noundef 0) #20
  store i64 %49, ptr %21, align 8, !tbaa !11
  br label %50

50:                                               ; preds = %44
  call void @llvm.lifetime.start.p5(i64 8, ptr addrspace(5) %13) #16
  %51 = load ptr, ptr %17, align 8, !tbaa !5
  store ptr %51, ptr %24, align 8, !tbaa !5
  br label %52

52:                                               ; preds = %57, %50
  %53 = load ptr, ptr %24, align 8, !tbaa !5
  %54 = getelementptr inbounds i8, ptr %53, i32 1
  store ptr %54, ptr %24, align 8, !tbaa !5
  %55 = load i8, ptr %53, align 1, !tbaa !13
  %56 = icmp ne i8 %55, 0
  br i1 %56, label %57, label %58

57:                                               ; preds = %52
  br label %52, !llvm.loop !16

58:                                               ; preds = %52
  %59 = load ptr, ptr %24, align 8, !tbaa !5
  %60 = load ptr, ptr %17, align 8, !tbaa !5
  %61 = ptrtoint ptr %59 to i64
  %62 = ptrtoint ptr %60 to i64
  %63 = sub i64 %61, %62
  %64 = trunc i64 %63 to i32
  store i32 %64, ptr %22, align 4, !tbaa !9
  call void @llvm.lifetime.end.p5(i64 8, ptr addrspace(5) %13) #16
  br label %65

65:                                               ; preds = %58
  br label %66

66:                                               ; preds = %65
  %67 = load i64, ptr %21, align 8, !tbaa !11
  %68 = load ptr, ptr %17, align 8, !tbaa !5
  %69 = load i32, ptr %22, align 4, !tbaa !9
  %70 = sext i32 %69 to i64
  %71 = call i64 @__ockl_fprintf_append_string_n(i64 noundef %67, ptr noundef %68, i64 noundef %70, i32 noundef 0) #20
  store i64 %71, ptr %21, align 8, !tbaa !11
  %72 = load i64, ptr %21, align 8, !tbaa !11
  %73 = load i32, ptr %18, align 4, !tbaa !9
  %74 = zext i32 %73 to i64
  %75 = call i64 @__ockl_fprintf_append_args(i64 noundef %72, i32 noundef 1, i64 noundef %74, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i32 noundef 0) #20
  store i64 %75, ptr %21, align 8, !tbaa !11
  br label %76

76:                                               ; preds = %66
  call void @llvm.lifetime.start.p5(i64 8, ptr addrspace(5) %14) #16
  %77 = load ptr, ptr %19, align 8, !tbaa !5
  store ptr %77, ptr %25, align 8, !tbaa !5
  br label %78

78:                                               ; preds = %83, %76
  %79 = load ptr, ptr %25, align 8, !tbaa !5
  %80 = getelementptr inbounds i8, ptr %79, i32 1
  store ptr %80, ptr %25, align 8, !tbaa !5
  %81 = load i8, ptr %79, align 1, !tbaa !13
  %82 = icmp ne i8 %81, 0
  br i1 %82, label %83, label %84

83:                                               ; preds = %78
  br label %78, !llvm.loop !17

84:                                               ; preds = %78
  %85 = load ptr, ptr %25, align 8, !tbaa !5
  %86 = load ptr, ptr %19, align 8, !tbaa !5
  %87 = ptrtoint ptr %85 to i64
  %88 = ptrtoint ptr %86 to i64
  %89 = sub i64 %87, %88
  %90 = trunc i64 %89 to i32
  store i32 %90, ptr %22, align 4, !tbaa !9
  call void @llvm.lifetime.end.p5(i64 8, ptr addrspace(5) %14) #16
  br label %91

91:                                               ; preds = %84
  br label %92

92:                                               ; preds = %91
  %93 = load i64, ptr %21, align 8, !tbaa !11
  %94 = load ptr, ptr %19, align 8, !tbaa !5
  %95 = load i32, ptr %22, align 4, !tbaa !9
  %96 = sext i32 %95 to i64
  %97 = call i64 @__ockl_fprintf_append_string_n(i64 noundef %93, ptr noundef %94, i64 noundef %96, i32 noundef 0) #20
  store i64 %97, ptr %21, align 8, !tbaa !11
  br label %98

98:                                               ; preds = %92
  call void @llvm.lifetime.start.p5(i64 8, ptr addrspace(5) %15) #16
  %99 = load ptr, ptr %16, align 8, !tbaa !5
  store ptr %99, ptr %26, align 8, !tbaa !5
  br label %100

100:                                              ; preds = %105, %98
  %101 = load ptr, ptr %26, align 8, !tbaa !5
  %102 = getelementptr inbounds i8, ptr %101, i32 1
  store ptr %102, ptr %26, align 8, !tbaa !5
  %103 = load i8, ptr %101, align 1, !tbaa !13
  %104 = icmp ne i8 %103, 0
  br i1 %104, label %105, label %106

105:                                              ; preds = %100
  br label %100, !llvm.loop !18

106:                                              ; preds = %100
  %107 = load ptr, ptr %26, align 8, !tbaa !5
  %108 = load ptr, ptr %16, align 8, !tbaa !5
  %109 = ptrtoint ptr %107 to i64
  %110 = ptrtoint ptr %108 to i64
  %111 = sub i64 %109, %110
  %112 = trunc i64 %111 to i32
  store i32 %112, ptr %22, align 4, !tbaa !9
  call void @llvm.lifetime.end.p5(i64 8, ptr addrspace(5) %15) #16
  br label %113

113:                                              ; preds = %106
  br label %114

114:                                              ; preds = %113
  %115 = load i64, ptr %21, align 8, !tbaa !11
  %116 = load ptr, ptr %16, align 8, !tbaa !5
  %117 = load i32, ptr %22, align 4, !tbaa !9
  %118 = sext i32 %117 to i64
  %119 = call i64 @__ockl_fprintf_append_string_n(i64 noundef %115, ptr noundef %116, i64 noundef %118, i32 noundef 1) #20
  call void @llvm.trap()
  call void @llvm.lifetime.end.p5(i64 4, ptr addrspace(5) %11) #16
  call void @llvm.lifetime.end.p5(i64 8, ptr addrspace(5) %10) #16
  call void @llvm.lifetime.end.p5(i64 47, ptr addrspace(5) %9) #16
  ret void
}

; Function Attrs: argmemonly nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p5(i64 immarg, ptr addrspace(5) nocapture) #1

; Function Attrs: argmemonly nocallback nofree nounwind willreturn
declare void @llvm.memcpy.p0.p4.i64(ptr noalias nocapture writeonly, ptr addrspace(4) noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: argmemonly nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p5(i64 immarg, ptr addrspace(5) nocapture) #1

; Function Attrs: cold noreturn nounwind
declare void @llvm.trap() #3

; Function Attrs: convergent mustprogress noinline nounwind
define weak hidden void @__assertfail(ptr noundef %0, ptr noundef %1, i32 noundef %2, ptr noundef %3, i64 noundef %4) #0 {
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
  store ptr %0, ptr %11, align 8, !tbaa !5
  store ptr %1, ptr %12, align 8, !tbaa !5
  store i32 %2, ptr %13, align 4, !tbaa !9
  store ptr %3, ptr %14, align 8, !tbaa !5
  store i64 %4, ptr %15, align 8, !tbaa !11
  call void @llvm.trap()
  ret void
}

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z10run_printfv() #4 {
  %1 = alloca i32, align 4, addrspace(5)
  %2 = addrspacecast ptr addrspace(5) %1 to ptr
  call void @llvm.lifetime.start.p5(i64 4, ptr addrspace(5) %1) #16
  %3 = call noundef i32 @_ZNK17__HIP_CoordinatesI15__HIP_ThreadIdxE3__XcvjEv(ptr noundef nonnull align 1 dereferenceable(1) addrspacecast (ptr addrspace(4) @_ZN17__HIP_CoordinatesI15__HIP_ThreadIdxE1xE to ptr)) #20
  %4 = call noundef i32 @_ZNK17__HIP_CoordinatesI14__HIP_BlockIdxE3__XcvjEv(ptr noundef nonnull align 1 dereferenceable(1) addrspacecast (ptr addrspace(4) @_ZN17__HIP_CoordinatesI14__HIP_BlockIdxE1xE to ptr)) #20
  %5 = call noundef i32 @_ZNK17__HIP_CoordinatesI14__HIP_BlockDimE3__XcvjEv(ptr noundef nonnull align 1 dereferenceable(1) addrspacecast (ptr addrspace(4) @_ZN17__HIP_CoordinatesI14__HIP_BlockDimE1xE to ptr)) #20
  %6 = mul i32 %4, %5
  %7 = add i32 %3, %6
  store i32 %7, ptr %2, align 4, !tbaa !9
  %8 = load i32, ptr %2, align 4, !tbaa !9
  %9 = call i64 @__ockl_printf_begin(i64 0)
  br i1 icmp eq (ptr addrspacecast (ptr addrspace(4) @.str to ptr), ptr null), label %19, label %10

10:                                               ; preds = %10, %0
  %11 = phi ptr [ addrspacecast (ptr addrspace(4) @.str to ptr), %0 ], [ %12, %10 ]
  %12 = getelementptr i8, ptr %11, i64 1
  %13 = load i8, ptr %11, align 1
  %14 = icmp eq i8 %13, 0
  br i1 %14, label %15, label %10

15:                                               ; preds = %10
  %16 = ptrtoint ptr %11 to i64
  %17 = sub i64 %16, ptrtoint (ptr addrspacecast (ptr addrspace(4) @.str to ptr) to i64)
  %18 = add i64 %17, 1
  br label %19

19:                                               ; preds = %15, %0
  %20 = phi i64 [ %18, %15 ], [ 0, %0 ]
  %21 = call i64 @__ockl_printf_append_string_n(i64 %9, ptr addrspacecast (ptr addrspace(4) @.str to ptr), i64 %20, i32 0)
  %22 = zext i32 %8 to i64
  %23 = call i64 @__ockl_printf_append_args(i64 %21, i32 1, i64 %22, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i32 1)
  %24 = trunc i64 %23 to i32
  call void @llvm.lifetime.end.p5(i64 4, ptr addrspace(5) %1) #16
  ret void
}

; Function Attrs: convergent mustprogress nounwind
define linkonce_odr hidden noundef i32 @_ZNK17__HIP_CoordinatesI15__HIP_ThreadIdxE3__XcvjEv(ptr noundef nonnull align 1 dereferenceable(1) %0) #5 comdat align 2 {
  %2 = alloca i32, align 4, addrspace(5)
  %3 = alloca ptr, align 8, addrspace(5)
  %4 = alloca %struct.__HIP_ThreadIdx, align 1, addrspace(5)
  %5 = addrspacecast ptr addrspace(5) %2 to ptr
  %6 = addrspacecast ptr addrspace(5) %3 to ptr
  %7 = addrspacecast ptr addrspace(5) %4 to ptr
  store ptr %0, ptr %6, align 8, !tbaa !5
  %8 = load ptr, ptr %6, align 8
  call void @llvm.lifetime.start.p5(i64 1, ptr addrspace(5) %4) #16
  %9 = call noundef i32 @_ZNK15__HIP_ThreadIdxclEj(ptr noundef nonnull align 1 dereferenceable(1) %7, i32 noundef 0) #20
  call void @llvm.lifetime.end.p5(i64 1, ptr addrspace(5) %4) #16
  ret i32 %9
}

; Function Attrs: convergent mustprogress nounwind
define linkonce_odr hidden noundef i32 @_ZNK17__HIP_CoordinatesI14__HIP_BlockIdxE3__XcvjEv(ptr noundef nonnull align 1 dereferenceable(1) %0) #5 comdat align 2 {
  %2 = alloca i32, align 4, addrspace(5)
  %3 = alloca ptr, align 8, addrspace(5)
  %4 = alloca %struct.__HIP_BlockIdx, align 1, addrspace(5)
  %5 = addrspacecast ptr addrspace(5) %2 to ptr
  %6 = addrspacecast ptr addrspace(5) %3 to ptr
  %7 = addrspacecast ptr addrspace(5) %4 to ptr
  store ptr %0, ptr %6, align 8, !tbaa !5
  %8 = load ptr, ptr %6, align 8
  call void @llvm.lifetime.start.p5(i64 1, ptr addrspace(5) %4) #16
  %9 = call noundef i32 @_ZNK14__HIP_BlockIdxclEj(ptr noundef nonnull align 1 dereferenceable(1) %7, i32 noundef 0) #20
  call void @llvm.lifetime.end.p5(i64 1, ptr addrspace(5) %4) #16
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
  store ptr %0, ptr %6, align 8, !tbaa !5
  %8 = load ptr, ptr %6, align 8
  call void @llvm.lifetime.start.p5(i64 1, ptr addrspace(5) %4) #16
  %9 = call noundef i32 @_ZNK14__HIP_BlockDimclEj(ptr noundef nonnull align 1 dereferenceable(1) %7, i32 noundef 0) #20
  call void @llvm.lifetime.end.p5(i64 1, ptr addrspace(5) %4) #16
  ret i32 %9
}

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z11run_printf1v() #4 {
  %1 = alloca i32, align 4, addrspace(5)
  %2 = addrspacecast ptr addrspace(5) %1 to ptr
  call void @llvm.lifetime.start.p5(i64 4, ptr addrspace(5) %1) #16
  %3 = call noundef i32 @_ZNK17__HIP_CoordinatesI14__HIP_BlockIdxE3__YcvjEv(ptr noundef nonnull align 1 dereferenceable(1) addrspacecast (ptr addrspace(4) @_ZN17__HIP_CoordinatesI14__HIP_BlockIdxE1yE to ptr)) #20
  %4 = call noundef i32 @_ZNK17__HIP_CoordinatesI14__HIP_BlockDimE3__YcvjEv(ptr noundef nonnull align 1 dereferenceable(1) addrspacecast (ptr addrspace(4) @_ZN17__HIP_CoordinatesI14__HIP_BlockDimE1yE to ptr)) #20
  %5 = mul i32 %3, %4
  %6 = call noundef i32 @_ZNK17__HIP_CoordinatesI15__HIP_ThreadIdxE3__YcvjEv(ptr noundef nonnull align 1 dereferenceable(1) addrspacecast (ptr addrspace(4) @_ZN17__HIP_CoordinatesI15__HIP_ThreadIdxE1yE to ptr)) #20
  %7 = add i32 %5, %6
  store i32 %7, ptr %2, align 4, !tbaa !9
  %8 = load i32, ptr %2, align 4, !tbaa !9
  %9 = call i64 @__ockl_printf_begin(i64 0)
  br i1 icmp eq (ptr addrspacecast (ptr addrspace(4) @.str to ptr), ptr null), label %19, label %10

10:                                               ; preds = %10, %0
  %11 = phi ptr [ addrspacecast (ptr addrspace(4) @.str to ptr), %0 ], [ %12, %10 ]
  %12 = getelementptr i8, ptr %11, i64 1
  %13 = load i8, ptr %11, align 1
  %14 = icmp eq i8 %13, 0
  br i1 %14, label %15, label %10

15:                                               ; preds = %10
  %16 = ptrtoint ptr %11 to i64
  %17 = sub i64 %16, ptrtoint (ptr addrspacecast (ptr addrspace(4) @.str to ptr) to i64)
  %18 = add i64 %17, 1
  br label %19

19:                                               ; preds = %15, %0
  %20 = phi i64 [ %18, %15 ], [ 0, %0 ]
  %21 = call i64 @__ockl_printf_append_string_n(i64 %9, ptr addrspacecast (ptr addrspace(4) @.str to ptr), i64 %20, i32 0)
  %22 = zext i32 %8 to i64
  %23 = call i64 @__ockl_printf_append_args(i64 %21, i32 1, i64 %22, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i32 1)
  %24 = trunc i64 %23 to i32
  call void @llvm.lifetime.end.p5(i64 4, ptr addrspace(5) %1) #16
  ret void
}

; Function Attrs: convergent mustprogress nounwind
define linkonce_odr hidden noundef i32 @_ZNK17__HIP_CoordinatesI14__HIP_BlockIdxE3__YcvjEv(ptr noundef nonnull align 1 dereferenceable(1) %0) #5 comdat align 2 {
  %2 = alloca i32, align 4, addrspace(5)
  %3 = alloca ptr, align 8, addrspace(5)
  %4 = alloca %struct.__HIP_BlockIdx, align 1, addrspace(5)
  %5 = addrspacecast ptr addrspace(5) %2 to ptr
  %6 = addrspacecast ptr addrspace(5) %3 to ptr
  %7 = addrspacecast ptr addrspace(5) %4 to ptr
  store ptr %0, ptr %6, align 8, !tbaa !5
  %8 = load ptr, ptr %6, align 8
  call void @llvm.lifetime.start.p5(i64 1, ptr addrspace(5) %4) #16
  %9 = call noundef i32 @_ZNK14__HIP_BlockIdxclEj(ptr noundef nonnull align 1 dereferenceable(1) %7, i32 noundef 1) #20
  call void @llvm.lifetime.end.p5(i64 1, ptr addrspace(5) %4) #16
  ret i32 %9
}

; Function Attrs: convergent mustprogress nounwind
define linkonce_odr hidden noundef i32 @_ZNK17__HIP_CoordinatesI14__HIP_BlockDimE3__YcvjEv(ptr noundef nonnull align 1 dereferenceable(1) %0) #5 comdat align 2 {
  %2 = alloca i32, align 4, addrspace(5)
  %3 = alloca ptr, align 8, addrspace(5)
  %4 = alloca %struct.__HIP_BlockDim, align 1, addrspace(5)
  %5 = addrspacecast ptr addrspace(5) %2 to ptr
  %6 = addrspacecast ptr addrspace(5) %3 to ptr
  %7 = addrspacecast ptr addrspace(5) %4 to ptr
  store ptr %0, ptr %6, align 8, !tbaa !5
  %8 = load ptr, ptr %6, align 8
  call void @llvm.lifetime.start.p5(i64 1, ptr addrspace(5) %4) #16
  %9 = call noundef i32 @_ZNK14__HIP_BlockDimclEj(ptr noundef nonnull align 1 dereferenceable(1) %7, i32 noundef 1) #20
  call void @llvm.lifetime.end.p5(i64 1, ptr addrspace(5) %4) #16
  ret i32 %9
}

; Function Attrs: convergent mustprogress nounwind
define linkonce_odr hidden noundef i32 @_ZNK17__HIP_CoordinatesI15__HIP_ThreadIdxE3__YcvjEv(ptr noundef nonnull align 1 dereferenceable(1) %0) #5 comdat align 2 {
  %2 = alloca i32, align 4, addrspace(5)
  %3 = alloca ptr, align 8, addrspace(5)
  %4 = alloca %struct.__HIP_ThreadIdx, align 1, addrspace(5)
  %5 = addrspacecast ptr addrspace(5) %2 to ptr
  %6 = addrspacecast ptr addrspace(5) %3 to ptr
  %7 = addrspacecast ptr addrspace(5) %4 to ptr
  store ptr %0, ptr %6, align 8, !tbaa !5
  %8 = load ptr, ptr %6, align 8
  call void @llvm.lifetime.start.p5(i64 1, ptr addrspace(5) %4) #16
  %9 = call noundef i32 @_ZNK15__HIP_ThreadIdxclEj(ptr noundef nonnull align 1 dereferenceable(1) %7, i32 noundef 1) #20
  call void @llvm.lifetime.end.p5(i64 1, ptr addrspace(5) %4) #16
  ret i32 %9
}

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z11run_printf2v() #4 {
  %1 = alloca i32, align 4, addrspace(5)
  %2 = addrspacecast ptr addrspace(5) %1 to ptr
  call void @llvm.lifetime.start.p5(i64 4, ptr addrspace(5) %1) #16
  %3 = call noundef i32 @_ZNK17__HIP_CoordinatesI14__HIP_BlockIdxE3__ZcvjEv(ptr noundef nonnull align 1 dereferenceable(1) addrspacecast (ptr addrspace(4) @_ZN17__HIP_CoordinatesI14__HIP_BlockIdxE1zE to ptr)) #20
  %4 = call noundef i32 @_ZNK17__HIP_CoordinatesI14__HIP_BlockDimE3__ZcvjEv(ptr noundef nonnull align 1 dereferenceable(1) addrspacecast (ptr addrspace(4) @_ZN17__HIP_CoordinatesI14__HIP_BlockDimE1zE to ptr)) #20
  %5 = mul i32 %3, %4
  %6 = call noundef i32 @_ZNK17__HIP_CoordinatesI15__HIP_ThreadIdxE3__ZcvjEv(ptr noundef nonnull align 1 dereferenceable(1) addrspacecast (ptr addrspace(4) @_ZN17__HIP_CoordinatesI15__HIP_ThreadIdxE1zE to ptr)) #20
  %7 = add i32 %5, %6
  store i32 %7, ptr %2, align 4, !tbaa !9
  %8 = load i32, ptr %2, align 4, !tbaa !9
  %9 = call i64 @__ockl_printf_begin(i64 0)
  br i1 icmp eq (ptr addrspacecast (ptr addrspace(4) @.str to ptr), ptr null), label %19, label %10

10:                                               ; preds = %10, %0
  %11 = phi ptr [ addrspacecast (ptr addrspace(4) @.str to ptr), %0 ], [ %12, %10 ]
  %12 = getelementptr i8, ptr %11, i64 1
  %13 = load i8, ptr %11, align 1
  %14 = icmp eq i8 %13, 0
  br i1 %14, label %15, label %10

15:                                               ; preds = %10
  %16 = ptrtoint ptr %11 to i64
  %17 = sub i64 %16, ptrtoint (ptr addrspacecast (ptr addrspace(4) @.str to ptr) to i64)
  %18 = add i64 %17, 1
  br label %19

19:                                               ; preds = %15, %0
  %20 = phi i64 [ %18, %15 ], [ 0, %0 ]
  %21 = call i64 @__ockl_printf_append_string_n(i64 %9, ptr addrspacecast (ptr addrspace(4) @.str to ptr), i64 %20, i32 0)
  %22 = zext i32 %8 to i64
  %23 = call i64 @__ockl_printf_append_args(i64 %21, i32 1, i64 %22, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i32 1)
  %24 = trunc i64 %23 to i32
  call void @llvm.lifetime.end.p5(i64 4, ptr addrspace(5) %1) #16
  ret void
}

; Function Attrs: convergent mustprogress nounwind
define linkonce_odr hidden noundef i32 @_ZNK17__HIP_CoordinatesI14__HIP_BlockIdxE3__ZcvjEv(ptr noundef nonnull align 1 dereferenceable(1) %0) #5 comdat align 2 {
  %2 = alloca i32, align 4, addrspace(5)
  %3 = alloca ptr, align 8, addrspace(5)
  %4 = alloca %struct.__HIP_BlockIdx, align 1, addrspace(5)
  %5 = addrspacecast ptr addrspace(5) %2 to ptr
  %6 = addrspacecast ptr addrspace(5) %3 to ptr
  %7 = addrspacecast ptr addrspace(5) %4 to ptr
  store ptr %0, ptr %6, align 8, !tbaa !5
  %8 = load ptr, ptr %6, align 8
  call void @llvm.lifetime.start.p5(i64 1, ptr addrspace(5) %4) #16
  %9 = call noundef i32 @_ZNK14__HIP_BlockIdxclEj(ptr noundef nonnull align 1 dereferenceable(1) %7, i32 noundef 2) #20
  call void @llvm.lifetime.end.p5(i64 1, ptr addrspace(5) %4) #16
  ret i32 %9
}

; Function Attrs: convergent mustprogress nounwind
define linkonce_odr hidden noundef i32 @_ZNK17__HIP_CoordinatesI14__HIP_BlockDimE3__ZcvjEv(ptr noundef nonnull align 1 dereferenceable(1) %0) #5 comdat align 2 {
  %2 = alloca i32, align 4, addrspace(5)
  %3 = alloca ptr, align 8, addrspace(5)
  %4 = alloca %struct.__HIP_BlockDim, align 1, addrspace(5)
  %5 = addrspacecast ptr addrspace(5) %2 to ptr
  %6 = addrspacecast ptr addrspace(5) %3 to ptr
  %7 = addrspacecast ptr addrspace(5) %4 to ptr
  store ptr %0, ptr %6, align 8, !tbaa !5
  %8 = load ptr, ptr %6, align 8
  call void @llvm.lifetime.start.p5(i64 1, ptr addrspace(5) %4) #16
  %9 = call noundef i32 @_ZNK14__HIP_BlockDimclEj(ptr noundef nonnull align 1 dereferenceable(1) %7, i32 noundef 2) #20
  call void @llvm.lifetime.end.p5(i64 1, ptr addrspace(5) %4) #16
  ret i32 %9
}

; Function Attrs: convergent mustprogress nounwind
define linkonce_odr hidden noundef i32 @_ZNK17__HIP_CoordinatesI15__HIP_ThreadIdxE3__ZcvjEv(ptr noundef nonnull align 1 dereferenceable(1) %0) #5 comdat align 2 {
  %2 = alloca i32, align 4, addrspace(5)
  %3 = alloca ptr, align 8, addrspace(5)
  %4 = alloca %struct.__HIP_ThreadIdx, align 1, addrspace(5)
  %5 = addrspacecast ptr addrspace(5) %2 to ptr
  %6 = addrspacecast ptr addrspace(5) %3 to ptr
  %7 = addrspacecast ptr addrspace(5) %4 to ptr
  store ptr %0, ptr %6, align 8, !tbaa !5
  %8 = load ptr, ptr %6, align 8
  call void @llvm.lifetime.start.p5(i64 1, ptr addrspace(5) %4) #16
  %9 = call noundef i32 @_ZNK15__HIP_ThreadIdxclEj(ptr noundef nonnull align 1 dereferenceable(1) %7, i32 noundef 2) #20
  call void @llvm.lifetime.end.p5(i64 1, ptr addrspace(5) %4) #16
  ret i32 %9
}

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z11run_printf3v() #4 {
  %1 = alloca i32, align 4, addrspace(5)
  %2 = alloca i32, align 4, addrspace(5)
  %3 = alloca i32, align 4, addrspace(5)
  %4 = addrspacecast ptr addrspace(5) %1 to ptr
  %5 = addrspacecast ptr addrspace(5) %2 to ptr
  %6 = addrspacecast ptr addrspace(5) %3 to ptr
  call void @llvm.lifetime.start.p5(i64 4, ptr addrspace(5) %1) #16
  %7 = call noundef i32 @_ZNK17__HIP_CoordinatesI13__HIP_GridDimE3__XcvjEv(ptr noundef nonnull align 1 dereferenceable(1) addrspacecast (ptr addrspace(4) @_ZN17__HIP_CoordinatesI13__HIP_GridDimE1xE to ptr)) #20
  store i32 %7, ptr %4, align 4, !tbaa !9
  call void @llvm.lifetime.start.p5(i64 4, ptr addrspace(5) %2) #16
  %8 = call noundef i32 @_ZNK17__HIP_CoordinatesI13__HIP_GridDimE3__YcvjEv(ptr noundef nonnull align 1 dereferenceable(1) addrspacecast (ptr addrspace(4) @_ZN17__HIP_CoordinatesI13__HIP_GridDimE1yE to ptr)) #20
  store i32 %8, ptr %5, align 4, !tbaa !9
  call void @llvm.lifetime.start.p5(i64 4, ptr addrspace(5) %3) #16
  %9 = call noundef i32 @_ZNK17__HIP_CoordinatesI13__HIP_GridDimE3__ZcvjEv(ptr noundef nonnull align 1 dereferenceable(1) addrspacecast (ptr addrspace(4) @_ZN17__HIP_CoordinatesI13__HIP_GridDimE1zE to ptr)) #20
  store i32 %9, ptr %6, align 4, !tbaa !9
  %10 = load i32, ptr %4, align 4, !tbaa !9
  %11 = load i32, ptr %5, align 4, !tbaa !9
  %12 = load i32, ptr %6, align 4, !tbaa !9
  %13 = call i64 @__ockl_printf_begin(i64 0)
  br i1 icmp eq (ptr addrspacecast (ptr addrspace(4) @.str.1 to ptr), ptr null), label %23, label %14

14:                                               ; preds = %14, %0
  %15 = phi ptr [ addrspacecast (ptr addrspace(4) @.str.1 to ptr), %0 ], [ %16, %14 ]
  %16 = getelementptr i8, ptr %15, i64 1
  %17 = load i8, ptr %15, align 1
  %18 = icmp eq i8 %17, 0
  br i1 %18, label %19, label %14

19:                                               ; preds = %14
  %20 = ptrtoint ptr %15 to i64
  %21 = sub i64 %20, ptrtoint (ptr addrspacecast (ptr addrspace(4) @.str.1 to ptr) to i64)
  %22 = add i64 %21, 1
  br label %23

23:                                               ; preds = %19, %0
  %24 = phi i64 [ %22, %19 ], [ 0, %0 ]
  %25 = call i64 @__ockl_printf_append_string_n(i64 %13, ptr addrspacecast (ptr addrspace(4) @.str.1 to ptr), i64 %24, i32 0)
  %26 = zext i32 %10 to i64
  %27 = call i64 @__ockl_printf_append_args(i64 %25, i32 1, i64 %26, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i32 0)
  %28 = zext i32 %11 to i64
  %29 = call i64 @__ockl_printf_append_args(i64 %27, i32 1, i64 %28, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i32 0)
  %30 = zext i32 %12 to i64
  %31 = call i64 @__ockl_printf_append_args(i64 %29, i32 1, i64 %30, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i32 1)
  %32 = trunc i64 %31 to i32
  call void @llvm.lifetime.end.p5(i64 4, ptr addrspace(5) %3) #16
  call void @llvm.lifetime.end.p5(i64 4, ptr addrspace(5) %2) #16
  call void @llvm.lifetime.end.p5(i64 4, ptr addrspace(5) %1) #16
  ret void
}

; Function Attrs: convergent mustprogress nounwind
define linkonce_odr hidden noundef i32 @_ZNK17__HIP_CoordinatesI13__HIP_GridDimE3__XcvjEv(ptr noundef nonnull align 1 dereferenceable(1) %0) #5 comdat align 2 {
  %2 = alloca i32, align 4, addrspace(5)
  %3 = alloca ptr, align 8, addrspace(5)
  %4 = alloca %struct.__HIP_GridDim, align 1, addrspace(5)
  %5 = addrspacecast ptr addrspace(5) %2 to ptr
  %6 = addrspacecast ptr addrspace(5) %3 to ptr
  %7 = addrspacecast ptr addrspace(5) %4 to ptr
  store ptr %0, ptr %6, align 8, !tbaa !5
  %8 = load ptr, ptr %6, align 8
  call void @llvm.lifetime.start.p5(i64 1, ptr addrspace(5) %4) #16
  %9 = call noundef i32 @_ZNK13__HIP_GridDimclEj(ptr noundef nonnull align 1 dereferenceable(1) %7, i32 noundef 0) #20
  call void @llvm.lifetime.end.p5(i64 1, ptr addrspace(5) %4) #16
  ret i32 %9
}

; Function Attrs: convergent mustprogress nounwind
define linkonce_odr hidden noundef i32 @_ZNK17__HIP_CoordinatesI13__HIP_GridDimE3__YcvjEv(ptr noundef nonnull align 1 dereferenceable(1) %0) #5 comdat align 2 {
  %2 = alloca i32, align 4, addrspace(5)
  %3 = alloca ptr, align 8, addrspace(5)
  %4 = alloca %struct.__HIP_GridDim, align 1, addrspace(5)
  %5 = addrspacecast ptr addrspace(5) %2 to ptr
  %6 = addrspacecast ptr addrspace(5) %3 to ptr
  %7 = addrspacecast ptr addrspace(5) %4 to ptr
  store ptr %0, ptr %6, align 8, !tbaa !5
  %8 = load ptr, ptr %6, align 8
  call void @llvm.lifetime.start.p5(i64 1, ptr addrspace(5) %4) #16
  %9 = call noundef i32 @_ZNK13__HIP_GridDimclEj(ptr noundef nonnull align 1 dereferenceable(1) %7, i32 noundef 1) #20
  call void @llvm.lifetime.end.p5(i64 1, ptr addrspace(5) %4) #16
  ret i32 %9
}

; Function Attrs: convergent mustprogress nounwind
define linkonce_odr hidden noundef i32 @_ZNK17__HIP_CoordinatesI13__HIP_GridDimE3__ZcvjEv(ptr noundef nonnull align 1 dereferenceable(1) %0) #5 comdat align 2 {
  %2 = alloca i32, align 4, addrspace(5)
  %3 = alloca ptr, align 8, addrspace(5)
  %4 = alloca %struct.__HIP_GridDim, align 1, addrspace(5)
  %5 = addrspacecast ptr addrspace(5) %2 to ptr
  %6 = addrspacecast ptr addrspace(5) %3 to ptr
  %7 = addrspacecast ptr addrspace(5) %4 to ptr
  store ptr %0, ptr %6, align 8, !tbaa !5
  %8 = load ptr, ptr %6, align 8
  call void @llvm.lifetime.start.p5(i64 1, ptr addrspace(5) %4) #16
  %9 = call noundef i32 @_ZNK13__HIP_GridDimclEj(ptr noundef nonnull align 1 dereferenceable(1) %7, i32 noundef 2) #20
  call void @llvm.lifetime.end.p5(i64 1, ptr addrspace(5) %4) #16
  ret i32 %9
}

; Function Attrs: convergent mustprogress nounwind
define linkonce_odr hidden noundef i32 @_ZNK14__HIP_BlockIdxclEj(ptr noundef nonnull align 1 dereferenceable(1) %0, i32 noundef %1) #5 comdat align 2 {
  %3 = alloca i32, align 4, addrspace(5)
  %4 = alloca ptr, align 8, addrspace(5)
  %5 = alloca i32, align 4, addrspace(5)
  %6 = addrspacecast ptr addrspace(5) %3 to ptr
  %7 = addrspacecast ptr addrspace(5) %4 to ptr
  %8 = addrspacecast ptr addrspace(5) %5 to ptr
  store ptr %0, ptr %7, align 8, !tbaa !5
  store i32 %1, ptr %8, align 4, !tbaa !9
  %9 = load ptr, ptr %7, align 8
  %10 = load i32, ptr %8, align 4, !tbaa !9
  %11 = call i64 @__ockl_get_group_id(i32 noundef %10) #12
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
  store ptr %0, ptr %7, align 8, !tbaa !5
  store i32 %1, ptr %8, align 4, !tbaa !9
  %9 = load ptr, ptr %7, align 8
  %10 = load i32, ptr %8, align 4, !tbaa !9
  %11 = call i64 @__ockl_get_local_size(i32 noundef %10) #12
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
  store ptr %0, ptr %7, align 8, !tbaa !5
  store i32 %1, ptr %8, align 4, !tbaa !9
  %9 = load ptr, ptr %7, align 8
  %10 = load i32, ptr %8, align 4, !tbaa !9
  %11 = call i64 @__ockl_get_local_id(i32 noundef %10) #12
  %12 = trunc i64 %11 to i32
  ret i32 %12
}

; Function Attrs: convergent mustprogress nounwind
define linkonce_odr hidden noundef i32 @_ZNK13__HIP_GridDimclEj(ptr noundef nonnull align 1 dereferenceable(1) %0, i32 noundef %1) #5 comdat align 2 {
  %3 = alloca i32, align 4, addrspace(5)
  %4 = alloca ptr, align 8, addrspace(5)
  %5 = alloca i32, align 4, addrspace(5)
  %6 = addrspacecast ptr addrspace(5) %3 to ptr
  %7 = addrspacecast ptr addrspace(5) %4 to ptr
  %8 = addrspacecast ptr addrspace(5) %5 to ptr
  store ptr %0, ptr %7, align 8, !tbaa !5
  store i32 %1, ptr %8, align 4, !tbaa !9
  %9 = load ptr, ptr %7, align 8
  %10 = load i32, ptr %8, align 4, !tbaa !9
  %11 = call i64 @__ockl_get_num_groups(i32 noundef %10) #12
  %12 = trunc i64 %11 to i32
  ret i32 %12
}

; Function Attrs: convergent mustprogress nofree norecurse nosync nounwind readnone willreturn
define internal i64 @__ockl_get_num_groups(i32 noundef %0) #6 {
  switch i32 %0, label %76 [
    i32 0, label %2
    i32 1, label %26
    i32 2, label %51
  ]

2:                                                ; preds = %1
  %3 = load i32, ptr addrspace(4) @__oclc_ABI_version, align 4, !tbaa !19
  %4 = icmp slt i32 %3, 500
  br i1 %4, label %5, label %15

5:                                                ; preds = %2
  %6 = tail call align 4 dereferenceable(64) ptr addrspace(4) @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr inbounds %0, ptr addrspace(4) %6, i64 0, i32 6
  %8 = load i32, ptr addrspace(4) %7, align 4, !tbaa !23
  %9 = getelementptr i8, ptr addrspace(4) %6, i64 4
  %10 = load i16, ptr addrspace(4) %9, align 4, !range !29, !invariant.load !30
  %11 = zext i16 %10 to i32
  %12 = udiv i32 %8, %11
  %13 = mul i32 %12, %11
  %14 = icmp ugt i32 %8, %13
  br label %21

15:                                               ; preds = %2
  %16 = tail call ptr addrspace(4) @llvm.amdgcn.implicitarg.ptr()
  %17 = load i32, ptr addrspace(4) %16, align 4, !tbaa !19
  %18 = getelementptr inbounds i16, ptr addrspace(4) %16, i64 9
  %19 = load i16, ptr addrspace(4) %18, align 2, !tbaa !31
  %20 = icmp ne i16 %19, 0
  br label %21

21:                                               ; preds = %15, %5
  %22 = phi i1 [ %20, %15 ], [ %14, %5 ]
  %23 = phi i32 [ %17, %15 ], [ %12, %5 ]
  %24 = zext i1 %22 to i32
  %25 = add i32 %23, %24
  br label %76

26:                                               ; preds = %1
  %27 = load i32, ptr addrspace(4) @__oclc_ABI_version, align 4, !tbaa !19
  %28 = icmp slt i32 %27, 500
  br i1 %28, label %29, label %39

29:                                               ; preds = %26
  %30 = tail call align 4 dereferenceable(64) ptr addrspace(4) @llvm.amdgcn.dispatch.ptr()
  %31 = getelementptr inbounds %0, ptr addrspace(4) %30, i64 0, i32 7
  %32 = load i32, ptr addrspace(4) %31, align 8, !tbaa !32
  %33 = getelementptr i8, ptr addrspace(4) %30, i64 6
  %34 = load i16, ptr addrspace(4) %33, align 2, !range !29, !invariant.load !30
  %35 = zext i16 %34 to i32
  %36 = udiv i32 %32, %35
  %37 = mul i32 %36, %35
  %38 = icmp ugt i32 %32, %37
  br label %46

39:                                               ; preds = %26
  %40 = tail call ptr addrspace(4) @llvm.amdgcn.implicitarg.ptr()
  %41 = getelementptr inbounds i32, ptr addrspace(4) %40, i64 1
  %42 = load i32, ptr addrspace(4) %41, align 4, !tbaa !19
  %43 = getelementptr inbounds i16, ptr addrspace(4) %40, i64 10
  %44 = load i16, ptr addrspace(4) %43, align 4, !tbaa !31
  %45 = icmp ne i16 %44, 0
  br label %46

46:                                               ; preds = %39, %29
  %47 = phi i1 [ %45, %39 ], [ %38, %29 ]
  %48 = phi i32 [ %42, %39 ], [ %36, %29 ]
  %49 = zext i1 %47 to i32
  %50 = add i32 %48, %49
  br label %76

51:                                               ; preds = %1
  %52 = load i32, ptr addrspace(4) @__oclc_ABI_version, align 4, !tbaa !19
  %53 = icmp slt i32 %52, 500
  br i1 %53, label %54, label %64

54:                                               ; preds = %51
  %55 = tail call align 4 dereferenceable(64) ptr addrspace(4) @llvm.amdgcn.dispatch.ptr()
  %56 = getelementptr inbounds %0, ptr addrspace(4) %55, i64 0, i32 8
  %57 = load i32, ptr addrspace(4) %56, align 4, !tbaa !33
  %58 = getelementptr i8, ptr addrspace(4) %55, i64 8
  %59 = load i16, ptr addrspace(4) %58, align 4, !range !29, !invariant.load !30
  %60 = zext i16 %59 to i32
  %61 = udiv i32 %57, %60
  %62 = mul i32 %61, %60
  %63 = icmp ugt i32 %57, %62
  br label %71

64:                                               ; preds = %51
  %65 = tail call ptr addrspace(4) @llvm.amdgcn.implicitarg.ptr()
  %66 = getelementptr inbounds i32, ptr addrspace(4) %65, i64 2
  %67 = load i32, ptr addrspace(4) %66, align 4, !tbaa !19
  %68 = getelementptr inbounds i16, ptr addrspace(4) %65, i64 11
  %69 = load i16, ptr addrspace(4) %68, align 2, !tbaa !31
  %70 = icmp ne i16 %69, 0
  br label %71

71:                                               ; preds = %64, %54
  %72 = phi i1 [ %70, %64 ], [ %63, %54 ]
  %73 = phi i32 [ %67, %64 ], [ %61, %54 ]
  %74 = zext i1 %72 to i32
  %75 = add i32 %73, %74
  br label %76

76:                                               ; preds = %71, %46, %21, %1
  %77 = phi i32 [ %75, %71 ], [ %50, %46 ], [ %25, %21 ], [ 1, %1 ]
  %78 = zext i32 %77 to i64
  ret i64 %78
}

; Function Attrs: nounwind readnone speculatable willreturn
declare align 4 ptr addrspace(4) @llvm.amdgcn.dispatch.ptr() #7

; Function Attrs: nounwind readnone speculatable willreturn
declare align 4 ptr addrspace(4) @llvm.amdgcn.implicitarg.ptr() #7

; Function Attrs: convergent mustprogress nofree norecurse nosync nounwind readnone willreturn
define internal i64 @__ockl_get_local_id(i32 noundef %0) #6 {
  switch i32 %0, label %8 [
    i32 0, label %2
    i32 1, label %4
    i32 2, label %6
  ]

2:                                                ; preds = %1
  %3 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !34
  br label %8

4:                                                ; preds = %1
  %5 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !34
  br label %8

6:                                                ; preds = %1
  %7 = tail call i32 @llvm.amdgcn.workitem.id.z(), !range !34
  br label %8

8:                                                ; preds = %6, %4, %2, %1
  %9 = phi i32 [ %7, %6 ], [ %5, %4 ], [ %3, %2 ], [ 0, %1 ]
  %10 = zext i32 %9 to i64
  ret i64 %10
}

; Function Attrs: nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #7

; Function Attrs: nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #7

; Function Attrs: nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.z() #7

; Function Attrs: convergent norecurse nounwind
define internal i64 @__ockl_fprintf_stderr_begin() #8 {
  %1 = tail call <2 x i64> @__ockl_hostcall_preview(i32 noundef 2, i64 noundef 33, i64 noundef 1, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #20
  %2 = extractelement <2 x i64> %1, i64 0
  ret i64 %2
}

; Function Attrs: convergent norecurse nounwind
define internal <2 x i64> @__ockl_hostcall_preview(i32 noundef %0, i64 noundef %1, i64 noundef %2, i64 noundef %3, i64 noundef %4, i64 noundef %5, i64 noundef %6, i64 noundef %7, i64 noundef %8) local_unnamed_addr #8 {
  %10 = load i32, ptr addrspace(4) @__oclc_ABI_version, align 4, !tbaa !19
  %11 = icmp slt i32 %10, 500
  %12 = tail call ptr addrspace(4) @llvm.amdgcn.implicitarg.ptr()
  %13 = select i1 %11, i64 3, i64 10
  %14 = getelementptr inbounds i64, ptr addrspace(4) %12, i64 %13
  %15 = load i64, ptr addrspace(4) %14, align 8, !tbaa !35
  %16 = inttoptr i64 %15 to ptr addrspace(1)
  %17 = addrspacecast ptr addrspace(1) %16 to ptr
  %18 = tail call <2 x i64> @__ockl_hostcall_internal(ptr noundef %17, i32 noundef %0, i64 noundef %1, i64 noundef %2, i64 noundef %3, i64 noundef %4, i64 noundef %5, i64 noundef %6, i64 noundef %7, i64 noundef %8) #20
  ret <2 x i64> %18
}

; Function Attrs: convergent noinline norecurse nounwind optnone
define internal <2 x i64> @__ockl_hostcall_internal(ptr noundef %0, i32 noundef %1, i64 noundef %2, i64 noundef %3, i64 noundef %4, i64 noundef %5, i64 noundef %6, i64 noundef %7, i64 noundef %8, i64 noundef %9) local_unnamed_addr #9 {
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
  store ptr %0, ptr addrspace(5) %11, align 8, !tbaa !36
  store i32 %1, ptr addrspace(5) %12, align 4, !tbaa !19
  store i64 %2, ptr addrspace(5) %13, align 8, !tbaa !35
  store i64 %3, ptr addrspace(5) %14, align 8, !tbaa !35
  store i64 %4, ptr addrspace(5) %15, align 8, !tbaa !35
  store i64 %5, ptr addrspace(5) %16, align 8, !tbaa !35
  store i64 %6, ptr addrspace(5) %17, align 8, !tbaa !35
  store i64 %7, ptr addrspace(5) %18, align 8, !tbaa !35
  store i64 %8, ptr addrspace(5) %19, align 8, !tbaa !35
  store i64 %9, ptr addrspace(5) %20, align 8, !tbaa !35
  call void @llvm.lifetime.start.p5(i64 4, ptr addrspace(5) %21) #16
  %28 = call i32 @__ockl_lane_u32() #21
  store i32 %28, ptr addrspace(5) %21, align 4, !tbaa !19
  %29 = load i32, ptr addrspace(5) %21, align 4, !tbaa !19
  %30 = call fastcc i32 @0(i32 noundef %29) #21
  store i32 %30, ptr addrspace(5) %21, align 4, !tbaa !19
  call void @llvm.lifetime.start.p5(i64 4, ptr addrspace(5) %22) #16
  %31 = load i32, ptr addrspace(5) %21, align 4, !tbaa !19
  %32 = call i32 @llvm.amdgcn.readfirstlane(i32 %31)
  store i32 %32, ptr addrspace(5) %22, align 4, !tbaa !19
  call void @llvm.lifetime.start.p5(i64 8, ptr addrspace(5) %23) #16
  %33 = load ptr, ptr addrspace(5) %11, align 8, !tbaa !36
  %34 = addrspacecast ptr %33 to ptr addrspace(1)
  store ptr addrspace(1) %34, ptr addrspace(5) %23, align 8, !tbaa !36
  call void @llvm.lifetime.start.p5(i64 8, ptr addrspace(5) %24) #16
  %35 = load ptr addrspace(1), ptr addrspace(5) %23, align 8, !tbaa !36
  %36 = load i32, ptr addrspace(5) %21, align 4, !tbaa !19
  %37 = load i32, ptr addrspace(5) %22, align 4, !tbaa !19
  %38 = call fastcc i64 @1(ptr addrspace(1) noundef %35, i32 noundef %36, i32 noundef %37) #21
  store i64 %38, ptr addrspace(5) %24, align 8, !tbaa !35
  call void @llvm.lifetime.start.p5(i64 8, ptr addrspace(5) %25) #16
  %39 = load ptr addrspace(1), ptr addrspace(5) %23, align 8, !tbaa !36
  %40 = load i64, ptr addrspace(5) %24, align 8, !tbaa !35
  %41 = load ptr addrspace(1), ptr addrspace(1) %39, align 8, !tbaa !37
  %42 = getelementptr i8, ptr addrspace(1) %39, i64 40
  %43 = load i64, ptr addrspace(1) %42, align 8, !tbaa !39
  %44 = call fastcc ptr addrspace(1) @2(ptr addrspace(1) %41, i64 %43, i64 noundef %40) #21
  store ptr addrspace(1) %44, ptr addrspace(5) %25, align 8, !tbaa !36
  call void @llvm.lifetime.start.p5(i64 8, ptr addrspace(5) %26) #16
  %45 = load ptr addrspace(1), ptr addrspace(5) %23, align 8, !tbaa !36
  %46 = load i64, ptr addrspace(5) %24, align 8, !tbaa !35
  %47 = getelementptr i8, ptr addrspace(1) %45, i64 8
  %48 = load ptr addrspace(1), ptr addrspace(1) %47, align 8, !tbaa !40
  %49 = getelementptr i8, ptr addrspace(1) %45, i64 40
  %50 = load i64, ptr addrspace(1) %49, align 8, !tbaa !39
  %51 = call fastcc ptr addrspace(1) @3(ptr addrspace(1) %48, i64 %50, i64 noundef %46) #21
  store ptr addrspace(1) %51, ptr addrspace(5) %26, align 8, !tbaa !36
  %52 = load ptr addrspace(1), ptr addrspace(5) %25, align 8, !tbaa !36
  %53 = load ptr addrspace(1), ptr addrspace(5) %26, align 8, !tbaa !36
  %54 = load i32, ptr addrspace(5) %12, align 4, !tbaa !19
  %55 = load i64, ptr addrspace(5) %13, align 8, !tbaa !35
  %56 = load i64, ptr addrspace(5) %14, align 8, !tbaa !35
  %57 = load i64, ptr addrspace(5) %15, align 8, !tbaa !35
  %58 = load i64, ptr addrspace(5) %16, align 8, !tbaa !35
  %59 = load i64, ptr addrspace(5) %17, align 8, !tbaa !35
  %60 = load i64, ptr addrspace(5) %18, align 8, !tbaa !35
  %61 = load i64, ptr addrspace(5) %19, align 8, !tbaa !35
  %62 = load i64, ptr addrspace(5) %20, align 8, !tbaa !35
  %63 = load i32, ptr addrspace(5) %21, align 4, !tbaa !19
  %64 = load i32, ptr addrspace(5) %22, align 4, !tbaa !19
  call fastcc void @4(ptr addrspace(1) noundef %52, ptr addrspace(1) noundef %53, i32 noundef %54, i64 noundef %55, i64 noundef %56, i64 noundef %57, i64 noundef %58, i64 noundef %59, i64 noundef %60, i64 noundef %61, i64 noundef %62, i32 noundef %63, i32 noundef %64) #21
  %65 = load ptr addrspace(1), ptr addrspace(5) %23, align 8, !tbaa !36
  %66 = load i64, ptr addrspace(5) %24, align 8, !tbaa !35
  %67 = load i32, ptr addrspace(5) %21, align 4, !tbaa !19
  %68 = load i32, ptr addrspace(5) %22, align 4, !tbaa !19
  call fastcc void @5(ptr addrspace(1) noundef %65, i64 noundef %66, i32 noundef %67, i32 noundef %68) #21
  call void @llvm.lifetime.start.p5(i64 16, ptr addrspace(5) %27) #16
  %69 = load ptr addrspace(1), ptr addrspace(5) %25, align 8, !tbaa !36
  %70 = load ptr addrspace(1), ptr addrspace(5) %26, align 8, !tbaa !36
  %71 = load i32, ptr addrspace(5) %21, align 4, !tbaa !19
  %72 = load i32, ptr addrspace(5) %22, align 4, !tbaa !19
  %73 = call fastcc <2 x i64> @6(ptr addrspace(1) noundef %69, ptr addrspace(1) noundef %70, i32 noundef %71, i32 noundef %72) #21
  store <2 x i64> %73, ptr addrspace(5) %27, align 16, !tbaa !41
  %74 = load ptr addrspace(1), ptr addrspace(5) %23, align 8, !tbaa !36
  %75 = load i64, ptr addrspace(5) %24, align 8, !tbaa !35
  %76 = load i32, ptr addrspace(5) %21, align 4, !tbaa !19
  %77 = load i32, ptr addrspace(5) %22, align 4, !tbaa !19
  call fastcc void @7(ptr addrspace(1) noundef %74, i64 noundef %75, i32 noundef %76, i32 noundef %77) #21
  %78 = load <2 x i64>, ptr addrspace(5) %27, align 16, !tbaa !41
  call void @llvm.lifetime.end.p5(i64 16, ptr addrspace(5) %27) #16
  call void @llvm.lifetime.end.p5(i64 8, ptr addrspace(5) %26) #16
  call void @llvm.lifetime.end.p5(i64 8, ptr addrspace(5) %25) #16
  call void @llvm.lifetime.end.p5(i64 8, ptr addrspace(5) %24) #16
  call void @llvm.lifetime.end.p5(i64 8, ptr addrspace(5) %23) #16
  call void @llvm.lifetime.end.p5(i64 4, ptr addrspace(5) %22) #16
  call void @llvm.lifetime.end.p5(i64 4, ptr addrspace(5) %21) #16
  ret <2 x i64> %78
}

; Function Attrs: alwaysinline convergent mustprogress nofree norecurse nosync nounwind readnone willreturn
define internal i32 @__ockl_lane_u32() local_unnamed_addr #10 {
  %1 = load i8, ptr addrspace(4) @__oclc_wavefrontsize64, align 1, !tbaa !42
  %2 = and i8 %1, 1
  %3 = icmp eq i8 %2, 0
  %4 = tail call i32 @llvm.amdgcn.mbcnt.lo(i32 -1, i32 0)
  br i1 %3, label %7, label %5

5:                                                ; preds = %0
  %6 = tail call i32 @llvm.amdgcn.mbcnt.hi(i32 -1, i32 %4)
  br label %7

7:                                                ; preds = %5, %0
  %8 = phi i32 [ %6, %5 ], [ %4, %0 ]
  ret i32 %8
}

; Function Attrs: convergent norecurse nounwind
define internal fastcc i32 @0(i32 noundef %0) unnamed_addr #11 {
  %2 = tail call i32 asm sideeffect "; ockl readfirstlane hoisting hack $0", "=v,0"(i32 %0) #20, !srcloc !44
  ret i32 %2
}

; Function Attrs: convergent nounwind readnone willreturn
declare i32 @llvm.amdgcn.readfirstlane(i32) #12

; Function Attrs: convergent norecurse nounwind
define internal fastcc i64 @1(ptr addrspace(1) nocapture noundef %0, i32 noundef %1, i32 noundef %2) unnamed_addr #11 {
  %4 = icmp eq i32 %1, %2
  br i1 %4, label %5, label %29

5:                                                ; preds = %3
  %6 = getelementptr inbounds %2, ptr addrspace(1) %0, i64 0, i32 3
  %7 = load atomic i64, ptr addrspace(1) %6 syncscope("one-as") acquire, align 8
  %8 = getelementptr i8, ptr addrspace(1) %0, i64 40
  %9 = load ptr addrspace(1), ptr addrspace(1) %0, align 8, !tbaa !37
  %10 = load i64, ptr addrspace(1) %8, align 8, !tbaa !39
  %11 = and i64 %10, %7
  %12 = getelementptr inbounds %3, ptr addrspace(1) %9, i64 %11
  %13 = load atomic i64, ptr addrspace(1) %12 syncscope("one-as") monotonic, align 8
  %14 = cmpxchg ptr addrspace(1) %6, i64 %7, i64 %13 syncscope("one-as") acquire monotonic, align 8
  %15 = extractvalue { i64, i1 } %14, 1
  br i1 %15, label %26, label %16

16:                                               ; preds = %16, %5
  %17 = phi { i64, i1 } [ %24, %16 ], [ %14, %5 ]
  %18 = extractvalue { i64, i1 } %17, 0
  tail call void @llvm.amdgcn.s.sleep(i32 1)
  %19 = load ptr addrspace(1), ptr addrspace(1) %0, align 8, !tbaa !37
  %20 = load i64, ptr addrspace(1) %8, align 8, !tbaa !39
  %21 = and i64 %20, %18
  %22 = getelementptr inbounds %3, ptr addrspace(1) %19, i64 %21
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
define internal fastcc ptr addrspace(1) @2(ptr addrspace(1) %0, i64 %1, i64 noundef %2) unnamed_addr #13 {
  %4 = and i64 %2, %1
  %5 = getelementptr inbounds %3, ptr addrspace(1) %0, i64 %4
  ret ptr addrspace(1) %5
}

; Function Attrs: argmemonly convergent mustprogress nofree norecurse nosync nounwind readonly willreturn
define internal fastcc ptr addrspace(1) @3(ptr addrspace(1) %0, i64 %1, i64 noundef %2) unnamed_addr #13 {
  %4 = and i64 %2, %1
  %5 = getelementptr inbounds %4, ptr addrspace(1) %0, i64 %4
  ret ptr addrspace(1) %5
}

; Function Attrs: convergent mustprogress nofree norecurse nounwind willreturn
define internal fastcc void @4(ptr addrspace(1) nocapture noundef writeonly %0, ptr addrspace(1) nocapture noundef writeonly %1, i32 noundef %2, i64 noundef %3, i64 noundef %4, i64 noundef %5, i64 noundef %6, i64 noundef %7, i64 noundef %8, i64 noundef %9, i64 noundef %10, i32 noundef %11, i32 noundef %12) unnamed_addr #14 {
  %14 = tail call i64 @llvm.read_register.i64(metadata !45) #21
  %15 = icmp eq i32 %11, %12
  br i1 %15, label %16, label %20

16:                                               ; preds = %13
  %17 = getelementptr inbounds %3, ptr addrspace(1) %0, i64 0, i32 3
  %18 = getelementptr inbounds %3, ptr addrspace(1) %0, i64 0, i32 1
  %19 = getelementptr inbounds %3, ptr addrspace(1) %0, i64 0, i32 2
  store i32 %2, ptr addrspace(1) %19, align 8, !tbaa !46
  store i64 %14, ptr addrspace(1) %18, align 8, !tbaa !48
  store i32 1, ptr addrspace(1) %17, align 4, !tbaa !49
  br label %20

20:                                               ; preds = %16, %13
  %21 = zext i32 %11 to i64
  %22 = getelementptr inbounds [64 x [8 x i64]], ptr addrspace(1) %1, i64 0, i64 %21
  store i64 %3, ptr addrspace(1) %22, align 8, !tbaa !35
  %23 = getelementptr inbounds i64, ptr addrspace(1) %22, i64 1
  store i64 %4, ptr addrspace(1) %23, align 8, !tbaa !35
  %24 = getelementptr inbounds i64, ptr addrspace(1) %22, i64 2
  store i64 %5, ptr addrspace(1) %24, align 8, !tbaa !35
  %25 = getelementptr inbounds i64, ptr addrspace(1) %22, i64 3
  store i64 %6, ptr addrspace(1) %25, align 8, !tbaa !35
  %26 = getelementptr inbounds i64, ptr addrspace(1) %22, i64 4
  store i64 %7, ptr addrspace(1) %26, align 8, !tbaa !35
  %27 = getelementptr inbounds i64, ptr addrspace(1) %22, i64 5
  store i64 %8, ptr addrspace(1) %27, align 8, !tbaa !35
  %28 = getelementptr inbounds i64, ptr addrspace(1) %22, i64 6
  store i64 %9, ptr addrspace(1) %28, align 8, !tbaa !35
  %29 = getelementptr inbounds i64, ptr addrspace(1) %22, i64 7
  store i64 %10, ptr addrspace(1) %29, align 8, !tbaa !35
  ret void
}

; Function Attrs: convergent norecurse nounwind
define internal fastcc void @5(ptr addrspace(1) nocapture noundef %0, i64 noundef %1, i32 noundef %2, i32 noundef %3) unnamed_addr #11 {
  %5 = icmp eq i32 %2, %3
  br i1 %5, label %6, label %24

6:                                                ; preds = %4
  %7 = getelementptr inbounds %2, ptr addrspace(1) %0, i64 0, i32 4
  %8 = load atomic i64, ptr addrspace(1) %7 syncscope("one-as") monotonic, align 8
  %9 = load ptr addrspace(1), ptr addrspace(1) %0, align 8, !tbaa !37
  %10 = getelementptr i8, ptr addrspace(1) %0, i64 40
  %11 = load i64, ptr addrspace(1) %10, align 8, !tbaa !39
  %12 = and i64 %11, %1
  %13 = getelementptr inbounds %3, ptr addrspace(1) %9, i64 %12
  store i64 %8, ptr addrspace(1) %13, align 8, !tbaa !50
  %14 = cmpxchg ptr addrspace(1) %7, i64 %8, i64 %1 syncscope("one-as") release monotonic, align 8
  %15 = extractvalue { i64, i1 } %14, 1
  br i1 %15, label %21, label %16

16:                                               ; preds = %16, %6
  %17 = phi { i64, i1 } [ %19, %16 ], [ %14, %6 ]
  %18 = extractvalue { i64, i1 } %17, 0
  tail call void @llvm.amdgcn.s.sleep(i32 1)
  store i64 %18, ptr addrspace(1) %13, align 8, !tbaa !50
  %19 = cmpxchg ptr addrspace(1) %7, i64 %18, i64 %1 syncscope("one-as") release monotonic, align 8
  %20 = extractvalue { i64, i1 } %19, 1
  br i1 %20, label %21, label %16

21:                                               ; preds = %16, %6
  %22 = getelementptr inbounds %2, ptr addrspace(1) %0, i64 0, i32 2
  %23 = load i64, ptr addrspace(1) %22, align 8
  tail call void @__ockl_hsa_signal_add(i64 %23, i64 noundef 1, i32 noundef 3) #20
  br label %24

24:                                               ; preds = %21, %4
  ret void
}

; Function Attrs: convergent norecurse nounwind
define internal fastcc <2 x i64> @6(ptr addrspace(1) nocapture noundef readonly %0, ptr addrspace(1) nocapture noundef readonly %1, i32 noundef %2, i32 noundef %3) unnamed_addr #8 {
  %5 = icmp eq i32 %2, %3
  %6 = getelementptr inbounds %3, ptr addrspace(1) %0, i64 0, i32 3
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
  %20 = load i64, ptr addrspace(1) %18, align 8, !tbaa !35
  %21 = load i64, ptr addrspace(1) %19, align 8, !tbaa !35
  %22 = insertelement <2 x i64> undef, i64 %20, i64 0
  %23 = insertelement <2 x i64> %22, i64 %21, i64 1
  ret <2 x i64> %23
}

; Function Attrs: convergent norecurse nounwind
define internal fastcc void @7(ptr addrspace(1) nocapture noundef %0, i64 noundef %1, i32 noundef %2, i32 noundef %3) unnamed_addr #11 {
  %5 = icmp eq i32 %2, %3
  br i1 %5, label %6, label %25

6:                                                ; preds = %4
  %7 = getelementptr %2, ptr addrspace(1) %0, i64 0, i32 5
  %8 = load i64, ptr addrspace(1) %7, align 8, !tbaa !39
  %9 = add i64 %8, 1
  %10 = add i64 %9, %1
  %11 = icmp eq i64 %10, 0
  %12 = select i1 %11, i64 %9, i64 %10
  %13 = getelementptr inbounds %2, ptr addrspace(1) %0, i64 0, i32 3
  %14 = load atomic i64, ptr addrspace(1) %13 syncscope("one-as") monotonic, align 8
  %15 = load ptr addrspace(1), ptr addrspace(1) %0, align 8, !tbaa !37
  %16 = and i64 %12, %8
  %17 = getelementptr inbounds %3, ptr addrspace(1) %15, i64 %16
  store i64 %14, ptr addrspace(1) %17, align 8, !tbaa !50
  %18 = cmpxchg ptr addrspace(1) %13, i64 %14, i64 %12 syncscope("one-as") release monotonic, align 8
  %19 = extractvalue { i64, i1 } %18, 1
  br i1 %19, label %25, label %20

20:                                               ; preds = %20, %6
  %21 = phi { i64, i1 } [ %23, %20 ], [ %18, %6 ]
  %22 = extractvalue { i64, i1 } %21, 0
  tail call void @llvm.amdgcn.s.sleep(i32 1)
  store i64 %22, ptr addrspace(1) %17, align 8, !tbaa !50
  %23 = cmpxchg ptr addrspace(1) %13, i64 %22, i64 %12 syncscope("one-as") release monotonic, align 8
  %24 = extractvalue { i64, i1 } %23, 1
  br i1 %24, label %25, label %20

25:                                               ; preds = %20, %6, %4
  ret void
}

; Function Attrs: nounwind willreturn
declare void @llvm.amdgcn.s.sleep(i32 immarg) #15

; Function Attrs: convergent norecurse nounwind
define internal void @__ockl_hsa_signal_add(i64 %0, i64 noundef %1, i32 noundef %2) local_unnamed_addr #11 {
  %4 = inttoptr i64 %0 to ptr addrspace(1)
  %5 = getelementptr inbounds %5, ptr addrspace(1) %4, i64 0, i32 1
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
  %17 = getelementptr inbounds %5, ptr addrspace(1) %4, i64 0, i32 2
  %18 = load i64, ptr addrspace(1) %17, align 16, !tbaa !51
  %19 = icmp eq i64 %18, 0
  br i1 %19, label %27, label %20

20:                                               ; preds = %16
  %21 = inttoptr i64 %18 to ptr addrspace(1)
  %22 = getelementptr inbounds %5, ptr addrspace(1) %4, i64 0, i32 3
  %23 = load i32, ptr addrspace(1) %22, align 8, !tbaa !53
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
declare void @llvm.amdgcn.s.sendmsg(i32 immarg, i32) #16

; Function Attrs: nounwind readonly
declare i64 @llvm.read_register.i64(metadata) #17

; Function Attrs: nounwind readnone willreturn
declare i32 @llvm.amdgcn.mbcnt.lo(i32, i32) #18

; Function Attrs: nounwind readnone willreturn
declare i32 @llvm.amdgcn.mbcnt.hi(i32, i32) #18

; Function Attrs: convergent norecurse nounwind
define internal i64 @__ockl_fprintf_append_args(i64 noundef %0, i32 noundef %1, i64 noundef %2, i64 noundef %3, i64 noundef %4, i64 noundef %5, i64 noundef %6, i64 noundef %7, i64 noundef %8, i32 noundef %9) #8 {
  %11 = icmp eq i32 %9, 0
  %12 = or i64 %0, 2
  %13 = select i1 %11, i64 %0, i64 %12
  %14 = and i64 %13, -225
  %15 = zext i32 %1 to i64
  %16 = shl nuw nsw i64 %15, 5
  %17 = or i64 %14, %16
  %18 = tail call <2 x i64> @__ockl_hostcall_preview(i32 noundef 2, i64 noundef %17, i64 noundef %2, i64 noundef %3, i64 noundef %4, i64 noundef %5, i64 noundef %6, i64 noundef %7, i64 noundef %8) #20
  %19 = extractelement <2 x i64> %18, i64 0
  ret i64 %19
}

; Function Attrs: convergent norecurse nounwind
define internal i64 @__ockl_fprintf_append_string_n(i64 noundef %0, ptr noundef readonly %1, i64 noundef %2, i32 noundef %3) #8 {
  %5 = icmp eq i32 %3, 0
  %6 = or i64 %0, 2
  %7 = select i1 %5, i64 %0, i64 %6
  %8 = icmp eq ptr %1, null
  br i1 %8, label %9, label %13

9:                                                ; preds = %4
  %10 = and i64 %7, -225
  %11 = or i64 %10, 32
  %12 = tail call <2 x i64> @__ockl_hostcall_preview(i32 noundef 2, i64 noundef %11, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #20
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
  %33 = load i8, ptr %19, align 1, !tbaa !41
  %34 = zext i8 %33 to i64
  %35 = getelementptr inbounds i8, ptr %19, i64 1
  %36 = load i8, ptr %35, align 1, !tbaa !41
  %37 = zext i8 %36 to i64
  %38 = shl nuw nsw i64 %37, 8
  %39 = or i64 %38, %34
  %40 = getelementptr inbounds i8, ptr %19, i64 2
  %41 = load i8, ptr %40, align 1, !tbaa !41
  %42 = zext i8 %41 to i64
  %43 = shl nuw nsw i64 %42, 16
  %44 = or i64 %39, %43
  %45 = getelementptr inbounds i8, ptr %19, i64 3
  %46 = load i8, ptr %45, align 1, !tbaa !41
  %47 = zext i8 %46 to i64
  %48 = shl nuw nsw i64 %47, 24
  %49 = or i64 %44, %48
  %50 = getelementptr inbounds i8, ptr %19, i64 4
  %51 = load i8, ptr %50, align 1, !tbaa !41
  %52 = zext i8 %51 to i64
  %53 = shl nuw nsw i64 %52, 32
  %54 = or i64 %49, %53
  %55 = getelementptr inbounds i8, ptr %19, i64 5
  %56 = load i8, ptr %55, align 1, !tbaa !41
  %57 = zext i8 %56 to i64
  %58 = shl nuw nsw i64 %57, 40
  %59 = or i64 %54, %58
  %60 = getelementptr inbounds i8, ptr %19, i64 6
  %61 = load i8, ptr %60, align 1, !tbaa !41
  %62 = zext i8 %61 to i64
  %63 = shl nuw nsw i64 %62, 48
  %64 = or i64 %59, %63
  %65 = getelementptr inbounds i8, ptr %19, i64 7
  %66 = load i8, ptr %65, align 1, !tbaa !41
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
  %77 = load i8, ptr %76, align 1, !tbaa !41
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
  %93 = load i8, ptr %86, align 1, !tbaa !41
  %94 = zext i8 %93 to i64
  %95 = getelementptr inbounds i8, ptr %86, i64 1
  %96 = load i8, ptr %95, align 1, !tbaa !41
  %97 = zext i8 %96 to i64
  %98 = shl nuw nsw i64 %97, 8
  %99 = or i64 %98, %94
  %100 = getelementptr inbounds i8, ptr %86, i64 2
  %101 = load i8, ptr %100, align 1, !tbaa !41
  %102 = zext i8 %101 to i64
  %103 = shl nuw nsw i64 %102, 16
  %104 = or i64 %99, %103
  %105 = getelementptr inbounds i8, ptr %86, i64 3
  %106 = load i8, ptr %105, align 1, !tbaa !41
  %107 = zext i8 %106 to i64
  %108 = shl nuw nsw i64 %107, 24
  %109 = or i64 %104, %108
  %110 = getelementptr inbounds i8, ptr %86, i64 4
  %111 = load i8, ptr %110, align 1, !tbaa !41
  %112 = zext i8 %111 to i64
  %113 = shl nuw nsw i64 %112, 32
  %114 = or i64 %109, %113
  %115 = getelementptr inbounds i8, ptr %86, i64 5
  %116 = load i8, ptr %115, align 1, !tbaa !41
  %117 = zext i8 %116 to i64
  %118 = shl nuw nsw i64 %117, 40
  %119 = or i64 %114, %118
  %120 = getelementptr inbounds i8, ptr %86, i64 6
  %121 = load i8, ptr %120, align 1, !tbaa !41
  %122 = zext i8 %121 to i64
  %123 = shl nuw nsw i64 %122, 48
  %124 = or i64 %119, %123
  %125 = getelementptr inbounds i8, ptr %86, i64 7
  %126 = load i8, ptr %125, align 1, !tbaa !41
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
  %137 = load i8, ptr %136, align 1, !tbaa !41
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
  %153 = load i8, ptr %146, align 1, !tbaa !41
  %154 = zext i8 %153 to i64
  %155 = getelementptr inbounds i8, ptr %146, i64 1
  %156 = load i8, ptr %155, align 1, !tbaa !41
  %157 = zext i8 %156 to i64
  %158 = shl nuw nsw i64 %157, 8
  %159 = or i64 %158, %154
  %160 = getelementptr inbounds i8, ptr %146, i64 2
  %161 = load i8, ptr %160, align 1, !tbaa !41
  %162 = zext i8 %161 to i64
  %163 = shl nuw nsw i64 %162, 16
  %164 = or i64 %159, %163
  %165 = getelementptr inbounds i8, ptr %146, i64 3
  %166 = load i8, ptr %165, align 1, !tbaa !41
  %167 = zext i8 %166 to i64
  %168 = shl nuw nsw i64 %167, 24
  %169 = or i64 %164, %168
  %170 = getelementptr inbounds i8, ptr %146, i64 4
  %171 = load i8, ptr %170, align 1, !tbaa !41
  %172 = zext i8 %171 to i64
  %173 = shl nuw nsw i64 %172, 32
  %174 = or i64 %169, %173
  %175 = getelementptr inbounds i8, ptr %146, i64 5
  %176 = load i8, ptr %175, align 1, !tbaa !41
  %177 = zext i8 %176 to i64
  %178 = shl nuw nsw i64 %177, 40
  %179 = or i64 %174, %178
  %180 = getelementptr inbounds i8, ptr %146, i64 6
  %181 = load i8, ptr %180, align 1, !tbaa !41
  %182 = zext i8 %181 to i64
  %183 = shl nuw nsw i64 %182, 48
  %184 = or i64 %179, %183
  %185 = getelementptr inbounds i8, ptr %146, i64 7
  %186 = load i8, ptr %185, align 1, !tbaa !41
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
  %197 = load i8, ptr %196, align 1, !tbaa !41
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
  %213 = load i8, ptr %206, align 1, !tbaa !41
  %214 = zext i8 %213 to i64
  %215 = getelementptr inbounds i8, ptr %206, i64 1
  %216 = load i8, ptr %215, align 1, !tbaa !41
  %217 = zext i8 %216 to i64
  %218 = shl nuw nsw i64 %217, 8
  %219 = or i64 %218, %214
  %220 = getelementptr inbounds i8, ptr %206, i64 2
  %221 = load i8, ptr %220, align 1, !tbaa !41
  %222 = zext i8 %221 to i64
  %223 = shl nuw nsw i64 %222, 16
  %224 = or i64 %219, %223
  %225 = getelementptr inbounds i8, ptr %206, i64 3
  %226 = load i8, ptr %225, align 1, !tbaa !41
  %227 = zext i8 %226 to i64
  %228 = shl nuw nsw i64 %227, 24
  %229 = or i64 %224, %228
  %230 = getelementptr inbounds i8, ptr %206, i64 4
  %231 = load i8, ptr %230, align 1, !tbaa !41
  %232 = zext i8 %231 to i64
  %233 = shl nuw nsw i64 %232, 32
  %234 = or i64 %229, %233
  %235 = getelementptr inbounds i8, ptr %206, i64 5
  %236 = load i8, ptr %235, align 1, !tbaa !41
  %237 = zext i8 %236 to i64
  %238 = shl nuw nsw i64 %237, 40
  %239 = or i64 %234, %238
  %240 = getelementptr inbounds i8, ptr %206, i64 6
  %241 = load i8, ptr %240, align 1, !tbaa !41
  %242 = zext i8 %241 to i64
  %243 = shl nuw nsw i64 %242, 48
  %244 = or i64 %239, %243
  %245 = getelementptr inbounds i8, ptr %206, i64 7
  %246 = load i8, ptr %245, align 1, !tbaa !41
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
  %257 = load i8, ptr %256, align 1, !tbaa !41
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
  %273 = load i8, ptr %266, align 1, !tbaa !41
  %274 = zext i8 %273 to i64
  %275 = getelementptr inbounds i8, ptr %266, i64 1
  %276 = load i8, ptr %275, align 1, !tbaa !41
  %277 = zext i8 %276 to i64
  %278 = shl nuw nsw i64 %277, 8
  %279 = or i64 %278, %274
  %280 = getelementptr inbounds i8, ptr %266, i64 2
  %281 = load i8, ptr %280, align 1, !tbaa !41
  %282 = zext i8 %281 to i64
  %283 = shl nuw nsw i64 %282, 16
  %284 = or i64 %279, %283
  %285 = getelementptr inbounds i8, ptr %266, i64 3
  %286 = load i8, ptr %285, align 1, !tbaa !41
  %287 = zext i8 %286 to i64
  %288 = shl nuw nsw i64 %287, 24
  %289 = or i64 %284, %288
  %290 = getelementptr inbounds i8, ptr %266, i64 4
  %291 = load i8, ptr %290, align 1, !tbaa !41
  %292 = zext i8 %291 to i64
  %293 = shl nuw nsw i64 %292, 32
  %294 = or i64 %289, %293
  %295 = getelementptr inbounds i8, ptr %266, i64 5
  %296 = load i8, ptr %295, align 1, !tbaa !41
  %297 = zext i8 %296 to i64
  %298 = shl nuw nsw i64 %297, 40
  %299 = or i64 %294, %298
  %300 = getelementptr inbounds i8, ptr %266, i64 6
  %301 = load i8, ptr %300, align 1, !tbaa !41
  %302 = zext i8 %301 to i64
  %303 = shl nuw nsw i64 %302, 48
  %304 = or i64 %299, %303
  %305 = getelementptr inbounds i8, ptr %266, i64 7
  %306 = load i8, ptr %305, align 1, !tbaa !41
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
  %317 = load i8, ptr %316, align 1, !tbaa !41
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
  %333 = load i8, ptr %326, align 1, !tbaa !41
  %334 = zext i8 %333 to i64
  %335 = getelementptr inbounds i8, ptr %326, i64 1
  %336 = load i8, ptr %335, align 1, !tbaa !41
  %337 = zext i8 %336 to i64
  %338 = shl nuw nsw i64 %337, 8
  %339 = or i64 %338, %334
  %340 = getelementptr inbounds i8, ptr %326, i64 2
  %341 = load i8, ptr %340, align 1, !tbaa !41
  %342 = zext i8 %341 to i64
  %343 = shl nuw nsw i64 %342, 16
  %344 = or i64 %339, %343
  %345 = getelementptr inbounds i8, ptr %326, i64 3
  %346 = load i8, ptr %345, align 1, !tbaa !41
  %347 = zext i8 %346 to i64
  %348 = shl nuw nsw i64 %347, 24
  %349 = or i64 %344, %348
  %350 = getelementptr inbounds i8, ptr %326, i64 4
  %351 = load i8, ptr %350, align 1, !tbaa !41
  %352 = zext i8 %351 to i64
  %353 = shl nuw nsw i64 %352, 32
  %354 = or i64 %349, %353
  %355 = getelementptr inbounds i8, ptr %326, i64 5
  %356 = load i8, ptr %355, align 1, !tbaa !41
  %357 = zext i8 %356 to i64
  %358 = shl nuw nsw i64 %357, 40
  %359 = or i64 %354, %358
  %360 = getelementptr inbounds i8, ptr %326, i64 6
  %361 = load i8, ptr %360, align 1, !tbaa !41
  %362 = zext i8 %361 to i64
  %363 = shl nuw nsw i64 %362, 48
  %364 = or i64 %359, %363
  %365 = getelementptr inbounds i8, ptr %326, i64 7
  %366 = load i8, ptr %365, align 1, !tbaa !41
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
  %377 = load i8, ptr %376, align 1, !tbaa !41
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
  %393 = load i8, ptr %386, align 1, !tbaa !41
  %394 = zext i8 %393 to i64
  %395 = getelementptr inbounds i8, ptr %386, i64 1
  %396 = load i8, ptr %395, align 1, !tbaa !41
  %397 = zext i8 %396 to i64
  %398 = shl nuw nsw i64 %397, 8
  %399 = or i64 %398, %394
  %400 = getelementptr inbounds i8, ptr %386, i64 2
  %401 = load i8, ptr %400, align 1, !tbaa !41
  %402 = zext i8 %401 to i64
  %403 = shl nuw nsw i64 %402, 16
  %404 = or i64 %399, %403
  %405 = getelementptr inbounds i8, ptr %386, i64 3
  %406 = load i8, ptr %405, align 1, !tbaa !41
  %407 = zext i8 %406 to i64
  %408 = shl nuw nsw i64 %407, 24
  %409 = or i64 %404, %408
  %410 = getelementptr inbounds i8, ptr %386, i64 4
  %411 = load i8, ptr %410, align 1, !tbaa !41
  %412 = zext i8 %411 to i64
  %413 = shl nuw nsw i64 %412, 32
  %414 = or i64 %409, %413
  %415 = getelementptr inbounds i8, ptr %386, i64 5
  %416 = load i8, ptr %415, align 1, !tbaa !41
  %417 = zext i8 %416 to i64
  %418 = shl nuw nsw i64 %417, 40
  %419 = or i64 %414, %418
  %420 = getelementptr inbounds i8, ptr %386, i64 6
  %421 = load i8, ptr %420, align 1, !tbaa !41
  %422 = zext i8 %421 to i64
  %423 = shl nuw nsw i64 %422, 48
  %424 = or i64 %419, %423
  %425 = getelementptr inbounds i8, ptr %386, i64 7
  %426 = load i8, ptr %425, align 1, !tbaa !41
  %427 = zext i8 %426 to i64
  %428 = shl nuw i64 %427, 56
  %429 = or i64 %424, %428
  br label %443

430:                                              ; preds = %430, %390
  %431 = phi i32 [ %441, %430 ], [ 0, %390 ]
  %432 = phi i64 [ %440, %430 ], [ 0, %390 ]
  %433 = zext i32 %431 to i64
  %434 = getelementptr inbounds i8, ptr %386, i64 %433
  %435 = load i8, ptr %434, align 1, !tbaa !41
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
  %450 = tail call <2 x i64> @__ockl_hostcall_preview(i32 noundef 2, i64 noundef %449, i64 noundef %88, i64 noundef %148, i64 noundef %208, i64 noundef %268, i64 noundef %328, i64 noundef %388, i64 noundef %444) #20
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
declare i64 @llvm.umin.i64(i64, i64) #19

; Function Attrs: convergent norecurse nounwind
define internal i64 @__ockl_printf_begin(i64 noundef %0) #8 {
  %2 = tail call <2 x i64> @__ockl_hostcall_preview(i32 noundef 2, i64 noundef 33, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #20
  %3 = extractelement <2 x i64> %2, i64 0
  ret i64 %3
}

; Function Attrs: convergent norecurse nounwind
define internal i64 @__ockl_printf_append_args(i64 noundef %0, i32 noundef %1, i64 noundef %2, i64 noundef %3, i64 noundef %4, i64 noundef %5, i64 noundef %6, i64 noundef %7, i64 noundef %8, i32 noundef %9) #8 {
  %11 = icmp eq i32 %9, 0
  %12 = or i64 %0, 2
  %13 = select i1 %11, i64 %0, i64 %12
  %14 = and i64 %13, -225
  %15 = zext i32 %1 to i64
  %16 = shl nuw nsw i64 %15, 5
  %17 = or i64 %14, %16
  %18 = tail call <2 x i64> @__ockl_hostcall_preview(i32 noundef 2, i64 noundef %17, i64 noundef %2, i64 noundef %3, i64 noundef %4, i64 noundef %5, i64 noundef %6, i64 noundef %7, i64 noundef %8) #20
  %19 = extractelement <2 x i64> %18, i64 0
  ret i64 %19
}

; Function Attrs: convergent norecurse nounwind
define internal i64 @__ockl_printf_append_string_n(i64 noundef %0, ptr noundef readonly %1, i64 noundef %2, i32 noundef %3) #8 {
  %5 = icmp eq i32 %3, 0
  %6 = or i64 %0, 2
  %7 = select i1 %5, i64 %0, i64 %6
  %8 = icmp eq ptr %1, null
  br i1 %8, label %9, label %13

9:                                                ; preds = %4
  %10 = and i64 %7, -225
  %11 = or i64 %10, 32
  %12 = tail call <2 x i64> @__ockl_hostcall_preview(i32 noundef 2, i64 noundef %11, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #20
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
  %33 = load i8, ptr %19, align 1, !tbaa !41
  %34 = zext i8 %33 to i64
  %35 = getelementptr inbounds i8, ptr %19, i64 1
  %36 = load i8, ptr %35, align 1, !tbaa !41
  %37 = zext i8 %36 to i64
  %38 = shl nuw nsw i64 %37, 8
  %39 = or i64 %38, %34
  %40 = getelementptr inbounds i8, ptr %19, i64 2
  %41 = load i8, ptr %40, align 1, !tbaa !41
  %42 = zext i8 %41 to i64
  %43 = shl nuw nsw i64 %42, 16
  %44 = or i64 %39, %43
  %45 = getelementptr inbounds i8, ptr %19, i64 3
  %46 = load i8, ptr %45, align 1, !tbaa !41
  %47 = zext i8 %46 to i64
  %48 = shl nuw nsw i64 %47, 24
  %49 = or i64 %44, %48
  %50 = getelementptr inbounds i8, ptr %19, i64 4
  %51 = load i8, ptr %50, align 1, !tbaa !41
  %52 = zext i8 %51 to i64
  %53 = shl nuw nsw i64 %52, 32
  %54 = or i64 %49, %53
  %55 = getelementptr inbounds i8, ptr %19, i64 5
  %56 = load i8, ptr %55, align 1, !tbaa !41
  %57 = zext i8 %56 to i64
  %58 = shl nuw nsw i64 %57, 40
  %59 = or i64 %54, %58
  %60 = getelementptr inbounds i8, ptr %19, i64 6
  %61 = load i8, ptr %60, align 1, !tbaa !41
  %62 = zext i8 %61 to i64
  %63 = shl nuw nsw i64 %62, 48
  %64 = or i64 %59, %63
  %65 = getelementptr inbounds i8, ptr %19, i64 7
  %66 = load i8, ptr %65, align 1, !tbaa !41
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
  %77 = load i8, ptr %76, align 1, !tbaa !41
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
  %93 = load i8, ptr %86, align 1, !tbaa !41
  %94 = zext i8 %93 to i64
  %95 = getelementptr inbounds i8, ptr %86, i64 1
  %96 = load i8, ptr %95, align 1, !tbaa !41
  %97 = zext i8 %96 to i64
  %98 = shl nuw nsw i64 %97, 8
  %99 = or i64 %98, %94
  %100 = getelementptr inbounds i8, ptr %86, i64 2
  %101 = load i8, ptr %100, align 1, !tbaa !41
  %102 = zext i8 %101 to i64
  %103 = shl nuw nsw i64 %102, 16
  %104 = or i64 %99, %103
  %105 = getelementptr inbounds i8, ptr %86, i64 3
  %106 = load i8, ptr %105, align 1, !tbaa !41
  %107 = zext i8 %106 to i64
  %108 = shl nuw nsw i64 %107, 24
  %109 = or i64 %104, %108
  %110 = getelementptr inbounds i8, ptr %86, i64 4
  %111 = load i8, ptr %110, align 1, !tbaa !41
  %112 = zext i8 %111 to i64
  %113 = shl nuw nsw i64 %112, 32
  %114 = or i64 %109, %113
  %115 = getelementptr inbounds i8, ptr %86, i64 5
  %116 = load i8, ptr %115, align 1, !tbaa !41
  %117 = zext i8 %116 to i64
  %118 = shl nuw nsw i64 %117, 40
  %119 = or i64 %114, %118
  %120 = getelementptr inbounds i8, ptr %86, i64 6
  %121 = load i8, ptr %120, align 1, !tbaa !41
  %122 = zext i8 %121 to i64
  %123 = shl nuw nsw i64 %122, 48
  %124 = or i64 %119, %123
  %125 = getelementptr inbounds i8, ptr %86, i64 7
  %126 = load i8, ptr %125, align 1, !tbaa !41
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
  %137 = load i8, ptr %136, align 1, !tbaa !41
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
  %153 = load i8, ptr %146, align 1, !tbaa !41
  %154 = zext i8 %153 to i64
  %155 = getelementptr inbounds i8, ptr %146, i64 1
  %156 = load i8, ptr %155, align 1, !tbaa !41
  %157 = zext i8 %156 to i64
  %158 = shl nuw nsw i64 %157, 8
  %159 = or i64 %158, %154
  %160 = getelementptr inbounds i8, ptr %146, i64 2
  %161 = load i8, ptr %160, align 1, !tbaa !41
  %162 = zext i8 %161 to i64
  %163 = shl nuw nsw i64 %162, 16
  %164 = or i64 %159, %163
  %165 = getelementptr inbounds i8, ptr %146, i64 3
  %166 = load i8, ptr %165, align 1, !tbaa !41
  %167 = zext i8 %166 to i64
  %168 = shl nuw nsw i64 %167, 24
  %169 = or i64 %164, %168
  %170 = getelementptr inbounds i8, ptr %146, i64 4
  %171 = load i8, ptr %170, align 1, !tbaa !41
  %172 = zext i8 %171 to i64
  %173 = shl nuw nsw i64 %172, 32
  %174 = or i64 %169, %173
  %175 = getelementptr inbounds i8, ptr %146, i64 5
  %176 = load i8, ptr %175, align 1, !tbaa !41
  %177 = zext i8 %176 to i64
  %178 = shl nuw nsw i64 %177, 40
  %179 = or i64 %174, %178
  %180 = getelementptr inbounds i8, ptr %146, i64 6
  %181 = load i8, ptr %180, align 1, !tbaa !41
  %182 = zext i8 %181 to i64
  %183 = shl nuw nsw i64 %182, 48
  %184 = or i64 %179, %183
  %185 = getelementptr inbounds i8, ptr %146, i64 7
  %186 = load i8, ptr %185, align 1, !tbaa !41
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
  %197 = load i8, ptr %196, align 1, !tbaa !41
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
  %213 = load i8, ptr %206, align 1, !tbaa !41
  %214 = zext i8 %213 to i64
  %215 = getelementptr inbounds i8, ptr %206, i64 1
  %216 = load i8, ptr %215, align 1, !tbaa !41
  %217 = zext i8 %216 to i64
  %218 = shl nuw nsw i64 %217, 8
  %219 = or i64 %218, %214
  %220 = getelementptr inbounds i8, ptr %206, i64 2
  %221 = load i8, ptr %220, align 1, !tbaa !41
  %222 = zext i8 %221 to i64
  %223 = shl nuw nsw i64 %222, 16
  %224 = or i64 %219, %223
  %225 = getelementptr inbounds i8, ptr %206, i64 3
  %226 = load i8, ptr %225, align 1, !tbaa !41
  %227 = zext i8 %226 to i64
  %228 = shl nuw nsw i64 %227, 24
  %229 = or i64 %224, %228
  %230 = getelementptr inbounds i8, ptr %206, i64 4
  %231 = load i8, ptr %230, align 1, !tbaa !41
  %232 = zext i8 %231 to i64
  %233 = shl nuw nsw i64 %232, 32
  %234 = or i64 %229, %233
  %235 = getelementptr inbounds i8, ptr %206, i64 5
  %236 = load i8, ptr %235, align 1, !tbaa !41
  %237 = zext i8 %236 to i64
  %238 = shl nuw nsw i64 %237, 40
  %239 = or i64 %234, %238
  %240 = getelementptr inbounds i8, ptr %206, i64 6
  %241 = load i8, ptr %240, align 1, !tbaa !41
  %242 = zext i8 %241 to i64
  %243 = shl nuw nsw i64 %242, 48
  %244 = or i64 %239, %243
  %245 = getelementptr inbounds i8, ptr %206, i64 7
  %246 = load i8, ptr %245, align 1, !tbaa !41
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
  %257 = load i8, ptr %256, align 1, !tbaa !41
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
  %273 = load i8, ptr %266, align 1, !tbaa !41
  %274 = zext i8 %273 to i64
  %275 = getelementptr inbounds i8, ptr %266, i64 1
  %276 = load i8, ptr %275, align 1, !tbaa !41
  %277 = zext i8 %276 to i64
  %278 = shl nuw nsw i64 %277, 8
  %279 = or i64 %278, %274
  %280 = getelementptr inbounds i8, ptr %266, i64 2
  %281 = load i8, ptr %280, align 1, !tbaa !41
  %282 = zext i8 %281 to i64
  %283 = shl nuw nsw i64 %282, 16
  %284 = or i64 %279, %283
  %285 = getelementptr inbounds i8, ptr %266, i64 3
  %286 = load i8, ptr %285, align 1, !tbaa !41
  %287 = zext i8 %286 to i64
  %288 = shl nuw nsw i64 %287, 24
  %289 = or i64 %284, %288
  %290 = getelementptr inbounds i8, ptr %266, i64 4
  %291 = load i8, ptr %290, align 1, !tbaa !41
  %292 = zext i8 %291 to i64
  %293 = shl nuw nsw i64 %292, 32
  %294 = or i64 %289, %293
  %295 = getelementptr inbounds i8, ptr %266, i64 5
  %296 = load i8, ptr %295, align 1, !tbaa !41
  %297 = zext i8 %296 to i64
  %298 = shl nuw nsw i64 %297, 40
  %299 = or i64 %294, %298
  %300 = getelementptr inbounds i8, ptr %266, i64 6
  %301 = load i8, ptr %300, align 1, !tbaa !41
  %302 = zext i8 %301 to i64
  %303 = shl nuw nsw i64 %302, 48
  %304 = or i64 %299, %303
  %305 = getelementptr inbounds i8, ptr %266, i64 7
  %306 = load i8, ptr %305, align 1, !tbaa !41
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
  %317 = load i8, ptr %316, align 1, !tbaa !41
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
  %333 = load i8, ptr %326, align 1, !tbaa !41
  %334 = zext i8 %333 to i64
  %335 = getelementptr inbounds i8, ptr %326, i64 1
  %336 = load i8, ptr %335, align 1, !tbaa !41
  %337 = zext i8 %336 to i64
  %338 = shl nuw nsw i64 %337, 8
  %339 = or i64 %338, %334
  %340 = getelementptr inbounds i8, ptr %326, i64 2
  %341 = load i8, ptr %340, align 1, !tbaa !41
  %342 = zext i8 %341 to i64
  %343 = shl nuw nsw i64 %342, 16
  %344 = or i64 %339, %343
  %345 = getelementptr inbounds i8, ptr %326, i64 3
  %346 = load i8, ptr %345, align 1, !tbaa !41
  %347 = zext i8 %346 to i64
  %348 = shl nuw nsw i64 %347, 24
  %349 = or i64 %344, %348
  %350 = getelementptr inbounds i8, ptr %326, i64 4
  %351 = load i8, ptr %350, align 1, !tbaa !41
  %352 = zext i8 %351 to i64
  %353 = shl nuw nsw i64 %352, 32
  %354 = or i64 %349, %353
  %355 = getelementptr inbounds i8, ptr %326, i64 5
  %356 = load i8, ptr %355, align 1, !tbaa !41
  %357 = zext i8 %356 to i64
  %358 = shl nuw nsw i64 %357, 40
  %359 = or i64 %354, %358
  %360 = getelementptr inbounds i8, ptr %326, i64 6
  %361 = load i8, ptr %360, align 1, !tbaa !41
  %362 = zext i8 %361 to i64
  %363 = shl nuw nsw i64 %362, 48
  %364 = or i64 %359, %363
  %365 = getelementptr inbounds i8, ptr %326, i64 7
  %366 = load i8, ptr %365, align 1, !tbaa !41
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
  %377 = load i8, ptr %376, align 1, !tbaa !41
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
  %393 = load i8, ptr %386, align 1, !tbaa !41
  %394 = zext i8 %393 to i64
  %395 = getelementptr inbounds i8, ptr %386, i64 1
  %396 = load i8, ptr %395, align 1, !tbaa !41
  %397 = zext i8 %396 to i64
  %398 = shl nuw nsw i64 %397, 8
  %399 = or i64 %398, %394
  %400 = getelementptr inbounds i8, ptr %386, i64 2
  %401 = load i8, ptr %400, align 1, !tbaa !41
  %402 = zext i8 %401 to i64
  %403 = shl nuw nsw i64 %402, 16
  %404 = or i64 %399, %403
  %405 = getelementptr inbounds i8, ptr %386, i64 3
  %406 = load i8, ptr %405, align 1, !tbaa !41
  %407 = zext i8 %406 to i64
  %408 = shl nuw nsw i64 %407, 24
  %409 = or i64 %404, %408
  %410 = getelementptr inbounds i8, ptr %386, i64 4
  %411 = load i8, ptr %410, align 1, !tbaa !41
  %412 = zext i8 %411 to i64
  %413 = shl nuw nsw i64 %412, 32
  %414 = or i64 %409, %413
  %415 = getelementptr inbounds i8, ptr %386, i64 5
  %416 = load i8, ptr %415, align 1, !tbaa !41
  %417 = zext i8 %416 to i64
  %418 = shl nuw nsw i64 %417, 40
  %419 = or i64 %414, %418
  %420 = getelementptr inbounds i8, ptr %386, i64 6
  %421 = load i8, ptr %420, align 1, !tbaa !41
  %422 = zext i8 %421 to i64
  %423 = shl nuw nsw i64 %422, 48
  %424 = or i64 %419, %423
  %425 = getelementptr inbounds i8, ptr %386, i64 7
  %426 = load i8, ptr %425, align 1, !tbaa !41
  %427 = zext i8 %426 to i64
  %428 = shl nuw i64 %427, 56
  %429 = or i64 %424, %428
  br label %443

430:                                              ; preds = %430, %390
  %431 = phi i32 [ %441, %430 ], [ 0, %390 ]
  %432 = phi i64 [ %440, %430 ], [ 0, %390 ]
  %433 = zext i32 %431 to i64
  %434 = getelementptr inbounds i8, ptr %386, i64 %433
  %435 = load i8, ptr %434, align 1, !tbaa !41
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
  %450 = tail call <2 x i64> @__ockl_hostcall_preview(i32 noundef 2, i64 noundef %449, i64 noundef %88, i64 noundef %148, i64 noundef %208, i64 noundef %268, i64 noundef %328, i64 noundef %388, i64 noundef %444) #20
  %451 = sub i64 %18, %26
  %452 = getelementptr inbounds i8, ptr %19, i64 %26
  %453 = icmp eq i64 %451, 0
  br i1 %453, label %454, label %17

454:                                              ; preds = %443, %9
  %455 = phi <2 x i64> [ %12, %9 ], [ %450, %443 ]
  %456 = extractelement <2 x i64> %455, i64 0
  ret i64 %456
}

; Function Attrs: convergent mustprogress nofree norecurse nosync nounwind readnone willreturn
define internal i64 @__ockl_get_local_size(i32 noundef %0) #6 {
  switch i32 %0, label %76 [
    i32 0, label %2
    i32 1, label %26
    i32 2, label %51
  ]

2:                                                ; preds = %1
  %3 = load i32, ptr addrspace(4) @__oclc_ABI_version, align 4, !tbaa !19
  %4 = icmp slt i32 %3, 500
  br i1 %4, label %5, label %17

5:                                                ; preds = %2
  %6 = tail call align 4 dereferenceable(64) ptr addrspace(4) @llvm.amdgcn.dispatch.ptr()
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %8 = getelementptr i8, ptr addrspace(4) %6, i64 4
  %9 = load i16, ptr addrspace(4) %8, align 4, !range !29, !invariant.load !30
  %10 = zext i16 %9 to i32
  %11 = getelementptr inbounds %0, ptr addrspace(4) %6, i64 0, i32 6
  %12 = load i32, ptr addrspace(4) %11, align 4, !tbaa !23
  %13 = mul i32 %7, %10
  %14 = sub i32 %12, %13
  %15 = tail call i32 @llvm.umin.i32(i32 %14, i32 %10)
  %16 = zext i32 %15 to i64
  br label %76

17:                                               ; preds = %2
  %18 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %19 = tail call ptr addrspace(4) @llvm.amdgcn.implicitarg.ptr()
  %20 = load i32, ptr addrspace(4) %19, align 4, !tbaa !19
  %21 = icmp ult i32 %18, %20
  %22 = select i1 %21, i64 6, i64 9
  %23 = getelementptr inbounds i16, ptr addrspace(4) %19, i64 %22
  %24 = load i16, ptr addrspace(4) %23, align 2, !tbaa !31
  %25 = zext i16 %24 to i64
  br label %76

26:                                               ; preds = %1
  %27 = load i32, ptr addrspace(4) @__oclc_ABI_version, align 4, !tbaa !19
  %28 = icmp slt i32 %27, 500
  br i1 %28, label %29, label %41

29:                                               ; preds = %26
  %30 = tail call align 4 dereferenceable(64) ptr addrspace(4) @llvm.amdgcn.dispatch.ptr()
  %31 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %32 = getelementptr i8, ptr addrspace(4) %30, i64 6
  %33 = load i16, ptr addrspace(4) %32, align 2, !range !29, !invariant.load !30
  %34 = zext i16 %33 to i32
  %35 = getelementptr inbounds %0, ptr addrspace(4) %30, i64 0, i32 7
  %36 = load i32, ptr addrspace(4) %35, align 8, !tbaa !32
  %37 = mul i32 %31, %34
  %38 = sub i32 %36, %37
  %39 = tail call i32 @llvm.umin.i32(i32 %38, i32 %34)
  %40 = zext i32 %39 to i64
  br label %76

41:                                               ; preds = %26
  %42 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %43 = tail call ptr addrspace(4) @llvm.amdgcn.implicitarg.ptr()
  %44 = getelementptr inbounds i32, ptr addrspace(4) %43, i64 1
  %45 = load i32, ptr addrspace(4) %44, align 4, !tbaa !19
  %46 = icmp ult i32 %42, %45
  %47 = select i1 %46, i64 7, i64 10
  %48 = getelementptr inbounds i16, ptr addrspace(4) %43, i64 %47
  %49 = load i16, ptr addrspace(4) %48, align 2, !tbaa !31
  %50 = zext i16 %49 to i64
  br label %76

51:                                               ; preds = %1
  %52 = load i32, ptr addrspace(4) @__oclc_ABI_version, align 4, !tbaa !19
  %53 = icmp slt i32 %52, 500
  br i1 %53, label %54, label %66

54:                                               ; preds = %51
  %55 = tail call align 4 dereferenceable(64) ptr addrspace(4) @llvm.amdgcn.dispatch.ptr()
  %56 = tail call i32 @llvm.amdgcn.workgroup.id.z()
  %57 = getelementptr i8, ptr addrspace(4) %55, i64 8
  %58 = load i16, ptr addrspace(4) %57, align 4, !range !29, !invariant.load !30
  %59 = zext i16 %58 to i32
  %60 = getelementptr inbounds %0, ptr addrspace(4) %55, i64 0, i32 8
  %61 = load i32, ptr addrspace(4) %60, align 4, !tbaa !33
  %62 = mul i32 %56, %59
  %63 = sub i32 %61, %62
  %64 = tail call i32 @llvm.umin.i32(i32 %63, i32 %59)
  %65 = zext i32 %64 to i64
  br label %76

66:                                               ; preds = %51
  %67 = tail call i32 @llvm.amdgcn.workgroup.id.z()
  %68 = tail call ptr addrspace(4) @llvm.amdgcn.implicitarg.ptr()
  %69 = getelementptr inbounds i32, ptr addrspace(4) %68, i64 2
  %70 = load i32, ptr addrspace(4) %69, align 4, !tbaa !19
  %71 = icmp ult i32 %67, %70
  %72 = select i1 %71, i64 8, i64 11
  %73 = getelementptr inbounds i16, ptr addrspace(4) %68, i64 %72
  %74 = load i16, ptr addrspace(4) %73, align 2, !tbaa !31
  %75 = zext i16 %74 to i64
  br label %76

76:                                               ; preds = %66, %54, %41, %29, %17, %5, %1
  %77 = phi i64 [ 1, %1 ], [ %16, %5 ], [ %25, %17 ], [ %40, %29 ], [ %50, %41 ], [ %65, %54 ], [ %75, %66 ]
  ret i64 %77
}

; Function Attrs: nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #7

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.umin.i32(i32, i32) #19

; Function Attrs: nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #7

; Function Attrs: nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.z() #7

; Function Attrs: convergent mustprogress nofree norecurse nosync nounwind readnone willreturn
define internal i64 @__ockl_get_group_id(i32 noundef %0) #6 {
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

attributes #0 = { convergent mustprogress noinline nounwind "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx90a" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot3-insts,+dot4-insts,+dot5-insts,+dot6-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+gfx90a-insts,+mai-insts,+s-memrealtime,+s-memtime-inst" }
attributes #1 = { argmemonly nocallback nofree nosync nounwind willreturn }
attributes #2 = { argmemonly nocallback nofree nounwind willreturn }
attributes #3 = { cold noreturn nounwind }
attributes #4 = { convergent mustprogress norecurse nounwind "amdgpu-flat-work-group-size"="1,1024" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx90a" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot3-insts,+dot4-insts,+dot5-insts,+dot6-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+gfx90a-insts,+mai-insts,+s-memrealtime,+s-memtime-inst" "uniform-work-group-size"="true" }
attributes #5 = { convergent mustprogress nounwind "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx90a" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot3-insts,+dot4-insts,+dot5-insts,+dot6-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+gfx90a-insts,+mai-insts,+s-memrealtime,+s-memtime-inst" }
attributes #6 = { convergent mustprogress nofree norecurse nosync nounwind readnone willreturn "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" }
attributes #7 = { nounwind readnone speculatable willreturn }
attributes #8 = { convergent norecurse nounwind "frame-pointer"="none" "min-legal-vector-width"="128" "no-trapping-math"="true" "stack-protector-buffer-size"="8" }
attributes #9 = { convergent noinline norecurse nounwind optnone "frame-pointer"="none" "min-legal-vector-width"="128" "no-trapping-math"="true" "stack-protector-buffer-size"="8" }
attributes #10 = { alwaysinline convergent mustprogress nofree norecurse nosync nounwind readnone willreturn "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" }
attributes #11 = { convergent norecurse nounwind "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" }
attributes #12 = { convergent nounwind readnone willreturn }
attributes #13 = { argmemonly convergent mustprogress nofree norecurse nosync nounwind readonly willreturn "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" }
attributes #14 = { convergent mustprogress nofree norecurse nounwind willreturn "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" }
attributes #15 = { nounwind willreturn }
attributes #16 = { nounwind }
attributes #17 = { nounwind readonly }
attributes #18 = { nounwind readnone willreturn }
attributes #19 = { nocallback nofree nosync nounwind readnone speculatable willreturn }
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
!20 = !{!"int", !21, i64 0}
!21 = !{!"omnipotent char", !22, i64 0}
!22 = !{!"Simple C/C++ TBAA"}
!23 = !{!24, !20, i64 12}
!24 = !{!"hsa_kernel_dispatch_packet_s", !25, i64 0, !25, i64 2, !25, i64 4, !25, i64 6, !25, i64 8, !25, i64 10, !20, i64 12, !20, i64 16, !20, i64 20, !20, i64 24, !20, i64 28, !26, i64 32, !27, i64 40, !26, i64 48, !28, i64 56}
!25 = !{!"short", !21, i64 0}
!26 = !{!"long", !21, i64 0}
!27 = !{!"any pointer", !21, i64 0}
!28 = !{!"hsa_signal_s", !26, i64 0}
!29 = !{i16 1, i16 1025}
!30 = !{}
!31 = !{!25, !25, i64 0}
!32 = !{!24, !20, i64 16}
!33 = !{!24, !20, i64 20}
!34 = !{i32 0, i32 1024}
!35 = !{!26, !26, i64 0}
!36 = !{!27, !27, i64 0}
!37 = !{!38, !27, i64 0}
!38 = !{!"", !27, i64 0, !27, i64 8, !28, i64 16, !26, i64 24, !26, i64 32, !26, i64 40}
!39 = !{!38, !26, i64 40}
!40 = !{!38, !27, i64 8}
!41 = !{!21, !21, i64 0}
!42 = !{!43, !43, i64 0}
!43 = !{!"bool", !21, i64 0}
!44 = !{i64 2662}
!45 = !{!"exec"}
!46 = !{!47, !20, i64 16}
!47 = !{!"", !26, i64 0, !26, i64 8, !20, i64 16, !20, i64 20}
!48 = !{!47, !26, i64 8}
!49 = !{!47, !20, i64 20}
!50 = !{!47, !26, i64 0}
!51 = !{!52, !26, i64 16}
!52 = !{!"amd_signal_s", !26, i64 0, !21, i64 8, !26, i64 16, !20, i64 24, !20, i64 28, !26, i64 32, !26, i64 40, !21, i64 48, !21, i64 56}
!53 = !{!52, !20, i64 24}

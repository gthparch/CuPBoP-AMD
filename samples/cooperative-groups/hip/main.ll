
; __CLANG_OFFLOAD_BUNDLE____START__ hip-amdgcn-amd-amdhsa-gfx90a
; ModuleID = 'main.cpp'
source_filename = "main.cpp"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%0 = type { i16, i16, i16, i16, i16, i16, i32, i32, i32, i32, i32, i64, ptr addrspace(1), i64, %1 }
%1 = type { i64 }
%2 = type { ptr addrspace(1), i32, i32, i64, i64 }
%3 = type { ptr addrspace(1), ptr addrspace(1), %1, i64, i64, i64 }
%4 = type { i64, i64, i32, i32 }
%5 = type { [64 x [8 x i64]] }
%6 = type { i64, %1, i64, i32, i32, i64, i64, %7, [2 x i32] }
%7 = type { ptr addrspace(1) }
%struct.__HIP_Coordinates = type { i8 }
%"struct.__HIP_Coordinates<__HIP_BlockIdx>::__X" = type { i8 }
%struct.__HIP_Coordinates.0 = type { i8 }
%"struct.__HIP_Coordinates<__HIP_BlockDim>::__X" = type { i8 }
%struct.__HIP_Coordinates.1 = type { i8 }
%"struct.__HIP_Coordinates<__HIP_ThreadIdx>::__X" = type { i8 }
%struct.__HIP_Coordinates.2 = type { i8 }
%"struct.__HIP_Coordinates<__HIP_GridDim>::__X" = type { i8 }
%"struct.cooperative_groups::thread_group::_coalesced_info" = type { i64, i32, %"struct.cooperative_groups::thread_group::_tiled_info" }
%"struct.cooperative_groups::thread_group::_tiled_info" = type { i8, i32 }
%"class.cooperative_groups::thread_group" = type { i32, i32, i64, %"struct.cooperative_groups::thread_group::_coalesced_info" }
%"class.cooperative_groups::thread_block" = type { %"class.cooperative_groups::thread_group" }
%struct.HIP_vector_type = type { %struct.HIP_vector_base }
%struct.HIP_vector_base = type { %union.anon }
%union.anon = type { <4 x i32> }
%struct.anon = type { i32, i32, i32, i32 }
%struct.__HIP_BlockIdx = type { i8 }
%struct.__HIP_BlockDim = type { i8 }
%struct.__HIP_ThreadIdx = type { i8 }

$_ZNK17__HIP_CoordinatesI14__HIP_BlockIdxE3__XcvjEv = comdat any

$_ZNK17__HIP_CoordinatesI14__HIP_BlockDimE3__XcvjEv = comdat any

$_ZNK17__HIP_CoordinatesI15__HIP_ThreadIdxE3__XcvjEv = comdat any

$_ZmlN17__HIP_CoordinatesI14__HIP_BlockDimE3__XENS_I13__HIP_GridDimE3__XE = comdat any

$_Z9atomicAddPii = comdat any

$_Z13__syncthreadsv = comdat any

$_ZNK14__HIP_BlockIdxclEj = comdat any

$_ZNK14__HIP_BlockDimclEj = comdat any

$_ZNK15__HIP_ThreadIdxclEj = comdat any

$_ZN17__HIP_CoordinatesI14__HIP_BlockIdxE1xE = comdat any

$_ZN17__HIP_CoordinatesI14__HIP_BlockDimE1xE = comdat any

$_ZN17__HIP_CoordinatesI15__HIP_ThreadIdxE1xE = comdat any

$_ZN17__HIP_CoordinatesI13__HIP_GridDimE1xE = comdat any

@__const.__assert_fail.fmt = private unnamed_addr addrspace(4) constant [47 x i8] c"%s:%u: %s: Device-side assertion `%s' failed.\0A\00", align 16
@_ZL8blockIdx = internal addrspace(4) constant %struct.__HIP_Coordinates undef, align 1
@_ZN17__HIP_CoordinatesI14__HIP_BlockIdxE1xE = weak protected addrspace(4) externally_initialized constant %"struct.__HIP_Coordinates<__HIP_BlockIdx>::__X" undef, comdat, align 1
@_ZL8blockDim = internal addrspace(4) constant %struct.__HIP_Coordinates.0 undef, align 1
@_ZN17__HIP_CoordinatesI14__HIP_BlockDimE1xE = weak protected addrspace(4) externally_initialized constant %"struct.__HIP_Coordinates<__HIP_BlockDim>::__X" undef, comdat, align 1
@_ZL9threadIdx = internal addrspace(4) constant %struct.__HIP_Coordinates.1 undef, align 1
@_ZN17__HIP_CoordinatesI15__HIP_ThreadIdxE1xE = weak protected addrspace(4) externally_initialized constant %"struct.__HIP_Coordinates<__HIP_ThreadIdx>::__X" undef, comdat, align 1
@_ZL7gridDim = internal addrspace(4) constant %struct.__HIP_Coordinates.2 undef, align 1
@_ZN17__HIP_CoordinatesI13__HIP_GridDimE1xE = weak protected addrspace(4) externally_initialized constant %"struct.__HIP_Coordinates<__HIP_GridDim>::__X" undef, comdat, align 1
@temp = external hidden addrspace(3) global [0 x i32], align 4
@.str = private unnamed_addr addrspace(4) constant [42 x i8] c"false && \22invalid cooperative group type\22\00", align 1
@.str.1 = private unnamed_addr addrspace(4) constant [68 x i8] c"/opt/rocm-5.2.0/include/hip/amd_detail/amd_hip_cooperative_groups.h\00", align 1
@__PRETTY_FUNCTION__._ZNK18cooperative_groups12thread_group11thread_rankEv = private unnamed_addr addrspace(4) constant [63 x i8] c"uint32_t cooperative_groups::thread_group::thread_rank() const\00", align 1
@__PRETTY_FUNCTION__._ZNK18cooperative_groups12thread_group4syncEv = private unnamed_addr addrspace(4) constant [52 x i8] c"void cooperative_groups::thread_group::sync() const\00", align 1
@.str.2 = private unnamed_addr addrspace(4) constant [6 x i8] c"agent\00", align 1
@llvm.compiler.used = appending addrspace(1) global [4 x ptr] [ptr addrspacecast (ptr addrspace(4) @_ZN17__HIP_CoordinatesI14__HIP_BlockIdxE1xE to ptr), ptr addrspacecast (ptr addrspace(4) @_ZN17__HIP_CoordinatesI14__HIP_BlockDimE1xE to ptr), ptr addrspacecast (ptr addrspace(4) @_ZN17__HIP_CoordinatesI15__HIP_ThreadIdxE1xE to ptr), ptr addrspacecast (ptr addrspace(4) @_ZN17__HIP_CoordinatesI13__HIP_GridDimE1xE to ptr)], section "llvm.metadata"
@__oclc_wavefrontsize64 = internal local_unnamed_addr addrspace(4) constant i8 1, align 1
@__oclc_ABI_version = internal local_unnamed_addr addrspace(4) constant i32 400, align 4

; Function Attrs: convergent mustprogress noinline noreturn nounwind optnone
define weak void @__cxa_pure_virtual() #0 {
  call void @llvm.trap()
  unreachable
}

; Function Attrs: cold noreturn nounwind
declare void @llvm.trap() #1

; Function Attrs: convergent mustprogress noinline noreturn nounwind optnone
define weak void @__cxa_deleted_virtual() #0 {
  call void @llvm.trap()
  unreachable
}

; Function Attrs: convergent mustprogress noinline nounwind optnone
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
  store ptr %0, ptr %16, align 8
  store ptr %1, ptr %17, align 8
  store i32 %2, ptr %18, align 4
  store ptr %3, ptr %19, align 8
  call void @llvm.memcpy.p0.p4.i64(ptr align 16 %20, ptr addrspace(4) align 16 @__const.__assert_fail.fmt, i64 47, i1 false)
  %27 = call i64 @__ockl_fprintf_stderr_begin() #24
  store i64 %27, ptr %21, align 8
  store i32 0, ptr %22, align 4
  br label %28

28:                                               ; preds = %4
  %29 = getelementptr inbounds [47 x i8], ptr %20, i64 0, i64 0
  store ptr %29, ptr %23, align 8
  br label %30

30:                                               ; preds = %35, %28
  %31 = load ptr, ptr %23, align 8
  %32 = getelementptr inbounds i8, ptr %31, i32 1
  store ptr %32, ptr %23, align 8
  %33 = load i8, ptr %31, align 1
  %34 = icmp ne i8 %33, 0
  br i1 %34, label %35, label %36

35:                                               ; preds = %30
  br label %30, !llvm.loop !5

36:                                               ; preds = %30
  %37 = load ptr, ptr %23, align 8
  %38 = getelementptr inbounds [47 x i8], ptr %20, i64 0, i64 0
  %39 = ptrtoint ptr %37 to i64
  %40 = ptrtoint ptr %38 to i64
  %41 = sub i64 %39, %40
  %42 = trunc i64 %41 to i32
  store i32 %42, ptr %22, align 4
  br label %43

43:                                               ; preds = %36
  %44 = load i64, ptr %21, align 8
  %45 = getelementptr inbounds [47 x i8], ptr %20, i64 0, i64 0
  %46 = load i32, ptr %22, align 4
  %47 = sext i32 %46 to i64
  %48 = call i64 @__ockl_fprintf_append_string_n(i64 noundef %44, ptr noundef %45, i64 noundef %47, i32 noundef 0) #24
  store i64 %48, ptr %21, align 8
  br label %49

49:                                               ; preds = %43
  %50 = load ptr, ptr %17, align 8
  store ptr %50, ptr %24, align 8
  br label %51

51:                                               ; preds = %56, %49
  %52 = load ptr, ptr %24, align 8
  %53 = getelementptr inbounds i8, ptr %52, i32 1
  store ptr %53, ptr %24, align 8
  %54 = load i8, ptr %52, align 1
  %55 = icmp ne i8 %54, 0
  br i1 %55, label %56, label %57

56:                                               ; preds = %51
  br label %51, !llvm.loop !7

57:                                               ; preds = %51
  %58 = load ptr, ptr %24, align 8
  %59 = load ptr, ptr %17, align 8
  %60 = ptrtoint ptr %58 to i64
  %61 = ptrtoint ptr %59 to i64
  %62 = sub i64 %60, %61
  %63 = trunc i64 %62 to i32
  store i32 %63, ptr %22, align 4
  br label %64

64:                                               ; preds = %57
  %65 = load i64, ptr %21, align 8
  %66 = load ptr, ptr %17, align 8
  %67 = load i32, ptr %22, align 4
  %68 = sext i32 %67 to i64
  %69 = call i64 @__ockl_fprintf_append_string_n(i64 noundef %65, ptr noundef %66, i64 noundef %68, i32 noundef 0) #24
  store i64 %69, ptr %21, align 8
  %70 = load i64, ptr %21, align 8
  %71 = load i32, ptr %18, align 4
  %72 = zext i32 %71 to i64
  %73 = call i64 @__ockl_fprintf_append_args(i64 noundef %70, i32 noundef 1, i64 noundef %72, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i32 noundef 0) #24
  store i64 %73, ptr %21, align 8
  br label %74

74:                                               ; preds = %64
  %75 = load ptr, ptr %19, align 8
  store ptr %75, ptr %25, align 8
  br label %76

76:                                               ; preds = %81, %74
  %77 = load ptr, ptr %25, align 8
  %78 = getelementptr inbounds i8, ptr %77, i32 1
  store ptr %78, ptr %25, align 8
  %79 = load i8, ptr %77, align 1
  %80 = icmp ne i8 %79, 0
  br i1 %80, label %81, label %82

81:                                               ; preds = %76
  br label %76, !llvm.loop !8

82:                                               ; preds = %76
  %83 = load ptr, ptr %25, align 8
  %84 = load ptr, ptr %19, align 8
  %85 = ptrtoint ptr %83 to i64
  %86 = ptrtoint ptr %84 to i64
  %87 = sub i64 %85, %86
  %88 = trunc i64 %87 to i32
  store i32 %88, ptr %22, align 4
  br label %89

89:                                               ; preds = %82
  %90 = load i64, ptr %21, align 8
  %91 = load ptr, ptr %19, align 8
  %92 = load i32, ptr %22, align 4
  %93 = sext i32 %92 to i64
  %94 = call i64 @__ockl_fprintf_append_string_n(i64 noundef %90, ptr noundef %91, i64 noundef %93, i32 noundef 0) #24
  store i64 %94, ptr %21, align 8
  br label %95

95:                                               ; preds = %89
  %96 = load ptr, ptr %16, align 8
  store ptr %96, ptr %26, align 8
  br label %97

97:                                               ; preds = %102, %95
  %98 = load ptr, ptr %26, align 8
  %99 = getelementptr inbounds i8, ptr %98, i32 1
  store ptr %99, ptr %26, align 8
  %100 = load i8, ptr %98, align 1
  %101 = icmp ne i8 %100, 0
  br i1 %101, label %102, label %103

102:                                              ; preds = %97
  br label %97, !llvm.loop !9

103:                                              ; preds = %97
  %104 = load ptr, ptr %26, align 8
  %105 = load ptr, ptr %16, align 8
  %106 = ptrtoint ptr %104 to i64
  %107 = ptrtoint ptr %105 to i64
  %108 = sub i64 %106, %107
  %109 = trunc i64 %108 to i32
  store i32 %109, ptr %22, align 4
  br label %110

110:                                              ; preds = %103
  %111 = load i64, ptr %21, align 8
  %112 = load ptr, ptr %16, align 8
  %113 = load i32, ptr %22, align 4
  %114 = sext i32 %113 to i64
  %115 = call i64 @__ockl_fprintf_append_string_n(i64 noundef %111, ptr noundef %112, i64 noundef %114, i32 noundef 1) #24
  call void @llvm.trap()
  ret void
}

; Function Attrs: argmemonly nocallback nofree nounwind willreturn
declare void @llvm.memcpy.p0.p4.i64(ptr noalias nocapture writeonly, ptr addrspace(4) noalias nocapture readonly, i64, i1 immarg) #3

; Function Attrs: convergent mustprogress noinline nounwind optnone
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
  store ptr %0, ptr %11, align 8
  store ptr %1, ptr %12, align 8
  store i32 %2, ptr %13, align 4
  store ptr %3, ptr %14, align 8
  store i64 %4, ptr %15, align 8
  call void @llvm.trap()
  ret void
}

; Function Attrs: convergent mustprogress noinline nounwind optnone
define hidden noundef i32 @_ZN18cooperative_groups8internal15coalesced_group16masked_bit_countEyj(i64 noundef %0, i32 noundef %1) #2 {
  %3 = alloca i32, align 4, addrspace(5)
  %4 = alloca i64, align 8, addrspace(5)
  %5 = alloca i32, align 4, addrspace(5)
  %6 = alloca i32, align 4, addrspace(5)
  %7 = addrspacecast ptr addrspace(5) %3 to ptr
  %8 = addrspacecast ptr addrspace(5) %4 to ptr
  %9 = addrspacecast ptr addrspace(5) %5 to ptr
  %10 = addrspacecast ptr addrspace(5) %6 to ptr
  store i64 %0, ptr %8, align 8
  store i32 %1, ptr %9, align 4
  store i32 0, ptr %10, align 4
  %11 = load i64, ptr %8, align 8
  %12 = trunc i64 %11 to i32
  %13 = load i32, ptr %9, align 4
  %14 = call i32 @llvm.amdgcn.mbcnt.lo(i32 %12, i32 %13)
  store i32 %14, ptr %10, align 4
  %15 = load i64, ptr %8, align 8
  %16 = lshr i64 %15, 32
  %17 = trunc i64 %16 to i32
  %18 = load i32, ptr %10, align 4
  %19 = call i32 @llvm.amdgcn.mbcnt.hi(i32 %17, i32 %18)
  store i32 %19, ptr %10, align 4
  %20 = load i32, ptr %10, align 4
  ret i32 %20
}

; Function Attrs: nounwind readnone willreturn
declare i32 @llvm.amdgcn.mbcnt.lo(i32, i32) #4

; Function Attrs: nounwind readnone willreturn
declare i32 @llvm.amdgcn.mbcnt.hi(i32, i32) #4

; Function Attrs: convergent mustprogress noinline nounwind optnone
define hidden noundef i32 @_Z7cg_rankN18cooperative_groups12thread_groupE(i32 %0, i32 %1, i64 %2, %"struct.cooperative_groups::thread_group::_coalesced_info" %3) #2 {
  %5 = alloca i32, align 4, addrspace(5)
  %6 = alloca i32, align 4, addrspace(5)
  %7 = alloca i32, align 4, addrspace(5)
  %8 = alloca i32, align 4, addrspace(5)
  %9 = alloca i32, align 4, addrspace(5)
  %10 = alloca i32, align 4, addrspace(5)
  %11 = alloca i32, align 4, addrspace(5)
  %12 = alloca i32, align 4, addrspace(5)
  %13 = alloca ptr, align 8, addrspace(5)
  %14 = alloca i32, align 4, addrspace(5)
  %15 = alloca ptr, align 8, addrspace(5)
  %16 = alloca i32, align 4, addrspace(5)
  %17 = alloca ptr, align 8, addrspace(5)
  %18 = alloca i32, align 4, addrspace(5)
  %19 = alloca ptr, align 8, addrspace(5)
  %20 = alloca i32, align 4, addrspace(5)
  %21 = alloca ptr, align 8, addrspace(5)
  %22 = alloca i32, align 4, addrspace(5)
  %23 = alloca ptr, align 8, addrspace(5)
  %24 = alloca i32, align 4, addrspace(5)
  %25 = alloca %"class.cooperative_groups::thread_group", align 8, addrspace(5)
  %26 = addrspacecast ptr addrspace(5) %24 to ptr
  %27 = addrspacecast ptr addrspace(5) %25 to ptr
  %28 = getelementptr inbounds %"class.cooperative_groups::thread_group", ptr %27, i32 0, i32 0
  store i32 %0, ptr %28, align 8
  %29 = getelementptr inbounds %"class.cooperative_groups::thread_group", ptr %27, i32 0, i32 1
  store i32 %1, ptr %29, align 4
  %30 = getelementptr inbounds %"class.cooperative_groups::thread_group", ptr %27, i32 0, i32 2
  store i64 %2, ptr %30, align 8
  %31 = getelementptr inbounds %"class.cooperative_groups::thread_group", ptr %27, i32 0, i32 3
  store %"struct.cooperative_groups::thread_group::_coalesced_info" %3, ptr %31, align 8
  %32 = addrspacecast ptr addrspace(5) %22 to ptr
  %33 = addrspacecast ptr addrspace(5) %23 to ptr
  store ptr %27, ptr %33, align 8
  %34 = load ptr, ptr %33, align 8
  %35 = load i32, ptr %34, align 8
  switch i32 %35, label %133 [
    i32 1, label %36
    i32 2, label %42
    i32 3, label %86
    i32 4, label %103
    i32 5, label %126
  ]

36:                                               ; preds = %4
  %37 = addrspacecast ptr addrspace(5) %20 to ptr
  %38 = addrspacecast ptr addrspace(5) %21 to ptr
  store ptr %34, ptr %38, align 8
  %39 = load ptr, ptr %38, align 8
  %40 = addrspacecast ptr addrspace(5) %11 to ptr
  %41 = call i32 @__ockl_multi_grid_thread_rank() #18
  store i32 %41, ptr %32, align 4
  br label %134

42:                                               ; preds = %4
  %43 = addrspacecast ptr addrspace(5) %18 to ptr
  %44 = addrspacecast ptr addrspace(5) %19 to ptr
  store ptr %34, ptr %44, align 8
  %45 = load ptr, ptr %44, align 8
  %46 = addrspacecast ptr addrspace(5) %7 to ptr
  %47 = addrspacecast ptr addrspace(5) %8 to ptr
  %48 = addrspacecast ptr addrspace(5) %9 to ptr
  %49 = addrspacecast ptr addrspace(5) %10 to ptr
  %50 = call i64 @__ockl_get_group_id(i32 noundef 2) #18
  %51 = call i64 @__ockl_get_num_groups(i32 noundef 1) #18
  %52 = mul i64 %50, %51
  %53 = call i64 @__ockl_get_num_groups(i32 noundef 0) #18
  %54 = mul i64 %52, %53
  %55 = call i64 @__ockl_get_group_id(i32 noundef 1) #18
  %56 = call i64 @__ockl_get_num_groups(i32 noundef 0) #18
  %57 = mul i64 %55, %56
  %58 = add i64 %54, %57
  %59 = call i64 @__ockl_get_group_id(i32 noundef 0) #18
  %60 = add i64 %58, %59
  %61 = trunc i64 %60 to i32
  store i32 %61, ptr %47, align 4
  %62 = load i32, ptr %47, align 4
  %63 = zext i32 %62 to i64
  %64 = call i64 @__ockl_get_local_size(i32 noundef 0) #18
  %65 = call i64 @__ockl_get_local_size(i32 noundef 1) #18
  %66 = mul i64 %64, %65
  %67 = call i64 @__ockl_get_local_size(i32 noundef 2) #18
  %68 = mul i64 %66, %67
  %69 = mul i64 %63, %68
  %70 = trunc i64 %69 to i32
  store i32 %70, ptr %48, align 4
  %71 = call i64 @__ockl_get_local_id(i32 noundef 2) #18
  %72 = call i64 @__ockl_get_local_size(i32 noundef 1) #18
  %73 = mul i64 %71, %72
  %74 = call i64 @__ockl_get_local_size(i32 noundef 0) #18
  %75 = mul i64 %73, %74
  %76 = call i64 @__ockl_get_local_id(i32 noundef 1) #18
  %77 = call i64 @__ockl_get_local_size(i32 noundef 0) #18
  %78 = mul i64 %76, %77
  %79 = add i64 %75, %78
  %80 = call i64 @__ockl_get_local_id(i32 noundef 0) #18
  %81 = add i64 %79, %80
  %82 = trunc i64 %81 to i32
  store i32 %82, ptr %49, align 4
  %83 = load i32, ptr %48, align 4
  %84 = load i32, ptr %49, align 4
  %85 = add i32 %83, %84
  store i32 %85, ptr %32, align 4
  br label %134

86:                                               ; preds = %4
  %87 = addrspacecast ptr addrspace(5) %16 to ptr
  %88 = addrspacecast ptr addrspace(5) %17 to ptr
  store ptr %34, ptr %88, align 8
  %89 = load ptr, ptr %88, align 8
  %90 = addrspacecast ptr addrspace(5) %5 to ptr
  %91 = call i64 @__ockl_get_local_id(i32 noundef 2) #18
  %92 = call i64 @__ockl_get_local_size(i32 noundef 1) #18
  %93 = mul i64 %91, %92
  %94 = call i64 @__ockl_get_local_size(i32 noundef 0) #18
  %95 = mul i64 %93, %94
  %96 = call i64 @__ockl_get_local_id(i32 noundef 1) #18
  %97 = call i64 @__ockl_get_local_size(i32 noundef 0) #18
  %98 = mul i64 %96, %97
  %99 = add i64 %95, %98
  %100 = call i64 @__ockl_get_local_id(i32 noundef 0) #18
  %101 = add i64 %99, %100
  %102 = trunc i64 %101 to i32
  store i32 %102, ptr %32, align 4
  br label %134

103:                                              ; preds = %4
  %104 = addrspacecast ptr addrspace(5) %14 to ptr
  %105 = addrspacecast ptr addrspace(5) %15 to ptr
  store ptr %34, ptr %105, align 8
  %106 = load ptr, ptr %105, align 8
  %107 = addrspacecast ptr addrspace(5) %6 to ptr
  %108 = call i64 @__ockl_get_local_id(i32 noundef 2) #18
  %109 = call i64 @__ockl_get_local_size(i32 noundef 1) #18
  %110 = mul i64 %108, %109
  %111 = call i64 @__ockl_get_local_size(i32 noundef 0) #18
  %112 = mul i64 %110, %111
  %113 = call i64 @__ockl_get_local_id(i32 noundef 1) #18
  %114 = call i64 @__ockl_get_local_size(i32 noundef 0) #18
  %115 = mul i64 %113, %114
  %116 = add i64 %112, %115
  %117 = call i64 @__ockl_get_local_id(i32 noundef 0) #18
  %118 = add i64 %116, %117
  %119 = trunc i64 %118 to i32
  %120 = getelementptr inbounds %"class.cooperative_groups::thread_group", ptr %106, i32 0, i32 3
  %121 = getelementptr inbounds %"struct.cooperative_groups::thread_group::_coalesced_info", ptr %120, i32 0, i32 2
  %122 = getelementptr inbounds %"struct.cooperative_groups::thread_group::_tiled_info", ptr %121, i32 0, i32 1
  %123 = load i32, ptr %122, align 4
  %124 = sub i32 %123, 1
  %125 = and i32 %119, %124
  store i32 %125, ptr %32, align 4
  br label %134

126:                                              ; preds = %4
  %127 = addrspacecast ptr addrspace(5) %12 to ptr
  %128 = addrspacecast ptr addrspace(5) %13 to ptr
  store ptr %34, ptr %128, align 8
  %129 = load ptr, ptr %128, align 8
  %130 = getelementptr inbounds %"class.cooperative_groups::thread_group", ptr %129, i32 0, i32 3
  %131 = load i64, ptr %130, align 8
  %132 = call noundef i32 @_ZN18cooperative_groups8internal15coalesced_group16masked_bit_countEyj(i64 noundef %131, i32 noundef 0) #24
  store i32 %132, ptr %32, align 4
  br label %134

133:                                              ; preds = %4
  call void @__assert_fail(ptr noundef addrspacecast (ptr addrspace(4) @.str to ptr), ptr noundef addrspacecast (ptr addrspace(4) @.str.1 to ptr), i32 noundef 440, ptr noundef addrspacecast (ptr addrspace(4) @__PRETTY_FUNCTION__._ZNK18cooperative_groups12thread_group11thread_rankEv to ptr)) #24
  store i32 -1, ptr %32, align 4
  br label %134

134:                                              ; preds = %36, %42, %86, %103, %126, %133
  %135 = load i32, ptr %32, align 4
  ret i32 %135
}

; Function Attrs: convergent mustprogress noinline nounwind optnone
define hidden void @_Z7cg_syncN18cooperative_groups12thread_groupE(i32 %0, i32 %1, i64 %2, %"struct.cooperative_groups::thread_group::_coalesced_info" %3) #2 {
  %5 = alloca ptr, align 8, addrspace(5)
  %6 = alloca ptr, align 8, addrspace(5)
  %7 = alloca ptr, align 8, addrspace(5)
  %8 = alloca ptr, align 8, addrspace(5)
  %9 = alloca ptr, align 8, addrspace(5)
  %10 = alloca ptr, align 8, addrspace(5)
  %11 = alloca %"class.cooperative_groups::thread_group", align 8, addrspace(5)
  %12 = addrspacecast ptr addrspace(5) %11 to ptr
  %13 = getelementptr inbounds %"class.cooperative_groups::thread_group", ptr %12, i32 0, i32 0
  store i32 %0, ptr %13, align 8
  %14 = getelementptr inbounds %"class.cooperative_groups::thread_group", ptr %12, i32 0, i32 1
  store i32 %1, ptr %14, align 4
  %15 = getelementptr inbounds %"class.cooperative_groups::thread_group", ptr %12, i32 0, i32 2
  store i64 %2, ptr %15, align 8
  %16 = getelementptr inbounds %"class.cooperative_groups::thread_group", ptr %12, i32 0, i32 3
  store %"struct.cooperative_groups::thread_group::_coalesced_info" %3, ptr %16, align 8
  %17 = addrspacecast ptr addrspace(5) %10 to ptr
  store ptr %12, ptr %17, align 8
  %18 = load ptr, ptr %17, align 8
  %19 = load i32, ptr %18, align 8
  switch i32 %19, label %35 [
    i32 1, label %20
    i32 2, label %23
    i32 3, label %26
    i32 4, label %29
    i32 5, label %32
  ]

20:                                               ; preds = %4
  %21 = addrspacecast ptr addrspace(5) %9 to ptr
  store ptr %18, ptr %21, align 8
  %22 = load ptr, ptr %21, align 8
  call void @__ockl_multi_grid_sync() #24
  br label %36

23:                                               ; preds = %4
  %24 = addrspacecast ptr addrspace(5) %8 to ptr
  store ptr %18, ptr %24, align 8
  %25 = load ptr, ptr %24, align 8
  call void @__ockl_grid_sync() #24
  br label %36

26:                                               ; preds = %4
  %27 = addrspacecast ptr addrspace(5) %7 to ptr
  store ptr %18, ptr %27, align 8
  %28 = load ptr, ptr %27, align 8
  call void @_Z13__syncthreadsv() #24
  br label %36

29:                                               ; preds = %4
  %30 = addrspacecast ptr addrspace(5) %6 to ptr
  store ptr %18, ptr %30, align 8
  %31 = load ptr, ptr %30, align 8
  fence syncscope("agent") acq_rel
  br label %36

32:                                               ; preds = %4
  %33 = addrspacecast ptr addrspace(5) %5 to ptr
  store ptr %18, ptr %33, align 8
  %34 = load ptr, ptr %33, align 8
  fence syncscope("agent") acq_rel
  br label %36

35:                                               ; preds = %4
  call void @__assert_fail(ptr noundef addrspacecast (ptr addrspace(4) @.str to ptr), ptr noundef addrspacecast (ptr addrspace(4) @.str.1 to ptr), i32 noundef 493, ptr noundef addrspacecast (ptr addrspace(4) @__PRETTY_FUNCTION__._ZNK18cooperative_groups12thread_group4syncEv to ptr)) #24
  br label %36

36:                                               ; preds = %20, %23, %26, %29, %32, %35
  ret void
}

; Function Attrs: convergent noinline nounwind optnone
define hidden %"class.cooperative_groups::thread_group" @_Z20cg_this_thread_blockv() #5 {
  %1 = alloca ptr, align 8, addrspace(5)
  %2 = alloca i32, align 4, addrspace(5)
  %3 = alloca i32, align 4, addrspace(5)
  %4 = alloca i64, align 8, addrspace(5)
  %5 = alloca ptr, align 8, addrspace(5)
  %6 = alloca i32, align 4, addrspace(5)
  %7 = alloca i32, align 4, addrspace(5)
  %8 = alloca %"class.cooperative_groups::thread_block", align 8, addrspace(5)
  %9 = alloca %"class.cooperative_groups::thread_group", align 8, addrspace(5)
  %10 = alloca %"class.cooperative_groups::thread_block", align 8, addrspace(5)
  %11 = addrspacecast ptr addrspace(5) %9 to ptr
  %12 = addrspacecast ptr addrspace(5) %10 to ptr
  %13 = addrspacecast ptr addrspace(5) %8 to ptr
  %14 = addrspacecast ptr addrspace(5) %7 to ptr
  %15 = call i64 @__ockl_get_local_size(i32 noundef 0) #18
  %16 = call i64 @__ockl_get_local_size(i32 noundef 1) #18
  %17 = mul i64 %15, %16
  %18 = call i64 @__ockl_get_local_size(i32 noundef 2) #18
  %19 = mul i64 %17, %18
  %20 = trunc i64 %19 to i32
  %21 = addrspacecast ptr addrspace(5) %5 to ptr
  %22 = addrspacecast ptr addrspace(5) %6 to ptr
  store ptr %13, ptr %21, align 8
  store i32 %20, ptr %22, align 4
  %23 = load ptr, ptr %21, align 8
  %24 = load i32, ptr %22, align 4
  %25 = addrspacecast ptr addrspace(5) %1 to ptr
  %26 = addrspacecast ptr addrspace(5) %2 to ptr
  %27 = addrspacecast ptr addrspace(5) %3 to ptr
  %28 = addrspacecast ptr addrspace(5) %4 to ptr
  store ptr %23, ptr %25, align 8
  store i32 3, ptr %26, align 4
  store i32 %24, ptr %27, align 4
  store i64 0, ptr %28, align 8
  %29 = load ptr, ptr %25, align 8
  %30 = getelementptr inbounds %"class.cooperative_groups::thread_group", ptr %29, i32 0, i32 3
  %31 = load i32, ptr %26, align 4
  store i32 %31, ptr %29, align 8
  %32 = load i32, ptr %27, align 4
  %33 = getelementptr inbounds %"class.cooperative_groups::thread_group", ptr %29, i32 0, i32 1
  store i32 %32, ptr %33, align 4
  %34 = load i64, ptr %28, align 8
  %35 = getelementptr inbounds %"class.cooperative_groups::thread_group", ptr %29, i32 0, i32 2
  store i64 %34, ptr %35, align 8
  %36 = load %"class.cooperative_groups::thread_block", ptr %13, align 8
  %37 = getelementptr inbounds %"class.cooperative_groups::thread_block", ptr %12, i32 0, i32 0
  %38 = extractvalue %"class.cooperative_groups::thread_block" %36, 0
  store %"class.cooperative_groups::thread_group" %38, ptr %37, align 8
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %11, ptr align 8 %12, i64 40, i1 false)
  %39 = load %"class.cooperative_groups::thread_group", ptr %11, align 8
  ret %"class.cooperative_groups::thread_group" %39
}

; Function Attrs: argmemonly nocallback nofree nounwind willreturn
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #3

; Function Attrs: convergent mustprogress noinline nounwind optnone
define hidden noundef i32 @_Z10reduce_sumN18cooperative_groups12thread_groupEPii(i32 %0, i32 %1, i64 %2, %"struct.cooperative_groups::thread_group::_coalesced_info" %3, ptr noundef %4, i32 noundef %5) #2 {
  %7 = alloca i32, align 4, addrspace(5)
  %8 = alloca ptr, align 8, addrspace(5)
  %9 = alloca i32, align 4, addrspace(5)
  %10 = alloca %"class.cooperative_groups::thread_group", align 8, addrspace(5)
  %11 = alloca ptr, align 8, addrspace(5)
  %12 = alloca i32, align 4, addrspace(5)
  %13 = alloca i32, align 4, addrspace(5)
  %14 = alloca %"class.cooperative_groups::thread_group", align 8, addrspace(5)
  %15 = alloca i32, align 4, addrspace(5)
  %16 = alloca %"class.cooperative_groups::thread_group", align 8, addrspace(5)
  %17 = alloca %"class.cooperative_groups::thread_group", align 8, addrspace(5)
  %18 = addrspacecast ptr addrspace(5) %9 to ptr
  %19 = addrspacecast ptr addrspace(5) %10 to ptr
  %20 = addrspacecast ptr addrspace(5) %11 to ptr
  %21 = addrspacecast ptr addrspace(5) %12 to ptr
  %22 = addrspacecast ptr addrspace(5) %13 to ptr
  %23 = addrspacecast ptr addrspace(5) %14 to ptr
  %24 = addrspacecast ptr addrspace(5) %15 to ptr
  %25 = addrspacecast ptr addrspace(5) %16 to ptr
  %26 = addrspacecast ptr addrspace(5) %17 to ptr
  %27 = getelementptr inbounds %"class.cooperative_groups::thread_group", ptr %19, i32 0, i32 0
  store i32 %0, ptr %27, align 8
  %28 = getelementptr inbounds %"class.cooperative_groups::thread_group", ptr %19, i32 0, i32 1
  store i32 %1, ptr %28, align 4
  %29 = getelementptr inbounds %"class.cooperative_groups::thread_group", ptr %19, i32 0, i32 2
  store i64 %2, ptr %29, align 8
  %30 = getelementptr inbounds %"class.cooperative_groups::thread_group", ptr %19, i32 0, i32 3
  store %"struct.cooperative_groups::thread_group::_coalesced_info" %3, ptr %30, align 8
  store ptr %4, ptr %20, align 8
  store i32 %5, ptr %21, align 4
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %23, ptr align 8 %19, i64 40, i1 false)
  %31 = getelementptr inbounds %"class.cooperative_groups::thread_group", ptr %23, i32 0, i32 0
  %32 = load i32, ptr %31, align 8
  %33 = getelementptr inbounds %"class.cooperative_groups::thread_group", ptr %23, i32 0, i32 1
  %34 = load i32, ptr %33, align 4
  %35 = getelementptr inbounds %"class.cooperative_groups::thread_group", ptr %23, i32 0, i32 2
  %36 = load i64, ptr %35, align 8
  %37 = getelementptr inbounds %"class.cooperative_groups::thread_group", ptr %23, i32 0, i32 3
  %38 = load %"struct.cooperative_groups::thread_group::_coalesced_info", ptr %37, align 8
  %39 = call noundef i32 @_Z7cg_rankN18cooperative_groups12thread_groupE(i32 %32, i32 %34, i64 %36, %"struct.cooperative_groups::thread_group::_coalesced_info" %38) #24
  store i32 %39, ptr %22, align 4
  %40 = addrspacecast ptr addrspace(5) %7 to ptr
  %41 = addrspacecast ptr addrspace(5) %8 to ptr
  store ptr %19, ptr %41, align 8
  %42 = load ptr, ptr %41, align 8
  %43 = getelementptr inbounds %"class.cooperative_groups::thread_group", ptr %42, i32 0, i32 1
  %44 = load i32, ptr %43, align 4
  %45 = udiv i32 %44, 2
  store i32 %45, ptr %24, align 4
  br label %46

46:                                               ; preds = %85, %6
  %47 = load i32, ptr %24, align 4
  %48 = icmp sgt i32 %47, 0
  br i1 %48, label %49, label %88

49:                                               ; preds = %46
  %50 = load i32, ptr %21, align 4
  %51 = load ptr, ptr %20, align 8
  %52 = load i32, ptr %22, align 4
  %53 = sext i32 %52 to i64
  %54 = getelementptr inbounds i32, ptr %51, i64 %53
  store i32 %50, ptr %54, align 4
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %25, ptr align 8 %19, i64 40, i1 false)
  %55 = getelementptr inbounds %"class.cooperative_groups::thread_group", ptr %25, i32 0, i32 0
  %56 = load i32, ptr %55, align 8
  %57 = getelementptr inbounds %"class.cooperative_groups::thread_group", ptr %25, i32 0, i32 1
  %58 = load i32, ptr %57, align 4
  %59 = getelementptr inbounds %"class.cooperative_groups::thread_group", ptr %25, i32 0, i32 2
  %60 = load i64, ptr %59, align 8
  %61 = getelementptr inbounds %"class.cooperative_groups::thread_group", ptr %25, i32 0, i32 3
  %62 = load %"struct.cooperative_groups::thread_group::_coalesced_info", ptr %61, align 8
  call void @_Z7cg_syncN18cooperative_groups12thread_groupE(i32 %56, i32 %58, i64 %60, %"struct.cooperative_groups::thread_group::_coalesced_info" %62) #24
  %63 = load i32, ptr %22, align 4
  %64 = load i32, ptr %24, align 4
  %65 = icmp slt i32 %63, %64
  br i1 %65, label %66, label %76

66:                                               ; preds = %49
  %67 = load ptr, ptr %20, align 8
  %68 = load i32, ptr %22, align 4
  %69 = load i32, ptr %24, align 4
  %70 = add nsw i32 %68, %69
  %71 = sext i32 %70 to i64
  %72 = getelementptr inbounds i32, ptr %67, i64 %71
  %73 = load i32, ptr %72, align 4
  %74 = load i32, ptr %21, align 4
  %75 = add nsw i32 %74, %73
  store i32 %75, ptr %21, align 4
  br label %76

76:                                               ; preds = %66, %49
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %26, ptr align 8 %19, i64 40, i1 false)
  %77 = getelementptr inbounds %"class.cooperative_groups::thread_group", ptr %26, i32 0, i32 0
  %78 = load i32, ptr %77, align 8
  %79 = getelementptr inbounds %"class.cooperative_groups::thread_group", ptr %26, i32 0, i32 1
  %80 = load i32, ptr %79, align 4
  %81 = getelementptr inbounds %"class.cooperative_groups::thread_group", ptr %26, i32 0, i32 2
  %82 = load i64, ptr %81, align 8
  %83 = getelementptr inbounds %"class.cooperative_groups::thread_group", ptr %26, i32 0, i32 3
  %84 = load %"struct.cooperative_groups::thread_group::_coalesced_info", ptr %83, align 8
  call void @_Z7cg_syncN18cooperative_groups12thread_groupE(i32 %78, i32 %80, i64 %82, %"struct.cooperative_groups::thread_group::_coalesced_info" %84) #24
  br label %85

85:                                               ; preds = %76
  %86 = load i32, ptr %24, align 4
  %87 = sdiv i32 %86, 2
  store i32 %87, ptr %24, align 4
  br label %46, !llvm.loop !10

88:                                               ; preds = %46
  %89 = load i32, ptr %21, align 4
  ret i32 %89
}

; Function Attrs: convergent mustprogress noinline nounwind optnone
define hidden noundef i32 @_Z10thread_sumPii(ptr noundef %0, i32 noundef %1) #2 {
  %3 = alloca i32, align 4, addrspace(5)
  %4 = alloca ptr, align 8, addrspace(5)
  %5 = alloca i32, align 4, addrspace(5)
  %6 = alloca i32, align 4, addrspace(5)
  %7 = alloca i32, align 4, addrspace(5)
  %8 = alloca %struct.HIP_vector_type, align 16, addrspace(5)
  %9 = alloca %"struct.__HIP_Coordinates<__HIP_BlockDim>::__X", align 1, addrspace(5)
  %10 = alloca %"struct.__HIP_Coordinates<__HIP_GridDim>::__X", align 1, addrspace(5)
  %11 = addrspacecast ptr addrspace(5) %3 to ptr
  %12 = addrspacecast ptr addrspace(5) %4 to ptr
  %13 = addrspacecast ptr addrspace(5) %5 to ptr
  %14 = addrspacecast ptr addrspace(5) %6 to ptr
  %15 = addrspacecast ptr addrspace(5) %7 to ptr
  %16 = addrspacecast ptr addrspace(5) %8 to ptr
  %17 = addrspacecast ptr addrspace(5) %9 to ptr
  %18 = addrspacecast ptr addrspace(5) %10 to ptr
  store ptr %0, ptr %12, align 8
  store i32 %1, ptr %13, align 4
  store i32 0, ptr %14, align 4
  %19 = call noundef i32 @_ZNK17__HIP_CoordinatesI14__HIP_BlockIdxE3__XcvjEv(ptr noundef nonnull align 1 dereferenceable(1) addrspacecast (ptr addrspace(4) @_ZN17__HIP_CoordinatesI14__HIP_BlockIdxE1xE to ptr)) #24
  %20 = call noundef i32 @_ZNK17__HIP_CoordinatesI14__HIP_BlockDimE3__XcvjEv(ptr noundef nonnull align 1 dereferenceable(1) addrspacecast (ptr addrspace(4) @_ZN17__HIP_CoordinatesI14__HIP_BlockDimE1xE to ptr)) #24
  %21 = mul i32 %19, %20
  %22 = call noundef i32 @_ZNK17__HIP_CoordinatesI15__HIP_ThreadIdxE3__XcvjEv(ptr noundef nonnull align 1 dereferenceable(1) addrspacecast (ptr addrspace(4) @_ZN17__HIP_CoordinatesI15__HIP_ThreadIdxE1xE to ptr)) #24
  %23 = add i32 %21, %22
  store i32 %23, ptr %15, align 4
  br label %24

24:                                               ; preds = %51, %2
  %25 = load i32, ptr %15, align 4
  %26 = load i32, ptr %13, align 4
  %27 = sdiv i32 %26, 4
  %28 = icmp slt i32 %25, %27
  br i1 %28, label %29, label %55

29:                                               ; preds = %24
  %30 = load ptr, ptr %12, align 8
  %31 = load i32, ptr %15, align 4
  %32 = sext i32 %31 to i64
  %33 = getelementptr inbounds %struct.HIP_vector_type, ptr %30, i64 %32
  call void @llvm.memcpy.p0.p0.i64(ptr align 16 %16, ptr align 16 %33, i64 16, i1 false)
  %34 = getelementptr inbounds %struct.HIP_vector_base, ptr %16, i32 0, i32 0
  %35 = getelementptr inbounds %struct.anon, ptr %34, i32 0, i32 0
  %36 = load i32, ptr %35, align 16
  %37 = getelementptr inbounds %struct.HIP_vector_base, ptr %16, i32 0, i32 0
  %38 = getelementptr inbounds %struct.anon, ptr %37, i32 0, i32 1
  %39 = load i32, ptr %38, align 4
  %40 = add nsw i32 %36, %39
  %41 = getelementptr inbounds %struct.HIP_vector_base, ptr %16, i32 0, i32 0
  %42 = getelementptr inbounds %struct.anon, ptr %41, i32 0, i32 2
  %43 = load i32, ptr %42, align 8
  %44 = add nsw i32 %40, %43
  %45 = getelementptr inbounds %struct.HIP_vector_base, ptr %16, i32 0, i32 0
  %46 = getelementptr inbounds %struct.anon, ptr %45, i32 0, i32 3
  %47 = load i32, ptr %46, align 4
  %48 = add nsw i32 %44, %47
  %49 = load i32, ptr %14, align 4
  %50 = add nsw i32 %49, %48
  store i32 %50, ptr %14, align 4
  br label %51

51:                                               ; preds = %29
  %52 = call noundef i32 @_ZmlN17__HIP_CoordinatesI14__HIP_BlockDimE3__XENS_I13__HIP_GridDimE3__XE() #24
  %53 = load i32, ptr %15, align 4
  %54 = add i32 %53, %52
  store i32 %54, ptr %15, align 4
  br label %24, !llvm.loop !11

55:                                               ; preds = %24
  %56 = load i32, ptr %14, align 4
  ret i32 %56
}

; Function Attrs: convergent mustprogress noinline nounwind optnone
define linkonce_odr hidden noundef i32 @_ZNK17__HIP_CoordinatesI14__HIP_BlockIdxE3__XcvjEv(ptr noundef nonnull align 1 dereferenceable(1) %0) #2 comdat align 2 {
  %2 = alloca i32, align 4, addrspace(5)
  %3 = alloca ptr, align 8, addrspace(5)
  %4 = alloca %struct.__HIP_BlockIdx, align 1, addrspace(5)
  %5 = addrspacecast ptr addrspace(5) %2 to ptr
  %6 = addrspacecast ptr addrspace(5) %3 to ptr
  %7 = addrspacecast ptr addrspace(5) %4 to ptr
  store ptr %0, ptr %6, align 8
  %8 = load ptr, ptr %6, align 8
  %9 = call noundef i32 @_ZNK14__HIP_BlockIdxclEj(ptr noundef nonnull align 1 dereferenceable(1) %7, i32 noundef 0) #24
  ret i32 %9
}

; Function Attrs: convergent mustprogress noinline nounwind optnone
define linkonce_odr hidden noundef i32 @_ZNK17__HIP_CoordinatesI14__HIP_BlockDimE3__XcvjEv(ptr noundef nonnull align 1 dereferenceable(1) %0) #2 comdat align 2 {
  %2 = alloca i32, align 4, addrspace(5)
  %3 = alloca ptr, align 8, addrspace(5)
  %4 = alloca %struct.__HIP_BlockDim, align 1, addrspace(5)
  %5 = addrspacecast ptr addrspace(5) %2 to ptr
  %6 = addrspacecast ptr addrspace(5) %3 to ptr
  %7 = addrspacecast ptr addrspace(5) %4 to ptr
  store ptr %0, ptr %6, align 8
  %8 = load ptr, ptr %6, align 8
  %9 = call noundef i32 @_ZNK14__HIP_BlockDimclEj(ptr noundef nonnull align 1 dereferenceable(1) %7, i32 noundef 0) #24
  ret i32 %9
}

; Function Attrs: convergent mustprogress noinline nounwind optnone
define linkonce_odr hidden noundef i32 @_ZNK17__HIP_CoordinatesI15__HIP_ThreadIdxE3__XcvjEv(ptr noundef nonnull align 1 dereferenceable(1) %0) #2 comdat align 2 {
  %2 = alloca i32, align 4, addrspace(5)
  %3 = alloca ptr, align 8, addrspace(5)
  %4 = alloca %struct.__HIP_ThreadIdx, align 1, addrspace(5)
  %5 = addrspacecast ptr addrspace(5) %2 to ptr
  %6 = addrspacecast ptr addrspace(5) %3 to ptr
  %7 = addrspacecast ptr addrspace(5) %4 to ptr
  store ptr %0, ptr %6, align 8
  %8 = load ptr, ptr %6, align 8
  %9 = call noundef i32 @_ZNK15__HIP_ThreadIdxclEj(ptr noundef nonnull align 1 dereferenceable(1) %7, i32 noundef 0) #24
  ret i32 %9
}

; Function Attrs: convergent mustprogress noinline nounwind optnone
define linkonce_odr hidden noundef i32 @_ZmlN17__HIP_CoordinatesI14__HIP_BlockDimE3__XENS_I13__HIP_GridDimE3__XE() #2 comdat {
  %1 = alloca i32, align 4, addrspace(5)
  %2 = alloca %"struct.__HIP_Coordinates<__HIP_BlockDim>::__X", align 1, addrspace(5)
  %3 = alloca %"struct.__HIP_Coordinates<__HIP_GridDim>::__X", align 1, addrspace(5)
  %4 = addrspacecast ptr addrspace(5) %1 to ptr
  %5 = addrspacecast ptr addrspace(5) %2 to ptr
  %6 = addrspacecast ptr addrspace(5) %3 to ptr
  %7 = call i64 @__ockl_get_global_size(i32 noundef 0) #18
  %8 = trunc i64 %7 to i32
  ret i32 %8
}

; Function Attrs: convergent mustprogress noinline norecurse nounwind optnone
define protected amdgpu_kernel void @_Z16sum_kernel_blockPiS_i(ptr addrspace(1) noundef %0, ptr addrspace(1) noundef %1, i32 noundef %2) #6 {
  %4 = alloca ptr, align 8, addrspace(5)
  %5 = alloca ptr, align 8, addrspace(5)
  %6 = alloca ptr, align 8, addrspace(5)
  %7 = alloca ptr, align 8, addrspace(5)
  %8 = alloca i32, align 4, addrspace(5)
  %9 = alloca i32, align 4, addrspace(5)
  %10 = alloca %"class.cooperative_groups::thread_group", align 8, addrspace(5)
  %11 = alloca i32, align 4, addrspace(5)
  %12 = alloca %"class.cooperative_groups::thread_group", align 8, addrspace(5)
  %13 = alloca %"class.cooperative_groups::thread_group", align 8, addrspace(5)
  %14 = addrspacecast ptr addrspace(5) %4 to ptr
  %15 = addrspacecast ptr addrspace(5) %5 to ptr
  %16 = addrspacecast ptr addrspace(5) %6 to ptr
  %17 = addrspacecast ptr addrspace(5) %7 to ptr
  %18 = addrspacecast ptr addrspace(5) %8 to ptr
  %19 = addrspacecast ptr addrspace(5) %9 to ptr
  %20 = addrspacecast ptr addrspace(5) %10 to ptr
  %21 = addrspacecast ptr addrspace(5) %11 to ptr
  %22 = addrspacecast ptr addrspace(5) %12 to ptr
  %23 = addrspacecast ptr addrspace(5) %13 to ptr
  %24 = addrspacecast ptr addrspace(1) %0 to ptr
  store ptr %24, ptr %14, align 8
  %25 = load ptr, ptr %14, align 8
  %26 = addrspacecast ptr addrspace(1) %1 to ptr
  store ptr %26, ptr %15, align 8
  %27 = load ptr, ptr %15, align 8
  store ptr %25, ptr %16, align 8
  store ptr %27, ptr %17, align 8
  store i32 %2, ptr %18, align 4
  %28 = load ptr, ptr %17, align 8
  %29 = load i32, ptr %18, align 4
  %30 = call noundef i32 @_Z10thread_sumPii(ptr noundef %28, i32 noundef %29) #24
  store i32 %30, ptr %19, align 4
  %31 = call %"class.cooperative_groups::thread_group" @_Z20cg_this_thread_blockv() #24
  %32 = getelementptr inbounds %"class.cooperative_groups::thread_group", ptr %20, i32 0, i32 0
  %33 = extractvalue %"class.cooperative_groups::thread_group" %31, 0
  store i32 %33, ptr %32, align 8
  %34 = getelementptr inbounds %"class.cooperative_groups::thread_group", ptr %20, i32 0, i32 1
  %35 = extractvalue %"class.cooperative_groups::thread_group" %31, 1
  store i32 %35, ptr %34, align 4
  %36 = getelementptr inbounds %"class.cooperative_groups::thread_group", ptr %20, i32 0, i32 2
  %37 = extractvalue %"class.cooperative_groups::thread_group" %31, 2
  store i64 %37, ptr %36, align 8
  %38 = getelementptr inbounds %"class.cooperative_groups::thread_group", ptr %20, i32 0, i32 3
  %39 = extractvalue %"class.cooperative_groups::thread_group" %31, 3
  store %"struct.cooperative_groups::thread_group::_coalesced_info" %39, ptr %38, align 8
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %22, ptr align 8 %20, i64 40, i1 false)
  %40 = load i32, ptr %19, align 4
  %41 = getelementptr inbounds %"class.cooperative_groups::thread_group", ptr %22, i32 0, i32 0
  %42 = load i32, ptr %41, align 8
  %43 = getelementptr inbounds %"class.cooperative_groups::thread_group", ptr %22, i32 0, i32 1
  %44 = load i32, ptr %43, align 4
  %45 = getelementptr inbounds %"class.cooperative_groups::thread_group", ptr %22, i32 0, i32 2
  %46 = load i64, ptr %45, align 8
  %47 = getelementptr inbounds %"class.cooperative_groups::thread_group", ptr %22, i32 0, i32 3
  %48 = load %"struct.cooperative_groups::thread_group::_coalesced_info", ptr %47, align 8
  %49 = call noundef i32 @_Z10reduce_sumN18cooperative_groups12thread_groupEPii(i32 %42, i32 %44, i64 %46, %"struct.cooperative_groups::thread_group::_coalesced_info" %48, ptr noundef addrspacecast (ptr addrspace(3) @temp to ptr), i32 noundef %40) #24
  store i32 %49, ptr %21, align 4
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %23, ptr align 8 %20, i64 40, i1 false)
  %50 = getelementptr inbounds %"class.cooperative_groups::thread_group", ptr %23, i32 0, i32 0
  %51 = load i32, ptr %50, align 8
  %52 = getelementptr inbounds %"class.cooperative_groups::thread_group", ptr %23, i32 0, i32 1
  %53 = load i32, ptr %52, align 4
  %54 = getelementptr inbounds %"class.cooperative_groups::thread_group", ptr %23, i32 0, i32 2
  %55 = load i64, ptr %54, align 8
  %56 = getelementptr inbounds %"class.cooperative_groups::thread_group", ptr %23, i32 0, i32 3
  %57 = load %"struct.cooperative_groups::thread_group::_coalesced_info", ptr %56, align 8
  %58 = call noundef i32 @_Z7cg_rankN18cooperative_groups12thread_groupE(i32 %51, i32 %53, i64 %55, %"struct.cooperative_groups::thread_group::_coalesced_info" %57) #24
  %59 = icmp eq i32 %58, 0
  br i1 %59, label %60, label %64

60:                                               ; preds = %3
  %61 = load ptr, ptr %16, align 8
  %62 = load i32, ptr %21, align 4
  %63 = call noundef i32 @_Z9atomicAddPii(ptr noundef %61, i32 noundef %62) #24
  br label %64

64:                                               ; preds = %60, %3
  ret void
}

; Function Attrs: convergent mustprogress noinline nounwind optnone
define linkonce_odr hidden noundef i32 @_Z9atomicAddPii(ptr noundef %0, i32 noundef %1) #2 comdat {
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
  store ptr %0, ptr %9, align 8
  store i32 %1, ptr %10, align 4
  %13 = load ptr, ptr %9, align 8
  %14 = load i32, ptr %10, align 4
  store i32 %14, ptr %11, align 4
  %15 = load i32, ptr %11, align 4
  %16 = atomicrmw add ptr %13, i32 %15 syncscope("agent-one-as") monotonic, align 4
  store i32 %16, ptr %12, align 4
  %17 = load i32, ptr %12, align 4
  ret i32 %17
}

; Function Attrs: convergent mustprogress noinline nounwind optnone
define linkonce_odr hidden void @_Z13__syncthreadsv() #2 comdat {
  call void @_ZL9__barrieri(i32 noundef 1) #24
  ret void
}

; Function Attrs: convergent mustprogress noinline nounwind optnone
define internal void @_ZL9__barrieri(i32 noundef %0) #2 {
  %2 = alloca i32, align 4, addrspace(5)
  %3 = addrspacecast ptr addrspace(5) %2 to ptr
  store i32 %0, ptr %3, align 4
  %4 = load i32, ptr %3, align 4
  call void @_ZL20__work_group_barrierj14__memory_scope(i32 noundef %4, i32 noundef 1) #24
  ret void
}

; Function Attrs: convergent mustprogress noinline nounwind optnone
define internal void @_ZL20__work_group_barrierj14__memory_scope(i32 noundef %0, i32 noundef %1) #2 {
  %3 = alloca i32, align 4, addrspace(5)
  %4 = alloca i32, align 4, addrspace(5)
  %5 = addrspacecast ptr addrspace(5) %3 to ptr
  %6 = addrspacecast ptr addrspace(5) %4 to ptr
  store i32 %0, ptr %5, align 4
  store i32 %1, ptr %6, align 4
  %7 = load i32, ptr %5, align 4
  %8 = icmp ne i32 %7, 0
  br i1 %8, label %9, label %24

9:                                                ; preds = %2
  %10 = load i32, ptr %5, align 4
  %11 = load i32, ptr %6, align 4
  switch i32 %11, label %16 [
    i32 3, label %15
    i32 4, label %12
    i32 1, label %13
    i32 2, label %14
  ]

12:                                               ; preds = %9
  fence syncscope("wavefront") release
  br label %16

13:                                               ; preds = %9
  fence syncscope("workgroup") release
  br label %16

14:                                               ; preds = %9
  fence syncscope("agent") release
  br label %16

15:                                               ; preds = %9
  fence release
  br label %16

16:                                               ; preds = %9, %12, %13, %14, %15
  call void @llvm.amdgcn.s.barrier()
  %17 = load i32, ptr %5, align 4
  %18 = load i32, ptr %6, align 4
  switch i32 %18, label %23 [
    i32 3, label %22
    i32 4, label %19
    i32 1, label %20
    i32 2, label %21
  ]

19:                                               ; preds = %16
  fence syncscope("wavefront") acquire
  br label %23

20:                                               ; preds = %16
  fence syncscope("workgroup") acquire
  br label %23

21:                                               ; preds = %16
  fence syncscope("agent") acquire
  br label %23

22:                                               ; preds = %16
  fence acquire
  br label %23

23:                                               ; preds = %16, %19, %20, %21, %22
  br label %25

24:                                               ; preds = %2
  call void @llvm.amdgcn.s.barrier()
  br label %25

25:                                               ; preds = %24, %23
  ret void
}

; Function Attrs: convergent nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #7

; Function Attrs: convergent mustprogress noinline nounwind optnone
define linkonce_odr hidden noundef i32 @_ZNK14__HIP_BlockIdxclEj(ptr noundef nonnull align 1 dereferenceable(1) %0, i32 noundef %1) #2 comdat align 2 {
  %3 = alloca i32, align 4, addrspace(5)
  %4 = alloca ptr, align 8, addrspace(5)
  %5 = alloca i32, align 4, addrspace(5)
  %6 = addrspacecast ptr addrspace(5) %3 to ptr
  %7 = addrspacecast ptr addrspace(5) %4 to ptr
  %8 = addrspacecast ptr addrspace(5) %5 to ptr
  store ptr %0, ptr %7, align 8
  store i32 %1, ptr %8, align 4
  %9 = load ptr, ptr %7, align 8
  %10 = load i32, ptr %8, align 4
  %11 = call i64 @__ockl_get_group_id(i32 noundef %10) #18
  %12 = trunc i64 %11 to i32
  ret i32 %12
}

; Function Attrs: convergent mustprogress noinline nounwind optnone
define linkonce_odr hidden noundef i32 @_ZNK14__HIP_BlockDimclEj(ptr noundef nonnull align 1 dereferenceable(1) %0, i32 noundef %1) #2 comdat align 2 {
  %3 = alloca i32, align 4, addrspace(5)
  %4 = alloca ptr, align 8, addrspace(5)
  %5 = alloca i32, align 4, addrspace(5)
  %6 = addrspacecast ptr addrspace(5) %3 to ptr
  %7 = addrspacecast ptr addrspace(5) %4 to ptr
  %8 = addrspacecast ptr addrspace(5) %5 to ptr
  store ptr %0, ptr %7, align 8
  store i32 %1, ptr %8, align 4
  %9 = load ptr, ptr %7, align 8
  %10 = load i32, ptr %8, align 4
  %11 = call i64 @__ockl_get_local_size(i32 noundef %10) #18
  %12 = trunc i64 %11 to i32
  ret i32 %12
}

; Function Attrs: convergent mustprogress noinline nounwind optnone
define linkonce_odr hidden noundef i32 @_ZNK15__HIP_ThreadIdxclEj(ptr noundef nonnull align 1 dereferenceable(1) %0, i32 noundef %1) #2 comdat align 2 {
  %3 = alloca i32, align 4, addrspace(5)
  %4 = alloca ptr, align 8, addrspace(5)
  %5 = alloca i32, align 4, addrspace(5)
  %6 = addrspacecast ptr addrspace(5) %3 to ptr
  %7 = addrspacecast ptr addrspace(5) %4 to ptr
  %8 = addrspacecast ptr addrspace(5) %5 to ptr
  store ptr %0, ptr %7, align 8
  store i32 %1, ptr %8, align 4
  %9 = load ptr, ptr %7, align 8
  %10 = load i32, ptr %8, align 4
  %11 = call i64 @__ockl_get_local_id(i32 noundef %10) #18
  %12 = trunc i64 %11 to i32
  ret i32 %12
}

; Function Attrs: convergent mustprogress norecurse nounwind willreturn
define internal void @__ockl_grid_sync() #8 {
  fence syncscope("agent") seq_cst
  tail call void @llvm.amdgcn.s.barrier()
  %1 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !12
  %2 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !12
  %3 = or i32 %1, %2
  %4 = tail call i32 @llvm.amdgcn.workitem.id.z(), !range !12
  %5 = or i32 %3, %4
  %6 = icmp eq i32 %5, 0
  br i1 %6, label %7, label %17

7:                                                ; preds = %0
  %8 = tail call i64 @__ockl_get_num_groups(i32 noundef 0) #18
  %9 = trunc i64 %8 to i32
  %10 = tail call i64 @__ockl_get_num_groups(i32 noundef 1) #18
  %11 = trunc i64 %10 to i32
  %12 = mul i32 %11, %9
  %13 = tail call i64 @__ockl_get_num_groups(i32 noundef 2) #18
  %14 = trunc i64 %13 to i32
  %15 = mul i32 %12, %14
  %16 = add i32 %15, -1
  tail call void @llvm.amdgcn.ds.gws.barrier(i32 %16, i32 0)
  br label %17

17:                                               ; preds = %7, %0
  tail call void @llvm.amdgcn.s.barrier()
  ret void
}

; Function Attrs: nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #9

; Function Attrs: nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #9

; Function Attrs: nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.z() #9

; Function Attrs: convergent mustprogress nofree norecurse nosync nounwind readnone willreturn
define internal i64 @__ockl_get_num_groups(i32 noundef %0) #10 {
  switch i32 %0, label %76 [
    i32 0, label %2
    i32 1, label %26
    i32 2, label %51
  ]

2:                                                ; preds = %1
  %3 = load i32, ptr addrspace(4) @__oclc_ABI_version, align 4, !tbaa !13
  %4 = icmp slt i32 %3, 500
  br i1 %4, label %5, label %15

5:                                                ; preds = %2
  %6 = tail call align 4 dereferenceable(64) ptr addrspace(4) @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr inbounds %0, ptr addrspace(4) %6, i64 0, i32 6
  %8 = load i32, ptr addrspace(4) %7, align 4, !tbaa !17
  %9 = getelementptr i8, ptr addrspace(4) %6, i64 4
  %10 = load i16, ptr addrspace(4) %9, align 4, !range !23, !invariant.load !24
  %11 = zext i16 %10 to i32
  %12 = udiv i32 %8, %11
  %13 = mul i32 %12, %11
  %14 = icmp ugt i32 %8, %13
  br label %21

15:                                               ; preds = %2
  %16 = tail call ptr addrspace(4) @llvm.amdgcn.implicitarg.ptr()
  %17 = load i32, ptr addrspace(4) %16, align 4, !tbaa !13
  %18 = getelementptr inbounds i16, ptr addrspace(4) %16, i64 9
  %19 = load i16, ptr addrspace(4) %18, align 2, !tbaa !25
  %20 = icmp ne i16 %19, 0
  br label %21

21:                                               ; preds = %15, %5
  %22 = phi i1 [ %20, %15 ], [ %14, %5 ]
  %23 = phi i32 [ %17, %15 ], [ %12, %5 ]
  %24 = zext i1 %22 to i32
  %25 = add i32 %23, %24
  br label %76

26:                                               ; preds = %1
  %27 = load i32, ptr addrspace(4) @__oclc_ABI_version, align 4, !tbaa !13
  %28 = icmp slt i32 %27, 500
  br i1 %28, label %29, label %39

29:                                               ; preds = %26
  %30 = tail call align 4 dereferenceable(64) ptr addrspace(4) @llvm.amdgcn.dispatch.ptr()
  %31 = getelementptr inbounds %0, ptr addrspace(4) %30, i64 0, i32 7
  %32 = load i32, ptr addrspace(4) %31, align 8, !tbaa !26
  %33 = getelementptr i8, ptr addrspace(4) %30, i64 6
  %34 = load i16, ptr addrspace(4) %33, align 2, !range !23, !invariant.load !24
  %35 = zext i16 %34 to i32
  %36 = udiv i32 %32, %35
  %37 = mul i32 %36, %35
  %38 = icmp ugt i32 %32, %37
  br label %46

39:                                               ; preds = %26
  %40 = tail call ptr addrspace(4) @llvm.amdgcn.implicitarg.ptr()
  %41 = getelementptr inbounds i32, ptr addrspace(4) %40, i64 1
  %42 = load i32, ptr addrspace(4) %41, align 4, !tbaa !13
  %43 = getelementptr inbounds i16, ptr addrspace(4) %40, i64 10
  %44 = load i16, ptr addrspace(4) %43, align 4, !tbaa !25
  %45 = icmp ne i16 %44, 0
  br label %46

46:                                               ; preds = %39, %29
  %47 = phi i1 [ %45, %39 ], [ %38, %29 ]
  %48 = phi i32 [ %42, %39 ], [ %36, %29 ]
  %49 = zext i1 %47 to i32
  %50 = add i32 %48, %49
  br label %76

51:                                               ; preds = %1
  %52 = load i32, ptr addrspace(4) @__oclc_ABI_version, align 4, !tbaa !13
  %53 = icmp slt i32 %52, 500
  br i1 %53, label %54, label %64

54:                                               ; preds = %51
  %55 = tail call align 4 dereferenceable(64) ptr addrspace(4) @llvm.amdgcn.dispatch.ptr()
  %56 = getelementptr inbounds %0, ptr addrspace(4) %55, i64 0, i32 8
  %57 = load i32, ptr addrspace(4) %56, align 4, !tbaa !27
  %58 = getelementptr i8, ptr addrspace(4) %55, i64 8
  %59 = load i16, ptr addrspace(4) %58, align 4, !range !23, !invariant.load !24
  %60 = zext i16 %59 to i32
  %61 = udiv i32 %57, %60
  %62 = mul i32 %61, %60
  %63 = icmp ugt i32 %57, %62
  br label %71

64:                                               ; preds = %51
  %65 = tail call ptr addrspace(4) @llvm.amdgcn.implicitarg.ptr()
  %66 = getelementptr inbounds i32, ptr addrspace(4) %65, i64 2
  %67 = load i32, ptr addrspace(4) %66, align 4, !tbaa !13
  %68 = getelementptr inbounds i16, ptr addrspace(4) %65, i64 11
  %69 = load i16, ptr addrspace(4) %68, align 2, !tbaa !25
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

; Function Attrs: convergent inaccessiblememonly nounwind willreturn
declare void @llvm.amdgcn.ds.gws.barrier(i32, i32) #11

; Function Attrs: nounwind readnone speculatable willreturn
declare align 4 ptr addrspace(4) @llvm.amdgcn.dispatch.ptr() #9

; Function Attrs: nounwind readnone speculatable willreturn
declare align 4 ptr addrspace(4) @llvm.amdgcn.implicitarg.ptr() #9

; Function Attrs: convergent mustprogress nofree norecurse nounwind readnone willreturn
define internal i32 @__ockl_multi_grid_thread_rank() #12 {
  %1 = load i32, ptr addrspace(4) @__oclc_ABI_version, align 4, !tbaa !13
  %2 = icmp slt i32 %1, 500
  %3 = tail call ptr addrspace(4) @llvm.amdgcn.implicitarg.ptr()
  %4 = select i1 %2, i64 6, i64 11
  %5 = getelementptr inbounds i64, ptr addrspace(4) %3, i64 %4
  %6 = load i64, ptr addrspace(4) %5, align 8, !tbaa !28
  %7 = inttoptr i64 %6 to ptr addrspace(4)
  %8 = getelementptr inbounds %2, ptr addrspace(4) %7, i64 0, i32 3
  %9 = load i64, ptr addrspace(4) %8, align 8, !tbaa !29
  %10 = tail call i64 @__ockl_get_global_linear_id() #18
  %11 = add i64 %10, %9
  %12 = trunc i64 %11 to i32
  ret i32 %12
}

; Function Attrs: convergent mustprogress nofree norecurse nosync nounwind readnone willreturn
define internal i64 @__ockl_get_global_linear_id() local_unnamed_addr #10 {
  %1 = load i32, ptr addrspace(4) @__oclc_ABI_version, align 4, !tbaa !13
  %2 = icmp slt i32 %1, 500
  %3 = tail call align 4 ptr addrspace(4) @llvm.amdgcn.dispatch.ptr()
  %4 = getelementptr inbounds %0, ptr addrspace(4) %3, i64 0, i32 1
  %5 = tail call ptr addrspace(4) @llvm.amdgcn.implicitarg.ptr()
  %6 = getelementptr inbounds i16, ptr addrspace(4) %5, i64 32
  %7 = select i1 %2, ptr addrspace(4) %4, ptr addrspace(4) %6
  %8 = load i16, ptr addrspace(4) %7, align 2, !tbaa !25
  switch i16 %8, label %121 [
    i16 1, label %9
    i16 2, label %20
    i16 3, label %58
  ]

9:                                                ; preds = %0
  %10 = getelementptr i8, ptr addrspace(4) %3, i64 4
  %11 = getelementptr inbounds i16, ptr addrspace(4) %5, i64 6
  %12 = select i1 %2, ptr addrspace(4) %10, ptr addrspace(4) %11
  %13 = load i16, ptr addrspace(4) %12, align 4
  %14 = zext i16 %13 to i32
  %15 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %16 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !12
  %17 = mul i32 %15, %14
  %18 = add i32 %17, %16
  %19 = zext i32 %18 to i64
  br label %121

20:                                               ; preds = %0
  br i1 %2, label %21, label %28

21:                                               ; preds = %20
  %22 = getelementptr i8, ptr addrspace(4) %3, i64 4
  %23 = load i16, ptr addrspace(4) %22, align 4, !range !23, !invariant.load !24
  %24 = zext i16 %23 to i32
  %25 = getelementptr i8, ptr addrspace(4) %3, i64 6
  %26 = getelementptr inbounds %0, ptr addrspace(4) %3, i64 0, i32 6
  %27 = load i32, ptr addrspace(4) %26, align 4, !tbaa !17
  br label %39

28:                                               ; preds = %20
  %29 = getelementptr inbounds i16, ptr addrspace(4) %5, i64 6
  %30 = load i16, ptr addrspace(4) %29, align 4, !tbaa !25
  %31 = zext i16 %30 to i32
  %32 = getelementptr inbounds i16, ptr addrspace(4) %5, i64 7
  %33 = load i32, ptr addrspace(4) %5, align 4, !tbaa !13
  %34 = mul i32 %33, %31
  %35 = getelementptr inbounds i16, ptr addrspace(4) %5, i64 9
  %36 = load i16, ptr addrspace(4) %35, align 2, !tbaa !25
  %37 = zext i16 %36 to i32
  %38 = add i32 %34, %37
  br label %39

39:                                               ; preds = %28, %21
  %40 = phi i32 [ %27, %21 ], [ %38, %28 ]
  %41 = phi ptr addrspace(4) [ %25, %21 ], [ %32, %28 ]
  %42 = phi i32 [ %24, %21 ], [ %31, %28 ]
  %43 = load i16, ptr addrspace(4) %41, align 2
  %44 = zext i16 %43 to i32
  %45 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %46 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %47 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !12
  %48 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !12
  %49 = mul i32 %42, %46
  %50 = add i32 %49, %48
  %51 = mul i32 %45, %44
  %52 = add i32 %51, %47
  %53 = zext i32 %52 to i64
  %54 = zext i32 %40 to i64
  %55 = mul nuw i64 %53, %54
  %56 = zext i32 %50 to i64
  %57 = add nuw i64 %55, %56
  br label %121

58:                                               ; preds = %0
  br i1 %2, label %59, label %71

59:                                               ; preds = %58
  %60 = getelementptr i8, ptr addrspace(4) %3, i64 4
  %61 = load i16, ptr addrspace(4) %60, align 4, !range !23, !invariant.load !24
  %62 = zext i16 %61 to i32
  %63 = getelementptr i8, ptr addrspace(4) %3, i64 6
  %64 = load i16, ptr addrspace(4) %63, align 2, !range !23, !invariant.load !24
  %65 = zext i16 %64 to i32
  %66 = getelementptr i8, ptr addrspace(4) %3, i64 8
  %67 = getelementptr inbounds %0, ptr addrspace(4) %3, i64 0, i32 6
  %68 = load i32, ptr addrspace(4) %67, align 4, !tbaa !17
  %69 = getelementptr inbounds %0, ptr addrspace(4) %3, i64 0, i32 7
  %70 = load i32, ptr addrspace(4) %69, align 8, !tbaa !26
  br label %92

71:                                               ; preds = %58
  %72 = getelementptr inbounds i16, ptr addrspace(4) %5, i64 6
  %73 = load i16, ptr addrspace(4) %72, align 4, !tbaa !25
  %74 = zext i16 %73 to i32
  %75 = getelementptr inbounds i16, ptr addrspace(4) %5, i64 7
  %76 = load i16, ptr addrspace(4) %75, align 2, !tbaa !25
  %77 = zext i16 %76 to i32
  %78 = getelementptr inbounds i16, ptr addrspace(4) %5, i64 8
  %79 = load i32, ptr addrspace(4) %5, align 4, !tbaa !13
  %80 = mul i32 %79, %74
  %81 = getelementptr inbounds i16, ptr addrspace(4) %5, i64 9
  %82 = load i16, ptr addrspace(4) %81, align 2, !tbaa !25
  %83 = zext i16 %82 to i32
  %84 = add i32 %80, %83
  %85 = getelementptr inbounds i32, ptr addrspace(4) %5, i64 1
  %86 = load i32, ptr addrspace(4) %85, align 4, !tbaa !13
  %87 = mul i32 %86, %77
  %88 = getelementptr inbounds i16, ptr addrspace(4) %5, i64 10
  %89 = load i16, ptr addrspace(4) %88, align 4, !tbaa !25
  %90 = zext i16 %89 to i32
  %91 = add i32 %87, %90
  br label %92

92:                                               ; preds = %71, %59
  %93 = phi i32 [ %70, %59 ], [ %91, %71 ]
  %94 = phi i32 [ %68, %59 ], [ %84, %71 ]
  %95 = phi ptr addrspace(4) [ %66, %59 ], [ %78, %71 ]
  %96 = phi i32 [ %65, %59 ], [ %77, %71 ]
  %97 = phi i32 [ %62, %59 ], [ %74, %71 ]
  %98 = load i16, ptr addrspace(4) %95, align 2
  %99 = zext i16 %98 to i32
  %100 = tail call i32 @llvm.amdgcn.workgroup.id.z()
  %101 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %102 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %103 = tail call i32 @llvm.amdgcn.workitem.id.z(), !range !12
  %104 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !12
  %105 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !12
  %106 = mul i32 %97, %102
  %107 = add i32 %106, %105
  %108 = mul i32 %96, %101
  %109 = add i32 %108, %104
  %110 = mul i32 %100, %99
  %111 = add i32 %110, %103
  %112 = zext i32 %111 to i64
  %113 = zext i32 %93 to i64
  %114 = mul nuw i64 %112, %113
  %115 = zext i32 %109 to i64
  %116 = add nuw i64 %114, %115
  %117 = zext i32 %94 to i64
  %118 = mul i64 %116, %117
  %119 = zext i32 %107 to i64
  %120 = add i64 %118, %119
  br label %121

121:                                              ; preds = %92, %39, %9, %0
  %122 = phi i64 [ %120, %92 ], [ %57, %39 ], [ %19, %9 ], [ 0, %0 ]
  ret i64 %122
}

; Function Attrs: nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #9

; Function Attrs: nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #9

; Function Attrs: nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.z() #9

; Function Attrs: convergent norecurse nounwind
define internal void @__ockl_multi_grid_sync() #13 {
  fence seq_cst
  tail call void @llvm.amdgcn.s.barrier()
  %1 = tail call i64 @__ockl_get_num_groups(i32 noundef 0) #18
  %2 = trunc i64 %1 to i32
  %3 = tail call i64 @__ockl_get_num_groups(i32 noundef 1) #18
  %4 = trunc i64 %3 to i32
  %5 = mul i32 %4, %2
  %6 = tail call i64 @__ockl_get_num_groups(i32 noundef 2) #18
  %7 = trunc i64 %6 to i32
  %8 = mul i32 %5, %7
  %9 = add i32 %8, -1
  %10 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !12
  %11 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !12
  %12 = tail call i32 @llvm.amdgcn.workitem.id.z(), !range !12
  %13 = or i32 %11, %12
  %14 = or i32 %13, %10
  %15 = icmp eq i32 %14, 0
  br i1 %15, label %16, label %17

16:                                               ; preds = %0
  tail call void @llvm.amdgcn.ds.gws.barrier(i32 %9, i32 0)
  br label %17

17:                                               ; preds = %16, %0
  %18 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %19 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %20 = tail call i32 @llvm.amdgcn.workgroup.id.z()
  %21 = or i32 %10, %12
  %22 = or i32 %21, %11
  %23 = or i32 %22, %18
  %24 = or i32 %23, %19
  %25 = or i32 %24, %20
  %26 = icmp eq i32 %25, 0
  br i1 %26, label %27, label %49

27:                                               ; preds = %17
  %28 = load i32, ptr addrspace(4) @__oclc_ABI_version, align 4, !tbaa !13
  %29 = icmp slt i32 %28, 500
  %30 = tail call ptr addrspace(4) @llvm.amdgcn.implicitarg.ptr()
  %31 = select i1 %29, i64 6, i64 11
  %32 = getelementptr inbounds i64, ptr addrspace(4) %30, i64 %31
  %33 = load i64, ptr addrspace(4) %32, align 8, !tbaa !28
  %34 = inttoptr i64 %33 to ptr addrspace(4)
  %35 = load ptr addrspace(1), ptr addrspace(4) %34, align 8, !tbaa !31
  %36 = getelementptr inbounds %2, ptr addrspace(4) %34, i64 0, i32 2
  %37 = load i32, ptr addrspace(4) %36, align 4, !tbaa !32
  %38 = atomicrmw add ptr addrspace(1) %35, i32 1 syncscope("one-as") monotonic, align 4
  %39 = and i32 %38, 255
  %40 = add i32 %37, -1
  %41 = icmp eq i32 %39, %40
  br i1 %41, label %42, label %45

42:                                               ; preds = %27
  %43 = sub i32 256, %37
  %44 = atomicrmw add ptr addrspace(1) %35, i32 %43 syncscope("one-as") monotonic, align 4
  br label %49

45:                                               ; preds = %45, %27
  tail call void @llvm.amdgcn.s.sleep(i32 2)
  %46 = load atomic i32, ptr addrspace(1) %35 syncscope("one-as") monotonic, align 4
  %47 = xor i32 %46, %38
  %48 = icmp ult i32 %47, 256
  br i1 %48, label %45, label %49

49:                                               ; preds = %45, %42, %17
  br i1 %15, label %50, label %51

50:                                               ; preds = %49
  tail call void @llvm.amdgcn.ds.gws.barrier(i32 %9, i32 0)
  br label %51

51:                                               ; preds = %50, %49
  tail call void @llvm.amdgcn.s.barrier()
  ret void
}

; Function Attrs: nounwind willreturn
declare void @llvm.amdgcn.s.sleep(i32 immarg) #14

; Function Attrs: convergent norecurse nounwind
define internal i64 @__ockl_fprintf_stderr_begin() #15 {
  %1 = tail call <2 x i64> @__ockl_hostcall_preview(i32 noundef 2, i64 noundef 33, i64 noundef 1, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #24
  %2 = extractelement <2 x i64> %1, i64 0
  ret i64 %2
}

; Function Attrs: convergent norecurse nounwind
define internal <2 x i64> @__ockl_hostcall_preview(i32 noundef %0, i64 noundef %1, i64 noundef %2, i64 noundef %3, i64 noundef %4, i64 noundef %5, i64 noundef %6, i64 noundef %7, i64 noundef %8) local_unnamed_addr #15 {
  %10 = load i32, ptr addrspace(4) @__oclc_ABI_version, align 4, !tbaa !13
  %11 = icmp slt i32 %10, 500
  %12 = tail call ptr addrspace(4) @llvm.amdgcn.implicitarg.ptr()
  %13 = select i1 %11, i64 3, i64 10
  %14 = getelementptr inbounds i64, ptr addrspace(4) %12, i64 %13
  %15 = load i64, ptr addrspace(4) %14, align 8, !tbaa !28
  %16 = inttoptr i64 %15 to ptr addrspace(1)
  %17 = addrspacecast ptr addrspace(1) %16 to ptr
  %18 = tail call <2 x i64> @__ockl_hostcall_internal(ptr noundef %17, i32 noundef %0, i64 noundef %1, i64 noundef %2, i64 noundef %3, i64 noundef %4, i64 noundef %5, i64 noundef %6, i64 noundef %7, i64 noundef %8) #24
  ret <2 x i64> %18
}

; Function Attrs: convergent noinline norecurse nounwind optnone
define internal <2 x i64> @__ockl_hostcall_internal(ptr noundef %0, i32 noundef %1, i64 noundef %2, i64 noundef %3, i64 noundef %4, i64 noundef %5, i64 noundef %6, i64 noundef %7, i64 noundef %8, i64 noundef %9) local_unnamed_addr #16 {
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
  store ptr %0, ptr addrspace(5) %11, align 8, !tbaa !33
  store i32 %1, ptr addrspace(5) %12, align 4, !tbaa !13
  store i64 %2, ptr addrspace(5) %13, align 8, !tbaa !28
  store i64 %3, ptr addrspace(5) %14, align 8, !tbaa !28
  store i64 %4, ptr addrspace(5) %15, align 8, !tbaa !28
  store i64 %5, ptr addrspace(5) %16, align 8, !tbaa !28
  store i64 %6, ptr addrspace(5) %17, align 8, !tbaa !28
  store i64 %7, ptr addrspace(5) %18, align 8, !tbaa !28
  store i64 %8, ptr addrspace(5) %19, align 8, !tbaa !28
  store i64 %9, ptr addrspace(5) %20, align 8, !tbaa !28
  call void @llvm.lifetime.start.p5(i64 4, ptr addrspace(5) %21) #21
  %28 = call i32 @llvm.amdgcn.mbcnt.lo(i32 -1, i32 0)
  %29 = call i32 @llvm.amdgcn.mbcnt.hi(i32 -1, i32 %28)
  store i32 %29, ptr addrspace(5) %21, align 4, !tbaa !13
  %30 = load i32, ptr addrspace(5) %21, align 4, !tbaa !13
  %31 = call fastcc i32 @0(i32 noundef %30) #25
  store i32 %31, ptr addrspace(5) %21, align 4, !tbaa !13
  call void @llvm.lifetime.start.p5(i64 4, ptr addrspace(5) %22) #21
  %32 = load i32, ptr addrspace(5) %21, align 4, !tbaa !13
  %33 = call i32 @llvm.amdgcn.readfirstlane(i32 %32)
  store i32 %33, ptr addrspace(5) %22, align 4, !tbaa !13
  call void @llvm.lifetime.start.p5(i64 8, ptr addrspace(5) %23) #21
  %34 = load ptr, ptr addrspace(5) %11, align 8, !tbaa !33
  %35 = addrspacecast ptr %34 to ptr addrspace(1)
  store ptr addrspace(1) %35, ptr addrspace(5) %23, align 8, !tbaa !33
  call void @llvm.lifetime.start.p5(i64 8, ptr addrspace(5) %24) #21
  %36 = load ptr addrspace(1), ptr addrspace(5) %23, align 8, !tbaa !33
  %37 = load i32, ptr addrspace(5) %21, align 4, !tbaa !13
  %38 = load i32, ptr addrspace(5) %22, align 4, !tbaa !13
  %39 = call fastcc i64 @1(ptr addrspace(1) noundef %36, i32 noundef %37, i32 noundef %38) #25
  store i64 %39, ptr addrspace(5) %24, align 8, !tbaa !28
  call void @llvm.lifetime.start.p5(i64 8, ptr addrspace(5) %25) #21
  %40 = load ptr addrspace(1), ptr addrspace(5) %23, align 8, !tbaa !33
  %41 = load i64, ptr addrspace(5) %24, align 8, !tbaa !28
  %42 = load ptr addrspace(1), ptr addrspace(1) %40, align 8, !tbaa !34
  %43 = getelementptr i8, ptr addrspace(1) %40, i64 40
  %44 = load i64, ptr addrspace(1) %43, align 8, !tbaa !36
  %45 = call fastcc ptr addrspace(1) @2(ptr addrspace(1) %42, i64 %44, i64 noundef %41) #25
  store ptr addrspace(1) %45, ptr addrspace(5) %25, align 8, !tbaa !33
  call void @llvm.lifetime.start.p5(i64 8, ptr addrspace(5) %26) #21
  %46 = load ptr addrspace(1), ptr addrspace(5) %23, align 8, !tbaa !33
  %47 = load i64, ptr addrspace(5) %24, align 8, !tbaa !28
  %48 = getelementptr i8, ptr addrspace(1) %46, i64 8
  %49 = load ptr addrspace(1), ptr addrspace(1) %48, align 8, !tbaa !37
  %50 = getelementptr i8, ptr addrspace(1) %46, i64 40
  %51 = load i64, ptr addrspace(1) %50, align 8, !tbaa !36
  %52 = call fastcc ptr addrspace(1) @3(ptr addrspace(1) %49, i64 %51, i64 noundef %47) #25
  store ptr addrspace(1) %52, ptr addrspace(5) %26, align 8, !tbaa !33
  %53 = load ptr addrspace(1), ptr addrspace(5) %25, align 8, !tbaa !33
  %54 = load ptr addrspace(1), ptr addrspace(5) %26, align 8, !tbaa !33
  %55 = load i32, ptr addrspace(5) %12, align 4, !tbaa !13
  %56 = load i64, ptr addrspace(5) %13, align 8, !tbaa !28
  %57 = load i64, ptr addrspace(5) %14, align 8, !tbaa !28
  %58 = load i64, ptr addrspace(5) %15, align 8, !tbaa !28
  %59 = load i64, ptr addrspace(5) %16, align 8, !tbaa !28
  %60 = load i64, ptr addrspace(5) %17, align 8, !tbaa !28
  %61 = load i64, ptr addrspace(5) %18, align 8, !tbaa !28
  %62 = load i64, ptr addrspace(5) %19, align 8, !tbaa !28
  %63 = load i64, ptr addrspace(5) %20, align 8, !tbaa !28
  %64 = load i32, ptr addrspace(5) %21, align 4, !tbaa !13
  %65 = load i32, ptr addrspace(5) %22, align 4, !tbaa !13
  call fastcc void @4(ptr addrspace(1) noundef %53, ptr addrspace(1) noundef %54, i32 noundef %55, i64 noundef %56, i64 noundef %57, i64 noundef %58, i64 noundef %59, i64 noundef %60, i64 noundef %61, i64 noundef %62, i64 noundef %63, i32 noundef %64, i32 noundef %65) #25
  %66 = load ptr addrspace(1), ptr addrspace(5) %23, align 8, !tbaa !33
  %67 = load i64, ptr addrspace(5) %24, align 8, !tbaa !28
  %68 = load i32, ptr addrspace(5) %21, align 4, !tbaa !13
  %69 = load i32, ptr addrspace(5) %22, align 4, !tbaa !13
  call fastcc void @5(ptr addrspace(1) noundef %66, i64 noundef %67, i32 noundef %68, i32 noundef %69) #25
  call void @llvm.lifetime.start.p5(i64 16, ptr addrspace(5) %27) #21
  %70 = load ptr addrspace(1), ptr addrspace(5) %25, align 8, !tbaa !33
  %71 = load ptr addrspace(1), ptr addrspace(5) %26, align 8, !tbaa !33
  %72 = load i32, ptr addrspace(5) %21, align 4, !tbaa !13
  %73 = load i32, ptr addrspace(5) %22, align 4, !tbaa !13
  %74 = call fastcc <2 x i64> @6(ptr addrspace(1) noundef %70, ptr addrspace(1) noundef %71, i32 noundef %72, i32 noundef %73) #25
  store <2 x i64> %74, ptr addrspace(5) %27, align 16, !tbaa !38
  %75 = load ptr addrspace(1), ptr addrspace(5) %23, align 8, !tbaa !33
  %76 = load i64, ptr addrspace(5) %24, align 8, !tbaa !28
  %77 = load i32, ptr addrspace(5) %21, align 4, !tbaa !13
  %78 = load i32, ptr addrspace(5) %22, align 4, !tbaa !13
  call fastcc void @7(ptr addrspace(1) noundef %75, i64 noundef %76, i32 noundef %77, i32 noundef %78) #25
  %79 = load <2 x i64>, ptr addrspace(5) %27, align 16, !tbaa !38
  call void @llvm.lifetime.end.p5(i64 16, ptr addrspace(5) %27) #21
  call void @llvm.lifetime.end.p5(i64 8, ptr addrspace(5) %26) #21
  call void @llvm.lifetime.end.p5(i64 8, ptr addrspace(5) %25) #21
  call void @llvm.lifetime.end.p5(i64 8, ptr addrspace(5) %24) #21
  call void @llvm.lifetime.end.p5(i64 8, ptr addrspace(5) %23) #21
  call void @llvm.lifetime.end.p5(i64 4, ptr addrspace(5) %22) #21
  call void @llvm.lifetime.end.p5(i64 4, ptr addrspace(5) %21) #21
  ret <2 x i64> %79
}

; Function Attrs: argmemonly nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p5(i64 immarg, ptr addrspace(5) nocapture) #17

; Function Attrs: convergent norecurse nounwind
define internal fastcc i32 @0(i32 noundef %0) unnamed_addr #13 {
  %2 = tail call i32 asm sideeffect "; ockl readfirstlane hoisting hack $0", "=v,0"(i32 %0) #24, !srcloc !39
  ret i32 %2
}

; Function Attrs: convergent nounwind readnone willreturn
declare i32 @llvm.amdgcn.readfirstlane(i32) #18

; Function Attrs: convergent norecurse nounwind
define internal fastcc i64 @1(ptr addrspace(1) nocapture noundef %0, i32 noundef %1, i32 noundef %2) unnamed_addr #13 {
  %4 = icmp eq i32 %1, %2
  br i1 %4, label %5, label %29

5:                                                ; preds = %3
  %6 = getelementptr inbounds %3, ptr addrspace(1) %0, i64 0, i32 3
  %7 = load atomic i64, ptr addrspace(1) %6 syncscope("one-as") acquire, align 8
  %8 = getelementptr i8, ptr addrspace(1) %0, i64 40
  %9 = load ptr addrspace(1), ptr addrspace(1) %0, align 8, !tbaa !34
  %10 = load i64, ptr addrspace(1) %8, align 8, !tbaa !36
  %11 = and i64 %10, %7
  %12 = getelementptr inbounds %4, ptr addrspace(1) %9, i64 %11
  %13 = load atomic i64, ptr addrspace(1) %12 syncscope("one-as") monotonic, align 8
  %14 = cmpxchg ptr addrspace(1) %6, i64 %7, i64 %13 syncscope("one-as") acquire monotonic, align 8
  %15 = extractvalue { i64, i1 } %14, 1
  br i1 %15, label %26, label %16

16:                                               ; preds = %16, %5
  %17 = phi { i64, i1 } [ %24, %16 ], [ %14, %5 ]
  %18 = extractvalue { i64, i1 } %17, 0
  tail call void @llvm.amdgcn.s.sleep(i32 1)
  %19 = load ptr addrspace(1), ptr addrspace(1) %0, align 8, !tbaa !34
  %20 = load i64, ptr addrspace(1) %8, align 8, !tbaa !36
  %21 = and i64 %20, %18
  %22 = getelementptr inbounds %4, ptr addrspace(1) %19, i64 %21
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
  %5 = getelementptr inbounds %4, ptr addrspace(1) %0, i64 %4
  ret ptr addrspace(1) %5
}

; Function Attrs: argmemonly convergent mustprogress nofree norecurse nosync nounwind readonly willreturn
define internal fastcc ptr addrspace(1) @3(ptr addrspace(1) %0, i64 %1, i64 noundef %2) unnamed_addr #19 {
  %4 = and i64 %2, %1
  %5 = getelementptr inbounds %5, ptr addrspace(1) %0, i64 %4
  ret ptr addrspace(1) %5
}

; Function Attrs: convergent mustprogress nofree norecurse nounwind willreturn
define internal fastcc void @4(ptr addrspace(1) nocapture noundef writeonly %0, ptr addrspace(1) nocapture noundef writeonly %1, i32 noundef %2, i64 noundef %3, i64 noundef %4, i64 noundef %5, i64 noundef %6, i64 noundef %7, i64 noundef %8, i64 noundef %9, i64 noundef %10, i32 noundef %11, i32 noundef %12) unnamed_addr #20 {
  %14 = tail call i64 @llvm.read_register.i64(metadata !40) #25
  %15 = icmp eq i32 %11, %12
  br i1 %15, label %16, label %20

16:                                               ; preds = %13
  %17 = getelementptr inbounds %4, ptr addrspace(1) %0, i64 0, i32 3
  %18 = getelementptr inbounds %4, ptr addrspace(1) %0, i64 0, i32 1
  %19 = getelementptr inbounds %4, ptr addrspace(1) %0, i64 0, i32 2
  store i32 %2, ptr addrspace(1) %19, align 8, !tbaa !41
  store i64 %14, ptr addrspace(1) %18, align 8, !tbaa !43
  store i32 1, ptr addrspace(1) %17, align 4, !tbaa !44
  br label %20

20:                                               ; preds = %16, %13
  %21 = zext i32 %11 to i64
  %22 = getelementptr inbounds [64 x [8 x i64]], ptr addrspace(1) %1, i64 0, i64 %21
  store i64 %3, ptr addrspace(1) %22, align 8, !tbaa !28
  %23 = getelementptr inbounds i64, ptr addrspace(1) %22, i64 1
  store i64 %4, ptr addrspace(1) %23, align 8, !tbaa !28
  %24 = getelementptr inbounds i64, ptr addrspace(1) %22, i64 2
  store i64 %5, ptr addrspace(1) %24, align 8, !tbaa !28
  %25 = getelementptr inbounds i64, ptr addrspace(1) %22, i64 3
  store i64 %6, ptr addrspace(1) %25, align 8, !tbaa !28
  %26 = getelementptr inbounds i64, ptr addrspace(1) %22, i64 4
  store i64 %7, ptr addrspace(1) %26, align 8, !tbaa !28
  %27 = getelementptr inbounds i64, ptr addrspace(1) %22, i64 5
  store i64 %8, ptr addrspace(1) %27, align 8, !tbaa !28
  %28 = getelementptr inbounds i64, ptr addrspace(1) %22, i64 6
  store i64 %9, ptr addrspace(1) %28, align 8, !tbaa !28
  %29 = getelementptr inbounds i64, ptr addrspace(1) %22, i64 7
  store i64 %10, ptr addrspace(1) %29, align 8, !tbaa !28
  ret void
}

; Function Attrs: convergent norecurse nounwind
define internal fastcc void @5(ptr addrspace(1) nocapture noundef %0, i64 noundef %1, i32 noundef %2, i32 noundef %3) unnamed_addr #13 {
  %5 = icmp eq i32 %2, %3
  br i1 %5, label %6, label %24

6:                                                ; preds = %4
  %7 = getelementptr inbounds %3, ptr addrspace(1) %0, i64 0, i32 4
  %8 = load atomic i64, ptr addrspace(1) %7 syncscope("one-as") monotonic, align 8
  %9 = load ptr addrspace(1), ptr addrspace(1) %0, align 8, !tbaa !34
  %10 = getelementptr i8, ptr addrspace(1) %0, i64 40
  %11 = load i64, ptr addrspace(1) %10, align 8, !tbaa !36
  %12 = and i64 %11, %1
  %13 = getelementptr inbounds %4, ptr addrspace(1) %9, i64 %12
  store i64 %8, ptr addrspace(1) %13, align 8, !tbaa !45
  %14 = cmpxchg ptr addrspace(1) %7, i64 %8, i64 %1 syncscope("one-as") release monotonic, align 8
  %15 = extractvalue { i64, i1 } %14, 1
  br i1 %15, label %21, label %16

16:                                               ; preds = %16, %6
  %17 = phi { i64, i1 } [ %19, %16 ], [ %14, %6 ]
  %18 = extractvalue { i64, i1 } %17, 0
  tail call void @llvm.amdgcn.s.sleep(i32 1)
  store i64 %18, ptr addrspace(1) %13, align 8, !tbaa !45
  %19 = cmpxchg ptr addrspace(1) %7, i64 %18, i64 %1 syncscope("one-as") release monotonic, align 8
  %20 = extractvalue { i64, i1 } %19, 1
  br i1 %20, label %21, label %16

21:                                               ; preds = %16, %6
  %22 = getelementptr inbounds %3, ptr addrspace(1) %0, i64 0, i32 2
  %23 = load i64, ptr addrspace(1) %22, align 8
  tail call void @__ockl_hsa_signal_add(i64 %23, i64 noundef 1, i32 noundef 3) #24
  br label %24

24:                                               ; preds = %21, %4
  ret void
}

; Function Attrs: convergent norecurse nounwind
define internal fastcc <2 x i64> @6(ptr addrspace(1) nocapture noundef readonly %0, ptr addrspace(1) nocapture noundef readonly %1, i32 noundef %2, i32 noundef %3) unnamed_addr #15 {
  %5 = icmp eq i32 %2, %3
  %6 = getelementptr inbounds %4, ptr addrspace(1) %0, i64 0, i32 3
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
  %20 = load i64, ptr addrspace(1) %18, align 8, !tbaa !28
  %21 = load i64, ptr addrspace(1) %19, align 8, !tbaa !28
  %22 = insertelement <2 x i64> undef, i64 %20, i64 0
  %23 = insertelement <2 x i64> %22, i64 %21, i64 1
  ret <2 x i64> %23
}

; Function Attrs: convergent norecurse nounwind
define internal fastcc void @7(ptr addrspace(1) nocapture noundef %0, i64 noundef %1, i32 noundef %2, i32 noundef %3) unnamed_addr #13 {
  %5 = icmp eq i32 %2, %3
  br i1 %5, label %6, label %25

6:                                                ; preds = %4
  %7 = getelementptr %3, ptr addrspace(1) %0, i64 0, i32 5
  %8 = load i64, ptr addrspace(1) %7, align 8, !tbaa !36
  %9 = add i64 %8, 1
  %10 = add i64 %9, %1
  %11 = icmp eq i64 %10, 0
  %12 = select i1 %11, i64 %9, i64 %10
  %13 = getelementptr inbounds %3, ptr addrspace(1) %0, i64 0, i32 3
  %14 = load atomic i64, ptr addrspace(1) %13 syncscope("one-as") monotonic, align 8
  %15 = load ptr addrspace(1), ptr addrspace(1) %0, align 8, !tbaa !34
  %16 = and i64 %12, %8
  %17 = getelementptr inbounds %4, ptr addrspace(1) %15, i64 %16
  store i64 %14, ptr addrspace(1) %17, align 8, !tbaa !45
  %18 = cmpxchg ptr addrspace(1) %13, i64 %14, i64 %12 syncscope("one-as") release monotonic, align 8
  %19 = extractvalue { i64, i1 } %18, 1
  br i1 %19, label %25, label %20

20:                                               ; preds = %20, %6
  %21 = phi { i64, i1 } [ %23, %20 ], [ %18, %6 ]
  %22 = extractvalue { i64, i1 } %21, 0
  tail call void @llvm.amdgcn.s.sleep(i32 1)
  store i64 %22, ptr addrspace(1) %17, align 8, !tbaa !45
  %23 = cmpxchg ptr addrspace(1) %13, i64 %22, i64 %12 syncscope("one-as") release monotonic, align 8
  %24 = extractvalue { i64, i1 } %23, 1
  br i1 %24, label %25, label %20

25:                                               ; preds = %20, %6, %4
  ret void
}

; Function Attrs: argmemonly nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p5(i64 immarg, ptr addrspace(5) nocapture) #17

; Function Attrs: convergent norecurse nounwind
define internal void @__ockl_hsa_signal_add(i64 %0, i64 noundef %1, i32 noundef %2) local_unnamed_addr #13 {
  %4 = inttoptr i64 %0 to ptr addrspace(1)
  %5 = getelementptr inbounds %6, ptr addrspace(1) %4, i64 0, i32 1
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
  %17 = getelementptr inbounds %6, ptr addrspace(1) %4, i64 0, i32 2
  %18 = load i64, ptr addrspace(1) %17, align 16, !tbaa !46
  %19 = icmp eq i64 %18, 0
  br i1 %19, label %27, label %20

20:                                               ; preds = %16
  %21 = inttoptr i64 %18 to ptr addrspace(1)
  %22 = getelementptr inbounds %6, ptr addrspace(1) %4, i64 0, i32 3
  %23 = load i32, ptr addrspace(1) %22, align 8, !tbaa !48
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
declare void @llvm.amdgcn.s.sendmsg(i32 immarg, i32) #21

; Function Attrs: nounwind readonly
declare i64 @llvm.read_register.i64(metadata) #22

; Function Attrs: convergent norecurse nounwind
define internal i64 @__ockl_fprintf_append_args(i64 noundef %0, i32 noundef %1, i64 noundef %2, i64 noundef %3, i64 noundef %4, i64 noundef %5, i64 noundef %6, i64 noundef %7, i64 noundef %8, i32 noundef %9) #15 {
  %11 = icmp eq i32 %9, 0
  %12 = or i64 %0, 2
  %13 = select i1 %11, i64 %0, i64 %12
  %14 = and i64 %13, -225
  %15 = zext i32 %1 to i64
  %16 = shl nuw nsw i64 %15, 5
  %17 = or i64 %14, %16
  %18 = tail call <2 x i64> @__ockl_hostcall_preview(i32 noundef 2, i64 noundef %17, i64 noundef %2, i64 noundef %3, i64 noundef %4, i64 noundef %5, i64 noundef %6, i64 noundef %7, i64 noundef %8) #24
  %19 = extractelement <2 x i64> %18, i64 0
  ret i64 %19
}

; Function Attrs: convergent norecurse nounwind
define internal i64 @__ockl_fprintf_append_string_n(i64 noundef %0, ptr noundef readonly %1, i64 noundef %2, i32 noundef %3) #15 {
  %5 = icmp eq i32 %3, 0
  %6 = or i64 %0, 2
  %7 = select i1 %5, i64 %0, i64 %6
  %8 = icmp eq ptr %1, null
  br i1 %8, label %9, label %13

9:                                                ; preds = %4
  %10 = and i64 %7, -225
  %11 = or i64 %10, 32
  %12 = tail call <2 x i64> @__ockl_hostcall_preview(i32 noundef 2, i64 noundef %11, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #24
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
  %33 = load i8, ptr %19, align 1, !tbaa !38
  %34 = zext i8 %33 to i64
  %35 = getelementptr inbounds i8, ptr %19, i64 1
  %36 = load i8, ptr %35, align 1, !tbaa !38
  %37 = zext i8 %36 to i64
  %38 = shl nuw nsw i64 %37, 8
  %39 = or i64 %38, %34
  %40 = getelementptr inbounds i8, ptr %19, i64 2
  %41 = load i8, ptr %40, align 1, !tbaa !38
  %42 = zext i8 %41 to i64
  %43 = shl nuw nsw i64 %42, 16
  %44 = or i64 %39, %43
  %45 = getelementptr inbounds i8, ptr %19, i64 3
  %46 = load i8, ptr %45, align 1, !tbaa !38
  %47 = zext i8 %46 to i64
  %48 = shl nuw nsw i64 %47, 24
  %49 = or i64 %44, %48
  %50 = getelementptr inbounds i8, ptr %19, i64 4
  %51 = load i8, ptr %50, align 1, !tbaa !38
  %52 = zext i8 %51 to i64
  %53 = shl nuw nsw i64 %52, 32
  %54 = or i64 %49, %53
  %55 = getelementptr inbounds i8, ptr %19, i64 5
  %56 = load i8, ptr %55, align 1, !tbaa !38
  %57 = zext i8 %56 to i64
  %58 = shl nuw nsw i64 %57, 40
  %59 = or i64 %54, %58
  %60 = getelementptr inbounds i8, ptr %19, i64 6
  %61 = load i8, ptr %60, align 1, !tbaa !38
  %62 = zext i8 %61 to i64
  %63 = shl nuw nsw i64 %62, 48
  %64 = or i64 %59, %63
  %65 = getelementptr inbounds i8, ptr %19, i64 7
  %66 = load i8, ptr %65, align 1, !tbaa !38
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
  %77 = load i8, ptr %76, align 1, !tbaa !38
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
  %93 = load i8, ptr %86, align 1, !tbaa !38
  %94 = zext i8 %93 to i64
  %95 = getelementptr inbounds i8, ptr %86, i64 1
  %96 = load i8, ptr %95, align 1, !tbaa !38
  %97 = zext i8 %96 to i64
  %98 = shl nuw nsw i64 %97, 8
  %99 = or i64 %98, %94
  %100 = getelementptr inbounds i8, ptr %86, i64 2
  %101 = load i8, ptr %100, align 1, !tbaa !38
  %102 = zext i8 %101 to i64
  %103 = shl nuw nsw i64 %102, 16
  %104 = or i64 %99, %103
  %105 = getelementptr inbounds i8, ptr %86, i64 3
  %106 = load i8, ptr %105, align 1, !tbaa !38
  %107 = zext i8 %106 to i64
  %108 = shl nuw nsw i64 %107, 24
  %109 = or i64 %104, %108
  %110 = getelementptr inbounds i8, ptr %86, i64 4
  %111 = load i8, ptr %110, align 1, !tbaa !38
  %112 = zext i8 %111 to i64
  %113 = shl nuw nsw i64 %112, 32
  %114 = or i64 %109, %113
  %115 = getelementptr inbounds i8, ptr %86, i64 5
  %116 = load i8, ptr %115, align 1, !tbaa !38
  %117 = zext i8 %116 to i64
  %118 = shl nuw nsw i64 %117, 40
  %119 = or i64 %114, %118
  %120 = getelementptr inbounds i8, ptr %86, i64 6
  %121 = load i8, ptr %120, align 1, !tbaa !38
  %122 = zext i8 %121 to i64
  %123 = shl nuw nsw i64 %122, 48
  %124 = or i64 %119, %123
  %125 = getelementptr inbounds i8, ptr %86, i64 7
  %126 = load i8, ptr %125, align 1, !tbaa !38
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
  %137 = load i8, ptr %136, align 1, !tbaa !38
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
  %153 = load i8, ptr %146, align 1, !tbaa !38
  %154 = zext i8 %153 to i64
  %155 = getelementptr inbounds i8, ptr %146, i64 1
  %156 = load i8, ptr %155, align 1, !tbaa !38
  %157 = zext i8 %156 to i64
  %158 = shl nuw nsw i64 %157, 8
  %159 = or i64 %158, %154
  %160 = getelementptr inbounds i8, ptr %146, i64 2
  %161 = load i8, ptr %160, align 1, !tbaa !38
  %162 = zext i8 %161 to i64
  %163 = shl nuw nsw i64 %162, 16
  %164 = or i64 %159, %163
  %165 = getelementptr inbounds i8, ptr %146, i64 3
  %166 = load i8, ptr %165, align 1, !tbaa !38
  %167 = zext i8 %166 to i64
  %168 = shl nuw nsw i64 %167, 24
  %169 = or i64 %164, %168
  %170 = getelementptr inbounds i8, ptr %146, i64 4
  %171 = load i8, ptr %170, align 1, !tbaa !38
  %172 = zext i8 %171 to i64
  %173 = shl nuw nsw i64 %172, 32
  %174 = or i64 %169, %173
  %175 = getelementptr inbounds i8, ptr %146, i64 5
  %176 = load i8, ptr %175, align 1, !tbaa !38
  %177 = zext i8 %176 to i64
  %178 = shl nuw nsw i64 %177, 40
  %179 = or i64 %174, %178
  %180 = getelementptr inbounds i8, ptr %146, i64 6
  %181 = load i8, ptr %180, align 1, !tbaa !38
  %182 = zext i8 %181 to i64
  %183 = shl nuw nsw i64 %182, 48
  %184 = or i64 %179, %183
  %185 = getelementptr inbounds i8, ptr %146, i64 7
  %186 = load i8, ptr %185, align 1, !tbaa !38
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
  %197 = load i8, ptr %196, align 1, !tbaa !38
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
  %213 = load i8, ptr %206, align 1, !tbaa !38
  %214 = zext i8 %213 to i64
  %215 = getelementptr inbounds i8, ptr %206, i64 1
  %216 = load i8, ptr %215, align 1, !tbaa !38
  %217 = zext i8 %216 to i64
  %218 = shl nuw nsw i64 %217, 8
  %219 = or i64 %218, %214
  %220 = getelementptr inbounds i8, ptr %206, i64 2
  %221 = load i8, ptr %220, align 1, !tbaa !38
  %222 = zext i8 %221 to i64
  %223 = shl nuw nsw i64 %222, 16
  %224 = or i64 %219, %223
  %225 = getelementptr inbounds i8, ptr %206, i64 3
  %226 = load i8, ptr %225, align 1, !tbaa !38
  %227 = zext i8 %226 to i64
  %228 = shl nuw nsw i64 %227, 24
  %229 = or i64 %224, %228
  %230 = getelementptr inbounds i8, ptr %206, i64 4
  %231 = load i8, ptr %230, align 1, !tbaa !38
  %232 = zext i8 %231 to i64
  %233 = shl nuw nsw i64 %232, 32
  %234 = or i64 %229, %233
  %235 = getelementptr inbounds i8, ptr %206, i64 5
  %236 = load i8, ptr %235, align 1, !tbaa !38
  %237 = zext i8 %236 to i64
  %238 = shl nuw nsw i64 %237, 40
  %239 = or i64 %234, %238
  %240 = getelementptr inbounds i8, ptr %206, i64 6
  %241 = load i8, ptr %240, align 1, !tbaa !38
  %242 = zext i8 %241 to i64
  %243 = shl nuw nsw i64 %242, 48
  %244 = or i64 %239, %243
  %245 = getelementptr inbounds i8, ptr %206, i64 7
  %246 = load i8, ptr %245, align 1, !tbaa !38
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
  %257 = load i8, ptr %256, align 1, !tbaa !38
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
  %273 = load i8, ptr %266, align 1, !tbaa !38
  %274 = zext i8 %273 to i64
  %275 = getelementptr inbounds i8, ptr %266, i64 1
  %276 = load i8, ptr %275, align 1, !tbaa !38
  %277 = zext i8 %276 to i64
  %278 = shl nuw nsw i64 %277, 8
  %279 = or i64 %278, %274
  %280 = getelementptr inbounds i8, ptr %266, i64 2
  %281 = load i8, ptr %280, align 1, !tbaa !38
  %282 = zext i8 %281 to i64
  %283 = shl nuw nsw i64 %282, 16
  %284 = or i64 %279, %283
  %285 = getelementptr inbounds i8, ptr %266, i64 3
  %286 = load i8, ptr %285, align 1, !tbaa !38
  %287 = zext i8 %286 to i64
  %288 = shl nuw nsw i64 %287, 24
  %289 = or i64 %284, %288
  %290 = getelementptr inbounds i8, ptr %266, i64 4
  %291 = load i8, ptr %290, align 1, !tbaa !38
  %292 = zext i8 %291 to i64
  %293 = shl nuw nsw i64 %292, 32
  %294 = or i64 %289, %293
  %295 = getelementptr inbounds i8, ptr %266, i64 5
  %296 = load i8, ptr %295, align 1, !tbaa !38
  %297 = zext i8 %296 to i64
  %298 = shl nuw nsw i64 %297, 40
  %299 = or i64 %294, %298
  %300 = getelementptr inbounds i8, ptr %266, i64 6
  %301 = load i8, ptr %300, align 1, !tbaa !38
  %302 = zext i8 %301 to i64
  %303 = shl nuw nsw i64 %302, 48
  %304 = or i64 %299, %303
  %305 = getelementptr inbounds i8, ptr %266, i64 7
  %306 = load i8, ptr %305, align 1, !tbaa !38
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
  %317 = load i8, ptr %316, align 1, !tbaa !38
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
  %333 = load i8, ptr %326, align 1, !tbaa !38
  %334 = zext i8 %333 to i64
  %335 = getelementptr inbounds i8, ptr %326, i64 1
  %336 = load i8, ptr %335, align 1, !tbaa !38
  %337 = zext i8 %336 to i64
  %338 = shl nuw nsw i64 %337, 8
  %339 = or i64 %338, %334
  %340 = getelementptr inbounds i8, ptr %326, i64 2
  %341 = load i8, ptr %340, align 1, !tbaa !38
  %342 = zext i8 %341 to i64
  %343 = shl nuw nsw i64 %342, 16
  %344 = or i64 %339, %343
  %345 = getelementptr inbounds i8, ptr %326, i64 3
  %346 = load i8, ptr %345, align 1, !tbaa !38
  %347 = zext i8 %346 to i64
  %348 = shl nuw nsw i64 %347, 24
  %349 = or i64 %344, %348
  %350 = getelementptr inbounds i8, ptr %326, i64 4
  %351 = load i8, ptr %350, align 1, !tbaa !38
  %352 = zext i8 %351 to i64
  %353 = shl nuw nsw i64 %352, 32
  %354 = or i64 %349, %353
  %355 = getelementptr inbounds i8, ptr %326, i64 5
  %356 = load i8, ptr %355, align 1, !tbaa !38
  %357 = zext i8 %356 to i64
  %358 = shl nuw nsw i64 %357, 40
  %359 = or i64 %354, %358
  %360 = getelementptr inbounds i8, ptr %326, i64 6
  %361 = load i8, ptr %360, align 1, !tbaa !38
  %362 = zext i8 %361 to i64
  %363 = shl nuw nsw i64 %362, 48
  %364 = or i64 %359, %363
  %365 = getelementptr inbounds i8, ptr %326, i64 7
  %366 = load i8, ptr %365, align 1, !tbaa !38
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
  %377 = load i8, ptr %376, align 1, !tbaa !38
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
  %393 = load i8, ptr %386, align 1, !tbaa !38
  %394 = zext i8 %393 to i64
  %395 = getelementptr inbounds i8, ptr %386, i64 1
  %396 = load i8, ptr %395, align 1, !tbaa !38
  %397 = zext i8 %396 to i64
  %398 = shl nuw nsw i64 %397, 8
  %399 = or i64 %398, %394
  %400 = getelementptr inbounds i8, ptr %386, i64 2
  %401 = load i8, ptr %400, align 1, !tbaa !38
  %402 = zext i8 %401 to i64
  %403 = shl nuw nsw i64 %402, 16
  %404 = or i64 %399, %403
  %405 = getelementptr inbounds i8, ptr %386, i64 3
  %406 = load i8, ptr %405, align 1, !tbaa !38
  %407 = zext i8 %406 to i64
  %408 = shl nuw nsw i64 %407, 24
  %409 = or i64 %404, %408
  %410 = getelementptr inbounds i8, ptr %386, i64 4
  %411 = load i8, ptr %410, align 1, !tbaa !38
  %412 = zext i8 %411 to i64
  %413 = shl nuw nsw i64 %412, 32
  %414 = or i64 %409, %413
  %415 = getelementptr inbounds i8, ptr %386, i64 5
  %416 = load i8, ptr %415, align 1, !tbaa !38
  %417 = zext i8 %416 to i64
  %418 = shl nuw nsw i64 %417, 40
  %419 = or i64 %414, %418
  %420 = getelementptr inbounds i8, ptr %386, i64 6
  %421 = load i8, ptr %420, align 1, !tbaa !38
  %422 = zext i8 %421 to i64
  %423 = shl nuw nsw i64 %422, 48
  %424 = or i64 %419, %423
  %425 = getelementptr inbounds i8, ptr %386, i64 7
  %426 = load i8, ptr %425, align 1, !tbaa !38
  %427 = zext i8 %426 to i64
  %428 = shl nuw i64 %427, 56
  %429 = or i64 %424, %428
  br label %443

430:                                              ; preds = %430, %390
  %431 = phi i32 [ %441, %430 ], [ 0, %390 ]
  %432 = phi i64 [ %440, %430 ], [ 0, %390 ]
  %433 = zext i32 %431 to i64
  %434 = getelementptr inbounds i8, ptr %386, i64 %433
  %435 = load i8, ptr %434, align 1, !tbaa !38
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
  %450 = tail call <2 x i64> @__ockl_hostcall_preview(i32 noundef 2, i64 noundef %449, i64 noundef %88, i64 noundef %148, i64 noundef %208, i64 noundef %268, i64 noundef %328, i64 noundef %388, i64 noundef %444) #24
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
declare i64 @llvm.umin.i64(i64, i64) #23

; Function Attrs: convergent mustprogress nofree norecurse nosync nounwind readnone willreturn
define internal i64 @__ockl_get_local_size(i32 noundef %0) #10 {
  switch i32 %0, label %76 [
    i32 0, label %2
    i32 1, label %26
    i32 2, label %51
  ]

2:                                                ; preds = %1
  %3 = load i32, ptr addrspace(4) @__oclc_ABI_version, align 4, !tbaa !13
  %4 = icmp slt i32 %3, 500
  br i1 %4, label %5, label %17

5:                                                ; preds = %2
  %6 = tail call align 4 dereferenceable(64) ptr addrspace(4) @llvm.amdgcn.dispatch.ptr()
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %8 = getelementptr i8, ptr addrspace(4) %6, i64 4
  %9 = load i16, ptr addrspace(4) %8, align 4, !range !23, !invariant.load !24
  %10 = zext i16 %9 to i32
  %11 = getelementptr inbounds %0, ptr addrspace(4) %6, i64 0, i32 6
  %12 = load i32, ptr addrspace(4) %11, align 4, !tbaa !17
  %13 = mul i32 %7, %10
  %14 = sub i32 %12, %13
  %15 = tail call i32 @llvm.umin.i32(i32 %14, i32 %10)
  %16 = zext i32 %15 to i64
  br label %76

17:                                               ; preds = %2
  %18 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %19 = tail call ptr addrspace(4) @llvm.amdgcn.implicitarg.ptr()
  %20 = load i32, ptr addrspace(4) %19, align 4, !tbaa !13
  %21 = icmp ult i32 %18, %20
  %22 = select i1 %21, i64 6, i64 9
  %23 = getelementptr inbounds i16, ptr addrspace(4) %19, i64 %22
  %24 = load i16, ptr addrspace(4) %23, align 2, !tbaa !25
  %25 = zext i16 %24 to i64
  br label %76

26:                                               ; preds = %1
  %27 = load i32, ptr addrspace(4) @__oclc_ABI_version, align 4, !tbaa !13
  %28 = icmp slt i32 %27, 500
  br i1 %28, label %29, label %41

29:                                               ; preds = %26
  %30 = tail call align 4 dereferenceable(64) ptr addrspace(4) @llvm.amdgcn.dispatch.ptr()
  %31 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %32 = getelementptr i8, ptr addrspace(4) %30, i64 6
  %33 = load i16, ptr addrspace(4) %32, align 2, !range !23, !invariant.load !24
  %34 = zext i16 %33 to i32
  %35 = getelementptr inbounds %0, ptr addrspace(4) %30, i64 0, i32 7
  %36 = load i32, ptr addrspace(4) %35, align 8, !tbaa !26
  %37 = mul i32 %31, %34
  %38 = sub i32 %36, %37
  %39 = tail call i32 @llvm.umin.i32(i32 %38, i32 %34)
  %40 = zext i32 %39 to i64
  br label %76

41:                                               ; preds = %26
  %42 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %43 = tail call ptr addrspace(4) @llvm.amdgcn.implicitarg.ptr()
  %44 = getelementptr inbounds i32, ptr addrspace(4) %43, i64 1
  %45 = load i32, ptr addrspace(4) %44, align 4, !tbaa !13
  %46 = icmp ult i32 %42, %45
  %47 = select i1 %46, i64 7, i64 10
  %48 = getelementptr inbounds i16, ptr addrspace(4) %43, i64 %47
  %49 = load i16, ptr addrspace(4) %48, align 2, !tbaa !25
  %50 = zext i16 %49 to i64
  br label %76

51:                                               ; preds = %1
  %52 = load i32, ptr addrspace(4) @__oclc_ABI_version, align 4, !tbaa !13
  %53 = icmp slt i32 %52, 500
  br i1 %53, label %54, label %66

54:                                               ; preds = %51
  %55 = tail call align 4 dereferenceable(64) ptr addrspace(4) @llvm.amdgcn.dispatch.ptr()
  %56 = tail call i32 @llvm.amdgcn.workgroup.id.z()
  %57 = getelementptr i8, ptr addrspace(4) %55, i64 8
  %58 = load i16, ptr addrspace(4) %57, align 4, !range !23, !invariant.load !24
  %59 = zext i16 %58 to i32
  %60 = getelementptr inbounds %0, ptr addrspace(4) %55, i64 0, i32 8
  %61 = load i32, ptr addrspace(4) %60, align 4, !tbaa !27
  %62 = mul i32 %56, %59
  %63 = sub i32 %61, %62
  %64 = tail call i32 @llvm.umin.i32(i32 %63, i32 %59)
  %65 = zext i32 %64 to i64
  br label %76

66:                                               ; preds = %51
  %67 = tail call i32 @llvm.amdgcn.workgroup.id.z()
  %68 = tail call ptr addrspace(4) @llvm.amdgcn.implicitarg.ptr()
  %69 = getelementptr inbounds i32, ptr addrspace(4) %68, i64 2
  %70 = load i32, ptr addrspace(4) %69, align 4, !tbaa !13
  %71 = icmp ult i32 %67, %70
  %72 = select i1 %71, i64 8, i64 11
  %73 = getelementptr inbounds i16, ptr addrspace(4) %68, i64 %72
  %74 = load i16, ptr addrspace(4) %73, align 2, !tbaa !25
  %75 = zext i16 %74 to i64
  br label %76

76:                                               ; preds = %66, %54, %41, %29, %17, %5, %1
  %77 = phi i64 [ 1, %1 ], [ %16, %5 ], [ %25, %17 ], [ %40, %29 ], [ %50, %41 ], [ %65, %54 ], [ %75, %66 ]
  ret i64 %77
}

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.umin.i32(i32, i32) #23

; Function Attrs: convergent mustprogress nofree norecurse nosync nounwind readnone willreturn
define internal i64 @__ockl_get_local_id(i32 noundef %0) #10 {
  switch i32 %0, label %8 [
    i32 0, label %2
    i32 1, label %4
    i32 2, label %6
  ]

2:                                                ; preds = %1
  %3 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !12
  br label %8

4:                                                ; preds = %1
  %5 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !12
  br label %8

6:                                                ; preds = %1
  %7 = tail call i32 @llvm.amdgcn.workitem.id.z(), !range !12
  br label %8

8:                                                ; preds = %6, %4, %2, %1
  %9 = phi i32 [ %7, %6 ], [ %5, %4 ], [ %3, %2 ], [ 0, %1 ]
  %10 = zext i32 %9 to i64
  ret i64 %10
}

; Function Attrs: convergent mustprogress nofree norecurse nosync nounwind readnone willreturn
define internal i64 @__ockl_get_group_id(i32 noundef %0) #10 {
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

; Function Attrs: convergent mustprogress nofree norecurse nosync nounwind readnone willreturn
define internal i64 @__ockl_get_global_size(i32 noundef %0) #10 {
  switch i32 %0, label %58 [
    i32 0, label %2
    i32 1, label %20
    i32 2, label %39
  ]

2:                                                ; preds = %1
  %3 = load i32, ptr addrspace(4) @__oclc_ABI_version, align 4, !tbaa !13
  %4 = icmp slt i32 %3, 500
  br i1 %4, label %5, label %9

5:                                                ; preds = %2
  %6 = tail call align 4 dereferenceable(64) ptr addrspace(4) @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr inbounds %0, ptr addrspace(4) %6, i64 0, i32 6
  %8 = load i32, ptr addrspace(4) %7, align 4, !tbaa !17
  br label %58

9:                                                ; preds = %2
  %10 = tail call ptr addrspace(4) @llvm.amdgcn.implicitarg.ptr()
  %11 = load i32, ptr addrspace(4) %10, align 4, !tbaa !13
  %12 = getelementptr inbounds i16, ptr addrspace(4) %10, i64 6
  %13 = load i16, ptr addrspace(4) %12, align 4, !tbaa !25
  %14 = zext i16 %13 to i32
  %15 = mul i32 %11, %14
  %16 = getelementptr inbounds i16, ptr addrspace(4) %10, i64 9
  %17 = load i16, ptr addrspace(4) %16, align 2, !tbaa !25
  %18 = zext i16 %17 to i32
  %19 = add i32 %15, %18
  br label %58

20:                                               ; preds = %1
  %21 = load i32, ptr addrspace(4) @__oclc_ABI_version, align 4, !tbaa !13
  %22 = icmp slt i32 %21, 500
  br i1 %22, label %23, label %27

23:                                               ; preds = %20
  %24 = tail call align 4 dereferenceable(64) ptr addrspace(4) @llvm.amdgcn.dispatch.ptr()
  %25 = getelementptr inbounds %0, ptr addrspace(4) %24, i64 0, i32 7
  %26 = load i32, ptr addrspace(4) %25, align 8, !tbaa !26
  br label %58

27:                                               ; preds = %20
  %28 = tail call ptr addrspace(4) @llvm.amdgcn.implicitarg.ptr()
  %29 = getelementptr inbounds i32, ptr addrspace(4) %28, i64 1
  %30 = load i32, ptr addrspace(4) %29, align 4, !tbaa !13
  %31 = getelementptr inbounds i16, ptr addrspace(4) %28, i64 7
  %32 = load i16, ptr addrspace(4) %31, align 2, !tbaa !25
  %33 = zext i16 %32 to i32
  %34 = mul i32 %30, %33
  %35 = getelementptr inbounds i16, ptr addrspace(4) %28, i64 10
  %36 = load i16, ptr addrspace(4) %35, align 4, !tbaa !25
  %37 = zext i16 %36 to i32
  %38 = add i32 %34, %37
  br label %58

39:                                               ; preds = %1
  %40 = load i32, ptr addrspace(4) @__oclc_ABI_version, align 4, !tbaa !13
  %41 = icmp slt i32 %40, 500
  br i1 %41, label %42, label %46

42:                                               ; preds = %39
  %43 = tail call align 4 dereferenceable(64) ptr addrspace(4) @llvm.amdgcn.dispatch.ptr()
  %44 = getelementptr inbounds %0, ptr addrspace(4) %43, i64 0, i32 8
  %45 = load i32, ptr addrspace(4) %44, align 4, !tbaa !27
  br label %58

46:                                               ; preds = %39
  %47 = tail call ptr addrspace(4) @llvm.amdgcn.implicitarg.ptr()
  %48 = getelementptr inbounds i32, ptr addrspace(4) %47, i64 2
  %49 = load i32, ptr addrspace(4) %48, align 4, !tbaa !13
  %50 = getelementptr inbounds i16, ptr addrspace(4) %47, i64 8
  %51 = load i16, ptr addrspace(4) %50, align 4, !tbaa !25
  %52 = zext i16 %51 to i32
  %53 = mul i32 %49, %52
  %54 = getelementptr inbounds i16, ptr addrspace(4) %47, i64 11
  %55 = load i16, ptr addrspace(4) %54, align 2, !tbaa !25
  %56 = zext i16 %55 to i32
  %57 = add i32 %53, %56
  br label %58

58:                                               ; preds = %46, %42, %27, %23, %9, %5, %1
  %59 = phi i32 [ 1, %1 ], [ %8, %5 ], [ %19, %9 ], [ %26, %23 ], [ %38, %27 ], [ %45, %42 ], [ %57, %46 ]
  %60 = zext i32 %59 to i64
  ret i64 %60
}

attributes #0 = { convergent mustprogress noinline noreturn nounwind optnone "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx90a" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot3-insts,+dot4-insts,+dot5-insts,+dot6-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+gfx90a-insts,+mai-insts,+s-memrealtime,+s-memtime-inst" }
attributes #1 = { cold noreturn nounwind }
attributes #2 = { convergent mustprogress noinline nounwind optnone "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx90a" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot3-insts,+dot4-insts,+dot5-insts,+dot6-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+gfx90a-insts,+mai-insts,+s-memrealtime,+s-memtime-inst" }
attributes #3 = { argmemonly nocallback nofree nounwind willreturn }
attributes #4 = { nounwind readnone willreturn }
attributes #5 = { convergent noinline nounwind optnone "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx90a" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot3-insts,+dot4-insts,+dot5-insts,+dot6-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+gfx90a-insts,+mai-insts,+s-memrealtime,+s-memtime-inst" }
attributes #6 = { convergent mustprogress noinline norecurse nounwind optnone "amdgpu-flat-work-group-size"="1,1024" "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx90a" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot3-insts,+dot4-insts,+dot5-insts,+dot6-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+gfx90a-insts,+mai-insts,+s-memrealtime,+s-memtime-inst" "uniform-work-group-size"="true" }
attributes #7 = { convergent nounwind willreturn }
attributes #8 = { convergent mustprogress norecurse nounwind willreturn "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" }
attributes #9 = { nounwind readnone speculatable willreturn }
attributes #10 = { convergent mustprogress nofree norecurse nosync nounwind readnone willreturn "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" }
attributes #11 = { convergent inaccessiblememonly nounwind willreturn }
attributes #12 = { convergent mustprogress nofree norecurse nounwind readnone willreturn "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" }
attributes #13 = { convergent norecurse nounwind "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" }
attributes #14 = { nounwind willreturn }
attributes #15 = { convergent norecurse nounwind "frame-pointer"="all" "min-legal-vector-width"="128" "no-trapping-math"="true" "stack-protector-buffer-size"="8" }
attributes #16 = { convergent noinline norecurse nounwind optnone "frame-pointer"="all" "min-legal-vector-width"="128" "no-trapping-math"="true" "stack-protector-buffer-size"="8" }
attributes #17 = { argmemonly nocallback nofree nosync nounwind willreturn }
attributes #18 = { convergent nounwind readnone willreturn }
attributes #19 = { argmemonly convergent mustprogress nofree norecurse nosync nounwind readonly willreturn "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" }
attributes #20 = { convergent mustprogress nofree norecurse nounwind willreturn "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" }
attributes #21 = { nounwind }
attributes #22 = { nounwind readonly }
attributes #23 = { nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #24 = { convergent nounwind }
attributes #25 = { convergent }

!llvm.module.flags = !{!0, !1, !2}
!llvm.ident = !{!3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3}
!opencl.ocl.version = !{!4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 7, !"frame-pointer", i32 2}
!3 = !{!"clang version 16.0.0 (https://github.com/llvm/llvm-project 809855b56f06dd7182685f88fbbc64111df9339a)"}
!4 = !{i32 2, i32 0}
!5 = distinct !{!5, !6}
!6 = !{!"llvm.loop.mustprogress"}
!7 = distinct !{!7, !6}
!8 = distinct !{!8, !6}
!9 = distinct !{!9, !6}
!10 = distinct !{!10, !6}
!11 = distinct !{!11, !6}
!12 = !{i32 0, i32 1024}
!13 = !{!14, !14, i64 0}
!14 = !{!"int", !15, i64 0}
!15 = !{!"omnipotent char", !16, i64 0}
!16 = !{!"Simple C/C++ TBAA"}
!17 = !{!18, !14, i64 12}
!18 = !{!"hsa_kernel_dispatch_packet_s", !19, i64 0, !19, i64 2, !19, i64 4, !19, i64 6, !19, i64 8, !19, i64 10, !14, i64 12, !14, i64 16, !14, i64 20, !14, i64 24, !14, i64 28, !20, i64 32, !21, i64 40, !20, i64 48, !22, i64 56}
!19 = !{!"short", !15, i64 0}
!20 = !{!"long", !15, i64 0}
!21 = !{!"any pointer", !15, i64 0}
!22 = !{!"hsa_signal_s", !20, i64 0}
!23 = !{i16 1, i16 1025}
!24 = !{}
!25 = !{!19, !19, i64 0}
!26 = !{!18, !14, i64 16}
!27 = !{!18, !14, i64 20}
!28 = !{!20, !20, i64 0}
!29 = !{!30, !20, i64 16}
!30 = !{!"mg_info", !21, i64 0, !14, i64 8, !14, i64 12, !20, i64 16, !20, i64 24}
!31 = !{!30, !21, i64 0}
!32 = !{!30, !14, i64 12}
!33 = !{!21, !21, i64 0}
!34 = !{!35, !21, i64 0}
!35 = !{!"", !21, i64 0, !21, i64 8, !22, i64 16, !20, i64 24, !20, i64 32, !20, i64 40}
!36 = !{!35, !20, i64 40}
!37 = !{!35, !21, i64 8}
!38 = !{!15, !15, i64 0}
!39 = !{i64 2509}
!40 = !{!"exec"}
!41 = !{!42, !14, i64 16}
!42 = !{!"", !20, i64 0, !20, i64 8, !14, i64 16, !14, i64 20}
!43 = !{!42, !20, i64 8}
!44 = !{!42, !14, i64 20}
!45 = !{!42, !20, i64 0}
!46 = !{!47, !20, i64 16}
!47 = !{!"amd_signal_s", !20, i64 0, !15, i64 8, !20, i64 16, !14, i64 24, !14, i64 28, !20, i64 32, !20, i64 40, !15, i64 48, !15, i64 56}
!48 = !{!47, !14, i64 24}

; __CLANG_OFFLOAD_BUNDLE____END__ hip-amdgcn-amd-amdhsa-gfx90a

; __CLANG_OFFLOAD_BUNDLE____START__ host-x86_64-unknown-linux-gnu
; ModuleID = 'main.cpp'
source_filename = "main.cpp"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.dim3 = type { i32, i32, i32 }

$_ZSt6fill_nIPiiiET_S1_T0_RKT1_ = comdat any

$_ZSt10accumulateIPiiET0_T_S2_S1_ = comdat any

$_ZN4dim3C2Ejjj = comdat any

$_ZSt10__fill_n_aIPiiiEN9__gnu_cxx11__enable_ifIXsr11__is_scalarIT1_EE7__valueET_E6__typeES4_T0_RKS3_ = comdat any

$_ZSt12__niter_baseIPiET_S1_ = comdat any

$__hip_gpubin_handle = comdat any

@_Z16sum_kernel_blockPiS_i = constant ptr @_Z31__device_stub__sum_kernel_blockPiS_i, align 8
@.str = private unnamed_addr constant [44 x i8] c"Sum of 16M array number = %d, expecting %d\0A\00", align 1
@0 = private unnamed_addr constant [26 x i8] c"_Z16sum_kernel_blockPiS_i\00", align 1
@__hip_fatbin = external constant i8, section ".hip_fatbin"
@__hip_fatbin_wrapper = internal constant { i32, i32, ptr, ptr } { i32 1212764230, i32 1, ptr @__hip_fatbin, ptr null }, section ".hipFatBinSegment", align 8
@__hip_gpubin_handle = linkonce hidden global ptr null, comdat, align 8
@llvm.global_ctors = appending global [1 x { i32, ptr, ptr }] [{ i32, ptr, ptr } { i32 65535, ptr @__hip_module_ctor, ptr null }]

; Function Attrs: noinline norecurse optnone uwtable
define dso_local void @_Z31__device_stub__sum_kernel_blockPiS_i(ptr noundef %0, ptr noundef %1, i32 noundef %2) #0 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca %struct.dim3, align 8
  %8 = alloca %struct.dim3, align 8
  %9 = alloca i64, align 8
  %10 = alloca ptr, align 8
  %11 = alloca { i64, i32 }, align 8
  %12 = alloca { i64, i32 }, align 8
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  store i32 %2, ptr %6, align 4
  %13 = alloca ptr, i64 3, align 16
  %14 = getelementptr ptr, ptr %13, i32 0
  store ptr %4, ptr %14, align 8
  %15 = getelementptr ptr, ptr %13, i32 1
  store ptr %5, ptr %15, align 8
  %16 = getelementptr ptr, ptr %13, i32 2
  store ptr %6, ptr %16, align 8
  %17 = call i32 @__hipPopCallConfiguration(ptr %7, ptr %8, ptr %9, ptr %10)
  %18 = load i64, ptr %9, align 8
  %19 = load ptr, ptr %10, align 8
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %11, ptr align 8 %7, i64 12, i1 false)
  %20 = getelementptr inbounds { i64, i32 }, ptr %11, i32 0, i32 0
  %21 = load i64, ptr %20, align 8
  %22 = getelementptr inbounds { i64, i32 }, ptr %11, i32 0, i32 1
  %23 = load i32, ptr %22, align 8
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %12, ptr align 8 %8, i64 12, i1 false)
  %24 = getelementptr inbounds { i64, i32 }, ptr %12, i32 0, i32 0
  %25 = load i64, ptr %24, align 8
  %26 = getelementptr inbounds { i64, i32 }, ptr %12, i32 0, i32 1
  %27 = load i32, ptr %26, align 8
  %28 = call noundef i32 @hipLaunchKernel(ptr noundef @_Z16sum_kernel_blockPiS_i, i64 %21, i32 %23, i64 %25, i32 %27, ptr noundef %13, i64 noundef %18, ptr noundef %19)
  br label %29

29:                                               ; preds = %3
  ret void
}

declare i32 @__hipPopCallConfiguration(ptr, ptr, ptr, ptr)

declare i32 @hipLaunchKernel(ptr, i64, i32, i64, i32, ptr, i64, ptr)

; Function Attrs: argmemonly nocallback nofree nounwind willreturn
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #1

; Function Attrs: mustprogress noinline norecurse optnone uwtable
define dso_local noundef i32 @main() #2 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca %struct.dim3, align 4
  %12 = alloca %struct.dim3, align 4
  %13 = alloca { i64, i32 }, align 4
  %14 = alloca { i64, i32 }, align 4
  store i32 0, ptr %1, align 4
  store i32 16777216, ptr %2, align 4
  store i32 256, ptr %3, align 4
  %15 = load i32, ptr %2, align 4
  %16 = load i32, ptr %3, align 4
  %17 = add nsw i32 %15, %16
  %18 = sub nsw i32 %17, 1
  %19 = load i32, ptr %3, align 4
  %20 = sdiv i32 %18, %19
  store i32 %20, ptr %4, align 4
  %21 = load i32, ptr %3, align 4
  %22 = sext i32 %21 to i64
  %23 = mul i64 %22, 4
  %24 = trunc i64 %23 to i32
  store i32 %24, ptr %5, align 4
  %25 = call noundef i32 @_ZL16hipMallocManagedIiE10hipError_tPPT_mj(ptr noundef %7, i64 noundef 4, i32 noundef 1)
  %26 = load i32, ptr %2, align 4
  %27 = sext i32 %26 to i64
  %28 = mul i64 %27, 4
  %29 = call noundef i32 @_ZL16hipMallocManagedIiE10hipError_tPPT_mj(ptr noundef %8, i64 noundef %28, i32 noundef 1)
  %30 = load ptr, ptr %8, align 8
  %31 = load i32, ptr %2, align 4
  %32 = call i32 @rand() #8
  store i32 %32, ptr %9, align 4
  %33 = call noundef ptr @_ZSt6fill_nIPiiiET_S1_T0_RKT1_(ptr noundef %30, i32 noundef %31, ptr noundef nonnull align 4 dereferenceable(4) %9)
  %34 = load ptr, ptr %8, align 8
  %35 = load ptr, ptr %8, align 8
  %36 = load i32, ptr %2, align 4
  %37 = sext i32 %36 to i64
  %38 = getelementptr inbounds i32, ptr %35, i64 %37
  %39 = call noundef i32 @_ZSt10accumulateIPiiET0_T_S2_S1_(ptr noundef %34, ptr noundef %38, i32 noundef 0)
  store i32 %39, ptr %10, align 4
  %40 = load ptr, ptr %7, align 8
  %41 = call i32 @hipMemset(ptr noundef %40, i32 noundef 0, i64 noundef 4)
  br label %42

42:                                               ; preds = %0
  %43 = load i32, ptr %4, align 4
  call void @_ZN4dim3C2Ejjj(ptr noundef nonnull align 4 dereferenceable(12) %11, i32 noundef %43, i32 noundef 1, i32 noundef 1)
  %44 = load i32, ptr %3, align 4
  call void @_ZN4dim3C2Ejjj(ptr noundef nonnull align 4 dereferenceable(12) %12, i32 noundef %44, i32 noundef 1, i32 noundef 1)
  %45 = load i32, ptr %5, align 4
  %46 = sext i32 %45 to i64
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %13, ptr align 4 %11, i64 12, i1 false)
  %47 = getelementptr inbounds { i64, i32 }, ptr %13, i32 0, i32 0
  %48 = load i64, ptr %47, align 4
  %49 = getelementptr inbounds { i64, i32 }, ptr %13, i32 0, i32 1
  %50 = load i32, ptr %49, align 4
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %14, ptr align 4 %12, i64 12, i1 false)
  %51 = getelementptr inbounds { i64, i32 }, ptr %14, i32 0, i32 0
  %52 = load i64, ptr %51, align 4
  %53 = getelementptr inbounds { i64, i32 }, ptr %14, i32 0, i32 1
  %54 = load i32, ptr %53, align 4
  %55 = call i32 @__hipPushCallConfiguration(i64 %48, i32 %50, i64 %52, i32 %54, i64 noundef %46, ptr noundef null)
  %56 = icmp ne i32 %55, 0
  br i1 %56, label %61, label %57

57:                                               ; preds = %42
  %58 = load ptr, ptr %7, align 8
  %59 = load ptr, ptr %8, align 8
  %60 = load i32, ptr %2, align 4
  call void @_Z31__device_stub__sum_kernel_blockPiS_i(ptr noundef %58, ptr noundef %59, i32 noundef %60)
  br label %61

61:                                               ; preds = %57, %42
  br label %62

62:                                               ; preds = %61
  %63 = load ptr, ptr %7, align 8
  %64 = call i32 @hipMemcpy(ptr noundef %6, ptr noundef %63, i64 noundef 4, i32 noundef 2)
  %65 = load i32, ptr %6, align 4
  %66 = load i32, ptr %10, align 4
  %67 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %65, i32 noundef %66)
  %68 = load ptr, ptr %7, align 8
  %69 = call i32 @hipFree(ptr noundef %68)
  %70 = load ptr, ptr %8, align 8
  %71 = call i32 @hipFree(ptr noundef %70)
  %72 = load i32, ptr %1, align 4
  ret i32 %72
}

; Function Attrs: mustprogress noinline optnone uwtable
define internal noundef i32 @_ZL16hipMallocManagedIiE10hipError_tPPT_mj(ptr noundef %0, i64 noundef %1, i32 noundef %2) #3 {
  %4 = alloca ptr, align 8
  %5 = alloca i64, align 8
  %6 = alloca i32, align 4
  store ptr %0, ptr %4, align 8
  store i64 %1, ptr %5, align 8
  store i32 %2, ptr %6, align 4
  %7 = load ptr, ptr %4, align 8
  %8 = load i64, ptr %5, align 8
  %9 = load i32, ptr %6, align 4
  %10 = call i32 @hipMallocManaged(ptr noundef %7, i64 noundef %8, i32 noundef %9)
  ret i32 %10
}

; Function Attrs: mustprogress noinline optnone uwtable
define linkonce_odr dso_local noundef ptr @_ZSt6fill_nIPiiiET_S1_T0_RKT1_(ptr noundef %0, i32 noundef %1, ptr noundef nonnull align 4 dereferenceable(4) %2) #3 comdat {
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  %6 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8
  store i32 %1, ptr %5, align 4
  store ptr %2, ptr %6, align 8
  %7 = load ptr, ptr %4, align 8
  %8 = call noundef ptr @_ZSt12__niter_baseIPiET_S1_(ptr noundef %7)
  %9 = load i32, ptr %5, align 4
  %10 = load ptr, ptr %6, align 8
  %11 = call noundef ptr @_ZSt10__fill_n_aIPiiiEN9__gnu_cxx11__enable_ifIXsr11__is_scalarIT1_EE7__valueET_E6__typeES4_T0_RKS3_(ptr noundef %8, i32 noundef %9, ptr noundef nonnull align 4 dereferenceable(4) %10)
  ret ptr %11
}

; Function Attrs: nounwind
declare i32 @rand() #4

; Function Attrs: mustprogress noinline nounwind optnone uwtable
define linkonce_odr dso_local noundef i32 @_ZSt10accumulateIPiiET0_T_S2_S1_(ptr noundef %0, ptr noundef %1, i32 noundef %2) #5 comdat {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  store i32 %2, ptr %6, align 4
  br label %7

7:                                                ; preds = %16, %3
  %8 = load ptr, ptr %4, align 8
  %9 = load ptr, ptr %5, align 8
  %10 = icmp ne ptr %8, %9
  br i1 %10, label %11, label %19

11:                                               ; preds = %7
  %12 = load i32, ptr %6, align 4
  %13 = load ptr, ptr %4, align 8
  %14 = load i32, ptr %13, align 4
  %15 = add nsw i32 %12, %14
  store i32 %15, ptr %6, align 4
  br label %16

16:                                               ; preds = %11
  %17 = load ptr, ptr %4, align 8
  %18 = getelementptr inbounds i32, ptr %17, i32 1
  store ptr %18, ptr %4, align 8
  br label %7, !llvm.loop !6

19:                                               ; preds = %7
  %20 = load i32, ptr %6, align 4
  ret i32 %20
}

declare i32 @hipMemset(ptr noundef, i32 noundef, i64 noundef) #6

declare i32 @__hipPushCallConfiguration(i64, i32, i64, i32, i64 noundef, ptr noundef) #6

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local void @_ZN4dim3C2Ejjj(ptr noundef nonnull align 4 dereferenceable(12) %0, i32 noundef %1, i32 noundef %2, i32 noundef %3) unnamed_addr #7 comdat align 2 {
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  store ptr %0, ptr %5, align 8
  store i32 %1, ptr %6, align 4
  store i32 %2, ptr %7, align 4
  store i32 %3, ptr %8, align 4
  %9 = load ptr, ptr %5, align 8
  %10 = getelementptr inbounds %struct.dim3, ptr %9, i32 0, i32 0
  %11 = load i32, ptr %6, align 4
  store i32 %11, ptr %10, align 4
  %12 = getelementptr inbounds %struct.dim3, ptr %9, i32 0, i32 1
  %13 = load i32, ptr %7, align 4
  store i32 %13, ptr %12, align 4
  %14 = getelementptr inbounds %struct.dim3, ptr %9, i32 0, i32 2
  %15 = load i32, ptr %8, align 4
  store i32 %15, ptr %14, align 4
  ret void
}

declare i32 @hipMemcpy(ptr noundef, ptr noundef, i64 noundef, i32 noundef) #6

declare i32 @printf(ptr noundef, ...) #6

declare i32 @hipFree(ptr noundef) #6

declare i32 @hipMallocManaged(ptr noundef, i64 noundef, i32 noundef) #6

; Function Attrs: mustprogress noinline nounwind optnone uwtable
define linkonce_odr dso_local noundef ptr @_ZSt10__fill_n_aIPiiiEN9__gnu_cxx11__enable_ifIXsr11__is_scalarIT1_EE7__valueET_E6__typeES4_T0_RKS3_(ptr noundef %0, i32 noundef %1, ptr noundef nonnull align 4 dereferenceable(4) %2) #5 comdat {
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  store ptr %0, ptr %4, align 8
  store i32 %1, ptr %5, align 4
  store ptr %2, ptr %6, align 8
  %9 = load ptr, ptr %6, align 8
  %10 = load i32, ptr %9, align 4
  store i32 %10, ptr %7, align 4
  %11 = load i32, ptr %5, align 4
  store i32 %11, ptr %8, align 4
  br label %12

12:                                               ; preds = %18, %3
  %13 = load i32, ptr %8, align 4
  %14 = icmp sgt i32 %13, 0
  br i1 %14, label %15, label %23

15:                                               ; preds = %12
  %16 = load i32, ptr %7, align 4
  %17 = load ptr, ptr %4, align 8
  store i32 %16, ptr %17, align 4
  br label %18

18:                                               ; preds = %15
  %19 = load i32, ptr %8, align 4
  %20 = add nsw i32 %19, -1
  store i32 %20, ptr %8, align 4
  %21 = load ptr, ptr %4, align 8
  %22 = getelementptr inbounds i32, ptr %21, i32 1
  store ptr %22, ptr %4, align 8
  br label %12, !llvm.loop !8

23:                                               ; preds = %12
  %24 = load ptr, ptr %4, align 8
  ret ptr %24
}

; Function Attrs: mustprogress noinline nounwind optnone uwtable
define linkonce_odr dso_local noundef ptr @_ZSt12__niter_baseIPiET_S1_(ptr noundef %0) #5 comdat {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  ret ptr %3
}

define internal void @__hip_register_globals(ptr %0) {
  %2 = call i32 @__hipRegisterFunction(ptr %0, ptr @_Z16sum_kernel_blockPiS_i, ptr @0, ptr @0, i32 -1, ptr null, ptr null, ptr null, ptr null, ptr null)
  ret void
}

declare i32 @__hipRegisterFunction(ptr, ptr, ptr, ptr, i32, ptr, ptr, ptr, ptr, ptr)

declare void @__hipRegisterVar(ptr, ptr, ptr, ptr, i32, i64, i32, i32)

declare void @__hipRegisterManagedVar(ptr, ptr, ptr, ptr, i64, i32)

declare void @__hipRegisterSurface(ptr, ptr, ptr, ptr, i32, i32)

declare void @__hipRegisterTexture(ptr, ptr, ptr, ptr, i32, i32, i32)

declare ptr @__hipRegisterFatBinary(ptr)

define internal void @__hip_module_ctor() {
  %1 = load ptr, ptr @__hip_gpubin_handle, align 8
  %2 = icmp eq ptr %1, null
  br i1 %2, label %3, label %5

3:                                                ; preds = %0
  %4 = call ptr @__hipRegisterFatBinary(ptr @__hip_fatbin_wrapper)
  store ptr %4, ptr @__hip_gpubin_handle, align 8
  br label %5

5:                                                ; preds = %3, %0
  %6 = load ptr, ptr @__hip_gpubin_handle, align 8
  call void @__hip_register_globals(ptr %6)
  %7 = call i32 @atexit(ptr @__hip_module_dtor)
  ret void
}

declare void @__hipUnregisterFatBinary(ptr)

define internal void @__hip_module_dtor() {
  %1 = load ptr, ptr @__hip_gpubin_handle, align 8
  %2 = icmp ne ptr %1, null
  br i1 %2, label %3, label %4

3:                                                ; preds = %0
  call void @__hipUnregisterFatBinary(ptr %1)
  store ptr null, ptr @__hip_gpubin_handle, align 8
  br label %4

4:                                                ; preds = %3, %0
  ret void
}

declare i32 @atexit(ptr)

attributes #0 = { noinline norecurse optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { argmemonly nocallback nofree nounwind willreturn }
attributes #2 = { mustprogress noinline norecurse optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { mustprogress noinline optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { mustprogress noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #8 = { nounwind }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{!"clang version 16.0.0 (https://github.com/llvm/llvm-project 809855b56f06dd7182685f88fbbc64111df9339a)"}
!6 = distinct !{!6, !7}
!7 = !{!"llvm.loop.mustprogress"}
!8 = distinct !{!8, !7}

; __CLANG_OFFLOAD_BUNDLE____END__ host-x86_64-unknown-linux-gnu

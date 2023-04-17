; ModuleID = 'atest.ll.translated_test.bc'
source_filename = "mummergpu_kernel.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%struct.__cuda_builtin_blockIdx_t = type { i8 }
%struct.__cuda_builtin_blockDim_t = type { i8 }
%struct.__cuda_builtin_threadIdx_t = type { i8 }
%struct.texture = type { %struct.textureReference }
%struct.textureReference = type { i32, i32, i32, [3 x i32], %struct.hipChannelFormatDesc, i32, i32, i32, float, float, float, ptr, i32, i32 }
%struct.hipChannelFormatDesc = type { i32, i32, i32, i32, i32 }
%struct.TextureAddress = type { %union.anon }
%union.anon = type { i32 }
%struct.anon = type { i16, i16 }
%struct.HIP_vector_type_i8.3 = type { %struct.HIP_vector_base_i8.3 }
%struct.HIP_vector_base_i8.3 = type { %union_i8_3.anon }
%union_i8_3.anon = type { %struct.HIP_Native_vector_base_i8.3 }
%struct.HIP_Native_vector_base_i8.3 = type { [3 x i8] }
%struct.i8_3.anon = type { i8, i8, i8 }
%struct.HIP_vector_type_int.4 = type { %struct.HIP_vector_base_int.4 }
%struct.HIP_vector_base_int.4 = type { %union_i32_4.anon }
%union_i32_4.anon = type { <4 x i32> }
%struct.uint4 = type { i32, i32, i32, i32 }
%struct.i32_4.anon = type { i32, i32, i32, i32 }
%struct.HIP_vector_type_int.2 = type { %struct.HIP_vector_base_int.2 }
%struct.HIP_vector_base_int.2 = type { %union_I32_2.anon }
%union_I32_2.anon = type { <2 x i32> }
%struct.i32_2.anon = type { i32, i32 }
%struct._MatchCoord = type { %union.anon.0 }
%union.anon.0 = type { %struct.int2 }
%struct.int2 = type { i32, i32 }
%struct._PixelOfChildren = type { %union.anon.2 }
%union.anon.2 = type { %struct.uint4 }
%struct._PixelOfNode = type { %union.anon.6 }
%union.anon.6 = type { %struct.uint4 }
%struct.anon.4 = type { %struct.uchar3, %struct.uchar3, %struct.uchar3, %struct.uchar3, %struct.uchar3, i8 }
%struct.uchar3 = type { i8, i8, i8 }
%struct.anon.7 = type { %struct.uchar3, %struct.uchar3, %struct.uchar3, %struct.uchar3, %struct.uchar3, i8 }

$_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_xEv = comdat any

$_ZN25__cuda_builtin_blockDim_t17__fetch_builtin_xEv = comdat any

$_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_xEv = comdat any

@blockIdx = extern_weak dso_local addrspace(1) global %struct.__cuda_builtin_blockIdx_t, align 1
@blockDim = extern_weak dso_local addrspace(1) global %struct.__cuda_builtin_blockDim_t, align 1
@threadIdx = extern_weak dso_local addrspace(1) global %struct.__cuda_builtin_threadIdx_t, align 1
@llvm.compiler.used = appending global [2 x ptr] [ptr addrspacecast (ptr addrspace(1) @nodetex to ptr), ptr addrspacecast (ptr addrspace(1) @childrentex to ptr)], section "llvm.metadata"
@nodetex = addrspace(1) externally_initialized global %struct.texture undef
@childrentex = addrspace(1) externally_initialized global %struct.texture undef
@reftex = addrspace(1) externally_initialized global %struct.texture undef
@qrytex = addrspace(1) externally_initialized global %struct.texture undef

; Function Attrs: convergent mustprogress noinline nounwind optnone
define dso_local noundef i32 @_Z7addr2idj(i32 noundef %0) #0 {
  %2 = alloca i32, align 4, addrspace(5)
  %3 = addrspacecast ptr addrspace(5) %2 to ptr
  %4 = alloca i32, align 4, addrspace(5)
  %5 = addrspacecast ptr addrspace(5) %4 to ptr
  %6 = alloca i32, align 4, addrspace(5)
  %7 = addrspacecast ptr addrspace(5) %6 to ptr
  %8 = alloca i32, align 4, addrspace(5)
  %9 = addrspacecast ptr addrspace(5) %8 to ptr
  store i32 %0, ptr %3, align 4
  %10 = load i32, ptr %3, align 4
  %11 = lshr i32 %10, 16
  %12 = and i32 %11, 31
  store i32 %12, ptr %5, align 4
  %13 = load i32, ptr %3, align 4
  %14 = lshr i32 %13, 16
  %15 = lshr i32 %14, 5
  store i32 %15, ptr %7, align 4
  %16 = load i32, ptr %3, align 4
  %17 = and i32 %16, 65535
  %18 = shl i32 %17, 5
  %19 = load i32, ptr %5, align 4
  %20 = add i32 %18, %19
  store i32 %20, ptr %9, align 4
  %21 = load i32, ptr %9, align 4
  %22 = load i32, ptr %7, align 4
  %23 = shl i32 %22, 17
  %24 = add nsw i32 %21, %23
  ret i32 %24
}

; Function Attrs: convergent mustprogress noinline nounwind optnone
define dso_local %struct.TextureAddress @_Z7id2addri(i32 noundef %0) #0 {
  %2 = alloca %struct.TextureAddress, align 4, addrspace(5)
  %3 = addrspacecast ptr addrspace(5) %2 to ptr
  %4 = alloca i32, align 4, addrspace(5)
  %5 = addrspacecast ptr addrspace(5) %4 to ptr
  %6 = alloca i32, align 4, addrspace(5)
  %7 = addrspacecast ptr addrspace(5) %6 to ptr
  %8 = alloca i32, align 4, addrspace(5)
  %9 = addrspacecast ptr addrspace(5) %8 to ptr
  store i32 %0, ptr %5, align 4
  %10 = load i32, ptr %5, align 4
  %11 = and i32 %10, 131071
  store i32 %11, ptr %7, align 4
  %12 = load i32, ptr %5, align 4
  %13 = ashr i32 %12, 17
  store i32 %13, ptr %9, align 4
  %14 = load i32, ptr %9, align 4
  %15 = shl i32 %14, 5
  %16 = load i32, ptr %7, align 4
  %17 = and i32 %16, 31
  %18 = add nsw i32 %15, %17
  %19 = trunc i32 %18 to i16
  %20 = getelementptr inbounds %struct.TextureAddress, ptr %3, i32 0, i32 0
  %21 = getelementptr inbounds %struct.anon, ptr %20, i32 0, i32 1
  store i16 %19, ptr %21, align 2
  %22 = load i32, ptr %7, align 4
  %23 = ashr i32 %22, 5
  %24 = trunc i32 %23 to i16
  %25 = getelementptr inbounds %struct.TextureAddress, ptr %3, i32 0, i32 0
  %26 = getelementptr inbounds %struct.anon, ptr %25, i32 0, i32 0
  store i16 %24, ptr %26, align 4
  %27 = load %struct.TextureAddress, ptr %3, align 4
  ret %struct.TextureAddress %27
}

; Function Attrs: convergent mustprogress noinline nounwind optnone
define dso_local void @_Z14arrayToAddress6uchar3Rj(i32 noundef %0, ptr noundef nonnull align 4 dereferenceable(4) %1) #0 {
  %3 = alloca %struct.HIP_vector_type_i8.3, align 8, addrspace(5)
  %4 = addrspacecast ptr addrspace(5) %3 to ptr
  %5 = getelementptr inbounds %struct.HIP_vector_type_i8.3, ptr %4, i32 0, i32 0
  %6 = getelementptr inbounds %struct.HIP_vector_base_i8.3, ptr %5, i32 0, i32 0
  %7 = getelementptr inbounds %union_i8_3.anon, ptr %6, i32 0, i32 0
  %8 = alloca i32, align 4, addrspace(5)
  %9 = addrspacecast ptr addrspace(5) %8 to ptr
  %10 = getelementptr inbounds %struct.HIP_Native_vector_base_i8.3, ptr %7, i32 0, i32 0
  store i32 %0, ptr %9, align 4
  call void @llvm.memcpy.p0.p0.i64(ptr %10, ptr %9, i64 3, i1 false)
  %11 = alloca ptr, align 8, addrspace(5)
  %12 = addrspacecast ptr addrspace(5) %11 to ptr
  store ptr %1, ptr %12, align 8
  %13 = getelementptr inbounds %struct.HIP_vector_base_i8.3, ptr %4, i32 0, i32 0
  %14 = getelementptr inbounds %struct.i8_3.anon, ptr %13, i32 0, i32 0
  %15 = load i8, ptr %14, align 1
  %16 = zext i8 %15 to i32
  %17 = getelementptr inbounds %struct.HIP_vector_base_i8.3, ptr %4, i32 0, i32 0
  %18 = getelementptr inbounds %struct.i8_3.anon, ptr %17, i32 0, i32 2
  %19 = load i8, ptr %18, align 1
  %20 = zext i8 %19 to i32
  %21 = and i32 %20, 15
  %22 = shl i32 %21, 8
  %23 = or i32 %16, %22
  %24 = getelementptr inbounds %struct.HIP_vector_base_i8.3, ptr %4, i32 0, i32 0
  %25 = getelementptr inbounds %struct.i8_3.anon, ptr %24, i32 0, i32 1
  %26 = load i8, ptr %25, align 1
  %27 = zext i8 %26 to i32
  %28 = getelementptr inbounds %struct.HIP_vector_base_i8.3, ptr %4, i32 0, i32 0
  %29 = getelementptr inbounds %struct.i8_3.anon, ptr %28, i32 0, i32 2
  %30 = load i8, ptr %29, align 1
  %31 = zext i8 %30 to i32
  %32 = and i32 %31, 240
  %33 = shl i32 %32, 4
  %34 = or i32 %27, %33
  %35 = shl i32 %34, 16
  %36 = or i32 %23, %35
  %37 = load ptr, ptr %12, align 8
  store i32 %36, ptr %37, align 4
  ret void
}

; Function Attrs: convergent mustprogress noinline nounwind optnone
define dso_local noundef signext i8 @_Z6getRefiPc(i32 noundef %0, ptr noundef %1) #0 {
  %3 = alloca i32, align 4, addrspace(5)
  %4 = addrspacecast ptr addrspace(5) %3 to ptr
  %5 = alloca ptr, align 8, addrspace(5)
  %6 = addrspacecast ptr addrspace(5) %5 to ptr
  store i32 %0, ptr %4, align 4
  store ptr %1, ptr %6, align 8
  %7 = load ptr, ptr %6, align 8
  %8 = load i32, ptr %4, align 4
  %9 = sext i32 %8 to i64
  %10 = getelementptr inbounds i8, ptr %7, i64 %9
  %11 = load i8, ptr %10, align 1
  ret i8 %11
}

; Function Attrs: convergent mustprogress noinline nounwind optnone
define dso_local noundef signext i8 @_Z2rcc(i8 noundef signext %0) #0 {
  %2 = alloca i8, align 1, addrspace(5)
  %3 = addrspacecast ptr addrspace(5) %2 to ptr
  %4 = alloca i8, align 1, addrspace(5)
  %5 = addrspacecast ptr addrspace(5) %4 to ptr
  store i8 %0, ptr %5, align 1
  %6 = load i8, ptr %5, align 1
  %7 = sext i8 %6 to i32
  switch i32 %7, label %13 [
    i32 65, label %8
    i32 67, label %9
    i32 71, label %10
    i32 84, label %11
    i32 113, label %12
  ]

8:                                                ; preds = %1
  store i8 84, ptr %3, align 1
  br label %15

9:                                                ; preds = %1
  store i8 71, ptr %3, align 1
  br label %15

10:                                               ; preds = %1
  store i8 67, ptr %3, align 1
  br label %15

11:                                               ; preds = %1
  store i8 65, ptr %3, align 1
  br label %15

12:                                               ; preds = %1
  store i8 0, ptr %3, align 1
  br label %15

13:                                               ; preds = %1
  %14 = load i8, ptr %5, align 1
  store i8 %14, ptr %3, align 1
  br label %15

15:                                               ; preds = %13, %12, %11, %10, %9, %8
  %16 = load i8, ptr %3, align 1
  ret i8 %16
}

; Function Attrs: convergent mustprogress noinline nounwind optnone
define dso_local %struct.HIP_vector_type_int.4 @_Z7getNodejb(i32 noundef %0, i1 noundef zeroext %1) #0 {
  %3 = alloca %struct.HIP_vector_type_int.4, align 16, addrspace(5)
  %4 = addrspacecast ptr addrspace(5) %3 to ptr
  %5 = alloca i32, align 4, addrspace(5)
  %6 = addrspacecast ptr addrspace(5) %5 to ptr
  %7 = alloca i8, align 1, addrspace(5)
  %8 = addrspacecast ptr addrspace(5) %7 to ptr
  %9 = alloca i64, align 4, addrspace(5)
  %10 = addrspacecast ptr addrspace(5) %9 to ptr
  store i32 %0, ptr %6, align 4
  %11 = zext i1 %1 to i8
  store i8 %11, ptr %8, align 1
  %12 = call i64 @llvm.nvvm.texsurf.handle.internal.p1(ptr addrspace(1) @nodetex)
  store i64 %12, ptr %10, align 4
  %13 = load i32, ptr %6, align 4
  %14 = and i32 %13, 65535
  %15 = uitofp i32 %14 to float
  %16 = load i32, ptr %6, align 4
  %17 = and i32 %16, -65536
  %18 = lshr i32 %17, 16
  %19 = uitofp i32 %18 to float
  %20 = load i64, ptr %10, align 4
  %21 = call %struct.uint4 @_ZL5tex2DI5uint4EN17__nv_tex_rmet_retIT_E4typeE7textureIS2_Li2EL19cudaTextureReadMode0EEff(i64 %20, float noundef %15, float noundef %19) #8
  %22 = getelementptr inbounds %struct.HIP_vector_base_int.4, ptr %4, i32 0, i32 0
  %23 = getelementptr inbounds %struct.i32_4.anon, ptr %22, i32 0, i32 0
  %24 = extractvalue %struct.uint4 %21, 0
  store i32 %24, ptr %23, align 16
  %25 = getelementptr inbounds %struct.HIP_vector_base_int.4, ptr %4, i32 0, i32 0
  %26 = getelementptr inbounds %struct.i32_4.anon, ptr %25, i32 0, i32 1
  %27 = extractvalue %struct.uint4 %21, 1
  store i32 %27, ptr %26, align 4
  %28 = getelementptr inbounds %struct.HIP_vector_base_int.4, ptr %4, i32 0, i32 0
  %29 = getelementptr inbounds %struct.i32_4.anon, ptr %28, i32 0, i32 2
  %30 = extractvalue %struct.uint4 %21, 2
  store i32 %30, ptr %29, align 8
  %31 = getelementptr inbounds %struct.HIP_vector_base_int.4, ptr %4, i32 0, i32 0
  %32 = getelementptr inbounds %struct.i32_4.anon, ptr %31, i32 0, i32 3
  %33 = extractvalue %struct.uint4 %21, 3
  store i32 %33, ptr %32, align 4
  %34 = load %struct.HIP_vector_type_int.4, ptr %4, align 16
  ret %struct.HIP_vector_type_int.4 %34
}

; Function Attrs: alwaysinline convergent mustprogress nounwind
define internal %struct.uint4 @_ZL5tex2DI5uint4EN17__nv_tex_rmet_retIT_E4typeE7textureIS2_Li2EL19cudaTextureReadMode0EEff(i64 %0, float noundef %1, float noundef %2) #1 {
  %4 = alloca %struct.uint4, align 16, addrspace(5)
  %5 = addrspacecast ptr addrspace(5) %4 to ptr
  %6 = alloca i64, align 4, addrspace(5)
  %7 = addrspacecast ptr addrspace(5) %6 to ptr
  %8 = alloca float, align 4, addrspace(5)
  %9 = addrspacecast ptr addrspace(5) %8 to ptr
  %10 = alloca float, align 4, addrspace(5)
  %11 = addrspacecast ptr addrspace(5) %10 to ptr
  %12 = alloca i64, align 4, addrspace(5)
  %13 = addrspacecast ptr addrspace(5) %12 to ptr
  store i64 %0, ptr %7, align 4
  store float %1, ptr %9, align 4
  store float %2, ptr %11, align 4
  %14 = load i64, ptr %7, align 4
  store i64 %14, ptr %13, align 4
  %15 = load float, ptr %9, align 4
  %16 = load float, ptr %11, align 4
  %17 = load i64, ptr %13, align 4
  call void @_ZN12_GLOBAL__N_110__cuda_tex11__tex_fetchINS0_5__TagILi54EEE5uint47textureIS4_Li2EL19cudaTextureReadMode0EEJffEEEvPT0_T1_DpT2_(ptr noundef %5, i64 %17, float noundef %15, float noundef %16) #8
  %18 = load %struct.uint4, ptr %5, align 16
  ret %struct.uint4 %18
}

; Function Attrs: nounwind readnone
declare i64 @llvm.nvvm.texsurf.handle.internal.p1(ptr addrspace(1)) #2

; Function Attrs: convergent mustprogress noinline nounwind optnone
define dso_local %struct.HIP_vector_type_int.4 @_Z11getChildrenjb(i32 noundef %0, i1 noundef zeroext %1) #0 {
  %3 = alloca %struct.HIP_vector_type_int.4, align 16, addrspace(5)
  %4 = addrspacecast ptr addrspace(5) %3 to ptr
  %5 = alloca i32, align 4, addrspace(5)
  %6 = addrspacecast ptr addrspace(5) %5 to ptr
  %7 = alloca i8, align 1, addrspace(5)
  %8 = addrspacecast ptr addrspace(5) %7 to ptr
  %9 = alloca i64, align 4, addrspace(5)
  %10 = addrspacecast ptr addrspace(5) %9 to ptr
  store i32 %0, ptr %6, align 4
  %11 = zext i1 %1 to i8
  store i8 %11, ptr %8, align 1
  %12 = call i64 @llvm.nvvm.texsurf.handle.internal.p1(ptr addrspace(1) @childrentex)
  store i64 %12, ptr %10, align 4
  %13 = load i32, ptr %6, align 4
  %14 = and i32 %13, 65535
  %15 = uitofp i32 %14 to float
  %16 = load i32, ptr %6, align 4
  %17 = and i32 %16, -65536
  %18 = lshr i32 %17, 16
  %19 = uitofp i32 %18 to float
  %20 = load i64, ptr %10, align 4
  %21 = call %struct.uint4 @_ZL5tex2DI5uint4EN17__nv_tex_rmet_retIT_E4typeE7textureIS2_Li2EL19cudaTextureReadMode0EEff(i64 %20, float noundef %15, float noundef %19) #8
  %22 = getelementptr inbounds %struct.HIP_vector_base_int.4, ptr %4, i32 0, i32 0
  %23 = getelementptr inbounds %struct.i32_4.anon, ptr %22, i32 0, i32 0
  %24 = extractvalue %struct.uint4 %21, 0
  store i32 %24, ptr %23, align 16
  %25 = getelementptr inbounds %struct.HIP_vector_base_int.4, ptr %4, i32 0, i32 0
  %26 = getelementptr inbounds %struct.i32_4.anon, ptr %25, i32 0, i32 1
  %27 = extractvalue %struct.uint4 %21, 1
  store i32 %27, ptr %26, align 4
  %28 = getelementptr inbounds %struct.HIP_vector_base_int.4, ptr %4, i32 0, i32 0
  %29 = getelementptr inbounds %struct.i32_4.anon, ptr %28, i32 0, i32 2
  %30 = extractvalue %struct.uint4 %21, 2
  store i32 %30, ptr %29, align 8
  %31 = getelementptr inbounds %struct.HIP_vector_base_int.4, ptr %4, i32 0, i32 0
  %32 = getelementptr inbounds %struct.i32_4.anon, ptr %31, i32 0, i32 3
  %33 = extractvalue %struct.uint4 %21, 3
  store i32 %33, ptr %32, align 4
  %34 = load %struct.HIP_vector_type_int.4, ptr %4, align 16
  ret %struct.HIP_vector_type_int.4 %34
}

; Function Attrs: convergent mustprogress noinline nounwind optnone
define dso_local void @_Z10set_resultjP11_MatchCoordiiii(i32 noundef %0, ptr noundef %1, i32 noundef %2, i32 noundef %3, i32 noundef %4, i32 noundef %5) #0 {
  %7 = alloca i32, align 4, addrspace(5)
  %8 = addrspacecast ptr addrspace(5) %7 to ptr
  %9 = alloca ptr, align 8, addrspace(5)
  %10 = addrspacecast ptr addrspace(5) %9 to ptr
  %11 = alloca i32, align 4, addrspace(5)
  %12 = addrspacecast ptr addrspace(5) %11 to ptr
  %13 = alloca i32, align 4, addrspace(5)
  %14 = addrspacecast ptr addrspace(5) %13 to ptr
  %15 = alloca i32, align 4, addrspace(5)
  %16 = addrspacecast ptr addrspace(5) %15 to ptr
  %17 = alloca i32, align 4, addrspace(5)
  %18 = addrspacecast ptr addrspace(5) %17 to ptr
  %19 = alloca %struct.HIP_vector_type_int.2, align 8, addrspace(5)
  %20 = addrspacecast ptr addrspace(5) %19 to ptr
  store i32 %0, ptr %8, align 4
  store ptr %1, ptr %10, align 8
  store i32 %2, ptr %12, align 4
  store i32 %3, ptr %14, align 4
  store i32 %4, ptr %16, align 4
  store i32 %5, ptr %18, align 4
  %21 = load i32, ptr %14, align 4
  %22 = load i32, ptr %16, align 4
  %23 = icmp sgt i32 %21, %22
  br i1 %23, label %24, label %39

24:                                               ; preds = %6
  %25 = load i32, ptr %18, align 4
  %26 = load i32, ptr %12, align 4
  %27 = or i32 %26, %25
  store i32 %27, ptr %12, align 4
  %28 = load i32, ptr %8, align 4
  %29 = load i32, ptr %12, align 4
  %30 = call [2 x i32] @_ZL9make_int2ii(i32 %28, i32 %29)
  %31 = getelementptr inbounds %struct.HIP_vector_base_int.2, ptr %20, i32 0, i32 0
  %32 = getelementptr inbounds %struct.i32_2.anon, ptr %31, i32 0, i32 0
  %33 = extractvalue [2 x i32] %30, 0
  store i32 %33, ptr %32, align 8
  %34 = getelementptr inbounds %struct.HIP_vector_base_int.2, ptr %20, i32 0, i32 0
  %35 = getelementptr inbounds %struct.i32_2.anon, ptr %34, i32 0, i32 1
  %36 = extractvalue [2 x i32] %30, 1
  store i32 %36, ptr %35, align 4
  %37 = load ptr, ptr %10, align 8
  %38 = getelementptr inbounds %struct._MatchCoord, ptr %37, i32 0, i32 0
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %38, ptr align 8 %20, i64 8, i1 false)
  br label %42

39:                                               ; preds = %6
  br label %40

40:                                               ; preds = %39
  br label %41

41:                                               ; preds = %40
  br label %42

42:                                               ; preds = %41, %24
  ret void
}

; Function Attrs: convergent mustprogress noinline norecurse nounwind optnone
define dso_local void @_Z15mummergpuKernelPvPcS0_PKiS2_ii(ptr noundef %0, ptr noundef %1, ptr noundef %2, ptr noundef %3, ptr noundef %4, i32 noundef %5, i32 noundef %6) #3 {
  %8 = alloca ptr, align 8, addrspace(5)
  %9 = addrspacecast ptr addrspace(5) %8 to ptr
  %10 = alloca ptr, align 8, addrspace(5)
  %11 = addrspacecast ptr addrspace(5) %10 to ptr
  %12 = alloca ptr, align 8, addrspace(5)
  %13 = addrspacecast ptr addrspace(5) %12 to ptr
  %14 = alloca ptr, align 8, addrspace(5)
  %15 = addrspacecast ptr addrspace(5) %14 to ptr
  %16 = alloca ptr, align 8, addrspace(5)
  %17 = addrspacecast ptr addrspace(5) %16 to ptr
  %18 = alloca i32, align 4, addrspace(5)
  %19 = addrspacecast ptr addrspace(5) %18 to ptr
  %20 = alloca i32, align 4, addrspace(5)
  %21 = addrspacecast ptr addrspace(5) %20 to ptr
  %22 = alloca i32, align 4, addrspace(5)
  %23 = addrspacecast ptr addrspace(5) %22 to ptr
  %24 = alloca i32, align 4, addrspace(5)
  %25 = addrspacecast ptr addrspace(5) %24 to ptr
  %26 = alloca i32, align 4, addrspace(5)
  %27 = addrspacecast ptr addrspace(5) %26 to ptr
  %28 = alloca i32, align 4, addrspace(5)
  %29 = addrspacecast ptr addrspace(5) %28 to ptr
  %30 = alloca i32, align 4, addrspace(5)
  %31 = addrspacecast ptr addrspace(5) %30 to ptr
  %32 = alloca i32, align 4, addrspace(5)
  %33 = addrspacecast ptr addrspace(5) %32 to ptr
  %34 = alloca ptr, align 8, addrspace(5)
  %35 = addrspacecast ptr addrspace(5) %34 to ptr
  %36 = alloca i32, align 4, addrspace(5)
  %37 = addrspacecast ptr addrspace(5) %36 to ptr
  %38 = alloca i32, align 4, addrspace(5)
  %39 = addrspacecast ptr addrspace(5) %38 to ptr
  %40 = alloca i32, align 4, addrspace(5)
  %41 = addrspacecast ptr addrspace(5) %40 to ptr
  %42 = alloca i32, align 4, addrspace(5)
  %43 = addrspacecast ptr addrspace(5) %42 to ptr
  %44 = alloca i8, align 1, addrspace(5)
  %45 = addrspacecast ptr addrspace(5) %44 to ptr
  %46 = alloca i32, align 4, addrspace(5)
  %47 = addrspacecast ptr addrspace(5) %46 to ptr
  %48 = alloca %struct._PixelOfChildren, align 16, addrspace(5)
  %49 = addrspacecast ptr addrspace(5) %48 to ptr
  %50 = alloca %struct.HIP_vector_type_int.4, align 16, addrspace(5)
  %51 = addrspacecast ptr addrspace(5) %50 to ptr
  %52 = alloca %struct.HIP_vector_type_i8.3, align 8, addrspace(5)
  %53 = addrspacecast ptr addrspace(5) %52 to ptr
  %54 = alloca %struct.HIP_vector_type_i8.3, align 8, addrspace(5)
  %55 = addrspacecast ptr addrspace(5) %54 to ptr
  %56 = alloca %struct.HIP_vector_type_i8.3, align 8, addrspace(5)
  %57 = addrspacecast ptr addrspace(5) %56 to ptr
  %58 = alloca %struct._PixelOfNode, align 16, addrspace(5)
  %59 = addrspacecast ptr addrspace(5) %58 to ptr
  %60 = alloca %struct.HIP_vector_type_int.4, align 16, addrspace(5)
  %61 = addrspacecast ptr addrspace(5) %60 to ptr
  %62 = alloca i32, align 4, addrspace(5)
  %63 = addrspacecast ptr addrspace(5) %62 to ptr
  %64 = alloca i32, align 4, addrspace(5)
  %65 = addrspacecast ptr addrspace(5) %64 to ptr
  %66 = alloca i32, align 4, addrspace(5)
  %67 = addrspacecast ptr addrspace(5) %66 to ptr
  %68 = alloca i32, align 4, addrspace(5)
  %69 = addrspacecast ptr addrspace(5) %68 to ptr
  %70 = alloca i32, align 4, addrspace(5)
  %71 = addrspacecast ptr addrspace(5) %70 to ptr
  %72 = alloca i8, align 1, addrspace(5)
  %73 = addrspacecast ptr addrspace(5) %72 to ptr
  %74 = alloca %struct._PixelOfNode, align 16, addrspace(5)
  %75 = addrspacecast ptr addrspace(5) %74 to ptr
  %76 = alloca %struct.HIP_vector_type_int.4, align 16, addrspace(5)
  %77 = addrspacecast ptr addrspace(5) %76 to ptr
  %78 = alloca %struct.HIP_vector_type_i8.3, align 8, addrspace(5)
  %79 = addrspacecast ptr addrspace(5) %78 to ptr
  store ptr %0, ptr %9, align 8
  store ptr %1, ptr %11, align 8
  store ptr %2, ptr %13, align 8
  store ptr %3, ptr %15, align 8
  store ptr %4, ptr %17, align 8
  store i32 %5, ptr %19, align 4
  store i32 %6, ptr %21, align 4
  %80 = call noundef i32 @_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_xEv() #8
  %81 = call noundef i32 @_ZN25__cuda_builtin_blockDim_t17__fetch_builtin_xEv() #8
  %82 = call noundef i32 @_ZL8__umul24jj(i32 noundef %80, i32 noundef %81) #8
  %83 = call noundef i32 @_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_xEv() #8
  %84 = add i32 %82, %83
  store i32 %84, ptr %23, align 4
  %85 = load i32, ptr %23, align 4
  %86 = load i32, ptr %19, align 4
  %87 = icmp sge i32 %85, %86
  br i1 %87, label %88, label %89

88:                                               ; preds = %7
  br label %388

89:                                               ; preds = %7
  br label %90

90:                                               ; preds = %89
  br label %91

91:                                               ; preds = %90
  %92 = load i32, ptr %23, align 4
  %93 = icmp eq i32 %92, 0
  br i1 %93, label %94, label %95

94:                                               ; preds = %91
  br label %95

95:                                               ; preds = %94, %91
  %96 = load ptr, ptr %17, align 8
  %97 = load i32, ptr %23, align 4
  %98 = sext i32 %97 to i64
  %99 = getelementptr inbounds i32, ptr %96, i64 %98
  %100 = load i32, ptr %99, align 4
  store i32 %100, ptr %25, align 4
  %101 = load ptr, ptr %15, align 8
  %102 = load i32, ptr %23, align 4
  %103 = sext i32 %102 to i64
  %104 = getelementptr inbounds i32, ptr %101, i64 %103
  %105 = load i32, ptr %104, align 4
  store i32 %105, ptr %27, align 4
  store i32 0, ptr %29, align 4
  store i32 0, ptr %31, align 4
  store i32 0, ptr %33, align 4
  %106 = load ptr, ptr %9, align 8
  %107 = load i32, ptr %27, align 4
  %108 = sext i32 %107 to i64
  %109 = getelementptr inbounds %struct._MatchCoord, ptr %106, i64 %108
  %110 = load i32, ptr %23, align 4
  %111 = load i32, ptr %21, align 4
  %112 = add nsw i32 %111, 1
  %113 = call noundef i32 @_ZL8__umul24jj(i32 noundef %110, i32 noundef %112) #8
  %114 = zext i32 %113 to i64
  %115 = sub i64 0, %114
  %116 = getelementptr inbounds %struct._MatchCoord, ptr %109, i64 %115
  store ptr %116, ptr %35, align 8
  %117 = load i32, ptr %27, align 4
  %118 = load ptr, ptr %11, align 8
  %119 = sext i32 %117 to i64
  %120 = getelementptr inbounds i8, ptr %118, i64 %119
  store ptr %120, ptr %11, align 8
  %121 = load i32, ptr %25, align 4
  %122 = load i32, ptr %21, align 4
  %123 = sub nsw i32 %121, %122
  store i32 %123, ptr %37, align 4
  store i32 0, ptr %39, align 4
  br label %124

124:                                              ; preds = %382, %95
  %125 = load i32, ptr %39, align 4
  %126 = load i32, ptr %37, align 4
  %127 = icmp sle i32 %125, %126
  br i1 %127, label %128, label %387

128:                                              ; preds = %124
  %129 = load i32, ptr %29, align 4
  %130 = icmp eq i32 %129, 0
  br i1 %130, label %134, label %131

131:                                              ; preds = %128
  %132 = load i32, ptr %33, align 4
  %133 = icmp slt i32 %132, 1
  br i1 %133, label %134, label %135

134:                                              ; preds = %131, %128
  store i32 65536, ptr %29, align 4
  store i32 1, ptr %33, align 4
  store i32 0, ptr %31, align 4
  br label %135

135:                                              ; preds = %134, %131
  %136 = load ptr, ptr %11, align 8
  %137 = load i32, ptr %39, align 4
  %138 = load i32, ptr %33, align 4
  %139 = add nsw i32 %137, %138
  %140 = sext i32 %139 to i64
  %141 = getelementptr inbounds i8, ptr %136, i64 %140
  %142 = load i8, ptr %141, align 1
  store i8 %142, ptr %45, align 1
  br label %143

143:                                              ; preds = %135
  br label %144

144:                                              ; preds = %143
  store i32 0, ptr %47, align 4
  br label %145

145:                                              ; preds = %343, %144
  %146 = load i8, ptr %45, align 1
  %147 = sext i8 %146 to i32
  %148 = icmp ne i32 %147, 0
  br i1 %148, label %149, label %344

149:                                              ; preds = %145
  br label %150

150:                                              ; preds = %149
  br label %151

151:                                              ; preds = %150
  %152 = load i32, ptr %29, align 4
  %153 = call %struct.uint4 @_Z11getChildrenjb(i32 noundef %152, i1 noundef zeroext false) #8
  %154 = getelementptr inbounds %struct.HIP_vector_base_int.4, ptr %51, i32 0, i32 0
  %155 = getelementptr inbounds %struct.i32_4.anon, ptr %154, i32 0, i32 0
  %156 = extractvalue %struct.uint4 %153, 0
  store i32 %156, ptr %155, align 16
  %157 = getelementptr inbounds %struct.HIP_vector_base_int.4, ptr %51, i32 0, i32 0
  %158 = getelementptr inbounds %struct.i32_4.anon, ptr %157, i32 0, i32 1
  %159 = extractvalue %struct.uint4 %153, 1
  store i32 %159, ptr %158, align 4
  %160 = getelementptr inbounds %struct.HIP_vector_base_int.4, ptr %51, i32 0, i32 0
  %161 = getelementptr inbounds %struct.i32_4.anon, ptr %160, i32 0, i32 2
  %162 = extractvalue %struct.uint4 %153, 2
  store i32 %162, ptr %161, align 8
  %163 = getelementptr inbounds %struct.HIP_vector_base_int.4, ptr %51, i32 0, i32 0
  %164 = getelementptr inbounds %struct.i32_4.anon, ptr %163, i32 0, i32 3
  %165 = extractvalue %struct.uint4 %153, 3
  store i32 %165, ptr %164, align 4
  %166 = getelementptr inbounds %struct._PixelOfChildren, ptr %49, i32 0, i32 0
  call void @llvm.memcpy.p0.p0.i64(ptr align 16 %166, ptr align 16 %51, i64 16, i1 false)
  %167 = load i32, ptr %29, align 4
  store i32 %167, ptr %43, align 4
  %168 = load i8, ptr %45, align 1
  %169 = sext i8 %168 to i32
  switch i32 %169, label %182 [
    i32 65, label %170
    i32 67, label %173
    i32 71, label %176
    i32 84, label %179
  ]

170:                                              ; preds = %151
  %171 = getelementptr inbounds %struct._PixelOfChildren, ptr %49, i32 0, i32 0
  %172 = getelementptr inbounds %struct.anon.4, ptr %171, i32 0, i32 0
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %53, ptr align 16 %172, i64 3, i1 false)
  br label %193

173:                                              ; preds = %151
  %174 = getelementptr inbounds %struct._PixelOfChildren, ptr %49, i32 0, i32 0
  %175 = getelementptr inbounds %struct.anon.4, ptr %174, i32 0, i32 1
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %53, ptr align 1 %175, i64 3, i1 false)
  br label %193

176:                                              ; preds = %151
  %177 = getelementptr inbounds %struct._PixelOfChildren, ptr %49, i32 0, i32 0
  %178 = getelementptr inbounds %struct.anon.4, ptr %177, i32 0, i32 2
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %53, ptr align 2 %178, i64 3, i1 false)
  br label %193

179:                                              ; preds = %151
  %180 = getelementptr inbounds %struct._PixelOfChildren, ptr %49, i32 0, i32 0
  %181 = getelementptr inbounds %struct.anon.4, ptr %180, i32 0, i32 3
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %53, ptr align 1 %181, i64 3, i1 false)
  br label %193

182:                                              ; preds = %151
  %183 = call %struct.uchar3 @_ZL11make_uchar3hhh(i8 noundef zeroext 0, i8 noundef zeroext 0, i8 noundef zeroext 0) #8
  %184 = getelementptr inbounds %struct.HIP_vector_base_i8.3, ptr %55, i32 0, i32 0
  %185 = getelementptr inbounds %struct.i8_3.anon, ptr %184, i32 0, i32 0
  %186 = extractvalue %struct.uchar3 %183, 0
  store i8 %186, ptr %185, align 1
  %187 = getelementptr inbounds %struct.HIP_vector_base_i8.3, ptr %55, i32 0, i32 0
  %188 = getelementptr inbounds %struct.i8_3.anon, ptr %187, i32 0, i32 1
  %189 = extractvalue %struct.uchar3 %183, 1
  store i8 %189, ptr %188, align 1
  %190 = getelementptr inbounds %struct.HIP_vector_base_i8.3, ptr %55, i32 0, i32 0
  %191 = getelementptr inbounds %struct.i8_3.anon, ptr %190, i32 0, i32 2
  %192 = extractvalue %struct.uchar3 %183, 2
  store i8 %192, ptr %191, align 1
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %53, ptr align 1 %55, i64 3, i1 false)
  br label %193

193:                                              ; preds = %182, %179, %176, %173, %170
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %57, ptr align 1 %53, i64 3, i1 false)
  call void @_Z14arrayToAddress6uchar3Rj(ptr noundef byval(%struct.uchar3) align 1 %57, ptr noundef nonnull align 4 dereferenceable(4) %29) #8
  br label %194

194:                                              ; preds = %193
  br label %195

195:                                              ; preds = %194
  %196 = load i32, ptr %29, align 4
  %197 = icmp eq i32 %196, 0
  br i1 %197, label %198, label %207

198:                                              ; preds = %195
  br label %199

199:                                              ; preds = %198
  br label %200

200:                                              ; preds = %199
  %201 = load i32, ptr %43, align 4
  %202 = load ptr, ptr %35, align 8
  %203 = load i32, ptr %33, align 4
  %204 = load i32, ptr %21, align 4
  call void @_Z10set_resultjP11_MatchCoordiiii(i32 noundef %201, ptr noundef %202, i32 noundef 0, i32 noundef %203, i32 noundef %204, i32 noundef 0) #8
  %205 = load i32, ptr %33, align 4
  %206 = sub nsw i32 %205, 1
  store i32 %206, ptr %33, align 4
  store i32 0, ptr %31, align 4
  br label %362

207:                                              ; preds = %195
  %208 = load i32, ptr %29, align 4
  %209 = call %struct.uint4 @_Z7getNodejb(i32 noundef %208, i1 noundef zeroext true) #8
  %210 = getelementptr inbounds %struct.HIP_vector_base_int.4, ptr %61, i32 0, i32 0
  %211 = getelementptr inbounds %struct.i32_4.anon, ptr %210, i32 0, i32 0
  %212 = extractvalue %struct.uint4 %209, 0
  store i32 %212, ptr %211, align 16
  %213 = getelementptr inbounds %struct.HIP_vector_base_int.4, ptr %61, i32 0, i32 0
  %214 = getelementptr inbounds %struct.i32_4.anon, ptr %213, i32 0, i32 1
  %215 = extractvalue %struct.uint4 %209, 1
  store i32 %215, ptr %214, align 4
  %216 = getelementptr inbounds %struct.HIP_vector_base_int.4, ptr %61, i32 0, i32 0
  %217 = getelementptr inbounds %struct.i32_4.anon, ptr %216, i32 0, i32 2
  %218 = extractvalue %struct.uint4 %209, 2
  store i32 %218, ptr %217, align 8
  %219 = getelementptr inbounds %struct.HIP_vector_base_int.4, ptr %61, i32 0, i32 0
  %220 = getelementptr inbounds %struct.i32_4.anon, ptr %219, i32 0, i32 3
  %221 = extractvalue %struct.uint4 %209, 3
  store i32 %221, ptr %220, align 4
  %222 = getelementptr inbounds %struct._PixelOfNode, ptr %59, i32 0, i32 0
  call void @llvm.memcpy.p0.p0.i64(ptr align 16 %222, ptr align 16 %61, i64 16, i1 false)
  %223 = getelementptr inbounds %struct._PixelOfNode, ptr %59, i32 0, i32 0
  %224 = getelementptr inbounds %struct.anon.7, ptr %223, i32 0, i32 2
  %225 = getelementptr inbounds %struct.HIP_vector_base_i8.3, ptr %224, i32 0, i32 0
  %226 = getelementptr inbounds %struct.i8_3.anon, ptr %225, i32 0, i32 0
  %227 = load i8, ptr %226, align 2
  %228 = zext i8 %227 to i32
  %229 = getelementptr inbounds %struct._PixelOfNode, ptr %59, i32 0, i32 0
  %230 = getelementptr inbounds %struct.anon.7, ptr %229, i32 0, i32 2
  %231 = getelementptr inbounds %struct.HIP_vector_base_i8.3, ptr %230, i32 0, i32 0
  %232 = getelementptr inbounds %struct.i8_3.anon, ptr %231, i32 0, i32 1
  %233 = load i8, ptr %232, align 1
  %234 = zext i8 %233 to i32
  %235 = shl i32 %234, 8
  %236 = or i32 %228, %235
  %237 = getelementptr inbounds %struct._PixelOfNode, ptr %59, i32 0, i32 0
  %238 = getelementptr inbounds %struct.anon.7, ptr %237, i32 0, i32 2
  %239 = getelementptr inbounds %struct.HIP_vector_base_i8.3, ptr %238, i32 0, i32 0
  %240 = getelementptr inbounds %struct.i8_3.anon, ptr %239, i32 0, i32 2
  %241 = load i8, ptr %240, align 2
  %242 = zext i8 %241 to i32
  %243 = shl i32 %242, 16
  %244 = or i32 %236, %243
  store i32 %244, ptr %41, align 4
  %245 = getelementptr inbounds %struct._PixelOfNode, ptr %59, i32 0, i32 0
  %246 = getelementptr inbounds %struct.anon.7, ptr %245, i32 0, i32 3
  %247 = getelementptr inbounds %struct.HIP_vector_base_i8.3, ptr %246, i32 0, i32 0
  %248 = getelementptr inbounds %struct.i8_3.anon, ptr %247, i32 0, i32 0
  %249 = load i8, ptr %248, align 1
  %250 = zext i8 %249 to i32
  %251 = getelementptr inbounds %struct._PixelOfNode, ptr %59, i32 0, i32 0
  %252 = getelementptr inbounds %struct.anon.7, ptr %251, i32 0, i32 3
  %253 = getelementptr inbounds %struct.HIP_vector_base_i8.3, ptr %252, i32 0, i32 0
  %254 = getelementptr inbounds %struct.i8_3.anon, ptr %253, i32 0, i32 1
  %255 = load i8, ptr %254, align 1
  %256 = zext i8 %255 to i32
  %257 = shl i32 %256, 8
  %258 = or i32 %250, %257
  %259 = getelementptr inbounds %struct._PixelOfNode, ptr %59, i32 0, i32 0
  %260 = getelementptr inbounds %struct.anon.7, ptr %259, i32 0, i32 3
  %261 = getelementptr inbounds %struct.HIP_vector_base_i8.3, ptr %260, i32 0, i32 0
  %262 = getelementptr inbounds %struct.i8_3.anon, ptr %261, i32 0, i32 2
  %263 = load i8, ptr %262, align 1
  %264 = zext i8 %263 to i32
  %265 = shl i32 %264, 16
  %266 = or i32 %258, %265
  store i32 %266, ptr %63, align 4
  br label %267

267:                                              ; preds = %207
  br label %268

268:                                              ; preds = %267
  %269 = load i32, ptr %63, align 4
  %270 = load i32, ptr %41, align 4
  %271 = sub i32 %269, %270
  %272 = add i32 %271, 1
  store i32 %272, ptr %65, align 4
  %273 = load i32, ptr %41, align 4
  %274 = load i32, ptr %31, align 4
  %275 = add i32 %273, %274
  store i32 %275, ptr %67, align 4
  %276 = load i32, ptr %63, align 4
  %277 = add i32 %276, 1
  store i32 %277, ptr %69, align 4
  %278 = load i32, ptr %31, align 4
  %279 = load i32, ptr %65, align 4
  %280 = sub nsw i32 %278, %279
  store i32 %280, ptr %71, align 4
  %281 = load i32, ptr %31, align 4
  %282 = icmp ne i32 %281, 0
  br i1 %282, label %283, label %294

283:                                              ; preds = %268
  %284 = load i32, ptr %67, align 4
  %285 = load i32, ptr %69, align 4
  %286 = call noundef i32 @_ZL3minii(i32 noundef %284, i32 noundef %285) #8
  store i32 %286, ptr %47, align 4
  %287 = load i32, ptr %65, align 4
  %288 = load i32, ptr %31, align 4
  %289 = call noundef i32 @_ZL3minii(i32 noundef %287, i32 noundef %288) #8
  %290 = load i32, ptr %33, align 4
  %291 = add nsw i32 %290, %289
  store i32 %291, ptr %33, align 4
  %292 = load i32, ptr %71, align 4
  %293 = call noundef i32 @_ZL3maxii(i32 noundef %292, i32 noundef 0) #8
  store i32 %293, ptr %31, align 4
  br label %299

294:                                              ; preds = %268
  %295 = load i32, ptr %33, align 4
  %296 = add nsw i32 %295, 1
  store i32 %296, ptr %33, align 4
  %297 = load i32, ptr %41, align 4
  %298 = add i32 %297, 1
  store i32 %298, ptr %47, align 4
  br label %299

299:                                              ; preds = %294, %283
  %300 = load ptr, ptr %11, align 8
  %301 = load i32, ptr %39, align 4
  %302 = load i32, ptr %33, align 4
  %303 = add nsw i32 %301, %302
  %304 = sext i32 %303 to i64
  %305 = getelementptr inbounds i8, ptr %300, i64 %304
  %306 = load i8, ptr %305, align 1
  store i8 %306, ptr %45, align 1
  br label %307

307:                                              ; preds = %331, %299
  %308 = load i32, ptr %47, align 4
  %309 = load i32, ptr %63, align 4
  %310 = icmp ule i32 %308, %309
  br i1 %310, label %311, label %315

311:                                              ; preds = %307
  %312 = load i8, ptr %45, align 1
  %313 = sext i8 %312 to i32
  %314 = icmp ne i32 %313, 0
  br label %315

315:                                              ; preds = %311, %307
  %316 = phi i1 [ false, %307 ], [ %314, %311 ]
  br i1 %316, label %317, label %343

317:                                              ; preds = %315
  %318 = load i32, ptr %47, align 4
  %319 = load ptr, ptr %13, align 8
  %320 = call noundef signext i8 @_Z6getRefiPc(i32 noundef %318, ptr noundef %319) #8
  store i8 %320, ptr %73, align 1
  br label %321

321:                                              ; preds = %317
  br label %322

322:                                              ; preds = %321
  %323 = load i8, ptr %73, align 1
  %324 = sext i8 %323 to i32
  %325 = load i8, ptr %45, align 1
  %326 = sext i8 %325 to i32
  %327 = icmp ne i32 %324, %326
  br i1 %327, label %328, label %331

328:                                              ; preds = %322
  br label %329

329:                                              ; preds = %328
  br label %330

330:                                              ; preds = %329
  br label %347

331:                                              ; preds = %322
  %332 = load i32, ptr %33, align 4
  %333 = add nsw i32 %332, 1
  store i32 %333, ptr %33, align 4
  %334 = load i32, ptr %47, align 4
  %335 = add nsw i32 %334, 1
  store i32 %335, ptr %47, align 4
  %336 = load ptr, ptr %11, align 8
  %337 = load i32, ptr %39, align 4
  %338 = load i32, ptr %33, align 4
  %339 = add nsw i32 %337, %338
  %340 = sext i32 %339 to i64
  %341 = getelementptr inbounds i8, ptr %336, i64 %340
  %342 = load i8, ptr %341, align 1
  store i8 %342, ptr %45, align 1
  br label %307, !llvm.loop !10

343:                                              ; preds = %315
  br label %145, !llvm.loop !12

344:                                              ; preds = %145
  br label %345

345:                                              ; preds = %344
  br label %346

346:                                              ; preds = %345
  br label %347

347:                                              ; preds = %346, %330
  %348 = load i32, ptr %29, align 4
  %349 = load ptr, ptr %35, align 8
  %350 = load i32, ptr %47, align 4
  %351 = load i32, ptr %41, align 4
  %352 = sub i32 %350, %351
  %353 = load i32, ptr %33, align 4
  %354 = load i32, ptr %21, align 4
  call void @_Z10set_resultjP11_MatchCoordiiii(i32 noundef %348, ptr noundef %349, i32 noundef %352, i32 noundef %353, i32 noundef %354, i32 noundef 0) #8
  %355 = load i32, ptr %47, align 4
  %356 = load i32, ptr %41, align 4
  %357 = sub i32 %355, %356
  store i32 %357, ptr %31, align 4
  %358 = load i32, ptr %31, align 4
  %359 = add nsw i32 %358, 1
  %360 = load i32, ptr %33, align 4
  %361 = sub nsw i32 %360, %359
  store i32 %361, ptr %33, align 4
  br label %362

362:                                              ; preds = %347, %200
  %363 = load i32, ptr %43, align 4
  %364 = call %struct.uint4 @_Z7getNodejb(i32 noundef %363, i1 noundef zeroext false) #8
  %365 = getelementptr inbounds %struct.HIP_vector_base_int.4, ptr %77, i32 0, i32 0
  %366 = getelementptr inbounds %struct.i32_4.anon, ptr %365, i32 0, i32 0
  %367 = extractvalue %struct.uint4 %364, 0
  store i32 %367, ptr %366, align 16
  %368 = getelementptr inbounds %struct.HIP_vector_base_int.4, ptr %77, i32 0, i32 0
  %369 = getelementptr inbounds %struct.i32_4.anon, ptr %368, i32 0, i32 1
  %370 = extractvalue %struct.uint4 %364, 1
  store i32 %370, ptr %369, align 4
  %371 = getelementptr inbounds %struct.HIP_vector_base_int.4, ptr %77, i32 0, i32 0
  %372 = getelementptr inbounds %struct.i32_4.anon, ptr %371, i32 0, i32 2
  %373 = extractvalue %struct.uint4 %364, 2
  store i32 %373, ptr %372, align 8
  %374 = getelementptr inbounds %struct.HIP_vector_base_int.4, ptr %77, i32 0, i32 0
  %375 = getelementptr inbounds %struct.i32_4.anon, ptr %374, i32 0, i32 3
  %376 = extractvalue %struct.uint4 %364, 3
  store i32 %376, ptr %375, align 4
  %377 = getelementptr inbounds %struct._PixelOfNode, ptr %75, i32 0, i32 0
  call void @llvm.memcpy.p0.p0.i64(ptr align 16 %377, ptr align 16 %77, i64 16, i1 false)
  %378 = getelementptr inbounds %struct._PixelOfNode, ptr %75, i32 0, i32 0
  %379 = getelementptr inbounds %struct.anon.7, ptr %378, i32 0, i32 1
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %79, ptr align 1 %379, i64 3, i1 false)
  call void @_Z14arrayToAddress6uchar3Rj(ptr noundef byval(%struct.uchar3) align 1 %79, ptr noundef nonnull align 4 dereferenceable(4) %29) #8
  br label %380

380:                                              ; preds = %362
  br label %381

381:                                              ; preds = %380
  br label %382

382:                                              ; preds = %381
  %383 = load i32, ptr %39, align 4
  %384 = add nsw i32 %383, 1
  store i32 %384, ptr %39, align 4
  %385 = load ptr, ptr %35, align 8
  %386 = getelementptr inbounds %struct._MatchCoord, ptr %385, i64 1
  store ptr %386, ptr %35, align 8
  br label %124, !llvm.loop !13

387:                                              ; preds = %124
  br label %388

388:                                              ; preds = %387, %88
  ret void
}

; Function Attrs: alwaysinline convergent mustprogress nounwind
define internal noundef i32 @_ZL8__umul24jj(i32 noundef %0, i32 noundef %1) #1 {
  %3 = alloca i32, align 4, addrspace(5)
  %4 = addrspacecast ptr addrspace(5) %3 to ptr
  %5 = alloca i32, align 4, addrspace(5)
  %6 = addrspacecast ptr addrspace(5) %5 to ptr
  store i32 %0, ptr %4, align 4
  store i32 %1, ptr %6, align 4
  %7 = load i32, ptr %4, align 4
  %8 = load i32, ptr %6, align 4
  %9 = call i32 @__nv_umul24(i32 noundef %7, i32 noundef %8) #8
  ret i32 %9
}

; Function Attrs: convergent mustprogress noinline nounwind optnone
define internal %struct.HIP_vector_type_i8.3 @_ZL11make_uchar3hhh(i8 noundef zeroext %0, i8 noundef zeroext %1, i8 noundef zeroext %2) #0 {
  %4 = alloca %struct.HIP_vector_type_i8.3, align 8, addrspace(5)
  %5 = addrspacecast ptr addrspace(5) %4 to ptr
  %6 = alloca i8, align 1, addrspace(5)
  %7 = addrspacecast ptr addrspace(5) %6 to ptr
  %8 = alloca i8, align 1, addrspace(5)
  %9 = addrspacecast ptr addrspace(5) %8 to ptr
  %10 = alloca i8, align 1, addrspace(5)
  %11 = addrspacecast ptr addrspace(5) %10 to ptr
  store i8 %0, ptr %7, align 1
  store i8 %1, ptr %9, align 1
  store i8 %2, ptr %11, align 1
  %12 = load i8, ptr %7, align 1
  %13 = getelementptr inbounds %struct.HIP_vector_base_i8.3, ptr %5, i32 0, i32 0
  %14 = getelementptr inbounds %struct.i8_3.anon, ptr %13, i32 0, i32 0
  store i8 %12, ptr %14, align 1
  %15 = load i8, ptr %9, align 1
  %16 = getelementptr inbounds %struct.HIP_vector_base_i8.3, ptr %5, i32 0, i32 0
  %17 = getelementptr inbounds %struct.i8_3.anon, ptr %16, i32 0, i32 1
  store i8 %15, ptr %17, align 1
  %18 = load i8, ptr %11, align 1
  %19 = getelementptr inbounds %struct.HIP_vector_base_i8.3, ptr %5, i32 0, i32 0
  %20 = getelementptr inbounds %struct.i8_3.anon, ptr %19, i32 0, i32 2
  store i8 %18, ptr %20, align 1
  %21 = load %struct.HIP_vector_type_i8.3, ptr %5, align 1
  ret %struct.HIP_vector_type_i8.3 %21
}

; Function Attrs: alwaysinline convergent mustprogress nounwind
define internal noundef i32 @_ZL3minii(i32 noundef %0, i32 noundef %1) #1 {
  %3 = alloca i32, align 4, addrspace(5)
  %4 = addrspacecast ptr addrspace(5) %3 to ptr
  %5 = alloca i32, align 4, addrspace(5)
  %6 = addrspacecast ptr addrspace(5) %5 to ptr
  store i32 %0, ptr %4, align 4
  store i32 %1, ptr %6, align 4
  %7 = load i32, ptr %4, align 4
  %8 = load i32, ptr %6, align 4
  %9 = call i32 @__nv_min(i32 noundef %7, i32 noundef %8) #8
  ret i32 %9
}

; Function Attrs: alwaysinline convergent mustprogress nounwind
define internal noundef i32 @_ZL3maxii(i32 noundef %0, i32 noundef %1) #1 {
  %3 = alloca i32, align 4, addrspace(5)
  %4 = addrspacecast ptr addrspace(5) %3 to ptr
  %5 = alloca i32, align 4, addrspace(5)
  %6 = addrspacecast ptr addrspace(5) %5 to ptr
  store i32 %0, ptr %4, align 4
  store i32 %1, ptr %6, align 4
  %7 = load i32, ptr %4, align 4
  %8 = load i32, ptr %6, align 4
  %9 = call i32 @__nv_max(i32 noundef %7, i32 noundef %8) #8
  ret i32 %9
}

; Function Attrs: convergent mustprogress noinline nounwind optnone
define internal void @_ZN12_GLOBAL__N_110__cuda_tex11__tex_fetchINS0_5__TagILi54EEE5uint47textureIS4_Li2EL19cudaTextureReadMode0EEJffEEEvPT0_T1_DpT2_(ptr noundef %0, i64 %1, float noundef %2, float noundef %3) #0 {
  %5 = alloca ptr, align 8, addrspace(5)
  %6 = addrspacecast ptr addrspace(5) %5 to ptr
  %7 = alloca i64, align 4, addrspace(5)
  %8 = addrspacecast ptr addrspace(5) %7 to ptr
  %9 = alloca float, align 4, addrspace(5)
  %10 = addrspacecast ptr addrspace(5) %9 to ptr
  %11 = alloca float, align 4, addrspace(5)
  %12 = addrspacecast ptr addrspace(5) %11 to ptr
  %13 = alloca %struct.uint4, align 16, addrspace(5)
  %14 = addrspacecast ptr addrspace(5) %13 to ptr
  %15 = alloca %struct.uint4, align 16, addrspace(5)
  %16 = addrspacecast ptr addrspace(5) %15 to ptr
  %17 = alloca i64, align 4, addrspace(5)
  %18 = addrspacecast ptr addrspace(5) %17 to ptr
  store ptr %0, ptr %6, align 8
  store i64 %1, ptr %8, align 4
  store float %2, ptr %10, align 4
  store float %3, ptr %12, align 4
  %19 = load i64, ptr %8, align 4
  store i64 %19, ptr %18, align 4
  %20 = load i64, ptr %18, align 4
  %21 = call noundef i64 @_ZN12_GLOBAL__N_110__cuda_tex19__tex_handle_to_objI7textureI5uint4Li2EL19cudaTextureReadMode0EEEEyT_(i64 %20) #8
  %22 = load float, ptr %10, align 4
  %23 = load float, ptr %12, align 4
  %24 = call %struct.uint4 @_ZN12_GLOBAL__N_110__cuda_tex14__tex_fetch_v4INS0_5__TagILi54EEEE5__runI5uint4EET_yff(i64 noundef %21, float noundef %22, float noundef %23) #8
  %25 = getelementptr inbounds %struct.uint4, ptr %16, i32 0, i32 0
  %26 = extractvalue %struct.uint4 %24, 0
  store i32 %26, ptr %25, align 16
  %27 = getelementptr inbounds %struct.uint4, ptr %16, i32 0, i32 1
  %28 = extractvalue %struct.uint4 %24, 1
  store i32 %28, ptr %27, align 4
  %29 = getelementptr inbounds %struct.uint4, ptr %16, i32 0, i32 2
  %30 = extractvalue %struct.uint4 %24, 2
  store i32 %30, ptr %29, align 8
  %31 = getelementptr inbounds %struct.uint4, ptr %16, i32 0, i32 3
  %32 = extractvalue %struct.uint4 %24, 3
  store i32 %32, ptr %31, align 4
  %33 = call %struct.uint4 @_ZN12_GLOBAL__N_110__cuda_tex9__convertI5uint4S2_E5__runILi4EEES2_S2_(ptr noundef byval(%struct.uint4) align 16 %16) #8
  %34 = getelementptr inbounds %struct.uint4, ptr %14, i32 0, i32 0
  %35 = extractvalue %struct.uint4 %33, 0
  store i32 %35, ptr %34, align 16
  %36 = getelementptr inbounds %struct.uint4, ptr %14, i32 0, i32 1
  %37 = extractvalue %struct.uint4 %33, 1
  store i32 %37, ptr %36, align 4
  %38 = getelementptr inbounds %struct.uint4, ptr %14, i32 0, i32 2
  %39 = extractvalue %struct.uint4 %33, 2
  store i32 %39, ptr %38, align 8
  %40 = getelementptr inbounds %struct.uint4, ptr %14, i32 0, i32 3
  %41 = extractvalue %struct.uint4 %33, 3
  store i32 %41, ptr %40, align 4
  %42 = load ptr, ptr %6, align 8
  call void @llvm.memcpy.p0.p0.i64(ptr align 16 %42, ptr align 16 %14, i64 16, i1 false)
  ret void
}

; Function Attrs: convergent mustprogress noinline nounwind optnone
define internal %struct.uint4 @_ZN12_GLOBAL__N_110__cuda_tex9__convertI5uint4S2_E5__runILi4EEES2_S2_(ptr noundef byval(%struct.uint4) align 16 %0) #0 align 2 {
  %2 = alloca %struct.uint4, align 16, addrspace(5)
  %3 = addrspacecast ptr addrspace(5) %2 to ptr
  %4 = getelementptr inbounds %struct.uint4, ptr %3, i32 0, i32 0
  %5 = getelementptr inbounds %struct.uint4, ptr %0, i32 0, i32 0
  %6 = load i32, ptr %5, align 16
  store i32 %6, ptr %4, align 16
  %7 = getelementptr inbounds %struct.uint4, ptr %3, i32 0, i32 1
  %8 = getelementptr inbounds %struct.uint4, ptr %0, i32 0, i32 1
  %9 = load i32, ptr %8, align 4
  store i32 %9, ptr %7, align 4
  %10 = getelementptr inbounds %struct.uint4, ptr %3, i32 0, i32 2
  %11 = getelementptr inbounds %struct.uint4, ptr %0, i32 0, i32 2
  %12 = load i32, ptr %11, align 8
  store i32 %12, ptr %10, align 8
  %13 = getelementptr inbounds %struct.uint4, ptr %3, i32 0, i32 3
  %14 = getelementptr inbounds %struct.uint4, ptr %0, i32 0, i32 3
  %15 = load i32, ptr %14, align 4
  store i32 %15, ptr %13, align 4
  %16 = load %struct.uint4, ptr %3, align 16
  ret %struct.uint4 %16
}

; Function Attrs: convergent mustprogress noinline nounwind optnone
define internal %struct.uint4 @_ZN12_GLOBAL__N_110__cuda_tex14__tex_fetch_v4INS0_5__TagILi54EEEE5__runI5uint4EET_yff(i64 noundef %0, float noundef %1, float noundef %2) #0 align 2 {
  %4 = alloca %struct.uint4, align 16, addrspace(5)
  %5 = addrspacecast ptr addrspace(5) %4 to ptr
  %6 = alloca i64, align 8, addrspace(5)
  %7 = addrspacecast ptr addrspace(5) %6 to ptr
  %8 = alloca float, align 4, addrspace(5)
  %9 = addrspacecast ptr addrspace(5) %8 to ptr
  %10 = alloca float, align 4, addrspace(5)
  %11 = addrspacecast ptr addrspace(5) %10 to ptr
  store i64 %0, ptr %7, align 8
  store float %1, ptr %9, align 4
  store float %2, ptr %11, align 4
  %12 = getelementptr inbounds %struct.uint4, ptr %5, i32 0, i32 0
  %13 = getelementptr inbounds %struct.uint4, ptr %5, i32 0, i32 1
  %14 = getelementptr inbounds %struct.uint4, ptr %5, i32 0, i32 2
  %15 = getelementptr inbounds %struct.uint4, ptr %5, i32 0, i32 3
  %16 = load i64, ptr %7, align 8
  %17 = load float, ptr %9, align 4
  %18 = load float, ptr %11, align 4
  %19 = call { i32, i32, i32, i32 } asm "tex.2d.v4.u32.f32\09{$0, $1, $2, $3}, [$4, {$5, $6}];", "=r,=r,=r,=r,l,f,f"(i64 %16, float %17, float %18) #9, !srcloc !14
  %20 = extractvalue { i32, i32, i32, i32 } %19, 0
  %21 = extractvalue { i32, i32, i32, i32 } %19, 1
  %22 = extractvalue { i32, i32, i32, i32 } %19, 2
  %23 = extractvalue { i32, i32, i32, i32 } %19, 3
  store i32 %20, ptr %12, align 16
  store i32 %21, ptr %13, align 4
  store i32 %22, ptr %14, align 8
  store i32 %23, ptr %15, align 4
  %24 = load %struct.uint4, ptr %5, align 16
  ret %struct.uint4 %24
}

; Function Attrs: convergent mustprogress noinline nounwind optnone
define internal noundef i64 @_ZN12_GLOBAL__N_110__cuda_tex19__tex_handle_to_objI7textureI5uint4Li2EL19cudaTextureReadMode0EEEEyT_(i64 %0) #0 {
  %2 = alloca i64, align 4, addrspace(5)
  %3 = addrspacecast ptr addrspace(5) %2 to ptr
  %4 = alloca i64, align 8, addrspace(5)
  %5 = addrspacecast ptr addrspace(5) %4 to ptr
  store i64 %0, ptr %3, align 4
  %6 = load i64, ptr %3, align 4
  %7 = call i64 asm "mov.b64 $0, $1; ", "=l,l"(i64 %6) #9, !srcloc !15
  store i64 %7, ptr %5, align 8
  %8 = load i64, ptr %5, align 8
  ret i64 %8
}

; Function Attrs: alwaysinline convergent nounwind
declare dso_local i32 @__nv_min(i32, i32) #4

; Function Attrs: alwaysinline convergent nounwind
declare dso_local i32 @__nv_max(i32, i32) #4

; Function Attrs: alwaysinline convergent nounwind
declare dso_local i32 @__nv_umul24(i32, i32) #4

; Function Attrs: alwaysinline convergent mustprogress nounwind
define linkonce_odr dso_local noundef i32 @_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_xEv() #1 comdat align 2 {
  %1 = call i32 @llvm.amdgcn.workgroup.id.x()
  ret i32 %1
}

; Function Attrs: alwaysinline convergent mustprogress nounwind
define linkonce_odr dso_local noundef i32 @_ZN25__cuda_builtin_blockDim_t17__fetch_builtin_xEv() #1 comdat align 2 {
  %1 = call i32 @cudaamd.nvvm.read.ptx.sreg.ntid.x()
  ret i32 %1
}

; Function Attrs: alwaysinline convergent mustprogress nounwind
define linkonce_odr dso_local noundef i32 @_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_xEv() #1 comdat align 2 {
  %1 = call i32 @llvm.amdgcn.workitem.id.x()
  ret i32 %1
}

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #5

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.nvvm.read.ptx.sreg.ntid.x() #5

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.nvvm.read.ptx.sreg.tid.x() #5

; Function Attrs: argmemonly nocallback nofree nounwind willreturn
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #6

; Function Attrs: nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #7

declare i32 @cudaamd.nvvm.read.ptx.sreg.ntid.x()

; Function Attrs: nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #7

declare [2 x i32] @_ZL9make_int2ii(i32, i32)

declare i32 @_Z9atomicAddPjj(ptr, i32)

declare i32 @_Z9atomicAddPii(ptr, i32)

declare i64 @_Z9atomicAddPyy(ptr, i64)

declare float @_Z9atomicAddPff(ptr, float)

declare i32 @_Z8atomicOrPii(ptr, i32)

declare i32 @_Z8atomicOrPjj(ptr, i32)

declare i64 @_Z8atomicOrPyy(ptr, i64)

declare i32 @_Z9atomicAndPii(ptr, i32)

declare i32 @_Z9atomicAndPjj(ptr, i32)

declare i64 @_Z9atomicAndPyy(ptr, i64)

declare i32 @_Z10atomicExchPii(ptr, i32)

declare i32 @_Z10atomicExchPjj(ptr, i32)

declare i64 @_Z10atomicExchPyy(ptr, i64)

declare float @_Z10atomicExchPff(ptr, float)

declare i32 @_Z9atomicDecPjj(ptr, i32)

declare i32 @_Z9atomicIncPjj(ptr, i32)

declare i32 @_Z9atomicMaxPii(ptr, i32)

declare i32 @_Z9atomicMaxPjj(ptr, i32)

declare i64 @_Z9atomicMaxPyy(ptr, i64)

declare i32 @_Z9atomicMinPii(ptr, i32)

declare i32 @_Z9atomicMinPjj(ptr, i32)

declare i64 @_Z9atomicMinPyy(ptr, i64)

declare i32 @_Z9atomicSubPii(ptr, i32)

declare i32 @_Z9atomicSubPjj(ptr, i32)

declare i32 @_Z9atomicXorPii(ptr, i32)

declare i32 @_Z9atomicXorPjj(ptr, i32)

declare i64 @_Z9atomicXorPyy(ptr, i64)

declare i32 @_Z9atomicCASPiii(ptr, i32, i32)

declare i32 @_Z9atomicCASPjjj(ptr, i32, i32)

declare i64 @_Z9atomicCASPyyy(ptr, i64, i64)

attributes #0 = { convergent mustprogress noinline nounwind optnone "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" }
attributes #1 = { alwaysinline convergent mustprogress nounwind "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" }
attributes #2 = { nounwind readnone }
attributes #3 = { convergent mustprogress noinline norecurse nounwind optnone "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" }
attributes #4 = { alwaysinline convergent nounwind "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #6 = { argmemonly nocallback nofree nounwind willreturn }
attributes #7 = { nounwind readnone speculatable willreturn }
attributes #8 = { convergent nounwind }
attributes #9 = { convergent nounwind readnone }

!llvm.module.flags = !{!0, !1, !2, !3}
!nvvm.annotations = !{!4, !5, !6, !7}
!llvm.ident = !{!8, !9}

!0 = !{i32 2, !"SDK Version", [2 x i32] [i32 11, i32 5]}
!1 = !{i32 1, !"wchar_size", i32 4}
!2 = !{i32 4, !"nvvm-reflect-ftz", i32 0}
!3 = !{i32 7, !"frame-pointer", i32 2}
!4 = !{ptr addrspace(1) @nodetex, !"texture", i32 1}
!5 = !{ptr addrspace(1) @childrentex, !"texture", i32 1}
!6 = !{ptr addrspace(1) @reftex, !"texture", i32 1}
!7 = !{ptr addrspace(1) @qrytex, !"texture", i32 1}
!8 = !{!"clang version 16.0.0 (https://github.com/llvm/llvm-project 809855b56f06dd7182685f88fbbc64111df9339a)"}
!9 = !{!"clang version 3.8.0 (tags/RELEASE_380/final)"}
!10 = distinct !{!10, !11}
!11 = !{!"llvm.loop.mustprogress"}
!12 = distinct !{!12, !11}
!13 = distinct !{!13, !11}
!14 = !{i64 685421}
!15 = !{i64 738119}

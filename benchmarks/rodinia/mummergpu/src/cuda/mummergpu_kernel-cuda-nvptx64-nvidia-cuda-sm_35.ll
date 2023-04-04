; ModuleID = 'mummergpu_kernel-cuda-nvptx64-nvidia-cuda-sm_35.bc'
source_filename = "mummergpu_kernel.cu"
target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

%struct.__cuda_builtin_blockIdx_t = type { i8 }
%struct.__cuda_builtin_blockDim_t = type { i8 }
%struct.__cuda_builtin_threadIdx_t = type { i8 }
%struct.TextureAddress = type { %union.anon }
%union.anon = type { i32 }
%struct.anon = type { i16, i16 }
%struct.uchar3 = type { i8, i8, i8 }
%struct.uint4 = type { i32, i32, i32, i32 }
%struct.int2 = type { i32, i32 }
%struct._MatchCoord = type { %union.anon.0 }
%union.anon.0 = type { %struct.int2 }
%struct._PixelOfChildren = type { %union.anon.2 }
%union.anon.2 = type { %struct.uint4 }
%struct._PixelOfNode = type { %union.anon.6 }
%union.anon.6 = type { %struct.uint4 }
%struct.anon.4 = type { %struct.uchar3, %struct.uchar3, %struct.uchar3, %struct.uchar3, %struct.uchar3, i8 }
%struct.anon.7 = type { %struct.uchar3, %struct.uchar3, %struct.uchar3, %struct.uchar3, %struct.uchar3, i8 }
%struct.MatchInfo = type { i32, i32, %struct.TextureAddress, i32, i16, i16 }
%struct.anon.5 = type { %struct.uchar3, [12 x i8], i8 }
%struct.Alignment = type { i32, i16 }

$_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_xEv = comdat any

$_ZN25__cuda_builtin_blockDim_t17__fetch_builtin_xEv = comdat any

$_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_xEv = comdat any

@nodetex = dso_local addrspace(1) externally_initialized global i64 undef, align 4
@childrentex = dso_local addrspace(1) externally_initialized global i64 undef, align 4
@reftex = dso_local addrspace(1) externally_initialized global i64 undef, align 4
@qrytex = dso_local addrspace(1) externally_initialized global i64 undef, align 4
@blockIdx = extern_weak dso_local addrspace(1) global %struct.__cuda_builtin_blockIdx_t, align 1
@blockDim = extern_weak dso_local addrspace(1) global %struct.__cuda_builtin_blockDim_t, align 1
@threadIdx = extern_weak dso_local addrspace(1) global %struct.__cuda_builtin_threadIdx_t, align 1
@llvm.compiler.used = appending global [2 x ptr] [ptr addrspacecast (ptr addrspace(1) @nodetex to ptr), ptr addrspacecast (ptr addrspace(1) @childrentex to ptr)], section "llvm.metadata"

; Function Attrs: convergent mustprogress noinline nounwind optnone
define dso_local noundef i32 @_Z7addr2idj(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
  %6 = load i32, ptr %2, align 4
  %7 = lshr i32 %6, 16
  %8 = and i32 %7, 31
  store i32 %8, ptr %3, align 4
  %9 = load i32, ptr %2, align 4
  %10 = lshr i32 %9, 16
  %11 = lshr i32 %10, 5
  store i32 %11, ptr %4, align 4
  %12 = load i32, ptr %2, align 4
  %13 = and i32 %12, 65535
  %14 = shl i32 %13, 5
  %15 = load i32, ptr %3, align 4
  %16 = add i32 %14, %15
  store i32 %16, ptr %5, align 4
  %17 = load i32, ptr %5, align 4
  %18 = load i32, ptr %4, align 4
  %19 = shl i32 %18, 17
  %20 = add nsw i32 %17, %19
  ret i32 %20
}

; Function Attrs: convergent mustprogress noinline nounwind optnone
define dso_local %struct.TextureAddress @_Z7id2addri(i32 noundef %0) #0 {
  %2 = alloca %struct.TextureAddress, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  %6 = load i32, ptr %3, align 4
  %7 = and i32 %6, 131071
  store i32 %7, ptr %4, align 4
  %8 = load i32, ptr %3, align 4
  %9 = ashr i32 %8, 17
  store i32 %9, ptr %5, align 4
  %10 = load i32, ptr %5, align 4
  %11 = shl i32 %10, 5
  %12 = load i32, ptr %4, align 4
  %13 = and i32 %12, 31
  %14 = add nsw i32 %11, %13
  %15 = trunc i32 %14 to i16
  %16 = getelementptr inbounds %struct.TextureAddress, ptr %2, i32 0, i32 0
  %17 = getelementptr inbounds %struct.anon, ptr %16, i32 0, i32 1
  store i16 %15, ptr %17, align 2
  %18 = load i32, ptr %4, align 4
  %19 = ashr i32 %18, 5
  %20 = trunc i32 %19 to i16
  %21 = getelementptr inbounds %struct.TextureAddress, ptr %2, i32 0, i32 0
  %22 = getelementptr inbounds %struct.anon, ptr %21, i32 0, i32 0
  store i16 %20, ptr %22, align 4
  %23 = load %struct.TextureAddress, ptr %2, align 4
  ret %struct.TextureAddress %23
}

; Function Attrs: convergent mustprogress noinline nounwind optnone
define dso_local void @_Z14arrayToAddress6uchar3Rj(ptr noundef byval(%struct.uchar3) align 1 %0, ptr noundef nonnull align 4 dereferenceable(4) %1) #0 {
  %3 = alloca ptr, align 8
  store ptr %1, ptr %3, align 8
  %4 = getelementptr inbounds %struct.uchar3, ptr %0, i32 0, i32 0
  %5 = load i8, ptr %4, align 1
  %6 = zext i8 %5 to i32
  %7 = getelementptr inbounds %struct.uchar3, ptr %0, i32 0, i32 2
  %8 = load i8, ptr %7, align 1
  %9 = zext i8 %8 to i32
  %10 = and i32 %9, 15
  %11 = shl i32 %10, 8
  %12 = or i32 %6, %11
  %13 = getelementptr inbounds %struct.uchar3, ptr %0, i32 0, i32 1
  %14 = load i8, ptr %13, align 1
  %15 = zext i8 %14 to i32
  %16 = getelementptr inbounds %struct.uchar3, ptr %0, i32 0, i32 2
  %17 = load i8, ptr %16, align 1
  %18 = zext i8 %17 to i32
  %19 = and i32 %18, 240
  %20 = shl i32 %19, 4
  %21 = or i32 %15, %20
  %22 = shl i32 %21, 16
  %23 = or i32 %12, %22
  %24 = load ptr, ptr %3, align 8
  store i32 %23, ptr %24, align 4
  ret void
}

; Function Attrs: convergent mustprogress noinline nounwind optnone
define dso_local noundef signext i8 @_Z6getRefiPc(i32 noundef %0, ptr noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca ptr, align 8
  store i32 %0, ptr %3, align 4
  store ptr %1, ptr %4, align 8
  %5 = load ptr, ptr %4, align 8
  %6 = load i32, ptr %3, align 4
  %7 = sext i32 %6 to i64
  %8 = getelementptr inbounds i8, ptr %5, i64 %7
  %9 = load i8, ptr %8, align 1
  ret i8 %9
}


; Function Attrs: convergent mustprogress noinline nounwind optnone
define dso_local noundef signext i8 @_Z2rcc(i8 noundef signext %0) #0 {
  %2 = alloca i8, align 1
  %3 = alloca i8, align 1
  store i8 %0, ptr %3, align 1
  %4 = load i8, ptr %3, align 1
  %5 = sext i8 %4 to i32
  switch i32 %5, label %11 [
    i32 65, label %6
    i32 67, label %7
    i32 71, label %8
    i32 84, label %9
    i32 113, label %10
  ]

6:                                                ; preds = %1
  store i8 84, ptr %2, align 1
  br label %13

7:                                                ; preds = %1
  store i8 71, ptr %2, align 1
  br label %13

8:                                                ; preds = %1
  store i8 67, ptr %2, align 1
  br label %13

9:                                                ; preds = %1
  store i8 65, ptr %2, align 1
  br label %13

10:                                               ; preds = %1
  store i8 0, ptr %2, align 1
  br label %13

11:                                               ; preds = %1
  %12 = load i8, ptr %3, align 1
  store i8 %12, ptr %2, align 1
  br label %13

13:                                               ; preds = %11, %10, %9, %8, %7, %6
  %14 = load i8, ptr %2, align 1
  ret i8 %14
}

; Function Attrs: convergent mustprogress noinline nounwind optnone
define dso_local %struct.uint4 @_Z7getNodejb(i32 noundef %0, i1 noundef zeroext %1) #0 {
  %3 = alloca %struct.uint4, align 16
  %4 = alloca i32, align 4
  %5 = alloca i8, align 1
  %6 = alloca i64, align 4
  store i32 %0, ptr %4, align 4
  %7 = zext i1 %1 to i8
  store i8 %7, ptr %5, align 1
  %8 = call i64 @llvm.nvvm.texsurf.handle.internal.p1(ptr addrspace(1) @nodetex)
  store i64 %8, ptr %6, align 4
  %9 = load i32, ptr %4, align 4
  %10 = and i32 %9, 65535
  %11 = uitofp i32 %10 to float
  %12 = load i32, ptr %4, align 4
  %13 = and i32 %12, -65536
  %14 = lshr i32 %13, 16
  %15 = uitofp i32 %14 to float
  %16 = load i64, ptr %6, align 4
  %17 = call %struct.uint4 @_ZL5tex2DI5uint4EN17__nv_tex_rmet_retIT_E4typeE7textureIS2_Li2EL19cudaTextureReadMode0EEff(i64 %16, float noundef %11, float noundef %15) #7
  %18 = getelementptr inbounds %struct.uint4, ptr %3, i32 0, i32 0
  %19 = extractvalue %struct.uint4 %17, 0
  store i32 %19, ptr %18, align 16
  %20 = getelementptr inbounds %struct.uint4, ptr %3, i32 0, i32 1
  %21 = extractvalue %struct.uint4 %17, 1
  store i32 %21, ptr %20, align 4
  %22 = getelementptr inbounds %struct.uint4, ptr %3, i32 0, i32 2
  %23 = extractvalue %struct.uint4 %17, 2
  store i32 %23, ptr %22, align 8
  %24 = getelementptr inbounds %struct.uint4, ptr %3, i32 0, i32 3
  %25 = extractvalue %struct.uint4 %17, 3
  store i32 %25, ptr %24, align 4
  %26 = load %struct.uint4, ptr %3, align 16
  ret %struct.uint4 %26
}

; Function Attrs: alwaysinline convergent mustprogress nounwind
define internal %struct.uint4 @_ZL5tex2DI5uint4EN17__nv_tex_rmet_retIT_E4typeE7textureIS2_Li2EL19cudaTextureReadMode0EEff(i64 %0, float noundef %1, float noundef %2) #1 {
  %4 = alloca %struct.uint4, align 16
  %5 = alloca i64, align 4
  %6 = alloca float, align 4
  %7 = alloca float, align 4
  %8 = alloca i64, align 4
  store i64 %0, ptr %5, align 4
  store float %1, ptr %6, align 4
  store float %2, ptr %7, align 4
  %9 = load i64, ptr %5, align 4
  store i64 %9, ptr %8, align 4
  %10 = load float, ptr %6, align 4
  %11 = load float, ptr %7, align 4
  %12 = load i64, ptr %8, align 4
  call void @_ZN12_GLOBAL__N_110__cuda_tex11__tex_fetchINS0_5__TagILi54EEE5uint47textureIS4_Li2EL19cudaTextureReadMode0EEJffEEEvPT0_T1_DpT2_(ptr noundef %4, i64 %12, float noundef %10, float noundef %11) #7
  %13 = load %struct.uint4, ptr %4, align 16
  ret %struct.uint4 %13
}

; Function Attrs: nounwind readnone
declare i64 @llvm.nvvm.texsurf.handle.internal.p1(ptr addrspace(1)) #2

; Function Attrs: convergent mustprogress noinline nounwind optnone
define dso_local %struct.uint4 @_Z11getChildrenjb(i32 noundef %0, i1 noundef zeroext %1) #0 {
  %3 = alloca %struct.uint4, align 16
  %4 = alloca i32, align 4
  %5 = alloca i8, align 1
  %6 = alloca i64, align 4
  store i32 %0, ptr %4, align 4
  %7 = zext i1 %1 to i8
  store i8 %7, ptr %5, align 1
  %8 = call i64 @llvm.nvvm.texsurf.handle.internal.p1(ptr addrspace(1) @childrentex)
  store i64 %8, ptr %6, align 4
  %9 = load i32, ptr %4, align 4
  %10 = and i32 %9, 65535
  %11 = uitofp i32 %10 to float
  %12 = load i32, ptr %4, align 4
  %13 = and i32 %12, -65536
  %14 = lshr i32 %13, 16
  %15 = uitofp i32 %14 to float
  %16 = load i64, ptr %6, align 4
  %17 = call %struct.uint4 @_ZL5tex2DI5uint4EN17__nv_tex_rmet_retIT_E4typeE7textureIS2_Li2EL19cudaTextureReadMode0EEff(i64 %16, float noundef %11, float noundef %15) #7
  %18 = getelementptr inbounds %struct.uint4, ptr %3, i32 0, i32 0
  %19 = extractvalue %struct.uint4 %17, 0
  store i32 %19, ptr %18, align 16
  %20 = getelementptr inbounds %struct.uint4, ptr %3, i32 0, i32 1
  %21 = extractvalue %struct.uint4 %17, 1
  store i32 %21, ptr %20, align 4
  %22 = getelementptr inbounds %struct.uint4, ptr %3, i32 0, i32 2
  %23 = extractvalue %struct.uint4 %17, 2
  store i32 %23, ptr %22, align 8
  %24 = getelementptr inbounds %struct.uint4, ptr %3, i32 0, i32 3
  %25 = extractvalue %struct.uint4 %17, 3
  store i32 %25, ptr %24, align 4
  %26 = load %struct.uint4, ptr %3, align 16
  ret %struct.uint4 %26
}

; Function Attrs: convergent mustprogress noinline nounwind optnone
define dso_local void @_Z10set_resultjP11_MatchCoordiiii(i32 noundef %0, ptr noundef %1, i32 noundef %2, i32 noundef %3, i32 noundef %4, i32 noundef %5) #0 {
  %7 = alloca i32, align 4
  %8 = alloca ptr, align 8
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca %struct.int2, align 8
  store i32 %0, ptr %7, align 4
  store ptr %1, ptr %8, align 8
  store i32 %2, ptr %9, align 4
  store i32 %3, ptr %10, align 4
  store i32 %4, ptr %11, align 4
  store i32 %5, ptr %12, align 4
  %14 = load i32, ptr %10, align 4
  %15 = load i32, ptr %11, align 4
  %16 = icmp sgt i32 %14, %15
  br i1 %16, label %17, label %30

17:                                               ; preds = %6
  %18 = load i32, ptr %12, align 4
  %19 = load i32, ptr %9, align 4
  %20 = or i32 %19, %18
  store i32 %20, ptr %9, align 4
  %21 = load i32, ptr %7, align 4
  %22 = load i32, ptr %9, align 4
  %23 = call %struct.int2 @_ZL9make_int2ii(i32 noundef %21, i32 noundef %22) #7
  %24 = getelementptr inbounds %struct.int2, ptr %13, i32 0, i32 0
  %25 = extractvalue %struct.int2 %23, 0
  store i32 %25, ptr %24, align 8
  %26 = getelementptr inbounds %struct.int2, ptr %13, i32 0, i32 1
  %27 = extractvalue %struct.int2 %23, 1
  store i32 %27, ptr %26, align 4
  %28 = load ptr, ptr %8, align 8
  %29 = getelementptr inbounds %struct._MatchCoord, ptr %28, i32 0, i32 0
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %29, ptr align 8 %13, i64 8, i1 false)
  br label %33

30:                                               ; preds = %6
  br label %31

31:                                               ; preds = %30
  br label %32

32:                                               ; preds = %31
  br label %33

33:                                               ; preds = %32, %17
  ret void
}

; Function Attrs: convergent mustprogress noinline nounwind optnone
define internal %struct.int2 @_ZL9make_int2ii(i32 noundef %0, i32 noundef %1) #0 {
  %3 = alloca %struct.int2, align 8
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  store i32 %0, ptr %4, align 4
  store i32 %1, ptr %5, align 4
  %6 = load i32, ptr %4, align 4
  %7 = getelementptr inbounds %struct.int2, ptr %3, i32 0, i32 0
  store i32 %6, ptr %7, align 8
  %8 = load i32, ptr %5, align 4
  %9 = getelementptr inbounds %struct.int2, ptr %3, i32 0, i32 1
  store i32 %8, ptr %9, align 4
  %10 = load %struct.int2, ptr %3, align 8
  ret %struct.int2 %10
}

; Function Attrs: argmemonly nocallback nofree nounwind willreturn
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #3

; Function Attrs: convergent mustprogress noinline norecurse nounwind optnone
define dso_local void @_Z15mummergpuKernelPvPcS0_PKiS2_ii(ptr noundef %0, ptr noundef %1, ptr noundef %2, ptr noundef %3, ptr noundef %4, i32 noundef %5, i32 noundef %6) #4 {
  %8 = alloca ptr, align 8
  %9 = alloca ptr, align 8
  %10 = alloca ptr, align 8
  %11 = alloca ptr, align 8
  %12 = alloca ptr, align 8
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  %17 = alloca i32, align 4
  %18 = alloca i32, align 4
  %19 = alloca i32, align 4
  %20 = alloca i32, align 4
  %21 = alloca ptr, align 8
  %22 = alloca i32, align 4
  %23 = alloca i32, align 4
  %24 = alloca i32, align 4
  %25 = alloca i32, align 4
  %26 = alloca i8, align 1
  %27 = alloca i32, align 4
  %28 = alloca %struct._PixelOfChildren, align 16
  %29 = alloca %struct.uint4, align 16
  %30 = alloca %struct.uchar3, align 1
  %31 = alloca %struct.uchar3, align 1
  %32 = alloca %struct.uchar3, align 1
  %33 = alloca %struct._PixelOfNode, align 16
  %34 = alloca %struct.uint4, align 16
  %35 = alloca i32, align 4
  %36 = alloca i32, align 4
  %37 = alloca i32, align 4
  %38 = alloca i32, align 4
  %39 = alloca i32, align 4
  %40 = alloca i8, align 1
  %41 = alloca %struct._PixelOfNode, align 16
  %42 = alloca %struct.uint4, align 16
  %43 = alloca %struct.uchar3, align 1
  store ptr %0, ptr %8, align 8
  store ptr %1, ptr %9, align 8
  store ptr %2, ptr %10, align 8
  store ptr %3, ptr %11, align 8
  store ptr %4, ptr %12, align 8
  store i32 %5, ptr %13, align 4
  store i32 %6, ptr %14, align 4
  %44 = call noundef i32 @_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_xEv() #7
  %45 = call noundef i32 @_ZN25__cuda_builtin_blockDim_t17__fetch_builtin_xEv() #7
  %46 = call noundef i32 @_ZL8__umul24jj(i32 noundef %44, i32 noundef %45) #7
  %47 = call noundef i32 @_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_xEv() #7
  %48 = add i32 %46, %47
  store i32 %48, ptr %15, align 4
  %49 = load i32, ptr %15, align 4
  %50 = load i32, ptr %13, align 4
  %51 = icmp sge i32 %49, %50
  br i1 %51, label %52, label %53

52:                                               ; preds = %7
  br label %331

53:                                               ; preds = %7
  br label %54

54:                                               ; preds = %53
  br label %55

55:                                               ; preds = %54
  %56 = load i32, ptr %15, align 4
  %57 = icmp eq i32 %56, 0
  br i1 %57, label %58, label %59

58:                                               ; preds = %55
  br label %59

59:                                               ; preds = %58, %55
  %60 = load ptr, ptr %12, align 8
  %61 = load i32, ptr %15, align 4
  %62 = sext i32 %61 to i64
  %63 = getelementptr inbounds i32, ptr %60, i64 %62
  %64 = load i32, ptr %63, align 4
  store i32 %64, ptr %16, align 4
  %65 = load ptr, ptr %11, align 8
  %66 = load i32, ptr %15, align 4
  %67 = sext i32 %66 to i64
  %68 = getelementptr inbounds i32, ptr %65, i64 %67
  %69 = load i32, ptr %68, align 4
  store i32 %69, ptr %17, align 4
  store i32 0, ptr %18, align 4
  store i32 0, ptr %19, align 4
  store i32 0, ptr %20, align 4
  %70 = load ptr, ptr %8, align 8
  %71 = load i32, ptr %17, align 4
  %72 = sext i32 %71 to i64
  %73 = getelementptr inbounds %struct._MatchCoord, ptr %70, i64 %72
  %74 = load i32, ptr %15, align 4
  %75 = load i32, ptr %14, align 4
  %76 = add nsw i32 %75, 1
  %77 = call noundef i32 @_ZL8__umul24jj(i32 noundef %74, i32 noundef %76) #7
  %78 = zext i32 %77 to i64
  %79 = sub i64 0, %78
  %80 = getelementptr inbounds %struct._MatchCoord, ptr %73, i64 %79
  store ptr %80, ptr %21, align 8
  %81 = load i32, ptr %17, align 4
  %82 = load ptr, ptr %9, align 8
  %83 = sext i32 %81 to i64
  %84 = getelementptr inbounds i8, ptr %82, i64 %83
  store ptr %84, ptr %9, align 8
  %85 = load i32, ptr %16, align 4
  %86 = load i32, ptr %14, align 4
  %87 = sub nsw i32 %85, %86
  store i32 %87, ptr %22, align 4
  store i32 0, ptr %23, align 4
  br label %88

88:                                               ; preds = %325, %59
  %89 = load i32, ptr %23, align 4
  %90 = load i32, ptr %22, align 4
  %91 = icmp sle i32 %89, %90
  br i1 %91, label %92, label %330

92:                                               ; preds = %88
  %93 = load i32, ptr %18, align 4
  %94 = icmp eq i32 %93, 0
  br i1 %94, label %98, label %95

95:                                               ; preds = %92
  %96 = load i32, ptr %20, align 4
  %97 = icmp slt i32 %96, 1
  br i1 %97, label %98, label %99

98:                                               ; preds = %95, %92
  store i32 65536, ptr %18, align 4
  store i32 1, ptr %20, align 4
  store i32 0, ptr %19, align 4
  br label %99

99:                                               ; preds = %98, %95
  %100 = load ptr, ptr %9, align 8
  %101 = load i32, ptr %23, align 4
  %102 = load i32, ptr %20, align 4
  %103 = add nsw i32 %101, %102
  %104 = sext i32 %103 to i64
  %105 = getelementptr inbounds i8, ptr %100, i64 %104
  %106 = load i8, ptr %105, align 1
  store i8 %106, ptr %26, align 1
  br label %107

107:                                              ; preds = %99
  br label %108

108:                                              ; preds = %107
  store i32 0, ptr %27, align 4
  br label %109

109:                                              ; preds = %290, %108
  %110 = load i8, ptr %26, align 1
  %111 = sext i8 %110 to i32
  %112 = icmp ne i32 %111, 0
  br i1 %112, label %113, label %291

113:                                              ; preds = %109
  br label %114

114:                                              ; preds = %113
  br label %115

115:                                              ; preds = %114
  %116 = load i32, ptr %18, align 4
  %117 = call %struct.uint4 @_Z11getChildrenjb(i32 noundef %116, i1 noundef zeroext false) #7
  %118 = getelementptr inbounds %struct.uint4, ptr %29, i32 0, i32 0
  %119 = extractvalue %struct.uint4 %117, 0
  store i32 %119, ptr %118, align 16
  %120 = getelementptr inbounds %struct.uint4, ptr %29, i32 0, i32 1
  %121 = extractvalue %struct.uint4 %117, 1
  store i32 %121, ptr %120, align 4
  %122 = getelementptr inbounds %struct.uint4, ptr %29, i32 0, i32 2
  %123 = extractvalue %struct.uint4 %117, 2
  store i32 %123, ptr %122, align 8
  %124 = getelementptr inbounds %struct.uint4, ptr %29, i32 0, i32 3
  %125 = extractvalue %struct.uint4 %117, 3
  store i32 %125, ptr %124, align 4
  %126 = getelementptr inbounds %struct._PixelOfChildren, ptr %28, i32 0, i32 0
  call void @llvm.memcpy.p0.p0.i64(ptr align 16 %126, ptr align 16 %29, i64 16, i1 false)
  %127 = load i32, ptr %18, align 4
  store i32 %127, ptr %25, align 4
  %128 = load i8, ptr %26, align 1
  %129 = sext i8 %128 to i32
  switch i32 %129, label %142 [
    i32 65, label %130
    i32 67, label %133
    i32 71, label %136
    i32 84, label %139
  ]

130:                                              ; preds = %115
  %131 = getelementptr inbounds %struct._PixelOfChildren, ptr %28, i32 0, i32 0
  %132 = getelementptr inbounds %struct.anon.4, ptr %131, i32 0, i32 0
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %30, ptr align 16 %132, i64 3, i1 false)
  br label %150

133:                                              ; preds = %115
  %134 = getelementptr inbounds %struct._PixelOfChildren, ptr %28, i32 0, i32 0
  %135 = getelementptr inbounds %struct.anon.4, ptr %134, i32 0, i32 1
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %30, ptr align 1 %135, i64 3, i1 false)
  br label %150

136:                                              ; preds = %115
  %137 = getelementptr inbounds %struct._PixelOfChildren, ptr %28, i32 0, i32 0
  %138 = getelementptr inbounds %struct.anon.4, ptr %137, i32 0, i32 2
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %30, ptr align 2 %138, i64 3, i1 false)
  br label %150

139:                                              ; preds = %115
  %140 = getelementptr inbounds %struct._PixelOfChildren, ptr %28, i32 0, i32 0
  %141 = getelementptr inbounds %struct.anon.4, ptr %140, i32 0, i32 3
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %30, ptr align 1 %141, i64 3, i1 false)
  br label %150

142:                                              ; preds = %115
  %143 = call %struct.uchar3 @_ZL11make_uchar3hhh(i8 noundef zeroext 0, i8 noundef zeroext 0, i8 noundef zeroext 0) #7
  %144 = getelementptr inbounds %struct.uchar3, ptr %31, i32 0, i32 0
  %145 = extractvalue %struct.uchar3 %143, 0
  store i8 %145, ptr %144, align 1
  %146 = getelementptr inbounds %struct.uchar3, ptr %31, i32 0, i32 1
  %147 = extractvalue %struct.uchar3 %143, 1
  store i8 %147, ptr %146, align 1
  %148 = getelementptr inbounds %struct.uchar3, ptr %31, i32 0, i32 2
  %149 = extractvalue %struct.uchar3 %143, 2
  store i8 %149, ptr %148, align 1
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %30, ptr align 1 %31, i64 3, i1 false)
  br label %150

150:                                              ; preds = %142, %139, %136, %133, %130
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %32, ptr align 1 %30, i64 3, i1 false)
  call void @_Z14arrayToAddress6uchar3Rj(ptr noundef byval(%struct.uchar3) align 1 %32, ptr noundef nonnull align 4 dereferenceable(4) %18) #7
  br label %151

151:                                              ; preds = %150
  br label %152

152:                                              ; preds = %151
  %153 = load i32, ptr %18, align 4
  %154 = icmp eq i32 %153, 0
  br i1 %154, label %155, label %164

155:                                              ; preds = %152
  br label %156

156:                                              ; preds = %155
  br label %157

157:                                              ; preds = %156
  %158 = load i32, ptr %25, align 4
  %159 = load ptr, ptr %21, align 8
  %160 = load i32, ptr %20, align 4
  %161 = load i32, ptr %14, align 4
  call void @_Z10set_resultjP11_MatchCoordiiii(i32 noundef %158, ptr noundef %159, i32 noundef 0, i32 noundef %160, i32 noundef %161, i32 noundef 0) #7
  %162 = load i32, ptr %20, align 4
  %163 = sub nsw i32 %162, 1
  store i32 %163, ptr %20, align 4
  store i32 0, ptr %19, align 4
  br label %309

164:                                              ; preds = %152
  %165 = load i32, ptr %18, align 4
  %166 = call %struct.uint4 @_Z7getNodejb(i32 noundef %165, i1 noundef zeroext true) #7
  %167 = getelementptr inbounds %struct.uint4, ptr %34, i32 0, i32 0
  %168 = extractvalue %struct.uint4 %166, 0
  store i32 %168, ptr %167, align 16
  %169 = getelementptr inbounds %struct.uint4, ptr %34, i32 0, i32 1
  %170 = extractvalue %struct.uint4 %166, 1
  store i32 %170, ptr %169, align 4
  %171 = getelementptr inbounds %struct.uint4, ptr %34, i32 0, i32 2
  %172 = extractvalue %struct.uint4 %166, 2
  store i32 %172, ptr %171, align 8
  %173 = getelementptr inbounds %struct.uint4, ptr %34, i32 0, i32 3
  %174 = extractvalue %struct.uint4 %166, 3
  store i32 %174, ptr %173, align 4
  %175 = getelementptr inbounds %struct._PixelOfNode, ptr %33, i32 0, i32 0
  call void @llvm.memcpy.p0.p0.i64(ptr align 16 %175, ptr align 16 %34, i64 16, i1 false)
  %176 = getelementptr inbounds %struct._PixelOfNode, ptr %33, i32 0, i32 0
  %177 = getelementptr inbounds %struct.anon.7, ptr %176, i32 0, i32 2
  %178 = getelementptr inbounds %struct.uchar3, ptr %177, i32 0, i32 0
  %179 = load i8, ptr %178, align 2
  %180 = zext i8 %179 to i32
  %181 = getelementptr inbounds %struct._PixelOfNode, ptr %33, i32 0, i32 0
  %182 = getelementptr inbounds %struct.anon.7, ptr %181, i32 0, i32 2
  %183 = getelementptr inbounds %struct.uchar3, ptr %182, i32 0, i32 1
  %184 = load i8, ptr %183, align 1
  %185 = zext i8 %184 to i32
  %186 = shl i32 %185, 8
  %187 = or i32 %180, %186
  %188 = getelementptr inbounds %struct._PixelOfNode, ptr %33, i32 0, i32 0
  %189 = getelementptr inbounds %struct.anon.7, ptr %188, i32 0, i32 2
  %190 = getelementptr inbounds %struct.uchar3, ptr %189, i32 0, i32 2
  %191 = load i8, ptr %190, align 2
  %192 = zext i8 %191 to i32
  %193 = shl i32 %192, 16
  %194 = or i32 %187, %193
  store i32 %194, ptr %24, align 4
  %195 = getelementptr inbounds %struct._PixelOfNode, ptr %33, i32 0, i32 0
  %196 = getelementptr inbounds %struct.anon.7, ptr %195, i32 0, i32 3
  %197 = getelementptr inbounds %struct.uchar3, ptr %196, i32 0, i32 0
  %198 = load i8, ptr %197, align 1
  %199 = zext i8 %198 to i32
  %200 = getelementptr inbounds %struct._PixelOfNode, ptr %33, i32 0, i32 0
  %201 = getelementptr inbounds %struct.anon.7, ptr %200, i32 0, i32 3
  %202 = getelementptr inbounds %struct.uchar3, ptr %201, i32 0, i32 1
  %203 = load i8, ptr %202, align 1
  %204 = zext i8 %203 to i32
  %205 = shl i32 %204, 8
  %206 = or i32 %199, %205
  %207 = getelementptr inbounds %struct._PixelOfNode, ptr %33, i32 0, i32 0
  %208 = getelementptr inbounds %struct.anon.7, ptr %207, i32 0, i32 3
  %209 = getelementptr inbounds %struct.uchar3, ptr %208, i32 0, i32 2
  %210 = load i8, ptr %209, align 1
  %211 = zext i8 %210 to i32
  %212 = shl i32 %211, 16
  %213 = or i32 %206, %212
  store i32 %213, ptr %35, align 4
  br label %214

214:                                              ; preds = %164
  br label %215

215:                                              ; preds = %214
  %216 = load i32, ptr %35, align 4
  %217 = load i32, ptr %24, align 4
  %218 = sub i32 %216, %217
  %219 = add i32 %218, 1
  store i32 %219, ptr %36, align 4
  %220 = load i32, ptr %24, align 4
  %221 = load i32, ptr %19, align 4
  %222 = add i32 %220, %221
  store i32 %222, ptr %37, align 4
  %223 = load i32, ptr %35, align 4
  %224 = add i32 %223, 1
  store i32 %224, ptr %38, align 4
  %225 = load i32, ptr %19, align 4
  %226 = load i32, ptr %36, align 4
  %227 = sub nsw i32 %225, %226
  store i32 %227, ptr %39, align 4
  %228 = load i32, ptr %19, align 4
  %229 = icmp ne i32 %228, 0
  br i1 %229, label %230, label %241

230:                                              ; preds = %215
  %231 = load i32, ptr %37, align 4
  %232 = load i32, ptr %38, align 4
  %233 = call noundef i32 @_ZL3minii(i32 noundef %231, i32 noundef %232) #7
  store i32 %233, ptr %27, align 4
  %234 = load i32, ptr %36, align 4
  %235 = load i32, ptr %19, align 4
  %236 = call noundef i32 @_ZL3minii(i32 noundef %234, i32 noundef %235) #7
  %237 = load i32, ptr %20, align 4
  %238 = add nsw i32 %237, %236
  store i32 %238, ptr %20, align 4
  %239 = load i32, ptr %39, align 4
  %240 = call noundef i32 @_ZL3maxii(i32 noundef %239, i32 noundef 0) #7
  store i32 %240, ptr %19, align 4
  br label %246

241:                                              ; preds = %215
  %242 = load i32, ptr %20, align 4
  %243 = add nsw i32 %242, 1
  store i32 %243, ptr %20, align 4
  %244 = load i32, ptr %24, align 4
  %245 = add i32 %244, 1
  store i32 %245, ptr %27, align 4
  br label %246

246:                                              ; preds = %241, %230
  %247 = load ptr, ptr %9, align 8
  %248 = load i32, ptr %23, align 4
  %249 = load i32, ptr %20, align 4
  %250 = add nsw i32 %248, %249
  %251 = sext i32 %250 to i64
  %252 = getelementptr inbounds i8, ptr %247, i64 %251
  %253 = load i8, ptr %252, align 1
  store i8 %253, ptr %26, align 1
  br label %254

254:                                              ; preds = %278, %246
  %255 = load i32, ptr %27, align 4
  %256 = load i32, ptr %35, align 4
  %257 = icmp ule i32 %255, %256
  br i1 %257, label %258, label %262

258:                                              ; preds = %254
  %259 = load i8, ptr %26, align 1
  %260 = sext i8 %259 to i32
  %261 = icmp ne i32 %260, 0
  br label %262

262:                                              ; preds = %258, %254
  %263 = phi i1 [ false, %254 ], [ %261, %258 ]
  br i1 %263, label %264, label %290

264:                                              ; preds = %262
  %265 = load i32, ptr %27, align 4
  %266 = load ptr, ptr %10, align 8
  %267 = call noundef signext i8 @_Z6getRefiPc(i32 noundef %265, ptr noundef %266) #7
  store i8 %267, ptr %40, align 1
  br label %268

268:                                              ; preds = %264
  br label %269

269:                                              ; preds = %268
  %270 = load i8, ptr %40, align 1
  %271 = sext i8 %270 to i32
  %272 = load i8, ptr %26, align 1
  %273 = sext i8 %272 to i32
  %274 = icmp ne i32 %271, %273
  br i1 %274, label %275, label %278

275:                                              ; preds = %269
  br label %276

276:                                              ; preds = %275
  br label %277

277:                                              ; preds = %276
  br label %294

278:                                              ; preds = %269
  %279 = load i32, ptr %20, align 4
  %280 = add nsw i32 %279, 1
  store i32 %280, ptr %20, align 4
  %281 = load i32, ptr %27, align 4
  %282 = add nsw i32 %281, 1
  store i32 %282, ptr %27, align 4
  %283 = load ptr, ptr %9, align 8
  %284 = load i32, ptr %23, align 4
  %285 = load i32, ptr %20, align 4
  %286 = add nsw i32 %284, %285
  %287 = sext i32 %286 to i64
  %288 = getelementptr inbounds i8, ptr %283, i64 %287
  %289 = load i8, ptr %288, align 1
  store i8 %289, ptr %26, align 1
  br label %254, !llvm.loop !13

290:                                              ; preds = %262
  br label %109, !llvm.loop !15

291:                                              ; preds = %109
  br label %292

292:                                              ; preds = %291
  br label %293

293:                                              ; preds = %292
  br label %294

294:                                              ; preds = %293, %277
  %295 = load i32, ptr %18, align 4
  %296 = load ptr, ptr %21, align 8
  %297 = load i32, ptr %27, align 4
  %298 = load i32, ptr %24, align 4
  %299 = sub i32 %297, %298
  %300 = load i32, ptr %20, align 4
  %301 = load i32, ptr %14, align 4
  call void @_Z10set_resultjP11_MatchCoordiiii(i32 noundef %295, ptr noundef %296, i32 noundef %299, i32 noundef %300, i32 noundef %301, i32 noundef 0) #7
  %302 = load i32, ptr %27, align 4
  %303 = load i32, ptr %24, align 4
  %304 = sub i32 %302, %303
  store i32 %304, ptr %19, align 4
  %305 = load i32, ptr %19, align 4
  %306 = add nsw i32 %305, 1
  %307 = load i32, ptr %20, align 4
  %308 = sub nsw i32 %307, %306
  store i32 %308, ptr %20, align 4
  br label %309

309:                                              ; preds = %294, %157
  %310 = load i32, ptr %25, align 4
  %311 = call %struct.uint4 @_Z7getNodejb(i32 noundef %310, i1 noundef zeroext false) #7
  %312 = getelementptr inbounds %struct.uint4, ptr %42, i32 0, i32 0
  %313 = extractvalue %struct.uint4 %311, 0
  store i32 %313, ptr %312, align 16
  %314 = getelementptr inbounds %struct.uint4, ptr %42, i32 0, i32 1
  %315 = extractvalue %struct.uint4 %311, 1
  store i32 %315, ptr %314, align 4
  %316 = getelementptr inbounds %struct.uint4, ptr %42, i32 0, i32 2
  %317 = extractvalue %struct.uint4 %311, 2
  store i32 %317, ptr %316, align 8
  %318 = getelementptr inbounds %struct.uint4, ptr %42, i32 0, i32 3
  %319 = extractvalue %struct.uint4 %311, 3
  store i32 %319, ptr %318, align 4
  %320 = getelementptr inbounds %struct._PixelOfNode, ptr %41, i32 0, i32 0
  call void @llvm.memcpy.p0.p0.i64(ptr align 16 %320, ptr align 16 %42, i64 16, i1 false)
  %321 = getelementptr inbounds %struct._PixelOfNode, ptr %41, i32 0, i32 0
  %322 = getelementptr inbounds %struct.anon.7, ptr %321, i32 0, i32 1
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %43, ptr align 1 %322, i64 3, i1 false)
  call void @_Z14arrayToAddress6uchar3Rj(ptr noundef byval(%struct.uchar3) align 1 %43, ptr noundef nonnull align 4 dereferenceable(4) %18) #7
  br label %323

323:                                              ; preds = %309
  br label %324

324:                                              ; preds = %323
  br label %325

325:                                              ; preds = %324
  %326 = load i32, ptr %23, align 4
  %327 = add nsw i32 %326, 1
  store i32 %327, ptr %23, align 4
  %328 = load ptr, ptr %21, align 8
  %329 = getelementptr inbounds %struct._MatchCoord, ptr %328, i64 1
  store ptr %329, ptr %21, align 8
  br label %88, !llvm.loop !16

330:                                              ; preds = %88
  br label %331

331:                                              ; preds = %330, %52
  ret void
}

; Function Attrs: alwaysinline convergent mustprogress nounwind
define internal noundef i32 @_ZL8__umul24jj(i32 noundef %0, i32 noundef %1) #1 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  store i32 %1, ptr %4, align 4
  %5 = load i32, ptr %3, align 4
  %6 = load i32, ptr %4, align 4
  %7 = call i32 @__nv_umul24(i32 noundef %5, i32 noundef %6) #7
  ret i32 %7
}

; Function Attrs: alwaysinline convergent mustprogress nounwind
define linkonce_odr dso_local noundef i32 @_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_xEv() #1 comdat align 2 {
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x()
  ret i32 %1
}

; Function Attrs: alwaysinline convergent mustprogress nounwind
define linkonce_odr dso_local noundef i32 @_ZN25__cuda_builtin_blockDim_t17__fetch_builtin_xEv() #1 comdat align 2 {
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.ntid.x()
  ret i32 %1
}

; Function Attrs: alwaysinline convergent mustprogress nounwind
define linkonce_odr dso_local noundef i32 @_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_xEv() #1 comdat align 2 {
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x()
  ret i32 %1
}

; Function Attrs: convergent mustprogress noinline nounwind optnone
define internal %struct.uchar3 @_ZL11make_uchar3hhh(i8 noundef zeroext %0, i8 noundef zeroext %1, i8 noundef zeroext %2) #0 {
  %4 = alloca %struct.uchar3, align 1
  %5 = alloca i8, align 1
  %6 = alloca i8, align 1
  %7 = alloca i8, align 1
  store i8 %0, ptr %5, align 1
  store i8 %1, ptr %6, align 1
  store i8 %2, ptr %7, align 1
  %8 = load i8, ptr %5, align 1
  %9 = getelementptr inbounds %struct.uchar3, ptr %4, i32 0, i32 0
  store i8 %8, ptr %9, align 1
  %10 = load i8, ptr %6, align 1
  %11 = getelementptr inbounds %struct.uchar3, ptr %4, i32 0, i32 1
  store i8 %10, ptr %11, align 1
  %12 = load i8, ptr %7, align 1
  %13 = getelementptr inbounds %struct.uchar3, ptr %4, i32 0, i32 2
  store i8 %12, ptr %13, align 1
  %14 = load %struct.uchar3, ptr %4, align 1
  ret %struct.uchar3 %14
}

; Function Attrs: alwaysinline convergent mustprogress nounwind
define internal noundef i32 @_ZL3minii(i32 noundef %0, i32 noundef %1) #1 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  store i32 %1, ptr %4, align 4
  %5 = load i32, ptr %3, align 4
  %6 = load i32, ptr %4, align 4
  %7 = call i32 @__nv_min(i32 noundef %5, i32 noundef %6) #7
  ret i32 %7
}

; Function Attrs: alwaysinline convergent mustprogress nounwind
define internal noundef i32 @_ZL3maxii(i32 noundef %0, i32 noundef %1) #1 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  store i32 %1, ptr %4, align 4
  %5 = load i32, ptr %3, align 4
  %6 = load i32, ptr %4, align 4
  %7 = call i32 @__nv_max(i32 noundef %5, i32 noundef %6) #7
  ret i32 %7
}

; Function Attrs: convergent mustprogress noinline norecurse nounwind optnone
define dso_local void @_Z17mummergpuRCKernelP10MatchCoordPcPKiS3_ii(ptr noundef %0, ptr noundef %1, ptr noundef %2, ptr noundef %3, i32 noundef %4, i32 noundef %5) #4 {
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  %9 = alloca ptr, align 8
  %10 = alloca ptr, align 8
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  store ptr %0, ptr %7, align 8
  store ptr %1, ptr %8, align 8
  store ptr %2, ptr %9, align 8
  store ptr %3, ptr %10, align 8
  store i32 %4, ptr %11, align 4
  store i32 %5, ptr %12, align 4
  ret void
}

; Function Attrs: convergent mustprogress noinline norecurse nounwind optnone
define dso_local void @_Z11printKernelP9MatchInfoiP9AlignmentPcPKiS5_iiiii(ptr noundef %0, i32 noundef %1, ptr noundef %2, ptr noundef %3, ptr noundef %4, ptr noundef %5, i32 noundef %6, i32 noundef %7, i32 noundef %8, i32 noundef %9, i32 noundef %10) #4 {
  %12 = alloca ptr, align 8
  %13 = alloca i32, align 4
  %14 = alloca ptr, align 8
  %15 = alloca ptr, align 8
  %16 = alloca ptr, align 8
  %17 = alloca ptr, align 8
  %18 = alloca i32, align 4
  %19 = alloca i32, align 4
  %20 = alloca i32, align 4
  %21 = alloca i32, align 4
  %22 = alloca i32, align 4
  %23 = alloca i32, align 4
  %24 = alloca i32, align 4
  %25 = alloca i8, align 1
  %26 = alloca i32, align 4
  %27 = alloca i32, align 4
  %28 = alloca i32, align 4
  %29 = alloca %struct._PixelOfNode, align 16
  %30 = alloca %struct.uint4, align 16
  %31 = alloca %struct.uchar3, align 1
  %32 = alloca %struct.uint4, align 16
  %33 = alloca i32, align 4
  %34 = alloca i8, align 1
  %35 = alloca i8, align 1
  %36 = alloca %struct.uint4, align 16
  %37 = alloca i32, align 4
  %38 = alloca i32, align 4
  %39 = alloca i32, align 4
  %40 = alloca %struct.uint4, align 16
  %41 = alloca %struct._PixelOfChildren, align 16
  %42 = alloca %struct.uint4, align 16
  %43 = alloca i8, align 1
  %44 = alloca i32, align 4
  %45 = alloca i32, align 4
  %46 = alloca i32, align 4
  %47 = alloca %struct.uint4, align 16
  %48 = alloca i32, align 4
  %49 = alloca %struct.uchar3, align 1
  %50 = alloca %struct._PixelOfChildren, align 16
  %51 = alloca %struct.uint4, align 16
  %52 = alloca i32, align 4
  %53 = alloca i32, align 4
  %54 = alloca i32, align 4
  %55 = alloca i32, align 4
  %56 = alloca %struct.uchar3, align 1
  %57 = alloca %struct.uchar3, align 1
  %58 = alloca %struct.uchar3, align 1
  %59 = alloca %struct.uchar3, align 1
  %60 = alloca %struct.uint4, align 16
  %61 = alloca %struct._PixelOfChildren, align 16
  %62 = alloca %struct.uint4, align 16
  %63 = alloca i8, align 1
  %64 = alloca %struct.uchar3, align 1
  %65 = alloca %struct.uchar3, align 1
  %66 = alloca %struct.uchar3, align 1
  %67 = alloca %struct.uchar3, align 1
  %68 = alloca %struct.uchar3, align 1
  %69 = alloca %struct.uint4, align 16
  %70 = alloca i32, align 4
  %71 = alloca %struct.uchar3, align 1
  %72 = alloca %struct.uint4, align 16
  store ptr %0, ptr %12, align 8
  store i32 %1, ptr %13, align 4
  store ptr %2, ptr %14, align 8
  store ptr %3, ptr %15, align 8
  store ptr %4, ptr %16, align 8
  store ptr %5, ptr %17, align 8
  store i32 %6, ptr %18, align 4
  store i32 %7, ptr %19, align 4
  store i32 %8, ptr %20, align 4
  store i32 %9, ptr %21, align 4
  store i32 %10, ptr %22, align 4
  %73 = call noundef i32 @_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_xEv() #7
  %74 = call noundef i32 @_ZN25__cuda_builtin_blockDim_t17__fetch_builtin_xEv() #7
  %75 = call noundef i32 @_ZL8__umul24jj(i32 noundef %73, i32 noundef %74) #7
  %76 = call noundef i32 @_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_xEv() #7
  %77 = add i32 %75, %76
  store i32 %77, ptr %23, align 4
  %78 = load i32, ptr %23, align 4
  %79 = load i32, ptr %13, align 4
  %80 = icmp sge i32 %78, %79
  br i1 %80, label %81, label %82

81:                                               ; preds = %11
  br label %749

82:                                               ; preds = %11
  br label %83

83:                                               ; preds = %82
  br label %84

84:                                               ; preds = %83
  %85 = load ptr, ptr %16, align 8
  %86 = load ptr, ptr %12, align 8
  %87 = load i32, ptr %23, align 4
  %88 = sext i32 %87 to i64
  %89 = getelementptr inbounds %struct.MatchInfo, ptr %86, i64 %88
  %90 = getelementptr inbounds %struct.MatchInfo, ptr %89, i32 0, i32 1
  %91 = load i32, ptr %90, align 4
  %92 = zext i32 %91 to i64
  %93 = getelementptr inbounds i32, ptr %85, i64 %92
  %94 = load i32, ptr %93, align 4
  store i32 %94, ptr %24, align 4
  %95 = load i32, ptr %24, align 4
  %96 = load ptr, ptr %15, align 8
  %97 = sext i32 %95 to i64
  %98 = getelementptr inbounds i8, ptr %96, i64 %97
  store ptr %98, ptr %15, align 8
  br label %99

99:                                               ; preds = %84
  br label %100

100:                                              ; preds = %99
  %101 = load ptr, ptr %15, align 8
  %102 = load ptr, ptr %12, align 8
  %103 = load i32, ptr %23, align 4
  %104 = sext i32 %103 to i64
  %105 = getelementptr inbounds %struct.MatchInfo, ptr %102, i64 %104
  %106 = getelementptr inbounds %struct.MatchInfo, ptr %105, i32 0, i32 5
  %107 = load i16, ptr %106, align 2
  %108 = zext i16 %107 to i64
  %109 = getelementptr inbounds i8, ptr %101, i64 %108
  %110 = load i8, ptr %109, align 1
  store i8 %110, ptr %25, align 1
  %111 = load ptr, ptr %12, align 8
  %112 = load i32, ptr %23, align 4
  %113 = sext i32 %112 to i64
  %114 = getelementptr inbounds %struct.MatchInfo, ptr %111, i64 %113
  %115 = getelementptr inbounds %struct.MatchInfo, ptr %114, i32 0, i32 2
  %116 = getelementptr inbounds %struct.TextureAddress, ptr %115, i32 0, i32 0
  %117 = load i32, ptr %116, align 4
  store i32 %117, ptr %26, align 4
  %118 = load i32, ptr %26, align 4
  store i32 %118, ptr %27, align 4
  %119 = load i32, ptr %27, align 4
  store i32 %119, ptr %28, align 4
  %120 = load i32, ptr %27, align 4
  %121 = call %struct.uint4 @_Z7getNodejb(i32 noundef %120, i1 noundef zeroext true) #7
  %122 = getelementptr inbounds %struct.uint4, ptr %30, i32 0, i32 0
  %123 = extractvalue %struct.uint4 %121, 0
  store i32 %123, ptr %122, align 16
  %124 = getelementptr inbounds %struct.uint4, ptr %30, i32 0, i32 1
  %125 = extractvalue %struct.uint4 %121, 1
  store i32 %125, ptr %124, align 4
  %126 = getelementptr inbounds %struct.uint4, ptr %30, i32 0, i32 2
  %127 = extractvalue %struct.uint4 %121, 2
  store i32 %127, ptr %126, align 8
  %128 = getelementptr inbounds %struct.uint4, ptr %30, i32 0, i32 3
  %129 = extractvalue %struct.uint4 %121, 3
  store i32 %129, ptr %128, align 4
  %130 = getelementptr inbounds %struct._PixelOfNode, ptr %29, i32 0, i32 0
  call void @llvm.memcpy.p0.p0.i64(ptr align 16 %130, ptr align 16 %30, i64 16, i1 false)
  br label %131

131:                                              ; preds = %100
  br label %132

132:                                              ; preds = %131
  br label %133


133:                                              ; preds = %171, %132
  %134 = getelementptr inbounds %struct._PixelOfNode, ptr %29, i32 0, i32 0
  %135 = getelementptr inbounds %struct.anon.7, ptr %134, i32 0, i32 4
  %136 = getelementptr inbounds %struct.uchar3, ptr %135, i32 0, i32 0
  %137 = load i8, ptr %136, align 4
  %138 = zext i8 %137 to i32
  %139 = getelementptr inbounds %struct._PixelOfNode, ptr %29, i32 0, i32 0
  %140 = getelementptr inbounds %struct.anon.7, ptr %139, i32 0, i32 4
  %141 = getelementptr inbounds %struct.uchar3, ptr %140, i32 0, i32 1
  %142 = load i8, ptr %141, align 1
  %143 = zext i8 %142 to i32
  %144 = shl i32 %143, 8
  %145 = or i32 %138, %144
  %146 = getelementptr inbounds %struct._PixelOfNode, ptr %29, i32 0, i32 0
  %147 = getelementptr inbounds %struct.anon.7, ptr %146, i32 0, i32 4
  %148 = getelementptr inbounds %struct.uchar3, ptr %147, i32 0, i32 2
  %149 = load i8, ptr %148, align 2
  %150 = zext i8 %149 to i32
  %151 = shl i32 %150, 16
  %152 = or i32 %145, %151
  %153 = load i32, ptr %22, align 4
  %154 = icmp sgt i32 %152, %153
  br i1 %154, label %155, label %172

155:                                              ; preds = %133
  %156 = load i32, ptr %27, align 4
  store i32 %156, ptr %28, align 4
  %157 = getelementptr inbounds %struct._PixelOfNode, ptr %29, i32 0, i32 0
  %158 = getelementptr inbounds %struct.anon.7, ptr %157, i32 0, i32 0
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %31, ptr align 16 %158, i64 3, i1 false)
  call void @_Z14arrayToAddress6uchar3Rj(ptr noundef byval(%struct.uchar3) align 1 %31, ptr noundef nonnull align 4 dereferenceable(4) %27) #7
  %159 = load i32, ptr %27, align 4
  %160 = call %struct.uint4 @_Z7getNodejb(i32 noundef %159, i1 noundef zeroext true) #7
  %161 = getelementptr inbounds %struct.uint4, ptr %32, i32 0, i32 0
  %162 = extractvalue %struct.uint4 %160, 0
  store i32 %162, ptr %161, align 16
  %163 = getelementptr inbounds %struct.uint4, ptr %32, i32 0, i32 1
  %164 = extractvalue %struct.uint4 %160, 1
  store i32 %164, ptr %163, align 4
  %165 = getelementptr inbounds %struct.uint4, ptr %32, i32 0, i32 2
  %166 = extractvalue %struct.uint4 %160, 2
  store i32 %166, ptr %165, align 8
  %167 = getelementptr inbounds %struct.uint4, ptr %32, i32 0, i32 3
  %168 = extractvalue %struct.uint4 %160, 3
  store i32 %168, ptr %167, align 4
  %169 = getelementptr inbounds %struct._PixelOfNode, ptr %29, i32 0, i32 0
  call void @llvm.memcpy.p0.p0.i64(ptr align 16 %169, ptr align 16 %32, i64 16, i1 false)
  br label %170

170:                                              ; preds = %155
  br label %171

171:                                              ; preds = %170
  br label %133, !llvm.loop !17

172:                                              ; preds = %133
  %173 = load i32, ptr %27, align 4
  store i32 %173, ptr %33, align 4
  %174 = load i32, ptr %28, align 4
  store i32 %174, ptr %27, align 4
  br label %175

175:                                              ; preds = %172
  br label %176

176:                                              ; preds = %175
  store i8 65, ptr %34, align 1
  store i8 0, ptr %35, align 1
  %177 = load i32, ptr %28, align 4
  %178 = call %struct.uint4 @_Z7getNodejb(i32 noundef %177, i1 noundef zeroext true) #7
  %179 = getelementptr inbounds %struct.uint4, ptr %36, i32 0, i32 0
  %180 = extractvalue %struct.uint4 %178, 0
  store i32 %180, ptr %179, align 16
  %181 = getelementptr inbounds %struct.uint4, ptr %36, i32 0, i32 1
  %182 = extractvalue %struct.uint4 %178, 1
  store i32 %182, ptr %181, align 4
  %183 = getelementptr inbounds %struct.uint4, ptr %36, i32 0, i32 2
  %184 = extractvalue %struct.uint4 %178, 2
  store i32 %184, ptr %183, align 8
  %185 = getelementptr inbounds %struct.uint4, ptr %36, i32 0, i32 3
  %186 = extractvalue %struct.uint4 %178, 3
  store i32 %186, ptr %185, align 4
  %187 = getelementptr inbounds %struct._PixelOfNode, ptr %29, i32 0, i32 0
  call void @llvm.memcpy.p0.p0.i64(ptr align 16 %187, ptr align 16 %36, i64 16, i1 false)
  %188 = getelementptr inbounds %struct._PixelOfNode, ptr %29, i32 0, i32 0
  %189 = getelementptr inbounds %struct.anon.7, ptr %188, i32 0, i32 4
  %190 = getelementptr inbounds %struct.uchar3, ptr %189, i32 0, i32 0
  %191 = load i8, ptr %190, align 4
  %192 = zext i8 %191 to i32
  %193 = getelementptr inbounds %struct._PixelOfNode, ptr %29, i32 0, i32 0
  %194 = getelementptr inbounds %struct.anon.7, ptr %193, i32 0, i32 4
  %195 = getelementptr inbounds %struct.uchar3, ptr %194, i32 0, i32 1
  %196 = load i8, ptr %195, align 1
  %197 = zext i8 %196 to i32
  %198 = shl i32 %197, 8
  %199 = or i32 %192, %198
  %200 = getelementptr inbounds %struct._PixelOfNode, ptr %29, i32 0, i32 0
  %201 = getelementptr inbounds %struct.anon.7, ptr %200, i32 0, i32 4
  %202 = getelementptr inbounds %struct.uchar3, ptr %201, i32 0, i32 2
  %203 = load i8, ptr %202, align 2
  %204 = zext i8 %203 to i32
  %205 = shl i32 %204, 16
  %206 = or i32 %199, %205
  %207 = sub nsw i32 %206, 1
  store i32 %207, ptr %37, align 4
  store i32 0, ptr %38, align 4
  %208 = load ptr, ptr %12, align 8
  %209 = load i32, ptr %23, align 4
  %210 = sext i32 %209 to i64
  %211 = getelementptr inbounds %struct.MatchInfo, ptr %208, i64 %210
  %212 = getelementptr inbounds %struct.MatchInfo, ptr %211, i32 0, i32 0
  %213 = load i32, ptr %212, align 4
  store i32 %213, ptr %39, align 4
  %214 = load i32, ptr %28, align 4
  %215 = load i32, ptr %26, align 4
  %216 = icmp eq i32 %214, %215
  br i1 %216, label %217, label %267

217:                                              ; preds = %176
  %218 = load ptr, ptr %12, align 8
  %219 = load i32, ptr %23, align 4
  %220 = sext i32 %219 to i64
  %221 = getelementptr inbounds %struct.MatchInfo, ptr %218, i64 %220
  %222 = getelementptr inbounds %struct.MatchInfo, ptr %221, i32 0, i32 4
  %223 = load i16, ptr %222, align 4
  %224 = zext i16 %223 to i32
  %225 = icmp sgt i32 %224, 0
  br i1 %225, label %226, label %266

226:                                              ; preds = %217
  %227 = load i32, ptr %33, align 4
  %228 = call %struct.uint4 @_Z7getNodejb(i32 noundef %227, i1 noundef zeroext true) #7
  %229 = getelementptr inbounds %struct.uint4, ptr %40, i32 0, i32 0
  %230 = extractvalue %struct.uint4 %228, 0
  store i32 %230, ptr %229, align 16
  %231 = getelementptr inbounds %struct.uint4, ptr %40, i32 0, i32 1
  %232 = extractvalue %struct.uint4 %228, 1
  store i32 %232, ptr %231, align 4
  %233 = getelementptr inbounds %struct.uint4, ptr %40, i32 0, i32 2
  %234 = extractvalue %struct.uint4 %228, 2
  store i32 %234, ptr %233, align 8
  %235 = getelementptr inbounds %struct.uint4, ptr %40, i32 0, i32 3
  %236 = extractvalue %struct.uint4 %228, 3
  store i32 %236, ptr %235, align 4
  %237 = getelementptr inbounds %struct._PixelOfNode, ptr %29, i32 0, i32 0
  call void @llvm.memcpy.p0.p0.i64(ptr align 16 %237, ptr align 16 %40, i64 16, i1 false)
  %238 = getelementptr inbounds %struct._PixelOfNode, ptr %29, i32 0, i32 0
  %239 = getelementptr inbounds %struct.anon.7, ptr %238, i32 0, i32 4
  %240 = getelementptr inbounds %struct.uchar3, ptr %239, i32 0, i32 0
  %241 = load i8, ptr %240, align 4
  %242 = zext i8 %241 to i32
  %243 = getelementptr inbounds %struct._PixelOfNode, ptr %29, i32 0, i32 0
  %244 = getelementptr inbounds %struct.anon.7, ptr %243, i32 0, i32 4
  %245 = getelementptr inbounds %struct.uchar3, ptr %244, i32 0, i32 1
  %246 = load i8, ptr %245, align 1
  %247 = zext i8 %246 to i32
  %248 = shl i32 %247, 8
  %249 = or i32 %242, %248
  %250 = getelementptr inbounds %struct._PixelOfNode, ptr %29, i32 0, i32 0
  %251 = getelementptr inbounds %struct.anon.7, ptr %250, i32 0, i32 4
  %252 = getelementptr inbounds %struct.uchar3, ptr %251, i32 0, i32 2
  %253 = load i8, ptr %252, align 2
  %254 = zext i8 %253 to i32
  %255 = shl i32 %254, 16
  %256 = or i32 %249, %255
  %257 = sub nsw i32 %256, 1
  %258 = load ptr, ptr %12, align 8
  %259 = load i32, ptr %23, align 4
  %260 = sext i32 %259 to i64
  %261 = getelementptr inbounds %struct.MatchInfo, ptr %258, i64 %260
  %262 = getelementptr inbounds %struct.MatchInfo, ptr %261, i32 0, i32 4
  %263 = load i16, ptr %262, align 4
  %264 = zext i16 %263 to i32
  %265 = add nsw i32 %257, %264
  store i32 %265, ptr %37, align 4
  br label %266

266:                                              ; preds = %226, %217
  store i32 1, ptr %38, align 4
  br label %267

267:                                              ; preds = %266, %176
  br label %268

268:                                              ; preds = %748, %267
  %269 = load i32, ptr %27, align 4
  %270 = load i32, ptr %33, align 4
  %271 = icmp ne i32 %269, %270
  br i1 %271, label %272, label %749

272:                                              ; preds = %268
  %273 = load i32, ptr %27, align 4
  %274 = call %struct.uint4 @_Z11getChildrenjb(i32 noundef %273, i1 noundef zeroext true) #7
  %275 = getelementptr inbounds %struct.uint4, ptr %42, i32 0, i32 0
  %276 = extractvalue %struct.uint4 %274, 0
  store i32 %276, ptr %275, align 16
  %277 = getelementptr inbounds %struct.uint4, ptr %42, i32 0, i32 1
  %278 = extractvalue %struct.uint4 %274, 1
  store i32 %278, ptr %277, align 4
  %279 = getelementptr inbounds %struct.uint4, ptr %42, i32 0, i32 2
  %280 = extractvalue %struct.uint4 %274, 2
  store i32 %280, ptr %279, align 8
  %281 = getelementptr inbounds %struct.uint4, ptr %42, i32 0, i32 3
  %282 = extractvalue %struct.uint4 %274, 3
  store i32 %282, ptr %281, align 4
  %283 = getelementptr inbounds %struct._PixelOfChildren, ptr %41, i32 0, i32 0
  call void @llvm.memcpy.p0.p0.i64(ptr align 16 %283, ptr align 16 %42, i64 16, i1 false)
  %284 = getelementptr inbounds %struct._PixelOfChildren, ptr %41, i32 0, i32 0
  %285 = getelementptr inbounds %struct.anon.4, ptr %284, i32 0, i32 5
  %286 = load i8, ptr %285, align 1
  store i8 %286, ptr %43, align 1
  br label %287

287:                                              ; preds = %272
  br label %288

288:                                              ; preds = %287
  %289 = load i8, ptr %43, align 1
  %290 = icmp ne i8 %289, 0
  br i1 %290, label %294, label %291

291:                                              ; preds = %288
  %292 = load i8, ptr %35, align 1
  %293 = trunc i8 %292 to i1
  br i1 %293, label %294, label %470

294:                                              ; preds = %291, %288
  %295 = load i8, ptr %43, align 1
  %296 = icmp ne i8 %295, 0
  br i1 %296, label %297, label %371

297:                                              ; preds = %294
  %298 = load i8, ptr %43, align 1
  %299 = sext i8 %298 to i32
  %300 = load i8, ptr %25, align 1
  %301 = sext i8 %300 to i32
  %302 = icmp ne i32 %299, %301
  br i1 %302, label %303, label %371

303:                                              ; preds = %297
  %304 = getelementptr inbounds %struct._PixelOfChildren, ptr %41, i32 0, i32 0
  %305 = getelementptr inbounds %struct.anon.5, ptr %304, i32 0, i32 0
  %306 = getelementptr inbounds %struct.uchar3, ptr %305, i32 0, i32 0
  %307 = load i8, ptr %306, align 16
  %308 = zext i8 %307 to i32
  %309 = getelementptr inbounds %struct._PixelOfChildren, ptr %41, i32 0, i32 0
  %310 = getelementptr inbounds %struct.anon.5, ptr %309, i32 0, i32 0
  %311 = getelementptr inbounds %struct.uchar3, ptr %310, i32 0, i32 1
  %312 = load i8, ptr %311, align 1
  %313 = zext i8 %312 to i32
  %314 = shl i32 %313, 8
  %315 = or i32 %308, %314
  %316 = getelementptr inbounds %struct._PixelOfChildren, ptr %41, i32 0, i32 0
  %317 = getelementptr inbounds %struct.anon.5, ptr %316, i32 0, i32 0
  %318 = getelementptr inbounds %struct.uchar3, ptr %317, i32 0, i32 2
  %319 = load i8, ptr %318, align 2
  %320 = zext i8 %319 to i32
  %321 = shl i32 %320, 16
  %322 = or i32 %315, %321
  store i32 %322, ptr %44, align 4
  %323 = load i32, ptr %44, align 4
  %324 = sub nsw i32 %323, 1
  %325 = load i32, ptr %18, align 4
  %326 = add nsw i32 %324, %325
  store i32 %326, ptr %45, align 4
  %327 = load i32, ptr %45, align 4
  %328 = load i32, ptr %37, align 4
  %329 = add nsw i32 %327, %328
  store i32 %329, ptr %46, align 4
  %330 = load i32, ptr %45, align 4
  %331 = load i32, ptr %18, align 4
  %332 = icmp ne i32 %330, %331
  br i1 %332, label %336, label %333

333:                                              ; preds = %303
  %334 = load i32, ptr %20, align 4
  %335 = icmp eq i32 %334, -1
  br i1 %335, label %336, label %370

336:                                              ; preds = %333, %303
  %337 = load i32, ptr %46, align 4
  %338 = load i32, ptr %19, align 4
  %339 = icmp ne i32 %337, %338
  br i1 %339, label %343, label %340

340:                                              ; preds = %336
  %341 = load i32, ptr %21, align 4
  %342 = icmp eq i32 %341, -1
  br i1 %342, label %343, label %370

343:                                              ; preds = %340, %336
  %344 = load i32, ptr %45, align 4
  %345 = load i32, ptr %18, align 4
  %346 = icmp sgt i32 %344, %345
  br i1 %346, label %347, label %351

347:                                              ; preds = %343
  %348 = load i32, ptr %46, align 4
  %349 = load i32, ptr %20, align 4
  %350 = icmp slt i32 %348, %349
  br i1 %350, label %369, label %351

351:                                              ; preds = %347, %343
  br label %352

352:                                              ; preds = %351
  br label %353

353:                                              ; preds = %352
  %354 = load i32, ptr %45, align 4
  %355 = load ptr, ptr %14, align 8
  %356 = load i32, ptr %39, align 4
  %357 = sext i32 %356 to i64
  %358 = getelementptr inbounds %struct.Alignment, ptr %355, i64 %357
  %359 = getelementptr inbounds %struct.Alignment, ptr %358, i32 0, i32 0
  store i32 %354, ptr %359, align 4
  %360 = load i32, ptr %37, align 4
  %361 = trunc i32 %360 to i16
  %362 = load ptr, ptr %14, align 8
  %363 = load i32, ptr %39, align 4
  %364 = sext i32 %363 to i64
  %365 = getelementptr inbounds %struct.Alignment, ptr %362, i64 %364
  %366 = getelementptr inbounds %struct.Alignment, ptr %365, i32 0, i32 1
  store i16 %361, ptr %366, align 4
  %367 = load i32, ptr %39, align 4
  %368 = add nsw i32 %367, 1
  store i32 %368, ptr %39, align 4
  br label %369

369:                                              ; preds = %353, %347
  br label %370

370:                                              ; preds = %369, %340, %333
  br label %371

371:                                              ; preds = %370, %297, %294
  store i8 0, ptr %35, align 1
  %372 = load i32, ptr %27, align 4
  %373 = call %struct.uint4 @_Z7getNodejb(i32 noundef %372, i1 noundef zeroext true) #7
  %374 = getelementptr inbounds %struct.uint4, ptr %47, i32 0, i32 0
  %375 = extractvalue %struct.uint4 %373, 0
  store i32 %375, ptr %374, align 16
  %376 = getelementptr inbounds %struct.uint4, ptr %47, i32 0, i32 1
  %377 = extractvalue %struct.uint4 %373, 1
  store i32 %377, ptr %376, align 4
  %378 = getelementptr inbounds %struct.uint4, ptr %47, i32 0, i32 2
  %379 = extractvalue %struct.uint4 %373, 2
  store i32 %379, ptr %378, align 8
  %380 = getelementptr inbounds %struct.uint4, ptr %47, i32 0, i32 3
  %381 = extractvalue %struct.uint4 %373, 3
  store i32 %381, ptr %380, align 4
  %382 = getelementptr inbounds %struct._PixelOfNode, ptr %29, i32 0, i32 0
  call void @llvm.memcpy.p0.p0.i64(ptr align 16 %382, ptr align 16 %47, i64 16, i1 false)
  %383 = getelementptr inbounds %struct._PixelOfNode, ptr %29, i32 0, i32 0
  %384 = getelementptr inbounds %struct.anon.7, ptr %383, i32 0, i32 0
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %49, ptr align 16 %384, i64 3, i1 false)
  call void @_Z14arrayToAddress6uchar3Rj(ptr noundef byval(%struct.uchar3) align 1 %49, ptr noundef nonnull align 4 dereferenceable(4) %48) #7
  %385 = load i32, ptr %48, align 4
  %386 = call %struct.uint4 @_Z11getChildrenjb(i32 noundef %385, i1 noundef zeroext true) #7
  %387 = getelementptr inbounds %struct.uint4, ptr %51, i32 0, i32 0
  %388 = extractvalue %struct.uint4 %386, 0
  store i32 %388, ptr %387, align 16
  %389 = getelementptr inbounds %struct.uint4, ptr %51, i32 0, i32 1
  %390 = extractvalue %struct.uint4 %386, 1
  store i32 %390, ptr %389, align 4
  %391 = getelementptr inbounds %struct.uint4, ptr %51, i32 0, i32 2
  %392 = extractvalue %struct.uint4 %386, 2
  store i32 %392, ptr %391, align 8
  %393 = getelementptr inbounds %struct.uint4, ptr %51, i32 0, i32 3
  %394 = extractvalue %struct.uint4 %386, 3
  store i32 %394, ptr %393, align 4
  %395 = getelementptr inbounds %struct._PixelOfChildren, ptr %50, i32 0, i32 0
  call void @llvm.memcpy.p0.p0.i64(ptr align 16 %395, ptr align 16 %51, i64 16, i1 false)
  %396 = getelementptr inbounds %struct._PixelOfChildren, ptr %50, i32 0, i32 0
  %397 = getelementptr inbounds %struct.anon.4, ptr %396, i32 0, i32 0
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %56, ptr align 16 %397, i64 3, i1 false)
  call void @_Z14arrayToAddress6uchar3Rj(ptr noundef byval(%struct.uchar3) align 1 %56, ptr noundef nonnull align 4 dereferenceable(4) %52) #7
  %398 = getelementptr inbounds %struct._PixelOfChildren, ptr %50, i32 0, i32 0
  %399 = getelementptr inbounds %struct.anon.4, ptr %398, i32 0, i32 1
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %57, ptr align 1 %399, i64 3, i1 false)
  call void @_Z14arrayToAddress6uchar3Rj(ptr noundef byval(%struct.uchar3) align 1 %57, ptr noundef nonnull align 4 dereferenceable(4) %53) #7
  %400 = getelementptr inbounds %struct._PixelOfChildren, ptr %50, i32 0, i32 0
  %401 = getelementptr inbounds %struct.anon.4, ptr %400, i32 0, i32 2
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %58, ptr align 2 %401, i64 3, i1 false)
  call void @_Z14arrayToAddress6uchar3Rj(ptr noundef byval(%struct.uchar3) align 1 %58, ptr noundef nonnull align 4 dereferenceable(4) %54) #7
  %402 = getelementptr inbounds %struct._PixelOfChildren, ptr %50, i32 0, i32 0
  %403 = getelementptr inbounds %struct.anon.4, ptr %402, i32 0, i32 3
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %59, ptr align 1 %403, i64 3, i1 false)
  call void @_Z14arrayToAddress6uchar3Rj(ptr noundef byval(%struct.uchar3) align 1 %59, ptr noundef nonnull align 4 dereferenceable(4) %55) #7
  %404 = load i32, ptr %52, align 4
  %405 = load i32, ptr %27, align 4
  %406 = icmp eq i32 %404, %405
  br i1 %406, label %407, label %408

407:                                              ; preds = %371
  store i8 67, ptr %34, align 1
  br label %427

408:                                              ; preds = %371
  %409 = load i32, ptr %53, align 4
  %410 = load i32, ptr %27, align 4
  %411 = icmp eq i32 %409, %410
  br i1 %411, label %412, label %413

412:                                              ; preds = %408
  store i8 71, ptr %34, align 1
  br label %426

413:                                              ; preds = %408
  %414 = load i32, ptr %54, align 4
  %415 = load i32, ptr %27, align 4
  %416 = icmp eq i32 %414, %415
  br i1 %416, label %417, label %418

417:                                              ; preds = %413
  store i8 84, ptr %34, align 1
  br label %425

418:                                              ; preds = %413
  %419 = load i32, ptr %55, align 4
  %420 = load i32, ptr %27, align 4
  %421 = icmp eq i32 %419, %420
  br i1 %421, label %422, label %423

422:                                              ; preds = %418
  store i8 36, ptr %34, align 1
  br label %424

423:                                              ; preds = %418
  store i8 1, ptr %35, align 1
  br label %424

424:                                              ; preds = %423, %422
  br label %425

425:                                              ; preds = %424, %417
  br label %426

426:                                              ; preds = %425, %412
  br label %427

427:                                              ; preds = %426, %407
  %428 = load i32, ptr %48, align 4
  store i32 %428, ptr %27, align 4
  %429 = load i32, ptr %38, align 4
  %430 = icmp ne i32 %429, 0
  br i1 %430, label %431, label %434

431:                                              ; preds = %427
  %432 = load i32, ptr %38, align 4
  %433 = add nsw i32 %432, -1
  store i32 %433, ptr %38, align 4
  br label %434

434:                                              ; preds = %431, %427
  %435 = load i32, ptr %38, align 4
  %436 = icmp eq i32 %435, 0
  br i1 %436, label %437, label %469

437:                                              ; preds = %434
  %438 = load i32, ptr %27, align 4
  %439 = call %struct.uint4 @_Z7getNodejb(i32 noundef %438, i1 noundef zeroext true) #7
  %440 = getelementptr inbounds %struct.uint4, ptr %60, i32 0, i32 0
  %441 = extractvalue %struct.uint4 %439, 0
  store i32 %441, ptr %440, align 16
  %442 = getelementptr inbounds %struct.uint4, ptr %60, i32 0, i32 1
  %443 = extractvalue %struct.uint4 %439, 1
  store i32 %443, ptr %442, align 4
  %444 = getelementptr inbounds %struct.uint4, ptr %60, i32 0, i32 2
  %445 = extractvalue %struct.uint4 %439, 2
  store i32 %445, ptr %444, align 8
  %446 = getelementptr inbounds %struct.uint4, ptr %60, i32 0, i32 3
  %447 = extractvalue %struct.uint4 %439, 3
  store i32 %447, ptr %446, align 4
  %448 = getelementptr inbounds %struct._PixelOfNode, ptr %29, i32 0, i32 0
  call void @llvm.memcpy.p0.p0.i64(ptr align 16 %448, ptr align 16 %60, i64 16, i1 false)
  %449 = getelementptr inbounds %struct._PixelOfNode, ptr %29, i32 0, i32 0
  %450 = getelementptr inbounds %struct.anon.7, ptr %449, i32 0, i32 4
  %451 = getelementptr inbounds %struct.uchar3, ptr %450, i32 0, i32 0
  %452 = load i8, ptr %451, align 4
  %453 = zext i8 %452 to i32
  %454 = getelementptr inbounds %struct._PixelOfNode, ptr %29, i32 0, i32 0
  %455 = getelementptr inbounds %struct.anon.7, ptr %454, i32 0, i32 4
  %456 = getelementptr inbounds %struct.uchar3, ptr %455, i32 0, i32 1
  %457 = load i8, ptr %456, align 1
  %458 = zext i8 %457 to i32
  %459 = shl i32 %458, 8
  %460 = or i32 %453, %459
  %461 = getelementptr inbounds %struct._PixelOfNode, ptr %29, i32 0, i32 0
  %462 = getelementptr inbounds %struct.anon.7, ptr %461, i32 0, i32 4
  %463 = getelementptr inbounds %struct.uchar3, ptr %462, i32 0, i32 2
  %464 = load i8, ptr %463, align 2
  %465 = zext i8 %464 to i32
  %466 = shl i32 %465, 16
  %467 = or i32 %460, %466
  %468 = sub nsw i32 %467, 1
  store i32 %468, ptr %37, align 4
  br label %469

469:                                              ; preds = %437, %434
  br label %748

470:                                              ; preds = %291
  %471 = load i32, ptr %27, align 4
  %472 = call %struct.uint4 @_Z11getChildrenjb(i32 noundef %471, i1 noundef zeroext true) #7
  %473 = getelementptr inbounds %struct.uint4, ptr %62, i32 0, i32 0
  %474 = extractvalue %struct.uint4 %472, 0
  store i32 %474, ptr %473, align 16
  %475 = getelementptr inbounds %struct.uint4, ptr %62, i32 0, i32 1
  %476 = extractvalue %struct.uint4 %472, 1
  store i32 %476, ptr %475, align 4
  %477 = getelementptr inbounds %struct.uint4, ptr %62, i32 0, i32 2
  %478 = extractvalue %struct.uint4 %472, 2
  store i32 %478, ptr %477, align 8
  %479 = getelementptr inbounds %struct.uint4, ptr %62, i32 0, i32 3
  %480 = extractvalue %struct.uint4 %472, 3
  store i32 %480, ptr %479, align 4
  %481 = getelementptr inbounds %struct._PixelOfChildren, ptr %61, i32 0, i32 0
  call void @llvm.memcpy.p0.p0.i64(ptr align 16 %481, ptr align 16 %62, i64 16, i1 false)
  store i8 0, ptr %63, align 1
  %482 = load i32, ptr %38, align 4
  %483 = icmp eq i32 %482, 0
  br i1 %483, label %484, label %499

484:                                              ; preds = %470
  %485 = load ptr, ptr %15, align 8
  %486 = load ptr, ptr %12, align 8
  %487 = load i32, ptr %23, align 4
  %488 = sext i32 %487 to i64
  %489 = getelementptr inbounds %struct.MatchInfo, ptr %486, i64 %488
  %490 = getelementptr inbounds %struct.MatchInfo, ptr %489, i32 0, i32 5
  %491 = load i16, ptr %490, align 2
  %492 = zext i16 %491 to i32
  %493 = load i32, ptr %37, align 4
  %494 = add nsw i32 %492, %493
  %495 = add nsw i32 %494, 1
  %496 = sext i32 %495 to i64
  %497 = getelementptr inbounds i8, ptr %485, i64 %496
  %498 = load i8, ptr %497, align 1
  store i8 %498, ptr %63, align 1
  br label %499

499:                                              ; preds = %484, %470
  br label %500

500:                                              ; preds = %499
  %501 = load i8, ptr %34, align 1
  %502 = sext i8 %501 to i32
  %503 = icmp eq i32 %502, 65
  br i1 %503, label %504, label %528

504:                                              ; preds = %500
  %505 = getelementptr inbounds %struct._PixelOfChildren, ptr %61, i32 0, i32 0
  %506 = getelementptr inbounds %struct.anon.4, ptr %505, i32 0, i32 0
  %507 = getelementptr inbounds %struct.uchar3, ptr %506, i32 0, i32 0
  %508 = load i8, ptr %507, align 16
  %509 = icmp ne i8 %508, 0
  br i1 %509, label %522, label %510

510:                                              ; preds = %504
  %511 = getelementptr inbounds %struct._PixelOfChildren, ptr %61, i32 0, i32 0
  %512 = getelementptr inbounds %struct.anon.4, ptr %511, i32 0, i32 0
  %513 = getelementptr inbounds %struct.uchar3, ptr %512, i32 0, i32 1
  %514 = load i8, ptr %513, align 1
  %515 = icmp ne i8 %514, 0
  br i1 %515, label %522, label %516

516:                                              ; preds = %510
  %517 = getelementptr inbounds %struct._PixelOfChildren, ptr %61, i32 0, i32 0
  %518 = getelementptr inbounds %struct.anon.4, ptr %517, i32 0, i32 0
  %519 = getelementptr inbounds %struct.uchar3, ptr %518, i32 0, i32 2
  %520 = load i8, ptr %519, align 2
  %521 = icmp ne i8 %520, 0
  br i1 %521, label %522, label %527

522:                                              ; preds = %516, %510, %504
  br label %523

523:                                              ; preds = %522
  br label %524

524:                                              ; preds = %523
  %525 = getelementptr inbounds %struct._PixelOfChildren, ptr %61, i32 0, i32 0
  %526 = getelementptr inbounds %struct.anon.4, ptr %525, i32 0, i32 0
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %64, ptr align 16 %526, i64 3, i1 false)
  call void @_Z14arrayToAddress6uchar3Rj(ptr noundef byval(%struct.uchar3) align 1 %64, ptr noundef nonnull align 4 dereferenceable(4) %27) #7
  br label %641

527:                                              ; preds = %516
  store i8 67, ptr %34, align 1
  br label %528

528:                                              ; preds = %527, %500
  %529 = load i8, ptr %34, align 1
  %530 = sext i8 %529 to i32
  %531 = icmp eq i32 %530, 67
  br i1 %531, label %532, label %556

532:                                              ; preds = %528
  %533 = getelementptr inbounds %struct._PixelOfChildren, ptr %61, i32 0, i32 0
  %534 = getelementptr inbounds %struct.anon.4, ptr %533, i32 0, i32 1
  %535 = getelementptr inbounds %struct.uchar3, ptr %534, i32 0, i32 0
  %536 = load i8, ptr %535, align 1
  %537 = icmp ne i8 %536, 0
  br i1 %537, label %550, label %538

538:                                              ; preds = %532
  %539 = getelementptr inbounds %struct._PixelOfChildren, ptr %61, i32 0, i32 0
  %540 = getelementptr inbounds %struct.anon.4, ptr %539, i32 0, i32 1
  %541 = getelementptr inbounds %struct.uchar3, ptr %540, i32 0, i32 1
  %542 = load i8, ptr %541, align 1
  %543 = icmp ne i8 %542, 0
  br i1 %543, label %550, label %544

544:                                              ; preds = %538
  %545 = getelementptr inbounds %struct._PixelOfChildren, ptr %61, i32 0, i32 0
  %546 = getelementptr inbounds %struct.anon.4, ptr %545, i32 0, i32 1
  %547 = getelementptr inbounds %struct.uchar3, ptr %546, i32 0, i32 2
  %548 = load i8, ptr %547, align 1
  %549 = icmp ne i8 %548, 0
  br i1 %549, label %550, label %555

550:                                              ; preds = %544, %538, %532
  br label %551

551:                                              ; preds = %550
  br label %552

552:                                              ; preds = %551
  %553 = getelementptr inbounds %struct._PixelOfChildren, ptr %61, i32 0, i32 0
  %554 = getelementptr inbounds %struct.anon.4, ptr %553, i32 0, i32 1
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %65, ptr align 1 %554, i64 3, i1 false)
  call void @_Z14arrayToAddress6uchar3Rj(ptr noundef byval(%struct.uchar3) align 1 %65, ptr noundef nonnull align 4 dereferenceable(4) %27) #7
  br label %641

555:                                              ; preds = %544
  store i8 71, ptr %34, align 1
  br label %556

556:                                              ; preds = %555, %528
  %557 = load i8, ptr %34, align 1
  %558 = sext i8 %557 to i32
  %559 = icmp eq i32 %558, 71
  br i1 %559, label %560, label %584

560:                                              ; preds = %556
  %561 = getelementptr inbounds %struct._PixelOfChildren, ptr %61, i32 0, i32 0
  %562 = getelementptr inbounds %struct.anon.4, ptr %561, i32 0, i32 2
  %563 = getelementptr inbounds %struct.uchar3, ptr %562, i32 0, i32 0
  %564 = load i8, ptr %563, align 2
  %565 = icmp ne i8 %564, 0
  br i1 %565, label %578, label %566

566:                                              ; preds = %560
  %567 = getelementptr inbounds %struct._PixelOfChildren, ptr %61, i32 0, i32 0
  %568 = getelementptr inbounds %struct.anon.4, ptr %567, i32 0, i32 2
  %569 = getelementptr inbounds %struct.uchar3, ptr %568, i32 0, i32 1
  %570 = load i8, ptr %569, align 1
  %571 = icmp ne i8 %570, 0
  br i1 %571, label %578, label %572

572:                                              ; preds = %566
  %573 = getelementptr inbounds %struct._PixelOfChildren, ptr %61, i32 0, i32 0
  %574 = getelementptr inbounds %struct.anon.4, ptr %573, i32 0, i32 2
  %575 = getelementptr inbounds %struct.uchar3, ptr %574, i32 0, i32 2
  %576 = load i8, ptr %575, align 2
  %577 = icmp ne i8 %576, 0
  br i1 %577, label %578, label %583

578:                                              ; preds = %572, %566, %560
  br label %579

579:                                              ; preds = %578
  br label %580

580:                                              ; preds = %579
  %581 = getelementptr inbounds %struct._PixelOfChildren, ptr %61, i32 0, i32 0
  %582 = getelementptr inbounds %struct.anon.4, ptr %581, i32 0, i32 2
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %66, ptr align 2 %582, i64 3, i1 false)
  call void @_Z14arrayToAddress6uchar3Rj(ptr noundef byval(%struct.uchar3) align 1 %66, ptr noundef nonnull align 4 dereferenceable(4) %27) #7
  br label %641

583:                                              ; preds = %572
  store i8 84, ptr %34, align 1
  br label %584

584:                                              ; preds = %583, %556
  %585 = load i8, ptr %34, align 1
  %586 = sext i8 %585 to i32
  %587 = icmp eq i32 %586, 84
  br i1 %587, label %588, label %612

588:                                              ; preds = %584
  %589 = getelementptr inbounds %struct._PixelOfChildren, ptr %61, i32 0, i32 0
  %590 = getelementptr inbounds %struct.anon.4, ptr %589, i32 0, i32 3
  %591 = getelementptr inbounds %struct.uchar3, ptr %590, i32 0, i32 0
  %592 = load i8, ptr %591, align 1
  %593 = icmp ne i8 %592, 0
  br i1 %593, label %606, label %594

594:                                              ; preds = %588
  %595 = getelementptr inbounds %struct._PixelOfChildren, ptr %61, i32 0, i32 0
  %596 = getelementptr inbounds %struct.anon.4, ptr %595, i32 0, i32 3
  %597 = getelementptr inbounds %struct.uchar3, ptr %596, i32 0, i32 1
  %598 = load i8, ptr %597, align 1
  %599 = icmp ne i8 %598, 0
  br i1 %599, label %606, label %600

600:                                              ; preds = %594
  %601 = getelementptr inbounds %struct._PixelOfChildren, ptr %61, i32 0, i32 0
  %602 = getelementptr inbounds %struct.anon.4, ptr %601, i32 0, i32 3
  %603 = getelementptr inbounds %struct.uchar3, ptr %602, i32 0, i32 2
  %604 = load i8, ptr %603, align 1
  %605 = icmp ne i8 %604, 0
  br i1 %605, label %606, label %611

606:                                              ; preds = %600, %594, %588
  br label %607

607:                                              ; preds = %606
  br label %608

608:                                              ; preds = %607
  %609 = getelementptr inbounds %struct._PixelOfChildren, ptr %61, i32 0, i32 0
  %610 = getelementptr inbounds %struct.anon.4, ptr %609, i32 0, i32 3
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %67, ptr align 1 %610, i64 3, i1 false)
  call void @_Z14arrayToAddress6uchar3Rj(ptr noundef byval(%struct.uchar3) align 1 %67, ptr noundef nonnull align 4 dereferenceable(4) %27) #7
  br label %641

611:                                              ; preds = %600
  store i8 36, ptr %34, align 1
  br label %612

612:                                              ; preds = %611, %584
  %613 = load i8, ptr %34, align 1
  %614 = sext i8 %613 to i32
  %615 = icmp eq i32 %614, 36
  br i1 %615, label %616, label %640

616:                                              ; preds = %612
  %617 = getelementptr inbounds %struct._PixelOfChildren, ptr %61, i32 0, i32 0
  %618 = getelementptr inbounds %struct.anon.4, ptr %617, i32 0, i32 4
  %619 = getelementptr inbounds %struct.uchar3, ptr %618, i32 0, i32 0
  %620 = load i8, ptr %619, align 4
  %621 = icmp ne i8 %620, 0
  br i1 %621, label %634, label %622

622:                                              ; preds = %616
  %623 = getelementptr inbounds %struct._PixelOfChildren, ptr %61, i32 0, i32 0
  %624 = getelementptr inbounds %struct.anon.4, ptr %623, i32 0, i32 4
  %625 = getelementptr inbounds %struct.uchar3, ptr %624, i32 0, i32 1
  %626 = load i8, ptr %625, align 1
  %627 = icmp ne i8 %626, 0
  br i1 %627, label %634, label %628

628:                                              ; preds = %622
  %629 = getelementptr inbounds %struct._PixelOfChildren, ptr %61, i32 0, i32 0
  %630 = getelementptr inbounds %struct.anon.4, ptr %629, i32 0, i32 4
  %631 = getelementptr inbounds %struct.uchar3, ptr %630, i32 0, i32 2
  %632 = load i8, ptr %631, align 2
  %633 = icmp ne i8 %632, 0
  br i1 %633, label %634, label %639

634:                                              ; preds = %628, %622, %616
  br label %635

635:                                              ; preds = %634
  br label %636

636:                                              ; preds = %635
  %637 = getelementptr inbounds %struct._PixelOfChildren, ptr %61, i32 0, i32 0
  %638 = getelementptr inbounds %struct.anon.4, ptr %637, i32 0, i32 4
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %68, ptr align 4 %638, i64 3, i1 false)
  call void @_Z14arrayToAddress6uchar3Rj(ptr noundef byval(%struct.uchar3) align 1 %68, ptr noundef nonnull align 4 dereferenceable(4) %27) #7
  br label %641

639:                                              ; preds = %628
  br label %640

640:                                              ; preds = %639, %612
  store i8 1, ptr %35, align 1
  br label %641

641:                                              ; preds = %640, %636, %608, %580, %552, %524
  %642 = load i8, ptr %35, align 1
  %643 = trunc i8 %642 to i1
  br i1 %643, label %747, label %644

644:                                              ; preds = %641
  %645 = load i32, ptr %38, align 4
  %646 = icmp eq i32 %645, 0
  br i1 %646, label %647, label %743

647:                                              ; preds = %644
  %648 = load i8, ptr %34, align 1
  %649 = sext i8 %648 to i32
  %650 = load i8, ptr %63, align 1
  %651 = sext i8 %650 to i32
  %652 = icmp eq i32 %649, %651
  br i1 %652, label %653, label %741

653:                                              ; preds = %647
  %654 = load i32, ptr %27, align 4
  %655 = call %struct.uint4 @_Z7getNodejb(i32 noundef %654, i1 noundef zeroext true) #7
  %656 = getelementptr inbounds %struct.uint4, ptr %69, i32 0, i32 0
  %657 = extractvalue %struct.uint4 %655, 0
  store i32 %657, ptr %656, align 16
  %658 = getelementptr inbounds %struct.uint4, ptr %69, i32 0, i32 1
  %659 = extractvalue %struct.uint4 %655, 1
  store i32 %659, ptr %658, align 4
  %660 = getelementptr inbounds %struct.uint4, ptr %69, i32 0, i32 2
  %661 = extractvalue %struct.uint4 %655, 2
  store i32 %661, ptr %660, align 8
  %662 = getelementptr inbounds %struct.uint4, ptr %69, i32 0, i32 3
  %663 = extractvalue %struct.uint4 %655, 3
  store i32 %663, ptr %662, align 4
  %664 = getelementptr inbounds %struct._PixelOfNode, ptr %29, i32 0, i32 0
  call void @llvm.memcpy.p0.p0.i64(ptr align 16 %664, ptr align 16 %69, i64 16, i1 false)
  %665 = getelementptr inbounds %struct._PixelOfNode, ptr %29, i32 0, i32 0
  %666 = getelementptr inbounds %struct.anon.7, ptr %665, i32 0, i32 4
  %667 = getelementptr inbounds %struct.uchar3, ptr %666, i32 0, i32 0
  %668 = load i8, ptr %667, align 4
  %669 = zext i8 %668 to i32
  %670 = getelementptr inbounds %struct._PixelOfNode, ptr %29, i32 0, i32 0
  %671 = getelementptr inbounds %struct.anon.7, ptr %670, i32 0, i32 4
  %672 = getelementptr inbounds %struct.uchar3, ptr %671, i32 0, i32 1
  %673 = load i8, ptr %672, align 1
  %674 = zext i8 %673 to i32
  %675 = shl i32 %674, 8
  %676 = or i32 %669, %675
  %677 = getelementptr inbounds %struct._PixelOfNode, ptr %29, i32 0, i32 0
  %678 = getelementptr inbounds %struct.anon.7, ptr %677, i32 0, i32 4
  %679 = getelementptr inbounds %struct.uchar3, ptr %678, i32 0, i32 2
  %680 = load i8, ptr %679, align 2
  %681 = zext i8 %680 to i32
  %682 = shl i32 %681, 16
  %683 = or i32 %676, %682
  %684 = sub nsw i32 %683, 1
  store i32 %684, ptr %37, align 4
  %685 = load i32, ptr %27, align 4
  %686 = load i32, ptr %26, align 4
  %687 = icmp eq i32 %685, %686
  br i1 %687, label %688, label %740

688:                                              ; preds = %653
  store i32 1, ptr %38, align 4
  %689 = load ptr, ptr %12, align 8
  %690 = load i32, ptr %23, align 4
  %691 = sext i32 %690 to i64
  %692 = getelementptr inbounds %struct.MatchInfo, ptr %689, i64 %691
  %693 = getelementptr inbounds %struct.MatchInfo, ptr %692, i32 0, i32 4
  %694 = load i16, ptr %693, align 4
  %695 = zext i16 %694 to i32
  %696 = icmp sgt i32 %695, 0
  br i1 %696, label %697, label %739

697:                                              ; preds = %688
  %698 = getelementptr inbounds %struct._PixelOfNode, ptr %29, i32 0, i32 0
  %699 = getelementptr inbounds %struct.anon.7, ptr %698, i32 0, i32 0
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %71, ptr align 16 %699, i64 3, i1 false)
  call void @_Z14arrayToAddress6uchar3Rj(ptr noundef byval(%struct.uchar3) align 1 %71, ptr noundef nonnull align 4 dereferenceable(4) %70) #7
  %700 = load i32, ptr %70, align 4
  %701 = call %struct.uint4 @_Z7getNodejb(i32 noundef %700, i1 noundef zeroext true) #7
  %702 = getelementptr inbounds %struct.uint4, ptr %72, i32 0, i32 0
  %703 = extractvalue %struct.uint4 %701, 0
  store i32 %703, ptr %702, align 16
  %704 = getelementptr inbounds %struct.uint4, ptr %72, i32 0, i32 1
  %705 = extractvalue %struct.uint4 %701, 1
  store i32 %705, ptr %704, align 4
  %706 = getelementptr inbounds %struct.uint4, ptr %72, i32 0, i32 2
  %707 = extractvalue %struct.uint4 %701, 2
  store i32 %707, ptr %706, align 8
  %708 = getelementptr inbounds %struct.uint4, ptr %72, i32 0, i32 3
  %709 = extractvalue %struct.uint4 %701, 3
  store i32 %709, ptr %708, align 4
  %710 = getelementptr inbounds %struct._PixelOfNode, ptr %29, i32 0, i32 0
  call void @llvm.memcpy.p0.p0.i64(ptr align 16 %710, ptr align 16 %72, i64 16, i1 false)
  %711 = getelementptr inbounds %struct._PixelOfNode, ptr %29, i32 0, i32 0
  %712 = getelementptr inbounds %struct.anon.7, ptr %711, i32 0, i32 4
  %713 = getelementptr inbounds %struct.uchar3, ptr %712, i32 0, i32 0
  %714 = load i8, ptr %713, align 4
  %715 = zext i8 %714 to i32
  %716 = getelementptr inbounds %struct._PixelOfNode, ptr %29, i32 0, i32 0
  %717 = getelementptr inbounds %struct.anon.7, ptr %716, i32 0, i32 4
  %718 = getelementptr inbounds %struct.uchar3, ptr %717, i32 0, i32 1
  %719 = load i8, ptr %718, align 1
  %720 = zext i8 %719 to i32
  %721 = shl i32 %720, 8
  %722 = or i32 %715, %721
  %723 = getelementptr inbounds %struct._PixelOfNode, ptr %29, i32 0, i32 0
  %724 = getelementptr inbounds %struct.anon.7, ptr %723, i32 0, i32 4
  %725 = getelementptr inbounds %struct.uchar3, ptr %724, i32 0, i32 2
  %726 = load i8, ptr %725, align 2
  %727 = zext i8 %726 to i32
  %728 = shl i32 %727, 16
  %729 = or i32 %722, %728
  %730 = sub nsw i32 %729, 1
  %731 = load ptr, ptr %12, align 8
  %732 = load i32, ptr %23, align 4
  %733 = sext i32 %732 to i64
  %734 = getelementptr inbounds %struct.MatchInfo, ptr %731, i64 %733
  %735 = getelementptr inbounds %struct.MatchInfo, ptr %734, i32 0, i32 4
  %736 = load i16, ptr %735, align 4
  %737 = zext i16 %736 to i32
  %738 = add nsw i32 %730, %737
  store i32 %738, ptr %37, align 4
  br label %739

739:                                              ; preds = %697, %688
  br label %740

740:                                              ; preds = %739, %653
  br label %742

741:                                              ; preds = %647
  store i32 1, ptr %38, align 4
  br label %742

742:                                              ; preds = %741, %740
  br label %746

743:                                              ; preds = %644
  %744 = load i32, ptr %38, align 4
  %745 = add nsw i32 %744, 1
  store i32 %745, ptr %38, align 4
  br label %746

746:                                              ; preds = %743, %742
  store i8 65, ptr %34, align 1
  br label %747

747:                                              ; preds = %746, %641
  br label %748

748:                                              ; preds = %747, %469
  br label %268, !llvm.loop !18

749:                                              ; preds = %81, %268
  ret void
}

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #5

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.nvvm.read.ptx.sreg.ntid.x() #5

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.nvvm.read.ptx.sreg.tid.x() #5

; Function Attrs: convergent mustprogress noinline nounwind optnone
define internal void @_ZN12_GLOBAL__N_110__cuda_tex11__tex_fetchINS0_5__TagILi54EEE5uint47textureIS4_Li2EL19cudaTextureReadMode0EEJffEEEvPT0_T1_DpT2_(ptr noundef %0, i64 %1, float noundef %2, float noundef %3) #0 {
  %5 = alloca ptr, align 8
  %6 = alloca i64, align 4
  %7 = alloca float, align 4
  %8 = alloca float, align 4
  %9 = alloca %struct.uint4, align 16
  %10 = alloca %struct.uint4, align 16
  %11 = alloca i64, align 4
  store ptr %0, ptr %5, align 8
  store i64 %1, ptr %6, align 4
  store float %2, ptr %7, align 4
  store float %3, ptr %8, align 4
  %12 = load i64, ptr %6, align 4
  store i64 %12, ptr %11, align 4
  %13 = load i64, ptr %11, align 4
  %14 = call noundef i64 @_ZN12_GLOBAL__N_110__cuda_tex19__tex_handle_to_objI7textureI5uint4Li2EL19cudaTextureReadMode0EEEEyT_(i64 %13) #7
  %15 = load float, ptr %7, align 4
  %16 = load float, ptr %8, align 4
  %17 = call %struct.uint4 @_ZN12_GLOBAL__N_110__cuda_tex14__tex_fetch_v4INS0_5__TagILi54EEEE5__runI5uint4EET_yff(i64 noundef %14, float noundef %15, float noundef %16) #7
  %18 = getelementptr inbounds %struct.uint4, ptr %10, i32 0, i32 0
  %19 = extractvalue %struct.uint4 %17, 0
  store i32 %19, ptr %18, align 16
  %20 = getelementptr inbounds %struct.uint4, ptr %10, i32 0, i32 1
  %21 = extractvalue %struct.uint4 %17, 1
  store i32 %21, ptr %20, align 4
  %22 = getelementptr inbounds %struct.uint4, ptr %10, i32 0, i32 2
  %23 = extractvalue %struct.uint4 %17, 2
  store i32 %23, ptr %22, align 8
  %24 = getelementptr inbounds %struct.uint4, ptr %10, i32 0, i32 3
  %25 = extractvalue %struct.uint4 %17, 3
  store i32 %25, ptr %24, align 4
  %26 = call %struct.uint4 @_ZN12_GLOBAL__N_110__cuda_tex9__convertI5uint4S2_E5__runILi4EEES2_S2_(ptr noundef byval(%struct.uint4) align 16 %10) #7
  %27 = getelementptr inbounds %struct.uint4, ptr %9, i32 0, i32 0
  %28 = extractvalue %struct.uint4 %26, 0
  store i32 %28, ptr %27, align 16
  %29 = getelementptr inbounds %struct.uint4, ptr %9, i32 0, i32 1
  %30 = extractvalue %struct.uint4 %26, 1
  store i32 %30, ptr %29, align 4
  %31 = getelementptr inbounds %struct.uint4, ptr %9, i32 0, i32 2
  %32 = extractvalue %struct.uint4 %26, 2
  store i32 %32, ptr %31, align 8
  %33 = getelementptr inbounds %struct.uint4, ptr %9, i32 0, i32 3
  %34 = extractvalue %struct.uint4 %26, 3
  store i32 %34, ptr %33, align 4
  %35 = load ptr, ptr %5, align 8
  call void @llvm.memcpy.p0.p0.i64(ptr align 16 %35, ptr align 16 %9, i64 16, i1 false)
  ret void
}

; Function Attrs: convergent mustprogress noinline nounwind optnone
define internal %struct.uint4 @_ZN12_GLOBAL__N_110__cuda_tex9__convertI5uint4S2_E5__runILi4EEES2_S2_(ptr noundef byval(%struct.uint4) align 16 %0) #0 align 2 {
  %2 = alloca %struct.uint4, align 16
  %3 = getelementptr inbounds %struct.uint4, ptr %2, i32 0, i32 0
  %4 = getelementptr inbounds %struct.uint4, ptr %0, i32 0, i32 0
  %5 = load i32, ptr %4, align 16
  store i32 %5, ptr %3, align 16
  %6 = getelementptr inbounds %struct.uint4, ptr %2, i32 0, i32 1
  %7 = getelementptr inbounds %struct.uint4, ptr %0, i32 0, i32 1
  %8 = load i32, ptr %7, align 4
  store i32 %8, ptr %6, align 4
  %9 = getelementptr inbounds %struct.uint4, ptr %2, i32 0, i32 2
  %10 = getelementptr inbounds %struct.uint4, ptr %0, i32 0, i32 2
  %11 = load i32, ptr %10, align 8
  store i32 %11, ptr %9, align 8
  %12 = getelementptr inbounds %struct.uint4, ptr %2, i32 0, i32 3
  %13 = getelementptr inbounds %struct.uint4, ptr %0, i32 0, i32 3
  %14 = load i32, ptr %13, align 4
  store i32 %14, ptr %12, align 4
  %15 = load %struct.uint4, ptr %2, align 16
  ret %struct.uint4 %15
}

; Function Attrs: convergent mustprogress noinline nounwind optnone
define internal %struct.uint4 @_ZN12_GLOBAL__N_110__cuda_tex14__tex_fetch_v4INS0_5__TagILi54EEEE5__runI5uint4EET_yff(i64 noundef %0, float noundef %1, float noundef %2) #0 align 2 {
  %4 = alloca %struct.uint4, align 16
  %5 = alloca i64, align 8
  %6 = alloca float, align 4
  %7 = alloca float, align 4
  store i64 %0, ptr %5, align 8
  store float %1, ptr %6, align 4
  store float %2, ptr %7, align 4
  %8 = getelementptr inbounds %struct.uint4, ptr %4, i32 0, i32 0
  %9 = getelementptr inbounds %struct.uint4, ptr %4, i32 0, i32 1
  %10 = getelementptr inbounds %struct.uint4, ptr %4, i32 0, i32 2
  %11 = getelementptr inbounds %struct.uint4, ptr %4, i32 0, i32 3
  %12 = load i64, ptr %5, align 8
  %13 = load float, ptr %6, align 4
  %14 = load float, ptr %7, align 4
  %15 = call { i32, i32, i32, i32 } asm "tex.2d.v4.u32.f32\09{$0, $1, $2, $3}, [$4, {$5, $6}];", "=r,=r,=r,=r,l,f,f"(i64 %12, float %13, float %14) #8, !srcloc !19
  %16 = extractvalue { i32, i32, i32, i32 } %15, 0
  %17 = extractvalue { i32, i32, i32, i32 } %15, 1
  %18 = extractvalue { i32, i32, i32, i32 } %15, 2
  %19 = extractvalue { i32, i32, i32, i32 } %15, 3
  store i32 %16, ptr %8, align 16
  store i32 %17, ptr %9, align 4
  store i32 %18, ptr %10, align 8
  store i32 %19, ptr %11, align 4
  %20 = load %struct.uint4, ptr %4, align 16
  ret %struct.uint4 %20
}

; Function Attrs: convergent mustprogress noinline nounwind optnone
define internal noundef i64 @_ZN12_GLOBAL__N_110__cuda_tex19__tex_handle_to_objI7textureI5uint4Li2EL19cudaTextureReadMode0EEEEyT_(i64 %0) #0 {
  %2 = alloca i64, align 4
  %3 = alloca i64, align 8
  store i64 %0, ptr %2, align 4
  %4 = load i64, ptr %2, align 4
  %5 = call i64 asm "mov.b64 $0, $1; ", "=l,l"(i64 %4) #8, !srcloc !20
  store i64 %5, ptr %3, align 8
  %6 = load i64, ptr %3, align 8
  ret i64 %6
}

; Function Attrs: alwaysinline convergent nounwind
define internal i32 @__nv_min(i32 %0, i32 %1) #6 {
  %3 = icmp sle i32 %0, %1
  %4 = select i1 %3, i32 %0, i32 %1
  ret i32 %4
}

; Function Attrs: alwaysinline convergent nounwind
define internal i32 @__nv_max(i32 %0, i32 %1) #6 {
  %3 = icmp sge i32 %0, %1
  %4 = select i1 %3, i32 %0, i32 %1
  ret i32 %4
}

; Function Attrs: alwaysinline convergent nounwind
define internal i32 @__nv_umul24(i32 %0, i32 %1) #6 {
  %3 = shl i32 %0, 8
  %4 = lshr i32 %3, 8
  %5 = shl i32 %1, 8
  %6 = lshr i32 %5, 8
  %7 = mul i32 %4, %6
  ret i32 %7
}

attributes #0 = { convergent mustprogress noinline nounwind optnone "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="sm_35" "target-features"="+ptx75,+sm_35" }
attributes #1 = { alwaysinline convergent mustprogress nounwind "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="sm_35" "target-features"="+ptx75,+sm_35" }
attributes #2 = { nounwind readnone }
attributes #3 = { argmemonly nocallback nofree nounwind willreturn }
attributes #4 = { convergent mustprogress noinline norecurse nounwind optnone "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="sm_35" "target-features"="+ptx75,+sm_35" }
attributes #5 = { nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #6 = { alwaysinline convergent nounwind "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #7 = { convergent nounwind }
attributes #8 = { convergent nounwind readnone }

!llvm.module.flags = !{!0, !1, !2, !3}
!nvvm.annotations = !{!4, !5, !6, !7, !8, !9, !10}
!llvm.ident = !{!11, !12}

!0 = !{i32 2, !"SDK Version", [2 x i32] [i32 11, i32 5]}
!1 = !{i32 1, !"wchar_size", i32 4}
!2 = !{i32 4, !"nvvm-reflect-ftz", i32 0}
!3 = !{i32 7, !"frame-pointer", i32 2}
!4 = !{ptr addrspace(1) @nodetex, !"texture", i32 1}
!5 = !{ptr addrspace(1) @childrentex, !"texture", i32 1}
!6 = !{ptr addrspace(1) @reftex, !"texture", i32 1}
!7 = !{ptr addrspace(1) @qrytex, !"texture", i32 1}
!8 = !{ptr @_Z15mummergpuKernelPvPcS0_PKiS2_ii, !"kernel", i32 1}
!9 = !{ptr @_Z17mummergpuRCKernelP10MatchCoordPcPKiS3_ii, !"kernel", i32 1}
!10 = !{ptr @_Z11printKernelP9MatchInfoiP9AlignmentPcPKiS5_iiiii, !"kernel", i32 1}
!11 = !{!"clang version 16.0.0 (https://github.com/llvm/llvm-project 809855b56f06dd7182685f88fbbc64111df9339a)"}
!12 = !{!"clang version 3.8.0 (tags/RELEASE_380/final)"}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.mustprogress"}
!15 = distinct !{!15, !14}
!16 = distinct !{!16, !14}
!17 = distinct !{!17, !14}
!18 = distinct !{!18, !14}
!19 = !{i64 685421}
!20 = !{i64 738119}

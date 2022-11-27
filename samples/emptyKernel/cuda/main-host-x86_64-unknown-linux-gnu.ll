; ModuleID = 'main-host-x86_64-unknown-linux-gnu.bc'
source_filename = "main.cu"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.dim3 = type { i32, i32, i32 }
%struct.cudaDeviceProp = type { [256 x i8], %struct.CUuuid_st, [8 x i8], i32, i64, i64, i32, i32, i64, i32, [3 x i32], [3 x i32], i32, i64, i32, i32, i64, i64, i32, i32, i32, i32, i32, i32, i32, i32, i32, [2 x i32], [2 x i32], [3 x i32], [2 x i32], [3 x i32], [3 x i32], i32, [2 x i32], [3 x i32], [2 x i32], i32, [2 x i32], [3 x i32], [2 x i32], [3 x i32], i32, [2 x i32], i64, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i64, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i64, i32, i32, i32, i32, i64 }
%struct.CUuuid_st = type { [16 x i8] }

$_ZN4dim3C2Ejjj = comdat any

@.str = private unnamed_addr constant [13 x i8] c"Testing main\00", align 1
@.str.1 = private unnamed_addr constant [10 x i8] c"correct \0A\00", align 1
@0 = private unnamed_addr constant [11 x i8] c"_Z5emptyPi\00", align 1
@1 = private constant [2721 x i8] c"P\EDU\BA\01\00\10\00\90\0A\00\00\00\00\00\00\02\00\01\01@\00\00\00\C0\08\00\00\00\00\00\00\00\00\00\00\00\00\00\00\07\00\01\00#\00\00\00\00\00\00\00\00\00\00\00\11\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\7FELF\02\01\013\07\00\00\00\00\00\00\00\02\00\BE\00s\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\80\06\00\00\00\00\00\00#\05#\00@\00\00\00\00\00@\00\09\00\01\00\00.shstrtab\00.strtab\00.symtab\00.symtab_shndx\00.nv.info\00.text._Z5emptyPi\00.nv.info._Z5emptyPi\00.nv.shared._Z5emptyPi\00.nv.constant0._Z5emptyPi\00.nv.rel.action\00\00.shstrtab\00.strtab\00.symtab\00.symtab_shndx\00.nv.info\00_Z5emptyPi\00.text._Z5emptyPi\00.nv.info._Z5emptyPi\00.nv.shared._Z5emptyPi\00.nv.constant0._Z5emptyPi\00_param\00.nv.rel.action\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00=\00\00\00\03\00\08\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00x\00\00\00\03\00\07\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\98\00\00\00\03\00\06\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\002\00\00\00\12\10\08\00\00\00\00\00\00\00\00\00\00\02\00\00\00\00\00\00\04/\08\00\04\00\00\00\08\00\00\00\04#\08\00\04\00\00\00\00\00\00\00\04\12\08\00\04\00\00\00\08\00\00\00\04\11\08\00\04\00\00\00\08\00\00\00\047\04\00s\00\00\00\04\0A\08\00\02\00\00\00@\01\08\00\03\19\08\00\04\17\0C\00\00\00\00\00\00\00\00\00\00\F0!\00\03\1B\FF\00\04\1C\04\00\B8\01\00\00\00\00\00\00K\00\00\00\00\00\00\00\00\02\02\08\10\0A/\22\00\00\00\08\00\00\00\00\00\00\08\08\00\00\00\00\00\00\10\08\00\00\00\00\00\00\18\08\00\00\00\00\00\00 \08\00\00\00\00\00\00(\08\00\00\00\00\00\000\08\00\00\00\00\00\008\08\00\00\00\00\01\00\00\08\00\00\00\00\01\00\08\08\00\00\00\00\01\00\10\08\00\00\00\00\01\00\18\08\00\00\00\00\01\00 \08\00\00\00\00\01\00(\08\00\00\00\00\01\000\08\00\00\00\00\01\008\08\00\00\00\00\02\00\00\08\00\00\00\00\02\00\08\08\00\00\00\00\02\00\10\08\00\00\00\00\02\00\18\08\00\00\00\00\02\00 \08\00\00\00\00\02\00(\08\00\00\00\00\02\000\08\00\00\00\00\02\008\08\00\00\00\00\00\00\00\14,\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\BC\00\00\00\BC\BC\00\08\06\00\9C\08\00<\C0d\05\04\1C\FC\FF\FF\7F@\02\00\9C\1B\00\00@\86\1E\04\1C\00\00\1C`\DB<\00\00\04\00\00\00\12\00\03\80\00\00\00\00\00\02\04\9C\7F\00\00\80\E0\00\00\00\00\00\00\00\08\02(\1C\00\00\00\00\E6\0A\00\1C\00\00<\C0\E4\0E\00\9C\7F\00<\C0\E4\02\00\1C\01\00<\C0\E4\0A\00\9C\01\00<\C0\E4\02\00\1C\00\00<\C0\E4\0A\00\1C\01\00<\C0\E4\BC\00\00\00\00\BC\00\08\1A\00\9C\04\00<\C0d\1E\00\9C\7F\00<\C0\E4\1A\00\1C\03\00\10\00\E2\1E\08\9C\03\00\10\00\E2\0A\C0\1F\A0\00\00\00t\0A\08\1C\00\00\00\A8|\02\00\1C\01\00<\C0\E4\00\00\00\00\00\00\00\08\0E\00\9C\01\00<\C0\E4\0A\00\1C\00\00<\C0\E4\0E\00\9C\01\00<\C0\E4\0A\00\1C\01\00<\C0\E4\0E\00\9C\01\00<\C0\E4\0A\00\1C\01\00<\C0\E4\0E\00\9C\01\00<\C0\E4\00\00\00\00\00\00\00\08\0A\00\1C\01\00<\C0\E4\0E\00\9C\01\00<\C0\E4\12\18\9C\7F\00\00\84\E0\16\1C\9C\7F\00@\80\E0\12\00\1C\02\00<\C0\E4\16\00\9C\02\00<\C0\E4\12\00\1C\02\00<\C0\E4\00\00\00\00\00\00\00\08\16\00\9C\02\00<\C0\E4\08\10\1C\00\00\00\80\E5\12\18\9C\7F\00\00\84\E0\16\1C\9C\7F\00@\80\E0\12\00\1C\02\00<\C0\E4\16\00\9C\02\00<\C0\E4\12\00\1C\02\00<\C0\E4\00\00\00\00\00\00\BC\08\16\00\9C\02\00<\C0\E4\08\10\1C\00\00\00\80\C5\02\C0\1F\05\00\00\00t\0A\00\1C\01\00<\C0\E4\0E\00\9C\01\00<\C0\E4\00\08\1C\00\00\00\80\E4<\00\1C\00\00\00\00\18<\00\1C\FC\FF\7F\00\12\02<\1C\00\00\00\80\85\02<\1C\00\00\00\80\85\02<\1C\00\00\00\80\85\02<\1C\00\00\00\80\85\02<\1C\00\00\00\80\85\02<\1C\00\00\00\80\85\02<\1C\00\00\00\80\85\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\01\00\00\00\03\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00@\00\00\00\00\00\00\00\95\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\01\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\0B\00\00\00\03\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\D5\00\00\00\00\00\00\00\A7\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\01\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\13\00\00\00\02\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\80\01\00\00\00\00\00\00x\00\00\00\00\00\00\00\02\00\00\00\04\00\00\00\08\00\00\00\00\00\00\00\18\00\00\00\00\00\00\00)\00\00\00\00\00\00p\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\F8\01\00\00\00\00\00\000\00\00\00\00\00\00\00\03\00\00\00\00\00\00\00\04\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00C\00\00\00\00\00\00p\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00(\02\00\00\00\00\00\004\00\00\00\00\00\00\00\03\00\00\00\08\00\00\00\04\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\86\00\00\00\0B\00\00p\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00`\02\00\00\00\00\00\00\D8\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\08\00\00\00\00\00\00\00\08\00\00\00\00\00\00\00m\00\00\00\01\00\00\00\02\00\00\00\00\00\00\00\00\00\00\00\00\00\00\008\03\00\00\00\00\00\00H\01\00\00\00\00\00\00\00\00\00\00\08\00\00\00\04\00\00\00\00\00\00\00\00\00\00\00\00\00\00\002\00\00\00\01\00\00\00\06\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\80\04\00\00\00\00\00\00\00\02\00\00\00\00\00\00\03\00\00\00\04\00\00\08@\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\01\00\01\01H\00\00\00H\01\00\00\00\00\00\00E\01\00\00@\00\00\00\05\00\07\00#\00\00\00\00\00\00\00\00\00\00\00\11 \00\00\00\00\00\00\00\00\00\00\00\00\00\00\D2\01\00\00\00\00\00\00\00\00\00\00\00\00\00\00\F2 \0A\0A\0A\0A.version 7.5\0A.target sm_35\0A.address_size 64/\00\F7\16isible .entry _Z5emptyPi(\0A.param .u64\18\00\11_\16\00\F1\0E_0\0A)\0A{\0A.local .align 8 .b8 __\15\00\FB\0A_depot0[8];\0A.reg .b64 %SP\0F\00\15L\10\00\8932 %r<2>!\00\D3rd<5>;\0A\0Amov.u2\00\1B,d\00b;\0Acvta\8C\00\04%\00\13,\\\00\22ld\C7\00\02\18\00nrd1, [\CD\00\13]C\00tto.globG\00Ard2,5\00\03\1F\00\0A\1C\00\113\1C\00Q2;\0Ast\13\00q[%SP+0]\16\00\113z\00\03)\00$4,\1C\00\12;\C8\00\01\EA\00R1, 10=\00@32 [(\00\01<\00\C01;\0Aret;\0A\0A}\0A\00\00\00\00\00", section ".nv_fatbin", align 8
@__cuda_fatbin_wrapper = internal constant { i32, i32, ptr, ptr } { i32 1180844977, i32 1, ptr @1, ptr null }, section ".nvFatBinSegment", align 8
@__cuda_gpubin_handle = internal global ptr null, align 8
@llvm.global_ctors = appending global [1 x { i32, ptr, ptr }] [{ i32, ptr, ptr } { i32 65535, ptr @__cuda_module_ctor, ptr null }]

; Function Attrs: noinline norecurse optnone uwtable
define dso_local void @_Z20__device_stub__emptyPi(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca %struct.dim3, align 8
  %4 = alloca %struct.dim3, align 8
  %5 = alloca i64, align 8
  %6 = alloca ptr, align 8
  %7 = alloca { i64, i32 }, align 8
  %8 = alloca { i64, i32 }, align 8
  store ptr %0, ptr %2, align 8
  %9 = alloca ptr, i64 1, align 16
  %10 = getelementptr ptr, ptr %9, i32 0
  store ptr %2, ptr %10, align 8
  %11 = call i32 @__cudaPopCallConfiguration(ptr %3, ptr %4, ptr %5, ptr %6)
  %12 = load i64, ptr %5, align 8
  %13 = load ptr, ptr %6, align 8
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %7, ptr align 8 %3, i64 12, i1 false)
  %14 = getelementptr inbounds { i64, i32 }, ptr %7, i32 0, i32 0
  %15 = load i64, ptr %14, align 8
  %16 = getelementptr inbounds { i64, i32 }, ptr %7, i32 0, i32 1
  %17 = load i32, ptr %16, align 8
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %8, ptr align 8 %4, i64 12, i1 false)
  %18 = getelementptr inbounds { i64, i32 }, ptr %8, i32 0, i32 0
  %19 = load i64, ptr %18, align 8
  %20 = getelementptr inbounds { i64, i32 }, ptr %8, i32 0, i32 1
  %21 = load i32, ptr %20, align 8
  %22 = call noundef i32 @cudaLaunchKernel(ptr noundef @_Z20__device_stub__emptyPi, i64 %15, i32 %17, i64 %19, i32 %21, ptr noundef %9, i64 noundef %12, ptr noundef %13)
  br label %23

23:                                               ; preds = %1
  ret void
}

declare i32 @__cudaPopCallConfiguration(ptr, ptr, ptr, ptr)

declare i32 @cudaLaunchKernel(ptr, i64, i32, i64, i32, ptr, i64, ptr)

; Function Attrs: argmemonly nocallback nofree nounwind willreturn
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #1

; Function Attrs: mustprogress noinline norecurse optnone uwtable
define dso_local noundef i32 @main(i32 noundef %0, ptr noundef %1) #2 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca %struct.cudaDeviceProp, align 8
  %8 = alloca i32, align 4
  %9 = alloca ptr, align 8
  %10 = alloca ptr, align 8
  %11 = alloca i64, align 8
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca %struct.dim3, align 4
  %16 = alloca %struct.dim3, align 4
  %17 = alloca { i64, i32 }, align 4
  %18 = alloca { i64, i32 }, align 4
  store i32 0, ptr %3, align 4
  store i32 %0, ptr %4, align 4
  store ptr %1, ptr %5, align 8
  %19 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  %20 = call i32 @cudaGetDevice(ptr noundef %6)
  %21 = load i32, ptr %6, align 4
  %22 = call i32 @cudaGetDeviceProperties(ptr noundef %7, i32 noundef %21)
  store i32 1, ptr %8, align 4
  %23 = load i32, ptr %8, align 4
  %24 = sext i32 %23 to i64
  %25 = mul i64 %24, 4
  store i64 %25, ptr %11, align 8
  %26 = load i64, ptr %11, align 8
  %27 = call noalias ptr @malloc(i64 noundef %26) #9
  store ptr %27, ptr %9, align 8
  %28 = load i64, ptr %11, align 8
  %29 = call noundef i32 @_ZL10cudaMallocIiE9cudaErrorPPT_m(ptr noundef %10, i64 noundef %28)
  store i32 0, ptr %12, align 4
  br label %30

30:                                               ; preds = %39, %2
  %31 = load i32, ptr %12, align 4
  %32 = load i32, ptr %8, align 4
  %33 = icmp slt i32 %31, %32
  br i1 %33, label %34, label %42

34:                                               ; preds = %30
  %35 = load ptr, ptr %9, align 8
  %36 = load i32, ptr %12, align 4
  %37 = sext i32 %36 to i64
  %38 = getelementptr inbounds i32, ptr %35, i64 %37
  store i32 0, ptr %38, align 4
  br label %39

39:                                               ; preds = %34
  %40 = load i32, ptr %12, align 4
  %41 = add nsw i32 %40, 1
  store i32 %41, ptr %12, align 4
  br label %30, !llvm.loop !7

42:                                               ; preds = %30
  %43 = load ptr, ptr %10, align 8
  %44 = load ptr, ptr %9, align 8
  %45 = load i64, ptr %11, align 8
  %46 = call i32 @cudaMemcpy(ptr noundef %43, ptr noundef %44, i64 noundef %45, i32 noundef 1)
  store i32 1024, ptr %13, align 4
  %47 = load i32, ptr %8, align 4
  %48 = sitofp i32 %47 to float
  %49 = load i32, ptr %13, align 4
  %50 = sitofp i32 %49 to float
  %51 = fdiv float %48, %50
  %52 = fpext float %51 to double
  %53 = call double @llvm.ceil.f64(double %52)
  %54 = fptosi double %53 to i32
  store i32 %54, ptr %14, align 4
  %55 = load i32, ptr %14, align 4
  call void @_ZN4dim3C2Ejjj(ptr noundef nonnull align 4 dereferenceable(12) %15, i32 noundef %55, i32 noundef 1, i32 noundef 1)
  %56 = load i32, ptr %13, align 4
  call void @_ZN4dim3C2Ejjj(ptr noundef nonnull align 4 dereferenceable(12) %16, i32 noundef %56, i32 noundef 1, i32 noundef 1)
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %17, ptr align 4 %15, i64 12, i1 false)
  %57 = getelementptr inbounds { i64, i32 }, ptr %17, i32 0, i32 0
  %58 = load i64, ptr %57, align 4
  %59 = getelementptr inbounds { i64, i32 }, ptr %17, i32 0, i32 1
  %60 = load i32, ptr %59, align 4
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %18, ptr align 4 %16, i64 12, i1 false)
  %61 = getelementptr inbounds { i64, i32 }, ptr %18, i32 0, i32 0
  %62 = load i64, ptr %61, align 4
  %63 = getelementptr inbounds { i64, i32 }, ptr %18, i32 0, i32 1
  %64 = load i32, ptr %63, align 4
  %65 = call i32 @__cudaPushCallConfiguration(i64 %58, i32 %60, i64 %62, i32 %64, i64 noundef 0, ptr noundef null)
  %66 = icmp ne i32 %65, 0
  br i1 %66, label %69, label %67

67:                                               ; preds = %42
  %68 = load ptr, ptr %10, align 8
  call void @_Z20__device_stub__emptyPi(ptr noundef %68)
  br label %69

69:                                               ; preds = %67, %42
  %70 = load ptr, ptr %9, align 8
  %71 = load ptr, ptr %10, align 8
  %72 = load i64, ptr %11, align 8
  %73 = call i32 @cudaMemcpy(ptr noundef %70, ptr noundef %71, i64 noundef %72, i32 noundef 2)
  %74 = load ptr, ptr %9, align 8
  %75 = getelementptr inbounds i32, ptr %74, i64 0
  %76 = load i32, ptr %75, align 4
  %77 = icmp eq i32 %76, 10
  br i1 %77, label %78, label %80

78:                                               ; preds = %69
  %79 = call i32 (ptr, ...) @printf(ptr noundef @.str.1)
  br label %80

80:                                               ; preds = %78, %69
  %81 = load ptr, ptr %10, align 8
  %82 = call i32 @cudaFree(ptr noundef %81)
  %83 = load ptr, ptr %9, align 8
  call void @free(ptr noundef %83) #10
  ret i32 0
}

declare i32 @printf(ptr noundef, ...) #3

declare i32 @cudaGetDevice(ptr noundef) #3

declare i32 @cudaGetDeviceProperties(ptr noundef, i32 noundef) #3

; Function Attrs: nounwind allocsize(0)
declare noalias ptr @malloc(i64 noundef) #4

; Function Attrs: mustprogress noinline optnone uwtable
define internal noundef i32 @_ZL10cudaMallocIiE9cudaErrorPPT_m(ptr noundef %0, i64 noundef %1) #5 {
  %3 = alloca ptr, align 8
  %4 = alloca i64, align 8
  store ptr %0, ptr %3, align 8
  store i64 %1, ptr %4, align 8
  %5 = load ptr, ptr %3, align 8
  %6 = load i64, ptr %4, align 8
  %7 = call i32 @cudaMalloc(ptr noundef %5, i64 noundef %6)
  ret i32 %7
}

declare i32 @cudaMemcpy(ptr noundef, ptr noundef, i64 noundef, i32 noundef) #3

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.ceil.f64(double) #6

declare i32 @__cudaPushCallConfiguration(i64, i32, i64, i32, i64 noundef, ptr noundef) #3

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

declare i32 @cudaFree(ptr noundef) #3

; Function Attrs: nounwind
declare void @free(ptr noundef) #8

declare i32 @cudaMalloc(ptr noundef, i64 noundef) #3

define internal void @__cuda_register_globals(ptr %0) {
  %2 = call i32 @__cudaRegisterFunction(ptr %0, ptr @_Z20__device_stub__emptyPi, ptr @0, ptr @0, i32 -1, ptr null, ptr null, ptr null, ptr null, ptr null)
  ret void
}

declare i32 @__cudaRegisterFunction(ptr, ptr, ptr, ptr, i32, ptr, ptr, ptr, ptr, ptr)

declare void @__cudaRegisterVar(ptr, ptr, ptr, ptr, i32, i64, i32, i32)

declare void @__cudaRegisterManagedVar(ptr, ptr, ptr, ptr, i64, i32)

declare void @__cudaRegisterSurface(ptr, ptr, ptr, ptr, i32, i32)

declare void @__cudaRegisterTexture(ptr, ptr, ptr, ptr, i32, i32, i32)

declare ptr @__cudaRegisterFatBinary(ptr)

define internal void @__cuda_module_ctor() {
  %1 = call ptr @__cudaRegisterFatBinary(ptr @__cuda_fatbin_wrapper)
  store ptr %1, ptr @__cuda_gpubin_handle, align 8
  call void @__cuda_register_globals(ptr %1)
  call void @__cudaRegisterFatBinaryEnd(ptr %1)
  %2 = call i32 @atexit(ptr @__cuda_module_dtor)
  ret void
}

declare void @__cudaRegisterFatBinaryEnd(ptr)

declare void @__cudaUnregisterFatBinary(ptr)

define internal void @__cuda_module_dtor() {
  %1 = load ptr, ptr @__cuda_gpubin_handle, align 8
  call void @__cudaUnregisterFatBinary(ptr %1)
  ret void
}

declare i32 @atexit(ptr)

attributes #0 = { noinline norecurse optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { argmemonly nocallback nofree nounwind willreturn }
attributes #2 = { mustprogress noinline norecurse optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { mustprogress noinline optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #7 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #8 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #9 = { nounwind allocsize(0) }
attributes #10 = { nounwind }

!llvm.module.flags = !{!0, !1, !2, !3, !4, !5}
!llvm.ident = !{!6}

!0 = !{i32 2, !"SDK Version", [2 x i32] [i32 11, i32 5]}
!1 = !{i32 1, !"wchar_size", i32 4}
!2 = !{i32 8, !"PIC Level", i32 2}
!3 = !{i32 7, !"PIE Level", i32 2}
!4 = !{i32 7, !"uwtable", i32 2}
!5 = !{i32 7, !"frame-pointer", i32 2}
!6 = !{!"clang version 16.0.0 (https://github.com/llvm/llvm-project.git 159fb378f779ac79f7d456ea233892ad526b56d8)"}
!7 = distinct !{!7, !8}
!8 = !{!"llvm.loop.mustprogress"}

; ModuleID = 'empty-host-x86_64-unknown-linux-gnu.ll.translated_test.bc'
source_filename = "empty.cu"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.dim3 = type { i32, i32, i32 }

$_ZN4dim3C2Ejjj = comdat any

@.str = private unnamed_addr constant [10 x i8] c" Success \00", align 1
@0 = private unnamed_addr constant [11 x i8] c"_Z5emptyPi\00", align 1
@__cuda_fatbin_wrapper = internal constant { i32, i32, ptr, ptr } { i32 1212764230, i32 1, ptr @_cupbop_amdgpu_fatbin_wrapper, ptr null }, section ".hipFatBinSegment", align 8
@__cuda_gpubin_handle = internal global ptr null, align 8
@llvm.global_ctors = appending global [1 x { i32, ptr, ptr }] [{ i32, ptr, ptr } { i32 65535, ptr @__cuda_module_ctor, ptr null }]
@_cupbop_amdgpu_fatbin_wrapper = internal constant [7849 x i8] c"__CLANG_OFFLOAD_BUNDLE__\02\00\00\00\00\00\00\00\00\10\00\00\00\00\00\00\00\00\00\00\00\00\00\00\19\00\00\00\00\00\00\00host-x86_64-unknown-linux\00\10\00\00\00\00\00\00\A8\0E\00\00\00\00\00\00\1F\00\00\00\00\00\00\00hipv4-amdgcn-amd-amdhsa--gfx90a\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\7FELF\02\01\01@\02\00\00\00\00\00\00\00\03\00\E0\00\01\00\00\00\00\00\00\00\00\00\00\00@\00\00\00\00\00\00\00(\0B\00\00\00\00\00\00?\05\00\00@\008\00\08\00@\00\0E\00\0C\00\06\00\00\00\04\00\00\00@\00\00\00\00\00\00\00@\00\00\00\00\00\00\00@\00\00\00\00\00\00\00\C0\01\00\00\00\00\00\00\C0\01\00\00\00\00\00\00\08\00\00\00\00\00\00\00\01\00\00\00\04\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\05\00\00\00\00\00\00\00\05\00\00\00\00\00\00\00\10\00\00\00\00\00\00\01\00\00\00\05\00\00\00\00\05\00\00\00\00\00\00\00\15\00\00\00\00\00\00\00\15\00\00\00\00\00\00@\04\00\00\00\00\00\00@\04\00\00\00\00\00\00\00\10\00\00\00\00\00\00\01\00\00\00\06\00\00\00@\09\00\00\00\00\00\00@)\00\00\00\00\00\00@)\00\00\00\00\00\00p\00\00\00\00\00\00\00p\00\00\00\00\00\00\00\00\10\00\00\00\00\00\00\02\00\00\00\06\00\00\00@\09\00\00\00\00\00\00@)\00\00\00\00\00\00@)\00\00\00\00\00\00p\00\00\00\00\00\00\00p\00\00\00\00\00\00\00\08\00\00\00\00\00\00\00R\E5td\04\00\00\00@\09\00\00\00\00\00\00@)\00\00\00\00\00\00@)\00\00\00\00\00\00p\00\00\00\00\00\00\00\C0\06\00\00\00\00\00\00\01\00\00\00\00\00\00\00Q\E5td\06\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\04\00\00\00\04\00\00\00\00\02\00\00\00\00\00\00\00\02\00\00\00\00\00\00\00\02\00\00\00\00\00\00\F0\01\00\00\00\00\00\00\F0\01\00\00\00\00\00\00\04\00\00\00\00\00\00\00\07\00\00\00\DB\01\00\00 \00\00\00AMDGPU\00\00\83\AEamdhsa.kernels\91\DE\00\11\AB.agpr_count\00\A5.args\91\84\AE.address_space\A6global\A7.offset\00\A5.size\08\AB.value_kind\ADglobal_buffer\B9.group_segment_fixed_size\00\B6.kernarg_segment_align\08\B5.kernarg_segment_size\08\A9.language\A8OpenCL C\B1.language_version\92\02\00\B8.max_flat_workgroup_size\CD\04\00\A5.name\AA_Z5emptyPi\BB.private_segment_fixed_size\00\AB.sgpr_count\06\B1.sgpr_spill_count\00\A7.symbol\AD_Z5emptyPi.kd\B3.uses_dynamic_stack\C2\AB.vgpr_count\02\B1.vgpr_spill_count\00\AF.wavefront_size@\ADamdhsa.target\B9amdgcn-amd-amdhsa--gfx90a\AEamdhsa.version\92\01\01\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\01\00\00\00\12\03\07\00\00\15\00\00\00\00\00\00 \00\00\00\00\00\00\00\0C\00\00\00\11\03\06\00\C0\04\00\00\00\00\00\00@\00\00\00\00\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\1A\00\00\00\00\00\01\00\00\00\00I\01\00\00\00\FA-#\F8\F9\81zB\03\00\00\00\03\00\00\00\01\00\00\00\00\00\00\00\02\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00_Z5emptyPi\00_Z5emptyPi.kd\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\08\00\00\00\00\00\00\00@\10\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00@\00\AF\00\8C\00\00\00\09\00\00\00\00\00\00\00\02\00\06\C0\00\00\00\00\80\02\00~\8A\02\02~\7F\C0\8C\BF\00\80p\DC\00\01\00\00\00\00\81\BF\00\00\80\BF\00\00\80\BF\00\00\80\BF\00\00\80\BF\00\00\80\BF\00\00\80\BF\00\00\80\BF\00\00\80\BF\00\00\80\BF\00\00\80\BF\00\00\80\BF\00\00\80\BF\00\00\80\BF\00\00\80\BF\00\00\80\BF\00\00\80\BF\00\00\80\BF\00\00\80\BF\00\00\80\BF\00\00\80\BF\00\00\80\BF\00\00\80\BF\00\00\80\BF\00\00\80\BF\00\00\80\BF\00\00\80\BF\00\00\80\BF\00\00\80\BF\00\00\80\BF\00\00\80\BF\00\00\80\BF\00\00\80\BF\00\00\80\BF\00\00\80\BF\00\00\80\BF\00\00\80\BF\00\00\80\BF\00\00\80\BF\00\00\80\BF\00\00\80\BF\00\00\80\BF\00\00\80\BF\00\00\80\BF\00\00\80\BF\00\00\80\BF\00\00\80\BF\00\00\80\BF\00\00\80\BF\00\00\80\BF\00\00\80\BF\00\00\80\BF\00\00\80\BF\00\00\80\BF\00\00\80\BF\00\00\80\BF\00\00\80\BF\00\00\80\BF\00\00\80\BF\00\00\80\BF\00\00\80\BF\00\00\80\BF\00\00\80\BF\00\00\80\BF\00\00\80\BF\00\00\80\BF\00\00\80\BF\00\00\80\BF\00\00\80\BF\00\00\80\BF\00\00\80\BF\00\00\80\BF\00\00\80\BF\00\00\80\BF\00\00\80\BF\00\00\80\BF\00\00\80\BF\00\00\80\BF\00\00\80\BF\00\00\80\BF\00\00\80\BF\00\00\80\BF\00\00\80\BF\00\00\80\BF\00\00\80\BF\00\00\80\BF\00\00\80\BF\00\00\80\BF\00\00\80\BF\00\00\80\BF\00\00\80\BF\00\00\80\BF\00\00\80\BF\00\00\80\BF\00\00\80\BF\00\00\80\BF\00\00\80\BF\00\00\80\BF\00\00\80\BF\00\00\80\BF\00\00\80\BF\00\00\80\BF\00\00\80\BF\00\00\80\BF\00\00\80\BF\00\00\80\BF\00\00\80\BF\00\00\80\BF\00\00\80\BF\00\00\80\BF\00\00\80\BF\00\00\80\BF\00\00\80\BF\00\00\80\BF\00\00\80\BF\00\00\80\BF\00\00\80\BF\00\00\80\BF\00\00\80\BF\00\00\80\BF\00\00\80\BF\00\00\80\BF\00\00\80\BF\00\00\80\BF\00\00\80\BF\00\00\80\BF\00\00\80\BF\00\00\80\BF\00\00\80\BF\00\00\80\BF\00\00\80\BF\00\00\80\BF\00\00\80\BF\00\00\80\BF\00\00\80\BF\00\00\80\BF\00\00\80\BF\00\00\80\BF\00\00\80\BF\00\00\80\BF\00\00\80\BF\00\00\80\BF\00\00\80\BF\00\00\80\BF\00\00\80\BF\00\00\80\BF\00\00\80\BF\00\00\80\BF\00\00\80\BF\00\00\80\BF\00\00\80\BF\00\00\80\BF\00\00\80\BF\00\00\80\BF\00\00\80\BF\00\00\80\BF\00\00\80\BF\00\00\80\BF\00\00\80\BF\00\00\80\BF\00\00\80\BF\00\00\80\BF\00\00\80\BF\00\00\80\BF\00\00\80\BF\00\00\80\BF\00\00\80\BF\00\00\80\BF\00\00\80\BF\00\00\80\BF\00\00\80\BF\00\00\80\BF\00\00\80\BF\00\00\80\BF\00\00\80\BF\00\00\80\BF\00\00\80\BF\00\00\80\BF\00\00\80\BF\00\00\80\BF\00\00\80\BF\00\00\80\BF\00\00\80\BF\00\00\80\BF\00\00\80\BF\00\00\80\BF\00\00\80\BF\00\00\80\BF\00\00\80\BF\00\00\80\BF\00\00\80\BF\00\00\80\BF\00\00\80\BF\00\00\80\BF\00\00\80\BF\00\00\80\BF\00\00\80\BF\00\00\80\BF\00\00\80\BF\00\00\80\BF\00\00\80\BF\00\00\80\BF\00\00\80\BF\00\00\80\BF\00\00\80\BF\00\00\80\BF\00\00\80\BF\00\00\80\BF\00\00\80\BF\00\00\80\BF\00\00\80\BF\00\00\80\BF\00\00\80\BF\00\00\80\BF\00\00\80\BF\00\00\80\BF\00\00\80\BF\00\00\80\BF\00\00\80\BF\00\00\80\BF\00\00\80\BF\00\00\80\BF\00\00\80\BF\00\00\80\BF\00\00\80\BF\00\00\80\BF\00\00\80\BF\00\00\80\BF\00\00\80\BF\00\00\80\BF\00\00\80\BF\00\00\80\BF\00\00\80\BF\00\00\80\BF\00\00\80\BF\00\00\80\BF\00\00\80\BF\00\00\80\BF\00\00\80\BF\00\00\80\BF\00\00\80\BF\00\00\80\BF\00\00\80\BF\00\00\80\BF\00\00\80\BF\00\00\80\BF\00\00\80\BF\00\00\80\BF\00\00\80\BF\00\00\80\BF\00\00\80\BF\00\00\80\BF\00\00\80\BF\00\00\80\BF\00\00\80\BF\00\00\80\BF\00\00\80\BF\00\00\80\BF\00\00\80\BF\00\00\80\BF\00\00\80\BF\00\00\80\BF\00\00\80\BF\00\00\80\BF\00\00\80\BF\06\00\00\00\00\00\00\00\F0\03\00\00\00\00\00\00\0B\00\00\00\00\00\00\00\18\00\00\00\00\00\00\00\05\00\00\00\00\00\00\00|\04\00\00\00\00\00\00\0A\00\00\00\00\00\00\00\1A\00\00\00\00\00\00\00\F5\FE\FFo\00\00\00\008\04\00\00\00\00\00\00\04\00\00\00\00\00\00\00\\\04\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00clang version 16.0.0 (https://github.com/llvm/llvm-project.git 159fb378f779ac79f7d456ea233892ad526b56d8)\00\00Linker: LLD 16.0.0\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\1A\00\00\00\00\02\08\00@)\00\00\00\00\00\00\00\00\00\00\00\00\00\00\01\00\00\00\12\03\07\00\00\15\00\00\00\00\00\00 \00\00\00\00\00\00\00\0C\00\00\00\11\03\06\00\C0\04\00\00\00\00\00\00@\00\00\00\00\00\00\00\00.note\00.dynsym\00.gnu.hash\00.hash\00.dynstr\00.rodata\00.text\00.dynamic\00.AMDGPU.csdata\00.comment\00.symtab\00.shstrtab\00.strtab\00\00_Z5emptyPi\00_Z5emptyPi.kd\00_DYNAMIC\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\01\00\00\00\07\00\00\00\02\00\00\00\00\00\00\00\00\02\00\00\00\00\00\00\00\02\00\00\00\00\00\00\F0\01\00\00\00\00\00\00\00\00\00\00\00\00\00\00\04\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\07\00\00\00\0B\00\00\00\02\00\00\00\00\00\00\00\F0\03\00\00\00\00\00\00\F0\03\00\00\00\00\00\00H\00\00\00\00\00\00\00\05\00\00\00\01\00\00\00\08\00\00\00\00\00\00\00\18\00\00\00\00\00\00\00\0F\00\00\00\F6\FF\FFo\02\00\00\00\00\00\00\008\04\00\00\00\00\00\008\04\00\00\00\00\00\00$\00\00\00\00\00\00\00\02\00\00\00\00\00\00\00\08\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\19\00\00\00\05\00\00\00\02\00\00\00\00\00\00\00\\\04\00\00\00\00\00\00\\\04\00\00\00\00\00\00 \00\00\00\00\00\00\00\02\00\00\00\00\00\00\00\04\00\00\00\00\00\00\00\04\00\00\00\00\00\00\00\1F\00\00\00\03\00\00\00\02\00\00\00\00\00\00\00|\04\00\00\00\00\00\00|\04\00\00\00\00\00\00\1A\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\01\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00'\00\00\00\01\00\00\00\02\00\00\00\00\00\00\00\C0\04\00\00\00\00\00\00\C0\04\00\00\00\00\00\00@\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00@\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00/\00\00\00\01\00\00\00\06\00\00\00\00\00\00\00\00\15\00\00\00\00\00\00\00\05\00\00\00\00\00\00@\04\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\01\00\00\00\00\00\00\00\00\00\00\00\00\00\005\00\00\00\06\00\00\00\03\00\00\00\00\00\00\00@)\00\00\00\00\00\00@\09\00\00\00\00\00\00p\00\00\00\00\00\00\00\05\00\00\00\00\00\00\00\08\00\00\00\00\00\00\00\10\00\00\00\00\00\00\00>\00\00\00\01\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\B0\09\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\01\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00M\00\00\00\01\00\00\000\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\B0\09\00\00\00\00\00\00}\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\01\00\00\00\00\00\00\00\01\00\00\00\00\00\00\00V\00\00\00\02\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\000\0A\00\00\00\00\00\00`\00\00\00\00\00\00\00\0D\00\00\00\02\00\00\00\08\00\00\00\00\00\00\00\18\00\00\00\00\00\00\00^\00\00\00\03\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\90\0A\00\00\00\00\00\00p\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\01\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00h\00\00\00\03\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\0B\00\00\00\00\00\00#\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\01\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00", section ".hipFatBinSegment", align 4096

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
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca %struct.dim3, align 4
  %9 = alloca %struct.dim3, align 4
  %10 = alloca { i64, i32 }, align 4
  %11 = alloca { i64, i32 }, align 4
  store i32 0, ptr %3, align 4
  store i32 %0, ptr %4, align 4
  store ptr %1, ptr %5, align 8
  %12 = call noalias ptr @malloc(i64 noundef 4) #7
  store ptr %12, ptr %6, align 8
  %13 = call noundef i32 @_ZL10cudaMallocIiE9cudaErrorPPT_m(ptr noundef %7, i64 noundef 4)
  call void @_ZN4dim3C2Ejjj(ptr noundef nonnull align 4 dereferenceable(12) %8, i32 noundef 1, i32 noundef 1, i32 noundef 1)
  call void @_ZN4dim3C2Ejjj(ptr noundef nonnull align 4 dereferenceable(12) %9, i32 noundef 1, i32 noundef 1, i32 noundef 1)
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %10, ptr align 4 %8, i64 12, i1 false)
  %14 = getelementptr inbounds { i64, i32 }, ptr %10, i32 0, i32 0
  %15 = load i64, ptr %14, align 4
  %16 = getelementptr inbounds { i64, i32 }, ptr %10, i32 0, i32 1
  %17 = load i32, ptr %16, align 4
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %11, ptr align 4 %9, i64 12, i1 false)
  %18 = getelementptr inbounds { i64, i32 }, ptr %11, i32 0, i32 0
  %19 = load i64, ptr %18, align 4
  %20 = getelementptr inbounds { i64, i32 }, ptr %11, i32 0, i32 1
  %21 = load i32, ptr %20, align 4
  %22 = call i32 @__cudaPushCallConfiguration(i64 %15, i32 %17, i64 %19, i32 %21, i64 noundef 0, ptr noundef null)
  %23 = icmp ne i32 %22, 0
  br i1 %23, label %26, label %24

24:                                               ; preds = %2
  %25 = load ptr, ptr %7, align 8
  call void @_Z20__device_stub__emptyPi(ptr noundef %25)
  br label %26

26:                                               ; preds = %24, %2
  %27 = load ptr, ptr %6, align 8
  %28 = load ptr, ptr %7, align 8
  %29 = call i32 @cudaMemcpy(ptr noundef %27, ptr noundef %28, i64 noundef 4, i32 noundef 2)
  %30 = load ptr, ptr %6, align 8
  %31 = load i32, ptr %30, align 4
  %32 = icmp eq i32 %31, 10
  br i1 %32, label %33, label %35

33:                                               ; preds = %26
  %34 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  br label %35

35:                                               ; preds = %33, %26
  %36 = load ptr, ptr %7, align 8
  %37 = call i32 @cudaFree(ptr noundef %36)
  ret i32 0
}

; Function Attrs: nounwind allocsize(0)
declare noalias ptr @malloc(i64 noundef) #3

; Function Attrs: mustprogress noinline optnone uwtable
define internal noundef i32 @_ZL10cudaMallocIiE9cudaErrorPPT_m(ptr noundef %0, i64 noundef %1) #4 {
  %3 = alloca ptr, align 8
  %4 = alloca i64, align 8
  store ptr %0, ptr %3, align 8
  store i64 %1, ptr %4, align 8
  %5 = load ptr, ptr %3, align 8
  %6 = load i64, ptr %4, align 8
  %7 = call i32 @cudaMalloc(ptr noundef %5, i64 noundef %6)
  ret i32 %7
}

declare i32 @__cudaPushCallConfiguration(i64, i32, i64, i32, i64 noundef, ptr noundef) #5

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local void @_ZN4dim3C2Ejjj(ptr noundef nonnull align 4 dereferenceable(12) %0, i32 noundef %1, i32 noundef %2, i32 noundef %3) unnamed_addr #6 comdat align 2 {
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

declare i32 @cudaMemcpy(ptr noundef, ptr noundef, i64 noundef, i32 noundef) #5

declare i32 @printf(ptr noundef, ...) #5

declare i32 @cudaFree(ptr noundef) #5

declare i32 @cudaMalloc(ptr noundef, i64 noundef) #5

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
attributes #3 = { nounwind allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { mustprogress noinline optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nounwind allocsize(0) }

!llvm.module.flags = !{!0, !1, !2, !3, !4, !5}
!llvm.ident = !{!6}

!0 = !{i32 2, !"SDK Version", [2 x i32] [i32 11, i32 5]}
!1 = !{i32 1, !"wchar_size", i32 4}
!2 = !{i32 8, !"PIC Level", i32 2}
!3 = !{i32 7, !"PIE Level", i32 2}
!4 = !{i32 7, !"uwtable", i32 2}
!5 = !{i32 7, !"frame-pointer", i32 2}
!6 = !{!"clang version 16.0.0 (https://github.com/llvm/llvm-project.git 159fb378f779ac79f7d456ea233892ad526b56d8)"}

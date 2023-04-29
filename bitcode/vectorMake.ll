; Bitcode implementations of AMD GPU Texture
source_filename = "llvm-link"
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

@__oclc_wavefrontsize64 = internal local_unnamed_addr addrspace(4) constant i8 1, align 1
@__oclc_ISA_version = internal local_unnamed_addr addrspace(4) constant i32 9010, align 4
@__oclc_ABI_version = internal local_unnamed_addr addrspace(4) constant i32 400, align 4

; Function Attrs: convergent inlinehint mustprogress nounwind
define linkonce_odr [2 x i32] @_ZL9make_int2ii(i32 noundef %0, i32 noundef %1) #8 {
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

; Function Attrs: convergent inlinehint mustprogress nounwind
define linkonce_odr i32 @_ZL11make_uchar3hhh(i8 noundef zeroext %0, i8 noundef zeroext %1, i8 noundef zeroext %2) #8 {
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



; Function Attrs: alwaysinline convergent mustprogress nounwind
define linkonce_odr %struct.HIP_vector_type.3 @_ZL5tex2DI15HIP_vector_typeIjLj4EEL18hipTextureReadMode0EEN13__hip_tex_retIT_XT0_EbE4typeE7textureIS4_Li2EXT0_EEff(%struct.textureReference %0, float noundef %1, float noundef %2) #7 {
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


; Function Attrs: argmemonly nocallback nofree nounwind willreturn
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #4

; Function Attrs: argmemonly nocallback nofree nounwind willreturn
declare void @llvm.memcpy.p0.p4.i64(ptr noalias nocapture writeonly, ptr addrspace(4) noalias nocapture readonly, i64, i1 immarg) #4

; Function Attrs: argmemonly nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p5(i64 immarg, ptr addrspace(5) nocapture) #3

; Function Attrs: argmemonly nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p5(i64 immarg, ptr addrspace(5) nocapture) #3


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

!12 = !{!6, !6, i64 0}

!20 = !{!21, !21, i64 0}
!21 = !{!"float", !6, i64 0}

!22 = !{!23, !5, i64 72}
!23 = !{!"_ZTS16textureReference", !9, i64 0, !24, i64 4, !25, i64 8, !6, i64 12, !26, i64 24, !9, i64 44, !9, i64 48, !25, i64 52, !21, i64 56, !21, i64 60, !21, i64 64, !5, i64 72, !9, i64 80, !28, i64 84}
!24 = !{!"_ZTS18hipTextureReadMode", !6, i64 0}
!25 = !{!"_ZTS20hipTextureFilterMode", !6, i64 0}
!26 = !{!"_ZTS20hipChannelFormatDesc", !9, i64 0, !9, i64 4, !9, i64 8, !9, i64 12, !27, i64 16}
!27 = !{!"_ZTS20hipChannelFormatKind", !6, i64 0}
!28 = !{!"_ZTS15hipArray_Format", !6, i64 0}

!45 = !{!46, !46, i64 0}
!46 = !{!"int", !47, i64 0}
!47 = !{!"omnipotent char", !48, i64 0}
!48 = !{!"Simple C/C++ TBAA"}
!49 = !{!47, !47, i64 0}

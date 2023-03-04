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

%struct.HIP_vector_type = type { %struct.HIP_vector_base }
%struct.HIP_vector_base = type { %union.anon }
%union.anon = type { <4 x float> }
%union.anon.5 = type { <4 x float> }

$_Z7mapFromI15HIP_vector_typeIfLj4EEDv4_fENSt9enable_ifIXooooooeqstT_stNS4_10value_typeEsr3std7is_sameIS5_iEE5valuesr3std7is_sameIS5_jEE5valuesr3std7is_sameIS5_fEE5valueEKS4_E4typeERKT0_ = comdat any

$_ZN15HIP_vector_typeIfLj4EEaSERKS0_ = comdat any

$_ZN15HIP_vector_baseIfLj4EEaSERKS0_ = comdat any

@__oclc_wavefrontsize64 = internal local_unnamed_addr addrspace(4) constant i8 1, align 1
@__oclc_ABI_version = internal local_unnamed_addr addrspace(4) constant i32 400, align 4

; Function Attrs: alwaysinline convergent mustprogress nounwind
define linkonce_odr %struct.HIP_vector_type @_ZL10tex1DfetchI15HIP_vector_typeIfLj4EEL18hipTextureReadMode0EEN13__hip_tex_retIT_XT0_EbE4typeE7textureIS4_Li1EXT0_EEi(%struct.textureReference %0, i32 noundef %1) #7 {
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
  store i32 %1, ptr %12, align 4, !tbaa !9
  call void @llvm.lifetime.start.p5(i64 8, ptr addrspace(5) %6) #22
  %45 = getelementptr inbounds %struct.textureReference, ptr %11, i32 0, i32 11
  %46 = load ptr, ptr %45, align 8, !tbaa !20
  %47 = addrspacecast ptr %46 to ptr addrspace(4)
  store ptr addrspace(4) %47, ptr %13, align 8, !tbaa !5
  call void @llvm.lifetime.start.p5(i64 8, ptr addrspace(5) %7) #22
  %48 = load ptr addrspace(4), ptr %13, align 8, !tbaa !5
  %49 = getelementptr inbounds i32, ptr addrspace(4) %48, i64 12
  store ptr addrspace(4) %49, ptr %14, align 8, !tbaa !5
  call void @llvm.lifetime.start.p5(i64 16, ptr addrspace(5) %8) #22
  %50 = load ptr addrspace(4), ptr %13, align 8, !tbaa !5
  %51 = load i32, ptr %12, align 4, !tbaa !9
  %52 = call contract <4 x float> @__ockl_image_load_1Db(ptr addrspace(4) noundef %50, i32 noundef %51) #26
  store <4 x float> %52, ptr %15, align 16, !tbaa !13
  %53 = call %struct.HIP_vector_type @_Z7mapFromI15HIP_vector_typeIfLj4EEDv4_fENSt9enable_ifIXooooooeqstT_stNS4_10value_typeEsr3std7is_sameIS5_iEE5valuesr3std7is_sameIS5_jEE5valuesr3std7is_sameIS5_fEE5valueEKS4_E4typeERKT0_(ptr noundef nonnull align 16 dereferenceable(16) %15) #26
  %54 = getelementptr inbounds %struct.HIP_vector_type, ptr %10, i32 0, i32 0
  %55 = extractvalue %struct.HIP_vector_type %53, 0
  store %struct.HIP_vector_base %55, ptr %54, align 16
  call void @llvm.lifetime.end.p5(i64 16, ptr addrspace(5) %8) #22
  call void @llvm.lifetime.end.p5(i64 8, ptr addrspace(5) %7) #22
  call void @llvm.lifetime.end.p5(i64 8, ptr addrspace(5) %6) #22
  %56 = load %struct.HIP_vector_type, ptr %10, align 16
  ret %struct.HIP_vector_type %56
}

; Function Attrs: argmemonly nocallback nofree nounwind willreturn
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: convergent nounwind
define linkonce_odr hidden noundef nonnull align 16 dereferenceable(16) ptr @_ZN15HIP_vector_typeIfLj4EEaSERKS0_(ptr noundef nonnull align 16 dereferenceable(16) %0, ptr noundef nonnull align 16 dereferenceable(16) %1) #8 comdat align 2 {
  %3 = alloca ptr, align 8, addrspace(5)
  %4 = alloca ptr, align 8, addrspace(5)
  %5 = alloca ptr, align 8, addrspace(5)
  %6 = addrspacecast ptr addrspace(5) %3 to ptr
  %7 = addrspacecast ptr addrspace(5) %4 to ptr
  %8 = addrspacecast ptr addrspace(5) %5 to ptr
  store ptr %0, ptr %7, align 8, !tbaa !5
  store ptr %1, ptr %8, align 8, !tbaa !5
  %9 = load ptr, ptr %7, align 8
  %10 = load ptr, ptr %8, align 8, !tbaa !5
  %11 = call noundef nonnull align 16 dereferenceable(16) ptr @_ZN15HIP_vector_baseIfLj4EEaSERKS0_(ptr noundef nonnull align 16 dereferenceable(16) %9, ptr noundef nonnull align 16 dereferenceable(16) %10) #26
  ret ptr %9
}

; Function Attrs: convergent mustprogress nounwind
define linkonce_odr hidden noundef nonnull align 16 dereferenceable(16) ptr @_ZN15HIP_vector_baseIfLj4EEaSERKS0_(ptr noundef nonnull align 16 dereferenceable(16) %0, ptr noundef nonnull align 16 dereferenceable(16) %1) #6 comdat align 2 {
  %3 = alloca ptr, align 8, addrspace(5)
  %4 = alloca ptr, align 8, addrspace(5)
  %5 = alloca ptr, align 8, addrspace(5)
  %6 = addrspacecast ptr addrspace(5) %3 to ptr
  %7 = addrspacecast ptr addrspace(5) %4 to ptr
  %8 = addrspacecast ptr addrspace(5) %5 to ptr
  store ptr %0, ptr %7, align 8, !tbaa !5
  store ptr %1, ptr %8, align 8, !tbaa !5
  %9 = load ptr, ptr %7, align 8
  %10 = load ptr, ptr %8, align 8, !tbaa !5
  %11 = getelementptr inbounds %struct.HIP_vector_base, ptr %10, i32 0, i32 0
  %12 = load <4 x float>, ptr %11, align 16, !tbaa !13
  %13 = getelementptr inbounds %struct.HIP_vector_base, ptr %9, i32 0, i32 0
  store <4 x float> %12, ptr %13, align 16, !tbaa !13
  ret ptr %9
}

; Function Attrs: alwaysinline convergent mustprogress nounwind
define linkonce_odr hidden %struct.HIP_vector_type @_Z7mapFromI15HIP_vector_typeIfLj4EEDv4_fENSt9enable_ifIXooooooeqstT_stNS4_10value_typeEsr3std7is_sameIS5_iEE5valuesr3std7is_sameIS5_jEE5valuesr3std7is_sameIS5_fEE5valueEKS4_E4typeERKT0_(ptr noundef nonnull align 16 dereferenceable(16) %0) #9 comdat {
  %2 = alloca %struct.HIP_vector_type, align 16, addrspace(5)
  %3 = alloca ptr, align 8, addrspace(5)
  %4 = alloca %union.anon.5, align 16, addrspace(5)
  %5 = alloca i32, align 4, addrspace(5)
  %6 = addrspacecast ptr addrspace(5) %2 to ptr
  %7 = addrspacecast ptr addrspace(5) %3 to ptr
  %8 = addrspacecast ptr addrspace(5) %4 to ptr
  store ptr %0, ptr %7, align 8, !tbaa !5
  call void @llvm.lifetime.start.p5(i64 16, ptr addrspace(5) %4) #22
  %9 = load ptr, ptr %7, align 8, !tbaa !5
  %10 = load <4 x float>, ptr %9, align 16, !tbaa !13
  store <4 x float> %10, ptr %8, align 16, !tbaa !13
  call void @llvm.memcpy.p0.p0.i64(ptr align 16 %6, ptr align 16 %8, i64 16, i1 false)
  call void @llvm.lifetime.end.p5(i64 16, ptr addrspace(5) %4) #22
  %11 = load %struct.HIP_vector_type, ptr %6, align 16
  ret %struct.HIP_vector_type %11
}

; Function Attrs: convergent mustprogress nofree norecurse nounwind readonly willreturn
define internal <4 x float> @__ockl_image_load_1Db(ptr addrspace(4) nocapture noundef readonly %0, i32 noundef %1) #12 {
  %3 = load <4 x i32>, ptr addrspace(4) %0, align 16, !tbaa !29
  %4 = tail call <4 x float> @llvm.amdgcn.struct.buffer.load.format.v4f32(<4 x i32> noundef %3, i32 noundef %1, i32 noundef 0, i32 noundef 0, i32 noundef 0) #27
  ret <4 x float> %4
}

; Function Attrs: nounwind readonly willreturn
declare <4 x float> @llvm.amdgcn.struct.buffer.load.format.v4f32(<4 x i32>, i32, i32, i32, i32 immarg) #13


; Function Attrs: argmemonly nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p5(i64 immarg, ptr addrspace(5) nocapture) #1

; Function Attrs: argmemonly nocallback nofree nounwind willreturn
declare void @llvm.memcpy.p0.p4.i64(ptr noalias nocapture writeonly, ptr addrspace(4) noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: argmemonly nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p5(i64 immarg, ptr addrspace(5) nocapture) #1

attributes #0 = { convergent mustprogress noinline nounwind "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx90a" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot3-insts,+dot4-insts,+dot5-insts,+dot6-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+gfx90a-insts,+mai-insts,+s-memrealtime,+s-memtime-inst" }
attributes #1 = { argmemonly nocallback nofree nosync nounwind willreturn }
attributes #2 = { argmemonly nocallback nofree nounwind willreturn }
attributes #3 = { cold noreturn nounwind }
attributes #4 = { convergent mustprogress norecurse nounwind "amdgpu-flat-work-group-size"="1,1024" "frame-pointer"="none" "min-legal-vector-width"="128" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx90a" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot3-insts,+dot4-insts,+dot5-insts,+dot6-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+gfx90a-insts,+mai-insts,+s-memrealtime,+s-memtime-inst" "uniform-work-group-size"="true" }
attributes #5 = { convergent inlinehint mustprogress nounwind "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx90a" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot3-insts,+dot4-insts,+dot5-insts,+dot6-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+gfx90a-insts,+mai-insts,+s-memrealtime,+s-memtime-inst" }
attributes #6 = { convergent mustprogress nounwind "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx90a" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot3-insts,+dot4-insts,+dot5-insts,+dot6-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+gfx90a-insts,+mai-insts,+s-memrealtime,+s-memtime-inst" }
attributes #7 = { alwaysinline convergent mustprogress nounwind "frame-pointer"="none" "min-legal-vector-width"="128" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx90a" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot3-insts,+dot4-insts,+dot5-insts,+dot6-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+gfx90a-insts,+mai-insts,+s-memrealtime,+s-memtime-inst" }
attributes #8 = { convergent nounwind "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx90a" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot3-insts,+dot4-insts,+dot5-insts,+dot6-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+gfx90a-insts,+mai-insts,+s-memrealtime,+s-memtime-inst" }
attributes #9 = { alwaysinline convergent mustprogress nounwind "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx90a" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot3-insts,+dot4-insts,+dot5-insts,+dot6-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+gfx90a-insts,+mai-insts,+s-memrealtime,+s-memtime-inst" }
attributes #10 = { convergent mustprogress nofree norecurse nosync nounwind readnone willreturn "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" }
attributes #11 = { nounwind readnone speculatable willreturn }
attributes #12 = { convergent mustprogress nofree norecurse nounwind readonly willreturn "frame-pointer"="none" "min-legal-vector-width"="128" "no-trapping-math"="true" "stack-protector-buffer-size"="8" }
attributes #13 = { nounwind readonly willreturn }
attributes #14 = { convergent norecurse nounwind "frame-pointer"="none" "min-legal-vector-width"="128" "no-trapping-math"="true" "stack-protector-buffer-size"="8" }
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
attributes #26 = { convergent nounwind }
attributes #27 = { convergent nounwind readonly willreturn }
attributes #28 = { convergent }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3, !3}
!opencl.ocl.version = !{!4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4, !4}

!0 = !{i32 1, !"amdgpu_code_object_version", i32 400}
!1 = !{i32 1, !"wchar_size", i32 4}
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
!19 = distinct !{!19, !15}
!20 = !{!21, !6, i64 72}
!21 = !{!"_ZTS16textureReference", !10, i64 0, !22, i64 4, !23, i64 8, !7, i64 12, !24, i64 24, !10, i64 44, !10, i64 48, !23, i64 52, !26, i64 56, !26, i64 60, !26, i64 64, !6, i64 72, !10, i64 80, !27, i64 84}
!22 = !{!"_ZTS18hipTextureReadMode", !7, i64 0}
!23 = !{!"_ZTS20hipTextureFilterMode", !7, i64 0}
!24 = !{!"_ZTS20hipChannelFormatDesc", !10, i64 0, !10, i64 4, !10, i64 8, !10, i64 12, !25, i64 16}
!25 = !{!"_ZTS20hipChannelFormatKind", !7, i64 0}
!26 = !{!"float", !7, i64 0}
!27 = !{!"_ZTS15hipArray_Format", !7, i64 0}
!28 = !{i32 0, i32 1024}
!29 = !{!30, !30, i64 0}
!30 = !{!"omnipotent char", !31, i64 0}
!31 = !{!"Simple C/C++ TBAA"}
!32 = !{!33, !33, i64 0}
!33 = !{!"int", !30, i64 0}
!34 = !{!35, !35, i64 0}
!35 = !{!"long", !30, i64 0}
!36 = !{!37, !37, i64 0}
!37 = !{!"any pointer", !30, i64 0}
!38 = !{!39, !37, i64 0}
!39 = !{!"", !37, i64 0, !37, i64 8, !40, i64 16, !35, i64 24, !35, i64 32, !35, i64 40}
!40 = !{!"hsa_signal_s", !35, i64 0}
!41 = !{!39, !35, i64 40}
!42 = !{!39, !37, i64 8}
!43 = !{!44, !44, i64 0}
!44 = !{!"bool", !30, i64 0}
!45 = !{i64 2662}
!46 = !{!"exec"}
!47 = !{!48, !33, i64 16}
!48 = !{!"", !35, i64 0, !35, i64 8, !33, i64 16, !33, i64 20}
!49 = !{!48, !35, i64 8}
!50 = !{!48, !33, i64 20}
!51 = !{!48, !35, i64 0}
!52 = !{!53, !35, i64 16}
!53 = !{!"amd_signal_s", !35, i64 0, !30, i64 8, !35, i64 16, !33, i64 24, !33, i64 28, !35, i64 32, !35, i64 40, !30, i64 48, !30, i64 56}
!54 = !{!53, !33, i64 24}
!55 = !{i16 1, i16 1025}
!56 = !{}
!57 = !{!58, !33, i64 12}
!58 = !{!"hsa_kernel_dispatch_packet_s", !59, i64 0, !59, i64 2, !59, i64 4, !59, i64 6, !59, i64 8, !59, i64 10, !33, i64 12, !33, i64 16, !33, i64 20, !33, i64 24, !33, i64 28, !35, i64 32, !37, i64 40, !35, i64 48, !40, i64 56}
!59 = !{!"short", !30, i64 0}
!60 = !{!59, !59, i64 0}
!61 = !{!58, !33, i64 16}
!62 = !{!58, !33, i64 20}

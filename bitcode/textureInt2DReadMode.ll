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
%struct.texture = type { %struct.textureReference }
%struct.textureReference = type { i32, i32, i32, [3 x i32], %struct.hipChannelFormatDesc, i32, i32, i32, float, float, float, ptr, i32, i32 }
%struct.hipChannelFormatDesc = type { i32, i32, i32, i32, i32 }
%struct.HIP_vector_type = type { %struct.HIP_vector_base }
%struct.HIP_vector_base = type { %union.anon }
%union.anon = type { <2 x float> }
%union.anon.0 = type { <4 x float> }

$_ZN15HIP_vector_typeIfLj2EEC2IJffELPv0EEEDpT_ = comdat any

$_Z7mapFromIiDv4_fENSt9enable_ifIXoooooooooooosr3std7is_sameIT_cEE5valuesr3std7is_sameIS2_hEE5valuesr3std7is_sameIS2_sEE5valuesr3std7is_sameIS2_tEE5valuesr3std7is_sameIS2_iEE5valuesr3std7is_sameIS2_jEE5valuesr3std7is_sameIS2_fEE5valueEKS2_E4typeERKT0_ = comdat any

$_ZN15HIP_vector_baseIfLj2EEC2Eff = comdat any

@__oclc_ISA_version = internal local_unnamed_addr addrspace(4) constant i32 9010, align 4


; Function Attrs: alwaysinline convergent mustprogress nounwind
define linkonce_odr noundef i32 @_ZL5tex2DIiL18hipTextureReadMode0EEN13__hip_tex_retIT_XT0_EbE4typeE7textureIS2_Li2EXT0_EEff(%struct.textureReference %0, float noundef %1, float noundef %2) #5 {
  %4 = alloca i32, align 4, addrspace(5)
  %5 = alloca %struct.texture, align 8, addrspace(5)
  %6 = alloca float, align 4, addrspace(5)
  %7 = alloca float, align 4, addrspace(5)
  %8 = alloca ptr addrspace(4), align 8, addrspace(5)
  %9 = alloca ptr addrspace(4), align 8, addrspace(5)
  %10 = alloca <4 x float>, align 16, addrspace(5)
  %11 = alloca %struct.HIP_vector_type, align 8, addrspace(5)
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
  store float %1, ptr %15, align 4, !tbaa !21
  store float %2, ptr %16, align 4, !tbaa !21
  call void @llvm.lifetime.start.p5(i64 8, ptr addrspace(5) %8) #21
  %50 = getelementptr inbounds %struct.textureReference, ptr %14, i32 0, i32 11
  %51 = load ptr, ptr %50, align 8, !tbaa !23
  %52 = addrspacecast ptr %51 to ptr addrspace(4)
  store ptr addrspace(4) %52, ptr %17, align 8, !tbaa !5
  call void @llvm.lifetime.start.p5(i64 8, ptr addrspace(5) %9) #21
  %53 = load ptr addrspace(4), ptr %17, align 8, !tbaa !5
  %54 = getelementptr inbounds i32, ptr addrspace(4) %53, i64 12
  store ptr addrspace(4) %54, ptr %18, align 8, !tbaa !5
  call void @llvm.lifetime.start.p5(i64 16, ptr addrspace(5) %10) #21
  %55 = load ptr addrspace(4), ptr %17, align 8, !tbaa !5
  %56 = load ptr addrspace(4), ptr %18, align 8, !tbaa !5
  call void @llvm.lifetime.start.p5(i64 8, ptr addrspace(5) %11) #21
  %57 = load float, ptr %15, align 4, !tbaa !21
  %58 = load float, ptr %16, align 4, !tbaa !21
  call void @_ZN15HIP_vector_typeIfLj2EEC2IJffELPv0EEEDpT_(ptr noundef nonnull align 8 dereferenceable(8) %20, float noundef %57, float noundef %58) #24
  %59 = getelementptr inbounds %struct.HIP_vector_base, ptr %20, i32 0, i32 0
  %60 = load <2 x float>, ptr %59, align 8, !tbaa !13
  %61 = call contract <4 x float> @__ockl_image_sample_2D(ptr addrspace(4) noundef %55, ptr addrspace(4) noundef %56, <2 x float> noundef %60) #24
  call void @llvm.lifetime.end.p5(i64 8, ptr addrspace(5) %11) #21
  store <4 x float> %61, ptr %19, align 16, !tbaa !13
  %62 = call noundef i32 @_Z7mapFromIiDv4_fENSt9enable_ifIXoooooooooooosr3std7is_sameIT_cEE5valuesr3std7is_sameIS2_hEE5valuesr3std7is_sameIS2_sEE5valuesr3std7is_sameIS2_tEE5valuesr3std7is_sameIS2_iEE5valuesr3std7is_sameIS2_jEE5valuesr3std7is_sameIS2_fEE5valueEKS2_E4typeERKT0_(ptr noundef nonnull align 16 dereferenceable(16) %19) #24
  call void @llvm.lifetime.end.p5(i64 16, ptr addrspace(5) %10) #21
  call void @llvm.lifetime.end.p5(i64 8, ptr addrspace(5) %9) #21
  call void @llvm.lifetime.end.p5(i64 8, ptr addrspace(5) %8) #21
  ret i32 %62
}

; Function Attrs: argmemonly nocallback nofree nounwind willreturn
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: convergent nounwind
define linkonce_odr hidden void @_ZN15HIP_vector_typeIfLj2EEC2IJffELPv0EEEDpT_(ptr noundef nonnull align 8 dereferenceable(8) %0, float noundef %1, float noundef %2) unnamed_addr #6 comdat align 2 {
  %4 = alloca ptr, align 8, addrspace(5)
  %5 = alloca float, align 4, addrspace(5)
  %6 = alloca float, align 4, addrspace(5)
  %7 = addrspacecast ptr addrspace(5) %4 to ptr
  %8 = addrspacecast ptr addrspace(5) %5 to ptr
  %9 = addrspacecast ptr addrspace(5) %6 to ptr
  store ptr %0, ptr %7, align 8, !tbaa !5
  store float %1, ptr %8, align 4, !tbaa !21
  store float %2, ptr %9, align 4, !tbaa !21
  %10 = load ptr, ptr %7, align 8
  %11 = load float, ptr %8, align 4, !tbaa !21
  %12 = load float, ptr %9, align 4, !tbaa !21
  call void @_ZN15HIP_vector_baseIfLj2EEC2Eff(ptr noundef nonnull align 8 dereferenceable(8) %10, float noundef %11, float noundef %12) #24
  ret void
}

; Function Attrs: alwaysinline convergent mustprogress nounwind
define linkonce_odr hidden noundef i32 @_Z7mapFromIiDv4_fENSt9enable_ifIXoooooooooooosr3std7is_sameIT_cEE5valuesr3std7is_sameIS2_hEE5valuesr3std7is_sameIS2_sEE5valuesr3std7is_sameIS2_tEE5valuesr3std7is_sameIS2_iEE5valuesr3std7is_sameIS2_jEE5valuesr3std7is_sameIS2_fEE5valueEKS2_E4typeERKT0_(ptr noundef nonnull align 16 dereferenceable(16) %0) #7 comdat {
  %2 = alloca i32, align 4, addrspace(5)
  %3 = alloca ptr, align 8, addrspace(5)
  %4 = alloca %union.anon.0, align 16, addrspace(5)
  %5 = alloca i32, align 4, addrspace(5)
  %6 = addrspacecast ptr addrspace(5) %2 to ptr
  %7 = addrspacecast ptr addrspace(5) %3 to ptr
  %8 = addrspacecast ptr addrspace(5) %4 to ptr
  store ptr %0, ptr %7, align 8, !tbaa !5
  call void @llvm.lifetime.start.p5(i64 16, ptr addrspace(5) %4) #21
  %9 = load ptr, ptr %7, align 8, !tbaa !5
  %10 = load <4 x float>, ptr %9, align 16, !tbaa !13
  store <4 x float> %10, ptr %8, align 16, !tbaa !13
  %11 = load i32, ptr %8, align 16, !tbaa !13
  call void @llvm.lifetime.end.p5(i64 16, ptr addrspace(5) %4) #21
  ret i32 %11
}

; Function Attrs: convergent nounwind
define linkonce_odr hidden void @_ZN15HIP_vector_baseIfLj2EEC2Eff(ptr noundef nonnull align 8 dereferenceable(8) %0, float noundef %1, float noundef %2) unnamed_addr #6 comdat align 2 {
  %4 = alloca ptr, align 8, addrspace(5)
  %5 = alloca float, align 4, addrspace(5)
  %6 = alloca float, align 4, addrspace(5)
  %7 = addrspacecast ptr addrspace(5) %4 to ptr
  %8 = addrspacecast ptr addrspace(5) %5 to ptr
  %9 = addrspacecast ptr addrspace(5) %6 to ptr
  store ptr %0, ptr %7, align 8, !tbaa !5
  store float %1, ptr %8, align 4, !tbaa !21
  store float %2, ptr %9, align 4, !tbaa !21
  %10 = load ptr, ptr %7, align 8
  %11 = getelementptr inbounds %struct.HIP_vector_base, ptr %10, i32 0, i32 0
  %12 = load float, ptr %8, align 4, !tbaa !21
  %13 = insertelement <2 x float> undef, float %12, i32 0
  %14 = load float, ptr %9, align 4, !tbaa !21
  %15 = insertelement <2 x float> %13, float %14, i32 1
  store <2 x float> %15, ptr %11, align 8, !tbaa !13
  ret void
}

; Function Attrs: convergent mustprogress nofree norecurse nounwind readonly willreturn
define internal <4 x float> @__ockl_image_sample_2D(ptr addrspace(4) nocapture noundef readonly %0, ptr addrspace(4) nocapture noundef readonly %1, <2 x float> noundef %2) #8 {
  %4 = getelementptr inbounds i32, ptr addrspace(4) %0, i64 10
  %5 = load i32, ptr addrspace(4) %4, align 4, !tbaa !30
  %6 = uitofp i32 %5 to float
  %7 = getelementptr inbounds i32, ptr addrspace(4) %0, i64 2
  %8 = load i32, ptr addrspace(4) %7, align 4, !tbaa !30
  %9 = lshr i32 %8, 14
  %10 = and i32 %9, 16383
  %11 = add nuw nsw i32 %10, 1
  %12 = uitofp i32 %11 to float
  %13 = load i32, ptr addrspace(4) %1, align 4, !tbaa !30
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
  %29 = load i32, ptr addrspace(4) %28, align 4, !tbaa !30
  %30 = and i32 %29, 1048576
  %31 = icmp eq i32 %30, 0
  %32 = select i1 %31, float %22, float %18
  %33 = select i1 %31, float %27, float %23
  %34 = load i32, ptr addrspace(4) @__oclc_ISA_version, align 4, !tbaa !30
  %35 = icmp eq i32 %34, 9010
  %36 = load <8 x i32>, ptr addrspace(4) %0, align 32, !tbaa !34
  %37 = load <4 x i32>, ptr addrspace(4) %1, align 16, !tbaa !34
  br i1 %35, label %40, label %38

38:                                               ; preds = %3
  %39 = tail call fastcc <4 x float> @0(float noundef %32, float noundef %33, <8 x i32> noundef %36, <4 x i32> noundef %37) #12
  br label %42

40:                                               ; preds = %3
  %41 = tail call <4 x float> @llvm.amdgcn.image.sample.2d.v4f32.f32(i32 15, float %32, float %33, <8 x i32> %36, <4 x i32> %37, i1 false, i32 0, i32 0)
  br label %42

42:                                               ; preds = %40, %38
  %43 = phi <4 x float> [ %39, %38 ], [ %41, %40 ]
  ret <4 x float> %43
}

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.floor.f32(float) #9

; Function Attrs: nounwind readnone speculatable willreturn
declare float @llvm.amdgcn.rcp.f32(float) #10

; Function Attrs: convergent mustprogress nofree norecurse nounwind readonly willreturn
define internal fastcc <4 x float> @0(float noundef %0, float noundef %1, <8 x i32> noundef %2, <4 x i32> noundef %3) unnamed_addr #11 {
  %5 = tail call <4 x float> @llvm.amdgcn.image.sample.lz.2d.v4f32.f32(i32 15, float %0, float %1, <8 x i32> %2, <4 x i32> %3, i1 false, i32 0, i32 0)
  ret <4 x float> %5
}

; Function Attrs: nounwind readonly willreturn
declare <4 x float> @llvm.amdgcn.image.sample.2d.v4f32.f32(i32 immarg, float, float, <8 x i32>, <4 x i32>, i1 immarg, i32 immarg, i32 immarg) #12

; Function Attrs: nounwind readonly willreturn
declare <4 x float> @llvm.amdgcn.image.sample.lz.2d.v4f32.f32(i32 immarg, float, float, <8 x i32>, <4 x i32>, i1 immarg, i32 immarg, i32 immarg) #12

; Function Attrs: argmemonly nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p5(i64 immarg, ptr addrspace(5) nocapture) #1

; Function Attrs: argmemonly nocallback nofree nounwind willreturn
declare void @llvm.memcpy.p0.p4.i64(ptr noalias nocapture writeonly, ptr addrspace(4) noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: argmemonly nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p5(i64 immarg, ptr addrspace(5) nocapture) #1

; Function Attrs: cold noreturn nounwind
declare void @llvm.trap() #3

attributes #0 = { convergent mustprogress noinline nounwind "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx90a" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot3-insts,+dot4-insts,+dot5-insts,+dot6-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+gfx90a-insts,+mai-insts,+s-memrealtime,+s-memtime-inst" }
attributes #1 = { argmemonly nocallback nofree nosync nounwind willreturn }
attributes #2 = { argmemonly nocallback nofree nounwind willreturn }
attributes #3 = { cold noreturn nounwind }
attributes #4 = { convergent mustprogress norecurse nounwind "amdgpu-flat-work-group-size"="1,1024" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx90a" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot3-insts,+dot4-insts,+dot5-insts,+dot6-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+gfx90a-insts,+mai-insts,+s-memrealtime,+s-memtime-inst" "uniform-work-group-size"="true" }
attributes #5 = { alwaysinline convergent mustprogress nounwind "frame-pointer"="none" "min-legal-vector-width"="128" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx90a" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot3-insts,+dot4-insts,+dot5-insts,+dot6-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+gfx90a-insts,+mai-insts,+s-memrealtime,+s-memtime-inst" }
attributes #6 = { convergent nounwind "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx90a" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot3-insts,+dot4-insts,+dot5-insts,+dot6-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+gfx90a-insts,+mai-insts,+s-memrealtime,+s-memtime-inst" }
attributes #7 = { alwaysinline convergent mustprogress nounwind "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx90a" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot3-insts,+dot4-insts,+dot5-insts,+dot6-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+gfx90a-insts,+mai-insts,+s-memrealtime,+s-memtime-inst" }
attributes #8 = { convergent mustprogress nofree norecurse nounwind readonly willreturn "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" }
attributes #9 = { nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #10 = { nounwind readnone speculatable willreturn }
attributes #11 = { convergent mustprogress nofree norecurse nounwind readonly willreturn "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-features"="+extended-image-insts" }
attributes #12 = { nounwind readonly willreturn }
attributes #13 = { convergent norecurse nounwind "frame-pointer"="none" "min-legal-vector-width"="128" "no-trapping-math"="true" "stack-protector-buffer-size"="8" }
attributes #14 = { convergent noinline norecurse nounwind optnone "frame-pointer"="none" "min-legal-vector-width"="128" "no-trapping-math"="true" "stack-protector-buffer-size"="8" }
attributes #15 = { alwaysinline convergent mustprogress nofree norecurse nosync nounwind readnone willreturn "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" }
attributes #16 = { convergent norecurse nounwind "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" }
attributes #17 = { convergent nounwind readnone willreturn }
attributes #18 = { argmemonly convergent mustprogress nofree norecurse nosync nounwind readonly willreturn "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" }
attributes #19 = { convergent mustprogress nofree norecurse nounwind willreturn "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" }
attributes #20 = { nounwind willreturn }
attributes #21 = { nounwind }
attributes #22 = { nounwind readonly }
attributes #23 = { nounwind readnone willreturn }
attributes #24 = { convergent nounwind }
attributes #25 = { convergent }

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
!19 = distinct !{!19, !15}
!20 = distinct !{!20, !15}
!21 = !{!22, !22, i64 0}
!22 = !{!"float", !7, i64 0}
!23 = !{!24, !6, i64 72}
!24 = !{!"_ZTS16textureReference", !10, i64 0, !25, i64 4, !26, i64 8, !7, i64 12, !27, i64 24, !10, i64 44, !10, i64 48, !26, i64 52, !22, i64 56, !22, i64 60, !22, i64 64, !6, i64 72, !10, i64 80, !29, i64 84}
!25 = !{!"_ZTS18hipTextureReadMode", !7, i64 0}
!26 = !{!"_ZTS20hipTextureFilterMode", !7, i64 0}
!27 = !{!"_ZTS20hipChannelFormatDesc", !10, i64 0, !10, i64 4, !10, i64 8, !10, i64 12, !28, i64 16}
!28 = !{!"_ZTS20hipChannelFormatKind", !7, i64 0}
!29 = !{!"_ZTS15hipArray_Format", !7, i64 0}
!30 = !{!31, !31, i64 0}
!31 = !{!"int", !32, i64 0}
!32 = !{!"omnipotent char", !33, i64 0}
!33 = !{!"Simple C/C++ TBAA"}
!34 = !{!32, !32, i64 0}
!35 = !{!36, !36, i64 0}
!36 = !{!"long", !32, i64 0}
!37 = !{!38, !38, i64 0}
!38 = !{!"any pointer", !32, i64 0}
!39 = !{!40, !38, i64 0}
!40 = !{!"", !38, i64 0, !38, i64 8, !41, i64 16, !36, i64 24, !36, i64 32, !36, i64 40}
!41 = !{!"hsa_signal_s", !36, i64 0}
!42 = !{!40, !36, i64 40}
!43 = !{!40, !38, i64 8}
!44 = !{!45, !45, i64 0}
!45 = !{!"bool", !32, i64 0}
!46 = !{i64 2662}
!47 = !{!"exec"}
!48 = !{!49, !31, i64 16}
!49 = !{!"", !36, i64 0, !36, i64 8, !31, i64 16, !31, i64 20}
!50 = !{!49, !36, i64 8}
!51 = !{!49, !31, i64 20}
!52 = !{!49, !36, i64 0}
!53 = !{!54, !36, i64 16}
!54 = !{!"amd_signal_s", !36, i64 0, !32, i64 8, !36, i64 16, !31, i64 24, !31, i64 28, !36, i64 32, !36, i64 40, !32, i64 48, !32, i64 56}
!55 = !{!54, !31, i64 24}

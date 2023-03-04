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
%union.anon = type { <4 x float> }


$_Z7mapFromIfDv4_fENSt9enable_ifIXoooooooooooosr3std7is_sameIT_cEE5valuesr3std7is_sameIS2_hEE5valuesr3std7is_sameIS2_sEE5valuesr3std7is_sameIS2_tEE5valuesr3std7is_sameIS2_iEE5valuesr3std7is_sameIS2_jEE5valuesr3std7is_sameIS2_fEE5valueEKS2_E4typeERKT0_ = comdat any
@__oclc_ABI_version = internal local_unnamed_addr addrspace(4) constant i32 400, align 4


; Function Attrs: alwaysinline convergent mustprogress nounwind
define linkonce_odr noundef float @_ZL10tex1DfetchIfL18hipTextureReadMode0EEN13__hip_tex_retIT_XT0_EbE4typeE7textureIS2_Li1EXT0_EEi(%struct.textureReference %0, i32 noundef %1) #6 {
  %3 = alloca float, align 4, addrspace(5)
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
  call void @llvm.lifetime.start.p5(i64 8, ptr addrspace(5) %6) #21
  %45 = getelementptr inbounds %struct.textureReference, ptr %11, i32 0, i32 11
  %46 = load ptr, ptr %45, align 8, !tbaa !22
  %47 = addrspacecast ptr %46 to ptr addrspace(4)
  store ptr addrspace(4) %47, ptr %13, align 8, !tbaa !5
  call void @llvm.lifetime.start.p5(i64 8, ptr addrspace(5) %7) #21
  %48 = load ptr addrspace(4), ptr %13, align 8, !tbaa !5
  %49 = getelementptr inbounds i32, ptr addrspace(4) %48, i64 12
  store ptr addrspace(4) %49, ptr %14, align 8, !tbaa !5
  call void @llvm.lifetime.start.p5(i64 16, ptr addrspace(5) %8) #21
  %50 = load ptr addrspace(4), ptr %13, align 8, !tbaa !5
  %51 = load i32, ptr %12, align 4, !tbaa !9
  %52 = call contract <4 x float> @__ockl_image_load_1Db(ptr addrspace(4) noundef %50, i32 noundef %51) #25
  store <4 x float> %52, ptr %15, align 16, !tbaa !13
  %53 = call contract noundef float @_Z7mapFromIfDv4_fENSt9enable_ifIXoooooooooooosr3std7is_sameIT_cEE5valuesr3std7is_sameIS2_hEE5valuesr3std7is_sameIS2_sEE5valuesr3std7is_sameIS2_tEE5valuesr3std7is_sameIS2_iEE5valuesr3std7is_sameIS2_jEE5valuesr3std7is_sameIS2_fEE5valueEKS2_E4typeERKT0_(ptr noundef nonnull align 16 dereferenceable(16) %15) #25
  call void @llvm.lifetime.end.p5(i64 16, ptr addrspace(5) %8) #21
  call void @llvm.lifetime.end.p5(i64 8, ptr addrspace(5) %7) #21
  call void @llvm.lifetime.end.p5(i64 8, ptr addrspace(5) %6) #21
  ret float %53
}


; Function Attrs: alwaysinline convergent mustprogress nounwind
define linkonce_odr hidden noundef float @_Z7mapFromIfDv4_fENSt9enable_ifIXoooooooooooosr3std7is_sameIT_cEE5valuesr3std7is_sameIS2_hEE5valuesr3std7is_sameIS2_sEE5valuesr3std7is_sameIS2_tEE5valuesr3std7is_sameIS2_iEE5valuesr3std7is_sameIS2_jEE5valuesr3std7is_sameIS2_fEE5valueEKS2_E4typeERKT0_(ptr noundef nonnull align 16 dereferenceable(16) %0) #8 comdat {
  %2 = alloca float, align 4, addrspace(5)
  %3 = alloca ptr, align 8, addrspace(5)
  %4 = alloca %union.anon, align 16, addrspace(5)
  %5 = alloca i32, align 4, addrspace(5)
  %6 = addrspacecast ptr addrspace(5) %2 to ptr
  %7 = addrspacecast ptr addrspace(5) %3 to ptr
  %8 = addrspacecast ptr addrspace(5) %4 to ptr
  store ptr %0, ptr %7, align 8, !tbaa !5
  call void @llvm.lifetime.start.p5(i64 16, ptr addrspace(5) %4) #21
  %9 = load ptr, ptr %7, align 8, !tbaa !5
  %10 = load <4 x float>, ptr %9, align 16, !tbaa !13
  store <4 x float> %10, ptr %8, align 16, !tbaa !13
  %11 = load float, ptr %8, align 16, !tbaa !13
  call void @llvm.lifetime.end.p5(i64 16, ptr addrspace(5) %4) #21
  ret float %11
}

; Function Attrs: convergent mustprogress nofree norecurse nounwind readonly willreturn
define internal <4 x float> @__ockl_image_load_1Db(ptr addrspace(4) nocapture noundef readonly %0, i32 noundef %1) #11 {
  %3 = load <4 x i32>, ptr addrspace(4) %0, align 16, !tbaa !30
  %4 = tail call <4 x float> @llvm.amdgcn.struct.buffer.load.format.v4f32(<4 x i32> noundef %3, i32 noundef %1, i32 noundef 0, i32 noundef 0, i32 noundef 0) #26
  ret <4 x float> %4
}

; Function Attrs: nounwind readonly willreturn
declare <4 x float> @llvm.amdgcn.struct.buffer.load.format.v4f32(<4 x i32>, i32, i32, i32, i32 immarg) #12

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
attributes #4 = { convergent mustprogress norecurse nounwind "amdgpu-flat-work-group-size"="1,1024" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx90a" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot3-insts,+dot4-insts,+dot5-insts,+dot6-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+gfx90a-insts,+mai-insts,+s-memrealtime,+s-memtime-inst" "uniform-work-group-size"="true" }
attributes #5 = { convergent mustprogress nounwind "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx90a" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot3-insts,+dot4-insts,+dot5-insts,+dot6-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+gfx90a-insts,+mai-insts,+s-memrealtime,+s-memtime-inst" }
attributes #6 = { alwaysinline convergent mustprogress nounwind "frame-pointer"="none" "min-legal-vector-width"="128" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx90a" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot3-insts,+dot4-insts,+dot5-insts,+dot6-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+gfx90a-insts,+mai-insts,+s-memrealtime,+s-memtime-inst" }
attributes #7 = { convergent inlinehint mustprogress nounwind "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx90a" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot3-insts,+dot4-insts,+dot5-insts,+dot6-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+gfx90a-insts,+mai-insts,+s-memrealtime,+s-memtime-inst" }
attributes #8 = { alwaysinline convergent mustprogress nounwind "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx90a" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot3-insts,+dot4-insts,+dot5-insts,+dot6-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+gfx90a-insts,+mai-insts,+s-memrealtime,+s-memtime-inst" }
attributes #9 = { convergent mustprogress nofree norecurse nosync nounwind readnone willreturn "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" }
attributes #10 = { nounwind readnone speculatable willreturn }
attributes #11 = { convergent mustprogress nofree norecurse nounwind readonly willreturn "frame-pointer"="none" "min-legal-vector-width"="128" "no-trapping-math"="true" "stack-protector-buffer-size"="8" }
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
attributes #24 = { nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #25 = { convergent nounwind }
attributes #26 = { convergent nounwind readonly willreturn }
attributes #27 = { convergent }

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
!19 = !{!20, !20, i64 0}
!20 = !{!"float", !7, i64 0}
!21 = distinct !{!21, !15}
!22 = !{!23, !6, i64 72}
!23 = !{!"_ZTS16textureReference", !10, i64 0, !24, i64 4, !25, i64 8, !7, i64 12, !26, i64 24, !10, i64 44, !10, i64 48, !25, i64 52, !20, i64 56, !20, i64 60, !20, i64 64, !6, i64 72, !10, i64 80, !28, i64 84}
!24 = !{!"_ZTS18hipTextureReadMode", !7, i64 0}
!25 = !{!"_ZTS20hipTextureFilterMode", !7, i64 0}
!26 = !{!"_ZTS20hipChannelFormatDesc", !10, i64 0, !10, i64 4, !10, i64 8, !10, i64 12, !27, i64 16}
!27 = !{!"_ZTS20hipChannelFormatKind", !7, i64 0}
!28 = !{!"_ZTS15hipArray_Format", !7, i64 0}
!29 = !{i32 0, i32 1024}
!30 = !{!31, !31, i64 0}
!31 = !{!"omnipotent char", !32, i64 0}
!32 = !{!"Simple C/C++ TBAA"}
!33 = !{!34, !34, i64 0}
!34 = !{!"int", !31, i64 0}
!35 = !{!36, !36, i64 0}
!36 = !{!"long", !31, i64 0}
!37 = !{!38, !38, i64 0}
!38 = !{!"any pointer", !31, i64 0}
!39 = !{!40, !38, i64 0}
!40 = !{!"", !38, i64 0, !38, i64 8, !41, i64 16, !36, i64 24, !36, i64 32, !36, i64 40}
!41 = !{!"hsa_signal_s", !36, i64 0}
!42 = !{!40, !36, i64 40}
!43 = !{!40, !38, i64 8}
!44 = !{!45, !45, i64 0}
!45 = !{!"bool", !31, i64 0}
!46 = !{i64 2662}
!47 = !{!"exec"}
!48 = !{!49, !34, i64 16}
!49 = !{!"", !36, i64 0, !36, i64 8, !34, i64 16, !34, i64 20}
!50 = !{!49, !36, i64 8}
!51 = !{!49, !34, i64 20}
!52 = !{!49, !36, i64 0}
!53 = !{!54, !36, i64 16}
!54 = !{!"amd_signal_s", !36, i64 0, !31, i64 8, !36, i64 16, !34, i64 24, !34, i64 28, !36, i64 32, !36, i64 40, !31, i64 48, !31, i64 56}
!55 = !{!54, !34, i64 24}
!56 = !{i16 1, i16 1025}
!57 = !{}
!58 = !{!59, !34, i64 12}
!59 = !{!"hsa_kernel_dispatch_packet_s", !60, i64 0, !60, i64 2, !60, i64 4, !60, i64 6, !60, i64 8, !60, i64 10, !34, i64 12, !34, i64 16, !34, i64 20, !34, i64 24, !34, i64 28, !36, i64 32, !38, i64 40, !36, i64 48, !41, i64 56}
!60 = !{!"short", !31, i64 0}
!61 = !{!60, !60, i64 0}
!62 = !{!59, !34, i64 16}
!63 = !{!59, !34, i64 20}
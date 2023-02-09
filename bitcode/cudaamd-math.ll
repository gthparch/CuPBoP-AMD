; Bitcode implementations of NVVM math-related intrinsics
source_filename = "llvm-link"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: mustprogress nofree noinline norecurse nosync nounwind readnone willreturn
define linkonce_odr protected float @amdcuda.math.sinf(float noundef %0) unnamed_addr #0 {
  %2 = tail call float @llvm.fabs.f32(float %0)
  %3 = fcmp olt float %2, 1.310720e+05
  br i1 %3, label %4, label %11

4:                                                ; preds = %1
  %5 = fmul float %2, 0x3FE45F3060000000
  %6 = tail call float @llvm.rint.f32(float %5)
  %7 = tail call float @llvm.fma.f32(float %6, float 0xBFF921FB40000000, float %2)
  %8 = tail call float @llvm.fma.f32(float %6, float 0xBE74442D00000000, float %7)
  %9 = tail call float @llvm.fma.f32(float %6, float 0xBCF8469880000000, float %8)
  %10 = fptosi float %6 to i32
  %.pre.i.i.i = bitcast float %2 to i32
  br label %_ZL3sinf.exit

11:                                               ; preds = %1
  %12 = bitcast float %2 to i32
  %13 = lshr i32 %12, 23
  %14 = add nsw i32 %13, -120
  %15 = icmp ugt i32 %14, 63
  %16 = select i1 %15, i32 -64, i32 0
  %17 = add nsw i32 %16, %14
  %18 = icmp ugt i32 %17, 31
  %19 = select i1 %18, i32 -32, i32 0
  %20 = add nsw i32 %19, %17
  %21 = icmp ugt i32 %20, 31
  %22 = select i1 %21, i32 -32, i32 0
  %23 = add nsw i32 %22, %20
  %24 = icmp eq i32 %23, 0
  %25 = and i32 %12, 8388607
  %26 = or i32 %25, 8388608
  %27 = zext i32 %26 to i64
  %28 = mul nuw nsw i64 %27, 4266746795
  %29 = lshr i64 %28, 32
  %30 = mul nuw nsw i64 %27, 1011060801
  %31 = add nuw nsw i64 %29, %30
  %32 = lshr i64 %31, 32
  %33 = mul nuw nsw i64 %27, 3680671129
  %34 = add nuw nsw i64 %32, %33
  %35 = lshr i64 %34, 32
  %36 = mul nuw nsw i64 %27, 4113882560
  %37 = add nuw nsw i64 %35, %36
  %38 = trunc i64 %37 to i32
  %39 = lshr i64 %37, 32
  %40 = mul nuw nsw i64 %27, 4230436817
  %41 = add nuw nsw i64 %39, %40
  %42 = lshr i64 %41, 32
  %43 = mul nuw nsw i64 %27, 1313084713
  %44 = add nuw nsw i64 %42, %43
  %45 = trunc i64 %44 to i32
  %46 = select i1 %15, i32 %38, i32 %45
  %47 = trunc i64 %41 to i32
  %48 = lshr i64 %44, 32
  %49 = mul nuw nsw i64 %27, 2734261102
  %50 = add nuw nsw i64 %48, %49
  %51 = trunc i64 %50 to i32
  %52 = select i1 %15, i32 %47, i32 %51
  %53 = select i1 %18, i32 %46, i32 %52
  %54 = lshr i64 %50, 32
  %55 = trunc i64 %54 to i32
  %56 = select i1 %15, i32 %45, i32 %55
  %57 = select i1 %18, i32 %52, i32 %56
  %58 = select i1 %21, i32 %53, i32 %57
  %59 = trunc i64 %34 to i32
  %60 = select i1 %15, i32 %59, i32 %47
  %61 = select i1 %18, i32 %60, i32 %46
  %62 = select i1 %21, i32 %61, i32 %53
  %63 = sub nsw i32 32, %23
  %64 = tail call i32 @llvm.fshr.i32(i32 %58, i32 %62, i32 %63)
  %65 = select i1 %24, i32 %58, i32 %64
  %66 = trunc i64 %31 to i32
  %67 = select i1 %15, i32 %66, i32 %38
  %68 = select i1 %18, i32 %67, i32 %60
  %69 = select i1 %21, i32 %68, i32 %61
  %70 = tail call i32 @llvm.fshr.i32(i32 %62, i32 %69, i32 %63)
  %71 = select i1 %24, i32 %62, i32 %70
  %72 = tail call i32 @llvm.fshl.i32(i32 %65, i32 %71, i32 2)
  %73 = lshr i32 %65, 29
  %74 = and i32 %73, 1
  %75 = sub nsw i32 0, %74
  %76 = xor i32 %72, %75
  %77 = trunc i64 %28 to i32
  %78 = select i1 %15, i32 %77, i32 %59
  %79 = select i1 %18, i32 %78, i32 %67
  %80 = select i1 %21, i32 %79, i32 %68
  %81 = tail call i32 @llvm.fshr.i32(i32 %69, i32 %80, i32 %63)
  %82 = select i1 %24, i32 %69, i32 %81
  %83 = tail call i32 @llvm.fshl.i32(i32 %71, i32 %82, i32 2)
  %84 = xor i32 %83, %75
  %85 = tail call i32 @llvm.ctlz.i32(i32 %76, i1 false), !range !4
  %86 = sub nsw i32 31, %85
  %87 = tail call i32 @llvm.fshr.i32(i32 %76, i32 %84, i32 %86)
  %88 = tail call i32 @llvm.fshl.i32(i32 %82, i32 %80, i32 2)
  %89 = xor i32 %88, %75
  %90 = tail call i32 @llvm.fshr.i32(i32 %84, i32 %89, i32 %86)
  %91 = tail call i32 @llvm.fshl.i32(i32 %87, i32 %90, i32 23)
  %92 = tail call i32 @llvm.ctlz.i32(i32 %91, i1 false), !range !4
  %93 = add nuw nsw i32 %92, %85
  %94 = mul nsw i32 %93, -8388608
  %95 = add nsw i32 %94, 855638016
  %96 = shl i32 %73, 31
  %97 = or i32 %95, %96
  %98 = sub nsw i32 31, %92
  %99 = tail call i32 @llvm.fshr.i32(i32 %91, i32 %90, i32 %98)
  %100 = lshr i32 %99, 9
  %101 = or i32 %97, %100
  %102 = bitcast i32 %101 to float
  %103 = mul nsw i32 %85, -8388608
  %104 = add nsw i32 %103, 1056964608
  %105 = or i32 %104, %96
  %106 = lshr i32 %87, 9
  %107 = or i32 %105, %106
  %108 = bitcast i32 %107 to float
  %109 = fmul float %108, 0x3FF921FB40000000
  %110 = fneg float %109
  %111 = tail call float @llvm.fma.f32(float %108, float 0x3FF921FB40000000, float %110)
  %112 = tail call float @llvm.fma.f32(float %108, float 0x3E74442D00000000, float %111)
  %113 = tail call float @llvm.fma.f32(float %102, float 0x3FF921FB40000000, float %112)
  %114 = fadd float %109, %113
  %115 = lshr i32 %65, 30
  %116 = add nuw nsw i32 %74, %115
  br label %_ZL3sinf.exit

_ZL3sinf.exit:                                    ; preds = %4, %11
  %.pre-phi.i.i.i = phi i32 [ %.pre.i.i.i, %4 ], [ %12, %11 ]
  %.pn3.in.i.i.i.i = phi float [ %9, %4 ], [ %114, %11 ]
  %.pn1.in.i.i.i.i = phi i32 [ %10, %4 ], [ %116, %11 ]
  %117 = fmul float %.pn3.in.i.i.i.i, %.pn3.in.i.i.i.i
  %118 = tail call float @llvm.fmuladd.f32(float %117, float 0xBF29833040000000, float 0x3F81103880000000)
  %119 = tail call float @llvm.fmuladd.f32(float %117, float %118, float 0xBFC55553A0000000)
  %120 = fmul float %117, %119
  %121 = tail call float @llvm.fmuladd.f32(float %.pn3.in.i.i.i.i, float %120, float %.pn3.in.i.i.i.i)
  %122 = tail call float @llvm.fmuladd.f32(float %117, float 0x3EFAEA6680000000, float 0xBF56C9E760000000)
  %123 = tail call float @llvm.fmuladd.f32(float %117, float %122, float 0x3FA5557EE0000000)
  %124 = tail call float @llvm.fmuladd.f32(float %117, float %123, float 0xBFE0000080000000)
  %125 = tail call float @llvm.fmuladd.f32(float %117, float %124, float 1.000000e+00)
  %126 = and i32 %.pn1.in.i.i.i.i, 1
  %127 = icmp eq i32 %126, 0
  %.v.i.i.i = select i1 %127, float %121, float %125
  %128 = bitcast float %.v.i.i.i to i32
  %.pn1.i.i.i.i = shl i32 %.pn1.in.i.i.i.i, 30
  %129 = and i32 %.pn1.i.i.i.i, -2147483648
  %130 = bitcast float %0 to i32
  %131 = xor i32 %.pre-phi.i.i.i, %130
  %132 = xor i32 %131, %129
  %133 = xor i32 %132, %128
  %134 = bitcast i32 %133 to float
  %135 = tail call i1 @llvm.amdgcn.class.f32(float %2, i32 504)
  %136 = select i1 %135, float %134, float 0x7FF8000000000000
  ret float %136
}

; Function Attrs: mustprogress nofree noinline norecurse nosync nounwind readnone willreturn
define linkonce_odr protected float @amdcuda.math.cosf(float noundef %0) unnamed_addr #0 {
  %2 = tail call float @llvm.fabs.f32(float %0)
  %3 = fcmp olt float %2, 1.310720e+05
  br i1 %3, label %4, label %11

4:                                                ; preds = %1
  %5 = fmul float %2, 0x3FE45F3060000000
  %6 = tail call float @llvm.rint.f32(float %5)
  %7 = tail call float @llvm.fma.f32(float %6, float 0xBFF921FB40000000, float %2)
  %8 = tail call float @llvm.fma.f32(float %6, float 0xBE74442D00000000, float %7)
  %9 = tail call float @llvm.fma.f32(float %6, float 0xBCF8469880000000, float %8)
  %10 = fptosi float %6 to i32
  br label %_ZL3cosf.exit

11:                                               ; preds = %1
  %12 = bitcast float %2 to i32
  %13 = lshr i32 %12, 23
  %14 = add nsw i32 %13, -120
  %15 = icmp ugt i32 %14, 63
  %16 = select i1 %15, i32 -64, i32 0
  %17 = add nsw i32 %16, %14
  %18 = icmp ugt i32 %17, 31
  %19 = select i1 %18, i32 -32, i32 0
  %20 = add nsw i32 %19, %17
  %21 = icmp ugt i32 %20, 31
  %22 = select i1 %21, i32 -32, i32 0
  %23 = add nsw i32 %22, %20
  %24 = icmp eq i32 %23, 0
  %25 = and i32 %12, 8388607
  %26 = or i32 %25, 8388608
  %27 = zext i32 %26 to i64
  %28 = mul nuw nsw i64 %27, 4266746795
  %29 = lshr i64 %28, 32
  %30 = mul nuw nsw i64 %27, 1011060801
  %31 = add nuw nsw i64 %29, %30
  %32 = lshr i64 %31, 32
  %33 = mul nuw nsw i64 %27, 3680671129
  %34 = add nuw nsw i64 %32, %33
  %35 = lshr i64 %34, 32
  %36 = mul nuw nsw i64 %27, 4113882560
  %37 = add nuw nsw i64 %35, %36
  %38 = trunc i64 %37 to i32
  %39 = lshr i64 %37, 32
  %40 = mul nuw nsw i64 %27, 4230436817
  %41 = add nuw nsw i64 %39, %40
  %42 = lshr i64 %41, 32
  %43 = mul nuw nsw i64 %27, 1313084713
  %44 = add nuw nsw i64 %42, %43
  %45 = trunc i64 %44 to i32
  %46 = select i1 %15, i32 %38, i32 %45
  %47 = trunc i64 %41 to i32
  %48 = lshr i64 %44, 32
  %49 = mul nuw nsw i64 %27, 2734261102
  %50 = add nuw nsw i64 %48, %49
  %51 = trunc i64 %50 to i32
  %52 = select i1 %15, i32 %47, i32 %51
  %53 = select i1 %18, i32 %46, i32 %52
  %54 = lshr i64 %50, 32
  %55 = trunc i64 %54 to i32
  %56 = select i1 %15, i32 %45, i32 %55
  %57 = select i1 %18, i32 %52, i32 %56
  %58 = select i1 %21, i32 %53, i32 %57
  %59 = trunc i64 %34 to i32
  %60 = select i1 %15, i32 %59, i32 %47
  %61 = select i1 %18, i32 %60, i32 %46
  %62 = select i1 %21, i32 %61, i32 %53
  %63 = sub nsw i32 32, %23
  %64 = tail call i32 @llvm.fshr.i32(i32 %58, i32 %62, i32 %63)
  %65 = select i1 %24, i32 %58, i32 %64
  %66 = trunc i64 %31 to i32
  %67 = select i1 %15, i32 %66, i32 %38
  %68 = select i1 %18, i32 %67, i32 %60
  %69 = select i1 %21, i32 %68, i32 %61
  %70 = tail call i32 @llvm.fshr.i32(i32 %62, i32 %69, i32 %63)
  %71 = select i1 %24, i32 %62, i32 %70
  %72 = tail call i32 @llvm.fshl.i32(i32 %65, i32 %71, i32 2)
  %73 = lshr i32 %65, 29
  %74 = and i32 %73, 1
  %75 = sub nsw i32 0, %74
  %76 = xor i32 %72, %75
  %77 = trunc i64 %28 to i32
  %78 = select i1 %15, i32 %77, i32 %59
  %79 = select i1 %18, i32 %78, i32 %67
  %80 = select i1 %21, i32 %79, i32 %68
  %81 = tail call i32 @llvm.fshr.i32(i32 %69, i32 %80, i32 %63)
  %82 = select i1 %24, i32 %69, i32 %81
  %83 = tail call i32 @llvm.fshl.i32(i32 %71, i32 %82, i32 2)
  %84 = xor i32 %83, %75
  %85 = tail call i32 @llvm.ctlz.i32(i32 %76, i1 false), !range !4
  %86 = sub nsw i32 31, %85
  %87 = tail call i32 @llvm.fshr.i32(i32 %76, i32 %84, i32 %86)
  %88 = tail call i32 @llvm.fshl.i32(i32 %82, i32 %80, i32 2)
  %89 = xor i32 %88, %75
  %90 = tail call i32 @llvm.fshr.i32(i32 %84, i32 %89, i32 %86)
  %91 = tail call i32 @llvm.fshl.i32(i32 %87, i32 %90, i32 23)
  %92 = tail call i32 @llvm.ctlz.i32(i32 %91, i1 false), !range !4
  %93 = add nuw nsw i32 %92, %85
  %94 = mul nsw i32 %93, -8388608
  %95 = add nsw i32 %94, 855638016
  %96 = shl i32 %73, 31
  %97 = or i32 %95, %96
  %98 = sub nsw i32 31, %92
  %99 = tail call i32 @llvm.fshr.i32(i32 %91, i32 %90, i32 %98)
  %100 = lshr i32 %99, 9
  %101 = or i32 %97, %100
  %102 = bitcast i32 %101 to float
  %103 = mul nsw i32 %85, -8388608
  %104 = add nsw i32 %103, 1056964608
  %105 = or i32 %104, %96
  %106 = lshr i32 %87, 9
  %107 = or i32 %105, %106
  %108 = bitcast i32 %107 to float
  %109 = fmul float %108, 0x3FF921FB40000000
  %110 = fneg float %109
  %111 = tail call float @llvm.fma.f32(float %108, float 0x3FF921FB40000000, float %110)
  %112 = tail call float @llvm.fma.f32(float %108, float 0x3E74442D00000000, float %111)
  %113 = tail call float @llvm.fma.f32(float %102, float 0x3FF921FB40000000, float %112)
  %114 = fadd float %109, %113
  %115 = lshr i32 %65, 30
  %116 = add nuw nsw i32 %74, %115
  br label %_ZL3cosf.exit

_ZL3cosf.exit:                                    ; preds = %4, %11
  %.pn3.in.i.i.i.i = phi float [ %9, %4 ], [ %114, %11 ]
  %.pn1.in.i.i.i.i = phi i32 [ %10, %4 ], [ %116, %11 ]
  %117 = fmul float %.pn3.in.i.i.i.i, %.pn3.in.i.i.i.i
  %118 = tail call float @llvm.fmuladd.f32(float %117, float 0xBF29833040000000, float 0x3F81103880000000)
  %119 = tail call float @llvm.fmuladd.f32(float %117, float %118, float 0xBFC55553A0000000)
  %120 = fmul float %117, %119
  %121 = tail call float @llvm.fmuladd.f32(float %.pn3.in.i.i.i.i, float %120, float %.pn3.in.i.i.i.i)
  %122 = tail call float @llvm.fmuladd.f32(float %117, float 0x3EFAEA6680000000, float 0xBF56C9E760000000)
  %123 = tail call float @llvm.fmuladd.f32(float %117, float %122, float 0x3FA5557EE0000000)
  %124 = tail call float @llvm.fmuladd.f32(float %117, float %123, float 0xBFE0000080000000)
  %125 = tail call float @llvm.fmuladd.f32(float %117, float %124, float 1.000000e+00)
  %126 = fneg float %121
  %127 = and i32 %.pn1.in.i.i.i.i, 1
  %128 = icmp eq i32 %127, 0
  %.v.i.i.i = select i1 %128, float %125, float %126
  %129 = bitcast float %.v.i.i.i to i32
  %.pn1.i.i.i.i = shl i32 %.pn1.in.i.i.i.i, 30
  %130 = and i32 %.pn1.i.i.i.i, -2147483648
  %131 = xor i32 %130, %129
  %132 = bitcast i32 %131 to float
  %133 = tail call i1 @llvm.amdgcn.class.f32(float %2, i32 504)
  %134 = select i1 %133, float %132, float 0x7FF8000000000000
  ret float %134
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fabs.f32(float) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i1 @llvm.amdgcn.class.f32(float, i32) #3

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fmuladd.f32(float, float, float) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.fshr.i32(i32, i32, i32) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.fshl.i32(i32, i32, i32) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.ctlz.i32(i32, i1 immarg) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fma.f32(float, float, float) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.rint.f32(float) #2

attributes #0 = { mustprogress nofree noinline norecurse nosync nounwind readnone willreturn "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx90a" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot3-insts,+dot4-insts,+dot5-insts,+dot6-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+gfx90a-insts,+mai-insts,+s-memrealtime,+s-memtime-inst" }
attributes #1 = { argmemonly convergent mustprogress nofree norecurse nosync nounwind willreturn "amdgpu-flat-work-group-size"="1,1024" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx90a" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot3-insts,+dot4-insts,+dot5-insts,+dot6-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+gfx90a-insts,+mai-insts,+s-memrealtime,+s-memtime-inst" "uniform-work-group-size"="true" }
attributes #2 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #4 = { nounwind }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 16.0.0 (https://github.com/llvm/llvm-project 809855b56f06dd7182685f88fbbc64111df9339a)"}
!4 = !{i32 0, i32 33}
!5 = !{!6, !6, i64 0}
!6 = !{!"float", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C++ TBAA"}
!9 = !{}

; ModuleID = 'cuda2gcn.bc'
source_filename = "llvm-link"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: mustprogress nofree norecurse nosync nounwind readnone willreturn
define linkonce_odr protected i32 @__nv_brev(i32 noundef %0) local_unnamed_addr #0 {
  %2 = tail call i32 @llvm.bitreverse.i32(i32 %0)
  ret i32 %2
}

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.bitreverse.i32(i32) #1

; Function Attrs: mustprogress nofree norecurse nosync nounwind readnone willreturn
define linkonce_odr protected i64 @__nv_brevll(i64 noundef %0) local_unnamed_addr #0 {
  %2 = tail call i64 @llvm.bitreverse.i64(i64 %0)
  ret i64 %2
}

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.bitreverse.i64(i64) #1

; Function Attrs: convergent mustprogress nofree norecurse nounwind readnone willreturn
define linkonce_odr protected i32 @__nv_clz(i32 noundef %0) local_unnamed_addr #2 {
  %2 = tail call i32 @__ockl_clz_u32(i32 noundef %0) #11
  ret i32 %2
}

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare i32 @__ockl_clz_u32(i32 noundef) local_unnamed_addr #3

; Function Attrs: convergent mustprogress nofree norecurse nounwind readnone willreturn
define linkonce_odr protected i32 @__nv_clzll(i64 noundef %0) local_unnamed_addr #2 {
  %2 = trunc i64 %0 to i32
  %3 = lshr i64 %0, 32
  %4 = trunc i64 %3 to i32
  %5 = tail call i32 @__ockl_clz_u32(i32 noundef %2) #11
  %6 = add i32 %5, 32
  %7 = tail call i32 @__ockl_clz_u32(i32 noundef %4) #11
  %8 = icmp eq i32 %4, 0
  %9 = select i1 %8, i32 %6, i32 %7
  ret i32 %9
}

; Function Attrs: convergent mustprogress nofree norecurse nounwind readnone willreturn
define linkonce_odr protected i32 @__nv_ffs(i32 noundef %0) local_unnamed_addr #2 {
  %2 = sub nsw i32 0, %0
  %3 = and i32 %2, %0
  %4 = tail call i32 @__ockl_clz_u32(i32 noundef %3) #11
  %5 = sub nsw i32 32, %4
  ret i32 %5
}

; Function Attrs: convergent mustprogress nofree norecurse nounwind readnone willreturn
define linkonce_odr protected i32 @__nv_ffsll(i64 noundef %0) local_unnamed_addr #2 {
  %2 = sub nsw i64 0, %0
  %3 = and i64 %2, %0
  %4 = trunc i64 %3 to i32
  %5 = lshr i64 %3, 32
  %6 = trunc i64 %5 to i32
  %7 = tail call i32 @__ockl_clz_u32(i32 noundef %4) #11
  %8 = add i32 %7, 32
  %9 = tail call i32 @__ockl_clz_u32(i32 noundef %6) #11
  %10 = icmp eq i32 %6, 0
  %11 = select i1 %10, i32 %8, i32 %9
  %12 = sub nsw i32 64, %11
  ret i32 %12
}

; Function Attrs: convergent mustprogress nofree norecurse nounwind readnone willreturn
define linkonce_odr protected i32 @__nv_popc(i32 noundef %0) local_unnamed_addr #2 {
  %2 = tail call i32 @__ockl_popcount_u32(i32 noundef %0) #11
  ret i32 %2
}

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare i32 @__ockl_popcount_u32(i32 noundef) local_unnamed_addr #3

; Function Attrs: convergent mustprogress nofree norecurse nounwind readnone willreturn
define linkonce_odr protected i32 @__nv_popcll(i64 noundef %0) local_unnamed_addr #2 {
  %2 = tail call i64 @__ockl_popcount_u64(i64 noundef %0) #11
  %3 = trunc i64 %2 to i32
  ret i32 %3
}

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare i64 @__ockl_popcount_u64(i64 noundef) local_unnamed_addr #3

; Function Attrs: convergent mustprogress nofree norecurse nounwind readnone willreturn
define linkonce_odr protected float @__nv_double2float_rd(double noundef %0) local_unnamed_addr #2 {
  %2 = tail call float @_Z17convert_float_rtnd(double noundef %0) #11
  ret float %2
}

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare float @_Z17convert_float_rtnd(double noundef) local_unnamed_addr #3

; Function Attrs: convergent mustprogress nofree norecurse nounwind readnone willreturn
define linkonce_odr protected float @__nv_double2float_rn(double noundef %0) local_unnamed_addr #2 {
  %2 = tail call float @_Z17convert_float_rted(double noundef %0) #11
  ret float %2
}

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare float @_Z17convert_float_rted(double noundef) local_unnamed_addr #3

; Function Attrs: convergent mustprogress nofree norecurse nounwind readnone willreturn
define linkonce_odr protected float @__nv_double2float_ru(double noundef %0) local_unnamed_addr #2 {
  %2 = tail call float @_Z17convert_float_rtpd(double noundef %0) #11
  ret float %2
}

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare float @_Z17convert_float_rtpd(double noundef) local_unnamed_addr #3

; Function Attrs: convergent mustprogress nofree norecurse nounwind readnone willreturn
define linkonce_odr protected float @__nv_double2float_rz(double noundef %0) local_unnamed_addr #2 {
  %2 = tail call float @_Z17convert_float_rtzd(double noundef %0) #11
  ret float %2
}

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare float @_Z17convert_float_rtzd(double noundef) local_unnamed_addr #3

; Function Attrs: convergent mustprogress nofree norecurse nounwind readnone willreturn
define linkonce_odr protected i32 @__nv_double2int_rd(double noundef %0) local_unnamed_addr #2 {
  %2 = tail call i32 @_Z15convert_int_rtnd(double noundef %0) #11
  ret i32 %2
}

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare i32 @_Z15convert_int_rtnd(double noundef) local_unnamed_addr #3

; Function Attrs: convergent mustprogress nofree norecurse nounwind readnone willreturn
define linkonce_odr protected i32 @__nv_double2int_rn(double noundef %0) local_unnamed_addr #2 {
  %2 = tail call i32 @_Z15convert_int_rted(double noundef %0) #11
  ret i32 %2
}

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare i32 @_Z15convert_int_rted(double noundef) local_unnamed_addr #3

; Function Attrs: convergent mustprogress nofree norecurse nounwind readnone willreturn
define linkonce_odr protected i32 @__nv_double2int_ru(double noundef %0) local_unnamed_addr #2 {
  %2 = tail call i32 @_Z15convert_int_rtpd(double noundef %0) #11
  ret i32 %2
}

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare i32 @_Z15convert_int_rtpd(double noundef) local_unnamed_addr #3

; Function Attrs: convergent mustprogress nofree norecurse nounwind readnone willreturn
define linkonce_odr protected i32 @__nv_double2int_rz(double noundef %0) local_unnamed_addr #2 {
  %2 = tail call i32 @_Z15convert_int_rtzd(double noundef %0) #11
  ret i32 %2
}

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare i32 @_Z15convert_int_rtzd(double noundef) local_unnamed_addr #3

; Function Attrs: convergent mustprogress nofree norecurse nounwind readnone willreturn
define linkonce_odr protected i32 @__nv_float2int_rd(float noundef %0) local_unnamed_addr #2 {
  %2 = tail call i32 @_Z15convert_int_rtnf(float noundef %0) #11
  ret i32 %2
}

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare i32 @_Z15convert_int_rtnf(float noundef) local_unnamed_addr #3

; Function Attrs: convergent mustprogress nofree norecurse nounwind readnone willreturn
define linkonce_odr protected i32 @__nv_float2int_rn(float noundef %0) local_unnamed_addr #2 {
  %2 = tail call i32 @_Z15convert_int_rtef(float noundef %0) #11
  ret i32 %2
}

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare i32 @_Z15convert_int_rtef(float noundef) local_unnamed_addr #3

; Function Attrs: convergent mustprogress nofree norecurse nounwind readnone willreturn
define linkonce_odr protected i32 @__nv_float2int_ru(float noundef %0) local_unnamed_addr #2 {
  %2 = tail call i32 @_Z15convert_int_rtpf(float noundef %0) #11
  ret i32 %2
}

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare i32 @_Z15convert_int_rtpf(float noundef) local_unnamed_addr #3

; Function Attrs: convergent mustprogress nofree norecurse nounwind readnone willreturn
define linkonce_odr protected i32 @__nv_float2int_rz(float noundef %0) local_unnamed_addr #2 {
  %2 = tail call i32 @_Z15convert_int_rtzf(float noundef %0) #11
  ret i32 %2
}

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare i32 @_Z15convert_int_rtzf(float noundef) local_unnamed_addr #3

; Function Attrs: convergent mustprogress nofree norecurse nounwind readnone willreturn
define linkonce_odr protected float @__nv_int2float_rd(i32 noundef %0) local_unnamed_addr #2 {
  %2 = tail call float @_Z17convert_float_rtni(i32 noundef %0) #11
  ret float %2
}

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare float @_Z17convert_float_rtni(i32 noundef) local_unnamed_addr #3

; Function Attrs: convergent mustprogress nofree norecurse nounwind readnone willreturn
define linkonce_odr protected float @__nv_int2float_rn(i32 noundef %0) local_unnamed_addr #2 {
  %2 = tail call float @_Z17convert_float_rtei(i32 noundef %0) #11
  ret float %2
}

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare float @_Z17convert_float_rtei(i32 noundef) local_unnamed_addr #3

; Function Attrs: convergent mustprogress nofree norecurse nounwind readnone willreturn
define linkonce_odr protected float @__nv_int2float_ru(i32 noundef %0) local_unnamed_addr #2 {
  %2 = tail call float @_Z17convert_float_rtpi(i32 noundef %0) #11
  ret float %2
}

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare float @_Z17convert_float_rtpi(i32 noundef) local_unnamed_addr #3

; Function Attrs: convergent mustprogress nofree norecurse nounwind readnone willreturn
define linkonce_odr protected float @__nv_int2float_rz(i32 noundef %0) local_unnamed_addr #2 {
  %2 = tail call float @_Z17convert_float_rtzi(i32 noundef %0) #11
  ret float %2
}

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare float @_Z17convert_float_rtzi(i32 noundef) local_unnamed_addr #3

; Function Attrs: convergent mustprogress nofree norecurse nounwind readnone willreturn
define linkonce_odr protected i32 @__nv_double2uint_rd(double noundef %0) local_unnamed_addr #2 {
  %2 = tail call i32 @_Z16convert_uint_rtnd(double noundef %0) #11
  ret i32 %2
}

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare i32 @_Z16convert_uint_rtnd(double noundef) local_unnamed_addr #3

; Function Attrs: convergent mustprogress nofree norecurse nounwind readnone willreturn
define linkonce_odr protected i32 @__nv_double2uint_rn(double noundef %0) local_unnamed_addr #2 {
  %2 = tail call i32 @_Z16convert_uint_rted(double noundef %0) #11
  ret i32 %2
}

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare i32 @_Z16convert_uint_rted(double noundef) local_unnamed_addr #3

; Function Attrs: convergent mustprogress nofree norecurse nounwind readnone willreturn
define linkonce_odr protected i32 @__nv_double2uint_ru(double noundef %0) local_unnamed_addr #2 {
  %2 = tail call i32 @_Z16convert_uint_rtpd(double noundef %0) #11
  ret i32 %2
}

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare i32 @_Z16convert_uint_rtpd(double noundef) local_unnamed_addr #3

; Function Attrs: convergent mustprogress nofree norecurse nounwind readnone willreturn
define linkonce_odr protected i32 @__nv_double2uint_rz(double noundef %0) local_unnamed_addr #2 {
  %2 = tail call i32 @_Z16convert_uint_rtzd(double noundef %0) #11
  ret i32 %2
}

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare i32 @_Z16convert_uint_rtzd(double noundef) local_unnamed_addr #3

; Function Attrs: convergent mustprogress nofree norecurse nounwind readnone willreturn
define linkonce_odr protected i32 @__nv_float2uint_rd(float noundef %0) local_unnamed_addr #2 {
  %2 = tail call i32 @_Z16convert_uint_rtnf(float noundef %0) #11
  ret i32 %2
}

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare i32 @_Z16convert_uint_rtnf(float noundef) local_unnamed_addr #3

; Function Attrs: convergent mustprogress nofree norecurse nounwind readnone willreturn
define linkonce_odr protected i32 @__nv_float2uint_rn(float noundef %0) local_unnamed_addr #2 {
  %2 = tail call i32 @_Z16convert_uint_rtef(float noundef %0) #11
  ret i32 %2
}

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare i32 @_Z16convert_uint_rtef(float noundef) local_unnamed_addr #3

; Function Attrs: convergent mustprogress nofree norecurse nounwind readnone willreturn
define linkonce_odr protected i32 @__nv_float2uint_ru(float noundef %0) local_unnamed_addr #2 {
  %2 = tail call i32 @_Z16convert_uint_rtpf(float noundef %0) #11
  ret i32 %2
}

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare i32 @_Z16convert_uint_rtpf(float noundef) local_unnamed_addr #3

; Function Attrs: convergent mustprogress nofree norecurse nounwind readnone willreturn
define linkonce_odr protected i32 @__nv_float2uint_rz(float noundef %0) local_unnamed_addr #2 {
  %2 = tail call i32 @_Z16convert_uint_rtzf(float noundef %0) #11
  ret i32 %2
}

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare i32 @_Z16convert_uint_rtzf(float noundef) local_unnamed_addr #3

; Function Attrs: convergent mustprogress nofree norecurse nounwind readnone willreturn
define linkonce_odr protected double @__nv_uint2double_rd(i32 noundef %0) local_unnamed_addr #2 {
  %2 = tail call double @_Z18convert_double_rtnj(i32 noundef %0) #11
  ret double %2
}

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare double @_Z18convert_double_rtnj(i32 noundef) local_unnamed_addr #3

; Function Attrs: convergent mustprogress nofree norecurse nounwind readnone willreturn
define linkonce_odr protected double @__nv_uint2double_rn(i32 noundef %0) local_unnamed_addr #2 {
  %2 = tail call double @_Z18convert_double_rtej(i32 noundef %0) #11
  ret double %2
}

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare double @_Z18convert_double_rtej(i32 noundef) local_unnamed_addr #3

; Function Attrs: convergent mustprogress nofree norecurse nounwind readnone willreturn
define linkonce_odr protected double @__nv_uint2double_ru(i32 noundef %0) local_unnamed_addr #2 {
  %2 = tail call double @_Z18convert_double_rtpj(i32 noundef %0) #11
  ret double %2
}

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare double @_Z18convert_double_rtpj(i32 noundef) local_unnamed_addr #3

; Function Attrs: convergent mustprogress nofree norecurse nounwind readnone willreturn
define linkonce_odr protected double @__nv_uint2double_rz(i32 noundef %0) local_unnamed_addr #2 {
  %2 = tail call double @_Z18convert_double_rtzj(i32 noundef %0) #11
  ret double %2
}

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare double @_Z18convert_double_rtzj(i32 noundef) local_unnamed_addr #3

; Function Attrs: convergent mustprogress nofree norecurse nounwind readnone willreturn
define linkonce_odr protected float @__nv_uint2float_rd(i32 noundef %0) local_unnamed_addr #2 {
  %2 = tail call float @_Z17convert_float_rtnj(i32 noundef %0) #11
  ret float %2
}

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare float @_Z17convert_float_rtnj(i32 noundef) local_unnamed_addr #3

; Function Attrs: convergent mustprogress nofree norecurse nounwind readnone willreturn
define linkonce_odr protected float @__nv_uint2float_rn(i32 noundef %0) local_unnamed_addr #2 {
  %2 = tail call float @_Z17convert_float_rtej(i32 noundef %0) #11
  ret float %2
}

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare float @_Z17convert_float_rtej(i32 noundef) local_unnamed_addr #3

; Function Attrs: convergent mustprogress nofree norecurse nounwind readnone willreturn
define linkonce_odr protected float @__nv_uint2float_ru(i32 noundef %0) local_unnamed_addr #2 {
  %2 = tail call float @_Z17convert_float_rtpj(i32 noundef %0) #11
  ret float %2
}

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare float @_Z17convert_float_rtpj(i32 noundef) local_unnamed_addr #3

; Function Attrs: convergent mustprogress nofree norecurse nounwind readnone willreturn
define linkonce_odr protected float @__nv_uint2float_rz(i32 noundef %0) local_unnamed_addr #2 {
  %2 = tail call float @_Z17convert_float_rtzj(i32 noundef %0) #11
  ret float %2
}

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare float @_Z17convert_float_rtzj(i32 noundef) local_unnamed_addr #3

; Function Attrs: convergent mustprogress nofree norecurse nounwind readnone willreturn
define linkonce_odr protected i64 @__nv_double2ll_rd(double noundef %0) local_unnamed_addr #2 {
  %2 = tail call i64 @_Z16convert_long_rtnd(double noundef %0) #11
  ret i64 %2
}

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare i64 @_Z16convert_long_rtnd(double noundef) local_unnamed_addr #3

; Function Attrs: convergent mustprogress nofree norecurse nounwind readnone willreturn
define linkonce_odr protected i64 @__nv_double2ll_rn(double noundef %0) local_unnamed_addr #2 {
  %2 = tail call i64 @_Z16convert_long_rted(double noundef %0) #11
  ret i64 %2
}

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare i64 @_Z16convert_long_rted(double noundef) local_unnamed_addr #3

; Function Attrs: convergent mustprogress nofree norecurse nounwind readnone willreturn
define linkonce_odr protected i64 @__nv_double2ll_ru(double noundef %0) local_unnamed_addr #2 {
  %2 = tail call i64 @_Z16convert_long_rtpd(double noundef %0) #11
  ret i64 %2
}

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare i64 @_Z16convert_long_rtpd(double noundef) local_unnamed_addr #3

; Function Attrs: convergent mustprogress nofree norecurse nounwind readnone willreturn
define linkonce_odr protected i64 @__nv_double2ll_rz(double noundef %0) local_unnamed_addr #2 {
  %2 = tail call i64 @_Z16convert_long_rtzd(double noundef %0) #11
  ret i64 %2
}

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare i64 @_Z16convert_long_rtzd(double noundef) local_unnamed_addr #3

; Function Attrs: convergent mustprogress nofree norecurse nounwind readnone willreturn
define linkonce_odr protected i64 @__nv_float2ll_rd(float noundef %0) local_unnamed_addr #2 {
  %2 = tail call i64 @_Z16convert_long_rtnf(float noundef %0) #11
  ret i64 %2
}

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare i64 @_Z16convert_long_rtnf(float noundef) local_unnamed_addr #3

; Function Attrs: convergent mustprogress nofree norecurse nounwind readnone willreturn
define linkonce_odr protected i64 @__nv_float2ll_rn(float noundef %0) local_unnamed_addr #2 {
  %2 = tail call i64 @_Z16convert_long_rtef(float noundef %0) #11
  ret i64 %2
}

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare i64 @_Z16convert_long_rtef(float noundef) local_unnamed_addr #3

; Function Attrs: convergent mustprogress nofree norecurse nounwind readnone willreturn
define linkonce_odr protected i64 @__nv_float2ll_ru(float noundef %0) local_unnamed_addr #2 {
  %2 = tail call i64 @_Z16convert_long_rtpf(float noundef %0) #11
  ret i64 %2
}

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare i64 @_Z16convert_long_rtpf(float noundef) local_unnamed_addr #3

; Function Attrs: convergent mustprogress nofree norecurse nounwind readnone willreturn
define linkonce_odr protected i64 @__nv_float2ll_rz(float noundef %0) local_unnamed_addr #2 {
  %2 = tail call i64 @_Z16convert_long_rtzf(float noundef %0) #11
  ret i64 %2
}

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare i64 @_Z16convert_long_rtzf(float noundef) local_unnamed_addr #3

; Function Attrs: convergent mustprogress nofree norecurse nounwind readnone willreturn
define linkonce_odr protected i64 @__nv_double2ull_rd(double noundef %0) local_unnamed_addr #2 {
  %2 = tail call i64 @_Z17convert_ulong_rtnd(double noundef %0) #11
  ret i64 %2
}

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare i64 @_Z17convert_ulong_rtnd(double noundef) local_unnamed_addr #3

; Function Attrs: convergent mustprogress nofree norecurse nounwind readnone willreturn
define linkonce_odr protected i64 @__nv_double2ull_rn(double noundef %0) local_unnamed_addr #2 {
  %2 = tail call i64 @_Z17convert_ulong_rted(double noundef %0) #11
  ret i64 %2
}

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare i64 @_Z17convert_ulong_rted(double noundef) local_unnamed_addr #3

; Function Attrs: convergent mustprogress nofree norecurse nounwind readnone willreturn
define linkonce_odr protected i64 @__nv_double2ull_ru(double noundef %0) local_unnamed_addr #2 {
  %2 = tail call i64 @_Z17convert_ulong_rtpd(double noundef %0) #11
  ret i64 %2
}

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare i64 @_Z17convert_ulong_rtpd(double noundef) local_unnamed_addr #3

; Function Attrs: convergent mustprogress nofree norecurse nounwind readnone willreturn
define linkonce_odr protected i64 @__nv_double2ull_rz(double noundef %0) local_unnamed_addr #2 {
  %2 = tail call i64 @_Z17convert_ulong_rtzd(double noundef %0) #11
  ret i64 %2
}

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare i64 @_Z17convert_ulong_rtzd(double noundef) local_unnamed_addr #3

; Function Attrs: convergent mustprogress nofree norecurse nounwind readnone willreturn
define linkonce_odr protected i64 @__nv_float2ull_rd(float noundef %0) local_unnamed_addr #2 {
  %2 = tail call i64 @_Z17convert_ulong_rtnf(float noundef %0) #11
  ret i64 %2
}

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare i64 @_Z17convert_ulong_rtnf(float noundef) local_unnamed_addr #3

; Function Attrs: convergent mustprogress nofree norecurse nounwind readnone willreturn
define linkonce_odr protected i64 @__nv_float2ull_rn(float noundef %0) local_unnamed_addr #2 {
  %2 = tail call i64 @_Z17convert_ulong_rtef(float noundef %0) #11
  ret i64 %2
}

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare i64 @_Z17convert_ulong_rtef(float noundef) local_unnamed_addr #3

; Function Attrs: convergent mustprogress nofree norecurse nounwind readnone willreturn
define linkonce_odr protected i64 @__nv_float2ull_ru(float noundef %0) local_unnamed_addr #2 {
  %2 = tail call i64 @_Z17convert_ulong_rtpf(float noundef %0) #11
  ret i64 %2
}

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare i64 @_Z17convert_ulong_rtpf(float noundef) local_unnamed_addr #3

; Function Attrs: convergent mustprogress nofree norecurse nounwind readnone willreturn
define linkonce_odr protected i64 @__nv_float2ull_rz(float noundef %0) local_unnamed_addr #2 {
  %2 = tail call i64 @_Z17convert_ulong_rtzf(float noundef %0) #11
  ret i64 %2
}

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare i64 @_Z17convert_ulong_rtzf(float noundef) local_unnamed_addr #3

; Function Attrs: convergent mustprogress nofree norecurse nounwind readnone willreturn
define linkonce_odr protected double @__nv_ll2double_rd(i64 noundef %0) local_unnamed_addr #2 {
  %2 = tail call double @_Z18convert_double_rtnl(i64 noundef %0) #11
  ret double %2
}

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare double @_Z18convert_double_rtnl(i64 noundef) local_unnamed_addr #3

; Function Attrs: convergent mustprogress nofree norecurse nounwind readnone willreturn
define linkonce_odr protected double @__nv_ll2double_rn(i64 noundef %0) local_unnamed_addr #2 {
  %2 = tail call double @_Z18convert_double_rtel(i64 noundef %0) #11
  ret double %2
}

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare double @_Z18convert_double_rtel(i64 noundef) local_unnamed_addr #3

; Function Attrs: convergent mustprogress nofree norecurse nounwind readnone willreturn
define linkonce_odr protected double @__nv_ll2double_ru(i64 noundef %0) local_unnamed_addr #2 {
  %2 = tail call double @_Z18convert_double_rtpl(i64 noundef %0) #11
  ret double %2
}

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare double @_Z18convert_double_rtpl(i64 noundef) local_unnamed_addr #3

; Function Attrs: convergent mustprogress nofree norecurse nounwind readnone willreturn
define linkonce_odr protected double @__nv_ll2double_rz(i64 noundef %0) local_unnamed_addr #2 {
  %2 = tail call double @_Z18convert_double_rtzl(i64 noundef %0) #11
  ret double %2
}

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare double @_Z18convert_double_rtzl(i64 noundef) local_unnamed_addr #3

; Function Attrs: convergent mustprogress nofree norecurse nounwind readnone willreturn
define linkonce_odr protected float @__nv_ll2float_rd(i64 noundef %0) local_unnamed_addr #2 {
  %2 = tail call float @_Z17convert_float_rtnl(i64 noundef %0) #11
  ret float %2
}

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare float @_Z17convert_float_rtnl(i64 noundef) local_unnamed_addr #3

; Function Attrs: convergent mustprogress nofree norecurse nounwind readnone willreturn
define linkonce_odr protected float @__nv_ll2float_rn(i64 noundef %0) local_unnamed_addr #2 {
  %2 = tail call float @_Z17convert_float_rtel(i64 noundef %0) #11
  ret float %2
}

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare float @_Z17convert_float_rtel(i64 noundef) local_unnamed_addr #3

; Function Attrs: convergent mustprogress nofree norecurse nounwind readnone willreturn
define linkonce_odr protected float @__nv_ll2float_ru(i64 noundef %0) local_unnamed_addr #2 {
  %2 = tail call float @_Z17convert_float_rtpl(i64 noundef %0) #11
  ret float %2
}

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare float @_Z17convert_float_rtpl(i64 noundef) local_unnamed_addr #3

; Function Attrs: convergent mustprogress nofree norecurse nounwind readnone willreturn
define linkonce_odr protected float @__nv_ll2float_rz(i64 noundef %0) local_unnamed_addr #2 {
  %2 = tail call float @_Z17convert_float_rtzl(i64 noundef %0) #11
  ret float %2
}

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare float @_Z17convert_float_rtzl(i64 noundef) local_unnamed_addr #3

; Function Attrs: convergent mustprogress nofree norecurse nounwind readnone willreturn
define linkonce_odr protected double @__nv_ull2double_rd(i64 noundef %0) local_unnamed_addr #2 {
  %2 = tail call double @_Z18convert_double_rtnm(i64 noundef %0) #11
  ret double %2
}

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare double @_Z18convert_double_rtnm(i64 noundef) local_unnamed_addr #3

; Function Attrs: convergent mustprogress nofree norecurse nounwind readnone willreturn
define linkonce_odr protected double @__nv_ull2double_rn(i64 noundef %0) local_unnamed_addr #2 {
  %2 = tail call double @_Z18convert_double_rtem(i64 noundef %0) #11
  ret double %2
}

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare double @_Z18convert_double_rtem(i64 noundef) local_unnamed_addr #3

; Function Attrs: convergent mustprogress nofree norecurse nounwind readnone willreturn
define linkonce_odr protected double @__nv_ull2double_ru(i64 noundef %0) local_unnamed_addr #2 {
  %2 = tail call double @_Z18convert_double_rtpm(i64 noundef %0) #11
  ret double %2
}

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare double @_Z18convert_double_rtpm(i64 noundef) local_unnamed_addr #3

; Function Attrs: convergent mustprogress nofree norecurse nounwind readnone willreturn
define linkonce_odr protected double @__nv_ull2double_rz(i64 noundef %0) local_unnamed_addr #2 {
  %2 = tail call double @_Z18convert_double_rtzm(i64 noundef %0) #11
  ret double %2
}

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare double @_Z18convert_double_rtzm(i64 noundef) local_unnamed_addr #3

; Function Attrs: convergent mustprogress nofree norecurse nounwind readnone willreturn
define linkonce_odr protected float @__nv_ull2float_rd(i64 noundef %0) local_unnamed_addr #2 {
  %2 = tail call float @_Z17convert_float_rtnm(i64 noundef %0) #11
  ret float %2
}

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare float @_Z17convert_float_rtnm(i64 noundef) local_unnamed_addr #3

; Function Attrs: convergent mustprogress nofree norecurse nounwind readnone willreturn
define linkonce_odr protected float @__nv_ull2float_rn(i64 noundef %0) local_unnamed_addr #2 {
  %2 = tail call float @_Z17convert_float_rtem(i64 noundef %0) #11
  ret float %2
}

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare float @_Z17convert_float_rtem(i64 noundef) local_unnamed_addr #3

; Function Attrs: convergent mustprogress nofree norecurse nounwind readnone willreturn
define linkonce_odr protected float @__nv_ull2float_ru(i64 noundef %0) local_unnamed_addr #2 {
  %2 = tail call float @_Z17convert_float_rtpm(i64 noundef %0) #11
  ret float %2
}

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare float @_Z17convert_float_rtpm(i64 noundef) local_unnamed_addr #3

; Function Attrs: convergent mustprogress nofree norecurse nounwind readnone willreturn
define linkonce_odr protected float @__nv_ull2float_rz(i64 noundef %0) local_unnamed_addr #2 {
  %2 = tail call float @_Z17convert_float_rtzm(i64 noundef %0) #11
  ret float %2
}

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare float @_Z17convert_float_rtzm(i64 noundef) local_unnamed_addr #3

; Function Attrs: convergent mustprogress nofree norecurse nounwind readnone willreturn
define linkonce_odr protected i32 @__nv_finitef(float noundef %0) local_unnamed_addr #2 {
  %2 = tail call i32 @_Z8isfinitef(float noundef %0) #11
  ret i32 %2
}

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare i32 @_Z8isfinitef(float noundef) local_unnamed_addr #3

; Function Attrs: convergent mustprogress nofree norecurse nounwind readnone willreturn
define linkonce_odr protected i32 @__nv_isfinited(double noundef %0) local_unnamed_addr #2 {
  %2 = tail call i32 @_Z8isfinited(double noundef %0) #11
  ret i32 %2
}

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare i32 @_Z8isfinited(double noundef) local_unnamed_addr #3

; Function Attrs: convergent mustprogress nofree norecurse nounwind readnone willreturn
define linkonce_odr protected i32 @__nv_isinfd(double noundef %0) local_unnamed_addr #2 {
  %2 = tail call i32 @_Z5isinfd(double noundef %0) #11
  ret i32 %2
}

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare i32 @_Z5isinfd(double noundef) local_unnamed_addr #3

; Function Attrs: convergent mustprogress nofree norecurse nounwind readnone willreturn
define linkonce_odr protected i32 @__nv_isinff(float noundef %0) local_unnamed_addr #2 {
  %2 = tail call i32 @_Z5isinff(float noundef %0) #11
  ret i32 %2
}

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare i32 @_Z5isinff(float noundef) local_unnamed_addr #3

; Function Attrs: convergent mustprogress nofree norecurse nounwind readnone willreturn
define linkonce_odr protected i32 @__nv_isnand(double noundef %0) local_unnamed_addr #2 {
  %2 = tail call i32 @_Z5isnand(double noundef %0) #11
  ret i32 %2
}

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare i32 @_Z5isnand(double noundef) local_unnamed_addr #3

; Function Attrs: convergent mustprogress nofree norecurse nounwind readnone willreturn
define linkonce_odr protected i32 @__nv_isnanf(float noundef %0) local_unnamed_addr #2 {
  %2 = tail call i32 @_Z5isnanf(float noundef %0) #11
  ret i32 %2
}

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare i32 @_Z5isnanf(float noundef) local_unnamed_addr #3

; Function Attrs: convergent mustprogress nofree norecurse nounwind readnone willreturn
define linkonce_odr protected double @__nv_nan(ptr noundef readonly %0) local_unnamed_addr #2 {
  %2 = tail call double @nan(ptr noundef %0) #12
  ret double %2
}

; Function Attrs: convergent mustprogress nofree nounwind readonly willreturn
declare double @nan(ptr noundef) local_unnamed_addr #4

; Function Attrs: convergent mustprogress nofree norecurse nounwind readnone willreturn
define linkonce_odr protected float @__nv_nanf(ptr noundef %0) local_unnamed_addr #2 {
  %2 = tail call double @nan(ptr noundef %0) #12
  %3 = fptrunc double %2 to float
  ret float %3
}

; Function Attrs: convergent mustprogress nofree norecurse nounwind readnone willreturn
define linkonce_odr protected i32 @__nv_abs(i32 noundef %0) local_unnamed_addr #2 {
  %2 = tail call i32 @_Z3absi(i32 noundef %0) #11
  ret i32 %2
}

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare i32 @_Z3absi(i32 noundef) local_unnamed_addr #3

; Function Attrs: convergent mustprogress nofree norecurse nounwind readnone willreturn
define linkonce_odr protected i64 @__nv_llabs(i64 noundef %0) local_unnamed_addr #2 {
  %2 = tail call i64 @_Z3absl(i64 noundef %0) #11
  ret i64 %2
}

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare i64 @_Z3absl(i64 noundef) local_unnamed_addr #3

; Function Attrs: mustprogress nofree norecurse nosync nounwind readnone willreturn
define linkonce_odr protected i32 @__nv_max(i32 noundef %0, i32 noundef %1) local_unnamed_addr #0 {
  %3 = tail call i32 @llvm.smax.i32(i32 %0, i32 %1)
  ret i32 %3
}

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.smax.i32(i32, i32) #1

; Function Attrs: mustprogress nofree norecurse nosync nounwind readnone willreturn
define linkonce_odr protected i64 @__nv_llmax(i64 noundef %0, i64 noundef %1) local_unnamed_addr #0 {
  %3 = tail call i64 @llvm.smax.i64(i64 %0, i64 %1)
  ret i64 %3
}

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.smax.i64(i64, i64) #1

; Function Attrs: mustprogress nofree norecurse nosync nounwind readnone willreturn
define linkonce_odr protected i64 @__nv_ullmax(i64 noundef %0, i64 noundef %1) local_unnamed_addr #0 {
  %3 = tail call i64 @llvm.umax.i64(i64 %0, i64 %1)
  ret i64 %3
}

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.umax.i64(i64, i64) #1

; Function Attrs: mustprogress nofree norecurse nosync nounwind readnone willreturn
define linkonce_odr protected i32 @__nv_umax(i32 noundef %0, i32 noundef %1) local_unnamed_addr #0 {
  %3 = tail call i32 @llvm.umax.i32(i32 %0, i32 %1)
  ret i32 %3
}

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.umax.i32(i32, i32) #1

; Function Attrs: mustprogress nofree norecurse nosync nounwind readnone willreturn
define linkonce_odr protected i32 @__nv_min(i32 noundef %0, i32 noundef %1) local_unnamed_addr #0 {
  %3 = tail call i32 @llvm.smin.i32(i32 %0, i32 %1)
  ret i32 %3
}

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.smin.i32(i32, i32) #1

; Function Attrs: mustprogress nofree norecurse nosync nounwind readnone willreturn
define linkonce_odr protected i64 @__nv_llmin(i64 noundef %0, i64 noundef %1) local_unnamed_addr #0 {
  %3 = tail call i64 @llvm.smin.i64(i64 %0, i64 %1)
  ret i64 %3
}

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.smin.i64(i64, i64) #1

; Function Attrs: mustprogress nofree norecurse nosync nounwind readnone willreturn
define linkonce_odr protected i64 @__nv_ullmin(i64 noundef %0, i64 noundef %1) local_unnamed_addr #0 {
  %3 = tail call i64 @llvm.umin.i64(i64 %0, i64 %1)
  ret i64 %3
}

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.umin.i64(i64, i64) #1

; Function Attrs: mustprogress nofree norecurse nosync nounwind readnone willreturn
define linkonce_odr protected i32 @__nv_umin(i32 noundef %0, i32 noundef %1) local_unnamed_addr #0 {
  %3 = tail call i32 @llvm.umin.i32(i32 %0, i32 %1)
  ret i32 %3
}

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.umin.i32(i32, i32) #1

; Function Attrs: convergent mustprogress nofree norecurse nounwind readnone willreturn
define linkonce_odr protected i32 @__nv_sad(i32 noundef %0, i32 noundef %1, i32 noundef %2) local_unnamed_addr #2 {
  %4 = sub nsw i32 %0, %1
  %5 = tail call i32 @_Z3absi(i32 noundef %4) #11
  %6 = add i32 %5, %2
  ret i32 %6
}

; Function Attrs: convergent mustprogress nofree norecurse nounwind readnone willreturn
define linkonce_odr protected i32 @__nv_usad(i32 noundef %0, i32 noundef %1, i32 noundef %2) local_unnamed_addr #2 {
  %4 = sub i32 %0, %1
  %5 = tail call i32 @_Z3absj(i32 noundef %4) #11
  %6 = add i32 %5, %2
  ret i32 %6
}

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare i32 @_Z3absj(i32 noundef) local_unnamed_addr #3

; Function Attrs: mustprogress nofree norecurse nosync nounwind readnone willreturn
define linkonce_odr protected half @__nv_float2half_rn(float noundef %0) local_unnamed_addr #0 {
  %2 = fptrunc float %0 to half
  ret half %2
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind readnone willreturn
define linkonce_odr protected float @__nv_half2float(half noundef %0) local_unnamed_addr #0 {
  %2 = fpext half %0 to float
  ret float %2
}

; Function Attrs: alwaysinline convergent mustprogress nofree norecurse nounwind readnone willreturn
define linkonce_odr protected i32 @__nv_mul24(i32 noundef %0, i32 noundef %1) local_unnamed_addr #5 {
  %3 = tail call i32 @__ockl_mul24_i32(i32 noundef %0, i32 noundef %1) #11
  ret i32 %3
}

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare i32 @__ockl_mul24_i32(i32 noundef, i32 noundef) local_unnamed_addr #3

; Function Attrs: alwaysinline convergent mustprogress nofree norecurse nounwind readnone willreturn
define linkonce_odr protected i32 @__nv_umul24(i32 noundef %0, i32 noundef %1) local_unnamed_addr #5 {
  %3 = tail call i32 @__ockl_mul24_u32(i32 noundef %0, i32 noundef %1) #11
  ret i32 %3
}

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare i32 @__ockl_mul24_u32(i32 noundef, i32 noundef) local_unnamed_addr #3

; Function Attrs: alwaysinline convergent mustprogress nofree norecurse nounwind readnone willreturn
define linkonce_odr protected i64 @__nv_mul64hi(i64 noundef %0, i64 noundef %1) local_unnamed_addr #5 {
  %3 = tail call i64 @__ockl_mul_hi_i64(i64 noundef %0, i64 noundef %1) #11
  ret i64 %3
}

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare i64 @__ockl_mul_hi_i64(i64 noundef, i64 noundef) local_unnamed_addr #3

; Function Attrs: alwaysinline convergent mustprogress nofree norecurse nounwind readnone willreturn
define linkonce_odr protected i32 @__nv_mulhi(i32 noundef %0, i32 noundef %1) local_unnamed_addr #5 {
  %3 = tail call i32 @__ockl_mul_hi_i32(i32 noundef %0, i32 noundef %1) #11
  ret i32 %3
}

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare i32 @__ockl_mul_hi_i32(i32 noundef, i32 noundef) local_unnamed_addr #3

; Function Attrs: alwaysinline convergent mustprogress nofree norecurse nounwind readnone willreturn
define linkonce_odr protected i64 @__nv_umul64hi(i64 noundef %0, i64 noundef %1) local_unnamed_addr #5 {
  %3 = tail call i64 @__ockl_mul_hi_u64(i64 noundef %0, i64 noundef %1) #11
  ret i64 %3
}

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare i64 @__ockl_mul_hi_u64(i64 noundef, i64 noundef) local_unnamed_addr #3

; Function Attrs: alwaysinline convergent mustprogress nofree norecurse nounwind readnone willreturn
define linkonce_odr protected i32 @__nv_umulhi(i32 noundef %0, i32 noundef %1) local_unnamed_addr #5 {
  %3 = tail call i32 @__ockl_mul_hi_u32(i32 noundef %0, i32 noundef %1) #11
  ret i32 %3
}

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare i32 @__ockl_mul_hi_u32(i32 noundef, i32 noundef) local_unnamed_addr #3

; Function Attrs: alwaysinline convergent mustprogress nofree norecurse nounwind readnone willreturn
define linkonce_odr protected double @__nv_acos(double noundef %0) local_unnamed_addr #5 {
  %2 = tail call double @__ocml_acos_f64(double noundef %0) #11
  ret double %2
}

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare double @__ocml_acos_f64(double noundef) local_unnamed_addr #3

; Function Attrs: alwaysinline convergent mustprogress nofree norecurse nounwind readnone willreturn
define linkonce_odr protected float @__nv_acosf(float noundef %0) local_unnamed_addr #5 {
  %2 = tail call float @__ocml_acos_f32(float noundef %0) #11
  ret float %2
}

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare float @__ocml_acos_f32(float noundef) local_unnamed_addr #3

; Function Attrs: alwaysinline convergent mustprogress nofree norecurse nounwind readnone willreturn
define linkonce_odr protected double @__nv_acosh(double noundef %0) local_unnamed_addr #5 {
  %2 = tail call double @__ocml_acosh_f64(double noundef %0) #11
  ret double %2
}

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare double @__ocml_acosh_f64(double noundef) local_unnamed_addr #3

; Function Attrs: alwaysinline convergent mustprogress nofree norecurse nounwind readnone willreturn
define linkonce_odr protected float @__nv_acoshf(float noundef %0) local_unnamed_addr #5 {
  %2 = tail call float @__ocml_acosh_f32(float noundef %0) #11
  ret float %2
}

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare float @__ocml_acosh_f32(float noundef) local_unnamed_addr #3

; Function Attrs: alwaysinline convergent mustprogress nofree norecurse nounwind readnone willreturn
define linkonce_odr protected double @__nv_asin(double noundef %0) local_unnamed_addr #5 {
  %2 = tail call double @__ocml_asin_f64(double noundef %0) #11
  ret double %2
}

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare double @__ocml_asin_f64(double noundef) local_unnamed_addr #3

; Function Attrs: alwaysinline convergent mustprogress nofree norecurse nounwind readnone willreturn
define linkonce_odr protected float @__nv_asinf(float noundef %0) local_unnamed_addr #5 {
  %2 = tail call float @__ocml_asin_f32(float noundef %0) #11
  ret float %2
}

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare float @__ocml_asin_f32(float noundef) local_unnamed_addr #3

; Function Attrs: alwaysinline convergent mustprogress nofree norecurse nounwind readnone willreturn
define linkonce_odr protected double @__nv_asinh(double noundef %0) local_unnamed_addr #5 {
  %2 = tail call double @__ocml_asinh_f64(double noundef %0) #11
  ret double %2
}

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare double @__ocml_asinh_f64(double noundef) local_unnamed_addr #3

; Function Attrs: alwaysinline convergent mustprogress nofree norecurse nounwind readnone willreturn
define linkonce_odr protected float @__nv_asinhf(float noundef %0) local_unnamed_addr #5 {
  %2 = tail call float @__ocml_asinh_f32(float noundef %0) #11
  ret float %2
}

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare float @__ocml_asinh_f32(float noundef) local_unnamed_addr #3

; Function Attrs: alwaysinline convergent mustprogress nofree norecurse nounwind readnone willreturn
define linkonce_odr protected double @__nv_atan(double noundef %0) local_unnamed_addr #5 {
  %2 = tail call double @__ocml_atan_f64(double noundef %0) #11
  ret double %2
}

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare double @__ocml_atan_f64(double noundef) local_unnamed_addr #3

; Function Attrs: alwaysinline convergent mustprogress nofree norecurse nounwind readnone willreturn
define linkonce_odr protected float @__nv_atanf(float noundef %0) local_unnamed_addr #5 {
  %2 = tail call float @__ocml_atan_f32(float noundef %0) #11
  ret float %2
}

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare float @__ocml_atan_f32(float noundef) local_unnamed_addr #3

; Function Attrs: alwaysinline convergent mustprogress nofree norecurse nounwind readnone willreturn
define linkonce_odr protected double @__nv_atan2(double noundef %0, double noundef %1) local_unnamed_addr #5 {
  %3 = tail call double @__ocml_atan2_f64(double noundef %0, double noundef %1) #11
  ret double %3
}

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare double @__ocml_atan2_f64(double noundef, double noundef) local_unnamed_addr #3

; Function Attrs: alwaysinline convergent mustprogress nofree norecurse nounwind readnone willreturn
define linkonce_odr protected float @__nv_atan2f(float noundef %0, float noundef %1) local_unnamed_addr #5 {
  %3 = tail call float @__ocml_atan2_f32(float noundef %0, float noundef %1) #11
  ret float %3
}

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare float @__ocml_atan2_f32(float noundef, float noundef) local_unnamed_addr #3

; Function Attrs: alwaysinline convergent mustprogress nofree norecurse nounwind readnone willreturn
define linkonce_odr protected double @__nv_atanh(double noundef %0) local_unnamed_addr #5 {
  %2 = tail call double @__ocml_atanh_f64(double noundef %0) #11
  ret double %2
}

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare double @__ocml_atanh_f64(double noundef) local_unnamed_addr #3

; Function Attrs: alwaysinline convergent mustprogress nofree norecurse nounwind readnone willreturn
define linkonce_odr protected float @__nv_atanhf(float noundef %0) local_unnamed_addr #5 {
  %2 = tail call float @__ocml_atanh_f32(float noundef %0) #11
  ret float %2
}

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare float @__ocml_atanh_f32(float noundef) local_unnamed_addr #3

; Function Attrs: alwaysinline convergent mustprogress nofree norecurse nounwind readnone willreturn
define linkonce_odr protected double @__nv_cbrt(double noundef %0) local_unnamed_addr #5 {
  %2 = tail call double @__ocml_cbrt_f64(double noundef %0) #11
  ret double %2
}

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare double @__ocml_cbrt_f64(double noundef) local_unnamed_addr #3

; Function Attrs: alwaysinline convergent mustprogress nofree norecurse nounwind readnone willreturn
define linkonce_odr protected float @__nv_cbrtf(float noundef %0) local_unnamed_addr #5 {
  %2 = tail call float @__ocml_cbrt_f32(float noundef %0) #11
  ret float %2
}

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare float @__ocml_cbrt_f32(float noundef) local_unnamed_addr #3

; Function Attrs: alwaysinline convergent mustprogress nofree norecurse nounwind readnone willreturn
define linkonce_odr protected double @__nv_ceil(double noundef %0) local_unnamed_addr #5 {
  %2 = tail call double @__ocml_ceil_f64(double noundef %0) #11
  ret double %2
}

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare double @__ocml_ceil_f64(double noundef) local_unnamed_addr #3

; Function Attrs: alwaysinline convergent mustprogress nofree norecurse nounwind readnone willreturn
define linkonce_odr protected float @__nv_ceilf(float noundef %0) local_unnamed_addr #5 {
  %2 = tail call float @__ocml_ceil_f32(float noundef %0) #11
  ret float %2
}

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare float @__ocml_ceil_f32(float noundef) local_unnamed_addr #3

; Function Attrs: alwaysinline convergent mustprogress nofree norecurse nounwind readnone willreturn
define linkonce_odr protected double @__nv_copysign(double noundef %0, double noundef %1) local_unnamed_addr #5 {
  %3 = tail call double @__ocml_copysign_f64(double noundef %0, double noundef %1) #11
  ret double %3
}

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare double @__ocml_copysign_f64(double noundef, double noundef) local_unnamed_addr #3

; Function Attrs: alwaysinline convergent mustprogress nofree norecurse nounwind readnone willreturn
define linkonce_odr protected float @__nv_copysignf(float noundef %0, float noundef %1) local_unnamed_addr #5 {
  %3 = tail call float @__ocml_copysign_f32(float noundef %0, float noundef %1) #11
  ret float %3
}

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare float @__ocml_copysign_f32(float noundef, float noundef) local_unnamed_addr #3

; Function Attrs: alwaysinline convergent mustprogress nofree norecurse nounwind readnone willreturn
define linkonce_odr protected double @__nv_cos(double noundef %0) local_unnamed_addr #5 {
  %2 = tail call double @__ocml_cos_f64(double noundef %0) #11
  ret double %2
}

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare double @__ocml_cos_f64(double noundef) local_unnamed_addr #3

; Function Attrs: alwaysinline convergent norecurse nounwind
define linkonce_odr protected float @__nv_cosf(float noundef %0) local_unnamed_addr #6 {
  %2 = tail call float @__ocml_cos_f32(float noundef %0) #13
  ret float %2
}

; Function Attrs: convergent
declare float @__ocml_cos_f32(float noundef) local_unnamed_addr #7

; Function Attrs: alwaysinline convergent mustprogress nofree norecurse nounwind readnone willreturn
define linkonce_odr protected double @__nv_cosh(double noundef %0) local_unnamed_addr #5 {
  %2 = tail call double @__ocml_cosh_f64(double noundef %0) #11
  ret double %2
}

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare double @__ocml_cosh_f64(double noundef) local_unnamed_addr #3

; Function Attrs: alwaysinline convergent mustprogress nofree norecurse nounwind readnone willreturn
define linkonce_odr protected float @__nv_coshf(float noundef %0) local_unnamed_addr #5 {
  %2 = tail call float @__ocml_cosh_f32(float noundef %0) #11
  ret float %2
}

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare float @__ocml_cosh_f32(float noundef) local_unnamed_addr #3

; Function Attrs: alwaysinline convergent mustprogress nofree norecurse nounwind readnone willreturn
define linkonce_odr protected double @__nv_cospi(double noundef %0) local_unnamed_addr #5 {
  %2 = tail call double @__ocml_cospi_f64(double noundef %0) #11
  ret double %2
}

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare double @__ocml_cospi_f64(double noundef) local_unnamed_addr #3

; Function Attrs: alwaysinline convergent norecurse nounwind
define linkonce_odr protected float @__nv_cospif(float noundef %0) local_unnamed_addr #6 {
  %2 = tail call float @__ocml_cospi_f32(float noundef %0) #13
  ret float %2
}

; Function Attrs: convergent
declare float @__ocml_cospi_f32(float noundef) local_unnamed_addr #7

; Function Attrs: alwaysinline convergent mustprogress nofree norecurse nounwind readnone willreturn
define linkonce_odr protected double @__nv_erf(double noundef %0) local_unnamed_addr #5 {
  %2 = tail call double @__ocml_erf_f64(double noundef %0) #11
  ret double %2
}

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare double @__ocml_erf_f64(double noundef) local_unnamed_addr #3

; Function Attrs: alwaysinline convergent mustprogress nofree norecurse nounwind readnone willreturn
define linkonce_odr protected float @__nv_erff(float noundef %0) local_unnamed_addr #5 {
  %2 = tail call float @__ocml_erf_f32(float noundef %0) #11
  ret float %2
}

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare float @__ocml_erf_f32(float noundef) local_unnamed_addr #3

; Function Attrs: alwaysinline convergent mustprogress nofree norecurse nounwind readnone willreturn
define linkonce_odr protected double @__nv_erfc(double noundef %0) local_unnamed_addr #5 {
  %2 = tail call double @__ocml_erfc_f64(double noundef %0) #11
  ret double %2
}

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare double @__ocml_erfc_f64(double noundef) local_unnamed_addr #3

; Function Attrs: alwaysinline convergent mustprogress nofree norecurse nounwind readnone willreturn
define linkonce_odr protected float @__nv_erfcf(float noundef %0) local_unnamed_addr #5 {
  %2 = tail call float @__ocml_erfc_f32(float noundef %0) #11
  ret float %2
}

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare float @__ocml_erfc_f32(float noundef) local_unnamed_addr #3

; Function Attrs: alwaysinline convergent mustprogress nofree norecurse nounwind readnone willreturn
define linkonce_odr protected double @__nv_erfcinv(double noundef %0) local_unnamed_addr #5 {
  %2 = tail call double @__ocml_erfcinv_f64(double noundef %0) #11
  ret double %2
}

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare double @__ocml_erfcinv_f64(double noundef) local_unnamed_addr #3

; Function Attrs: alwaysinline convergent mustprogress nofree norecurse nounwind readnone willreturn
define linkonce_odr protected float @__nv_erfcinvf(float noundef %0) local_unnamed_addr #5 {
  %2 = tail call float @__ocml_erfcinv_f32(float noundef %0) #11
  ret float %2
}

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare float @__ocml_erfcinv_f32(float noundef) local_unnamed_addr #3

; Function Attrs: alwaysinline convergent mustprogress nofree norecurse nounwind readnone willreturn
define linkonce_odr protected double @__nv_erfcx(double noundef %0) local_unnamed_addr #5 {
  %2 = tail call double @__ocml_erfcx_f64(double noundef %0) #11
  ret double %2
}

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare double @__ocml_erfcx_f64(double noundef) local_unnamed_addr #3

; Function Attrs: alwaysinline convergent mustprogress nofree norecurse nounwind readnone willreturn
define linkonce_odr protected float @__nv_erfcxf(float noundef %0) local_unnamed_addr #5 {
  %2 = tail call float @__ocml_erfcx_f32(float noundef %0) #11
  ret float %2
}

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare float @__ocml_erfcx_f32(float noundef) local_unnamed_addr #3

; Function Attrs: alwaysinline convergent mustprogress nofree norecurse nounwind readnone willreturn
define linkonce_odr protected double @__nv_erfinv(double noundef %0) local_unnamed_addr #5 {
  %2 = tail call double @__ocml_erfinv_f64(double noundef %0) #11
  ret double %2
}

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare double @__ocml_erfinv_f64(double noundef) local_unnamed_addr #3

; Function Attrs: alwaysinline convergent mustprogress nofree norecurse nounwind readnone willreturn
define linkonce_odr protected float @__nv_erfinvf(float noundef %0) local_unnamed_addr #5 {
  %2 = tail call float @__ocml_erfinv_f32(float noundef %0) #11
  ret float %2
}

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare float @__ocml_erfinv_f32(float noundef) local_unnamed_addr #3

; Function Attrs: alwaysinline convergent mustprogress nofree norecurse nounwind readnone willreturn
define linkonce_odr protected double @__nv_exp(double noundef %0) local_unnamed_addr #5 {
  %2 = tail call double @__ocml_exp_f64(double noundef %0) #11
  ret double %2
}

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare double @__ocml_exp_f64(double noundef) local_unnamed_addr #3

; Function Attrs: alwaysinline convergent mustprogress nofree norecurse nounwind readnone willreturn
define linkonce_odr protected float @__nv_expf(float noundef %0) local_unnamed_addr #5 {
  %2 = tail call float @__ocml_exp_f32(float noundef %0) #11
  ret float %2
}

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare float @__ocml_exp_f32(float noundef) local_unnamed_addr #3

; Function Attrs: alwaysinline convergent mustprogress nofree norecurse nounwind readnone willreturn
define linkonce_odr protected double @__nv_exp10(double noundef %0) local_unnamed_addr #5 {
  %2 = tail call double @__ocml_exp10_f64(double noundef %0) #11
  ret double %2
}

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare double @__ocml_exp10_f64(double noundef) local_unnamed_addr #3

; Function Attrs: alwaysinline convergent mustprogress nofree norecurse nounwind readnone willreturn
define linkonce_odr protected float @__nv_exp10f(float noundef %0) local_unnamed_addr #5 {
  %2 = tail call float @__ocml_exp10_f32(float noundef %0) #11
  ret float %2
}

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare float @__ocml_exp10_f32(float noundef) local_unnamed_addr #3

; Function Attrs: alwaysinline convergent mustprogress nofree norecurse nounwind readnone willreturn
define linkonce_odr protected double @__nv_exp2(double noundef %0) local_unnamed_addr #5 {
  %2 = tail call double @__ocml_exp2_f64(double noundef %0) #11
  ret double %2
}

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare double @__ocml_exp2_f64(double noundef) local_unnamed_addr #3

; Function Attrs: alwaysinline convergent mustprogress nofree norecurse nounwind readnone willreturn
define linkonce_odr protected float @__nv_exp2f(float noundef %0) local_unnamed_addr #5 {
  %2 = tail call float @__ocml_exp2_f32(float noundef %0) #11
  ret float %2
}

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare float @__ocml_exp2_f32(float noundef) local_unnamed_addr #3

; Function Attrs: alwaysinline convergent mustprogress nofree norecurse nounwind readnone willreturn
define linkonce_odr protected double @__nv_expm1(double noundef %0) local_unnamed_addr #5 {
  %2 = tail call double @__ocml_expm1_f64(double noundef %0) #11
  ret double %2
}

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare double @__ocml_expm1_f64(double noundef) local_unnamed_addr #3

; Function Attrs: alwaysinline convergent mustprogress nofree norecurse nounwind readnone willreturn
define linkonce_odr protected float @__nv_expm1f(float noundef %0) local_unnamed_addr #5 {
  %2 = tail call float @__ocml_expm1_f32(float noundef %0) #11
  ret float %2
}

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare float @__ocml_expm1_f32(float noundef) local_unnamed_addr #3

; Function Attrs: alwaysinline convergent mustprogress nofree norecurse nounwind readnone willreturn
define linkonce_odr protected double @__nv_fabs(double noundef %0) local_unnamed_addr #5 {
  %2 = tail call double @__ocml_fabs_f64(double noundef %0) #11
  ret double %2
}

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare double @__ocml_fabs_f64(double noundef) local_unnamed_addr #3

; Function Attrs: alwaysinline convergent mustprogress nofree norecurse nounwind readnone willreturn
define linkonce_odr protected float @__nv_fabsf(float noundef %0) local_unnamed_addr #5 {
  %2 = tail call float @__ocml_fabs_f32(float noundef %0) #11
  ret float %2
}

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare float @__ocml_fabs_f32(float noundef) local_unnamed_addr #3

; Function Attrs: alwaysinline convergent mustprogress nofree norecurse nounwind readnone willreturn
define linkonce_odr protected double @__nv_fdim(double noundef %0, double noundef %1) local_unnamed_addr #5 {
  %3 = tail call double @__ocml_fdim_f64(double noundef %0, double noundef %1) #11
  ret double %3
}

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare double @__ocml_fdim_f64(double noundef, double noundef) local_unnamed_addr #3

; Function Attrs: alwaysinline convergent mustprogress nofree norecurse nounwind readnone willreturn
define linkonce_odr protected float @__nv_fdimf(float noundef %0, float noundef %1) local_unnamed_addr #5 {
  %3 = tail call float @__ocml_fdim_f32(float noundef %0, float noundef %1) #11
  ret float %3
}

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare float @__ocml_fdim_f32(float noundef, float noundef) local_unnamed_addr #3

; Function Attrs: alwaysinline convergent mustprogress nofree norecurse nounwind readnone willreturn
define linkonce_odr protected double @__nv_floor(double noundef %0) local_unnamed_addr #5 {
  %2 = tail call double @__ocml_floor_f64(double noundef %0) #11
  ret double %2
}

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare double @__ocml_floor_f64(double noundef) local_unnamed_addr #3

; Function Attrs: alwaysinline convergent mustprogress nofree norecurse nounwind readnone willreturn
define linkonce_odr protected float @__nv_floorf(float noundef %0) local_unnamed_addr #5 {
  %2 = tail call float @__ocml_floor_f32(float noundef %0) #11
  ret float %2
}

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare float @__ocml_floor_f32(float noundef) local_unnamed_addr #3

; Function Attrs: alwaysinline convergent mustprogress nofree norecurse nounwind readnone willreturn
define linkonce_odr protected double @__nv_fma(double noundef %0, double noundef %1, double noundef %2) local_unnamed_addr #5 {
  %4 = tail call double @__ocml_fma_f64(double noundef %0, double noundef %1, double noundef %2) #11
  ret double %4
}

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare double @__ocml_fma_f64(double noundef, double noundef, double noundef) local_unnamed_addr #3

; Function Attrs: alwaysinline convergent mustprogress nofree norecurse nounwind readnone willreturn
define linkonce_odr protected float @__nv_fmaf(float noundef %0, float noundef %1, float noundef %2) local_unnamed_addr #5 {
  %4 = tail call float @__ocml_fma_f32(float noundef %0, float noundef %1, float noundef %2) #11
  ret float %4
}

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare float @__ocml_fma_f32(float noundef, float noundef, float noundef) local_unnamed_addr #3

; Function Attrs: alwaysinline convergent mustprogress nofree norecurse nounwind readnone willreturn
define linkonce_odr protected double @__nv_fmax(double noundef %0, double noundef %1) local_unnamed_addr #5 {
  %3 = tail call double @__ocml_fmax_f64(double noundef %0, double noundef %1) #11
  ret double %3
}

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare double @__ocml_fmax_f64(double noundef, double noundef) local_unnamed_addr #3

; Function Attrs: alwaysinline convergent mustprogress nofree norecurse nounwind readnone willreturn
define linkonce_odr protected float @__nv_fmaxf(float noundef %0, float noundef %1) local_unnamed_addr #5 {
  %3 = tail call float @__ocml_fmax_f32(float noundef %0, float noundef %1) #11
  ret float %3
}

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare float @__ocml_fmax_f32(float noundef, float noundef) local_unnamed_addr #3

; Function Attrs: alwaysinline convergent mustprogress nofree norecurse nounwind readnone willreturn
define linkonce_odr protected double @__nv_fmin(double noundef %0, double noundef %1) local_unnamed_addr #5 {
  %3 = tail call double @__ocml_fmin_f64(double noundef %0, double noundef %1) #11
  ret double %3
}

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare double @__ocml_fmin_f64(double noundef, double noundef) local_unnamed_addr #3

; Function Attrs: alwaysinline convergent mustprogress nofree norecurse nounwind readnone willreturn
define linkonce_odr protected float @__nv_fminf(float noundef %0, float noundef %1) local_unnamed_addr #5 {
  %3 = tail call float @__ocml_fmin_f32(float noundef %0, float noundef %1) #11
  ret float %3
}

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare float @__ocml_fmin_f32(float noundef, float noundef) local_unnamed_addr #3

; Function Attrs: alwaysinline convergent mustprogress nofree norecurse nounwind readnone willreturn
define linkonce_odr protected double @__nv_fmod(double noundef %0, double noundef %1) local_unnamed_addr #5 {
  %3 = tail call double @__ocml_fmod_f64(double noundef %0, double noundef %1) #11
  ret double %3
}

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare double @__ocml_fmod_f64(double noundef, double noundef) local_unnamed_addr #3

; Function Attrs: alwaysinline convergent mustprogress nofree norecurse nounwind readnone willreturn
define linkonce_odr protected float @__nv_fmodf(float noundef %0, float noundef %1) local_unnamed_addr #5 {
  %3 = tail call float @__ocml_fmod_f32(float noundef %0, float noundef %1) #11
  ret float %3
}

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare float @__ocml_fmod_f32(float noundef, float noundef) local_unnamed_addr #3

; Function Attrs: alwaysinline convergent mustprogress nofree norecurse nounwind readnone willreturn
define linkonce_odr protected double @__nv_hypot(double noundef %0, double noundef %1) local_unnamed_addr #5 {
  %3 = tail call double @__ocml_hypot_f64(double noundef %0, double noundef %1) #11
  ret double %3
}

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare double @__ocml_hypot_f64(double noundef, double noundef) local_unnamed_addr #3

; Function Attrs: alwaysinline convergent mustprogress nofree norecurse nounwind readnone willreturn
define linkonce_odr protected float @__nv_hypotf(float noundef %0, float noundef %1) local_unnamed_addr #5 {
  %3 = tail call float @__ocml_hypot_f32(float noundef %0, float noundef %1) #11
  ret float %3
}

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare float @__ocml_hypot_f32(float noundef, float noundef) local_unnamed_addr #3

; Function Attrs: alwaysinline convergent mustprogress nofree norecurse nounwind readnone willreturn
define linkonce_odr protected double @__nv_j0(double noundef %0) local_unnamed_addr #5 {
  %2 = tail call double @__ocml_j0_f64(double noundef %0) #11
  ret double %2
}

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare double @__ocml_j0_f64(double noundef) local_unnamed_addr #3

; Function Attrs: alwaysinline convergent mustprogress nofree norecurse nounwind readnone willreturn
define linkonce_odr protected float @__nv_j0f(float noundef %0) local_unnamed_addr #5 {
  %2 = tail call float @__ocml_j0_f32(float noundef %0) #11
  ret float %2
}

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare float @__ocml_j0_f32(float noundef) local_unnamed_addr #3

; Function Attrs: alwaysinline convergent mustprogress nofree norecurse nounwind readnone willreturn
define linkonce_odr protected double @__nv_j1(double noundef %0) local_unnamed_addr #5 {
  %2 = tail call double @__ocml_j1_f64(double noundef %0) #11
  ret double %2
}

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare double @__ocml_j1_f64(double noundef) local_unnamed_addr #3

; Function Attrs: alwaysinline convergent mustprogress nofree norecurse nounwind readnone willreturn
define linkonce_odr protected float @__nv_j1f(float noundef %0) local_unnamed_addr #5 {
  %2 = tail call float @__ocml_j1_f32(float noundef %0) #11
  ret float %2
}

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare float @__ocml_j1_f32(float noundef) local_unnamed_addr #3

; Function Attrs: alwaysinline convergent mustprogress nofree norecurse nounwind readnone willreturn
define linkonce_odr protected double @__nv_lgamma(double noundef %0) local_unnamed_addr #5 {
  %2 = tail call double @__ocml_lgamma_f64(double noundef %0) #11
  ret double %2
}

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare double @__ocml_lgamma_f64(double noundef) local_unnamed_addr #3

; Function Attrs: alwaysinline convergent mustprogress nofree norecurse nounwind readnone willreturn
define linkonce_odr protected float @__nv_lgammaf(float noundef %0) local_unnamed_addr #5 {
  %2 = tail call float @__ocml_lgamma_f32(float noundef %0) #11
  ret float %2
}

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare float @__ocml_lgamma_f32(float noundef) local_unnamed_addr #3

; Function Attrs: alwaysinline convergent mustprogress nofree norecurse nounwind readnone willreturn
define linkonce_odr protected double @__nv_log(double noundef %0) local_unnamed_addr #5 {
  %2 = tail call double @__ocml_log_f64(double noundef %0) #11
  ret double %2
}

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare double @__ocml_log_f64(double noundef) local_unnamed_addr #3

; Function Attrs: alwaysinline convergent mustprogress nofree norecurse nounwind readnone willreturn
define linkonce_odr protected float @__nv_logf(float noundef %0) local_unnamed_addr #5 {
  %2 = tail call float @__ocml_log_f32(float noundef %0) #11
  ret float %2
}

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare float @__ocml_log_f32(float noundef) local_unnamed_addr #3

; Function Attrs: alwaysinline convergent mustprogress nofree norecurse nounwind readnone willreturn
define linkonce_odr protected double @__nv_log10(double noundef %0) local_unnamed_addr #5 {
  %2 = tail call double @__ocml_log10_f64(double noundef %0) #11
  ret double %2
}

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare double @__ocml_log10_f64(double noundef) local_unnamed_addr #3

; Function Attrs: alwaysinline convergent mustprogress nofree norecurse nounwind readnone willreturn
define linkonce_odr protected float @__nv_log10f(float noundef %0) local_unnamed_addr #5 {
  %2 = tail call float @__ocml_log10_f32(float noundef %0) #11
  ret float %2
}

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare float @__ocml_log10_f32(float noundef) local_unnamed_addr #3

; Function Attrs: alwaysinline convergent mustprogress nofree norecurse nounwind readnone willreturn
define linkonce_odr protected double @__nv_log1p(double noundef %0) local_unnamed_addr #5 {
  %2 = tail call double @__ocml_log1p_f64(double noundef %0) #11
  ret double %2
}

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare double @__ocml_log1p_f64(double noundef) local_unnamed_addr #3

; Function Attrs: alwaysinline convergent mustprogress nofree norecurse nounwind readnone willreturn
define linkonce_odr protected float @__nv_log1pf(float noundef %0) local_unnamed_addr #5 {
  %2 = tail call float @__ocml_log1p_f32(float noundef %0) #11
  ret float %2
}

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare float @__ocml_log1p_f32(float noundef) local_unnamed_addr #3

; Function Attrs: alwaysinline convergent mustprogress nofree norecurse nounwind readnone willreturn
define linkonce_odr protected double @__nv_log2(double noundef %0) local_unnamed_addr #5 {
  %2 = tail call double @__ocml_log2_f64(double noundef %0) #11
  ret double %2
}

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare double @__ocml_log2_f64(double noundef) local_unnamed_addr #3

; Function Attrs: alwaysinline convergent mustprogress nofree norecurse nounwind readnone willreturn
define linkonce_odr protected float @__nv_log2f(float noundef %0) local_unnamed_addr #5 {
  %2 = tail call float @__ocml_log2_f32(float noundef %0) #11
  ret float %2
}

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare float @__ocml_log2_f32(float noundef) local_unnamed_addr #3

; Function Attrs: alwaysinline convergent mustprogress nofree norecurse nounwind readnone willreturn
define linkonce_odr protected double @__nv_logb(double noundef %0) local_unnamed_addr #5 {
  %2 = tail call double @__ocml_logb_f64(double noundef %0) #11
  ret double %2
}

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare double @__ocml_logb_f64(double noundef) local_unnamed_addr #3

; Function Attrs: alwaysinline convergent mustprogress nofree norecurse nounwind readnone willreturn
define linkonce_odr protected float @__nv_logbf(float noundef %0) local_unnamed_addr #5 {
  %2 = tail call float @__ocml_logb_f32(float noundef %0) #11
  ret float %2
}

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare float @__ocml_logb_f32(float noundef) local_unnamed_addr #3

; Function Attrs: alwaysinline convergent mustprogress nofree norecurse nounwind readnone willreturn
define linkonce_odr protected double @__nv_pow(double noundef %0, double noundef %1) local_unnamed_addr #5 {
  %3 = tail call double @__ocml_pow_f64(double noundef %0, double noundef %1) #11
  ret double %3
}

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare double @__ocml_pow_f64(double noundef, double noundef) local_unnamed_addr #3

; Function Attrs: alwaysinline convergent mustprogress nofree norecurse nounwind readnone willreturn
define linkonce_odr protected float @__nv_powf(float noundef %0, float noundef %1) local_unnamed_addr #5 {
  %3 = tail call float @__ocml_pow_f32(float noundef %0, float noundef %1) #11
  ret float %3
}

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare float @__ocml_pow_f32(float noundef, float noundef) local_unnamed_addr #3

; Function Attrs: alwaysinline convergent mustprogress nofree norecurse nounwind readnone willreturn
define linkonce_odr protected double @__nv_rcbrt(double noundef %0) local_unnamed_addr #5 {
  %2 = tail call double @__ocml_rcbrt_f64(double noundef %0) #11
  ret double %2
}

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare double @__ocml_rcbrt_f64(double noundef) local_unnamed_addr #3

; Function Attrs: alwaysinline convergent mustprogress nofree norecurse nounwind readnone willreturn
define linkonce_odr protected float @__nv_rcbrtf(float noundef %0) local_unnamed_addr #5 {
  %2 = tail call float @__ocml_rcbrt_f32(float noundef %0) #11
  ret float %2
}

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare float @__ocml_rcbrt_f32(float noundef) local_unnamed_addr #3

; Function Attrs: alwaysinline convergent mustprogress nofree norecurse nounwind readnone willreturn
define linkonce_odr protected double @__nv_remainder(double noundef %0, double noundef %1) local_unnamed_addr #5 {
  %3 = tail call double @__ocml_remainder_f64(double noundef %0, double noundef %1) #11
  ret double %3
}

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare double @__ocml_remainder_f64(double noundef, double noundef) local_unnamed_addr #3

; Function Attrs: alwaysinline convergent mustprogress nofree norecurse nounwind readnone willreturn
define linkonce_odr protected float @__nv_remainderf(float noundef %0, float noundef %1) local_unnamed_addr #5 {
  %3 = tail call float @__ocml_remainder_f32(float noundef %0, float noundef %1) #11
  ret float %3
}

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare float @__ocml_remainder_f32(float noundef, float noundef) local_unnamed_addr #3

; Function Attrs: alwaysinline convergent mustprogress nofree norecurse nounwind readnone willreturn
define linkonce_odr protected double @__nv_rhypot(double noundef %0, double noundef %1) local_unnamed_addr #5 {
  %3 = tail call double @__ocml_rhypot_f64(double noundef %0, double noundef %1) #11
  ret double %3
}

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare double @__ocml_rhypot_f64(double noundef, double noundef) local_unnamed_addr #3

; Function Attrs: alwaysinline convergent mustprogress nofree norecurse nounwind readnone willreturn
define linkonce_odr protected float @__nv_rhypotf(float noundef %0, float noundef %1) local_unnamed_addr #5 {
  %3 = tail call float @__ocml_rhypot_f32(float noundef %0, float noundef %1) #11
  ret float %3
}

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare float @__ocml_rhypot_f32(float noundef, float noundef) local_unnamed_addr #3

; Function Attrs: alwaysinline convergent mustprogress nofree norecurse nounwind readnone willreturn
define linkonce_odr protected double @__nv_nearbyint(double noundef %0) local_unnamed_addr #5 {
  %2 = tail call double @__ocml_nearbyint_f64(double noundef %0) #11
  ret double %2
}

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare double @__ocml_nearbyint_f64(double noundef) local_unnamed_addr #3

; Function Attrs: alwaysinline convergent mustprogress nofree norecurse nounwind readnone willreturn
define linkonce_odr protected float @__nv_nearbyintf(float noundef %0) local_unnamed_addr #5 {
  %2 = tail call float @__ocml_nearbyint_f32(float noundef %0) #11
  ret float %2
}

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare float @__ocml_nearbyint_f32(float noundef) local_unnamed_addr #3

; Function Attrs: alwaysinline convergent mustprogress nofree norecurse nounwind readnone willreturn
define linkonce_odr protected double @__nv_nextafter(double noundef %0, double noundef %1) local_unnamed_addr #5 {
  %3 = tail call double @__ocml_nextafter_f64(double noundef %0, double noundef %1) #11
  ret double %3
}

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare double @__ocml_nextafter_f64(double noundef, double noundef) local_unnamed_addr #3

; Function Attrs: alwaysinline convergent mustprogress nofree norecurse nounwind readnone willreturn
define linkonce_odr protected float @__nv_nextafterf(float noundef %0, float noundef %1) local_unnamed_addr #5 {
  %3 = tail call float @__ocml_nextafter_f32(float noundef %0, float noundef %1) #11
  ret float %3
}

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare float @__ocml_nextafter_f32(float noundef, float noundef) local_unnamed_addr #3

; Function Attrs: alwaysinline convergent mustprogress nofree norecurse nounwind readnone willreturn
define linkonce_odr protected double @__nv_rint(double noundef %0) local_unnamed_addr #5 {
  %2 = tail call double @__ocml_rint_f64(double noundef %0) #11
  ret double %2
}

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare double @__ocml_rint_f64(double noundef) local_unnamed_addr #3

; Function Attrs: alwaysinline convergent mustprogress nofree norecurse nounwind readnone willreturn
define linkonce_odr protected float @__nv_rintf(float noundef %0) local_unnamed_addr #5 {
  %2 = tail call float @__ocml_rint_f32(float noundef %0) #11
  ret float %2
}

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare float @__ocml_rint_f32(float noundef) local_unnamed_addr #3

; Function Attrs: alwaysinline convergent mustprogress nofree norecurse nounwind readnone willreturn
define linkonce_odr protected double @__nv_round(double noundef %0) local_unnamed_addr #5 {
  %2 = tail call double @__ocml_round_f64(double noundef %0) #11
  ret double %2
}

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare double @__ocml_round_f64(double noundef) local_unnamed_addr #3

; Function Attrs: alwaysinline convergent mustprogress nofree norecurse nounwind readnone willreturn
define linkonce_odr protected float @__nv_roundf(float noundef %0) local_unnamed_addr #5 {
  %2 = tail call float @__ocml_round_f32(float noundef %0) #11
  ret float %2
}

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare float @__ocml_round_f32(float noundef) local_unnamed_addr #3

; Function Attrs: alwaysinline convergent mustprogress nofree norecurse nounwind readnone willreturn
define linkonce_odr protected double @__nv_rsqrt(double noundef %0) local_unnamed_addr #5 {
  %2 = tail call double @__ocml_rsqrt_f64(double noundef %0) #11
  ret double %2
}

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare double @__ocml_rsqrt_f64(double noundef) local_unnamed_addr #3

; Function Attrs: alwaysinline convergent mustprogress nofree norecurse nounwind readnone willreturn
define linkonce_odr protected float @__nv_rsqrtf(float noundef %0) local_unnamed_addr #5 {
  %2 = tail call float @__ocml_rsqrt_f32(float noundef %0) #11
  ret float %2
}

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare float @__ocml_rsqrt_f32(float noundef) local_unnamed_addr #3

; Function Attrs: alwaysinline convergent mustprogress nofree norecurse nounwind readnone willreturn
define linkonce_odr protected double @__nv_scalbn(double noundef %0, double noundef %1) local_unnamed_addr #5 {
  %3 = fptosi double %1 to i32
  %4 = tail call double @__ocml_scalbn_f64(double noundef %0, i32 noundef %3) #11
  ret double %4
}

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare double @__ocml_scalbn_f64(double noundef, i32 noundef) local_unnamed_addr #3

; Function Attrs: alwaysinline convergent mustprogress nofree norecurse nounwind readnone willreturn
define linkonce_odr protected float @__nv_scalbnf(float noundef %0, float noundef %1) local_unnamed_addr #5 {
  %3 = fptosi float %1 to i32
  %4 = tail call float @__ocml_scalbn_f32(float noundef %0, i32 noundef %3) #11
  ret float %4
}

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare float @__ocml_scalbn_f32(float noundef, i32 noundef) local_unnamed_addr #3

; Function Attrs: alwaysinline convergent mustprogress nofree norecurse nounwind readnone willreturn
define linkonce_odr protected double @__nv_sin(double noundef %0) local_unnamed_addr #5 {
  %2 = tail call double @__ocml_sin_f64(double noundef %0) #11
  ret double %2
}

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare double @__ocml_sin_f64(double noundef) local_unnamed_addr #3

; Function Attrs: alwaysinline convergent mustprogress nofree norecurse nounwind readnone willreturn
define linkonce_odr protected float @__nv_sinf(float noundef %0) local_unnamed_addr #5 {
  %2 = tail call float @__ocml_sin_f32(float noundef %0) #11
  ret float %2
}

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare float @__ocml_sin_f32(float noundef) local_unnamed_addr #3

; Function Attrs: alwaysinline convergent mustprogress nofree norecurse nounwind readnone willreturn
define linkonce_odr protected double @__nv_sinh(double noundef %0) local_unnamed_addr #5 {
  %2 = tail call double @__ocml_sinh_f64(double noundef %0) #11
  ret double %2
}

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare double @__ocml_sinh_f64(double noundef) local_unnamed_addr #3

; Function Attrs: alwaysinline convergent mustprogress nofree norecurse nounwind readnone willreturn
define linkonce_odr protected float @__nv_sinhf(float noundef %0) local_unnamed_addr #5 {
  %2 = tail call float @__ocml_sinh_f32(float noundef %0) #11
  ret float %2
}

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare float @__ocml_sinh_f32(float noundef) local_unnamed_addr #3

; Function Attrs: alwaysinline convergent mustprogress nofree norecurse nounwind readnone willreturn
define linkonce_odr protected double @__nv_sinpi(double noundef %0) local_unnamed_addr #5 {
  %2 = tail call double @__ocml_sinpi_f64(double noundef %0) #11
  ret double %2
}

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare double @__ocml_sinpi_f64(double noundef) local_unnamed_addr #3

; Function Attrs: alwaysinline convergent mustprogress nofree norecurse nounwind readnone willreturn
define linkonce_odr protected float @__nv_sinpif(float noundef %0) local_unnamed_addr #5 {
  %2 = tail call float @__ocml_sinpi_f32(float noundef %0) #11
  ret float %2
}

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare float @__ocml_sinpi_f32(float noundef) local_unnamed_addr #3

; Function Attrs: alwaysinline convergent mustprogress nofree norecurse nounwind readnone willreturn
define linkonce_odr protected double @__nv_sqrt(double noundef %0) local_unnamed_addr #5 {
  %2 = tail call double @__ocml_sqrt_f64(double noundef %0) #11
  ret double %2
}

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare double @__ocml_sqrt_f64(double noundef) local_unnamed_addr #3

; Function Attrs: alwaysinline convergent mustprogress nofree norecurse nounwind readnone willreturn
define linkonce_odr protected float @__nv_sqrtf(float noundef %0) local_unnamed_addr #5 {
  %2 = tail call float @__ocml_sqrt_f32(float noundef %0) #11
  ret float %2
}

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare float @__ocml_sqrt_f32(float noundef) local_unnamed_addr #3

; Function Attrs: alwaysinline convergent mustprogress nofree norecurse nounwind readnone willreturn
define linkonce_odr protected double @__nv_tan(double noundef %0) local_unnamed_addr #5 {
  %2 = tail call double @__ocml_tan_f64(double noundef %0) #11
  ret double %2
}

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare double @__ocml_tan_f64(double noundef) local_unnamed_addr #3

; Function Attrs: alwaysinline convergent norecurse nounwind
define linkonce_odr protected float @__nv_tanf(float noundef %0) local_unnamed_addr #6 {
  %2 = tail call float @__ocml_tan_f32(float noundef %0) #13
  ret float %2
}

; Function Attrs: convergent
declare float @__ocml_tan_f32(float noundef) local_unnamed_addr #7

; Function Attrs: alwaysinline convergent mustprogress nofree norecurse nounwind readnone willreturn
define linkonce_odr protected double @__nv_tanh(double noundef %0) local_unnamed_addr #5 {
  %2 = tail call double @__ocml_tanh_f64(double noundef %0) #11
  ret double %2
}

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare double @__ocml_tanh_f64(double noundef) local_unnamed_addr #3

; Function Attrs: alwaysinline convergent mustprogress nofree norecurse nounwind readnone willreturn
define linkonce_odr protected float @__nv_tanhf(float noundef %0) local_unnamed_addr #5 {
  %2 = tail call float @__ocml_tanh_f32(float noundef %0) #11
  ret float %2
}

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare float @__ocml_tanh_f32(float noundef) local_unnamed_addr #3

; Function Attrs: alwaysinline convergent mustprogress nofree norecurse nounwind readnone willreturn
define linkonce_odr protected double @__nv_tgamma(double noundef %0) local_unnamed_addr #5 {
  %2 = tail call double @__ocml_tgamma_f64(double noundef %0) #11
  ret double %2
}

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare double @__ocml_tgamma_f64(double noundef) local_unnamed_addr #3

; Function Attrs: alwaysinline convergent mustprogress nofree norecurse nounwind readnone willreturn
define linkonce_odr protected float @__nv_tgammaf(float noundef %0) local_unnamed_addr #5 {
  %2 = tail call float @__ocml_tgamma_f32(float noundef %0) #11
  ret float %2
}

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare float @__ocml_tgamma_f32(float noundef) local_unnamed_addr #3

; Function Attrs: alwaysinline convergent mustprogress nofree norecurse nounwind readnone willreturn
define linkonce_odr protected double @__nv_trunc(double noundef %0) local_unnamed_addr #5 {
  %2 = tail call double @__ocml_trunc_f64(double noundef %0) #11
  ret double %2
}

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare double @__ocml_trunc_f64(double noundef) local_unnamed_addr #3

; Function Attrs: alwaysinline convergent mustprogress nofree norecurse nounwind readnone willreturn
define linkonce_odr protected float @__nv_truncf(float noundef %0) local_unnamed_addr #5 {
  %2 = tail call float @__ocml_trunc_f32(float noundef %0) #11
  ret float %2
}

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare float @__ocml_trunc_f32(float noundef) local_unnamed_addr #3

; Function Attrs: alwaysinline convergent mustprogress nofree norecurse nounwind readnone willreturn
define linkonce_odr protected double @__nv_y0(double noundef %0) local_unnamed_addr #5 {
  %2 = tail call double @__ocml_y0_f64(double noundef %0) #11
  ret double %2
}

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare double @__ocml_y0_f64(double noundef) local_unnamed_addr #3

; Function Attrs: alwaysinline convergent mustprogress nofree norecurse nounwind readnone willreturn
define linkonce_odr protected float @__nv_y0f(float noundef %0) local_unnamed_addr #5 {
  %2 = tail call float @__ocml_y0_f32(float noundef %0) #11
  ret float %2
}

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare float @__ocml_y0_f32(float noundef) local_unnamed_addr #3

; Function Attrs: alwaysinline convergent mustprogress nofree norecurse nounwind readnone willreturn
define linkonce_odr protected double @__nv_y1(double noundef %0) local_unnamed_addr #5 {
  %2 = tail call double @__ocml_y1_f64(double noundef %0) #11
  ret double %2
}

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare double @__ocml_y1_f64(double noundef) local_unnamed_addr #3

; Function Attrs: alwaysinline convergent mustprogress nofree norecurse nounwind readnone willreturn
define linkonce_odr protected float @__nv_y1f(float noundef %0) local_unnamed_addr #5 {
  %2 = tail call float @__ocml_y1_f32(float noundef %0) #11
  ret float %2
}

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare float @__ocml_y1_f32(float noundef) local_unnamed_addr #3

; Function Attrs: alwaysinline convergent mustprogress nofree norecurse nounwind readnone willreturn
define linkonce_odr protected double @__nv_cyl_bessel_i0(double noundef %0) local_unnamed_addr #5 {
  %2 = tail call double @__ocml_i0_f64(double noundef %0) #11
  ret double %2
}

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare double @__ocml_i0_f64(double noundef) local_unnamed_addr #3

; Function Attrs: alwaysinline convergent mustprogress nofree norecurse nounwind readnone willreturn
define linkonce_odr protected float @__nv_cyl_bessel_i0f(float noundef %0) local_unnamed_addr #5 {
  %2 = tail call float @__ocml_i0_f32(float noundef %0) #11
  ret float %2
}

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare float @__ocml_i0_f32(float noundef) local_unnamed_addr #3

; Function Attrs: alwaysinline convergent mustprogress nofree norecurse nounwind readnone willreturn
define linkonce_odr protected double @__nv_cyl_bessel_i1(double noundef %0) local_unnamed_addr #5 {
  %2 = tail call double @__ocml_i1_f64(double noundef %0) #11
  ret double %2
}

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare double @__ocml_i1_f64(double noundef) local_unnamed_addr #3

; Function Attrs: alwaysinline convergent mustprogress nofree norecurse nounwind readnone willreturn
define linkonce_odr protected float @__nv_cyl_bessel_i1f(float noundef %0) local_unnamed_addr #5 {
  %2 = tail call float @__ocml_i1_f32(float noundef %0) #11
  ret float %2
}

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare float @__ocml_i1_f32(float noundef) local_unnamed_addr #3

; Function Attrs: alwaysinline convergent norecurse nounwind
define linkonce_odr protected double @__nv_frexp(double noundef %0, ptr addrspace(5) noundef %1) local_unnamed_addr #6 {
  %3 = tail call double @__ocml_frexp_f64(double noundef %0, ptr addrspace(5) noundef %1) #13
  ret double %3
}

; Function Attrs: convergent
declare double @__ocml_frexp_f64(double noundef, ptr addrspace(5) noundef) local_unnamed_addr #7

; Function Attrs: alwaysinline convergent norecurse nounwind
define linkonce_odr protected float @__nv_frexpf(float noundef %0, ptr addrspace(5) noundef %1) local_unnamed_addr #6 {
  %3 = tail call float @__ocml_frexp_f32(float noundef %0, ptr addrspace(5) noundef %1) #13
  ret float %3
}

; Function Attrs: convergent
declare float @__ocml_frexp_f32(float noundef, ptr addrspace(5) noundef) local_unnamed_addr #7

; Function Attrs: alwaysinline convergent mustprogress nofree norecurse nounwind readnone willreturn
define linkonce_odr protected i32 @__nv_ilogb(double noundef %0) local_unnamed_addr #5 {
  %2 = tail call i32 @__ocml_ilogb_f64(double noundef %0) #11
  ret i32 %2
}

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare i32 @__ocml_ilogb_f64(double noundef) local_unnamed_addr #3

; Function Attrs: alwaysinline convergent mustprogress nofree norecurse nounwind readnone willreturn
define linkonce_odr protected i32 @__nv_ilogbf(float noundef %0) local_unnamed_addr #5 {
  %2 = tail call i32 @__ocml_ilogb_f32(float noundef %0) #11
  ret i32 %2
}

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare i32 @__ocml_ilogb_f32(float noundef) local_unnamed_addr #3

; Function Attrs: alwaysinline convergent mustprogress nofree norecurse nounwind readnone willreturn
define linkonce_odr protected double @__nv_ldexp(double noundef %0, i32 noundef %1) local_unnamed_addr #5 {
  %3 = tail call double @__ocml_ldexp_f64(double noundef %0, i32 noundef %1) #11
  ret double %3
}

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare double @__ocml_ldexp_f64(double noundef, i32 noundef) local_unnamed_addr #3

; Function Attrs: alwaysinline convergent mustprogress nofree norecurse nounwind readnone willreturn
define linkonce_odr protected float @__nv_ldexpf(float noundef %0, i32 noundef %1) local_unnamed_addr #5 {
  %3 = tail call float @__ocml_ldexp_f32(float noundef %0, i32 noundef %1) #11
  ret float %3
}

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare float @__ocml_ldexp_f32(float noundef, i32 noundef) local_unnamed_addr #3

; Function Attrs: alwaysinline convergent norecurse nounwind
define linkonce_odr protected double @__nv_modf(double noundef %0, ptr addrspace(5) noundef %1) local_unnamed_addr #6 {
  %3 = tail call double @__ocml_modf_f64(double noundef %0, ptr addrspace(5) noundef %1) #13
  ret double %3
}

; Function Attrs: convergent
declare double @__ocml_modf_f64(double noundef, ptr addrspace(5) noundef) local_unnamed_addr #7

; Function Attrs: alwaysinline convergent norecurse nounwind
define linkonce_odr protected float @__nv_modff(float noundef %0, ptr addrspace(5) noundef %1) local_unnamed_addr #6 {
  %3 = tail call float @__ocml_modf_f32(float noundef %0, ptr addrspace(5) noundef %1) #13
  ret float %3
}

; Function Attrs: convergent
declare float @__ocml_modf_f32(float noundef, ptr addrspace(5) noundef) local_unnamed_addr #7

; Function Attrs: alwaysinline convergent mustprogress nofree norecurse nounwind readnone willreturn
define linkonce_odr protected double @__nv_norm3d(double noundef %0, double noundef %1, double noundef %2) local_unnamed_addr #5 {
  %4 = tail call double @__ocml_len3_f64(double noundef %0, double noundef %1, double noundef %2) #11
  ret double %4
}

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare double @__ocml_len3_f64(double noundef, double noundef, double noundef) local_unnamed_addr #3

; Function Attrs: alwaysinline convergent mustprogress nofree norecurse nounwind readnone willreturn
define linkonce_odr protected float @__nv_norm3df(float noundef %0, float noundef %1, float noundef %2) local_unnamed_addr #5 {
  %4 = tail call float @__ocml_len3_f32(float noundef %0, float noundef %1, float noundef %2) #11
  ret float %4
}

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare float @__ocml_len3_f32(float noundef, float noundef, float noundef) local_unnamed_addr #3

; Function Attrs: alwaysinline convergent mustprogress nofree norecurse nounwind readnone willreturn
define linkonce_odr protected double @__nv_norm4d(double noundef %0, double noundef %1, double noundef %2, double noundef %3) local_unnamed_addr #5 {
  %5 = tail call double @__ocml_len4_f64(double noundef %0, double noundef %1, double noundef %2, double noundef %3) #11
  ret double %5
}

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare double @__ocml_len4_f64(double noundef, double noundef, double noundef, double noundef) local_unnamed_addr #3

; Function Attrs: alwaysinline convergent mustprogress nofree norecurse nounwind readnone willreturn
define linkonce_odr protected float @__nv_norm4df(float noundef %0, float noundef %1, float noundef %2, float noundef %3) local_unnamed_addr #5 {
  %5 = tail call float @__ocml_len4_f32(float noundef %0, float noundef %1, float noundef %2, float noundef %3) #11
  ret float %5
}

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare float @__ocml_len4_f32(float noundef, float noundef, float noundef, float noundef) local_unnamed_addr #3

; Function Attrs: alwaysinline convergent mustprogress nofree norecurse nounwind readnone willreturn
define linkonce_odr protected double @__nv_normcdf(double noundef %0) local_unnamed_addr #5 {
  %2 = tail call double @__ocml_ncdf_f64(double noundef %0) #11
  ret double %2
}

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare double @__ocml_ncdf_f64(double noundef) local_unnamed_addr #3

; Function Attrs: alwaysinline convergent mustprogress nofree norecurse nounwind readnone willreturn
define linkonce_odr protected float @__nv_normcdff(float noundef %0) local_unnamed_addr #5 {
  %2 = tail call float @__ocml_ncdf_f32(float noundef %0) #11
  ret float %2
}

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare float @__ocml_ncdf_f32(float noundef) local_unnamed_addr #3

; Function Attrs: alwaysinline convergent mustprogress nofree norecurse nounwind readnone willreturn
define linkonce_odr protected double @__nv_normcdfinv(double noundef %0) local_unnamed_addr #5 {
  %2 = tail call double @__ocml_ncdfinv_f64(double noundef %0) #11
  ret double %2
}

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare double @__ocml_ncdfinv_f64(double noundef) local_unnamed_addr #3

; Function Attrs: alwaysinline convergent mustprogress nofree norecurse nounwind readnone willreturn
define linkonce_odr protected float @__nv_normcdfinvf(float noundef %0) local_unnamed_addr #5 {
  %2 = tail call float @__ocml_ncdfinv_f32(float noundef %0) #11
  ret float %2
}

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare float @__ocml_ncdfinv_f32(float noundef) local_unnamed_addr #3

; Function Attrs: alwaysinline convergent mustprogress nofree norecurse nounwind readonly willreturn
define linkonce_odr protected double @__nv_powi(double noundef %0, i32 noundef %1) local_unnamed_addr #8 {
  %3 = tail call double @__ocml_pown_f64(double noundef %0, i32 noundef %1) #12
  ret double %3
}

; Function Attrs: convergent mustprogress nofree nounwind readonly willreturn
declare double @__ocml_pown_f64(double noundef, i32 noundef) local_unnamed_addr #4

; Function Attrs: alwaysinline convergent mustprogress nofree norecurse nounwind readonly willreturn
define linkonce_odr protected float @__nv_powif(float noundef %0, i32 noundef %1) local_unnamed_addr #8 {
  %3 = tail call float @__ocml_pown_f32(float noundef %0, i32 noundef %1) #12
  ret float %3
}

; Function Attrs: convergent mustprogress nofree nounwind readonly willreturn
declare float @__ocml_pown_f32(float noundef, i32 noundef) local_unnamed_addr #4

; Function Attrs: alwaysinline convergent norecurse nounwind
define linkonce_odr protected double @__nv_remquo(double noundef %0, double noundef %1, ptr addrspace(5) noundef %2) local_unnamed_addr #6 {
  %4 = tail call double @__ocml_remquo_f64(double noundef %0, double noundef %1, ptr addrspace(5) noundef %2) #13
  ret double %4
}

; Function Attrs: convergent
declare double @__ocml_remquo_f64(double noundef, double noundef, ptr addrspace(5) noundef) local_unnamed_addr #7

; Function Attrs: alwaysinline convergent norecurse nounwind
define linkonce_odr protected float @__nv_remquof(float noundef %0, float noundef %1, ptr addrspace(5) noundef %2) local_unnamed_addr #6 {
  %4 = tail call float @__ocml_remquo_f32(float noundef %0, float noundef %1, ptr addrspace(5) noundef %2) #13
  ret float %4
}

; Function Attrs: convergent
declare float @__ocml_remquo_f32(float noundef, float noundef, ptr addrspace(5) noundef) local_unnamed_addr #7

; Function Attrs: alwaysinline convergent mustprogress nofree norecurse nounwind readnone willreturn
define linkonce_odr protected float @__nv_saturatef(float noundef %0) local_unnamed_addr #5 {
  %2 = tail call float @__ocml_max_f32(float noundef %0, float noundef 0.000000e+00) #11
  %3 = tail call float @__ocml_min_f32(float noundef %2, float noundef 1.000000e+00) #11
  ret float %3
}

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare float @__ocml_max_f32(float noundef, float noundef) local_unnamed_addr #3

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare float @__ocml_min_f32(float noundef, float noundef) local_unnamed_addr #3

; Function Attrs: alwaysinline convergent mustprogress nofree norecurse nounwind readnone willreturn
define linkonce_odr protected i32 @__nv_signbitd(double noundef %0) local_unnamed_addr #5 {
  %2 = tail call i32 @__ocml_signbit_f64(double noundef %0) #11
  ret i32 %2
}

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare i32 @__ocml_signbit_f64(double noundef) local_unnamed_addr #3

; Function Attrs: alwaysinline convergent mustprogress nofree norecurse nounwind readnone willreturn
define linkonce_odr protected i32 @__nv_signbitf(float noundef %0) local_unnamed_addr #5 {
  %2 = tail call i32 @__ocml_signbit_f32(float noundef %0) #11
  ret i32 %2
}

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare i32 @__ocml_signbit_f32(float noundef) local_unnamed_addr #3

; Function Attrs: alwaysinline convergent norecurse nounwind
define linkonce_odr protected void @__nv_sincos(double noundef %0, ptr addrspace(5) nocapture noundef writeonly %1, ptr addrspace(5) noundef %2) local_unnamed_addr #6 {
  %4 = tail call double @__ocml_sincos_f64(double noundef %0, ptr addrspace(5) noundef %2) #13
  store double %4, ptr addrspace(5) %1, align 8, !tbaa !4
  ret void
}

; Function Attrs: convergent
declare double @__ocml_sincos_f64(double noundef, ptr addrspace(5) noundef) local_unnamed_addr #7

; Function Attrs: alwaysinline convergent norecurse nounwind
define linkonce_odr protected void @__nv_sincosf(float noundef %0, ptr addrspace(5) nocapture noundef writeonly %1, ptr addrspace(5) noundef %2) local_unnamed_addr #6 {
  %4 = tail call float @__ocml_sincos_f32(float noundef %0, ptr addrspace(5) noundef %2) #13
  store float %4, ptr addrspace(5) %1, align 4, !tbaa !8
  ret void
}

; Function Attrs: convergent
declare float @__ocml_sincos_f32(float noundef, ptr addrspace(5) noundef) local_unnamed_addr #7

; Function Attrs: alwaysinline convergent norecurse nounwind
define linkonce_odr protected void @__nv_sincospi(double noundef %0, ptr addrspace(5) nocapture noundef writeonly %1, ptr addrspace(5) noundef %2) local_unnamed_addr #6 {
  %4 = tail call double @__ocml_sincospi_f64(double noundef %0, ptr addrspace(5) noundef %2) #13
  store double %4, ptr addrspace(5) %1, align 8, !tbaa !4
  ret void
}

; Function Attrs: convergent
declare double @__ocml_sincospi_f64(double noundef, ptr addrspace(5) noundef) local_unnamed_addr #7

; Function Attrs: alwaysinline convergent norecurse nounwind
define linkonce_odr protected void @__nv_sincosfpif(float noundef %0, ptr addrspace(5) nocapture noundef writeonly %1, ptr addrspace(5) noundef %2) local_unnamed_addr #6 {
  %4 = tail call float @__ocml_sincospi_f32(float noundef %0, ptr addrspace(5) noundef %2) #13
  store float %4, ptr addrspace(5) %1, align 4, !tbaa !8
  ret void
}

; Function Attrs: convergent
declare float @__ocml_sincospi_f32(float noundef, ptr addrspace(5) noundef) local_unnamed_addr #7

; Function Attrs: convergent norecurse nounwind
define linkonce_odr protected float @__nv_fast_cosf(float noundef %0) local_unnamed_addr #9 {
  %2 = tail call float @__ocml_cos_f32(float noundef %0) #13
  ret float %2
}

; Function Attrs: convergent mustprogress nofree norecurse nounwind readnone willreturn
define linkonce_odr protected float @__nv_fast_exp10f(float noundef %0) local_unnamed_addr #2 {
  %2 = tail call float @__ocml_exp10_f32(float noundef %0) #11
  ret float %2
}

; Function Attrs: convergent mustprogress nofree norecurse nounwind readnone willreturn
define linkonce_odr protected float @__nv_fast_expf(float noundef %0) local_unnamed_addr #2 {
  %2 = tail call float @__ocml_exp_f32(float noundef %0) #11
  ret float %2
}

; Function Attrs: convergent mustprogress nofree norecurse nounwind readnone willreturn
define linkonce_odr protected float @__nv_fast_log10f(float noundef %0) local_unnamed_addr #2 {
  %2 = tail call float @__ocml_log10_f32(float noundef %0) #11
  ret float %2
}

; Function Attrs: convergent mustprogress nofree norecurse nounwind readnone willreturn
define linkonce_odr protected float @__nv_fast_log2f(float noundef %0) local_unnamed_addr #2 {
  %2 = tail call float @__ocml_log2_f32(float noundef %0) #11
  ret float %2
}

; Function Attrs: convergent mustprogress nofree norecurse nounwind readnone willreturn
define linkonce_odr protected float @__nv_fast_logf(float noundef %0) local_unnamed_addr #2 {
  %2 = tail call float @__ocml_log_f32(float noundef %0) #11
  ret float %2
}

; Function Attrs: convergent mustprogress nofree norecurse nounwind readnone willreturn
define linkonce_odr protected float @__nv_fast_powf(float noundef %0, float noundef %1) local_unnamed_addr #2 {
  %3 = tail call float @__ocml_pow_f32(float noundef %0, float noundef %1) #11
  ret float %3
}

; Function Attrs: convergent mustprogress nofree norecurse nounwind readnone willreturn
define linkonce_odr protected float @__nv_fast_sinf(float noundef %0) local_unnamed_addr #2 {
  %2 = tail call float @__ocml_sin_f32(float noundef %0) #11
  ret float %2
}

; Function Attrs: convergent norecurse nounwind
define linkonce_odr protected float @__nv_fast_tanf(float noundef %0) local_unnamed_addr #9 {
  %2 = tail call float @__ocml_tan_f32(float noundef %0) #13
  ret float %2
}

; Function Attrs: convergent mustprogress nofree norecurse nounwind readnone willreturn
define linkonce_odr protected float @__nv_fast_fdividef(float noundef %0, float noundef %1) local_unnamed_addr #2 {
  %3 = tail call float @_Z13native_divideff(float noundef %0, float noundef %1) #11
  ret float %3
}

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare float @_Z13native_divideff(float noundef, float noundef) local_unnamed_addr #3

; Function Attrs: convergent norecurse nounwind
define linkonce_odr protected void @__nv_fast_sincosf(float noundef %0, ptr addrspace(5) nocapture noundef writeonly %1, ptr addrspace(5) noundef %2) local_unnamed_addr #9 {
  %4 = tail call float @__ocml_sincos_f32(float noundef %0, ptr addrspace(5) noundef %2) #13
  store float %4, ptr addrspace(5) %1, align 4, !tbaa !8
  ret void
}

; Function Attrs: alwaysinline mustprogress nofree norecurse nosync nounwind readnone willreturn
define linkonce_odr protected i64 @__nv_double_as_longlong(double noundef %0) local_unnamed_addr #10 {
  %2 = bitcast double %0 to i64
  ret i64 %2
}

; Function Attrs: alwaysinline mustprogress nofree norecurse nosync nounwind readnone willreturn
define linkonce_odr protected i32 @__nv_float_as_int(float noundef %0) local_unnamed_addr #10 {
  %2 = bitcast float %0 to i32
  ret i32 %2
}

; Function Attrs: alwaysinline mustprogress nofree norecurse nosync nounwind readnone willreturn
define linkonce_odr protected i32 @__nv_float_as_uint(float noundef %0) local_unnamed_addr #10 {
  %2 = bitcast float %0 to i32
  ret i32 %2
}

; Function Attrs: alwaysinline mustprogress nofree norecurse nosync nounwind readnone willreturn
define linkonce_odr protected float @__nv_int_as_float(i32 noundef %0) local_unnamed_addr #10 {
  %2 = bitcast i32 %0 to float
  ret float %2
}

; Function Attrs: alwaysinline mustprogress nofree norecurse nosync nounwind readnone willreturn
define linkonce_odr protected double @__nv_longlong_as_double(i64 noundef %0) local_unnamed_addr #10 {
  %2 = bitcast i64 %0 to double
  ret double %2
}

; Function Attrs: alwaysinline mustprogress nofree norecurse nosync nounwind readnone willreturn
define linkonce_odr protected float @__nv_uint_as_float(i32 noundef %0) local_unnamed_addr #10 {
  %2 = bitcast i32 %0 to float
  ret float %2
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind readnone willreturn
define linkonce_odr protected i32 @__nv_double2hiint(double noundef %0) local_unnamed_addr #0 {
  %2 = bitcast double %0 to i64
  %3 = trunc i64 %2 to i32
  ret i32 %3
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind readnone willreturn
define linkonce_odr protected i32 @__nv_double2loint(double noundef %0) local_unnamed_addr #0 {
  %2 = bitcast double %0 to i64
  %3 = trunc i64 %2 to i32
  ret i32 %3
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind readnone willreturn
define linkonce_odr protected double @__nv_hiloint2double(i32 noundef %0, i32 noundef %1) local_unnamed_addr #0 {
  %3 = zext i32 %0 to i64
  %4 = shl nuw i64 %3, 32
  %5 = sext i32 %1 to i64
  %6 = or i64 %4, %5
  %7 = bitcast i64 %6 to double
  ret double %7
}

; Function Attrs: convergent mustprogress nofree norecurse nounwind readnone willreturn
define linkonce_odr protected i64 @__nv_llrint(double noundef %0) local_unnamed_addr #2 {
  %2 = tail call double @__ocml_rint_f64(double noundef %0) #11
  %3 = fptosi double %2 to i64
  ret i64 %3
}

; Function Attrs: convergent mustprogress nofree norecurse nounwind readnone willreturn
define linkonce_odr protected i64 @__nv_llrintf(float noundef %0) local_unnamed_addr #2 {
  %2 = tail call float @__ocml_rint_f32(float noundef %0) #11
  %3 = fptosi float %2 to i64
  ret i64 %3
}

; Function Attrs: convergent mustprogress nofree norecurse nounwind readnone willreturn
define linkonce_odr protected i64 @__nv_llround(double noundef %0) local_unnamed_addr #2 {
  %2 = tail call double @__ocml_round_f64(double noundef %0) #11
  %3 = fptosi double %2 to i64
  ret i64 %3
}

; Function Attrs: convergent mustprogress nofree norecurse nounwind readnone willreturn
define linkonce_odr protected i64 @__nv_llroundf(float noundef %0) local_unnamed_addr #2 {
  %2 = tail call float @__ocml_round_f32(float noundef %0) #11
  %3 = fptosi float %2 to i64
  ret i64 %3
}

attributes #0 = { mustprogress nofree norecurse nosync nounwind readnone willreturn "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" }
attributes #1 = { nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { convergent mustprogress nofree norecurse nounwind readnone willreturn "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" }
attributes #3 = { convergent mustprogress nofree nounwind readnone willreturn "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" }
attributes #4 = { convergent mustprogress nofree nounwind readonly willreturn "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" }
attributes #5 = { alwaysinline convergent mustprogress nofree norecurse nounwind readnone willreturn "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" }
attributes #6 = { alwaysinline convergent norecurse nounwind "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" }
attributes #7 = { convergent "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" }
attributes #8 = { alwaysinline convergent mustprogress nofree norecurse nounwind readonly willreturn "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" }
attributes #9 = { convergent norecurse nounwind "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" }
attributes #10 = { alwaysinline mustprogress nofree norecurse nosync nounwind readnone willreturn "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" }
attributes #11 = { convergent nounwind readnone willreturn }
attributes #12 = { convergent nounwind readonly willreturn }
attributes #13 = { convergent nounwind }

!opencl.ocl.version = !{!0, !0, !0, !0, !0, !0, !0, !0, !0, !0}
!llvm.ident = !{!1, !1, !1, !1, !1, !1, !1, !1, !1, !1}
!llvm.module.flags = !{!2, !3}

!0 = !{i32 2, i32 0}
!1 = !{!"clang version 16.0.0 (https://github.com/llvm/llvm-project 809855b56f06dd7182685f88fbbc64111df9339a)"}
!2 = !{i32 1, !"wchar_size", i32 4}
!3 = !{i32 7, !"PIC Level", i32 1}
!4 = !{!5, !5, i64 0}
!5 = !{!"double", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C/C++ TBAA"}
!8 = !{!9, !9, i64 0}
!9 = !{!"float", !6, i64 0}

; ModuleID = 'vecadd.hip.device.bc'
source_filename = "vecadd.hip"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%0 = type { %1 addrspace(1)*, %2 addrspace(1)*, %3, i64, i64, i64 }
%1 = type { i64, i64, i32, i32 }
%2 = type { [64 x [8 x i64]] }
%3 = type { i64 }
%4 = type { i64, %3, i64, i32, i32, i64, i64, %5, [2 x i32] }
%5 = type { %6 addrspace(1)* }
%6 = type { %7, [4 x i32], i64, i32, i32, i32, i32, i64, i32, [9 x i32], i64, i32, i32, [4 x i32], i64, i64, i32, i32, [2 x i32], %3, [14 x i32] }
%7 = type { i32, i32, i8 addrspace(1)*, %3, i32, i32, i64 }
%struct.__HIP_Coordinates = type { i8 }
%"struct.__HIP_Coordinates<__HIP_ThreadIdx>::__X" = type { i8 }
%struct.__HIP_ThreadIdx = type { i8 }

$_ZNK17__HIP_CoordinatesI15__HIP_ThreadIdxE3__XcvjEv = comdat any

$_ZNK15__HIP_ThreadIdxclEj = comdat any

$_ZN17__HIP_CoordinatesI15__HIP_ThreadIdxE1xE = comdat any

@__const.__assert_fail.fmt = private unnamed_addr addrspace(4) constant [47 x i8] c"%s:%u: %s: Device-side assertion `%s' failed.\0A\00", align 16
@_ZL9threadIdx = internal addrspace(4) constant %struct.__HIP_Coordinates undef, align 1, !dbg.def !0
@_ZN17__HIP_CoordinatesI15__HIP_ThreadIdxE1xE = weak protected addrspace(4) externally_initialized constant %"struct.__HIP_Coordinates<__HIP_ThreadIdx>::__X" undef, comdat, align 1, !dbg.def !1
@llvm.compiler.used = appending addrspace(1) global [1 x i8*] [i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds (%"struct.__HIP_Coordinates<__HIP_ThreadIdx>::__X", %"struct.__HIP_Coordinates<__HIP_ThreadIdx>::__X" addrspace(4)* @_ZN17__HIP_CoordinatesI15__HIP_ThreadIdxE1xE, i32 0, i32 0) to i8*)], section "llvm.metadata"
@__oclc_wavefrontsize64 = internal local_unnamed_addr addrspace(4) constant i8 1, align 1
@__oclc_ABI_version = internal local_unnamed_addr addrspace(4) constant i32 400, align 4

; Function Attrs: convergent mustprogress noreturn nounwind
define weak void @__cxa_pure_virtual() #0 !dbg !1659 {
  call void @llvm.trap(), !dbg !1662
  unreachable, !dbg !1663
}

; Function Attrs: cold noreturn nounwind
declare void @llvm.trap() #1

; Function Attrs: convergent mustprogress noreturn nounwind
define weak void @__cxa_deleted_virtual() #0 !dbg !1664 {
  call void @llvm.trap(), !dbg !1665
  unreachable, !dbg !1666
}

; Function Attrs: convergent mustprogress noinline nounwind
define weak hidden void @__assert_fail(i8* %0, i8* %1, i32 %2, i8* %3) #2 !dbg !1667 {
  %5 = alloca i8*, align 8, addrspace(5)
  %6 = alloca i8*, align 8, addrspace(5)
  %7 = alloca i32, align 4, addrspace(5)
  %8 = alloca i8*, align 8, addrspace(5)
  %9 = alloca [47 x i8], align 16, addrspace(5)
  %10 = alloca i64, align 8, addrspace(5)
  %11 = alloca i32, align 4, addrspace(5)
  %12 = alloca i8*, align 8, addrspace(5)
  %13 = alloca i8*, align 8, addrspace(5)
  %14 = alloca i8*, align 8, addrspace(5)
  %15 = alloca i8*, align 8, addrspace(5)
  %16 = addrspacecast i8* addrspace(5)* %5 to i8**
  %17 = addrspacecast i8* addrspace(5)* %6 to i8**
  %18 = addrspacecast i32 addrspace(5)* %7 to i32*
  %19 = addrspacecast i8* addrspace(5)* %8 to i8**
  %20 = addrspacecast [47 x i8] addrspace(5)* %9 to [47 x i8]*
  %21 = addrspacecast i64 addrspace(5)* %10 to i64*
  %22 = addrspacecast i32 addrspace(5)* %11 to i32*
  %23 = addrspacecast i8* addrspace(5)* %12 to i8**
  %24 = addrspacecast i8* addrspace(5)* %13 to i8**
  %25 = addrspacecast i8* addrspace(5)* %14 to i8**
  %26 = addrspacecast i8* addrspace(5)* %15 to i8**
  store i8* %0, i8** %16, align 8, !tbaa !1690
  call void @llvm.dbg.def(metadata !1694, metadata i8* addrspace(5)* %5), !dbg !1695
  store i8* %1, i8** %17, align 8, !tbaa !1690
  call void @llvm.dbg.def(metadata !1696, metadata i8* addrspace(5)* %6), !dbg !1697
  store i32 %2, i32* %18, align 4, !tbaa !1698
  call void @llvm.dbg.def(metadata !1700, metadata i32 addrspace(5)* %7), !dbg !1701
  store i8* %3, i8** %19, align 8, !tbaa !1690
  call void @llvm.dbg.def(metadata !1702, metadata i8* addrspace(5)* %8), !dbg !1703
  %27 = bitcast [47 x i8] addrspace(5)* %9 to i8 addrspace(5)*, !dbg !1704
  call void @llvm.lifetime.start.p5i8(i64 47, i8 addrspace(5)* %27) #18, !dbg !1704
  call void @llvm.dbg.def(metadata !1705, metadata [47 x i8] addrspace(5)* %9), !dbg !1706
  %28 = bitcast [47 x i8]* %20 to i8*, !dbg !1706
  call void @llvm.memcpy.p0i8.p4i8.i64(i8* align 16 %28, i8 addrspace(4)* align 16 getelementptr inbounds ([47 x i8], [47 x i8] addrspace(4)* @__const.__assert_fail.fmt, i32 0, i32 0), i64 47, i1 false), !dbg !1706
  %29 = bitcast i64 addrspace(5)* %10 to i8 addrspace(5)*, !dbg !1707
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %29) #18, !dbg !1707
  call void @llvm.dbg.def(metadata !1708, metadata i64 addrspace(5)* %10), !dbg !1709
  %30 = call i64 @__ockl_fprintf_stderr_begin() #21, !dbg !1710
  store i64 %30, i64* %21, align 8, !dbg !1709, !tbaa !1711
  %31 = bitcast i32 addrspace(5)* %11 to i8 addrspace(5)*, !dbg !1713
  call void @llvm.lifetime.start.p5i8(i64 4, i8 addrspace(5)* %31) #18, !dbg !1713
  call void @llvm.dbg.def(metadata !1714, metadata i32 addrspace(5)* %11), !dbg !1715
  store i32 0, i32* %22, align 4, !dbg !1715, !tbaa !1698
  br label %32, !dbg !1716

32:                                               ; preds = %4
  %33 = bitcast i8* addrspace(5)* %12 to i8 addrspace(5)*, !dbg !1717
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %33) #18, !dbg !1717
  call void @llvm.dbg.def(metadata !1718, metadata i8* addrspace(5)* %12), !dbg !1719
  %34 = getelementptr inbounds [47 x i8], [47 x i8]* %20, i64 0, i64 0, !dbg !1720
  store i8* %34, i8** %23, align 8, !dbg !1719, !tbaa !1690
  br label %35, !dbg !1721

35:                                               ; preds = %40, %32
  %36 = load i8*, i8** %23, align 8, !dbg !1722, !tbaa !1690
  %37 = getelementptr inbounds i8, i8* %36, i32 1, !dbg !1722
  store i8* %37, i8** %23, align 8, !dbg !1722, !tbaa !1690
  %38 = load i8, i8* %36, align 1, !dbg !1723, !tbaa !1724
  %39 = icmp ne i8 %38, 0, !dbg !1723
  br i1 %39, label %40, label %41, !dbg !1721

40:                                               ; preds = %35
  br label %35, !dbg !1721, !llvm.loop !1725

41:                                               ; preds = %35
  %42 = load i8*, i8** %23, align 8, !dbg !1728, !tbaa !1690
  %43 = getelementptr inbounds [47 x i8], [47 x i8]* %20, i64 0, i64 0, !dbg !1729
  %44 = ptrtoint i8* %42 to i64, !dbg !1730
  %45 = ptrtoint i8* %43 to i64, !dbg !1730
  %46 = sub i64 %44, %45, !dbg !1730
  %47 = trunc i64 %46 to i32, !dbg !1728
  store i32 %47, i32* %22, align 4, !dbg !1731, !tbaa !1698
  %48 = bitcast i8* addrspace(5)* %12 to i8 addrspace(5)*, !dbg !1732
  call void @llvm.lifetime.end.p5i8(i64 8, i8 addrspace(5)* %48) #18, !dbg !1732
  br label %49, !dbg !1733

49:                                               ; preds = %41
  br label %50, !dbg !1733

50:                                               ; preds = %49
  %51 = load i64, i64* %21, align 8, !dbg !1734, !tbaa !1711
  %52 = getelementptr inbounds [47 x i8], [47 x i8]* %20, i64 0, i64 0, !dbg !1735
  %53 = load i32, i32* %22, align 4, !dbg !1736, !tbaa !1698
  %54 = sext i32 %53 to i64, !dbg !1736
  %55 = call i64 @__ockl_fprintf_append_string_n(i64 %51, i8* %52, i64 %54, i32 0) #21, !dbg !1737
  store i64 %55, i64* %21, align 8, !dbg !1738, !tbaa !1711
  br label %56, !dbg !1739

56:                                               ; preds = %50
  %57 = bitcast i8* addrspace(5)* %13 to i8 addrspace(5)*, !dbg !1740
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %57) #18, !dbg !1740
  call void @llvm.dbg.def(metadata !1741, metadata i8* addrspace(5)* %13), !dbg !1742
  %58 = load i8*, i8** %17, align 8, !dbg !1743, !tbaa !1690
  store i8* %58, i8** %24, align 8, !dbg !1742, !tbaa !1690
  br label %59, !dbg !1744

59:                                               ; preds = %64, %56
  %60 = load i8*, i8** %24, align 8, !dbg !1745, !tbaa !1690
  %61 = getelementptr inbounds i8, i8* %60, i32 1, !dbg !1745
  store i8* %61, i8** %24, align 8, !dbg !1745, !tbaa !1690
  %62 = load i8, i8* %60, align 1, !dbg !1746, !tbaa !1724
  %63 = icmp ne i8 %62, 0, !dbg !1746
  br i1 %63, label %64, label %65, !dbg !1744

64:                                               ; preds = %59
  br label %59, !dbg !1744, !llvm.loop !1747

65:                                               ; preds = %59
  %66 = load i8*, i8** %24, align 8, !dbg !1749, !tbaa !1690
  %67 = load i8*, i8** %17, align 8, !dbg !1750, !tbaa !1690
  %68 = ptrtoint i8* %66 to i64, !dbg !1751
  %69 = ptrtoint i8* %67 to i64, !dbg !1751
  %70 = sub i64 %68, %69, !dbg !1751
  %71 = trunc i64 %70 to i32, !dbg !1749
  store i32 %71, i32* %22, align 4, !dbg !1752, !tbaa !1698
  %72 = bitcast i8* addrspace(5)* %13 to i8 addrspace(5)*, !dbg !1753
  call void @llvm.lifetime.end.p5i8(i64 8, i8 addrspace(5)* %72) #18, !dbg !1753
  br label %73, !dbg !1754

73:                                               ; preds = %65
  br label %74, !dbg !1754

74:                                               ; preds = %73
  %75 = load i64, i64* %21, align 8, !dbg !1755, !tbaa !1711
  %76 = load i8*, i8** %17, align 8, !dbg !1756, !tbaa !1690
  %77 = load i32, i32* %22, align 4, !dbg !1757, !tbaa !1698
  %78 = sext i32 %77 to i64, !dbg !1757
  %79 = call i64 @__ockl_fprintf_append_string_n(i64 %75, i8* %76, i64 %78, i32 0) #21, !dbg !1758
  store i64 %79, i64* %21, align 8, !dbg !1759, !tbaa !1711
  %80 = load i64, i64* %21, align 8, !dbg !1760, !tbaa !1711
  %81 = load i32, i32* %18, align 4, !dbg !1761, !tbaa !1698
  %82 = zext i32 %81 to i64, !dbg !1761
  %83 = call i64 @__ockl_fprintf_append_args(i64 %80, i32 1, i64 %82, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i32 0) #21, !dbg !1762
  store i64 %83, i64* %21, align 8, !dbg !1763, !tbaa !1711
  br label %84, !dbg !1764

84:                                               ; preds = %74
  %85 = bitcast i8* addrspace(5)* %14 to i8 addrspace(5)*, !dbg !1765
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %85) #18, !dbg !1765
  call void @llvm.dbg.def(metadata !1766, metadata i8* addrspace(5)* %14), !dbg !1767
  %86 = load i8*, i8** %19, align 8, !dbg !1768, !tbaa !1690
  store i8* %86, i8** %25, align 8, !dbg !1767, !tbaa !1690
  br label %87, !dbg !1769

87:                                               ; preds = %92, %84
  %88 = load i8*, i8** %25, align 8, !dbg !1770, !tbaa !1690
  %89 = getelementptr inbounds i8, i8* %88, i32 1, !dbg !1770
  store i8* %89, i8** %25, align 8, !dbg !1770, !tbaa !1690
  %90 = load i8, i8* %88, align 1, !dbg !1771, !tbaa !1724
  %91 = icmp ne i8 %90, 0, !dbg !1771
  br i1 %91, label %92, label %93, !dbg !1769

92:                                               ; preds = %87
  br label %87, !dbg !1769, !llvm.loop !1772

93:                                               ; preds = %87
  %94 = load i8*, i8** %25, align 8, !dbg !1774, !tbaa !1690
  %95 = load i8*, i8** %19, align 8, !dbg !1775, !tbaa !1690
  %96 = ptrtoint i8* %94 to i64, !dbg !1776
  %97 = ptrtoint i8* %95 to i64, !dbg !1776
  %98 = sub i64 %96, %97, !dbg !1776
  %99 = trunc i64 %98 to i32, !dbg !1774
  store i32 %99, i32* %22, align 4, !dbg !1777, !tbaa !1698
  %100 = bitcast i8* addrspace(5)* %14 to i8 addrspace(5)*, !dbg !1778
  call void @llvm.lifetime.end.p5i8(i64 8, i8 addrspace(5)* %100) #18, !dbg !1778
  br label %101, !dbg !1779

101:                                              ; preds = %93
  br label %102, !dbg !1779

102:                                              ; preds = %101
  %103 = load i64, i64* %21, align 8, !dbg !1780, !tbaa !1711
  %104 = load i8*, i8** %19, align 8, !dbg !1781, !tbaa !1690
  %105 = load i32, i32* %22, align 4, !dbg !1782, !tbaa !1698
  %106 = sext i32 %105 to i64, !dbg !1782
  %107 = call i64 @__ockl_fprintf_append_string_n(i64 %103, i8* %104, i64 %106, i32 0) #21, !dbg !1783
  store i64 %107, i64* %21, align 8, !dbg !1784, !tbaa !1711
  br label %108, !dbg !1785

108:                                              ; preds = %102
  %109 = bitcast i8* addrspace(5)* %15 to i8 addrspace(5)*, !dbg !1786
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %109) #18, !dbg !1786
  call void @llvm.dbg.def(metadata !1787, metadata i8* addrspace(5)* %15), !dbg !1788
  %110 = load i8*, i8** %16, align 8, !dbg !1789, !tbaa !1690
  store i8* %110, i8** %26, align 8, !dbg !1788, !tbaa !1690
  br label %111, !dbg !1790

111:                                              ; preds = %116, %108
  %112 = load i8*, i8** %26, align 8, !dbg !1791, !tbaa !1690
  %113 = getelementptr inbounds i8, i8* %112, i32 1, !dbg !1791
  store i8* %113, i8** %26, align 8, !dbg !1791, !tbaa !1690
  %114 = load i8, i8* %112, align 1, !dbg !1792, !tbaa !1724
  %115 = icmp ne i8 %114, 0, !dbg !1792
  br i1 %115, label %116, label %117, !dbg !1790

116:                                              ; preds = %111
  br label %111, !dbg !1790, !llvm.loop !1793

117:                                              ; preds = %111
  %118 = load i8*, i8** %26, align 8, !dbg !1795, !tbaa !1690
  %119 = load i8*, i8** %16, align 8, !dbg !1796, !tbaa !1690
  %120 = ptrtoint i8* %118 to i64, !dbg !1797
  %121 = ptrtoint i8* %119 to i64, !dbg !1797
  %122 = sub i64 %120, %121, !dbg !1797
  %123 = trunc i64 %122 to i32, !dbg !1795
  store i32 %123, i32* %22, align 4, !dbg !1798, !tbaa !1698
  %124 = bitcast i8* addrspace(5)* %15 to i8 addrspace(5)*, !dbg !1799
  call void @llvm.lifetime.end.p5i8(i64 8, i8 addrspace(5)* %124) #18, !dbg !1799
  br label %125, !dbg !1800

125:                                              ; preds = %117
  br label %126, !dbg !1800

126:                                              ; preds = %125
  %127 = load i64, i64* %21, align 8, !dbg !1801, !tbaa !1711
  %128 = load i8*, i8** %16, align 8, !dbg !1802, !tbaa !1690
  %129 = load i32, i32* %22, align 4, !dbg !1803, !tbaa !1698
  %130 = sext i32 %129 to i64, !dbg !1803
  %131 = call i64 @__ockl_fprintf_append_string_n(i64 %127, i8* %128, i64 %130, i32 1) #21, !dbg !1804
  call void @llvm.trap(), !dbg !1805
  %132 = bitcast i32 addrspace(5)* %11 to i8 addrspace(5)*, !dbg !1806
  call void @llvm.lifetime.end.p5i8(i64 4, i8 addrspace(5)* %132) #18, !dbg !1806
  %133 = bitcast i64 addrspace(5)* %10 to i8 addrspace(5)*, !dbg !1806
  call void @llvm.lifetime.end.p5i8(i64 8, i8 addrspace(5)* %133) #18, !dbg !1806
  %134 = bitcast [47 x i8] addrspace(5)* %9 to i8 addrspace(5)*, !dbg !1806
  call void @llvm.lifetime.end.p5i8(i64 47, i8 addrspace(5)* %134) #18, !dbg !1806
  ret void, !dbg !1806
}

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.def(metadata, metadata) #3

; Function Attrs: argmemonly nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p5i8(i64 immarg, i8 addrspace(5)* nocapture) #4

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p4i8.i64(i8* noalias nocapture writeonly, i8 addrspace(4)* noalias nocapture readonly, i64, i1 immarg) #5

; Function Attrs: argmemonly nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p5i8(i64 immarg, i8 addrspace(5)* nocapture) #4

; Function Attrs: convergent mustprogress noinline nounwind
define weak hidden void @__assertfail() #2 !dbg !1807 {
  call void @llvm.trap(), !dbg !1808
  ret void, !dbg !1809
}

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z6vecAddPdS_S_i(double addrspace(1)* %0, double addrspace(1)* %1, double addrspace(1)* %2, i32 %3) #6 !dbg !1810 {
  %5 = alloca double*, align 8, addrspace(5)
  %6 = alloca double*, align 8, addrspace(5)
  %7 = alloca double*, align 8, addrspace(5)
  %8 = alloca double*, align 8, addrspace(5)
  %9 = alloca double*, align 8, addrspace(5)
  %10 = alloca double*, align 8, addrspace(5)
  %11 = alloca i32, align 4, addrspace(5)
  %12 = alloca i32, align 4, addrspace(5)
  %13 = addrspacecast double* addrspace(5)* %5 to double**
  %14 = addrspacecast double* addrspace(5)* %6 to double**
  %15 = addrspacecast double* addrspace(5)* %7 to double**
  %16 = addrspacecast double* addrspace(5)* %8 to double**
  %17 = addrspacecast double* addrspace(5)* %9 to double**
  %18 = addrspacecast double* addrspace(5)* %10 to double**
  %19 = addrspacecast i32 addrspace(5)* %11 to i32*
  %20 = addrspacecast i32 addrspace(5)* %12 to i32*
  %21 = addrspacecast double addrspace(1)* %0 to double*
  store double* %21, double** %13, align 8
  %22 = load double*, double** %13, align 8, !tbaa !1690
  %23 = addrspacecast double addrspace(1)* %1 to double*
  store double* %23, double** %14, align 8
  %24 = load double*, double** %14, align 8, !tbaa !1690
  %25 = addrspacecast double addrspace(1)* %2 to double*
  store double* %25, double** %15, align 8
  %26 = load double*, double** %15, align 8, !tbaa !1690
  store double* %22, double** %16, align 8, !tbaa !1690
  call void @llvm.dbg.def(metadata !1819, metadata double* addrspace(5)* %8), !dbg !1820
  store double* %24, double** %17, align 8, !tbaa !1690
  call void @llvm.dbg.def(metadata !1821, metadata double* addrspace(5)* %9), !dbg !1822
  store double* %26, double** %18, align 8, !tbaa !1690
  call void @llvm.dbg.def(metadata !1823, metadata double* addrspace(5)* %10), !dbg !1824
  store i32 %3, i32* %19, align 4, !tbaa !1698
  call void @llvm.dbg.def(metadata !1825, metadata i32 addrspace(5)* %11), !dbg !1826
  %27 = bitcast i32 addrspace(5)* %12 to i8 addrspace(5)*, !dbg !1827
  call void @llvm.lifetime.start.p5i8(i64 4, i8 addrspace(5)* %27) #18, !dbg !1827
  call void @llvm.dbg.def(metadata !1828, metadata i32 addrspace(5)* %12), !dbg !1829
  %28 = call i32 @_ZNK17__HIP_CoordinatesI15__HIP_ThreadIdxE3__XcvjEv(%"struct.__HIP_Coordinates<__HIP_ThreadIdx>::__X"* nonnull align 1 dereferenceable(1) addrspacecast (%"struct.__HIP_Coordinates<__HIP_ThreadIdx>::__X" addrspace(4)* @_ZN17__HIP_CoordinatesI15__HIP_ThreadIdxE1xE to %"struct.__HIP_Coordinates<__HIP_ThreadIdx>::__X"*)) #21, !dbg !1830
  store i32 %28, i32* %20, align 4, !dbg !1829, !tbaa !1698
  %29 = load i32, i32* %20, align 4, !dbg !1831, !tbaa !1698
  %30 = load i32, i32* %19, align 4, !dbg !1833, !tbaa !1698
  %31 = icmp slt i32 %29, %30, !dbg !1834
  br i1 %31, label %32, label %48, !dbg !1835

32:                                               ; preds = %4
  %33 = load double*, double** %16, align 8, !dbg !1836, !tbaa !1690
  %34 = load i32, i32* %20, align 4, !dbg !1838, !tbaa !1698
  %35 = sext i32 %34 to i64, !dbg !1836
  %36 = getelementptr inbounds double, double* %33, i64 %35, !dbg !1836
  %37 = load double, double* %36, align 8, !dbg !1836, !tbaa !1839
  %38 = load double*, double** %17, align 8, !dbg !1841, !tbaa !1690
  %39 = load i32, i32* %20, align 4, !dbg !1842, !tbaa !1698
  %40 = sext i32 %39 to i64, !dbg !1841
  %41 = getelementptr inbounds double, double* %38, i64 %40, !dbg !1841
  %42 = load double, double* %41, align 8, !dbg !1841, !tbaa !1839
  %43 = fadd contract double %37, %42, !dbg !1843
  %44 = load double*, double** %18, align 8, !dbg !1844, !tbaa !1690
  %45 = load i32, i32* %20, align 4, !dbg !1845, !tbaa !1698
  %46 = sext i32 %45 to i64, !dbg !1844
  %47 = getelementptr inbounds double, double* %44, i64 %46, !dbg !1844
  store double %43, double* %47, align 8, !dbg !1846, !tbaa !1839
  br label %48, !dbg !1847

48:                                               ; preds = %32, %4
  %49 = bitcast i32 addrspace(5)* %12 to i8 addrspace(5)*, !dbg !1848
  call void @llvm.lifetime.end.p5i8(i64 4, i8 addrspace(5)* %49) #18, !dbg !1848
  ret void, !dbg !1848
}

; Function Attrs: convergent mustprogress nounwind
define linkonce_odr hidden i32 @_ZNK17__HIP_CoordinatesI15__HIP_ThreadIdxE3__XcvjEv(%"struct.__HIP_Coordinates<__HIP_ThreadIdx>::__X"* nonnull align 1 dereferenceable(1) %0) #7 comdat align 2 !dbg !1849 {
  %2 = alloca i32, align 4, addrspace(5)
  %3 = alloca %"struct.__HIP_Coordinates<__HIP_ThreadIdx>::__X"*, align 8, addrspace(5)
  %4 = alloca %struct.__HIP_ThreadIdx, align 1, addrspace(5)
  %5 = addrspacecast i32 addrspace(5)* %2 to i32*
  %6 = addrspacecast %"struct.__HIP_Coordinates<__HIP_ThreadIdx>::__X"* addrspace(5)* %3 to %"struct.__HIP_Coordinates<__HIP_ThreadIdx>::__X"**
  %7 = addrspacecast %struct.__HIP_ThreadIdx addrspace(5)* %4 to %struct.__HIP_ThreadIdx*
  store %"struct.__HIP_Coordinates<__HIP_ThreadIdx>::__X"* %0, %"struct.__HIP_Coordinates<__HIP_ThreadIdx>::__X"** %6, align 8, !tbaa !1690
  call void @llvm.dbg.def(metadata !1853, metadata %"struct.__HIP_Coordinates<__HIP_ThreadIdx>::__X"* addrspace(5)* %3), !dbg !1854
  %8 = load %"struct.__HIP_Coordinates<__HIP_ThreadIdx>::__X"*, %"struct.__HIP_Coordinates<__HIP_ThreadIdx>::__X"** %6, align 8
  %9 = bitcast %struct.__HIP_ThreadIdx addrspace(5)* %4 to i8 addrspace(5)*, !dbg !1855
  call void @llvm.lifetime.start.p5i8(i64 1, i8 addrspace(5)* %9) #18, !dbg !1855
  %10 = call i32 @_ZNK15__HIP_ThreadIdxclEj(%struct.__HIP_ThreadIdx* nonnull align 1 dereferenceable(1) %7, i32 0) #21, !dbg !1855
  %11 = bitcast %struct.__HIP_ThreadIdx addrspace(5)* %4 to i8 addrspace(5)*, !dbg !1856
  call void @llvm.lifetime.end.p5i8(i64 1, i8 addrspace(5)* %11) #18, !dbg !1856
  ret i32 %10, !dbg !1856
}

; Function Attrs: convergent mustprogress nounwind
define linkonce_odr hidden i32 @_ZNK15__HIP_ThreadIdxclEj(%struct.__HIP_ThreadIdx* nonnull align 1 dereferenceable(1) %0, i32 %1) #7 comdat align 2 !dbg !1857 {
  %3 = alloca i32, align 4, addrspace(5)
  %4 = alloca %struct.__HIP_ThreadIdx*, align 8, addrspace(5)
  %5 = alloca i32, align 4, addrspace(5)
  %6 = addrspacecast i32 addrspace(5)* %3 to i32*
  %7 = addrspacecast %struct.__HIP_ThreadIdx* addrspace(5)* %4 to %struct.__HIP_ThreadIdx**
  %8 = addrspacecast i32 addrspace(5)* %5 to i32*
  store %struct.__HIP_ThreadIdx* %0, %struct.__HIP_ThreadIdx** %7, align 8, !tbaa !1690
  call void @llvm.dbg.def(metadata !1862, metadata %struct.__HIP_ThreadIdx* addrspace(5)* %4), !dbg !1863
  store i32 %1, i32* %8, align 4, !tbaa !1698
  call void @llvm.dbg.def(metadata !1864, metadata i32 addrspace(5)* %5), !dbg !1865
  %9 = load %struct.__HIP_ThreadIdx*, %struct.__HIP_ThreadIdx** %7, align 8
  %10 = load i32, i32* %8, align 4, !dbg !1866, !tbaa !1698
  %11 = call i64 @__ockl_get_local_id(i32 %10) #14, !dbg !1867
  %12 = trunc i64 %11 to i32, !dbg !1867
  ret i32 %12, !dbg !1868
}

; Function Attrs: convergent mustprogress nofree norecurse nosync nounwind readnone willreturn
define internal i64 @__ockl_get_local_id(i32 noundef %0) #8 {
  switch i32 %0, label %8 [
    i32 0, label %2
    i32 1, label %4
    i32 2, label %6
  ]

2:                                                ; preds = %1
  %3 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !1869
  br label %8

4:                                                ; preds = %1
  %5 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !1869
  br label %8

6:                                                ; preds = %1
  %7 = tail call i32 @llvm.amdgcn.workitem.id.z(), !range !1869
  br label %8

8:                                                ; preds = %6, %4, %2, %1
  %9 = phi i32 [ %7, %6 ], [ %5, %4 ], [ %3, %2 ], [ 0, %1 ]
  %10 = zext i32 %9 to i64
  ret i64 %10
}

; Function Attrs: nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #9

; Function Attrs: nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #9

; Function Attrs: nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.z() #9

; Function Attrs: convergent norecurse nounwind
define internal i64 @__ockl_fprintf_stderr_begin() #10 {
  %1 = tail call <2 x i64> @__ockl_hostcall_preview(i32 noundef 2, i64 noundef 33, i64 noundef 1, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #21
  %2 = extractelement <2 x i64> %1, i64 0
  ret i64 %2
}

; Function Attrs: convergent norecurse nounwind
define internal <2 x i64> @__ockl_hostcall_preview(i32 noundef %0, i64 noundef %1, i64 noundef %2, i64 noundef %3, i64 noundef %4, i64 noundef %5, i64 noundef %6, i64 noundef %7, i64 noundef %8) local_unnamed_addr #10 {
  %10 = load i32, i32 addrspace(4)* @__oclc_ABI_version, align 4, !tbaa !1870
  %11 = icmp slt i32 %10, 500
  %12 = tail call i8 addrspace(4)* @llvm.amdgcn.implicitarg.ptr()
  %13 = select i1 %11, i64 24, i64 80
  %14 = getelementptr inbounds i8, i8 addrspace(4)* %12, i64 %13
  %15 = bitcast i8 addrspace(4)* %14 to i64 addrspace(4)*
  %16 = load i64, i64 addrspace(4)* %15, align 8, !tbaa !1874
  %17 = inttoptr i64 %16 to i8 addrspace(1)*
  %18 = addrspacecast i8 addrspace(1)* %17 to i8*
  %19 = tail call <2 x i64> @__ockl_hostcall_internal(i8* noundef %18, i32 noundef %0, i64 noundef %1, i64 noundef %2, i64 noundef %3, i64 noundef %4, i64 noundef %5, i64 noundef %6, i64 noundef %7, i64 noundef %8) #21
  ret <2 x i64> %19
}

; Function Attrs: nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.implicitarg.ptr() #9

; Function Attrs: convergent noinline norecurse nounwind optnone
define internal <2 x i64> @__ockl_hostcall_internal(i8* noundef %0, i32 noundef %1, i64 noundef %2, i64 noundef %3, i64 noundef %4, i64 noundef %5, i64 noundef %6, i64 noundef %7, i64 noundef %8, i64 noundef %9) local_unnamed_addr #11 {
  %11 = alloca i8*, align 8, addrspace(5)
  %12 = alloca i32, align 4, addrspace(5)
  %13 = alloca i64, align 8, addrspace(5)
  %14 = alloca i64, align 8, addrspace(5)
  %15 = alloca i64, align 8, addrspace(5)
  %16 = alloca i64, align 8, addrspace(5)
  %17 = alloca i64, align 8, addrspace(5)
  %18 = alloca i64, align 8, addrspace(5)
  %19 = alloca i64, align 8, addrspace(5)
  %20 = alloca i64, align 8, addrspace(5)
  %21 = alloca i32, align 4, addrspace(5)
  %22 = alloca i32, align 4, addrspace(5)
  %23 = alloca %0 addrspace(1)*, align 8, addrspace(5)
  %24 = alloca i64, align 8, addrspace(5)
  %25 = alloca %1 addrspace(1)*, align 8, addrspace(5)
  %26 = alloca %2 addrspace(1)*, align 8, addrspace(5)
  %27 = alloca <2 x i64>, align 16, addrspace(5)
  store i8* %0, i8* addrspace(5)* %11, align 8, !tbaa !1876
  store i32 %1, i32 addrspace(5)* %12, align 4, !tbaa !1870
  store i64 %2, i64 addrspace(5)* %13, align 8, !tbaa !1874
  store i64 %3, i64 addrspace(5)* %14, align 8, !tbaa !1874
  store i64 %4, i64 addrspace(5)* %15, align 8, !tbaa !1874
  store i64 %5, i64 addrspace(5)* %16, align 8, !tbaa !1874
  store i64 %6, i64 addrspace(5)* %17, align 8, !tbaa !1874
  store i64 %7, i64 addrspace(5)* %18, align 8, !tbaa !1874
  store i64 %8, i64 addrspace(5)* %19, align 8, !tbaa !1874
  store i64 %9, i64 addrspace(5)* %20, align 8, !tbaa !1874
  %28 = bitcast i32 addrspace(5)* %21 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 4, i8 addrspace(5)* %28) #18
  %29 = call i32 @__ockl_lane_u32() #22
  store i32 %29, i32 addrspace(5)* %21, align 4, !tbaa !1870
  %30 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !1870
  %31 = call fastcc i32 @0(i32 noundef %30) #22
  store i32 %31, i32 addrspace(5)* %21, align 4, !tbaa !1870
  %32 = bitcast i32 addrspace(5)* %22 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 4, i8 addrspace(5)* %32) #18
  %33 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !1870
  %34 = call i32 @llvm.amdgcn.readfirstlane(i32 %33)
  store i32 %34, i32 addrspace(5)* %22, align 4, !tbaa !1870
  %35 = bitcast %0 addrspace(1)* addrspace(5)* %23 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %35) #18
  %36 = load i8*, i8* addrspace(5)* %11, align 8, !tbaa !1876
  %37 = addrspacecast i8* %36 to %0 addrspace(1)*
  store %0 addrspace(1)* %37, %0 addrspace(1)* addrspace(5)* %23, align 8, !tbaa !1876
  %38 = bitcast i64 addrspace(5)* %24 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %38) #18
  %39 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %23, align 8, !tbaa !1876
  %40 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !1870
  %41 = load i32, i32 addrspace(5)* %22, align 4, !tbaa !1870
  %42 = call fastcc i64 @1(%0 addrspace(1)* noundef %39, i32 noundef %40, i32 noundef %41) #22
  store i64 %42, i64 addrspace(5)* %24, align 8, !tbaa !1874
  %43 = bitcast %1 addrspace(1)* addrspace(5)* %25 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %43) #18
  %44 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %23, align 8, !tbaa !1876
  %45 = load i64, i64 addrspace(5)* %24, align 8, !tbaa !1874
  %46 = getelementptr %0, %0 addrspace(1)* %44, i64 0, i32 0
  %47 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %46, align 8, !tbaa !1878
  %48 = getelementptr %0, %0 addrspace(1)* %44, i64 0, i32 5
  %49 = load i64, i64 addrspace(1)* %48, align 8, !tbaa !1881
  %50 = call fastcc %1 addrspace(1)* @2(%1 addrspace(1)* %47, i64 %49, i64 noundef %45) #22
  store %1 addrspace(1)* %50, %1 addrspace(1)* addrspace(5)* %25, align 8, !tbaa !1876
  %51 = bitcast %2 addrspace(1)* addrspace(5)* %26 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %51) #18
  %52 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %23, align 8, !tbaa !1876
  %53 = load i64, i64 addrspace(5)* %24, align 8, !tbaa !1874
  %54 = getelementptr %0, %0 addrspace(1)* %52, i64 0, i32 1
  %55 = load %2 addrspace(1)*, %2 addrspace(1)* addrspace(1)* %54, align 8, !tbaa !1882
  %56 = getelementptr %0, %0 addrspace(1)* %52, i64 0, i32 5
  %57 = load i64, i64 addrspace(1)* %56, align 8, !tbaa !1881
  %58 = call fastcc %2 addrspace(1)* @3(%2 addrspace(1)* %55, i64 %57, i64 noundef %53) #22
  store %2 addrspace(1)* %58, %2 addrspace(1)* addrspace(5)* %26, align 8, !tbaa !1876
  %59 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(5)* %25, align 8, !tbaa !1876
  %60 = load %2 addrspace(1)*, %2 addrspace(1)* addrspace(5)* %26, align 8, !tbaa !1876
  %61 = load i32, i32 addrspace(5)* %12, align 4, !tbaa !1870
  %62 = load i64, i64 addrspace(5)* %13, align 8, !tbaa !1874
  %63 = load i64, i64 addrspace(5)* %14, align 8, !tbaa !1874
  %64 = load i64, i64 addrspace(5)* %15, align 8, !tbaa !1874
  %65 = load i64, i64 addrspace(5)* %16, align 8, !tbaa !1874
  %66 = load i64, i64 addrspace(5)* %17, align 8, !tbaa !1874
  %67 = load i64, i64 addrspace(5)* %18, align 8, !tbaa !1874
  %68 = load i64, i64 addrspace(5)* %19, align 8, !tbaa !1874
  %69 = load i64, i64 addrspace(5)* %20, align 8, !tbaa !1874
  %70 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !1870
  %71 = load i32, i32 addrspace(5)* %22, align 4, !tbaa !1870
  call fastcc void @4(%1 addrspace(1)* noundef %59, %2 addrspace(1)* noundef %60, i32 noundef %61, i64 noundef %62, i64 noundef %63, i64 noundef %64, i64 noundef %65, i64 noundef %66, i64 noundef %67, i64 noundef %68, i64 noundef %69, i32 noundef %70, i32 noundef %71) #22
  %72 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %23, align 8, !tbaa !1876
  %73 = load i64, i64 addrspace(5)* %24, align 8, !tbaa !1874
  %74 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !1870
  %75 = load i32, i32 addrspace(5)* %22, align 4, !tbaa !1870
  call fastcc void @5(%0 addrspace(1)* noundef %72, i64 noundef %73, i32 noundef %74, i32 noundef %75) #22
  %76 = bitcast <2 x i64> addrspace(5)* %27 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 16, i8 addrspace(5)* %76) #18
  %77 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(5)* %25, align 8, !tbaa !1876
  %78 = load %2 addrspace(1)*, %2 addrspace(1)* addrspace(5)* %26, align 8, !tbaa !1876
  %79 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !1870
  %80 = load i32, i32 addrspace(5)* %22, align 4, !tbaa !1870
  %81 = call fastcc <2 x i64> @6(%1 addrspace(1)* noundef %77, %2 addrspace(1)* noundef %78, i32 noundef %79, i32 noundef %80) #22
  store <2 x i64> %81, <2 x i64> addrspace(5)* %27, align 16, !tbaa !1883
  %82 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %23, align 8, !tbaa !1876
  %83 = load i64, i64 addrspace(5)* %24, align 8, !tbaa !1874
  %84 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !1870
  %85 = load i32, i32 addrspace(5)* %22, align 4, !tbaa !1870
  call fastcc void @7(%0 addrspace(1)* noundef %82, i64 noundef %83, i32 noundef %84, i32 noundef %85) #22
  %86 = load <2 x i64>, <2 x i64> addrspace(5)* %27, align 16, !tbaa !1883
  %87 = bitcast <2 x i64> addrspace(5)* %27 to i8 addrspace(5)*
  call void @llvm.lifetime.end.p5i8(i64 16, i8 addrspace(5)* %87) #18
  %88 = bitcast %2 addrspace(1)* addrspace(5)* %26 to i8 addrspace(5)*
  call void @llvm.lifetime.end.p5i8(i64 8, i8 addrspace(5)* %88) #18
  %89 = bitcast %1 addrspace(1)* addrspace(5)* %25 to i8 addrspace(5)*
  call void @llvm.lifetime.end.p5i8(i64 8, i8 addrspace(5)* %89) #18
  %90 = bitcast i64 addrspace(5)* %24 to i8 addrspace(5)*
  call void @llvm.lifetime.end.p5i8(i64 8, i8 addrspace(5)* %90) #18
  %91 = bitcast %0 addrspace(1)* addrspace(5)* %23 to i8 addrspace(5)*
  call void @llvm.lifetime.end.p5i8(i64 8, i8 addrspace(5)* %91) #18
  %92 = bitcast i32 addrspace(5)* %22 to i8 addrspace(5)*
  call void @llvm.lifetime.end.p5i8(i64 4, i8 addrspace(5)* %92) #18
  %93 = bitcast i32 addrspace(5)* %21 to i8 addrspace(5)*
  call void @llvm.lifetime.end.p5i8(i64 4, i8 addrspace(5)* %93) #18
  ret <2 x i64> %86
}

; Function Attrs: alwaysinline convergent mustprogress nofree norecurse nosync nounwind readnone willreturn
define internal i32 @__ockl_lane_u32() local_unnamed_addr #12 {
  %1 = load i8, i8 addrspace(4)* @__oclc_wavefrontsize64, align 1, !tbaa !1884, !range !1886
  %2 = icmp eq i8 %1, 0
  %3 = tail call i32 @llvm.amdgcn.mbcnt.lo(i32 -1, i32 0)
  br i1 %2, label %6, label %4

4:                                                ; preds = %0
  %5 = tail call i32 @llvm.amdgcn.mbcnt.hi(i32 -1, i32 %3)
  br label %6

6:                                                ; preds = %4, %0
  %7 = phi i32 [ %5, %4 ], [ %3, %0 ]
  ret i32 %7
}

; Function Attrs: convergent norecurse nounwind
define internal fastcc i32 @0(i32 noundef %0) unnamed_addr #13 {
  %2 = tail call i32 asm sideeffect "; ockl readfirstlane hoisting hack $0", "=v,0"(i32 %0) #21, !srcloc !1887
  ret i32 %2
}

; Function Attrs: convergent nounwind readnone willreturn
declare i32 @llvm.amdgcn.readfirstlane(i32) #14

; Function Attrs: convergent norecurse nounwind
define internal fastcc i64 @1(%0 addrspace(1)* nocapture noundef %0, i32 noundef %1, i32 noundef %2) unnamed_addr #13 {
  %4 = icmp eq i32 %1, %2
  br i1 %4, label %5, label %30

5:                                                ; preds = %3
  %6 = getelementptr inbounds %0, %0 addrspace(1)* %0, i64 0, i32 3
  %7 = load atomic i64, i64 addrspace(1)* %6 syncscope("one-as") acquire, align 8
  %8 = getelementptr %0, %0 addrspace(1)* %0, i64 0, i32 0
  %9 = getelementptr %0, %0 addrspace(1)* %0, i64 0, i32 5
  %10 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %8, align 8, !tbaa !1878
  %11 = load i64, i64 addrspace(1)* %9, align 8, !tbaa !1881
  %12 = and i64 %11, %7
  %13 = getelementptr inbounds %1, %1 addrspace(1)* %10, i64 %12, i32 0
  %14 = load atomic i64, i64 addrspace(1)* %13 syncscope("one-as") monotonic, align 8
  %15 = cmpxchg i64 addrspace(1)* %6, i64 %7, i64 %14 syncscope("one-as") acquire monotonic, align 8
  %16 = extractvalue { i64, i1 } %15, 1
  br i1 %16, label %27, label %17

17:                                               ; preds = %17, %5
  %18 = phi { i64, i1 } [ %25, %17 ], [ %15, %5 ]
  %19 = extractvalue { i64, i1 } %18, 0
  tail call void @llvm.amdgcn.s.sleep(i32 1) #18
  %20 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %8, align 8, !tbaa !1878
  %21 = load i64, i64 addrspace(1)* %9, align 8, !tbaa !1881
  %22 = and i64 %21, %19
  %23 = getelementptr inbounds %1, %1 addrspace(1)* %20, i64 %22, i32 0
  %24 = load atomic i64, i64 addrspace(1)* %23 syncscope("one-as") monotonic, align 8
  %25 = cmpxchg i64 addrspace(1)* %6, i64 %19, i64 %24 syncscope("one-as") acquire monotonic, align 8
  %26 = extractvalue { i64, i1 } %25, 1
  br i1 %26, label %27, label %17

27:                                               ; preds = %17, %5
  %28 = phi { i64, i1 } [ %15, %5 ], [ %25, %17 ]
  %29 = extractvalue { i64, i1 } %28, 0
  br label %30

30:                                               ; preds = %27, %3
  %31 = phi i64 [ %29, %27 ], [ 0, %3 ]
  %32 = trunc i64 %31 to i32
  %33 = lshr i64 %31, 32
  %34 = trunc i64 %33 to i32
  %35 = tail call i32 @llvm.amdgcn.readfirstlane(i32 %32)
  %36 = tail call i32 @llvm.amdgcn.readfirstlane(i32 %34)
  %37 = zext i32 %36 to i64
  %38 = shl nuw i64 %37, 32
  %39 = zext i32 %35 to i64
  %40 = or i64 %38, %39
  ret i64 %40
}

; Function Attrs: argmemonly convergent mustprogress nofree norecurse nosync nounwind readonly willreturn
define internal fastcc %1 addrspace(1)* @2(%1 addrspace(1)* %0, i64 %1, i64 noundef %2) unnamed_addr #15 {
  %4 = and i64 %2, %1
  %5 = getelementptr inbounds %1, %1 addrspace(1)* %0, i64 %4
  ret %1 addrspace(1)* %5
}

; Function Attrs: argmemonly convergent mustprogress nofree norecurse nosync nounwind readonly willreturn
define internal fastcc %2 addrspace(1)* @3(%2 addrspace(1)* %0, i64 %1, i64 noundef %2) unnamed_addr #15 {
  %4 = and i64 %2, %1
  %5 = getelementptr inbounds %2, %2 addrspace(1)* %0, i64 %4
  ret %2 addrspace(1)* %5
}

; Function Attrs: convergent mustprogress nofree norecurse nounwind willreturn
define internal fastcc void @4(%1 addrspace(1)* nocapture noundef writeonly %0, %2 addrspace(1)* nocapture noundef writeonly %1, i32 noundef %2, i64 noundef %3, i64 noundef %4, i64 noundef %5, i64 noundef %6, i64 noundef %7, i64 noundef %8, i64 noundef %9, i64 noundef %10, i32 noundef %11, i32 noundef %12) unnamed_addr #16 {
  %14 = tail call i64 @llvm.read_register.i64(metadata !1888) #22
  %15 = icmp eq i32 %11, %12
  br i1 %15, label %16, label %20

16:                                               ; preds = %13
  %17 = getelementptr inbounds %1, %1 addrspace(1)* %0, i64 0, i32 3
  %18 = getelementptr inbounds %1, %1 addrspace(1)* %0, i64 0, i32 1
  %19 = getelementptr inbounds %1, %1 addrspace(1)* %0, i64 0, i32 2
  store i32 %2, i32 addrspace(1)* %19, align 8, !tbaa !1889
  store i64 %14, i64 addrspace(1)* %18, align 8, !tbaa !1891
  store i32 1, i32 addrspace(1)* %17, align 4, !tbaa !1892
  br label %20

20:                                               ; preds = %16, %13
  %21 = zext i32 %11 to i64
  %22 = getelementptr inbounds %2, %2 addrspace(1)* %1, i64 0, i32 0, i64 %21, i64 0
  store i64 %3, i64 addrspace(1)* %22, align 8, !tbaa !1874
  %23 = getelementptr inbounds %2, %2 addrspace(1)* %1, i64 0, i32 0, i64 %21, i64 1
  store i64 %4, i64 addrspace(1)* %23, align 8, !tbaa !1874
  %24 = getelementptr inbounds %2, %2 addrspace(1)* %1, i64 0, i32 0, i64 %21, i64 2
  store i64 %5, i64 addrspace(1)* %24, align 8, !tbaa !1874
  %25 = getelementptr inbounds %2, %2 addrspace(1)* %1, i64 0, i32 0, i64 %21, i64 3
  store i64 %6, i64 addrspace(1)* %25, align 8, !tbaa !1874
  %26 = getelementptr inbounds %2, %2 addrspace(1)* %1, i64 0, i32 0, i64 %21, i64 4
  store i64 %7, i64 addrspace(1)* %26, align 8, !tbaa !1874
  %27 = getelementptr inbounds %2, %2 addrspace(1)* %1, i64 0, i32 0, i64 %21, i64 5
  store i64 %8, i64 addrspace(1)* %27, align 8, !tbaa !1874
  %28 = getelementptr inbounds %2, %2 addrspace(1)* %1, i64 0, i32 0, i64 %21, i64 6
  store i64 %9, i64 addrspace(1)* %28, align 8, !tbaa !1874
  %29 = getelementptr inbounds %2, %2 addrspace(1)* %1, i64 0, i32 0, i64 %21, i64 7
  store i64 %10, i64 addrspace(1)* %29, align 8, !tbaa !1874
  ret void
}

; Function Attrs: convergent norecurse nounwind
define internal fastcc void @5(%0 addrspace(1)* nocapture noundef %0, i64 noundef %1, i32 noundef %2, i32 noundef %3) unnamed_addr #13 {
  %5 = icmp eq i32 %2, %3
  br i1 %5, label %6, label %25

6:                                                ; preds = %4
  %7 = getelementptr inbounds %0, %0 addrspace(1)* %0, i64 0, i32 4
  %8 = load atomic i64, i64 addrspace(1)* %7 syncscope("one-as") monotonic, align 8
  %9 = getelementptr %0, %0 addrspace(1)* %0, i64 0, i32 0
  %10 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %9, align 8, !tbaa !1878
  %11 = getelementptr %0, %0 addrspace(1)* %0, i64 0, i32 5
  %12 = load i64, i64 addrspace(1)* %11, align 8, !tbaa !1881
  %13 = and i64 %12, %1
  %14 = getelementptr inbounds %1, %1 addrspace(1)* %10, i64 %13, i32 0
  store i64 %8, i64 addrspace(1)* %14, align 8, !tbaa !1893
  %15 = cmpxchg i64 addrspace(1)* %7, i64 %8, i64 %1 syncscope("one-as") release monotonic, align 8
  %16 = extractvalue { i64, i1 } %15, 1
  br i1 %16, label %22, label %17

17:                                               ; preds = %17, %6
  %18 = phi { i64, i1 } [ %20, %17 ], [ %15, %6 ]
  %19 = extractvalue { i64, i1 } %18, 0
  tail call void @llvm.amdgcn.s.sleep(i32 1) #18
  store i64 %19, i64 addrspace(1)* %14, align 8, !tbaa !1893
  %20 = cmpxchg i64 addrspace(1)* %7, i64 %19, i64 %1 syncscope("one-as") release monotonic, align 8
  %21 = extractvalue { i64, i1 } %20, 1
  br i1 %21, label %22, label %17

22:                                               ; preds = %17, %6
  %23 = getelementptr inbounds %0, %0 addrspace(1)* %0, i64 0, i32 2, i32 0
  %24 = load i64, i64 addrspace(1)* %23, align 8
  tail call void @__ockl_hsa_signal_add(i64 %24, i64 noundef 1, i32 noundef 3) #21
  br label %25

25:                                               ; preds = %22, %4
  ret void
}

; Function Attrs: convergent norecurse nounwind
define internal fastcc <2 x i64> @6(%1 addrspace(1)* nocapture noundef readonly %0, %2 addrspace(1)* nocapture noundef readonly %1, i32 noundef %2, i32 noundef %3) unnamed_addr #10 {
  %5 = icmp eq i32 %2, %3
  %6 = getelementptr inbounds %1, %1 addrspace(1)* %0, i64 0, i32 3
  br label %7

7:                                                ; preds = %15, %4
  br i1 %5, label %8, label %11

8:                                                ; preds = %7
  %9 = load atomic i32, i32 addrspace(1)* %6 syncscope("one-as") acquire, align 4
  %10 = and i32 %9, 1
  br label %11

11:                                               ; preds = %8, %7
  %12 = phi i32 [ %10, %8 ], [ 1, %7 ]
  %13 = tail call i32 @llvm.amdgcn.readfirstlane(i32 %12)
  %14 = icmp eq i32 %13, 0
  br i1 %14, label %16, label %15

15:                                               ; preds = %11
  tail call void @llvm.amdgcn.s.sleep(i32 1)
  br label %7

16:                                               ; preds = %11
  %17 = zext i32 %2 to i64
  %18 = getelementptr inbounds %2, %2 addrspace(1)* %1, i64 0, i32 0, i64 %17, i64 0
  %19 = getelementptr inbounds %2, %2 addrspace(1)* %1, i64 0, i32 0, i64 %17, i64 1
  %20 = load i64, i64 addrspace(1)* %18, align 8, !tbaa !1874
  %21 = load i64, i64 addrspace(1)* %19, align 8, !tbaa !1874
  %22 = insertelement <2 x i64> undef, i64 %20, i64 0
  %23 = insertelement <2 x i64> %22, i64 %21, i64 1
  ret <2 x i64> %23
}

; Function Attrs: convergent norecurse nounwind
define internal fastcc void @7(%0 addrspace(1)* nocapture noundef %0, i64 noundef %1, i32 noundef %2, i32 noundef %3) unnamed_addr #13 {
  %5 = icmp eq i32 %2, %3
  br i1 %5, label %6, label %26

6:                                                ; preds = %4
  %7 = getelementptr inbounds %0, %0 addrspace(1)* %0, i64 0, i32 5
  %8 = load i64, i64 addrspace(1)* %7, align 8, !tbaa !1881
  %9 = add i64 %8, 1
  %10 = add i64 %9, %1
  %11 = icmp eq i64 %10, 0
  %12 = select i1 %11, i64 %9, i64 %10
  %13 = getelementptr inbounds %0, %0 addrspace(1)* %0, i64 0, i32 3
  %14 = load atomic i64, i64 addrspace(1)* %13 syncscope("one-as") monotonic, align 8
  %15 = getelementptr %0, %0 addrspace(1)* %0, i64 0, i32 0
  %16 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %15, align 8, !tbaa !1878
  %17 = and i64 %12, %8
  %18 = getelementptr inbounds %1, %1 addrspace(1)* %16, i64 %17, i32 0
  store i64 %14, i64 addrspace(1)* %18, align 8, !tbaa !1893
  %19 = cmpxchg i64 addrspace(1)* %13, i64 %14, i64 %12 syncscope("one-as") release monotonic, align 8
  %20 = extractvalue { i64, i1 } %19, 1
  br i1 %20, label %26, label %21

21:                                               ; preds = %21, %6
  %22 = phi { i64, i1 } [ %24, %21 ], [ %19, %6 ]
  %23 = extractvalue { i64, i1 } %22, 0
  tail call void @llvm.amdgcn.s.sleep(i32 1) #18
  store i64 %23, i64 addrspace(1)* %18, align 8, !tbaa !1893
  %24 = cmpxchg i64 addrspace(1)* %13, i64 %23, i64 %12 syncscope("one-as") release monotonic, align 8
  %25 = extractvalue { i64, i1 } %24, 1
  br i1 %25, label %26, label %21

26:                                               ; preds = %21, %6, %4
  ret void
}

; Function Attrs: nounwind willreturn
declare void @llvm.amdgcn.s.sleep(i32 immarg) #17

; Function Attrs: convergent norecurse nounwind
define internal void @__ockl_hsa_signal_add(i64 %0, i64 noundef %1, i32 noundef %2) local_unnamed_addr #13 {
  %4 = inttoptr i64 %0 to %4 addrspace(1)*
  %5 = getelementptr inbounds %4, %4 addrspace(1)* %4, i64 0, i32 1, i32 0
  switch i32 %2, label %6 [
    i32 1, label %8
    i32 2, label %8
    i32 3, label %10
    i32 4, label %12
    i32 5, label %14
  ]

6:                                                ; preds = %3
  %7 = atomicrmw add i64 addrspace(1)* %5, i64 %1 syncscope("one-as") monotonic, align 8
  br label %16

8:                                                ; preds = %3, %3
  %9 = atomicrmw add i64 addrspace(1)* %5, i64 %1 syncscope("one-as") acquire, align 8
  br label %16

10:                                               ; preds = %3
  %11 = atomicrmw add i64 addrspace(1)* %5, i64 %1 syncscope("one-as") release, align 8
  br label %16

12:                                               ; preds = %3
  %13 = atomicrmw add i64 addrspace(1)* %5, i64 %1 syncscope("one-as") acq_rel, align 8
  br label %16

14:                                               ; preds = %3
  %15 = atomicrmw add i64 addrspace(1)* %5, i64 %1 seq_cst, align 8
  br label %16

16:                                               ; preds = %14, %12, %10, %8, %6
  %17 = getelementptr inbounds %4, %4 addrspace(1)* %4, i64 0, i32 2
  %18 = load i64, i64 addrspace(1)* %17, align 16, !tbaa !1894
  %19 = icmp eq i64 %18, 0
  br i1 %19, label %27, label %20

20:                                               ; preds = %16
  %21 = inttoptr i64 %18 to i64 addrspace(1)*
  %22 = getelementptr inbounds %4, %4 addrspace(1)* %4, i64 0, i32 3
  %23 = load i32, i32 addrspace(1)* %22, align 8, !tbaa !1896
  %24 = zext i32 %23 to i64
  store atomic i64 %24, i64 addrspace(1)* %21 syncscope("one-as") release, align 8
  %25 = tail call i32 @llvm.amdgcn.readfirstlane(i32 %23) #18
  %26 = and i32 %25, 255
  tail call void @llvm.amdgcn.s.sendmsg(i32 1, i32 %26) #18
  br label %27

27:                                               ; preds = %20, %16
  ret void
}

; Function Attrs: nounwind
declare void @llvm.amdgcn.s.sendmsg(i32 immarg, i32) #18

; Function Attrs: nounwind readonly
declare i64 @llvm.read_register.i64(metadata) #19

; Function Attrs: nounwind readnone willreturn
declare i32 @llvm.amdgcn.mbcnt.lo(i32, i32) #20

; Function Attrs: nounwind readnone willreturn
declare i32 @llvm.amdgcn.mbcnt.hi(i32, i32) #20

; Function Attrs: convergent norecurse nounwind
define internal i64 @__ockl_fprintf_append_args(i64 noundef %0, i32 noundef %1, i64 noundef %2, i64 noundef %3, i64 noundef %4, i64 noundef %5, i64 noundef %6, i64 noundef %7, i64 noundef %8, i32 noundef %9) #10 {
  %11 = icmp eq i32 %9, 0
  %12 = or i64 %0, 2
  %13 = select i1 %11, i64 %0, i64 %12
  %14 = and i64 %13, -225
  %15 = zext i32 %1 to i64
  %16 = shl nuw nsw i64 %15, 5
  %17 = or i64 %14, %16
  %18 = tail call <2 x i64> @__ockl_hostcall_preview(i32 noundef 2, i64 noundef %17, i64 noundef %2, i64 noundef %3, i64 noundef %4, i64 noundef %5, i64 noundef %6, i64 noundef %7, i64 noundef %8) #21
  %19 = extractelement <2 x i64> %18, i64 0
  ret i64 %19
}

; Function Attrs: convergent norecurse nounwind
define internal i64 @__ockl_fprintf_append_string_n(i64 noundef %0, i8* noundef readonly %1, i64 noundef %2, i32 noundef %3) #10 {
  %5 = icmp eq i32 %3, 0
  %6 = or i64 %0, 2
  %7 = select i1 %5, i64 %0, i64 %6
  %8 = icmp eq i8* %1, null
  br i1 %8, label %9, label %13

9:                                                ; preds = %4
  %10 = and i64 %7, -225
  %11 = or i64 %10, 32
  %12 = tail call <2 x i64> @__ockl_hostcall_preview(i32 noundef 2, i64 noundef %11, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #21
  br label %454

13:                                               ; preds = %4
  %14 = and i64 %7, 2
  %15 = and i64 %7, -3
  %16 = insertelement <2 x i64> <i64 poison, i64 0>, i64 %15, i64 0
  br label %17

17:                                               ; preds = %443, %13
  %18 = phi i64 [ %2, %13 ], [ %451, %443 ]
  %19 = phi i8* [ %1, %13 ], [ %452, %443 ]
  %20 = phi <2 x i64> [ %16, %13 ], [ %450, %443 ]
  %21 = icmp ugt i64 %18, 56
  %22 = extractelement <2 x i64> %20, i64 0
  %23 = or i64 %22, %14
  %24 = insertelement <2 x i64> poison, i64 %23, i64 0
  %25 = select i1 %21, <2 x i64> %20, <2 x i64> %24
  %26 = tail call i64 @llvm.umin.i64(i64 %18, i64 56) #18
  %27 = trunc i64 %26 to i32
  %28 = extractelement <2 x i64> %25, i64 0
  %29 = icmp ugt i32 %27, 7
  br i1 %29, label %32, label %30

30:                                               ; preds = %17
  %31 = icmp eq i32 %27, 0
  br i1 %31, label %85, label %72

32:                                               ; preds = %17
  %33 = load i8, i8* %19, align 1, !tbaa !1883
  %34 = zext i8 %33 to i64
  %35 = getelementptr inbounds i8, i8* %19, i64 1
  %36 = load i8, i8* %35, align 1, !tbaa !1883
  %37 = zext i8 %36 to i64
  %38 = shl nuw nsw i64 %37, 8
  %39 = or i64 %38, %34
  %40 = getelementptr inbounds i8, i8* %19, i64 2
  %41 = load i8, i8* %40, align 1, !tbaa !1883
  %42 = zext i8 %41 to i64
  %43 = shl nuw nsw i64 %42, 16
  %44 = or i64 %39, %43
  %45 = getelementptr inbounds i8, i8* %19, i64 3
  %46 = load i8, i8* %45, align 1, !tbaa !1883
  %47 = zext i8 %46 to i64
  %48 = shl nuw nsw i64 %47, 24
  %49 = or i64 %44, %48
  %50 = getelementptr inbounds i8, i8* %19, i64 4
  %51 = load i8, i8* %50, align 1, !tbaa !1883
  %52 = zext i8 %51 to i64
  %53 = shl nuw nsw i64 %52, 32
  %54 = or i64 %49, %53
  %55 = getelementptr inbounds i8, i8* %19, i64 5
  %56 = load i8, i8* %55, align 1, !tbaa !1883
  %57 = zext i8 %56 to i64
  %58 = shl nuw nsw i64 %57, 40
  %59 = or i64 %54, %58
  %60 = getelementptr inbounds i8, i8* %19, i64 6
  %61 = load i8, i8* %60, align 1, !tbaa !1883
  %62 = zext i8 %61 to i64
  %63 = shl nuw nsw i64 %62, 48
  %64 = or i64 %59, %63
  %65 = getelementptr inbounds i8, i8* %19, i64 7
  %66 = load i8, i8* %65, align 1, !tbaa !1883
  %67 = zext i8 %66 to i64
  %68 = shl nuw i64 %67, 56
  %69 = or i64 %64, %68
  %70 = add nsw i32 %27, -8
  %71 = getelementptr inbounds i8, i8* %19, i64 8
  br label %85

72:                                               ; preds = %72, %30
  %73 = phi i32 [ %83, %72 ], [ 0, %30 ]
  %74 = phi i64 [ %82, %72 ], [ 0, %30 ]
  %75 = zext i32 %73 to i64
  %76 = getelementptr inbounds i8, i8* %19, i64 %75
  %77 = load i8, i8* %76, align 1, !tbaa !1883
  %78 = zext i8 %77 to i64
  %79 = shl i32 %73, 3
  %80 = zext i32 %79 to i64
  %81 = shl nuw i64 %78, %80
  %82 = or i64 %81, %74
  %83 = add nuw nsw i32 %73, 1
  %84 = icmp eq i32 %83, %27
  br i1 %84, label %85, label %72

85:                                               ; preds = %72, %32, %30
  %86 = phi i8* [ %71, %32 ], [ %19, %30 ], [ %19, %72 ]
  %87 = phi i32 [ %70, %32 ], [ 0, %30 ], [ 0, %72 ]
  %88 = phi i64 [ %69, %32 ], [ 0, %30 ], [ %82, %72 ]
  %89 = icmp ugt i32 %87, 7
  br i1 %89, label %92, label %90

90:                                               ; preds = %85
  %91 = icmp eq i32 %87, 0
  br i1 %91, label %145, label %132

92:                                               ; preds = %85
  %93 = load i8, i8* %86, align 1, !tbaa !1883
  %94 = zext i8 %93 to i64
  %95 = getelementptr inbounds i8, i8* %86, i64 1
  %96 = load i8, i8* %95, align 1, !tbaa !1883
  %97 = zext i8 %96 to i64
  %98 = shl nuw nsw i64 %97, 8
  %99 = or i64 %98, %94
  %100 = getelementptr inbounds i8, i8* %86, i64 2
  %101 = load i8, i8* %100, align 1, !tbaa !1883
  %102 = zext i8 %101 to i64
  %103 = shl nuw nsw i64 %102, 16
  %104 = or i64 %99, %103
  %105 = getelementptr inbounds i8, i8* %86, i64 3
  %106 = load i8, i8* %105, align 1, !tbaa !1883
  %107 = zext i8 %106 to i64
  %108 = shl nuw nsw i64 %107, 24
  %109 = or i64 %104, %108
  %110 = getelementptr inbounds i8, i8* %86, i64 4
  %111 = load i8, i8* %110, align 1, !tbaa !1883
  %112 = zext i8 %111 to i64
  %113 = shl nuw nsw i64 %112, 32
  %114 = or i64 %109, %113
  %115 = getelementptr inbounds i8, i8* %86, i64 5
  %116 = load i8, i8* %115, align 1, !tbaa !1883
  %117 = zext i8 %116 to i64
  %118 = shl nuw nsw i64 %117, 40
  %119 = or i64 %114, %118
  %120 = getelementptr inbounds i8, i8* %86, i64 6
  %121 = load i8, i8* %120, align 1, !tbaa !1883
  %122 = zext i8 %121 to i64
  %123 = shl nuw nsw i64 %122, 48
  %124 = or i64 %119, %123
  %125 = getelementptr inbounds i8, i8* %86, i64 7
  %126 = load i8, i8* %125, align 1, !tbaa !1883
  %127 = zext i8 %126 to i64
  %128 = shl nuw i64 %127, 56
  %129 = or i64 %124, %128
  %130 = add nsw i32 %87, -8
  %131 = getelementptr inbounds i8, i8* %86, i64 8
  br label %145

132:                                              ; preds = %132, %90
  %133 = phi i32 [ %143, %132 ], [ 0, %90 ]
  %134 = phi i64 [ %142, %132 ], [ 0, %90 ]
  %135 = zext i32 %133 to i64
  %136 = getelementptr inbounds i8, i8* %86, i64 %135
  %137 = load i8, i8* %136, align 1, !tbaa !1883
  %138 = zext i8 %137 to i64
  %139 = shl i32 %133, 3
  %140 = zext i32 %139 to i64
  %141 = shl nuw i64 %138, %140
  %142 = or i64 %141, %134
  %143 = add nuw nsw i32 %133, 1
  %144 = icmp eq i32 %143, %87
  br i1 %144, label %145, label %132

145:                                              ; preds = %132, %92, %90
  %146 = phi i8* [ %131, %92 ], [ %86, %90 ], [ %86, %132 ]
  %147 = phi i32 [ %130, %92 ], [ 0, %90 ], [ 0, %132 ]
  %148 = phi i64 [ %129, %92 ], [ 0, %90 ], [ %142, %132 ]
  %149 = icmp ugt i32 %147, 7
  br i1 %149, label %152, label %150

150:                                              ; preds = %145
  %151 = icmp eq i32 %147, 0
  br i1 %151, label %205, label %192

152:                                              ; preds = %145
  %153 = load i8, i8* %146, align 1, !tbaa !1883
  %154 = zext i8 %153 to i64
  %155 = getelementptr inbounds i8, i8* %146, i64 1
  %156 = load i8, i8* %155, align 1, !tbaa !1883
  %157 = zext i8 %156 to i64
  %158 = shl nuw nsw i64 %157, 8
  %159 = or i64 %158, %154
  %160 = getelementptr inbounds i8, i8* %146, i64 2
  %161 = load i8, i8* %160, align 1, !tbaa !1883
  %162 = zext i8 %161 to i64
  %163 = shl nuw nsw i64 %162, 16
  %164 = or i64 %159, %163
  %165 = getelementptr inbounds i8, i8* %146, i64 3
  %166 = load i8, i8* %165, align 1, !tbaa !1883
  %167 = zext i8 %166 to i64
  %168 = shl nuw nsw i64 %167, 24
  %169 = or i64 %164, %168
  %170 = getelementptr inbounds i8, i8* %146, i64 4
  %171 = load i8, i8* %170, align 1, !tbaa !1883
  %172 = zext i8 %171 to i64
  %173 = shl nuw nsw i64 %172, 32
  %174 = or i64 %169, %173
  %175 = getelementptr inbounds i8, i8* %146, i64 5
  %176 = load i8, i8* %175, align 1, !tbaa !1883
  %177 = zext i8 %176 to i64
  %178 = shl nuw nsw i64 %177, 40
  %179 = or i64 %174, %178
  %180 = getelementptr inbounds i8, i8* %146, i64 6
  %181 = load i8, i8* %180, align 1, !tbaa !1883
  %182 = zext i8 %181 to i64
  %183 = shl nuw nsw i64 %182, 48
  %184 = or i64 %179, %183
  %185 = getelementptr inbounds i8, i8* %146, i64 7
  %186 = load i8, i8* %185, align 1, !tbaa !1883
  %187 = zext i8 %186 to i64
  %188 = shl nuw i64 %187, 56
  %189 = or i64 %184, %188
  %190 = add nsw i32 %147, -8
  %191 = getelementptr inbounds i8, i8* %146, i64 8
  br label %205

192:                                              ; preds = %192, %150
  %193 = phi i32 [ %203, %192 ], [ 0, %150 ]
  %194 = phi i64 [ %202, %192 ], [ 0, %150 ]
  %195 = zext i32 %193 to i64
  %196 = getelementptr inbounds i8, i8* %146, i64 %195
  %197 = load i8, i8* %196, align 1, !tbaa !1883
  %198 = zext i8 %197 to i64
  %199 = shl i32 %193, 3
  %200 = zext i32 %199 to i64
  %201 = shl nuw i64 %198, %200
  %202 = or i64 %201, %194
  %203 = add nuw nsw i32 %193, 1
  %204 = icmp eq i32 %203, %147
  br i1 %204, label %205, label %192

205:                                              ; preds = %192, %152, %150
  %206 = phi i8* [ %191, %152 ], [ %146, %150 ], [ %146, %192 ]
  %207 = phi i32 [ %190, %152 ], [ 0, %150 ], [ 0, %192 ]
  %208 = phi i64 [ %189, %152 ], [ 0, %150 ], [ %202, %192 ]
  %209 = icmp ugt i32 %207, 7
  br i1 %209, label %212, label %210

210:                                              ; preds = %205
  %211 = icmp eq i32 %207, 0
  br i1 %211, label %265, label %252

212:                                              ; preds = %205
  %213 = load i8, i8* %206, align 1, !tbaa !1883
  %214 = zext i8 %213 to i64
  %215 = getelementptr inbounds i8, i8* %206, i64 1
  %216 = load i8, i8* %215, align 1, !tbaa !1883
  %217 = zext i8 %216 to i64
  %218 = shl nuw nsw i64 %217, 8
  %219 = or i64 %218, %214
  %220 = getelementptr inbounds i8, i8* %206, i64 2
  %221 = load i8, i8* %220, align 1, !tbaa !1883
  %222 = zext i8 %221 to i64
  %223 = shl nuw nsw i64 %222, 16
  %224 = or i64 %219, %223
  %225 = getelementptr inbounds i8, i8* %206, i64 3
  %226 = load i8, i8* %225, align 1, !tbaa !1883
  %227 = zext i8 %226 to i64
  %228 = shl nuw nsw i64 %227, 24
  %229 = or i64 %224, %228
  %230 = getelementptr inbounds i8, i8* %206, i64 4
  %231 = load i8, i8* %230, align 1, !tbaa !1883
  %232 = zext i8 %231 to i64
  %233 = shl nuw nsw i64 %232, 32
  %234 = or i64 %229, %233
  %235 = getelementptr inbounds i8, i8* %206, i64 5
  %236 = load i8, i8* %235, align 1, !tbaa !1883
  %237 = zext i8 %236 to i64
  %238 = shl nuw nsw i64 %237, 40
  %239 = or i64 %234, %238
  %240 = getelementptr inbounds i8, i8* %206, i64 6
  %241 = load i8, i8* %240, align 1, !tbaa !1883
  %242 = zext i8 %241 to i64
  %243 = shl nuw nsw i64 %242, 48
  %244 = or i64 %239, %243
  %245 = getelementptr inbounds i8, i8* %206, i64 7
  %246 = load i8, i8* %245, align 1, !tbaa !1883
  %247 = zext i8 %246 to i64
  %248 = shl nuw i64 %247, 56
  %249 = or i64 %244, %248
  %250 = add nsw i32 %207, -8
  %251 = getelementptr inbounds i8, i8* %206, i64 8
  br label %265

252:                                              ; preds = %252, %210
  %253 = phi i32 [ %263, %252 ], [ 0, %210 ]
  %254 = phi i64 [ %262, %252 ], [ 0, %210 ]
  %255 = zext i32 %253 to i64
  %256 = getelementptr inbounds i8, i8* %206, i64 %255
  %257 = load i8, i8* %256, align 1, !tbaa !1883
  %258 = zext i8 %257 to i64
  %259 = shl i32 %253, 3
  %260 = zext i32 %259 to i64
  %261 = shl nuw i64 %258, %260
  %262 = or i64 %261, %254
  %263 = add nuw nsw i32 %253, 1
  %264 = icmp eq i32 %263, %207
  br i1 %264, label %265, label %252

265:                                              ; preds = %252, %212, %210
  %266 = phi i8* [ %251, %212 ], [ %206, %210 ], [ %206, %252 ]
  %267 = phi i32 [ %250, %212 ], [ 0, %210 ], [ 0, %252 ]
  %268 = phi i64 [ %249, %212 ], [ 0, %210 ], [ %262, %252 ]
  %269 = icmp ugt i32 %267, 7
  br i1 %269, label %272, label %270

270:                                              ; preds = %265
  %271 = icmp eq i32 %267, 0
  br i1 %271, label %325, label %312

272:                                              ; preds = %265
  %273 = load i8, i8* %266, align 1, !tbaa !1883
  %274 = zext i8 %273 to i64
  %275 = getelementptr inbounds i8, i8* %266, i64 1
  %276 = load i8, i8* %275, align 1, !tbaa !1883
  %277 = zext i8 %276 to i64
  %278 = shl nuw nsw i64 %277, 8
  %279 = or i64 %278, %274
  %280 = getelementptr inbounds i8, i8* %266, i64 2
  %281 = load i8, i8* %280, align 1, !tbaa !1883
  %282 = zext i8 %281 to i64
  %283 = shl nuw nsw i64 %282, 16
  %284 = or i64 %279, %283
  %285 = getelementptr inbounds i8, i8* %266, i64 3
  %286 = load i8, i8* %285, align 1, !tbaa !1883
  %287 = zext i8 %286 to i64
  %288 = shl nuw nsw i64 %287, 24
  %289 = or i64 %284, %288
  %290 = getelementptr inbounds i8, i8* %266, i64 4
  %291 = load i8, i8* %290, align 1, !tbaa !1883
  %292 = zext i8 %291 to i64
  %293 = shl nuw nsw i64 %292, 32
  %294 = or i64 %289, %293
  %295 = getelementptr inbounds i8, i8* %266, i64 5
  %296 = load i8, i8* %295, align 1, !tbaa !1883
  %297 = zext i8 %296 to i64
  %298 = shl nuw nsw i64 %297, 40
  %299 = or i64 %294, %298
  %300 = getelementptr inbounds i8, i8* %266, i64 6
  %301 = load i8, i8* %300, align 1, !tbaa !1883
  %302 = zext i8 %301 to i64
  %303 = shl nuw nsw i64 %302, 48
  %304 = or i64 %299, %303
  %305 = getelementptr inbounds i8, i8* %266, i64 7
  %306 = load i8, i8* %305, align 1, !tbaa !1883
  %307 = zext i8 %306 to i64
  %308 = shl nuw i64 %307, 56
  %309 = or i64 %304, %308
  %310 = add nsw i32 %267, -8
  %311 = getelementptr inbounds i8, i8* %266, i64 8
  br label %325

312:                                              ; preds = %312, %270
  %313 = phi i32 [ %323, %312 ], [ 0, %270 ]
  %314 = phi i64 [ %322, %312 ], [ 0, %270 ]
  %315 = zext i32 %313 to i64
  %316 = getelementptr inbounds i8, i8* %266, i64 %315
  %317 = load i8, i8* %316, align 1, !tbaa !1883
  %318 = zext i8 %317 to i64
  %319 = shl i32 %313, 3
  %320 = zext i32 %319 to i64
  %321 = shl nuw i64 %318, %320
  %322 = or i64 %321, %314
  %323 = add nuw nsw i32 %313, 1
  %324 = icmp eq i32 %323, %267
  br i1 %324, label %325, label %312

325:                                              ; preds = %312, %272, %270
  %326 = phi i8* [ %311, %272 ], [ %266, %270 ], [ %266, %312 ]
  %327 = phi i32 [ %310, %272 ], [ 0, %270 ], [ 0, %312 ]
  %328 = phi i64 [ %309, %272 ], [ 0, %270 ], [ %322, %312 ]
  %329 = icmp ugt i32 %327, 7
  br i1 %329, label %332, label %330

330:                                              ; preds = %325
  %331 = icmp eq i32 %327, 0
  br i1 %331, label %385, label %372

332:                                              ; preds = %325
  %333 = load i8, i8* %326, align 1, !tbaa !1883
  %334 = zext i8 %333 to i64
  %335 = getelementptr inbounds i8, i8* %326, i64 1
  %336 = load i8, i8* %335, align 1, !tbaa !1883
  %337 = zext i8 %336 to i64
  %338 = shl nuw nsw i64 %337, 8
  %339 = or i64 %338, %334
  %340 = getelementptr inbounds i8, i8* %326, i64 2
  %341 = load i8, i8* %340, align 1, !tbaa !1883
  %342 = zext i8 %341 to i64
  %343 = shl nuw nsw i64 %342, 16
  %344 = or i64 %339, %343
  %345 = getelementptr inbounds i8, i8* %326, i64 3
  %346 = load i8, i8* %345, align 1, !tbaa !1883
  %347 = zext i8 %346 to i64
  %348 = shl nuw nsw i64 %347, 24
  %349 = or i64 %344, %348
  %350 = getelementptr inbounds i8, i8* %326, i64 4
  %351 = load i8, i8* %350, align 1, !tbaa !1883
  %352 = zext i8 %351 to i64
  %353 = shl nuw nsw i64 %352, 32
  %354 = or i64 %349, %353
  %355 = getelementptr inbounds i8, i8* %326, i64 5
  %356 = load i8, i8* %355, align 1, !tbaa !1883
  %357 = zext i8 %356 to i64
  %358 = shl nuw nsw i64 %357, 40
  %359 = or i64 %354, %358
  %360 = getelementptr inbounds i8, i8* %326, i64 6
  %361 = load i8, i8* %360, align 1, !tbaa !1883
  %362 = zext i8 %361 to i64
  %363 = shl nuw nsw i64 %362, 48
  %364 = or i64 %359, %363
  %365 = getelementptr inbounds i8, i8* %326, i64 7
  %366 = load i8, i8* %365, align 1, !tbaa !1883
  %367 = zext i8 %366 to i64
  %368 = shl nuw i64 %367, 56
  %369 = or i64 %364, %368
  %370 = add nsw i32 %327, -8
  %371 = getelementptr inbounds i8, i8* %326, i64 8
  br label %385

372:                                              ; preds = %372, %330
  %373 = phi i32 [ %383, %372 ], [ 0, %330 ]
  %374 = phi i64 [ %382, %372 ], [ 0, %330 ]
  %375 = zext i32 %373 to i64
  %376 = getelementptr inbounds i8, i8* %326, i64 %375
  %377 = load i8, i8* %376, align 1, !tbaa !1883
  %378 = zext i8 %377 to i64
  %379 = shl i32 %373, 3
  %380 = zext i32 %379 to i64
  %381 = shl nuw i64 %378, %380
  %382 = or i64 %381, %374
  %383 = add nuw nsw i32 %373, 1
  %384 = icmp eq i32 %383, %327
  br i1 %384, label %385, label %372

385:                                              ; preds = %372, %332, %330
  %386 = phi i8* [ %371, %332 ], [ %326, %330 ], [ %326, %372 ]
  %387 = phi i32 [ %370, %332 ], [ 0, %330 ], [ 0, %372 ]
  %388 = phi i64 [ %369, %332 ], [ 0, %330 ], [ %382, %372 ]
  %389 = icmp ugt i32 %387, 7
  br i1 %389, label %392, label %390

390:                                              ; preds = %385
  %391 = icmp eq i32 %387, 0
  br i1 %391, label %443, label %430

392:                                              ; preds = %385
  %393 = load i8, i8* %386, align 1, !tbaa !1883
  %394 = zext i8 %393 to i64
  %395 = getelementptr inbounds i8, i8* %386, i64 1
  %396 = load i8, i8* %395, align 1, !tbaa !1883
  %397 = zext i8 %396 to i64
  %398 = shl nuw nsw i64 %397, 8
  %399 = or i64 %398, %394
  %400 = getelementptr inbounds i8, i8* %386, i64 2
  %401 = load i8, i8* %400, align 1, !tbaa !1883
  %402 = zext i8 %401 to i64
  %403 = shl nuw nsw i64 %402, 16
  %404 = or i64 %399, %403
  %405 = getelementptr inbounds i8, i8* %386, i64 3
  %406 = load i8, i8* %405, align 1, !tbaa !1883
  %407 = zext i8 %406 to i64
  %408 = shl nuw nsw i64 %407, 24
  %409 = or i64 %404, %408
  %410 = getelementptr inbounds i8, i8* %386, i64 4
  %411 = load i8, i8* %410, align 1, !tbaa !1883
  %412 = zext i8 %411 to i64
  %413 = shl nuw nsw i64 %412, 32
  %414 = or i64 %409, %413
  %415 = getelementptr inbounds i8, i8* %386, i64 5
  %416 = load i8, i8* %415, align 1, !tbaa !1883
  %417 = zext i8 %416 to i64
  %418 = shl nuw nsw i64 %417, 40
  %419 = or i64 %414, %418
  %420 = getelementptr inbounds i8, i8* %386, i64 6
  %421 = load i8, i8* %420, align 1, !tbaa !1883
  %422 = zext i8 %421 to i64
  %423 = shl nuw nsw i64 %422, 48
  %424 = or i64 %419, %423
  %425 = getelementptr inbounds i8, i8* %386, i64 7
  %426 = load i8, i8* %425, align 1, !tbaa !1883
  %427 = zext i8 %426 to i64
  %428 = shl nuw i64 %427, 56
  %429 = or i64 %424, %428
  br label %443

430:                                              ; preds = %430, %390
  %431 = phi i32 [ %441, %430 ], [ 0, %390 ]
  %432 = phi i64 [ %440, %430 ], [ 0, %390 ]
  %433 = zext i32 %431 to i64
  %434 = getelementptr inbounds i8, i8* %386, i64 %433
  %435 = load i8, i8* %434, align 1, !tbaa !1883
  %436 = zext i8 %435 to i64
  %437 = shl i32 %431, 3
  %438 = zext i32 %437 to i64
  %439 = shl nuw i64 %436, %438
  %440 = or i64 %439, %432
  %441 = add nuw nsw i32 %431, 1
  %442 = icmp eq i32 %441, %387
  br i1 %442, label %443, label %430

443:                                              ; preds = %430, %392, %390
  %444 = phi i64 [ %429, %392 ], [ 0, %390 ], [ %440, %430 ]
  %445 = shl nuw nsw i64 %26, 2
  %446 = add nuw nsw i64 %445, 28
  %447 = and i64 %446, 480
  %448 = and i64 %28, -225
  %449 = or i64 %448, %447
  %450 = tail call <2 x i64> @__ockl_hostcall_preview(i32 noundef 2, i64 noundef %449, i64 noundef %88, i64 noundef %148, i64 noundef %208, i64 noundef %268, i64 noundef %328, i64 noundef %388, i64 noundef %444) #21
  %451 = sub i64 %18, %26
  %452 = getelementptr inbounds i8, i8* %19, i64 %26
  %453 = icmp eq i64 %451, 0
  br i1 %453, label %454, label %17

454:                                              ; preds = %443, %9
  %455 = phi <2 x i64> [ %12, %9 ], [ %450, %443 ]
  %456 = extractelement <2 x i64> %455, i64 0
  ret i64 %456
}

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.umin.i64(i64, i64) #3

attributes #0 = { convergent mustprogress noreturn nounwind "denormal-fp-math-f32"="preserve-sign,preserve-sign" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx803" "target-features"="+16-bit-insts,+ci-insts,+dpp,+flat-address-space,+gfx8-insts,+s-memrealtime,+s-memtime-inst" }
attributes #1 = { cold noreturn nounwind }
attributes #2 = { convergent mustprogress noinline nounwind "denormal-fp-math-f32"="preserve-sign,preserve-sign" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx803" "target-features"="+16-bit-insts,+ci-insts,+dpp,+flat-address-space,+gfx8-insts,+s-memrealtime,+s-memtime-inst" }
attributes #3 = { nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #4 = { argmemonly nocallback nofree nosync nounwind willreturn }
attributes #5 = { argmemonly nofree nounwind willreturn }
attributes #6 = { convergent mustprogress norecurse nounwind "amdgpu-flat-work-group-size"="1,1024" "denormal-fp-math-f32"="preserve-sign,preserve-sign" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx803" "target-features"="+16-bit-insts,+ci-insts,+dpp,+flat-address-space,+gfx8-insts,+s-memrealtime,+s-memtime-inst" "uniform-work-group-size"="true" }
attributes #7 = { convergent mustprogress nounwind "denormal-fp-math-f32"="preserve-sign,preserve-sign" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx803" "target-features"="+16-bit-insts,+ci-insts,+dpp,+flat-address-space,+gfx8-insts,+s-memrealtime,+s-memtime-inst" }
attributes #8 = { convergent mustprogress nofree norecurse nosync nounwind readnone willreturn "denormal-fp-math-f32"="preserve-sign,preserve-sign" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" }
attributes #9 = { nounwind readnone speculatable willreturn }
attributes #10 = { convergent norecurse nounwind "denormal-fp-math-f32"="preserve-sign,preserve-sign" "frame-pointer"="none" "min-legal-vector-width"="128" "no-trapping-math"="true" "stack-protector-buffer-size"="8" }
attributes #11 = { convergent noinline norecurse nounwind optnone "denormal-fp-math-f32"="preserve-sign,preserve-sign" "frame-pointer"="none" "min-legal-vector-width"="128" "no-trapping-math"="true" "stack-protector-buffer-size"="8" }
attributes #12 = { alwaysinline convergent mustprogress nofree norecurse nosync nounwind readnone willreturn "denormal-fp-math-f32"="preserve-sign,preserve-sign" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" }
attributes #13 = { convergent norecurse nounwind "denormal-fp-math-f32"="preserve-sign,preserve-sign" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" }
attributes #14 = { convergent nounwind readnone willreturn }
attributes #15 = { argmemonly convergent mustprogress nofree norecurse nosync nounwind readonly willreturn "denormal-fp-math-f32"="preserve-sign,preserve-sign" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" }
attributes #16 = { convergent mustprogress nofree norecurse nounwind willreturn "denormal-fp-math-f32"="preserve-sign,preserve-sign" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" }
attributes #17 = { nounwind willreturn }
attributes #18 = { nounwind }
attributes #19 = { nounwind readonly }
attributes #20 = { nounwind readnone willreturn }
attributes #21 = { convergent nounwind }
attributes #22 = { convergent }

!llvm.dbg.cu = !{!2}
!llvm.dbg.retainedNodes = !{!1606, !1651}
!llvm.module.flags = !{!1653, !1654, !1655, !1656}
!llvm.ident = !{!1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657, !1657}
!opencl.ocl.version = !{!1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658, !1658}

!0 = distinct !DIFragment()
!1 = distinct !DIFragment()
!2 = distinct !DICompileUnit(language: DW_LANG_C_plus_plus_11, file: !3, producer: "AMD clang version 15.0.0 (https://github.com/RadeonOpenCompute/llvm-project roc-5.3.0 22362 3cf23f77f8208174a2ee7c616f4be23674d7b081)", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !13, imports: !28, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "vecadd.hip", directory: "/workspaces/cupbop-amd-playground/vector-add", checksumkind: CSK_MD5, checksum: "63bc038c53c6a459fc661c37731596e5")
!4 = !{!5}
!5 = !DICompositeType(tag: DW_TAG_enumeration_type, name: "_Lock_policy", scope: !7, file: !6, line: 49, baseType: !8, size: 32, elements: !9, identifier: "_ZTSN9__gnu_cxx12_Lock_policyE")
!6 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/9/../../../../include/c++/9/ext/concurrence.h", directory: "")
!7 = !DINamespace(name: "__gnu_cxx", scope: null)
!8 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!9 = !{!10, !11, !12}
!10 = !DIEnumerator(name: "_S_single", value: 0, isUnsigned: true)
!11 = !DIEnumerator(name: "_S_mutex", value: 1, isUnsigned: true)
!12 = !DIEnumerator(name: "_S_atomic", value: 2, isUnsigned: true)
!13 = !{!14}
!14 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "dim3", file: !15, line: 934, size: 96, flags: DIFlagTypePassByValue | DIFlagNonTrivial, elements: !16, identifier: "_ZTS4dim3")
!15 = !DIFile(filename: "/opt/rocm-5.3.0/include/hip/hip_runtime_api.h", directory: "")
!16 = !{!17, !22, !23, !24}
!17 = !DIDerivedType(tag: DW_TAG_member, name: "x", scope: !14, file: !15, line: 935, baseType: !18, size: 32)
!18 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint32_t", file: !19, line: 26, baseType: !20)
!19 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-uintn.h", directory: "")
!20 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint32_t", file: !21, line: 42, baseType: !8)
!21 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!22 = !DIDerivedType(tag: DW_TAG_member, name: "y", scope: !14, file: !15, line: 936, baseType: !18, size: 32, offset: 32)
!23 = !DIDerivedType(tag: DW_TAG_member, name: "z", scope: !14, file: !15, line: 937, baseType: !18, size: 32, offset: 64)
!24 = !DISubprogram(name: "dim3", scope: !14, file: !15, line: 939, type: !25, scopeLine: 939, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!25 = !DISubroutineType(types: !26)
!26 = !{null, !27, !18, !18, !18}
!27 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !14, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!28 = !{!29, !37, !44, !46, !48, !52, !54, !56, !58, !60, !62, !64, !66, !71, !75, !77, !79, !84, !86, !88, !90, !92, !94, !96, !99, !102, !104, !108, !113, !115, !117, !119, !121, !123, !125, !127, !129, !131, !133, !137, !141, !143, !145, !147, !149, !151, !153, !155, !157, !159, !161, !163, !165, !167, !169, !171, !175, !179, !183, !185, !187, !189, !191, !193, !195, !197, !199, !201, !205, !209, !213, !215, !217, !219, !224, !228, !232, !234, !236, !238, !240, !242, !244, !246, !248, !250, !252, !254, !256, !261, !265, !269, !271, !273, !275, !282, !286, !290, !292, !294, !296, !298, !300, !302, !306, !310, !312, !314, !316, !318, !322, !326, !330, !332, !334, !336, !338, !340, !342, !346, !350, !354, !356, !360, !364, !366, !368, !370, !372, !374, !376, !380, !386, !390, !395, !397, !400, !404, !408, !423, !427, !431, !435, !439, !444, !448, !452, !456, !460, !468, !472, !476, !478, !482, !486, !490, !496, !500, !504, !506, !514, !518, !524, !526, !530, !534, !538, !542, !547, !551, !555, !556, !557, !558, !560, !561, !562, !563, !564, !565, !566, !568, !569, !570, !571, !572, !573, !574, !576, !577, !578, !579, !580, !581, !582, !583, !584, !585, !586, !587, !588, !589, !590, !591, !592, !593, !594, !595, !596, !597, !598, !599, !600, !604, !608, !612, !615, !617, !619, !621, !623, !625, !627, !629, !631, !633, !635, !637, !639, !641, !643, !645, !647, !649, !651, !653, !655, !657, !659, !661, !663, !665, !669, !671, !673, !678, !682, !684, !686, !688, !690, !692, !694, !696, !698, !700, !702, !704, !706, !708, !710, !712, !714, !716, !718, !720, !722, !724, !729, !731, !733, !735, !737, !739, !741, !743, !745, !747, !749, !751, !753, !755, !757, !759, !761, !763, !765, !767, !771, !773, !775, !777, !779, !781, !783, !785, !787, !789, !791, !793, !795, !797, !799, !801, !803, !805, !807, !809, !811, !813, !815, !817, !819, !821, !823, !825, !827, !829, !831, !833, !835, !837, !839, !841, !843, !845, !847, !849, !851, !853, !855, !857, !859, !861, !863, !865, !867, !869, !871, !873, !875, !877, !879, !896, !899, !904, !962, !967, !971, !975, !979, !983, !985, !987, !991, !997, !1001, !1007, !1013, !1015, !1019, !1023, !1027, !1031, !1039, !1041, !1045, !1049, !1053, !1055, !1059, !1063, !1067, !1069, !1071, !1075, !1083, !1087, !1091, !1095, !1097, !1103, !1105, !1111, !1115, !1119, !1123, !1127, !1131, !1135, !1137, !1139, !1143, !1147, !1151, !1153, !1157, !1161, !1163, !1165, !1169, !1173, !1177, !1181, !1182, !1183, !1184, !1185, !1186, !1187, !1188, !1189, !1190, !1191, !1196, !1200, !1203, !1206, !1209, !1211, !1213, !1215, !1218, !1221, !1224, !1227, !1230, !1232, !1236, !1239, !1240, !1243, !1245, !1247, !1249, !1251, !1254, !1257, !1260, !1263, !1266, !1268, !1272, !1274, !1278, !1282, !1287, !1291, !1293, !1295, !1297, !1299, !1301, !1303, !1305, !1307, !1309, !1311, !1313, !1315, !1317, !1321, !1327, !1332, !1336, !1338, !1340, !1342, !1344, !1351, !1355, !1359, !1363, !1367, !1371, !1376, !1380, !1382, !1386, !1392, !1396, !1401, !1403, !1406, !1410, !1414, !1418, !1420, !1422, !1424, !1426, !1430, !1432, !1434, !1438, !1442, !1446, !1450, !1454, !1456, !1458, !1462, !1466, !1470, !1474, !1476, !1478, !1482, !1486, !1487, !1488, !1489, !1490, !1491, !1497, !1500, !1501, !1503, !1505, !1507, !1509, !1513, !1515, !1517, !1519, !1521, !1523, !1525, !1527, !1529, !1533, !1537, !1539, !1543, !1547, !1552, !1556, !1557, !1562, !1566, !1571, !1576, !1580, !1586, !1590, !1592, !1596, !1598, !1601, !1604, !1605}
!29 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !31, file: !36, line: 52)
!30 = !DINamespace(name: "std", scope: null)
!31 = !DISubprogram(name: "abs", scope: !32, file: !32, line: 840, type: !33, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!32 = !DIFile(filename: "/usr/include/stdlib.h", directory: "")
!33 = !DISubroutineType(types: !34)
!34 = !{!35, !35}
!35 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!36 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/9/../../../../include/c++/9/bits/std_abs.h", directory: "")
!37 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !38, file: !43, line: 83)
!38 = !DISubprogram(name: "acos", scope: !39, file: !39, line: 53, type: !40, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!39 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/mathcalls.h", directory: "")
!40 = !DISubroutineType(types: !41)
!41 = !{!42, !42}
!42 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!43 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/9/../../../../include/c++/9/cmath", directory: "")
!44 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !45, file: !43, line: 102)
!45 = !DISubprogram(name: "asin", scope: !39, file: !39, line: 55, type: !40, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!46 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !47, file: !43, line: 121)
!47 = !DISubprogram(name: "atan", scope: !39, file: !39, line: 57, type: !40, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!48 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !49, file: !43, line: 140)
!49 = !DISubprogram(name: "atan2", scope: !39, file: !39, line: 59, type: !50, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!50 = !DISubroutineType(types: !51)
!51 = !{!42, !42, !42}
!52 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !53, file: !43, line: 161)
!53 = !DISubprogram(name: "ceil", scope: !39, file: !39, line: 159, type: !40, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!54 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !55, file: !43, line: 180)
!55 = !DISubprogram(name: "cos", scope: !39, file: !39, line: 62, type: !40, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!56 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !57, file: !43, line: 199)
!57 = !DISubprogram(name: "cosh", scope: !39, file: !39, line: 71, type: !40, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!58 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !59, file: !43, line: 218)
!59 = !DISubprogram(name: "exp", scope: !39, file: !39, line: 95, type: !40, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!60 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !61, file: !43, line: 237)
!61 = !DISubprogram(name: "fabs", scope: !39, file: !39, line: 162, type: !40, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!62 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !63, file: !43, line: 256)
!63 = !DISubprogram(name: "floor", scope: !39, file: !39, line: 165, type: !40, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!64 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !65, file: !43, line: 275)
!65 = !DISubprogram(name: "fmod", scope: !39, file: !39, line: 168, type: !50, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!66 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !67, file: !43, line: 296)
!67 = !DISubprogram(name: "frexp", scope: !39, file: !39, line: 98, type: !68, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!68 = !DISubroutineType(types: !69)
!69 = !{!42, !42, !70}
!70 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !35, size: 64)
!71 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !72, file: !43, line: 315)
!72 = !DISubprogram(name: "ldexp", scope: !39, file: !39, line: 101, type: !73, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!73 = !DISubroutineType(types: !74)
!74 = !{!42, !42, !35}
!75 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !76, file: !43, line: 334)
!76 = !DISubprogram(name: "log", scope: !39, file: !39, line: 104, type: !40, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!77 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !78, file: !43, line: 353)
!78 = !DISubprogram(name: "log10", scope: !39, file: !39, line: 107, type: !40, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!79 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !80, file: !43, line: 372)
!80 = !DISubprogram(name: "modf", scope: !39, file: !39, line: 110, type: !81, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!81 = !DISubroutineType(types: !82)
!82 = !{!42, !42, !83}
!83 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !42, size: 64)
!84 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !85, file: !43, line: 384)
!85 = !DISubprogram(name: "pow", scope: !39, file: !39, line: 140, type: !50, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!86 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !87, file: !43, line: 421)
!87 = !DISubprogram(name: "sin", scope: !39, file: !39, line: 64, type: !40, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!88 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !89, file: !43, line: 440)
!89 = !DISubprogram(name: "sinh", scope: !39, file: !39, line: 73, type: !40, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!90 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !91, file: !43, line: 459)
!91 = !DISubprogram(name: "sqrt", scope: !39, file: !39, line: 143, type: !40, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!92 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !93, file: !43, line: 478)
!93 = !DISubprogram(name: "tan", scope: !39, file: !39, line: 66, type: !40, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!94 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !95, file: !43, line: 497)
!95 = !DISubprogram(name: "tanh", scope: !39, file: !39, line: 75, type: !40, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!96 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !97, file: !43, line: 1065)
!97 = !DIDerivedType(tag: DW_TAG_typedef, name: "double_t", file: !98, line: 150, baseType: !42)
!98 = !DIFile(filename: "/usr/include/math.h", directory: "")
!99 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !100, file: !43, line: 1066)
!100 = !DIDerivedType(tag: DW_TAG_typedef, name: "float_t", file: !98, line: 149, baseType: !101)
!101 = !DIBasicType(name: "float", size: 32, encoding: DW_ATE_float)
!102 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !103, file: !43, line: 1069)
!103 = !DISubprogram(name: "acosh", scope: !39, file: !39, line: 85, type: !40, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!104 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !105, file: !43, line: 1070)
!105 = !DISubprogram(name: "acoshf", scope: !39, file: !39, line: 85, type: !106, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!106 = !DISubroutineType(types: !107)
!107 = !{!101, !101}
!108 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !109, file: !43, line: 1071)
!109 = !DISubprogram(name: "acoshl", scope: !39, file: !39, line: 85, type: !110, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!110 = !DISubroutineType(types: !111)
!111 = !{!112, !112}
!112 = !DIBasicType(name: "long double", size: 64, encoding: DW_ATE_float)
!113 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !114, file: !43, line: 1073)
!114 = !DISubprogram(name: "asinh", scope: !39, file: !39, line: 87, type: !40, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!115 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !116, file: !43, line: 1074)
!116 = !DISubprogram(name: "asinhf", scope: !39, file: !39, line: 87, type: !106, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!117 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !118, file: !43, line: 1075)
!118 = !DISubprogram(name: "asinhl", scope: !39, file: !39, line: 87, type: !110, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!119 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !120, file: !43, line: 1077)
!120 = !DISubprogram(name: "atanh", scope: !39, file: !39, line: 89, type: !40, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!121 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !122, file: !43, line: 1078)
!122 = !DISubprogram(name: "atanhf", scope: !39, file: !39, line: 89, type: !106, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!123 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !124, file: !43, line: 1079)
!124 = !DISubprogram(name: "atanhl", scope: !39, file: !39, line: 89, type: !110, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!125 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !126, file: !43, line: 1081)
!126 = !DISubprogram(name: "cbrt", scope: !39, file: !39, line: 152, type: !40, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!127 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !128, file: !43, line: 1082)
!128 = !DISubprogram(name: "cbrtf", scope: !39, file: !39, line: 152, type: !106, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!129 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !130, file: !43, line: 1083)
!130 = !DISubprogram(name: "cbrtl", scope: !39, file: !39, line: 152, type: !110, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!131 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !132, file: !43, line: 1085)
!132 = !DISubprogram(name: "copysign", scope: !39, file: !39, line: 196, type: !50, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!133 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !134, file: !43, line: 1086)
!134 = !DISubprogram(name: "copysignf", scope: !39, file: !39, line: 196, type: !135, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!135 = !DISubroutineType(types: !136)
!136 = !{!101, !101, !101}
!137 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !138, file: !43, line: 1087)
!138 = !DISubprogram(name: "copysignl", scope: !39, file: !39, line: 196, type: !139, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!139 = !DISubroutineType(types: !140)
!140 = !{!112, !112, !112}
!141 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !142, file: !43, line: 1089)
!142 = !DISubprogram(name: "erf", scope: !39, file: !39, line: 228, type: !40, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!143 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !144, file: !43, line: 1090)
!144 = !DISubprogram(name: "erff", scope: !39, file: !39, line: 228, type: !106, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!145 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !146, file: !43, line: 1091)
!146 = !DISubprogram(name: "erfl", scope: !39, file: !39, line: 228, type: !110, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!147 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !148, file: !43, line: 1093)
!148 = !DISubprogram(name: "erfc", scope: !39, file: !39, line: 229, type: !40, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!149 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !150, file: !43, line: 1094)
!150 = !DISubprogram(name: "erfcf", scope: !39, file: !39, line: 229, type: !106, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!151 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !152, file: !43, line: 1095)
!152 = !DISubprogram(name: "erfcl", scope: !39, file: !39, line: 229, type: !110, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!153 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !154, file: !43, line: 1097)
!154 = !DISubprogram(name: "exp2", scope: !39, file: !39, line: 130, type: !40, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!155 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !156, file: !43, line: 1098)
!156 = !DISubprogram(name: "exp2f", scope: !39, file: !39, line: 130, type: !106, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!157 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !158, file: !43, line: 1099)
!158 = !DISubprogram(name: "exp2l", scope: !39, file: !39, line: 130, type: !110, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!159 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !160, file: !43, line: 1101)
!160 = !DISubprogram(name: "expm1", scope: !39, file: !39, line: 119, type: !40, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!161 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !162, file: !43, line: 1102)
!162 = !DISubprogram(name: "expm1f", scope: !39, file: !39, line: 119, type: !106, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!163 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !164, file: !43, line: 1103)
!164 = !DISubprogram(name: "expm1l", scope: !39, file: !39, line: 119, type: !110, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!165 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !166, file: !43, line: 1105)
!166 = !DISubprogram(name: "fdim", scope: !39, file: !39, line: 326, type: !50, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!167 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !168, file: !43, line: 1106)
!168 = !DISubprogram(name: "fdimf", scope: !39, file: !39, line: 326, type: !135, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!169 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !170, file: !43, line: 1107)
!170 = !DISubprogram(name: "fdiml", scope: !39, file: !39, line: 326, type: !139, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!171 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !172, file: !43, line: 1109)
!172 = !DISubprogram(name: "fma", scope: !39, file: !39, line: 335, type: !173, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!173 = !DISubroutineType(types: !174)
!174 = !{!42, !42, !42, !42}
!175 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !176, file: !43, line: 1110)
!176 = !DISubprogram(name: "fmaf", scope: !39, file: !39, line: 335, type: !177, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!177 = !DISubroutineType(types: !178)
!178 = !{!101, !101, !101, !101}
!179 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !180, file: !43, line: 1111)
!180 = !DISubprogram(name: "fmal", scope: !39, file: !39, line: 335, type: !181, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!181 = !DISubroutineType(types: !182)
!182 = !{!112, !112, !112, !112}
!183 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !184, file: !43, line: 1113)
!184 = !DISubprogram(name: "fmax", scope: !39, file: !39, line: 329, type: !50, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!185 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !186, file: !43, line: 1114)
!186 = !DISubprogram(name: "fmaxf", scope: !39, file: !39, line: 329, type: !135, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!187 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !188, file: !43, line: 1115)
!188 = !DISubprogram(name: "fmaxl", scope: !39, file: !39, line: 329, type: !139, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!189 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !190, file: !43, line: 1117)
!190 = !DISubprogram(name: "fmin", scope: !39, file: !39, line: 332, type: !50, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!191 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !192, file: !43, line: 1118)
!192 = !DISubprogram(name: "fminf", scope: !39, file: !39, line: 332, type: !135, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!193 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !194, file: !43, line: 1119)
!194 = !DISubprogram(name: "fminl", scope: !39, file: !39, line: 332, type: !139, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!195 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !196, file: !43, line: 1121)
!196 = !DISubprogram(name: "hypot", scope: !39, file: !39, line: 147, type: !50, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!197 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !198, file: !43, line: 1122)
!198 = !DISubprogram(name: "hypotf", scope: !39, file: !39, line: 147, type: !135, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!199 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !200, file: !43, line: 1123)
!200 = !DISubprogram(name: "hypotl", scope: !39, file: !39, line: 147, type: !139, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!201 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !202, file: !43, line: 1125)
!202 = !DISubprogram(name: "ilogb", scope: !39, file: !39, line: 280, type: !203, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!203 = !DISubroutineType(types: !204)
!204 = !{!35, !42}
!205 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !206, file: !43, line: 1126)
!206 = !DISubprogram(name: "ilogbf", scope: !39, file: !39, line: 280, type: !207, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!207 = !DISubroutineType(types: !208)
!208 = !{!35, !101}
!209 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !210, file: !43, line: 1127)
!210 = !DISubprogram(name: "ilogbl", scope: !39, file: !39, line: 280, type: !211, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!211 = !DISubroutineType(types: !212)
!212 = !{!35, !112}
!213 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !214, file: !43, line: 1129)
!214 = !DISubprogram(name: "lgamma", scope: !39, file: !39, line: 230, type: !40, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!215 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !216, file: !43, line: 1130)
!216 = !DISubprogram(name: "lgammaf", scope: !39, file: !39, line: 230, type: !106, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!217 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !218, file: !43, line: 1131)
!218 = !DISubprogram(name: "lgammal", scope: !39, file: !39, line: 230, type: !110, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!219 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !220, file: !43, line: 1134)
!220 = !DISubprogram(name: "llrint", scope: !39, file: !39, line: 316, type: !221, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!221 = !DISubroutineType(types: !222)
!222 = !{!223, !42}
!223 = !DIBasicType(name: "long long", size: 64, encoding: DW_ATE_signed)
!224 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !225, file: !43, line: 1135)
!225 = !DISubprogram(name: "llrintf", scope: !39, file: !39, line: 316, type: !226, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!226 = !DISubroutineType(types: !227)
!227 = !{!223, !101}
!228 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !229, file: !43, line: 1136)
!229 = !DISubprogram(name: "llrintl", scope: !39, file: !39, line: 316, type: !230, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!230 = !DISubroutineType(types: !231)
!231 = !{!223, !112}
!232 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !233, file: !43, line: 1138)
!233 = !DISubprogram(name: "llround", scope: !39, file: !39, line: 322, type: !221, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!234 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !235, file: !43, line: 1139)
!235 = !DISubprogram(name: "llroundf", scope: !39, file: !39, line: 322, type: !226, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!236 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !237, file: !43, line: 1140)
!237 = !DISubprogram(name: "llroundl", scope: !39, file: !39, line: 322, type: !230, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!238 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !239, file: !43, line: 1143)
!239 = !DISubprogram(name: "log1p", scope: !39, file: !39, line: 122, type: !40, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!240 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !241, file: !43, line: 1144)
!241 = !DISubprogram(name: "log1pf", scope: !39, file: !39, line: 122, type: !106, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!242 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !243, file: !43, line: 1145)
!243 = !DISubprogram(name: "log1pl", scope: !39, file: !39, line: 122, type: !110, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!244 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !245, file: !43, line: 1147)
!245 = !DISubprogram(name: "log2", scope: !39, file: !39, line: 133, type: !40, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!246 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !247, file: !43, line: 1148)
!247 = !DISubprogram(name: "log2f", scope: !39, file: !39, line: 133, type: !106, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!248 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !249, file: !43, line: 1149)
!249 = !DISubprogram(name: "log2l", scope: !39, file: !39, line: 133, type: !110, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!250 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !251, file: !43, line: 1151)
!251 = !DISubprogram(name: "logb", scope: !39, file: !39, line: 125, type: !40, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!252 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !253, file: !43, line: 1152)
!253 = !DISubprogram(name: "logbf", scope: !39, file: !39, line: 125, type: !106, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!254 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !255, file: !43, line: 1153)
!255 = !DISubprogram(name: "logbl", scope: !39, file: !39, line: 125, type: !110, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!256 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !257, file: !43, line: 1155)
!257 = !DISubprogram(name: "lrint", scope: !39, file: !39, line: 314, type: !258, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!258 = !DISubroutineType(types: !259)
!259 = !{!260, !42}
!260 = !DIBasicType(name: "long", size: 64, encoding: DW_ATE_signed)
!261 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !262, file: !43, line: 1156)
!262 = !DISubprogram(name: "lrintf", scope: !39, file: !39, line: 314, type: !263, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!263 = !DISubroutineType(types: !264)
!264 = !{!260, !101}
!265 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !266, file: !43, line: 1157)
!266 = !DISubprogram(name: "lrintl", scope: !39, file: !39, line: 314, type: !267, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!267 = !DISubroutineType(types: !268)
!268 = !{!260, !112}
!269 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !270, file: !43, line: 1159)
!270 = !DISubprogram(name: "lround", scope: !39, file: !39, line: 320, type: !258, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!271 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !272, file: !43, line: 1160)
!272 = !DISubprogram(name: "lroundf", scope: !39, file: !39, line: 320, type: !263, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!273 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !274, file: !43, line: 1161)
!274 = !DISubprogram(name: "lroundl", scope: !39, file: !39, line: 320, type: !267, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!275 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !276, file: !43, line: 1163)
!276 = !DISubprogram(name: "nan", scope: !39, file: !39, line: 201, type: !277, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!277 = !DISubroutineType(types: !278)
!278 = !{!42, !279}
!279 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !280, size: 64)
!280 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !281)
!281 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!282 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !283, file: !43, line: 1164)
!283 = !DISubprogram(name: "nanf", scope: !39, file: !39, line: 201, type: !284, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!284 = !DISubroutineType(types: !285)
!285 = !{!101, !279}
!286 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !287, file: !43, line: 1165)
!287 = !DISubprogram(name: "nanl", scope: !39, file: !39, line: 201, type: !288, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!288 = !DISubroutineType(types: !289)
!289 = !{!112, !279}
!290 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !291, file: !43, line: 1167)
!291 = !DISubprogram(name: "nearbyint", scope: !39, file: !39, line: 294, type: !40, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!292 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !293, file: !43, line: 1168)
!293 = !DISubprogram(name: "nearbyintf", scope: !39, file: !39, line: 294, type: !106, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!294 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !295, file: !43, line: 1169)
!295 = !DISubprogram(name: "nearbyintl", scope: !39, file: !39, line: 294, type: !110, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!296 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !297, file: !43, line: 1171)
!297 = !DISubprogram(name: "nextafter", scope: !39, file: !39, line: 259, type: !50, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!298 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !299, file: !43, line: 1172)
!299 = !DISubprogram(name: "nextafterf", scope: !39, file: !39, line: 259, type: !135, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!300 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !301, file: !43, line: 1173)
!301 = !DISubprogram(name: "nextafterl", scope: !39, file: !39, line: 259, type: !139, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!302 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !303, file: !43, line: 1175)
!303 = !DISubprogram(name: "nexttoward", scope: !39, file: !39, line: 261, type: !304, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!304 = !DISubroutineType(types: !305)
!305 = !{!42, !42, !112}
!306 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !307, file: !43, line: 1176)
!307 = !DISubprogram(name: "nexttowardf", scope: !39, file: !39, line: 261, type: !308, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!308 = !DISubroutineType(types: !309)
!309 = !{!101, !101, !112}
!310 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !311, file: !43, line: 1177)
!311 = !DISubprogram(name: "nexttowardl", scope: !39, file: !39, line: 261, type: !139, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!312 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !313, file: !43, line: 1179)
!313 = !DISubprogram(name: "remainder", scope: !39, file: !39, line: 272, type: !50, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!314 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !315, file: !43, line: 1180)
!315 = !DISubprogram(name: "remainderf", scope: !39, file: !39, line: 272, type: !135, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!316 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !317, file: !43, line: 1181)
!317 = !DISubprogram(name: "remainderl", scope: !39, file: !39, line: 272, type: !139, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!318 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !319, file: !43, line: 1183)
!319 = !DISubprogram(name: "remquo", scope: !39, file: !39, line: 307, type: !320, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!320 = !DISubroutineType(types: !321)
!321 = !{!42, !42, !42, !70}
!322 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !323, file: !43, line: 1184)
!323 = !DISubprogram(name: "remquof", scope: !39, file: !39, line: 307, type: !324, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!324 = !DISubroutineType(types: !325)
!325 = !{!101, !101, !101, !70}
!326 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !327, file: !43, line: 1185)
!327 = !DISubprogram(name: "remquol", scope: !39, file: !39, line: 307, type: !328, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!328 = !DISubroutineType(types: !329)
!329 = !{!112, !112, !112, !70}
!330 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !331, file: !43, line: 1187)
!331 = !DISubprogram(name: "rint", scope: !39, file: !39, line: 256, type: !40, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!332 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !333, file: !43, line: 1188)
!333 = !DISubprogram(name: "rintf", scope: !39, file: !39, line: 256, type: !106, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!334 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !335, file: !43, line: 1189)
!335 = !DISubprogram(name: "rintl", scope: !39, file: !39, line: 256, type: !110, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!336 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !337, file: !43, line: 1191)
!337 = !DISubprogram(name: "round", scope: !39, file: !39, line: 298, type: !40, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!338 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !339, file: !43, line: 1192)
!339 = !DISubprogram(name: "roundf", scope: !39, file: !39, line: 298, type: !106, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!340 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !341, file: !43, line: 1193)
!341 = !DISubprogram(name: "roundl", scope: !39, file: !39, line: 298, type: !110, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!342 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !343, file: !43, line: 1195)
!343 = !DISubprogram(name: "scalbln", scope: !39, file: !39, line: 290, type: !344, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!344 = !DISubroutineType(types: !345)
!345 = !{!42, !42, !260}
!346 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !347, file: !43, line: 1196)
!347 = !DISubprogram(name: "scalblnf", scope: !39, file: !39, line: 290, type: !348, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!348 = !DISubroutineType(types: !349)
!349 = !{!101, !101, !260}
!350 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !351, file: !43, line: 1197)
!351 = !DISubprogram(name: "scalblnl", scope: !39, file: !39, line: 290, type: !352, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!352 = !DISubroutineType(types: !353)
!353 = !{!112, !112, !260}
!354 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !355, file: !43, line: 1199)
!355 = !DISubprogram(name: "scalbn", scope: !39, file: !39, line: 276, type: !73, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!356 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !357, file: !43, line: 1200)
!357 = !DISubprogram(name: "scalbnf", scope: !39, file: !39, line: 276, type: !358, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!358 = !DISubroutineType(types: !359)
!359 = !{!101, !101, !35}
!360 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !361, file: !43, line: 1201)
!361 = !DISubprogram(name: "scalbnl", scope: !39, file: !39, line: 276, type: !362, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!362 = !DISubroutineType(types: !363)
!363 = !{!112, !112, !35}
!364 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !365, file: !43, line: 1203)
!365 = !DISubprogram(name: "tgamma", scope: !39, file: !39, line: 235, type: !40, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!366 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !367, file: !43, line: 1204)
!367 = !DISubprogram(name: "tgammaf", scope: !39, file: !39, line: 235, type: !106, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!368 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !369, file: !43, line: 1205)
!369 = !DISubprogram(name: "tgammal", scope: !39, file: !39, line: 235, type: !110, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!370 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !371, file: !43, line: 1207)
!371 = !DISubprogram(name: "trunc", scope: !39, file: !39, line: 302, type: !40, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!372 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !373, file: !43, line: 1208)
!373 = !DISubprogram(name: "truncf", scope: !39, file: !39, line: 302, type: !106, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!374 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !375, file: !43, line: 1209)
!375 = !DISubprogram(name: "truncl", scope: !39, file: !39, line: 302, type: !110, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!376 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !377, file: !379, line: 127)
!377 = !DIDerivedType(tag: DW_TAG_typedef, name: "div_t", file: !32, line: 62, baseType: !378)
!378 = !DICompositeType(tag: DW_TAG_structure_type, file: !32, line: 58, size: 64, flags: DIFlagFwdDecl, identifier: "_ZTS5div_t")
!379 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/9/../../../../include/c++/9/cstdlib", directory: "")
!380 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !381, file: !379, line: 128)
!381 = !DIDerivedType(tag: DW_TAG_typedef, name: "ldiv_t", file: !32, line: 70, baseType: !382)
!382 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !32, line: 66, size: 128, flags: DIFlagTypePassByValue, elements: !383, identifier: "_ZTS6ldiv_t")
!383 = !{!384, !385}
!384 = !DIDerivedType(tag: DW_TAG_member, name: "quot", scope: !382, file: !32, line: 68, baseType: !260, size: 64)
!385 = !DIDerivedType(tag: DW_TAG_member, name: "rem", scope: !382, file: !32, line: 69, baseType: !260, size: 64, offset: 64)
!386 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !387, file: !379, line: 130)
!387 = !DISubprogram(name: "abort", scope: !32, file: !32, line: 591, type: !388, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: DISPFlagOptimized)
!388 = !DISubroutineType(types: !389)
!389 = !{null}
!390 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !391, file: !379, line: 134)
!391 = !DISubprogram(name: "atexit", scope: !32, file: !32, line: 595, type: !392, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!392 = !DISubroutineType(types: !393)
!393 = !{!35, !394}
!394 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !388, size: 64)
!395 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !396, file: !379, line: 137)
!396 = !DISubprogram(name: "at_quick_exit", scope: !32, file: !32, line: 600, type: !392, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!397 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !398, file: !379, line: 140)
!398 = !DISubprogram(name: "atof", scope: !399, file: !399, line: 25, type: !277, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!399 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdlib-float.h", directory: "")
!400 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !401, file: !379, line: 141)
!401 = !DISubprogram(name: "atoi", scope: !32, file: !32, line: 361, type: !402, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!402 = !DISubroutineType(types: !403)
!403 = !{!35, !279}
!404 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !405, file: !379, line: 142)
!405 = !DISubprogram(name: "atol", scope: !32, file: !32, line: 366, type: !406, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!406 = !DISubroutineType(types: !407)
!407 = !{!260, !279}
!408 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !409, file: !379, line: 143)
!409 = !DISubprogram(name: "bsearch", scope: !410, file: !410, line: 20, type: !411, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!410 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdlib-bsearch.h", directory: "")
!411 = !DISubroutineType(types: !412)
!412 = !{!413, !414, !414, !416, !416, !419}
!413 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!414 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !415, size: 64)
!415 = !DIDerivedType(tag: DW_TAG_const_type, baseType: null)
!416 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !417, line: 46, baseType: !418)
!417 = !DIFile(filename: "/opt/rocm-5.3.0/llvm/lib/clang/15.0.0/include/stddef.h", directory: "")
!418 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!419 = !DIDerivedType(tag: DW_TAG_typedef, name: "__compar_fn_t", file: !32, line: 808, baseType: !420)
!420 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !421, size: 64)
!421 = !DISubroutineType(types: !422)
!422 = !{!35, !414, !414}
!423 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !424, file: !379, line: 144)
!424 = !DISubprogram(name: "calloc", scope: !32, file: !32, line: 542, type: !425, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!425 = !DISubroutineType(types: !426)
!426 = !{!413, !416, !416}
!427 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !428, file: !379, line: 145)
!428 = !DISubprogram(name: "div", scope: !32, file: !32, line: 852, type: !429, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!429 = !DISubroutineType(types: !430)
!430 = !{!377, !35, !35}
!431 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !432, file: !379, line: 146)
!432 = !DISubprogram(name: "exit", scope: !32, file: !32, line: 617, type: !433, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: DISPFlagOptimized)
!433 = !DISubroutineType(types: !434)
!434 = !{null, !35}
!435 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !436, file: !379, line: 147)
!436 = !DISubprogram(name: "free", scope: !32, file: !32, line: 565, type: !437, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!437 = !DISubroutineType(types: !438)
!438 = !{null, !413}
!439 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !440, file: !379, line: 148)
!440 = !DISubprogram(name: "getenv", scope: !32, file: !32, line: 634, type: !441, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!441 = !DISubroutineType(types: !442)
!442 = !{!443, !279}
!443 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !281, size: 64)
!444 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !445, file: !379, line: 149)
!445 = !DISubprogram(name: "labs", scope: !32, file: !32, line: 841, type: !446, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!446 = !DISubroutineType(types: !447)
!447 = !{!260, !260}
!448 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !449, file: !379, line: 150)
!449 = !DISubprogram(name: "ldiv", scope: !32, file: !32, line: 854, type: !450, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!450 = !DISubroutineType(types: !451)
!451 = !{!381, !260, !260}
!452 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !453, file: !379, line: 151)
!453 = !DISubprogram(name: "malloc", scope: !32, file: !32, line: 539, type: !454, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!454 = !DISubroutineType(types: !455)
!455 = !{!413, !416}
!456 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !457, file: !379, line: 153)
!457 = !DISubprogram(name: "mblen", scope: !32, file: !32, line: 922, type: !458, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!458 = !DISubroutineType(types: !459)
!459 = !{!35, !279, !416}
!460 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !461, file: !379, line: 154)
!461 = !DISubprogram(name: "mbstowcs", scope: !32, file: !32, line: 933, type: !462, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!462 = !DISubroutineType(types: !463)
!463 = !{!416, !464, !467, !416}
!464 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !465)
!465 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !466, size: 64)
!466 = !DIBasicType(name: "wchar_t", size: 32, encoding: DW_ATE_signed)
!467 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !279)
!468 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !469, file: !379, line: 155)
!469 = !DISubprogram(name: "mbtowc", scope: !32, file: !32, line: 925, type: !470, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!470 = !DISubroutineType(types: !471)
!471 = !{!35, !464, !467, !416}
!472 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !473, file: !379, line: 157)
!473 = !DISubprogram(name: "qsort", scope: !32, file: !32, line: 830, type: !474, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!474 = !DISubroutineType(types: !475)
!475 = !{null, !413, !416, !416, !419}
!476 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !477, file: !379, line: 160)
!477 = !DISubprogram(name: "quick_exit", scope: !32, file: !32, line: 623, type: !433, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: DISPFlagOptimized)
!478 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !479, file: !379, line: 163)
!479 = !DISubprogram(name: "rand", scope: !32, file: !32, line: 453, type: !480, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!480 = !DISubroutineType(types: !481)
!481 = !{!35}
!482 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !483, file: !379, line: 164)
!483 = !DISubprogram(name: "realloc", scope: !32, file: !32, line: 550, type: !484, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!484 = !DISubroutineType(types: !485)
!485 = !{!413, !413, !416}
!486 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !487, file: !379, line: 165)
!487 = !DISubprogram(name: "srand", scope: !32, file: !32, line: 455, type: !488, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!488 = !DISubroutineType(types: !489)
!489 = !{null, !8}
!490 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !491, file: !379, line: 166)
!491 = !DISubprogram(name: "strtod", scope: !32, file: !32, line: 117, type: !492, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!492 = !DISubroutineType(types: !493)
!493 = !{!42, !467, !494}
!494 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !495)
!495 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !443, size: 64)
!496 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !497, file: !379, line: 167)
!497 = !DISubprogram(name: "strtol", scope: !32, file: !32, line: 176, type: !498, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!498 = !DISubroutineType(types: !499)
!499 = !{!260, !467, !494, !35}
!500 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !501, file: !379, line: 168)
!501 = !DISubprogram(name: "strtoul", scope: !32, file: !32, line: 180, type: !502, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!502 = !DISubroutineType(types: !503)
!503 = !{!418, !467, !494, !35}
!504 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !505, file: !379, line: 169)
!505 = !DISubprogram(name: "system", scope: !32, file: !32, line: 784, type: !402, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!506 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !507, file: !379, line: 171)
!507 = !DISubprogram(name: "wcstombs", scope: !32, file: !32, line: 936, type: !508, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!508 = !DISubroutineType(types: !509)
!509 = !{!416, !510, !511, !416}
!510 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !443)
!511 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !512)
!512 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !513, size: 64)
!513 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !466)
!514 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !515, file: !379, line: 172)
!515 = !DISubprogram(name: "wctomb", scope: !32, file: !32, line: 929, type: !516, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!516 = !DISubroutineType(types: !517)
!517 = !{!35, !443, !466}
!518 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !7, entity: !519, file: !379, line: 200)
!519 = !DIDerivedType(tag: DW_TAG_typedef, name: "lldiv_t", file: !32, line: 80, baseType: !520)
!520 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !32, line: 76, size: 128, flags: DIFlagTypePassByValue, elements: !521, identifier: "_ZTS7lldiv_t")
!521 = !{!522, !523}
!522 = !DIDerivedType(tag: DW_TAG_member, name: "quot", scope: !520, file: !32, line: 78, baseType: !223, size: 64)
!523 = !DIDerivedType(tag: DW_TAG_member, name: "rem", scope: !520, file: !32, line: 79, baseType: !223, size: 64, offset: 64)
!524 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !7, entity: !525, file: !379, line: 206)
!525 = !DISubprogram(name: "_Exit", scope: !32, file: !32, line: 629, type: !433, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: DISPFlagOptimized)
!526 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !7, entity: !527, file: !379, line: 210)
!527 = !DISubprogram(name: "llabs", scope: !32, file: !32, line: 844, type: !528, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!528 = !DISubroutineType(types: !529)
!529 = !{!223, !223}
!530 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !7, entity: !531, file: !379, line: 216)
!531 = !DISubprogram(name: "lldiv", scope: !32, file: !32, line: 858, type: !532, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!532 = !DISubroutineType(types: !533)
!533 = !{!519, !223, !223}
!534 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !7, entity: !535, file: !379, line: 227)
!535 = !DISubprogram(name: "atoll", scope: !32, file: !32, line: 373, type: !536, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!536 = !DISubroutineType(types: !537)
!537 = !{!223, !279}
!538 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !7, entity: !539, file: !379, line: 228)
!539 = !DISubprogram(name: "strtoll", scope: !32, file: !32, line: 200, type: !540, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!540 = !DISubroutineType(types: !541)
!541 = !{!223, !467, !494, !35}
!542 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !7, entity: !543, file: !379, line: 229)
!543 = !DISubprogram(name: "strtoull", scope: !32, file: !32, line: 205, type: !544, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!544 = !DISubroutineType(types: !545)
!545 = !{!546, !467, !494, !35}
!546 = !DIBasicType(name: "unsigned long long", size: 64, encoding: DW_ATE_unsigned)
!547 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !7, entity: !548, file: !379, line: 231)
!548 = !DISubprogram(name: "strtof", scope: !32, file: !32, line: 123, type: !549, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!549 = !DISubroutineType(types: !550)
!550 = !{!101, !467, !494}
!551 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !7, entity: !552, file: !379, line: 232)
!552 = !DISubprogram(name: "strtold", scope: !32, file: !32, line: 126, type: !553, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!553 = !DISubroutineType(types: !554)
!554 = !{!112, !467, !494}
!555 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !519, file: !379, line: 240)
!556 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !525, file: !379, line: 242)
!557 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !527, file: !379, line: 244)
!558 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !559, file: !379, line: 245)
!559 = !DISubprogram(name: "div", linkageName: "_ZN9__gnu_cxx3divExx", scope: !7, file: !379, line: 213, type: !532, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!560 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !531, file: !379, line: 246)
!561 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !535, file: !379, line: 248)
!562 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !548, file: !379, line: 249)
!563 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !539, file: !379, line: 250)
!564 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !543, file: !379, line: 251)
!565 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !552, file: !379, line: 252)
!566 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !387, file: !567, line: 38)
!567 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/9/../../../../include/c++/9/stdlib.h", directory: "")
!568 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !391, file: !567, line: 39)
!569 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !432, file: !567, line: 40)
!570 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !396, file: !567, line: 43)
!571 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !477, file: !567, line: 46)
!572 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !377, file: !567, line: 51)
!573 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !381, file: !567, line: 52)
!574 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !575, file: !567, line: 54)
!575 = !DISubprogram(name: "abs", linkageName: "_ZSt3abse", scope: !30, file: !36, line: 79, type: !110, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!576 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !398, file: !567, line: 55)
!577 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !401, file: !567, line: 56)
!578 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !405, file: !567, line: 57)
!579 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !409, file: !567, line: 58)
!580 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !424, file: !567, line: 59)
!581 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !559, file: !567, line: 60)
!582 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !436, file: !567, line: 61)
!583 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !440, file: !567, line: 62)
!584 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !445, file: !567, line: 63)
!585 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !449, file: !567, line: 64)
!586 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !453, file: !567, line: 65)
!587 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !457, file: !567, line: 67)
!588 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !461, file: !567, line: 68)
!589 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !469, file: !567, line: 69)
!590 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !473, file: !567, line: 71)
!591 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !479, file: !567, line: 72)
!592 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !483, file: !567, line: 73)
!593 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !487, file: !567, line: 74)
!594 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !491, file: !567, line: 75)
!595 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !497, file: !567, line: 76)
!596 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !501, file: !567, line: 77)
!597 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !505, file: !567, line: 78)
!598 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !507, file: !567, line: 80)
!599 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !515, file: !567, line: 81)
!600 = !DIImportedEntity(tag: DW_TAG_imported_module, scope: !601, entity: !602, file: !603, line: 58)
!601 = !DINamespace(name: "__gnu_debug", scope: null)
!602 = !DINamespace(name: "__debug", scope: !30)
!603 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/9/../../../../include/c++/9/debug/debug.h", directory: "")
!604 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !605, file: !606, line: 57)
!605 = !DICompositeType(tag: DW_TAG_class_type, name: "exception_ptr", scope: !607, file: !606, line: 79, size: 64, flags: DIFlagFwdDecl | DIFlagNonTrivial, identifier: "_ZTSNSt15__exception_ptr13exception_ptrE")
!606 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/9/../../../../include/c++/9/bits/exception_ptr.h", directory: "")
!607 = !DINamespace(name: "__exception_ptr", scope: !30)
!608 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !607, entity: !609, file: !606, line: 73)
!609 = !DISubprogram(name: "rethrow_exception", linkageName: "_ZSt17rethrow_exceptionNSt15__exception_ptr13exception_ptrE", scope: !30, file: !606, line: 69, type: !610, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: DISPFlagOptimized)
!610 = !DISubroutineType(types: !611)
!611 = !{null, !605}
!612 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !613, file: !614, line: 200)
!613 = !DISubprogram(name: "abs", linkageName: "_ZL3absd", scope: !614, file: !614, line: 28, type: !40, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!614 = !DIFile(filename: "/opt/rocm-5.3.0/llvm/lib/clang/15.0.0/include/__clang_cuda_math_forward_declares.h", directory: "")
!615 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !616, file: !614, line: 201)
!616 = !DISubprogram(name: "acos", linkageName: "_ZL4acosf", scope: !614, file: !614, line: 32, type: !106, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!617 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !618, file: !614, line: 202)
!618 = !DISubprogram(name: "acosh", linkageName: "_ZL5acoshf", scope: !614, file: !614, line: 34, type: !106, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!619 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !620, file: !614, line: 203)
!620 = !DISubprogram(name: "asin", linkageName: "_ZL4asinf", scope: !614, file: !614, line: 36, type: !106, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!621 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !622, file: !614, line: 204)
!622 = !DISubprogram(name: "asinh", linkageName: "_ZL5asinhf", scope: !614, file: !614, line: 38, type: !106, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!623 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !624, file: !614, line: 205)
!624 = !DISubprogram(name: "atan", linkageName: "_ZL4atanf", scope: !614, file: !614, line: 42, type: !106, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!625 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !626, file: !614, line: 206)
!626 = !DISubprogram(name: "atan2", linkageName: "_ZL5atan2ff", scope: !614, file: !614, line: 40, type: !135, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!627 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !628, file: !614, line: 207)
!628 = !DISubprogram(name: "atanh", linkageName: "_ZL5atanhf", scope: !614, file: !614, line: 44, type: !106, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!629 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !630, file: !614, line: 208)
!630 = !DISubprogram(name: "cbrt", linkageName: "_ZL4cbrtf", scope: !614, file: !614, line: 46, type: !106, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!631 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !632, file: !614, line: 209)
!632 = !DISubprogram(name: "ceil", linkageName: "_ZL4ceilf", scope: !614, file: !614, line: 48, type: !106, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!633 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !634, file: !614, line: 210)
!634 = !DISubprogram(name: "copysign", linkageName: "_ZL8copysignff", scope: !614, file: !614, line: 50, type: !135, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!635 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !636, file: !614, line: 211)
!636 = !DISubprogram(name: "cos", linkageName: "_ZL3cosf", scope: !614, file: !614, line: 52, type: !106, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!637 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !638, file: !614, line: 212)
!638 = !DISubprogram(name: "cosh", linkageName: "_ZL4coshf", scope: !614, file: !614, line: 54, type: !106, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!639 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !640, file: !614, line: 213)
!640 = !DISubprogram(name: "erf", linkageName: "_ZL3erff", scope: !614, file: !614, line: 58, type: !106, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!641 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !642, file: !614, line: 214)
!642 = !DISubprogram(name: "erfc", linkageName: "_ZL4erfcf", scope: !614, file: !614, line: 56, type: !106, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!643 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !644, file: !614, line: 215)
!644 = !DISubprogram(name: "exp", linkageName: "_ZL3expf", scope: !614, file: !614, line: 62, type: !106, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!645 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !646, file: !614, line: 216)
!646 = !DISubprogram(name: "exp2", linkageName: "_ZL4exp2f", scope: !614, file: !614, line: 60, type: !106, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!647 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !648, file: !614, line: 217)
!648 = !DISubprogram(name: "expm1", linkageName: "_ZL5expm1f", scope: !614, file: !614, line: 64, type: !106, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!649 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !650, file: !614, line: 218)
!650 = !DISubprogram(name: "fabs", linkageName: "_ZL4fabsf", scope: !614, file: !614, line: 66, type: !106, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!651 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !652, file: !614, line: 219)
!652 = !DISubprogram(name: "fdim", linkageName: "_ZL4fdimff", scope: !614, file: !614, line: 68, type: !135, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!653 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !654, file: !614, line: 220)
!654 = !DISubprogram(name: "floor", linkageName: "_ZL5floorf", scope: !614, file: !614, line: 70, type: !106, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!655 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !656, file: !614, line: 221)
!656 = !DISubprogram(name: "fma", linkageName: "_ZL3fmafff", scope: !614, file: !614, line: 72, type: !177, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!657 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !658, file: !614, line: 222)
!658 = !DISubprogram(name: "fmax", linkageName: "_ZL4fmaxff", scope: !614, file: !614, line: 74, type: !135, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!659 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !660, file: !614, line: 223)
!660 = !DISubprogram(name: "fmin", linkageName: "_ZL4fminff", scope: !614, file: !614, line: 76, type: !135, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!661 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !662, file: !614, line: 224)
!662 = !DISubprogram(name: "fmod", linkageName: "_ZL4fmodff", scope: !614, file: !614, line: 78, type: !135, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!663 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !664, file: !614, line: 225)
!664 = !DISubprogram(name: "fpclassify", linkageName: "_ZL10fpclassifyf", scope: !614, file: !614, line: 80, type: !207, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!665 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !666, file: !614, line: 226)
!666 = !DISubprogram(name: "frexp", linkageName: "_ZL5frexpfPi", scope: !614, file: !614, line: 82, type: !667, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!667 = !DISubroutineType(types: !668)
!668 = !{!101, !101, !70}
!669 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !670, file: !614, line: 227)
!670 = !DISubprogram(name: "hypot", linkageName: "_ZL5hypotff", scope: !614, file: !614, line: 84, type: !135, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!671 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !672, file: !614, line: 228)
!672 = !DISubprogram(name: "ilogb", linkageName: "_ZL5ilogbf", scope: !614, file: !614, line: 86, type: !207, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!673 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !674, file: !614, line: 229)
!674 = !DISubprogram(name: "isfinite", linkageName: "_ZL8isfinitef", scope: !614, file: !614, line: 91, type: !675, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!675 = !DISubroutineType(types: !676)
!676 = !{!677, !101}
!677 = !DIBasicType(name: "bool", size: 8, encoding: DW_ATE_boolean)
!678 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !679, file: !614, line: 230)
!679 = !DISubprogram(name: "isgreater", linkageName: "_ZL9isgreaterff", scope: !614, file: !614, line: 95, type: !680, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!680 = !DISubroutineType(types: !681)
!681 = !{!677, !101, !101}
!682 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !683, file: !614, line: 231)
!683 = !DISubprogram(name: "isgreaterequal", linkageName: "_ZL14isgreaterequalff", scope: !614, file: !614, line: 94, type: !680, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!684 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !685, file: !614, line: 232)
!685 = !DISubprogram(name: "isinf", linkageName: "_ZL5isinff", scope: !614, file: !614, line: 100, type: !675, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!686 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !687, file: !614, line: 233)
!687 = !DISubprogram(name: "isless", linkageName: "_ZL6islessff", scope: !614, file: !614, line: 104, type: !680, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!688 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !689, file: !614, line: 234)
!689 = !DISubprogram(name: "islessequal", linkageName: "_ZL11islessequalff", scope: !614, file: !614, line: 103, type: !680, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!690 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !691, file: !614, line: 235)
!691 = !DISubprogram(name: "islessgreater", linkageName: "_ZL13islessgreaterff", scope: !614, file: !614, line: 106, type: !680, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!692 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !693, file: !614, line: 236)
!693 = !DISubprogram(name: "isnan", linkageName: "_ZL5isnanf", scope: !614, file: !614, line: 111, type: !675, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!694 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !695, file: !614, line: 237)
!695 = !DISubprogram(name: "isnormal", linkageName: "_ZL8isnormalf", scope: !614, file: !614, line: 113, type: !675, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!696 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !697, file: !614, line: 238)
!697 = !DISubprogram(name: "isunordered", linkageName: "_ZL11isunorderedff", scope: !614, file: !614, line: 115, type: !680, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!698 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !699, file: !614, line: 239)
!699 = !DISubprogram(name: "labs", linkageName: "_ZL4labsl", scope: !614, file: !614, line: 116, type: !446, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!700 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !701, file: !614, line: 240)
!701 = !DISubprogram(name: "ldexp", linkageName: "_ZL5ldexpfi", scope: !614, file: !614, line: 118, type: !358, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!702 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !703, file: !614, line: 241)
!703 = !DISubprogram(name: "lgamma", linkageName: "_ZL6lgammaf", scope: !614, file: !614, line: 120, type: !106, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!704 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !705, file: !614, line: 242)
!705 = !DISubprogram(name: "llabs", linkageName: "_ZL5llabsx", scope: !614, file: !614, line: 121, type: !528, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!706 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !707, file: !614, line: 243)
!707 = !DISubprogram(name: "llrint", linkageName: "_ZL6llrintf", scope: !614, file: !614, line: 123, type: !226, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!708 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !709, file: !614, line: 244)
!709 = !DISubprogram(name: "log", linkageName: "_ZL3logf", scope: !614, file: !614, line: 133, type: !106, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!710 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !711, file: !614, line: 245)
!711 = !DISubprogram(name: "log10", linkageName: "_ZL5log10f", scope: !614, file: !614, line: 125, type: !106, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!712 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !713, file: !614, line: 246)
!713 = !DISubprogram(name: "log1p", linkageName: "_ZL5log1pf", scope: !614, file: !614, line: 127, type: !106, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!714 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !715, file: !614, line: 247)
!715 = !DISubprogram(name: "log2", linkageName: "_ZL4log2f", scope: !614, file: !614, line: 129, type: !106, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!716 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !717, file: !614, line: 248)
!717 = !DISubprogram(name: "logb", linkageName: "_ZL4logbf", scope: !614, file: !614, line: 131, type: !106, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!718 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !719, file: !614, line: 249)
!719 = !DISubprogram(name: "lrint", linkageName: "_ZL5lrintf", scope: !614, file: !614, line: 135, type: !263, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!720 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !721, file: !614, line: 250)
!721 = !DISubprogram(name: "lround", linkageName: "_ZL6lroundf", scope: !614, file: !614, line: 137, type: !263, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!722 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !723, file: !614, line: 251)
!723 = !DISubprogram(name: "llround", linkageName: "_ZL7llroundf", scope: !614, file: !614, line: 138, type: !226, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!724 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !725, file: !614, line: 252)
!725 = !DISubprogram(name: "modf", linkageName: "_ZL4modffPf", scope: !614, file: !614, line: 140, type: !726, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!726 = !DISubroutineType(types: !727)
!727 = !{!101, !101, !728}
!728 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !101, size: 64)
!729 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !730, file: !614, line: 253)
!730 = !DISubprogram(name: "nan", linkageName: "_ZL3nanPKc", scope: !614, file: !614, line: 141, type: !277, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!731 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !732, file: !614, line: 254)
!732 = !DISubprogram(name: "nanf", linkageName: "_ZL4nanfPKc", scope: !614, file: !614, line: 142, type: !284, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!733 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !734, file: !614, line: 255)
!734 = !DISubprogram(name: "nearbyint", linkageName: "_ZL9nearbyintf", scope: !614, file: !614, line: 144, type: !106, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!735 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !736, file: !614, line: 256)
!736 = !DISubprogram(name: "nextafter", linkageName: "_ZL9nextafterff", scope: !614, file: !614, line: 146, type: !135, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!737 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !738, file: !614, line: 257)
!738 = !DISubprogram(name: "pow", linkageName: "_ZL3powfi", scope: !614, file: !614, line: 150, type: !358, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!739 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !740, file: !614, line: 258)
!740 = !DISubprogram(name: "remainder", linkageName: "_ZL9remainderff", scope: !614, file: !614, line: 152, type: !135, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!741 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !742, file: !614, line: 259)
!742 = !DISubprogram(name: "remquo", linkageName: "_ZL6remquoffPi", scope: !614, file: !614, line: 154, type: !324, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!743 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !744, file: !614, line: 260)
!744 = !DISubprogram(name: "rint", linkageName: "_ZL4rintf", scope: !614, file: !614, line: 156, type: !106, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!745 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !746, file: !614, line: 261)
!746 = !DISubprogram(name: "round", linkageName: "_ZL5roundf", scope: !614, file: !614, line: 158, type: !106, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!747 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !748, file: !614, line: 262)
!748 = !DISubprogram(name: "scalbln", linkageName: "_ZL7scalblnfl", scope: !614, file: !614, line: 160, type: !348, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!749 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !750, file: !614, line: 263)
!750 = !DISubprogram(name: "scalbn", linkageName: "_ZL6scalbnfi", scope: !614, file: !614, line: 162, type: !358, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!751 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !752, file: !614, line: 264)
!752 = !DISubprogram(name: "signbit", linkageName: "_ZL7signbitf", scope: !614, file: !614, line: 167, type: !675, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!753 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !754, file: !614, line: 265)
!754 = !DISubprogram(name: "sin", linkageName: "_ZL3sinf", scope: !614, file: !614, line: 169, type: !106, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!755 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !756, file: !614, line: 266)
!756 = !DISubprogram(name: "sinh", linkageName: "_ZL4sinhf", scope: !614, file: !614, line: 171, type: !106, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!757 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !758, file: !614, line: 267)
!758 = !DISubprogram(name: "sqrt", linkageName: "_ZL4sqrtf", scope: !614, file: !614, line: 173, type: !106, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!759 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !760, file: !614, line: 268)
!760 = !DISubprogram(name: "tan", linkageName: "_ZL3tanf", scope: !614, file: !614, line: 175, type: !106, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!761 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !762, file: !614, line: 269)
!762 = !DISubprogram(name: "tanh", linkageName: "_ZL4tanhf", scope: !614, file: !614, line: 177, type: !106, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!763 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !764, file: !614, line: 270)
!764 = !DISubprogram(name: "tgamma", linkageName: "_ZL6tgammaf", scope: !614, file: !614, line: 179, type: !106, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!765 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !766, file: !614, line: 271)
!766 = !DISubprogram(name: "trunc", linkageName: "_ZL5truncf", scope: !614, file: !614, line: 181, type: !106, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!767 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !768, file: !770, line: 729)
!768 = !DISubprogram(name: "acosf", linkageName: "_ZL5acosff", scope: !769, file: !769, line: 188, type: !106, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!769 = !DIFile(filename: "/opt/rocm-5.3.0/llvm/lib/clang/15.0.0/include/__clang_hip_math.h", directory: "")
!770 = !DIFile(filename: "/opt/rocm-5.3.0/llvm/lib/clang/15.0.0/include/__clang_hip_cmath.h", directory: "")
!771 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !772, file: !770, line: 730)
!772 = !DISubprogram(name: "acoshf", linkageName: "_ZL6acoshff", scope: !769, file: !769, line: 191, type: !106, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!773 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !774, file: !770, line: 731)
!774 = !DISubprogram(name: "asinf", linkageName: "_ZL5asinff", scope: !769, file: !769, line: 194, type: !106, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!775 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !776, file: !770, line: 732)
!776 = !DISubprogram(name: "asinhf", linkageName: "_ZL6asinhff", scope: !769, file: !769, line: 197, type: !106, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!777 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !778, file: !770, line: 733)
!778 = !DISubprogram(name: "atan2f", linkageName: "_ZL6atan2fff", scope: !769, file: !769, line: 200, type: !135, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!779 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !780, file: !770, line: 734)
!780 = !DISubprogram(name: "atanf", linkageName: "_ZL5atanff", scope: !769, file: !769, line: 203, type: !106, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!781 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !782, file: !770, line: 735)
!782 = !DISubprogram(name: "atanhf", linkageName: "_ZL6atanhff", scope: !769, file: !769, line: 206, type: !106, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!783 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !784, file: !770, line: 736)
!784 = !DISubprogram(name: "cbrtf", linkageName: "_ZL5cbrtff", scope: !769, file: !769, line: 209, type: !106, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!785 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !786, file: !770, line: 737)
!786 = !DISubprogram(name: "ceilf", linkageName: "_ZL5ceilff", scope: !769, file: !769, line: 212, type: !106, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!787 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !788, file: !770, line: 738)
!788 = !DISubprogram(name: "copysignf", linkageName: "_ZL9copysignfff", scope: !769, file: !769, line: 215, type: !135, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!789 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !790, file: !770, line: 739)
!790 = !DISubprogram(name: "cosf", linkageName: "_ZL4cosff", scope: !769, file: !769, line: 218, type: !106, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!791 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !792, file: !770, line: 740)
!792 = !DISubprogram(name: "coshf", linkageName: "_ZL5coshff", scope: !769, file: !769, line: 221, type: !106, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!793 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !794, file: !770, line: 741)
!794 = !DISubprogram(name: "erfcf", linkageName: "_ZL5erfcff", scope: !769, file: !769, line: 233, type: !106, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!795 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !796, file: !770, line: 742)
!796 = !DISubprogram(name: "erff", linkageName: "_ZL4erfff", scope: !769, file: !769, line: 242, type: !106, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!797 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !798, file: !770, line: 743)
!798 = !DISubprogram(name: "exp2f", linkageName: "_ZL5exp2ff", scope: !769, file: !769, line: 251, type: !106, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!799 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !800, file: !770, line: 744)
!800 = !DISubprogram(name: "expf", linkageName: "_ZL4expff", scope: !769, file: !769, line: 254, type: !106, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!801 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !802, file: !770, line: 745)
!802 = !DISubprogram(name: "expm1f", linkageName: "_ZL6expm1ff", scope: !769, file: !769, line: 257, type: !106, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!803 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !804, file: !770, line: 746)
!804 = !DISubprogram(name: "fabsf", linkageName: "_ZL5fabsff", scope: !769, file: !769, line: 260, type: !106, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!805 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !806, file: !770, line: 747)
!806 = !DISubprogram(name: "fdimf", linkageName: "_ZL5fdimfff", scope: !769, file: !769, line: 263, type: !135, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!807 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !808, file: !770, line: 748)
!808 = !DISubprogram(name: "floorf", linkageName: "_ZL6floorff", scope: !769, file: !769, line: 269, type: !106, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!809 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !810, file: !770, line: 749)
!810 = !DISubprogram(name: "fmaf", linkageName: "_ZL4fmaffff", scope: !769, file: !769, line: 272, type: !177, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!811 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !812, file: !770, line: 750)
!812 = !DISubprogram(name: "fmaxf", linkageName: "_ZL5fmaxfff", scope: !769, file: !769, line: 277, type: !135, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!813 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !814, file: !770, line: 751)
!814 = !DISubprogram(name: "fminf", linkageName: "_ZL5fminfff", scope: !769, file: !769, line: 280, type: !135, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!815 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !816, file: !770, line: 752)
!816 = !DISubprogram(name: "fmodf", linkageName: "_ZL5fmodfff", scope: !769, file: !769, line: 283, type: !135, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!817 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !818, file: !770, line: 753)
!818 = !DISubprogram(name: "frexpf", linkageName: "_ZL6frexpffPi", scope: !769, file: !769, line: 286, type: !667, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!819 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !820, file: !770, line: 754)
!820 = !DISubprogram(name: "hypotf", linkageName: "_ZL6hypotfff", scope: !769, file: !769, line: 299, type: !135, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!821 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !822, file: !770, line: 755)
!822 = !DISubprogram(name: "ilogbf", linkageName: "_ZL6ilogbff", scope: !769, file: !769, line: 302, type: !207, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!823 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !824, file: !770, line: 756)
!824 = !DISubprogram(name: "ldexpf", linkageName: "_ZL6ldexpffi", scope: !769, file: !769, line: 341, type: !358, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!825 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !826, file: !770, line: 757)
!826 = !DISubprogram(name: "lgammaf", linkageName: "_ZL7lgammaff", scope: !769, file: !769, line: 344, type: !106, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!827 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !828, file: !770, line: 758)
!828 = !DISubprogram(name: "llrintf", linkageName: "_ZL7llrintff", scope: !769, file: !769, line: 347, type: !226, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!829 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !830, file: !770, line: 759)
!830 = !DISubprogram(name: "llroundf", linkageName: "_ZL8llroundff", scope: !769, file: !769, line: 350, type: !226, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!831 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !832, file: !770, line: 760)
!832 = !DISubprogram(name: "log10f", linkageName: "_ZL6log10ff", scope: !769, file: !769, line: 353, type: !106, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!833 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !834, file: !770, line: 761)
!834 = !DISubprogram(name: "log1pf", linkageName: "_ZL6log1pff", scope: !769, file: !769, line: 356, type: !106, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!835 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !836, file: !770, line: 762)
!836 = !DISubprogram(name: "log2f", linkageName: "_ZL5log2ff", scope: !769, file: !769, line: 359, type: !106, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!837 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !838, file: !770, line: 763)
!838 = !DISubprogram(name: "logbf", linkageName: "_ZL5logbff", scope: !769, file: !769, line: 365, type: !106, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!839 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !840, file: !770, line: 764)
!840 = !DISubprogram(name: "logf", linkageName: "_ZL4logff", scope: !769, file: !769, line: 368, type: !106, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!841 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !842, file: !770, line: 765)
!842 = !DISubprogram(name: "lrintf", linkageName: "_ZL6lrintff", scope: !769, file: !769, line: 371, type: !263, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!843 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !844, file: !770, line: 766)
!844 = !DISubprogram(name: "lroundf", linkageName: "_ZL7lroundff", scope: !769, file: !769, line: 374, type: !263, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!845 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !846, file: !770, line: 767)
!846 = !DISubprogram(name: "modff", linkageName: "_ZL5modfffPf", scope: !769, file: !769, line: 377, type: !726, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!847 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !848, file: !770, line: 768)
!848 = !DISubprogram(name: "nearbyintf", linkageName: "_ZL10nearbyintff", scope: !769, file: !769, line: 413, type: !106, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!849 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !850, file: !770, line: 769)
!850 = !DISubprogram(name: "nextafterf", linkageName: "_ZL10nextafterfff", scope: !769, file: !769, line: 416, type: !135, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!851 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !852, file: !770, line: 771)
!852 = !DISubprogram(name: "powf", linkageName: "_ZL4powfff", scope: !769, file: !769, line: 449, type: !135, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!853 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !854, file: !770, line: 772)
!854 = !DISubprogram(name: "remainderf", linkageName: "_ZL10remainderfff", scope: !769, file: !769, line: 474, type: !135, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!855 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !856, file: !770, line: 773)
!856 = !DISubprogram(name: "remquof", linkageName: "_ZL7remquofffPi", scope: !769, file: !769, line: 479, type: !324, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!857 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !858, file: !770, line: 774)
!858 = !DISubprogram(name: "rintf", linkageName: "_ZL5rintff", scope: !769, file: !769, line: 495, type: !106, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!859 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !860, file: !770, line: 775)
!860 = !DISubprogram(name: "roundf", linkageName: "_ZL6roundff", scope: !769, file: !769, line: 520, type: !106, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!861 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !862, file: !770, line: 776)
!862 = !DISubprogram(name: "scalblnf", linkageName: "_ZL8scalblnffl", scope: !769, file: !769, line: 526, type: !348, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!863 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !864, file: !770, line: 777)
!864 = !DISubprogram(name: "scalbnf", linkageName: "_ZL7scalbnffi", scope: !769, file: !769, line: 532, type: !358, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!865 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !866, file: !770, line: 778)
!866 = !DISubprogram(name: "sinf", linkageName: "_ZL4sinff", scope: !769, file: !769, line: 560, type: !106, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!867 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !868, file: !770, line: 779)
!868 = !DISubprogram(name: "sinhf", linkageName: "_ZL5sinhff", scope: !769, file: !769, line: 563, type: !106, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!869 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !870, file: !770, line: 780)
!870 = !DISubprogram(name: "sqrtf", linkageName: "_ZL5sqrtff", scope: !769, file: !769, line: 569, type: !106, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!871 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !872, file: !770, line: 781)
!872 = !DISubprogram(name: "tanf", linkageName: "_ZL4tanff", scope: !769, file: !769, line: 572, type: !106, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!873 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !874, file: !770, line: 782)
!874 = !DISubprogram(name: "tanhf", linkageName: "_ZL5tanhff", scope: !769, file: !769, line: 575, type: !106, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!875 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !876, file: !770, line: 783)
!876 = !DISubprogram(name: "tgammaf", linkageName: "_ZL7tgammaff", scope: !769, file: !769, line: 578, type: !106, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!877 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !878, file: !770, line: 784)
!878 = !DISubprogram(name: "truncf", linkageName: "_ZL6truncff", scope: !769, file: !769, line: 581, type: !106, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!879 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !880, file: !895, line: 64)
!880 = !DIDerivedType(tag: DW_TAG_typedef, name: "mbstate_t", file: !881, line: 6, baseType: !882)
!881 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/mbstate_t.h", directory: "")
!882 = !DIDerivedType(tag: DW_TAG_typedef, name: "__mbstate_t", file: !883, line: 21, baseType: !884)
!883 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/__mbstate_t.h", directory: "")
!884 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !883, line: 13, size: 64, flags: DIFlagTypePassByValue, elements: !885, identifier: "_ZTS11__mbstate_t")
!885 = !{!886, !887}
!886 = !DIDerivedType(tag: DW_TAG_member, name: "__count", scope: !884, file: !883, line: 15, baseType: !35, size: 32)
!887 = !DIDerivedType(tag: DW_TAG_member, name: "__value", scope: !884, file: !883, line: 20, baseType: !888, size: 32, offset: 32)
!888 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !884, file: !883, line: 16, size: 32, flags: DIFlagTypePassByValue, elements: !889, identifier: "_ZTSN11__mbstate_tUt_E")
!889 = !{!890, !891}
!890 = !DIDerivedType(tag: DW_TAG_member, name: "__wch", scope: !888, file: !883, line: 18, baseType: !8, size: 32)
!891 = !DIDerivedType(tag: DW_TAG_member, name: "__wchb", scope: !888, file: !883, line: 19, baseType: !892, size: 32)
!892 = !DICompositeType(tag: DW_TAG_array_type, baseType: !281, size: 32, elements: !893)
!893 = !{!894}
!894 = !DISubrange(count: 4)
!895 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/9/../../../../include/c++/9/cwchar", directory: "")
!896 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !897, file: !895, line: 141)
!897 = !DIDerivedType(tag: DW_TAG_typedef, name: "wint_t", file: !898, line: 20, baseType: !8)
!898 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/wint_t.h", directory: "")
!899 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !900, file: !895, line: 143)
!900 = !DISubprogram(name: "btowc", scope: !901, file: !901, line: 318, type: !902, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!901 = !DIFile(filename: "/usr/include/wchar.h", directory: "")
!902 = !DISubroutineType(types: !903)
!903 = !{!897, !35}
!904 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !905, file: !895, line: 144)
!905 = !DISubprogram(name: "fgetwc", scope: !901, file: !901, line: 726, type: !906, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!906 = !DISubroutineType(types: !907)
!907 = !{!897, !908}
!908 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !909, size: 64)
!909 = !DIDerivedType(tag: DW_TAG_typedef, name: "__FILE", file: !910, line: 5, baseType: !911)
!910 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/__FILE.h", directory: "")
!911 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_FILE", file: !912, line: 49, size: 1728, flags: DIFlagTypePassByValue, elements: !913, identifier: "_ZTS8_IO_FILE")
!912 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/struct_FILE.h", directory: "")
!913 = !{!914, !915, !916, !917, !918, !919, !920, !921, !922, !923, !924, !925, !926, !929, !931, !932, !933, !935, !937, !939, !943, !946, !948, !951, !954, !955, !956, !957, !958}
!914 = !DIDerivedType(tag: DW_TAG_member, name: "_flags", scope: !911, file: !912, line: 51, baseType: !35, size: 32)
!915 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_read_ptr", scope: !911, file: !912, line: 54, baseType: !443, size: 64, offset: 64)
!916 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_read_end", scope: !911, file: !912, line: 55, baseType: !443, size: 64, offset: 128)
!917 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_read_base", scope: !911, file: !912, line: 56, baseType: !443, size: 64, offset: 192)
!918 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_write_base", scope: !911, file: !912, line: 57, baseType: !443, size: 64, offset: 256)
!919 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_write_ptr", scope: !911, file: !912, line: 58, baseType: !443, size: 64, offset: 320)
!920 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_write_end", scope: !911, file: !912, line: 59, baseType: !443, size: 64, offset: 384)
!921 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_buf_base", scope: !911, file: !912, line: 60, baseType: !443, size: 64, offset: 448)
!922 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_buf_end", scope: !911, file: !912, line: 61, baseType: !443, size: 64, offset: 512)
!923 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_save_base", scope: !911, file: !912, line: 64, baseType: !443, size: 64, offset: 576)
!924 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_backup_base", scope: !911, file: !912, line: 65, baseType: !443, size: 64, offset: 640)
!925 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_save_end", scope: !911, file: !912, line: 66, baseType: !443, size: 64, offset: 704)
!926 = !DIDerivedType(tag: DW_TAG_member, name: "_markers", scope: !911, file: !912, line: 68, baseType: !927, size: 64, offset: 768)
!927 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !928, size: 64)
!928 = !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_marker", file: !912, line: 36, flags: DIFlagFwdDecl | DIFlagNonTrivial, identifier: "_ZTS10_IO_marker")
!929 = !DIDerivedType(tag: DW_TAG_member, name: "_chain", scope: !911, file: !912, line: 70, baseType: !930, size: 64, offset: 832)
!930 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !911, size: 64)
!931 = !DIDerivedType(tag: DW_TAG_member, name: "_fileno", scope: !911, file: !912, line: 72, baseType: !35, size: 32, offset: 896)
!932 = !DIDerivedType(tag: DW_TAG_member, name: "_flags2", scope: !911, file: !912, line: 73, baseType: !35, size: 32, offset: 928)
!933 = !DIDerivedType(tag: DW_TAG_member, name: "_old_offset", scope: !911, file: !912, line: 74, baseType: !934, size: 64, offset: 960)
!934 = !DIDerivedType(tag: DW_TAG_typedef, name: "__off_t", file: !21, line: 152, baseType: !260)
!935 = !DIDerivedType(tag: DW_TAG_member, name: "_cur_column", scope: !911, file: !912, line: 77, baseType: !936, size: 16, offset: 1024)
!936 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!937 = !DIDerivedType(tag: DW_TAG_member, name: "_vtable_offset", scope: !911, file: !912, line: 78, baseType: !938, size: 8, offset: 1040)
!938 = !DIBasicType(name: "signed char", size: 8, encoding: DW_ATE_signed_char)
!939 = !DIDerivedType(tag: DW_TAG_member, name: "_shortbuf", scope: !911, file: !912, line: 79, baseType: !940, size: 8, offset: 1048)
!940 = !DICompositeType(tag: DW_TAG_array_type, baseType: !281, size: 8, elements: !941)
!941 = !{!942}
!942 = !DISubrange(count: 1)
!943 = !DIDerivedType(tag: DW_TAG_member, name: "_lock", scope: !911, file: !912, line: 81, baseType: !944, size: 64, offset: 1088)
!944 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !945, size: 64)
!945 = !DIDerivedType(tag: DW_TAG_typedef, name: "_IO_lock_t", file: !912, line: 43, baseType: null)
!946 = !DIDerivedType(tag: DW_TAG_member, name: "_offset", scope: !911, file: !912, line: 89, baseType: !947, size: 64, offset: 1152)
!947 = !DIDerivedType(tag: DW_TAG_typedef, name: "__off64_t", file: !21, line: 153, baseType: !260)
!948 = !DIDerivedType(tag: DW_TAG_member, name: "_codecvt", scope: !911, file: !912, line: 91, baseType: !949, size: 64, offset: 1216)
!949 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !950, size: 64)
!950 = !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_codecvt", file: !912, line: 37, flags: DIFlagFwdDecl | DIFlagNonTrivial, identifier: "_ZTS11_IO_codecvt")
!951 = !DIDerivedType(tag: DW_TAG_member, name: "_wide_data", scope: !911, file: !912, line: 92, baseType: !952, size: 64, offset: 1280)
!952 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !953, size: 64)
!953 = !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_wide_data", file: !912, line: 38, flags: DIFlagFwdDecl | DIFlagNonTrivial, identifier: "_ZTS13_IO_wide_data")
!954 = !DIDerivedType(tag: DW_TAG_member, name: "_freeres_list", scope: !911, file: !912, line: 93, baseType: !930, size: 64, offset: 1344)
!955 = !DIDerivedType(tag: DW_TAG_member, name: "_freeres_buf", scope: !911, file: !912, line: 94, baseType: !413, size: 64, offset: 1408)
!956 = !DIDerivedType(tag: DW_TAG_member, name: "__pad5", scope: !911, file: !912, line: 95, baseType: !416, size: 64, offset: 1472)
!957 = !DIDerivedType(tag: DW_TAG_member, name: "_mode", scope: !911, file: !912, line: 96, baseType: !35, size: 32, offset: 1536)
!958 = !DIDerivedType(tag: DW_TAG_member, name: "_unused2", scope: !911, file: !912, line: 98, baseType: !959, size: 160, offset: 1568)
!959 = !DICompositeType(tag: DW_TAG_array_type, baseType: !281, size: 160, elements: !960)
!960 = !{!961}
!961 = !DISubrange(count: 20)
!962 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !963, file: !895, line: 145)
!963 = !DISubprogram(name: "fgetws", scope: !901, file: !901, line: 755, type: !964, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!964 = !DISubroutineType(types: !965)
!965 = !{!465, !464, !35, !966}
!966 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !908)
!967 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !968, file: !895, line: 146)
!968 = !DISubprogram(name: "fputwc", scope: !901, file: !901, line: 740, type: !969, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!969 = !DISubroutineType(types: !970)
!970 = !{!897, !466, !908}
!971 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !972, file: !895, line: 147)
!972 = !DISubprogram(name: "fputws", scope: !901, file: !901, line: 762, type: !973, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!973 = !DISubroutineType(types: !974)
!974 = !{!35, !511, !966}
!975 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !976, file: !895, line: 148)
!976 = !DISubprogram(name: "fwide", scope: !901, file: !901, line: 573, type: !977, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!977 = !DISubroutineType(types: !978)
!978 = !{!35, !908, !35}
!979 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !980, file: !895, line: 149)
!980 = !DISubprogram(name: "fwprintf", scope: !901, file: !901, line: 580, type: !981, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!981 = !DISubroutineType(types: !982)
!982 = !{!35, !966, !511, null}
!983 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !984, file: !895, line: 150)
!984 = !DISubprogram(name: "fwscanf", linkageName: "__isoc99_fwscanf", scope: !901, file: !901, line: 640, type: !981, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!985 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !986, file: !895, line: 151)
!986 = !DISubprogram(name: "getwc", scope: !901, file: !901, line: 727, type: !906, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!987 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !988, file: !895, line: 152)
!988 = !DISubprogram(name: "getwchar", scope: !901, file: !901, line: 733, type: !989, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!989 = !DISubroutineType(types: !990)
!990 = !{!897}
!991 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !992, file: !895, line: 153)
!992 = !DISubprogram(name: "mbrlen", scope: !901, file: !901, line: 329, type: !993, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!993 = !DISubroutineType(types: !994)
!994 = !{!416, !467, !416, !995}
!995 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !996)
!996 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !880, size: 64)
!997 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !998, file: !895, line: 154)
!998 = !DISubprogram(name: "mbrtowc", scope: !901, file: !901, line: 296, type: !999, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!999 = !DISubroutineType(types: !1000)
!1000 = !{!416, !464, !467, !416, !995}
!1001 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !1002, file: !895, line: 155)
!1002 = !DISubprogram(name: "mbsinit", scope: !901, file: !901, line: 292, type: !1003, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1003 = !DISubroutineType(types: !1004)
!1004 = !{!35, !1005}
!1005 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1006, size: 64)
!1006 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !880)
!1007 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !1008, file: !895, line: 156)
!1008 = !DISubprogram(name: "mbsrtowcs", scope: !901, file: !901, line: 337, type: !1009, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1009 = !DISubroutineType(types: !1010)
!1010 = !{!416, !464, !1011, !416, !995}
!1011 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !1012)
!1012 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !279, size: 64)
!1013 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !1014, file: !895, line: 157)
!1014 = !DISubprogram(name: "putwc", scope: !901, file: !901, line: 741, type: !969, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1015 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !1016, file: !895, line: 158)
!1016 = !DISubprogram(name: "putwchar", scope: !901, file: !901, line: 747, type: !1017, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1017 = !DISubroutineType(types: !1018)
!1018 = !{!897, !466}
!1019 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !1020, file: !895, line: 160)
!1020 = !DISubprogram(name: "swprintf", scope: !901, file: !901, line: 590, type: !1021, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1021 = !DISubroutineType(types: !1022)
!1022 = !{!35, !464, !416, !511, null}
!1023 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !1024, file: !895, line: 162)
!1024 = !DISubprogram(name: "swscanf", linkageName: "__isoc99_swscanf", scope: !901, file: !901, line: 647, type: !1025, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1025 = !DISubroutineType(types: !1026)
!1026 = !{!35, !511, !511, null}
!1027 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !1028, file: !895, line: 163)
!1028 = !DISubprogram(name: "ungetwc", scope: !901, file: !901, line: 770, type: !1029, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1029 = !DISubroutineType(types: !1030)
!1030 = !{!897, !897, !908}
!1031 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !1032, file: !895, line: 164)
!1032 = !DISubprogram(name: "vfwprintf", scope: !901, file: !901, line: 598, type: !1033, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1033 = !DISubroutineType(types: !1034)
!1034 = !{!35, !966, !511, !1035}
!1035 = !DIDerivedType(tag: DW_TAG_typedef, name: "__gnuc_va_list", file: !1036, line: 32, baseType: !1037)
!1036 = !DIFile(filename: "/opt/rocm-5.3.0/llvm/lib/clang/15.0.0/include/stdarg.h", directory: "")
!1037 = !DIDerivedType(tag: DW_TAG_typedef, name: "__builtin_va_list", file: !1038, baseType: !443)
!1038 = !DIFile(filename: "vecadd.hip", directory: "/workspaces/cupbop-amd-playground/vector-add")
!1039 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !1040, file: !895, line: 166)
!1040 = !DISubprogram(name: "vfwscanf", linkageName: "__isoc99_vfwscanf", scope: !901, file: !901, line: 693, type: !1033, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1041 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !1042, file: !895, line: 169)
!1042 = !DISubprogram(name: "vswprintf", scope: !901, file: !901, line: 611, type: !1043, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1043 = !DISubroutineType(types: !1044)
!1044 = !{!35, !464, !416, !511, !1035}
!1045 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !1046, file: !895, line: 172)
!1046 = !DISubprogram(name: "vswscanf", linkageName: "__isoc99_vswscanf", scope: !901, file: !901, line: 700, type: !1047, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1047 = !DISubroutineType(types: !1048)
!1048 = !{!35, !511, !511, !1035}
!1049 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !1050, file: !895, line: 174)
!1050 = !DISubprogram(name: "vwprintf", scope: !901, file: !901, line: 606, type: !1051, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1051 = !DISubroutineType(types: !1052)
!1052 = !{!35, !511, !1035}
!1053 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !1054, file: !895, line: 176)
!1054 = !DISubprogram(name: "vwscanf", linkageName: "__isoc99_vwscanf", scope: !901, file: !901, line: 697, type: !1051, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1055 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !1056, file: !895, line: 178)
!1056 = !DISubprogram(name: "wcrtomb", scope: !901, file: !901, line: 301, type: !1057, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1057 = !DISubroutineType(types: !1058)
!1058 = !{!416, !510, !466, !995}
!1059 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !1060, file: !895, line: 179)
!1060 = !DISubprogram(name: "wcscat", scope: !901, file: !901, line: 97, type: !1061, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1061 = !DISubroutineType(types: !1062)
!1062 = !{!465, !464, !511}
!1063 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !1064, file: !895, line: 180)
!1064 = !DISubprogram(name: "wcscmp", scope: !901, file: !901, line: 106, type: !1065, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1065 = !DISubroutineType(types: !1066)
!1066 = !{!35, !512, !512}
!1067 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !1068, file: !895, line: 181)
!1068 = !DISubprogram(name: "wcscoll", scope: !901, file: !901, line: 131, type: !1065, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1069 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !1070, file: !895, line: 182)
!1070 = !DISubprogram(name: "wcscpy", scope: !901, file: !901, line: 87, type: !1061, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1071 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !1072, file: !895, line: 183)
!1072 = !DISubprogram(name: "wcscspn", scope: !901, file: !901, line: 187, type: !1073, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1073 = !DISubroutineType(types: !1074)
!1074 = !{!416, !512, !512}
!1075 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !1076, file: !895, line: 184)
!1076 = !DISubprogram(name: "wcsftime", scope: !901, file: !901, line: 834, type: !1077, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1077 = !DISubroutineType(types: !1078)
!1078 = !{!416, !464, !416, !511, !1079}
!1079 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !1080)
!1080 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1081, size: 64)
!1081 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !1082)
!1082 = !DICompositeType(tag: DW_TAG_structure_type, name: "tm", file: !901, line: 83, flags: DIFlagFwdDecl | DIFlagNonTrivial, identifier: "_ZTS2tm")
!1083 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !1084, file: !895, line: 185)
!1084 = !DISubprogram(name: "wcslen", scope: !901, file: !901, line: 222, type: !1085, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1085 = !DISubroutineType(types: !1086)
!1086 = !{!416, !512}
!1087 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !1088, file: !895, line: 186)
!1088 = !DISubprogram(name: "wcsncat", scope: !901, file: !901, line: 101, type: !1089, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1089 = !DISubroutineType(types: !1090)
!1090 = !{!465, !464, !511, !416}
!1091 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !1092, file: !895, line: 187)
!1092 = !DISubprogram(name: "wcsncmp", scope: !901, file: !901, line: 109, type: !1093, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1093 = !DISubroutineType(types: !1094)
!1094 = !{!35, !512, !512, !416}
!1095 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !1096, file: !895, line: 188)
!1096 = !DISubprogram(name: "wcsncpy", scope: !901, file: !901, line: 92, type: !1089, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1097 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !1098, file: !895, line: 189)
!1098 = !DISubprogram(name: "wcsrtombs", scope: !901, file: !901, line: 343, type: !1099, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1099 = !DISubroutineType(types: !1100)
!1100 = !{!416, !510, !1101, !416, !995}
!1101 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !1102)
!1102 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !512, size: 64)
!1103 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !1104, file: !895, line: 190)
!1104 = !DISubprogram(name: "wcsspn", scope: !901, file: !901, line: 191, type: !1073, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1105 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !1106, file: !895, line: 191)
!1106 = !DISubprogram(name: "wcstod", scope: !901, file: !901, line: 377, type: !1107, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1107 = !DISubroutineType(types: !1108)
!1108 = !{!42, !511, !1109}
!1109 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !1110)
!1110 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !465, size: 64)
!1111 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !1112, file: !895, line: 193)
!1112 = !DISubprogram(name: "wcstof", scope: !901, file: !901, line: 382, type: !1113, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1113 = !DISubroutineType(types: !1114)
!1114 = !{!101, !511, !1109}
!1115 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !1116, file: !895, line: 195)
!1116 = !DISubprogram(name: "wcstok", scope: !901, file: !901, line: 217, type: !1117, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1117 = !DISubroutineType(types: !1118)
!1118 = !{!465, !464, !511, !1109}
!1119 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !1120, file: !895, line: 196)
!1120 = !DISubprogram(name: "wcstol", scope: !901, file: !901, line: 428, type: !1121, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1121 = !DISubroutineType(types: !1122)
!1122 = !{!260, !511, !1109, !35}
!1123 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !1124, file: !895, line: 197)
!1124 = !DISubprogram(name: "wcstoul", scope: !901, file: !901, line: 433, type: !1125, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1125 = !DISubroutineType(types: !1126)
!1126 = !{!418, !511, !1109, !35}
!1127 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !1128, file: !895, line: 198)
!1128 = !DISubprogram(name: "wcsxfrm", scope: !901, file: !901, line: 135, type: !1129, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1129 = !DISubroutineType(types: !1130)
!1130 = !{!416, !464, !511, !416}
!1131 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !1132, file: !895, line: 199)
!1132 = !DISubprogram(name: "wctob", scope: !901, file: !901, line: 324, type: !1133, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1133 = !DISubroutineType(types: !1134)
!1134 = !{!35, !897}
!1135 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !1136, file: !895, line: 200)
!1136 = !DISubprogram(name: "wmemcmp", scope: !901, file: !901, line: 258, type: !1093, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1137 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !1138, file: !895, line: 201)
!1138 = !DISubprogram(name: "wmemcpy", scope: !901, file: !901, line: 262, type: !1089, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1139 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !1140, file: !895, line: 202)
!1140 = !DISubprogram(name: "wmemmove", scope: !901, file: !901, line: 267, type: !1141, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1141 = !DISubroutineType(types: !1142)
!1142 = !{!465, !465, !512, !416}
!1143 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !1144, file: !895, line: 203)
!1144 = !DISubprogram(name: "wmemset", scope: !901, file: !901, line: 271, type: !1145, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1145 = !DISubroutineType(types: !1146)
!1146 = !{!465, !465, !466, !416}
!1147 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !1148, file: !895, line: 204)
!1148 = !DISubprogram(name: "wprintf", scope: !901, file: !901, line: 587, type: !1149, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1149 = !DISubroutineType(types: !1150)
!1150 = !{!35, !511, null}
!1151 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !1152, file: !895, line: 205)
!1152 = !DISubprogram(name: "wscanf", linkageName: "__isoc99_wscanf", scope: !901, file: !901, line: 644, type: !1149, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1153 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !1154, file: !895, line: 206)
!1154 = !DISubprogram(name: "wcschr", scope: !901, file: !901, line: 164, type: !1155, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1155 = !DISubroutineType(types: !1156)
!1156 = !{!465, !512, !466}
!1157 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !1158, file: !895, line: 207)
!1158 = !DISubprogram(name: "wcspbrk", scope: !901, file: !901, line: 201, type: !1159, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1159 = !DISubroutineType(types: !1160)
!1160 = !{!465, !512, !512}
!1161 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !1162, file: !895, line: 208)
!1162 = !DISubprogram(name: "wcsrchr", scope: !901, file: !901, line: 174, type: !1155, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1163 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !1164, file: !895, line: 209)
!1164 = !DISubprogram(name: "wcsstr", scope: !901, file: !901, line: 212, type: !1159, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1165 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !1166, file: !895, line: 210)
!1166 = !DISubprogram(name: "wmemchr", scope: !901, file: !901, line: 253, type: !1167, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1167 = !DISubroutineType(types: !1168)
!1168 = !{!465, !512, !466, !416}
!1169 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !7, entity: !1170, file: !895, line: 251)
!1170 = !DISubprogram(name: "wcstold", scope: !901, file: !901, line: 384, type: !1171, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1171 = !DISubroutineType(types: !1172)
!1172 = !{!112, !511, !1109}
!1173 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !7, entity: !1174, file: !895, line: 260)
!1174 = !DISubprogram(name: "wcstoll", scope: !901, file: !901, line: 441, type: !1175, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1175 = !DISubroutineType(types: !1176)
!1176 = !{!223, !511, !1109, !35}
!1177 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !7, entity: !1178, file: !895, line: 261)
!1178 = !DISubprogram(name: "wcstoull", scope: !901, file: !901, line: 448, type: !1179, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1179 = !DISubroutineType(types: !1180)
!1180 = !{!546, !511, !1109, !35}
!1181 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !1170, file: !895, line: 267)
!1182 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !1174, file: !895, line: 268)
!1183 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !1178, file: !895, line: 269)
!1184 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !1112, file: !895, line: 283)
!1185 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !1040, file: !895, line: 286)
!1186 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !1046, file: !895, line: 289)
!1187 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !1054, file: !895, line: 292)
!1188 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !1170, file: !895, line: 296)
!1189 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !1174, file: !895, line: 297)
!1190 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !1178, file: !895, line: 298)
!1191 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !1192, file: !1195, line: 47)
!1192 = !DIDerivedType(tag: DW_TAG_typedef, name: "int8_t", file: !1193, line: 24, baseType: !1194)
!1193 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-intn.h", directory: "")
!1194 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int8_t", file: !21, line: 37, baseType: !938)
!1195 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/9/../../../../include/c++/9/cstdint", directory: "")
!1196 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !1197, file: !1195, line: 48)
!1197 = !DIDerivedType(tag: DW_TAG_typedef, name: "int16_t", file: !1193, line: 25, baseType: !1198)
!1198 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int16_t", file: !21, line: 39, baseType: !1199)
!1199 = !DIBasicType(name: "short", size: 16, encoding: DW_ATE_signed)
!1200 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !1201, file: !1195, line: 49)
!1201 = !DIDerivedType(tag: DW_TAG_typedef, name: "int32_t", file: !1193, line: 26, baseType: !1202)
!1202 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int32_t", file: !21, line: 41, baseType: !35)
!1203 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !1204, file: !1195, line: 50)
!1204 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !1193, line: 27, baseType: !1205)
!1205 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int64_t", file: !21, line: 44, baseType: !260)
!1206 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !1207, file: !1195, line: 52)
!1207 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_fast8_t", file: !1208, line: 58, baseType: !938)
!1208 = !DIFile(filename: "/usr/include/stdint.h", directory: "")
!1209 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !1210, file: !1195, line: 53)
!1210 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_fast16_t", file: !1208, line: 60, baseType: !260)
!1211 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !1212, file: !1195, line: 54)
!1212 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_fast32_t", file: !1208, line: 61, baseType: !260)
!1213 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !1214, file: !1195, line: 55)
!1214 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_fast64_t", file: !1208, line: 62, baseType: !260)
!1215 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !1216, file: !1195, line: 57)
!1216 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_least8_t", file: !1208, line: 43, baseType: !1217)
!1217 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int_least8_t", file: !21, line: 52, baseType: !1194)
!1218 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !1219, file: !1195, line: 58)
!1219 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_least16_t", file: !1208, line: 44, baseType: !1220)
!1220 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int_least16_t", file: !21, line: 54, baseType: !1198)
!1221 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !1222, file: !1195, line: 59)
!1222 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_least32_t", file: !1208, line: 45, baseType: !1223)
!1223 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int_least32_t", file: !21, line: 56, baseType: !1202)
!1224 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !1225, file: !1195, line: 60)
!1225 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_least64_t", file: !1208, line: 46, baseType: !1226)
!1226 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int_least64_t", file: !21, line: 58, baseType: !1205)
!1227 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !1228, file: !1195, line: 62)
!1228 = !DIDerivedType(tag: DW_TAG_typedef, name: "intmax_t", file: !1208, line: 101, baseType: !1229)
!1229 = !DIDerivedType(tag: DW_TAG_typedef, name: "__intmax_t", file: !21, line: 72, baseType: !260)
!1230 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !1231, file: !1195, line: 63)
!1231 = !DIDerivedType(tag: DW_TAG_typedef, name: "intptr_t", file: !1208, line: 87, baseType: !260)
!1232 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !1233, file: !1195, line: 65)
!1233 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint8_t", file: !19, line: 24, baseType: !1234)
!1234 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint8_t", file: !21, line: 38, baseType: !1235)
!1235 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!1236 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !1237, file: !1195, line: 66)
!1237 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint16_t", file: !19, line: 25, baseType: !1238)
!1238 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint16_t", file: !21, line: 40, baseType: !936)
!1239 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !18, file: !1195, line: 67)
!1240 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !1241, file: !1195, line: 68)
!1241 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint64_t", file: !19, line: 27, baseType: !1242)
!1242 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint64_t", file: !21, line: 45, baseType: !418)
!1243 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !1244, file: !1195, line: 70)
!1244 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_fast8_t", file: !1208, line: 71, baseType: !1235)
!1245 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !1246, file: !1195, line: 71)
!1246 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_fast16_t", file: !1208, line: 73, baseType: !418)
!1247 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !1248, file: !1195, line: 72)
!1248 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_fast32_t", file: !1208, line: 74, baseType: !418)
!1249 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !1250, file: !1195, line: 73)
!1250 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_fast64_t", file: !1208, line: 75, baseType: !418)
!1251 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !1252, file: !1195, line: 75)
!1252 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_least8_t", file: !1208, line: 49, baseType: !1253)
!1253 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint_least8_t", file: !21, line: 53, baseType: !1234)
!1254 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !1255, file: !1195, line: 76)
!1255 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_least16_t", file: !1208, line: 50, baseType: !1256)
!1256 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint_least16_t", file: !21, line: 55, baseType: !1238)
!1257 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !1258, file: !1195, line: 77)
!1258 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_least32_t", file: !1208, line: 51, baseType: !1259)
!1259 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint_least32_t", file: !21, line: 57, baseType: !20)
!1260 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !1261, file: !1195, line: 78)
!1261 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_least64_t", file: !1208, line: 52, baseType: !1262)
!1262 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint_least64_t", file: !21, line: 59, baseType: !1242)
!1263 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !1264, file: !1195, line: 80)
!1264 = !DIDerivedType(tag: DW_TAG_typedef, name: "uintmax_t", file: !1208, line: 102, baseType: !1265)
!1265 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uintmax_t", file: !21, line: 73, baseType: !418)
!1266 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !1267, file: !1195, line: 81)
!1267 = !DIDerivedType(tag: DW_TAG_typedef, name: "uintptr_t", file: !1208, line: 90, baseType: !418)
!1268 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !7, entity: !1269, file: !1271, line: 44)
!1269 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", scope: !30, file: !1270, line: 258, baseType: !418)
!1270 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/9/../../../../include/x86_64-linux-gnu/c++/9/bits/c++config.h", directory: "")
!1271 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/9/../../../../include/c++/9/ext/new_allocator.h", directory: "")
!1272 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !7, entity: !1273, file: !1271, line: 45)
!1273 = !DIDerivedType(tag: DW_TAG_typedef, name: "ptrdiff_t", scope: !30, file: !1270, line: 259, baseType: !260)
!1274 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !1275, file: !1277, line: 53)
!1275 = !DICompositeType(tag: DW_TAG_structure_type, name: "lconv", file: !1276, line: 51, size: 768, flags: DIFlagFwdDecl, identifier: "_ZTS5lconv")
!1276 = !DIFile(filename: "/usr/include/locale.h", directory: "")
!1277 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/9/../../../../include/c++/9/clocale", directory: "")
!1278 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !1279, file: !1277, line: 54)
!1279 = !DISubprogram(name: "setlocale", scope: !1276, file: !1276, line: 122, type: !1280, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1280 = !DISubroutineType(types: !1281)
!1281 = !{!443, !35, !279}
!1282 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !1283, file: !1277, line: 55)
!1283 = !DISubprogram(name: "localeconv", scope: !1276, file: !1276, line: 125, type: !1284, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1284 = !DISubroutineType(types: !1285)
!1285 = !{!1286}
!1286 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1275, size: 64)
!1287 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !1288, file: !1290, line: 64)
!1288 = !DISubprogram(name: "isalnum", scope: !1289, file: !1289, line: 108, type: !33, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1289 = !DIFile(filename: "/usr/include/ctype.h", directory: "")
!1290 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/9/../../../../include/c++/9/cctype", directory: "")
!1291 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !1292, file: !1290, line: 65)
!1292 = !DISubprogram(name: "isalpha", scope: !1289, file: !1289, line: 109, type: !33, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1293 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !1294, file: !1290, line: 66)
!1294 = !DISubprogram(name: "iscntrl", scope: !1289, file: !1289, line: 110, type: !33, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1295 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !1296, file: !1290, line: 67)
!1296 = !DISubprogram(name: "isdigit", scope: !1289, file: !1289, line: 111, type: !33, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1297 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !1298, file: !1290, line: 68)
!1298 = !DISubprogram(name: "isgraph", scope: !1289, file: !1289, line: 113, type: !33, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1299 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !1300, file: !1290, line: 69)
!1300 = !DISubprogram(name: "islower", scope: !1289, file: !1289, line: 112, type: !33, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1301 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !1302, file: !1290, line: 70)
!1302 = !DISubprogram(name: "isprint", scope: !1289, file: !1289, line: 114, type: !33, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1303 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !1304, file: !1290, line: 71)
!1304 = !DISubprogram(name: "ispunct", scope: !1289, file: !1289, line: 115, type: !33, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1305 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !1306, file: !1290, line: 72)
!1306 = !DISubprogram(name: "isspace", scope: !1289, file: !1289, line: 116, type: !33, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1307 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !1308, file: !1290, line: 73)
!1308 = !DISubprogram(name: "isupper", scope: !1289, file: !1289, line: 117, type: !33, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1309 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !1310, file: !1290, line: 74)
!1310 = !DISubprogram(name: "isxdigit", scope: !1289, file: !1289, line: 118, type: !33, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1311 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !1312, file: !1290, line: 75)
!1312 = !DISubprogram(name: "tolower", scope: !1289, file: !1289, line: 122, type: !33, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1313 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !1314, file: !1290, line: 76)
!1314 = !DISubprogram(name: "toupper", scope: !1289, file: !1289, line: 125, type: !33, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1315 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !1316, file: !1290, line: 87)
!1316 = !DISubprogram(name: "isblank", scope: !1289, file: !1289, line: 130, type: !33, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1317 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !1318, file: !1320, line: 98)
!1318 = !DIDerivedType(tag: DW_TAG_typedef, name: "FILE", file: !1319, line: 7, baseType: !911)
!1319 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/FILE.h", directory: "")
!1320 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/9/../../../../include/c++/9/cstdio", directory: "")
!1321 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !1322, file: !1320, line: 99)
!1322 = !DIDerivedType(tag: DW_TAG_typedef, name: "fpos_t", file: !1323, line: 84, baseType: !1324)
!1323 = !DIFile(filename: "/usr/include/stdio.h", directory: "")
!1324 = !DIDerivedType(tag: DW_TAG_typedef, name: "__fpos_t", file: !1325, line: 14, baseType: !1326)
!1325 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/__fpos_t.h", directory: "")
!1326 = !DICompositeType(tag: DW_TAG_structure_type, name: "_G_fpos_t", file: !1325, line: 10, size: 128, flags: DIFlagFwdDecl, identifier: "_ZTS9_G_fpos_t")
!1327 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !1328, file: !1320, line: 101)
!1328 = !DISubprogram(name: "clearerr", scope: !1323, file: !1323, line: 757, type: !1329, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1329 = !DISubroutineType(types: !1330)
!1330 = !{null, !1331}
!1331 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1318, size: 64)
!1332 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !1333, file: !1320, line: 102)
!1333 = !DISubprogram(name: "fclose", scope: !1323, file: !1323, line: 213, type: !1334, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1334 = !DISubroutineType(types: !1335)
!1335 = !{!35, !1331}
!1336 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !1337, file: !1320, line: 103)
!1337 = !DISubprogram(name: "feof", scope: !1323, file: !1323, line: 759, type: !1334, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1338 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !1339, file: !1320, line: 104)
!1339 = !DISubprogram(name: "ferror", scope: !1323, file: !1323, line: 761, type: !1334, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1340 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !1341, file: !1320, line: 105)
!1341 = !DISubprogram(name: "fflush", scope: !1323, file: !1323, line: 218, type: !1334, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1342 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !1343, file: !1320, line: 106)
!1343 = !DISubprogram(name: "fgetc", scope: !1323, file: !1323, line: 485, type: !1334, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1344 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !1345, file: !1320, line: 107)
!1345 = !DISubprogram(name: "fgetpos", scope: !1323, file: !1323, line: 731, type: !1346, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1346 = !DISubroutineType(types: !1347)
!1347 = !{!35, !1348, !1349}
!1348 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !1331)
!1349 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !1350)
!1350 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1322, size: 64)
!1351 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !1352, file: !1320, line: 108)
!1352 = !DISubprogram(name: "fgets", scope: !1323, file: !1323, line: 564, type: !1353, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1353 = !DISubroutineType(types: !1354)
!1354 = !{!443, !510, !35, !1348}
!1355 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !1356, file: !1320, line: 109)
!1356 = !DISubprogram(name: "fopen", scope: !1323, file: !1323, line: 246, type: !1357, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1357 = !DISubroutineType(types: !1358)
!1358 = !{!1331, !467, !467}
!1359 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !1360, file: !1320, line: 110)
!1360 = !DISubprogram(name: "fprintf", scope: !1323, file: !1323, line: 326, type: !1361, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1361 = !DISubroutineType(types: !1362)
!1362 = !{!35, !1348, !467, null}
!1363 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !1364, file: !1320, line: 111)
!1364 = !DISubprogram(name: "fputc", scope: !1323, file: !1323, line: 521, type: !1365, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1365 = !DISubroutineType(types: !1366)
!1366 = !{!35, !35, !1331}
!1367 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !1368, file: !1320, line: 112)
!1368 = !DISubprogram(name: "fputs", scope: !1323, file: !1323, line: 626, type: !1369, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1369 = !DISubroutineType(types: !1370)
!1370 = !{!35, !467, !1348}
!1371 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !1372, file: !1320, line: 113)
!1372 = !DISubprogram(name: "fread", scope: !1323, file: !1323, line: 646, type: !1373, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1373 = !DISubroutineType(types: !1374)
!1374 = !{!416, !1375, !416, !416, !1348}
!1375 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !413)
!1376 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !1377, file: !1320, line: 114)
!1377 = !DISubprogram(name: "freopen", scope: !1323, file: !1323, line: 252, type: !1378, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1378 = !DISubroutineType(types: !1379)
!1379 = !{!1331, !467, !467, !1348}
!1380 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !1381, file: !1320, line: 115)
!1381 = !DISubprogram(name: "fscanf", linkageName: "__isoc99_fscanf", scope: !1323, file: !1323, line: 407, type: !1361, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1382 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !1383, file: !1320, line: 116)
!1383 = !DISubprogram(name: "fseek", scope: !1323, file: !1323, line: 684, type: !1384, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1384 = !DISubroutineType(types: !1385)
!1385 = !{!35, !1331, !260, !35}
!1386 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !1387, file: !1320, line: 117)
!1387 = !DISubprogram(name: "fsetpos", scope: !1323, file: !1323, line: 736, type: !1388, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1388 = !DISubroutineType(types: !1389)
!1389 = !{!35, !1331, !1390}
!1390 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1391, size: 64)
!1391 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !1322)
!1392 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !1393, file: !1320, line: 118)
!1393 = !DISubprogram(name: "ftell", scope: !1323, file: !1323, line: 689, type: !1394, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1394 = !DISubroutineType(types: !1395)
!1395 = !{!260, !1331}
!1396 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !1397, file: !1320, line: 119)
!1397 = !DISubprogram(name: "fwrite", scope: !1323, file: !1323, line: 652, type: !1398, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1398 = !DISubroutineType(types: !1399)
!1399 = !{!416, !1400, !416, !416, !1348}
!1400 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !414)
!1401 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !1402, file: !1320, line: 120)
!1402 = !DISubprogram(name: "getc", scope: !1323, file: !1323, line: 486, type: !1334, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1403 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !1404, file: !1320, line: 121)
!1404 = !DISubprogram(name: "getchar", scope: !1405, file: !1405, line: 47, type: !480, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1405 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdio.h", directory: "")
!1406 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !1407, file: !1320, line: 124)
!1407 = !DISubprogram(name: "gets", scope: !1323, file: !1323, line: 577, type: !1408, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1408 = !DISubroutineType(types: !1409)
!1409 = !{!443, !443}
!1410 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !1411, file: !1320, line: 126)
!1411 = !DISubprogram(name: "perror", scope: !1323, file: !1323, line: 775, type: !1412, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1412 = !DISubroutineType(types: !1413)
!1413 = !{null, !279}
!1414 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !1415, file: !1320, line: 127)
!1415 = !DISubprogram(name: "printf", scope: !1323, file: !1323, line: 332, type: !1416, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1416 = !DISubroutineType(types: !1417)
!1417 = !{!35, !467, null}
!1418 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !1419, file: !1320, line: 128)
!1419 = !DISubprogram(name: "putc", scope: !1323, file: !1323, line: 522, type: !1365, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1420 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !1421, file: !1320, line: 129)
!1421 = !DISubprogram(name: "putchar", scope: !1405, file: !1405, line: 82, type: !33, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1422 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !1423, file: !1320, line: 130)
!1423 = !DISubprogram(name: "puts", scope: !1323, file: !1323, line: 632, type: !402, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1424 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !1425, file: !1320, line: 131)
!1425 = !DISubprogram(name: "remove", scope: !1323, file: !1323, line: 146, type: !402, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1426 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !1427, file: !1320, line: 132)
!1427 = !DISubprogram(name: "rename", scope: !1323, file: !1323, line: 148, type: !1428, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1428 = !DISubroutineType(types: !1429)
!1429 = !{!35, !279, !279}
!1430 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !1431, file: !1320, line: 133)
!1431 = !DISubprogram(name: "rewind", scope: !1323, file: !1323, line: 694, type: !1329, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1432 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !1433, file: !1320, line: 134)
!1433 = !DISubprogram(name: "scanf", linkageName: "__isoc99_scanf", scope: !1323, file: !1323, line: 410, type: !1416, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1434 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !1435, file: !1320, line: 135)
!1435 = !DISubprogram(name: "setbuf", scope: !1323, file: !1323, line: 304, type: !1436, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1436 = !DISubroutineType(types: !1437)
!1437 = !{null, !1348, !510}
!1438 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !1439, file: !1320, line: 136)
!1439 = !DISubprogram(name: "setvbuf", scope: !1323, file: !1323, line: 308, type: !1440, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1440 = !DISubroutineType(types: !1441)
!1441 = !{!35, !1348, !510, !35, !416}
!1442 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !1443, file: !1320, line: 137)
!1443 = !DISubprogram(name: "sprintf", scope: !1323, file: !1323, line: 334, type: !1444, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1444 = !DISubroutineType(types: !1445)
!1445 = !{!35, !510, !467, null}
!1446 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !1447, file: !1320, line: 138)
!1447 = !DISubprogram(name: "sscanf", linkageName: "__isoc99_sscanf", scope: !1323, file: !1323, line: 412, type: !1448, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1448 = !DISubroutineType(types: !1449)
!1449 = !{!35, !467, !467, null}
!1450 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !1451, file: !1320, line: 139)
!1451 = !DISubprogram(name: "tmpfile", scope: !1323, file: !1323, line: 173, type: !1452, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1452 = !DISubroutineType(types: !1453)
!1453 = !{!1331}
!1454 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !1455, file: !1320, line: 141)
!1455 = !DISubprogram(name: "tmpnam", scope: !1323, file: !1323, line: 187, type: !1408, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1456 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !1457, file: !1320, line: 143)
!1457 = !DISubprogram(name: "ungetc", scope: !1323, file: !1323, line: 639, type: !1365, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1458 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !1459, file: !1320, line: 144)
!1459 = !DISubprogram(name: "vfprintf", scope: !1323, file: !1323, line: 341, type: !1460, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1460 = !DISubroutineType(types: !1461)
!1461 = !{!35, !1348, !467, !1035}
!1462 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !1463, file: !1320, line: 145)
!1463 = !DISubprogram(name: "vprintf", scope: !1405, file: !1405, line: 39, type: !1464, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1464 = !DISubroutineType(types: !1465)
!1465 = !{!35, !467, !1035}
!1466 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !1467, file: !1320, line: 146)
!1467 = !DISubprogram(name: "vsprintf", scope: !1323, file: !1323, line: 349, type: !1468, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1468 = !DISubroutineType(types: !1469)
!1469 = !{!35, !510, !467, !1035}
!1470 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !7, entity: !1471, file: !1320, line: 175)
!1471 = !DISubprogram(name: "snprintf", scope: !1323, file: !1323, line: 354, type: !1472, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1472 = !DISubroutineType(types: !1473)
!1473 = !{!35, !510, !416, !467, null}
!1474 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !7, entity: !1475, file: !1320, line: 176)
!1475 = !DISubprogram(name: "vfscanf", linkageName: "__isoc99_vfscanf", scope: !1323, file: !1323, line: 451, type: !1460, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1476 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !7, entity: !1477, file: !1320, line: 177)
!1477 = !DISubprogram(name: "vscanf", linkageName: "__isoc99_vscanf", scope: !1323, file: !1323, line: 456, type: !1464, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1478 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !7, entity: !1479, file: !1320, line: 178)
!1479 = !DISubprogram(name: "vsnprintf", scope: !1323, file: !1323, line: 358, type: !1480, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1480 = !DISubroutineType(types: !1481)
!1481 = !{!35, !510, !416, !467, !1035}
!1482 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !7, entity: !1483, file: !1320, line: 179)
!1483 = !DISubprogram(name: "vsscanf", linkageName: "__isoc99_vsscanf", scope: !1323, file: !1323, line: 459, type: !1484, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1484 = !DISubroutineType(types: !1485)
!1485 = !{!35, !467, !467, !1035}
!1486 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !1471, file: !1320, line: 185)
!1487 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !1475, file: !1320, line: 186)
!1488 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !1477, file: !1320, line: 187)
!1489 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !1479, file: !1320, line: 188)
!1490 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !1483, file: !1320, line: 189)
!1491 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !1492, file: !1496, line: 82)
!1492 = !DIDerivedType(tag: DW_TAG_typedef, name: "wctrans_t", file: !1493, line: 48, baseType: !1494)
!1493 = !DIFile(filename: "/usr/include/wctype.h", directory: "")
!1494 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1495, size: 64)
!1495 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !1202)
!1496 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/9/../../../../include/c++/9/cwctype", directory: "")
!1497 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !1498, file: !1496, line: 83)
!1498 = !DIDerivedType(tag: DW_TAG_typedef, name: "wctype_t", file: !1499, line: 38, baseType: !418)
!1499 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/wctype-wchar.h", directory: "")
!1500 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !897, file: !1496, line: 84)
!1501 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !1502, file: !1496, line: 86)
!1502 = !DISubprogram(name: "iswalnum", scope: !1499, file: !1499, line: 95, type: !1133, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1503 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !1504, file: !1496, line: 87)
!1504 = !DISubprogram(name: "iswalpha", scope: !1499, file: !1499, line: 101, type: !1133, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1505 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !1506, file: !1496, line: 89)
!1506 = !DISubprogram(name: "iswblank", scope: !1499, file: !1499, line: 146, type: !1133, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1507 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !1508, file: !1496, line: 91)
!1508 = !DISubprogram(name: "iswcntrl", scope: !1499, file: !1499, line: 104, type: !1133, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1509 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !1510, file: !1496, line: 92)
!1510 = !DISubprogram(name: "iswctype", scope: !1499, file: !1499, line: 159, type: !1511, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1511 = !DISubroutineType(types: !1512)
!1512 = !{!35, !897, !1498}
!1513 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !1514, file: !1496, line: 93)
!1514 = !DISubprogram(name: "iswdigit", scope: !1499, file: !1499, line: 108, type: !1133, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1515 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !1516, file: !1496, line: 94)
!1516 = !DISubprogram(name: "iswgraph", scope: !1499, file: !1499, line: 112, type: !1133, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1517 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !1518, file: !1496, line: 95)
!1518 = !DISubprogram(name: "iswlower", scope: !1499, file: !1499, line: 117, type: !1133, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1519 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !1520, file: !1496, line: 96)
!1520 = !DISubprogram(name: "iswprint", scope: !1499, file: !1499, line: 120, type: !1133, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1521 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !1522, file: !1496, line: 97)
!1522 = !DISubprogram(name: "iswpunct", scope: !1499, file: !1499, line: 125, type: !1133, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1523 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !1524, file: !1496, line: 98)
!1524 = !DISubprogram(name: "iswspace", scope: !1499, file: !1499, line: 130, type: !1133, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1525 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !1526, file: !1496, line: 99)
!1526 = !DISubprogram(name: "iswupper", scope: !1499, file: !1499, line: 135, type: !1133, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1527 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !1528, file: !1496, line: 100)
!1528 = !DISubprogram(name: "iswxdigit", scope: !1499, file: !1499, line: 140, type: !1133, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1529 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !1530, file: !1496, line: 101)
!1530 = !DISubprogram(name: "towctrans", scope: !1493, file: !1493, line: 55, type: !1531, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1531 = !DISubroutineType(types: !1532)
!1532 = !{!897, !897, !1492}
!1533 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !1534, file: !1496, line: 102)
!1534 = !DISubprogram(name: "towlower", scope: !1499, file: !1499, line: 166, type: !1535, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1535 = !DISubroutineType(types: !1536)
!1536 = !{!897, !897}
!1537 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !1538, file: !1496, line: 103)
!1538 = !DISubprogram(name: "towupper", scope: !1499, file: !1499, line: 169, type: !1535, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1539 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !1540, file: !1496, line: 104)
!1540 = !DISubprogram(name: "wctrans", scope: !1493, file: !1493, line: 52, type: !1541, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1541 = !DISubroutineType(types: !1542)
!1542 = !{!1492, !279}
!1543 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !1544, file: !1496, line: 105)
!1544 = !DISubprogram(name: "wctype", scope: !1499, file: !1499, line: 155, type: !1545, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1545 = !DISubroutineType(types: !1546)
!1546 = !{!1498, !279}
!1547 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !1548, file: !1551, line: 60)
!1548 = !DIDerivedType(tag: DW_TAG_typedef, name: "clock_t", file: !1549, line: 7, baseType: !1550)
!1549 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/clock_t.h", directory: "")
!1550 = !DIDerivedType(tag: DW_TAG_typedef, name: "__clock_t", file: !21, line: 156, baseType: !260)
!1551 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/9/../../../../include/c++/9/ctime", directory: "")
!1552 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !1553, file: !1551, line: 61)
!1553 = !DIDerivedType(tag: DW_TAG_typedef, name: "time_t", file: !1554, line: 7, baseType: !1555)
!1554 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/time_t.h", directory: "")
!1555 = !DIDerivedType(tag: DW_TAG_typedef, name: "__time_t", file: !21, line: 160, baseType: !260)
!1556 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !1082, file: !1551, line: 62)
!1557 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !1558, file: !1551, line: 64)
!1558 = !DISubprogram(name: "clock", scope: !1559, file: !1559, line: 72, type: !1560, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1559 = !DIFile(filename: "/usr/include/time.h", directory: "")
!1560 = !DISubroutineType(types: !1561)
!1561 = !{!1548}
!1562 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !1563, file: !1551, line: 65)
!1563 = !DISubprogram(name: "difftime", scope: !1559, file: !1559, line: 78, type: !1564, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1564 = !DISubroutineType(types: !1565)
!1565 = !{!42, !1553, !1553}
!1566 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !1567, file: !1551, line: 66)
!1567 = !DISubprogram(name: "mktime", scope: !1559, file: !1559, line: 82, type: !1568, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1568 = !DISubroutineType(types: !1569)
!1569 = !{!1553, !1570}
!1570 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1082, size: 64)
!1571 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !1572, file: !1551, line: 67)
!1572 = !DISubprogram(name: "time", scope: !1559, file: !1559, line: 75, type: !1573, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1573 = !DISubroutineType(types: !1574)
!1574 = !{!1553, !1575}
!1575 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1553, size: 64)
!1576 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !1577, file: !1551, line: 68)
!1577 = !DISubprogram(name: "asctime", scope: !1559, file: !1559, line: 139, type: !1578, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1578 = !DISubroutineType(types: !1579)
!1579 = !{!443, !1080}
!1580 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !1581, file: !1551, line: 69)
!1581 = !DISubprogram(name: "ctime", scope: !1559, file: !1559, line: 142, type: !1582, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1582 = !DISubroutineType(types: !1583)
!1583 = !{!443, !1584}
!1584 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1585, size: 64)
!1585 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !1553)
!1586 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !1587, file: !1551, line: 70)
!1587 = !DISubprogram(name: "gmtime", scope: !1559, file: !1559, line: 119, type: !1588, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1588 = !DISubroutineType(types: !1589)
!1589 = !{!1570, !1584}
!1590 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !1591, file: !1551, line: 71)
!1591 = !DISubprogram(name: "localtime", scope: !1559, file: !1559, line: 123, type: !1588, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1592 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !1593, file: !1551, line: 72)
!1593 = !DISubprogram(name: "strftime", scope: !1559, file: !1559, line: 88, type: !1594, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1594 = !DISubroutineType(types: !1595)
!1595 = !{!416, !510, !416, !467, !1079}
!1596 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !5, file: !1597, line: 86)
!1597 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/9/../../../../include/c++/9/bits/shared_ptr_base.h", directory: "")
!1598 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !1599, file: !1597, line: 87)
!1599 = !DIGlobalVariable(name: "__default_lock_policy", linkageName: "_ZN9__gnu_cxxL21__default_lock_policyE", scope: !7, file: !6, line: 53, type: !1600, isLocal: true, isDefinition: false)
!1600 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !5)
!1601 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1602, file: !1603, line: 38)
!1602 = !DISubprogram(name: "abs", linkageName: "_ZL3absi", scope: !614, file: !614, line: 30, type: !33, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1603 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/9/../../../../include/c++/9/math.h", directory: "")
!1604 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !685, file: !1603, line: 65)
!1605 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !693, file: !1603, line: 66)
!1606 = distinct !DILifetime(object: !1607, location: !DIExpr(DIOpArg(0, %struct.__HIP_Coordinates addrspace(4)*), DIOpDeref(%struct.__HIP_Coordinates)), argObjects: {!0})
!1607 = distinct !DIGlobalVariable(name: "threadIdx", linkageName: "_ZL9threadIdx", scope: !2, file: !1608, line: 368, type: !1609, isLocal: true, isDefinition: true)
!1608 = !DIFile(filename: "/opt/rocm-5.3.0/include/hip/amd_detail/amd_hip_runtime.h", directory: "")
!1609 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !1610)
!1610 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__HIP_Coordinates<__HIP_ThreadIdx>", file: !1608, line: 296, size: 8, flags: DIFlagTypePassByValue, elements: !1611, templateParams: !1642, identifier: "_ZTS17__HIP_CoordinatesI15__HIP_ThreadIdxE")
!1611 = !{!1612, !1621, !1629, !1637}
!1612 = !DIDerivedType(tag: DW_TAG_member, name: "x", scope: !1610, file: !1608, line: 303, baseType: !1613, flags: DIFlagStaticMember)
!1613 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !1614)
!1614 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__X", scope: !1610, file: !1608, line: 299, size: 8, flags: DIFlagTypePassByValue, elements: !1615, identifier: "_ZTSN17__HIP_CoordinatesI15__HIP_ThreadIdxE3__XE")
!1615 = !{!1616}
!1616 = !DISubprogram(name: "operator unsigned int", linkageName: "_ZNK17__HIP_CoordinatesI15__HIP_ThreadIdxE3__XcvjEv", scope: !1614, file: !1608, line: 299, type: !1617, scopeLine: 299, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1617 = !DISubroutineType(types: !1618)
!1618 = !{!1619, !1620}
!1619 = !DIDerivedType(tag: DW_TAG_typedef, name: "R", scope: !1610, file: !1608, line: 297, baseType: !18)
!1620 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1613, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!1621 = !DIDerivedType(tag: DW_TAG_member, name: "y", scope: !1610, file: !1608, line: 304, baseType: !1622, flags: DIFlagStaticMember)
!1622 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !1623)
!1623 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__Y", scope: !1610, file: !1608, line: 300, size: 8, flags: DIFlagTypePassByValue, elements: !1624, identifier: "_ZTSN17__HIP_CoordinatesI15__HIP_ThreadIdxE3__YE")
!1624 = !{!1625}
!1625 = !DISubprogram(name: "operator unsigned int", linkageName: "_ZNK17__HIP_CoordinatesI15__HIP_ThreadIdxE3__YcvjEv", scope: !1623, file: !1608, line: 300, type: !1626, scopeLine: 300, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1626 = !DISubroutineType(types: !1627)
!1627 = !{!1619, !1628}
!1628 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1622, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!1629 = !DIDerivedType(tag: DW_TAG_member, name: "z", scope: !1610, file: !1608, line: 305, baseType: !1630, flags: DIFlagStaticMember)
!1630 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !1631)
!1631 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__Z", scope: !1610, file: !1608, line: 301, size: 8, flags: DIFlagTypePassByValue, elements: !1632, identifier: "_ZTSN17__HIP_CoordinatesI15__HIP_ThreadIdxE3__ZE")
!1632 = !{!1633}
!1633 = !DISubprogram(name: "operator unsigned int", linkageName: "_ZNK17__HIP_CoordinatesI15__HIP_ThreadIdxE3__ZcvjEv", scope: !1631, file: !1608, line: 301, type: !1634, scopeLine: 301, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1634 = !DISubroutineType(types: !1635)
!1635 = !{!1619, !1636}
!1636 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1630, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!1637 = !DISubprogram(name: "operator dim3", linkageName: "_ZNK17__HIP_CoordinatesI15__HIP_ThreadIdxEcv4dim3Ev", scope: !1610, file: !1608, line: 307, type: !1638, scopeLine: 307, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1638 = !DISubroutineType(types: !1639)
!1639 = !{!1640, !1641}
!1640 = !DIDerivedType(tag: DW_TAG_typedef, name: "dim3", file: !15, line: 941, baseType: !14)
!1641 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1609, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!1642 = !{!1643}
!1643 = !DITemplateTypeParameter(name: "F", type: !1644)
!1644 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__HIP_ThreadIdx", file: !1608, line: 277, size: 8, flags: DIFlagTypePassByValue, elements: !1645, identifier: "_ZTS15__HIP_ThreadIdx")
!1645 = !{!1646}
!1646 = !DISubprogram(name: "operator()", linkageName: "_ZNK15__HIP_ThreadIdxclEj", scope: !1644, file: !1608, line: 279, type: !1647, scopeLine: 279, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1647 = !DISubroutineType(types: !1648)
!1648 = !{!18, !1649, !18}
!1649 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1650, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!1650 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !1644)
!1651 = distinct !DILifetime(object: !1652, location: !DIExpr(DIOpArg(0, %"struct.__HIP_Coordinates<__HIP_ThreadIdx>::__X" addrspace(4)*), DIOpDeref(%"struct.__HIP_Coordinates<__HIP_ThreadIdx>::__X")), argObjects: {!1})
!1652 = distinct !DIGlobalVariable(name: "x", linkageName: "_ZN17__HIP_CoordinatesI15__HIP_ThreadIdxE1xE", scope: !2, file: !1608, line: 315, type: !1613, isLocal: false, isDefinition: true, declaration: !1612)
!1653 = !{i32 7, !"Dwarf Version", i32 5}
!1654 = !{i32 2, !"Debug Info Version", i32 4}
!1655 = !{i32 1, !"wchar_size", i32 4}
!1656 = !{i32 7, !"PIC Level", i32 1}
!1657 = !{!"AMD clang version 15.0.0 (https://github.com/RadeonOpenCompute/llvm-project roc-5.3.0 22362 3cf23f77f8208174a2ee7c616f4be23674d7b081)"}
!1658 = !{i32 2, i32 0}
!1659 = distinct !DISubprogram(name: "__cxa_pure_virtual", scope: !1660, file: !1660, line: 37, type: !388, scopeLine: 37, flags: DIFlagPrototyped | DIFlagNoReturn | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !1661)
!1660 = !DIFile(filename: "/opt/rocm-5.3.0/llvm/lib/clang/15.0.0/include/__clang_hip_runtime_wrapper.h", directory: "")
!1661 = !{}
!1662 = !DILocation(line: 38, column: 5, scope: !1659)
!1663 = !DILocation(line: 39, column: 3, scope: !1659)
!1664 = distinct !DISubprogram(name: "__cxa_deleted_virtual", scope: !1660, file: !1660, line: 43, type: !388, scopeLine: 43, flags: DIFlagPrototyped | DIFlagNoReturn | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !1661)
!1665 = !DILocation(line: 44, column: 5, scope: !1664)
!1666 = !DILocation(line: 45, column: 3, scope: !1664)
!1667 = distinct !DISubprogram(name: "__assert_fail", scope: !1668, file: !1668, line: 869, type: !1669, scopeLine: 873, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !1671)
!1668 = !DIFile(filename: "/opt/rocm-5.3.0/include/hip/amd_detail/amd_device_functions.h", directory: "")
!1669 = !DISubroutineType(types: !1670)
!1670 = !{null, !279, !279, !8, !279}
!1671 = !{!1672, !1673, !1674, !1675, !1676, !1680, !1681, !1682, !1684, !1686, !1688}
!1672 = !DILocalVariable(name: "assertion", arg: 1, scope: !1667, file: !1668, line: 869, type: !279)
!1673 = !DILocalVariable(name: "file", arg: 2, scope: !1667, file: !1668, line: 870, type: !279)
!1674 = !DILocalVariable(name: "line", arg: 3, scope: !1667, file: !1668, line: 871, type: !8)
!1675 = !DILocalVariable(name: "function", arg: 4, scope: !1667, file: !1668, line: 872, type: !279)
!1676 = !DILocalVariable(name: "fmt", scope: !1667, file: !1668, line: 874, type: !1677)
!1677 = !DICompositeType(tag: DW_TAG_array_type, baseType: !280, size: 376, elements: !1678)
!1678 = !{!1679}
!1679 = !DISubrange(count: 47)
!1680 = !DILocalVariable(name: "msg", scope: !1667, file: !1668, line: 893, type: !1241)
!1681 = !DILocalVariable(name: "len", scope: !1667, file: !1668, line: 894, type: !35)
!1682 = !DILocalVariable(name: "tmp", scope: !1683, file: !1668, line: 895, type: !279)
!1683 = distinct !DILexicalBlock(scope: !1667, file: !1668, line: 895, column: 6)
!1684 = !DILocalVariable(name: "tmp", scope: !1685, file: !1668, line: 897, type: !279)
!1685 = distinct !DILexicalBlock(scope: !1667, file: !1668, line: 897, column: 6)
!1686 = !DILocalVariable(name: "tmp", scope: !1687, file: !1668, line: 900, type: !279)
!1687 = distinct !DILexicalBlock(scope: !1667, file: !1668, line: 900, column: 6)
!1688 = !DILocalVariable(name: "tmp", scope: !1689, file: !1668, line: 902, type: !279)
!1689 = distinct !DILexicalBlock(scope: !1667, file: !1668, line: 902, column: 6)
!1690 = !{!1691, !1691, i64 0}
!1691 = !{!"any pointer", !1692, i64 0}
!1692 = !{!"omnipotent char", !1693, i64 0}
!1693 = !{!"Simple C++ TBAA"}
!1694 = distinct !DILifetime(object: !1672, location: !DIExpr(DIOpReferrer(i8* addrspace(5)*), DIOpDeref(i8*)))
!1695 = !DILocation(line: 869, column: 32, scope: !1667)
!1696 = distinct !DILifetime(object: !1673, location: !DIExpr(DIOpReferrer(i8* addrspace(5)*), DIOpDeref(i8*)))
!1697 = !DILocation(line: 870, column: 32, scope: !1667)
!1698 = !{!1699, !1699, i64 0}
!1699 = !{!"int", !1692, i64 0}
!1700 = distinct !DILifetime(object: !1674, location: !DIExpr(DIOpReferrer(i32 addrspace(5)*), DIOpDeref(i32)))
!1701 = !DILocation(line: 871, column: 33, scope: !1667)
!1702 = distinct !DILifetime(object: !1675, location: !DIExpr(DIOpReferrer(i8* addrspace(5)*), DIOpDeref(i8*)))
!1703 = !DILocation(line: 872, column: 32, scope: !1667)
!1704 = !DILocation(line: 874, column: 3, scope: !1667)
!1705 = distinct !DILifetime(object: !1676, location: !DIExpr(DIOpReferrer([47 x i8] addrspace(5)*), DIOpDeref([47 x i8])))
!1706 = !DILocation(line: 874, column: 14, scope: !1667)
!1707 = !DILocation(line: 893, column: 3, scope: !1667)
!1708 = distinct !DILifetime(object: !1680, location: !DIExpr(DIOpReferrer(i64 addrspace(5)*), DIOpDeref(i64)))
!1709 = !DILocation(line: 893, column: 8, scope: !1667)
!1710 = !DILocation(line: 893, column: 14, scope: !1667)
!1711 = !{!1712, !1712, i64 0}
!1712 = !{!"long", !1692, i64 0}
!1713 = !DILocation(line: 894, column: 3, scope: !1667)
!1714 = distinct !DILifetime(object: !1681, location: !DIExpr(DIOpReferrer(i32 addrspace(5)*), DIOpDeref(i32)))
!1715 = !DILocation(line: 894, column: 7, scope: !1667)
!1716 = !DILocation(line: 895, column: 3, scope: !1667)
!1717 = !DILocation(line: 895, column: 8, scope: !1683)
!1718 = distinct !DILifetime(object: !1682, location: !DIExpr(DIOpReferrer(i8* addrspace(5)*), DIOpDeref(i8*)))
!1719 = !DILocation(line: 895, column: 20, scope: !1683)
!1720 = !DILocation(line: 895, column: 26, scope: !1683)
!1721 = !DILocation(line: 895, column: 31, scope: !1683)
!1722 = !DILocation(line: 895, column: 42, scope: !1683)
!1723 = !DILocation(line: 895, column: 38, scope: !1683)
!1724 = !{!1692, !1692, i64 0}
!1725 = distinct !{!1725, !1721, !1726, !1727}
!1726 = !DILocation(line: 895, column: 45, scope: !1683)
!1727 = !{!"llvm.loop.mustprogress"}
!1728 = !DILocation(line: 895, column: 53, scope: !1683)
!1729 = !DILocation(line: 895, column: 59, scope: !1683)
!1730 = !DILocation(line: 895, column: 57, scope: !1683)
!1731 = !DILocation(line: 895, column: 51, scope: !1683)
!1732 = !DILocation(line: 895, column: 64, scope: !1667)
!1733 = !DILocation(line: 895, column: 64, scope: !1683)
!1734 = !DILocation(line: 896, column: 40, scope: !1667)
!1735 = !DILocation(line: 896, column: 45, scope: !1667)
!1736 = !DILocation(line: 896, column: 50, scope: !1667)
!1737 = !DILocation(line: 896, column: 9, scope: !1667)
!1738 = !DILocation(line: 896, column: 7, scope: !1667)
!1739 = !DILocation(line: 897, column: 3, scope: !1667)
!1740 = !DILocation(line: 897, column: 8, scope: !1685)
!1741 = distinct !DILifetime(object: !1684, location: !DIExpr(DIOpReferrer(i8* addrspace(5)*), DIOpDeref(i8*)))
!1742 = !DILocation(line: 897, column: 20, scope: !1685)
!1743 = !DILocation(line: 897, column: 26, scope: !1685)
!1744 = !DILocation(line: 897, column: 32, scope: !1685)
!1745 = !DILocation(line: 897, column: 43, scope: !1685)
!1746 = !DILocation(line: 897, column: 39, scope: !1685)
!1747 = distinct !{!1747, !1744, !1748, !1727}
!1748 = !DILocation(line: 897, column: 46, scope: !1685)
!1749 = !DILocation(line: 897, column: 54, scope: !1685)
!1750 = !DILocation(line: 897, column: 60, scope: !1685)
!1751 = !DILocation(line: 897, column: 58, scope: !1685)
!1752 = !DILocation(line: 897, column: 52, scope: !1685)
!1753 = !DILocation(line: 897, column: 66, scope: !1667)
!1754 = !DILocation(line: 897, column: 66, scope: !1685)
!1755 = !DILocation(line: 898, column: 40, scope: !1667)
!1756 = !DILocation(line: 898, column: 45, scope: !1667)
!1757 = !DILocation(line: 898, column: 51, scope: !1667)
!1758 = !DILocation(line: 898, column: 9, scope: !1667)
!1759 = !DILocation(line: 898, column: 7, scope: !1667)
!1760 = !DILocation(line: 899, column: 36, scope: !1667)
!1761 = !DILocation(line: 899, column: 44, scope: !1667)
!1762 = !DILocation(line: 899, column: 9, scope: !1667)
!1763 = !DILocation(line: 899, column: 7, scope: !1667)
!1764 = !DILocation(line: 900, column: 3, scope: !1667)
!1765 = !DILocation(line: 900, column: 8, scope: !1687)
!1766 = distinct !DILifetime(object: !1686, location: !DIExpr(DIOpReferrer(i8* addrspace(5)*), DIOpDeref(i8*)))
!1767 = !DILocation(line: 900, column: 20, scope: !1687)
!1768 = !DILocation(line: 900, column: 26, scope: !1687)
!1769 = !DILocation(line: 900, column: 36, scope: !1687)
!1770 = !DILocation(line: 900, column: 47, scope: !1687)
!1771 = !DILocation(line: 900, column: 43, scope: !1687)
!1772 = distinct !{!1772, !1769, !1773, !1727}
!1773 = !DILocation(line: 900, column: 50, scope: !1687)
!1774 = !DILocation(line: 900, column: 58, scope: !1687)
!1775 = !DILocation(line: 900, column: 64, scope: !1687)
!1776 = !DILocation(line: 900, column: 62, scope: !1687)
!1777 = !DILocation(line: 900, column: 56, scope: !1687)
!1778 = !DILocation(line: 900, column: 74, scope: !1667)
!1779 = !DILocation(line: 900, column: 74, scope: !1687)
!1780 = !DILocation(line: 901, column: 40, scope: !1667)
!1781 = !DILocation(line: 901, column: 45, scope: !1667)
!1782 = !DILocation(line: 901, column: 55, scope: !1667)
!1783 = !DILocation(line: 901, column: 9, scope: !1667)
!1784 = !DILocation(line: 901, column: 7, scope: !1667)
!1785 = !DILocation(line: 902, column: 3, scope: !1667)
!1786 = !DILocation(line: 902, column: 8, scope: !1689)
!1787 = distinct !DILifetime(object: !1688, location: !DIExpr(DIOpReferrer(i8* addrspace(5)*), DIOpDeref(i8*)))
!1788 = !DILocation(line: 902, column: 20, scope: !1689)
!1789 = !DILocation(line: 902, column: 26, scope: !1689)
!1790 = !DILocation(line: 902, column: 37, scope: !1689)
!1791 = !DILocation(line: 902, column: 48, scope: !1689)
!1792 = !DILocation(line: 902, column: 44, scope: !1689)
!1793 = distinct !{!1793, !1790, !1794, !1727}
!1794 = !DILocation(line: 902, column: 51, scope: !1689)
!1795 = !DILocation(line: 902, column: 59, scope: !1689)
!1796 = !DILocation(line: 902, column: 65, scope: !1689)
!1797 = !DILocation(line: 902, column: 63, scope: !1689)
!1798 = !DILocation(line: 902, column: 57, scope: !1689)
!1799 = !DILocation(line: 902, column: 76, scope: !1667)
!1800 = !DILocation(line: 902, column: 76, scope: !1689)
!1801 = !DILocation(line: 903, column: 34, scope: !1667)
!1802 = !DILocation(line: 903, column: 39, scope: !1667)
!1803 = !DILocation(line: 903, column: 50, scope: !1667)
!1804 = !DILocation(line: 903, column: 3, scope: !1667)
!1805 = !DILocation(line: 907, column: 3, scope: !1667)
!1806 = !DILocation(line: 908, column: 1, scope: !1667)
!1807 = distinct !DISubprogram(name: "__assertfail", scope: !1668, file: !1668, line: 911, type: !388, scopeLine: 912, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !1661)
!1808 = !DILocation(line: 914, column: 5, scope: !1807)
!1809 = !DILocation(line: 915, column: 1, scope: !1807)
!1810 = distinct !DISubprogram(name: "vecAdd", linkageName: "_Z6vecAddPdS_S_i", scope: !1038, file: !1038, line: 8, type: !1811, scopeLine: 9, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !1813)
!1811 = !DISubroutineType(types: !1812)
!1812 = !{null, !83, !83, !83, !35}
!1813 = !{!1814, !1815, !1816, !1817, !1818}
!1814 = !DILocalVariable(name: "a", arg: 1, scope: !1810, file: !1038, line: 8, type: !83)
!1815 = !DILocalVariable(name: "b", arg: 2, scope: !1810, file: !1038, line: 8, type: !83)
!1816 = !DILocalVariable(name: "c", arg: 3, scope: !1810, file: !1038, line: 8, type: !83)
!1817 = !DILocalVariable(name: "n", arg: 4, scope: !1810, file: !1038, line: 8, type: !35)
!1818 = !DILocalVariable(name: "id", scope: !1810, file: !1038, line: 10, type: !35)
!1819 = distinct !DILifetime(object: !1814, location: !DIExpr(DIOpReferrer(double* addrspace(5)*), DIOpDeref(double*)))
!1820 = !DILocation(line: 8, column: 45, scope: !1810)
!1821 = distinct !DILifetime(object: !1815, location: !DIExpr(DIOpReferrer(double* addrspace(5)*), DIOpDeref(double*)))
!1822 = !DILocation(line: 8, column: 56, scope: !1810)
!1823 = distinct !DILifetime(object: !1816, location: !DIExpr(DIOpReferrer(double* addrspace(5)*), DIOpDeref(double*)))
!1824 = !DILocation(line: 8, column: 67, scope: !1810)
!1825 = distinct !DILifetime(object: !1817, location: !DIExpr(DIOpReferrer(i32 addrspace(5)*), DIOpDeref(i32)))
!1826 = !DILocation(line: 8, column: 74, scope: !1810)
!1827 = !DILocation(line: 10, column: 5, scope: !1810)
!1828 = distinct !DILifetime(object: !1818, location: !DIExpr(DIOpReferrer(i32 addrspace(5)*), DIOpDeref(i32)))
!1829 = !DILocation(line: 10, column: 9, scope: !1810)
!1830 = !DILocation(line: 10, column: 14, scope: !1810)
!1831 = !DILocation(line: 11, column: 9, scope: !1832)
!1832 = distinct !DILexicalBlock(scope: !1810, file: !1038, line: 11, column: 9)
!1833 = !DILocation(line: 11, column: 14, scope: !1832)
!1834 = !DILocation(line: 11, column: 12, scope: !1832)
!1835 = !DILocation(line: 11, column: 9, scope: !1810)
!1836 = !DILocation(line: 13, column: 17, scope: !1837)
!1837 = distinct !DILexicalBlock(scope: !1832, file: !1038, line: 12, column: 5)
!1838 = !DILocation(line: 13, column: 19, scope: !1837)
!1839 = !{!1840, !1840, i64 0}
!1840 = !{!"double", !1692, i64 0}
!1841 = !DILocation(line: 13, column: 25, scope: !1837)
!1842 = !DILocation(line: 13, column: 27, scope: !1837)
!1843 = !DILocation(line: 13, column: 23, scope: !1837)
!1844 = !DILocation(line: 13, column: 9, scope: !1837)
!1845 = !DILocation(line: 13, column: 11, scope: !1837)
!1846 = !DILocation(line: 13, column: 15, scope: !1837)
!1847 = !DILocation(line: 14, column: 5, scope: !1837)
!1848 = !DILocation(line: 15, column: 1, scope: !1810)
!1849 = distinct !DISubprogram(name: "operator unsigned int", linkageName: "_ZNK17__HIP_CoordinatesI15__HIP_ThreadIdxE3__XcvjEv", scope: !1614, file: !1608, line: 299, type: !1617, scopeLine: 299, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, declaration: !1616, retainedNodes: !1850)
!1850 = !{!1851}
!1851 = !DILocalVariable(name: "this", arg: 1, scope: !1849, type: !1852, flags: DIFlagArtificial | DIFlagObjectPointer)
!1852 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1613, size: 64)
!1853 = distinct !DILifetime(object: !1851, location: !DIExpr(DIOpReferrer(%"struct.__HIP_Coordinates<__HIP_ThreadIdx>::__X"* addrspace(5)*), DIOpDeref(%"struct.__HIP_Coordinates<__HIP_ThreadIdx>::__X"*)))
!1854 = !DILocation(line: 0, scope: !1849)
!1855 = !DILocation(line: 299, column: 77, scope: !1849)
!1856 = !DILocation(line: 299, column: 70, scope: !1849)
!1857 = distinct !DISubprogram(name: "operator()", linkageName: "_ZNK15__HIP_ThreadIdxclEj", scope: !1644, file: !1608, line: 279, type: !1647, scopeLine: 279, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, declaration: !1646, retainedNodes: !1858)
!1858 = !{!1859, !1861}
!1859 = !DILocalVariable(name: "this", arg: 1, scope: !1857, type: !1860, flags: DIFlagArtificial | DIFlagObjectPointer)
!1860 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1650, size: 64)
!1861 = !DILocalVariable(name: "x", arg: 2, scope: !1857, file: !1608, line: 279, type: !18)
!1862 = distinct !DILifetime(object: !1859, location: !DIExpr(DIOpReferrer(%struct.__HIP_ThreadIdx* addrspace(5)*), DIOpDeref(%struct.__HIP_ThreadIdx*)))
!1863 = !DILocation(line: 0, scope: !1857)
!1864 = distinct !DILifetime(object: !1861, location: !DIExpr(DIOpReferrer(i32 addrspace(5)*), DIOpDeref(i32)))
!1865 = !DILocation(line: 279, column: 42, scope: !1857)
!1866 = !DILocation(line: 280, column: 32, scope: !1857)
!1867 = !DILocation(line: 280, column: 12, scope: !1857)
!1868 = !DILocation(line: 280, column: 5, scope: !1857)
!1869 = !{i32 0, i32 1024}
!1870 = !{!1871, !1871, i64 0}
!1871 = !{!"int", !1872, i64 0}
!1872 = !{!"omnipotent char", !1873, i64 0}
!1873 = !{!"Simple C/C++ TBAA"}
!1874 = !{!1875, !1875, i64 0}
!1875 = !{!"long", !1872, i64 0}
!1876 = !{!1877, !1877, i64 0}
!1877 = !{!"any pointer", !1872, i64 0}
!1878 = !{!1879, !1877, i64 0}
!1879 = !{!"", !1877, i64 0, !1877, i64 8, !1880, i64 16, !1875, i64 24, !1875, i64 32, !1875, i64 40}
!1880 = !{!"hsa_signal_s", !1875, i64 0}
!1881 = !{!1879, !1875, i64 40}
!1882 = !{!1879, !1877, i64 8}
!1883 = !{!1872, !1872, i64 0}
!1884 = !{!1885, !1885, i64 0}
!1885 = !{!"bool", !1872, i64 0}
!1886 = !{i8 0, i8 2}
!1887 = !{i64 2662}
!1888 = !{!"exec"}
!1889 = !{!1890, !1871, i64 16}
!1890 = !{!"", !1875, i64 0, !1875, i64 8, !1871, i64 16, !1871, i64 20}
!1891 = !{!1890, !1875, i64 8}
!1892 = !{!1890, !1871, i64 20}
!1893 = !{!1890, !1875, i64 0}
!1894 = !{!1895, !1875, i64 16}
!1895 = !{!"amd_signal_s", !1875, i64 0, !1872, i64 8, !1875, i64 16, !1871, i64 24, !1871, i64 28, !1875, i64 32, !1875, i64 40, !1872, i64 48, !1872, i64 56}
!1896 = !{!1895, !1871, i64 24}

; ModuleID = 'vecadd-host-x86_64-pc-linux-gnu.tmp.bc'
source_filename = "vecadd.cu"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.dim3 = type { i32, i32, i32 }
%struct.CUstream_st = type opaque

$_ZSt3sinIiEN9__gnu_cxx11__enable_ifIXsr12__is_integerIT_EE7__valueEdE6__typeES2_ = comdat any

$_ZSt3cosIiEN9__gnu_cxx11__enable_ifIXsr12__is_integerIT_EE7__valueEdE6__typeES2_ = comdat any

$_ZN4dim3C2Ejjj = comdat any

@.str = private unnamed_addr constant [18 x i8] c"final result: %f\0A\00", align 1

; Function Attrs: noinline norecurse optnone uwtable
define dso_local void @_Z21__device_stub__vecAddPdS_S_i(double* noundef %0, double* noundef %1, double* noundef %2, i32 noundef %3) #0 !dbg !1019 {
  %5 = alloca double*, align 8
  %6 = alloca double*, align 8
  %7 = alloca double*, align 8
  %8 = alloca i32, align 4
  %9 = alloca %struct.dim3, align 8
  %10 = alloca %struct.dim3, align 8
  %11 = alloca i64, align 8
  %12 = alloca i8*, align 8
  %13 = alloca { i64, i32 }, align 8
  %14 = alloca { i64, i32 }, align 8
  store double* %0, double** %5, align 8
  call void @llvm.dbg.declare(metadata double** %5, metadata !1024, metadata !DIExpression()), !dbg !1025
  store double* %1, double** %6, align 8
  call void @llvm.dbg.declare(metadata double** %6, metadata !1026, metadata !DIExpression()), !dbg !1027
  store double* %2, double** %7, align 8
  call void @llvm.dbg.declare(metadata double** %7, metadata !1028, metadata !DIExpression()), !dbg !1029
  store i32 %3, i32* %8, align 4
  call void @llvm.dbg.declare(metadata i32* %8, metadata !1030, metadata !DIExpression()), !dbg !1031
  %15 = alloca i8*, i64 4, align 16, !dbg !1032
  %16 = bitcast double** %5 to i8*, !dbg !1032
  %17 = getelementptr i8*, i8** %15, i32 0, !dbg !1032
  store i8* %16, i8** %17, align 8, !dbg !1032
  %18 = bitcast double** %6 to i8*, !dbg !1032
  %19 = getelementptr i8*, i8** %15, i32 1, !dbg !1032
  store i8* %18, i8** %19, align 8, !dbg !1032
  %20 = bitcast double** %7 to i8*, !dbg !1032
  %21 = getelementptr i8*, i8** %15, i32 2, !dbg !1032
  store i8* %20, i8** %21, align 8, !dbg !1032
  %22 = bitcast i32* %8 to i8*, !dbg !1032
  %23 = getelementptr i8*, i8** %15, i32 3, !dbg !1032
  store i8* %22, i8** %23, align 8, !dbg !1032
  %24 = call i32 @__cudaPopCallConfiguration(%struct.dim3* %9, %struct.dim3* %10, i64* %11, i8** %12), !dbg !1032
  %25 = load i64, i64* %11, align 8, !dbg !1032
  %26 = load i8*, i8** %12, align 8, !dbg !1032
  %27 = bitcast { i64, i32 }* %13 to i8*, !dbg !1032
  %28 = bitcast %struct.dim3* %9 to i8*, !dbg !1032
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %27, i8* align 8 %28, i64 12, i1 false), !dbg !1032
  %29 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %13, i32 0, i32 0, !dbg !1032
  %30 = load i64, i64* %29, align 8, !dbg !1032
  %31 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %13, i32 0, i32 1, !dbg !1032
  %32 = load i32, i32* %31, align 8, !dbg !1032
  %33 = bitcast { i64, i32 }* %14 to i8*, !dbg !1032
  %34 = bitcast %struct.dim3* %10 to i8*, !dbg !1032
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %33, i8* align 8 %34, i64 12, i1 false), !dbg !1032
  %35 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %14, i32 0, i32 0, !dbg !1032
  %36 = load i64, i64* %35, align 8, !dbg !1032
  %37 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %14, i32 0, i32 1, !dbg !1032
  %38 = load i32, i32* %37, align 8, !dbg !1032
  %39 = bitcast i8* %26 to %struct.CUstream_st*, !dbg !1032
  %40 = call noundef i32 @cudaLaunchKernel(i8* noundef bitcast (void (double*, double*, double*, i32)* @_Z21__device_stub__vecAddPdS_S_i to i8*), i64 %30, i32 %32, i64 %36, i32 %38, i8** noundef %15, i64 noundef %25, %struct.CUstream_st* noundef %39), !dbg !1032
  br label %41, !dbg !1032

41:                                               ; preds = %4
  ret void, !dbg !1033
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32 @__cudaPopCallConfiguration(%struct.dim3*, %struct.dim3*, i64*, i8**)

declare i32 @cudaLaunchKernel(i8*, i64, i32, i64, i32, i8**, i64, %struct.CUstream_st*)

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: mustprogress noinline norecurse optnone uwtable
define dso_local noundef i32 @main(i32 noundef %0, i8** noundef %1) #3 !dbg !1034 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i8**, align 8
  %6 = alloca i32, align 4
  %7 = alloca double*, align 8
  %8 = alloca double*, align 8
  %9 = alloca double*, align 8
  %10 = alloca double*, align 8
  %11 = alloca double*, align 8
  %12 = alloca double*, align 8
  %13 = alloca i64, align 8
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  %17 = alloca %struct.dim3, align 4
  %18 = alloca %struct.dim3, align 4
  %19 = alloca { i64, i32 }, align 4
  %20 = alloca { i64, i32 }, align 4
  %21 = alloca double, align 8
  store i32 0, i32* %3, align 4
  store i32 %0, i32* %4, align 4
  call void @llvm.dbg.declare(metadata i32* %4, metadata !1037, metadata !DIExpression()), !dbg !1038
  store i8** %1, i8*** %5, align 8
  call void @llvm.dbg.declare(metadata i8*** %5, metadata !1039, metadata !DIExpression()), !dbg !1040
  call void @llvm.dbg.declare(metadata i32* %6, metadata !1041, metadata !DIExpression()), !dbg !1042
  store i32 100000, i32* %6, align 4, !dbg !1042
  call void @llvm.dbg.declare(metadata double** %7, metadata !1043, metadata !DIExpression()), !dbg !1044
  call void @llvm.dbg.declare(metadata double** %8, metadata !1045, metadata !DIExpression()), !dbg !1046
  call void @llvm.dbg.declare(metadata double** %9, metadata !1047, metadata !DIExpression()), !dbg !1048
  call void @llvm.dbg.declare(metadata double** %10, metadata !1049, metadata !DIExpression()), !dbg !1050
  call void @llvm.dbg.declare(metadata double** %11, metadata !1051, metadata !DIExpression()), !dbg !1052
  call void @llvm.dbg.declare(metadata double** %12, metadata !1053, metadata !DIExpression()), !dbg !1054
  call void @llvm.dbg.declare(metadata i64* %13, metadata !1055, metadata !DIExpression()), !dbg !1056
  %22 = load i32, i32* %6, align 4, !dbg !1057
  %23 = sext i32 %22 to i64, !dbg !1057
  %24 = mul i64 %23, 8, !dbg !1058
  store i64 %24, i64* %13, align 8, !dbg !1056
  %25 = load i64, i64* %13, align 8, !dbg !1059
  %26 = call noalias i8* @malloc(i64 noundef %25) #9, !dbg !1060
  %27 = bitcast i8* %26 to double*, !dbg !1061
  store double* %27, double** %7, align 8, !dbg !1062
  %28 = load i64, i64* %13, align 8, !dbg !1063
  %29 = call noalias i8* @malloc(i64 noundef %28) #9, !dbg !1064
  %30 = bitcast i8* %29 to double*, !dbg !1065
  store double* %30, double** %8, align 8, !dbg !1066
  %31 = load i64, i64* %13, align 8, !dbg !1067
  %32 = call noalias i8* @malloc(i64 noundef %31) #9, !dbg !1068
  %33 = bitcast i8* %32 to double*, !dbg !1069
  store double* %33, double** %9, align 8, !dbg !1070
  %34 = load i64, i64* %13, align 8, !dbg !1071
  %35 = call noundef i32 @_ZL10cudaMallocIdE9cudaErrorPPT_m(double** noundef %10, i64 noundef %34), !dbg !1072
  %36 = load i64, i64* %13, align 8, !dbg !1073
  %37 = call noundef i32 @_ZL10cudaMallocIdE9cudaErrorPPT_m(double** noundef %11, i64 noundef %36), !dbg !1074
  %38 = load i64, i64* %13, align 8, !dbg !1075
  %39 = call noundef i32 @_ZL10cudaMallocIdE9cudaErrorPPT_m(double** noundef %12, i64 noundef %38), !dbg !1076
  call void @llvm.dbg.declare(metadata i32* %14, metadata !1077, metadata !DIExpression()), !dbg !1078
  store i32 0, i32* %14, align 4, !dbg !1079
  br label %40, !dbg !1081

40:                                               ; preds = %63, %2
  %41 = load i32, i32* %14, align 4, !dbg !1082
  %42 = load i32, i32* %6, align 4, !dbg !1084
  %43 = icmp slt i32 %41, %42, !dbg !1085
  br i1 %43, label %44, label %66, !dbg !1086

44:                                               ; preds = %40
  %45 = load i32, i32* %14, align 4, !dbg !1087
  %46 = call noundef double @_ZSt3sinIiEN9__gnu_cxx11__enable_ifIXsr12__is_integerIT_EE7__valueEdE6__typeES2_(i32 noundef %45), !dbg !1089
  %47 = load i32, i32* %14, align 4, !dbg !1090
  %48 = call noundef double @_ZSt3sinIiEN9__gnu_cxx11__enable_ifIXsr12__is_integerIT_EE7__valueEdE6__typeES2_(i32 noundef %47), !dbg !1091
  %49 = fmul double %46, %48, !dbg !1092
  %50 = load double*, double** %7, align 8, !dbg !1093
  %51 = load i32, i32* %14, align 4, !dbg !1094
  %52 = sext i32 %51 to i64, !dbg !1093
  %53 = getelementptr inbounds double, double* %50, i64 %52, !dbg !1093
  store double %49, double* %53, align 8, !dbg !1095
  %54 = load i32, i32* %14, align 4, !dbg !1096
  %55 = call noundef double @_ZSt3cosIiEN9__gnu_cxx11__enable_ifIXsr12__is_integerIT_EE7__valueEdE6__typeES2_(i32 noundef %54), !dbg !1097
  %56 = load i32, i32* %14, align 4, !dbg !1098
  %57 = call noundef double @_ZSt3cosIiEN9__gnu_cxx11__enable_ifIXsr12__is_integerIT_EE7__valueEdE6__typeES2_(i32 noundef %56), !dbg !1099
  %58 = fmul double %55, %57, !dbg !1100
  %59 = load double*, double** %8, align 8, !dbg !1101
  %60 = load i32, i32* %14, align 4, !dbg !1102
  %61 = sext i32 %60 to i64, !dbg !1101
  %62 = getelementptr inbounds double, double* %59, i64 %61, !dbg !1101
  store double %58, double* %62, align 8, !dbg !1103
  br label %63, !dbg !1104

63:                                               ; preds = %44
  %64 = load i32, i32* %14, align 4, !dbg !1105
  %65 = add nsw i32 %64, 1, !dbg !1105
  store i32 %65, i32* %14, align 4, !dbg !1105
  br label %40, !dbg !1106, !llvm.loop !1107

66:                                               ; preds = %40
  %67 = load double*, double** %10, align 8, !dbg !1110
  %68 = bitcast double* %67 to i8*, !dbg !1110
  %69 = load double*, double** %7, align 8, !dbg !1111
  %70 = bitcast double* %69 to i8*, !dbg !1111
  %71 = load i64, i64* %13, align 8, !dbg !1112
  %72 = call i32 @cudaMemcpy(i8* noundef %68, i8* noundef %70, i64 noundef %71, i32 noundef 1), !dbg !1113
  %73 = load double*, double** %11, align 8, !dbg !1114
  %74 = bitcast double* %73 to i8*, !dbg !1114
  %75 = load double*, double** %8, align 8, !dbg !1115
  %76 = bitcast double* %75 to i8*, !dbg !1115
  %77 = load i64, i64* %13, align 8, !dbg !1116
  %78 = call i32 @cudaMemcpy(i8* noundef %74, i8* noundef %76, i64 noundef %77, i32 noundef 1), !dbg !1117
  call void @llvm.dbg.declare(metadata i32* %15, metadata !1118, metadata !DIExpression()), !dbg !1119
  call void @llvm.dbg.declare(metadata i32* %16, metadata !1120, metadata !DIExpression()), !dbg !1121
  %79 = load i32, i32* %6, align 4, !dbg !1122
  store i32 %79, i32* %15, align 4, !dbg !1123
  store i32 1, i32* %16, align 4, !dbg !1124
  %80 = load i32, i32* %16, align 4, !dbg !1125
  call void @_ZN4dim3C2Ejjj(%struct.dim3* noundef nonnull align 4 dereferenceable(12) %17, i32 noundef %80, i32 noundef 1, i32 noundef 1), !dbg !1125
  %81 = load i32, i32* %15, align 4, !dbg !1126
  call void @_ZN4dim3C2Ejjj(%struct.dim3* noundef nonnull align 4 dereferenceable(12) %18, i32 noundef %81, i32 noundef 1, i32 noundef 1), !dbg !1126
  %82 = bitcast { i64, i32 }* %19 to i8*, !dbg !1127
  %83 = bitcast %struct.dim3* %17 to i8*, !dbg !1127
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %82, i8* align 4 %83, i64 12, i1 false), !dbg !1127
  %84 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %19, i32 0, i32 0, !dbg !1127
  %85 = load i64, i64* %84, align 4, !dbg !1127
  %86 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %19, i32 0, i32 1, !dbg !1127
  %87 = load i32, i32* %86, align 4, !dbg !1127
  %88 = bitcast { i64, i32 }* %20 to i8*, !dbg !1127
  %89 = bitcast %struct.dim3* %18 to i8*, !dbg !1127
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %88, i8* align 4 %89, i64 12, i1 false), !dbg !1127
  %90 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %20, i32 0, i32 0, !dbg !1127
  %91 = load i64, i64* %90, align 4, !dbg !1127
  %92 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %20, i32 0, i32 1, !dbg !1127
  %93 = load i32, i32* %92, align 4, !dbg !1127
  %94 = call i32 @__cudaPushCallConfiguration(i64 %85, i32 %87, i64 %91, i32 %93, i64 noundef 0, i8* noundef null), !dbg !1127
  %95 = icmp ne i32 %94, 0, !dbg !1127
  br i1 %95, label %101, label %96, !dbg !1128

96:                                               ; preds = %66
  %97 = load double*, double** %10, align 8, !dbg !1129
  %98 = load double*, double** %11, align 8, !dbg !1130
  %99 = load double*, double** %12, align 8, !dbg !1131
  %100 = load i32, i32* %6, align 4, !dbg !1132
  call void @_Z21__device_stub__vecAddPdS_S_i(double* noundef %97, double* noundef %98, double* noundef %99, i32 noundef %100), !dbg !1128
  br label %101, !dbg !1128

101:                                              ; preds = %96, %66
  %102 = load double*, double** %9, align 8, !dbg !1133
  %103 = bitcast double* %102 to i8*, !dbg !1133
  %104 = load double*, double** %12, align 8, !dbg !1134
  %105 = bitcast double* %104 to i8*, !dbg !1134
  %106 = load i64, i64* %13, align 8, !dbg !1135
  %107 = call i32 @cudaMemcpy(i8* noundef %103, i8* noundef %105, i64 noundef %106, i32 noundef 2), !dbg !1136
  call void @llvm.dbg.declare(metadata double* %21, metadata !1137, metadata !DIExpression()), !dbg !1138
  store double 0.000000e+00, double* %21, align 8, !dbg !1138
  store i32 0, i32* %14, align 4, !dbg !1139
  br label %108, !dbg !1141

108:                                              ; preds = %120, %101
  %109 = load i32, i32* %14, align 4, !dbg !1142
  %110 = load i32, i32* %6, align 4, !dbg !1144
  %111 = icmp slt i32 %109, %110, !dbg !1145
  br i1 %111, label %112, label %123, !dbg !1146

112:                                              ; preds = %108
  %113 = load double*, double** %9, align 8, !dbg !1147
  %114 = load i32, i32* %14, align 4, !dbg !1148
  %115 = sext i32 %114 to i64, !dbg !1147
  %116 = getelementptr inbounds double, double* %113, i64 %115, !dbg !1147
  %117 = load double, double* %116, align 8, !dbg !1147
  %118 = load double, double* %21, align 8, !dbg !1149
  %119 = fadd double %118, %117, !dbg !1149
  store double %119, double* %21, align 8, !dbg !1149
  br label %120, !dbg !1150

120:                                              ; preds = %112
  %121 = load i32, i32* %14, align 4, !dbg !1151
  %122 = add nsw i32 %121, 1, !dbg !1151
  store i32 %122, i32* %14, align 4, !dbg !1151
  br label %108, !dbg !1152, !llvm.loop !1153

123:                                              ; preds = %108
  %124 = load double, double* %21, align 8, !dbg !1155
  %125 = load i32, i32* %6, align 4, !dbg !1156
  %126 = sitofp i32 %125 to double, !dbg !1156
  %127 = fdiv double %124, %126, !dbg !1157
  %128 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0), double noundef %127), !dbg !1158
  %129 = load double*, double** %10, align 8, !dbg !1159
  %130 = bitcast double* %129 to i8*, !dbg !1159
  %131 = call i32 @cudaFree(i8* noundef %130), !dbg !1160
  %132 = load double*, double** %11, align 8, !dbg !1161
  %133 = bitcast double* %132 to i8*, !dbg !1161
  %134 = call i32 @cudaFree(i8* noundef %133), !dbg !1162
  %135 = load double*, double** %12, align 8, !dbg !1163
  %136 = bitcast double* %135 to i8*, !dbg !1163
  %137 = call i32 @cudaFree(i8* noundef %136), !dbg !1164
  %138 = load double*, double** %7, align 8, !dbg !1165
  %139 = bitcast double* %138 to i8*, !dbg !1165
  call void @free(i8* noundef %139) #9, !dbg !1166
  %140 = load double*, double** %8, align 8, !dbg !1167
  %141 = bitcast double* %140 to i8*, !dbg !1167
  call void @free(i8* noundef %141) #9, !dbg !1168
  %142 = load double*, double** %9, align 8, !dbg !1169
  %143 = bitcast double* %142 to i8*, !dbg !1169
  call void @free(i8* noundef %143) #9, !dbg !1170
  ret i32 0, !dbg !1171
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64 noundef) #4

; Function Attrs: mustprogress noinline optnone uwtable
define internal noundef i32 @_ZL10cudaMallocIdE9cudaErrorPPT_m(double** noundef %0, i64 noundef %1) #5 !dbg !1172 {
  %3 = alloca double**, align 8
  %4 = alloca i64, align 8
  store double** %0, double*** %3, align 8
  call void @llvm.dbg.declare(metadata double*** %3, metadata !1180, metadata !DIExpression()), !dbg !1181
  store i64 %1, i64* %4, align 8
  call void @llvm.dbg.declare(metadata i64* %4, metadata !1182, metadata !DIExpression()), !dbg !1183
  %5 = load double**, double*** %3, align 8, !dbg !1184
  %6 = bitcast double** %5 to i8*, !dbg !1184
  %7 = bitcast i8* %6 to i8**, !dbg !1185
  %8 = load i64, i64* %4, align 8, !dbg !1186
  %9 = call i32 @cudaMalloc(i8** noundef %7, i64 noundef %8), !dbg !1187
  ret i32 %9, !dbg !1188
}

; Function Attrs: mustprogress noinline nounwind optnone uwtable
define linkonce_odr dso_local noundef double @_ZSt3sinIiEN9__gnu_cxx11__enable_ifIXsr12__is_integerIT_EE7__valueEdE6__typeES2_(i32 noundef %0) #6 comdat !dbg !1189 {
  %2 = alloca i32, align 4
  store i32 %0, i32* %2, align 4
  call void @llvm.dbg.declare(metadata i32* %2, metadata !1200, metadata !DIExpression()), !dbg !1201
  %3 = load i32, i32* %2, align 4, !dbg !1202
  %4 = sitofp i32 %3 to double, !dbg !1202
  %5 = call double @sin(double noundef %4) #9, !dbg !1203
  ret double %5, !dbg !1204
}

; Function Attrs: mustprogress noinline nounwind optnone uwtable
define linkonce_odr dso_local noundef double @_ZSt3cosIiEN9__gnu_cxx11__enable_ifIXsr12__is_integerIT_EE7__valueEdE6__typeES2_(i32 noundef %0) #6 comdat !dbg !1205 {
  %2 = alloca i32, align 4
  store i32 %0, i32* %2, align 4
  call void @llvm.dbg.declare(metadata i32* %2, metadata !1206, metadata !DIExpression()), !dbg !1207
  %3 = load i32, i32* %2, align 4, !dbg !1208
  %4 = sitofp i32 %3 to double, !dbg !1208
  %5 = call double @cos(double noundef %4) #9, !dbg !1209
  ret double %5, !dbg !1210
}

declare i32 @cudaMemcpy(i8* noundef, i8* noundef, i64 noundef, i32 noundef) #7

declare i32 @__cudaPushCallConfiguration(i64, i32, i64, i32, i64 noundef, i8* noundef) #7

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local void @_ZN4dim3C2Ejjj(%struct.dim3* noundef nonnull align 4 dereferenceable(12) %0, i32 noundef %1, i32 noundef %2, i32 noundef %3) unnamed_addr #8 comdat align 2 !dbg !1211 {
  %5 = alloca %struct.dim3*, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  store %struct.dim3* %0, %struct.dim3** %5, align 8
  call void @llvm.dbg.declare(metadata %struct.dim3** %5, metadata !1212, metadata !DIExpression()), !dbg !1214
  store i32 %1, i32* %6, align 4
  call void @llvm.dbg.declare(metadata i32* %6, metadata !1215, metadata !DIExpression()), !dbg !1216
  store i32 %2, i32* %7, align 4
  call void @llvm.dbg.declare(metadata i32* %7, metadata !1217, metadata !DIExpression()), !dbg !1218
  store i32 %3, i32* %8, align 4
  call void @llvm.dbg.declare(metadata i32* %8, metadata !1219, metadata !DIExpression()), !dbg !1220
  %9 = load %struct.dim3*, %struct.dim3** %5, align 8
  %10 = getelementptr inbounds %struct.dim3, %struct.dim3* %9, i32 0, i32 0, !dbg !1221
  %11 = load i32, i32* %6, align 4, !dbg !1222
  store i32 %11, i32* %10, align 4, !dbg !1221
  %12 = getelementptr inbounds %struct.dim3, %struct.dim3* %9, i32 0, i32 1, !dbg !1223
  %13 = load i32, i32* %7, align 4, !dbg !1224
  store i32 %13, i32* %12, align 4, !dbg !1223
  %14 = getelementptr inbounds %struct.dim3, %struct.dim3* %9, i32 0, i32 2, !dbg !1225
  %15 = load i32, i32* %8, align 4, !dbg !1226
  store i32 %15, i32* %14, align 4, !dbg !1225
  ret void, !dbg !1227
}

declare i32 @printf(i8* noundef, ...) #7

declare i32 @cudaFree(i8* noundef) #7

; Function Attrs: nounwind
declare void @free(i8* noundef) #4

; Function Attrs: nounwind
declare double @sin(double noundef) #4

; Function Attrs: nounwind
declare double @cos(double noundef) #4

declare i32 @cudaMalloc(i8** noundef, i64 noundef) #7

attributes #0 = { noinline norecurse optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn }
attributes #3 = { mustprogress noinline norecurse optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { mustprogress noinline optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { mustprogress noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #8 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #9 = { nounwind }

!llvm.module.flags = !{!0, !1, !2, !3, !4, !5, !6, !7}
!llvm.dbg.cu = !{!8}
!llvm.ident = !{!1018}

!0 = !{i32 2, !"SDK Version", [2 x i32] [i32 11, i32 5]}
!1 = !{i32 7, !"Dwarf Version", i32 5}
!2 = !{i32 2, !"Debug Info Version", i32 3}
!3 = !{i32 1, !"wchar_size", i32 4}
!4 = !{i32 7, !"PIC Level", i32 2}
!5 = !{i32 7, !"PIE Level", i32 2}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = distinct !DICompileUnit(language: DW_LANG_C_plus_plus_14, file: !9, producer: "Ubuntu clang version 14.0.6-++20221029082011+f28c006a5895-1~exp1~20221029202041.162", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !10, retainedTypes: !147, imports: !176, splitDebugInlining: false, nameTableKind: None)
!9 = !DIFile(filename: "vecadd.cu", directory: "/workspaces/cupbop-amd-playground/vector-add", checksumkind: CSK_MD5, checksum: "70d1e7e8d21a4da9115992b9e43a5498")
!10 = !{!11, !20}
!11 = !DICompositeType(tag: DW_TAG_enumeration_type, name: "cudaMemcpyKind", file: !12, line: 1196, baseType: !13, size: 32, elements: !14, identifier: "_ZTS14cudaMemcpyKind")
!12 = !DIFile(filename: "/usr/local/cuda/include/driver_types.h", directory: "")
!13 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!14 = !{!15, !16, !17, !18, !19}
!15 = !DIEnumerator(name: "cudaMemcpyHostToHost", value: 0, isUnsigned: true)
!16 = !DIEnumerator(name: "cudaMemcpyHostToDevice", value: 1, isUnsigned: true)
!17 = !DIEnumerator(name: "cudaMemcpyDeviceToHost", value: 2, isUnsigned: true)
!18 = !DIEnumerator(name: "cudaMemcpyDeviceToDevice", value: 3, isUnsigned: true)
!19 = !DIEnumerator(name: "cudaMemcpyDefault", value: 4, isUnsigned: true)
!20 = !DICompositeType(tag: DW_TAG_enumeration_type, name: "cudaError", file: !12, line: 202, baseType: !13, size: 32, elements: !21, identifier: "_ZTS9cudaError")
!21 = !{!22, !23, !24, !25, !26, !27, !28, !29, !30, !31, !32, !33, !34, !35, !36, !37, !38, !39, !40, !41, !42, !43, !44, !45, !46, !47, !48, !49, !50, !51, !52, !53, !54, !55, !56, !57, !58, !59, !60, !61, !62, !63, !64, !65, !66, !67, !68, !69, !70, !71, !72, !73, !74, !75, !76, !77, !78, !79, !80, !81, !82, !83, !84, !85, !86, !87, !88, !89, !90, !91, !92, !93, !94, !95, !96, !97, !98, !99, !100, !101, !102, !103, !104, !105, !106, !107, !108, !109, !110, !111, !112, !113, !114, !115, !116, !117, !118, !119, !120, !121, !122, !123, !124, !125, !126, !127, !128, !129, !130, !131, !132, !133, !134, !135, !136, !137, !138, !139, !140, !141, !142, !143, !144, !145, !146}
!22 = !DIEnumerator(name: "cudaSuccess", value: 0, isUnsigned: true)
!23 = !DIEnumerator(name: "cudaErrorInvalidValue", value: 1, isUnsigned: true)
!24 = !DIEnumerator(name: "cudaErrorMemoryAllocation", value: 2, isUnsigned: true)
!25 = !DIEnumerator(name: "cudaErrorInitializationError", value: 3, isUnsigned: true)
!26 = !DIEnumerator(name: "cudaErrorCudartUnloading", value: 4, isUnsigned: true)
!27 = !DIEnumerator(name: "cudaErrorProfilerDisabled", value: 5, isUnsigned: true)
!28 = !DIEnumerator(name: "cudaErrorProfilerNotInitialized", value: 6, isUnsigned: true)
!29 = !DIEnumerator(name: "cudaErrorProfilerAlreadyStarted", value: 7, isUnsigned: true)
!30 = !DIEnumerator(name: "cudaErrorProfilerAlreadyStopped", value: 8, isUnsigned: true)
!31 = !DIEnumerator(name: "cudaErrorInvalidConfiguration", value: 9, isUnsigned: true)
!32 = !DIEnumerator(name: "cudaErrorInvalidPitchValue", value: 12, isUnsigned: true)
!33 = !DIEnumerator(name: "cudaErrorInvalidSymbol", value: 13, isUnsigned: true)
!34 = !DIEnumerator(name: "cudaErrorInvalidHostPointer", value: 16, isUnsigned: true)
!35 = !DIEnumerator(name: "cudaErrorInvalidDevicePointer", value: 17, isUnsigned: true)
!36 = !DIEnumerator(name: "cudaErrorInvalidTexture", value: 18, isUnsigned: true)
!37 = !DIEnumerator(name: "cudaErrorInvalidTextureBinding", value: 19, isUnsigned: true)
!38 = !DIEnumerator(name: "cudaErrorInvalidChannelDescriptor", value: 20, isUnsigned: true)
!39 = !DIEnumerator(name: "cudaErrorInvalidMemcpyDirection", value: 21, isUnsigned: true)
!40 = !DIEnumerator(name: "cudaErrorAddressOfConstant", value: 22, isUnsigned: true)
!41 = !DIEnumerator(name: "cudaErrorTextureFetchFailed", value: 23, isUnsigned: true)
!42 = !DIEnumerator(name: "cudaErrorTextureNotBound", value: 24, isUnsigned: true)
!43 = !DIEnumerator(name: "cudaErrorSynchronizationError", value: 25, isUnsigned: true)
!44 = !DIEnumerator(name: "cudaErrorInvalidFilterSetting", value: 26, isUnsigned: true)
!45 = !DIEnumerator(name: "cudaErrorInvalidNormSetting", value: 27, isUnsigned: true)
!46 = !DIEnumerator(name: "cudaErrorMixedDeviceExecution", value: 28, isUnsigned: true)
!47 = !DIEnumerator(name: "cudaErrorNotYetImplemented", value: 31, isUnsigned: true)
!48 = !DIEnumerator(name: "cudaErrorMemoryValueTooLarge", value: 32, isUnsigned: true)
!49 = !DIEnumerator(name: "cudaErrorStubLibrary", value: 34, isUnsigned: true)
!50 = !DIEnumerator(name: "cudaErrorInsufficientDriver", value: 35, isUnsigned: true)
!51 = !DIEnumerator(name: "cudaErrorCallRequiresNewerDriver", value: 36, isUnsigned: true)
!52 = !DIEnumerator(name: "cudaErrorInvalidSurface", value: 37, isUnsigned: true)
!53 = !DIEnumerator(name: "cudaErrorDuplicateVariableName", value: 43, isUnsigned: true)
!54 = !DIEnumerator(name: "cudaErrorDuplicateTextureName", value: 44, isUnsigned: true)
!55 = !DIEnumerator(name: "cudaErrorDuplicateSurfaceName", value: 45, isUnsigned: true)
!56 = !DIEnumerator(name: "cudaErrorDevicesUnavailable", value: 46, isUnsigned: true)
!57 = !DIEnumerator(name: "cudaErrorIncompatibleDriverContext", value: 49, isUnsigned: true)
!58 = !DIEnumerator(name: "cudaErrorMissingConfiguration", value: 52, isUnsigned: true)
!59 = !DIEnumerator(name: "cudaErrorPriorLaunchFailure", value: 53, isUnsigned: true)
!60 = !DIEnumerator(name: "cudaErrorLaunchMaxDepthExceeded", value: 65, isUnsigned: true)
!61 = !DIEnumerator(name: "cudaErrorLaunchFileScopedTex", value: 66, isUnsigned: true)
!62 = !DIEnumerator(name: "cudaErrorLaunchFileScopedSurf", value: 67, isUnsigned: true)
!63 = !DIEnumerator(name: "cudaErrorSyncDepthExceeded", value: 68, isUnsigned: true)
!64 = !DIEnumerator(name: "cudaErrorLaunchPendingCountExceeded", value: 69, isUnsigned: true)
!65 = !DIEnumerator(name: "cudaErrorInvalidDeviceFunction", value: 98, isUnsigned: true)
!66 = !DIEnumerator(name: "cudaErrorNoDevice", value: 100, isUnsigned: true)
!67 = !DIEnumerator(name: "cudaErrorInvalidDevice", value: 101, isUnsigned: true)
!68 = !DIEnumerator(name: "cudaErrorDeviceNotLicensed", value: 102, isUnsigned: true)
!69 = !DIEnumerator(name: "cudaErrorSoftwareValidityNotEstablished", value: 103, isUnsigned: true)
!70 = !DIEnumerator(name: "cudaErrorStartupFailure", value: 127, isUnsigned: true)
!71 = !DIEnumerator(name: "cudaErrorInvalidKernelImage", value: 200, isUnsigned: true)
!72 = !DIEnumerator(name: "cudaErrorDeviceUninitialized", value: 201, isUnsigned: true)
!73 = !DIEnumerator(name: "cudaErrorMapBufferObjectFailed", value: 205, isUnsigned: true)
!74 = !DIEnumerator(name: "cudaErrorUnmapBufferObjectFailed", value: 206, isUnsigned: true)
!75 = !DIEnumerator(name: "cudaErrorArrayIsMapped", value: 207, isUnsigned: true)
!76 = !DIEnumerator(name: "cudaErrorAlreadyMapped", value: 208, isUnsigned: true)
!77 = !DIEnumerator(name: "cudaErrorNoKernelImageForDevice", value: 209, isUnsigned: true)
!78 = !DIEnumerator(name: "cudaErrorAlreadyAcquired", value: 210, isUnsigned: true)
!79 = !DIEnumerator(name: "cudaErrorNotMapped", value: 211, isUnsigned: true)
!80 = !DIEnumerator(name: "cudaErrorNotMappedAsArray", value: 212, isUnsigned: true)
!81 = !DIEnumerator(name: "cudaErrorNotMappedAsPointer", value: 213, isUnsigned: true)
!82 = !DIEnumerator(name: "cudaErrorECCUncorrectable", value: 214, isUnsigned: true)
!83 = !DIEnumerator(name: "cudaErrorUnsupportedLimit", value: 215, isUnsigned: true)
!84 = !DIEnumerator(name: "cudaErrorDeviceAlreadyInUse", value: 216, isUnsigned: true)
!85 = !DIEnumerator(name: "cudaErrorPeerAccessUnsupported", value: 217, isUnsigned: true)
!86 = !DIEnumerator(name: "cudaErrorInvalidPtx", value: 218, isUnsigned: true)
!87 = !DIEnumerator(name: "cudaErrorInvalidGraphicsContext", value: 219, isUnsigned: true)
!88 = !DIEnumerator(name: "cudaErrorNvlinkUncorrectable", value: 220, isUnsigned: true)
!89 = !DIEnumerator(name: "cudaErrorJitCompilerNotFound", value: 221, isUnsigned: true)
!90 = !DIEnumerator(name: "cudaErrorUnsupportedPtxVersion", value: 222, isUnsigned: true)
!91 = !DIEnumerator(name: "cudaErrorJitCompilationDisabled", value: 223, isUnsigned: true)
!92 = !DIEnumerator(name: "cudaErrorUnsupportedExecAffinity", value: 224, isUnsigned: true)
!93 = !DIEnumerator(name: "cudaErrorInvalidSource", value: 300, isUnsigned: true)
!94 = !DIEnumerator(name: "cudaErrorFileNotFound", value: 301, isUnsigned: true)
!95 = !DIEnumerator(name: "cudaErrorSharedObjectSymbolNotFound", value: 302, isUnsigned: true)
!96 = !DIEnumerator(name: "cudaErrorSharedObjectInitFailed", value: 303, isUnsigned: true)
!97 = !DIEnumerator(name: "cudaErrorOperatingSystem", value: 304, isUnsigned: true)
!98 = !DIEnumerator(name: "cudaErrorInvalidResourceHandle", value: 400, isUnsigned: true)
!99 = !DIEnumerator(name: "cudaErrorIllegalState", value: 401, isUnsigned: true)
!100 = !DIEnumerator(name: "cudaErrorSymbolNotFound", value: 500, isUnsigned: true)
!101 = !DIEnumerator(name: "cudaErrorNotReady", value: 600, isUnsigned: true)
!102 = !DIEnumerator(name: "cudaErrorIllegalAddress", value: 700, isUnsigned: true)
!103 = !DIEnumerator(name: "cudaErrorLaunchOutOfResources", value: 701, isUnsigned: true)
!104 = !DIEnumerator(name: "cudaErrorLaunchTimeout", value: 702, isUnsigned: true)
!105 = !DIEnumerator(name: "cudaErrorLaunchIncompatibleTexturing", value: 703, isUnsigned: true)
!106 = !DIEnumerator(name: "cudaErrorPeerAccessAlreadyEnabled", value: 704, isUnsigned: true)
!107 = !DIEnumerator(name: "cudaErrorPeerAccessNotEnabled", value: 705, isUnsigned: true)
!108 = !DIEnumerator(name: "cudaErrorSetOnActiveProcess", value: 708, isUnsigned: true)
!109 = !DIEnumerator(name: "cudaErrorContextIsDestroyed", value: 709, isUnsigned: true)
!110 = !DIEnumerator(name: "cudaErrorAssert", value: 710, isUnsigned: true)
!111 = !DIEnumerator(name: "cudaErrorTooManyPeers", value: 711, isUnsigned: true)
!112 = !DIEnumerator(name: "cudaErrorHostMemoryAlreadyRegistered", value: 712, isUnsigned: true)
!113 = !DIEnumerator(name: "cudaErrorHostMemoryNotRegistered", value: 713, isUnsigned: true)
!114 = !DIEnumerator(name: "cudaErrorHardwareStackError", value: 714, isUnsigned: true)
!115 = !DIEnumerator(name: "cudaErrorIllegalInstruction", value: 715, isUnsigned: true)
!116 = !DIEnumerator(name: "cudaErrorMisalignedAddress", value: 716, isUnsigned: true)
!117 = !DIEnumerator(name: "cudaErrorInvalidAddressSpace", value: 717, isUnsigned: true)
!118 = !DIEnumerator(name: "cudaErrorInvalidPc", value: 718, isUnsigned: true)
!119 = !DIEnumerator(name: "cudaErrorLaunchFailure", value: 719, isUnsigned: true)
!120 = !DIEnumerator(name: "cudaErrorCooperativeLaunchTooLarge", value: 720, isUnsigned: true)
!121 = !DIEnumerator(name: "cudaErrorNotPermitted", value: 800, isUnsigned: true)
!122 = !DIEnumerator(name: "cudaErrorNotSupported", value: 801, isUnsigned: true)
!123 = !DIEnumerator(name: "cudaErrorSystemNotReady", value: 802, isUnsigned: true)
!124 = !DIEnumerator(name: "cudaErrorSystemDriverMismatch", value: 803, isUnsigned: true)
!125 = !DIEnumerator(name: "cudaErrorCompatNotSupportedOnDevice", value: 804, isUnsigned: true)
!126 = !DIEnumerator(name: "cudaErrorMpsConnectionFailed", value: 805, isUnsigned: true)
!127 = !DIEnumerator(name: "cudaErrorMpsRpcFailure", value: 806, isUnsigned: true)
!128 = !DIEnumerator(name: "cudaErrorMpsServerNotReady", value: 807, isUnsigned: true)
!129 = !DIEnumerator(name: "cudaErrorMpsMaxClientsReached", value: 808, isUnsigned: true)
!130 = !DIEnumerator(name: "cudaErrorMpsMaxConnectionsReached", value: 809, isUnsigned: true)
!131 = !DIEnumerator(name: "cudaErrorMpsClientTerminated", value: 810, isUnsigned: true)
!132 = !DIEnumerator(name: "cudaErrorStreamCaptureUnsupported", value: 900, isUnsigned: true)
!133 = !DIEnumerator(name: "cudaErrorStreamCaptureInvalidated", value: 901, isUnsigned: true)
!134 = !DIEnumerator(name: "cudaErrorStreamCaptureMerge", value: 902, isUnsigned: true)
!135 = !DIEnumerator(name: "cudaErrorStreamCaptureUnmatched", value: 903, isUnsigned: true)
!136 = !DIEnumerator(name: "cudaErrorStreamCaptureUnjoined", value: 904, isUnsigned: true)
!137 = !DIEnumerator(name: "cudaErrorStreamCaptureIsolation", value: 905, isUnsigned: true)
!138 = !DIEnumerator(name: "cudaErrorStreamCaptureImplicit", value: 906, isUnsigned: true)
!139 = !DIEnumerator(name: "cudaErrorCapturedEvent", value: 907, isUnsigned: true)
!140 = !DIEnumerator(name: "cudaErrorStreamCaptureWrongThread", value: 908, isUnsigned: true)
!141 = !DIEnumerator(name: "cudaErrorTimeout", value: 909, isUnsigned: true)
!142 = !DIEnumerator(name: "cudaErrorGraphExecUpdateFailure", value: 910, isUnsigned: true)
!143 = !DIEnumerator(name: "cudaErrorExternalDevice", value: 911, isUnsigned: true)
!144 = !DIEnumerator(name: "cudaErrorInvalidClusterSize", value: 912, isUnsigned: true)
!145 = !DIEnumerator(name: "cudaErrorUnknown", value: 999, isUnsigned: true)
!146 = !DIEnumerator(name: "cudaErrorApiFailureBase", value: 10000, isUnsigned: true)
!147 = !{!148, !150, !151, !152}
!148 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !149, size: 64)
!149 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!150 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !151, size: 64)
!151 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!152 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "dim3", file: !153, line: 418, size: 96, flags: DIFlagTypePassByValue | DIFlagNonTrivial, elements: !154, identifier: "_ZTS4dim3")
!153 = !DIFile(filename: "/usr/local/cuda/include/vector_types.h", directory: "")
!154 = !{!155, !156, !157, !158, !162, !171}
!155 = !DIDerivedType(tag: DW_TAG_member, name: "x", scope: !152, file: !153, line: 420, baseType: !13, size: 32)
!156 = !DIDerivedType(tag: DW_TAG_member, name: "y", scope: !152, file: !153, line: 420, baseType: !13, size: 32, offset: 32)
!157 = !DIDerivedType(tag: DW_TAG_member, name: "z", scope: !152, file: !153, line: 420, baseType: !13, size: 32, offset: 64)
!158 = !DISubprogram(name: "dim3", scope: !152, file: !153, line: 423, type: !159, scopeLine: 423, flags: DIFlagPrototyped, spFlags: 0)
!159 = !DISubroutineType(types: !160)
!160 = !{null, !161, !13, !13, !13}
!161 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !152, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!162 = !DISubprogram(name: "dim3", scope: !152, file: !153, line: 424, type: !163, scopeLine: 424, flags: DIFlagPrototyped, spFlags: 0)
!163 = !DISubroutineType(types: !164)
!164 = !{null, !161, !165}
!165 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint3", file: !153, line: 384, baseType: !166)
!166 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "uint3", file: !153, line: 192, size: 96, flags: DIFlagTypePassByValue, elements: !167, identifier: "_ZTS5uint3")
!167 = !{!168, !169, !170}
!168 = !DIDerivedType(tag: DW_TAG_member, name: "x", scope: !166, file: !153, line: 194, baseType: !13, size: 32)
!169 = !DIDerivedType(tag: DW_TAG_member, name: "y", scope: !166, file: !153, line: 194, baseType: !13, size: 32, offset: 32)
!170 = !DIDerivedType(tag: DW_TAG_member, name: "z", scope: !166, file: !153, line: 194, baseType: !13, size: 32, offset: 64)
!171 = !DISubprogram(name: "operator uint3", linkageName: "_ZNK4dim3cv5uint3Ev", scope: !152, file: !153, line: 425, type: !172, scopeLine: 425, flags: DIFlagPrototyped, spFlags: 0)
!172 = !DISubroutineType(types: !173)
!173 = !{!165, !174}
!174 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !175, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!175 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !152)
!176 = !{!177, !184, !189, !191, !193, !195, !197, !201, !203, !205, !207, !209, !211, !213, !215, !217, !219, !221, !223, !225, !227, !229, !233, !235, !237, !239, !243, !248, !250, !252, !257, !261, !263, !265, !267, !269, !271, !273, !275, !277, !282, !286, !288, !293, !297, !299, !301, !303, !305, !307, !311, !313, !315, !320, !327, !331, !333, !335, !337, !339, !343, !345, !347, !351, !353, !355, !357, !359, !361, !363, !365, !367, !369, !373, !379, !381, !383, !387, !389, !391, !393, !395, !397, !399, !401, !405, !409, !411, !413, !417, !419, !421, !423, !425, !427, !429, !432, !434, !436, !438, !443, !445, !447, !449, !451, !453, !455, !457, !459, !461, !463, !465, !469, !471, !473, !475, !477, !479, !481, !483, !485, !487, !489, !491, !493, !495, !497, !499, !503, !505, !509, !511, !513, !515, !517, !519, !521, !523, !525, !527, !531, !533, !537, !539, !541, !543, !547, !549, !553, !555, !557, !559, !561, !563, !565, !567, !569, !571, !573, !575, !577, !581, !583, !587, !589, !591, !593, !595, !597, !601, !603, !605, !607, !609, !611, !613, !617, !621, !623, !625, !627, !629, !633, !635, !639, !641, !643, !645, !647, !649, !651, !655, !657, !661, !663, !665, !669, !671, !673, !675, !677, !679, !681, !685, !691, !695, !700, !702, !704, !708, !712, !725, !729, !733, !737, !741, !746, !748, !752, !756, !760, !768, !772, !776, !778, !782, !786, !790, !796, !800, !804, !806, !814, !818, !825, !827, !829, !833, !837, !841, !846, !850, !854, !855, !856, !857, !859, !860, !861, !862, !863, !864, !865, !867, !868, !869, !870, !871, !872, !873, !875, !876, !877, !878, !879, !880, !881, !882, !883, !884, !885, !886, !887, !888, !889, !890, !891, !892, !893, !894, !895, !896, !897, !898, !899, !903, !905, !907, !909, !911, !913, !915, !917, !919, !921, !923, !925, !927, !929, !931, !933, !935, !937, !939, !941, !943, !945, !947, !949, !951, !953, !955, !957, !959, !961, !963, !965, !967, !969, !971, !973, !975, !977, !979, !981, !983, !985, !987, !989, !991, !993, !995, !997, !999, !1001, !1003, !1005, !1007, !1009, !1011, !1013}
!177 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !179, file: !180, line: 200)
!178 = !DINamespace(name: "std", scope: null)
!179 = !DISubprogram(name: "abs", linkageName: "_ZL3absi", scope: !180, file: !180, line: 30, type: !181, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!180 = !DIFile(filename: "/usr/lib/llvm-14/lib/clang/14.0.6/include/__clang_cuda_math_forward_declares.h", directory: "")
!181 = !DISubroutineType(types: !182)
!182 = !{!183, !183}
!183 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!184 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !185, file: !180, line: 201)
!185 = !DISubprogram(name: "acos", linkageName: "_ZL4acosf", scope: !180, file: !180, line: 32, type: !186, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!186 = !DISubroutineType(types: !187)
!187 = !{!188, !188}
!188 = !DIBasicType(name: "float", size: 32, encoding: DW_ATE_float)
!189 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !190, file: !180, line: 202)
!190 = !DISubprogram(name: "acosh", linkageName: "_ZL5acoshf", scope: !180, file: !180, line: 34, type: !186, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!191 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !192, file: !180, line: 203)
!192 = !DISubprogram(name: "asin", linkageName: "_ZL4asinf", scope: !180, file: !180, line: 36, type: !186, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!193 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !194, file: !180, line: 204)
!194 = !DISubprogram(name: "asinh", linkageName: "_ZL5asinhf", scope: !180, file: !180, line: 38, type: !186, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!195 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !196, file: !180, line: 205)
!196 = !DISubprogram(name: "atan", linkageName: "_ZL4atanf", scope: !180, file: !180, line: 42, type: !186, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!197 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !198, file: !180, line: 206)
!198 = !DISubprogram(name: "atan2", linkageName: "_ZL5atan2ff", scope: !180, file: !180, line: 40, type: !199, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!199 = !DISubroutineType(types: !200)
!200 = !{!188, !188, !188}
!201 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !202, file: !180, line: 207)
!202 = !DISubprogram(name: "atanh", linkageName: "_ZL5atanhf", scope: !180, file: !180, line: 44, type: !186, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!203 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !204, file: !180, line: 208)
!204 = !DISubprogram(name: "cbrt", linkageName: "_ZL4cbrtf", scope: !180, file: !180, line: 46, type: !186, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!205 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !206, file: !180, line: 209)
!206 = !DISubprogram(name: "ceil", linkageName: "_ZL4ceilf", scope: !180, file: !180, line: 48, type: !186, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!207 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !208, file: !180, line: 210)
!208 = !DISubprogram(name: "copysign", linkageName: "_ZL8copysignff", scope: !180, file: !180, line: 50, type: !199, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!209 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !210, file: !180, line: 211)
!210 = !DISubprogram(name: "cos", linkageName: "_ZL3cosf", scope: !180, file: !180, line: 52, type: !186, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!211 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !212, file: !180, line: 212)
!212 = !DISubprogram(name: "cosh", linkageName: "_ZL4coshf", scope: !180, file: !180, line: 54, type: !186, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!213 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !214, file: !180, line: 213)
!214 = !DISubprogram(name: "erf", linkageName: "_ZL3erff", scope: !180, file: !180, line: 58, type: !186, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!215 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !216, file: !180, line: 214)
!216 = !DISubprogram(name: "erfc", linkageName: "_ZL4erfcf", scope: !180, file: !180, line: 56, type: !186, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!217 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !218, file: !180, line: 215)
!218 = !DISubprogram(name: "exp", linkageName: "_ZL3expf", scope: !180, file: !180, line: 62, type: !186, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!219 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !220, file: !180, line: 216)
!220 = !DISubprogram(name: "exp2", linkageName: "_ZL4exp2f", scope: !180, file: !180, line: 60, type: !186, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!221 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !222, file: !180, line: 217)
!222 = !DISubprogram(name: "expm1", linkageName: "_ZL5expm1f", scope: !180, file: !180, line: 64, type: !186, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!223 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !224, file: !180, line: 218)
!224 = !DISubprogram(name: "fabs", linkageName: "_ZL4fabsf", scope: !180, file: !180, line: 66, type: !186, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!225 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !226, file: !180, line: 219)
!226 = !DISubprogram(name: "fdim", linkageName: "_ZL4fdimff", scope: !180, file: !180, line: 68, type: !199, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!227 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !228, file: !180, line: 220)
!228 = !DISubprogram(name: "floor", linkageName: "_ZL5floorf", scope: !180, file: !180, line: 70, type: !186, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!229 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !230, file: !180, line: 221)
!230 = !DISubprogram(name: "fma", linkageName: "_ZL3fmafff", scope: !180, file: !180, line: 72, type: !231, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!231 = !DISubroutineType(types: !232)
!232 = !{!188, !188, !188, !188}
!233 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !234, file: !180, line: 222)
!234 = !DISubprogram(name: "fmax", linkageName: "_ZL4fmaxff", scope: !180, file: !180, line: 74, type: !199, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!235 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !236, file: !180, line: 223)
!236 = !DISubprogram(name: "fmin", linkageName: "_ZL4fminff", scope: !180, file: !180, line: 76, type: !199, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!237 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !238, file: !180, line: 224)
!238 = !DISubprogram(name: "fmod", linkageName: "_ZL4fmodff", scope: !180, file: !180, line: 78, type: !199, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!239 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !240, file: !180, line: 225)
!240 = !DISubprogram(name: "fpclassify", linkageName: "_ZL10fpclassifyf", scope: !180, file: !180, line: 80, type: !241, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!241 = !DISubroutineType(types: !242)
!242 = !{!183, !188}
!243 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !244, file: !180, line: 226)
!244 = !DISubprogram(name: "frexp", linkageName: "_ZL5frexpfPi", scope: !180, file: !180, line: 82, type: !245, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!245 = !DISubroutineType(types: !246)
!246 = !{!188, !188, !247}
!247 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !183, size: 64)
!248 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !249, file: !180, line: 227)
!249 = !DISubprogram(name: "hypot", linkageName: "_ZL5hypotff", scope: !180, file: !180, line: 84, type: !199, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!250 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !251, file: !180, line: 228)
!251 = !DISubprogram(name: "ilogb", linkageName: "_ZL5ilogbf", scope: !180, file: !180, line: 86, type: !241, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!252 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !253, file: !180, line: 229)
!253 = !DISubprogram(name: "isfinite", linkageName: "_ZL8isfinitef", scope: !180, file: !180, line: 91, type: !254, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!254 = !DISubroutineType(types: !255)
!255 = !{!256, !188}
!256 = !DIBasicType(name: "bool", size: 8, encoding: DW_ATE_boolean)
!257 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !258, file: !180, line: 230)
!258 = !DISubprogram(name: "isgreater", linkageName: "_ZL9isgreaterff", scope: !180, file: !180, line: 95, type: !259, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!259 = !DISubroutineType(types: !260)
!260 = !{!256, !188, !188}
!261 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !262, file: !180, line: 231)
!262 = !DISubprogram(name: "isgreaterequal", linkageName: "_ZL14isgreaterequalff", scope: !180, file: !180, line: 94, type: !259, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!263 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !264, file: !180, line: 232)
!264 = !DISubprogram(name: "isinf", linkageName: "_ZL5isinff", scope: !180, file: !180, line: 100, type: !254, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!265 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !266, file: !180, line: 233)
!266 = !DISubprogram(name: "isless", linkageName: "_ZL6islessff", scope: !180, file: !180, line: 104, type: !259, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!267 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !268, file: !180, line: 234)
!268 = !DISubprogram(name: "islessequal", linkageName: "_ZL11islessequalff", scope: !180, file: !180, line: 103, type: !259, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!269 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !270, file: !180, line: 235)
!270 = !DISubprogram(name: "islessgreater", linkageName: "_ZL13islessgreaterff", scope: !180, file: !180, line: 106, type: !259, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!271 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !272, file: !180, line: 236)
!272 = !DISubprogram(name: "isnan", linkageName: "_ZL5isnanf", scope: !180, file: !180, line: 111, type: !254, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!273 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !274, file: !180, line: 237)
!274 = !DISubprogram(name: "isnormal", linkageName: "_ZL8isnormalf", scope: !180, file: !180, line: 113, type: !254, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!275 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !276, file: !180, line: 238)
!276 = !DISubprogram(name: "isunordered", linkageName: "_ZL11isunorderedff", scope: !180, file: !180, line: 115, type: !259, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!277 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !278, file: !180, line: 239)
!278 = !DISubprogram(name: "labs", linkageName: "_ZL4labsl", scope: !180, file: !180, line: 116, type: !279, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!279 = !DISubroutineType(types: !280)
!280 = !{!281, !281}
!281 = !DIBasicType(name: "long", size: 64, encoding: DW_ATE_signed)
!282 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !283, file: !180, line: 240)
!283 = !DISubprogram(name: "ldexp", linkageName: "_ZL5ldexpfi", scope: !180, file: !180, line: 118, type: !284, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!284 = !DISubroutineType(types: !285)
!285 = !{!188, !188, !183}
!286 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !287, file: !180, line: 241)
!287 = !DISubprogram(name: "lgamma", linkageName: "_ZL6lgammaf", scope: !180, file: !180, line: 120, type: !186, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!288 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !289, file: !180, line: 242)
!289 = !DISubprogram(name: "llabs", linkageName: "_ZL5llabsx", scope: !180, file: !180, line: 121, type: !290, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!290 = !DISubroutineType(types: !291)
!291 = !{!292, !292}
!292 = !DIBasicType(name: "long long", size: 64, encoding: DW_ATE_signed)
!293 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !294, file: !180, line: 243)
!294 = !DISubprogram(name: "llrint", linkageName: "_ZL6llrintf", scope: !180, file: !180, line: 123, type: !295, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!295 = !DISubroutineType(types: !296)
!296 = !{!292, !188}
!297 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !298, file: !180, line: 244)
!298 = !DISubprogram(name: "log", linkageName: "_ZL3logf", scope: !180, file: !180, line: 133, type: !186, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!299 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !300, file: !180, line: 245)
!300 = !DISubprogram(name: "log10", linkageName: "_ZL5log10f", scope: !180, file: !180, line: 125, type: !186, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!301 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !302, file: !180, line: 246)
!302 = !DISubprogram(name: "log1p", linkageName: "_ZL5log1pf", scope: !180, file: !180, line: 127, type: !186, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!303 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !304, file: !180, line: 247)
!304 = !DISubprogram(name: "log2", linkageName: "_ZL4log2f", scope: !180, file: !180, line: 129, type: !186, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!305 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !306, file: !180, line: 248)
!306 = !DISubprogram(name: "logb", linkageName: "_ZL4logbf", scope: !180, file: !180, line: 131, type: !186, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!307 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !308, file: !180, line: 249)
!308 = !DISubprogram(name: "lrint", linkageName: "_ZL5lrintf", scope: !180, file: !180, line: 135, type: !309, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!309 = !DISubroutineType(types: !310)
!310 = !{!281, !188}
!311 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !312, file: !180, line: 250)
!312 = !DISubprogram(name: "lround", linkageName: "_ZL6lroundf", scope: !180, file: !180, line: 137, type: !309, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!313 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !314, file: !180, line: 251)
!314 = !DISubprogram(name: "llround", linkageName: "_ZL7llroundf", scope: !180, file: !180, line: 138, type: !295, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!315 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !316, file: !180, line: 252)
!316 = !DISubprogram(name: "modf", linkageName: "_ZL4modffPf", scope: !180, file: !180, line: 140, type: !317, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!317 = !DISubroutineType(types: !318)
!318 = !{!188, !188, !319}
!319 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !188, size: 64)
!320 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !321, file: !180, line: 253)
!321 = !DISubprogram(name: "nan", linkageName: "_ZL3nanPKc", scope: !180, file: !180, line: 141, type: !322, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!322 = !DISubroutineType(types: !323)
!323 = !{!149, !324}
!324 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !325, size: 64)
!325 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !326)
!326 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!327 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !328, file: !180, line: 254)
!328 = !DISubprogram(name: "nanf", linkageName: "_ZL4nanfPKc", scope: !180, file: !180, line: 142, type: !329, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!329 = !DISubroutineType(types: !330)
!330 = !{!188, !324}
!331 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !332, file: !180, line: 255)
!332 = !DISubprogram(name: "nearbyint", linkageName: "_ZL9nearbyintf", scope: !180, file: !180, line: 144, type: !186, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!333 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !334, file: !180, line: 256)
!334 = !DISubprogram(name: "nextafter", linkageName: "_ZL9nextafterff", scope: !180, file: !180, line: 146, type: !199, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!335 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !336, file: !180, line: 257)
!336 = !DISubprogram(name: "pow", linkageName: "_ZL3powfi", scope: !180, file: !180, line: 150, type: !284, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!337 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !338, file: !180, line: 258)
!338 = !DISubprogram(name: "remainder", linkageName: "_ZL9remainderff", scope: !180, file: !180, line: 152, type: !199, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!339 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !340, file: !180, line: 259)
!340 = !DISubprogram(name: "remquo", linkageName: "_ZL6remquoffPi", scope: !180, file: !180, line: 154, type: !341, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!341 = !DISubroutineType(types: !342)
!342 = !{!188, !188, !188, !247}
!343 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !344, file: !180, line: 260)
!344 = !DISubprogram(name: "rint", linkageName: "_ZL4rintf", scope: !180, file: !180, line: 156, type: !186, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!345 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !346, file: !180, line: 261)
!346 = !DISubprogram(name: "round", linkageName: "_ZL5roundf", scope: !180, file: !180, line: 158, type: !186, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!347 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !348, file: !180, line: 262)
!348 = !DISubprogram(name: "scalbln", linkageName: "_ZL7scalblnfl", scope: !180, file: !180, line: 160, type: !349, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!349 = !DISubroutineType(types: !350)
!350 = !{!188, !188, !281}
!351 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !352, file: !180, line: 263)
!352 = !DISubprogram(name: "scalbn", linkageName: "_ZL6scalbnfi", scope: !180, file: !180, line: 162, type: !284, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!353 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !354, file: !180, line: 264)
!354 = !DISubprogram(name: "signbit", linkageName: "_ZL7signbitf", scope: !180, file: !180, line: 167, type: !254, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!355 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !356, file: !180, line: 265)
!356 = !DISubprogram(name: "sin", linkageName: "_ZL3sinf", scope: !180, file: !180, line: 169, type: !186, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!357 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !358, file: !180, line: 266)
!358 = !DISubprogram(name: "sinh", linkageName: "_ZL4sinhf", scope: !180, file: !180, line: 171, type: !186, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!359 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !360, file: !180, line: 267)
!360 = !DISubprogram(name: "sqrt", linkageName: "_ZL4sqrtf", scope: !180, file: !180, line: 173, type: !186, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!361 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !362, file: !180, line: 268)
!362 = !DISubprogram(name: "tan", linkageName: "_ZL3tanf", scope: !180, file: !180, line: 175, type: !186, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!363 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !364, file: !180, line: 269)
!364 = !DISubprogram(name: "tanh", linkageName: "_ZL4tanhf", scope: !180, file: !180, line: 177, type: !186, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!365 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !366, file: !180, line: 270)
!366 = !DISubprogram(name: "tgamma", linkageName: "_ZL6tgammaf", scope: !180, file: !180, line: 179, type: !186, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!367 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !368, file: !180, line: 271)
!368 = !DISubprogram(name: "trunc", linkageName: "_ZL5truncf", scope: !180, file: !180, line: 181, type: !186, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!369 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !370, file: !372, line: 52)
!370 = !DISubprogram(name: "abs", scope: !371, file: !371, line: 840, type: !181, flags: DIFlagPrototyped, spFlags: 0)
!371 = !DIFile(filename: "/usr/include/stdlib.h", directory: "")
!372 = !DIFile(filename: "/usr/bin/../lib/gcc/x86_64-linux-gnu/9/../../../../include/c++/9/bits/std_abs.h", directory: "")
!373 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !374, file: !378, line: 83)
!374 = !DISubprogram(name: "acos", scope: !375, file: !375, line: 53, type: !376, flags: DIFlagPrototyped, spFlags: 0)
!375 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/mathcalls.h", directory: "")
!376 = !DISubroutineType(types: !377)
!377 = !{!149, !149}
!378 = !DIFile(filename: "/usr/bin/../lib/gcc/x86_64-linux-gnu/9/../../../../include/c++/9/cmath", directory: "")
!379 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !380, file: !378, line: 102)
!380 = !DISubprogram(name: "asin", scope: !375, file: !375, line: 55, type: !376, flags: DIFlagPrototyped, spFlags: 0)
!381 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !382, file: !378, line: 121)
!382 = !DISubprogram(name: "atan", scope: !375, file: !375, line: 57, type: !376, flags: DIFlagPrototyped, spFlags: 0)
!383 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !384, file: !378, line: 140)
!384 = !DISubprogram(name: "atan2", scope: !375, file: !375, line: 59, type: !385, flags: DIFlagPrototyped, spFlags: 0)
!385 = !DISubroutineType(types: !386)
!386 = !{!149, !149, !149}
!387 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !388, file: !378, line: 161)
!388 = !DISubprogram(name: "ceil", scope: !375, file: !375, line: 159, type: !376, flags: DIFlagPrototyped, spFlags: 0)
!389 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !390, file: !378, line: 180)
!390 = !DISubprogram(name: "cos", scope: !375, file: !375, line: 62, type: !376, flags: DIFlagPrototyped, spFlags: 0)
!391 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !392, file: !378, line: 199)
!392 = !DISubprogram(name: "cosh", scope: !375, file: !375, line: 71, type: !376, flags: DIFlagPrototyped, spFlags: 0)
!393 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !394, file: !378, line: 218)
!394 = !DISubprogram(name: "exp", scope: !375, file: !375, line: 95, type: !376, flags: DIFlagPrototyped, spFlags: 0)
!395 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !396, file: !378, line: 237)
!396 = !DISubprogram(name: "fabs", scope: !375, file: !375, line: 162, type: !376, flags: DIFlagPrototyped, spFlags: 0)
!397 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !398, file: !378, line: 256)
!398 = !DISubprogram(name: "floor", scope: !375, file: !375, line: 165, type: !376, flags: DIFlagPrototyped, spFlags: 0)
!399 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !400, file: !378, line: 275)
!400 = !DISubprogram(name: "fmod", scope: !375, file: !375, line: 168, type: !385, flags: DIFlagPrototyped, spFlags: 0)
!401 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !402, file: !378, line: 296)
!402 = !DISubprogram(name: "frexp", scope: !375, file: !375, line: 98, type: !403, flags: DIFlagPrototyped, spFlags: 0)
!403 = !DISubroutineType(types: !404)
!404 = !{!149, !149, !247}
!405 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !406, file: !378, line: 315)
!406 = !DISubprogram(name: "ldexp", scope: !375, file: !375, line: 101, type: !407, flags: DIFlagPrototyped, spFlags: 0)
!407 = !DISubroutineType(types: !408)
!408 = !{!149, !149, !183}
!409 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !410, file: !378, line: 334)
!410 = !DISubprogram(name: "log", scope: !375, file: !375, line: 104, type: !376, flags: DIFlagPrototyped, spFlags: 0)
!411 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !412, file: !378, line: 353)
!412 = !DISubprogram(name: "log10", scope: !375, file: !375, line: 107, type: !376, flags: DIFlagPrototyped, spFlags: 0)
!413 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !414, file: !378, line: 372)
!414 = !DISubprogram(name: "modf", scope: !375, file: !375, line: 110, type: !415, flags: DIFlagPrototyped, spFlags: 0)
!415 = !DISubroutineType(types: !416)
!416 = !{!149, !149, !148}
!417 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !418, file: !378, line: 384)
!418 = !DISubprogram(name: "pow", scope: !375, file: !375, line: 140, type: !385, flags: DIFlagPrototyped, spFlags: 0)
!419 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !420, file: !378, line: 421)
!420 = !DISubprogram(name: "sin", scope: !375, file: !375, line: 64, type: !376, flags: DIFlagPrototyped, spFlags: 0)
!421 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !422, file: !378, line: 440)
!422 = !DISubprogram(name: "sinh", scope: !375, file: !375, line: 73, type: !376, flags: DIFlagPrototyped, spFlags: 0)
!423 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !424, file: !378, line: 459)
!424 = !DISubprogram(name: "sqrt", scope: !375, file: !375, line: 143, type: !376, flags: DIFlagPrototyped, spFlags: 0)
!425 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !426, file: !378, line: 478)
!426 = !DISubprogram(name: "tan", scope: !375, file: !375, line: 66, type: !376, flags: DIFlagPrototyped, spFlags: 0)
!427 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !428, file: !378, line: 497)
!428 = !DISubprogram(name: "tanh", scope: !375, file: !375, line: 75, type: !376, flags: DIFlagPrototyped, spFlags: 0)
!429 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !430, file: !378, line: 1065)
!430 = !DIDerivedType(tag: DW_TAG_typedef, name: "double_t", file: !431, line: 150, baseType: !149)
!431 = !DIFile(filename: "/usr/include/math.h", directory: "")
!432 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !433, file: !378, line: 1066)
!433 = !DIDerivedType(tag: DW_TAG_typedef, name: "float_t", file: !431, line: 149, baseType: !188)
!434 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !435, file: !378, line: 1069)
!435 = !DISubprogram(name: "acosh", scope: !375, file: !375, line: 85, type: !376, flags: DIFlagPrototyped, spFlags: 0)
!436 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !437, file: !378, line: 1070)
!437 = !DISubprogram(name: "acoshf", scope: !375, file: !375, line: 85, type: !186, flags: DIFlagPrototyped, spFlags: 0)
!438 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !439, file: !378, line: 1071)
!439 = !DISubprogram(name: "acoshl", scope: !375, file: !375, line: 85, type: !440, flags: DIFlagPrototyped, spFlags: 0)
!440 = !DISubroutineType(types: !441)
!441 = !{!442, !442}
!442 = !DIBasicType(name: "long double", size: 128, encoding: DW_ATE_float)
!443 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !444, file: !378, line: 1073)
!444 = !DISubprogram(name: "asinh", scope: !375, file: !375, line: 87, type: !376, flags: DIFlagPrototyped, spFlags: 0)
!445 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !446, file: !378, line: 1074)
!446 = !DISubprogram(name: "asinhf", scope: !375, file: !375, line: 87, type: !186, flags: DIFlagPrototyped, spFlags: 0)
!447 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !448, file: !378, line: 1075)
!448 = !DISubprogram(name: "asinhl", scope: !375, file: !375, line: 87, type: !440, flags: DIFlagPrototyped, spFlags: 0)
!449 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !450, file: !378, line: 1077)
!450 = !DISubprogram(name: "atanh", scope: !375, file: !375, line: 89, type: !376, flags: DIFlagPrototyped, spFlags: 0)
!451 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !452, file: !378, line: 1078)
!452 = !DISubprogram(name: "atanhf", scope: !375, file: !375, line: 89, type: !186, flags: DIFlagPrototyped, spFlags: 0)
!453 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !454, file: !378, line: 1079)
!454 = !DISubprogram(name: "atanhl", scope: !375, file: !375, line: 89, type: !440, flags: DIFlagPrototyped, spFlags: 0)
!455 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !456, file: !378, line: 1081)
!456 = !DISubprogram(name: "cbrt", scope: !375, file: !375, line: 152, type: !376, flags: DIFlagPrototyped, spFlags: 0)
!457 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !458, file: !378, line: 1082)
!458 = !DISubprogram(name: "cbrtf", scope: !375, file: !375, line: 152, type: !186, flags: DIFlagPrototyped, spFlags: 0)
!459 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !460, file: !378, line: 1083)
!460 = !DISubprogram(name: "cbrtl", scope: !375, file: !375, line: 152, type: !440, flags: DIFlagPrototyped, spFlags: 0)
!461 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !462, file: !378, line: 1085)
!462 = !DISubprogram(name: "copysign", scope: !375, file: !375, line: 196, type: !385, flags: DIFlagPrototyped, spFlags: 0)
!463 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !464, file: !378, line: 1086)
!464 = !DISubprogram(name: "copysignf", scope: !375, file: !375, line: 196, type: !199, flags: DIFlagPrototyped, spFlags: 0)
!465 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !466, file: !378, line: 1087)
!466 = !DISubprogram(name: "copysignl", scope: !375, file: !375, line: 196, type: !467, flags: DIFlagPrototyped, spFlags: 0)
!467 = !DISubroutineType(types: !468)
!468 = !{!442, !442, !442}
!469 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !470, file: !378, line: 1089)
!470 = !DISubprogram(name: "erf", scope: !375, file: !375, line: 228, type: !376, flags: DIFlagPrototyped, spFlags: 0)
!471 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !472, file: !378, line: 1090)
!472 = !DISubprogram(name: "erff", scope: !375, file: !375, line: 228, type: !186, flags: DIFlagPrototyped, spFlags: 0)
!473 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !474, file: !378, line: 1091)
!474 = !DISubprogram(name: "erfl", scope: !375, file: !375, line: 228, type: !440, flags: DIFlagPrototyped, spFlags: 0)
!475 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !476, file: !378, line: 1093)
!476 = !DISubprogram(name: "erfc", scope: !375, file: !375, line: 229, type: !376, flags: DIFlagPrototyped, spFlags: 0)
!477 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !478, file: !378, line: 1094)
!478 = !DISubprogram(name: "erfcf", scope: !375, file: !375, line: 229, type: !186, flags: DIFlagPrototyped, spFlags: 0)
!479 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !480, file: !378, line: 1095)
!480 = !DISubprogram(name: "erfcl", scope: !375, file: !375, line: 229, type: !440, flags: DIFlagPrototyped, spFlags: 0)
!481 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !482, file: !378, line: 1097)
!482 = !DISubprogram(name: "exp2", scope: !375, file: !375, line: 130, type: !376, flags: DIFlagPrototyped, spFlags: 0)
!483 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !484, file: !378, line: 1098)
!484 = !DISubprogram(name: "exp2f", scope: !375, file: !375, line: 130, type: !186, flags: DIFlagPrototyped, spFlags: 0)
!485 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !486, file: !378, line: 1099)
!486 = !DISubprogram(name: "exp2l", scope: !375, file: !375, line: 130, type: !440, flags: DIFlagPrototyped, spFlags: 0)
!487 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !488, file: !378, line: 1101)
!488 = !DISubprogram(name: "expm1", scope: !375, file: !375, line: 119, type: !376, flags: DIFlagPrototyped, spFlags: 0)
!489 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !490, file: !378, line: 1102)
!490 = !DISubprogram(name: "expm1f", scope: !375, file: !375, line: 119, type: !186, flags: DIFlagPrototyped, spFlags: 0)
!491 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !492, file: !378, line: 1103)
!492 = !DISubprogram(name: "expm1l", scope: !375, file: !375, line: 119, type: !440, flags: DIFlagPrototyped, spFlags: 0)
!493 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !494, file: !378, line: 1105)
!494 = !DISubprogram(name: "fdim", scope: !375, file: !375, line: 326, type: !385, flags: DIFlagPrototyped, spFlags: 0)
!495 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !496, file: !378, line: 1106)
!496 = !DISubprogram(name: "fdimf", scope: !375, file: !375, line: 326, type: !199, flags: DIFlagPrototyped, spFlags: 0)
!497 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !498, file: !378, line: 1107)
!498 = !DISubprogram(name: "fdiml", scope: !375, file: !375, line: 326, type: !467, flags: DIFlagPrototyped, spFlags: 0)
!499 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !500, file: !378, line: 1109)
!500 = !DISubprogram(name: "fma", scope: !375, file: !375, line: 335, type: !501, flags: DIFlagPrototyped, spFlags: 0)
!501 = !DISubroutineType(types: !502)
!502 = !{!149, !149, !149, !149}
!503 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !504, file: !378, line: 1110)
!504 = !DISubprogram(name: "fmaf", scope: !375, file: !375, line: 335, type: !231, flags: DIFlagPrototyped, spFlags: 0)
!505 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !506, file: !378, line: 1111)
!506 = !DISubprogram(name: "fmal", scope: !375, file: !375, line: 335, type: !507, flags: DIFlagPrototyped, spFlags: 0)
!507 = !DISubroutineType(types: !508)
!508 = !{!442, !442, !442, !442}
!509 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !510, file: !378, line: 1113)
!510 = !DISubprogram(name: "fmax", scope: !375, file: !375, line: 329, type: !385, flags: DIFlagPrototyped, spFlags: 0)
!511 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !512, file: !378, line: 1114)
!512 = !DISubprogram(name: "fmaxf", scope: !375, file: !375, line: 329, type: !199, flags: DIFlagPrototyped, spFlags: 0)
!513 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !514, file: !378, line: 1115)
!514 = !DISubprogram(name: "fmaxl", scope: !375, file: !375, line: 329, type: !467, flags: DIFlagPrototyped, spFlags: 0)
!515 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !516, file: !378, line: 1117)
!516 = !DISubprogram(name: "fmin", scope: !375, file: !375, line: 332, type: !385, flags: DIFlagPrototyped, spFlags: 0)
!517 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !518, file: !378, line: 1118)
!518 = !DISubprogram(name: "fminf", scope: !375, file: !375, line: 332, type: !199, flags: DIFlagPrototyped, spFlags: 0)
!519 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !520, file: !378, line: 1119)
!520 = !DISubprogram(name: "fminl", scope: !375, file: !375, line: 332, type: !467, flags: DIFlagPrototyped, spFlags: 0)
!521 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !522, file: !378, line: 1121)
!522 = !DISubprogram(name: "hypot", scope: !375, file: !375, line: 147, type: !385, flags: DIFlagPrototyped, spFlags: 0)
!523 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !524, file: !378, line: 1122)
!524 = !DISubprogram(name: "hypotf", scope: !375, file: !375, line: 147, type: !199, flags: DIFlagPrototyped, spFlags: 0)
!525 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !526, file: !378, line: 1123)
!526 = !DISubprogram(name: "hypotl", scope: !375, file: !375, line: 147, type: !467, flags: DIFlagPrototyped, spFlags: 0)
!527 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !528, file: !378, line: 1125)
!528 = !DISubprogram(name: "ilogb", scope: !375, file: !375, line: 280, type: !529, flags: DIFlagPrototyped, spFlags: 0)
!529 = !DISubroutineType(types: !530)
!530 = !{!183, !149}
!531 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !532, file: !378, line: 1126)
!532 = !DISubprogram(name: "ilogbf", scope: !375, file: !375, line: 280, type: !241, flags: DIFlagPrototyped, spFlags: 0)
!533 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !534, file: !378, line: 1127)
!534 = !DISubprogram(name: "ilogbl", scope: !375, file: !375, line: 280, type: !535, flags: DIFlagPrototyped, spFlags: 0)
!535 = !DISubroutineType(types: !536)
!536 = !{!183, !442}
!537 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !538, file: !378, line: 1129)
!538 = !DISubprogram(name: "lgamma", scope: !375, file: !375, line: 230, type: !376, flags: DIFlagPrototyped, spFlags: 0)
!539 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !540, file: !378, line: 1130)
!540 = !DISubprogram(name: "lgammaf", scope: !375, file: !375, line: 230, type: !186, flags: DIFlagPrototyped, spFlags: 0)
!541 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !542, file: !378, line: 1131)
!542 = !DISubprogram(name: "lgammal", scope: !375, file: !375, line: 230, type: !440, flags: DIFlagPrototyped, spFlags: 0)
!543 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !544, file: !378, line: 1134)
!544 = !DISubprogram(name: "llrint", scope: !375, file: !375, line: 316, type: !545, flags: DIFlagPrototyped, spFlags: 0)
!545 = !DISubroutineType(types: !546)
!546 = !{!292, !149}
!547 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !548, file: !378, line: 1135)
!548 = !DISubprogram(name: "llrintf", scope: !375, file: !375, line: 316, type: !295, flags: DIFlagPrototyped, spFlags: 0)
!549 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !550, file: !378, line: 1136)
!550 = !DISubprogram(name: "llrintl", scope: !375, file: !375, line: 316, type: !551, flags: DIFlagPrototyped, spFlags: 0)
!551 = !DISubroutineType(types: !552)
!552 = !{!292, !442}
!553 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !554, file: !378, line: 1138)
!554 = !DISubprogram(name: "llround", scope: !375, file: !375, line: 322, type: !545, flags: DIFlagPrototyped, spFlags: 0)
!555 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !556, file: !378, line: 1139)
!556 = !DISubprogram(name: "llroundf", scope: !375, file: !375, line: 322, type: !295, flags: DIFlagPrototyped, spFlags: 0)
!557 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !558, file: !378, line: 1140)
!558 = !DISubprogram(name: "llroundl", scope: !375, file: !375, line: 322, type: !551, flags: DIFlagPrototyped, spFlags: 0)
!559 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !560, file: !378, line: 1143)
!560 = !DISubprogram(name: "log1p", scope: !375, file: !375, line: 122, type: !376, flags: DIFlagPrototyped, spFlags: 0)
!561 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !562, file: !378, line: 1144)
!562 = !DISubprogram(name: "log1pf", scope: !375, file: !375, line: 122, type: !186, flags: DIFlagPrototyped, spFlags: 0)
!563 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !564, file: !378, line: 1145)
!564 = !DISubprogram(name: "log1pl", scope: !375, file: !375, line: 122, type: !440, flags: DIFlagPrototyped, spFlags: 0)
!565 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !566, file: !378, line: 1147)
!566 = !DISubprogram(name: "log2", scope: !375, file: !375, line: 133, type: !376, flags: DIFlagPrototyped, spFlags: 0)
!567 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !568, file: !378, line: 1148)
!568 = !DISubprogram(name: "log2f", scope: !375, file: !375, line: 133, type: !186, flags: DIFlagPrototyped, spFlags: 0)
!569 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !570, file: !378, line: 1149)
!570 = !DISubprogram(name: "log2l", scope: !375, file: !375, line: 133, type: !440, flags: DIFlagPrototyped, spFlags: 0)
!571 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !572, file: !378, line: 1151)
!572 = !DISubprogram(name: "logb", scope: !375, file: !375, line: 125, type: !376, flags: DIFlagPrototyped, spFlags: 0)
!573 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !574, file: !378, line: 1152)
!574 = !DISubprogram(name: "logbf", scope: !375, file: !375, line: 125, type: !186, flags: DIFlagPrototyped, spFlags: 0)
!575 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !576, file: !378, line: 1153)
!576 = !DISubprogram(name: "logbl", scope: !375, file: !375, line: 125, type: !440, flags: DIFlagPrototyped, spFlags: 0)
!577 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !578, file: !378, line: 1155)
!578 = !DISubprogram(name: "lrint", scope: !375, file: !375, line: 314, type: !579, flags: DIFlagPrototyped, spFlags: 0)
!579 = !DISubroutineType(types: !580)
!580 = !{!281, !149}
!581 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !582, file: !378, line: 1156)
!582 = !DISubprogram(name: "lrintf", scope: !375, file: !375, line: 314, type: !309, flags: DIFlagPrototyped, spFlags: 0)
!583 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !584, file: !378, line: 1157)
!584 = !DISubprogram(name: "lrintl", scope: !375, file: !375, line: 314, type: !585, flags: DIFlagPrototyped, spFlags: 0)
!585 = !DISubroutineType(types: !586)
!586 = !{!281, !442}
!587 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !588, file: !378, line: 1159)
!588 = !DISubprogram(name: "lround", scope: !375, file: !375, line: 320, type: !579, flags: DIFlagPrototyped, spFlags: 0)
!589 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !590, file: !378, line: 1160)
!590 = !DISubprogram(name: "lroundf", scope: !375, file: !375, line: 320, type: !309, flags: DIFlagPrototyped, spFlags: 0)
!591 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !592, file: !378, line: 1161)
!592 = !DISubprogram(name: "lroundl", scope: !375, file: !375, line: 320, type: !585, flags: DIFlagPrototyped, spFlags: 0)
!593 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !594, file: !378, line: 1163)
!594 = !DISubprogram(name: "nan", scope: !375, file: !375, line: 201, type: !322, flags: DIFlagPrototyped, spFlags: 0)
!595 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !596, file: !378, line: 1164)
!596 = !DISubprogram(name: "nanf", scope: !375, file: !375, line: 201, type: !329, flags: DIFlagPrototyped, spFlags: 0)
!597 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !598, file: !378, line: 1165)
!598 = !DISubprogram(name: "nanl", scope: !375, file: !375, line: 201, type: !599, flags: DIFlagPrototyped, spFlags: 0)
!599 = !DISubroutineType(types: !600)
!600 = !{!442, !324}
!601 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !602, file: !378, line: 1167)
!602 = !DISubprogram(name: "nearbyint", scope: !375, file: !375, line: 294, type: !376, flags: DIFlagPrototyped, spFlags: 0)
!603 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !604, file: !378, line: 1168)
!604 = !DISubprogram(name: "nearbyintf", scope: !375, file: !375, line: 294, type: !186, flags: DIFlagPrototyped, spFlags: 0)
!605 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !606, file: !378, line: 1169)
!606 = !DISubprogram(name: "nearbyintl", scope: !375, file: !375, line: 294, type: !440, flags: DIFlagPrototyped, spFlags: 0)
!607 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !608, file: !378, line: 1171)
!608 = !DISubprogram(name: "nextafter", scope: !375, file: !375, line: 259, type: !385, flags: DIFlagPrototyped, spFlags: 0)
!609 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !610, file: !378, line: 1172)
!610 = !DISubprogram(name: "nextafterf", scope: !375, file: !375, line: 259, type: !199, flags: DIFlagPrototyped, spFlags: 0)
!611 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !612, file: !378, line: 1173)
!612 = !DISubprogram(name: "nextafterl", scope: !375, file: !375, line: 259, type: !467, flags: DIFlagPrototyped, spFlags: 0)
!613 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !614, file: !378, line: 1175)
!614 = !DISubprogram(name: "nexttoward", scope: !375, file: !375, line: 261, type: !615, flags: DIFlagPrototyped, spFlags: 0)
!615 = !DISubroutineType(types: !616)
!616 = !{!149, !149, !442}
!617 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !618, file: !378, line: 1176)
!618 = !DISubprogram(name: "nexttowardf", scope: !375, file: !375, line: 261, type: !619, flags: DIFlagPrototyped, spFlags: 0)
!619 = !DISubroutineType(types: !620)
!620 = !{!188, !188, !442}
!621 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !622, file: !378, line: 1177)
!622 = !DISubprogram(name: "nexttowardl", scope: !375, file: !375, line: 261, type: !467, flags: DIFlagPrototyped, spFlags: 0)
!623 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !624, file: !378, line: 1179)
!624 = !DISubprogram(name: "remainder", scope: !375, file: !375, line: 272, type: !385, flags: DIFlagPrototyped, spFlags: 0)
!625 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !626, file: !378, line: 1180)
!626 = !DISubprogram(name: "remainderf", scope: !375, file: !375, line: 272, type: !199, flags: DIFlagPrototyped, spFlags: 0)
!627 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !628, file: !378, line: 1181)
!628 = !DISubprogram(name: "remainderl", scope: !375, file: !375, line: 272, type: !467, flags: DIFlagPrototyped, spFlags: 0)
!629 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !630, file: !378, line: 1183)
!630 = !DISubprogram(name: "remquo", scope: !375, file: !375, line: 307, type: !631, flags: DIFlagPrototyped, spFlags: 0)
!631 = !DISubroutineType(types: !632)
!632 = !{!149, !149, !149, !247}
!633 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !634, file: !378, line: 1184)
!634 = !DISubprogram(name: "remquof", scope: !375, file: !375, line: 307, type: !341, flags: DIFlagPrototyped, spFlags: 0)
!635 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !636, file: !378, line: 1185)
!636 = !DISubprogram(name: "remquol", scope: !375, file: !375, line: 307, type: !637, flags: DIFlagPrototyped, spFlags: 0)
!637 = !DISubroutineType(types: !638)
!638 = !{!442, !442, !442, !247}
!639 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !640, file: !378, line: 1187)
!640 = !DISubprogram(name: "rint", scope: !375, file: !375, line: 256, type: !376, flags: DIFlagPrototyped, spFlags: 0)
!641 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !642, file: !378, line: 1188)
!642 = !DISubprogram(name: "rintf", scope: !375, file: !375, line: 256, type: !186, flags: DIFlagPrototyped, spFlags: 0)
!643 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !644, file: !378, line: 1189)
!644 = !DISubprogram(name: "rintl", scope: !375, file: !375, line: 256, type: !440, flags: DIFlagPrototyped, spFlags: 0)
!645 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !646, file: !378, line: 1191)
!646 = !DISubprogram(name: "round", scope: !375, file: !375, line: 298, type: !376, flags: DIFlagPrototyped, spFlags: 0)
!647 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !648, file: !378, line: 1192)
!648 = !DISubprogram(name: "roundf", scope: !375, file: !375, line: 298, type: !186, flags: DIFlagPrototyped, spFlags: 0)
!649 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !650, file: !378, line: 1193)
!650 = !DISubprogram(name: "roundl", scope: !375, file: !375, line: 298, type: !440, flags: DIFlagPrototyped, spFlags: 0)
!651 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !652, file: !378, line: 1195)
!652 = !DISubprogram(name: "scalbln", scope: !375, file: !375, line: 290, type: !653, flags: DIFlagPrototyped, spFlags: 0)
!653 = !DISubroutineType(types: !654)
!654 = !{!149, !149, !281}
!655 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !656, file: !378, line: 1196)
!656 = !DISubprogram(name: "scalblnf", scope: !375, file: !375, line: 290, type: !349, flags: DIFlagPrototyped, spFlags: 0)
!657 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !658, file: !378, line: 1197)
!658 = !DISubprogram(name: "scalblnl", scope: !375, file: !375, line: 290, type: !659, flags: DIFlagPrototyped, spFlags: 0)
!659 = !DISubroutineType(types: !660)
!660 = !{!442, !442, !281}
!661 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !662, file: !378, line: 1199)
!662 = !DISubprogram(name: "scalbn", scope: !375, file: !375, line: 276, type: !407, flags: DIFlagPrototyped, spFlags: 0)
!663 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !664, file: !378, line: 1200)
!664 = !DISubprogram(name: "scalbnf", scope: !375, file: !375, line: 276, type: !284, flags: DIFlagPrototyped, spFlags: 0)
!665 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !666, file: !378, line: 1201)
!666 = !DISubprogram(name: "scalbnl", scope: !375, file: !375, line: 276, type: !667, flags: DIFlagPrototyped, spFlags: 0)
!667 = !DISubroutineType(types: !668)
!668 = !{!442, !442, !183}
!669 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !670, file: !378, line: 1203)
!670 = !DISubprogram(name: "tgamma", scope: !375, file: !375, line: 235, type: !376, flags: DIFlagPrototyped, spFlags: 0)
!671 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !672, file: !378, line: 1204)
!672 = !DISubprogram(name: "tgammaf", scope: !375, file: !375, line: 235, type: !186, flags: DIFlagPrototyped, spFlags: 0)
!673 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !674, file: !378, line: 1205)
!674 = !DISubprogram(name: "tgammal", scope: !375, file: !375, line: 235, type: !440, flags: DIFlagPrototyped, spFlags: 0)
!675 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !676, file: !378, line: 1207)
!676 = !DISubprogram(name: "trunc", scope: !375, file: !375, line: 302, type: !376, flags: DIFlagPrototyped, spFlags: 0)
!677 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !678, file: !378, line: 1208)
!678 = !DISubprogram(name: "truncf", scope: !375, file: !375, line: 302, type: !186, flags: DIFlagPrototyped, spFlags: 0)
!679 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !680, file: !378, line: 1209)
!680 = !DISubprogram(name: "truncl", scope: !375, file: !375, line: 302, type: !440, flags: DIFlagPrototyped, spFlags: 0)
!681 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !682, file: !684, line: 127)
!682 = !DIDerivedType(tag: DW_TAG_typedef, name: "div_t", file: !371, line: 62, baseType: !683)
!683 = !DICompositeType(tag: DW_TAG_structure_type, file: !371, line: 58, size: 64, flags: DIFlagFwdDecl, identifier: "_ZTS5div_t")
!684 = !DIFile(filename: "/usr/bin/../lib/gcc/x86_64-linux-gnu/9/../../../../include/c++/9/cstdlib", directory: "")
!685 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !686, file: !684, line: 128)
!686 = !DIDerivedType(tag: DW_TAG_typedef, name: "ldiv_t", file: !371, line: 70, baseType: !687)
!687 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !371, line: 66, size: 128, flags: DIFlagTypePassByValue, elements: !688, identifier: "_ZTS6ldiv_t")
!688 = !{!689, !690}
!689 = !DIDerivedType(tag: DW_TAG_member, name: "quot", scope: !687, file: !371, line: 68, baseType: !281, size: 64)
!690 = !DIDerivedType(tag: DW_TAG_member, name: "rem", scope: !687, file: !371, line: 69, baseType: !281, size: 64, offset: 64)
!691 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !692, file: !684, line: 130)
!692 = !DISubprogram(name: "abort", scope: !371, file: !371, line: 591, type: !693, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: 0)
!693 = !DISubroutineType(types: !694)
!694 = !{null}
!695 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !696, file: !684, line: 134)
!696 = !DISubprogram(name: "atexit", scope: !371, file: !371, line: 595, type: !697, flags: DIFlagPrototyped, spFlags: 0)
!697 = !DISubroutineType(types: !698)
!698 = !{!183, !699}
!699 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !693, size: 64)
!700 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !701, file: !684, line: 137)
!701 = !DISubprogram(name: "at_quick_exit", scope: !371, file: !371, line: 600, type: !697, flags: DIFlagPrototyped, spFlags: 0)
!702 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !703, file: !684, line: 140)
!703 = !DISubprogram(name: "atof", scope: !371, file: !371, line: 101, type: !322, flags: DIFlagPrototyped, spFlags: 0)
!704 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !705, file: !684, line: 141)
!705 = !DISubprogram(name: "atoi", scope: !371, file: !371, line: 104, type: !706, flags: DIFlagPrototyped, spFlags: 0)
!706 = !DISubroutineType(types: !707)
!707 = !{!183, !324}
!708 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !709, file: !684, line: 142)
!709 = !DISubprogram(name: "atol", scope: !371, file: !371, line: 107, type: !710, flags: DIFlagPrototyped, spFlags: 0)
!710 = !DISubroutineType(types: !711)
!711 = !{!281, !324}
!712 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !713, file: !684, line: 143)
!713 = !DISubprogram(name: "bsearch", scope: !371, file: !371, line: 820, type: !714, flags: DIFlagPrototyped, spFlags: 0)
!714 = !DISubroutineType(types: !715)
!715 = !{!151, !716, !716, !718, !718, !721}
!716 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !717, size: 64)
!717 = !DIDerivedType(tag: DW_TAG_const_type, baseType: null)
!718 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !719, line: 46, baseType: !720)
!719 = !DIFile(filename: "/usr/lib/llvm-14/lib/clang/14.0.6/include/stddef.h", directory: "")
!720 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!721 = !DIDerivedType(tag: DW_TAG_typedef, name: "__compar_fn_t", file: !371, line: 808, baseType: !722)
!722 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !723, size: 64)
!723 = !DISubroutineType(types: !724)
!724 = !{!183, !716, !716}
!725 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !726, file: !684, line: 144)
!726 = !DISubprogram(name: "calloc", scope: !371, file: !371, line: 542, type: !727, flags: DIFlagPrototyped, spFlags: 0)
!727 = !DISubroutineType(types: !728)
!728 = !{!151, !718, !718}
!729 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !730, file: !684, line: 145)
!730 = !DISubprogram(name: "div", scope: !371, file: !371, line: 852, type: !731, flags: DIFlagPrototyped, spFlags: 0)
!731 = !DISubroutineType(types: !732)
!732 = !{!682, !183, !183}
!733 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !734, file: !684, line: 146)
!734 = !DISubprogram(name: "exit", scope: !371, file: !371, line: 617, type: !735, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: 0)
!735 = !DISubroutineType(types: !736)
!736 = !{null, !183}
!737 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !738, file: !684, line: 147)
!738 = !DISubprogram(name: "free", scope: !371, file: !371, line: 565, type: !739, flags: DIFlagPrototyped, spFlags: 0)
!739 = !DISubroutineType(types: !740)
!740 = !{null, !151}
!741 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !742, file: !684, line: 148)
!742 = !DISubprogram(name: "getenv", scope: !371, file: !371, line: 634, type: !743, flags: DIFlagPrototyped, spFlags: 0)
!743 = !DISubroutineType(types: !744)
!744 = !{!745, !324}
!745 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !326, size: 64)
!746 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !747, file: !684, line: 149)
!747 = !DISubprogram(name: "labs", scope: !371, file: !371, line: 841, type: !279, flags: DIFlagPrototyped, spFlags: 0)
!748 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !749, file: !684, line: 150)
!749 = !DISubprogram(name: "ldiv", scope: !371, file: !371, line: 854, type: !750, flags: DIFlagPrototyped, spFlags: 0)
!750 = !DISubroutineType(types: !751)
!751 = !{!686, !281, !281}
!752 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !753, file: !684, line: 151)
!753 = !DISubprogram(name: "malloc", scope: !371, file: !371, line: 539, type: !754, flags: DIFlagPrototyped, spFlags: 0)
!754 = !DISubroutineType(types: !755)
!755 = !{!151, !718}
!756 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !757, file: !684, line: 153)
!757 = !DISubprogram(name: "mblen", scope: !371, file: !371, line: 922, type: !758, flags: DIFlagPrototyped, spFlags: 0)
!758 = !DISubroutineType(types: !759)
!759 = !{!183, !324, !718}
!760 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !761, file: !684, line: 154)
!761 = !DISubprogram(name: "mbstowcs", scope: !371, file: !371, line: 933, type: !762, flags: DIFlagPrototyped, spFlags: 0)
!762 = !DISubroutineType(types: !763)
!763 = !{!718, !764, !767, !718}
!764 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !765)
!765 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !766, size: 64)
!766 = !DIBasicType(name: "wchar_t", size: 32, encoding: DW_ATE_signed)
!767 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !324)
!768 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !769, file: !684, line: 155)
!769 = !DISubprogram(name: "mbtowc", scope: !371, file: !371, line: 925, type: !770, flags: DIFlagPrototyped, spFlags: 0)
!770 = !DISubroutineType(types: !771)
!771 = !{!183, !764, !767, !718}
!772 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !773, file: !684, line: 157)
!773 = !DISubprogram(name: "qsort", scope: !371, file: !371, line: 830, type: !774, flags: DIFlagPrototyped, spFlags: 0)
!774 = !DISubroutineType(types: !775)
!775 = !{null, !151, !718, !718, !721}
!776 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !777, file: !684, line: 160)
!777 = !DISubprogram(name: "quick_exit", scope: !371, file: !371, line: 623, type: !735, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: 0)
!778 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !779, file: !684, line: 163)
!779 = !DISubprogram(name: "rand", scope: !371, file: !371, line: 453, type: !780, flags: DIFlagPrototyped, spFlags: 0)
!780 = !DISubroutineType(types: !781)
!781 = !{!183}
!782 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !783, file: !684, line: 164)
!783 = !DISubprogram(name: "realloc", scope: !371, file: !371, line: 550, type: !784, flags: DIFlagPrototyped, spFlags: 0)
!784 = !DISubroutineType(types: !785)
!785 = !{!151, !151, !718}
!786 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !787, file: !684, line: 165)
!787 = !DISubprogram(name: "srand", scope: !371, file: !371, line: 455, type: !788, flags: DIFlagPrototyped, spFlags: 0)
!788 = !DISubroutineType(types: !789)
!789 = !{null, !13}
!790 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !791, file: !684, line: 166)
!791 = !DISubprogram(name: "strtod", scope: !371, file: !371, line: 117, type: !792, flags: DIFlagPrototyped, spFlags: 0)
!792 = !DISubroutineType(types: !793)
!793 = !{!149, !767, !794}
!794 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !795)
!795 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !745, size: 64)
!796 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !797, file: !684, line: 167)
!797 = !DISubprogram(name: "strtol", scope: !371, file: !371, line: 176, type: !798, flags: DIFlagPrototyped, spFlags: 0)
!798 = !DISubroutineType(types: !799)
!799 = !{!281, !767, !794, !183}
!800 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !801, file: !684, line: 168)
!801 = !DISubprogram(name: "strtoul", scope: !371, file: !371, line: 180, type: !802, flags: DIFlagPrototyped, spFlags: 0)
!802 = !DISubroutineType(types: !803)
!803 = !{!720, !767, !794, !183}
!804 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !805, file: !684, line: 169)
!805 = !DISubprogram(name: "system", scope: !371, file: !371, line: 784, type: !706, flags: DIFlagPrototyped, spFlags: 0)
!806 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !807, file: !684, line: 171)
!807 = !DISubprogram(name: "wcstombs", scope: !371, file: !371, line: 936, type: !808, flags: DIFlagPrototyped, spFlags: 0)
!808 = !DISubroutineType(types: !809)
!809 = !{!718, !810, !811, !718}
!810 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !745)
!811 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !812)
!812 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !813, size: 64)
!813 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !766)
!814 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !815, file: !684, line: 172)
!815 = !DISubprogram(name: "wctomb", scope: !371, file: !371, line: 929, type: !816, flags: DIFlagPrototyped, spFlags: 0)
!816 = !DISubroutineType(types: !817)
!817 = !{!183, !745, !766}
!818 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !819, entity: !820, file: !684, line: 200)
!819 = !DINamespace(name: "__gnu_cxx", scope: null)
!820 = !DIDerivedType(tag: DW_TAG_typedef, name: "lldiv_t", file: !371, line: 80, baseType: !821)
!821 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !371, line: 76, size: 128, flags: DIFlagTypePassByValue, elements: !822, identifier: "_ZTS7lldiv_t")
!822 = !{!823, !824}
!823 = !DIDerivedType(tag: DW_TAG_member, name: "quot", scope: !821, file: !371, line: 78, baseType: !292, size: 64)
!824 = !DIDerivedType(tag: DW_TAG_member, name: "rem", scope: !821, file: !371, line: 79, baseType: !292, size: 64, offset: 64)
!825 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !819, entity: !826, file: !684, line: 206)
!826 = !DISubprogram(name: "_Exit", scope: !371, file: !371, line: 629, type: !735, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: 0)
!827 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !819, entity: !828, file: !684, line: 210)
!828 = !DISubprogram(name: "llabs", scope: !371, file: !371, line: 844, type: !290, flags: DIFlagPrototyped, spFlags: 0)
!829 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !819, entity: !830, file: !684, line: 216)
!830 = !DISubprogram(name: "lldiv", scope: !371, file: !371, line: 858, type: !831, flags: DIFlagPrototyped, spFlags: 0)
!831 = !DISubroutineType(types: !832)
!832 = !{!820, !292, !292}
!833 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !819, entity: !834, file: !684, line: 227)
!834 = !DISubprogram(name: "atoll", scope: !371, file: !371, line: 112, type: !835, flags: DIFlagPrototyped, spFlags: 0)
!835 = !DISubroutineType(types: !836)
!836 = !{!292, !324}
!837 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !819, entity: !838, file: !684, line: 228)
!838 = !DISubprogram(name: "strtoll", scope: !371, file: !371, line: 200, type: !839, flags: DIFlagPrototyped, spFlags: 0)
!839 = !DISubroutineType(types: !840)
!840 = !{!292, !767, !794, !183}
!841 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !819, entity: !842, file: !684, line: 229)
!842 = !DISubprogram(name: "strtoull", scope: !371, file: !371, line: 205, type: !843, flags: DIFlagPrototyped, spFlags: 0)
!843 = !DISubroutineType(types: !844)
!844 = !{!845, !767, !794, !183}
!845 = !DIBasicType(name: "unsigned long long", size: 64, encoding: DW_ATE_unsigned)
!846 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !819, entity: !847, file: !684, line: 231)
!847 = !DISubprogram(name: "strtof", scope: !371, file: !371, line: 123, type: !848, flags: DIFlagPrototyped, spFlags: 0)
!848 = !DISubroutineType(types: !849)
!849 = !{!188, !767, !794}
!850 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !819, entity: !851, file: !684, line: 232)
!851 = !DISubprogram(name: "strtold", scope: !371, file: !371, line: 126, type: !852, flags: DIFlagPrototyped, spFlags: 0)
!852 = !DISubroutineType(types: !853)
!853 = !{!442, !767, !794}
!854 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !820, file: !684, line: 240)
!855 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !826, file: !684, line: 242)
!856 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !828, file: !684, line: 244)
!857 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !858, file: !684, line: 245)
!858 = !DISubprogram(name: "div", linkageName: "_ZN9__gnu_cxx3divExx", scope: !819, file: !684, line: 213, type: !831, flags: DIFlagPrototyped, spFlags: 0)
!859 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !830, file: !684, line: 246)
!860 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !834, file: !684, line: 248)
!861 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !847, file: !684, line: 249)
!862 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !838, file: !684, line: 250)
!863 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !842, file: !684, line: 251)
!864 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !851, file: !684, line: 252)
!865 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !692, file: !866, line: 38)
!866 = !DIFile(filename: "/usr/bin/../lib/gcc/x86_64-linux-gnu/9/../../../../include/c++/9/stdlib.h", directory: "")
!867 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !696, file: !866, line: 39)
!868 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !734, file: !866, line: 40)
!869 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !701, file: !866, line: 43)
!870 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !777, file: !866, line: 46)
!871 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !682, file: !866, line: 51)
!872 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !686, file: !866, line: 52)
!873 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !874, file: !866, line: 54)
!874 = !DISubprogram(name: "abs", linkageName: "_ZSt3abse", scope: !178, file: !372, line: 79, type: !440, flags: DIFlagPrototyped, spFlags: 0)
!875 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !703, file: !866, line: 55)
!876 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !705, file: !866, line: 56)
!877 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !709, file: !866, line: 57)
!878 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !713, file: !866, line: 58)
!879 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !726, file: !866, line: 59)
!880 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !858, file: !866, line: 60)
!881 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !738, file: !866, line: 61)
!882 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !742, file: !866, line: 62)
!883 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !747, file: !866, line: 63)
!884 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !749, file: !866, line: 64)
!885 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !753, file: !866, line: 65)
!886 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !757, file: !866, line: 67)
!887 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !761, file: !866, line: 68)
!888 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !769, file: !866, line: 69)
!889 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !773, file: !866, line: 71)
!890 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !779, file: !866, line: 72)
!891 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !783, file: !866, line: 73)
!892 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !787, file: !866, line: 74)
!893 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !791, file: !866, line: 75)
!894 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !797, file: !866, line: 76)
!895 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !801, file: !866, line: 77)
!896 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !805, file: !866, line: 78)
!897 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !807, file: !866, line: 80)
!898 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !815, file: !866, line: 81)
!899 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !900, file: !902, line: 443)
!900 = !DISubprogram(name: "acosf", linkageName: "_ZL5acosff", scope: !901, file: !901, line: 59, type: !186, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!901 = !DIFile(filename: "/usr/lib/llvm-14/lib/clang/14.0.6/include/__clang_cuda_math.h", directory: "")
!902 = !DIFile(filename: "/usr/lib/llvm-14/lib/clang/14.0.6/include/__clang_cuda_cmath.h", directory: "")
!903 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !904, file: !902, line: 444)
!904 = !DISubprogram(name: "acoshf", linkageName: "_ZL6acoshff", scope: !901, file: !901, line: 61, type: !186, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!905 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !906, file: !902, line: 445)
!906 = !DISubprogram(name: "asinf", linkageName: "_ZL5asinff", scope: !901, file: !901, line: 63, type: !186, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!907 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !908, file: !902, line: 446)
!908 = !DISubprogram(name: "asinhf", linkageName: "_ZL6asinhff", scope: !901, file: !901, line: 65, type: !186, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!909 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !910, file: !902, line: 447)
!910 = !DISubprogram(name: "atan2f", linkageName: "_ZL6atan2fff", scope: !901, file: !901, line: 68, type: !199, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!911 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !912, file: !902, line: 448)
!912 = !DISubprogram(name: "atanf", linkageName: "_ZL5atanff", scope: !901, file: !901, line: 69, type: !186, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!913 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !914, file: !902, line: 449)
!914 = !DISubprogram(name: "atanhf", linkageName: "_ZL6atanhff", scope: !901, file: !901, line: 71, type: !186, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!915 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !916, file: !902, line: 450)
!916 = !DISubprogram(name: "cbrtf", linkageName: "_ZL5cbrtff", scope: !901, file: !901, line: 73, type: !186, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!917 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !918, file: !902, line: 451)
!918 = !DISubprogram(name: "ceilf", linkageName: "_ZL5ceilff", scope: !901, file: !901, line: 75, type: !186, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!919 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !920, file: !902, line: 452)
!920 = !DISubprogram(name: "copysignf", linkageName: "_ZL9copysignfff", scope: !901, file: !901, line: 79, type: !199, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!921 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !922, file: !902, line: 453)
!922 = !DISubprogram(name: "cosf", linkageName: "_ZL4cosff", scope: !901, file: !901, line: 83, type: !186, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!923 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !924, file: !902, line: 454)
!924 = !DISubprogram(name: "coshf", linkageName: "_ZL5coshff", scope: !901, file: !901, line: 87, type: !186, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!925 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !926, file: !902, line: 455)
!926 = !DISubprogram(name: "erfcf", linkageName: "_ZL5erfcff", scope: !901, file: !901, line: 96, type: !186, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!927 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !928, file: !902, line: 456)
!928 = !DISubprogram(name: "erff", linkageName: "_ZL4erfff", scope: !901, file: !901, line: 101, type: !186, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!929 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !930, file: !902, line: 457)
!930 = !DISubprogram(name: "exp2f", linkageName: "_ZL5exp2ff", scope: !901, file: !901, line: 108, type: !186, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!931 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !932, file: !902, line: 458)
!932 = !DISubprogram(name: "expf", linkageName: "_ZL4expff", scope: !901, file: !901, line: 109, type: !186, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!933 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !934, file: !902, line: 459)
!934 = !DISubprogram(name: "expm1f", linkageName: "_ZL6expm1ff", scope: !901, file: !901, line: 111, type: !186, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!935 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !936, file: !902, line: 460)
!936 = !DISubprogram(name: "fabsf", linkageName: "_ZL5fabsff", scope: !901, file: !901, line: 112, type: !186, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!937 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !938, file: !902, line: 461)
!938 = !DISubprogram(name: "fdimf", linkageName: "_ZL5fdimfff", scope: !901, file: !901, line: 114, type: !199, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!939 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !940, file: !902, line: 462)
!940 = !DISubprogram(name: "floorf", linkageName: "_ZL6floorff", scope: !901, file: !901, line: 124, type: !186, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!941 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !942, file: !902, line: 463)
!942 = !DISubprogram(name: "fmaf", linkageName: "_ZL4fmaffff", scope: !901, file: !901, line: 128, type: !231, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!943 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !944, file: !902, line: 464)
!944 = !DISubprogram(name: "fmaxf", linkageName: "_ZL5fmaxfff", scope: !901, file: !901, line: 132, type: !199, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!945 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !946, file: !902, line: 465)
!946 = !DISubprogram(name: "fminf", linkageName: "_ZL5fminfff", scope: !901, file: !901, line: 134, type: !199, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!947 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !948, file: !902, line: 466)
!948 = !DISubprogram(name: "fmodf", linkageName: "_ZL5fmodfff", scope: !901, file: !901, line: 136, type: !199, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!949 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !950, file: !902, line: 467)
!950 = !DISubprogram(name: "frexpf", linkageName: "_ZL6frexpffPi", scope: !901, file: !901, line: 138, type: !245, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!951 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !952, file: !902, line: 468)
!952 = !DISubprogram(name: "hypotf", linkageName: "_ZL6hypotfff", scope: !901, file: !901, line: 140, type: !199, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!953 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !954, file: !902, line: 469)
!954 = !DISubprogram(name: "ilogbf", linkageName: "_ZL6ilogbff", scope: !901, file: !901, line: 142, type: !241, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!955 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !956, file: !902, line: 470)
!956 = !DISubprogram(name: "ldexpf", linkageName: "_ZL6ldexpffi", scope: !901, file: !901, line: 155, type: !284, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!957 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !958, file: !902, line: 471)
!958 = !DISubprogram(name: "lgammaf", linkageName: "_ZL7lgammaff", scope: !901, file: !901, line: 157, type: !186, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!959 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !960, file: !902, line: 472)
!960 = !DISubprogram(name: "llrintf", linkageName: "_ZL7llrintff", scope: !901, file: !901, line: 166, type: !295, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!961 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !962, file: !902, line: 473)
!962 = !DISubprogram(name: "llroundf", linkageName: "_ZL8llroundff", scope: !901, file: !901, line: 168, type: !295, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!963 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !964, file: !902, line: 474)
!964 = !DISubprogram(name: "log10f", linkageName: "_ZL6log10ff", scope: !901, file: !901, line: 173, type: !186, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!965 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !966, file: !902, line: 475)
!966 = !DISubprogram(name: "log1pf", linkageName: "_ZL6log1pff", scope: !901, file: !901, line: 175, type: !186, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!967 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !968, file: !902, line: 476)
!968 = !DISubprogram(name: "log2f", linkageName: "_ZL5log2ff", scope: !901, file: !901, line: 177, type: !186, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!969 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !970, file: !902, line: 477)
!970 = !DISubprogram(name: "logbf", linkageName: "_ZL5logbff", scope: !901, file: !901, line: 181, type: !186, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!971 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !972, file: !902, line: 478)
!972 = !DISubprogram(name: "logf", linkageName: "_ZL4logff", scope: !901, file: !901, line: 182, type: !186, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!973 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !974, file: !902, line: 479)
!974 = !DISubprogram(name: "lrintf", linkageName: "_ZL6lrintff", scope: !901, file: !901, line: 187, type: !309, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!975 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !976, file: !902, line: 480)
!976 = !DISubprogram(name: "lroundf", linkageName: "_ZL7lroundff", scope: !901, file: !901, line: 189, type: !309, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!977 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !978, file: !902, line: 481)
!978 = !DISubprogram(name: "modff", linkageName: "_ZL5modfffPf", scope: !901, file: !901, line: 199, type: !317, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!979 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !980, file: !902, line: 482)
!980 = !DISubprogram(name: "nearbyintf", linkageName: "_ZL10nearbyintff", scope: !901, file: !901, line: 201, type: !186, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!981 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !982, file: !902, line: 483)
!982 = !DISubprogram(name: "nextafterf", linkageName: "_ZL10nextafterfff", scope: !901, file: !901, line: 205, type: !199, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!983 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !984, file: !902, line: 484)
!984 = !DISubprogram(name: "powf", linkageName: "_ZL4powfff", scope: !901, file: !901, line: 231, type: !199, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!985 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !986, file: !902, line: 485)
!986 = !DISubprogram(name: "remainderf", linkageName: "_ZL10remainderfff", scope: !901, file: !901, line: 239, type: !199, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!987 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !988, file: !902, line: 486)
!988 = !DISubprogram(name: "remquof", linkageName: "_ZL7remquofffPi", scope: !901, file: !901, line: 245, type: !341, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!989 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !990, file: !902, line: 487)
!990 = !DISubprogram(name: "rintf", linkageName: "_ZL5rintff", scope: !901, file: !901, line: 256, type: !186, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!991 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !992, file: !902, line: 488)
!992 = !DISubprogram(name: "roundf", linkageName: "_ZL6roundff", scope: !901, file: !901, line: 170, type: !186, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!993 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !994, file: !902, line: 489)
!994 = !DISubprogram(name: "scalblnf", linkageName: "_ZL8scalblnffl", scope: !901, file: !901, line: 286, type: !349, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!995 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !996, file: !902, line: 490)
!996 = !DISubprogram(name: "scalbnf", linkageName: "_ZL7scalbnffi", scope: !901, file: !901, line: 278, type: !284, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!997 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !998, file: !902, line: 491)
!998 = !DISubprogram(name: "sinf", linkageName: "_ZL4sinff", scope: !901, file: !901, line: 306, type: !186, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!999 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !1000, file: !902, line: 492)
!1000 = !DISubprogram(name: "sinhf", linkageName: "_ZL5sinhff", scope: !901, file: !901, line: 310, type: !186, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!1001 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !1002, file: !902, line: 493)
!1002 = !DISubprogram(name: "sqrtf", linkageName: "_ZL5sqrtff", scope: !901, file: !901, line: 314, type: !186, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!1003 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !1004, file: !902, line: 494)
!1004 = !DISubprogram(name: "tanf", linkageName: "_ZL4tanff", scope: !901, file: !901, line: 316, type: !186, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!1005 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !1006, file: !902, line: 495)
!1006 = !DISubprogram(name: "tanhf", linkageName: "_ZL5tanhff", scope: !901, file: !901, line: 318, type: !186, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!1007 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !1008, file: !902, line: 496)
!1008 = !DISubprogram(name: "tgammaf", linkageName: "_ZL7tgammaff", scope: !901, file: !901, line: 320, type: !186, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!1009 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !1010, file: !902, line: 497)
!1010 = !DISubprogram(name: "truncf", linkageName: "_ZL6truncff", scope: !901, file: !901, line: 322, type: !186, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!1011 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !874, file: !1012, line: 38)
!1012 = !DIFile(filename: "/usr/bin/../lib/gcc/x86_64-linux-gnu/9/../../../../include/c++/9/math.h", directory: "")
!1013 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !1014, file: !1012, line: 54)
!1014 = !DISubprogram(name: "modf", linkageName: "_ZSt4modfePe", scope: !178, file: !378, line: 380, type: !1015, flags: DIFlagPrototyped, spFlags: 0)
!1015 = !DISubroutineType(types: !1016)
!1016 = !{!442, !442, !1017}
!1017 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !442, size: 64)
!1018 = !{!"Ubuntu clang version 14.0.6-++20221029082011+f28c006a5895-1~exp1~20221029202041.162"}
!1019 = distinct !DISubprogram(name: "vecAdd", linkageName: "_Z21__device_stub__vecAddPdS_S_i", scope: !1020, file: !1020, line: 6, type: !1021, scopeLine: 7, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !8, retainedNodes: !1023)
!1020 = !DIFile(filename: "vecadd.cu", directory: "/workspaces/cupbop-amd-playground/vector-add")
!1021 = !DISubroutineType(types: !1022)
!1022 = !{null, !148, !148, !148, !183}
!1023 = !{}
!1024 = !DILocalVariable(name: "a", arg: 1, scope: !1019, file: !1020, line: 6, type: !148)
!1025 = !DILocation(line: 6, column: 45, scope: !1019)
!1026 = !DILocalVariable(name: "b", arg: 2, scope: !1019, file: !1020, line: 6, type: !148)
!1027 = !DILocation(line: 6, column: 56, scope: !1019)
!1028 = !DILocalVariable(name: "c", arg: 3, scope: !1019, file: !1020, line: 6, type: !148)
!1029 = !DILocation(line: 6, column: 67, scope: !1019)
!1030 = !DILocalVariable(name: "n", arg: 4, scope: !1019, file: !1020, line: 6, type: !183)
!1031 = !DILocation(line: 6, column: 74, scope: !1019)
!1032 = !DILocation(line: 7, column: 1, scope: !1019)
!1033 = !DILocation(line: 13, column: 1, scope: !1019)
!1034 = distinct !DISubprogram(name: "main", scope: !1020, file: !1020, line: 15, type: !1035, scopeLine: 16, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !8, retainedNodes: !1023)
!1035 = !DISubroutineType(types: !1036)
!1036 = !{!183, !183, !795}
!1037 = !DILocalVariable(name: "argc", arg: 1, scope: !1034, file: !1020, line: 15, type: !183)
!1038 = !DILocation(line: 15, column: 14, scope: !1034)
!1039 = !DILocalVariable(name: "argv", arg: 2, scope: !1034, file: !1020, line: 15, type: !795)
!1040 = !DILocation(line: 15, column: 26, scope: !1034)
!1041 = !DILocalVariable(name: "n", scope: !1034, file: !1020, line: 18, type: !183)
!1042 = !DILocation(line: 18, column: 9, scope: !1034)
!1043 = !DILocalVariable(name: "h_a", scope: !1034, file: !1020, line: 21, type: !148)
!1044 = !DILocation(line: 21, column: 13, scope: !1034)
!1045 = !DILocalVariable(name: "h_b", scope: !1034, file: !1020, line: 22, type: !148)
!1046 = !DILocation(line: 22, column: 13, scope: !1034)
!1047 = !DILocalVariable(name: "h_c", scope: !1034, file: !1020, line: 25, type: !148)
!1048 = !DILocation(line: 25, column: 13, scope: !1034)
!1049 = !DILocalVariable(name: "d_a", scope: !1034, file: !1020, line: 28, type: !148)
!1050 = !DILocation(line: 28, column: 13, scope: !1034)
!1051 = !DILocalVariable(name: "d_b", scope: !1034, file: !1020, line: 29, type: !148)
!1052 = !DILocation(line: 29, column: 13, scope: !1034)
!1053 = !DILocalVariable(name: "d_c", scope: !1034, file: !1020, line: 32, type: !148)
!1054 = !DILocation(line: 32, column: 13, scope: !1034)
!1055 = !DILocalVariable(name: "bytes", scope: !1034, file: !1020, line: 35, type: !718)
!1056 = !DILocation(line: 35, column: 12, scope: !1034)
!1057 = !DILocation(line: 35, column: 20, scope: !1034)
!1058 = !DILocation(line: 35, column: 22, scope: !1034)
!1059 = !DILocation(line: 38, column: 28, scope: !1034)
!1060 = !DILocation(line: 38, column: 21, scope: !1034)
!1061 = !DILocation(line: 38, column: 11, scope: !1034)
!1062 = !DILocation(line: 38, column: 9, scope: !1034)
!1063 = !DILocation(line: 39, column: 28, scope: !1034)
!1064 = !DILocation(line: 39, column: 21, scope: !1034)
!1065 = !DILocation(line: 39, column: 11, scope: !1034)
!1066 = !DILocation(line: 39, column: 9, scope: !1034)
!1067 = !DILocation(line: 40, column: 28, scope: !1034)
!1068 = !DILocation(line: 40, column: 21, scope: !1034)
!1069 = !DILocation(line: 40, column: 11, scope: !1034)
!1070 = !DILocation(line: 40, column: 9, scope: !1034)
!1071 = !DILocation(line: 43, column: 22, scope: !1034)
!1072 = !DILocation(line: 43, column: 5, scope: !1034)
!1073 = !DILocation(line: 44, column: 22, scope: !1034)
!1074 = !DILocation(line: 44, column: 5, scope: !1034)
!1075 = !DILocation(line: 45, column: 22, scope: !1034)
!1076 = !DILocation(line: 45, column: 5, scope: !1034)
!1077 = !DILocalVariable(name: "i", scope: !1034, file: !1020, line: 47, type: !183)
!1078 = !DILocation(line: 47, column: 9, scope: !1034)
!1079 = !DILocation(line: 50, column: 12, scope: !1080)
!1080 = distinct !DILexicalBlock(scope: !1034, file: !1020, line: 50, column: 5)
!1081 = !DILocation(line: 50, column: 10, scope: !1080)
!1082 = !DILocation(line: 50, column: 17, scope: !1083)
!1083 = distinct !DILexicalBlock(scope: !1080, file: !1020, line: 50, column: 5)
!1084 = !DILocation(line: 50, column: 21, scope: !1083)
!1085 = !DILocation(line: 50, column: 19, scope: !1083)
!1086 = !DILocation(line: 50, column: 5, scope: !1080)
!1087 = !DILocation(line: 52, column: 22, scope: !1088)
!1088 = distinct !DILexicalBlock(scope: !1083, file: !1020, line: 51, column: 5)
!1089 = !DILocation(line: 52, column: 18, scope: !1088)
!1090 = !DILocation(line: 52, column: 31, scope: !1088)
!1091 = !DILocation(line: 52, column: 27, scope: !1088)
!1092 = !DILocation(line: 52, column: 25, scope: !1088)
!1093 = !DILocation(line: 52, column: 9, scope: !1088)
!1094 = !DILocation(line: 52, column: 13, scope: !1088)
!1095 = !DILocation(line: 52, column: 16, scope: !1088)
!1096 = !DILocation(line: 53, column: 22, scope: !1088)
!1097 = !DILocation(line: 53, column: 18, scope: !1088)
!1098 = !DILocation(line: 53, column: 31, scope: !1088)
!1099 = !DILocation(line: 53, column: 27, scope: !1088)
!1100 = !DILocation(line: 53, column: 25, scope: !1088)
!1101 = !DILocation(line: 53, column: 9, scope: !1088)
!1102 = !DILocation(line: 53, column: 13, scope: !1088)
!1103 = !DILocation(line: 53, column: 16, scope: !1088)
!1104 = !DILocation(line: 54, column: 5, scope: !1088)
!1105 = !DILocation(line: 50, column: 25, scope: !1083)
!1106 = !DILocation(line: 50, column: 5, scope: !1083)
!1107 = distinct !{!1107, !1086, !1108, !1109}
!1108 = !DILocation(line: 54, column: 5, scope: !1080)
!1109 = !{!"llvm.loop.mustprogress"}
!1110 = !DILocation(line: 57, column: 16, scope: !1034)
!1111 = !DILocation(line: 57, column: 21, scope: !1034)
!1112 = !DILocation(line: 57, column: 26, scope: !1034)
!1113 = !DILocation(line: 57, column: 5, scope: !1034)
!1114 = !DILocation(line: 58, column: 16, scope: !1034)
!1115 = !DILocation(line: 58, column: 21, scope: !1034)
!1116 = !DILocation(line: 58, column: 26, scope: !1034)
!1117 = !DILocation(line: 58, column: 5, scope: !1034)
!1118 = !DILocalVariable(name: "blockSize", scope: !1034, file: !1020, line: 60, type: !183)
!1119 = !DILocation(line: 60, column: 9, scope: !1034)
!1120 = !DILocalVariable(name: "gridSize", scope: !1034, file: !1020, line: 60, type: !183)
!1121 = !DILocation(line: 60, column: 20, scope: !1034)
!1122 = !DILocation(line: 63, column: 17, scope: !1034)
!1123 = !DILocation(line: 63, column: 15, scope: !1034)
!1124 = !DILocation(line: 66, column: 14, scope: !1034)
!1125 = !DILocation(line: 69, column: 14, scope: !1034)
!1126 = !DILocation(line: 69, column: 24, scope: !1034)
!1127 = !DILocation(line: 69, column: 11, scope: !1034)
!1128 = !DILocation(line: 69, column: 5, scope: !1034)
!1129 = !DILocation(line: 69, column: 37, scope: !1034)
!1130 = !DILocation(line: 69, column: 42, scope: !1034)
!1131 = !DILocation(line: 69, column: 47, scope: !1034)
!1132 = !DILocation(line: 69, column: 52, scope: !1034)
!1133 = !DILocation(line: 72, column: 16, scope: !1034)
!1134 = !DILocation(line: 72, column: 21, scope: !1034)
!1135 = !DILocation(line: 72, column: 26, scope: !1034)
!1136 = !DILocation(line: 72, column: 5, scope: !1034)
!1137 = !DILocalVariable(name: "sum", scope: !1034, file: !1020, line: 75, type: !149)
!1138 = !DILocation(line: 75, column: 12, scope: !1034)
!1139 = !DILocation(line: 76, column: 12, scope: !1140)
!1140 = distinct !DILexicalBlock(scope: !1034, file: !1020, line: 76, column: 5)
!1141 = !DILocation(line: 76, column: 10, scope: !1140)
!1142 = !DILocation(line: 76, column: 17, scope: !1143)
!1143 = distinct !DILexicalBlock(scope: !1140, file: !1020, line: 76, column: 5)
!1144 = !DILocation(line: 76, column: 21, scope: !1143)
!1145 = !DILocation(line: 76, column: 19, scope: !1143)
!1146 = !DILocation(line: 76, column: 5, scope: !1140)
!1147 = !DILocation(line: 77, column: 16, scope: !1143)
!1148 = !DILocation(line: 77, column: 20, scope: !1143)
!1149 = !DILocation(line: 77, column: 13, scope: !1143)
!1150 = !DILocation(line: 77, column: 9, scope: !1143)
!1151 = !DILocation(line: 76, column: 25, scope: !1143)
!1152 = !DILocation(line: 76, column: 5, scope: !1143)
!1153 = distinct !{!1153, !1146, !1154, !1109}
!1154 = !DILocation(line: 77, column: 21, scope: !1140)
!1155 = !DILocation(line: 78, column: 34, scope: !1034)
!1156 = !DILocation(line: 78, column: 40, scope: !1034)
!1157 = !DILocation(line: 78, column: 38, scope: !1034)
!1158 = !DILocation(line: 78, column: 5, scope: !1034)
!1159 = !DILocation(line: 81, column: 14, scope: !1034)
!1160 = !DILocation(line: 81, column: 5, scope: !1034)
!1161 = !DILocation(line: 82, column: 14, scope: !1034)
!1162 = !DILocation(line: 82, column: 5, scope: !1034)
!1163 = !DILocation(line: 83, column: 14, scope: !1034)
!1164 = !DILocation(line: 83, column: 5, scope: !1034)
!1165 = !DILocation(line: 86, column: 10, scope: !1034)
!1166 = !DILocation(line: 86, column: 5, scope: !1034)
!1167 = !DILocation(line: 87, column: 10, scope: !1034)
!1168 = !DILocation(line: 87, column: 5, scope: !1034)
!1169 = !DILocation(line: 88, column: 10, scope: !1034)
!1170 = !DILocation(line: 88, column: 5, scope: !1034)
!1171 = !DILocation(line: 90, column: 5, scope: !1034)
!1172 = distinct !DISubprogram(name: "cudaMalloc<double>", linkageName: "_ZL10cudaMallocIdE9cudaErrorPPT_m", scope: !1173, file: !1173, line: 679, type: !1174, scopeLine: 683, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !8, templateParams: !1178, retainedNodes: !1023)
!1173 = !DIFile(filename: "/usr/local/cuda/include/cuda_runtime.h", directory: "")
!1174 = !DISubroutineType(types: !1175)
!1175 = !{!1176, !1177, !718}
!1176 = !DIDerivedType(tag: DW_TAG_typedef, name: "cudaError_t", file: !12, line: 2790, baseType: !20)
!1177 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !148, size: 64)
!1178 = !{!1179}
!1179 = !DITemplateTypeParameter(name: "T", type: !149)
!1180 = !DILocalVariable(name: "devPtr", arg: 1, scope: !1172, file: !1173, line: 680, type: !1177)
!1181 = !DILocation(line: 680, column: 7, scope: !1172)
!1182 = !DILocalVariable(name: "size", arg: 2, scope: !1172, file: !1173, line: 681, type: !718)
!1183 = !DILocation(line: 681, column: 10, scope: !1172)
!1184 = !DILocation(line: 684, column: 38, scope: !1172)
!1185 = !DILocation(line: 684, column: 23, scope: !1172)
!1186 = !DILocation(line: 684, column: 46, scope: !1172)
!1187 = !DILocation(line: 684, column: 10, scope: !1172)
!1188 = !DILocation(line: 684, column: 3, scope: !1172)
!1189 = distinct !DISubprogram(name: "sin<int>", linkageName: "_ZSt3sinIiEN9__gnu_cxx11__enable_ifIXsr12__is_integerIT_EE7__valueEdE6__typeES2_", scope: !178, file: !378, line: 437, type: !1190, scopeLine: 438, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !8, templateParams: !1198, retainedNodes: !1023)
!1190 = !DISubroutineType(types: !1191)
!1191 = !{!1192, !183}
!1192 = !DIDerivedType(tag: DW_TAG_typedef, name: "__type", scope: !1194, file: !1193, line: 50, baseType: !149)
!1193 = !DIFile(filename: "/usr/bin/../lib/gcc/x86_64-linux-gnu/9/../../../../include/c++/9/ext/type_traits.h", directory: "")
!1194 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__enable_if<true, double>", scope: !819, file: !1193, line: 49, size: 8, flags: DIFlagTypePassByValue, elements: !1023, templateParams: !1195, identifier: "_ZTSN9__gnu_cxx11__enable_ifILb1EdEE")
!1195 = !{!1196, !1197}
!1196 = !DITemplateValueParameter(type: !256, value: i8 1)
!1197 = !DITemplateTypeParameter(type: !149)
!1198 = !{!1199}
!1199 = !DITemplateTypeParameter(name: "_Tp", type: !183)
!1200 = !DILocalVariable(name: "__x", arg: 1, scope: !1189, file: !378, line: 437, type: !183)
!1201 = !DILocation(line: 437, column: 13, scope: !1189)
!1202 = !DILocation(line: 438, column: 28, scope: !1189)
!1203 = !DILocation(line: 438, column: 14, scope: !1189)
!1204 = !DILocation(line: 438, column: 7, scope: !1189)
!1205 = distinct !DISubprogram(name: "cos<int>", linkageName: "_ZSt3cosIiEN9__gnu_cxx11__enable_ifIXsr12__is_integerIT_EE7__valueEdE6__typeES2_", scope: !178, file: !378, line: 196, type: !1190, scopeLine: 197, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !8, templateParams: !1198, retainedNodes: !1023)
!1206 = !DILocalVariable(name: "__x", arg: 1, scope: !1205, file: !378, line: 196, type: !183)
!1207 = !DILocation(line: 196, column: 13, scope: !1205)
!1208 = !DILocation(line: 197, column: 28, scope: !1205)
!1209 = !DILocation(line: 197, column: 14, scope: !1205)
!1210 = !DILocation(line: 197, column: 7, scope: !1205)
!1211 = distinct !DISubprogram(name: "dim3", linkageName: "_ZN4dim3C2Ejjj", scope: !152, file: !153, line: 423, type: !159, scopeLine: 423, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !8, declaration: !158, retainedNodes: !1023)
!1212 = !DILocalVariable(name: "this", arg: 1, scope: !1211, type: !1213, flags: DIFlagArtificial | DIFlagObjectPointer)
!1213 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !152, size: 64)
!1214 = !DILocation(line: 0, scope: !1211)
!1215 = !DILocalVariable(name: "vx", arg: 2, scope: !1211, file: !153, line: 423, type: !13)
!1216 = !DILocation(line: 423, column: 79, scope: !1211)
!1217 = !DILocalVariable(name: "vy", arg: 3, scope: !1211, file: !153, line: 423, type: !13)
!1218 = !DILocation(line: 423, column: 100, scope: !1211)
!1219 = !DILocalVariable(name: "vz", arg: 4, scope: !1211, file: !153, line: 423, type: !13)
!1220 = !DILocation(line: 423, column: 121, scope: !1211)
!1221 = !DILocation(line: 423, column: 131, scope: !1211)
!1222 = !DILocation(line: 423, column: 133, scope: !1211)
!1223 = !DILocation(line: 423, column: 138, scope: !1211)
!1224 = !DILocation(line: 423, column: 140, scope: !1211)
!1225 = !DILocation(line: 423, column: 145, scope: !1211)
!1226 = !DILocation(line: 423, column: 147, scope: !1211)
!1227 = !DILocation(line: 423, column: 152, scope: !1211)

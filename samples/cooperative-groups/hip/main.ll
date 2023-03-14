
; __CLANG_OFFLOAD_BUNDLE____START__ hip-amdgcn-amd-amdhsa-gfx90a
; ModuleID = 'main.cpp'
source_filename = "main.cpp"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%0 = type { ptr addrspace(1), i32, i32, i64, i64 }
%1 = type { i16, i16, i16, i16, i16, i16, i32, i32, i32, i32, i32, i64, ptr addrspace(1), i64, %2 }
%2 = type { i64 }
%3 = type { ptr addrspace(1), ptr addrspace(1), %2, i64, i64, i64 }
%4 = type { i64, i64, i32, i32 }
%5 = type { [64 x [8 x i64]] }
%6 = type { i64, %2, i64, i32, i32, i64, i64, %7, [2 x i32] }
%7 = type { ptr addrspace(1) }
%"struct.__HIP_Coordinates<__HIP_BlockIdx>::__X" = type { i8 }
%"struct.__HIP_Coordinates<__HIP_BlockDim>::__X" = type { i8 }
%"struct.__HIP_Coordinates<__HIP_ThreadIdx>::__X" = type { i8 }
%"struct.__HIP_Coordinates<__HIP_GridDim>::__X" = type { i8 }
%"struct.cooperative_groups::thread_group::_coalesced_info" = type { i64, i32, %"struct.cooperative_groups::thread_group::_tiled_info" }
%"struct.cooperative_groups::thread_group::_tiled_info" = type { i8, i32 }
%struct.HIP_vector_type = type { %struct.HIP_vector_base }
%struct.HIP_vector_base = type { %union.anon }
%union.anon = type { <4 x i32> }

$_ZN17__HIP_CoordinatesI14__HIP_BlockIdxE1xE = comdat any

$_ZN17__HIP_CoordinatesI14__HIP_BlockDimE1xE = comdat any

$_ZN17__HIP_CoordinatesI15__HIP_ThreadIdxE1xE = comdat any

$_ZN17__HIP_CoordinatesI13__HIP_GridDimE1xE = comdat any

@__const.__assert_fail.fmt = private unnamed_addr addrspace(4) constant [47 x i8] c"%s:%u: %s: Device-side assertion `%s' failed.\0A\00", align 16
@_ZN17__HIP_CoordinatesI14__HIP_BlockIdxE1xE = weak protected addrspace(4) externally_initialized constant %"struct.__HIP_Coordinates<__HIP_BlockIdx>::__X" undef, comdat, align 1
@_ZN17__HIP_CoordinatesI14__HIP_BlockDimE1xE = weak protected addrspace(4) externally_initialized constant %"struct.__HIP_Coordinates<__HIP_BlockDim>::__X" undef, comdat, align 1
@_ZN17__HIP_CoordinatesI15__HIP_ThreadIdxE1xE = weak protected addrspace(4) externally_initialized constant %"struct.__HIP_Coordinates<__HIP_ThreadIdx>::__X" undef, comdat, align 1
@_ZN17__HIP_CoordinatesI13__HIP_GridDimE1xE = weak protected addrspace(4) externally_initialized constant %"struct.__HIP_Coordinates<__HIP_GridDim>::__X" undef, comdat, align 1
@temp = external hidden local_unnamed_addr addrspace(3) global [0 x i32], align 4
@.str = private unnamed_addr addrspace(4) constant [42 x i8] c"false && \22invalid cooperative group type\22\00", align 1
@.str.1 = private unnamed_addr addrspace(4) constant [68 x i8] c"/opt/rocm-5.2.0/include/hip/amd_detail/amd_hip_cooperative_groups.h\00", align 1
@__PRETTY_FUNCTION__._ZNK18cooperative_groups12thread_group11thread_rankEv = private unnamed_addr addrspace(4) constant [63 x i8] c"uint32_t cooperative_groups::thread_group::thread_rank() const\00", align 1
@__PRETTY_FUNCTION__._ZNK18cooperative_groups12thread_group4syncEv = private unnamed_addr addrspace(4) constant [52 x i8] c"void cooperative_groups::thread_group::sync() const\00", align 1
@llvm.compiler.used = appending addrspace(1) global [4 x ptr] [ptr addrspacecast (ptr addrspace(4) @_ZN17__HIP_CoordinatesI13__HIP_GridDimE1xE to ptr), ptr addrspacecast (ptr addrspace(4) @_ZN17__HIP_CoordinatesI14__HIP_BlockDimE1xE to ptr), ptr addrspacecast (ptr addrspace(4) @_ZN17__HIP_CoordinatesI14__HIP_BlockIdxE1xE to ptr), ptr addrspacecast (ptr addrspace(4) @_ZN17__HIP_CoordinatesI15__HIP_ThreadIdxE1xE to ptr)], section "llvm.metadata"

; Function Attrs: cold noreturn nounwind
declare void @llvm.trap() #0

; Function Attrs: convergent noinline norecurse noreturn nounwind
define internal fastcc void @__assert_fail(i32 noundef %0, ptr noundef %1) unnamed_addr #1 {
  %3 = alloca [47 x i8], align 16, addrspace(5)
  call void @llvm.lifetime.start.p5(i64 47, ptr addrspace(5) %3) #14
  call void @llvm.memcpy.p5.p4.i64(ptr addrspace(5) noundef align 16 dereferenceable(47) %3, ptr addrspace(4) noundef align 16 dereferenceable(47) @__const.__assert_fail.fmt, i64 47, i1 false)
  %4 = tail call ptr addrspace(4) @llvm.amdgcn.implicitarg.ptr()
  %5 = getelementptr inbounds i64, ptr addrspace(4) %4, i64 3
  %6 = load i64, ptr addrspace(4) %5, align 8, !tbaa !4
  %7 = inttoptr i64 %6 to ptr addrspace(1)
  %8 = addrspacecast ptr addrspace(1) %7 to ptr
  %9 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(ptr noundef %8, i64 noundef 33, i64 noundef 1, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #18
  br label %10

10:                                               ; preds = %10, %2
  %11 = phi ptr addrspace(5) [ %3, %2 ], [ %12, %10 ]
  %12 = getelementptr inbounds i8, ptr addrspace(5) %11, i32 1
  %13 = load i8, ptr addrspace(5) %11, align 1, !tbaa !8
  %14 = icmp eq i8 %13, 0
  br i1 %14, label %15, label %10, !llvm.loop !11

15:                                               ; preds = %10
  %16 = extractelement <2 x i64> %9, i64 0
  %17 = icmp eq ptr addrspace(5) %3, addrspacecast (ptr null to ptr addrspace(5))
  br i1 %17, label %18, label %22

18:                                               ; preds = %15
  %19 = and i64 %16, -225
  %20 = or i64 %19, 32
  %21 = call fastcc <2 x i64> @__ockl_hostcall_internal(ptr noundef %8, i64 noundef %20, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #18
  br label %463

22:                                               ; preds = %15
  %23 = addrspacecast ptr addrspace(5) %3 to ptr
  %24 = addrspacecast ptr addrspace(5) %12 to ptr
  %25 = ptrtoint ptr %24 to i64
  %26 = ptrtoint ptr %23 to i64
  %27 = sub i64 %25, %26
  %28 = shl i64 %27, 32
  %29 = ashr exact i64 %28, 32
  %30 = and i64 %16, 2
  %31 = and i64 %16, -3
  %32 = insertelement <2 x i64> <i64 poison, i64 0>, i64 %31, i64 0
  br label %33

33:                                               ; preds = %452, %22
  %34 = phi i64 [ %29, %22 ], [ %460, %452 ]
  %35 = phi ptr addrspace(5) [ %3, %22 ], [ %461, %452 ]
  %36 = phi <2 x i64> [ %32, %22 ], [ %459, %452 ]
  %37 = icmp ugt i64 %34, 56
  %38 = extractelement <2 x i64> %36, i64 0
  %39 = or i64 %38, %30
  %40 = insertelement <2 x i64> poison, i64 %39, i64 0
  %41 = select i1 %37, <2 x i64> %36, <2 x i64> %40
  %42 = call i64 @llvm.umin.i64(i64 %34, i64 56)
  %43 = trunc i64 %42 to i32
  %44 = extractelement <2 x i64> %41, i64 0
  %45 = icmp ugt i32 %43, 7
  br i1 %45, label %48, label %46

46:                                               ; preds = %33
  %47 = icmp eq i32 %43, 0
  br i1 %47, label %100, label %88

48:                                               ; preds = %33
  %49 = load i8, ptr addrspace(5) %35, align 1, !tbaa !13
  %50 = zext i8 %49 to i64
  %51 = getelementptr inbounds i8, ptr addrspace(5) %35, i32 1
  %52 = load i8, ptr addrspace(5) %51, align 1, !tbaa !13
  %53 = zext i8 %52 to i64
  %54 = shl nuw nsw i64 %53, 8
  %55 = or i64 %54, %50
  %56 = getelementptr inbounds i8, ptr addrspace(5) %35, i32 2
  %57 = load i8, ptr addrspace(5) %56, align 1, !tbaa !13
  %58 = zext i8 %57 to i64
  %59 = shl nuw nsw i64 %58, 16
  %60 = or i64 %55, %59
  %61 = getelementptr inbounds i8, ptr addrspace(5) %35, i32 3
  %62 = load i8, ptr addrspace(5) %61, align 1, !tbaa !13
  %63 = zext i8 %62 to i64
  %64 = shl nuw nsw i64 %63, 24
  %65 = or i64 %60, %64
  %66 = getelementptr inbounds i8, ptr addrspace(5) %35, i32 4
  %67 = load i8, ptr addrspace(5) %66, align 1, !tbaa !13
  %68 = zext i8 %67 to i64
  %69 = shl nuw nsw i64 %68, 32
  %70 = or i64 %65, %69
  %71 = getelementptr inbounds i8, ptr addrspace(5) %35, i32 5
  %72 = load i8, ptr addrspace(5) %71, align 1, !tbaa !13
  %73 = zext i8 %72 to i64
  %74 = shl nuw nsw i64 %73, 40
  %75 = or i64 %70, %74
  %76 = getelementptr inbounds i8, ptr addrspace(5) %35, i32 6
  %77 = load i8, ptr addrspace(5) %76, align 1, !tbaa !13
  %78 = zext i8 %77 to i64
  %79 = shl nuw nsw i64 %78, 48
  %80 = or i64 %75, %79
  %81 = getelementptr inbounds i8, ptr addrspace(5) %35, i32 7
  %82 = load i8, ptr addrspace(5) %81, align 1, !tbaa !13
  %83 = zext i8 %82 to i64
  %84 = shl nuw i64 %83, 56
  %85 = or i64 %80, %84
  %86 = add nsw i32 %43, -8
  %87 = getelementptr inbounds i8, ptr addrspace(5) %35, i32 8
  br label %100

88:                                               ; preds = %46, %88
  %89 = phi i32 [ %98, %88 ], [ 0, %46 ]
  %90 = phi i64 [ %97, %88 ], [ 0, %46 ]
  %91 = getelementptr inbounds i8, ptr addrspace(5) %35, i32 %89
  %92 = load i8, ptr addrspace(5) %91, align 1, !tbaa !13
  %93 = zext i8 %92 to i64
  %94 = shl i32 %89, 3
  %95 = zext i32 %94 to i64
  %96 = shl nuw i64 %93, %95
  %97 = or i64 %96, %90
  %98 = add nuw nsw i32 %89, 1
  %99 = icmp eq i32 %98, %43
  br i1 %99, label %100, label %88

100:                                              ; preds = %88, %48, %46
  %101 = phi ptr addrspace(5) [ %87, %48 ], [ %35, %46 ], [ %35, %88 ]
  %102 = phi i32 [ %86, %48 ], [ 0, %46 ], [ 0, %88 ]
  %103 = phi i64 [ %85, %48 ], [ 0, %46 ], [ %97, %88 ]
  %104 = icmp ugt i32 %102, 7
  br i1 %104, label %107, label %105

105:                                              ; preds = %100
  %106 = icmp eq i32 %102, 0
  br i1 %106, label %159, label %147

107:                                              ; preds = %100
  %108 = load i8, ptr addrspace(5) %101, align 1, !tbaa !13
  %109 = zext i8 %108 to i64
  %110 = getelementptr inbounds i8, ptr addrspace(5) %101, i32 1
  %111 = load i8, ptr addrspace(5) %110, align 1, !tbaa !13
  %112 = zext i8 %111 to i64
  %113 = shl nuw nsw i64 %112, 8
  %114 = or i64 %113, %109
  %115 = getelementptr inbounds i8, ptr addrspace(5) %101, i32 2
  %116 = load i8, ptr addrspace(5) %115, align 1, !tbaa !13
  %117 = zext i8 %116 to i64
  %118 = shl nuw nsw i64 %117, 16
  %119 = or i64 %114, %118
  %120 = getelementptr inbounds i8, ptr addrspace(5) %101, i32 3
  %121 = load i8, ptr addrspace(5) %120, align 1, !tbaa !13
  %122 = zext i8 %121 to i64
  %123 = shl nuw nsw i64 %122, 24
  %124 = or i64 %119, %123
  %125 = getelementptr inbounds i8, ptr addrspace(5) %101, i32 4
  %126 = load i8, ptr addrspace(5) %125, align 1, !tbaa !13
  %127 = zext i8 %126 to i64
  %128 = shl nuw nsw i64 %127, 32
  %129 = or i64 %124, %128
  %130 = getelementptr inbounds i8, ptr addrspace(5) %101, i32 5
  %131 = load i8, ptr addrspace(5) %130, align 1, !tbaa !13
  %132 = zext i8 %131 to i64
  %133 = shl nuw nsw i64 %132, 40
  %134 = or i64 %129, %133
  %135 = getelementptr inbounds i8, ptr addrspace(5) %101, i32 6
  %136 = load i8, ptr addrspace(5) %135, align 1, !tbaa !13
  %137 = zext i8 %136 to i64
  %138 = shl nuw nsw i64 %137, 48
  %139 = or i64 %134, %138
  %140 = getelementptr inbounds i8, ptr addrspace(5) %101, i32 7
  %141 = load i8, ptr addrspace(5) %140, align 1, !tbaa !13
  %142 = zext i8 %141 to i64
  %143 = shl nuw i64 %142, 56
  %144 = or i64 %139, %143
  %145 = add nsw i32 %102, -8
  %146 = getelementptr inbounds i8, ptr addrspace(5) %101, i32 8
  br label %159

147:                                              ; preds = %105, %147
  %148 = phi i32 [ %157, %147 ], [ 0, %105 ]
  %149 = phi i64 [ %156, %147 ], [ 0, %105 ]
  %150 = getelementptr inbounds i8, ptr addrspace(5) %101, i32 %148
  %151 = load i8, ptr addrspace(5) %150, align 1, !tbaa !13
  %152 = zext i8 %151 to i64
  %153 = shl i32 %148, 3
  %154 = zext i32 %153 to i64
  %155 = shl nuw i64 %152, %154
  %156 = or i64 %155, %149
  %157 = add nuw nsw i32 %148, 1
  %158 = icmp eq i32 %157, %102
  br i1 %158, label %159, label %147

159:                                              ; preds = %147, %107, %105
  %160 = phi ptr addrspace(5) [ %146, %107 ], [ %101, %105 ], [ %101, %147 ]
  %161 = phi i32 [ %145, %107 ], [ 0, %105 ], [ 0, %147 ]
  %162 = phi i64 [ %144, %107 ], [ 0, %105 ], [ %156, %147 ]
  %163 = icmp ugt i32 %161, 7
  br i1 %163, label %166, label %164

164:                                              ; preds = %159
  %165 = icmp eq i32 %161, 0
  br i1 %165, label %218, label %206

166:                                              ; preds = %159
  %167 = load i8, ptr addrspace(5) %160, align 1, !tbaa !13
  %168 = zext i8 %167 to i64
  %169 = getelementptr inbounds i8, ptr addrspace(5) %160, i32 1
  %170 = load i8, ptr addrspace(5) %169, align 1, !tbaa !13
  %171 = zext i8 %170 to i64
  %172 = shl nuw nsw i64 %171, 8
  %173 = or i64 %172, %168
  %174 = getelementptr inbounds i8, ptr addrspace(5) %160, i32 2
  %175 = load i8, ptr addrspace(5) %174, align 1, !tbaa !13
  %176 = zext i8 %175 to i64
  %177 = shl nuw nsw i64 %176, 16
  %178 = or i64 %173, %177
  %179 = getelementptr inbounds i8, ptr addrspace(5) %160, i32 3
  %180 = load i8, ptr addrspace(5) %179, align 1, !tbaa !13
  %181 = zext i8 %180 to i64
  %182 = shl nuw nsw i64 %181, 24
  %183 = or i64 %178, %182
  %184 = getelementptr inbounds i8, ptr addrspace(5) %160, i32 4
  %185 = load i8, ptr addrspace(5) %184, align 1, !tbaa !13
  %186 = zext i8 %185 to i64
  %187 = shl nuw nsw i64 %186, 32
  %188 = or i64 %183, %187
  %189 = getelementptr inbounds i8, ptr addrspace(5) %160, i32 5
  %190 = load i8, ptr addrspace(5) %189, align 1, !tbaa !13
  %191 = zext i8 %190 to i64
  %192 = shl nuw nsw i64 %191, 40
  %193 = or i64 %188, %192
  %194 = getelementptr inbounds i8, ptr addrspace(5) %160, i32 6
  %195 = load i8, ptr addrspace(5) %194, align 1, !tbaa !13
  %196 = zext i8 %195 to i64
  %197 = shl nuw nsw i64 %196, 48
  %198 = or i64 %193, %197
  %199 = getelementptr inbounds i8, ptr addrspace(5) %160, i32 7
  %200 = load i8, ptr addrspace(5) %199, align 1, !tbaa !13
  %201 = zext i8 %200 to i64
  %202 = shl nuw i64 %201, 56
  %203 = or i64 %198, %202
  %204 = add nsw i32 %161, -8
  %205 = getelementptr inbounds i8, ptr addrspace(5) %160, i32 8
  br label %218

206:                                              ; preds = %164, %206
  %207 = phi i32 [ %216, %206 ], [ 0, %164 ]
  %208 = phi i64 [ %215, %206 ], [ 0, %164 ]
  %209 = getelementptr inbounds i8, ptr addrspace(5) %160, i32 %207
  %210 = load i8, ptr addrspace(5) %209, align 1, !tbaa !13
  %211 = zext i8 %210 to i64
  %212 = shl i32 %207, 3
  %213 = zext i32 %212 to i64
  %214 = shl nuw i64 %211, %213
  %215 = or i64 %214, %208
  %216 = add nuw nsw i32 %207, 1
  %217 = icmp eq i32 %216, %161
  br i1 %217, label %218, label %206

218:                                              ; preds = %206, %166, %164
  %219 = phi ptr addrspace(5) [ %205, %166 ], [ %160, %164 ], [ %160, %206 ]
  %220 = phi i32 [ %204, %166 ], [ 0, %164 ], [ 0, %206 ]
  %221 = phi i64 [ %203, %166 ], [ 0, %164 ], [ %215, %206 ]
  %222 = icmp ugt i32 %220, 7
  br i1 %222, label %225, label %223

223:                                              ; preds = %218
  %224 = icmp eq i32 %220, 0
  br i1 %224, label %277, label %265

225:                                              ; preds = %218
  %226 = load i8, ptr addrspace(5) %219, align 1, !tbaa !13
  %227 = zext i8 %226 to i64
  %228 = getelementptr inbounds i8, ptr addrspace(5) %219, i32 1
  %229 = load i8, ptr addrspace(5) %228, align 1, !tbaa !13
  %230 = zext i8 %229 to i64
  %231 = shl nuw nsw i64 %230, 8
  %232 = or i64 %231, %227
  %233 = getelementptr inbounds i8, ptr addrspace(5) %219, i32 2
  %234 = load i8, ptr addrspace(5) %233, align 1, !tbaa !13
  %235 = zext i8 %234 to i64
  %236 = shl nuw nsw i64 %235, 16
  %237 = or i64 %232, %236
  %238 = getelementptr inbounds i8, ptr addrspace(5) %219, i32 3
  %239 = load i8, ptr addrspace(5) %238, align 1, !tbaa !13
  %240 = zext i8 %239 to i64
  %241 = shl nuw nsw i64 %240, 24
  %242 = or i64 %237, %241
  %243 = getelementptr inbounds i8, ptr addrspace(5) %219, i32 4
  %244 = load i8, ptr addrspace(5) %243, align 1, !tbaa !13
  %245 = zext i8 %244 to i64
  %246 = shl nuw nsw i64 %245, 32
  %247 = or i64 %242, %246
  %248 = getelementptr inbounds i8, ptr addrspace(5) %219, i32 5
  %249 = load i8, ptr addrspace(5) %248, align 1, !tbaa !13
  %250 = zext i8 %249 to i64
  %251 = shl nuw nsw i64 %250, 40
  %252 = or i64 %247, %251
  %253 = getelementptr inbounds i8, ptr addrspace(5) %219, i32 6
  %254 = load i8, ptr addrspace(5) %253, align 1, !tbaa !13
  %255 = zext i8 %254 to i64
  %256 = shl nuw nsw i64 %255, 48
  %257 = or i64 %252, %256
  %258 = getelementptr inbounds i8, ptr addrspace(5) %219, i32 7
  %259 = load i8, ptr addrspace(5) %258, align 1, !tbaa !13
  %260 = zext i8 %259 to i64
  %261 = shl nuw i64 %260, 56
  %262 = or i64 %257, %261
  %263 = add nsw i32 %220, -8
  %264 = getelementptr inbounds i8, ptr addrspace(5) %219, i32 8
  br label %277

265:                                              ; preds = %223, %265
  %266 = phi i32 [ %275, %265 ], [ 0, %223 ]
  %267 = phi i64 [ %274, %265 ], [ 0, %223 ]
  %268 = getelementptr inbounds i8, ptr addrspace(5) %219, i32 %266
  %269 = load i8, ptr addrspace(5) %268, align 1, !tbaa !13
  %270 = zext i8 %269 to i64
  %271 = shl i32 %266, 3
  %272 = zext i32 %271 to i64
  %273 = shl nuw i64 %270, %272
  %274 = or i64 %273, %267
  %275 = add nuw nsw i32 %266, 1
  %276 = icmp eq i32 %275, %220
  br i1 %276, label %277, label %265

277:                                              ; preds = %265, %225, %223
  %278 = phi ptr addrspace(5) [ %264, %225 ], [ %219, %223 ], [ %219, %265 ]
  %279 = phi i32 [ %263, %225 ], [ 0, %223 ], [ 0, %265 ]
  %280 = phi i64 [ %262, %225 ], [ 0, %223 ], [ %274, %265 ]
  %281 = icmp ugt i32 %279, 7
  br i1 %281, label %284, label %282

282:                                              ; preds = %277
  %283 = icmp eq i32 %279, 0
  br i1 %283, label %336, label %324

284:                                              ; preds = %277
  %285 = load i8, ptr addrspace(5) %278, align 1, !tbaa !13
  %286 = zext i8 %285 to i64
  %287 = getelementptr inbounds i8, ptr addrspace(5) %278, i32 1
  %288 = load i8, ptr addrspace(5) %287, align 1, !tbaa !13
  %289 = zext i8 %288 to i64
  %290 = shl nuw nsw i64 %289, 8
  %291 = or i64 %290, %286
  %292 = getelementptr inbounds i8, ptr addrspace(5) %278, i32 2
  %293 = load i8, ptr addrspace(5) %292, align 1, !tbaa !13
  %294 = zext i8 %293 to i64
  %295 = shl nuw nsw i64 %294, 16
  %296 = or i64 %291, %295
  %297 = getelementptr inbounds i8, ptr addrspace(5) %278, i32 3
  %298 = load i8, ptr addrspace(5) %297, align 1, !tbaa !13
  %299 = zext i8 %298 to i64
  %300 = shl nuw nsw i64 %299, 24
  %301 = or i64 %296, %300
  %302 = getelementptr inbounds i8, ptr addrspace(5) %278, i32 4
  %303 = load i8, ptr addrspace(5) %302, align 1, !tbaa !13
  %304 = zext i8 %303 to i64
  %305 = shl nuw nsw i64 %304, 32
  %306 = or i64 %301, %305
  %307 = getelementptr inbounds i8, ptr addrspace(5) %278, i32 5
  %308 = load i8, ptr addrspace(5) %307, align 1, !tbaa !13
  %309 = zext i8 %308 to i64
  %310 = shl nuw nsw i64 %309, 40
  %311 = or i64 %306, %310
  %312 = getelementptr inbounds i8, ptr addrspace(5) %278, i32 6
  %313 = load i8, ptr addrspace(5) %312, align 1, !tbaa !13
  %314 = zext i8 %313 to i64
  %315 = shl nuw nsw i64 %314, 48
  %316 = or i64 %311, %315
  %317 = getelementptr inbounds i8, ptr addrspace(5) %278, i32 7
  %318 = load i8, ptr addrspace(5) %317, align 1, !tbaa !13
  %319 = zext i8 %318 to i64
  %320 = shl nuw i64 %319, 56
  %321 = or i64 %316, %320
  %322 = add nsw i32 %279, -8
  %323 = getelementptr inbounds i8, ptr addrspace(5) %278, i32 8
  br label %336

324:                                              ; preds = %282, %324
  %325 = phi i32 [ %334, %324 ], [ 0, %282 ]
  %326 = phi i64 [ %333, %324 ], [ 0, %282 ]
  %327 = getelementptr inbounds i8, ptr addrspace(5) %278, i32 %325
  %328 = load i8, ptr addrspace(5) %327, align 1, !tbaa !13
  %329 = zext i8 %328 to i64
  %330 = shl i32 %325, 3
  %331 = zext i32 %330 to i64
  %332 = shl nuw i64 %329, %331
  %333 = or i64 %332, %326
  %334 = add nuw nsw i32 %325, 1
  %335 = icmp eq i32 %334, %279
  br i1 %335, label %336, label %324

336:                                              ; preds = %324, %284, %282
  %337 = phi ptr addrspace(5) [ %323, %284 ], [ %278, %282 ], [ %278, %324 ]
  %338 = phi i32 [ %322, %284 ], [ 0, %282 ], [ 0, %324 ]
  %339 = phi i64 [ %321, %284 ], [ 0, %282 ], [ %333, %324 ]
  %340 = icmp ugt i32 %338, 7
  br i1 %340, label %343, label %341

341:                                              ; preds = %336
  %342 = icmp eq i32 %338, 0
  br i1 %342, label %395, label %383

343:                                              ; preds = %336
  %344 = load i8, ptr addrspace(5) %337, align 1, !tbaa !13
  %345 = zext i8 %344 to i64
  %346 = getelementptr inbounds i8, ptr addrspace(5) %337, i32 1
  %347 = load i8, ptr addrspace(5) %346, align 1, !tbaa !13
  %348 = zext i8 %347 to i64
  %349 = shl nuw nsw i64 %348, 8
  %350 = or i64 %349, %345
  %351 = getelementptr inbounds i8, ptr addrspace(5) %337, i32 2
  %352 = load i8, ptr addrspace(5) %351, align 1, !tbaa !13
  %353 = zext i8 %352 to i64
  %354 = shl nuw nsw i64 %353, 16
  %355 = or i64 %350, %354
  %356 = getelementptr inbounds i8, ptr addrspace(5) %337, i32 3
  %357 = load i8, ptr addrspace(5) %356, align 1, !tbaa !13
  %358 = zext i8 %357 to i64
  %359 = shl nuw nsw i64 %358, 24
  %360 = or i64 %355, %359
  %361 = getelementptr inbounds i8, ptr addrspace(5) %337, i32 4
  %362 = load i8, ptr addrspace(5) %361, align 1, !tbaa !13
  %363 = zext i8 %362 to i64
  %364 = shl nuw nsw i64 %363, 32
  %365 = or i64 %360, %364
  %366 = getelementptr inbounds i8, ptr addrspace(5) %337, i32 5
  %367 = load i8, ptr addrspace(5) %366, align 1, !tbaa !13
  %368 = zext i8 %367 to i64
  %369 = shl nuw nsw i64 %368, 40
  %370 = or i64 %365, %369
  %371 = getelementptr inbounds i8, ptr addrspace(5) %337, i32 6
  %372 = load i8, ptr addrspace(5) %371, align 1, !tbaa !13
  %373 = zext i8 %372 to i64
  %374 = shl nuw nsw i64 %373, 48
  %375 = or i64 %370, %374
  %376 = getelementptr inbounds i8, ptr addrspace(5) %337, i32 7
  %377 = load i8, ptr addrspace(5) %376, align 1, !tbaa !13
  %378 = zext i8 %377 to i64
  %379 = shl nuw i64 %378, 56
  %380 = or i64 %375, %379
  %381 = add nsw i32 %338, -8
  %382 = getelementptr inbounds i8, ptr addrspace(5) %337, i32 8
  br label %395

383:                                              ; preds = %341, %383
  %384 = phi i32 [ %393, %383 ], [ 0, %341 ]
  %385 = phi i64 [ %392, %383 ], [ 0, %341 ]
  %386 = getelementptr inbounds i8, ptr addrspace(5) %337, i32 %384
  %387 = load i8, ptr addrspace(5) %386, align 1, !tbaa !13
  %388 = zext i8 %387 to i64
  %389 = shl i32 %384, 3
  %390 = zext i32 %389 to i64
  %391 = shl nuw i64 %388, %390
  %392 = or i64 %391, %385
  %393 = add nuw nsw i32 %384, 1
  %394 = icmp eq i32 %393, %338
  br i1 %394, label %395, label %383

395:                                              ; preds = %383, %343, %341
  %396 = phi ptr addrspace(5) [ %382, %343 ], [ %337, %341 ], [ %337, %383 ]
  %397 = phi i32 [ %381, %343 ], [ 0, %341 ], [ 0, %383 ]
  %398 = phi i64 [ %380, %343 ], [ 0, %341 ], [ %392, %383 ]
  %399 = icmp ugt i32 %397, 7
  br i1 %399, label %402, label %400

400:                                              ; preds = %395
  %401 = icmp eq i32 %397, 0
  br i1 %401, label %452, label %440

402:                                              ; preds = %395
  %403 = load i8, ptr addrspace(5) %396, align 1, !tbaa !13
  %404 = zext i8 %403 to i64
  %405 = getelementptr inbounds i8, ptr addrspace(5) %396, i32 1
  %406 = load i8, ptr addrspace(5) %405, align 1, !tbaa !13
  %407 = zext i8 %406 to i64
  %408 = shl nuw nsw i64 %407, 8
  %409 = or i64 %408, %404
  %410 = getelementptr inbounds i8, ptr addrspace(5) %396, i32 2
  %411 = load i8, ptr addrspace(5) %410, align 1, !tbaa !13
  %412 = zext i8 %411 to i64
  %413 = shl nuw nsw i64 %412, 16
  %414 = or i64 %409, %413
  %415 = getelementptr inbounds i8, ptr addrspace(5) %396, i32 3
  %416 = load i8, ptr addrspace(5) %415, align 1, !tbaa !13
  %417 = zext i8 %416 to i64
  %418 = shl nuw nsw i64 %417, 24
  %419 = or i64 %414, %418
  %420 = getelementptr inbounds i8, ptr addrspace(5) %396, i32 4
  %421 = load i8, ptr addrspace(5) %420, align 1, !tbaa !13
  %422 = zext i8 %421 to i64
  %423 = shl nuw nsw i64 %422, 32
  %424 = or i64 %419, %423
  %425 = getelementptr inbounds i8, ptr addrspace(5) %396, i32 5
  %426 = load i8, ptr addrspace(5) %425, align 1, !tbaa !13
  %427 = zext i8 %426 to i64
  %428 = shl nuw nsw i64 %427, 40
  %429 = or i64 %424, %428
  %430 = getelementptr inbounds i8, ptr addrspace(5) %396, i32 6
  %431 = load i8, ptr addrspace(5) %430, align 1, !tbaa !13
  %432 = zext i8 %431 to i64
  %433 = shl nuw nsw i64 %432, 48
  %434 = or i64 %429, %433
  %435 = getelementptr inbounds i8, ptr addrspace(5) %396, i32 7
  %436 = load i8, ptr addrspace(5) %435, align 1, !tbaa !13
  %437 = zext i8 %436 to i64
  %438 = shl nuw i64 %437, 56
  %439 = or i64 %434, %438
  br label %452

440:                                              ; preds = %400, %440
  %441 = phi i32 [ %450, %440 ], [ 0, %400 ]
  %442 = phi i64 [ %449, %440 ], [ 0, %400 ]
  %443 = getelementptr inbounds i8, ptr addrspace(5) %396, i32 %441
  %444 = load i8, ptr addrspace(5) %443, align 1, !tbaa !13
  %445 = zext i8 %444 to i64
  %446 = shl i32 %441, 3
  %447 = zext i32 %446 to i64
  %448 = shl nuw i64 %445, %447
  %449 = or i64 %448, %442
  %450 = add nuw nsw i32 %441, 1
  %451 = icmp eq i32 %450, %397
  br i1 %451, label %452, label %440

452:                                              ; preds = %440, %402, %400
  %453 = phi i64 [ %439, %402 ], [ 0, %400 ], [ %449, %440 ]
  %454 = shl nuw nsw i64 %42, 2
  %455 = add nuw nsw i64 %454, 28
  %456 = and i64 %455, 480
  %457 = and i64 %44, -225
  %458 = or i64 %457, %456
  %459 = call fastcc <2 x i64> @__ockl_hostcall_internal(ptr noundef %8, i64 noundef %458, i64 noundef %103, i64 noundef %162, i64 noundef %221, i64 noundef %280, i64 noundef %339, i64 noundef %398, i64 noundef %453) #18
  %460 = sub i64 %34, %42
  %461 = getelementptr inbounds i8, ptr addrspace(5) %35, i32 %43
  %462 = icmp eq i64 %460, 0
  br i1 %462, label %463, label %33

463:                                              ; preds = %452, %18
  %464 = phi <2 x i64> [ %21, %18 ], [ %459, %452 ]
  %465 = extractelement <2 x i64> %464, i64 0
  br i1 icmp eq (ptr addrspacecast (ptr addrspace(4) @.str.1 to ptr), ptr null), label %466, label %470

466:                                              ; preds = %463
  %467 = and i64 %465, -225
  %468 = or i64 %467, 32
  %469 = call fastcc <2 x i64> @__ockl_hostcall_internal(ptr noundef %8, i64 noundef %468, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #18
  br label %911

470:                                              ; preds = %463
  %471 = and i64 %465, 2
  %472 = and i64 %465, -3
  %473 = insertelement <2 x i64> <i64 poison, i64 0>, i64 %472, i64 0
  br label %474

474:                                              ; preds = %900, %470
  %475 = phi i64 [ ashr (i64 shl (i64 sub (i64 ptrtoint (ptr addrspacecast (ptr addrspace(4) getelementptr inbounds ([68 x i8], ptr addrspace(4) @.str.1, i64 1, i64 0) to ptr) to i64), i64 sext (i32 ptrtoint (ptr addrspacecast (ptr addrspace(4) @.str.1 to ptr) to i32) to i64)), i64 32), i64 32), %470 ], [ %908, %900 ]
  %476 = phi ptr addrspace(4) [ @.str.1, %470 ], [ %909, %900 ]
  %477 = phi <2 x i64> [ %473, %470 ], [ %907, %900 ]
  %478 = icmp ugt i64 %475, 56
  %479 = extractelement <2 x i64> %477, i64 0
  %480 = or i64 %479, %471
  %481 = insertelement <2 x i64> poison, i64 %480, i64 0
  %482 = select i1 %478, <2 x i64> %477, <2 x i64> %481
  %483 = call i64 @llvm.umin.i64(i64 %475, i64 56)
  %484 = trunc i64 %483 to i32
  %485 = extractelement <2 x i64> %482, i64 0
  %486 = icmp ugt i32 %484, 7
  br i1 %486, label %489, label %487

487:                                              ; preds = %474
  %488 = icmp eq i32 %484, 0
  br i1 %488, label %542, label %529

489:                                              ; preds = %474
  %490 = load i8, ptr addrspace(4) %476, align 1, !tbaa !13
  %491 = zext i8 %490 to i64
  %492 = getelementptr inbounds i8, ptr addrspace(4) %476, i64 1
  %493 = load i8, ptr addrspace(4) %492, align 1, !tbaa !13
  %494 = zext i8 %493 to i64
  %495 = shl nuw nsw i64 %494, 8
  %496 = or i64 %495, %491
  %497 = getelementptr inbounds i8, ptr addrspace(4) %476, i64 2
  %498 = load i8, ptr addrspace(4) %497, align 1, !tbaa !13
  %499 = zext i8 %498 to i64
  %500 = shl nuw nsw i64 %499, 16
  %501 = or i64 %496, %500
  %502 = getelementptr inbounds i8, ptr addrspace(4) %476, i64 3
  %503 = load i8, ptr addrspace(4) %502, align 1, !tbaa !13
  %504 = zext i8 %503 to i64
  %505 = shl nuw nsw i64 %504, 24
  %506 = or i64 %501, %505
  %507 = getelementptr inbounds i8, ptr addrspace(4) %476, i64 4
  %508 = load i8, ptr addrspace(4) %507, align 1, !tbaa !13
  %509 = zext i8 %508 to i64
  %510 = shl nuw nsw i64 %509, 32
  %511 = or i64 %506, %510
  %512 = getelementptr inbounds i8, ptr addrspace(4) %476, i64 5
  %513 = load i8, ptr addrspace(4) %512, align 1, !tbaa !13
  %514 = zext i8 %513 to i64
  %515 = shl nuw nsw i64 %514, 40
  %516 = or i64 %511, %515
  %517 = getelementptr inbounds i8, ptr addrspace(4) %476, i64 6
  %518 = load i8, ptr addrspace(4) %517, align 1, !tbaa !13
  %519 = zext i8 %518 to i64
  %520 = shl nuw nsw i64 %519, 48
  %521 = or i64 %516, %520
  %522 = getelementptr inbounds i8, ptr addrspace(4) %476, i64 7
  %523 = load i8, ptr addrspace(4) %522, align 1, !tbaa !13
  %524 = zext i8 %523 to i64
  %525 = shl nuw i64 %524, 56
  %526 = or i64 %521, %525
  %527 = add nsw i32 %484, -8
  %528 = getelementptr inbounds i8, ptr addrspace(4) %476, i64 8
  br label %542

529:                                              ; preds = %487, %529
  %530 = phi i32 [ %540, %529 ], [ 0, %487 ]
  %531 = phi i64 [ %539, %529 ], [ 0, %487 ]
  %532 = zext i32 %530 to i64
  %533 = getelementptr inbounds i8, ptr addrspace(4) %476, i64 %532
  %534 = load i8, ptr addrspace(4) %533, align 1, !tbaa !13
  %535 = zext i8 %534 to i64
  %536 = shl i32 %530, 3
  %537 = zext i32 %536 to i64
  %538 = shl nuw i64 %535, %537
  %539 = or i64 %538, %531
  %540 = add nuw nsw i32 %530, 1
  %541 = icmp eq i32 %540, %484
  br i1 %541, label %542, label %529

542:                                              ; preds = %529, %489, %487
  %543 = phi ptr addrspace(4) [ %528, %489 ], [ %476, %487 ], [ %476, %529 ]
  %544 = phi i32 [ %527, %489 ], [ 0, %487 ], [ 0, %529 ]
  %545 = phi i64 [ %526, %489 ], [ 0, %487 ], [ %539, %529 ]
  %546 = icmp ugt i32 %544, 7
  br i1 %546, label %549, label %547

547:                                              ; preds = %542
  %548 = icmp eq i32 %544, 0
  br i1 %548, label %602, label %589

549:                                              ; preds = %542
  %550 = load i8, ptr addrspace(4) %543, align 1, !tbaa !13
  %551 = zext i8 %550 to i64
  %552 = getelementptr inbounds i8, ptr addrspace(4) %543, i64 1
  %553 = load i8, ptr addrspace(4) %552, align 1, !tbaa !13
  %554 = zext i8 %553 to i64
  %555 = shl nuw nsw i64 %554, 8
  %556 = or i64 %555, %551
  %557 = getelementptr inbounds i8, ptr addrspace(4) %543, i64 2
  %558 = load i8, ptr addrspace(4) %557, align 1, !tbaa !13
  %559 = zext i8 %558 to i64
  %560 = shl nuw nsw i64 %559, 16
  %561 = or i64 %556, %560
  %562 = getelementptr inbounds i8, ptr addrspace(4) %543, i64 3
  %563 = load i8, ptr addrspace(4) %562, align 1, !tbaa !13
  %564 = zext i8 %563 to i64
  %565 = shl nuw nsw i64 %564, 24
  %566 = or i64 %561, %565
  %567 = getelementptr inbounds i8, ptr addrspace(4) %543, i64 4
  %568 = load i8, ptr addrspace(4) %567, align 1, !tbaa !13
  %569 = zext i8 %568 to i64
  %570 = shl nuw nsw i64 %569, 32
  %571 = or i64 %566, %570
  %572 = getelementptr inbounds i8, ptr addrspace(4) %543, i64 5
  %573 = load i8, ptr addrspace(4) %572, align 1, !tbaa !13
  %574 = zext i8 %573 to i64
  %575 = shl nuw nsw i64 %574, 40
  %576 = or i64 %571, %575
  %577 = getelementptr inbounds i8, ptr addrspace(4) %543, i64 6
  %578 = load i8, ptr addrspace(4) %577, align 1, !tbaa !13
  %579 = zext i8 %578 to i64
  %580 = shl nuw nsw i64 %579, 48
  %581 = or i64 %576, %580
  %582 = getelementptr inbounds i8, ptr addrspace(4) %543, i64 7
  %583 = load i8, ptr addrspace(4) %582, align 1, !tbaa !13
  %584 = zext i8 %583 to i64
  %585 = shl nuw i64 %584, 56
  %586 = or i64 %581, %585
  %587 = add nsw i32 %544, -8
  %588 = getelementptr inbounds i8, ptr addrspace(4) %543, i64 8
  br label %602

589:                                              ; preds = %547, %589
  %590 = phi i32 [ %600, %589 ], [ 0, %547 ]
  %591 = phi i64 [ %599, %589 ], [ 0, %547 ]
  %592 = zext i32 %590 to i64
  %593 = getelementptr inbounds i8, ptr addrspace(4) %543, i64 %592
  %594 = load i8, ptr addrspace(4) %593, align 1, !tbaa !13
  %595 = zext i8 %594 to i64
  %596 = shl i32 %590, 3
  %597 = zext i32 %596 to i64
  %598 = shl nuw i64 %595, %597
  %599 = or i64 %598, %591
  %600 = add nuw nsw i32 %590, 1
  %601 = icmp eq i32 %600, %544
  br i1 %601, label %602, label %589

602:                                              ; preds = %589, %549, %547
  %603 = phi ptr addrspace(4) [ %588, %549 ], [ %543, %547 ], [ %543, %589 ]
  %604 = phi i32 [ %587, %549 ], [ 0, %547 ], [ 0, %589 ]
  %605 = phi i64 [ %586, %549 ], [ 0, %547 ], [ %599, %589 ]
  %606 = icmp ugt i32 %604, 7
  br i1 %606, label %609, label %607

607:                                              ; preds = %602
  %608 = icmp eq i32 %604, 0
  br i1 %608, label %662, label %649

609:                                              ; preds = %602
  %610 = load i8, ptr addrspace(4) %603, align 1, !tbaa !13
  %611 = zext i8 %610 to i64
  %612 = getelementptr inbounds i8, ptr addrspace(4) %603, i64 1
  %613 = load i8, ptr addrspace(4) %612, align 1, !tbaa !13
  %614 = zext i8 %613 to i64
  %615 = shl nuw nsw i64 %614, 8
  %616 = or i64 %615, %611
  %617 = getelementptr inbounds i8, ptr addrspace(4) %603, i64 2
  %618 = load i8, ptr addrspace(4) %617, align 1, !tbaa !13
  %619 = zext i8 %618 to i64
  %620 = shl nuw nsw i64 %619, 16
  %621 = or i64 %616, %620
  %622 = getelementptr inbounds i8, ptr addrspace(4) %603, i64 3
  %623 = load i8, ptr addrspace(4) %622, align 1, !tbaa !13
  %624 = zext i8 %623 to i64
  %625 = shl nuw nsw i64 %624, 24
  %626 = or i64 %621, %625
  %627 = getelementptr inbounds i8, ptr addrspace(4) %603, i64 4
  %628 = load i8, ptr addrspace(4) %627, align 1, !tbaa !13
  %629 = zext i8 %628 to i64
  %630 = shl nuw nsw i64 %629, 32
  %631 = or i64 %626, %630
  %632 = getelementptr inbounds i8, ptr addrspace(4) %603, i64 5
  %633 = load i8, ptr addrspace(4) %632, align 1, !tbaa !13
  %634 = zext i8 %633 to i64
  %635 = shl nuw nsw i64 %634, 40
  %636 = or i64 %631, %635
  %637 = getelementptr inbounds i8, ptr addrspace(4) %603, i64 6
  %638 = load i8, ptr addrspace(4) %637, align 1, !tbaa !13
  %639 = zext i8 %638 to i64
  %640 = shl nuw nsw i64 %639, 48
  %641 = or i64 %636, %640
  %642 = getelementptr inbounds i8, ptr addrspace(4) %603, i64 7
  %643 = load i8, ptr addrspace(4) %642, align 1, !tbaa !13
  %644 = zext i8 %643 to i64
  %645 = shl nuw i64 %644, 56
  %646 = or i64 %641, %645
  %647 = add nsw i32 %604, -8
  %648 = getelementptr inbounds i8, ptr addrspace(4) %603, i64 8
  br label %662

649:                                              ; preds = %607, %649
  %650 = phi i32 [ %660, %649 ], [ 0, %607 ]
  %651 = phi i64 [ %659, %649 ], [ 0, %607 ]
  %652 = zext i32 %650 to i64
  %653 = getelementptr inbounds i8, ptr addrspace(4) %603, i64 %652
  %654 = load i8, ptr addrspace(4) %653, align 1, !tbaa !13
  %655 = zext i8 %654 to i64
  %656 = shl i32 %650, 3
  %657 = zext i32 %656 to i64
  %658 = shl nuw i64 %655, %657
  %659 = or i64 %658, %651
  %660 = add nuw nsw i32 %650, 1
  %661 = icmp eq i32 %660, %604
  br i1 %661, label %662, label %649

662:                                              ; preds = %649, %609, %607
  %663 = phi ptr addrspace(4) [ %648, %609 ], [ %603, %607 ], [ %603, %649 ]
  %664 = phi i32 [ %647, %609 ], [ 0, %607 ], [ 0, %649 ]
  %665 = phi i64 [ %646, %609 ], [ 0, %607 ], [ %659, %649 ]
  %666 = icmp ugt i32 %664, 7
  br i1 %666, label %669, label %667

667:                                              ; preds = %662
  %668 = icmp eq i32 %664, 0
  br i1 %668, label %722, label %709

669:                                              ; preds = %662
  %670 = load i8, ptr addrspace(4) %663, align 1, !tbaa !13
  %671 = zext i8 %670 to i64
  %672 = getelementptr inbounds i8, ptr addrspace(4) %663, i64 1
  %673 = load i8, ptr addrspace(4) %672, align 1, !tbaa !13
  %674 = zext i8 %673 to i64
  %675 = shl nuw nsw i64 %674, 8
  %676 = or i64 %675, %671
  %677 = getelementptr inbounds i8, ptr addrspace(4) %663, i64 2
  %678 = load i8, ptr addrspace(4) %677, align 1, !tbaa !13
  %679 = zext i8 %678 to i64
  %680 = shl nuw nsw i64 %679, 16
  %681 = or i64 %676, %680
  %682 = getelementptr inbounds i8, ptr addrspace(4) %663, i64 3
  %683 = load i8, ptr addrspace(4) %682, align 1, !tbaa !13
  %684 = zext i8 %683 to i64
  %685 = shl nuw nsw i64 %684, 24
  %686 = or i64 %681, %685
  %687 = getelementptr inbounds i8, ptr addrspace(4) %663, i64 4
  %688 = load i8, ptr addrspace(4) %687, align 1, !tbaa !13
  %689 = zext i8 %688 to i64
  %690 = shl nuw nsw i64 %689, 32
  %691 = or i64 %686, %690
  %692 = getelementptr inbounds i8, ptr addrspace(4) %663, i64 5
  %693 = load i8, ptr addrspace(4) %692, align 1, !tbaa !13
  %694 = zext i8 %693 to i64
  %695 = shl nuw nsw i64 %694, 40
  %696 = or i64 %691, %695
  %697 = getelementptr inbounds i8, ptr addrspace(4) %663, i64 6
  %698 = load i8, ptr addrspace(4) %697, align 1, !tbaa !13
  %699 = zext i8 %698 to i64
  %700 = shl nuw nsw i64 %699, 48
  %701 = or i64 %696, %700
  %702 = getelementptr inbounds i8, ptr addrspace(4) %663, i64 7
  %703 = load i8, ptr addrspace(4) %702, align 1, !tbaa !13
  %704 = zext i8 %703 to i64
  %705 = shl nuw i64 %704, 56
  %706 = or i64 %701, %705
  %707 = add nsw i32 %664, -8
  %708 = getelementptr inbounds i8, ptr addrspace(4) %663, i64 8
  br label %722

709:                                              ; preds = %667, %709
  %710 = phi i32 [ %720, %709 ], [ 0, %667 ]
  %711 = phi i64 [ %719, %709 ], [ 0, %667 ]
  %712 = zext i32 %710 to i64
  %713 = getelementptr inbounds i8, ptr addrspace(4) %663, i64 %712
  %714 = load i8, ptr addrspace(4) %713, align 1, !tbaa !13
  %715 = zext i8 %714 to i64
  %716 = shl i32 %710, 3
  %717 = zext i32 %716 to i64
  %718 = shl nuw i64 %715, %717
  %719 = or i64 %718, %711
  %720 = add nuw nsw i32 %710, 1
  %721 = icmp eq i32 %720, %664
  br i1 %721, label %722, label %709

722:                                              ; preds = %709, %669, %667
  %723 = phi ptr addrspace(4) [ %708, %669 ], [ %663, %667 ], [ %663, %709 ]
  %724 = phi i32 [ %707, %669 ], [ 0, %667 ], [ 0, %709 ]
  %725 = phi i64 [ %706, %669 ], [ 0, %667 ], [ %719, %709 ]
  %726 = icmp ugt i32 %724, 7
  br i1 %726, label %729, label %727

727:                                              ; preds = %722
  %728 = icmp eq i32 %724, 0
  br i1 %728, label %782, label %769

729:                                              ; preds = %722
  %730 = load i8, ptr addrspace(4) %723, align 1, !tbaa !13
  %731 = zext i8 %730 to i64
  %732 = getelementptr inbounds i8, ptr addrspace(4) %723, i64 1
  %733 = load i8, ptr addrspace(4) %732, align 1, !tbaa !13
  %734 = zext i8 %733 to i64
  %735 = shl nuw nsw i64 %734, 8
  %736 = or i64 %735, %731
  %737 = getelementptr inbounds i8, ptr addrspace(4) %723, i64 2
  %738 = load i8, ptr addrspace(4) %737, align 1, !tbaa !13
  %739 = zext i8 %738 to i64
  %740 = shl nuw nsw i64 %739, 16
  %741 = or i64 %736, %740
  %742 = getelementptr inbounds i8, ptr addrspace(4) %723, i64 3
  %743 = load i8, ptr addrspace(4) %742, align 1, !tbaa !13
  %744 = zext i8 %743 to i64
  %745 = shl nuw nsw i64 %744, 24
  %746 = or i64 %741, %745
  %747 = getelementptr inbounds i8, ptr addrspace(4) %723, i64 4
  %748 = load i8, ptr addrspace(4) %747, align 1, !tbaa !13
  %749 = zext i8 %748 to i64
  %750 = shl nuw nsw i64 %749, 32
  %751 = or i64 %746, %750
  %752 = getelementptr inbounds i8, ptr addrspace(4) %723, i64 5
  %753 = load i8, ptr addrspace(4) %752, align 1, !tbaa !13
  %754 = zext i8 %753 to i64
  %755 = shl nuw nsw i64 %754, 40
  %756 = or i64 %751, %755
  %757 = getelementptr inbounds i8, ptr addrspace(4) %723, i64 6
  %758 = load i8, ptr addrspace(4) %757, align 1, !tbaa !13
  %759 = zext i8 %758 to i64
  %760 = shl nuw nsw i64 %759, 48
  %761 = or i64 %756, %760
  %762 = getelementptr inbounds i8, ptr addrspace(4) %723, i64 7
  %763 = load i8, ptr addrspace(4) %762, align 1, !tbaa !13
  %764 = zext i8 %763 to i64
  %765 = shl nuw i64 %764, 56
  %766 = or i64 %761, %765
  %767 = add nsw i32 %724, -8
  %768 = getelementptr inbounds i8, ptr addrspace(4) %723, i64 8
  br label %782

769:                                              ; preds = %727, %769
  %770 = phi i32 [ %780, %769 ], [ 0, %727 ]
  %771 = phi i64 [ %779, %769 ], [ 0, %727 ]
  %772 = zext i32 %770 to i64
  %773 = getelementptr inbounds i8, ptr addrspace(4) %723, i64 %772
  %774 = load i8, ptr addrspace(4) %773, align 1, !tbaa !13
  %775 = zext i8 %774 to i64
  %776 = shl i32 %770, 3
  %777 = zext i32 %776 to i64
  %778 = shl nuw i64 %775, %777
  %779 = or i64 %778, %771
  %780 = add nuw nsw i32 %770, 1
  %781 = icmp eq i32 %780, %724
  br i1 %781, label %782, label %769

782:                                              ; preds = %769, %729, %727
  %783 = phi ptr addrspace(4) [ %768, %729 ], [ %723, %727 ], [ %723, %769 ]
  %784 = phi i32 [ %767, %729 ], [ 0, %727 ], [ 0, %769 ]
  %785 = phi i64 [ %766, %729 ], [ 0, %727 ], [ %779, %769 ]
  %786 = icmp ugt i32 %784, 7
  br i1 %786, label %789, label %787

787:                                              ; preds = %782
  %788 = icmp eq i32 %784, 0
  br i1 %788, label %842, label %829

789:                                              ; preds = %782
  %790 = load i8, ptr addrspace(4) %783, align 1, !tbaa !13
  %791 = zext i8 %790 to i64
  %792 = getelementptr inbounds i8, ptr addrspace(4) %783, i64 1
  %793 = load i8, ptr addrspace(4) %792, align 1, !tbaa !13
  %794 = zext i8 %793 to i64
  %795 = shl nuw nsw i64 %794, 8
  %796 = or i64 %795, %791
  %797 = getelementptr inbounds i8, ptr addrspace(4) %783, i64 2
  %798 = load i8, ptr addrspace(4) %797, align 1, !tbaa !13
  %799 = zext i8 %798 to i64
  %800 = shl nuw nsw i64 %799, 16
  %801 = or i64 %796, %800
  %802 = getelementptr inbounds i8, ptr addrspace(4) %783, i64 3
  %803 = load i8, ptr addrspace(4) %802, align 1, !tbaa !13
  %804 = zext i8 %803 to i64
  %805 = shl nuw nsw i64 %804, 24
  %806 = or i64 %801, %805
  %807 = getelementptr inbounds i8, ptr addrspace(4) %783, i64 4
  %808 = load i8, ptr addrspace(4) %807, align 1, !tbaa !13
  %809 = zext i8 %808 to i64
  %810 = shl nuw nsw i64 %809, 32
  %811 = or i64 %806, %810
  %812 = getelementptr inbounds i8, ptr addrspace(4) %783, i64 5
  %813 = load i8, ptr addrspace(4) %812, align 1, !tbaa !13
  %814 = zext i8 %813 to i64
  %815 = shl nuw nsw i64 %814, 40
  %816 = or i64 %811, %815
  %817 = getelementptr inbounds i8, ptr addrspace(4) %783, i64 6
  %818 = load i8, ptr addrspace(4) %817, align 1, !tbaa !13
  %819 = zext i8 %818 to i64
  %820 = shl nuw nsw i64 %819, 48
  %821 = or i64 %816, %820
  %822 = getelementptr inbounds i8, ptr addrspace(4) %783, i64 7
  %823 = load i8, ptr addrspace(4) %822, align 1, !tbaa !13
  %824 = zext i8 %823 to i64
  %825 = shl nuw i64 %824, 56
  %826 = or i64 %821, %825
  %827 = add nsw i32 %784, -8
  %828 = getelementptr inbounds i8, ptr addrspace(4) %783, i64 8
  br label %842

829:                                              ; preds = %787, %829
  %830 = phi i32 [ %840, %829 ], [ 0, %787 ]
  %831 = phi i64 [ %839, %829 ], [ 0, %787 ]
  %832 = zext i32 %830 to i64
  %833 = getelementptr inbounds i8, ptr addrspace(4) %783, i64 %832
  %834 = load i8, ptr addrspace(4) %833, align 1, !tbaa !13
  %835 = zext i8 %834 to i64
  %836 = shl i32 %830, 3
  %837 = zext i32 %836 to i64
  %838 = shl nuw i64 %835, %837
  %839 = or i64 %838, %831
  %840 = add nuw nsw i32 %830, 1
  %841 = icmp eq i32 %840, %784
  br i1 %841, label %842, label %829

842:                                              ; preds = %829, %789, %787
  %843 = phi ptr addrspace(4) [ %828, %789 ], [ %783, %787 ], [ %783, %829 ]
  %844 = phi i32 [ %827, %789 ], [ 0, %787 ], [ 0, %829 ]
  %845 = phi i64 [ %826, %789 ], [ 0, %787 ], [ %839, %829 ]
  %846 = icmp ugt i32 %844, 7
  br i1 %846, label %849, label %847

847:                                              ; preds = %842
  %848 = icmp eq i32 %844, 0
  br i1 %848, label %900, label %887

849:                                              ; preds = %842
  %850 = load i8, ptr addrspace(4) %843, align 1, !tbaa !13
  %851 = zext i8 %850 to i64
  %852 = getelementptr inbounds i8, ptr addrspace(4) %843, i64 1
  %853 = load i8, ptr addrspace(4) %852, align 1, !tbaa !13
  %854 = zext i8 %853 to i64
  %855 = shl nuw nsw i64 %854, 8
  %856 = or i64 %855, %851
  %857 = getelementptr inbounds i8, ptr addrspace(4) %843, i64 2
  %858 = load i8, ptr addrspace(4) %857, align 1, !tbaa !13
  %859 = zext i8 %858 to i64
  %860 = shl nuw nsw i64 %859, 16
  %861 = or i64 %856, %860
  %862 = getelementptr inbounds i8, ptr addrspace(4) %843, i64 3
  %863 = load i8, ptr addrspace(4) %862, align 1, !tbaa !13
  %864 = zext i8 %863 to i64
  %865 = shl nuw nsw i64 %864, 24
  %866 = or i64 %861, %865
  %867 = getelementptr inbounds i8, ptr addrspace(4) %843, i64 4
  %868 = load i8, ptr addrspace(4) %867, align 1, !tbaa !13
  %869 = zext i8 %868 to i64
  %870 = shl nuw nsw i64 %869, 32
  %871 = or i64 %866, %870
  %872 = getelementptr inbounds i8, ptr addrspace(4) %843, i64 5
  %873 = load i8, ptr addrspace(4) %872, align 1, !tbaa !13
  %874 = zext i8 %873 to i64
  %875 = shl nuw nsw i64 %874, 40
  %876 = or i64 %871, %875
  %877 = getelementptr inbounds i8, ptr addrspace(4) %843, i64 6
  %878 = load i8, ptr addrspace(4) %877, align 1, !tbaa !13
  %879 = zext i8 %878 to i64
  %880 = shl nuw nsw i64 %879, 48
  %881 = or i64 %876, %880
  %882 = getelementptr inbounds i8, ptr addrspace(4) %843, i64 7
  %883 = load i8, ptr addrspace(4) %882, align 1, !tbaa !13
  %884 = zext i8 %883 to i64
  %885 = shl nuw i64 %884, 56
  %886 = or i64 %881, %885
  br label %900

887:                                              ; preds = %847, %887
  %888 = phi i32 [ %898, %887 ], [ 0, %847 ]
  %889 = phi i64 [ %897, %887 ], [ 0, %847 ]
  %890 = zext i32 %888 to i64
  %891 = getelementptr inbounds i8, ptr addrspace(4) %843, i64 %890
  %892 = load i8, ptr addrspace(4) %891, align 1, !tbaa !13
  %893 = zext i8 %892 to i64
  %894 = shl i32 %888, 3
  %895 = zext i32 %894 to i64
  %896 = shl nuw i64 %893, %895
  %897 = or i64 %896, %889
  %898 = add nuw nsw i32 %888, 1
  %899 = icmp eq i32 %898, %844
  br i1 %899, label %900, label %887

900:                                              ; preds = %887, %849, %847
  %901 = phi i64 [ %886, %849 ], [ 0, %847 ], [ %897, %887 ]
  %902 = shl nuw nsw i64 %483, 2
  %903 = add nuw nsw i64 %902, 28
  %904 = and i64 %903, 480
  %905 = and i64 %485, -225
  %906 = or i64 %905, %904
  %907 = call fastcc <2 x i64> @__ockl_hostcall_internal(ptr noundef %8, i64 noundef %906, i64 noundef %545, i64 noundef %605, i64 noundef %665, i64 noundef %725, i64 noundef %785, i64 noundef %845, i64 noundef %901) #18
  %908 = sub i64 %475, %483
  %909 = getelementptr inbounds i8, ptr addrspace(4) %476, i64 %483
  %910 = icmp eq i64 %908, 0
  br i1 %910, label %911, label %474

911:                                              ; preds = %900, %466
  %912 = phi <2 x i64> [ %469, %466 ], [ %907, %900 ]
  %913 = extractelement <2 x i64> %912, i64 0
  %914 = zext i32 %0 to i64
  %915 = and i64 %913, -225
  %916 = or i64 %915, 32
  %917 = call fastcc <2 x i64> @__ockl_hostcall_internal(ptr noundef %8, i64 noundef %916, i64 noundef %914, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #18
  br label %918

918:                                              ; preds = %918, %911
  %919 = phi ptr [ %1, %911 ], [ %920, %918 ]
  %920 = getelementptr inbounds i8, ptr %919, i64 1
  %921 = load i8, ptr %919, align 1, !tbaa !8
  %922 = icmp eq i8 %921, 0
  br i1 %922, label %923, label %918, !llvm.loop !14

923:                                              ; preds = %918
  %924 = extractelement <2 x i64> %917, i64 0
  %925 = icmp eq ptr %1, null
  br i1 %925, label %926, label %930

926:                                              ; preds = %923
  %927 = and i64 %924, -225
  %928 = or i64 %927, 32
  %929 = call fastcc <2 x i64> @__ockl_hostcall_internal(ptr noundef %8, i64 noundef %928, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #18
  br label %1376

930:                                              ; preds = %923
  %931 = ptrtoint ptr %920 to i64
  %932 = ptrtoint ptr %1 to i64
  %933 = sub i64 %931, %932
  %934 = shl i64 %933, 32
  %935 = ashr exact i64 %934, 32
  %936 = and i64 %924, 2
  %937 = and i64 %924, -3
  %938 = insertelement <2 x i64> <i64 poison, i64 0>, i64 %937, i64 0
  br label %939

939:                                              ; preds = %1365, %930
  %940 = phi i64 [ %935, %930 ], [ %1373, %1365 ]
  %941 = phi ptr [ %1, %930 ], [ %1374, %1365 ]
  %942 = phi <2 x i64> [ %938, %930 ], [ %1372, %1365 ]
  %943 = icmp ugt i64 %940, 56
  %944 = extractelement <2 x i64> %942, i64 0
  %945 = or i64 %944, %936
  %946 = insertelement <2 x i64> poison, i64 %945, i64 0
  %947 = select i1 %943, <2 x i64> %942, <2 x i64> %946
  %948 = call i64 @llvm.umin.i64(i64 %940, i64 56)
  %949 = trunc i64 %948 to i32
  %950 = extractelement <2 x i64> %947, i64 0
  %951 = icmp ugt i32 %949, 7
  br i1 %951, label %954, label %952

952:                                              ; preds = %939
  %953 = icmp eq i32 %949, 0
  br i1 %953, label %1007, label %994

954:                                              ; preds = %939
  %955 = load i8, ptr %941, align 1, !tbaa !13
  %956 = zext i8 %955 to i64
  %957 = getelementptr inbounds i8, ptr %941, i64 1
  %958 = load i8, ptr %957, align 1, !tbaa !13
  %959 = zext i8 %958 to i64
  %960 = shl nuw nsw i64 %959, 8
  %961 = or i64 %960, %956
  %962 = getelementptr inbounds i8, ptr %941, i64 2
  %963 = load i8, ptr %962, align 1, !tbaa !13
  %964 = zext i8 %963 to i64
  %965 = shl nuw nsw i64 %964, 16
  %966 = or i64 %961, %965
  %967 = getelementptr inbounds i8, ptr %941, i64 3
  %968 = load i8, ptr %967, align 1, !tbaa !13
  %969 = zext i8 %968 to i64
  %970 = shl nuw nsw i64 %969, 24
  %971 = or i64 %966, %970
  %972 = getelementptr inbounds i8, ptr %941, i64 4
  %973 = load i8, ptr %972, align 1, !tbaa !13
  %974 = zext i8 %973 to i64
  %975 = shl nuw nsw i64 %974, 32
  %976 = or i64 %971, %975
  %977 = getelementptr inbounds i8, ptr %941, i64 5
  %978 = load i8, ptr %977, align 1, !tbaa !13
  %979 = zext i8 %978 to i64
  %980 = shl nuw nsw i64 %979, 40
  %981 = or i64 %976, %980
  %982 = getelementptr inbounds i8, ptr %941, i64 6
  %983 = load i8, ptr %982, align 1, !tbaa !13
  %984 = zext i8 %983 to i64
  %985 = shl nuw nsw i64 %984, 48
  %986 = or i64 %981, %985
  %987 = getelementptr inbounds i8, ptr %941, i64 7
  %988 = load i8, ptr %987, align 1, !tbaa !13
  %989 = zext i8 %988 to i64
  %990 = shl nuw i64 %989, 56
  %991 = or i64 %986, %990
  %992 = add nsw i32 %949, -8
  %993 = getelementptr inbounds i8, ptr %941, i64 8
  br label %1007

994:                                              ; preds = %952, %994
  %995 = phi i32 [ %1005, %994 ], [ 0, %952 ]
  %996 = phi i64 [ %1004, %994 ], [ 0, %952 ]
  %997 = zext i32 %995 to i64
  %998 = getelementptr inbounds i8, ptr %941, i64 %997
  %999 = load i8, ptr %998, align 1, !tbaa !13
  %1000 = zext i8 %999 to i64
  %1001 = shl i32 %995, 3
  %1002 = zext i32 %1001 to i64
  %1003 = shl nuw i64 %1000, %1002
  %1004 = or i64 %1003, %996
  %1005 = add nuw nsw i32 %995, 1
  %1006 = icmp eq i32 %1005, %949
  br i1 %1006, label %1007, label %994

1007:                                             ; preds = %994, %954, %952
  %1008 = phi ptr [ %993, %954 ], [ %941, %952 ], [ %941, %994 ]
  %1009 = phi i32 [ %992, %954 ], [ 0, %952 ], [ 0, %994 ]
  %1010 = phi i64 [ %991, %954 ], [ 0, %952 ], [ %1004, %994 ]
  %1011 = icmp ugt i32 %1009, 7
  br i1 %1011, label %1014, label %1012

1012:                                             ; preds = %1007
  %1013 = icmp eq i32 %1009, 0
  br i1 %1013, label %1067, label %1054

1014:                                             ; preds = %1007
  %1015 = load i8, ptr %1008, align 1, !tbaa !13
  %1016 = zext i8 %1015 to i64
  %1017 = getelementptr inbounds i8, ptr %1008, i64 1
  %1018 = load i8, ptr %1017, align 1, !tbaa !13
  %1019 = zext i8 %1018 to i64
  %1020 = shl nuw nsw i64 %1019, 8
  %1021 = or i64 %1020, %1016
  %1022 = getelementptr inbounds i8, ptr %1008, i64 2
  %1023 = load i8, ptr %1022, align 1, !tbaa !13
  %1024 = zext i8 %1023 to i64
  %1025 = shl nuw nsw i64 %1024, 16
  %1026 = or i64 %1021, %1025
  %1027 = getelementptr inbounds i8, ptr %1008, i64 3
  %1028 = load i8, ptr %1027, align 1, !tbaa !13
  %1029 = zext i8 %1028 to i64
  %1030 = shl nuw nsw i64 %1029, 24
  %1031 = or i64 %1026, %1030
  %1032 = getelementptr inbounds i8, ptr %1008, i64 4
  %1033 = load i8, ptr %1032, align 1, !tbaa !13
  %1034 = zext i8 %1033 to i64
  %1035 = shl nuw nsw i64 %1034, 32
  %1036 = or i64 %1031, %1035
  %1037 = getelementptr inbounds i8, ptr %1008, i64 5
  %1038 = load i8, ptr %1037, align 1, !tbaa !13
  %1039 = zext i8 %1038 to i64
  %1040 = shl nuw nsw i64 %1039, 40
  %1041 = or i64 %1036, %1040
  %1042 = getelementptr inbounds i8, ptr %1008, i64 6
  %1043 = load i8, ptr %1042, align 1, !tbaa !13
  %1044 = zext i8 %1043 to i64
  %1045 = shl nuw nsw i64 %1044, 48
  %1046 = or i64 %1041, %1045
  %1047 = getelementptr inbounds i8, ptr %1008, i64 7
  %1048 = load i8, ptr %1047, align 1, !tbaa !13
  %1049 = zext i8 %1048 to i64
  %1050 = shl nuw i64 %1049, 56
  %1051 = or i64 %1046, %1050
  %1052 = add nsw i32 %1009, -8
  %1053 = getelementptr inbounds i8, ptr %1008, i64 8
  br label %1067

1054:                                             ; preds = %1012, %1054
  %1055 = phi i32 [ %1065, %1054 ], [ 0, %1012 ]
  %1056 = phi i64 [ %1064, %1054 ], [ 0, %1012 ]
  %1057 = zext i32 %1055 to i64
  %1058 = getelementptr inbounds i8, ptr %1008, i64 %1057
  %1059 = load i8, ptr %1058, align 1, !tbaa !13
  %1060 = zext i8 %1059 to i64
  %1061 = shl i32 %1055, 3
  %1062 = zext i32 %1061 to i64
  %1063 = shl nuw i64 %1060, %1062
  %1064 = or i64 %1063, %1056
  %1065 = add nuw nsw i32 %1055, 1
  %1066 = icmp eq i32 %1065, %1009
  br i1 %1066, label %1067, label %1054

1067:                                             ; preds = %1054, %1014, %1012
  %1068 = phi ptr [ %1053, %1014 ], [ %1008, %1012 ], [ %1008, %1054 ]
  %1069 = phi i32 [ %1052, %1014 ], [ 0, %1012 ], [ 0, %1054 ]
  %1070 = phi i64 [ %1051, %1014 ], [ 0, %1012 ], [ %1064, %1054 ]
  %1071 = icmp ugt i32 %1069, 7
  br i1 %1071, label %1074, label %1072

1072:                                             ; preds = %1067
  %1073 = icmp eq i32 %1069, 0
  br i1 %1073, label %1127, label %1114

1074:                                             ; preds = %1067
  %1075 = load i8, ptr %1068, align 1, !tbaa !13
  %1076 = zext i8 %1075 to i64
  %1077 = getelementptr inbounds i8, ptr %1068, i64 1
  %1078 = load i8, ptr %1077, align 1, !tbaa !13
  %1079 = zext i8 %1078 to i64
  %1080 = shl nuw nsw i64 %1079, 8
  %1081 = or i64 %1080, %1076
  %1082 = getelementptr inbounds i8, ptr %1068, i64 2
  %1083 = load i8, ptr %1082, align 1, !tbaa !13
  %1084 = zext i8 %1083 to i64
  %1085 = shl nuw nsw i64 %1084, 16
  %1086 = or i64 %1081, %1085
  %1087 = getelementptr inbounds i8, ptr %1068, i64 3
  %1088 = load i8, ptr %1087, align 1, !tbaa !13
  %1089 = zext i8 %1088 to i64
  %1090 = shl nuw nsw i64 %1089, 24
  %1091 = or i64 %1086, %1090
  %1092 = getelementptr inbounds i8, ptr %1068, i64 4
  %1093 = load i8, ptr %1092, align 1, !tbaa !13
  %1094 = zext i8 %1093 to i64
  %1095 = shl nuw nsw i64 %1094, 32
  %1096 = or i64 %1091, %1095
  %1097 = getelementptr inbounds i8, ptr %1068, i64 5
  %1098 = load i8, ptr %1097, align 1, !tbaa !13
  %1099 = zext i8 %1098 to i64
  %1100 = shl nuw nsw i64 %1099, 40
  %1101 = or i64 %1096, %1100
  %1102 = getelementptr inbounds i8, ptr %1068, i64 6
  %1103 = load i8, ptr %1102, align 1, !tbaa !13
  %1104 = zext i8 %1103 to i64
  %1105 = shl nuw nsw i64 %1104, 48
  %1106 = or i64 %1101, %1105
  %1107 = getelementptr inbounds i8, ptr %1068, i64 7
  %1108 = load i8, ptr %1107, align 1, !tbaa !13
  %1109 = zext i8 %1108 to i64
  %1110 = shl nuw i64 %1109, 56
  %1111 = or i64 %1106, %1110
  %1112 = add nsw i32 %1069, -8
  %1113 = getelementptr inbounds i8, ptr %1068, i64 8
  br label %1127

1114:                                             ; preds = %1072, %1114
  %1115 = phi i32 [ %1125, %1114 ], [ 0, %1072 ]
  %1116 = phi i64 [ %1124, %1114 ], [ 0, %1072 ]
  %1117 = zext i32 %1115 to i64
  %1118 = getelementptr inbounds i8, ptr %1068, i64 %1117
  %1119 = load i8, ptr %1118, align 1, !tbaa !13
  %1120 = zext i8 %1119 to i64
  %1121 = shl i32 %1115, 3
  %1122 = zext i32 %1121 to i64
  %1123 = shl nuw i64 %1120, %1122
  %1124 = or i64 %1123, %1116
  %1125 = add nuw nsw i32 %1115, 1
  %1126 = icmp eq i32 %1125, %1069
  br i1 %1126, label %1127, label %1114

1127:                                             ; preds = %1114, %1074, %1072
  %1128 = phi ptr [ %1113, %1074 ], [ %1068, %1072 ], [ %1068, %1114 ]
  %1129 = phi i32 [ %1112, %1074 ], [ 0, %1072 ], [ 0, %1114 ]
  %1130 = phi i64 [ %1111, %1074 ], [ 0, %1072 ], [ %1124, %1114 ]
  %1131 = icmp ugt i32 %1129, 7
  br i1 %1131, label %1134, label %1132

1132:                                             ; preds = %1127
  %1133 = icmp eq i32 %1129, 0
  br i1 %1133, label %1187, label %1174

1134:                                             ; preds = %1127
  %1135 = load i8, ptr %1128, align 1, !tbaa !13
  %1136 = zext i8 %1135 to i64
  %1137 = getelementptr inbounds i8, ptr %1128, i64 1
  %1138 = load i8, ptr %1137, align 1, !tbaa !13
  %1139 = zext i8 %1138 to i64
  %1140 = shl nuw nsw i64 %1139, 8
  %1141 = or i64 %1140, %1136
  %1142 = getelementptr inbounds i8, ptr %1128, i64 2
  %1143 = load i8, ptr %1142, align 1, !tbaa !13
  %1144 = zext i8 %1143 to i64
  %1145 = shl nuw nsw i64 %1144, 16
  %1146 = or i64 %1141, %1145
  %1147 = getelementptr inbounds i8, ptr %1128, i64 3
  %1148 = load i8, ptr %1147, align 1, !tbaa !13
  %1149 = zext i8 %1148 to i64
  %1150 = shl nuw nsw i64 %1149, 24
  %1151 = or i64 %1146, %1150
  %1152 = getelementptr inbounds i8, ptr %1128, i64 4
  %1153 = load i8, ptr %1152, align 1, !tbaa !13
  %1154 = zext i8 %1153 to i64
  %1155 = shl nuw nsw i64 %1154, 32
  %1156 = or i64 %1151, %1155
  %1157 = getelementptr inbounds i8, ptr %1128, i64 5
  %1158 = load i8, ptr %1157, align 1, !tbaa !13
  %1159 = zext i8 %1158 to i64
  %1160 = shl nuw nsw i64 %1159, 40
  %1161 = or i64 %1156, %1160
  %1162 = getelementptr inbounds i8, ptr %1128, i64 6
  %1163 = load i8, ptr %1162, align 1, !tbaa !13
  %1164 = zext i8 %1163 to i64
  %1165 = shl nuw nsw i64 %1164, 48
  %1166 = or i64 %1161, %1165
  %1167 = getelementptr inbounds i8, ptr %1128, i64 7
  %1168 = load i8, ptr %1167, align 1, !tbaa !13
  %1169 = zext i8 %1168 to i64
  %1170 = shl nuw i64 %1169, 56
  %1171 = or i64 %1166, %1170
  %1172 = add nsw i32 %1129, -8
  %1173 = getelementptr inbounds i8, ptr %1128, i64 8
  br label %1187

1174:                                             ; preds = %1132, %1174
  %1175 = phi i32 [ %1185, %1174 ], [ 0, %1132 ]
  %1176 = phi i64 [ %1184, %1174 ], [ 0, %1132 ]
  %1177 = zext i32 %1175 to i64
  %1178 = getelementptr inbounds i8, ptr %1128, i64 %1177
  %1179 = load i8, ptr %1178, align 1, !tbaa !13
  %1180 = zext i8 %1179 to i64
  %1181 = shl i32 %1175, 3
  %1182 = zext i32 %1181 to i64
  %1183 = shl nuw i64 %1180, %1182
  %1184 = or i64 %1183, %1176
  %1185 = add nuw nsw i32 %1175, 1
  %1186 = icmp eq i32 %1185, %1129
  br i1 %1186, label %1187, label %1174

1187:                                             ; preds = %1174, %1134, %1132
  %1188 = phi ptr [ %1173, %1134 ], [ %1128, %1132 ], [ %1128, %1174 ]
  %1189 = phi i32 [ %1172, %1134 ], [ 0, %1132 ], [ 0, %1174 ]
  %1190 = phi i64 [ %1171, %1134 ], [ 0, %1132 ], [ %1184, %1174 ]
  %1191 = icmp ugt i32 %1189, 7
  br i1 %1191, label %1194, label %1192

1192:                                             ; preds = %1187
  %1193 = icmp eq i32 %1189, 0
  br i1 %1193, label %1247, label %1234

1194:                                             ; preds = %1187
  %1195 = load i8, ptr %1188, align 1, !tbaa !13
  %1196 = zext i8 %1195 to i64
  %1197 = getelementptr inbounds i8, ptr %1188, i64 1
  %1198 = load i8, ptr %1197, align 1, !tbaa !13
  %1199 = zext i8 %1198 to i64
  %1200 = shl nuw nsw i64 %1199, 8
  %1201 = or i64 %1200, %1196
  %1202 = getelementptr inbounds i8, ptr %1188, i64 2
  %1203 = load i8, ptr %1202, align 1, !tbaa !13
  %1204 = zext i8 %1203 to i64
  %1205 = shl nuw nsw i64 %1204, 16
  %1206 = or i64 %1201, %1205
  %1207 = getelementptr inbounds i8, ptr %1188, i64 3
  %1208 = load i8, ptr %1207, align 1, !tbaa !13
  %1209 = zext i8 %1208 to i64
  %1210 = shl nuw nsw i64 %1209, 24
  %1211 = or i64 %1206, %1210
  %1212 = getelementptr inbounds i8, ptr %1188, i64 4
  %1213 = load i8, ptr %1212, align 1, !tbaa !13
  %1214 = zext i8 %1213 to i64
  %1215 = shl nuw nsw i64 %1214, 32
  %1216 = or i64 %1211, %1215
  %1217 = getelementptr inbounds i8, ptr %1188, i64 5
  %1218 = load i8, ptr %1217, align 1, !tbaa !13
  %1219 = zext i8 %1218 to i64
  %1220 = shl nuw nsw i64 %1219, 40
  %1221 = or i64 %1216, %1220
  %1222 = getelementptr inbounds i8, ptr %1188, i64 6
  %1223 = load i8, ptr %1222, align 1, !tbaa !13
  %1224 = zext i8 %1223 to i64
  %1225 = shl nuw nsw i64 %1224, 48
  %1226 = or i64 %1221, %1225
  %1227 = getelementptr inbounds i8, ptr %1188, i64 7
  %1228 = load i8, ptr %1227, align 1, !tbaa !13
  %1229 = zext i8 %1228 to i64
  %1230 = shl nuw i64 %1229, 56
  %1231 = or i64 %1226, %1230
  %1232 = add nsw i32 %1189, -8
  %1233 = getelementptr inbounds i8, ptr %1188, i64 8
  br label %1247

1234:                                             ; preds = %1192, %1234
  %1235 = phi i32 [ %1245, %1234 ], [ 0, %1192 ]
  %1236 = phi i64 [ %1244, %1234 ], [ 0, %1192 ]
  %1237 = zext i32 %1235 to i64
  %1238 = getelementptr inbounds i8, ptr %1188, i64 %1237
  %1239 = load i8, ptr %1238, align 1, !tbaa !13
  %1240 = zext i8 %1239 to i64
  %1241 = shl i32 %1235, 3
  %1242 = zext i32 %1241 to i64
  %1243 = shl nuw i64 %1240, %1242
  %1244 = or i64 %1243, %1236
  %1245 = add nuw nsw i32 %1235, 1
  %1246 = icmp eq i32 %1245, %1189
  br i1 %1246, label %1247, label %1234

1247:                                             ; preds = %1234, %1194, %1192
  %1248 = phi ptr [ %1233, %1194 ], [ %1188, %1192 ], [ %1188, %1234 ]
  %1249 = phi i32 [ %1232, %1194 ], [ 0, %1192 ], [ 0, %1234 ]
  %1250 = phi i64 [ %1231, %1194 ], [ 0, %1192 ], [ %1244, %1234 ]
  %1251 = icmp ugt i32 %1249, 7
  br i1 %1251, label %1254, label %1252

1252:                                             ; preds = %1247
  %1253 = icmp eq i32 %1249, 0
  br i1 %1253, label %1307, label %1294

1254:                                             ; preds = %1247
  %1255 = load i8, ptr %1248, align 1, !tbaa !13
  %1256 = zext i8 %1255 to i64
  %1257 = getelementptr inbounds i8, ptr %1248, i64 1
  %1258 = load i8, ptr %1257, align 1, !tbaa !13
  %1259 = zext i8 %1258 to i64
  %1260 = shl nuw nsw i64 %1259, 8
  %1261 = or i64 %1260, %1256
  %1262 = getelementptr inbounds i8, ptr %1248, i64 2
  %1263 = load i8, ptr %1262, align 1, !tbaa !13
  %1264 = zext i8 %1263 to i64
  %1265 = shl nuw nsw i64 %1264, 16
  %1266 = or i64 %1261, %1265
  %1267 = getelementptr inbounds i8, ptr %1248, i64 3
  %1268 = load i8, ptr %1267, align 1, !tbaa !13
  %1269 = zext i8 %1268 to i64
  %1270 = shl nuw nsw i64 %1269, 24
  %1271 = or i64 %1266, %1270
  %1272 = getelementptr inbounds i8, ptr %1248, i64 4
  %1273 = load i8, ptr %1272, align 1, !tbaa !13
  %1274 = zext i8 %1273 to i64
  %1275 = shl nuw nsw i64 %1274, 32
  %1276 = or i64 %1271, %1275
  %1277 = getelementptr inbounds i8, ptr %1248, i64 5
  %1278 = load i8, ptr %1277, align 1, !tbaa !13
  %1279 = zext i8 %1278 to i64
  %1280 = shl nuw nsw i64 %1279, 40
  %1281 = or i64 %1276, %1280
  %1282 = getelementptr inbounds i8, ptr %1248, i64 6
  %1283 = load i8, ptr %1282, align 1, !tbaa !13
  %1284 = zext i8 %1283 to i64
  %1285 = shl nuw nsw i64 %1284, 48
  %1286 = or i64 %1281, %1285
  %1287 = getelementptr inbounds i8, ptr %1248, i64 7
  %1288 = load i8, ptr %1287, align 1, !tbaa !13
  %1289 = zext i8 %1288 to i64
  %1290 = shl nuw i64 %1289, 56
  %1291 = or i64 %1286, %1290
  %1292 = add nsw i32 %1249, -8
  %1293 = getelementptr inbounds i8, ptr %1248, i64 8
  br label %1307

1294:                                             ; preds = %1252, %1294
  %1295 = phi i32 [ %1305, %1294 ], [ 0, %1252 ]
  %1296 = phi i64 [ %1304, %1294 ], [ 0, %1252 ]
  %1297 = zext i32 %1295 to i64
  %1298 = getelementptr inbounds i8, ptr %1248, i64 %1297
  %1299 = load i8, ptr %1298, align 1, !tbaa !13
  %1300 = zext i8 %1299 to i64
  %1301 = shl i32 %1295, 3
  %1302 = zext i32 %1301 to i64
  %1303 = shl nuw i64 %1300, %1302
  %1304 = or i64 %1303, %1296
  %1305 = add nuw nsw i32 %1295, 1
  %1306 = icmp eq i32 %1305, %1249
  br i1 %1306, label %1307, label %1294

1307:                                             ; preds = %1294, %1254, %1252
  %1308 = phi ptr [ %1293, %1254 ], [ %1248, %1252 ], [ %1248, %1294 ]
  %1309 = phi i32 [ %1292, %1254 ], [ 0, %1252 ], [ 0, %1294 ]
  %1310 = phi i64 [ %1291, %1254 ], [ 0, %1252 ], [ %1304, %1294 ]
  %1311 = icmp ugt i32 %1309, 7
  br i1 %1311, label %1314, label %1312

1312:                                             ; preds = %1307
  %1313 = icmp eq i32 %1309, 0
  br i1 %1313, label %1365, label %1352

1314:                                             ; preds = %1307
  %1315 = load i8, ptr %1308, align 1, !tbaa !13
  %1316 = zext i8 %1315 to i64
  %1317 = getelementptr inbounds i8, ptr %1308, i64 1
  %1318 = load i8, ptr %1317, align 1, !tbaa !13
  %1319 = zext i8 %1318 to i64
  %1320 = shl nuw nsw i64 %1319, 8
  %1321 = or i64 %1320, %1316
  %1322 = getelementptr inbounds i8, ptr %1308, i64 2
  %1323 = load i8, ptr %1322, align 1, !tbaa !13
  %1324 = zext i8 %1323 to i64
  %1325 = shl nuw nsw i64 %1324, 16
  %1326 = or i64 %1321, %1325
  %1327 = getelementptr inbounds i8, ptr %1308, i64 3
  %1328 = load i8, ptr %1327, align 1, !tbaa !13
  %1329 = zext i8 %1328 to i64
  %1330 = shl nuw nsw i64 %1329, 24
  %1331 = or i64 %1326, %1330
  %1332 = getelementptr inbounds i8, ptr %1308, i64 4
  %1333 = load i8, ptr %1332, align 1, !tbaa !13
  %1334 = zext i8 %1333 to i64
  %1335 = shl nuw nsw i64 %1334, 32
  %1336 = or i64 %1331, %1335
  %1337 = getelementptr inbounds i8, ptr %1308, i64 5
  %1338 = load i8, ptr %1337, align 1, !tbaa !13
  %1339 = zext i8 %1338 to i64
  %1340 = shl nuw nsw i64 %1339, 40
  %1341 = or i64 %1336, %1340
  %1342 = getelementptr inbounds i8, ptr %1308, i64 6
  %1343 = load i8, ptr %1342, align 1, !tbaa !13
  %1344 = zext i8 %1343 to i64
  %1345 = shl nuw nsw i64 %1344, 48
  %1346 = or i64 %1341, %1345
  %1347 = getelementptr inbounds i8, ptr %1308, i64 7
  %1348 = load i8, ptr %1347, align 1, !tbaa !13
  %1349 = zext i8 %1348 to i64
  %1350 = shl nuw i64 %1349, 56
  %1351 = or i64 %1346, %1350
  br label %1365

1352:                                             ; preds = %1312, %1352
  %1353 = phi i32 [ %1363, %1352 ], [ 0, %1312 ]
  %1354 = phi i64 [ %1362, %1352 ], [ 0, %1312 ]
  %1355 = zext i32 %1353 to i64
  %1356 = getelementptr inbounds i8, ptr %1308, i64 %1355
  %1357 = load i8, ptr %1356, align 1, !tbaa !13
  %1358 = zext i8 %1357 to i64
  %1359 = shl i32 %1353, 3
  %1360 = zext i32 %1359 to i64
  %1361 = shl nuw i64 %1358, %1360
  %1362 = or i64 %1361, %1354
  %1363 = add nuw nsw i32 %1353, 1
  %1364 = icmp eq i32 %1363, %1309
  br i1 %1364, label %1365, label %1352

1365:                                             ; preds = %1352, %1314, %1312
  %1366 = phi i64 [ %1351, %1314 ], [ 0, %1312 ], [ %1362, %1352 ]
  %1367 = shl nuw nsw i64 %948, 2
  %1368 = add nuw nsw i64 %1367, 28
  %1369 = and i64 %1368, 480
  %1370 = and i64 %950, -225
  %1371 = or i64 %1370, %1369
  %1372 = call fastcc <2 x i64> @__ockl_hostcall_internal(ptr noundef %8, i64 noundef %1371, i64 noundef %1010, i64 noundef %1070, i64 noundef %1130, i64 noundef %1190, i64 noundef %1250, i64 noundef %1310, i64 noundef %1366) #18
  %1373 = sub i64 %940, %948
  %1374 = getelementptr inbounds i8, ptr %941, i64 %948
  %1375 = icmp eq i64 %1373, 0
  br i1 %1375, label %1376, label %939

1376:                                             ; preds = %1365, %926
  %1377 = phi <2 x i64> [ %929, %926 ], [ %1372, %1365 ]
  %1378 = extractelement <2 x i64> %1377, i64 0
  br i1 icmp eq (ptr addrspacecast (ptr addrspace(4) @.str to ptr), ptr null), label %1379, label %1383

1379:                                             ; preds = %1376
  %1380 = and i64 %1378, -227
  %1381 = or i64 %1380, 34
  %1382 = call fastcc <2 x i64> @__ockl_hostcall_internal(ptr noundef %8, i64 noundef %1381, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #18
  br label %1823

1383:                                             ; preds = %1376
  %1384 = and i64 %1378, -3
  %1385 = insertelement <2 x i64> <i64 poison, i64 0>, i64 %1384, i64 0
  br label %1386

1386:                                             ; preds = %1812, %1383
  %1387 = phi i64 [ ashr (i64 shl (i64 sub (i64 ptrtoint (ptr addrspacecast (ptr addrspace(4) getelementptr inbounds ([42 x i8], ptr addrspace(4) @.str, i64 1, i64 0) to ptr) to i64), i64 sext (i32 ptrtoint (ptr addrspacecast (ptr addrspace(4) @.str to ptr) to i32) to i64)), i64 32), i64 32), %1383 ], [ %1820, %1812 ]
  %1388 = phi ptr addrspace(4) [ @.str, %1383 ], [ %1821, %1812 ]
  %1389 = phi <2 x i64> [ %1385, %1383 ], [ %1819, %1812 ]
  %1390 = icmp ugt i64 %1387, 56
  %1391 = extractelement <2 x i64> %1389, i64 0
  %1392 = or i64 %1391, 2
  %1393 = insertelement <2 x i64> poison, i64 %1392, i64 0
  %1394 = select i1 %1390, <2 x i64> %1389, <2 x i64> %1393
  %1395 = call i64 @llvm.umin.i64(i64 %1387, i64 56)
  %1396 = trunc i64 %1395 to i32
  %1397 = extractelement <2 x i64> %1394, i64 0
  %1398 = icmp ugt i32 %1396, 7
  br i1 %1398, label %1401, label %1399

1399:                                             ; preds = %1386
  %1400 = icmp eq i32 %1396, 0
  br i1 %1400, label %1454, label %1441

1401:                                             ; preds = %1386
  %1402 = load i8, ptr addrspace(4) %1388, align 1, !tbaa !13
  %1403 = zext i8 %1402 to i64
  %1404 = getelementptr inbounds i8, ptr addrspace(4) %1388, i64 1
  %1405 = load i8, ptr addrspace(4) %1404, align 1, !tbaa !13
  %1406 = zext i8 %1405 to i64
  %1407 = shl nuw nsw i64 %1406, 8
  %1408 = or i64 %1407, %1403
  %1409 = getelementptr inbounds i8, ptr addrspace(4) %1388, i64 2
  %1410 = load i8, ptr addrspace(4) %1409, align 1, !tbaa !13
  %1411 = zext i8 %1410 to i64
  %1412 = shl nuw nsw i64 %1411, 16
  %1413 = or i64 %1408, %1412
  %1414 = getelementptr inbounds i8, ptr addrspace(4) %1388, i64 3
  %1415 = load i8, ptr addrspace(4) %1414, align 1, !tbaa !13
  %1416 = zext i8 %1415 to i64
  %1417 = shl nuw nsw i64 %1416, 24
  %1418 = or i64 %1413, %1417
  %1419 = getelementptr inbounds i8, ptr addrspace(4) %1388, i64 4
  %1420 = load i8, ptr addrspace(4) %1419, align 1, !tbaa !13
  %1421 = zext i8 %1420 to i64
  %1422 = shl nuw nsw i64 %1421, 32
  %1423 = or i64 %1418, %1422
  %1424 = getelementptr inbounds i8, ptr addrspace(4) %1388, i64 5
  %1425 = load i8, ptr addrspace(4) %1424, align 1, !tbaa !13
  %1426 = zext i8 %1425 to i64
  %1427 = shl nuw nsw i64 %1426, 40
  %1428 = or i64 %1423, %1427
  %1429 = getelementptr inbounds i8, ptr addrspace(4) %1388, i64 6
  %1430 = load i8, ptr addrspace(4) %1429, align 1, !tbaa !13
  %1431 = zext i8 %1430 to i64
  %1432 = shl nuw nsw i64 %1431, 48
  %1433 = or i64 %1428, %1432
  %1434 = getelementptr inbounds i8, ptr addrspace(4) %1388, i64 7
  %1435 = load i8, ptr addrspace(4) %1434, align 1, !tbaa !13
  %1436 = zext i8 %1435 to i64
  %1437 = shl nuw i64 %1436, 56
  %1438 = or i64 %1433, %1437
  %1439 = add nsw i32 %1396, -8
  %1440 = getelementptr inbounds i8, ptr addrspace(4) %1388, i64 8
  br label %1454

1441:                                             ; preds = %1399, %1441
  %1442 = phi i32 [ %1452, %1441 ], [ 0, %1399 ]
  %1443 = phi i64 [ %1451, %1441 ], [ 0, %1399 ]
  %1444 = zext i32 %1442 to i64
  %1445 = getelementptr inbounds i8, ptr addrspace(4) %1388, i64 %1444
  %1446 = load i8, ptr addrspace(4) %1445, align 1, !tbaa !13
  %1447 = zext i8 %1446 to i64
  %1448 = shl i32 %1442, 3
  %1449 = zext i32 %1448 to i64
  %1450 = shl nuw i64 %1447, %1449
  %1451 = or i64 %1450, %1443
  %1452 = add nuw nsw i32 %1442, 1
  %1453 = icmp eq i32 %1452, %1396
  br i1 %1453, label %1454, label %1441

1454:                                             ; preds = %1441, %1401, %1399
  %1455 = phi ptr addrspace(4) [ %1440, %1401 ], [ %1388, %1399 ], [ %1388, %1441 ]
  %1456 = phi i32 [ %1439, %1401 ], [ 0, %1399 ], [ 0, %1441 ]
  %1457 = phi i64 [ %1438, %1401 ], [ 0, %1399 ], [ %1451, %1441 ]
  %1458 = icmp ugt i32 %1456, 7
  br i1 %1458, label %1461, label %1459

1459:                                             ; preds = %1454
  %1460 = icmp eq i32 %1456, 0
  br i1 %1460, label %1514, label %1501

1461:                                             ; preds = %1454
  %1462 = load i8, ptr addrspace(4) %1455, align 1, !tbaa !13
  %1463 = zext i8 %1462 to i64
  %1464 = getelementptr inbounds i8, ptr addrspace(4) %1455, i64 1
  %1465 = load i8, ptr addrspace(4) %1464, align 1, !tbaa !13
  %1466 = zext i8 %1465 to i64
  %1467 = shl nuw nsw i64 %1466, 8
  %1468 = or i64 %1467, %1463
  %1469 = getelementptr inbounds i8, ptr addrspace(4) %1455, i64 2
  %1470 = load i8, ptr addrspace(4) %1469, align 1, !tbaa !13
  %1471 = zext i8 %1470 to i64
  %1472 = shl nuw nsw i64 %1471, 16
  %1473 = or i64 %1468, %1472
  %1474 = getelementptr inbounds i8, ptr addrspace(4) %1455, i64 3
  %1475 = load i8, ptr addrspace(4) %1474, align 1, !tbaa !13
  %1476 = zext i8 %1475 to i64
  %1477 = shl nuw nsw i64 %1476, 24
  %1478 = or i64 %1473, %1477
  %1479 = getelementptr inbounds i8, ptr addrspace(4) %1455, i64 4
  %1480 = load i8, ptr addrspace(4) %1479, align 1, !tbaa !13
  %1481 = zext i8 %1480 to i64
  %1482 = shl nuw nsw i64 %1481, 32
  %1483 = or i64 %1478, %1482
  %1484 = getelementptr inbounds i8, ptr addrspace(4) %1455, i64 5
  %1485 = load i8, ptr addrspace(4) %1484, align 1, !tbaa !13
  %1486 = zext i8 %1485 to i64
  %1487 = shl nuw nsw i64 %1486, 40
  %1488 = or i64 %1483, %1487
  %1489 = getelementptr inbounds i8, ptr addrspace(4) %1455, i64 6
  %1490 = load i8, ptr addrspace(4) %1489, align 1, !tbaa !13
  %1491 = zext i8 %1490 to i64
  %1492 = shl nuw nsw i64 %1491, 48
  %1493 = or i64 %1488, %1492
  %1494 = getelementptr inbounds i8, ptr addrspace(4) %1455, i64 7
  %1495 = load i8, ptr addrspace(4) %1494, align 1, !tbaa !13
  %1496 = zext i8 %1495 to i64
  %1497 = shl nuw i64 %1496, 56
  %1498 = or i64 %1493, %1497
  %1499 = add nsw i32 %1456, -8
  %1500 = getelementptr inbounds i8, ptr addrspace(4) %1455, i64 8
  br label %1514

1501:                                             ; preds = %1459, %1501
  %1502 = phi i32 [ %1512, %1501 ], [ 0, %1459 ]
  %1503 = phi i64 [ %1511, %1501 ], [ 0, %1459 ]
  %1504 = zext i32 %1502 to i64
  %1505 = getelementptr inbounds i8, ptr addrspace(4) %1455, i64 %1504
  %1506 = load i8, ptr addrspace(4) %1505, align 1, !tbaa !13
  %1507 = zext i8 %1506 to i64
  %1508 = shl i32 %1502, 3
  %1509 = zext i32 %1508 to i64
  %1510 = shl nuw i64 %1507, %1509
  %1511 = or i64 %1510, %1503
  %1512 = add nuw nsw i32 %1502, 1
  %1513 = icmp eq i32 %1512, %1456
  br i1 %1513, label %1514, label %1501

1514:                                             ; preds = %1501, %1461, %1459
  %1515 = phi ptr addrspace(4) [ %1500, %1461 ], [ %1455, %1459 ], [ %1455, %1501 ]
  %1516 = phi i32 [ %1499, %1461 ], [ 0, %1459 ], [ 0, %1501 ]
  %1517 = phi i64 [ %1498, %1461 ], [ 0, %1459 ], [ %1511, %1501 ]
  %1518 = icmp ugt i32 %1516, 7
  br i1 %1518, label %1521, label %1519

1519:                                             ; preds = %1514
  %1520 = icmp eq i32 %1516, 0
  br i1 %1520, label %1574, label %1561

1521:                                             ; preds = %1514
  %1522 = load i8, ptr addrspace(4) %1515, align 1, !tbaa !13
  %1523 = zext i8 %1522 to i64
  %1524 = getelementptr inbounds i8, ptr addrspace(4) %1515, i64 1
  %1525 = load i8, ptr addrspace(4) %1524, align 1, !tbaa !13
  %1526 = zext i8 %1525 to i64
  %1527 = shl nuw nsw i64 %1526, 8
  %1528 = or i64 %1527, %1523
  %1529 = getelementptr inbounds i8, ptr addrspace(4) %1515, i64 2
  %1530 = load i8, ptr addrspace(4) %1529, align 1, !tbaa !13
  %1531 = zext i8 %1530 to i64
  %1532 = shl nuw nsw i64 %1531, 16
  %1533 = or i64 %1528, %1532
  %1534 = getelementptr inbounds i8, ptr addrspace(4) %1515, i64 3
  %1535 = load i8, ptr addrspace(4) %1534, align 1, !tbaa !13
  %1536 = zext i8 %1535 to i64
  %1537 = shl nuw nsw i64 %1536, 24
  %1538 = or i64 %1533, %1537
  %1539 = getelementptr inbounds i8, ptr addrspace(4) %1515, i64 4
  %1540 = load i8, ptr addrspace(4) %1539, align 1, !tbaa !13
  %1541 = zext i8 %1540 to i64
  %1542 = shl nuw nsw i64 %1541, 32
  %1543 = or i64 %1538, %1542
  %1544 = getelementptr inbounds i8, ptr addrspace(4) %1515, i64 5
  %1545 = load i8, ptr addrspace(4) %1544, align 1, !tbaa !13
  %1546 = zext i8 %1545 to i64
  %1547 = shl nuw nsw i64 %1546, 40
  %1548 = or i64 %1543, %1547
  %1549 = getelementptr inbounds i8, ptr addrspace(4) %1515, i64 6
  %1550 = load i8, ptr addrspace(4) %1549, align 1, !tbaa !13
  %1551 = zext i8 %1550 to i64
  %1552 = shl nuw nsw i64 %1551, 48
  %1553 = or i64 %1548, %1552
  %1554 = getelementptr inbounds i8, ptr addrspace(4) %1515, i64 7
  %1555 = load i8, ptr addrspace(4) %1554, align 1, !tbaa !13
  %1556 = zext i8 %1555 to i64
  %1557 = shl nuw i64 %1556, 56
  %1558 = or i64 %1553, %1557
  %1559 = add nsw i32 %1516, -8
  %1560 = getelementptr inbounds i8, ptr addrspace(4) %1515, i64 8
  br label %1574

1561:                                             ; preds = %1519, %1561
  %1562 = phi i32 [ %1572, %1561 ], [ 0, %1519 ]
  %1563 = phi i64 [ %1571, %1561 ], [ 0, %1519 ]
  %1564 = zext i32 %1562 to i64
  %1565 = getelementptr inbounds i8, ptr addrspace(4) %1515, i64 %1564
  %1566 = load i8, ptr addrspace(4) %1565, align 1, !tbaa !13
  %1567 = zext i8 %1566 to i64
  %1568 = shl i32 %1562, 3
  %1569 = zext i32 %1568 to i64
  %1570 = shl nuw i64 %1567, %1569
  %1571 = or i64 %1570, %1563
  %1572 = add nuw nsw i32 %1562, 1
  %1573 = icmp eq i32 %1572, %1516
  br i1 %1573, label %1574, label %1561

1574:                                             ; preds = %1561, %1521, %1519
  %1575 = phi ptr addrspace(4) [ %1560, %1521 ], [ %1515, %1519 ], [ %1515, %1561 ]
  %1576 = phi i32 [ %1559, %1521 ], [ 0, %1519 ], [ 0, %1561 ]
  %1577 = phi i64 [ %1558, %1521 ], [ 0, %1519 ], [ %1571, %1561 ]
  %1578 = icmp ugt i32 %1576, 7
  br i1 %1578, label %1581, label %1579

1579:                                             ; preds = %1574
  %1580 = icmp eq i32 %1576, 0
  br i1 %1580, label %1634, label %1621

1581:                                             ; preds = %1574
  %1582 = load i8, ptr addrspace(4) %1575, align 1, !tbaa !13
  %1583 = zext i8 %1582 to i64
  %1584 = getelementptr inbounds i8, ptr addrspace(4) %1575, i64 1
  %1585 = load i8, ptr addrspace(4) %1584, align 1, !tbaa !13
  %1586 = zext i8 %1585 to i64
  %1587 = shl nuw nsw i64 %1586, 8
  %1588 = or i64 %1587, %1583
  %1589 = getelementptr inbounds i8, ptr addrspace(4) %1575, i64 2
  %1590 = load i8, ptr addrspace(4) %1589, align 1, !tbaa !13
  %1591 = zext i8 %1590 to i64
  %1592 = shl nuw nsw i64 %1591, 16
  %1593 = or i64 %1588, %1592
  %1594 = getelementptr inbounds i8, ptr addrspace(4) %1575, i64 3
  %1595 = load i8, ptr addrspace(4) %1594, align 1, !tbaa !13
  %1596 = zext i8 %1595 to i64
  %1597 = shl nuw nsw i64 %1596, 24
  %1598 = or i64 %1593, %1597
  %1599 = getelementptr inbounds i8, ptr addrspace(4) %1575, i64 4
  %1600 = load i8, ptr addrspace(4) %1599, align 1, !tbaa !13
  %1601 = zext i8 %1600 to i64
  %1602 = shl nuw nsw i64 %1601, 32
  %1603 = or i64 %1598, %1602
  %1604 = getelementptr inbounds i8, ptr addrspace(4) %1575, i64 5
  %1605 = load i8, ptr addrspace(4) %1604, align 1, !tbaa !13
  %1606 = zext i8 %1605 to i64
  %1607 = shl nuw nsw i64 %1606, 40
  %1608 = or i64 %1603, %1607
  %1609 = getelementptr inbounds i8, ptr addrspace(4) %1575, i64 6
  %1610 = load i8, ptr addrspace(4) %1609, align 1, !tbaa !13
  %1611 = zext i8 %1610 to i64
  %1612 = shl nuw nsw i64 %1611, 48
  %1613 = or i64 %1608, %1612
  %1614 = getelementptr inbounds i8, ptr addrspace(4) %1575, i64 7
  %1615 = load i8, ptr addrspace(4) %1614, align 1, !tbaa !13
  %1616 = zext i8 %1615 to i64
  %1617 = shl nuw i64 %1616, 56
  %1618 = or i64 %1613, %1617
  %1619 = add nsw i32 %1576, -8
  %1620 = getelementptr inbounds i8, ptr addrspace(4) %1575, i64 8
  br label %1634

1621:                                             ; preds = %1579, %1621
  %1622 = phi i32 [ %1632, %1621 ], [ 0, %1579 ]
  %1623 = phi i64 [ %1631, %1621 ], [ 0, %1579 ]
  %1624 = zext i32 %1622 to i64
  %1625 = getelementptr inbounds i8, ptr addrspace(4) %1575, i64 %1624
  %1626 = load i8, ptr addrspace(4) %1625, align 1, !tbaa !13
  %1627 = zext i8 %1626 to i64
  %1628 = shl i32 %1622, 3
  %1629 = zext i32 %1628 to i64
  %1630 = shl nuw i64 %1627, %1629
  %1631 = or i64 %1630, %1623
  %1632 = add nuw nsw i32 %1622, 1
  %1633 = icmp eq i32 %1632, %1576
  br i1 %1633, label %1634, label %1621

1634:                                             ; preds = %1621, %1581, %1579
  %1635 = phi ptr addrspace(4) [ %1620, %1581 ], [ %1575, %1579 ], [ %1575, %1621 ]
  %1636 = phi i32 [ %1619, %1581 ], [ 0, %1579 ], [ 0, %1621 ]
  %1637 = phi i64 [ %1618, %1581 ], [ 0, %1579 ], [ %1631, %1621 ]
  %1638 = icmp ugt i32 %1636, 7
  br i1 %1638, label %1641, label %1639

1639:                                             ; preds = %1634
  %1640 = icmp eq i32 %1636, 0
  br i1 %1640, label %1694, label %1681

1641:                                             ; preds = %1634
  %1642 = load i8, ptr addrspace(4) %1635, align 1, !tbaa !13
  %1643 = zext i8 %1642 to i64
  %1644 = getelementptr inbounds i8, ptr addrspace(4) %1635, i64 1
  %1645 = load i8, ptr addrspace(4) %1644, align 1, !tbaa !13
  %1646 = zext i8 %1645 to i64
  %1647 = shl nuw nsw i64 %1646, 8
  %1648 = or i64 %1647, %1643
  %1649 = getelementptr inbounds i8, ptr addrspace(4) %1635, i64 2
  %1650 = load i8, ptr addrspace(4) %1649, align 1, !tbaa !13
  %1651 = zext i8 %1650 to i64
  %1652 = shl nuw nsw i64 %1651, 16
  %1653 = or i64 %1648, %1652
  %1654 = getelementptr inbounds i8, ptr addrspace(4) %1635, i64 3
  %1655 = load i8, ptr addrspace(4) %1654, align 1, !tbaa !13
  %1656 = zext i8 %1655 to i64
  %1657 = shl nuw nsw i64 %1656, 24
  %1658 = or i64 %1653, %1657
  %1659 = getelementptr inbounds i8, ptr addrspace(4) %1635, i64 4
  %1660 = load i8, ptr addrspace(4) %1659, align 1, !tbaa !13
  %1661 = zext i8 %1660 to i64
  %1662 = shl nuw nsw i64 %1661, 32
  %1663 = or i64 %1658, %1662
  %1664 = getelementptr inbounds i8, ptr addrspace(4) %1635, i64 5
  %1665 = load i8, ptr addrspace(4) %1664, align 1, !tbaa !13
  %1666 = zext i8 %1665 to i64
  %1667 = shl nuw nsw i64 %1666, 40
  %1668 = or i64 %1663, %1667
  %1669 = getelementptr inbounds i8, ptr addrspace(4) %1635, i64 6
  %1670 = load i8, ptr addrspace(4) %1669, align 1, !tbaa !13
  %1671 = zext i8 %1670 to i64
  %1672 = shl nuw nsw i64 %1671, 48
  %1673 = or i64 %1668, %1672
  %1674 = getelementptr inbounds i8, ptr addrspace(4) %1635, i64 7
  %1675 = load i8, ptr addrspace(4) %1674, align 1, !tbaa !13
  %1676 = zext i8 %1675 to i64
  %1677 = shl nuw i64 %1676, 56
  %1678 = or i64 %1673, %1677
  %1679 = add nsw i32 %1636, -8
  %1680 = getelementptr inbounds i8, ptr addrspace(4) %1635, i64 8
  br label %1694

1681:                                             ; preds = %1639, %1681
  %1682 = phi i32 [ %1692, %1681 ], [ 0, %1639 ]
  %1683 = phi i64 [ %1691, %1681 ], [ 0, %1639 ]
  %1684 = zext i32 %1682 to i64
  %1685 = getelementptr inbounds i8, ptr addrspace(4) %1635, i64 %1684
  %1686 = load i8, ptr addrspace(4) %1685, align 1, !tbaa !13
  %1687 = zext i8 %1686 to i64
  %1688 = shl i32 %1682, 3
  %1689 = zext i32 %1688 to i64
  %1690 = shl nuw i64 %1687, %1689
  %1691 = or i64 %1690, %1683
  %1692 = add nuw nsw i32 %1682, 1
  %1693 = icmp eq i32 %1692, %1636
  br i1 %1693, label %1694, label %1681

1694:                                             ; preds = %1681, %1641, %1639
  %1695 = phi ptr addrspace(4) [ %1680, %1641 ], [ %1635, %1639 ], [ %1635, %1681 ]
  %1696 = phi i32 [ %1679, %1641 ], [ 0, %1639 ], [ 0, %1681 ]
  %1697 = phi i64 [ %1678, %1641 ], [ 0, %1639 ], [ %1691, %1681 ]
  %1698 = icmp ugt i32 %1696, 7
  br i1 %1698, label %1701, label %1699

1699:                                             ; preds = %1694
  %1700 = icmp eq i32 %1696, 0
  br i1 %1700, label %1754, label %1741

1701:                                             ; preds = %1694
  %1702 = load i8, ptr addrspace(4) %1695, align 1, !tbaa !13
  %1703 = zext i8 %1702 to i64
  %1704 = getelementptr inbounds i8, ptr addrspace(4) %1695, i64 1
  %1705 = load i8, ptr addrspace(4) %1704, align 1, !tbaa !13
  %1706 = zext i8 %1705 to i64
  %1707 = shl nuw nsw i64 %1706, 8
  %1708 = or i64 %1707, %1703
  %1709 = getelementptr inbounds i8, ptr addrspace(4) %1695, i64 2
  %1710 = load i8, ptr addrspace(4) %1709, align 1, !tbaa !13
  %1711 = zext i8 %1710 to i64
  %1712 = shl nuw nsw i64 %1711, 16
  %1713 = or i64 %1708, %1712
  %1714 = getelementptr inbounds i8, ptr addrspace(4) %1695, i64 3
  %1715 = load i8, ptr addrspace(4) %1714, align 1, !tbaa !13
  %1716 = zext i8 %1715 to i64
  %1717 = shl nuw nsw i64 %1716, 24
  %1718 = or i64 %1713, %1717
  %1719 = getelementptr inbounds i8, ptr addrspace(4) %1695, i64 4
  %1720 = load i8, ptr addrspace(4) %1719, align 1, !tbaa !13
  %1721 = zext i8 %1720 to i64
  %1722 = shl nuw nsw i64 %1721, 32
  %1723 = or i64 %1718, %1722
  %1724 = getelementptr inbounds i8, ptr addrspace(4) %1695, i64 5
  %1725 = load i8, ptr addrspace(4) %1724, align 1, !tbaa !13
  %1726 = zext i8 %1725 to i64
  %1727 = shl nuw nsw i64 %1726, 40
  %1728 = or i64 %1723, %1727
  %1729 = getelementptr inbounds i8, ptr addrspace(4) %1695, i64 6
  %1730 = load i8, ptr addrspace(4) %1729, align 1, !tbaa !13
  %1731 = zext i8 %1730 to i64
  %1732 = shl nuw nsw i64 %1731, 48
  %1733 = or i64 %1728, %1732
  %1734 = getelementptr inbounds i8, ptr addrspace(4) %1695, i64 7
  %1735 = load i8, ptr addrspace(4) %1734, align 1, !tbaa !13
  %1736 = zext i8 %1735 to i64
  %1737 = shl nuw i64 %1736, 56
  %1738 = or i64 %1733, %1737
  %1739 = add nsw i32 %1696, -8
  %1740 = getelementptr inbounds i8, ptr addrspace(4) %1695, i64 8
  br label %1754

1741:                                             ; preds = %1699, %1741
  %1742 = phi i32 [ %1752, %1741 ], [ 0, %1699 ]
  %1743 = phi i64 [ %1751, %1741 ], [ 0, %1699 ]
  %1744 = zext i32 %1742 to i64
  %1745 = getelementptr inbounds i8, ptr addrspace(4) %1695, i64 %1744
  %1746 = load i8, ptr addrspace(4) %1745, align 1, !tbaa !13
  %1747 = zext i8 %1746 to i64
  %1748 = shl i32 %1742, 3
  %1749 = zext i32 %1748 to i64
  %1750 = shl nuw i64 %1747, %1749
  %1751 = or i64 %1750, %1743
  %1752 = add nuw nsw i32 %1742, 1
  %1753 = icmp eq i32 %1752, %1696
  br i1 %1753, label %1754, label %1741

1754:                                             ; preds = %1741, %1701, %1699
  %1755 = phi ptr addrspace(4) [ %1740, %1701 ], [ %1695, %1699 ], [ %1695, %1741 ]
  %1756 = phi i32 [ %1739, %1701 ], [ 0, %1699 ], [ 0, %1741 ]
  %1757 = phi i64 [ %1738, %1701 ], [ 0, %1699 ], [ %1751, %1741 ]
  %1758 = icmp ugt i32 %1756, 7
  br i1 %1758, label %1761, label %1759

1759:                                             ; preds = %1754
  %1760 = icmp eq i32 %1756, 0
  br i1 %1760, label %1812, label %1799

1761:                                             ; preds = %1754
  %1762 = load i8, ptr addrspace(4) %1755, align 1, !tbaa !13
  %1763 = zext i8 %1762 to i64
  %1764 = getelementptr inbounds i8, ptr addrspace(4) %1755, i64 1
  %1765 = load i8, ptr addrspace(4) %1764, align 1, !tbaa !13
  %1766 = zext i8 %1765 to i64
  %1767 = shl nuw nsw i64 %1766, 8
  %1768 = or i64 %1767, %1763
  %1769 = getelementptr inbounds i8, ptr addrspace(4) %1755, i64 2
  %1770 = load i8, ptr addrspace(4) %1769, align 1, !tbaa !13
  %1771 = zext i8 %1770 to i64
  %1772 = shl nuw nsw i64 %1771, 16
  %1773 = or i64 %1768, %1772
  %1774 = getelementptr inbounds i8, ptr addrspace(4) %1755, i64 3
  %1775 = load i8, ptr addrspace(4) %1774, align 1, !tbaa !13
  %1776 = zext i8 %1775 to i64
  %1777 = shl nuw nsw i64 %1776, 24
  %1778 = or i64 %1773, %1777
  %1779 = getelementptr inbounds i8, ptr addrspace(4) %1755, i64 4
  %1780 = load i8, ptr addrspace(4) %1779, align 1, !tbaa !13
  %1781 = zext i8 %1780 to i64
  %1782 = shl nuw nsw i64 %1781, 32
  %1783 = or i64 %1778, %1782
  %1784 = getelementptr inbounds i8, ptr addrspace(4) %1755, i64 5
  %1785 = load i8, ptr addrspace(4) %1784, align 1, !tbaa !13
  %1786 = zext i8 %1785 to i64
  %1787 = shl nuw nsw i64 %1786, 40
  %1788 = or i64 %1783, %1787
  %1789 = getelementptr inbounds i8, ptr addrspace(4) %1755, i64 6
  %1790 = load i8, ptr addrspace(4) %1789, align 1, !tbaa !13
  %1791 = zext i8 %1790 to i64
  %1792 = shl nuw nsw i64 %1791, 48
  %1793 = or i64 %1788, %1792
  %1794 = getelementptr inbounds i8, ptr addrspace(4) %1755, i64 7
  %1795 = load i8, ptr addrspace(4) %1794, align 1, !tbaa !13
  %1796 = zext i8 %1795 to i64
  %1797 = shl nuw i64 %1796, 56
  %1798 = or i64 %1793, %1797
  br label %1812

1799:                                             ; preds = %1759, %1799
  %1800 = phi i32 [ %1810, %1799 ], [ 0, %1759 ]
  %1801 = phi i64 [ %1809, %1799 ], [ 0, %1759 ]
  %1802 = zext i32 %1800 to i64
  %1803 = getelementptr inbounds i8, ptr addrspace(4) %1755, i64 %1802
  %1804 = load i8, ptr addrspace(4) %1803, align 1, !tbaa !13
  %1805 = zext i8 %1804 to i64
  %1806 = shl i32 %1800, 3
  %1807 = zext i32 %1806 to i64
  %1808 = shl nuw i64 %1805, %1807
  %1809 = or i64 %1808, %1801
  %1810 = add nuw nsw i32 %1800, 1
  %1811 = icmp eq i32 %1810, %1756
  br i1 %1811, label %1812, label %1799

1812:                                             ; preds = %1799, %1761, %1759
  %1813 = phi i64 [ %1798, %1761 ], [ 0, %1759 ], [ %1809, %1799 ]
  %1814 = shl nuw nsw i64 %1395, 2
  %1815 = add nuw nsw i64 %1814, 28
  %1816 = and i64 %1815, 480
  %1817 = and i64 %1397, -225
  %1818 = or i64 %1817, %1816
  %1819 = call fastcc <2 x i64> @__ockl_hostcall_internal(ptr noundef %8, i64 noundef %1818, i64 noundef %1457, i64 noundef %1517, i64 noundef %1577, i64 noundef %1637, i64 noundef %1697, i64 noundef %1757, i64 noundef %1813) #18
  %1820 = sub i64 %1387, %1395
  %1821 = getelementptr inbounds i8, ptr addrspace(4) %1388, i64 %1395
  %1822 = icmp eq i64 %1820, 0
  br i1 %1822, label %1823, label %1386

1823:                                             ; preds = %1812, %1379
  call void @llvm.trap()
  unreachable
}

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p5(i64 immarg, ptr addrspace(5) nocapture) #2

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p5(i64 immarg, ptr addrspace(5) nocapture) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone willreturn
declare i32 @llvm.amdgcn.mbcnt.lo(i32, i32) #3

; Function Attrs: mustprogress nofree nosync nounwind readnone willreturn
declare i32 @llvm.amdgcn.mbcnt.hi(i32, i32) #3

; Function Attrs: convergent mustprogress noinline norecurse nounwind
define internal fastcc noundef i32 @_Z7cg_rankN18cooperative_groups12thread_groupE(i32 %0, i32 %1, i64 %2, %"struct.cooperative_groups::thread_group::_coalesced_info" %3) unnamed_addr #4 {
  switch i32 %0, label %201 [
    i32 1, label %5
    i32 2, label %85
    i32 3, label %137
    i32 4, label %164
    i32 5, label %194
  ]

5:                                                ; preds = %4
  %6 = tail call ptr addrspace(4) @llvm.amdgcn.implicitarg.ptr()
  %7 = getelementptr inbounds i64, ptr addrspace(4) %6, i64 6
  %8 = load i64, ptr addrspace(4) %7, align 8, !tbaa !4
  %9 = inttoptr i64 %8 to ptr addrspace(4)
  %10 = getelementptr inbounds %0, ptr addrspace(4) %9, i64 0, i32 3
  %11 = load i64, ptr addrspace(4) %10, align 8, !tbaa !15
  %12 = tail call align 4 ptr addrspace(4) @llvm.amdgcn.dispatch.ptr()
  %13 = getelementptr inbounds %1, ptr addrspace(4) %12, i64 0, i32 1
  %14 = load i16, ptr addrspace(4) %13, align 2, !tbaa !19
  switch i16 %14, label %81 [
    i16 1, label %15
    i16 2, label %24
    i16 3, label %46
  ]

15:                                               ; preds = %5
  %16 = getelementptr i8, ptr addrspace(4) %12, i64 4
  %17 = load i16, ptr addrspace(4) %16, align 4
  %18 = zext i16 %17 to i32
  %19 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %20 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !21
  %21 = mul i32 %19, %18
  %22 = add i32 %21, %20
  %23 = zext i32 %22 to i64
  br label %81

24:                                               ; preds = %5
  %25 = getelementptr inbounds %1, ptr addrspace(4) %12, i64 0, i32 6
  %26 = load i32, ptr addrspace(4) %25, align 4, !tbaa !22
  %27 = getelementptr i8, ptr addrspace(4) %12, i64 6
  %28 = getelementptr i8, ptr addrspace(4) %12, i64 4
  %29 = load i16, ptr addrspace(4) %28, align 4, !range !25, !invariant.load !26
  %30 = zext i16 %29 to i32
  %31 = load i16, ptr addrspace(4) %27, align 2
  %32 = zext i16 %31 to i32
  %33 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %34 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %35 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !21
  %36 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !21
  %37 = mul i32 %34, %30
  %38 = add i32 %37, %36
  %39 = mul i32 %33, %32
  %40 = add i32 %39, %35
  %41 = zext i32 %40 to i64
  %42 = zext i32 %26 to i64
  %43 = mul nuw i64 %41, %42
  %44 = zext i32 %38 to i64
  %45 = add nuw i64 %43, %44
  br label %81

46:                                               ; preds = %5
  %47 = getelementptr inbounds %1, ptr addrspace(4) %12, i64 0, i32 7
  %48 = load i32, ptr addrspace(4) %47, align 8, !tbaa !27
  %49 = getelementptr inbounds %1, ptr addrspace(4) %12, i64 0, i32 6
  %50 = load i32, ptr addrspace(4) %49, align 4, !tbaa !22
  %51 = getelementptr i8, ptr addrspace(4) %12, i64 8
  %52 = getelementptr i8, ptr addrspace(4) %12, i64 6
  %53 = load i16, ptr addrspace(4) %52, align 2, !range !25, !invariant.load !26
  %54 = zext i16 %53 to i32
  %55 = getelementptr i8, ptr addrspace(4) %12, i64 4
  %56 = load i16, ptr addrspace(4) %55, align 4, !range !25, !invariant.load !26
  %57 = zext i16 %56 to i32
  %58 = load i16, ptr addrspace(4) %51, align 4
  %59 = zext i16 %58 to i32
  %60 = tail call i32 @llvm.amdgcn.workgroup.id.z()
  %61 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %62 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %63 = tail call i32 @llvm.amdgcn.workitem.id.z(), !range !21
  %64 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !21
  %65 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !21
  %66 = mul i32 %62, %57
  %67 = add i32 %66, %65
  %68 = mul i32 %61, %54
  %69 = add i32 %68, %64
  %70 = mul i32 %60, %59
  %71 = add i32 %70, %63
  %72 = zext i32 %71 to i64
  %73 = zext i32 %48 to i64
  %74 = mul nuw i64 %72, %73
  %75 = zext i32 %69 to i64
  %76 = add nuw i64 %74, %75
  %77 = zext i32 %50 to i64
  %78 = mul i64 %76, %77
  %79 = zext i32 %67 to i64
  %80 = add i64 %78, %79
  br label %81

81:                                               ; preds = %46, %24, %15, %5
  %82 = phi i64 [ %80, %46 ], [ %45, %24 ], [ %23, %15 ], [ 0, %5 ]
  %83 = add i64 %82, %11
  %84 = trunc i64 %83 to i32
  br label %202

85:                                               ; preds = %4
  %86 = tail call i32 @llvm.amdgcn.workgroup.id.z()
  %87 = tail call align 4 dereferenceable(64) ptr addrspace(4) @llvm.amdgcn.dispatch.ptr()
  %88 = getelementptr inbounds %1, ptr addrspace(4) %87, i64 0, i32 7
  %89 = load i32, ptr addrspace(4) %88, align 8, !tbaa !27
  %90 = getelementptr i8, ptr addrspace(4) %87, i64 6
  %91 = load i16, ptr addrspace(4) %90, align 2, !range !25, !invariant.load !26
  %92 = zext i16 %91 to i32
  %93 = udiv i32 %89, %92
  %94 = mul i32 %93, %92
  %95 = icmp ugt i32 %89, %94
  %96 = zext i1 %95 to i32
  %97 = add i32 %93, %96
  %98 = mul i32 %97, %86
  %99 = getelementptr inbounds %1, ptr addrspace(4) %87, i64 0, i32 6
  %100 = load i32, ptr addrspace(4) %99, align 4, !tbaa !22
  %101 = getelementptr i8, ptr addrspace(4) %87, i64 4
  %102 = load i16, ptr addrspace(4) %101, align 4, !range !25, !invariant.load !26
  %103 = zext i16 %102 to i32
  %104 = udiv i32 %100, %103
  %105 = mul i32 %104, %103
  %106 = icmp ugt i32 %100, %105
  %107 = zext i1 %106 to i32
  %108 = add i32 %104, %107
  %109 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %110 = add i32 %98, %109
  %111 = mul i32 %108, %110
  %112 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %113 = add i32 %111, %112
  %114 = mul i32 %112, %103
  %115 = sub i32 %100, %114
  %116 = tail call i32 @llvm.umin.i32(i32 %115, i32 %103)
  %117 = mul i32 %109, %92
  %118 = sub i32 %89, %117
  %119 = tail call i32 @llvm.umin.i32(i32 %118, i32 %92)
  %120 = getelementptr i8, ptr addrspace(4) %87, i64 8
  %121 = load i16, ptr addrspace(4) %120, align 4, !range !25, !invariant.load !26
  %122 = zext i16 %121 to i32
  %123 = getelementptr inbounds %1, ptr addrspace(4) %87, i64 0, i32 8
  %124 = load i32, ptr addrspace(4) %123, align 4, !tbaa !28
  %125 = mul i32 %86, %122
  %126 = sub i32 %124, %125
  %127 = tail call i32 @llvm.umin.i32(i32 %126, i32 %122)
  %128 = mul i32 %113, %127
  %129 = tail call i32 @llvm.amdgcn.workitem.id.z(), !range !21
  %130 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !21
  %131 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !21
  %132 = add i32 %128, %129
  %133 = mul i32 %132, %119
  %134 = add i32 %133, %130
  %135 = mul i32 %134, %116
  %136 = add i32 %135, %131
  br label %202

137:                                              ; preds = %4
  %138 = tail call i32 @llvm.amdgcn.workitem.id.z(), !range !21
  %139 = tail call align 4 dereferenceable(64) ptr addrspace(4) @llvm.amdgcn.dispatch.ptr()
  %140 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %141 = getelementptr i8, ptr addrspace(4) %139, i64 6
  %142 = load i16, ptr addrspace(4) %141, align 2, !range !25, !invariant.load !26
  %143 = zext i16 %142 to i32
  %144 = getelementptr inbounds %1, ptr addrspace(4) %139, i64 0, i32 7
  %145 = load i32, ptr addrspace(4) %144, align 8, !tbaa !27
  %146 = mul i32 %140, %143
  %147 = sub i32 %145, %146
  %148 = tail call i32 @llvm.umin.i32(i32 %147, i32 %143)
  %149 = mul nuw nsw i32 %148, %138
  %150 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %151 = getelementptr i8, ptr addrspace(4) %139, i64 4
  %152 = load i16, ptr addrspace(4) %151, align 4, !range !25, !invariant.load !26
  %153 = zext i16 %152 to i32
  %154 = getelementptr inbounds %1, ptr addrspace(4) %139, i64 0, i32 6
  %155 = load i32, ptr addrspace(4) %154, align 4, !tbaa !22
  %156 = mul i32 %150, %153
  %157 = sub i32 %155, %156
  %158 = tail call i32 @llvm.umin.i32(i32 %157, i32 %153)
  %159 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !21
  %160 = add nuw nsw i32 %149, %159
  %161 = mul nuw nsw i32 %160, %158
  %162 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !21
  %163 = add nuw nsw i32 %161, %162
  br label %202

164:                                              ; preds = %4
  %165 = extractvalue %"struct.cooperative_groups::thread_group::_coalesced_info" %3, 2, 1
  %166 = tail call i32 @llvm.amdgcn.workitem.id.z(), !range !21
  %167 = tail call align 4 dereferenceable(64) ptr addrspace(4) @llvm.amdgcn.dispatch.ptr()
  %168 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %169 = getelementptr i8, ptr addrspace(4) %167, i64 6
  %170 = load i16, ptr addrspace(4) %169, align 2, !range !25, !invariant.load !26
  %171 = zext i16 %170 to i32
  %172 = getelementptr inbounds %1, ptr addrspace(4) %167, i64 0, i32 7
  %173 = load i32, ptr addrspace(4) %172, align 8, !tbaa !27
  %174 = mul i32 %168, %171
  %175 = sub i32 %173, %174
  %176 = tail call i32 @llvm.umin.i32(i32 %175, i32 %171)
  %177 = mul nuw nsw i32 %176, %166
  %178 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %179 = getelementptr i8, ptr addrspace(4) %167, i64 4
  %180 = load i16, ptr addrspace(4) %179, align 4, !range !25, !invariant.load !26
  %181 = zext i16 %180 to i32
  %182 = getelementptr inbounds %1, ptr addrspace(4) %167, i64 0, i32 6
  %183 = load i32, ptr addrspace(4) %182, align 4, !tbaa !22
  %184 = mul i32 %178, %181
  %185 = sub i32 %183, %184
  %186 = tail call i32 @llvm.umin.i32(i32 %185, i32 %181)
  %187 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !21
  %188 = add nuw nsw i32 %177, %187
  %189 = mul nuw nsw i32 %188, %186
  %190 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !21
  %191 = add nuw nsw i32 %189, %190
  %192 = add i32 %165, -1
  %193 = and i32 %191, %192
  br label %202

194:                                              ; preds = %4
  %195 = extractvalue %"struct.cooperative_groups::thread_group::_coalesced_info" %3, 0
  %196 = trunc i64 %195 to i32
  %197 = tail call i32 @llvm.amdgcn.mbcnt.lo(i32 %196, i32 0)
  %198 = lshr i64 %195, 32
  %199 = trunc i64 %198 to i32
  %200 = tail call i32 @llvm.amdgcn.mbcnt.hi(i32 %199, i32 %197)
  br label %202

201:                                              ; preds = %4
  tail call fastcc void @__assert_fail(i32 noundef 440, ptr noundef addrspacecast (ptr addrspace(4) @__PRETTY_FUNCTION__._ZNK18cooperative_groups12thread_group11thread_rankEv to ptr)) #18
  unreachable

202:                                              ; preds = %81, %85, %137, %164, %194
  %203 = phi i32 [ %200, %194 ], [ %193, %164 ], [ %163, %137 ], [ %136, %85 ], [ %84, %81 ]
  ret i32 %203
}

; Function Attrs: convergent noinline norecurse nounwind
define internal fastcc void @_Z7cg_syncN18cooperative_groups12thread_groupE(i32 %0, i32 %1, i64 %2, %"struct.cooperative_groups::thread_group::_coalesced_info" %3) unnamed_addr #5 {
  switch i32 %0, label %115 [
    i32 1, label %5
    i32 2, label %77
    i32 3, label %112
    i32 4, label %113
    i32 5, label %114
  ]

5:                                                ; preds = %4
  fence seq_cst
  tail call void @llvm.amdgcn.s.barrier()
  %6 = tail call align 4 dereferenceable(64) ptr addrspace(4) @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr inbounds %1, ptr addrspace(4) %6, i64 0, i32 6
  %8 = load i32, ptr addrspace(4) %7, align 4, !tbaa !22
  %9 = getelementptr i8, ptr addrspace(4) %6, i64 4
  %10 = load i16, ptr addrspace(4) %9, align 4, !range !25, !invariant.load !26
  %11 = zext i16 %10 to i32
  %12 = udiv i32 %8, %11
  %13 = mul i32 %12, %11
  %14 = icmp ugt i32 %8, %13
  %15 = zext i1 %14 to i32
  %16 = add i32 %12, %15
  %17 = getelementptr inbounds %1, ptr addrspace(4) %6, i64 0, i32 7
  %18 = load i32, ptr addrspace(4) %17, align 8, !tbaa !27
  %19 = getelementptr i8, ptr addrspace(4) %6, i64 6
  %20 = load i16, ptr addrspace(4) %19, align 2, !range !25, !invariant.load !26
  %21 = zext i16 %20 to i32
  %22 = udiv i32 %18, %21
  %23 = mul i32 %22, %21
  %24 = icmp ugt i32 %18, %23
  %25 = zext i1 %24 to i32
  %26 = add i32 %22, %25
  %27 = mul i32 %26, %16
  %28 = getelementptr inbounds %1, ptr addrspace(4) %6, i64 0, i32 8
  %29 = load i32, ptr addrspace(4) %28, align 4, !tbaa !28
  %30 = getelementptr i8, ptr addrspace(4) %6, i64 8
  %31 = load i16, ptr addrspace(4) %30, align 4, !range !25, !invariant.load !26
  %32 = zext i16 %31 to i32
  %33 = udiv i32 %29, %32
  %34 = mul i32 %33, %32
  %35 = icmp ugt i32 %29, %34
  %36 = zext i1 %35 to i32
  %37 = add i32 %33, %36
  %38 = mul i32 %27, %37
  %39 = add i32 %38, -1
  %40 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !21
  %41 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !21
  %42 = tail call i32 @llvm.amdgcn.workitem.id.z(), !range !21
  %43 = or i32 %40, %41
  %44 = or i32 %43, %42
  %45 = icmp eq i32 %44, 0
  br i1 %45, label %46, label %47

46:                                               ; preds = %5
  tail call void @llvm.amdgcn.ds.gws.barrier(i32 %39, i32 0)
  br label %47

47:                                               ; preds = %46, %5
  %48 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %49 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %50 = tail call i32 @llvm.amdgcn.workgroup.id.z()
  %51 = or i32 %49, %48
  %52 = or i32 %51, %50
  %53 = or i32 %52, %44
  %54 = icmp eq i32 %53, 0
  br i1 %54, label %55, label %74

55:                                               ; preds = %47
  %56 = tail call ptr addrspace(4) @llvm.amdgcn.implicitarg.ptr()
  %57 = getelementptr inbounds i64, ptr addrspace(4) %56, i64 6
  %58 = load i64, ptr addrspace(4) %57, align 8, !tbaa !4
  %59 = inttoptr i64 %58 to ptr addrspace(4)
  %60 = load ptr addrspace(1), ptr addrspace(4) %59, align 8, !tbaa !29
  %61 = getelementptr inbounds %0, ptr addrspace(4) %59, i64 0, i32 2
  %62 = load i32, ptr addrspace(4) %61, align 4, !tbaa !30
  %63 = atomicrmw add ptr addrspace(1) %60, i32 1 syncscope("one-as") monotonic, align 4
  %64 = and i32 %63, 255
  %65 = add i32 %62, -1
  %66 = icmp eq i32 %64, %65
  br i1 %66, label %67, label %70

67:                                               ; preds = %55
  %68 = sub i32 256, %62
  %69 = atomicrmw add ptr addrspace(1) %60, i32 %68 syncscope("one-as") monotonic, align 4
  br label %74

70:                                               ; preds = %55, %70
  tail call void @llvm.amdgcn.s.sleep(i32 2)
  %71 = load atomic i32, ptr addrspace(1) %60 syncscope("one-as") monotonic, align 4
  %72 = xor i32 %71, %63
  %73 = icmp ult i32 %72, 256
  br i1 %73, label %70, label %74

74:                                               ; preds = %70, %67, %47
  br i1 %45, label %75, label %76

75:                                               ; preds = %74
  tail call void @llvm.amdgcn.ds.gws.barrier(i32 %39, i32 0)
  br label %76

76:                                               ; preds = %75, %74
  tail call void @llvm.amdgcn.s.barrier()
  br label %116

77:                                               ; preds = %4
  fence syncscope("agent") seq_cst
  tail call void @llvm.amdgcn.s.barrier()
  %78 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !21
  %79 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !21
  %80 = or i32 %78, %79
  %81 = tail call i32 @llvm.amdgcn.workitem.id.z(), !range !21
  %82 = or i32 %80, %81
  %83 = icmp eq i32 %82, 0
  br i1 %83, label %84, label %111

84:                                               ; preds = %77
  %85 = tail call align 4 dereferenceable(64) ptr addrspace(4) @llvm.amdgcn.dispatch.ptr()
  %86 = getelementptr inbounds %1, ptr addrspace(4) %85, i64 0, i32 6
  %87 = load i32, ptr addrspace(4) %86, align 4, !tbaa !22
  %88 = getelementptr i8, ptr addrspace(4) %85, i64 4
  %89 = load i16, ptr addrspace(4) %88, align 4, !range !25, !invariant.load !26
  %90 = zext i16 %89 to i32
  %91 = udiv i32 %87, %90
  %92 = mul i32 %91, %90
  %93 = icmp ugt i32 %87, %92
  %94 = zext i1 %93 to i32
  %95 = add i32 %91, %94
  %96 = getelementptr inbounds %1, ptr addrspace(4) %85, i64 0, i32 7
  %97 = getelementptr i8, ptr addrspace(4) %85, i64 6
  %98 = load <2 x i32>, ptr addrspace(4) %96, align 8, !tbaa !31
  %99 = load <2 x i16>, ptr addrspace(4) %97, align 2, !invariant.load !26
  %100 = zext <2 x i16> %99 to <2 x i32>
  %101 = udiv <2 x i32> %98, %100
  %102 = mul <2 x i32> %101, %100
  %103 = icmp ugt <2 x i32> %98, %102
  %104 = zext <2 x i1> %103 to <2 x i32>
  %105 = add <2 x i32> %101, %104
  %106 = extractelement <2 x i32> %105, i64 0
  %107 = mul i32 %106, %95
  %108 = extractelement <2 x i32> %105, i64 1
  %109 = mul i32 %107, %108
  %110 = add i32 %109, -1
  tail call void @llvm.amdgcn.ds.gws.barrier(i32 %110, i32 0)
  br label %111

111:                                              ; preds = %84, %77
  tail call void @llvm.amdgcn.s.barrier()
  br label %116

112:                                              ; preds = %4
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br label %116

113:                                              ; preds = %4
  fence syncscope("agent") acq_rel
  br label %116

114:                                              ; preds = %4
  fence syncscope("agent") acq_rel
  br label %116

115:                                              ; preds = %4
  tail call fastcc void @__assert_fail(i32 noundef 493, ptr noundef addrspacecast (ptr addrspace(4) @__PRETTY_FUNCTION__._ZNK18cooperative_groups12thread_group4syncEv to ptr)) #18
  unreachable

116:                                              ; preds = %76, %111, %112, %113, %114
  ret void
}

; Function Attrs: mustprogress nofree noinline norecurse nosync nounwind readnone willreturn
define internal fastcc { i32, i32, i64, %"struct.cooperative_groups::thread_group::_coalesced_info" } @_Z20cg_this_thread_blockv() unnamed_addr #6 {
  %1 = tail call align 4 dereferenceable(64) ptr addrspace(4) @llvm.amdgcn.dispatch.ptr()
  %2 = tail call i32 @llvm.amdgcn.workgroup.id.z()
  %3 = getelementptr i8, ptr addrspace(4) %1, i64 8
  %4 = load i16, ptr addrspace(4) %3, align 4, !range !25, !invariant.load !26
  %5 = zext i16 %4 to i32
  %6 = getelementptr inbounds %1, ptr addrspace(4) %1, i64 0, i32 8
  %7 = load i32, ptr addrspace(4) %6, align 4, !tbaa !28
  %8 = mul i32 %2, %5
  %9 = sub i32 %7, %8
  %10 = tail call i32 @llvm.umin.i32(i32 %9, i32 %5)
  %11 = udiv i32 %7, %5
  %12 = mul i32 %11, %5
  %13 = icmp ugt i32 %7, %12
  %14 = zext i1 %13 to i32
  %15 = add i32 %11, %14
  %16 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %17 = getelementptr i8, ptr addrspace(4) %1, i64 6
  %18 = load i16, ptr addrspace(4) %17, align 2, !range !25, !invariant.load !26
  %19 = zext i16 %18 to i32
  %20 = getelementptr inbounds %1, ptr addrspace(4) %1, i64 0, i32 7
  %21 = load i32, ptr addrspace(4) %20, align 8, !tbaa !27
  %22 = mul i32 %16, %19
  %23 = sub i32 %21, %22
  %24 = tail call i32 @llvm.umin.i32(i32 %23, i32 %19)
  %25 = udiv i32 %21, %19
  %26 = mul i32 %25, %19
  %27 = icmp ugt i32 %21, %26
  %28 = zext i1 %27 to i32
  %29 = add i32 %25, %28
  %30 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %31 = getelementptr i8, ptr addrspace(4) %1, i64 4
  %32 = load i16, ptr addrspace(4) %31, align 4, !range !25, !invariant.load !26
  %33 = zext i16 %32 to i32
  %34 = getelementptr inbounds %1, ptr addrspace(4) %1, i64 0, i32 6
  %35 = load i32, ptr addrspace(4) %34, align 4, !tbaa !22
  %36 = mul i32 %30, %33
  %37 = sub i32 %35, %36
  %38 = tail call i32 @llvm.umin.i32(i32 %37, i32 %33)
  %39 = udiv i32 %35, %33
  %40 = mul i32 %39, %33
  %41 = icmp ugt i32 %35, %40
  %42 = zext i1 %41 to i32
  %43 = add i32 %39, %42
  %44 = mul i32 %15, %10
  %45 = mul i32 %44, %24
  %46 = mul i32 %45, %29
  %47 = mul i32 %46, %38
  %48 = mul i32 %47, %43
  %49 = insertvalue { i32, i32, i64, %"struct.cooperative_groups::thread_group::_coalesced_info" } { i32 2, i32 poison, i64 poison, %"struct.cooperative_groups::thread_group::_coalesced_info" poison }, i32 %48, 1
  %50 = insertvalue { i32, i32, i64, %"struct.cooperative_groups::thread_group::_coalesced_info" } %49, i64 0, 2
  ret { i32, i32, i64, %"struct.cooperative_groups::thread_group::_coalesced_info" } %50
}

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z16sum_kernel_blockPiS_i(ptr addrspace(1) nocapture noundef %0, ptr addrspace(1) nocapture noundef readonly %1, i32 noundef %2) local_unnamed_addr #7 {
  %4 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %5 = tail call align 4 dereferenceable(64) ptr addrspace(4) @llvm.amdgcn.dispatch.ptr()
  %6 = getelementptr i8, ptr addrspace(4) %5, i64 4
  %7 = load i16, ptr addrspace(4) %6, align 4, !range !25, !invariant.load !26
  %8 = zext i16 %7 to i32
  %9 = getelementptr inbounds %1, ptr addrspace(4) %5, i64 0, i32 6
  %10 = load i32, ptr addrspace(4) %9, align 4, !tbaa !22
  %11 = mul i32 %4, %8
  %12 = sub i32 %10, %11
  %13 = tail call i32 @llvm.umin.i32(i32 %12, i32 %8)
  %14 = mul i32 %13, %4
  %15 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !21
  %16 = add i32 %14, %15
  %17 = sdiv i32 %2, 4
  %18 = icmp slt i32 %16, %17
  br i1 %18, label %19, label %37

19:                                               ; preds = %3, %19
  %20 = phi i32 [ %34, %19 ], [ 0, %3 ]
  %21 = phi i32 [ %35, %19 ], [ %16, %3 ]
  %22 = sext i32 %21 to i64
  %23 = getelementptr inbounds %struct.HIP_vector_type, ptr addrspace(1) %1, i64 %22
  %24 = load i32, ptr addrspace(1) %23, align 16, !amdgpu.noclobber !26
  %25 = getelementptr inbounds i8, ptr addrspace(1) %23, i64 4
  %26 = load i32, ptr addrspace(1) %25, align 4, !amdgpu.noclobber !26
  %27 = getelementptr inbounds i8, ptr addrspace(1) %23, i64 8
  %28 = load i32, ptr addrspace(1) %27, align 8, !amdgpu.noclobber !26
  %29 = getelementptr inbounds i8, ptr addrspace(1) %23, i64 12
  %30 = load i32, ptr addrspace(1) %29, align 4, !amdgpu.noclobber !26
  %31 = add i32 %24, %20
  %32 = add i32 %31, %26
  %33 = add i32 %32, %28
  %34 = add i32 %33, %30
  %35 = add i32 %21, %10
  %36 = icmp slt i32 %35, %17
  br i1 %36, label %19, label %37, !llvm.loop !32

37:                                               ; preds = %19, %3
  %38 = phi i32 [ 0, %3 ], [ %34, %19 ]
  %39 = tail call fastcc { i32, i32, i64, %"struct.cooperative_groups::thread_group::_coalesced_info" } @_Z20cg_this_thread_blockv() #14
  %40 = extractvalue { i32, i32, i64, %"struct.cooperative_groups::thread_group::_coalesced_info" } %39, 0
  %41 = extractvalue { i32, i32, i64, %"struct.cooperative_groups::thread_group::_coalesced_info" } %39, 1
  %42 = extractvalue { i32, i32, i64, %"struct.cooperative_groups::thread_group::_coalesced_info" } %39, 2
  %43 = extractvalue { i32, i32, i64, %"struct.cooperative_groups::thread_group::_coalesced_info" } %39, 3
  %44 = tail call fastcc noundef i32 @_Z7cg_rankN18cooperative_groups12thread_groupE(i32 %40, i32 %41, i64 %42, %"struct.cooperative_groups::thread_group::_coalesced_info" %43) #18
  %45 = icmp ult i32 %41, 2
  br i1 %45, label %61, label %46

46:                                               ; preds = %37
  %47 = getelementptr inbounds i32, ptr addrspace(3) @temp, i32 %44
  br label %48

48:                                               ; preds = %58, %46
  %49 = phi i32 [ %41, %46 ], [ %51, %58 ]
  %50 = phi i32 [ %38, %46 ], [ %59, %58 ]
  %51 = lshr i32 %49, 1
  store i32 %50, ptr addrspace(3) %47, align 4, !tbaa !33
  tail call fastcc void @_Z7cg_syncN18cooperative_groups12thread_groupE(i32 %40, i32 %41, i64 %42, %"struct.cooperative_groups::thread_group::_coalesced_info" %43) #18
  %52 = icmp slt i32 %44, %51
  br i1 %52, label %53, label %58

53:                                               ; preds = %48
  %54 = add nsw i32 %51, %44
  %55 = getelementptr inbounds i32, ptr addrspace(3) @temp, i32 %54
  %56 = load i32, ptr addrspace(3) %55, align 4, !tbaa !33
  %57 = add nsw i32 %56, %50
  br label %58

58:                                               ; preds = %53, %48
  %59 = phi i32 [ %57, %53 ], [ %50, %48 ]
  tail call fastcc void @_Z7cg_syncN18cooperative_groups12thread_groupE(i32 %40, i32 %41, i64 %42, %"struct.cooperative_groups::thread_group::_coalesced_info" %43) #18
  %60 = icmp ult i32 %49, 4
  br i1 %60, label %61, label %48, !llvm.loop !35

61:                                               ; preds = %58, %37
  %62 = phi i32 [ %38, %37 ], [ %59, %58 ]
  %63 = tail call fastcc noundef i32 @_Z7cg_rankN18cooperative_groups12thread_groupE(i32 %40, i32 %41, i64 %42, %"struct.cooperative_groups::thread_group::_coalesced_info" %43) #18
  %64 = icmp eq i32 %63, 0
  br i1 %64, label %65, label %67

65:                                               ; preds = %61
  %66 = atomicrmw add ptr addrspace(1) %0, i32 %62 syncscope("agent-one-as") monotonic, align 4
  br label %67

67:                                               ; preds = %65, %61
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #8

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #9

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #9

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.z() #9

; Function Attrs: convergent inaccessiblememonly mustprogress nounwind willreturn
declare void @llvm.amdgcn.ds.gws.barrier(i32, i32) #10

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 ptr addrspace(4) @llvm.amdgcn.dispatch.ptr() #9

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 ptr addrspace(4) @llvm.amdgcn.implicitarg.ptr() #9

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #9

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #9

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.z() #9

; Function Attrs: mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.sleep(i32 immarg) #11

; Function Attrs: convergent noinline norecurse nounwind optnone
define internal fastcc <2 x i64> @__ockl_hostcall_internal(ptr noundef %0, i64 noundef %1, i64 noundef %2, i64 noundef %3, i64 noundef %4, i64 noundef %5, i64 noundef %6, i64 noundef %7, i64 noundef %8) unnamed_addr #12 {
  %10 = alloca ptr, align 8, addrspace(5)
  %11 = alloca i32, align 4, addrspace(5)
  %12 = alloca i64, align 8, addrspace(5)
  %13 = alloca i64, align 8, addrspace(5)
  %14 = alloca i64, align 8, addrspace(5)
  %15 = alloca i64, align 8, addrspace(5)
  %16 = alloca i64, align 8, addrspace(5)
  %17 = alloca i64, align 8, addrspace(5)
  %18 = alloca i64, align 8, addrspace(5)
  %19 = alloca i64, align 8, addrspace(5)
  %20 = alloca i32, align 4, addrspace(5)
  %21 = alloca i32, align 4, addrspace(5)
  %22 = alloca ptr addrspace(1), align 8, addrspace(5)
  %23 = alloca i64, align 8, addrspace(5)
  %24 = alloca ptr addrspace(1), align 8, addrspace(5)
  %25 = alloca ptr addrspace(1), align 8, addrspace(5)
  %26 = alloca <2 x i64>, align 16, addrspace(5)
  store ptr %0, ptr addrspace(5) %10, align 8, !tbaa !36
  store i32 2, ptr addrspace(5) %11, align 4, !tbaa !31
  store i64 %1, ptr addrspace(5) %12, align 8, !tbaa !4
  store i64 %2, ptr addrspace(5) %13, align 8, !tbaa !4
  store i64 %3, ptr addrspace(5) %14, align 8, !tbaa !4
  store i64 %4, ptr addrspace(5) %15, align 8, !tbaa !4
  store i64 %5, ptr addrspace(5) %16, align 8, !tbaa !4
  store i64 %6, ptr addrspace(5) %17, align 8, !tbaa !4
  store i64 %7, ptr addrspace(5) %18, align 8, !tbaa !4
  store i64 %8, ptr addrspace(5) %19, align 8, !tbaa !4
  call void @llvm.lifetime.start.p5(i64 4, ptr addrspace(5) %20) #14
  %27 = call i32 @llvm.amdgcn.mbcnt.lo(i32 -1, i32 0)
  %28 = call i32 @llvm.amdgcn.mbcnt.hi(i32 -1, i32 %27)
  store i32 %28, ptr addrspace(5) %20, align 4, !tbaa !31
  %29 = load i32, ptr addrspace(5) %20, align 4, !tbaa !31
  %30 = call i32 asm sideeffect "; ockl readfirstlane hoisting hack $0", "=v,0"(i32 %29) #18, !srcloc !37
  store i32 %30, ptr addrspace(5) %20, align 4, !tbaa !31
  call void @llvm.lifetime.start.p5(i64 4, ptr addrspace(5) %21) #14
  %31 = load i32, ptr addrspace(5) %20, align 4, !tbaa !31
  %32 = call i32 @llvm.amdgcn.readfirstlane(i32 %31)
  store i32 %32, ptr addrspace(5) %21, align 4, !tbaa !31
  call void @llvm.lifetime.start.p5(i64 8, ptr addrspace(5) %22) #14
  %33 = load ptr, ptr addrspace(5) %10, align 8, !tbaa !36
  %34 = addrspacecast ptr %33 to ptr addrspace(1)
  store ptr addrspace(1) %34, ptr addrspace(5) %22, align 8, !tbaa !36
  call void @llvm.lifetime.start.p5(i64 8, ptr addrspace(5) %23) #14
  %35 = load ptr addrspace(1), ptr addrspace(5) %22, align 8, !tbaa !36
  %36 = load i32, ptr addrspace(5) %20, align 4, !tbaa !31
  %37 = load i32, ptr addrspace(5) %21, align 4, !tbaa !31
  %38 = icmp eq i32 %36, %37
  br i1 %38, label %39, label %63

39:                                               ; preds = %9
  %40 = getelementptr inbounds %3, ptr addrspace(1) %35, i64 0, i32 3
  %41 = load atomic i64, ptr addrspace(1) %40 syncscope("one-as") acquire, align 8
  %42 = getelementptr i8, ptr addrspace(1) %35, i64 40
  %43 = load ptr addrspace(1), ptr addrspace(1) %35, align 8, !tbaa !38
  %44 = load i64, ptr addrspace(1) %42, align 8, !tbaa !40
  %45 = and i64 %44, %41
  %46 = getelementptr inbounds %4, ptr addrspace(1) %43, i64 %45
  %47 = load atomic i64, ptr addrspace(1) %46 syncscope("one-as") monotonic, align 8
  %48 = cmpxchg ptr addrspace(1) %40, i64 %41, i64 %47 syncscope("one-as") acquire monotonic, align 8
  %49 = extractvalue { i64, i1 } %48, 1
  br i1 %49, label %60, label %50

50:                                               ; preds = %50, %39
  %51 = phi { i64, i1 } [ %58, %50 ], [ %48, %39 ]
  %52 = extractvalue { i64, i1 } %51, 0
  call void @llvm.amdgcn.s.sleep(i32 1)
  %53 = load ptr addrspace(1), ptr addrspace(1) %35, align 8, !tbaa !38
  %54 = load i64, ptr addrspace(1) %42, align 8, !tbaa !40
  %55 = and i64 %54, %52
  %56 = getelementptr inbounds %4, ptr addrspace(1) %53, i64 %55
  %57 = load atomic i64, ptr addrspace(1) %56 syncscope("one-as") monotonic, align 8
  %58 = cmpxchg ptr addrspace(1) %40, i64 %52, i64 %57 syncscope("one-as") acquire monotonic, align 8
  %59 = extractvalue { i64, i1 } %58, 1
  br i1 %59, label %60, label %50

60:                                               ; preds = %50, %39
  %61 = phi { i64, i1 } [ %48, %39 ], [ %58, %50 ]
  %62 = extractvalue { i64, i1 } %61, 0
  br label %63

63:                                               ; preds = %9, %60
  %64 = phi i64 [ %62, %60 ], [ 0, %9 ]
  %65 = trunc i64 %64 to i32
  %66 = lshr i64 %64, 32
  %67 = trunc i64 %66 to i32
  %68 = call i32 @llvm.amdgcn.readfirstlane(i32 %65)
  %69 = call i32 @llvm.amdgcn.readfirstlane(i32 %67)
  %70 = zext i32 %69 to i64
  %71 = shl nuw i64 %70, 32
  %72 = zext i32 %68 to i64
  %73 = or i64 %71, %72
  store i64 %73, ptr addrspace(5) %23, align 8, !tbaa !4
  call void @llvm.lifetime.start.p5(i64 8, ptr addrspace(5) %24) #14
  %74 = load ptr addrspace(1), ptr addrspace(5) %22, align 8, !tbaa !36
  %75 = load i64, ptr addrspace(5) %23, align 8, !tbaa !4
  %76 = load ptr addrspace(1), ptr addrspace(1) %74, align 8, !tbaa !38
  %77 = getelementptr i8, ptr addrspace(1) %74, i64 40
  %78 = load i64, ptr addrspace(1) %77, align 8, !tbaa !40
  %79 = and i64 %75, %78
  %80 = getelementptr inbounds %4, ptr addrspace(1) %76, i64 %79
  store ptr addrspace(1) %80, ptr addrspace(5) %24, align 8, !tbaa !36
  call void @llvm.lifetime.start.p5(i64 8, ptr addrspace(5) %25) #14
  %81 = load ptr addrspace(1), ptr addrspace(5) %22, align 8, !tbaa !36
  %82 = load i64, ptr addrspace(5) %23, align 8, !tbaa !4
  %83 = getelementptr i8, ptr addrspace(1) %81, i64 8
  %84 = load ptr addrspace(1), ptr addrspace(1) %83, align 8, !tbaa !41
  %85 = getelementptr i8, ptr addrspace(1) %81, i64 40
  %86 = load i64, ptr addrspace(1) %85, align 8, !tbaa !40
  %87 = and i64 %82, %86
  %88 = getelementptr inbounds %5, ptr addrspace(1) %84, i64 %87
  store ptr addrspace(1) %88, ptr addrspace(5) %25, align 8, !tbaa !36
  %89 = load ptr addrspace(1), ptr addrspace(5) %24, align 8, !tbaa !36
  %90 = load ptr addrspace(1), ptr addrspace(5) %25, align 8, !tbaa !36
  %91 = load i32, ptr addrspace(5) %11, align 4, !tbaa !31
  %92 = load i64, ptr addrspace(5) %12, align 8, !tbaa !4
  %93 = load i64, ptr addrspace(5) %13, align 8, !tbaa !4
  %94 = load i64, ptr addrspace(5) %14, align 8, !tbaa !4
  %95 = load i64, ptr addrspace(5) %15, align 8, !tbaa !4
  %96 = load i64, ptr addrspace(5) %16, align 8, !tbaa !4
  %97 = load i64, ptr addrspace(5) %17, align 8, !tbaa !4
  %98 = load i64, ptr addrspace(5) %18, align 8, !tbaa !4
  %99 = load i64, ptr addrspace(5) %19, align 8, !tbaa !4
  %100 = load i32, ptr addrspace(5) %20, align 4, !tbaa !31
  %101 = load i32, ptr addrspace(5) %21, align 4, !tbaa !31
  %102 = call i64 @llvm.read_register.i64(metadata !42) #19
  %103 = icmp eq i32 %100, %101
  br i1 %103, label %104, label %108

104:                                              ; preds = %63
  %105 = getelementptr inbounds %4, ptr addrspace(1) %89, i64 0, i32 2
  %106 = getelementptr inbounds %4, ptr addrspace(1) %89, i64 0, i32 1
  %107 = getelementptr inbounds %4, ptr addrspace(1) %89, i64 0, i32 3
  store i32 %91, ptr addrspace(1) %105, align 8, !tbaa !43
  store i64 %102, ptr addrspace(1) %106, align 8, !tbaa !45
  store i32 1, ptr addrspace(1) %107, align 4, !tbaa !46
  br label %108

108:                                              ; preds = %63, %104
  %109 = zext i32 %100 to i64
  %110 = getelementptr inbounds [64 x [8 x i64]], ptr addrspace(1) %90, i64 0, i64 %109
  store i64 %92, ptr addrspace(1) %110, align 8, !tbaa !4
  %111 = getelementptr inbounds i64, ptr addrspace(1) %110, i64 1
  store i64 %93, ptr addrspace(1) %111, align 8, !tbaa !4
  %112 = getelementptr inbounds i64, ptr addrspace(1) %110, i64 2
  store i64 %94, ptr addrspace(1) %112, align 8, !tbaa !4
  %113 = getelementptr inbounds i64, ptr addrspace(1) %110, i64 3
  store i64 %95, ptr addrspace(1) %113, align 8, !tbaa !4
  %114 = getelementptr inbounds i64, ptr addrspace(1) %110, i64 4
  store i64 %96, ptr addrspace(1) %114, align 8, !tbaa !4
  %115 = getelementptr inbounds i64, ptr addrspace(1) %110, i64 5
  store i64 %97, ptr addrspace(1) %115, align 8, !tbaa !4
  %116 = getelementptr inbounds i64, ptr addrspace(1) %110, i64 6
  store i64 %98, ptr addrspace(1) %116, align 8, !tbaa !4
  %117 = getelementptr inbounds i64, ptr addrspace(1) %110, i64 7
  store i64 %99, ptr addrspace(1) %117, align 8, !tbaa !4
  %118 = load ptr addrspace(1), ptr addrspace(5) %22, align 8, !tbaa !36
  %119 = load i64, ptr addrspace(5) %23, align 8, !tbaa !4
  %120 = load i32, ptr addrspace(5) %20, align 4, !tbaa !31
  %121 = load i32, ptr addrspace(5) %21, align 4, !tbaa !31
  %122 = icmp eq i32 %120, %121
  br i1 %122, label %123, label %154

123:                                              ; preds = %108
  %124 = getelementptr inbounds %3, ptr addrspace(1) %118, i64 0, i32 4
  %125 = load atomic i64, ptr addrspace(1) %124 syncscope("one-as") monotonic, align 8
  %126 = load ptr addrspace(1), ptr addrspace(1) %118, align 8, !tbaa !38
  %127 = getelementptr i8, ptr addrspace(1) %118, i64 40
  %128 = load i64, ptr addrspace(1) %127, align 8, !tbaa !40
  %129 = and i64 %128, %119
  %130 = getelementptr inbounds %4, ptr addrspace(1) %126, i64 %129
  store i64 %125, ptr addrspace(1) %130, align 8, !tbaa !47
  %131 = cmpxchg ptr addrspace(1) %124, i64 %125, i64 %119 syncscope("one-as") release monotonic, align 8
  %132 = extractvalue { i64, i1 } %131, 1
  br i1 %132, label %138, label %133

133:                                              ; preds = %133, %123
  %134 = phi { i64, i1 } [ %136, %133 ], [ %131, %123 ]
  %135 = extractvalue { i64, i1 } %134, 0
  call void @llvm.amdgcn.s.sleep(i32 1)
  store i64 %135, ptr addrspace(1) %130, align 8, !tbaa !47
  %136 = cmpxchg ptr addrspace(1) %124, i64 %135, i64 %119 syncscope("one-as") release monotonic, align 8
  %137 = extractvalue { i64, i1 } %136, 1
  br i1 %137, label %138, label %133

138:                                              ; preds = %133, %123
  %139 = getelementptr inbounds %3, ptr addrspace(1) %118, i64 0, i32 2
  %140 = load i64, ptr addrspace(1) %139, align 8
  %141 = inttoptr i64 %140 to ptr addrspace(1)
  %142 = getelementptr inbounds %6, ptr addrspace(1) %141, i64 0, i32 1
  %143 = atomicrmw add ptr addrspace(1) %142, i64 1 syncscope("one-as") release, align 8
  %144 = getelementptr inbounds %6, ptr addrspace(1) %141, i64 0, i32 2
  %145 = load i64, ptr addrspace(1) %144, align 16, !tbaa !48
  %146 = icmp eq i64 %145, 0
  br i1 %146, label %154, label %147

147:                                              ; preds = %138
  %148 = inttoptr i64 %145 to ptr addrspace(1)
  %149 = getelementptr inbounds %6, ptr addrspace(1) %141, i64 0, i32 3
  %150 = load i32, ptr addrspace(1) %149, align 8, !tbaa !50
  %151 = zext i32 %150 to i64
  store atomic i64 %151, ptr addrspace(1) %148 syncscope("one-as") release, align 8
  %152 = call i32 @llvm.amdgcn.readfirstlane(i32 %150)
  %153 = and i32 %152, 255
  call void @llvm.amdgcn.s.sendmsg(i32 1, i32 %153)
  br label %154

154:                                              ; preds = %108, %138, %147
  call void @llvm.lifetime.start.p5(i64 16, ptr addrspace(5) %26) #14
  %155 = load ptr addrspace(1), ptr addrspace(5) %24, align 8, !tbaa !36
  %156 = load ptr addrspace(1), ptr addrspace(5) %25, align 8, !tbaa !36
  %157 = load i32, ptr addrspace(5) %20, align 4, !tbaa !31
  %158 = load i32, ptr addrspace(5) %21, align 4, !tbaa !31
  %159 = icmp eq i32 %157, %158
  %160 = getelementptr inbounds %4, ptr addrspace(1) %155, i64 0, i32 3
  br label %161

161:                                              ; preds = %169, %154
  br i1 %159, label %162, label %165

162:                                              ; preds = %161
  %163 = load atomic i32, ptr addrspace(1) %160 syncscope("one-as") acquire, align 4
  %164 = and i32 %163, 1
  br label %165

165:                                              ; preds = %162, %161
  %166 = phi i32 [ %164, %162 ], [ 1, %161 ]
  %167 = call i32 @llvm.amdgcn.readfirstlane(i32 %166)
  %168 = icmp eq i32 %167, 0
  br i1 %168, label %170, label %169

169:                                              ; preds = %165
  call void @llvm.amdgcn.s.sleep(i32 1)
  br label %161

170:                                              ; preds = %165
  %171 = zext i32 %157 to i64
  %172 = getelementptr inbounds [8 x i64], ptr addrspace(1) %156, i64 %171
  %173 = getelementptr inbounds i64, ptr addrspace(1) %172, i64 1
  %174 = load i64, ptr addrspace(1) %172, align 8, !tbaa !4
  %175 = load i64, ptr addrspace(1) %173, align 8, !tbaa !4
  %176 = insertelement <2 x i64> undef, i64 %174, i64 0
  %177 = insertelement <2 x i64> %176, i64 %175, i64 1
  store <2 x i64> %177, ptr addrspace(5) %26, align 16, !tbaa !13
  %178 = load ptr addrspace(1), ptr addrspace(5) %22, align 8, !tbaa !36
  %179 = load i64, ptr addrspace(5) %23, align 8, !tbaa !4
  %180 = load i32, ptr addrspace(5) %20, align 4, !tbaa !31
  %181 = load i32, ptr addrspace(5) %21, align 4, !tbaa !31
  %182 = icmp eq i32 %180, %181
  br i1 %182, label %183, label %202

183:                                              ; preds = %170
  %184 = getelementptr %3, ptr addrspace(1) %178, i64 0, i32 5
  %185 = load i64, ptr addrspace(1) %184, align 8, !tbaa !40
  %186 = add i64 %185, 1
  %187 = add i64 %186, %179
  %188 = icmp eq i64 %187, 0
  %189 = select i1 %188, i64 %186, i64 %187
  %190 = getelementptr inbounds %3, ptr addrspace(1) %178, i64 0, i32 3
  %191 = load atomic i64, ptr addrspace(1) %190 syncscope("one-as") monotonic, align 8
  %192 = load ptr addrspace(1), ptr addrspace(1) %178, align 8, !tbaa !38
  %193 = and i64 %189, %185
  %194 = getelementptr inbounds %4, ptr addrspace(1) %192, i64 %193
  store i64 %191, ptr addrspace(1) %194, align 8, !tbaa !47
  %195 = cmpxchg ptr addrspace(1) %190, i64 %191, i64 %189 syncscope("one-as") release monotonic, align 8
  %196 = extractvalue { i64, i1 } %195, 1
  br i1 %196, label %202, label %197

197:                                              ; preds = %197, %183
  %198 = phi { i64, i1 } [ %200, %197 ], [ %195, %183 ]
  %199 = extractvalue { i64, i1 } %198, 0
  call void @llvm.amdgcn.s.sleep(i32 1)
  store i64 %199, ptr addrspace(1) %194, align 8, !tbaa !47
  %200 = cmpxchg ptr addrspace(1) %190, i64 %199, i64 %189 syncscope("one-as") release monotonic, align 8
  %201 = extractvalue { i64, i1 } %200, 1
  br i1 %201, label %202, label %197

202:                                              ; preds = %170, %183, %197
  %203 = load <2 x i64>, ptr addrspace(5) %26, align 16, !tbaa !13
  call void @llvm.lifetime.end.p5(i64 16, ptr addrspace(5) %26) #14
  call void @llvm.lifetime.end.p5(i64 8, ptr addrspace(5) %25) #14
  call void @llvm.lifetime.end.p5(i64 8, ptr addrspace(5) %24) #14
  call void @llvm.lifetime.end.p5(i64 8, ptr addrspace(5) %23) #14
  call void @llvm.lifetime.end.p5(i64 8, ptr addrspace(5) %22) #14
  call void @llvm.lifetime.end.p5(i64 4, ptr addrspace(5) %21) #14
  call void @llvm.lifetime.end.p5(i64 4, ptr addrspace(5) %20) #14
  ret <2 x i64> %203
}

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare i32 @llvm.amdgcn.readfirstlane(i32) #13

; Function Attrs: nounwind
declare void @llvm.amdgcn.s.sendmsg(i32 immarg, i32) #14

; Function Attrs: nofree nounwind readonly
declare i64 @llvm.read_register.i64(metadata) #15

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.umin.i64(i64, i64) #16

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.umin.i32(i32, i32) #16

; Function Attrs: argmemonly nocallback nofree nounwind willreturn
declare void @llvm.memcpy.p5.p4.i64(ptr addrspace(5) noalias nocapture writeonly, ptr addrspace(4) noalias nocapture readonly, i64, i1 immarg) #17

attributes #0 = { cold noreturn nounwind }
attributes #1 = { convergent noinline norecurse noreturn nounwind "frame-pointer"="none" "min-legal-vector-width"="128" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx90a" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot3-insts,+dot4-insts,+dot5-insts,+dot6-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+gfx90a-insts,+mai-insts,+s-memrealtime,+s-memtime-inst" }
attributes #2 = { argmemonly mustprogress nocallback nofree nosync nounwind willreturn }
attributes #3 = { mustprogress nofree nosync nounwind readnone willreturn }
attributes #4 = { convergent mustprogress noinline norecurse nounwind "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx90a" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot3-insts,+dot4-insts,+dot5-insts,+dot6-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+gfx90a-insts,+mai-insts,+s-memrealtime,+s-memtime-inst" }
attributes #5 = { convergent noinline norecurse nounwind "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx90a" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot3-insts,+dot4-insts,+dot5-insts,+dot6-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+gfx90a-insts,+mai-insts,+s-memrealtime,+s-memtime-inst" }
attributes #6 = { mustprogress nofree noinline norecurse nosync nounwind readnone willreturn "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx90a" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot3-insts,+dot4-insts,+dot5-insts,+dot6-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+gfx90a-insts,+mai-insts,+s-memrealtime,+s-memtime-inst" }
attributes #7 = { convergent mustprogress norecurse nounwind "amdgpu-flat-work-group-size"="1,1024" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx90a" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot3-insts,+dot4-insts,+dot5-insts,+dot6-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+gfx90a-insts,+mai-insts,+s-memrealtime,+s-memtime-inst" "uniform-work-group-size"="true" }
attributes #8 = { convergent mustprogress nounwind willreturn }
attributes #9 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #10 = { convergent inaccessiblememonly mustprogress nounwind willreturn }
attributes #11 = { mustprogress nounwind willreturn }
attributes #12 = { convergent noinline norecurse nounwind optnone "frame-pointer"="none" "min-legal-vector-width"="128" "no-trapping-math"="true" "stack-protector-buffer-size"="8" }
attributes #13 = { convergent mustprogress nofree nounwind readnone willreturn }
attributes #14 = { nounwind }
attributes #15 = { nofree nounwind readonly }
attributes #16 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #17 = { argmemonly nocallback nofree nounwind willreturn }
attributes #18 = { convergent nounwind }
attributes #19 = { convergent }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 16.0.0 (https://github.com/llvm/llvm-project 809855b56f06dd7182685f88fbbc64111df9339a)"}
!4 = !{!5, !5, i64 0}
!5 = !{!"long", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C/C++ TBAA"}
!8 = !{!9, !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
!13 = !{!6, !6, i64 0}
!14 = distinct !{!14, !12}
!15 = !{!16, !5, i64 16}
!16 = !{!"mg_info", !17, i64 0, !18, i64 8, !18, i64 12, !5, i64 16, !5, i64 24}
!17 = !{!"any pointer", !6, i64 0}
!18 = !{!"int", !6, i64 0}
!19 = !{!20, !20, i64 0}
!20 = !{!"short", !6, i64 0}
!21 = !{i32 0, i32 1024}
!22 = !{!23, !18, i64 12}
!23 = !{!"hsa_kernel_dispatch_packet_s", !20, i64 0, !20, i64 2, !20, i64 4, !20, i64 6, !20, i64 8, !20, i64 10, !18, i64 12, !18, i64 16, !18, i64 20, !18, i64 24, !18, i64 28, !5, i64 32, !17, i64 40, !5, i64 48, !24, i64 56}
!24 = !{!"hsa_signal_s", !5, i64 0}
!25 = !{i16 1, i16 1025}
!26 = !{}
!27 = !{!23, !18, i64 16}
!28 = !{!23, !18, i64 20}
!29 = !{!16, !17, i64 0}
!30 = !{!16, !18, i64 12}
!31 = !{!18, !18, i64 0}
!32 = distinct !{!32, !12}
!33 = !{!34, !34, i64 0}
!34 = !{!"int", !9, i64 0}
!35 = distinct !{!35, !12}
!36 = !{!17, !17, i64 0}
!37 = !{i64 2509}
!38 = !{!39, !17, i64 0}
!39 = !{!"", !17, i64 0, !17, i64 8, !24, i64 16, !5, i64 24, !5, i64 32, !5, i64 40}
!40 = !{!39, !5, i64 40}
!41 = !{!39, !17, i64 8}
!42 = !{!"exec"}
!43 = !{!44, !18, i64 16}
!44 = !{!"", !5, i64 0, !5, i64 8, !18, i64 16, !18, i64 20}
!45 = !{!44, !5, i64 8}
!46 = !{!44, !18, i64 20}
!47 = !{!44, !5, i64 0}
!48 = !{!49, !5, i64 16}
!49 = !{!"amd_signal_s", !5, i64 0, !6, i64 8, !5, i64 16, !18, i64 24, !18, i64 28, !5, i64 32, !5, i64 40, !6, i64 48, !6, i64 56}
!50 = !{!49, !18, i64 24}

; __CLANG_OFFLOAD_BUNDLE____END__ hip-amdgcn-amd-amdhsa-gfx90a

; __CLANG_OFFLOAD_BUNDLE____START__ host-x86_64-unknown-linux-gnu
; ModuleID = 'main.cpp'
source_filename = "main.cpp"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.dim3 = type { i32, i32, i32 }

$__hip_gpubin_handle = comdat any

@_Z16sum_kernel_blockPiS_i = constant ptr @_Z31__device_stub__sum_kernel_blockPiS_i, align 8
@.str = private unnamed_addr constant [44 x i8] c"Sum of 16M array number = %d, expecting %d\0A\00", align 1
@0 = private unnamed_addr constant [26 x i8] c"_Z16sum_kernel_blockPiS_i\00", align 1
@__hip_fatbin = external constant i8, section ".hip_fatbin"
@__hip_fatbin_wrapper = internal constant { i32, i32, ptr, ptr } { i32 1212764230, i32 1, ptr @__hip_fatbin, ptr null }, section ".hipFatBinSegment", align 8
@__hip_gpubin_handle = linkonce hidden local_unnamed_addr global ptr null, comdat, align 8
@llvm.global_ctors = appending global [1 x { i32, ptr, ptr }] [{ i32, ptr, ptr } { i32 65535, ptr @__hip_module_ctor, ptr null }]

; Function Attrs: norecurse uwtable
define dso_local void @_Z31__device_stub__sum_kernel_blockPiS_i(ptr noundef %0, ptr noundef %1, i32 noundef %2) #0 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca %struct.dim3, align 8
  %8 = alloca %struct.dim3, align 8
  %9 = alloca i64, align 8
  %10 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8, !tbaa !5
  store ptr %1, ptr %5, align 8, !tbaa !5
  store i32 %2, ptr %6, align 4, !tbaa !9
  %11 = alloca [3 x ptr], align 16
  store ptr %4, ptr %11, align 16
  %12 = getelementptr inbounds ptr, ptr %11, i64 1
  store ptr %5, ptr %12, align 8
  %13 = getelementptr inbounds ptr, ptr %11, i64 2
  store ptr %6, ptr %13, align 16
  %14 = call i32 @__hipPopCallConfiguration(ptr nonnull %7, ptr nonnull %8, ptr nonnull %9, ptr nonnull %10)
  %15 = load i64, ptr %9, align 8
  %16 = load ptr, ptr %10, align 8
  %17 = load i64, ptr %7, align 8
  %18 = getelementptr inbounds i8, ptr %7, i64 8
  %19 = load i32, ptr %18, align 8
  %20 = load i64, ptr %8, align 8
  %21 = getelementptr inbounds i8, ptr %8, i64 8
  %22 = load i32, ptr %21, align 8
  %23 = call noundef i32 @hipLaunchKernel(ptr noundef nonnull @_Z16sum_kernel_blockPiS_i, i64 %17, i32 %19, i64 %20, i32 %22, ptr noundef nonnull %11, i64 noundef %15, ptr noundef %16)
  ret void
}

declare i32 @__hipPopCallConfiguration(ptr, ptr, ptr, ptr) local_unnamed_addr

declare i32 @hipLaunchKernel(ptr, i64, i32, i64, i32, ptr, i64, ptr) local_unnamed_addr

; Function Attrs: norecurse uwtable
define dso_local noundef i32 @main() local_unnamed_addr #0 {
  %1 = alloca ptr, align 8
  %2 = alloca ptr, align 8
  %3 = alloca i32, align 4
  %4 = alloca %struct.dim3, align 8
  %5 = alloca %struct.dim3, align 8
  %6 = alloca i64, align 8
  %7 = alloca ptr, align 8
  %8 = alloca [3 x ptr], align 16
  %9 = alloca i32, align 4
  %10 = alloca ptr, align 8
  %11 = alloca ptr, align 8
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %9) #6
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %10) #6
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %11) #6
  %12 = call i32 @hipMallocManaged(ptr noundef nonnull %10, i64 noundef 4, i32 noundef 1)
  %13 = call i32 @hipMallocManaged(ptr noundef nonnull %11, i64 noundef 67108864, i32 noundef 1)
  %14 = load ptr, ptr %11, align 8, !tbaa !5
  %15 = call i32 @rand() #6
  %16 = insertelement <4 x i32> poison, i32 %15, i64 0
  %17 = shufflevector <4 x i32> %16, <4 x i32> poison, <4 x i32> zeroinitializer
  %18 = insertelement <4 x i32> poison, i32 %15, i64 0
  %19 = shufflevector <4 x i32> %18, <4 x i32> poison, <4 x i32> zeroinitializer
  br label %20

20:                                               ; preds = %20, %0
  %21 = phi i64 [ 0, %0 ], [ %37, %20 ]
  %22 = shl i64 %21, 2
  %23 = getelementptr i8, ptr %14, i64 %22
  store <4 x i32> %17, ptr %23, align 4, !tbaa !9
  %24 = getelementptr i32, ptr %23, i64 4
  store <4 x i32> %19, ptr %24, align 4, !tbaa !9
  %25 = shl i64 %21, 2
  %26 = or i64 %25, 32
  %27 = getelementptr i8, ptr %14, i64 %26
  store <4 x i32> %17, ptr %27, align 4, !tbaa !9
  %28 = getelementptr i32, ptr %27, i64 4
  store <4 x i32> %19, ptr %28, align 4, !tbaa !9
  %29 = shl i64 %21, 2
  %30 = or i64 %29, 64
  %31 = getelementptr i8, ptr %14, i64 %30
  store <4 x i32> %17, ptr %31, align 4, !tbaa !9
  %32 = getelementptr i32, ptr %31, i64 4
  store <4 x i32> %19, ptr %32, align 4, !tbaa !9
  %33 = shl i64 %21, 2
  %34 = or i64 %33, 96
  %35 = getelementptr i8, ptr %14, i64 %34
  store <4 x i32> %17, ptr %35, align 4, !tbaa !9
  %36 = getelementptr i32, ptr %35, i64 4
  store <4 x i32> %19, ptr %36, align 4, !tbaa !9
  %37 = add nuw nsw i64 %21, 32
  %38 = icmp eq i64 %37, 16777216
  br i1 %38, label %39, label %20, !llvm.loop !11

39:                                               ; preds = %20
  %40 = load ptr, ptr %11, align 8, !tbaa !5
  br label %41

41:                                               ; preds = %41, %39
  %42 = phi i64 [ 0, %39 ], [ %72, %41 ]
  %43 = phi <4 x i32> [ zeroinitializer, %39 ], [ %70, %41 ]
  %44 = phi <4 x i32> [ zeroinitializer, %39 ], [ %71, %41 ]
  %45 = getelementptr inbounds i32, ptr %40, i64 %42
  %46 = load <4 x i32>, ptr %45, align 4, !tbaa !9
  %47 = getelementptr inbounds i32, ptr %45, i64 4
  %48 = load <4 x i32>, ptr %47, align 4, !tbaa !9
  %49 = add <4 x i32> %46, %43
  %50 = add <4 x i32> %48, %44
  %51 = or i64 %42, 8
  %52 = getelementptr inbounds i32, ptr %40, i64 %51
  %53 = load <4 x i32>, ptr %52, align 4, !tbaa !9
  %54 = getelementptr inbounds i32, ptr %52, i64 4
  %55 = load <4 x i32>, ptr %54, align 4, !tbaa !9
  %56 = add <4 x i32> %53, %49
  %57 = add <4 x i32> %55, %50
  %58 = or i64 %42, 16
  %59 = getelementptr inbounds i32, ptr %40, i64 %58
  %60 = load <4 x i32>, ptr %59, align 4, !tbaa !9
  %61 = getelementptr inbounds i32, ptr %59, i64 4
  %62 = load <4 x i32>, ptr %61, align 4, !tbaa !9
  %63 = add <4 x i32> %60, %56
  %64 = add <4 x i32> %62, %57
  %65 = or i64 %42, 24
  %66 = getelementptr inbounds i32, ptr %40, i64 %65
  %67 = load <4 x i32>, ptr %66, align 4, !tbaa !9
  %68 = getelementptr inbounds i32, ptr %66, i64 4
  %69 = load <4 x i32>, ptr %68, align 4, !tbaa !9
  %70 = add <4 x i32> %67, %63
  %71 = add <4 x i32> %69, %64
  %72 = add nuw nsw i64 %42, 32
  %73 = icmp eq i64 %72, 16777216
  br i1 %73, label %74, label %41, !llvm.loop !14

74:                                               ; preds = %41
  %75 = load ptr, ptr %10, align 8, !tbaa !5
  %76 = call i32 @hipMemset(ptr noundef %75, i32 noundef 0, i64 noundef 4)
  %77 = call i32 @__hipPushCallConfiguration(i64 4295032832, i32 1, i64 4294967552, i32 1, i64 noundef 1024, ptr noundef null)
  %78 = icmp eq i32 %77, 0
  br i1 %78, label %79, label %94

79:                                               ; preds = %74
  %80 = load ptr, ptr %10, align 8, !tbaa !5
  %81 = load ptr, ptr %11, align 8, !tbaa !5
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %1)
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %2)
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %3)
  call void @llvm.lifetime.start.p0(i64 12, ptr nonnull %4)
  call void @llvm.lifetime.start.p0(i64 12, ptr nonnull %5)
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %6)
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %7)
  call void @llvm.lifetime.start.p0(i64 24, ptr nonnull %8)
  store ptr %80, ptr %1, align 8, !tbaa !5
  store ptr %81, ptr %2, align 8, !tbaa !5
  store i32 16777216, ptr %3, align 4, !tbaa !9
  store ptr %1, ptr %8, align 16
  %82 = getelementptr inbounds ptr, ptr %8, i64 1
  store ptr %2, ptr %82, align 8
  %83 = getelementptr inbounds ptr, ptr %8, i64 2
  store ptr %3, ptr %83, align 16
  %84 = call i32 @__hipPopCallConfiguration(ptr nonnull %4, ptr nonnull %5, ptr nonnull %6, ptr nonnull %7)
  %85 = load i64, ptr %6, align 8
  %86 = load ptr, ptr %7, align 8
  %87 = load i64, ptr %4, align 8
  %88 = getelementptr inbounds i8, ptr %4, i64 8
  %89 = load i32, ptr %88, align 8
  %90 = load i64, ptr %5, align 8
  %91 = getelementptr inbounds i8, ptr %5, i64 8
  %92 = load i32, ptr %91, align 8
  %93 = call noundef i32 @hipLaunchKernel(ptr noundef nonnull @_Z16sum_kernel_blockPiS_i, i64 %87, i32 %89, i64 %90, i32 %92, ptr noundef nonnull %8, i64 noundef %85, ptr noundef %86)
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %1)
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %2)
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %3)
  call void @llvm.lifetime.end.p0(i64 12, ptr nonnull %4)
  call void @llvm.lifetime.end.p0(i64 12, ptr nonnull %5)
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %6)
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %7)
  call void @llvm.lifetime.end.p0(i64 24, ptr nonnull %8)
  br label %94

94:                                               ; preds = %79, %74
  %95 = add <4 x i32> %71, %70
  %96 = call i32 @llvm.vector.reduce.add.v4i32(<4 x i32> %95)
  %97 = load ptr, ptr %10, align 8, !tbaa !5
  %98 = call i32 @hipMemcpy(ptr noundef nonnull %9, ptr noundef %97, i64 noundef 4, i32 noundef 2)
  %99 = load i32, ptr %9, align 4, !tbaa !9
  %100 = call i32 (ptr, ...) @printf(ptr noundef nonnull @.str, i32 noundef %99, i32 noundef %96)
  %101 = load ptr, ptr %10, align 8, !tbaa !5
  %102 = call i32 @hipFree(ptr noundef %101)
  %103 = load ptr, ptr %11, align 8, !tbaa !5
  %104 = call i32 @hipFree(ptr noundef %103)
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %11) #6
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %10) #6
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %9) #6
  ret i32 0
}

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0(i64 immarg, ptr nocapture) #1

; Function Attrs: nounwind
declare i32 @rand() local_unnamed_addr #2

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0(i64 immarg, ptr nocapture) #1

declare i32 @hipMemset(ptr noundef, i32 noundef, i64 noundef) local_unnamed_addr #3

declare i32 @__hipPushCallConfiguration(i64, i32, i64, i32, i64 noundef, ptr noundef) local_unnamed_addr #3

declare i32 @hipMemcpy(ptr noundef, ptr noundef, i64 noundef, i32 noundef) local_unnamed_addr #3

; Function Attrs: nofree nounwind
declare noundef i32 @printf(ptr nocapture noundef readonly, ...) local_unnamed_addr #4

declare i32 @hipFree(ptr noundef) local_unnamed_addr #3

declare i32 @hipMallocManaged(ptr noundef, i64 noundef, i32 noundef) local_unnamed_addr #3

declare i32 @__hipRegisterFunction(ptr, ptr, ptr, ptr, i32, ptr, ptr, ptr, ptr, ptr) local_unnamed_addr

declare ptr @__hipRegisterFatBinary(ptr) local_unnamed_addr

define internal void @__hip_module_ctor() {
  %1 = load ptr, ptr @__hip_gpubin_handle, align 8
  %2 = icmp eq ptr %1, null
  br i1 %2, label %3, label %5

3:                                                ; preds = %0
  %4 = tail call ptr @__hipRegisterFatBinary(ptr nonnull @__hip_fatbin_wrapper)
  store ptr %4, ptr @__hip_gpubin_handle, align 8
  br label %5

5:                                                ; preds = %3, %0
  %6 = phi ptr [ %4, %3 ], [ %1, %0 ]
  %7 = tail call i32 @__hipRegisterFunction(ptr %6, ptr nonnull @_Z16sum_kernel_blockPiS_i, ptr nonnull @0, ptr nonnull @0, i32 -1, ptr null, ptr null, ptr null, ptr null, ptr null)
  %8 = tail call i32 @atexit(ptr nonnull @__hip_module_dtor)
  ret void
}

declare void @__hipUnregisterFatBinary(ptr) local_unnamed_addr

define internal void @__hip_module_dtor() {
  %1 = load ptr, ptr @__hip_gpubin_handle, align 8
  %2 = icmp eq ptr %1, null
  br i1 %2, label %4, label %3

3:                                                ; preds = %0
  tail call void @__hipUnregisterFatBinary(ptr nonnull %1)
  store ptr null, ptr @__hip_gpubin_handle, align 8
  br label %4

4:                                                ; preds = %3, %0
  ret void
}

declare i32 @atexit(ptr) local_unnamed_addr

; Function Attrs: nocallback nofree nosync nounwind readnone willreturn
declare i32 @llvm.vector.reduce.add.v4i32(<4 x i32>) #5

attributes #0 = { norecurse uwtable "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { argmemonly mustprogress nocallback nofree nosync nounwind willreturn }
attributes #2 = { nounwind "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nofree nounwind "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nocallback nofree nosync nounwind readnone willreturn }
attributes #6 = { nounwind }

!llvm.module.flags = !{!0, !1, !2, !3}
!llvm.ident = !{!4}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{!"clang version 16.0.0 (https://github.com/llvm/llvm-project 809855b56f06dd7182685f88fbbc64111df9339a)"}
!5 = !{!6, !6, i64 0}
!6 = !{!"any pointer", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C++ TBAA"}
!9 = !{!10, !10, i64 0}
!10 = !{!"int", !7, i64 0}
!11 = distinct !{!11, !12, !13}
!12 = !{!"llvm.loop.mustprogress"}
!13 = !{!"llvm.loop.isvectorized", i32 1}
!14 = distinct !{!14, !12, !13}

; __CLANG_OFFLOAD_BUNDLE____END__ host-x86_64-unknown-linux-gnu

; Bitcode implementations of NVVM intrinsics querying grid and block sizes
source_filename = "llvm-link"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; From amd-llvm-project/openmp/libomptarget/plugins/amdgpu/dynamic_hsa/hsa.h
; typedef struct hsa_kernel_dispatch_packet_s {
;   uint16_t header;                0
;   uint16_t setup;                 2
;   uint16_t workgroup_size_x;      4
;   uint16_t workgroup_size_y;      6
;   uint16_t workgroup_size_z;      8
;   uint16_t reserved0;             10
;   uint32_t grid_size_x;           12
;   uint32_t grid_size_y;           16
;   uint32_t grid_size_z;           20
;   uint32_t private_segment_size;
;   uint32_t group_segment_size;
;   uint64_t kernel_object;
; #ifdef HSA_LARGE_MODEL
;   void *kernarg_address;
; #elif defined HSA_LITTLE_ENDIAN
;   void *kernarg_address;
;   uint32_t reserved1;
; #else
;   uint32_t reserved1;
;   void *kernarg_address;
; #endif
;   uint64_t reserved2;
;   hsa_signal_t completion_signal;
; } hsa_kernel_dispatch_packet_t;
%dispatch.ptr.ty = type { i16, i16, i16, i16, i16, i16, i32, i32, i32, i32, i32, i64, ptr addrspace(1), i64, %hsa.signal.ty }
%hsa.signal.ty = type { i64 }

; gridDim.x
; declare i32 @llvm.nvvm.read.ptx.sreg.nctaid.x()
define linkonce_odr protected i32 @cudaamd.nvvm.read.ptx.sreg.nctaid.x() local_unnamed_addr #0 {
    %dispatch.ptr = tail call align 4 dereferenceable(64) ptr addrspace(4) @llvm.amdgcn.dispatch.ptr()
    %gep.grid.size.x = getelementptr inbounds %dispatch.ptr.ty, ptr addrspace(4) %dispatch.ptr, i64 0, i32 6
    %grid.size.x = load i32, ptr addrspace(4) %gep.grid.size.x, align 4
    %gep.workgroup.size.x = getelementptr inbounds %dispatch.ptr.ty, ptr addrspace(4) %dispatch.ptr, i64 0, i32 2
    %workgroup.size.x = load i16, ptr addrspace(4) %gep.workgroup.size.x, align 4
    %workgroup.size.x.zext = zext i16 %workgroup.size.x to i32
    %cuda.grid.size.x = udiv i32 %grid.size.x, %workgroup.size.x.zext
    ret i32 %cuda.grid.size.x
}

; gridDim.y
; declare i32 @llvm.nvvm.read.ptx.sreg.nctaid.y()
define linkonce_odr protected i32 @cudaamd.nvvm.read.ptx.sreg.nctaid.y() local_unnamed_addr #0 {
    %dispatch.ptr = tail call align 4 dereferenceable(64) ptr addrspace(4) @llvm.amdgcn.dispatch.ptr()
    %gep.grid.size.y = getelementptr inbounds %dispatch.ptr.ty, ptr addrspace(4) %dispatch.ptr, i64 0, i32 7
    %grid.size.y = load i32, ptr addrspace(4) %gep.grid.size.y, align 4
    %gep.workgroup.size.y = getelementptr inbounds %dispatch.ptr.ty, ptr addrspace(4) %dispatch.ptr, i64 0, i32 3
    %workgroup.size.y = load i16, ptr addrspace(4) %gep.workgroup.size.y, align 4
    %workgroup.size.y.zext = zext i16 %workgroup.size.y to i32
    %cuda.grid.size.y = udiv i32 %grid.size.y, %workgroup.size.y.zext
    ret i32 %cuda.grid.size.y
}

; gridDim.z
; declare i32 @llvm.nvvm.read.ptx.sreg.nctaid.z()
define linkonce_odr protected i32 @cudaamd.nvvm.read.ptx.sreg.nctaid.z() local_unnamed_addr #0 {
    %dispatch.ptr = tail call align 4 dereferenceable(64) ptr addrspace(4) @llvm.amdgcn.dispatch.ptr()
    %gep.grid.size.z = getelementptr inbounds %dispatch.ptr.ty, ptr addrspace(4) %dispatch.ptr, i64 0, i32 8
    %grid.size.z = load i32, ptr addrspace(4) %gep.grid.size.z, align 4
    %gep.workgroup.size.z = getelementptr inbounds %dispatch.ptr.ty, ptr addrspace(4) %dispatch.ptr, i64 0, i32 4
    %workgroup.size.z = load i16, ptr addrspace(4) %gep.workgroup.size.z, align 4
    %workgroup.size.z.zext = zext i16 %workgroup.size.z to i32
    %cuda.grid.size.z = udiv i32 %grid.size.z, %workgroup.size.z.zext
    ret i32 %cuda.grid.size.z
}

; blockDim.x
; declare i32 @llvm.nvvm.read.ptx.sreg.ntid.x()
define linkonce_odr protected i32 @cudaamd.nvvm.read.ptx.sreg.ntid.x() local_unnamed_addr #0 {
    %dispatch.ptr = tail call i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
    %gep.group.size.x = getelementptr inbounds i8, i8 addrspace(4)* %dispatch.ptr, i64 4
    %gep.group.size.x.bc = bitcast i8 addrspace(4)* %gep.group.size.x to i16 addrspace(4)*
    %group.size.x = load volatile i16, i16 addrspace(4)* %gep.group.size.x.bc, align 4
    %group.size.x.zext = zext i16 %group.size.x to i32
    ret i32 %group.size.x.zext
}

; blockDim.y
; declare i32 @llvm.nvvm.read.ptx.sreg.ntid.y()
define linkonce_odr protected i32 @cudaamd.nvvm.read.ptx.sreg.ntid.y() local_unnamed_addr #0 {
    %dispatch.ptr = tail call i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
    %gep.group.size.y = getelementptr inbounds i8, i8 addrspace(4)* %dispatch.ptr, i64 6
    %gep.group.size.y.bc = bitcast i8 addrspace(4)* %gep.group.size.y to i16 addrspace(4)*
    %group.size.y = load i16, i16 addrspace(4)* %gep.group.size.y.bc, align 4
    %group.size.y.zext = zext i16 %group.size.y to i32
    ret i32 %group.size.y.zext
}

; blockDim.z
; declare i32 @llvm.nvvm.read.ptx.sreg.ntid.z()
define linkonce_odr protected i32 @cudaamd.nvvm.read.ptx.sreg.ntid.z() local_unnamed_addr #0 {
    %dispatch.ptr = tail call i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
    %gep.group.size.z = getelementptr inbounds i8, i8 addrspace(4)* %dispatch.ptr, i64 8
    %gep.group.size.z.bc = bitcast i8 addrspace(4)* %gep.group.size.z to i16 addrspace(4)*
    %group.size.z = load i16, i16 addrspace(4)* %gep.group.size.z.bc, align 4
    %group.size.z.zext = zext i16 %group.size.z to i32
    ret i32 %group.size.z.zext
}

declare i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
declare i32 @llvm.amdgcn.workgroup.id.x()
declare i32 @llvm.amdgcn.workgroup.id.y()
declare i32 @llvm.amdgcn.workgroup.id.z()

attributes #0 = { convergent mustprogress nofree norecurse nounwind readonly willreturn "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" }

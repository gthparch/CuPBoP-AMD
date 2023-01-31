; Bitcode implementations of NVVM intrinsics querying grid and block sizes
source_filename = "llvm-link"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

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

; gridDim.x
; declare i32 @llvm.nvvm.read.ptx.sreg.nctaid.x()
define linkonce_odr protected i32 @cudaamd.nvvm.read.ptx.sreg.nctaid.x() local_unnamed_addr #0 {
    %dispatch.ptr = tail call i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
    %gep.grid.size.x = getelementptr inbounds i8, i8 addrspace(4)* %dispatch.ptr, i64 12
    %gep.grid.size.x.bc = bitcast i8 addrspace(4)* %gep.grid.size.x to i32 addrspace(4)*
    %grid.size.x = load i32, i32 addrspace(4)* %gep.grid.size.x.bc, align 4
    ret i32 %grid.size.x
}

; gridDim.y
; declare i32 @llvm.nvvm.read.ptx.sreg.nctaid.y()
define linkonce_odr protected i32 @cudaamd.nvvm.read.ptx.sreg.nctaid.y() local_unnamed_addr #0 {
    %dispatch.ptr = tail call i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
    %gep.grid.size.y = getelementptr inbounds i8, i8 addrspace(4)* %dispatch.ptr, i64 16
    %gep.grid.size.y.bc = bitcast i8 addrspace(4)* %gep.grid.size.y to i32 addrspace(4)*
    %grid.size.y = load i32, i32 addrspace(4)* %gep.grid.size.y.bc, align 4
    ret i32 %grid.size.y
}

; gridDim.z
; declare i32 @llvm.nvvm.read.ptx.sreg.nctaid.z()
define linkonce_odr protected i32 @cudaamd.nvvm.read.ptx.sreg.nctaid.z() local_unnamed_addr #0 {
    %dispatch.ptr = tail call i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
    %gep.grid.size.z = getelementptr inbounds i8, i8 addrspace(4)* %dispatch.ptr, i64 20
    %gep.grid.size.z.bc = bitcast i8 addrspace(4)* %gep.grid.size.z to i32 addrspace(4)*
    %grid.size.z = load i32, i32 addrspace(4)* %gep.grid.size.z.bc, align 4
    ret i32 %grid.size.z
}

declare i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1
declare i32 @llvm.amdgcn.workgroup.id.x() #1
declare i32 @llvm.amdgcn.workgroup.id.y() #1
declare i32 @llvm.amdgcn.workgroup.id.z() #1

attributes #0 = { convergent mustprogress nofree norecurse nounwind readonly willreturn "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" }

!0 = !{i32 2, i32 0}

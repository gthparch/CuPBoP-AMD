	.text
	.amdgcn_target "amdgcn-amd-amdhsa--gfx90a"
	.protected	_Z14mergeSortFirstP15HIP_vector_typeIfLj4EEi ; -- Begin function _Z14mergeSortFirstP15HIP_vector_typeIfLj4EEi
	.globl	_Z14mergeSortFirstP15HIP_vector_typeIfLj4EEi
	.p2align	8
	.type	_Z14mergeSortFirstP15HIP_vector_typeIfLj4EEi,@function
_Z14mergeSortFirstP15HIP_vector_typeIfLj4EEi: ; @_Z14mergeSortFirstP15HIP_vector_typeIfLj4EEi
; %bb.0:
	s_load_dword s0, s[4:5], 0x4
	s_load_dword s1, s[4:5], 0xc
	s_load_dword s2, s[6:7], 0x8
	s_waitcnt lgkmcnt(0)
	s_and_b32 s0, s0, 0xffff
	s_mul_i32 s3, s8, s0
	s_sub_i32 s1, s1, s3
	s_min_u32 s0, s1, s0
	s_mul_i32 s0, s0, s8
	v_add_u32_e32 v0, s0, v0
	s_ashr_i32 s0, s2, 31
	s_lshr_b32 s0, s0, 30
	s_add_i32 s2, s2, s0
	s_ashr_i32 s0, s2, 2
	v_cmp_gt_u32_e32 vcc, s0, v0
	s_and_saveexec_b64 s[0:1], vcc
	s_cbranch_execz .LBB0_2
; %bb.1:
	s_getpc_b64 s[0:1]
	s_add_u32 s0, s0, tex@rel32@lo+76
	s_addc_u32 s1, s1, tex@rel32@hi+84
	s_load_dwordx2 s[0:1], s[0:1], 0x0
	v_mov_b32_e32 v1, 0
	v_lshlrev_b64 v[6:7], 4, v[0:1]
	s_waitcnt lgkmcnt(0)
	s_load_dwordx4 s[0:3], s[0:1], 0x0
	s_waitcnt lgkmcnt(0)
	buffer_load_format_xyzw v[2:5], v0, s[0:3], 0 idxen
	s_load_dwordx2 s[0:1], s[6:7], 0x0
	s_waitcnt lgkmcnt(0)
	v_mov_b32_e32 v8, s1
	s_waitcnt vmcnt(0)
	v_cmp_gt_f32_e32 vcc, v2, v3
	v_cndmask_b32_e32 v1, v2, v3, vcc
	v_cmp_gt_f32_e32 vcc, v3, v2
	v_cndmask_b32_e32 v2, v2, v3, vcc
	v_cmp_gt_f32_e32 vcc, v4, v5
	v_cndmask_b32_e32 v3, v4, v5, vcc
	v_cmp_gt_f32_e32 vcc, v5, v4
	v_cndmask_b32_e32 v4, v4, v5, vcc
	v_cmp_gt_f32_e32 vcc, v1, v3
	v_cndmask_b32_e32 v0, v1, v3, vcc
	v_cmp_gt_f32_e32 vcc, v2, v4
	v_cndmask_b32_e32 v5, v2, v4, vcc
	v_cmp_gt_f32_e32 vcc, v3, v1
	v_cndmask_b32_e32 v9, v1, v3, vcc
	v_cmp_gt_f32_e32 vcc, v4, v2
	v_cndmask_b32_e32 v3, v2, v4, vcc
	v_cmp_gt_f32_e32 vcc, v5, v9
	v_cndmask_b32_e32 v1, v5, v9, vcc
	v_cmp_gt_f32_e32 vcc, v9, v5
	v_cndmask_b32_e32 v2, v5, v9, vcc
	v_add_co_u32_e32 v4, vcc, s0, v6
	v_addc_co_u32_e32 v5, vcc, v8, v7, vcc
	global_store_dwordx4 v[4:5], v[0:3], off
.LBB0_2:
	s_endpgm
	.section	.rodata,#alloc
	.p2align	6
	.amdhsa_kernel _Z14mergeSortFirstP15HIP_vector_typeIfLj4EEi
		.amdhsa_group_segment_fixed_size 0
		.amdhsa_private_segment_fixed_size 0
		.amdhsa_kernarg_size 12
		.amdhsa_user_sgpr_count 8
		.amdhsa_user_sgpr_private_segment_buffer 1
		.amdhsa_user_sgpr_dispatch_ptr 1
		.amdhsa_user_sgpr_queue_ptr 0
		.amdhsa_user_sgpr_kernarg_segment_ptr 1
		.amdhsa_user_sgpr_dispatch_id 0
		.amdhsa_user_sgpr_flat_scratch_init 0
		.amdhsa_user_sgpr_private_segment_size 0
		.amdhsa_uses_dynamic_stack 0
		.amdhsa_system_sgpr_private_segment_wavefront_offset 0
		.amdhsa_system_sgpr_workgroup_id_x 1
		.amdhsa_system_sgpr_workgroup_id_y 0
		.amdhsa_system_sgpr_workgroup_id_z 0
		.amdhsa_system_sgpr_workgroup_info 0
		.amdhsa_system_vgpr_workitem_id 0
		.amdhsa_next_free_vgpr 10
		.amdhsa_next_free_sgpr 9
		.amdhsa_accum_offset 12
		.amdhsa_reserve_flat_scratch 0
		.amdhsa_reserve_xnack_mask 1
		.amdhsa_float_round_mode_32 0
		.amdhsa_float_round_mode_16_64 0
		.amdhsa_float_denorm_mode_32 3
		.amdhsa_float_denorm_mode_16_64 3
		.amdhsa_dx10_clamp 1
		.amdhsa_ieee_mode 1
		.amdhsa_fp16_overflow 0
		.amdhsa_tg_split 0
		.amdhsa_exception_fp_ieee_invalid_op 0
		.amdhsa_exception_fp_denorm_src 0
		.amdhsa_exception_fp_ieee_div_zero 0
		.amdhsa_exception_fp_ieee_overflow 0
		.amdhsa_exception_fp_ieee_underflow 0
		.amdhsa_exception_fp_ieee_inexact 0
		.amdhsa_exception_int_div_zero 0
	.end_amdhsa_kernel
	.text
.Lfunc_end0:
	.size	_Z14mergeSortFirstP15HIP_vector_typeIfLj4EEi, .Lfunc_end0-_Z14mergeSortFirstP15HIP_vector_typeIfLj4EEi
                                        ; -- End function
	.section	.AMDGPU.csdata
; Kernel info:
; codeLenInByte = 268
; NumSgprs: 11
; NumVgprs: 10
; NumAgprs: 0
; TotalNumVgprs: 10
; ScratchSize: 0
; MemoryBound: 0
; FloatMode: 240
; IeeeMode: 1
; LDSByteSize: 0 bytes/workgroup (compile time only)
; SGPRBlocks: 1
; VGPRBlocks: 1
; NumSGPRsForWavesPerEU: 11
; NumVGPRsForWavesPerEU: 10
; AccumOffset: 12
; Occupancy: 8
; WaveLimiterHint : 0
; COMPUTE_PGM_RSRC2:SCRATCH_EN: 0
; COMPUTE_PGM_RSRC2:USER_SGPR: 8
; COMPUTE_PGM_RSRC2:TRAP_HANDLER: 0
; COMPUTE_PGM_RSRC2:TGID_X_EN: 1
; COMPUTE_PGM_RSRC2:TGID_Y_EN: 0
; COMPUTE_PGM_RSRC2:TGID_Z_EN: 0
; COMPUTE_PGM_RSRC2:TIDIG_COMP_CNT: 0
; COMPUTE_PGM_RSRC3_GFX90A:ACCUM_OFFSET: 2
; COMPUTE_PGM_RSRC3_GFX90A:TG_SPLIT: 0
	.text
	.protected	_Z13mergeSortPassP15HIP_vector_typeIfLj4EEii ; -- Begin function _Z13mergeSortPassP15HIP_vector_typeIfLj4EEii
	.globl	_Z13mergeSortPassP15HIP_vector_typeIfLj4EEii
	.p2align	8
	.type	_Z13mergeSortPassP15HIP_vector_typeIfLj4EEii,@function
_Z13mergeSortPassP15HIP_vector_typeIfLj4EEii: ; @_Z13mergeSortPassP15HIP_vector_typeIfLj4EEii
; %bb.0:
	s_load_dword s2, s[4:5], 0x4
	s_load_dwordx2 s[0:1], s[6:7], 0x8
	s_load_dword s3, s[4:5], 0xc
	s_waitcnt lgkmcnt(0)
	s_and_b32 s2, s2, 0xffff
	s_ashr_i32 s5, s1, 31
	s_add_i32 s9, s1, s5
	s_xor_b32 s9, s9, s5
	v_cvt_f32_u32_e32 v1, s9
	s_mul_i32 s4, s8, s2
	s_sub_i32 s3, s3, s4
	s_min_u32 s2, s3, s2
	v_rcp_iflag_f32_e32 v1, v1
	s_mul_i32 s2, s2, s8
	v_add_u32_e32 v2, s2, v0
	v_ashrrev_i32_e32 v0, 31, v2
	v_mul_f32_e32 v1, 0x4f7ffffe, v1
	v_cvt_u32_f32_e32 v1, v1
	v_add_u32_e32 v4, v2, v0
	s_sub_i32 s2, 0, s9
	v_xor_b32_e32 v3, s5, v0
	v_xor_b32_e32 v0, v4, v0
	v_mul_lo_u32 v4, s2, v1
	v_mul_hi_u32 v4, v1, v4
	v_add_u32_e32 v1, v1, v4
	v_mul_hi_u32 v1, v0, v1
	v_mul_lo_u32 v4, v1, s9
	v_sub_u32_e32 v0, v0, v4
	v_add_u32_e32 v4, 1, v1
	v_cmp_le_u32_e32 vcc, s9, v0
	v_cndmask_b32_e32 v1, v1, v4, vcc
	v_subrev_u32_e32 v4, s9, v0
	v_cndmask_b32_e32 v0, v0, v4, vcc
	v_add_u32_e32 v4, 1, v1
	v_cmp_le_u32_e32 vcc, s9, v0
	v_cndmask_b32_e32 v0, v1, v4, vcc
	v_xor_b32_e32 v0, v0, v3
	v_sub_u32_e32 v0, v0, v3
	s_movk_i32 s2, 0x400
	v_cmp_gt_i32_e32 vcc, s2, v0
	s_and_saveexec_b64 s[2:3], vcc
	s_cbranch_execz .LBB1_19
; %bb.1:
	v_ashrrev_i32_e32 v1, 31, v0
	v_lshlrev_b64 v[4:5], 2, v[0:1]
	s_getpc_b64 s[2:3]
	s_add_u32 s2, s2, constStartAddr@rel32@lo+4
	s_addc_u32 s3, s3, constStartAddr@rel32@hi+12
	v_mov_b32_e32 v1, s3
	v_add_co_u32_e32 v4, vcc, s2, v4
	v_addc_co_u32_e32 v5, vcc, v5, v1, vcc
	global_load_dwordx2 v[24:25], v[4:5], off
	v_mul_lo_u32 v0, v0, s1
	v_sub_u32_e32 v0, v2, v0
	s_waitcnt vmcnt(0)
	v_mad_u64_u32 v[20:21], s[2:3], v0, s0, v[24:25]
	v_cmp_gt_i32_e32 vcc, v25, v20
	s_and_b64 exec, exec, vcc
	s_cbranch_execz .LBB1_19
; %bb.2:
	s_load_dwordx2 s[2:3], s[6:7], 0x0
	s_lshr_b32 s1, s0, 31
	v_ashrrev_i32_e32 v21, 31, v20
	s_add_i32 s0, s0, s1
	v_lshlrev_b64 v[0:1], 4, v[20:21]
	s_ashr_i32 s12, s0, 1
	s_waitcnt lgkmcnt(0)
	v_mov_b32_e32 v2, s3
	v_add_co_u32_e32 v22, vcc, s2, v0
	v_add_u32_e32 v26, s12, v20
	v_addc_co_u32_e32 v23, vcc, v2, v1, vcc
	v_cmp_ge_i32_e32 vcc, v26, v25
	s_and_saveexec_b64 s[0:1], vcc
	s_xor_b64 s[0:1], exec, s[0:1]
	s_cbranch_execz .LBB1_7
; %bb.3:                                ; %.preheader
	v_sub_u32_e32 v0, v25, v20
	s_mov_b32 s8, 0
	v_cmp_lt_i32_e32 vcc, 0, v0
	s_and_saveexec_b64 s[2:3], vcc
	s_cbranch_execz .LBB1_6
; %bb.4:                                ; %.lr.ph.preheader
	s_mov_b64 s[4:5], 0
	v_mov_b32_e32 v1, 0
	s_getpc_b64 s[6:7]
	s_add_u32 s6, s6, tex@rel32@lo+76
	s_addc_u32 s7, s7, tex@rel32@hi+84
.LBB1_5:                                ; %.lr.ph
                                        ; =>This Inner Loop Header: Depth=1
	global_load_dwordx2 v[2:3], v1, s[6:7]
	v_add_u32_e32 v4, s8, v20
	s_add_i32 s8, s8, 1
	v_cmp_ge_i32_e32 vcc, s8, v0
	s_or_b64 s[4:5], vcc, s[4:5]
	s_waitcnt vmcnt(0)
	v_readfirstlane_b32 s10, v2
	v_readfirstlane_b32 s11, v3
	s_load_dwordx4 s[16:19], s[10:11], 0x0
	s_waitcnt lgkmcnt(0)
	buffer_load_format_xyzw v[2:5], v4, s[16:19], 0 idxen
	s_waitcnt vmcnt(0)
	global_store_dwordx4 v[22:23], v[2:5], off
	v_add_co_u32_e32 v22, vcc, 16, v22
	v_addc_co_u32_e32 v23, vcc, 0, v23, vcc
	s_andn2_b64 exec, exec, s[4:5]
	s_cbranch_execnz .LBB1_5
.LBB1_6:                                ; %Flow361
	s_or_b64 exec, exec, s[2:3]
                                        ; implicit-def: $vgpr22_vgpr23
                                        ; implicit-def: $vgpr20_vgpr21
                                        ; implicit-def: $vgpr26
                                        ; implicit-def: $vgpr24_vgpr25
.LBB1_7:                                ; %Flow365
	s_andn2_saveexec_b64 s[0:1], s[0:1]
	s_cbranch_execz .LBB1_19
; %bb.8:
	v_mov_b32_e32 v21, 0
	s_getpc_b64 s[4:5]
	s_add_u32 s4, s4, tex@rel32@lo+76
	s_addc_u32 s5, s5, tex@rel32@hi+84
	global_load_dwordx2 v[0:1], v21, s[4:5]
	s_mov_b64 s[6:7], 0
	v_mov_b32_e32 v24, 0
	v_mov_b32_e32 v27, 0
	s_waitcnt vmcnt(0)
	v_readfirstlane_b32 s0, v0
	v_readfirstlane_b32 s1, v1
	s_load_dwordx4 s[0:3], s[0:1], 0x0
	s_waitcnt lgkmcnt(0)
	s_nop 2
	buffer_load_format_xyzw v[4:7], v20, s[0:3], 0 idxen
	buffer_load_format_xyzw v[0:3], v26, s[0:3], 0 idxen
	s_branch .LBB1_11
.LBB1_9:                                ; %Flow363
                                        ;   in Loop: Header=BB1_11 Depth=1
	s_or_b64 exec, exec, s[10:11]
	s_waitcnt vmcnt(2)
	v_pk_mov_b32 v[8:9], v[12:13], v[12:13] op_sel:[0,1]
	s_or_b64 s[0:1], s[0:1], exec
	v_pk_mov_b32 v[10:11], v[14:15], v[14:15] op_sel:[0,1]
	v_mov_b32_e32 v27, v28
.LBB1_10:                               ;   in Loop: Header=BB1_11 Depth=1
	s_or_b64 exec, exec, s[8:9]
	v_cmp_ge_f32_e32 vcc, v7, v0
	v_cndmask_b32_e32 v0, v0, v7, vcc
	v_cmp_ge_f32_e32 vcc, v6, v1
	v_cndmask_b32_e32 v1, v1, v6, vcc
	v_cmp_ge_f32_e32 vcc, v5, v2
	v_cndmask_b32_e32 v2, v2, v5, vcc
	v_cmp_ge_f32_e32 vcc, v4, v3
	v_cndmask_b32_e32 v3, v3, v4, vcc
	v_cmp_gt_f32_e32 vcc, v0, v1
	v_cndmask_b32_e32 v4, v0, v1, vcc
	v_cmp_gt_f32_e32 vcc, v1, v0
	v_cndmask_b32_e32 v1, v0, v1, vcc
	v_cmp_gt_f32_e32 vcc, v2, v3
	v_cndmask_b32_e32 v5, v2, v3, vcc
	v_cmp_gt_f32_e32 vcc, v3, v2
	v_cndmask_b32_e32 v2, v2, v3, vcc
	v_cmp_gt_f32_e32 vcc, v4, v5
	v_cndmask_b32_e32 v0, v4, v5, vcc
	v_cmp_gt_f32_e32 vcc, v1, v2
	v_cndmask_b32_e32 v6, v1, v2, vcc
	v_cmp_gt_f32_e32 vcc, v5, v4
	v_cndmask_b32_e32 v4, v4, v5, vcc
	v_cmp_gt_f32_e32 vcc, v2, v1
	v_cndmask_b32_e32 v3, v1, v2, vcc
	v_cmp_gt_f32_e32 vcc, v6, v4
	s_xor_b64 s[0:1], s[0:1], -1
	v_cndmask_b32_e32 v1, v6, v4, vcc
	v_cmp_gt_f32_e32 vcc, v4, v6
	v_cndmask_b32_e32 v2, v6, v4, vcc
	v_add_co_u32_e32 v22, vcc, 16, v22
	s_and_b64 s[0:1], exec, s[0:1]
	v_pk_mov_b32 v[4:5], v[8:9], v[8:9] op_sel:[0,1]
	v_addc_co_u32_e32 v23, vcc, 0, v23, vcc
	s_or_b64 s[6:7], s[0:1], s[6:7]
	v_pk_mov_b32 v[6:7], v[10:11], v[10:11] op_sel:[0,1]
	s_andn2_b64 exec, exec, s[6:7]
	s_cbranch_execz .LBB1_18
.LBB1_11:                               ; =>This Inner Loop Header: Depth=1
	global_load_dwordx2 v[8:9], v21, s[4:5]
	v_add_u32_e32 v28, 1, v27
	v_add_u32_e32 v29, 1, v24
	v_add_u32_e32 v30, v29, v26
	s_waitcnt vmcnt(1)
	v_cmp_lt_f32_e32 vcc, v4, v3
	s_waitcnt vmcnt(0)
	v_readfirstlane_b32 s0, v8
	v_readfirstlane_b32 s1, v9
	s_load_dwordx4 s[0:3], s[0:1], 0x0
	v_add_u32_e32 v8, v28, v20
	s_waitcnt lgkmcnt(0)
	s_nop 1
	buffer_load_format_xyzw v[12:15], v8, s[0:3], 0 idxen
	buffer_load_format_xyzw v[16:19], v30, s[0:3], 0 idxen
	v_cndmask_b32_e32 v8, v3, v4, vcc
	v_cmp_lt_f32_e32 vcc, v5, v2
	v_cndmask_b32_e32 v9, v2, v5, vcc
	v_cmp_lt_f32_e32 vcc, v6, v1
	v_cndmask_b32_e32 v10, v1, v6, vcc
	v_cmp_lt_f32_e32 vcc, v7, v0
	v_cndmask_b32_e32 v11, v0, v7, vcc
	v_cmp_gt_f32_e32 vcc, v8, v9
	v_cndmask_b32_e32 v31, v8, v9, vcc
	v_cmp_gt_f32_e32 vcc, v9, v8
	v_cndmask_b32_e32 v9, v8, v9, vcc
	v_cmp_gt_f32_e32 vcc, v10, v11
	v_cndmask_b32_e32 v32, v10, v11, vcc
	v_cmp_gt_f32_e32 vcc, v11, v10
	v_cndmask_b32_e32 v10, v10, v11, vcc
	v_cmp_gt_f32_e32 vcc, v31, v32
	v_cndmask_b32_e32 v8, v31, v32, vcc
	v_cmp_gt_f32_e32 vcc, v9, v10
	v_cndmask_b32_e32 v33, v9, v10, vcc
	v_cmp_gt_f32_e32 vcc, v32, v31
	v_cndmask_b32_e32 v31, v31, v32, vcc
	v_cmp_gt_f32_e32 vcc, v10, v9
	v_cndmask_b32_e32 v11, v9, v10, vcc
	v_cmp_gt_f32_e32 vcc, v33, v31
	v_cndmask_b32_e32 v9, v33, v31, vcc
	v_cmp_gt_f32_e32 vcc, v31, v33
	v_cmp_gt_i32_e64 s[0:1], s12, v29
	v_cmp_lt_i32_e64 s[2:3], v30, v25
	v_cndmask_b32_e32 v10, v33, v31, vcc
	v_cmp_le_i32_e32 vcc, s12, v28
	s_and_b64 s[2:3], s[0:1], s[2:3]
	global_store_dwordx4 v[22:23], v[8:11], off
                                        ; implicit-def: $sgpr0_sgpr1
	s_and_saveexec_b64 s[8:9], vcc
	s_xor_b64 s[8:9], exec, s[8:9]
	s_cbranch_execz .LBB1_15
; %bb.12:                               ;   in Loop: Header=BB1_11 Depth=1
	s_mov_b64 s[0:1], 0
	s_and_saveexec_b64 s[10:11], s[2:3]
	s_cbranch_execz .LBB1_14
; %bb.13:                               ;   in Loop: Header=BB1_11 Depth=1
	s_waitcnt vmcnt(1)
	v_pk_mov_b32 v[8:9], v[16:17], v[16:17] op_sel:[0,1]
	s_mov_b64 s[0:1], exec
	v_mov_b32_e32 v24, v29
	v_pk_mov_b32 v[10:11], v[18:19], v[18:19] op_sel:[0,1]
.LBB1_14:                               ; %Flow362
                                        ;   in Loop: Header=BB1_11 Depth=1
	s_or_b64 exec, exec, s[10:11]
	s_and_b64 s[0:1], s[0:1], exec
                                        ; implicit-def: $vgpr28
                                        ; implicit-def: $vgpr12_vgpr13_vgpr14_vgpr15
                                        ; implicit-def: $vgpr16_vgpr17_vgpr18_vgpr19
                                        ; implicit-def: $vgpr29
.LBB1_15:                               ; %Flow364
                                        ;   in Loop: Header=BB1_11 Depth=1
	s_andn2_saveexec_b64 s[8:9], s[8:9]
	s_cbranch_execz .LBB1_10
; %bb.16:                               ;   in Loop: Header=BB1_11 Depth=1
	s_and_saveexec_b64 s[10:11], s[2:3]
	s_cbranch_execz .LBB1_9
; %bb.17:                               ;   in Loop: Header=BB1_11 Depth=1
	s_waitcnt vmcnt(1)
	v_cmp_lt_f32_e32 vcc, v12, v16
	v_cndmask_b32_e32 v15, v19, v15, vcc
	v_cndmask_b32_e32 v14, v18, v14, vcc
	v_cndmask_b32_e32 v13, v17, v13, vcc
	v_cndmask_b32_e32 v12, v16, v12, vcc
	v_cndmask_b32_e32 v24, v29, v24, vcc
	v_cndmask_b32_e32 v28, v27, v28, vcc
	s_branch .LBB1_9
.LBB1_18:
	s_or_b64 exec, exec, s[6:7]
	global_store_dwordx4 v[22:23], v[0:3], off
.LBB1_19:                               ; %.loopexit
	s_endpgm
	.section	.rodata,#alloc
	.p2align	6
	.amdhsa_kernel _Z13mergeSortPassP15HIP_vector_typeIfLj4EEii
		.amdhsa_group_segment_fixed_size 0
		.amdhsa_private_segment_fixed_size 0
		.amdhsa_kernarg_size 16
		.amdhsa_user_sgpr_count 8
		.amdhsa_user_sgpr_private_segment_buffer 1
		.amdhsa_user_sgpr_dispatch_ptr 1
		.amdhsa_user_sgpr_queue_ptr 0
		.amdhsa_user_sgpr_kernarg_segment_ptr 1
		.amdhsa_user_sgpr_dispatch_id 0
		.amdhsa_user_sgpr_flat_scratch_init 0
		.amdhsa_user_sgpr_private_segment_size 0
		.amdhsa_uses_dynamic_stack 0
		.amdhsa_system_sgpr_private_segment_wavefront_offset 0
		.amdhsa_system_sgpr_workgroup_id_x 1
		.amdhsa_system_sgpr_workgroup_id_y 0
		.amdhsa_system_sgpr_workgroup_id_z 0
		.amdhsa_system_sgpr_workgroup_info 0
		.amdhsa_system_vgpr_workitem_id 0
		.amdhsa_next_free_vgpr 34
		.amdhsa_next_free_sgpr 20
		.amdhsa_accum_offset 36
		.amdhsa_reserve_flat_scratch 0
		.amdhsa_reserve_xnack_mask 1
		.amdhsa_float_round_mode_32 0
		.amdhsa_float_round_mode_16_64 0
		.amdhsa_float_denorm_mode_32 3
		.amdhsa_float_denorm_mode_16_64 3
		.amdhsa_dx10_clamp 1
		.amdhsa_ieee_mode 1
		.amdhsa_fp16_overflow 0
		.amdhsa_tg_split 0
		.amdhsa_exception_fp_ieee_invalid_op 0
		.amdhsa_exception_fp_denorm_src 0
		.amdhsa_exception_fp_ieee_div_zero 0
		.amdhsa_exception_fp_ieee_overflow 0
		.amdhsa_exception_fp_ieee_underflow 0
		.amdhsa_exception_fp_ieee_inexact 0
		.amdhsa_exception_int_div_zero 0
	.end_amdhsa_kernel
	.text
.Lfunc_end1:
	.size	_Z13mergeSortPassP15HIP_vector_typeIfLj4EEii, .Lfunc_end1-_Z13mergeSortPassP15HIP_vector_typeIfLj4EEii
                                        ; -- End function
	.section	.AMDGPU.csdata
; Kernel info:
; codeLenInByte = 1164
; NumSgprs: 22
; NumVgprs: 34
; NumAgprs: 0
; TotalNumVgprs: 34
; ScratchSize: 0
; MemoryBound: 0
; FloatMode: 240
; IeeeMode: 1
; LDSByteSize: 0 bytes/workgroup (compile time only)
; SGPRBlocks: 2
; VGPRBlocks: 4
; NumSGPRsForWavesPerEU: 22
; NumVGPRsForWavesPerEU: 34
; AccumOffset: 36
; Occupancy: 8
; WaveLimiterHint : 0
; COMPUTE_PGM_RSRC2:SCRATCH_EN: 0
; COMPUTE_PGM_RSRC2:USER_SGPR: 8
; COMPUTE_PGM_RSRC2:TRAP_HANDLER: 0
; COMPUTE_PGM_RSRC2:TGID_X_EN: 1
; COMPUTE_PGM_RSRC2:TGID_Y_EN: 0
; COMPUTE_PGM_RSRC2:TGID_Z_EN: 0
; COMPUTE_PGM_RSRC2:TIDIG_COMP_CNT: 0
; COMPUTE_PGM_RSRC3_GFX90A:ACCUM_OFFSET: 8
; COMPUTE_PGM_RSRC3_GFX90A:TG_SPLIT: 0
	.text
	.protected	_Z9mergepackPfS_        ; -- Begin function _Z9mergepackPfS_
	.globl	_Z9mergepackPfS_
	.p2align	8
	.type	_Z9mergepackPfS_,@function
_Z9mergepackPfS_:                       ; @_Z9mergepackPfS_
; %bb.0:
	s_load_dword s1, s[4:5], 0x4
	s_load_dword s2, s[4:5], 0xc
	s_mov_b32 s0, s9
	s_waitcnt lgkmcnt(0)
	s_and_b32 s1, s1, 0xffff
	s_mul_i32 s3, s8, s1
	s_sub_i32 s2, s2, s3
	s_min_u32 s4, s2, s1
	s_ashr_i32 s1, s9, 31
	s_lshl_b64 s[0:1], s[0:1], 2
	s_getpc_b64 s[2:3]
	s_add_u32 s2, s2, finalStartAddr@rel32@lo+4
	s_addc_u32 s3, s3, finalStartAddr@rel32@hi+12
	s_add_u32 s2, s0, s2
	s_addc_u32 s3, s1, s3
	s_load_dwordx2 s[2:3], s[2:3], 0x0
	s_mul_i32 s4, s4, s8
	v_add_u32_e32 v1, s4, v0
	s_waitcnt lgkmcnt(0)
	v_add_u32_e32 v0, s2, v1
	v_cmp_gt_i32_e32 vcc, s3, v0
	s_and_saveexec_b64 s[2:3], vcc
	s_cbranch_execz .LBB2_2
; %bb.1:
	s_getpc_b64 s[2:3]
	s_add_u32 s2, s2, constStartAddr@rel32@lo+4
	s_addc_u32 s3, s3, constStartAddr@rel32@hi+12
	s_add_u32 s2, s0, s2
	s_addc_u32 s3, s1, s3
	s_load_dword s4, s[2:3], 0x0
	s_load_dwordx4 s[8:11], s[6:7], 0x0
	s_getpc_b64 s[2:3]
	s_add_u32 s2, s2, nullElems@rel32@lo+4
	s_addc_u32 s3, s3, nullElems@rel32@hi+12
	s_waitcnt lgkmcnt(0)
	s_lshl_b32 s4, s4, 2
	s_add_u32 s0, s0, s2
	s_addc_u32 s1, s1, s3
	s_load_dword s0, s[0:1], 0x0
	v_mov_b32_e32 v4, s9
	s_waitcnt lgkmcnt(0)
	s_add_i32 s4, s4, s0
	v_add_u32_e32 v2, s4, v1
	v_ashrrev_i32_e32 v3, 31, v2
	v_lshlrev_b64 v[2:3], 2, v[2:3]
	v_add_co_u32_e32 v2, vcc, s8, v2
	v_addc_co_u32_e32 v3, vcc, v4, v3, vcc
	global_load_dword v2, v[2:3], off
	v_ashrrev_i32_e32 v1, 31, v0
	v_lshlrev_b64 v[0:1], 2, v[0:1]
	v_mov_b32_e32 v3, s11
	v_add_co_u32_e32 v0, vcc, s10, v0
	v_addc_co_u32_e32 v1, vcc, v3, v1, vcc
	s_waitcnt vmcnt(0)
	global_store_dword v[0:1], v2, off
.LBB2_2:
	s_endpgm
	.section	.rodata,#alloc
	.p2align	6
	.amdhsa_kernel _Z9mergepackPfS_
		.amdhsa_group_segment_fixed_size 0
		.amdhsa_private_segment_fixed_size 0
		.amdhsa_kernarg_size 16
		.amdhsa_user_sgpr_count 8
		.amdhsa_user_sgpr_private_segment_buffer 1
		.amdhsa_user_sgpr_dispatch_ptr 1
		.amdhsa_user_sgpr_queue_ptr 0
		.amdhsa_user_sgpr_kernarg_segment_ptr 1
		.amdhsa_user_sgpr_dispatch_id 0
		.amdhsa_user_sgpr_flat_scratch_init 0
		.amdhsa_user_sgpr_private_segment_size 0
		.amdhsa_uses_dynamic_stack 0
		.amdhsa_system_sgpr_private_segment_wavefront_offset 0
		.amdhsa_system_sgpr_workgroup_id_x 1
		.amdhsa_system_sgpr_workgroup_id_y 1
		.amdhsa_system_sgpr_workgroup_id_z 0
		.amdhsa_system_sgpr_workgroup_info 0
		.amdhsa_system_vgpr_workitem_id 0
		.amdhsa_next_free_vgpr 5
		.amdhsa_next_free_sgpr 12
		.amdhsa_accum_offset 8
		.amdhsa_reserve_flat_scratch 0
		.amdhsa_reserve_xnack_mask 1
		.amdhsa_float_round_mode_32 0
		.amdhsa_float_round_mode_16_64 0
		.amdhsa_float_denorm_mode_32 3
		.amdhsa_float_denorm_mode_16_64 3
		.amdhsa_dx10_clamp 1
		.amdhsa_ieee_mode 1
		.amdhsa_fp16_overflow 0
		.amdhsa_tg_split 0
		.amdhsa_exception_fp_ieee_invalid_op 0
		.amdhsa_exception_fp_denorm_src 0
		.amdhsa_exception_fp_ieee_div_zero 0
		.amdhsa_exception_fp_ieee_overflow 0
		.amdhsa_exception_fp_ieee_underflow 0
		.amdhsa_exception_fp_ieee_inexact 0
		.amdhsa_exception_int_div_zero 0
	.end_amdhsa_kernel
	.text
.Lfunc_end2:
	.size	_Z9mergepackPfS_, .Lfunc_end2-_Z9mergepackPfS_
                                        ; -- End function
	.section	.AMDGPU.csdata
; Kernel info:
; codeLenInByte = 288
; NumSgprs: 14
; NumVgprs: 5
; NumAgprs: 0
; TotalNumVgprs: 5
; ScratchSize: 0
; MemoryBound: 0
; FloatMode: 240
; IeeeMode: 1
; LDSByteSize: 0 bytes/workgroup (compile time only)
; SGPRBlocks: 1
; VGPRBlocks: 0
; NumSGPRsForWavesPerEU: 14
; NumVGPRsForWavesPerEU: 5
; AccumOffset: 8
; Occupancy: 8
; WaveLimiterHint : 0
; COMPUTE_PGM_RSRC2:SCRATCH_EN: 0
; COMPUTE_PGM_RSRC2:USER_SGPR: 8
; COMPUTE_PGM_RSRC2:TRAP_HANDLER: 0
; COMPUTE_PGM_RSRC2:TGID_X_EN: 1
; COMPUTE_PGM_RSRC2:TGID_Y_EN: 1
; COMPUTE_PGM_RSRC2:TGID_Z_EN: 0
; COMPUTE_PGM_RSRC2:TIDIG_COMP_CNT: 0
; COMPUTE_PGM_RSRC3_GFX90A:ACCUM_OFFSET: 1
; COMPUTE_PGM_RSRC3_GFX90A:TG_SPLIT: 0
	.text
	.p2alignl 6, 3212836864
	.fill 256, 4, 3212836864
	.protected	tex                     ; @tex
	.type	tex,@object
	.section	.bss,#alloc,#write
	.globl	tex
	.p2align	3
tex:
	.zero	88
	.size	tex, 88

	.protected	txt                     ; @txt
	.type	txt,@object
	.globl	txt
	.p2align	3
txt:
	.zero	88
	.size	txt, 88

	.protected	constStartAddr          ; @constStartAddr
	.type	constStartAddr,@object
	.globl	constStartAddr
	.p2align	4
constStartAddr:
	.zero	4100
	.size	constStartAddr, 4100

	.protected	finalStartAddr          ; @finalStartAddr
	.type	finalStartAddr,@object
	.globl	finalStartAddr
	.p2align	4
finalStartAddr:
	.zero	4100
	.size	finalStartAddr, 4100

	.protected	nullElems               ; @nullElems
	.type	nullElems,@object
	.globl	nullElems
	.p2align	4
nullElems:
	.zero	4096
	.size	nullElems, 4096

	.protected	_ZN17__HIP_CoordinatesI14__HIP_BlockIdxE1xE ; @_ZN17__HIP_CoordinatesI14__HIP_BlockIdxE1xE
	.type	_ZN17__HIP_CoordinatesI14__HIP_BlockIdxE1xE,@object
	.section	.rodata._ZN17__HIP_CoordinatesI14__HIP_BlockIdxE1xE,#alloc
	.weak	_ZN17__HIP_CoordinatesI14__HIP_BlockIdxE1xE
_ZN17__HIP_CoordinatesI14__HIP_BlockIdxE1xE:
	.zero	1
	.size	_ZN17__HIP_CoordinatesI14__HIP_BlockIdxE1xE, 1

	.protected	_ZN17__HIP_CoordinatesI14__HIP_BlockDimE1xE ; @_ZN17__HIP_CoordinatesI14__HIP_BlockDimE1xE
	.type	_ZN17__HIP_CoordinatesI14__HIP_BlockDimE1xE,@object
	.section	.rodata._ZN17__HIP_CoordinatesI14__HIP_BlockDimE1xE,#alloc
	.weak	_ZN17__HIP_CoordinatesI14__HIP_BlockDimE1xE
_ZN17__HIP_CoordinatesI14__HIP_BlockDimE1xE:
	.zero	1
	.size	_ZN17__HIP_CoordinatesI14__HIP_BlockDimE1xE, 1

	.protected	_ZN17__HIP_CoordinatesI15__HIP_ThreadIdxE1xE ; @_ZN17__HIP_CoordinatesI15__HIP_ThreadIdxE1xE
	.type	_ZN17__HIP_CoordinatesI15__HIP_ThreadIdxE1xE,@object
	.section	.rodata._ZN17__HIP_CoordinatesI15__HIP_ThreadIdxE1xE,#alloc
	.weak	_ZN17__HIP_CoordinatesI15__HIP_ThreadIdxE1xE
_ZN17__HIP_CoordinatesI15__HIP_ThreadIdxE1xE:
	.zero	1
	.size	_ZN17__HIP_CoordinatesI15__HIP_ThreadIdxE1xE, 1

	.protected	_ZN17__HIP_CoordinatesI14__HIP_BlockIdxE1yE ; @_ZN17__HIP_CoordinatesI14__HIP_BlockIdxE1yE
	.type	_ZN17__HIP_CoordinatesI14__HIP_BlockIdxE1yE,@object
	.section	.rodata._ZN17__HIP_CoordinatesI14__HIP_BlockIdxE1yE,#alloc
	.weak	_ZN17__HIP_CoordinatesI14__HIP_BlockIdxE1yE
_ZN17__HIP_CoordinatesI14__HIP_BlockIdxE1yE:
	.zero	1
	.size	_ZN17__HIP_CoordinatesI14__HIP_BlockIdxE1yE, 1

	.ident	"clang version 16.0.0 (https://github.com/llvm/llvm-project 809855b56f06dd7182685f88fbbc64111df9339a)"
	.section	".note.GNU-stack"
	.addrsig
	.addrsig_sym tex
	.addrsig_sym constStartAddr
	.addrsig_sym finalStartAddr
	.addrsig_sym nullElems
	.addrsig_sym _ZN17__HIP_CoordinatesI14__HIP_BlockIdxE1xE
	.addrsig_sym _ZN17__HIP_CoordinatesI14__HIP_BlockDimE1xE
	.addrsig_sym _ZN17__HIP_CoordinatesI15__HIP_ThreadIdxE1xE
	.addrsig_sym _ZN17__HIP_CoordinatesI14__HIP_BlockIdxE1yE
	.amdgpu_metadata
---
amdhsa.kernels:
  - .agpr_count:     0
    .args:
      - .address_space:  global
        .offset:         0
        .size:           8
        .value_kind:     global_buffer
      - .offset:         8
        .size:           4
        .value_kind:     by_value
    .group_segment_fixed_size: 0
    .kernarg_segment_align: 8
    .kernarg_segment_size: 12
    .language:       OpenCL C
    .language_version:
      - 2
      - 0
    .max_flat_workgroup_size: 1024
    .name:           _Z14mergeSortFirstP15HIP_vector_typeIfLj4EEi
    .private_segment_fixed_size: 0
    .sgpr_count:     11
    .sgpr_spill_count: 0
    .symbol:         _Z14mergeSortFirstP15HIP_vector_typeIfLj4EEi.kd
    .uses_dynamic_stack: false
    .vgpr_count:     10
    .vgpr_spill_count: 0
    .wavefront_size: 64
  - .agpr_count:     0
    .args:
      - .address_space:  global
        .offset:         0
        .size:           8
        .value_kind:     global_buffer
      - .offset:         8
        .size:           4
        .value_kind:     by_value
      - .offset:         12
        .size:           4
        .value_kind:     by_value
    .group_segment_fixed_size: 0
    .kernarg_segment_align: 8
    .kernarg_segment_size: 16
    .language:       OpenCL C
    .language_version:
      - 2
      - 0
    .max_flat_workgroup_size: 1024
    .name:           _Z13mergeSortPassP15HIP_vector_typeIfLj4EEii
    .private_segment_fixed_size: 0
    .sgpr_count:     22
    .sgpr_spill_count: 0
    .symbol:         _Z13mergeSortPassP15HIP_vector_typeIfLj4EEii.kd
    .uses_dynamic_stack: false
    .vgpr_count:     34
    .vgpr_spill_count: 0
    .wavefront_size: 64
  - .agpr_count:     0
    .args:
      - .address_space:  global
        .offset:         0
        .size:           8
        .value_kind:     global_buffer
      - .address_space:  global
        .offset:         8
        .size:           8
        .value_kind:     global_buffer
    .group_segment_fixed_size: 0
    .kernarg_segment_align: 8
    .kernarg_segment_size: 16
    .language:       OpenCL C
    .language_version:
      - 2
      - 0
    .max_flat_workgroup_size: 1024
    .name:           _Z9mergepackPfS_
    .private_segment_fixed_size: 0
    .sgpr_count:     14
    .sgpr_spill_count: 0
    .symbol:         _Z9mergepackPfS_.kd
    .uses_dynamic_stack: false
    .vgpr_count:     5
    .vgpr_spill_count: 0
    .wavefront_size: 64
amdhsa.target:   amdgcn-amd-amdhsa--gfx90a
amdhsa.version:
  - 1
  - 1
...

	.end_amdgpu_metadata

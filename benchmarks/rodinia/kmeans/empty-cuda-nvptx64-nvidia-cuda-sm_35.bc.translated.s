	.text
	.amdgcn_target "amdgcn-amd-amdhsa--gfx90a"
	.globl	_Z14invert_mappingPfS_ii        ; -- Begin function _Z14invert_mappingPfS_ii
	.p2align	8
	.type	_Z14invert_mappingPfS_ii,@function
_Z14invert_mappingPfS_ii:               ; @_Z14invert_mappingPfS_ii
; %bb.0:
	s_mov_b32 s33, 0
	s_add_u32 flat_scratch_lo, s12, s17
	s_addc_u32 flat_scratch_hi, s13, 0
	s_add_u32 s0, s0, s17
	s_addc_u32 s1, s1, 0
	s_load_dwordx2 s[6:7], s[8:9], 0x0
	s_load_dwordx2 s[10:11], s[8:9], 0x8
	s_load_dword s12, s[8:9], 0x10
	s_nop 0
	s_load_dword s8, s[8:9], 0x14
	s_getreg_b32 s9, hwreg(HW_REG_SH_MEM_BASES, 0, 16)
	s_lshl_b32 s9, s9, 16
	v_mov_b32_e32 v2, 8
	v_mov_b32_e32 v3, s9
	v_mov_b32_e32 v4, 16
	v_mov_b32_e32 v5, s9
	v_mov_b32_e32 v6, 24
	v_mov_b32_e32 v7, s9
	v_mov_b32_e32 v8, 28
	v_mov_b32_e32 v9, s9
	v_mov_b32_e32 v10, 32
	v_mov_b32_e32 v11, s9
	s_waitcnt lgkmcnt(0)
	v_pk_mov_b32 v[12:13], s[6:7], s[6:7] op_sel:[0,1]
	flat_store_dwordx2 v[2:3], v[12:13]
	v_pk_mov_b32 v[12:13], s[10:11], s[10:11] op_sel:[0,1]
	flat_store_dwordx2 v[4:5], v[12:13]
	v_mov_b32_e32 v1, s12
	flat_store_dword v[6:7], v1
	v_mov_b32_e32 v1, s8
	flat_store_dword v[8:9], v1
	v_mov_b32_e32 v1, 0
	global_load_ushort v1, v1, s[4:5] offset:4 glc
	s_waitcnt vmcnt(0)
	v_mul_lo_u32 v1, v1, s14
	s_mov_b32 s4, 0x3ff
	v_and_b32_e64 v0, v0, s4
	v_add_u32_e64 v0, v0, v1
	flat_store_dword v[10:11], v0
	flat_load_dword v0, v[10:11]
	s_nop 0
	flat_load_dword v1, v[6:7]
	s_waitcnt vmcnt(0) lgkmcnt(0)
	v_cmp_lt_i32_e64 s[6:7], v0, v1
	s_mov_b64 s[4:5], exec
	s_and_b64 s[6:7], s[4:5], s[6:7]
	s_mov_b64 exec, s[6:7]
	s_cbranch_execz .LBB0_2
; %bb.1:
	s_getreg_b32 s6, hwreg(HW_REG_SH_MEM_BASES, 0, 16)
	s_lshl_b32 s6, s6, 16
	v_mov_b32_e32 v0, 36
	v_mov_b32_e32 v1, s6
	v_mov_b32_e32 v12, 0
	flat_store_dword v[0:1], v12
	s_mov_b64 s[6:7], 0
                                        ; implicit-def: $sgpr8_sgpr9
	s_branch .LBB0_3
.LBB0_2:                                ; %Flow7
	s_or_b64 exec, exec, s[4:5]
	s_branch .LBB0_7
.LBB0_3:                                ; =>This Inner Loop Header: Depth=1
	flat_load_dword v12, v[0:1]
	flat_load_dword v13, v[8:9]
	s_waitcnt vmcnt(0) lgkmcnt(0)
	v_cmp_lt_i32_e64 s[12:13], v12, v13
	s_mov_b64 s[10:11], -1
	s_or_b64 s[8:9], s[8:9], exec
	s_mov_b64 s[10:11], exec
	s_and_b64 s[12:13], s[10:11], s[12:13]
	s_mov_b64 exec, s[12:13]
	s_cbranch_execz .LBB0_5
; %bb.4:                                ;   in Loop: Header=BB0_3 Depth=1
	flat_load_dwordx2 v[12:13], v[2:3]
	flat_load_dword v14, v[10:11]
	flat_load_dword v15, v[8:9]
	flat_load_dword v16, v[0:1]
	s_waitcnt vmcnt(0) lgkmcnt(0)
	v_mad_u64_u32 v[18:19], s[12:13], v14, v15, v[16:17]
	v_ashrrev_i32_e64 v19, 31, v18
	s_mov_b32 s14, 2
	v_lshlrev_b64 v[18:19], s14, v[18:19]
	v_add_co_u32_e64 v12, s[12:13], v12, v18
	v_addc_co_u32_e64 v13, s[12:13], v13, v19, s[12:13]
	flat_load_dword v17, v[12:13]
	s_nop 0
	flat_load_dwordx2 v[12:13], v[4:5]
	flat_load_dword v15, v[6:7]
	s_waitcnt vmcnt(0) lgkmcnt(0)
	v_mad_u64_u32 v[14:15], s[12:13], v15, v16, v[14:15]
	v_ashrrev_i32_e64 v15, 31, v14
	v_lshlrev_b64 v[14:15], s14, v[14:15]
	v_add_co_u32_e64 v12, s[12:13], v12, v14
	v_addc_co_u32_e64 v13, s[12:13], v13, v15, s[12:13]
	flat_store_dword v[12:13], v17
	s_branch .LBB0_6
.LBB0_5:                                ; %Flow
                                        ;   in Loop: Header=BB0_3 Depth=1
	s_or_b64 exec, exec, s[10:11]
	s_and_b64 s[10:11], exec, s[8:9]
	s_or_b64 s[6:7], s[10:11], s[6:7]
	s_andn2_b64 exec, exec, s[6:7]
	s_cbranch_execnz .LBB0_3
	s_branch .LBB0_2
.LBB0_6:                                ;   in Loop: Header=BB0_3 Depth=1
	flat_load_dword v12, v[0:1]
	s_mov_b32 s12, 1
	s_waitcnt vmcnt(0) lgkmcnt(0)
	v_add_u32_e64 v12, v12, s12
	flat_store_dword v[0:1], v12
	s_mov_b64 s[12:13], 0
	s_andn2_b64 s[8:9], s[8:9], exec
	s_branch .LBB0_5
.LBB0_7:
	s_endpgm
	.section	.rodata,#alloc
	.p2align	6, 0x0
	.amdhsa_kernel _Z14invert_mappingPfS_ii
		.amdhsa_group_segment_fixed_size 0
		.amdhsa_private_segment_fixed_size 40
		.amdhsa_kernarg_size 80
		.amdhsa_user_sgpr_count 14
		.amdhsa_user_sgpr_private_segment_buffer 1
		.amdhsa_user_sgpr_dispatch_ptr 1
		.amdhsa_user_sgpr_queue_ptr 1
		.amdhsa_user_sgpr_kernarg_segment_ptr 1
		.amdhsa_user_sgpr_dispatch_id 1
		.amdhsa_user_sgpr_flat_scratch_init 1
		.amdhsa_user_sgpr_private_segment_size 0
		.amdhsa_uses_dynamic_stack 0
		.amdhsa_system_sgpr_private_segment_wavefront_offset 1
		.amdhsa_system_sgpr_workgroup_id_x 1
		.amdhsa_system_sgpr_workgroup_id_y 1
		.amdhsa_system_sgpr_workgroup_id_z 1
		.amdhsa_system_sgpr_workgroup_info 0
		.amdhsa_system_vgpr_workitem_id 2
		.amdhsa_next_free_vgpr 20
		.amdhsa_next_free_sgpr 34
		.amdhsa_accum_offset 20
		.amdhsa_reserve_vcc 0
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
	.size	_Z14invert_mappingPfS_ii, .Lfunc_end0-_Z14invert_mappingPfS_ii
                                        ; -- End function
	.section	.AMDGPU.csdata
; Kernel info:
; codeLenInByte = 640
; NumSgprs: 40
; NumVgprs: 20
; NumAgprs: 0
; TotalNumVgprs: 20
; ScratchSize: 40
; MemoryBound: 0
; FloatMode: 240
; IeeeMode: 1
; LDSByteSize: 0 bytes/workgroup (compile time only)
; SGPRBlocks: 4
; VGPRBlocks: 2
; NumSGPRsForWavesPerEU: 40
; NumVGPRsForWavesPerEU: 20
; AccumOffset: 20
; Occupancy: 8
; WaveLimiterHint : 1
; COMPUTE_PGM_RSRC2:SCRATCH_EN: 1
; COMPUTE_PGM_RSRC2:USER_SGPR: 14
; COMPUTE_PGM_RSRC2:TRAP_HANDLER: 0
; COMPUTE_PGM_RSRC2:TGID_X_EN: 1
; COMPUTE_PGM_RSRC2:TGID_Y_EN: 1
; COMPUTE_PGM_RSRC2:TGID_Z_EN: 1
; COMPUTE_PGM_RSRC2:TIDIG_COMP_CNT: 2
; COMPUTE_PGM_RSRC3_GFX90A:ACCUM_OFFSET: 4
; COMPUTE_PGM_RSRC3_GFX90A:TG_SPLIT: 0
	.text
	.globl	_Z11kmeansPointPfiiiPiS_S_S0_   ; -- Begin function _Z11kmeansPointPfiiiPiS_S_S0_
	.p2align	8
	.type	_Z11kmeansPointPfiiiPiS_S_S0_,@function
_Z11kmeansPointPfiiiPiS_S_S0_:          ; @_Z11kmeansPointPfiiiPiS_S_S0_
; %bb.0:
	s_mov_b32 s33, 0
	s_add_u32 flat_scratch_lo, s12, s17
	s_addc_u32 flat_scratch_hi, s13, 0
	s_add_u32 s0, s0, s17
	s_addc_u32 s1, s1, 0
	s_load_dwordx2 s[6:7], s[8:9], 0x0
	s_load_dword s18, s[8:9], 0x8
	s_load_dword s19, s[8:9], 0xc
	s_load_dword s20, s[8:9], 0x10
	s_load_dwordx2 s[10:11], s[8:9], 0x18
	s_load_dwordx2 s[12:13], s[8:9], 0x20
	s_load_dwordx2 s[16:17], s[8:9], 0x28
	s_nop 0
	s_load_dwordx2 s[8:9], s[8:9], 0x30
	s_getreg_b32 s21, hwreg(HW_REG_SH_MEM_BASES, 0, 16)
	s_lshl_b32 s21, s21, 16
	v_mov_b32_e32 v2, 0x60
	v_mov_b32_e32 v3, s21
	v_mov_b32_e32 v8, 0x68
	v_mov_b32_e32 v9, s21
	v_mov_b32_e32 v6, 0x6c
	v_mov_b32_e32 v7, s21
	v_mov_b32_e32 v10, 0x70
	v_mov_b32_e32 v11, s21
	v_mov_b32_e32 v4, 0x78
	v_mov_b32_e32 v5, s21
	v_mov_b32_e32 v16, 0x80
	v_mov_b32_e32 v17, s21
	v_mov_b32_e32 v18, 0x88
	v_mov_b32_e32 v19, s21
	v_mov_b32_e32 v20, 0x90
	v_mov_b32_e32 v21, s21
	v_mov_b32_e32 v22, 0x98
	v_mov_b32_e32 v23, s21
	v_mov_b32_e32 v12, 0x9c
	v_mov_b32_e32 v13, s21
	v_mov_b32_e32 v14, 0xa0
	v_mov_b32_e32 v15, s21
	s_waitcnt lgkmcnt(0)
	v_pk_mov_b32 v[24:25], s[6:7], s[6:7] op_sel:[0,1]
	flat_store_dwordx2 v[2:3], v[24:25]
	v_mov_b32_e32 v1, s18
	flat_store_dword v[8:9], v1
	v_mov_b32_e32 v1, s19
	flat_store_dword v[6:7], v1
	v_mov_b32_e32 v1, s20
	flat_store_dword v[10:11], v1
	v_pk_mov_b32 v[2:3], s[10:11], s[10:11] op_sel:[0,1]
	flat_store_dwordx2 v[4:5], v[2:3]
	v_pk_mov_b32 v[2:3], s[12:13], s[12:13] op_sel:[0,1]
	flat_store_dwordx2 v[16:17], v[2:3]
	v_pk_mov_b32 v[2:3], s[16:17], s[16:17] op_sel:[0,1]
	flat_store_dwordx2 v[18:19], v[2:3]
	v_pk_mov_b32 v[2:3], s[8:9], s[8:9] op_sel:[0,1]
	flat_store_dwordx2 v[20:21], v[2:3]
	v_mov_b32_e32 v1, 0
	s_load_dword s6, s[4:5], 0xc
	global_load_ushort v2, v1, s[4:5] offset:4
	s_mov_b32 s7, 0
	s_waitcnt vmcnt(0)
	v_sub_u32_e64 v3, s7, v2
	v_cvt_f32_u32_e32 v16, v2
	v_rcp_iflag_f32_e32 v16, v16
	v_mul_f32_e32 v16, 0x4f7ffffe, v16
	v_cvt_u32_f32_e32 v16, v16
	v_mul_lo_u32 v3, v3, v16
	v_mul_hi_u32 v3, v16, v3
	v_add_u32_e64 v3, v16, v3
	s_waitcnt lgkmcnt(0)
	v_mul_hi_u32 v3, s6, v3
	s_mov_b32 s8, 1
	v_add_u32_e64 v16, v3, s8
	v_mul_lo_u32 v17, v3, v2
	v_sub_u32_e64 v17, s6, v17
	v_sub_u32_e64 v18, v17, v2
	v_cmp_ge_u32_e64 s[6:7], v17, v2
	v_cndmask_b32_e64 v17, v17, v18, s[6:7]
	v_cndmask_b32_e64 v3, v3, v16, s[6:7]
	v_add_u32_e64 v16, v3, s8
	v_cmp_ge_u32_e64 s[6:7], v17, v2
	v_cndmask_b32_e64 v2, v3, v16, s[6:7]
	v_mul_lo_u32 v2, v2, s15
	v_add_u32_e64 v2, v2, s14
	flat_store_dword v[22:23], v2
	flat_load_dword v2, v[22:23]
	s_nop 0
	global_load_ushort v3, v1, s[4:5] offset:4 glc
	s_waitcnt vmcnt(0) lgkmcnt(0)
	v_mul_lo_u32 v2, v2, v3
	global_load_ushort v1, v1, s[4:5] offset:6
	s_mov_b32 s4, 0x3ff
	v_and_b32_e64 v0, v0, s4
	s_waitcnt vmcnt(0)
	v_mad_u64_u32 v[0:1], s[4:5], v2, v1, v[0:1]
	flat_store_dword v[12:13], v0
	v_mov_b32_e32 v0, -1
	flat_store_dword v[14:15], v0
	flat_load_dword v0, v[12:13]
	s_nop 0
	flat_load_dword v1, v[6:7]
	s_waitcnt vmcnt(0) lgkmcnt(0)
	v_cmp_lt_u32_e64 s[4:5], v0, v1
	s_mov_b64 s[8:9], exec
	s_and_b64 s[4:5], s[8:9], s[4:5]
	s_mov_b64 exec, s[4:5]
	s_cbranch_execz .LBB1_2
; %bb.1:
	s_getreg_b32 s4, hwreg(HW_REG_SH_MEM_BASES, 0, 16)
	s_lshl_b32 s4, s4, 16
	v_mov_b32_e32 v16, 8
	v_mov_b32_e32 v17, s4
	v_mov_b32_e32 v18, 0xa4
	v_mov_b32_e32 v19, s4
	v_mov_b32_e32 v20, 0xa8
	v_mov_b32_e32 v21, s4
	v_mov_b32_e32 v22, 0xac
	v_mov_b32_e32 v23, s4
	v_mov_b32_e32 v24, 0xb0
	v_mov_b32_e32 v25, s4
	v_mov_b32_e32 v26, 0xb4
	v_mov_b32_e32 v27, s4
	v_mov_b32_e32 v28, 0xb8
	v_mov_b32_e32 v29, s4
	v_mov_b32_e32 v30, 0xbc
	v_mov_b32_e32 v31, s4
	v_mov_b32_e32 v32, 0xc0
	v_mov_b32_e32 v33, s4
	v_mov_b32_e32 v0, 0x7f7fffff
	flat_store_dword v[22:23], v0
	v_mov_b32_e32 v0, 0
	flat_store_dword v[18:19], v0
	s_mov_b64 s[10:11], 0
                                        ; implicit-def: $sgpr12_sgpr13
	s_branch .LBB1_3
.LBB1_2:                                ; %Flow18
	s_or_b64 exec, exec, s[8:9]
	s_branch .LBB1_17
.LBB1_3:                                ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB1_6 Depth 2
                                        ;       Child Loop BB1_8 Depth 3
	flat_load_dword v0, v[18:19]
	flat_load_dword v1, v[10:11]
	s_waitcnt vmcnt(0) lgkmcnt(0)
	v_cmp_lt_i32_e64 s[4:5], v0, v1
	s_mov_b64 s[6:7], -1
	s_or_b64 s[12:13], s[12:13], exec
	s_mov_b64 s[14:15], exec
	s_and_b64 s[4:5], s[14:15], s[4:5]
	s_mov_b64 exec, s[4:5]
	s_cbranch_execz .LBB1_5
; %bb.4:                                ;   in Loop: Header=BB1_3 Depth=1
	flat_load_dword v0, v[18:19]
	flat_load_dword v1, v[8:9]
	s_waitcnt vmcnt(0) lgkmcnt(0)
	v_mul_lo_u32 v0, v0, v1
	flat_store_dword v[26:27], v0
	v_mov_b32_e32 v0, 0
	flat_store_dword v[28:29], v0
	flat_store_dword v[20:21], v0
	s_mov_b64 s[16:17], 0
                                        ; implicit-def: $sgpr18_sgpr19
	s_branch .LBB1_6
.LBB1_5:                                ; %Flow17
                                        ;   in Loop: Header=BB1_3 Depth=1
	s_or_b64 exec, exec, s[14:15]
	s_and_b64 s[4:5], exec, s[12:13]
	s_or_b64 s[10:11], s[4:5], s[10:11]
	s_andn2_b64 exec, exec, s[10:11]
	s_cbranch_execnz .LBB1_3
	s_branch .LBB1_2
.LBB1_6:                                ;   Parent Loop BB1_3 Depth=1
                                        ; =>  This Loop Header: Depth=2
                                        ;       Child Loop BB1_8 Depth 3
	flat_load_dword v0, v[20:21]
	flat_load_dword v1, v[8:9]
	s_waitcnt vmcnt(0) lgkmcnt(0)
	v_cmp_lt_i32_e64 s[4:5], v0, v1
	s_mov_b64 s[6:7], -1
	s_or_b64 s[18:19], s[18:19], exec
	s_mov_b64 s[20:21], exec
	s_and_b64 s[4:5], s[20:21], s[4:5]
	s_mov_b64 exec, s[4:5]
	s_cbranch_execz .LBB1_11
; %bb.7:                                ;   in Loop: Header=BB1_6 Depth=2
	flat_load_dword v0, v[12:13]
	flat_load_dword v1, v[20:21]
	flat_load_dword v2, v[6:7]
	s_waitcnt vmcnt(0) lgkmcnt(0)
	v_mad_u64_u32 v[0:1], s[4:5], v1, v2, v[0:1]
	flat_store_dword v[30:31], v0
	s_getpc_b64 s[4:5]
	s_add_u32 s4, s4, t_features@gotpcrel32@lo+4
	s_addc_u32 s5, s5, t_features@gotpcrel32@hi+12
	s_load_dwordx2 s[4:5], s[4:5], 0x0
	s_waitcnt lgkmcnt(0)
	v_pk_mov_b32 v[0:1], s[4:5], s[4:5] op_sel:[0,1]
	flat_load_ubyte v0, v[0:1] offset:87
	s_waitcnt vmcnt(0) lgkmcnt(0)
	flat_store_byte v[16:17], v0 offset:87
	v_pk_mov_b32 v[0:1], s[4:5], s[4:5] op_sel:[0,1]
	flat_load_ubyte v0, v[0:1] offset:86
	s_waitcnt vmcnt(0) lgkmcnt(0)
	flat_store_byte v[16:17], v0 offset:86
	v_pk_mov_b32 v[0:1], s[4:5], s[4:5] op_sel:[0,1]
	flat_load_ubyte v0, v[0:1] offset:85
	s_waitcnt vmcnt(0) lgkmcnt(0)
	flat_store_byte v[16:17], v0 offset:85
	v_pk_mov_b32 v[0:1], s[4:5], s[4:5] op_sel:[0,1]
	flat_load_ubyte v0, v[0:1] offset:84
	s_waitcnt vmcnt(0) lgkmcnt(0)
	flat_store_byte v[16:17], v0 offset:84
	v_pk_mov_b32 v[0:1], s[4:5], s[4:5] op_sel:[0,1]
	flat_load_ubyte v0, v[0:1] offset:83
	s_waitcnt vmcnt(0) lgkmcnt(0)
	flat_store_byte v[16:17], v0 offset:83
	v_pk_mov_b32 v[0:1], s[4:5], s[4:5] op_sel:[0,1]
	flat_load_ubyte v0, v[0:1] offset:82
	s_waitcnt vmcnt(0) lgkmcnt(0)
	flat_store_byte v[16:17], v0 offset:82
	v_pk_mov_b32 v[0:1], s[4:5], s[4:5] op_sel:[0,1]
	flat_load_ubyte v0, v[0:1] offset:81
	s_waitcnt vmcnt(0) lgkmcnt(0)
	flat_store_byte v[16:17], v0 offset:81
	v_pk_mov_b32 v[0:1], s[4:5], s[4:5] op_sel:[0,1]
	flat_load_ubyte v0, v[0:1] offset:80
	s_waitcnt vmcnt(0) lgkmcnt(0)
	flat_store_byte v[16:17], v0 offset:80
	v_pk_mov_b32 v[0:1], s[4:5], s[4:5] op_sel:[0,1]
	flat_load_ubyte v0, v[0:1] offset:79
	s_waitcnt vmcnt(0) lgkmcnt(0)
	flat_store_byte v[16:17], v0 offset:79
	v_pk_mov_b32 v[0:1], s[4:5], s[4:5] op_sel:[0,1]
	flat_load_ubyte v0, v[0:1] offset:78
	s_waitcnt vmcnt(0) lgkmcnt(0)
	flat_store_byte v[16:17], v0 offset:78
	v_pk_mov_b32 v[0:1], s[4:5], s[4:5] op_sel:[0,1]
	flat_load_ubyte v0, v[0:1] offset:77
	s_waitcnt vmcnt(0) lgkmcnt(0)
	flat_store_byte v[16:17], v0 offset:77
	v_pk_mov_b32 v[0:1], s[4:5], s[4:5] op_sel:[0,1]
	flat_load_ubyte v0, v[0:1] offset:76
	s_waitcnt vmcnt(0) lgkmcnt(0)
	flat_store_byte v[16:17], v0 offset:76
	v_pk_mov_b32 v[0:1], s[4:5], s[4:5] op_sel:[0,1]
	flat_load_ubyte v0, v[0:1] offset:75
	s_waitcnt vmcnt(0) lgkmcnt(0)
	flat_store_byte v[16:17], v0 offset:75
	v_pk_mov_b32 v[0:1], s[4:5], s[4:5] op_sel:[0,1]
	flat_load_ubyte v0, v[0:1] offset:74
	s_waitcnt vmcnt(0) lgkmcnt(0)
	flat_store_byte v[16:17], v0 offset:74
	v_pk_mov_b32 v[0:1], s[4:5], s[4:5] op_sel:[0,1]
	flat_load_ubyte v0, v[0:1] offset:73
	s_waitcnt vmcnt(0) lgkmcnt(0)
	flat_store_byte v[16:17], v0 offset:73
	v_pk_mov_b32 v[0:1], s[4:5], s[4:5] op_sel:[0,1]
	flat_load_ubyte v0, v[0:1] offset:72
	s_waitcnt vmcnt(0) lgkmcnt(0)
	flat_store_byte v[16:17], v0 offset:72
	v_pk_mov_b32 v[0:1], s[4:5], s[4:5] op_sel:[0,1]
	flat_load_ubyte v0, v[0:1] offset:71
	s_waitcnt vmcnt(0) lgkmcnt(0)
	flat_store_byte v[16:17], v0 offset:71
	v_pk_mov_b32 v[0:1], s[4:5], s[4:5] op_sel:[0,1]
	flat_load_ubyte v0, v[0:1] offset:70
	s_waitcnt vmcnt(0) lgkmcnt(0)
	flat_store_byte v[16:17], v0 offset:70
	v_pk_mov_b32 v[0:1], s[4:5], s[4:5] op_sel:[0,1]
	flat_load_ubyte v0, v[0:1] offset:69
	s_waitcnt vmcnt(0) lgkmcnt(0)
	flat_store_byte v[16:17], v0 offset:69
	v_pk_mov_b32 v[0:1], s[4:5], s[4:5] op_sel:[0,1]
	flat_load_ubyte v0, v[0:1] offset:68
	s_waitcnt vmcnt(0) lgkmcnt(0)
	flat_store_byte v[16:17], v0 offset:68
	v_pk_mov_b32 v[0:1], s[4:5], s[4:5] op_sel:[0,1]
	flat_load_ubyte v0, v[0:1] offset:67
	s_waitcnt vmcnt(0) lgkmcnt(0)
	flat_store_byte v[16:17], v0 offset:67
	v_pk_mov_b32 v[0:1], s[4:5], s[4:5] op_sel:[0,1]
	flat_load_ubyte v0, v[0:1] offset:66
	s_waitcnt vmcnt(0) lgkmcnt(0)
	flat_store_byte v[16:17], v0 offset:66
	v_pk_mov_b32 v[0:1], s[4:5], s[4:5] op_sel:[0,1]
	flat_load_ubyte v0, v[0:1] offset:65
	s_waitcnt vmcnt(0) lgkmcnt(0)
	flat_store_byte v[16:17], v0 offset:65
	v_pk_mov_b32 v[0:1], s[4:5], s[4:5] op_sel:[0,1]
	flat_load_ubyte v0, v[0:1] offset:64
	s_waitcnt vmcnt(0) lgkmcnt(0)
	flat_store_byte v[16:17], v0 offset:64
	v_pk_mov_b32 v[0:1], s[4:5], s[4:5] op_sel:[0,1]
	flat_load_ubyte v0, v[0:1] offset:63
	s_waitcnt vmcnt(0) lgkmcnt(0)
	flat_store_byte v[16:17], v0 offset:63
	v_pk_mov_b32 v[0:1], s[4:5], s[4:5] op_sel:[0,1]
	flat_load_ubyte v0, v[0:1] offset:62
	s_waitcnt vmcnt(0) lgkmcnt(0)
	flat_store_byte v[16:17], v0 offset:62
	v_pk_mov_b32 v[0:1], s[4:5], s[4:5] op_sel:[0,1]
	flat_load_ubyte v0, v[0:1] offset:61
	s_waitcnt vmcnt(0) lgkmcnt(0)
	flat_store_byte v[16:17], v0 offset:61
	v_pk_mov_b32 v[0:1], s[4:5], s[4:5] op_sel:[0,1]
	flat_load_ubyte v0, v[0:1] offset:60
	s_waitcnt vmcnt(0) lgkmcnt(0)
	flat_store_byte v[16:17], v0 offset:60
	v_pk_mov_b32 v[0:1], s[4:5], s[4:5] op_sel:[0,1]
	flat_load_ubyte v0, v[0:1] offset:59
	s_waitcnt vmcnt(0) lgkmcnt(0)
	flat_store_byte v[16:17], v0 offset:59
	v_pk_mov_b32 v[0:1], s[4:5], s[4:5] op_sel:[0,1]
	flat_load_ubyte v0, v[0:1] offset:58
	s_waitcnt vmcnt(0) lgkmcnt(0)
	flat_store_byte v[16:17], v0 offset:58
	v_pk_mov_b32 v[0:1], s[4:5], s[4:5] op_sel:[0,1]
	flat_load_ubyte v0, v[0:1] offset:57
	s_waitcnt vmcnt(0) lgkmcnt(0)
	flat_store_byte v[16:17], v0 offset:57
	v_pk_mov_b32 v[0:1], s[4:5], s[4:5] op_sel:[0,1]
	flat_load_ubyte v0, v[0:1] offset:56
	s_waitcnt vmcnt(0) lgkmcnt(0)
	flat_store_byte v[16:17], v0 offset:56
	v_pk_mov_b32 v[0:1], s[4:5], s[4:5] op_sel:[0,1]
	flat_load_ubyte v0, v[0:1] offset:55
	s_waitcnt vmcnt(0) lgkmcnt(0)
	flat_store_byte v[16:17], v0 offset:55
	v_pk_mov_b32 v[0:1], s[4:5], s[4:5] op_sel:[0,1]
	flat_load_ubyte v0, v[0:1] offset:54
	s_waitcnt vmcnt(0) lgkmcnt(0)
	flat_store_byte v[16:17], v0 offset:54
	v_pk_mov_b32 v[0:1], s[4:5], s[4:5] op_sel:[0,1]
	flat_load_ubyte v0, v[0:1] offset:53
	s_waitcnt vmcnt(0) lgkmcnt(0)
	flat_store_byte v[16:17], v0 offset:53
	v_pk_mov_b32 v[0:1], s[4:5], s[4:5] op_sel:[0,1]
	flat_load_ubyte v0, v[0:1] offset:52
	s_waitcnt vmcnt(0) lgkmcnt(0)
	flat_store_byte v[16:17], v0 offset:52
	v_pk_mov_b32 v[0:1], s[4:5], s[4:5] op_sel:[0,1]
	flat_load_ubyte v0, v[0:1] offset:51
	s_waitcnt vmcnt(0) lgkmcnt(0)
	flat_store_byte v[16:17], v0 offset:51
	v_pk_mov_b32 v[0:1], s[4:5], s[4:5] op_sel:[0,1]
	flat_load_ubyte v0, v[0:1] offset:50
	s_waitcnt vmcnt(0) lgkmcnt(0)
	flat_store_byte v[16:17], v0 offset:50
	v_pk_mov_b32 v[0:1], s[4:5], s[4:5] op_sel:[0,1]
	flat_load_ubyte v0, v[0:1] offset:49
	s_waitcnt vmcnt(0) lgkmcnt(0)
	flat_store_byte v[16:17], v0 offset:49
	v_pk_mov_b32 v[0:1], s[4:5], s[4:5] op_sel:[0,1]
	flat_load_ubyte v0, v[0:1] offset:48
	s_waitcnt vmcnt(0) lgkmcnt(0)
	flat_store_byte v[16:17], v0 offset:48
	v_pk_mov_b32 v[0:1], s[4:5], s[4:5] op_sel:[0,1]
	flat_load_ubyte v0, v[0:1] offset:47
	s_waitcnt vmcnt(0) lgkmcnt(0)
	flat_store_byte v[16:17], v0 offset:47
	v_pk_mov_b32 v[0:1], s[4:5], s[4:5] op_sel:[0,1]
	flat_load_ubyte v0, v[0:1] offset:46
	s_waitcnt vmcnt(0) lgkmcnt(0)
	flat_store_byte v[16:17], v0 offset:46
	v_pk_mov_b32 v[0:1], s[4:5], s[4:5] op_sel:[0,1]
	flat_load_ubyte v0, v[0:1] offset:45
	s_waitcnt vmcnt(0) lgkmcnt(0)
	flat_store_byte v[16:17], v0 offset:45
	v_pk_mov_b32 v[0:1], s[4:5], s[4:5] op_sel:[0,1]
	flat_load_ubyte v0, v[0:1] offset:44
	s_waitcnt vmcnt(0) lgkmcnt(0)
	flat_store_byte v[16:17], v0 offset:44
	v_pk_mov_b32 v[0:1], s[4:5], s[4:5] op_sel:[0,1]
	flat_load_ubyte v0, v[0:1] offset:43
	s_waitcnt vmcnt(0) lgkmcnt(0)
	flat_store_byte v[16:17], v0 offset:43
	v_pk_mov_b32 v[0:1], s[4:5], s[4:5] op_sel:[0,1]
	flat_load_ubyte v0, v[0:1] offset:42
	s_waitcnt vmcnt(0) lgkmcnt(0)
	flat_store_byte v[16:17], v0 offset:42
	v_pk_mov_b32 v[0:1], s[4:5], s[4:5] op_sel:[0,1]
	flat_load_ubyte v0, v[0:1] offset:41
	s_waitcnt vmcnt(0) lgkmcnt(0)
	flat_store_byte v[16:17], v0 offset:41
	v_pk_mov_b32 v[0:1], s[4:5], s[4:5] op_sel:[0,1]
	flat_load_ubyte v0, v[0:1] offset:40
	s_waitcnt vmcnt(0) lgkmcnt(0)
	flat_store_byte v[16:17], v0 offset:40
	v_pk_mov_b32 v[0:1], s[4:5], s[4:5] op_sel:[0,1]
	flat_load_ubyte v0, v[0:1] offset:39
	s_waitcnt vmcnt(0) lgkmcnt(0)
	flat_store_byte v[16:17], v0 offset:39
	v_pk_mov_b32 v[0:1], s[4:5], s[4:5] op_sel:[0,1]
	flat_load_ubyte v0, v[0:1] offset:38
	s_waitcnt vmcnt(0) lgkmcnt(0)
	flat_store_byte v[16:17], v0 offset:38
	v_pk_mov_b32 v[0:1], s[4:5], s[4:5] op_sel:[0,1]
	flat_load_ubyte v0, v[0:1] offset:37
	s_waitcnt vmcnt(0) lgkmcnt(0)
	flat_store_byte v[16:17], v0 offset:37
	v_pk_mov_b32 v[0:1], s[4:5], s[4:5] op_sel:[0,1]
	flat_load_ubyte v0, v[0:1] offset:36
	s_waitcnt vmcnt(0) lgkmcnt(0)
	flat_store_byte v[16:17], v0 offset:36
	v_pk_mov_b32 v[0:1], s[4:5], s[4:5] op_sel:[0,1]
	flat_load_ubyte v0, v[0:1] offset:35
	s_waitcnt vmcnt(0) lgkmcnt(0)
	flat_store_byte v[16:17], v0 offset:35
	v_pk_mov_b32 v[0:1], s[4:5], s[4:5] op_sel:[0,1]
	flat_load_ubyte v0, v[0:1] offset:34
	s_waitcnt vmcnt(0) lgkmcnt(0)
	flat_store_byte v[16:17], v0 offset:34
	v_pk_mov_b32 v[0:1], s[4:5], s[4:5] op_sel:[0,1]
	flat_load_ubyte v0, v[0:1] offset:33
	s_waitcnt vmcnt(0) lgkmcnt(0)
	flat_store_byte v[16:17], v0 offset:33
	v_pk_mov_b32 v[0:1], s[4:5], s[4:5] op_sel:[0,1]
	flat_load_ubyte v0, v[0:1] offset:32
	s_waitcnt vmcnt(0) lgkmcnt(0)
	flat_store_byte v[16:17], v0 offset:32
	v_pk_mov_b32 v[0:1], s[4:5], s[4:5] op_sel:[0,1]
	flat_load_ubyte v0, v[0:1] offset:31
	s_waitcnt vmcnt(0) lgkmcnt(0)
	flat_store_byte v[16:17], v0 offset:31
	v_pk_mov_b32 v[0:1], s[4:5], s[4:5] op_sel:[0,1]
	flat_load_ubyte v0, v[0:1] offset:30
	s_waitcnt vmcnt(0) lgkmcnt(0)
	flat_store_byte v[16:17], v0 offset:30
	v_pk_mov_b32 v[0:1], s[4:5], s[4:5] op_sel:[0,1]
	flat_load_ubyte v0, v[0:1] offset:29
	s_waitcnt vmcnt(0) lgkmcnt(0)
	flat_store_byte v[16:17], v0 offset:29
	v_pk_mov_b32 v[0:1], s[4:5], s[4:5] op_sel:[0,1]
	flat_load_ubyte v0, v[0:1] offset:28
	s_waitcnt vmcnt(0) lgkmcnt(0)
	flat_store_byte v[16:17], v0 offset:28
	v_pk_mov_b32 v[0:1], s[4:5], s[4:5] op_sel:[0,1]
	flat_load_ubyte v0, v[0:1] offset:27
	s_waitcnt vmcnt(0) lgkmcnt(0)
	flat_store_byte v[16:17], v0 offset:27
	v_pk_mov_b32 v[0:1], s[4:5], s[4:5] op_sel:[0,1]
	flat_load_ubyte v0, v[0:1] offset:26
	s_waitcnt vmcnt(0) lgkmcnt(0)
	flat_store_byte v[16:17], v0 offset:26
	v_pk_mov_b32 v[0:1], s[4:5], s[4:5] op_sel:[0,1]
	flat_load_ubyte v0, v[0:1] offset:25
	s_waitcnt vmcnt(0) lgkmcnt(0)
	flat_store_byte v[16:17], v0 offset:25
	v_pk_mov_b32 v[0:1], s[4:5], s[4:5] op_sel:[0,1]
	flat_load_ubyte v0, v[0:1] offset:24
	s_waitcnt vmcnt(0) lgkmcnt(0)
	flat_store_byte v[16:17], v0 offset:24
	v_pk_mov_b32 v[0:1], s[4:5], s[4:5] op_sel:[0,1]
	flat_load_ubyte v0, v[0:1] offset:23
	s_waitcnt vmcnt(0) lgkmcnt(0)
	flat_store_byte v[16:17], v0 offset:23
	v_pk_mov_b32 v[0:1], s[4:5], s[4:5] op_sel:[0,1]
	flat_load_ubyte v0, v[0:1] offset:22
	s_waitcnt vmcnt(0) lgkmcnt(0)
	flat_store_byte v[16:17], v0 offset:22
	v_pk_mov_b32 v[0:1], s[4:5], s[4:5] op_sel:[0,1]
	flat_load_ubyte v0, v[0:1] offset:21
	s_waitcnt vmcnt(0) lgkmcnt(0)
	flat_store_byte v[16:17], v0 offset:21
	v_pk_mov_b32 v[0:1], s[4:5], s[4:5] op_sel:[0,1]
	flat_load_ubyte v0, v[0:1] offset:20
	s_waitcnt vmcnt(0) lgkmcnt(0)
	flat_store_byte v[16:17], v0 offset:20
	v_pk_mov_b32 v[0:1], s[4:5], s[4:5] op_sel:[0,1]
	flat_load_ubyte v0, v[0:1] offset:19
	s_waitcnt vmcnt(0) lgkmcnt(0)
	flat_store_byte v[16:17], v0 offset:19
	v_pk_mov_b32 v[0:1], s[4:5], s[4:5] op_sel:[0,1]
	flat_load_ubyte v0, v[0:1] offset:18
	s_waitcnt vmcnt(0) lgkmcnt(0)
	flat_store_byte v[16:17], v0 offset:18
	v_pk_mov_b32 v[0:1], s[4:5], s[4:5] op_sel:[0,1]
	flat_load_ubyte v0, v[0:1] offset:17
	s_waitcnt vmcnt(0) lgkmcnt(0)
	flat_store_byte v[16:17], v0 offset:17
	v_pk_mov_b32 v[0:1], s[4:5], s[4:5] op_sel:[0,1]
	flat_load_ubyte v0, v[0:1] offset:16
	s_waitcnt vmcnt(0) lgkmcnt(0)
	flat_store_byte v[16:17], v0 offset:16
	v_pk_mov_b32 v[0:1], s[4:5], s[4:5] op_sel:[0,1]
	flat_load_ubyte v0, v[0:1] offset:15
	s_waitcnt vmcnt(0) lgkmcnt(0)
	flat_store_byte v[16:17], v0 offset:15
	v_pk_mov_b32 v[0:1], s[4:5], s[4:5] op_sel:[0,1]
	flat_load_ubyte v0, v[0:1] offset:14
	s_waitcnt vmcnt(0) lgkmcnt(0)
	flat_store_byte v[16:17], v0 offset:14
	v_pk_mov_b32 v[0:1], s[4:5], s[4:5] op_sel:[0,1]
	flat_load_ubyte v0, v[0:1] offset:13
	s_waitcnt vmcnt(0) lgkmcnt(0)
	flat_store_byte v[16:17], v0 offset:13
	v_pk_mov_b32 v[0:1], s[4:5], s[4:5] op_sel:[0,1]
	flat_load_ubyte v0, v[0:1] offset:12
	s_waitcnt vmcnt(0) lgkmcnt(0)
	flat_store_byte v[16:17], v0 offset:12
	v_pk_mov_b32 v[0:1], s[4:5], s[4:5] op_sel:[0,1]
	flat_load_ubyte v0, v[0:1] offset:11
	s_waitcnt vmcnt(0) lgkmcnt(0)
	flat_store_byte v[16:17], v0 offset:11
	v_pk_mov_b32 v[0:1], s[4:5], s[4:5] op_sel:[0,1]
	flat_load_ubyte v0, v[0:1] offset:10
	s_waitcnt vmcnt(0) lgkmcnt(0)
	flat_store_byte v[16:17], v0 offset:10
	v_pk_mov_b32 v[0:1], s[4:5], s[4:5] op_sel:[0,1]
	flat_load_ubyte v0, v[0:1] offset:9
	s_waitcnt vmcnt(0) lgkmcnt(0)
	flat_store_byte v[16:17], v0 offset:9
	v_pk_mov_b32 v[0:1], s[4:5], s[4:5] op_sel:[0,1]
	flat_load_ubyte v0, v[0:1] offset:8
	s_waitcnt vmcnt(0) lgkmcnt(0)
	flat_store_byte v[16:17], v0 offset:8
	v_pk_mov_b32 v[0:1], s[4:5], s[4:5] op_sel:[0,1]
	flat_load_ubyte v0, v[0:1] offset:7
	s_waitcnt vmcnt(0) lgkmcnt(0)
	flat_store_byte v[16:17], v0 offset:7
	v_pk_mov_b32 v[0:1], s[4:5], s[4:5] op_sel:[0,1]
	flat_load_ubyte v0, v[0:1] offset:6
	s_waitcnt vmcnt(0) lgkmcnt(0)
	flat_store_byte v[16:17], v0 offset:6
	v_pk_mov_b32 v[0:1], s[4:5], s[4:5] op_sel:[0,1]
	flat_load_ubyte v0, v[0:1] offset:5
	s_waitcnt vmcnt(0) lgkmcnt(0)
	flat_store_byte v[16:17], v0 offset:5
	v_pk_mov_b32 v[0:1], s[4:5], s[4:5] op_sel:[0,1]
	flat_load_ubyte v0, v[0:1] offset:4
	s_waitcnt vmcnt(0) lgkmcnt(0)
	flat_store_byte v[16:17], v0 offset:4
	v_pk_mov_b32 v[0:1], s[4:5], s[4:5] op_sel:[0,1]
	flat_load_ubyte v0, v[0:1] offset:3
	s_waitcnt vmcnt(0) lgkmcnt(0)
	flat_store_byte v[16:17], v0 offset:3
	v_pk_mov_b32 v[0:1], s[4:5], s[4:5] op_sel:[0,1]
	flat_load_ubyte v0, v[0:1] offset:2
	s_waitcnt vmcnt(0) lgkmcnt(0)
	flat_store_byte v[16:17], v0 offset:2
	v_pk_mov_b32 v[0:1], s[4:5], s[4:5] op_sel:[0,1]
	flat_load_ubyte v0, v[0:1] offset:1
	s_waitcnt vmcnt(0) lgkmcnt(0)
	flat_store_byte v[16:17], v0 offset:1
	v_pk_mov_b32 v[0:1], s[4:5], s[4:5] op_sel:[0,1]
	flat_load_ubyte v0, v[0:1]
	s_waitcnt vmcnt(0) lgkmcnt(0)
	flat_store_byte v[16:17], v0
	flat_load_dword v35, v[30:31]
	s_nop 0
	flat_load_dwordx2 v[0:1], v[16:17] offset:72
	s_waitcnt vmcnt(0) lgkmcnt(0)
	global_load_dwordx4 v[0:3], v[0:1], off
	s_mov_b32 s26, 0
	s_mov_b64 s[22:23], exec
	s_waitcnt vmcnt(0)
.LBB1_8:                                ;   Parent Loop BB1_3 Depth=1
                                        ;     Parent Loop BB1_6 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	v_readfirstlane_b32 s4, v0
	v_readfirstlane_b32 s5, v1
	v_cmp_eq_u64_e64 s[24:25], s[4:5], v[0:1]
	v_readfirstlane_b32 s6, v2
	v_readfirstlane_b32 s7, v3
	v_cmp_eq_u64_e64 s[28:29], s[6:7], v[2:3]
	s_and_b64 s[24:25], s[24:25], s[28:29]
	s_and_saveexec_b64 s[24:25], s[24:25]
; %bb.9:                                ;   in Loop: Header=BB1_8 Depth=3
	s_nop 1
	buffer_load_format_x v34, v35, s[4:7], s26 idxen
	s_xor_b64 exec, exec, s[24:25]
	s_cbranch_execnz .LBB1_8
; %bb.10:                               ;   in Loop: Header=BB1_6 Depth=2
	s_mov_b64 exec, s[22:23]
	flat_load_dword v0, v[26:27]
	flat_load_dword v1, v[20:21]
	s_waitcnt vmcnt(0) lgkmcnt(0)
	v_add_u32_e64 v0, v0, v1
	v_ashrrev_i32_e64 v1, 31, v0
	s_mov_b32 s4, 2
	v_lshlrev_b64 v[0:1], s4, v[0:1]
	s_getpc_b64 s[4:5]
	s_add_u32 s4, s4, c_clusters@gotpcrel32@lo+4
	s_addc_u32 s5, s5, c_clusters@gotpcrel32@hi+12
	s_load_dwordx2 s[4:5], s[4:5], 0x0
	s_waitcnt lgkmcnt(0)
	v_add_co_u32_e64 v0, s[6:7], s4, v0
	v_mov_b32_e32 v2, s5
	v_addc_co_u32_e64 v1, s[4:5], v2, v1, s[6:7]
	flat_load_dword v0, v[0:1]
	s_waitcnt vmcnt(0) lgkmcnt(0)
	v_sub_f32_e64 v0, v34, v0
	flat_store_dword v[32:33], v0
	flat_load_dword v0, v[32:33]
	s_nop 0
	flat_load_dword v1, v[28:29]
	s_waitcnt vmcnt(0) lgkmcnt(0)
	v_fmac_f32_e64 v1, v0, v0
	flat_store_dword v[28:29], v1
	s_branch .LBB1_12
.LBB1_11:                               ; %Flow
                                        ;   in Loop: Header=BB1_6 Depth=2
	s_or_b64 exec, exec, s[20:21]
	s_and_b64 s[4:5], exec, s[18:19]
	s_or_b64 s[16:17], s[4:5], s[16:17]
	s_andn2_b64 exec, exec, s[16:17]
	s_cbranch_execnz .LBB1_6
	s_branch .LBB1_13
.LBB1_12:                               ;   in Loop: Header=BB1_6 Depth=2
	flat_load_dword v0, v[20:21]
	s_mov_b32 s4, 1
	s_waitcnt vmcnt(0) lgkmcnt(0)
	v_add_u32_e64 v0, v0, s4
	flat_store_dword v[20:21], v0
	s_mov_b64 s[4:5], 0
	s_andn2_b64 s[18:19], s[18:19], exec
	s_branch .LBB1_11
.LBB1_13:                               ;   in Loop: Header=BB1_3 Depth=1
	s_or_b64 exec, exec, s[16:17]
	flat_load_dword v0, v[28:29]
	s_waitcnt vmcnt(0) lgkmcnt(0)
	flat_store_dword v[24:25], v0
	flat_load_dword v0, v[24:25]
	s_nop 0
	flat_load_dword v1, v[22:23]
	s_waitcnt vmcnt(0) lgkmcnt(0)
	v_cmp_lt_f32_e64 s[6:7], v0, v1
	s_mov_b64 s[4:5], exec
	s_and_b64 s[6:7], s[4:5], s[6:7]
	s_mov_b64 exec, s[6:7]
	s_cbranch_execz .LBB1_15
; %bb.14:                               ;   in Loop: Header=BB1_3 Depth=1
	flat_load_dword v0, v[24:25]
	s_waitcnt vmcnt(0) lgkmcnt(0)
	flat_store_dword v[22:23], v0
	flat_load_dword v0, v[18:19]
	s_waitcnt vmcnt(0) lgkmcnt(0)
	flat_store_dword v[14:15], v0
.LBB1_15:                               ;   in Loop: Header=BB1_3 Depth=1
	s_or_b64 exec, exec, s[4:5]
; %bb.16:                               ;   in Loop: Header=BB1_3 Depth=1
	flat_load_dword v0, v[18:19]
	s_mov_b32 s4, 1
	s_waitcnt vmcnt(0) lgkmcnt(0)
	v_add_u32_e64 v0, v0, s4
	flat_store_dword v[18:19], v0
	s_mov_b64 s[4:5], 0
	s_andn2_b64 s[12:13], s[12:13], exec
	s_branch .LBB1_5
.LBB1_17:
	flat_load_dword v0, v[12:13]
	flat_load_dword v1, v[6:7]
	s_waitcnt vmcnt(0) lgkmcnt(0)
	v_cmp_lt_u32_e64 s[6:7], v0, v1
	s_mov_b64 s[4:5], exec
	s_and_b64 s[6:7], s[4:5], s[6:7]
	s_mov_b64 exec, s[6:7]
	s_cbranch_execz .LBB1_19
; %bb.18:
	flat_load_dword v6, v[14:15]
	flat_load_dwordx2 v[0:1], v[4:5]
	flat_load_dword v2, v[12:13]
	s_mov_b32 s6, 0
	v_mov_b32_e32 v3, 0
	s_mov_b32 s6, 2
	s_waitcnt vmcnt(0) lgkmcnt(0)
	v_lshlrev_b64 v[2:3], s6, v[2:3]
	v_add_co_u32_e64 v0, s[6:7], v0, v2
	v_addc_co_u32_e64 v1, s[6:7], v1, v3, s[6:7]
	flat_store_dword v[0:1], v6
.LBB1_19:
	s_or_b64 exec, exec, s[4:5]
	s_endpgm
	.section	.rodata,#alloc
	.p2align	6, 0x0
	.amdhsa_kernel _Z11kmeansPointPfiiiPiS_S_S0_
		.amdhsa_group_segment_fixed_size 0
		.amdhsa_private_segment_fixed_size 208
		.amdhsa_kernarg_size 112
		.amdhsa_user_sgpr_count 14
		.amdhsa_user_sgpr_private_segment_buffer 1
		.amdhsa_user_sgpr_dispatch_ptr 1
		.amdhsa_user_sgpr_queue_ptr 1
		.amdhsa_user_sgpr_kernarg_segment_ptr 1
		.amdhsa_user_sgpr_dispatch_id 1
		.amdhsa_user_sgpr_flat_scratch_init 1
		.amdhsa_user_sgpr_private_segment_size 0
		.amdhsa_uses_dynamic_stack 0
		.amdhsa_system_sgpr_private_segment_wavefront_offset 1
		.amdhsa_system_sgpr_workgroup_id_x 1
		.amdhsa_system_sgpr_workgroup_id_y 1
		.amdhsa_system_sgpr_workgroup_id_z 1
		.amdhsa_system_sgpr_workgroup_info 0
		.amdhsa_system_vgpr_workitem_id 2
		.amdhsa_next_free_vgpr 36
		.amdhsa_next_free_sgpr 34
		.amdhsa_accum_offset 36
		.amdhsa_reserve_vcc 0
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
	.size	_Z11kmeansPointPfiiiPiS_S_S0_, .Lfunc_end1-_Z11kmeansPointPfiiiPiS_S_S0_
                                        ; -- End function
	.section	.AMDGPU.csdata
; Kernel info:
; codeLenInByte = 4664
; NumSgprs: 40
; NumVgprs: 36
; NumAgprs: 0
; TotalNumVgprs: 36
; ScratchSize: 208
; MemoryBound: 0
; FloatMode: 240
; IeeeMode: 1
; LDSByteSize: 0 bytes/workgroup (compile time only)
; SGPRBlocks: 4
; VGPRBlocks: 4
; NumSGPRsForWavesPerEU: 40
; NumVGPRsForWavesPerEU: 36
; AccumOffset: 36
; Occupancy: 8
; WaveLimiterHint : 1
; COMPUTE_PGM_RSRC2:SCRATCH_EN: 1
; COMPUTE_PGM_RSRC2:USER_SGPR: 14
; COMPUTE_PGM_RSRC2:TRAP_HANDLER: 0
; COMPUTE_PGM_RSRC2:TGID_X_EN: 1
; COMPUTE_PGM_RSRC2:TGID_Y_EN: 1
; COMPUTE_PGM_RSRC2:TGID_Z_EN: 1
; COMPUTE_PGM_RSRC2:TIDIG_COMP_CNT: 2
; COMPUTE_PGM_RSRC3_GFX90A:ACCUM_OFFSET: 8
; COMPUTE_PGM_RSRC3_GFX90A:TG_SPLIT: 0
	.text
	.p2alignl 6, 3212836864
	.fill 256, 4, 3212836864
	.type	c_clusters,@object              ; @c_clusters
	.section	.bss,#alloc,#write
	.globl	c_clusters
	.p2align	4, 0x0
c_clusters:
	.zero	4352
	.size	c_clusters, 4352

	.type	t_features,@object              ; @t_features
	.globl	t_features
	.p2align	4, 0x0
t_features:
	.zero	88
	.size	t_features, 88

	.type	t_features_flipped,@object      ; @t_features_flipped
	.globl	t_features_flipped
	.p2align	4, 0x0
t_features_flipped:
	.zero	88
	.size	t_features_flipped, 88

	.type	t_clusters,@object              ; @t_clusters
	.globl	t_clusters
	.p2align	4, 0x0
t_clusters:
	.zero	88
	.size	t_clusters, 88

	.ident	"clang version 16.0.0 (https://github.com/llvm/llvm-project.git 159fb378f779ac79f7d456ea233892ad526b56d8)"
	.ident	"clang version 3.8.0 (tags/RELEASE_380/final)"
	.section	".note.GNU-stack"
	.addrsig
	.addrsig_sym c_clusters
	.addrsig_sym t_features
	.addrsig_sym t_features_flipped
	.addrsig_sym t_clusters
	.amdgpu_metadata
---
amdhsa.kernels:
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
      - .offset:         16
        .size:           4
        .value_kind:     by_value
      - .offset:         20
        .size:           4
        .value_kind:     by_value
      - .offset:         24
        .size:           8
        .value_kind:     hidden_global_offset_x
      - .offset:         32
        .size:           8
        .value_kind:     hidden_global_offset_y
      - .offset:         40
        .size:           8
        .value_kind:     hidden_global_offset_z
      - .offset:         48
        .size:           8
        .value_kind:     hidden_hostcall_buffer
      - .offset:         56
        .size:           8
        .value_kind:     hidden_none
      - .offset:         64
        .size:           8
        .value_kind:     hidden_none
      - .offset:         72
        .size:           8
        .value_kind:     hidden_multigrid_sync_arg
    .group_segment_fixed_size: 0
    .kernarg_segment_align: 8
    .kernarg_segment_size: 80
    .language:       OpenCL C
    .language_version:
      - 2
      - 0
    .max_flat_workgroup_size: 1024
    .name:           _Z14invert_mappingPfS_ii
    .private_segment_fixed_size: 40
    .sgpr_count:     40
    .sgpr_spill_count: 0
    .symbol:         _Z14invert_mappingPfS_ii.kd
    .uses_dynamic_stack: false
    .vgpr_count:     20
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
      - .offset:         16
        .size:           4
        .value_kind:     by_value
      - .address_space:  global
        .offset:         24
        .size:           8
        .value_kind:     global_buffer
      - .address_space:  global
        .offset:         32
        .size:           8
        .value_kind:     global_buffer
      - .address_space:  global
        .offset:         40
        .size:           8
        .value_kind:     global_buffer
      - .address_space:  global
        .offset:         48
        .size:           8
        .value_kind:     global_buffer
      - .offset:         56
        .size:           8
        .value_kind:     hidden_global_offset_x
      - .offset:         64
        .size:           8
        .value_kind:     hidden_global_offset_y
      - .offset:         72
        .size:           8
        .value_kind:     hidden_global_offset_z
      - .offset:         80
        .size:           8
        .value_kind:     hidden_hostcall_buffer
      - .offset:         88
        .size:           8
        .value_kind:     hidden_none
      - .offset:         96
        .size:           8
        .value_kind:     hidden_none
      - .offset:         104
        .size:           8
        .value_kind:     hidden_multigrid_sync_arg
    .group_segment_fixed_size: 0
    .kernarg_segment_align: 8
    .kernarg_segment_size: 112
    .language:       OpenCL C
    .language_version:
      - 2
      - 0
    .max_flat_workgroup_size: 1024
    .name:           _Z11kmeansPointPfiiiPiS_S_S0_
    .private_segment_fixed_size: 208
    .sgpr_count:     40
    .sgpr_spill_count: 0
    .symbol:         _Z11kmeansPointPfiiiPiS_S_S0_.kd
    .uses_dynamic_stack: false
    .vgpr_count:     36
    .vgpr_spill_count: 0
    .wavefront_size: 64
amdhsa.target:   amdgcn-amd-amdhsa--gfx90a
amdhsa.version:
  - 1
  - 1
...

	.end_amdgpu_metadata

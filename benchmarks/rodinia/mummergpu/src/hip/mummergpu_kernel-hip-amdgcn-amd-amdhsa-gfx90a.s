	.text
	.amdgcn_target "amdgcn-amd-amdhsa--gfx90a"
	.protected	_Z15mummergpuKernelPvPcS0_PKiS2_ii ; -- Begin function _Z15mummergpuKernelPvPcS0_PKiS2_ii
	.globl	_Z15mummergpuKernelPvPcS0_PKiS2_ii
	.p2align	8
	.type	_Z15mummergpuKernelPvPcS0_PKiS2_ii,@function
_Z15mummergpuKernelPvPcS0_PKiS2_ii:     ; @_Z15mummergpuKernelPvPcS0_PKiS2_ii
; %bb.0:
	s_load_dword s0, s[4:5], 0x4
	s_load_dword s1, s[4:5], 0xc
	s_load_dwordx2 s[20:21], s[6:7], 0x28
	s_waitcnt lgkmcnt(0)
	s_and_b32 s0, s0, 0xffff
	s_mul_i32 s2, s8, s0
	s_sub_i32 s1, s1, s2
	s_min_u32 s0, s1, s0
	s_and_b32 s1, s8, 0xffffff
	s_mul_i32 s0, s0, s1
	v_add_u32_e32 v0, s0, v0
	v_cmp_gt_i32_e32 vcc, s20, v0
	s_and_saveexec_b64 s[0:1], vcc
	s_cbranch_execz .LBB0_58
; %bb.1:
	s_load_dwordx4 s[0:3], s[6:7], 0x20
	v_ashrrev_i32_e32 v1, 31, v0
	v_lshlrev_b64 v[2:3], 2, v[0:1]
	s_waitcnt lgkmcnt(0)
	v_mov_b32_e32 v4, s1
	v_add_co_u32_e32 v2, vcc, s0, v2
	v_addc_co_u32_e32 v3, vcc, v4, v3, vcc
	global_load_dword v2, v[2:3], off
	s_waitcnt vmcnt(0)
	v_cmp_le_i32_e32 vcc, s21, v2
	s_and_b64 exec, exec, vcc
	s_cbranch_execz .LBB0_58
; %bb.2:                                ; %.lr.ph216
	s_load_dwordx8 s[0:7], s[6:7], 0x0
	v_lshlrev_b64 v[4:5], 2, v[0:1]
	s_add_i32 s8, s21, 1
	v_mul_u32_u24_e32 v0, s8, v0
	s_mov_b32 s20, 0
	s_waitcnt lgkmcnt(0)
	v_mov_b32_e32 v1, s7
	v_add_co_u32_e32 v4, vcc, s6, v4
	v_addc_co_u32_e32 v5, vcc, v1, v5, vcc
	global_load_dword v4, v[4:5], off
	v_subrev_u32_e32 v1, s21, v2
	v_mov_b32_e32 v2, s3
	v_add_u32_e32 v28, 1, v1
	v_ashrrev_i32_e32 v1, 31, v0
	v_mov_b32_e32 v6, s1
	v_lshlrev_b64 v[0:1], 3, v[0:1]
	s_mov_b64 s[6:7], 0
	v_mov_b32_e32 v26, 0
	v_mov_b32_e32 v17, 0
	s_movk_i32 s33, 0x46
	s_movk_i32 s36, 0x53
	s_movk_i32 s37, 0x54
	s_movk_i32 s38, 0x47
	s_movk_i32 s39, 0x42
	s_movk_i32 s40, 0x43
	s_movk_i32 s41, 0x41
	s_movk_i32 s42, 0xff
	s_movk_i32 s43, 0xf00
	s_mov_b32 s44, 0x6050400
	v_mov_b32_e32 v27, 0x10000
	v_mov_b32_e32 v19, 0
	v_mov_b32_e32 v29, 0
	s_getpc_b64 s[22:23]
	s_add_u32 s22, s22, childrentex@rel32@lo+76
	s_addc_u32 s23, s23, childrentex@rel32@hi+84
                                        ; implicit-def: $vgpr32
	s_waitcnt vmcnt(0)
	v_ashrrev_i32_e32 v5, 31, v4
	v_add_co_u32_e32 v30, vcc, s2, v4
	v_addc_co_u32_e32 v31, vcc, v2, v5, vcc
	v_lshlrev_b64 v[2:3], 3, v[4:5]
	v_add_co_u32_e32 v2, vcc, s0, v2
	v_addc_co_u32_e32 v3, vcc, v6, v3, vcc
	v_sub_co_u32_e32 v20, vcc, v2, v0
	v_subb_co_u32_e32 v21, vcc, v3, v1, vcc
	v_mov_b32_e32 v0, 0
	s_branch .LBB0_5
.LBB0_3:                                ; %_Z10set_resultjP11_MatchCoordiiii.exit147
                                        ;   in Loop: Header=BB0_5 Depth=1
	s_or_b64 exec, exec, s[2:3]
	v_cvt_f32_u32_sdwa v33, v16 dst_sel:DWORD dst_unused:UNUSED_PAD src0_sel:WORD_0
	v_cvt_f32_u32_sdwa v34, v16 dst_sel:DWORD dst_unused:UNUSED_PAD src0_sel:WORD_1
	v_xad_u32 v29, v19, -1, v29
.LBB0_4:                                ; %Flow407
                                        ;   in Loop: Header=BB0_5 Depth=1
	s_or_b64 exec, exec, s[0:1]
	s_getpc_b64 s[0:1]
	s_add_u32 s0, s0, nodetex@rel32@lo+76
	s_addc_u32 s1, s1, nodetex@rel32@hi+84
	global_load_dwordx2 v[0:1], v17, s[0:1]
	s_waitcnt vmcnt(0)
	v_readfirstlane_b32 s0, v0
	v_readfirstlane_b32 s1, v1
	s_load_dword s2, s[0:1], 0x38
	s_load_dword s3, s[0:1], 0x8
	s_load_dword s24, s[0:1], 0x28
	s_load_dwordx4 s[16:19], s[0:1], 0x30
	s_load_dword s25, s[0:1], 0x30
	s_load_dwordx8 s[8:15], s[0:1], 0x0
	s_waitcnt lgkmcnt(0)
	s_bitcmp0_b32 s2, 20
	v_cvt_f32_u32_e32 v0, s24
	s_cselect_b64 vcc, -1, 0
	s_bitcmp0_b32 s25, 15
	s_cselect_b64 s[0:1], -1, 0
	s_bfe_u32 s2, s3, 0xe000e
	s_add_i32 s2, s2, 1
	v_cndmask_b32_e64 v0, 1.0, v0, s[0:1]
	v_cvt_f32_u32_e32 v1, s2
	v_rcp_f32_e32 v2, v0
	v_mul_f32_e32 v0, v0, v33
	v_floor_f32_e32 v0, v0
	v_cndmask_b32_e64 v1, 1.0, v1, s[0:1]
	v_mul_f32_e32 v0, v2, v0
	v_rcp_f32_e32 v2, v1
	v_mul_f32_e32 v1, v1, v34
	v_floor_f32_e32 v1, v1
	v_cndmask_b32_e32 v0, v33, v0, vcc
	v_mul_f32_e32 v1, v2, v1
	v_cndmask_b32_e32 v1, v34, v1, vcc
	image_sample v[0:1], v[0:1], s[8:15], s[16:19] dmask:0x3
	s_add_i32 s20, s20, 1
	v_cmp_eq_u32_e32 vcc, s20, v28
	s_or_b64 s[6:7], vcc, s[6:7]
	v_add_co_u32_e32 v20, vcc, 8, v20
	v_addc_co_u32_e32 v21, vcc, 0, v21, vcc
	s_waitcnt vmcnt(0)
	v_alignbit_b32 v0, v1, v0, 24
	v_lshrrev_b32_e32 v1, 8, v0
	v_bfe_u32 v2, v0, 8, 8
	v_lshrrev_b32_e32 v3, 12, v0
	v_and_b32_e32 v1, 0xf00, v1
	v_and_or_b32 v2, v3, s43, v2
	v_and_or_b32 v0, v0, s42, v1
	v_lshl_or_b32 v0, v2, 16, v0
	s_andn2_b64 exec, exec, s[6:7]
	s_cbranch_execz .LBB0_58
.LBB0_5:                                ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB0_9 Depth 2
                                        ;       Child Loop BB0_10 Depth 3
                                        ;         Child Loop BB0_11 Depth 4
                                        ;       Child Loop BB0_41 Depth 3
	v_cmp_eq_u32_e32 vcc, 0, v0
	v_cmp_gt_i32_e64 s[0:1], 1, v29
	s_or_b64 vcc, vcc, s[0:1]
	v_cndmask_b32_e64 v29, v29, 1, vcc
	v_cndmask_b32_e32 v18, v0, v27, vcc
	v_add_u32_e32 v0, s20, v29
	v_ashrrev_i32_e32 v1, 31, v0
	v_add_co_u32_e64 v0, s[0:1], v30, v0
	v_addc_co_u32_e64 v1, s[0:1], v31, v1, s[0:1]
	global_load_ubyte v36, v[0:1], off
	v_mov_b32_e32 v35, 0
	s_mov_b64 s[8:9], -1
                                        ; implicit-def: $vgpr33
                                        ; implicit-def: $vgpr34
	s_waitcnt vmcnt(0)
	v_cmp_ne_u16_e64 s[0:1], 0, v36
	s_and_saveexec_b64 s[2:3], s[0:1]
	s_cbranch_execz .LBB0_55
; %bb.6:                                ; %.lr.ph.preheader
                                        ;   in Loop: Header=BB0_5 Depth=1
	global_load_dwordx2 v[22:23], v17, s[22:23]
	v_mov_b32_e32 v35, 0
	v_cndmask_b32_e64 v19, v19, 0, vcc
	s_mov_b64 s[26:27], 0
                                        ; implicit-def: $sgpr24_sgpr25
	s_branch .LBB0_9
.LBB0_7:                                ; %Flow404
                                        ;   in Loop: Header=BB0_9 Depth=2
	s_or_b64 exec, exec, s[12:13]
	s_orn2_b64 s[12:13], s[8:9], exec
	s_orn2_b64 s[8:9], s[10:11], exec
.LBB0_8:                                ; %Flow403
                                        ;   in Loop: Header=BB0_9 Depth=2
	s_or_b64 exec, exec, s[0:1]
	s_xor_b64 s[0:1], s[12:13], -1
	s_and_b64 s[8:9], exec, s[8:9]
	s_or_b64 s[26:27], s[8:9], s[26:27]
	s_andn2_b64 s[8:9], s[24:25], exec
	s_and_b64 s[0:1], s[0:1], exec
	s_or_b64 s[24:25], s[8:9], s[0:1]
	s_andn2_b64 exec, exec, s[26:27]
	s_cbranch_execz .LBB0_52
.LBB0_9:                                ; %.lr.ph
                                        ;   Parent Loop BB0_5 Depth=1
                                        ; =>  This Loop Header: Depth=2
                                        ;       Child Loop BB0_10 Depth 3
                                        ;         Child Loop BB0_11 Depth 4
                                        ;       Child Loop BB0_41 Depth 3
	s_waitcnt vmcnt(0)
	global_load_dword v8, v[22:23], off offset:56
	global_load_dword v9, v[22:23], off offset:48
	global_load_dword v10, v[22:23], off offset:40
	global_load_dword v11, v[22:23], off offset:8
	global_load_dwordx4 v[4:7], v[22:23], off offset:16
	global_load_dwordx4 v[0:3], v[22:23], off
	global_load_dwordx4 v[12:15], v[22:23], off offset:48
	v_mov_b32_e32 v16, v18
	v_cvt_f32_u32_sdwa v33, v16 dst_sel:DWORD dst_unused:UNUSED_PAD src0_sel:WORD_0
	v_cvt_f32_u32_sdwa v34, v16 dst_sel:DWORD dst_unused:UNUSED_PAD src0_sel:WORD_1
	v_bfe_i32 v37, v36, 0, 8
	s_mov_b64 s[28:29], exec
	s_waitcnt vmcnt(6)
	v_and_b32_e32 v8, 0x100000, v8
	s_waitcnt vmcnt(5)
	v_and_b32_e32 v9, 0x8000, v9
	s_waitcnt vmcnt(4)
	v_cvt_f32_u32_e32 v10, v10
	s_waitcnt vmcnt(3)
	v_bfe_u32 v11, v11, 14, 14
	v_add_u32_e32 v11, 1, v11
	v_cvt_f32_u32_e32 v11, v11
	v_cmp_eq_u32_e32 vcc, 0, v9
	v_cndmask_b32_e32 v9, 1.0, v10, vcc
	v_rcp_f32_e32 v10, v9
	v_cndmask_b32_e32 v11, 1.0, v11, vcc
	v_rcp_f32_e32 v18, v11
	v_mul_f32_e32 v9, v9, v33
	v_mul_f32_e32 v11, v11, v34
	v_floor_f32_e32 v9, v9
	v_floor_f32_e32 v11, v11
	v_mul_f32_e32 v9, v10, v9
	v_cmp_eq_u32_e32 vcc, 0, v8
	v_mul_f32_e32 v8, v18, v11
	v_cndmask_b32_e32 v24, v33, v9, vcc
	v_cndmask_b32_e32 v25, v34, v8, vcc
	s_waitcnt vmcnt(0)
.LBB0_10:                               ;   Parent Loop BB0_5 Depth=1
                                        ;     Parent Loop BB0_9 Depth=2
                                        ; =>    This Loop Header: Depth=3
                                        ;         Child Loop BB0_11 Depth 4
	v_readfirstlane_b32 s16, v12
	v_readfirstlane_b32 s17, v13
	v_readfirstlane_b32 s18, v14
	v_readfirstlane_b32 s19, v15
	v_cmp_eq_u64_e32 vcc, s[16:17], v[12:13]
	v_cmp_eq_u64_e64 s[0:1], s[18:19], v[14:15]
	s_and_b64 s[0:1], vcc, s[0:1]
	s_and_saveexec_b64 s[30:31], s[0:1]
	s_mov_b64 s[34:35], exec
.LBB0_11:                               ;   Parent Loop BB0_5 Depth=1
                                        ;     Parent Loop BB0_9 Depth=2
                                        ;       Parent Loop BB0_10 Depth=3
                                        ; =>      This Inner Loop Header: Depth=4
	v_readfirstlane_b32 s8, v0
	v_readfirstlane_b32 s9, v1
	v_readfirstlane_b32 s10, v2
	v_readfirstlane_b32 s11, v3
	v_cmp_eq_u64_e32 vcc, s[8:9], v[0:1]
	v_cmp_eq_u64_e64 s[0:1], s[10:11], v[2:3]
	v_readfirstlane_b32 s12, v4
	v_readfirstlane_b32 s13, v5
	s_and_b64 s[0:1], vcc, s[0:1]
	v_cmp_eq_u64_e32 vcc, s[12:13], v[4:5]
	v_readfirstlane_b32 s14, v6
	v_readfirstlane_b32 s15, v7
	s_and_b64 s[0:1], s[0:1], vcc
	v_cmp_eq_u64_e32 vcc, s[14:15], v[6:7]
	s_and_b64 s[0:1], s[0:1], vcc
	s_and_saveexec_b64 s[0:1], s[0:1]
	s_nop 0
	image_sample v[8:11], v[24:25], s[8:15], s[16:19] dmask:0xf
	s_xor_b64 exec, exec, s[0:1]
	s_cbranch_execnz .LBB0_11
; %bb.12:                               ;   in Loop: Header=BB0_10 Depth=3
	s_mov_b64 exec, s[34:35]
	s_xor_b64 exec, exec, s[30:31]
	s_cbranch_execnz .LBB0_10
; %bb.13:                               ;   in Loop: Header=BB0_9 Depth=2
	s_mov_b64 exec, s[28:29]
	v_cmp_lt_i32_e32 vcc, s33, v37
                                        ; implicit-def: $vgpr0
	s_and_saveexec_b64 s[0:1], vcc
	s_xor_b64 s[0:1], exec, s[0:1]
	s_cbranch_execz .LBB0_23
; %bb.14:                               ; %NodeBlock381
                                        ;   in Loop: Header=BB0_9 Depth=2
	v_cmp_lt_i32_e32 vcc, s36, v37
                                        ; implicit-def: $vgpr0
	s_and_saveexec_b64 s[8:9], vcc
	s_xor_b64 s[8:9], exec, s[8:9]
	s_cbranch_execz .LBB0_18
; %bb.15:                               ; %LeafBlock379
                                        ;   in Loop: Header=BB0_9 Depth=2
	v_cmp_eq_u32_e32 vcc, s37, v37
	v_mov_b32_e32 v0, 0
	s_and_saveexec_b64 s[10:11], vcc
	s_cbranch_execz .LBB0_17
; %bb.16:                               ;   in Loop: Header=BB0_9 Depth=2
	s_waitcnt vmcnt(0)
	v_alignbit_b32 v0, v11, v10, 8
.LBB0_17:                               ; %Flow394
                                        ;   in Loop: Header=BB0_9 Depth=2
	s_or_b64 exec, exec, s[10:11]
                                        ; implicit-def: $vgpr37
                                        ; implicit-def: $vgpr10_vgpr11
.LBB0_18:                               ; %Flow396
                                        ;   in Loop: Header=BB0_9 Depth=2
	s_andn2_saveexec_b64 s[8:9], s[8:9]
	s_cbranch_execz .LBB0_22
; %bb.19:                               ; %LeafBlock377
                                        ;   in Loop: Header=BB0_9 Depth=2
	v_cmp_eq_u32_e32 vcc, s38, v37
	v_mov_b32_e32 v0, 0
	s_and_saveexec_b64 s[10:11], vcc
	s_cbranch_execz .LBB0_21
; %bb.20:                               ;   in Loop: Header=BB0_9 Depth=2
	s_waitcnt vmcnt(0)
	v_alignbit_b32 v0, v10, v9, 16
.LBB0_21:                               ; %Flow395
                                        ;   in Loop: Header=BB0_9 Depth=2
	s_or_b64 exec, exec, s[10:11]
.LBB0_22:                               ; %Flow397
                                        ;   in Loop: Header=BB0_9 Depth=2
	s_or_b64 exec, exec, s[8:9]
                                        ; implicit-def: $vgpr37
                                        ; implicit-def: $vgpr8_vgpr9
.LBB0_23:                               ; %Flow402
                                        ;   in Loop: Header=BB0_9 Depth=2
	s_andn2_saveexec_b64 s[0:1], s[0:1]
	s_cbranch_execz .LBB0_33
; %bb.24:                               ; %NodeBlock
                                        ;   in Loop: Header=BB0_9 Depth=2
	v_cmp_lt_i32_e32 vcc, s39, v37
                                        ; implicit-def: $vgpr0
	s_and_saveexec_b64 s[8:9], vcc
	s_xor_b64 s[8:9], exec, s[8:9]
	s_cbranch_execz .LBB0_28
; %bb.25:                               ; %LeafBlock375
                                        ;   in Loop: Header=BB0_9 Depth=2
	v_cmp_eq_u32_e32 vcc, s40, v37
	v_mov_b32_e32 v0, 0
	s_and_saveexec_b64 s[10:11], vcc
	s_cbranch_execz .LBB0_27
; %bb.26:                               ;   in Loop: Header=BB0_9 Depth=2
	s_waitcnt vmcnt(0)
	v_alignbit_b32 v0, v9, v8, 24
.LBB0_27:                               ; %Flow398
                                        ;   in Loop: Header=BB0_9 Depth=2
	s_or_b64 exec, exec, s[10:11]
                                        ; implicit-def: $vgpr37
                                        ; implicit-def: $vgpr8_vgpr9
.LBB0_28:                               ; %Flow400
                                        ;   in Loop: Header=BB0_9 Depth=2
	s_andn2_saveexec_b64 s[8:9], s[8:9]
	s_cbranch_execz .LBB0_32
; %bb.29:                               ; %LeafBlock
                                        ;   in Loop: Header=BB0_9 Depth=2
	v_cmp_eq_u32_e32 vcc, s41, v37
	v_mov_b32_e32 v0, 0
	s_and_saveexec_b64 s[10:11], vcc
	s_cbranch_execz .LBB0_31
; %bb.30:                               ;   in Loop: Header=BB0_9 Depth=2
	s_waitcnt vmcnt(0)
	v_mov_b32_e32 v0, v8
.LBB0_31:                               ; %Flow399
                                        ;   in Loop: Header=BB0_9 Depth=2
	s_or_b64 exec, exec, s[10:11]
.LBB0_32:                               ; %Flow401
                                        ;   in Loop: Header=BB0_9 Depth=2
	s_or_b64 exec, exec, s[8:9]
.LBB0_33:                               ;   in Loop: Header=BB0_9 Depth=2
	s_or_b64 exec, exec, s[0:1]
	v_lshrrev_b32_e32 v1, 8, v0
	v_and_b32_e32 v2, 0xff, v0
	v_and_or_b32 v2, v1, s43, v2
	v_bfe_u32 v1, v0, 8, 8
	v_lshrrev_b32_e32 v0, 12, v0
	v_and_or_b32 v0, v0, s43, v1
	v_lshl_or_b32 v18, v0, 16, v2
	v_cmp_ne_u32_e32 vcc, 0, v18
                                        ; implicit-def: $vgpr1
	s_and_saveexec_b64 s[0:1], vcc
	s_xor_b64 s[8:9], exec, s[0:1]
	s_cbranch_execz .LBB0_45
; %bb.34:                               ;   in Loop: Header=BB0_9 Depth=2
	s_getpc_b64 s[0:1]
	s_add_u32 s0, s0, nodetex@rel32@lo+76
	s_addc_u32 s1, s1, nodetex@rel32@hi+84
	global_load_dwordx2 v[4:5], v17, s[0:1]
	v_cvt_f32_u32_e32 v1, v2
	v_cvt_f32_u32_e32 v2, v0
                                        ; implicit-def: $vgpr35
	s_waitcnt vmcnt(0)
	v_readfirstlane_b32 s0, v4
	v_readfirstlane_b32 s1, v5
	s_load_dword s10, s[0:1], 0x38
	s_load_dword s11, s[0:1], 0x8
	s_load_dword s34, s[0:1], 0x28
	s_load_dwordx4 s[28:31], s[0:1], 0x30
	s_load_dword s35, s[0:1], 0x30
	s_load_dwordx8 s[12:19], s[0:1], 0x0
	s_waitcnt lgkmcnt(0)
	s_bitcmp0_b32 s10, 20
	v_cvt_f32_u32_e32 v0, s34
	s_cselect_b64 vcc, -1, 0
	s_bitcmp0_b32 s35, 15
	s_cselect_b64 s[0:1], -1, 0
	s_bfe_u32 s10, s11, 0xe000e
	s_add_i32 s10, s10, 1
	v_cndmask_b32_e64 v0, 1.0, v0, s[0:1]
	v_cvt_f32_u32_e32 v3, s10
	v_rcp_f32_e32 v4, v0
	v_mul_f32_e32 v0, v0, v1
	v_floor_f32_e32 v0, v0
	v_cndmask_b32_e64 v3, 1.0, v3, s[0:1]
	v_mul_f32_e32 v0, v4, v0
	v_rcp_f32_e32 v4, v3
	v_mul_f32_e32 v3, v3, v2
	v_cndmask_b32_e32 v0, v1, v0, vcc
	v_floor_f32_e32 v1, v3
	v_mul_f32_e32 v1, v4, v1
	v_cndmask_b32_e32 v1, v2, v1, vcc
	image_sample v[0:1], v[0:1], s[12:19], s[28:31] dmask:0x6
	v_cmp_ne_u32_e32 vcc, 0, v19
	s_waitcnt vmcnt(0)
	v_lshrrev_b32_e32 v2, 16, v0
	v_lshrrev_b32_e32 v0, 24, v0
	v_lshrrev_b32_e32 v4, 8, v1
	v_bfe_u32 v5, v1, 16, 8
	v_and_b32_e32 v3, 0xff, v1
	v_lshrrev_b32_e32 v1, 24, v1
	v_perm_b32 v0, v0, v2, s44
	v_perm_b32 v2, v5, v4, s44
	v_lshl_or_b32 v32, v3, 16, v0
	v_lshl_or_b32 v0, v1, 16, v2
                                        ; implicit-def: $vgpr1
	s_and_saveexec_b64 s[0:1], vcc
	s_xor_b64 s[0:1], exec, s[0:1]
; %bb.35:                               ;   in Loop: Header=BB0_9 Depth=2
	v_sub_u32_e32 v1, v0, v32
	v_add_u32_e32 v1, 1, v1
	v_sub_u32_e32 v2, v19, v1
	v_add_u32_e32 v3, 1, v0
	v_add_u32_e32 v4, v32, v19
	v_min_i32_e32 v35, v4, v3
	v_min_i32_e32 v1, v1, v19
	v_max_i32_e32 v19, 0, v2
; %bb.36:                               ; %Flow391
                                        ;   in Loop: Header=BB0_9 Depth=2
	s_andn2_saveexec_b64 s[0:1], s[0:1]
; %bb.37:                               ;   in Loop: Header=BB0_9 Depth=2
	v_add_u32_e32 v35, 1, v32
	v_mov_b32_e32 v1, 1
	v_mov_b32_e32 v19, 0
; %bb.38:                               ;   in Loop: Header=BB0_9 Depth=2
	s_or_b64 exec, exec, s[0:1]
	v_add_u32_e32 v29, v1, v29
	v_add_u32_e32 v1, s20, v29
	v_ashrrev_i32_e32 v3, 31, v1
	v_add_co_u32_e32 v2, vcc, v30, v1
	v_addc_co_u32_e32 v3, vcc, v31, v3, vcc
	global_load_ubyte v36, v[2:3], off
	s_mov_b64 s[0:1], 0
                                        ; implicit-def: $sgpr10_sgpr11
	s_branch .LBB0_41
.LBB0_39:                               ;   in Loop: Header=BB0_41 Depth=3
	s_or_b64 exec, exec, s[14:15]
	v_cmp_ne_u16_e32 vcc, v2, v3
	s_andn2_b64 s[10:11], s[10:11], exec
	s_and_b64 s[14:15], vcc, exec
	s_or_b64 s[10:11], s[10:11], s[14:15]
.LBB0_40:                               ; %Flow
                                        ;   in Loop: Header=BB0_41 Depth=3
	s_or_b64 exec, exec, s[12:13]
	s_and_b64 s[12:13], exec, s[10:11]
	s_or_b64 s[0:1], s[12:13], s[0:1]
	s_andn2_b64 exec, exec, s[0:1]
	s_cbranch_execz .LBB0_44
.LBB0_41:                               ;   Parent Loop BB0_5 Depth=1
                                        ;     Parent Loop BB0_9 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	v_cmp_le_u32_e32 vcc, v35, v0
	s_waitcnt vmcnt(0)
	v_cmp_ne_u16_sdwa s[12:13], v36, v26 src0_sel:BYTE_0 src1_sel:DWORD
	s_and_b64 s[14:15], vcc, s[12:13]
	v_mov_b32_e32 v1, 0
	s_or_b64 s[10:11], s[10:11], exec
	s_and_saveexec_b64 s[12:13], s[14:15]
	s_cbranch_execz .LBB0_40
; %bb.42:                               ;   in Loop: Header=BB0_41 Depth=3
	global_load_ubyte v2, v35, s[4:5]
	v_and_b32_e32 v3, 0xff, v36
	v_mov_b32_e32 v1, 27
	s_waitcnt vmcnt(0)
	v_cmp_eq_u16_e32 vcc, v2, v3
	s_and_saveexec_b64 s[14:15], vcc
	s_cbranch_execz .LBB0_39
; %bb.43:                               ;   in Loop: Header=BB0_41 Depth=3
	s_ashr_i32 s16, s20, 31
	v_ashrrev_i32_e32 v1, 31, v29
	v_mov_b32_e32 v4, s16
	v_add_co_u32_e32 v5, vcc, s20, v29
	v_addc_co_u32_e32 v1, vcc, v1, v4, vcc
	v_add_co_u32_e32 v4, vcc, v30, v5
	v_addc_co_u32_e32 v5, vcc, v31, v1, vcc
	global_load_ubyte v36, v[4:5], off offset:1
	v_add_u32_e32 v29, 1, v29
	v_add_u32_e32 v35, 1, v35
	v_mov_b32_e32 v1, 0
	s_branch .LBB0_39
.LBB0_44:                               ; %Flow390
                                        ;   in Loop: Header=BB0_9 Depth=2
	s_or_b64 exec, exec, s[0:1]
.LBB0_45:                               ; %Flow392
                                        ;   in Loop: Header=BB0_9 Depth=2
	s_andn2_saveexec_b64 s[0:1], s[8:9]
	s_cbranch_execz .LBB0_49
; %bb.46:                               ;   in Loop: Header=BB0_9 Depth=2
	v_cmp_lt_i32_e32 vcc, s21, v29
	s_and_saveexec_b64 s[8:9], vcc
	s_cbranch_execz .LBB0_48
; %bb.47:                               ;   in Loop: Header=BB0_9 Depth=2
	global_store_dwordx2 v[20:21], v[16:17], off
	global_load_dwordx2 v[22:23], v17, s[22:23]
.LBB0_48:                               ; %_Z10set_resultjP11_MatchCoordiiii.exit
                                        ;   in Loop: Header=BB0_9 Depth=2
	s_or_b64 exec, exec, s[8:9]
	v_add_u32_e32 v29, -1, v29
	v_mov_b32_e32 v1, 18
	v_mov_b32_e32 v19, 0
.LBB0_49:                               ; %Flow393
                                        ;   in Loop: Header=BB0_9 Depth=2
	s_or_b64 exec, exec, s[0:1]
	v_cmp_gt_i32_e32 vcc, 27, v1
	s_mov_b64 s[8:9], -1
	s_mov_b64 s[12:13], -1
	s_and_saveexec_b64 s[0:1], vcc
	s_xor_b64 s[0:1], exec, s[0:1]
	s_cbranch_execz .LBB0_8
; %bb.50:                               ; %LeafBlock385
                                        ;   in Loop: Header=BB0_9 Depth=2
	v_cmp_ne_u32_e32 vcc, 18, v1
	s_mov_b64 s[10:11], -1
	s_mov_b64 s[8:9], 0
	s_and_saveexec_b64 s[12:13], vcc
	s_cbranch_execz .LBB0_7
; %bb.51:                               ;   in Loop: Header=BB0_9 Depth=2
	s_waitcnt vmcnt(0)
	v_cmp_eq_u16_sdwa s[10:11], v36, v26 src0_sel:BYTE_0 src1_sel:DWORD
	s_mov_b64 s[8:9], exec
	s_orn2_b64 s[10:11], s[10:11], exec
	s_branch .LBB0_7
.LBB0_52:                               ; %loop.exit.guard
                                        ;   in Loop: Header=BB0_5 Depth=1
	s_or_b64 exec, exec, s[26:27]
	s_mov_b64 s[0:1], -1
	s_and_saveexec_b64 s[8:9], s[24:25]
	s_xor_b64 s[8:9], exec, s[8:9]
; %bb.53:                               ; %.loopexit.loopexit
                                        ;   in Loop: Header=BB0_5 Depth=1
	s_xor_b64 s[0:1], exec, -1
; %bb.54:                               ; %Flow406
                                        ;   in Loop: Header=BB0_5 Depth=1
	s_or_b64 exec, exec, s[8:9]
	s_orn2_b64 s[8:9], s[0:1], exec
.LBB0_55:                               ; %Flow405
                                        ;   in Loop: Header=BB0_5 Depth=1
	s_or_b64 exec, exec, s[2:3]
	s_and_saveexec_b64 s[0:1], s[8:9]
	s_cbranch_execz .LBB0_4
; %bb.56:                               ; %._crit_edge
                                        ;   in Loop: Header=BB0_5 Depth=1
	v_sub_u32_e32 v19, v35, v32
	v_cmp_lt_i32_e32 vcc, s21, v29
	s_and_saveexec_b64 s[2:3], vcc
	s_cbranch_execz .LBB0_3
; %bb.57:                               ;   in Loop: Header=BB0_5 Depth=1
	global_store_dwordx2 v[20:21], v[18:19], off
	s_branch .LBB0_3
.LBB0_58:                               ; %.loopexit176
	s_endpgm
	.section	.rodata,#alloc
	.p2align	6
	.amdhsa_kernel _Z15mummergpuKernelPvPcS0_PKiS2_ii
		.amdhsa_group_segment_fixed_size 0
		.amdhsa_private_segment_fixed_size 0
		.amdhsa_kernarg_size 48
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
		.amdhsa_next_free_vgpr 38
		.amdhsa_next_free_sgpr 45
		.amdhsa_accum_offset 40
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
	.size	_Z15mummergpuKernelPvPcS0_PKiS2_ii, .Lfunc_end0-_Z15mummergpuKernelPvPcS0_PKiS2_ii
                                        ; -- End function
	.section	.AMDGPU.csdata
; Kernel info:
; codeLenInByte = 2276
; NumSgprs: 47
; NumVgprs: 38
; NumAgprs: 0
; TotalNumVgprs: 38
; ScratchSize: 0
; MemoryBound: 0
; FloatMode: 240
; IeeeMode: 1
; LDSByteSize: 0 bytes/workgroup (compile time only)
; SGPRBlocks: 5
; VGPRBlocks: 4
; NumSGPRsForWavesPerEU: 47
; NumVGPRsForWavesPerEU: 38
; AccumOffset: 40
; Occupancy: 8
; WaveLimiterHint : 1
; COMPUTE_PGM_RSRC2:SCRATCH_EN: 0
; COMPUTE_PGM_RSRC2:USER_SGPR: 8
; COMPUTE_PGM_RSRC2:TRAP_HANDLER: 0
; COMPUTE_PGM_RSRC2:TGID_X_EN: 1
; COMPUTE_PGM_RSRC2:TGID_Y_EN: 0
; COMPUTE_PGM_RSRC2:TGID_Z_EN: 0
; COMPUTE_PGM_RSRC2:TIDIG_COMP_CNT: 0
; COMPUTE_PGM_RSRC3_GFX90A:ACCUM_OFFSET: 9
; COMPUTE_PGM_RSRC3_GFX90A:TG_SPLIT: 0
	.text
	.protected	_Z17mummergpuRCKernelP10MatchCoordPcPKiS3_ii ; -- Begin function _Z17mummergpuRCKernelP10MatchCoordPcPKiS3_ii
	.globl	_Z17mummergpuRCKernelP10MatchCoordPcPKiS3_ii
	.p2align	8
	.type	_Z17mummergpuRCKernelP10MatchCoordPcPKiS3_ii,@function
_Z17mummergpuRCKernelP10MatchCoordPcPKiS3_ii: ; @_Z17mummergpuRCKernelP10MatchCoordPcPKiS3_ii
; %bb.0:
	s_endpgm
	.section	.rodata,#alloc
	.p2align	6
	.amdhsa_kernel _Z17mummergpuRCKernelP10MatchCoordPcPKiS3_ii
		.amdhsa_group_segment_fixed_size 0
		.amdhsa_private_segment_fixed_size 0
		.amdhsa_kernarg_size 40
		.amdhsa_user_sgpr_count 6
		.amdhsa_user_sgpr_private_segment_buffer 1
		.amdhsa_user_sgpr_dispatch_ptr 0
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
		.amdhsa_next_free_vgpr 1
		.amdhsa_next_free_sgpr 1
		.amdhsa_accum_offset 4
		.amdhsa_reserve_vcc 0
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
	.size	_Z17mummergpuRCKernelP10MatchCoordPcPKiS3_ii, .Lfunc_end1-_Z17mummergpuRCKernelP10MatchCoordPcPKiS3_ii
                                        ; -- End function
	.section	.AMDGPU.csdata
; Kernel info:
; codeLenInByte = 4
; NumSgprs: 0
; NumVgprs: 0
; NumAgprs: 0
; TotalNumVgprs: 0
; ScratchSize: 0
; MemoryBound: 0
; FloatMode: 240
; IeeeMode: 1
; LDSByteSize: 0 bytes/workgroup (compile time only)
; SGPRBlocks: 0
; VGPRBlocks: 0
; NumSGPRsForWavesPerEU: 1
; NumVGPRsForWavesPerEU: 1
; AccumOffset: 4
; Occupancy: 8
; WaveLimiterHint : 0
; COMPUTE_PGM_RSRC2:SCRATCH_EN: 0
; COMPUTE_PGM_RSRC2:USER_SGPR: 6
; COMPUTE_PGM_RSRC2:TRAP_HANDLER: 0
; COMPUTE_PGM_RSRC2:TGID_X_EN: 1
; COMPUTE_PGM_RSRC2:TGID_Y_EN: 0
; COMPUTE_PGM_RSRC2:TGID_Z_EN: 0
; COMPUTE_PGM_RSRC2:TIDIG_COMP_CNT: 0
; COMPUTE_PGM_RSRC3_GFX90A:ACCUM_OFFSET: 0
; COMPUTE_PGM_RSRC3_GFX90A:TG_SPLIT: 0
	.text
	.protected	_Z11printKernelP9MatchInfoiP9AlignmentPcPKiS5_iiiii ; -- Begin function _Z11printKernelP9MatchInfoiP9AlignmentPcPKiS5_iiiii
	.globl	_Z11printKernelP9MatchInfoiP9AlignmentPcPKiS5_iiiii
	.p2align	8
	.type	_Z11printKernelP9MatchInfoiP9AlignmentPcPKiS5_iiiii,@function
_Z11printKernelP9MatchInfoiP9AlignmentPcPKiS5_iiiii: ; @_Z11printKernelP9MatchInfoiP9AlignmentPcPKiS5_iiiii
; %bb.0:
	s_load_dword s0, s[4:5], 0x4
	s_load_dword s1, s[4:5], 0xc
	s_load_dword s2, s[6:7], 0x8
	s_waitcnt lgkmcnt(0)
	s_and_b32 s0, s0, 0xffff
	s_mul_i32 s3, s8, s0
	s_sub_i32 s1, s1, s3
	s_min_u32 s0, s1, s0
	s_and_b32 s1, s8, 0xffffff
	s_mul_i32 s0, s0, s1
	v_add_u32_e32 v4, s0, v0
	v_cmp_gt_i32_e32 vcc, s2, v4
	s_and_saveexec_b64 s[0:1], vcc
	s_cbranch_execz .LBB2_84
; %bb.1:
	s_load_dwordx2 s[2:3], s[6:7], 0x0
	s_load_dwordx4 s[20:23], s[6:7], 0x10
	s_getpc_b64 s[34:35]
	s_add_u32 s34, s34, nodetex@rel32@lo+76
	s_addc_u32 s35, s35, nodetex@rel32@hi+84
	s_waitcnt lgkmcnt(0)
	v_mad_i64_i32 v[0:1], s[0:1], v4, 20, s[2:3]
	global_load_dwordx2 v[18:19], v[0:1], off offset:4
	global_load_ushort v5, v[0:1], off offset:18
	s_load_dwordx2 s[0:1], s[6:7], 0x20
	s_load_dwordx4 s[24:27], s[6:7], 0x30
	v_mov_b32_e32 v1, 0
	v_mov_b32_e32 v11, s23
	s_waitcnt lgkmcnt(0)
	v_mov_b32_e32 v2, s1
	s_waitcnt vmcnt(1)
	v_mov_b32_e32 v0, v18
	v_lshlrev_b64 v[0:1], 2, v[0:1]
	v_add_co_u32_e32 v0, vcc, s0, v0
	v_addc_co_u32_e32 v1, vcc, v2, v1, vcc
	global_load_dword v10, v[0:1], off
	s_load_dwordx2 s[0:1], s[34:35], 0x0
	s_waitcnt lgkmcnt(0)
	s_load_dword s4, s[0:1], 0x38
	s_load_dword s5, s[0:1], 0x8
	s_load_dword s23, s[0:1], 0x28
	s_load_dwordx8 s[8:15], s[0:1], 0x0
	s_load_dwordx4 s[16:19], s[0:1], 0x30
	s_load_dword s28, s[0:1], 0x30
	s_waitcnt lgkmcnt(0)
	s_bitcmp0_b32 s4, 20
	v_cvt_f32_u32_e32 v6, s23
	s_cselect_b64 vcc, -1, 0
	v_cvt_f32_u32_sdwa v9, v19 dst_sel:DWORD dst_unused:UNUSED_PAD src0_sel:WORD_0
	s_bitcmp0_b32 s28, 15
	s_cselect_b64 s[0:1], -1, 0
	s_bfe_u32 s4, s5, 0xe000e
	v_cndmask_b32_e64 v0, 1.0, v6, s[0:1]
	s_add_i32 s4, s4, 1
	v_rcp_f32_e32 v1, v0
	v_cvt_f32_u32_e32 v7, s4
	v_mul_f32_e32 v0, v0, v9
	v_cvt_f32_u32_sdwa v8, v19 dst_sel:DWORD dst_unused:UNUSED_PAD src0_sel:WORD_1
	v_floor_f32_e32 v0, v0
	v_mul_f32_e32 v0, v1, v0
	v_cndmask_b32_e64 v1, 1.0, v7, s[0:1]
	v_rcp_f32_e32 v2, v1
	v_mul_f32_e32 v1, v1, v8
	v_floor_f32_e32 v1, v1
	v_cndmask_b32_e32 v0, v9, v0, vcc
	v_mul_f32_e32 v1, v2, v1
	v_cndmask_b32_e32 v1, v8, v1, vcc
	image_sample v[0:3], v[0:1], s[8:15], s[16:19] dmask:0xf
	s_waitcnt vmcnt(2)
	v_and_b32_e32 v12, 0xffff, v5
	s_waitcnt vmcnt(0)
	v_ashrrev_i32_e32 v1, 31, v10
	v_add_co_u32_e64 v18, s[0:1], s22, v10
	v_addc_co_u32_e64 v38, s[0:1], v11, v1, s[0:1]
	v_add_co_u32_e64 v10, s[0:1], v18, v12
	v_addc_co_u32_e64 v11, s[0:1], 0, v38, s[0:1]
	global_load_ubyte v39, v[10:11], off
	s_load_dword s22, s[6:7], 0x40
	s_mov_b32 s0, 0x6050400
                                        ; implicit-def: $sgpr6
	v_bfe_u32 v1, v3, 8, 8
	v_perm_b32 v1, v1, v3, s0
	v_bfe_u32 v2, v3, 16, 8
	v_lshl_or_b32 v1, v2, 16, v1
	s_waitcnt lgkmcnt(0)
	v_cmp_ge_i32_e64 s[0:1], s22, v1
	s_and_saveexec_b64 s[4:5], s[0:1]
	s_xor_b64 s[0:1], exec, s[4:5]
; %bb.2:                                ; %.._crit_edge_crit_edge
	s_and_b32 s6, s16, 0x8000
                                        ; implicit-def: $vgpr0_vgpr1_vgpr2_vgpr3
; %bb.3:                                ; %Flow684
	s_or_saveexec_b64 s[4:5], s[0:1]
	v_mov_b32_e32 v1, s6
	v_mov_b32_e32 v43, v19
	v_mov_b32_e32 v40, v19
	s_xor_b64 exec, exec, s[4:5]
	s_cbranch_execz .LBB2_7
; %bb.4:                                ; %.lr.ph
	s_and_b32 s23, s16, 0x8000
	s_cmp_eq_u32 s23, 0
	s_cselect_b64 s[0:1], -1, 0
	v_cndmask_b32_e64 v2, 1.0, v6, s[0:1]
	v_cndmask_b32_e64 v8, 1.0, v7, s[0:1]
	v_rcp_f32_e32 v3, v2
	v_rcp_f32_e32 v9, v8
	s_mov_b64 s[6:7], 0
	s_movk_i32 s28, 0xf00
	s_mov_b32 s29, 0x6050400
	v_mov_b32_e32 v40, v19
.LBB2_5:                                ; =>This Inner Loop Header: Depth=1
	v_lshrrev_b32_e32 v1, 8, v0
	v_and_b32_e32 v10, 0xff, v0
	v_bfe_u32 v11, v0, 8, 8
	v_lshrrev_b32_e32 v0, 12, v0
	v_and_or_b32 v10, v1, s28, v10
	v_and_or_b32 v11, v0, s28, v11
	v_cvt_f32_u32_e32 v0, v10
	v_cvt_f32_u32_e32 v1, v11
	v_mov_b32_e32 v43, v40
	v_lshl_or_b32 v40, v11, 16, v10
	v_mul_f32_e32 v12, v2, v0
	v_mul_f32_e32 v13, v8, v1
	v_floor_f32_e32 v12, v12
	v_floor_f32_e32 v13, v13
	v_mul_f32_e32 v12, v3, v12
	v_mul_f32_e32 v13, v9, v13
	v_cndmask_b32_e32 v0, v0, v12, vcc
	v_cndmask_b32_e32 v1, v1, v13, vcc
	image_sample v[0:1], v[0:1], s[8:15], s[16:19] dmask:0x9
	s_waitcnt vmcnt(0)
	v_bfe_u32 v12, v1, 8, 8
	v_bfe_u32 v13, v1, 16, 8
	v_perm_b32 v1, v12, v1, s29
	v_lshl_or_b32 v1, v13, 16, v1
	v_cmp_ge_i32_e64 s[0:1], s22, v1
	s_or_b64 s[6:7], s[0:1], s[6:7]
	s_andn2_b64 exec, exec, s[6:7]
	s_cbranch_execnz .LBB2_5
; %bb.6:                                ; %._crit_edge.loopexit
	s_or_b64 exec, exec, s[6:7]
	v_cvt_f32_u32_sdwa v9, v43 dst_sel:DWORD dst_unused:UNUSED_PAD src0_sel:WORD_0
	v_cvt_f32_u32_sdwa v8, v43 dst_sel:DWORD dst_unused:UNUSED_PAD src0_sel:WORD_1
	v_mov_b32_e32 v1, s23
.LBB2_7:                                ; %Flow685
	s_or_b64 exec, exec, s[4:5]
	v_cmp_eq_u32_e64 s[0:1], 0, v1
	v_cndmask_b32_e64 v1, 1.0, v6, s[0:1]
	v_rcp_f32_e32 v0, v1
	v_mul_f32_e32 v2, v1, v9
	v_floor_f32_e32 v2, v2
	v_cndmask_b32_e64 v3, 1.0, v7, s[0:1]
	v_mul_f32_e32 v6, v0, v2
	v_rcp_f32_e32 v2, v3
	v_mul_f32_e32 v7, v3, v8
	v_floor_f32_e32 v7, v7
	v_cndmask_b32_e32 v6, v9, v6, vcc
	v_mul_f32_e32 v7, v2, v7
	v_cndmask_b32_e32 v7, v8, v7, vcc
	image_sample v8, v[6:7], s[8:15], s[16:19] dmask:0x8
	v_mad_i64_i32 v[6:7], s[0:1], v4, 20, s[2:3]
	global_load_dword v20, v[6:7], off
	s_mov_b32 s4, 0x6050400
	v_cmp_eq_u32_e64 s[0:1], v43, v19
	v_mov_b32_e32 v47, 0
	s_waitcnt vmcnt(1)
	v_bfe_u32 v6, v8, 8, 8
	v_bfe_u32 v7, v8, 16, 8
	v_perm_b32 v6, v6, v8, s4
	v_lshl_or_b32 v6, v7, 16, v6
	v_add_u32_e32 v46, -1, v6
	s_and_saveexec_b64 s[4:5], s[0:1]
	s_cbranch_execz .LBB2_11
; %bb.8:
	v_mad_i64_i32 v[6:7], s[0:1], v4, 20, s[2:3]
	global_load_ushort v6, v[6:7], off offset:16
	s_waitcnt vmcnt(0)
	v_cmp_ne_u16_e64 s[0:1], 0, v6
	s_and_saveexec_b64 s[6:7], s[0:1]
	s_cbranch_execz .LBB2_10
; %bb.9:
	v_cvt_f32_u32_sdwa v7, v40 dst_sel:DWORD dst_unused:UNUSED_PAD src0_sel:WORD_0
	v_cvt_f32_u32_sdwa v8, v40 dst_sel:DWORD dst_unused:UNUSED_PAD src0_sel:WORD_1
	s_mov_b32 s0, 0x6050400
	v_mul_f32_e32 v1, v1, v7
	v_mul_f32_e32 v3, v3, v8
	v_floor_f32_e32 v1, v1
	v_floor_f32_e32 v3, v3
	v_mul_f32_e32 v0, v0, v1
	v_mul_f32_e32 v1, v2, v3
	v_cndmask_b32_e32 v0, v7, v0, vcc
	v_cndmask_b32_e32 v1, v8, v1, vcc
	image_sample v0, v[0:1], s[8:15], s[16:19] dmask:0x8
	v_and_b32_e32 v1, 0xffff, v6
	s_waitcnt vmcnt(0)
	v_bfe_u32 v2, v0, 8, 8
	v_perm_b32 v2, v2, v0, s0
	v_bfe_u32 v0, v0, 16, 8
	v_lshl_or_b32 v0, v0, 16, v2
	v_add3_u32 v46, v1, v0, -1
.LBB2_10:                               ; %Flow681
	s_or_b64 exec, exec, s[6:7]
	v_mov_b32_e32 v47, 1
.LBB2_11:
	s_or_b64 exec, exec, s[4:5]
	v_cmp_ne_u32_e32 vcc, v43, v40
	s_and_b64 exec, exec, vcc
	s_cbranch_execz .LBB2_84
; %bb.12:                               ; %.lr.ph500
	s_cmp_eq_u32 s26, -1
	v_mov_b32_e32 v0, 1
	s_cselect_b64 s[22:23], -1, 0
	s_cmp_eq_u32 s27, -1
	v_add_u32_sdwa v41, v5, v0 dst_sel:DWORD dst_unused:UNUSED_PAD src0_sel:WORD_0 src1_sel:DWORD
	v_mad_i64_i32 v[0:1], s[0:1], v4, 20, s[2:3]
	s_cselect_b64 s[40:41], -1, 0
	s_getpc_b64 s[42:43]
	s_add_u32 s42, s42, childrentex@rel32@lo+76
	s_addc_u32 s43, s43, childrentex@rel32@hi+84
	s_load_dwordx2 s[0:1], s[42:43], 0x0
	v_add_co_u32_e32 v22, vcc, 16, v0
	v_addc_co_u32_e32 v23, vcc, 0, v1, vcc
	s_mov_b64 s[46:47], 0
	s_mov_b64 s[44:45], 0
	s_waitcnt lgkmcnt(0)
	v_pk_mov_b32 v[24:25], s[0:1], s[0:1] op_sel:[0,1]
	v_mov_b32_e32 v48, 0x41
	v_mov_b32_e32 v42, 0
	s_movk_i32 s27, 0xff
	s_movk_i32 s33, 0x41
	s_movk_i32 s56, 0x43
	s_movk_i32 s57, 0x47
	s_movk_i32 s58, 0x54
	s_movk_i32 s59, 0xf00
	s_mov_b32 s60, 0x6050400
	v_mov_b32_e32 v44, 36
	v_mov_b32_e32 v45, 0x54
                                        ; implicit-def: $vgpr26_vgpr27
                                        ; implicit-def: $vgpr28_vgpr29
                                        ; implicit-def: $vgpr30_vgpr31
	s_branch .LBB2_15
.LBB2_13:                               ; %Flow671
                                        ;   in Loop: Header=BB2_15 Depth=1
	s_or_b64 exec, exec, s[12:13]
	s_andn2_b64 s[0:1], s[46:47], exec
	s_and_b64 s[2:3], s[2:3], exec
	v_lshl_or_b32 v43, v34, 16, v33
	s_or_b64 s[46:47], s[0:1], s[2:3]
	v_pk_mov_b32 v[36:37], v[30:31], v[30:31] op_sel:[0,1]
	v_pk_mov_b32 v[34:35], v[28:29], v[28:29] op_sel:[0,1]
	v_pk_mov_b32 v[32:33], v[26:27], v[26:27] op_sel:[0,1]
.LBB2_14:                               ; %Flow678
                                        ;   in Loop: Header=BB2_15 Depth=1
	s_or_b64 exec, exec, s[48:49]
	v_cmp_eq_u32_e32 vcc, v43, v40
	s_or_b64 s[44:45], vcc, s[44:45]
	v_pk_mov_b32 v[26:27], v[32:33], v[32:33] op_sel:[0,1]
	v_pk_mov_b32 v[28:29], v[34:35], v[34:35] op_sel:[0,1]
	v_pk_mov_b32 v[30:31], v[36:37], v[36:37] op_sel:[0,1]
	v_mov_b32_e32 v48, v9
	s_andn2_b64 exec, exec, s[44:45]
	s_cbranch_execz .LBB2_84
.LBB2_15:                               ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB2_16 Depth 2
                                        ;       Child Loop BB2_17 Depth 3
                                        ;     Child Loop BB2_21 Depth 2
                                        ;       Child Loop BB2_22 Depth 3
                                        ;     Child Loop BB2_66 Depth 2
                                        ;       Child Loop BB2_67 Depth 3
	global_load_dword v8, v[24:25], off offset:56
	global_load_dword v9, v[24:25], off offset:48
	s_waitcnt vmcnt(2)
	global_load_dword v10, v[24:25], off offset:40
	global_load_dword v11, v[24:25], off offset:8
	global_load_dwordx4 v[4:7], v[24:25], off offset:16
	global_load_dwordx4 v[0:3], v[24:25], off
	global_load_dwordx4 v[14:17], v[24:25], off offset:48
	v_cvt_f32_u32_sdwa v50, v43 dst_sel:DWORD dst_unused:UNUSED_PAD src0_sel:WORD_0
	v_cvt_f32_u32_sdwa v49, v43 dst_sel:DWORD dst_unused:UNUSED_PAD src0_sel:WORD_1
	s_mov_b64 s[16:17], exec
	s_waitcnt vmcnt(6)
	v_and_b32_e32 v8, 0x100000, v8
	s_waitcnt vmcnt(5)
	v_and_b32_e32 v9, 0x8000, v9
	s_waitcnt vmcnt(4)
	v_cvt_f32_u32_e32 v51, v10
	s_waitcnt vmcnt(3)
	v_bfe_u32 v10, v11, 14, 14
	v_add_u32_e32 v10, 1, v10
	v_cvt_f32_u32_e32 v21, v10
	v_cmp_eq_u32_e32 vcc, 0, v9
	v_cndmask_b32_e32 v9, 1.0, v51, vcc
	v_rcp_f32_e32 v10, v9
	v_cndmask_b32_e32 v11, 1.0, v21, vcc
	v_rcp_f32_e32 v13, v11
	v_mul_f32_e32 v9, v9, v50
	v_mul_f32_e32 v11, v11, v49
	v_floor_f32_e32 v9, v9
	v_floor_f32_e32 v11, v11
	v_mul_f32_e32 v9, v10, v9
	v_cmp_eq_u32_e64 s[0:1], 0, v8
	v_mul_f32_e32 v8, v13, v11
	v_cndmask_b32_e64 v12, v50, v9, s[0:1]
	v_cndmask_b32_e64 v13, v49, v8, s[0:1]
	s_waitcnt vmcnt(0)
.LBB2_16:                               ;   Parent Loop BB2_15 Depth=1
                                        ; =>  This Loop Header: Depth=2
                                        ;       Child Loop BB2_17 Depth 3
	v_readfirstlane_b32 s12, v14
	v_readfirstlane_b32 s13, v15
	v_readfirstlane_b32 s14, v16
	v_readfirstlane_b32 s15, v17
	v_cmp_eq_u64_e32 vcc, s[12:13], v[14:15]
	v_cmp_eq_u64_e64 s[2:3], s[14:15], v[16:17]
	s_and_b64 s[2:3], vcc, s[2:3]
	s_and_saveexec_b64 s[18:19], s[2:3]
	s_mov_b64 s[28:29], exec
.LBB2_17:                               ;   Parent Loop BB2_15 Depth=1
                                        ;     Parent Loop BB2_16 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	v_readfirstlane_b32 s4, v0
	v_readfirstlane_b32 s5, v1
	v_readfirstlane_b32 s6, v2
	v_readfirstlane_b32 s7, v3
	v_cmp_eq_u64_e32 vcc, s[4:5], v[0:1]
	v_cmp_eq_u64_e64 s[2:3], s[6:7], v[2:3]
	v_readfirstlane_b32 s8, v4
	v_readfirstlane_b32 s9, v5
	s_and_b64 s[2:3], vcc, s[2:3]
	v_cmp_eq_u64_e32 vcc, s[8:9], v[4:5]
	v_readfirstlane_b32 s10, v6
	v_readfirstlane_b32 s11, v7
	s_and_b64 s[2:3], s[2:3], vcc
	v_cmp_eq_u64_e32 vcc, s[10:11], v[6:7]
	s_and_b64 s[2:3], s[2:3], vcc
	s_and_saveexec_b64 s[2:3], s[2:3]
	s_nop 0
	image_sample v[8:11], v[12:13], s[4:11], s[12:15] dmask:0xf
	s_xor_b64 exec, exec, s[2:3]
	s_cbranch_execnz .LBB2_17
; %bb.18:                               ;   in Loop: Header=BB2_16 Depth=2
	s_mov_b64 exec, s[28:29]
	s_xor_b64 exec, exec, s[18:19]
	s_cbranch_execnz .LBB2_16
; %bb.19:                               ;   in Loop: Header=BB2_15 Depth=1
	s_mov_b64 exec, s[16:17]
	s_waitcnt vmcnt(0)
	v_lshrrev_b32_e32 v10, 24, v11
	v_cmp_eq_u16_e32 vcc, 0, v10
	s_xor_b64 s[2:3], s[46:47], -1
	s_and_b64 s[2:3], vcc, s[2:3]
                                        ; implicit-def: $sgpr46_sgpr47
                                        ; implicit-def: $vgpr9
                                        ; implicit-def: $vgpr36_vgpr37
                                        ; implicit-def: $vgpr34_vgpr35
                                        ; implicit-def: $vgpr32_vgpr33
	s_and_saveexec_b64 s[4:5], s[2:3]
	s_xor_b64 s[16:17], exec, s[4:5]
	s_cbranch_execz .LBB2_58
; %bb.20:                               ;   in Loop: Header=BB2_15 Depth=1
	v_and_b32_e32 v9, 0x8000, v14
	v_cmp_eq_u32_e64 s[2:3], 0, v9
	v_cndmask_b32_e64 v9, 1.0, v51, s[2:3]
	v_rcp_f32_e32 v10, v9
	v_mul_f32_e32 v9, v9, v50
	v_floor_f32_e32 v9, v9
	s_mov_b64 s[18:19], exec
	v_mul_f32_e32 v9, v10, v9
	v_cndmask_b32_e64 v10, 1.0, v21, s[2:3]
	v_rcp_f32_e32 v11, v10
	v_cndmask_b32_e64 v32, v50, v9, s[0:1]
	v_mul_f32_e32 v9, v10, v49
	v_floor_f32_e32 v9, v9
	v_mul_f32_e32 v9, v11, v9
	v_cndmask_b32_e64 v33, v49, v9, s[0:1]
.LBB2_21:                               ;   Parent Loop BB2_15 Depth=1
                                        ; =>  This Loop Header: Depth=2
                                        ;       Child Loop BB2_22 Depth 3
	v_readfirstlane_b32 s12, v14
	v_readfirstlane_b32 s13, v15
	v_readfirstlane_b32 s14, v16
	v_readfirstlane_b32 s15, v17
	v_cmp_eq_u64_e64 s[0:1], s[12:13], v[14:15]
	v_cmp_eq_u64_e64 s[2:3], s[14:15], v[16:17]
	s_and_b64 s[0:1], s[0:1], s[2:3]
	s_and_saveexec_b64 s[28:29], s[0:1]
	s_mov_b64 s[30:31], exec
.LBB2_22:                               ;   Parent Loop BB2_15 Depth=1
                                        ;     Parent Loop BB2_21 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	v_readfirstlane_b32 s4, v0
	v_readfirstlane_b32 s5, v1
	v_readfirstlane_b32 s6, v2
	v_readfirstlane_b32 s7, v3
	v_cmp_eq_u64_e64 s[0:1], s[4:5], v[0:1]
	v_cmp_eq_u64_e64 s[2:3], s[6:7], v[2:3]
	v_readfirstlane_b32 s8, v4
	v_readfirstlane_b32 s9, v5
	s_and_b64 s[2:3], s[0:1], s[2:3]
	v_cmp_eq_u64_e64 s[0:1], s[8:9], v[4:5]
	v_readfirstlane_b32 s10, v6
	v_readfirstlane_b32 s11, v7
	s_and_b64 s[2:3], s[2:3], s[0:1]
	v_cmp_eq_u64_e64 s[0:1], s[10:11], v[6:7]
	s_and_b64 s[0:1], s[2:3], s[0:1]
	s_and_saveexec_b64 s[0:1], s[0:1]
	s_nop 0
	image_sample v[10:13], v[32:33], s[4:11], s[12:15] dmask:0xf
	s_xor_b64 exec, exec, s[0:1]
	s_cbranch_execnz .LBB2_22
; %bb.23:                               ;   in Loop: Header=BB2_21 Depth=2
	s_mov_b64 exec, s[30:31]
	s_xor_b64 exec, exec, s[28:29]
	s_cbranch_execnz .LBB2_21
; %bb.24:                               ;   in Loop: Header=BB2_15 Depth=1
	s_mov_b64 exec, s[18:19]
	v_cmp_ne_u32_e64 s[0:1], 0, v47
	v_cmp_eq_u32_e64 s[2:3], 0, v47
	v_mov_b32_e32 v0, 0
	s_and_saveexec_b64 s[4:5], s[2:3]
	s_cbranch_execz .LBB2_26
; %bb.25:                               ;   in Loop: Header=BB2_15 Depth=1
	v_add_u32_e32 v0, v41, v46
	v_add_co_u32_e64 v0, s[2:3], v18, v0
	v_addc_co_u32_e64 v1, s[2:3], 0, v38, s[2:3]
	global_load_ubyte v0, v[0:1], off
.LBB2_26:                               ;   in Loop: Header=BB2_15 Depth=1
	s_or_b64 exec, exec, s[4:5]
	v_and_b32_e32 v1, 0xff, v48
	v_cmp_ne_u16_e64 s[6:7], s33, v1
	v_cmp_eq_u16_e64 s[2:3], s33, v1
	s_mov_b64 s[4:5], 0
	s_and_saveexec_b64 s[8:9], s[2:3]
	s_cbranch_execz .LBB2_28
; %bb.27:                               ;   in Loop: Header=BB2_15 Depth=1
	s_waitcnt vmcnt(0)
	v_lshrrev_b32_e32 v1, 8, v10
	v_or_b32_e32 v1, v10, v1
	v_or_b32_sdwa v1, v1, v10 dst_sel:DWORD dst_unused:UNUSED_PAD src0_sel:DWORD src1_sel:WORD_1
	v_cmp_eq_u16_sdwa s[2:3], v1, v42 src0_sel:BYTE_0 src1_sel:DWORD
	s_andn2_b64 s[6:7], s[6:7], exec
	s_and_b64 s[2:3], s[2:3], exec
	s_mov_b64 s[4:5], exec
	v_mov_b32_e32 v48, 0x43
	s_or_b64 s[6:7], s[6:7], s[2:3]
.LBB2_28:                               ; %Flow669
                                        ;   in Loop: Header=BB2_15 Depth=1
	s_or_b64 exec, exec, s[8:9]
                                        ; implicit-def: $sgpr2_sgpr3
                                        ; implicit-def: $vgpr36_vgpr37
                                        ; implicit-def: $vgpr34_vgpr35
                                        ; implicit-def: $vgpr32_vgpr33
	s_and_saveexec_b64 s[8:9], s[6:7]
	s_xor_b64 s[6:7], exec, s[8:9]
	s_cbranch_execz .LBB2_43
; %bb.29:                               ;   in Loop: Header=BB2_15 Depth=1
	v_and_b32_e32 v1, 0xff, v48
	v_cmp_ne_u16_e64 s[10:11], s56, v1
	v_cmp_eq_u16_e64 s[2:3], s56, v1
	s_mov_b64 s[8:9], 0
	v_pk_mov_b32 v[32:33], v[26:27], v[26:27] op_sel:[0,1]
	s_and_saveexec_b64 s[12:13], s[2:3]
	s_cbranch_execz .LBB2_31
; %bb.30:                               ;   in Loop: Header=BB2_15 Depth=1
	s_waitcnt vmcnt(0)
	v_lshrrev_b64 v[32:33], 24, v[10:11]
	v_lshrrev_b32_e32 v1, 8, v11
	v_or_b32_e32 v2, v32, v11
	v_or_b32_e32 v1, v2, v1
	v_cmp_eq_u16_sdwa s[2:3], v1, v42 src0_sel:BYTE_0 src1_sel:DWORD
	s_andn2_b64 s[10:11], s[10:11], exec
	s_and_b64 s[2:3], s[2:3], exec
	s_mov_b64 s[8:9], exec
	v_mov_b32_e32 v48, 0x47
	s_or_b64 s[10:11], s[10:11], s[2:3]
.LBB2_31:                               ; %Flow665
                                        ;   in Loop: Header=BB2_15 Depth=1
	s_or_b64 exec, exec, s[12:13]
                                        ; implicit-def: $sgpr2_sgpr3
                                        ; implicit-def: $vgpr36_vgpr37
                                        ; implicit-def: $vgpr34_vgpr35
	s_and_saveexec_b64 s[12:13], s[10:11]
	s_xor_b64 s[10:11], exec, s[12:13]
	s_cbranch_execz .LBB2_75
; %bb.32:                               ;   in Loop: Header=BB2_15 Depth=1
	v_and_b32_e32 v1, 0xff, v48
	v_cmp_ne_u16_e64 s[14:15], s57, v1
	v_cmp_eq_u16_e64 s[2:3], s57, v1
	s_mov_b64 s[12:13], 0
	v_pk_mov_b32 v[34:35], v[28:29], v[28:29] op_sel:[0,1]
	s_and_saveexec_b64 s[18:19], s[2:3]
	s_cbranch_execz .LBB2_34
; %bb.33:                               ;   in Loop: Header=BB2_15 Depth=1
	s_waitcnt vmcnt(0)
	v_lshlrev_b64 v[2:3], 16, v[12:13]
	v_lshrrev_b32_e32 v1, 16, v11
	v_or_b32_e32 v34, v1, v2
	v_or_b32_sdwa v1, v1, v11 dst_sel:DWORD dst_unused:UNUSED_PAD src0_sel:DWORD src1_sel:BYTE_3
	v_or_b32_e32 v1, v1, v12
	v_cmp_eq_u16_sdwa s[2:3], v1, v42 src0_sel:BYTE_0 src1_sel:DWORD
	s_andn2_b64 s[14:15], s[14:15], exec
	s_and_b64 s[2:3], s[2:3], exec
	s_mov_b64 s[12:13], exec
	v_mov_b32_e32 v48, 0x54
	s_or_b64 s[14:15], s[14:15], s[2:3]
.LBB2_34:                               ; %Flow661
                                        ;   in Loop: Header=BB2_15 Depth=1
	s_or_b64 exec, exec, s[18:19]
                                        ; implicit-def: $sgpr2_sgpr3
                                        ; implicit-def: $vgpr36_vgpr37
	s_and_saveexec_b64 s[18:19], s[14:15]
	s_xor_b64 s[14:15], exec, s[18:19]
	s_cbranch_execz .LBB2_78
; %bb.35:                               ;   in Loop: Header=BB2_15 Depth=1
	v_and_b32_e32 v1, 0xff, v48
	v_cmp_ne_u16_e64 s[30:31], s58, v1
	v_cmp_eq_u16_e64 s[2:3], s58, v1
	s_mov_b64 s[18:19], 0
	v_pk_mov_b32 v[36:37], v[30:31], v[30:31] op_sel:[0,1]
	s_and_saveexec_b64 s[28:29], s[2:3]
	s_cbranch_execz .LBB2_37
; %bb.36:                               ;   in Loop: Header=BB2_15 Depth=1
	s_waitcnt vmcnt(0)
	v_lshrrev_b32_e32 v1, 8, v12
	v_lshrrev_b64 v[2:3], 24, v[12:13]
	v_or_b32_sdwa v1, v1, v12 dst_sel:DWORD dst_unused:UNUSED_PAD src0_sel:DWORD src1_sel:WORD_1
	v_or_b32_e32 v1, v1, v2
	v_cmp_eq_u16_sdwa s[2:3], v1, v42 src0_sel:BYTE_0 src1_sel:DWORD
	s_andn2_b64 s[30:31], s[30:31], exec
	s_and_b64 s[2:3], s[2:3], exec
	s_mov_b64 s[18:19], exec
	v_lshrrev_b64 v[36:37], 8, v[12:13]
	v_mov_b32_e32 v48, 36
	s_or_b64 s[30:31], s[30:31], s[2:3]
.LBB2_37:                               ; %Flow657
                                        ;   in Loop: Header=BB2_15 Depth=1
	s_or_b64 exec, exec, s[28:29]
                                        ; implicit-def: $sgpr28_sgpr29
	s_and_saveexec_b64 s[2:3], s[30:31]
	s_xor_b64 s[2:3], exec, s[2:3]
	s_cbranch_execz .LBB2_81
; %bb.38:                               ;   in Loop: Header=BB2_15 Depth=1
	v_cmp_eq_u16_sdwa s[36:37], v48, v44 src0_sel:BYTE_0 src1_sel:DWORD
	s_mov_b64 s[30:31], -1
	s_and_saveexec_b64 s[28:29], s[36:37]
	s_cbranch_execz .LBB2_42
; %bb.39:                               ;   in Loop: Header=BB2_15 Depth=1
	s_waitcnt vmcnt(0)
	v_lshrrev_b32_e32 v1, 8, v13
	v_or_b32_e32 v1, v13, v1
	v_or_b32_sdwa v1, v1, v13 dst_sel:DWORD dst_unused:UNUSED_PAD src0_sel:DWORD src1_sel:WORD_1
	v_cmp_ne_u16_sdwa s[38:39], v1, v42 src0_sel:BYTE_0 src1_sel:DWORD
	s_mov_b64 s[36:37], -1
	s_and_saveexec_b64 s[30:31], s[38:39]
; %bb.40:                               ;   in Loop: Header=BB2_15 Depth=1
	v_mov_b32_e32 v2, v13
	v_lshrrev_b32_e32 v1, 8, v2
	v_and_b32_e32 v1, 0xf00, v1
	v_and_or_b32 v1, v2, s27, v1
	v_bfe_u32 v3, v2, 8, 8
	v_lshrrev_b32_e32 v2, 12, v2
	v_and_or_b32 v2, v2, s59, v3
	v_lshl_or_b32 v43, v2, 16, v1
	s_xor_b64 s[36:37], exec, -1
; %bb.41:                               ; %Flow654
                                        ;   in Loop: Header=BB2_15 Depth=1
	s_or_b64 exec, exec, s[30:31]
	v_mov_b32_e32 v48, 36
	s_orn2_b64 s[30:31], s[36:37], exec
.LBB2_42:                               ; %Flow655
                                        ;   in Loop: Header=BB2_15 Depth=1
	s_or_b64 exec, exec, s[28:29]
	s_and_b64 s[28:29], s[30:31], exec
	s_andn2_b64 s[18:19], s[18:19], exec
	s_or_b64 exec, exec, s[2:3]
	s_and_saveexec_b64 s[2:3], s[18:19]
	s_cbranch_execnz .LBB2_82
	s_branch .LBB2_83
.LBB2_43:                               ; %Flow670
                                        ;   in Loop: Header=BB2_15 Depth=1
	s_or_b64 exec, exec, s[6:7]
	s_and_saveexec_b64 s[6:7], s[4:5]
	s_cbranch_execz .LBB2_45
.LBB2_44:                               ;   in Loop: Header=BB2_15 Depth=1
	s_waitcnt vmcnt(0)
	v_lshrrev_b32_e32 v1, 8, v10
	v_and_b32_e32 v1, 0xf00, v1
	v_bfe_u32 v2, v10, 8, 8
	v_lshrrev_b32_e32 v3, 12, v10
	v_and_or_b32 v1, v10, s27, v1
	v_and_or_b32 v2, v3, s59, v2
	v_lshl_or_b32 v43, v2, 16, v1
	v_mov_b32_e32 v48, 0x41
	s_andn2_b64 s[2:3], s[2:3], exec
	v_pk_mov_b32 v[32:33], v[26:27], v[26:27] op_sel:[0,1]
	v_pk_mov_b32 v[34:35], v[28:29], v[28:29] op_sel:[0,1]
	v_pk_mov_b32 v[36:37], v[30:31], v[30:31] op_sel:[0,1]
.LBB2_45:                               ;   in Loop: Header=BB2_15 Depth=1
	s_or_b64 exec, exec, s[6:7]
	s_mov_b64 s[4:5], -1
	s_xor_b64 s[2:3], s[2:3], -1
	s_and_saveexec_b64 s[18:19], s[2:3]
	s_cbranch_execz .LBB2_57
; %bb.46:                               ;   in Loop: Header=BB2_15 Depth=1
	s_and_saveexec_b64 s[2:3], s[0:1]
	s_xor_b64 s[0:1], exec, s[2:3]
; %bb.47:                               ;   in Loop: Header=BB2_15 Depth=1
	v_add_u32_e32 v47, 1, v47
                                        ; implicit-def: $vgpr48
                                        ; implicit-def: $vgpr0
; %bb.48:                               ; %Flow651
                                        ;   in Loop: Header=BB2_15 Depth=1
	s_andn2_saveexec_b64 s[28:29], s[0:1]
	s_cbranch_execz .LBB2_56
; %bb.49:                               ;   in Loop: Header=BB2_15 Depth=1
	s_waitcnt vmcnt(0)
	v_cmp_eq_u32_sdwa s[0:1], v48, sext(v0) src0_sel:BYTE_0 src1_sel:BYTE_0
	v_mov_b32_e32 v47, 1
	s_and_saveexec_b64 s[30:31], s[0:1]
	s_cbranch_execz .LBB2_55
; %bb.50:                               ;   in Loop: Header=BB2_15 Depth=1
	global_load_dwordx2 v[0:1], v42, s[34:35]
	v_cvt_f32_u32_sdwa v2, v43 dst_sel:DWORD dst_unused:UNUSED_PAD src0_sel:WORD_0
	v_cvt_f32_u32_sdwa v3, v43 dst_sel:DWORD dst_unused:UNUSED_PAD src0_sel:WORD_1
	v_mov_b32_e32 v47, 0
	s_waitcnt vmcnt(0)
	v_readfirstlane_b32 s0, v0
	v_readfirstlane_b32 s1, v1
	s_load_dword s2, s[0:1], 0x38
	s_load_dword s36, s[0:1], 0x8
	s_load_dword s3, s[0:1], 0x28
	s_load_dwordx4 s[12:15], s[0:1], 0x30
	s_load_dword s37, s[0:1], 0x30
	s_load_dwordx8 s[4:11], s[0:1], 0x0
	s_waitcnt lgkmcnt(0)
	s_bitcmp0_b32 s2, 20
	v_cvt_f32_u32_e32 v4, s3
	s_cselect_b64 s[0:1], -1, 0
	s_bitcmp0_b32 s37, 15
	s_cselect_b64 s[2:3], -1, 0
	s_bfe_u32 s36, s36, 0xe000e
	s_add_i32 s36, s36, 1
	v_cndmask_b32_e64 v0, 1.0, v4, s[2:3]
	v_cvt_f32_u32_e32 v5, s36
	v_rcp_f32_e32 v1, v0
	v_mul_f32_e32 v0, v0, v2
	v_floor_f32_e32 v0, v0
	v_cndmask_b32_e64 v6, 1.0, v5, s[2:3]
	v_mul_f32_e32 v0, v1, v0
	v_rcp_f32_e32 v1, v6
	v_mul_f32_e32 v6, v6, v3
	v_cndmask_b32_e64 v0, v2, v0, s[0:1]
	v_floor_f32_e32 v2, v6
	v_mul_f32_e32 v1, v1, v2
	v_cndmask_b32_e64 v1, v3, v1, s[0:1]
	image_sample v[0:3], v[0:1], s[4:11], s[12:15] dmask:0xf
	v_cmp_eq_u32_e64 s[2:3], v43, v19
	s_waitcnt vmcnt(0)
	v_bfe_u32 v1, v3, 8, 8
	v_bfe_u32 v2, v3, 16, 8
	v_perm_b32 v1, v1, v3, s60
	v_lshl_or_b32 v1, v2, 16, v1
	v_add_u32_e32 v46, -1, v1
	s_and_saveexec_b64 s[36:37], s[2:3]
	s_cbranch_execz .LBB2_54
; %bb.51:                               ;   in Loop: Header=BB2_15 Depth=1
	global_load_ushort v1, v[22:23], off
	s_waitcnt vmcnt(0)
	v_cmp_ne_u16_e64 s[2:3], 0, v1
	s_and_saveexec_b64 s[38:39], s[2:3]
	s_cbranch_execz .LBB2_53
; %bb.52:                               ;   in Loop: Header=BB2_15 Depth=1
	v_lshrrev_b32_e32 v2, 8, v0
	v_and_b32_e32 v3, 0xff, v0
	v_and_or_b32 v2, v2, s59, v3
	s_bitcmp0_b32 s12, 15
	v_bfe_u32 v3, v0, 8, 8
	v_lshrrev_b32_e32 v0, 12, v0
	v_cvt_f32_u32_e32 v2, v2
	s_cselect_b64 s[2:3], -1, 0
	v_and_or_b32 v0, v0, s59, v3
	v_cndmask_b32_e64 v3, 1.0, v4, s[2:3]
	v_rcp_f32_e32 v4, v3
	v_mul_f32_e32 v3, v3, v2
	v_cvt_f32_u32_e32 v0, v0
	v_floor_f32_e32 v3, v3
	v_mul_f32_e32 v3, v4, v3
	v_cndmask_b32_e64 v4, 1.0, v5, s[2:3]
	v_rcp_f32_e32 v5, v4
	v_cndmask_b32_e64 v2, v2, v3, s[0:1]
	v_mul_f32_e32 v3, v4, v0
	v_floor_f32_e32 v3, v3
	v_mul_f32_e32 v3, v5, v3
	v_cndmask_b32_e64 v3, v0, v3, s[0:1]
	image_sample v0, v[2:3], s[4:11], s[12:15] dmask:0x8
	v_and_b32_e32 v1, 0xffff, v1
	s_waitcnt vmcnt(0)
	v_bfe_u32 v2, v0, 8, 8
	v_perm_b32 v2, v2, v0, s60
	v_bfe_u32 v0, v0, 16, 8
	v_lshl_or_b32 v0, v0, 16, v2
	v_add3_u32 v46, v1, v0, -1
.LBB2_53:                               ; %Flow
                                        ;   in Loop: Header=BB2_15 Depth=1
	s_or_b64 exec, exec, s[38:39]
	v_mov_b32_e32 v47, 1
	v_mov_b32_e32 v43, v19
.LBB2_54:                               ; %Flow649
                                        ;   in Loop: Header=BB2_15 Depth=1
	s_or_b64 exec, exec, s[36:37]
.LBB2_55:                               ; %Flow650
                                        ;   in Loop: Header=BB2_15 Depth=1
	s_or_b64 exec, exec, s[30:31]
.LBB2_56:                               ; %Flow652
                                        ;   in Loop: Header=BB2_15 Depth=1
	s_or_b64 exec, exec, s[28:29]
	v_mov_b32_e32 v48, 0x41
	s_xor_b64 s[4:5], exec, -1
.LBB2_57:                               ; %Flow653
                                        ;   in Loop: Header=BB2_15 Depth=1
	s_or_b64 exec, exec, s[18:19]
	s_and_b64 s[46:47], s[4:5], exec
	v_mov_b32_e32 v9, v48
                                        ; implicit-def: $vgpr26_vgpr27
                                        ; implicit-def: $vgpr28_vgpr29
                                        ; implicit-def: $vgpr30_vgpr31
                                        ; implicit-def: $vgpr48
                                        ; implicit-def: $vgpr50
                                        ; implicit-def: $vgpr49
                                        ; implicit-def: $vgpr10
.LBB2_58:                               ; %Flow677
                                        ;   in Loop: Header=BB2_15 Depth=1
	s_andn2_saveexec_b64 s[48:49], s[16:17]
	s_cbranch_execz .LBB2_14
; %bb.59:                               ;   in Loop: Header=BB2_15 Depth=1
	s_waitcnt vmcnt(0)
	v_cmp_ne_u16_sdwa s[0:1], v10, v39 src0_sel:DWORD src1_sel:BYTE_0
	s_xor_b64 s[2:3], vcc, -1
	s_and_b64 s[0:1], s[2:3], s[0:1]
	s_and_saveexec_b64 s[2:3], s[0:1]
	s_cbranch_execz .LBB2_65
; %bb.60:                               ;   in Loop: Header=BB2_15 Depth=1
	v_lshrrev_b32_e32 v0, 8, v8
	v_and_b32_e32 v0, 0xff, v0
	v_perm_b32 v0, v0, v8, s60
	v_and_b32_sdwa v1, v8, s27 dst_sel:DWORD dst_unused:UNUSED_PAD src0_sel:WORD_1 src1_sel:DWORD
	v_lshl_or_b32 v1, v1, 16, v0
	v_add_u32_e32 v3, -1, v1
	v_add_u32_e32 v0, s24, v3
	v_add_u32_e32 v2, v0, v46
	v_cmp_ne_u32_e32 vcc, 0, v3
	s_or_b64 s[0:1], s[22:23], vcc
	v_cmp_ne_u32_e32 vcc, s25, v2
	s_or_b64 s[4:5], s[40:41], vcc
	s_and_b64 s[0:1], s[0:1], s[4:5]
	s_and_saveexec_b64 s[4:5], s[0:1]
	s_cbranch_execz .LBB2_64
; %bb.61:                               ;   in Loop: Header=BB2_15 Depth=1
	v_cmp_gt_u32_e32 vcc, 2, v1
	v_cmp_le_i32_e64 s[0:1], s26, v2
	s_or_b64 s[6:7], vcc, s[0:1]
	s_and_saveexec_b64 s[0:1], s[6:7]
	s_cbranch_execz .LBB2_63
; %bb.62:                               ;   in Loop: Header=BB2_15 Depth=1
	v_ashrrev_i32_e32 v21, 31, v20
	v_lshlrev_b64 v[2:3], 3, v[20:21]
	v_mov_b32_e32 v1, s21
	v_add_co_u32_e32 v2, vcc, s20, v2
	v_addc_co_u32_e32 v3, vcc, v1, v3, vcc
	global_store_dword v[2:3], v0, off
	global_store_short v[2:3], v46, off offset:4
	global_load_dwordx2 v[24:25], v42, s[42:43]
	v_add_u32_e32 v20, 1, v20
.LBB2_63:                               ; %Flow675
                                        ;   in Loop: Header=BB2_15 Depth=1
	s_or_b64 exec, exec, s[0:1]
.LBB2_64:                               ; %Flow676
                                        ;   in Loop: Header=BB2_15 Depth=1
	s_or_b64 exec, exec, s[4:5]
.LBB2_65:                               ;   in Loop: Header=BB2_15 Depth=1
	s_or_b64 exec, exec, s[2:3]
	global_load_dwordx2 v[0:1], v42, s[34:35]
	s_waitcnt vmcnt(1)
	global_load_dword v14, v[24:25], off offset:56
	global_load_dword v15, v[24:25], off offset:48
	global_load_dword v16, v[24:25], off offset:40
	global_load_dword v17, v[24:25], off offset:8
	s_mov_b64 s[50:51], exec
	s_waitcnt vmcnt(4)
	v_readfirstlane_b32 s0, v0
	v_readfirstlane_b32 s1, v1
	s_load_dword s2, s[0:1], 0x38
	s_load_dword s3, s[0:1], 0x8
	s_load_dword s12, s[0:1], 0x28
	s_load_dwordx4 s[28:31], s[0:1], 0x30
	s_load_dword s13, s[0:1], 0x30
	s_load_dwordx8 s[4:11], s[0:1], 0x0
	s_waitcnt lgkmcnt(0)
	s_bitcmp0_b32 s2, 20
	v_cvt_f32_u32_e32 v32, s12
	s_cselect_b64 vcc, -1, 0
	s_bitcmp0_b32 s13, 15
	s_cselect_b64 s[0:1], -1, 0
	s_bfe_u32 s2, s3, 0xe000e
	s_add_i32 s2, s2, 1
	v_cndmask_b32_e64 v0, 1.0, v32, s[0:1]
	v_cvt_f32_u32_e32 v21, s2
	v_rcp_f32_e32 v1, v0
	v_mul_f32_e32 v0, v0, v50
	v_floor_f32_e32 v0, v0
	v_cndmask_b32_e64 v2, 1.0, v21, s[0:1]
	v_mul_f32_e32 v0, v1, v0
	v_rcp_f32_e32 v1, v2
	v_mul_f32_e32 v2, v2, v49
	v_cndmask_b32_e32 v12, v50, v0, vcc
	v_floor_f32_e32 v0, v2
	v_mul_f32_e32 v0, v1, v0
	v_cndmask_b32_e32 v13, v49, v0, vcc
	image_sample v33, v[12:13], s[4:11], s[28:31] dmask:0x1
	global_load_dwordx4 v[4:7], v[24:25], off offset:16
	global_load_dwordx4 v[0:3], v[24:25], off
	global_load_dwordx4 v[8:11], v[24:25], off offset:48
                                        ; kill: killed $vgpr12 killed $vgpr13
	s_waitcnt vmcnt(6)
	v_and_b32_e32 v13, 0x8000, v15
	s_waitcnt vmcnt(4)
	v_bfe_u32 v15, v17, 14, 14
	v_add_u32_e32 v15, 1, v15
	v_and_b32_e32 v12, 0x100000, v14
	v_cvt_f32_u32_e32 v14, v16
	v_cvt_f32_u32_e32 v15, v15
	v_cmp_eq_u32_e64 s[0:1], 0, v13
	v_cndmask_b32_e64 v13, 1.0, v14, s[0:1]
	v_cndmask_b32_e64 v15, 1.0, v15, s[0:1]
	v_rcp_f32_e32 v14, v13
	v_cmp_eq_u32_e64 s[0:1], 0, v12
	s_waitcnt vmcnt(3)
	v_lshrrev_b32_e32 v16, 8, v33
	v_and_b32_e32 v17, 0xff, v33
	v_bfe_u32 v34, v33, 8, 8
	v_lshrrev_b32_e32 v35, 12, v33
	v_and_or_b32 v33, v16, s59, v17
	v_and_or_b32 v34, v35, s59, v34
	v_cvt_f32_u32_e32 v36, v33
	v_cvt_f32_u32_e32 v35, v34
	v_rcp_f32_e32 v16, v15
	v_mul_f32_e32 v13, v13, v36
	v_mul_f32_e32 v15, v15, v35
	v_floor_f32_e32 v13, v13
	v_floor_f32_e32 v15, v15
	v_mul_f32_e32 v13, v14, v13
	v_mul_f32_e32 v14, v16, v15
	v_cndmask_b32_e64 v16, v36, v13, s[0:1]
	v_cndmask_b32_e64 v17, v35, v14, s[0:1]
	s_waitcnt vmcnt(0)
.LBB2_66:                               ;   Parent Loop BB2_15 Depth=1
                                        ; =>  This Loop Header: Depth=2
                                        ;       Child Loop BB2_67 Depth 3
	v_readfirstlane_b32 s36, v8
	v_readfirstlane_b32 s37, v9
	v_readfirstlane_b32 s38, v10
	v_readfirstlane_b32 s39, v11
	v_cmp_eq_u64_e64 s[0:1], s[36:37], v[8:9]
	v_cmp_eq_u64_e64 s[2:3], s[38:39], v[10:11]
	s_and_b64 s[0:1], s[0:1], s[2:3]
	s_and_saveexec_b64 s[52:53], s[0:1]
	s_mov_b64 s[54:55], exec
.LBB2_67:                               ;   Parent Loop BB2_15 Depth=1
                                        ;     Parent Loop BB2_66 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	v_readfirstlane_b32 s12, v0
	v_readfirstlane_b32 s13, v1
	v_readfirstlane_b32 s14, v2
	v_readfirstlane_b32 s15, v3
	v_cmp_eq_u64_e64 s[0:1], s[12:13], v[0:1]
	v_cmp_eq_u64_e64 s[2:3], s[14:15], v[2:3]
	v_readfirstlane_b32 s16, v4
	v_readfirstlane_b32 s17, v5
	s_and_b64 s[2:3], s[0:1], s[2:3]
	v_cmp_eq_u64_e64 s[0:1], s[16:17], v[4:5]
	v_readfirstlane_b32 s18, v6
	v_readfirstlane_b32 s19, v7
	s_and_b64 s[2:3], s[2:3], s[0:1]
	v_cmp_eq_u64_e64 s[0:1], s[18:19], v[6:7]
	s_and_b64 s[0:1], s[2:3], s[0:1]
	s_and_saveexec_b64 s[0:1], s[0:1]
	s_nop 0
	image_sample v[12:15], v[16:17], s[12:19], s[36:39] dmask:0xf
	s_xor_b64 exec, exec, s[0:1]
	s_cbranch_execnz .LBB2_67
; %bb.68:                               ;   in Loop: Header=BB2_66 Depth=2
	s_mov_b64 exec, s[54:55]
	s_xor_b64 exec, exec, s[52:53]
	s_cbranch_execnz .LBB2_66
; %bb.69:                               ;   in Loop: Header=BB2_15 Depth=1
	s_mov_b64 exec, s[50:51]
	s_waitcnt vmcnt(0)
	v_lshrrev_b32_e32 v0, 8, v12
	v_and_b32_e32 v0, 0xf00, v0
	v_bfe_u32 v1, v12, 8, 8
	v_lshrrev_b32_e32 v2, 12, v12
	v_and_or_b32 v0, v12, s27, v0
	v_and_or_b32 v1, v2, s59, v1
	v_lshl_or_b32 v0, v1, 16, v0
	v_cmp_ne_u32_e64 s[0:1], v0, v43
	s_mov_b64 s[2:3], 0
	v_mov_b32_e32 v9, 0x43
	s_and_saveexec_b64 s[12:13], s[0:1]
	s_cbranch_execz .LBB2_73
; %bb.70:                               ;   in Loop: Header=BB2_15 Depth=1
	v_alignbit_b32 v0, v13, v12, 24
	v_lshrrev_b32_e32 v2, 8, v0
	v_lshrrev_b32_e32 v1, 12, v0
	v_bfe_u32 v3, v0, 8, 8
	v_and_b32_e32 v2, 0xf00, v2
	v_and_or_b32 v1, v1, s59, v3
	v_and_or_b32 v0, v0, s27, v2
	v_lshl_or_b32 v0, v1, 16, v0
	v_cmp_ne_u32_e64 s[0:1], v0, v43
	s_mov_b64 s[2:3], 0
	v_mov_b32_e32 v9, 0x47
	s_and_saveexec_b64 s[14:15], s[0:1]
	s_cbranch_execz .LBB2_72
; %bb.71:                               ;   in Loop: Header=BB2_15 Depth=1
	v_alignbit_b32 v0, v14, v13, 16
	v_lshrrev_b32_e32 v1, 8, v0
	v_and_b32_e32 v1, 0xf00, v1
	v_and_or_b32 v1, v0, s27, v1
	v_bfe_u32 v2, v0, 8, 8
	v_lshrrev_b32_e32 v0, 12, v0
	v_and_or_b32 v0, v0, s59, v2
	v_lshl_or_b32 v0, v0, 16, v1
	v_alignbit_b32 v1, v15, v14, 8
	v_lshrrev_b32_e32 v2, 8, v1
	v_and_b32_e32 v2, 0xf00, v2
	v_and_or_b32 v2, v1, s27, v2
	v_bfe_u32 v3, v1, 8, 8
	v_lshrrev_b32_e32 v1, 12, v1
	v_and_or_b32 v1, v1, s59, v3
	v_lshl_or_b32 v1, v1, 16, v2
	v_cmp_eq_u32_e64 s[0:1], v1, v43
	v_cmp_eq_u32_e64 s[2:3], v0, v43
	v_cndmask_b32_e64 v1, v48, 36, s[0:1]
	s_or_b64 s[0:1], s[2:3], s[0:1]
	s_xor_b64 s[0:1], s[0:1], -1
	v_cndmask_b32_e64 v9, v1, v45, s[2:3]
	s_and_b64 s[2:3], s[0:1], exec
.LBB2_72:                               ; %Flow673
                                        ;   in Loop: Header=BB2_15 Depth=1
	s_or_b64 exec, exec, s[14:15]
	s_and_b64 s[2:3], s[2:3], exec
.LBB2_73:                               ;   in Loop: Header=BB2_15 Depth=1
	s_or_b64 exec, exec, s[12:13]
	v_add_u32_e32 v0, -1, v47
	v_cmp_ne_u32_e64 s[0:1], 0, v47
	v_cndmask_b32_e64 v47, 0, v0, s[0:1]
	v_cmp_eq_u32_e64 s[0:1], 0, v47
	s_and_saveexec_b64 s[12:13], s[0:1]
	s_cbranch_execz .LBB2_13
; %bb.74:                               ;   in Loop: Header=BB2_15 Depth=1
	s_bitcmp0_b32 s28, 15
	s_cselect_b64 s[0:1], -1, 0
	v_cndmask_b32_e64 v0, 1.0, v32, s[0:1]
	v_rcp_f32_e32 v1, v0
	v_mul_f32_e32 v0, v0, v36
	v_floor_f32_e32 v0, v0
	v_mov_b32_e32 v47, 0
	v_mul_f32_e32 v0, v1, v0
	v_cndmask_b32_e64 v1, 1.0, v21, s[0:1]
	v_rcp_f32_e32 v2, v1
	v_mul_f32_e32 v1, v1, v35
	v_floor_f32_e32 v1, v1
	v_cndmask_b32_e32 v0, v36, v0, vcc
	v_mul_f32_e32 v1, v2, v1
	v_cndmask_b32_e32 v1, v35, v1, vcc
	image_sample v0, v[0:1], s[4:11], s[28:31] dmask:0x8
	s_waitcnt vmcnt(0)
	v_bfe_u32 v1, v0, 8, 8
	v_bfe_u32 v2, v0, 16, 8
	v_perm_b32 v0, v1, v0, s60
	v_lshl_or_b32 v0, v2, 16, v0
	v_add_u32_e32 v46, -1, v0
	s_branch .LBB2_13
.LBB2_75:                               ; %Flow666
                                        ;   in Loop: Header=BB2_15 Depth=1
	s_or_b64 exec, exec, s[10:11]
	s_and_saveexec_b64 s[10:11], s[8:9]
.LBB2_76:                               ;   in Loop: Header=BB2_15 Depth=1
	v_lshrrev_b32_e32 v1, 8, v32
	v_and_b32_e32 v1, 0xf00, v1
	v_bfe_u32 v2, v32, 8, 8
	v_lshrrev_b32_e32 v3, 12, v32
	v_and_or_b32 v1, v32, s27, v1
	v_and_or_b32 v2, v3, s59, v2
	v_lshl_or_b32 v43, v2, 16, v1
	v_mov_b32_e32 v48, 0x43
	s_andn2_b64 s[2:3], s[2:3], exec
	v_pk_mov_b32 v[36:37], v[30:31], v[30:31] op_sel:[0,1]
	v_pk_mov_b32 v[34:35], v[28:29], v[28:29] op_sel:[0,1]
.LBB2_77:                               ; %Flow667
                                        ;   in Loop: Header=BB2_15 Depth=1
	s_or_b64 exec, exec, s[10:11]
	s_and_b64 s[2:3], s[2:3], exec
	s_andn2_b64 s[4:5], s[4:5], exec
	s_or_b64 exec, exec, s[6:7]
	s_and_saveexec_b64 s[6:7], s[4:5]
	s_cbranch_execnz .LBB2_44
	s_branch .LBB2_45
.LBB2_78:                               ; %Flow662
                                        ;   in Loop: Header=BB2_15 Depth=1
	s_or_b64 exec, exec, s[14:15]
	s_and_saveexec_b64 s[14:15], s[12:13]
.LBB2_79:                               ;   in Loop: Header=BB2_15 Depth=1
	v_lshrrev_b32_e32 v1, 8, v34
	v_and_b32_e32 v1, 0xf00, v1
	v_bfe_u32 v2, v34, 8, 8
	v_lshrrev_b32_e32 v3, 12, v34
	v_and_or_b32 v1, v34, s27, v1
	v_and_or_b32 v2, v3, s59, v2
	v_lshl_or_b32 v43, v2, 16, v1
	v_mov_b32_e32 v48, 0x47
	s_andn2_b64 s[2:3], s[2:3], exec
	v_pk_mov_b32 v[36:37], v[30:31], v[30:31] op_sel:[0,1]
.LBB2_80:                               ; %Flow663
                                        ;   in Loop: Header=BB2_15 Depth=1
	s_or_b64 exec, exec, s[14:15]
	s_and_b64 s[2:3], s[2:3], exec
	s_andn2_b64 s[8:9], s[8:9], exec
	s_or_b64 exec, exec, s[10:11]
	s_and_saveexec_b64 s[10:11], s[8:9]
	s_cbranch_execnz .LBB2_76
	s_branch .LBB2_77
.LBB2_81:                               ; %Flow658
                                        ;   in Loop: Header=BB2_15 Depth=1
	s_or_b64 exec, exec, s[2:3]
	s_and_saveexec_b64 s[2:3], s[18:19]
.LBB2_82:                               ;   in Loop: Header=BB2_15 Depth=1
	v_lshrrev_b32_e32 v1, 8, v36
	v_and_b32_e32 v1, 0xf00, v1
	v_bfe_u32 v2, v36, 8, 8
	v_lshrrev_b32_e32 v3, 12, v36
	v_and_or_b32 v1, v36, s27, v1
	v_and_or_b32 v2, v3, s59, v2
	v_lshl_or_b32 v43, v2, 16, v1
	v_mov_b32_e32 v48, 0x54
	s_andn2_b64 s[28:29], s[28:29], exec
.LBB2_83:                               ; %Flow659
                                        ;   in Loop: Header=BB2_15 Depth=1
	s_or_b64 exec, exec, s[2:3]
	s_and_b64 s[2:3], s[28:29], exec
	s_andn2_b64 s[12:13], s[12:13], exec
	s_or_b64 exec, exec, s[14:15]
	s_and_saveexec_b64 s[14:15], s[12:13]
	s_cbranch_execnz .LBB2_79
	s_branch .LBB2_80
.LBB2_84:                               ; %._crit_edge501
	s_endpgm
	.section	.rodata,#alloc
	.p2align	6
	.amdhsa_kernel _Z11printKernelP9MatchInfoiP9AlignmentPcPKiS5_iiiii
		.amdhsa_group_segment_fixed_size 0
		.amdhsa_private_segment_fixed_size 0
		.amdhsa_kernarg_size 68
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
		.amdhsa_next_free_vgpr 52
		.amdhsa_next_free_sgpr 61
		.amdhsa_accum_offset 52
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
	.size	_Z11printKernelP9MatchInfoiP9AlignmentPcPKiS5_iiiii, .Lfunc_end2-_Z11printKernelP9MatchInfoiP9AlignmentPcPKiS5_iiiii
                                        ; -- End function
	.section	.AMDGPU.csdata
; Kernel info:
; codeLenInByte = 5280
; NumSgprs: 63
; NumVgprs: 52
; NumAgprs: 0
; TotalNumVgprs: 52
; ScratchSize: 0
; MemoryBound: 0
; FloatMode: 240
; IeeeMode: 1
; LDSByteSize: 0 bytes/workgroup (compile time only)
; SGPRBlocks: 7
; VGPRBlocks: 6
; NumSGPRsForWavesPerEU: 63
; NumVGPRsForWavesPerEU: 52
; AccumOffset: 52
; Occupancy: 8
; WaveLimiterHint : 1
; COMPUTE_PGM_RSRC2:SCRATCH_EN: 0
; COMPUTE_PGM_RSRC2:USER_SGPR: 8
; COMPUTE_PGM_RSRC2:TRAP_HANDLER: 0
; COMPUTE_PGM_RSRC2:TGID_X_EN: 1
; COMPUTE_PGM_RSRC2:TGID_Y_EN: 0
; COMPUTE_PGM_RSRC2:TGID_Z_EN: 0
; COMPUTE_PGM_RSRC2:TIDIG_COMP_CNT: 0
; COMPUTE_PGM_RSRC3_GFX90A:ACCUM_OFFSET: 12
; COMPUTE_PGM_RSRC3_GFX90A:TG_SPLIT: 0
	.text
	.p2alignl 6, 3212836864
	.fill 256, 4, 3212836864
	.protected	nodetex                 ; @nodetex
	.type	nodetex,@object
	.section	.bss,#alloc,#write
	.globl	nodetex
	.p2align	3
nodetex:
	.zero	88
	.size	nodetex, 88

	.protected	childrentex             ; @childrentex
	.type	childrentex,@object
	.globl	childrentex
	.p2align	3
childrentex:
	.zero	88
	.size	childrentex, 88

	.protected	reftex                  ; @reftex
	.type	reftex,@object
	.globl	reftex
	.p2align	3
reftex:
	.zero	88
	.size	reftex, 88

	.protected	qrytex                  ; @qrytex
	.type	qrytex,@object
	.globl	qrytex
	.p2align	3
qrytex:
	.zero	88
	.size	qrytex, 88

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

	.ident	"clang version 16.0.0 (https://github.com/llvm/llvm-project 809855b56f06dd7182685f88fbbc64111df9339a)"
	.section	".note.GNU-stack"
	.addrsig
	.addrsig_sym nodetex
	.addrsig_sym childrentex
	.addrsig_sym _ZN17__HIP_CoordinatesI14__HIP_BlockIdxE1xE
	.addrsig_sym _ZN17__HIP_CoordinatesI14__HIP_BlockDimE1xE
	.addrsig_sym _ZN17__HIP_CoordinatesI15__HIP_ThreadIdxE1xE
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
      - .address_space:  global
        .offset:         16
        .size:           8
        .value_kind:     global_buffer
      - .address_space:  global
        .offset:         24
        .size:           8
        .value_kind:     global_buffer
      - .address_space:  global
        .offset:         32
        .size:           8
        .value_kind:     global_buffer
      - .offset:         40
        .size:           4
        .value_kind:     by_value
      - .offset:         44
        .size:           4
        .value_kind:     by_value
    .group_segment_fixed_size: 0
    .kernarg_segment_align: 8
    .kernarg_segment_size: 48
    .language:       OpenCL C
    .language_version:
      - 2
      - 0
    .max_flat_workgroup_size: 1024
    .name:           _Z15mummergpuKernelPvPcS0_PKiS2_ii
    .private_segment_fixed_size: 0
    .sgpr_count:     47
    .sgpr_spill_count: 0
    .symbol:         _Z15mummergpuKernelPvPcS0_PKiS2_ii.kd
    .uses_dynamic_stack: false
    .vgpr_count:     38
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
      - .address_space:  global
        .offset:         16
        .size:           8
        .value_kind:     global_buffer
      - .address_space:  global
        .offset:         24
        .size:           8
        .value_kind:     global_buffer
      - .offset:         32
        .size:           4
        .value_kind:     by_value
      - .offset:         36
        .size:           4
        .value_kind:     by_value
    .group_segment_fixed_size: 0
    .kernarg_segment_align: 8
    .kernarg_segment_size: 40
    .language:       OpenCL C
    .language_version:
      - 2
      - 0
    .max_flat_workgroup_size: 1024
    .name:           _Z17mummergpuRCKernelP10MatchCoordPcPKiS3_ii
    .private_segment_fixed_size: 0
    .sgpr_count:     0
    .sgpr_spill_count: 0
    .symbol:         _Z17mummergpuRCKernelP10MatchCoordPcPKiS3_ii.kd
    .uses_dynamic_stack: false
    .vgpr_count:     0
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
      - .address_space:  global
        .offset:         16
        .size:           8
        .value_kind:     global_buffer
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
      - .offset:         48
        .size:           4
        .value_kind:     by_value
      - .offset:         52
        .size:           4
        .value_kind:     by_value
      - .offset:         56
        .size:           4
        .value_kind:     by_value
      - .offset:         60
        .size:           4
        .value_kind:     by_value
      - .offset:         64
        .size:           4
        .value_kind:     by_value
    .group_segment_fixed_size: 0
    .kernarg_segment_align: 8
    .kernarg_segment_size: 68
    .language:       OpenCL C
    .language_version:
      - 2
      - 0
    .max_flat_workgroup_size: 1024
    .name:           _Z11printKernelP9MatchInfoiP9AlignmentPcPKiS5_iiiii
    .private_segment_fixed_size: 0
    .sgpr_count:     63
    .sgpr_spill_count: 0
    .symbol:         _Z11printKernelP9MatchInfoiP9AlignmentPcPKiS5_iiiii.kd
    .uses_dynamic_stack: false
    .vgpr_count:     52
    .vgpr_spill_count: 0
    .wavefront_size: 64
amdhsa.target:   amdgcn-amd-amdhsa--gfx90a
amdhsa.version:
  - 1
  - 1
...

	.end_amdgpu_metadata

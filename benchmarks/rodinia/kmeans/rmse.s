	.text
	.file	"rmse.c"
	.globl	_Z7rms_errPPfiiS0_i             # -- Begin function _Z7rms_errPPfiiS0_i
	.p2align	4, 0x90
	.type	_Z7rms_errPPfiiS0_i,@function
_Z7rms_errPPfiiS0_i:                    # @_Z7rms_errPPfiiS0_i
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$48, %rsp
	movq	%rdi, -8(%rbp)
	movl	%esi, -12(%rbp)
	movl	%edx, -16(%rbp)
	movq	%rcx, -24(%rbp)
	movl	%r8d, -28(%rbp)
	xorps	%xmm0, %xmm0
	movss	%xmm0, -40(%rbp)
	movl	$0, -32(%rbp)
.LBB0_1:                                # =>This Inner Loop Header: Depth=1
	movl	-32(%rbp), %eax
	cmpl	-16(%rbp), %eax
	jge	.LBB0_4
# %bb.2:                                #   in Loop: Header=BB0_1 Depth=1
	movq	-8(%rbp), %rax
	movslq	-32(%rbp), %rcx
	movq	(%rax,%rcx,8), %rdi
	movl	-12(%rbp), %esi
	movq	-24(%rbp), %rdx
	movl	-28(%rbp), %ecx
	callq	_Z18find_nearest_pointPfiPS_i@PLT
	movl	%eax, -36(%rbp)
	movq	-8(%rbp), %rax
	movslq	-32(%rbp), %rcx
	movq	(%rax,%rcx,8), %rdi
	movq	-24(%rbp), %rax
	movslq	-36(%rbp), %rcx
	movq	(%rax,%rcx,8), %rsi
	movl	-12(%rbp), %edx
	callq	_Z13euclid_dist_2PfS_i@PLT
	addss	-40(%rbp), %xmm0
	movss	%xmm0, -40(%rbp)
# %bb.3:                                #   in Loop: Header=BB0_1 Depth=1
	movl	-32(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -32(%rbp)
	jmp	.LBB0_1
.LBB0_4:
	movss	-40(%rbp), %xmm0                # xmm0 = mem[0],zero,zero,zero
	cvtsi2ssl	-16(%rbp), %xmm1
	divss	%xmm1, %xmm0
	callq	_ZSt4sqrtf@PLT
	movss	%xmm0, -44(%rbp)
	movss	-44(%rbp), %xmm0                # xmm0 = mem[0],zero,zero,zero
	addq	$48, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end0:
	.size	_Z7rms_errPPfiiS0_i, .Lfunc_end0-_Z7rms_errPPfiiS0_i
	.cfi_endproc
                                        # -- End function
	.section	.rodata.cst4,"aM",@progbits,4
	.p2align	2, 0x0                          # -- Begin function _Z18find_nearest_pointPfiPS_i
.LCPI1_0:
	.long	0x7f7fffff                      # float 3.40282347E+38
	.section	.text._Z18find_nearest_pointPfiPS_i,"axG",@progbits,_Z18find_nearest_pointPfiPS_i,comdat
	.weak	_Z18find_nearest_pointPfiPS_i
	.p2align	4, 0x90
	.type	_Z18find_nearest_pointPfiPS_i,@function
_Z18find_nearest_pointPfiPS_i:          # @_Z18find_nearest_pointPfiPS_i
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$48, %rsp
	movq	%rdi, -8(%rbp)
	movl	%esi, -12(%rbp)
	movq	%rdx, -24(%rbp)
	movl	%ecx, -28(%rbp)
	movss	.LCPI1_0(%rip), %xmm0           # xmm0 = mem[0],zero,zero,zero
	movss	%xmm0, -40(%rbp)
	movl	$0, -36(%rbp)
.LBB1_1:                                # =>This Inner Loop Header: Depth=1
	movl	-36(%rbp), %eax
	cmpl	-28(%rbp), %eax
	jge	.LBB1_6
# %bb.2:                                #   in Loop: Header=BB1_1 Depth=1
	movq	-8(%rbp), %rdi
	movq	-24(%rbp), %rax
	movslq	-36(%rbp), %rcx
	movq	(%rax,%rcx,8), %rsi
	movl	-12(%rbp), %edx
	callq	_Z13euclid_dist_2PfS_i@PLT
	movss	%xmm0, -44(%rbp)
	movss	-44(%rbp), %xmm1                # xmm1 = mem[0],zero,zero,zero
	movss	-40(%rbp), %xmm0                # xmm0 = mem[0],zero,zero,zero
	ucomiss	%xmm1, %xmm0
	jbe	.LBB1_4
# %bb.3:                                #   in Loop: Header=BB1_1 Depth=1
	movss	-44(%rbp), %xmm0                # xmm0 = mem[0],zero,zero,zero
	movss	%xmm0, -40(%rbp)
	movl	-36(%rbp), %eax
	movl	%eax, -32(%rbp)
.LBB1_4:                                #   in Loop: Header=BB1_1 Depth=1
	jmp	.LBB1_5
.LBB1_5:                                #   in Loop: Header=BB1_1 Depth=1
	movl	-36(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -36(%rbp)
	jmp	.LBB1_1
.LBB1_6:
	movl	-32(%rbp), %eax
	addq	$48, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end1:
	.size	_Z18find_nearest_pointPfiPS_i, .Lfunc_end1-_Z18find_nearest_pointPfiPS_i
	.cfi_endproc
                                        # -- End function
	.section	.text._Z13euclid_dist_2PfS_i,"axG",@progbits,_Z13euclid_dist_2PfS_i,comdat
	.weak	_Z13euclid_dist_2PfS_i          # -- Begin function _Z13euclid_dist_2PfS_i
	.p2align	4, 0x90
	.type	_Z13euclid_dist_2PfS_i,@function
_Z13euclid_dist_2PfS_i:                 # @_Z13euclid_dist_2PfS_i
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movl	%edx, -20(%rbp)
	xorps	%xmm0, %xmm0
	movss	%xmm0, -28(%rbp)
	movl	$0, -24(%rbp)
.LBB2_1:                                # =>This Inner Loop Header: Depth=1
	movl	-24(%rbp), %eax
	cmpl	-20(%rbp), %eax
	jge	.LBB2_4
# %bb.2:                                #   in Loop: Header=BB2_1 Depth=1
	movq	-8(%rbp), %rax
	movslq	-24(%rbp), %rcx
	movss	(%rax,%rcx,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	movq	-16(%rbp), %rax
	movslq	-24(%rbp), %rcx
	subss	(%rax,%rcx,4), %xmm0
	movq	-8(%rbp), %rax
	movslq	-24(%rbp), %rcx
	movss	(%rax,%rcx,4), %xmm2            # xmm2 = mem[0],zero,zero,zero
	movq	-16(%rbp), %rax
	movslq	-24(%rbp), %rcx
	subss	(%rax,%rcx,4), %xmm2
	movss	-28(%rbp), %xmm1                # xmm1 = mem[0],zero,zero,zero
	mulss	%xmm2, %xmm0
	addss	%xmm1, %xmm0
	movss	%xmm0, -28(%rbp)
# %bb.3:                                #   in Loop: Header=BB2_1 Depth=1
	movl	-24(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -24(%rbp)
	jmp	.LBB2_1
.LBB2_4:
	movss	-28(%rbp), %xmm0                # xmm0 = mem[0],zero,zero,zero
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end2:
	.size	_Z13euclid_dist_2PfS_i, .Lfunc_end2-_Z13euclid_dist_2PfS_i
	.cfi_endproc
                                        # -- End function
	.section	.text._ZSt4sqrtf,"axG",@progbits,_ZSt4sqrtf,comdat
	.weak	_ZSt4sqrtf                      # -- Begin function _ZSt4sqrtf
	.p2align	4, 0x90
	.type	_ZSt4sqrtf,@function
_ZSt4sqrtf:                             # @_ZSt4sqrtf
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	movss	%xmm0, -4(%rbp)
	movss	-4(%rbp), %xmm0                 # xmm0 = mem[0],zero,zero,zero
	callq	sqrtf@PLT
	addq	$16, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end3:
	.size	_ZSt4sqrtf, .Lfunc_end3-_ZSt4sqrtf
	.cfi_endproc
                                        # -- End function
	.ident	"clang version 16.0.0 (https://github.com/llvm/llvm-project.git 159fb378f779ac79f7d456ea233892ad526b56d8)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
	.addrsig_sym _Z18find_nearest_pointPfiPS_i
	.addrsig_sym _Z13euclid_dist_2PfS_i
	.addrsig_sym _ZSt4sqrtf
	.addrsig_sym sqrtf

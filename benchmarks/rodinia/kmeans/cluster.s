	.text
	.file	"cluster.c"
	.globl	_Z7clusteriiPPfiifPiPS0_S_ii    # -- Begin function _Z7clusteriiPPfiifPiPS0_S_ii
	.p2align	4, 0x90
	.type	_Z7clusteriiPPfiifPiPS0_S_ii,@function
_Z7clusteriiPPfiifPiPS0_S_ii:           # @_Z7clusteriiPPfiifPiPS0_S_ii
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$80, %rsp
	movl	40(%rbp), %eax
	movl	32(%rbp), %eax
	movq	24(%rbp), %rax
	movq	16(%rbp), %rax
	movl	%edi, -4(%rbp)
	movl	%esi, -8(%rbp)
	movq	%rdx, -16(%rbp)
	movl	%ecx, -20(%rbp)
	movl	%r8d, -24(%rbp)
	movss	%xmm0, -28(%rbp)
	movq	%r9, -40(%rbp)
	movl	$0, -48(%rbp)
	movslq	-4(%rbp), %rdi
	shlq	$2, %rdi
	callq	malloc@PLT
	movq	%rax, -64(%rbp)
	movl	-20(%rbp), %eax
	movl	%eax, -44(%rbp)
.LBB0_1:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_5 Depth 2
	movl	-44(%rbp), %eax
	cmpl	-24(%rbp), %eax
	jg	.LBB0_16
# %bb.2:                                #   in Loop: Header=BB0_1 Depth=1
	movl	-44(%rbp), %eax
	cmpl	-4(%rbp), %eax
	jle	.LBB0_4
# %bb.3:
	jmp	.LBB0_16
.LBB0_4:                                #   in Loop: Header=BB0_1 Depth=1
	movl	-4(%rbp), %edi
	movl	-8(%rbp), %esi
	movl	-44(%rbp), %edx
	movq	-16(%rbp), %rcx
	callq	allocateMemory@PLT
	movl	$0, -76(%rbp)
.LBB0_5:                                #   Parent Loop BB0_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	-76(%rbp), %eax
	cmpl	40(%rbp), %eax
	jge	.LBB0_14
# %bb.6:                                #   in Loop: Header=BB0_5 Depth=2
	movq	-16(%rbp), %rdi
	movl	-8(%rbp), %esi
	movl	-4(%rbp), %edx
	movl	-44(%rbp), %ecx
	movss	-28(%rbp), %xmm0                # xmm0 = mem[0],zero,zero,zero
	movq	-64(%rbp), %r8
	callq	_Z17kmeans_clusteringPPfiiifPi@PLT
	movq	%rax, -72(%rbp)
	movq	16(%rbp), %rax
	cmpq	$0, (%rax)
	je	.LBB0_8
# %bb.7:                                #   in Loop: Header=BB0_5 Depth=2
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	movq	(%rax), %rdi
	callq	free@PLT
	movq	16(%rbp), %rax
	movq	(%rax), %rdi
	callq	free@PLT
.LBB0_8:                                #   in Loop: Header=BB0_5 Depth=2
	movq	-72(%rbp), %rcx
	movq	16(%rbp), %rax
	movq	%rcx, (%rax)
	cmpl	$0, 32(%rbp)
	je	.LBB0_12
# %bb.9:                                #   in Loop: Header=BB0_5 Depth=2
	movq	-16(%rbp), %rdi
	movl	-8(%rbp), %esi
	movl	-4(%rbp), %edx
	movq	-72(%rbp), %rcx
	movl	-44(%rbp), %r8d
	callq	_Z7rms_errPPfiiS0_i@PLT
	cvttss2si	%xmm0, %eax
	movl	%eax, -52(%rbp)
	cvtsi2ssl	-52(%rbp), %xmm1
	movq	min_rmse_ref@GOTPCREL(%rip), %rax
	movss	(%rax), %xmm0                   # xmm0 = mem[0],zero,zero,zero
	ucomiss	%xmm1, %xmm0
	jbe	.LBB0_11
# %bb.10:                               #   in Loop: Header=BB0_5 Depth=2
	cvtsi2ssl	-52(%rbp), %xmm0
	movq	min_rmse_ref@GOTPCREL(%rip), %rax
	movss	%xmm0, (%rax)
	movq	min_rmse_ref@GOTPCREL(%rip), %rax
	movss	(%rax), %xmm0                   # xmm0 = mem[0],zero,zero,zero
	movq	24(%rbp), %rax
	movss	%xmm0, (%rax)
	movl	-44(%rbp), %ecx
	movq	-40(%rbp), %rax
	movl	%ecx, (%rax)
	movl	-76(%rbp), %eax
	movl	%eax, -48(%rbp)
.LBB0_11:                               #   in Loop: Header=BB0_5 Depth=2
	jmp	.LBB0_12
.LBB0_12:                               #   in Loop: Header=BB0_5 Depth=2
	jmp	.LBB0_13
.LBB0_13:                               #   in Loop: Header=BB0_5 Depth=2
	movl	-76(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -76(%rbp)
	jmp	.LBB0_5
.LBB0_14:                               #   in Loop: Header=BB0_1 Depth=1
	callq	deallocateMemory@PLT
# %bb.15:                               #   in Loop: Header=BB0_1 Depth=1
	movl	-44(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -44(%rbp)
	jmp	.LBB0_1
.LBB0_16:
	movq	-64(%rbp), %rdi
	callq	free@PLT
	movl	-48(%rbp), %eax
	addq	$80, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end0:
	.size	_Z7clusteriiPPfiifPiPS0_S_ii, .Lfunc_end0-_Z7clusteriiPPfiifPiPS0_S_ii
	.cfi_endproc
                                        # -- End function
	.type	min_rmse_ref,@object            # @min_rmse_ref
	.data
	.globl	min_rmse_ref
	.p2align	2, 0x0
min_rmse_ref:
	.long	0x7f7fffff                      # float 3.40282347E+38
	.size	min_rmse_ref, 4

	.ident	"clang version 16.0.0 (https://github.com/llvm/llvm-project.git 159fb378f779ac79f7d456ea233892ad526b56d8)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
	.addrsig_sym malloc
	.addrsig_sym allocateMemory
	.addrsig_sym _Z17kmeans_clusteringPPfiiifPi
	.addrsig_sym free
	.addrsig_sym _Z7rms_errPPfiiS0_i
	.addrsig_sym deallocateMemory
	.addrsig_sym min_rmse_ref

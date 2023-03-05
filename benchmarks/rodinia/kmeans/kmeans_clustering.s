	.text
	.file	"kmeans_clustering.c"
	.globl	_Z17kmeans_clusteringPPfiiifPi  # -- Begin function _Z17kmeans_clusteringPPfiiifPi
	.p2align	4, 0x90
	.type	_Z17kmeans_clusteringPPfiiifPi,@function
_Z17kmeans_clusteringPPfiiifPi:         # @_Z17kmeans_clusteringPPfiiifPi
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$128, %rsp
	movq	%rdi, -8(%rbp)
	movl	%esi, -12(%rbp)
	movl	%edx, -16(%rbp)
	movl	%ecx, -20(%rbp)
	movss	%xmm0, -24(%rbp)
	movq	%r8, -32(%rbp)
	movl	$0, -44(%rbp)
	movl	$0, -48(%rbp)
	movl	$0, -104(%rbp)
	movl	-20(%rbp), %eax
	cmpl	-16(%rbp), %eax
	jle	.LBB0_2
# %bb.1:
	movl	-16(%rbp), %eax
	movl	%eax, -20(%rbp)
.LBB0_2:
	movslq	-20(%rbp), %rdi
	shlq	$3, %rdi
	callq	malloc@PLT
	movq	%rax, -80(%rbp)
	movl	-20(%rbp), %eax
	imull	-12(%rbp), %eax
	movslq	%eax, %rdi
	shlq	$2, %rdi
	callq	malloc@PLT
	movq	%rax, %rcx
	movq	-80(%rbp), %rax
	movq	%rcx, (%rax)
	movl	$1, -36(%rbp)
.LBB0_3:                                # =>This Inner Loop Header: Depth=1
	movl	-36(%rbp), %eax
	cmpl	-20(%rbp), %eax
	jge	.LBB0_6
# %bb.4:                                #   in Loop: Header=BB0_3 Depth=1
	movq	-80(%rbp), %rax
	movl	-36(%rbp), %ecx
	subl	$1, %ecx
	movslq	%ecx, %rcx
	movq	(%rax,%rcx,8), %rdx
	movslq	-12(%rbp), %rax
	shlq	$2, %rax
	addq	%rax, %rdx
	movq	-80(%rbp), %rax
	movslq	-36(%rbp), %rcx
	movq	%rdx, (%rax,%rcx,8)
# %bb.5:                                #   in Loop: Header=BB0_3 Depth=1
	movl	-36(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -36(%rbp)
	jmp	.LBB0_3
.LBB0_6:
	movslq	-16(%rbp), %rdi
	shlq	$2, %rdi
	callq	malloc@PLT
	movq	%rax, -96(%rbp)
	movl	$0, -36(%rbp)
.LBB0_7:                                # =>This Inner Loop Header: Depth=1
	movl	-36(%rbp), %eax
	cmpl	-16(%rbp), %eax
	jge	.LBB0_10
# %bb.8:                                #   in Loop: Header=BB0_7 Depth=1
	movl	-36(%rbp), %edx
	movq	-96(%rbp), %rax
	movslq	-36(%rbp), %rcx
	movl	%edx, (%rax,%rcx,4)
# %bb.9:                                #   in Loop: Header=BB0_7 Depth=1
	movl	-36(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -36(%rbp)
	jmp	.LBB0_7
.LBB0_10:
	movl	-16(%rbp), %eax
	movl	%eax, -100(%rbp)
	movl	$0, -36(%rbp)
.LBB0_11:                               # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_15 Depth 2
	movl	-36(%rbp), %ecx
	xorl	%eax, %eax
                                        # kill: def $al killed $al killed $eax
	cmpl	-20(%rbp), %ecx
	movb	%al, -105(%rbp)                 # 1-byte Spill
	jge	.LBB0_13
# %bb.12:                               #   in Loop: Header=BB0_11 Depth=1
	cmpl	$0, -100(%rbp)
	setge	%al
	movb	%al, -105(%rbp)                 # 1-byte Spill
.LBB0_13:                               #   in Loop: Header=BB0_11 Depth=1
	movb	-105(%rbp), %al                 # 1-byte Reload
	testb	$1, %al
	jne	.LBB0_14
	jmp	.LBB0_20
.LBB0_14:                               #   in Loop: Header=BB0_11 Depth=1
	movl	$0, -40(%rbp)
.LBB0_15:                               #   Parent Loop BB0_11 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	-40(%rbp), %eax
	cmpl	-12(%rbp), %eax
	jge	.LBB0_18
# %bb.16:                               #   in Loop: Header=BB0_15 Depth=2
	movq	-8(%rbp), %rax
	movq	-96(%rbp), %rcx
	movslq	-44(%rbp), %rdx
	movslq	(%rcx,%rdx,4), %rcx
	movq	(%rax,%rcx,8), %rax
	movslq	-40(%rbp), %rcx
	movss	(%rax,%rcx,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	movq	-80(%rbp), %rax
	movslq	-36(%rbp), %rcx
	movq	(%rax,%rcx,8), %rax
	movslq	-40(%rbp), %rcx
	movss	%xmm0, (%rax,%rcx,4)
# %bb.17:                               #   in Loop: Header=BB0_15 Depth=2
	movl	-40(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -40(%rbp)
	jmp	.LBB0_15
.LBB0_18:                               #   in Loop: Header=BB0_11 Depth=1
	movq	-96(%rbp), %rax
	movslq	-44(%rbp), %rcx
	movl	(%rax,%rcx,4), %eax
	movl	%eax, -52(%rbp)
	movq	-96(%rbp), %rax
	movl	-100(%rbp), %ecx
	subl	$1, %ecx
	movslq	%ecx, %rcx
	movl	(%rax,%rcx,4), %edx
	movq	-96(%rbp), %rax
	movslq	-44(%rbp), %rcx
	movl	%edx, (%rax,%rcx,4)
	movl	-52(%rbp), %edx
	movq	-96(%rbp), %rax
	movl	-100(%rbp), %ecx
	subl	$1, %ecx
	movslq	%ecx, %rcx
	movl	%edx, (%rax,%rcx,4)
	movl	-100(%rbp), %eax
	addl	$-1, %eax
	movl	%eax, -100(%rbp)
	movl	-44(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -44(%rbp)
# %bb.19:                               #   in Loop: Header=BB0_11 Depth=1
	movl	-36(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -36(%rbp)
	jmp	.LBB0_11
.LBB0_20:
	movl	$0, -36(%rbp)
.LBB0_21:                               # =>This Inner Loop Header: Depth=1
	movl	-36(%rbp), %eax
	cmpl	-16(%rbp), %eax
	jge	.LBB0_24
# %bb.22:                               #   in Loop: Header=BB0_21 Depth=1
	movq	-32(%rbp), %rax
	movslq	-36(%rbp), %rcx
	movl	$-1, (%rax,%rcx,4)
# %bb.23:                               #   in Loop: Header=BB0_21 Depth=1
	movl	-36(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -36(%rbp)
	jmp	.LBB0_21
.LBB0_24:
	movslq	-20(%rbp), %rdi
	movl	$4, %esi
	callq	calloc@PLT
	movq	%rax, -64(%rbp)
	movslq	-20(%rbp), %rdi
	shlq	$3, %rdi
	callq	malloc@PLT
	movq	%rax, -88(%rbp)
	movl	-20(%rbp), %eax
	imull	-12(%rbp), %eax
	movslq	%eax, %rdi
	movl	$4, %esi
	callq	calloc@PLT
	movq	%rax, %rcx
	movq	-88(%rbp), %rax
	movq	%rcx, (%rax)
	movl	$1, -36(%rbp)
.LBB0_25:                               # =>This Inner Loop Header: Depth=1
	movl	-36(%rbp), %eax
	cmpl	-20(%rbp), %eax
	jge	.LBB0_28
# %bb.26:                               #   in Loop: Header=BB0_25 Depth=1
	movq	-88(%rbp), %rax
	movl	-36(%rbp), %ecx
	subl	$1, %ecx
	movslq	%ecx, %rcx
	movq	(%rax,%rcx,8), %rdx
	movslq	-12(%rbp), %rax
	shlq	$2, %rax
	addq	%rax, %rdx
	movq	-88(%rbp), %rax
	movslq	-36(%rbp), %rcx
	movq	%rdx, (%rax,%rcx,8)
# %bb.27:                               #   in Loop: Header=BB0_25 Depth=1
	movl	-36(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -36(%rbp)
	jmp	.LBB0_25
.LBB0_28:
	jmp	.LBB0_29
.LBB0_29:                               # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_30 Depth 2
                                        #       Child Loop BB0_32 Depth 3
	xorps	%xmm0, %xmm0
	movss	%xmm0, -68(%rbp)
	movq	-8(%rbp), %rdi
	movl	-12(%rbp), %esi
	movl	-16(%rbp), %edx
	movl	-20(%rbp), %ecx
	movq	-32(%rbp), %r8
	movq	-80(%rbp), %r9
	movq	-64(%rbp), %r10
	movq	-88(%rbp), %rax
	movq	%r10, (%rsp)
	movq	%rax, 8(%rsp)
	callq	_Z10kmeansCudaPPfiiiPiS0_S1_S0_@PLT
	cvtsi2ss	%eax, %xmm0
	movss	%xmm0, -68(%rbp)
	movl	$0, -36(%rbp)
.LBB0_30:                               #   Parent Loop BB0_29 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB0_32 Depth 3
	movl	-36(%rbp), %eax
	cmpl	-20(%rbp), %eax
	jge	.LBB0_39
# %bb.31:                               #   in Loop: Header=BB0_30 Depth=2
	movl	$0, -40(%rbp)
.LBB0_32:                               #   Parent Loop BB0_29 Depth=1
                                        #     Parent Loop BB0_30 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movl	-40(%rbp), %eax
	cmpl	-12(%rbp), %eax
	jge	.LBB0_37
# %bb.33:                               #   in Loop: Header=BB0_32 Depth=3
	movq	-64(%rbp), %rax
	movslq	-36(%rbp), %rcx
	cmpl	$0, (%rax,%rcx,4)
	jle	.LBB0_35
# %bb.34:                               #   in Loop: Header=BB0_32 Depth=3
	movq	-88(%rbp), %rax
	movslq	-36(%rbp), %rcx
	movq	(%rax,%rcx,8), %rax
	movslq	-40(%rbp), %rcx
	movss	(%rax,%rcx,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	movq	-64(%rbp), %rax
	movslq	-36(%rbp), %rcx
	cvtsi2ssl	(%rax,%rcx,4), %xmm1
	divss	%xmm1, %xmm0
	movq	-80(%rbp), %rax
	movslq	-36(%rbp), %rcx
	movq	(%rax,%rcx,8), %rax
	movslq	-40(%rbp), %rcx
	movss	%xmm0, (%rax,%rcx,4)
.LBB0_35:                               #   in Loop: Header=BB0_32 Depth=3
	movq	-88(%rbp), %rax
	movslq	-36(%rbp), %rcx
	movq	(%rax,%rcx,8), %rax
	movslq	-40(%rbp), %rcx
	xorps	%xmm0, %xmm0
	movss	%xmm0, (%rax,%rcx,4)
# %bb.36:                               #   in Loop: Header=BB0_32 Depth=3
	movl	-40(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -40(%rbp)
	jmp	.LBB0_32
.LBB0_37:                               #   in Loop: Header=BB0_30 Depth=2
	movq	-64(%rbp), %rax
	movslq	-36(%rbp), %rcx
	movl	$0, (%rax,%rcx,4)
# %bb.38:                               #   in Loop: Header=BB0_30 Depth=2
	movl	-36(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -36(%rbp)
	jmp	.LBB0_30
.LBB0_39:                               #   in Loop: Header=BB0_29 Depth=1
	movl	-104(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -104(%rbp)
# %bb.40:                               #   in Loop: Header=BB0_29 Depth=1
	movss	-68(%rbp), %xmm0                # xmm0 = mem[0],zero,zero,zero
	xorl	%eax, %eax
                                        # kill: def $al killed $al killed $eax
	ucomiss	-24(%rbp), %xmm0
	movb	%al, -106(%rbp)                 # 1-byte Spill
	jbe	.LBB0_42
# %bb.41:                               #   in Loop: Header=BB0_29 Depth=1
	movl	-48(%rbp), %eax
	movl	%eax, %ecx
	addl	$1, %ecx
	movl	%ecx, -48(%rbp)
	cmpl	$500, %eax                      # imm = 0x1F4
	setl	%al
	movb	%al, -106(%rbp)                 # 1-byte Spill
.LBB0_42:                               #   in Loop: Header=BB0_29 Depth=1
	movb	-106(%rbp), %al                 # 1-byte Reload
	testb	$1, %al
	jne	.LBB0_29
# %bb.43:
	movl	-104(%rbp), %esi
	leaq	.L.str(%rip), %rdi
	movb	$0, %al
	callq	printf@PLT
	movq	-88(%rbp), %rax
	movq	(%rax), %rdi
	callq	free@PLT
	movq	-88(%rbp), %rdi
	callq	free@PLT
	movq	-64(%rbp), %rdi
	callq	free@PLT
	movq	-80(%rbp), %rax
	addq	$128, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end0:
	.size	_Z17kmeans_clusteringPPfiiifPi, .Lfunc_end0-_Z17kmeans_clusteringPPfiiifPi
	.cfi_endproc
                                        # -- End function
	.type	.L.str,@object                  # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"iterated %d times\n"
	.size	.L.str, 19

	.ident	"clang version 16.0.0 (https://github.com/llvm/llvm-project.git 159fb378f779ac79f7d456ea233892ad526b56d8)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
	.addrsig_sym malloc
	.addrsig_sym calloc
	.addrsig_sym _Z10kmeansCudaPPfiiiPiS0_S1_S0_
	.addrsig_sym printf
	.addrsig_sym free

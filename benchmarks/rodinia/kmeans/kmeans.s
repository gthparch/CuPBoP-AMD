	.text
	.file	"kmeans.c"
	.globl	_Z5usagePc                      # -- Begin function _Z5usagePc
	.p2align	4, 0x90
	.type	_Z5usagePc,@function
_Z5usagePc:                             # @_Z5usagePc
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	leaq	.L.str(%rip), %rax
	movq	%rax, -16(%rbp)
	movq	stderr@GOTPCREL(%rip), %rax
	movq	(%rax), %rdi
	movq	-16(%rbp), %rsi
	movq	-8(%rbp), %rdx
	movb	$0, %al
	callq	fprintf@PLT
	movl	$4294967295, %edi               # imm = 0xFFFFFFFF
	callq	exit@PLT
.Lfunc_end0:
	.size	_Z5usagePc, .Lfunc_end0-_Z5usagePc
	.cfi_endproc
                                        # -- End function
	.section	.rodata.cst4,"aM",@progbits,4
	.p2align	2, 0x0                          # -- Begin function _Z5setupiPPc
.LCPI1_0:
	.long	0x3a83126f                      # float 0.00100000005
	.text
	.globl	_Z5setupiPPc
	.p2align	4, 0x90
	.type	_Z5setupiPPc,@function
_Z5setupiPPc:                           # @_Z5setupiPPc
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%rbx
	subq	$1192, %rsp                     # imm = 0x4A8
	.cfi_offset %rbx, -24
	movl	%edi, -12(%rbp)
	movq	%rsi, -24(%rbp)
	movq	$0, -40(%rbp)
	movl	$0, -1076(%rbp)
	movss	.LCPI1_0(%rip), %xmm0           # xmm0 = mem[0],zero,zero,zero
	movss	%xmm0, -1080(%rbp)
	movl	$5, -1084(%rbp)
	movl	$5, -1088(%rbp)
	movl	$0, -1092(%rbp)
	movl	$0, -1096(%rbp)
	movl	$0, -1100(%rbp)
	movq	$0, -1120(%rbp)
	movl	$1, -1136(%rbp)
	movl	$0, -1140(%rbp)
	movl	$0, -1148(%rbp)
.LBB1_1:                                # =>This Inner Loop Header: Depth=1
	movl	-12(%rbp), %edi
	movq	-24(%rbp), %rsi
	leaq	.L.str.1(%rip), %rdx
	callq	getopt@PLT
	movl	%eax, -28(%rbp)
	cmpl	$-1, %eax
	je	.LBB1_14
# %bb.2:                                #   in Loop: Header=BB1_1 Depth=1
	movl	-28(%rbp), %eax
	addl	$-63, %eax
	movl	%eax, %ecx
	movq	%rcx, -1168(%rbp)               # 8-byte Spill
	subl	$53, %eax
	ja	.LBB1_12
# %bb.80:                               #   in Loop: Header=BB1_1 Depth=1
	movq	-1168(%rbp), %rax               # 8-byte Reload
	leaq	.LJTI1_0(%rip), %rcx
	movslq	(%rcx,%rax,4), %rax
	addq	%rcx, %rax
	jmpq	*%rax
.LBB1_3:                                #   in Loop: Header=BB1_1 Depth=1
	movq	optarg@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	movq	%rax, -40(%rbp)
	jmp	.LBB1_13
.LBB1_4:                                #   in Loop: Header=BB1_1 Depth=1
	movl	$1, -1076(%rbp)
	jmp	.LBB1_13
.LBB1_5:                                #   in Loop: Header=BB1_1 Depth=1
	movq	optarg@GOTPCREL(%rip), %rax
	movq	(%rax), %rdi
	callq	atof@PLT
	cvtsd2ss	%xmm0, %xmm0
	movss	%xmm0, -1080(%rbp)
	jmp	.LBB1_13
.LBB1_6:                                #   in Loop: Header=BB1_1 Depth=1
	movq	optarg@GOTPCREL(%rip), %rax
	movq	(%rax), %rdi
	callq	atoi@PLT
	movl	%eax, -1084(%rbp)
	jmp	.LBB1_13
.LBB1_7:                                #   in Loop: Header=BB1_1 Depth=1
	movq	optarg@GOTPCREL(%rip), %rax
	movq	(%rax), %rdi
	callq	atoi@PLT
	movl	%eax, -1088(%rbp)
	jmp	.LBB1_13
.LBB1_8:                                #   in Loop: Header=BB1_1 Depth=1
	movl	$1, -1140(%rbp)
	jmp	.LBB1_13
.LBB1_9:                                #   in Loop: Header=BB1_1 Depth=1
	movl	$1, -1148(%rbp)
	jmp	.LBB1_13
.LBB1_10:                               #   in Loop: Header=BB1_1 Depth=1
	movq	optarg@GOTPCREL(%rip), %rax
	movq	(%rax), %rdi
	callq	atoi@PLT
	movl	%eax, -1136(%rbp)
	jmp	.LBB1_13
.LBB1_11:                               #   in Loop: Header=BB1_1 Depth=1
	movq	-24(%rbp), %rax
	movq	(%rax), %rdi
	callq	_Z5usagePc@PLT
	jmp	.LBB1_13
.LBB1_12:                               #   in Loop: Header=BB1_1 Depth=1
	movq	-24(%rbp), %rax
	movq	(%rax), %rdi
	callq	_Z5usagePc@PLT
.LBB1_13:                               #   in Loop: Header=BB1_1 Depth=1
	jmp	.LBB1_1
.LBB1_14:
	cmpq	$0, -40(%rbp)
	jne	.LBB1_16
# %bb.15:
	movq	-24(%rbp), %rax
	movq	(%rax), %rdi
	callq	_Z5usagePc@PLT
.LBB1_16:
	cmpl	$0, -1076(%rbp)
	je	.LBB1_24
# %bb.17:
	movq	-40(%rbp), %rdi
	xorl	%esi, %esi
	leaq	.L.str.2(%rip), %rdx
	movb	$0, %al
	callq	open@PLT
	movl	%eax, -1152(%rbp)
	cmpl	$-1, %eax
	jne	.LBB1_19
# %bb.18:
	movq	stderr@GOTPCREL(%rip), %rax
	movq	(%rax), %rdi
	movq	-40(%rbp), %rdx
	leaq	.L.str.3(%rip), %rsi
	movb	$0, %al
	callq	fprintf@PLT
	movl	$1, %edi
	callq	exit@PLT
.LBB1_19:
	movl	-1152(%rbp), %edi
	leaq	-1100(%rbp), %rsi
	movl	$4, %edx
	callq	read@PLT
	movl	-1152(%rbp), %edi
	leaq	-1096(%rbp), %rsi
	movl	$4, %edx
	callq	read@PLT
	movl	-1100(%rbp), %eax
	imull	-1096(%rbp), %eax
	movslq	%eax, %rdi
	shlq	$2, %rdi
	callq	malloc@PLT
	movq	%rax, -48(%rbp)
	movslq	-1100(%rbp), %rdi
	shlq	$3, %rdi
	callq	malloc@PLT
	movq	%rax, -1112(%rbp)
	movl	-1100(%rbp), %eax
	imull	-1096(%rbp), %eax
	movslq	%eax, %rdi
	shlq	$2, %rdi
	callq	malloc@PLT
	movq	%rax, %rcx
	movq	-1112(%rbp), %rax
	movq	%rcx, (%rax)
	movl	$1, -1124(%rbp)
.LBB1_20:                               # =>This Inner Loop Header: Depth=1
	movl	-1124(%rbp), %eax
	cmpl	-1100(%rbp), %eax
	jge	.LBB1_23
# %bb.21:                               #   in Loop: Header=BB1_20 Depth=1
	movq	-1112(%rbp), %rax
	movl	-1124(%rbp), %ecx
	subl	$1, %ecx
	movslq	%ecx, %rcx
	movq	(%rax,%rcx,8), %rdx
	movslq	-1096(%rbp), %rax
	shlq	$2, %rax
	addq	%rax, %rdx
	movq	-1112(%rbp), %rax
	movslq	-1124(%rbp), %rcx
	movq	%rdx, (%rax,%rcx,8)
# %bb.22:                               #   in Loop: Header=BB1_20 Depth=1
	movl	-1124(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -1124(%rbp)
	jmp	.LBB1_20
.LBB1_23:
	movl	-1152(%rbp), %edi
	movq	-48(%rbp), %rsi
	movl	-1100(%rbp), %eax
	imull	-1096(%rbp), %eax
	movslq	%eax, %rdx
	shlq	$2, %rdx
	callq	read@PLT
	movl	-1152(%rbp), %edi
	callq	close@PLT
	jmp	.LBB1_53
.LBB1_24:
	movq	-40(%rbp), %rdi
	leaq	.L.str.4(%rip), %rsi
	callq	fopen@PLT
	movq	%rax, -1160(%rbp)
	cmpq	$0, %rax
	jne	.LBB1_26
# %bb.25:
	movq	stderr@GOTPCREL(%rip), %rax
	movq	(%rax), %rdi
	movq	-40(%rbp), %rdx
	leaq	.L.str.3(%rip), %rsi
	movb	$0, %al
	callq	fprintf@PLT
	movl	$1, %edi
	callq	exit@PLT
.LBB1_26:
	jmp	.LBB1_27
.LBB1_27:                               # =>This Inner Loop Header: Depth=1
	leaq	-1072(%rbp), %rdi
	movq	-1160(%rbp), %rdx
	movl	$1024, %esi                     # imm = 0x400
	callq	fgets@PLT
	cmpq	$0, %rax
	je	.LBB1_31
# %bb.28:                               #   in Loop: Header=BB1_27 Depth=1
	leaq	-1072(%rbp), %rdi
	leaq	.L.str.5(%rip), %rsi
	callq	strtok@PLT
	cmpq	$0, %rax
	je	.LBB1_30
# %bb.29:                               #   in Loop: Header=BB1_27 Depth=1
	movl	-1100(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -1100(%rbp)
.LBB1_30:                               #   in Loop: Header=BB1_27 Depth=1
	jmp	.LBB1_27
.LBB1_31:
	movq	-1160(%rbp), %rdi
	callq	rewind@PLT
.LBB1_32:                               # =>This Inner Loop Header: Depth=1
	leaq	-1072(%rbp), %rdi
	movq	-1160(%rbp), %rdx
	movl	$1024, %esi                     # imm = 0x400
	callq	fgets@PLT
	cmpq	$0, %rax
	je	.LBB1_39
# %bb.33:                               #   in Loop: Header=BB1_32 Depth=1
	leaq	-1072(%rbp), %rdi
	leaq	.L.str.5(%rip), %rsi
	callq	strtok@PLT
	cmpq	$0, %rax
	je	.LBB1_38
# %bb.34:
	jmp	.LBB1_35
.LBB1_35:                               # =>This Inner Loop Header: Depth=1
	xorl	%eax, %eax
	movl	%eax, %edi
	leaq	.L.str.6(%rip), %rsi
	callq	strtok@PLT
	cmpq	$0, %rax
	je	.LBB1_37
# %bb.36:                               #   in Loop: Header=BB1_35 Depth=1
	movl	-1096(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -1096(%rbp)
	jmp	.LBB1_35
.LBB1_37:
	jmp	.LBB1_39
.LBB1_38:                               #   in Loop: Header=BB1_32 Depth=1
	jmp	.LBB1_32
.LBB1_39:
	movl	-1100(%rbp), %eax
	imull	-1096(%rbp), %eax
	movslq	%eax, %rdi
	shlq	$2, %rdi
	callq	malloc@PLT
	movq	%rax, -48(%rbp)
	movslq	-1100(%rbp), %rdi
	shlq	$3, %rdi
	callq	malloc@PLT
	movq	%rax, -1112(%rbp)
	movl	-1100(%rbp), %eax
	imull	-1096(%rbp), %eax
	movslq	%eax, %rdi
	shlq	$2, %rdi
	callq	malloc@PLT
	movq	%rax, %rcx
	movq	-1112(%rbp), %rax
	movq	%rcx, (%rax)
	movl	$1, -1124(%rbp)
.LBB1_40:                               # =>This Inner Loop Header: Depth=1
	movl	-1124(%rbp), %eax
	cmpl	-1100(%rbp), %eax
	jge	.LBB1_43
# %bb.41:                               #   in Loop: Header=BB1_40 Depth=1
	movq	-1112(%rbp), %rax
	movl	-1124(%rbp), %ecx
	subl	$1, %ecx
	movslq	%ecx, %rcx
	movq	(%rax,%rcx,8), %rdx
	movslq	-1096(%rbp), %rax
	shlq	$2, %rax
	addq	%rax, %rdx
	movq	-1112(%rbp), %rax
	movslq	-1124(%rbp), %rcx
	movq	%rdx, (%rax,%rcx,8)
# %bb.42:                               #   in Loop: Header=BB1_40 Depth=1
	movl	-1124(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -1124(%rbp)
	jmp	.LBB1_40
.LBB1_43:
	movq	-1160(%rbp), %rdi
	callq	rewind@PLT
	movl	$0, -1124(%rbp)
.LBB1_44:                               # =>This Loop Header: Depth=1
                                        #     Child Loop BB1_48 Depth 2
	leaq	-1072(%rbp), %rdi
	movq	-1160(%rbp), %rdx
	movl	$1024, %esi                     # imm = 0x400
	callq	fgets@PLT
	cmpq	$0, %rax
	je	.LBB1_52
# %bb.45:                               #   in Loop: Header=BB1_44 Depth=1
	leaq	-1072(%rbp), %rdi
	leaq	.L.str.5(%rip), %rsi
	callq	strtok@PLT
	cmpq	$0, %rax
	jne	.LBB1_47
# %bb.46:                               #   in Loop: Header=BB1_44 Depth=1
	jmp	.LBB1_44
.LBB1_47:                               #   in Loop: Header=BB1_44 Depth=1
	movl	$0, -1128(%rbp)
.LBB1_48:                               #   Parent Loop BB1_44 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	-1128(%rbp), %eax
	cmpl	-1096(%rbp), %eax
	jge	.LBB1_51
# %bb.49:                               #   in Loop: Header=BB1_48 Depth=2
	xorl	%eax, %eax
	movl	%eax, %edi
	leaq	.L.str.6(%rip), %rsi
	callq	strtok@PLT
	movq	%rax, %rdi
	callq	atof@PLT
	cvtsd2ss	%xmm0, %xmm0
	movq	-48(%rbp), %rax
	movslq	-1124(%rbp), %rcx
	movss	%xmm0, (%rax,%rcx,4)
	movl	-1124(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -1124(%rbp)
# %bb.50:                               #   in Loop: Header=BB1_48 Depth=2
	movl	-1128(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -1128(%rbp)
	jmp	.LBB1_48
.LBB1_51:                               #   in Loop: Header=BB1_44 Depth=1
	jmp	.LBB1_44
.LBB1_52:
	movq	-1160(%rbp), %rdi
	callq	fclose@PLT
.LBB1_53:
	leaq	.L.str.7(%rip), %rdi
	movb	$0, %al
	callq	printf@PLT
	movl	-1100(%rbp), %esi
	leaq	.L.str.8(%rip), %rdi
	movb	$0, %al
	callq	printf@PLT
	movl	-1096(%rbp), %esi
	leaq	.L.str.9(%rip), %rdi
	movb	$0, %al
	callq	printf@PLT
	movl	-1100(%rbp), %eax
	cmpl	-1088(%rbp), %eax
	jge	.LBB1_55
# %bb.54:
	movl	-1088(%rbp), %esi
	movl	-1100(%rbp), %edx
	leaq	.L.str.10(%rip), %rdi
	movb	$0, %al
	callq	printf@PLT
	xorl	%edi, %edi
	callq	exit@PLT
.LBB1_55:
	movl	$7, %edi
	callq	srand@PLT
	movq	-1112(%rbp), %rax
	movq	(%rax), %rdi
	movq	-48(%rbp), %rsi
	movl	-1100(%rbp), %eax
	imull	-1096(%rbp), %eax
	movslq	%eax, %rdx
	shlq	$2, %rdx
	callq	memcpy@PLT
	movq	-48(%rbp), %rdi
	callq	free@PLT
	movq	$0, -1120(%rbp)
	movl	-1100(%rbp), %edi
	movl	-1096(%rbp), %esi
	movq	-1112(%rbp), %rdx
	movl	-1088(%rbp), %ecx
	movl	-1084(%rbp), %r8d
	movss	-1080(%rbp), %xmm0              # xmm0 = mem[0],zero,zero,zero
	movl	-1140(%rbp), %r10d
	movl	-1136(%rbp), %eax
	leaq	-1092(%rbp), %r9
	leaq	-1120(%rbp), %rbx
	leaq	-1144(%rbp), %r11
	movq	%rbx, (%rsp)
	movq	%r11, 8(%rsp)
	movl	%r10d, 16(%rsp)
	movl	%eax, 24(%rsp)
	callq	_Z7clusteriiPPfiifPiPS0_S_ii@PLT
	movl	%eax, -1132(%rbp)
	movl	-1088(%rbp), %eax
	cmpl	-1084(%rbp), %eax
	jne	.LBB1_66
# %bb.56:
	cmpl	$1, -1148(%rbp)
	jne	.LBB1_66
# %bb.57:
	leaq	.L.str.11(%rip), %rdi
	movb	$0, %al
	callq	printf@PLT
	movl	$0, -1124(%rbp)
.LBB1_58:                               # =>This Loop Header: Depth=1
                                        #     Child Loop BB1_60 Depth 2
	movl	-1124(%rbp), %eax
	cmpl	-1084(%rbp), %eax
	jge	.LBB1_65
# %bb.59:                               #   in Loop: Header=BB1_58 Depth=1
	movl	-1124(%rbp), %esi
	leaq	.L.str.12(%rip), %rdi
	movb	$0, %al
	callq	printf@PLT
	movl	$0, -1128(%rbp)
.LBB1_60:                               #   Parent Loop BB1_58 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	-1128(%rbp), %eax
	cmpl	-1096(%rbp), %eax
	jge	.LBB1_63
# %bb.61:                               #   in Loop: Header=BB1_60 Depth=2
	movq	-1120(%rbp), %rax
	movslq	-1124(%rbp), %rcx
	movq	(%rax,%rcx,8), %rax
	movslq	-1128(%rbp), %rcx
	movss	(%rax,%rcx,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	cvtss2sd	%xmm0, %xmm0
	leaq	.L.str.13(%rip), %rdi
	movb	$1, %al
	callq	printf@PLT
# %bb.62:                               #   in Loop: Header=BB1_60 Depth=2
	movl	-1128(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -1128(%rbp)
	jmp	.LBB1_60
.LBB1_63:                               #   in Loop: Header=BB1_58 Depth=1
	leaq	.L.str.14(%rip), %rdi
	movb	$0, %al
	callq	printf@PLT
# %bb.64:                               #   in Loop: Header=BB1_58 Depth=1
	movl	-1124(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -1124(%rbp)
	jmp	.LBB1_58
.LBB1_65:
	jmp	.LBB1_66
.LBB1_66:
	movl	-1084(%rbp), %eax
	subl	-1088(%rbp), %eax
	addl	$1, %eax
	imull	-1136(%rbp), %eax
	cvtsi2ss	%eax, %xmm0
	movss	%xmm0, -1104(%rbp)
	movl	-1136(%rbp), %esi
	leaq	.L.str.15(%rip), %rdi
	movb	$0, %al
	callq	printf@PLT
	movl	-1088(%rbp), %eax
	cmpl	-1084(%rbp), %eax
	je	.LBB1_71
# %bb.67:
	cmpl	$1, -1136(%rbp)
	je	.LBB1_69
# %bb.68:
	movl	-1092(%rbp), %esi
	leaq	.L.str.16(%rip), %rdi
	movb	$0, %al
	callq	printf@PLT
	jmp	.LBB1_70
.LBB1_69:
	movl	-1092(%rbp), %esi
	leaq	.L.str.16(%rip), %rdi
	movb	$0, %al
	callq	printf@PLT
.LBB1_70:
	jmp	.LBB1_79
.LBB1_71:
	cmpl	$1, -1136(%rbp)
	je	.LBB1_75
# %bb.72:
	cmpl	$0, -1140(%rbp)
	je	.LBB1_74
# %bb.73:
	movss	-1144(%rbp), %xmm0              # xmm0 = mem[0],zero,zero,zero
	cvtss2sd	%xmm0, %xmm0
	movl	-1132(%rbp), %esi
	addl	$1, %esi
	leaq	.L.str.17(%rip), %rdi
	movb	$1, %al
	callq	printf@PLT
.LBB1_74:
	jmp	.LBB1_78
.LBB1_75:
	cmpl	$0, -1140(%rbp)
	je	.LBB1_77
# %bb.76:
	movss	-1144(%rbp), %xmm0              # xmm0 = mem[0],zero,zero,zero
	cvtss2sd	%xmm0, %xmm0
	leaq	.L.str.18(%rip), %rdi
	movb	$1, %al
	callq	printf@PLT
.LBB1_77:
	jmp	.LBB1_78
.LBB1_78:
	jmp	.LBB1_79
.LBB1_79:
	movq	-1112(%rbp), %rax
	movq	(%rax), %rdi
	callq	free@PLT
	movq	-1112(%rbp), %rdi
	callq	free@PLT
	xorl	%eax, %eax
	addq	$1192, %rsp                     # imm = 0x4A8
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end1:
	.size	_Z5setupiPPc, .Lfunc_end1-_Z5setupiPPc
	.cfi_endproc
	.section	.rodata,"a",@progbits
	.p2align	2, 0x0
.LJTI1_0:
	.long	.LBB1_11-.LJTI1_0
	.long	.LBB1_12-.LJTI1_0
	.long	.LBB1_12-.LJTI1_0
	.long	.LBB1_12-.LJTI1_0
	.long	.LBB1_12-.LJTI1_0
	.long	.LBB1_12-.LJTI1_0
	.long	.LBB1_12-.LJTI1_0
	.long	.LBB1_12-.LJTI1_0
	.long	.LBB1_12-.LJTI1_0
	.long	.LBB1_12-.LJTI1_0
	.long	.LBB1_12-.LJTI1_0
	.long	.LBB1_12-.LJTI1_0
	.long	.LBB1_12-.LJTI1_0
	.long	.LBB1_12-.LJTI1_0
	.long	.LBB1_12-.LJTI1_0
	.long	.LBB1_12-.LJTI1_0
	.long	.LBB1_12-.LJTI1_0
	.long	.LBB1_12-.LJTI1_0
	.long	.LBB1_12-.LJTI1_0
	.long	.LBB1_12-.LJTI1_0
	.long	.LBB1_12-.LJTI1_0
	.long	.LBB1_12-.LJTI1_0
	.long	.LBB1_12-.LJTI1_0
	.long	.LBB1_12-.LJTI1_0
	.long	.LBB1_12-.LJTI1_0
	.long	.LBB1_12-.LJTI1_0
	.long	.LBB1_12-.LJTI1_0
	.long	.LBB1_12-.LJTI1_0
	.long	.LBB1_12-.LJTI1_0
	.long	.LBB1_12-.LJTI1_0
	.long	.LBB1_12-.LJTI1_0
	.long	.LBB1_12-.LJTI1_0
	.long	.LBB1_12-.LJTI1_0
	.long	.LBB1_12-.LJTI1_0
	.long	.LBB1_12-.LJTI1_0
	.long	.LBB1_4-.LJTI1_0
	.long	.LBB1_12-.LJTI1_0
	.long	.LBB1_12-.LJTI1_0
	.long	.LBB1_12-.LJTI1_0
	.long	.LBB1_12-.LJTI1_0
	.long	.LBB1_12-.LJTI1_0
	.long	.LBB1_12-.LJTI1_0
	.long	.LBB1_3-.LJTI1_0
	.long	.LBB1_12-.LJTI1_0
	.long	.LBB1_12-.LJTI1_0
	.long	.LBB1_10-.LJTI1_0
	.long	.LBB1_6-.LJTI1_0
	.long	.LBB1_7-.LJTI1_0
	.long	.LBB1_9-.LJTI1_0
	.long	.LBB1_12-.LJTI1_0
	.long	.LBB1_12-.LJTI1_0
	.long	.LBB1_8-.LJTI1_0
	.long	.LBB1_12-.LJTI1_0
	.long	.LBB1_5-.LJTI1_0
                                        # -- End function
	.type	.L.str,@object                  # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"\nUsage: %s [switches] -i filename\n\n    -i filename      :file containing data to be clustered\n    -m max_nclusters :maximum number of clusters allowed    [default=5]\n    -n min_nclusters :minimum number of clusters allowed    [default=5]\n    -t threshold     :threshold value                       [default=0.001]\n    -l nloops        :iteration for each number of clusters [default=1]\n    -b               :input file is in binary format\n    -r               :calculate RMSE                        [default=off]\n    -o               :output cluster center coordinates     [default=off]\n"
	.size	.L.str, 588

	.type	.L.str.1,@object                # @.str.1
.L.str.1:
	.asciz	"i:t:m:n:l:bro"
	.size	.L.str.1, 14

	.type	.L.str.2,@object                # @.str.2
.L.str.2:
	.asciz	"0600"
	.size	.L.str.2, 5

	.type	.L.str.3,@object                # @.str.3
.L.str.3:
	.asciz	"Error: no such file (%s)\n"
	.size	.L.str.3, 26

	.type	.L.str.4,@object                # @.str.4
.L.str.4:
	.asciz	"r"
	.size	.L.str.4, 2

	.type	.L.str.5,@object                # @.str.5
.L.str.5:
	.asciz	" \t\n"
	.size	.L.str.5, 4

	.type	.L.str.6,@object                # @.str.6
.L.str.6:
	.asciz	" ,\t\n"
	.size	.L.str.6, 5

	.type	.L.str.7,@object                # @.str.7
.L.str.7:
	.asciz	"\nI/O completed\n"
	.size	.L.str.7, 16

	.type	.L.str.8,@object                # @.str.8
.L.str.8:
	.asciz	"\nNumber of objects: %d\n"
	.size	.L.str.8, 24

	.type	.L.str.9,@object                # @.str.9
.L.str.9:
	.asciz	"Number of features: %d\n"
	.size	.L.str.9, 24

	.type	.L.str.10,@object               # @.str.10
.L.str.10:
	.asciz	"Error: min_nclusters(%d) > npoints(%d) -- cannot proceed\n"
	.size	.L.str.10, 58

	.type	.L.str.11,@object               # @.str.11
.L.str.11:
	.asciz	"\n================= Centroid Coordinates =================\n"
	.size	.L.str.11, 59

	.type	.L.str.12,@object               # @.str.12
.L.str.12:
	.asciz	"%d:"
	.size	.L.str.12, 4

	.type	.L.str.13,@object               # @.str.13
.L.str.13:
	.asciz	" %.2f"
	.size	.L.str.13, 6

	.type	.L.str.14,@object               # @.str.14
.L.str.14:
	.asciz	"\n\n"
	.size	.L.str.14, 3

	.type	.L.str.15,@object               # @.str.15
.L.str.15:
	.asciz	"Number of Iteration: %d\n"
	.size	.L.str.15, 25

	.type	.L.str.16,@object               # @.str.16
.L.str.16:
	.asciz	"Best number of clusters is %d\n"
	.size	.L.str.16, 31

	.type	.L.str.17,@object               # @.str.17
.L.str.17:
	.asciz	"Number of trials to approach the best RMSE of %.3f is %d\n"
	.size	.L.str.17, 58

	.type	.L.str.18,@object               # @.str.18
.L.str.18:
	.asciz	"Root Mean Squared Error: %.3f\n"
	.size	.L.str.18, 31

	.ident	"clang version 16.0.0 (https://github.com/llvm/llvm-project.git 159fb378f779ac79f7d456ea233892ad526b56d8)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
	.addrsig_sym _Z5usagePc
	.addrsig_sym fprintf
	.addrsig_sym exit
	.addrsig_sym getopt
	.addrsig_sym atof
	.addrsig_sym atoi
	.addrsig_sym open
	.addrsig_sym read
	.addrsig_sym malloc
	.addrsig_sym close
	.addrsig_sym fopen
	.addrsig_sym fgets
	.addrsig_sym strtok
	.addrsig_sym rewind
	.addrsig_sym fclose
	.addrsig_sym printf
	.addrsig_sym srand
	.addrsig_sym free
	.addrsig_sym _Z7clusteriiPPfiifPiPS0_S_ii
	.addrsig_sym stderr
	.addrsig_sym optarg

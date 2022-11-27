	.text
	.file	"main.cu"
	.globl	_Z20__device_stub__emptyPi      # -- Begin function _Z20__device_stub__emptyPi
	.p2align	4, 0x90
	.type	_Z20__device_stub__emptyPi,@function
_Z20__device_stub__emptyPi:             # @_Z20__device_stub__emptyPi
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$112, %rsp
	movq	%rdi, -8(%rbp)
	leaq	-8(%rbp), %rax
	movq	%rax, -96(%rbp)
	leaq	-24(%rbp), %rdi
	leaq	-40(%rbp), %rsi
	leaq	-48(%rbp), %rdx
	leaq	-56(%rbp), %rcx
	callq	__cudaPopCallConfiguration@PLT
	movq	-48(%rbp), %r10
	movq	-56(%rbp), %rax
	movq	-24(%rbp), %rcx
	movq	%rcx, -72(%rbp)
	movl	-16(%rbp), %ecx
	movl	%ecx, -64(%rbp)
	movq	-72(%rbp), %rsi
	movl	-64(%rbp), %edx
	movq	-40(%rbp), %rcx
	movq	%rcx, -88(%rbp)
	movl	-32(%rbp), %ecx
	movl	%ecx, -80(%rbp)
	movq	-88(%rbp), %rcx
	movl	-80(%rbp), %r8d
	leaq	_Z20__device_stub__emptyPi(%rip), %rdi
	leaq	-96(%rbp), %r9
	movq	%r10, (%rsp)
	movq	%rax, 8(%rsp)
	callq	cudaLaunchKernel@PLT
# %bb.1:
	addq	$112, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end0:
	.size	_Z20__device_stub__emptyPi, .Lfunc_end0-_Z20__device_stub__emptyPi
	.cfi_endproc
                                        # -- End function
	.globl	main                            # -- Begin function main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$864, %rsp                      # imm = 0x360
	movl	$0, -4(%rbp)
	movl	%edi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	leaq	.L.str(%rip), %rdi
	movb	$0, %al
	callq	printf@PLT
	leaq	-20(%rbp), %rdi
	callq	cudaGetDevice@PLT
	movl	-20(%rbp), %esi
	leaq	-752(%rbp), %rdi
	callq	cudaGetDeviceProperties@PLT
	movl	$1, -756(%rbp)
	movslq	-756(%rbp), %rax
	shlq	$2, %rax
	movq	%rax, -784(%rbp)
	movq	-784(%rbp), %rdi
	callq	malloc@PLT
	movq	%rax, -768(%rbp)
	movq	-784(%rbp), %rsi
	leaq	-776(%rbp), %rdi
	callq	_ZL10cudaMallocIiE9cudaErrorPPT_m
	movl	$0, -788(%rbp)
.LBB1_1:                                # =>This Inner Loop Header: Depth=1
	movl	-788(%rbp), %eax
	cmpl	-756(%rbp), %eax
	jge	.LBB1_4
# %bb.2:                                #   in Loop: Header=BB1_1 Depth=1
	movq	-768(%rbp), %rax
	movslq	-788(%rbp), %rcx
	movl	$0, (%rax,%rcx,4)
# %bb.3:                                #   in Loop: Header=BB1_1 Depth=1
	movl	-788(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -788(%rbp)
	jmp	.LBB1_1
.LBB1_4:
	movq	-776(%rbp), %rdi
	movq	-768(%rbp), %rsi
	movq	-784(%rbp), %rdx
	movl	$1, %ecx
	callq	cudaMemcpy@PLT
	movl	$1024, -792(%rbp)               # imm = 0x400
	cvtsi2ssl	-756(%rbp), %xmm0
	cvtsi2ssl	-792(%rbp), %xmm1
	divss	%xmm1, %xmm0
	cvtss2sd	%xmm0, %xmm0
	callq	ceil@PLT
	cvttsd2si	%xmm0, %eax
	movl	%eax, -796(%rbp)
	movl	-796(%rbp), %esi
	leaq	-808(%rbp), %rdi
	movl	$1, %ecx
	movl	%ecx, %edx
	callq	_ZN4dim3C2Ejjj
	movl	-792(%rbp), %esi
	leaq	-824(%rbp), %rdi
	movl	$1, %ecx
	movl	%ecx, %edx
	callq	_ZN4dim3C2Ejjj
	movq	-808(%rbp), %rax
	movq	%rax, -840(%rbp)
	movl	-800(%rbp), %eax
	movl	%eax, -832(%rbp)
	movq	-840(%rbp), %rdi
	movl	-832(%rbp), %esi
	movq	-824(%rbp), %rax
	movq	%rax, -856(%rbp)
	movl	-816(%rbp), %eax
	movl	%eax, -848(%rbp)
	movq	-856(%rbp), %rdx
	movl	-848(%rbp), %ecx
	xorl	%eax, %eax
	movl	%eax, %r9d
	movq	%r9, %r8
	callq	__cudaPushCallConfiguration@PLT
	cmpl	$0, %eax
	jne	.LBB1_6
# %bb.5:
	movq	-776(%rbp), %rdi
	callq	_Z20__device_stub__emptyPi
.LBB1_6:
	movq	-768(%rbp), %rdi
	movq	-776(%rbp), %rsi
	movq	-784(%rbp), %rdx
	movl	$2, %ecx
	callq	cudaMemcpy@PLT
	movq	-768(%rbp), %rax
	cmpl	$10, (%rax)
	jne	.LBB1_8
# %bb.7:
	leaq	.L.str.1(%rip), %rdi
	movb	$0, %al
	callq	printf@PLT
.LBB1_8:
	movq	-776(%rbp), %rdi
	callq	cudaFree@PLT
	movq	-768(%rbp), %rdi
	callq	free@PLT
	xorl	%eax, %eax
	addq	$864, %rsp                      # imm = 0x360
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end1:
	.size	main, .Lfunc_end1-main
	.cfi_endproc
                                        # -- End function
	.p2align	4, 0x90                         # -- Begin function _ZL10cudaMallocIiE9cudaErrorPPT_m
	.type	_ZL10cudaMallocIiE9cudaErrorPPT_m,@function
_ZL10cudaMallocIiE9cudaErrorPPT_m:      # @_ZL10cudaMallocIiE9cudaErrorPPT_m
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	-8(%rbp), %rdi
	movq	-16(%rbp), %rsi
	callq	cudaMalloc@PLT
	addq	$16, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end2:
	.size	_ZL10cudaMallocIiE9cudaErrorPPT_m, .Lfunc_end2-_ZL10cudaMallocIiE9cudaErrorPPT_m
	.cfi_endproc
                                        # -- End function
	.section	.text._ZN4dim3C2Ejjj,"axG",@progbits,_ZN4dim3C2Ejjj,comdat
	.weak	_ZN4dim3C2Ejjj                  # -- Begin function _ZN4dim3C2Ejjj
	.p2align	4, 0x90
	.type	_ZN4dim3C2Ejjj,@function
_ZN4dim3C2Ejjj:                         # @_ZN4dim3C2Ejjj
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movq	%rdi, -8(%rbp)
	movl	%esi, -12(%rbp)
	movl	%edx, -16(%rbp)
	movl	%ecx, -20(%rbp)
	movq	-8(%rbp), %rax
	movl	-12(%rbp), %ecx
	movl	%ecx, (%rax)
	movl	-16(%rbp), %ecx
	movl	%ecx, 4(%rax)
	movl	-20(%rbp), %ecx
	movl	%ecx, 8(%rax)
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end3:
	.size	_ZN4dim3C2Ejjj, .Lfunc_end3-_ZN4dim3C2Ejjj
	.cfi_endproc
                                        # -- End function
	.text
	.p2align	4, 0x90                         # -- Begin function __cuda_register_globals
	.type	__cuda_register_globals,@function
__cuda_register_globals:                # @__cuda_register_globals
	.cfi_startproc
# %bb.0:
	subq	$40, %rsp
	.cfi_def_cfa_offset 48
	leaq	_Z20__device_stub__emptyPi(%rip), %rsi
	leaq	.L__unnamed_1(%rip), %rcx
	movl	$4294967295, %r8d               # imm = 0xFFFFFFFF
	xorl	%eax, %eax
	movl	%eax, %r9d
	movq	%rcx, %rdx
	movq	$0, (%rsp)
	movq	$0, 8(%rsp)
	movq	$0, 16(%rsp)
	movq	$0, 24(%rsp)
	callq	__cudaRegisterFunction@PLT
	addq	$40, %rsp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end4:
	.size	__cuda_register_globals, .Lfunc_end4-__cuda_register_globals
	.cfi_endproc
                                        # -- End function
	.p2align	4, 0x90                         # -- Begin function __cuda_module_ctor
	.type	__cuda_module_ctor,@function
__cuda_module_ctor:                     # @__cuda_module_ctor
	.cfi_startproc
# %bb.0:
	pushq	%rax
	.cfi_def_cfa_offset 16
	leaq	__cuda_fatbin_wrapper(%rip), %rdi
	callq	__cudaRegisterFatBinary@PLT
	movq	%rax, %rdi
	movq	%rdi, (%rsp)                    # 8-byte Spill
	movq	%rdi, __cuda_gpubin_handle(%rip)
	callq	__cuda_register_globals
	movq	(%rsp), %rdi                    # 8-byte Reload
	callq	__cudaRegisterFatBinaryEnd@PLT
	leaq	__cuda_module_dtor(%rip), %rdi
	callq	atexit@PLT
	popq	%rax
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end5:
	.size	__cuda_module_ctor, .Lfunc_end5-__cuda_module_ctor
	.cfi_endproc
                                        # -- End function
	.p2align	4, 0x90                         # -- Begin function __cuda_module_dtor
	.type	__cuda_module_dtor,@function
__cuda_module_dtor:                     # @__cuda_module_dtor
	.cfi_startproc
# %bb.0:
	pushq	%rax
	.cfi_def_cfa_offset 16
	movq	__cuda_gpubin_handle(%rip), %rdi
	callq	__cudaUnregisterFatBinary@PLT
	popq	%rax
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end6:
	.size	__cuda_module_dtor, .Lfunc_end6-__cuda_module_dtor
	.cfi_endproc
                                        # -- End function
	.type	.L.str,@object                  # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"Testing main"
	.size	.L.str, 13

	.type	.L.str.1,@object                # @.str.1
.L.str.1:
	.asciz	"correct \n"
	.size	.L.str.1, 10

	.type	.L__unnamed_1,@object           # @0
.L__unnamed_1:
	.asciz	"_Z5emptyPi"
	.size	.L__unnamed_1, 11

	.type	.L__unnamed_2,@object           # @1
	.section	.nv_fatbin,"a",@progbits
	.p2align	3, 0x0
.L__unnamed_2:
	.asciz	"P\355U\272\001\000\020\000\220\n\000\000\000\000\000\000\002\000\001\001@\000\000\000\300\b\000\000\000\000\000\000\000\000\000\000\000\000\000\000\007\000\001\000#\000\000\000\000\000\000\000\000\000\000\000\021\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\177ELF\002\001\0013\007\000\000\000\000\000\000\000\002\000\276\000s\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\200\006\000\000\000\000\000\000#\005#\000@\000\000\000\000\000@\000\t\000\001\000\000.shstrtab\000.strtab\000.symtab\000.symtab_shndx\000.nv.info\000.text._Z5emptyPi\000.nv.info._Z5emptyPi\000.nv.shared._Z5emptyPi\000.nv.constant0._Z5emptyPi\000.nv.rel.action\000\000.shstrtab\000.strtab\000.symtab\000.symtab_shndx\000.nv.info\000_Z5emptyPi\000.text._Z5emptyPi\000.nv.info._Z5emptyPi\000.nv.shared._Z5emptyPi\000.nv.constant0._Z5emptyPi\000_param\000.nv.rel.action\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000=\000\000\000\003\000\b\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000x\000\000\000\003\000\007\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\230\000\000\000\003\000\006\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\0002\000\000\000\022\020\b\000\000\000\000\000\000\000\000\000\000\002\000\000\000\000\000\000\004/\b\000\004\000\000\000\b\000\000\000\004#\b\000\004\000\000\000\000\000\000\000\004\022\b\000\004\000\000\000\b\000\000\000\004\021\b\000\004\000\000\000\b\000\000\000\0047\004\000s\000\000\000\004\n\b\000\002\000\000\000@\001\b\000\003\031\b\000\004\027\f\000\000\000\000\000\000\000\000\000\000\360!\000\003\033\377\000\004\034\004\000\270\001\000\000\000\000\000\000K\000\000\000\000\000\000\000\000\002\002\b\020\n/\"\000\000\000\b\000\000\000\000\000\000\b\b\000\000\000\000\000\000\020\b\000\000\000\000\000\000\030\b\000\000\000\000\000\000 \b\000\000\000\000\000\000(\b\000\000\000\000\000\0000\b\000\000\000\000\000\0008\b\000\000\000\000\001\000\000\b\000\000\000\000\001\000\b\b\000\000\000\000\001\000\020\b\000\000\000\000\001\000\030\b\000\000\000\000\001\000 \b\000\000\000\000\001\000(\b\000\000\000\000\001\0000\b\000\000\000\000\001\0008\b\000\000\000\000\002\000\000\b\000\000\000\000\002\000\b\b\000\000\000\000\002\000\020\b\000\000\000\000\002\000\030\b\000\000\000\000\002\000 \b\000\000\000\000\002\000(\b\000\000\000\000\002\0000\b\000\000\000\000\002\0008\b\000\000\000\000\000\000\000\024,\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\274\000\000\000\274\274\000\b\006\000\234\b\000<\300d\005\004\034\374\377\377\177@\002\000\234\033\000\000@\206\036\004\034\000\000\034`\333<\000\000\004\000\000\000\022\000\003\200\000\000\000\000\000\002\004\234\177\000\000\200\340\000\000\000\000\000\000\000\b\002(\034\000\000\000\000\346\n\000\034\000\000<\300\344\016\000\234\177\000<\300\344\002\000\034\001\000<\300\344\n\000\234\001\000<\300\344\002\000\034\000\000<\300\344\n\000\034\001\000<\300\344\274\000\000\000\000\274\000\b\032\000\234\004\000<\300d\036\000\234\177\000<\300\344\032\000\034\003\000\020\000\342\036\b\234\003\000\020\000\342\n\300\037\240\000\000\000t\n\b\034\000\000\000\250|\002\000\034\001\000<\300\344\000\000\000\000\000\000\000\b\016\000\234\001\000<\300\344\n\000\034\000\000<\300\344\016\000\234\001\000<\300\344\n\000\034\001\000<\300\344\016\000\234\001\000<\300\344\n\000\034\001\000<\300\344\016\000\234\001\000<\300\344\000\000\000\000\000\000\000\b\n\000\034\001\000<\300\344\016\000\234\001\000<\300\344\022\030\234\177\000\000\204\340\026\034\234\177\000@\200\340\022\000\034\002\000<\300\344\026\000\234\002\000<\300\344\022\000\034\002\000<\300\344\000\000\000\000\000\000\000\b\026\000\234\002\000<\300\344\b\020\034\000\000\000\200\345\022\030\234\177\000\000\204\340\026\034\234\177\000@\200\340\022\000\034\002\000<\300\344\026\000\234\002\000<\300\344\022\000\034\002\000<\300\344\000\000\000\000\000\000\274\b\026\000\234\002\000<\300\344\b\020\034\000\000\000\200\305\002\300\037\005\000\000\000t\n\000\034\001\000<\300\344\016\000\234\001\000<\300\344\000\b\034\000\000\000\200\344<\000\034\000\000\000\000\030<\000\034\374\377\177\000\022\002<\034\000\000\000\200\205\002<\034\000\000\000\200\205\002<\034\000\000\000\200\205\002<\034\000\000\000\200\205\002<\034\000\000\000\200\205\002<\034\000\000\000\200\205\002<\034\000\000\000\200\205\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\001\000\000\000\003\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000@\000\000\000\000\000\000\000\225\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\001\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\013\000\000\000\003\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\325\000\000\000\000\000\000\000\247\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\001\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\023\000\000\000\002\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\200\001\000\000\000\000\000\000x\000\000\000\000\000\000\000\002\000\000\000\004\000\000\000\b\000\000\000\000\000\000\000\030\000\000\000\000\000\000\000)\000\000\000\000\000\000p\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\370\001\000\000\000\000\000\0000\000\000\000\000\000\000\000\003\000\000\000\000\000\000\000\004\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000C\000\000\000\000\000\000p\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000(\002\000\000\000\000\000\0004\000\000\000\000\000\000\000\003\000\000\000\b\000\000\000\004\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\206\000\000\000\013\000\000p\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000`\002\000\000\000\000\000\000\330\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\b\000\000\000\000\000\000\000\b\000\000\000\000\000\000\000m\000\000\000\001\000\000\000\002\000\000\000\000\000\000\000\000\000\000\000\000\000\000\0008\003\000\000\000\000\000\000H\001\000\000\000\000\000\000\000\000\000\000\b\000\000\000\004\000\000\000\000\000\000\000\000\000\000\000\000\000\000\0002\000\000\000\001\000\000\000\006\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\200\004\000\000\000\000\000\000\000\002\000\000\000\000\000\000\003\000\000\000\004\000\000\b@\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\001\000\001\001H\000\000\000H\001\000\000\000\000\000\000E\001\000\000@\000\000\000\005\000\007\000#\000\000\000\000\000\000\000\000\000\000\000\021 \000\000\000\000\000\000\000\000\000\000\000\000\000\000\322\001\000\000\000\000\000\000\000\000\000\000\000\000\000\000\362 \n\n\n\n.version 7.5\n.target sm_35\n.address_size 64/\000\367\026isible .entry _Z5emptyPi(\n.param .u64\030\000\021_\026\000\361\016_0\n)\n{\n.local .align 8 .b8 __\025\000\373\n_depot0[8];\n.reg .b64 %SP\017\000\025L\020\000\21132 %r<2>!\000\323rd<5>;\n\nmov.u2\000\033,d\000b;\ncvta\214\000\004%\000\023,\\\000\"ld\307\000\002\030\000nrd1, [\315\000\023]C\000tto.globG\000Ard2,5\000\003\037\000\n\034\000\0213\034\000Q2;\nst\023\000q[%SP+0]\026\000\0213z\000\003)\000$4,\034\000\022;\310\000\001\352\000R1, 10=\000@32 [(\000\001<\000\3001;\nret;\n\n}\n\000\000\000\000"
	.size	.L__unnamed_2, 2721

	.type	__cuda_fatbin_wrapper,@object   # @__cuda_fatbin_wrapper
	.section	.nvFatBinSegment,"aw",@progbits
	.p2align	3, 0x90
__cuda_fatbin_wrapper:
	.long	1180844977                      # 0x466243b1
	.long	1                               # 0x1
	.quad	.L__unnamed_2
	.quad	0
	.size	__cuda_fatbin_wrapper, 24

	.type	__cuda_gpubin_handle,@object    # @__cuda_gpubin_handle
	.local	__cuda_gpubin_handle
	.comm	__cuda_gpubin_handle,8,8
	.section	.init_array,"aw",@init_array
	.p2align	3, 0x90
	.quad	__cuda_module_ctor
	.ident	"clang version 16.0.0 (https://github.com/llvm/llvm-project.git 159fb378f779ac79f7d456ea233892ad526b56d8)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
	.addrsig_sym _Z20__device_stub__emptyPi
	.addrsig_sym __cudaPopCallConfiguration
	.addrsig_sym cudaLaunchKernel
	.addrsig_sym printf
	.addrsig_sym cudaGetDevice
	.addrsig_sym cudaGetDeviceProperties
	.addrsig_sym malloc
	.addrsig_sym _ZL10cudaMallocIiE9cudaErrorPPT_m
	.addrsig_sym cudaMemcpy
	.addrsig_sym __cudaPushCallConfiguration
	.addrsig_sym cudaFree
	.addrsig_sym free
	.addrsig_sym cudaMalloc
	.addrsig_sym __cuda_register_globals
	.addrsig_sym __cudaRegisterFunction
	.addrsig_sym __cudaRegisterFatBinary
	.addrsig_sym __cuda_module_ctor
	.addrsig_sym __cudaRegisterFatBinaryEnd
	.addrsig_sym __cudaUnregisterFatBinary
	.addrsig_sym __cuda_module_dtor
	.addrsig_sym atexit
	.addrsig_sym .L__unnamed_2
	.addrsig_sym __cuda_fatbin_wrapper
	.addrsig_sym __cuda_gpubin_handle

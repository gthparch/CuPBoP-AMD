	.text
	.file	"kmeans_cuda.cu"
	.section	.text.startup,"ax",@progbits
	.p2align	4, 0x90                         # -- Begin function __cxx_global_var_init
	.type	__cxx_global_var_init,@function
__cxx_global_var_init:                  # @__cxx_global_var_init
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	leaq	t_features(%rip), %rdi
	xorl	%esi, %esi
	xorl	%edx, %edx
	movl	$1, %ecx
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	jmp	_ZN7textureIfLi1EL19cudaTextureReadMode0EEC2Ei21cudaTextureFilterMode22cudaTextureAddressMode@PLT # TAILCALL
.Lfunc_end0:
	.size	__cxx_global_var_init, .Lfunc_end0-__cxx_global_var_init
	.cfi_endproc
                                        # -- End function
	.section	.text._ZN7textureIfLi1EL19cudaTextureReadMode0EEC2Ei21cudaTextureFilterMode22cudaTextureAddressMode,"axG",@progbits,_ZN7textureIfLi1EL19cudaTextureReadMode0EEC2Ei21cudaTextureFilterMode22cudaTextureAddressMode,comdat
	.weak	_ZN7textureIfLi1EL19cudaTextureReadMode0EEC2Ei21cudaTextureFilterMode22cudaTextureAddressMode # -- Begin function _ZN7textureIfLi1EL19cudaTextureReadMode0EEC2Ei21cudaTextureFilterMode22cudaTextureAddressMode
	.p2align	4, 0x90
	.type	_ZN7textureIfLi1EL19cudaTextureReadMode0EEC2Ei21cudaTextureFilterMode22cudaTextureAddressMode,@function
_ZN7textureIfLi1EL19cudaTextureReadMode0EEC2Ei21cudaTextureFilterMode22cudaTextureAddressMode: # @_ZN7textureIfLi1EL19cudaTextureReadMode0EEC2Ei21cudaTextureFilterMode22cudaTextureAddressMode
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%rbx
	subq	$56, %rsp
	.cfi_offset %rbx, -24
	movq	%rdi, -32(%rbp)
	movl	%esi, -20(%rbp)
	movl	%edx, -16(%rbp)
	movl	%ecx, -12(%rbp)
	movq	-32(%rbp), %rbx
	movl	-20(%rbp), %eax
	movl	%eax, (%rbx)
	movl	-16(%rbp), %eax
	movl	%eax, 4(%rbx)
	movl	-12(%rbp), %eax
	movl	%eax, 8(%rbx)
	movl	-12(%rbp), %eax
	movl	%eax, 12(%rbx)
	movl	-12(%rbp), %eax
	movl	%eax, 16(%rbx)
	leaq	-56(%rbp), %rdi
	callq	_Z21cudaCreateChannelDescIfE21cudaChannelFormatDescv@PLT
	movq	-56(%rbp), %rax
	movq	%rax, 20(%rbx)
	movq	-48(%rbp), %rax
	movq	%rax, 28(%rbx)
	movl	-40(%rbp), %eax
	movl	%eax, 36(%rbx)
	movl	$0, 40(%rbx)
	addq	$56, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end1:
	.size	_ZN7textureIfLi1EL19cudaTextureReadMode0EEC2Ei21cudaTextureFilterMode22cudaTextureAddressMode, .Lfunc_end1-_ZN7textureIfLi1EL19cudaTextureReadMode0EEC2Ei21cudaTextureFilterMode22cudaTextureAddressMode
	.cfi_endproc
                                        # -- End function
	.section	.text.startup,"ax",@progbits
	.p2align	4, 0x90                         # -- Begin function __cxx_global_var_init.1
	.type	__cxx_global_var_init.1,@function
__cxx_global_var_init.1:                # @__cxx_global_var_init.1
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	leaq	t_features_flipped(%rip), %rdi
	xorl	%esi, %esi
	xorl	%edx, %edx
	movl	$1, %ecx
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	jmp	_ZN7textureIfLi1EL19cudaTextureReadMode0EEC2Ei21cudaTextureFilterMode22cudaTextureAddressMode@PLT # TAILCALL
.Lfunc_end2:
	.size	__cxx_global_var_init.1, .Lfunc_end2-__cxx_global_var_init.1
	.cfi_endproc
                                        # -- End function
	.p2align	4, 0x90                         # -- Begin function __cxx_global_var_init.2
	.type	__cxx_global_var_init.2,@function
__cxx_global_var_init.2:                # @__cxx_global_var_init.2
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	leaq	t_clusters(%rip), %rdi
	xorl	%esi, %esi
	xorl	%edx, %edx
	movl	$1, %ecx
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	jmp	_ZN7textureIfLi1EL19cudaTextureReadMode0EEC2Ei21cudaTextureFilterMode22cudaTextureAddressMode@PLT # TAILCALL
.Lfunc_end3:
	.size	__cxx_global_var_init.2, .Lfunc_end3-__cxx_global_var_init.2
	.cfi_endproc
                                        # -- End function
	.text
	.globl	_Z29__device_stub__invert_mappingPfS_ii # -- Begin function _Z29__device_stub__invert_mappingPfS_ii
	.p2align	4, 0x90
	.type	_Z29__device_stub__invert_mappingPfS_ii,@function
_Z29__device_stub__invert_mappingPfS_ii: # @_Z29__device_stub__invert_mappingPfS_ii
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$160, %rsp
	movq	%rdi, -104(%rbp)
	movq	%rsi, -96(%rbp)
	movl	%edx, -8(%rbp)
	movl	%ecx, -4(%rbp)
	leaq	-104(%rbp), %rax
	movq	%rax, -144(%rbp)
	leaq	-96(%rbp), %rax
	movq	%rax, -136(%rbp)
	leaq	-8(%rbp), %rax
	movq	%rax, -128(%rbp)
	leaq	-4(%rbp), %rax
	movq	%rax, -120(%rbp)
	leaq	-88(%rbp), %rdi
	leaq	-72(%rbp), %rsi
	leaq	-56(%rbp), %rdx
	leaq	-48(%rbp), %rcx
	callq	__cudaPopCallConfiguration@PLT
	movq	-56(%rbp), %rax
	movq	-48(%rbp), %r10
	movq	-88(%rbp), %rcx
	movq	%rcx, -40(%rbp)
	movl	-80(%rbp), %ecx
	movl	%ecx, -32(%rbp)
	movq	-40(%rbp), %rsi
	movl	-32(%rbp), %edx
	movq	-72(%rbp), %rcx
	movq	%rcx, -24(%rbp)
	movl	-64(%rbp), %ecx
	movl	%ecx, -16(%rbp)
	movq	-24(%rbp), %rcx
	movl	-16(%rbp), %r8d
	movq	_Z29__device_stub__invert_mappingPfS_ii@GOTPCREL(%rip), %rdi
	leaq	-144(%rbp), %r9
	movq	%rax, (%rsp)
	movq	%r10, 8(%rsp)
	callq	cudaLaunchKernel@PLT
# %bb.1:
	addq	$160, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end4:
	.size	_Z29__device_stub__invert_mappingPfS_ii, .Lfunc_end4-_Z29__device_stub__invert_mappingPfS_ii
	.cfi_endproc
                                        # -- End function
	.globl	_Z26__device_stub__kmeansPointPfiiiPiS_S_S0_ # -- Begin function _Z26__device_stub__kmeansPointPfiiiPiS_S_S0_
	.p2align	4, 0x90
	.type	_Z26__device_stub__kmeansPointPfiiiPiS_S_S0_,@function
_Z26__device_stub__kmeansPointPfiiiPiS_S_S0_: # @_Z26__device_stub__kmeansPointPfiiiPiS_S_S0_
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$208, %rsp
	movq	24(%rbp), %rax
	movq	16(%rbp), %rax
	movq	%rdi, -120(%rbp)
	movl	%esi, -12(%rbp)
	movl	%edx, -8(%rbp)
	movl	%ecx, -4(%rbp)
	movq	%r8, -112(%rbp)
	movq	%r9, -104(%rbp)
	leaq	-120(%rbp), %rax
	movq	%rax, -192(%rbp)
	leaq	-12(%rbp), %rax
	movq	%rax, -184(%rbp)
	leaq	-8(%rbp), %rax
	movq	%rax, -176(%rbp)
	leaq	-4(%rbp), %rax
	movq	%rax, -168(%rbp)
	leaq	-112(%rbp), %rax
	movq	%rax, -160(%rbp)
	leaq	-104(%rbp), %rax
	movq	%rax, -152(%rbp)
	leaq	16(%rbp), %rax
	movq	%rax, -144(%rbp)
	leaq	24(%rbp), %rax
	movq	%rax, -136(%rbp)
	leaq	-96(%rbp), %rdi
	leaq	-80(%rbp), %rsi
	leaq	-64(%rbp), %rdx
	leaq	-56(%rbp), %rcx
	callq	__cudaPopCallConfiguration@PLT
	movq	-64(%rbp), %rax
	movq	-56(%rbp), %r10
	movq	-96(%rbp), %rcx
	movq	%rcx, -48(%rbp)
	movl	-88(%rbp), %ecx
	movl	%ecx, -40(%rbp)
	movq	-48(%rbp), %rsi
	movl	-40(%rbp), %edx
	movq	-80(%rbp), %rcx
	movq	%rcx, -32(%rbp)
	movl	-72(%rbp), %ecx
	movl	%ecx, -24(%rbp)
	movq	-32(%rbp), %rcx
	movl	-24(%rbp), %r8d
	movq	_Z26__device_stub__kmeansPointPfiiiPiS_S_S0_@GOTPCREL(%rip), %rdi
	leaq	-192(%rbp), %r9
	movq	%rax, (%rsp)
	movq	%r10, 8(%rsp)
	callq	cudaLaunchKernel@PLT
# %bb.1:
	addq	$208, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end5:
	.size	_Z26__device_stub__kmeansPointPfiiiPiS_S_S0_, .Lfunc_end5-_Z26__device_stub__kmeansPointPfiiiPiS_S_S0_
	.cfi_endproc
                                        # -- End function
	.section	.text.startup,"ax",@progbits
	.p2align	4, 0x90                         # -- Begin function __cxx_global_var_init.3
	.type	__cxx_global_var_init.3,@function
__cxx_global_var_init.3:                # @__cxx_global_var_init.3
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movq	num_threads_perdim@GOTPCREL(%rip), %rax
	movl	(%rax), %eax
	imull	%eax, %eax
	movq	num_threads@GOTPCREL(%rip), %rcx
	movl	%eax, (%rcx)
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end6:
	.size	__cxx_global_var_init.3, .Lfunc_end6-__cxx_global_var_init.3
	.cfi_endproc
                                        # -- End function
	.p2align	4, 0x90                         # -- Begin function __cxx_global_var_init.4
	.type	__cxx_global_var_init.4,@function
__cxx_global_var_init.4:                # @__cxx_global_var_init.4
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movq	num_blocks_perdim@GOTPCREL(%rip), %rax
	movl	(%rax), %eax
	imull	%eax, %eax
	movq	num_blocks@GOTPCREL(%rip), %rcx
	movl	%eax, (%rcx)
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end7:
	.size	__cxx_global_var_init.4, .Lfunc_end7-__cxx_global_var_init.4
	.cfi_endproc
                                        # -- End function
	.text
	.globl	allocateMemory                  # -- Begin function allocateMemory
	.p2align	4, 0x90
	.type	allocateMemory,@function
allocateMemory:                         # @allocateMemory
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$96, %rsp
	movl	%edi, -4(%rbp)
	movl	%esi, -8(%rbp)
	movl	%edx, -16(%rbp)
	movq	%rcx, -88(%rbp)
	movl	-4(%rbp), %eax
	movq	num_threads@GOTPCREL(%rip), %rcx
	xorl	%edx, %edx
	divl	(%rcx)
	movq	num_blocks@GOTPCREL(%rip), %rcx
	movl	%eax, (%rcx)
	movl	-4(%rbp), %eax
	movq	num_threads@GOTPCREL(%rip), %rcx
	xorl	%edx, %edx
	divl	(%rcx)
	cmpl	$0, %edx
	jbe	.LBB8_2
# %bb.1:
	movq	num_blocks@GOTPCREL(%rip), %rax
	movl	(%rax), %eax
	addl	$1, %eax
	movq	num_blocks@GOTPCREL(%rip), %rcx
	movl	%eax, (%rcx)
.LBB8_2:
	movq	num_blocks@GOTPCREL(%rip), %rax
	movl	(%rax), %eax
	cvtsi2sd	%rax, %xmm0
	callq	sqrt@PLT
	cvttsd2si	%xmm0, %rax
	movq	num_blocks_perdim@GOTPCREL(%rip), %rcx
	movl	%eax, (%rcx)
.LBB8_3:                                # =>This Inner Loop Header: Depth=1
	movq	num_blocks_perdim@GOTPCREL(%rip), %rax
	movl	(%rax), %eax
	movq	num_blocks_perdim@GOTPCREL(%rip), %rcx
	imull	(%rcx), %eax
	movq	num_blocks@GOTPCREL(%rip), %rcx
	cmpl	(%rcx), %eax
	jae	.LBB8_5
# %bb.4:                                #   in Loop: Header=BB8_3 Depth=1
	movq	num_blocks_perdim@GOTPCREL(%rip), %rax
	movl	(%rax), %eax
	addl	$1, %eax
	movq	num_blocks_perdim@GOTPCREL(%rip), %rcx
	movl	%eax, (%rcx)
	jmp	.LBB8_3
.LBB8_5:
	movq	num_blocks_perdim@GOTPCREL(%rip), %rax
	movl	(%rax), %eax
	movq	num_blocks_perdim@GOTPCREL(%rip), %rcx
	imull	(%rcx), %eax
	movq	num_blocks@GOTPCREL(%rip), %rcx
	movl	%eax, (%rcx)
	movslq	-4(%rbp), %rdi
	shlq	$2, %rdi
	callq	malloc@PLT
	movq	membership_new@GOTPCREL(%rip), %rcx
	movq	%rax, (%rcx)
	movl	$0, -12(%rbp)
.LBB8_6:                                # =>This Inner Loop Header: Depth=1
	movl	-12(%rbp), %eax
	cmpl	-4(%rbp), %eax
	jge	.LBB8_9
# %bb.7:                                #   in Loop: Header=BB8_6 Depth=1
	movq	membership_new@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	movslq	-12(%rbp), %rcx
	movl	$-1, (%rax,%rcx,4)
# %bb.8:                                #   in Loop: Header=BB8_6 Depth=1
	movl	-12(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -12(%rbp)
	jmp	.LBB8_6
.LBB8_9:
	movl	-16(%rbp), %eax
	imull	-8(%rbp), %eax
	movslq	%eax, %rdi
	shlq	$2, %rdi
	callq	malloc@PLT
	movq	block_new_centers@GOTPCREL(%rip), %rcx
	movq	%rax, (%rcx)
	movl	-4(%rbp), %eax
	imull	-8(%rbp), %eax
	movslq	%eax, %rsi
	shlq	$2, %rsi
	movq	feature_flipped_d@GOTPCREL(%rip), %rdi
	callq	cudaMalloc@PLT
	movq	feature_flipped_d@GOTPCREL(%rip), %rax
	movq	(%rax), %rdi
	movq	-88(%rbp), %rax
	movq	(%rax), %rsi
	movl	-4(%rbp), %eax
	imull	-8(%rbp), %eax
	movslq	%eax, %rdx
	shlq	$2, %rdx
	movl	$1, %ecx
	callq	cudaMemcpy@PLT
	movl	-4(%rbp), %eax
	imull	-8(%rbp), %eax
	movslq	%eax, %rsi
	shlq	$2, %rsi
	movq	feature_d@GOTPCREL(%rip), %rdi
	callq	cudaMalloc@PLT
	movq	num_blocks@GOTPCREL(%rip), %rax
	movl	(%rax), %esi
	leaq	-80(%rbp), %rdi
	movl	$1, %edx
	movl	$1, %ecx
	callq	_ZN4dim3C2Ejjj@PLT
	movq	num_threads@GOTPCREL(%rip), %rax
	movl	(%rax), %esi
	leaq	-64(%rbp), %rdi
	movl	$1, %edx
	movl	$1, %ecx
	callq	_ZN4dim3C2Ejjj@PLT
	movq	-80(%rbp), %rax
	movq	%rax, -48(%rbp)
	movl	-72(%rbp), %eax
	movl	%eax, -40(%rbp)
	movq	-48(%rbp), %rdi
	movl	-40(%rbp), %esi
	movq	-64(%rbp), %rax
	movq	%rax, -32(%rbp)
	movl	-56(%rbp), %eax
	movl	%eax, -24(%rbp)
	movq	-32(%rbp), %rdx
	movl	-24(%rbp), %ecx
	xorl	%r8d, %r8d
	xorl	%r9d, %r9d
	callq	__cudaPushCallConfiguration@PLT
	cmpl	$0, %eax
	jne	.LBB8_11
# %bb.10:
	movq	feature_flipped_d@GOTPCREL(%rip), %rax
	movq	(%rax), %rdi
	movq	feature_d@GOTPCREL(%rip), %rax
	movq	(%rax), %rsi
	movl	-4(%rbp), %edx
	movl	-8(%rbp), %ecx
	callq	_Z29__device_stub__invert_mappingPfS_ii@PLT
.LBB8_11:
	movslq	-4(%rbp), %rsi
	shlq	$2, %rsi
	movq	membership_d@GOTPCREL(%rip), %rdi
	callq	cudaMalloc@PLT
	movl	-16(%rbp), %eax
	imull	-8(%rbp), %eax
	movslq	%eax, %rsi
	shlq	$2, %rsi
	movq	clusters_d@GOTPCREL(%rip), %rdi
	callq	cudaMalloc@PLT
	addq	$96, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end8:
	.size	allocateMemory, .Lfunc_end8-allocateMemory
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
	movq	%rdi, -24(%rbp)
	movl	%esi, -12(%rbp)
	movl	%edx, -8(%rbp)
	movl	%ecx, -4(%rbp)
	movq	-24(%rbp), %rax
	movl	-12(%rbp), %ecx
	movl	%ecx, (%rax)
	movl	-8(%rbp), %ecx
	movl	%ecx, 4(%rax)
	movl	-4(%rbp), %ecx
	movl	%ecx, 8(%rax)
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end9:
	.size	_ZN4dim3C2Ejjj, .Lfunc_end9-_ZN4dim3C2Ejjj
	.cfi_endproc
                                        # -- End function
	.text
	.globl	deallocateMemory                # -- Begin function deallocateMemory
	.p2align	4, 0x90
	.type	deallocateMemory,@function
deallocateMemory:                       # @deallocateMemory
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movq	membership_new@GOTPCREL(%rip), %rax
	movq	(%rax), %rdi
	callq	free@PLT
	movq	block_new_centers@GOTPCREL(%rip), %rax
	movq	(%rax), %rdi
	callq	free@PLT
	movq	feature_d@GOTPCREL(%rip), %rax
	movq	(%rax), %rdi
	callq	cudaFree@PLT
	movq	feature_flipped_d@GOTPCREL(%rip), %rax
	movq	(%rax), %rdi
	callq	cudaFree@PLT
	movq	membership_d@GOTPCREL(%rip), %rax
	movq	(%rax), %rdi
	callq	cudaFree@PLT
	movq	clusters_d@GOTPCREL(%rip), %rax
	movq	(%rax), %rdi
	callq	cudaFree@PLT
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end10:
	.size	deallocateMemory, .Lfunc_end10-deallocateMemory
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
	subq	$16, %rsp
	movl	%edi, -4(%rbp)
	movq	%rsi, -16(%rbp)
	movl	$1, %edi
	callq	cudaSetDevice@PLT
	movl	-4(%rbp), %edi
	movq	-16(%rbp), %rsi
	callq	setup@PLT
	xorl	%eax, %eax
	addq	$16, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end11:
	.size	main, .Lfunc_end11-main
	.cfi_endproc
                                        # -- End function
	.globl	kmeansCuda                      # -- Begin function kmeansCuda
	.p2align	4, 0x90
	.type	kmeansCuda,@function
kmeansCuda:                             # @kmeansCuda
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$240, %rsp
	movq	24(%rbp), %rax
	movq	16(%rbp), %rax
	movq	%rdi, -224(%rbp)
	movl	%esi, -8(%rbp)
	movl	%edx, -12(%rbp)
	movl	%ecx, -24(%rbp)
	movq	%r8, -48(%rbp)
	movq	%r9, -40(%rbp)
	movl	$0, -20(%rbp)
	movl	$1, %edi
	callq	cudaSetDevice@PLT
	movq	membership_d@GOTPCREL(%rip), %rax
	movq	(%rax), %rdi
	movq	membership_new@GOTPCREL(%rip), %rax
	movq	(%rax), %rsi
	movslq	-12(%rbp), %rdx
	shlq	$2, %rdx
	movl	$1, %ecx
	callq	cudaMemcpy@PLT
	movq	clusters_d@GOTPCREL(%rip), %rax
	movq	(%rax), %rdi
	movq	-40(%rbp), %rax
	movq	(%rax), %rsi
	movl	-24(%rbp), %eax
	imull	-8(%rbp), %eax
	movslq	%eax, %rdx
	shlq	$2, %rdx
	movl	$1, %ecx
	callq	cudaMemcpy@PLT
	leaq	-216(%rbp), %rdi
	callq	_Z21cudaCreateChannelDescIfE21cudaChannelFormatDescv@PLT
	movl	$0, t_features+4(%rip)
	movl	$0, t_features(%rip)
	movq	-216(%rbp), %rax
	movq	%rax, t_features+20(%rip)
	movq	-208(%rbp), %rax
	movq	%rax, t_features+28(%rip)
	movl	-200(%rbp), %eax
	movl	%eax, t_features+36(%rip)
	movq	feature_d@GOTPCREL(%rip), %rax
	movq	(%rax), %rdx
	movl	-12(%rbp), %eax
	imull	-8(%rbp), %eax
	movslq	%eax, %r8
	shlq	$2, %r8
	leaq	t_features(%rip), %rsi
	leaq	-216(%rbp), %rcx
	xorl	%edi, %edi
	callq	cudaBindTexture@PLT
	cmpl	$0, %eax
	je	.LBB12_2
# %bb.1:
	leaq	.L.str(%rip), %rdi
	movb	$0, %al
	callq	printf@PLT
.LBB12_2:
	leaq	-192(%rbp), %rdi
	callq	_Z21cudaCreateChannelDescIfE21cudaChannelFormatDescv@PLT
	movl	$0, t_features_flipped+4(%rip)
	movl	$0, t_features_flipped(%rip)
	movq	-192(%rbp), %rax
	movq	%rax, t_features_flipped+20(%rip)
	movq	-184(%rbp), %rax
	movq	%rax, t_features_flipped+28(%rip)
	movl	-176(%rbp), %eax
	movl	%eax, t_features_flipped+36(%rip)
	movq	feature_flipped_d@GOTPCREL(%rip), %rax
	movq	(%rax), %rdx
	movl	-12(%rbp), %eax
	imull	-8(%rbp), %eax
	movslq	%eax, %r8
	shlq	$2, %r8
	leaq	t_features_flipped(%rip), %rsi
	leaq	-192(%rbp), %rcx
	xorl	%edi, %edi
	callq	cudaBindTexture@PLT
	cmpl	$0, %eax
	je	.LBB12_4
# %bb.3:
	leaq	.L.str.5(%rip), %rdi
	movb	$0, %al
	callq	printf@PLT
.LBB12_4:
	leaq	-168(%rbp), %rdi
	callq	_Z21cudaCreateChannelDescIfE21cudaChannelFormatDescv@PLT
	movl	$0, t_clusters+4(%rip)
	movl	$0, t_clusters(%rip)
	movq	-168(%rbp), %rax
	movq	%rax, t_clusters+20(%rip)
	movq	-160(%rbp), %rax
	movq	%rax, t_clusters+28(%rip)
	movl	-152(%rbp), %eax
	movl	%eax, t_clusters+36(%rip)
	movq	clusters_d@GOTPCREL(%rip), %rax
	movq	(%rax), %rdx
	movl	-24(%rbp), %eax
	imull	-8(%rbp), %eax
	movslq	%eax, %r8
	shlq	$2, %r8
	leaq	t_clusters(%rip), %rsi
	leaq	-168(%rbp), %rcx
	xorl	%edi, %edi
	callq	cudaBindTexture@PLT
	cmpl	$0, %eax
	je	.LBB12_6
# %bb.5:
	leaq	.L.str.6(%rip), %rdi
	movb	$0, %al
	callq	printf@PLT
.LBB12_6:
	movq	-40(%rbp), %rax
	movq	(%rax), %rdi
	movl	-24(%rbp), %eax
	imull	-8(%rbp), %eax
	movslq	%eax, %rsi
	shlq	$2, %rsi
	callq	_ZL18cudaMemcpyToSymbolIA11_cE9cudaErrorRKT_PKvmm14cudaMemcpyKind
	movq	num_blocks_perdim@GOTPCREL(%rip), %rax
	movl	(%rax), %esi
	movq	num_blocks_perdim@GOTPCREL(%rip), %rax
	movl	(%rax), %edx
	leaq	-144(%rbp), %rdi
	movl	$1, %ecx
	callq	_ZN4dim3C2Ejjj@PLT
	movq	num_threads_perdim@GOTPCREL(%rip), %rax
	movl	(%rax), %esi
	movq	num_threads_perdim@GOTPCREL(%rip), %rax
	imull	(%rax), %esi
	leaq	-128(%rbp), %rdi
	movl	$1, %edx
	movl	$1, %ecx
	callq	_ZN4dim3C2Ejjj@PLT
	movq	-144(%rbp), %rax
	movq	%rax, -80(%rbp)
	movl	-136(%rbp), %eax
	movl	%eax, -72(%rbp)
	movq	-128(%rbp), %rax
	movq	%rax, -64(%rbp)
	movl	-120(%rbp), %eax
	movl	%eax, -56(%rbp)
	movq	-80(%rbp), %rax
	movq	%rax, -112(%rbp)
	movl	-72(%rbp), %eax
	movl	%eax, -104(%rbp)
	movq	-112(%rbp), %rdi
	movl	-104(%rbp), %esi
	movq	-64(%rbp), %rax
	movq	%rax, -96(%rbp)
	movl	-56(%rbp), %eax
	movl	%eax, -88(%rbp)
	movq	-96(%rbp), %rdx
	movl	-88(%rbp), %ecx
	xorl	%r8d, %r8d
	xorl	%r9d, %r9d
	callq	__cudaPushCallConfiguration@PLT
	cmpl	$0, %eax
	jne	.LBB12_8
# %bb.7:
	movq	feature_d@GOTPCREL(%rip), %rax
	movq	(%rax), %rdi
	movl	-8(%rbp), %esi
	movl	-12(%rbp), %edx
	movl	-24(%rbp), %ecx
	movq	membership_d@GOTPCREL(%rip), %rax
	movq	(%rax), %r8
	movq	clusters_d@GOTPCREL(%rip), %rax
	movq	(%rax), %r9
	movq	block_clusters_d@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	movq	block_deltas_d@GOTPCREL(%rip), %r10
	movq	(%r10), %r10
	movq	%rax, (%rsp)
	movq	%r10, 8(%rsp)
	callq	_Z26__device_stub__kmeansPointPfiiiPiS_S_S0_@PLT
.LBB12_8:
	callq	cudaThreadSynchronize@PLT
	movq	membership_new@GOTPCREL(%rip), %rax
	movq	(%rax), %rdi
	movq	membership_d@GOTPCREL(%rip), %rax
	movq	(%rax), %rsi
	movslq	-12(%rbp), %rdx
	shlq	$2, %rdx
	movl	$2, %ecx
	callq	cudaMemcpy@PLT
	movl	$0, -20(%rbp)
	movl	$0, -4(%rbp)
.LBB12_9:                               # =>This Loop Header: Depth=1
                                        #     Child Loop BB12_13 Depth 2
	movl	-4(%rbp), %eax
	cmpl	-12(%rbp), %eax
	jge	.LBB12_18
# %bb.10:                               #   in Loop: Header=BB12_9 Depth=1
	movq	membership_new@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	movslq	-4(%rbp), %rcx
	movl	(%rax,%rcx,4), %eax
	movl	%eax, -28(%rbp)
	movq	16(%rbp), %rax
	movslq	-28(%rbp), %rcx
	movl	(%rax,%rcx,4), %edx
	addl	$1, %edx
	movl	%edx, (%rax,%rcx,4)
	movq	membership_new@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	movslq	-4(%rbp), %rcx
	movl	(%rax,%rcx,4), %eax
	movq	-48(%rbp), %rcx
	movslq	-4(%rbp), %rdx
	cmpl	(%rcx,%rdx,4), %eax
	je	.LBB12_12
# %bb.11:                               #   in Loop: Header=BB12_9 Depth=1
	movl	-20(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -20(%rbp)
	movq	membership_new@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	movslq	-4(%rbp), %rcx
	movl	(%rax,%rcx,4), %eax
	movq	-48(%rbp), %rcx
	movslq	-4(%rbp), %rdx
	movl	%eax, (%rcx,%rdx,4)
.LBB12_12:                              #   in Loop: Header=BB12_9 Depth=1
	movl	$0, -16(%rbp)
.LBB12_13:                              #   Parent Loop BB12_9 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	-16(%rbp), %eax
	cmpl	-8(%rbp), %eax
	jge	.LBB12_16
# %bb.14:                               #   in Loop: Header=BB12_13 Depth=2
	movq	-224(%rbp), %rax
	movslq	-4(%rbp), %rcx
	movq	(%rax,%rcx,8), %rax
	movslq	-16(%rbp), %rcx
	movss	(%rax,%rcx,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	movq	24(%rbp), %rax
	movslq	-28(%rbp), %rcx
	movq	(%rax,%rcx,8), %rax
	movslq	-16(%rbp), %rcx
	addss	(%rax,%rcx,4), %xmm0
	movss	%xmm0, (%rax,%rcx,4)
# %bb.15:                               #   in Loop: Header=BB12_13 Depth=2
	movl	-16(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -16(%rbp)
	jmp	.LBB12_13
.LBB12_16:                              #   in Loop: Header=BB12_9 Depth=1
	jmp	.LBB12_17
.LBB12_17:                              #   in Loop: Header=BB12_9 Depth=1
	movl	-4(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -4(%rbp)
	jmp	.LBB12_9
.LBB12_18:
	movl	-20(%rbp), %eax
	addq	$240, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end12:
	.size	kmeansCuda, .Lfunc_end12-kmeansCuda
	.cfi_endproc
                                        # -- End function
	.section	.text._Z21cudaCreateChannelDescIfE21cudaChannelFormatDescv,"axG",@progbits,_Z21cudaCreateChannelDescIfE21cudaChannelFormatDescv,comdat
	.weak	_Z21cudaCreateChannelDescIfE21cudaChannelFormatDescv # -- Begin function _Z21cudaCreateChannelDescIfE21cudaChannelFormatDescv
	.p2align	4, 0x90
	.type	_Z21cudaCreateChannelDescIfE21cudaChannelFormatDescv,@function
_Z21cudaCreateChannelDescIfE21cudaChannelFormatDescv: # @_Z21cudaCreateChannelDescIfE21cudaChannelFormatDescv
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%rbx
	pushq	%rax
	.cfi_offset %rbx, -24
	movq	%rdi, %rbx
	movl	$32, -12(%rbp)
	movl	-12(%rbp), %esi
	movq	%rbx, %rdi
	xorl	%edx, %edx
	xorl	%ecx, %ecx
	xorl	%r8d, %r8d
	movl	$2, %r9d
	callq	cudaCreateChannelDesc@PLT
	movq	%rbx, %rax
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end13:
	.size	_Z21cudaCreateChannelDescIfE21cudaChannelFormatDescv, .Lfunc_end13-_Z21cudaCreateChannelDescIfE21cudaChannelFormatDescv
	.cfi_endproc
                                        # -- End function
	.text
	.p2align	4, 0x90                         # -- Begin function _ZL18cudaMemcpyToSymbolIA11_cE9cudaErrorRKT_PKvmm14cudaMemcpyKind
	.type	_ZL18cudaMemcpyToSymbolIA11_cE9cudaErrorRKT_PKvmm14cudaMemcpyKind,@function
_ZL18cudaMemcpyToSymbolIA11_cE9cudaErrorRKT_PKvmm14cudaMemcpyKind: # @_ZL18cudaMemcpyToSymbolIA11_cE9cudaErrorRKT_PKvmm14cudaMemcpyKind
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$48, %rsp
	leaq	.L.str.7(%rip), %rax
	movq	%rax, -40(%rbp)
	movq	%rdi, -32(%rbp)
	movq	%rsi, -24(%rbp)
	movq	$0, -16(%rbp)
	movl	$1, -4(%rbp)
	movq	-40(%rbp), %rdi
	movq	-32(%rbp), %rsi
	movq	-24(%rbp), %rdx
	movq	-16(%rbp), %rcx
	movl	-4(%rbp), %r8d
	callq	cudaMemcpyToSymbol@PLT
	addq	$48, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end14:
	.size	_ZL18cudaMemcpyToSymbolIA11_cE9cudaErrorRKT_PKvmm14cudaMemcpyKind, .Lfunc_end14-_ZL18cudaMemcpyToSymbolIA11_cE9cudaErrorRKT_PKvmm14cudaMemcpyKind
	.cfi_endproc
                                        # -- End function
	.section	.text.startup,"ax",@progbits
	.p2align	4, 0x90                         # -- Begin function _GLOBAL__sub_I_kmeans_cuda.cu
	.type	_GLOBAL__sub_I_kmeans_cuda.cu,@function
_GLOBAL__sub_I_kmeans_cuda.cu:          # @_GLOBAL__sub_I_kmeans_cuda.cu
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	callq	__cxx_global_var_init
	callq	__cxx_global_var_init.1
	callq	__cxx_global_var_init.2
	callq	__cxx_global_var_init.3
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	jmp	__cxx_global_var_init.4         # TAILCALL
.Lfunc_end15:
	.size	_GLOBAL__sub_I_kmeans_cuda.cu, .Lfunc_end15-_GLOBAL__sub_I_kmeans_cuda.cu
	.cfi_endproc
                                        # -- End function
	.text
	.p2align	4, 0x90                         # -- Begin function __cuda_module_ctor
	.type	__cuda_module_ctor,@function
__cuda_module_ctor:                     # @__cuda_module_ctor
	.cfi_startproc
# %bb.0:
	pushq	%rbx
	.cfi_def_cfa_offset 16
	subq	$32, %rsp
	.cfi_def_cfa_offset 48
	.cfi_offset %rbx, -16
	leaq	__cuda_fatbin_wrapper(%rip), %rdi
	callq	__cudaRegisterFatBinary@PLT
	movq	%rax, %rbx
	movq	%rax, __cuda_gpubin_handle(%rip)
	xorps	%xmm0, %xmm0
	movups	%xmm0, 16(%rsp)
	movups	%xmm0, (%rsp)
	movq	_Z29__device_stub__invert_mappingPfS_ii@GOTPCREL(%rip), %rsi
	leaq	.L__unnamed_1(%rip), %rcx
	movq	%rax, %rdi
	movq	%rcx, %rdx
	movl	$-1, %r8d
	xorl	%r9d, %r9d
	callq	__cudaRegisterFunction@PLT
	xorps	%xmm0, %xmm0
	movups	%xmm0, 16(%rsp)
	movups	%xmm0, (%rsp)
	movq	_Z26__device_stub__kmeansPointPfiiiPiS_S_S0_@GOTPCREL(%rip), %rsi
	leaq	.L__unnamed_2(%rip), %rcx
	movq	%rbx, %rdi
	movq	%rcx, %rdx
	movl	$-1, %r8d
	xorl	%r9d, %r9d
	callq	__cudaRegisterFunction@PLT
	movl	$0, (%rsp)
	leaq	t_features(%rip), %rsi
	leaq	.L__unnamed_3(%rip), %rcx
	movq	%rbx, %rdi
	movq	%rcx, %rdx
	movl	$1, %r8d
	xorl	%r9d, %r9d
	callq	__cudaRegisterTexture@PLT
	movl	$0, (%rsp)
	leaq	t_features_flipped(%rip), %rsi
	leaq	.L__unnamed_4(%rip), %rcx
	movq	%rbx, %rdi
	movq	%rcx, %rdx
	movl	$1, %r8d
	xorl	%r9d, %r9d
	callq	__cudaRegisterTexture@PLT
	movl	$0, (%rsp)
	leaq	t_clusters(%rip), %rsi
	leaq	.L__unnamed_5(%rip), %rcx
	movq	%rbx, %rdi
	movq	%rcx, %rdx
	movl	$1, %r8d
	xorl	%r9d, %r9d
	callq	__cudaRegisterTexture@PLT
	movl	$0, 8(%rsp)
	movl	$1, (%rsp)
	leaq	c_clusters(%rip), %rsi
	leaq	.L.str.7(%rip), %rcx
	movl	$4352, %r9d                     # imm = 0x1100
	movq	%rbx, %rdi
	movq	%rcx, %rdx
	xorl	%r8d, %r8d
	callq	__cudaRegisterVar@PLT
	movq	%rbx, %rdi
	callq	__cudaRegisterFatBinaryEnd@PLT
	leaq	__cuda_module_dtor(%rip), %rdi
	addq	$32, %rsp
	.cfi_def_cfa_offset 16
	popq	%rbx
	.cfi_def_cfa_offset 8
	jmp	atexit@PLT                      # TAILCALL
.Lfunc_end16:
	.size	__cuda_module_ctor, .Lfunc_end16-__cuda_module_ctor
	.cfi_endproc
                                        # -- End function
	.p2align	4, 0x90                         # -- Begin function __cuda_module_dtor
	.type	__cuda_module_dtor,@function
__cuda_module_dtor:                     # @__cuda_module_dtor
	.cfi_startproc
# %bb.0:
	movq	__cuda_gpubin_handle(%rip), %rdi
	jmp	__cudaUnregisterFatBinary@PLT   # TAILCALL
.Lfunc_end17:
	.size	__cuda_module_dtor, .Lfunc_end17-__cuda_module_dtor
	.cfi_endproc
                                        # -- End function
	.type	t_features,@object              # @t_features
	.local	t_features
	.comm	t_features,124,4
	.type	t_features_flipped,@object      # @t_features_flipped
	.local	t_features_flipped
	.comm	t_features_flipped,124,4
	.type	t_clusters,@object              # @t_clusters
	.local	t_clusters
	.comm	t_clusters,124,4
	.type	c_clusters,@object              # @c_clusters
	.local	c_clusters
	.comm	c_clusters,4352,16
	.type	num_threads_perdim,@object      # @num_threads_perdim
	.data
	.globl	num_threads_perdim
	.p2align	2, 0x0
num_threads_perdim:
	.long	16                              # 0x10
	.size	num_threads_perdim, 4

	.type	num_blocks_perdim,@object       # @num_blocks_perdim
	.globl	num_blocks_perdim
	.p2align	2, 0x0
num_blocks_perdim:
	.long	16                              # 0x10
	.size	num_blocks_perdim, 4

	.type	num_threads,@object             # @num_threads
	.bss
	.globl	num_threads
	.p2align	2, 0x0
num_threads:
	.long	0                               # 0x0
	.size	num_threads, 4

	.type	num_blocks,@object              # @num_blocks
	.globl	num_blocks
	.p2align	2, 0x0
num_blocks:
	.long	0                               # 0x0
	.size	num_blocks, 4

	.type	membership_new,@object          # @membership_new
	.globl	membership_new
	.p2align	3, 0x0
membership_new:
	.quad	0
	.size	membership_new, 8

	.type	feature_d,@object               # @feature_d
	.globl	feature_d
	.p2align	3, 0x0
feature_d:
	.quad	0
	.size	feature_d, 8

	.type	feature_flipped_d,@object       # @feature_flipped_d
	.globl	feature_flipped_d
	.p2align	3, 0x0
feature_flipped_d:
	.quad	0
	.size	feature_flipped_d, 8

	.type	membership_d,@object            # @membership_d
	.globl	membership_d
	.p2align	3, 0x0
membership_d:
	.quad	0
	.size	membership_d, 8

	.type	block_new_centers,@object       # @block_new_centers
	.globl	block_new_centers
	.p2align	3, 0x0
block_new_centers:
	.quad	0
	.size	block_new_centers, 8

	.type	clusters_d,@object              # @clusters_d
	.globl	clusters_d
	.p2align	3, 0x0
clusters_d:
	.quad	0
	.size	clusters_d, 8

	.type	block_clusters_d,@object        # @block_clusters_d
	.globl	block_clusters_d
	.p2align	3, 0x0
block_clusters_d:
	.quad	0
	.size	block_clusters_d, 8

	.type	block_deltas_d,@object          # @block_deltas_d
	.globl	block_deltas_d
	.p2align	3, 0x0
block_deltas_d:
	.quad	0
	.size	block_deltas_d, 8

	.type	.L.str,@object                  # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"Couldn't bind features array to texture!\n"
	.size	.L.str, 42

	.type	.L.str.5,@object                # @.str.5
.L.str.5:
	.asciz	"Couldn't bind features_flipped array to texture!\n"
	.size	.L.str.5, 50

	.type	.L.str.6,@object                # @.str.6
.L.str.6:
	.asciz	"Couldn't bind clusters array to texture!\n"
	.size	.L.str.6, 42

	.type	.L.str.7,@object                # @.str.7
.L.str.7:
	.asciz	"c_clusters"
	.size	.L.str.7, 11

	.type	.L__unnamed_1,@object           # @0
.L__unnamed_1:
	.asciz	"_Z14invert_mappingPfS_ii"
	.size	.L__unnamed_1, 25

	.type	.L__unnamed_2,@object           # @1
.L__unnamed_2:
	.asciz	"_Z11kmeansPointPfiiiPiS_S_S0_"
	.size	.L__unnamed_2, 30

	.type	.L__unnamed_3,@object           # @2
.L__unnamed_3:
	.asciz	"t_features"
	.size	.L__unnamed_3, 11

	.type	.L__unnamed_4,@object           # @3
.L__unnamed_4:
	.asciz	"t_features_flipped"
	.size	.L__unnamed_4, 19

	.type	.L__unnamed_5,@object           # @4
.L__unnamed_5:
	.asciz	"t_clusters"
	.size	.L__unnamed_5, 11

	.type	__cuda_fatbin_wrapper,@object   # @__cuda_fatbin_wrapper
	.section	.hipFatBinSegment,"aw",@progbits
	.p2align	3, 0x90
__cuda_fatbin_wrapper:
	.long	1212764230                      # 0x48495046
	.long	1                               # 0x1
	.quad	_cupbop_amdgpu_fatbin_wrapper
	.quad	0
	.size	__cuda_fatbin_wrapper, 24

	.type	__cuda_gpubin_handle,@object    # @__cuda_gpubin_handle
	.local	__cuda_gpubin_handle
	.comm	__cuda_gpubin_handle,8,8
	.section	.init_array,"aw",@init_array
	.p2align	3, 0x90
	.quad	_GLOBAL__sub_I_kmeans_cuda.cu
	.quad	__cuda_module_ctor
	.type	_cupbop_amdgpu_fatbin_wrapper,@object # @_cupbop_amdgpu_fatbin_wrapper
	.section	.hipFatBinSegment,"a",@progbits,unique,1
	.p2align	12, 0x0
_cupbop_amdgpu_fatbin_wrapper:
	.asciz	"__CLANG_OFFLOAD_BUNDLE__\002\000\000\000\000\000\000\000\000\020\000\000\000\000\000\000\000\000\000\000\000\000\000\000\031\000\000\000\000\000\000\000host-x86_64-unknown-linux\000\020\000\000\000\000\000\000H-\000\000\000\000\000\000\037\000\000\000\000\000\000\000hipv4-amdgcn-amd-amdhsa--gfx90a\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\177ELF\002\001\001@\002\000\000\000\000\000\000\000\003\000\340\000\001\000\000\000\000\000\000\000\000\000\000\000@\000\000\000\000\000\000\000\b)\000\000\000\000\000\000?\005\000\000@\0008\000\t\000@\000\021\000\017\000\006\000\000\000\004\000\000\000@\000\000\000\000\000\000\000@\000\000\000\000\000\000\000@\000\000\000\000\000\000\000\370\001\000\000\000\000\000\000\370\001\000\000\000\000\000\000\b\000\000\000\000\000\000\000\001\000\000\000\004\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\200\r\000\000\000\000\000\000\200\r\000\000\000\000\000\000\000\020\000\000\000\000\000\000\001\000\000\000\005\000\000\000\000\016\000\000\000\000\000\000\000\036\000\000\000\000\000\000\000\036\000\000\000\000\000\000\200\027\000\000\000\000\000\000\200\027\000\000\000\000\000\000\000\020\000\000\000\000\000\000\001\000\000\000\006\000\000\000\200%\000\000\000\000\000\000\200E\000\000\000\000\000\000\200E\000\000\000\000\000\000\260\000\000\000\000\000\000\000\260\000\000\000\000\000\000\000\000\020\000\000\000\000\000\000\001\000\000\000\006\000\000\0000&\000\000\000\000\000\0000V\000\000\000\000\000\0000V\000\000\000\000\000\000\000\000\000\000\000\000\000\000\030\022\000\000\000\000\000\000\000\020\000\000\000\000\000\000\002\000\000\000\006\000\000\000\200%\000\000\000\000\000\000\200E\000\000\000\000\000\000\200E\000\000\000\000\000\000\240\000\000\000\000\000\000\000\240\000\000\000\000\000\000\000\b\000\000\000\000\000\000\000R\345td\004\000\000\000\200%\000\000\000\000\000\000\200E\000\000\000\000\000\000\200E\000\000\000\000\000\000\260\000\000\000\000\000\000\000\200\n\000\000\000\000\000\000\001\000\000\000\000\000\000\000Q\345td\006\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\004\000\000\000\004\000\000\0008\002\000\000\000\000\000\0008\002\000\000\000\000\000\0008\002\000\000\000\000\000\000x\b\000\000\000\000\000\000x\b\000\000\000\000\000\000\004\000\000\000\000\000\000\000\007\000\000\000d\b\000\000 \000\000\000AMDGPU\000\000\203\256amdhsa.kernels\222\336\000\021\253.agpr_count\000\245.args\233\204\256.address_space\246global\247.offset\000\245.size\b\253.value_kind\255global_buffer\204\256.address_space\246global\247.offset\b\245.size\b\253.value_kind\255global_buffer\203\247.offset\020\245.size\004\253.value_kind\250by_value\203\247.offset\024\245.size\004\253.value_kind\250by_value\203\247.offset\030\245.size\b\253.value_kind\266hidden_global_offset_x\203\247.offset \245.size\b\253.value_kind\266hidden_global_offset_y\203\247.offset(\245.size\b\253.value_kind\266hidden_global_offset_z\203\247.offset0\245.size\b\253.value_kind\266hidden_hostcall_buffer\203\247.offset8\245.size\b\253.value_kind\253hidden_none\203\247.offset@\245.size\b\253.value_kind\253hidden_none\203\247.offsetH\245.size\b\253.value_kind\271hidden_multigrid_sync_arg\271.group_segment_fixed_size\000\266.kernarg_segment_align\b\265.kernarg_segment_sizeP\251.language\250OpenCL C\261.language_version\222\002\000\270.max_flat_workgroup_size\315\004\000\245.name\270_Z14invert_mappingPfS_ii\273.private_segment_fixed_size(\253.sgpr_count(\261.sgpr_spill_count\000\247.symbol\273_Z14invert_mappingPfS_ii.kd\263.uses_dynamic_stack\302\253.vgpr_count\024\261.vgpr_spill_count\000\257.wavefront_size@\336\000\021\253.agpr_count\000\245.args\237\204\256.address_space\246global\247.offset\000\245.size\b\253.value_kind\255global_buffer\203\247.offset\b\245.size\004\253.value_kind\250by_value\203\247.offset\f\245.size\004\253.value_kind\250by_value\203\247.offset\020\245.size\004\253.value_kind\250by_value\204\256.address_space\246global\247.offset\030\245.size\b\253.value_kind\255global_buffer\204\256.address_space\246global\247.offset \245.size\b\253.value_kind\255global_buffer\204\256.address_space\246global\247.offset(\245.size\b\253.value_kind\255global_buffer\204\256.address_space\246global\247.offset0\245.size\b\253.value_kind\255global_buffer\203\247.offset8\245.size\b\253.value_kind\266hidden_global_offset_x\203\247.offset@\245.size\b\253.value_kind\266hidden_global_offset_y\203\247.offsetH\245.size\b\253.value_kind\266hidden_global_offset_z\203\247.offsetP\245.size\b\253.value_kind\266hidden_hostcall_buffer\203\247.offsetX\245.size\b\253.value_kind\253hidden_none\203\247.offset`\245.size\b\253.value_kind\253hidden_none\203\247.offseth\245.size\b\253.value_kind\271hidden_multigrid_sync_arg\271.group_segment_fixed_size\000\266.kernarg_segment_align\b\265.kernarg_segment_sizep\251.language\250OpenCL C\261.language_version\222\002\000\270.max_flat_workgroup_size\315\004\000\245.name\275_Z11kmeansPointPfiiiPiS_S_S0_\273.private_segment_fixed_size\314\320\253.sgpr_count(\261.sgpr_spill_count\000\247.symbol\331 _Z11kmeansPointPfiiiPiS_S_S0_.kd\263.uses_dynamic_stack\302\253.vgpr_count$\261.vgpr_spill_count\000\257.wavefront_size@\255amdhsa.target\271amdgcn-amd-amdhsa--gfx90a\256amdhsa.version\222\001\001\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\001\000\000\000\022\003\b\000\000\036\000\000\000\000\000\000X\002\000\000\000\000\000\000_\000\000\000\021\000\013\0000V\000\000\000\000\000\000\000\021\000\000\000\000\000\000j\000\000\000\021\000\007\000@\r\000\000\000\000\000\000@\000\000\000\000\000\000\000\213\000\000\000\021\000\013\000\220g\000\000\000\000\000\000X\000\000\000\000\000\000\000\032\000\000\000\021\000\007\000\000\r\000\000\000\000\000\000@\000\000\000\000\000\000\0006\000\000\000\022\003\b\000\000!\000\000\000\000\000\000l\020\000\000\000\000\000\000T\000\000\000\021\000\013\0000g\000\000\000\000\000\000X\000\000\000\000\000\000\000\236\000\000\000\021\000\013\000\360g\000\000\000\000\000\000X\000\000\000\000\000\000\000\002\000\000\000\001\000\000\000\002\000\000\000\032\000\000\000\020\200\200\224\001\020@\020\000 \000\002\000\002\000\"\001\000\000\000\005\000\000\000\240\2734<\034\317F\360\266I\261\021\033V\232||i\227\246x\336\362d\226\365S\260Mr\3724\t\000\000\000\t\000\000\000\002\000\000\000\005\000\000\000\004\000\000\000\006\000\000\000\b\000\000\000\003\000\000\000\000\000\000\000\000\000\000\000\007\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\001\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000_Z14invert_mappingPfS_ii\000_Z14invert_mappingPfS_ii.kd\000_Z11kmeansPointPfiiiPiS_S_S0_\000t_features\000c_clusters\000_Z11kmeansPointPfiiiPiS_S_S0_.kd\000t_features_flipped\000t_clusters\000\000\000\000\000\000\000\000(F\000\000\000\000\000\000\003\000\000\000\002\000\000\000\000\000\000\000\000\000\000\000 F\000\000\000\000\000\000\003\000\000\000\007\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000(\000\000\000P\000\000\000\000\000\000\000\000\021\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\004\000\000\000\002\001\257\000\235\023\000\000?\000\000\000\000\000\000\000\000\000\000\000\320\000\000\000p\000\000\000\000\000\000\000\300\023\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\b\000\000\000\004\001\257\000\235\023\000\000?\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\200\000\241\276\f\021f\200\r\200g\202\000\021\000\200\001\200\001\202\204\001\006\300\000\000\000\000\204\002\006\300\b\000\000\000\004\003\002\300\020\000\000\000\000\000\200\277\004\002\002\300\024\000\000\000\017x\211\270\t\220\t\216\210\002\004~\t\002\006~\220\002\b~\t\002\n~\230\002\f~\t\002\016~\234\002\020~\t\002\022~\240\002\024~\t\002\026~\177\300\214\277\fP\263\323\006\f\000\030\000\000t\334\002\f\000\000\fP\263\323\n\024\000\030\000\000t\334\004\f\000\000\f\002\002~\000\000p\334\006\001\000\000\b\002\002~\000\000p\334\b\001\000\000\200\002\002~\004\200I\334\001\000\004\001p\017\214\277\001\000\205\322\001\035\000\000\377\000\204\276\377\003\000\000\000\000\023\321\000\t\000\000\000\0004\321\000\003\002\000\000\000p\334\n\000\000\000\000\000P\334\n\000\000\000\000\000\200\277\000\000P\334\006\000\000\001p\000\214\277\006\000\301\320\000\003\002\000~\001\204\276\004\006\206\206\006\001\376\276\t\000\210\277\017x\206\270\006\220\006\216\244\002\000~\006\002\002~\200\002\030~\000\000p\334\000\f\000\000\200\001\206\276\002\000\202\277~\004\376\207G\000\202\277\000\000P\334\000\000\000\f\000\000P\334\b\000\000\rp\000\214\277\f\000\301\320\f\033\002\000\301\001\212\276\b~\210\207~\001\212\276\n\f\214\206\f\001\376\276)\000\210\277\000\000T\334\002\000\000\f\000\000P\334\n\000\000\016\000\000P\334\b\000\000\017\000\000P\334\000\000\000\020p\000\214\277\022\f\350\321\016\037B\004\023\000\021\321\237$\002\000\202\000\216\276\022\000\217\322\016$\002\000\f\f\031\321\f%\002\000\r\f\034\321\r'2\000\000\000P\334\f\000\000\021\000\000\200\277\000\000T\334\004\000\000\f\000\000P\334\006\000\000\017p\000\214\277\016\f\350\321\017!:\004\017\000\021\321\237\034\002\000\016\000\217\322\016\034\002\000\f\f\031\321\f\035\002\000\r\f\034\321\r\0372\000\000\000p\334\f\021\000\000\006\000\202\277~\n\376\207~\b\212\206\n\006\206\207~\006\376\211\305\377\211\277\302\377\202\277\000\000P\334\000\000\000\f\201\000\214\276p\000\214\277\f\0004\321\f\031\000\000\000\000p\334\000\f\000\000\200\001\214\276\b~\210\211\357\377\202\277\000\000\201\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\200\000\241\276\f\021f\200\r\200g\202\000\021\000\200\001\200\001\202\204\001\006\300\000\000\000\000\204\004\002\300\b\000\000\000\304\004\002\300\f\000\000\000\004\005\002\300\020\000\000\000\204\002\006\300\030\000\000\000\004\003\006\300 \000\000\000\004\004\006\300(\000\000\000\000\000\200\277\004\002\006\3000\000\000\000\017x\225\270\025\220\025\216\377\002\004~`\000\000\000\025\002\006~\377\002\020~h\000\000\000\025\002\022~\377\002\f~l\000\000\000\025\002\016~\377\002\024~p\000\000\000\025\002\026~\377\002\b~x\000\000\000\025\002\n~\377\002 ~\200\000\000\000\025\002\"~\377\002$~\210\000\000\000\025\002&~\377\002(~\220\000\000\000\025\002*~\377\002,~\230\000\000\000\025\002.~\377\002\030~\234\000\000\000\025\002\032~\377\002\034~\240\000\000\000\025\002\036~\177\300\214\277\030P\263\323\006\f\000\030\000\000t\334\002\030\000\000\022\002\002~\000\000p\334\b\001\000\000\023\002\002~\000\000p\334\006\001\000\000\024\002\002~\000\000p\334\n\001\000\000\002P\263\323\n\024\000\030\000\000t\334\004\002\000\000\002P\263\323\f\030\000\030\000\000t\334\020\002\000\000\002P\263\323\020 \000\030\000\000t\334\022\002\000\000\002P\263\323\b\020\000\030\000\000t\334\024\002\000\000\200\002\002~\202\001\002\300\f\000\000\000\004\200H\334\001\000\004\002\200\000\207\276p\017\214\277\003\0005\321\007\004\002\000\002\r ~\020G ~\377  \n\376\377\177O\020\017 ~\003\000\205\322\003!\002\000\003\000\206\322\020\007\002\000\003\0004\321\020\007\002\000\177\300\214\277\003\000\206\322\006\006\002\000\201\000\210\276\020\0004\321\003\021\000\000\021\000\205\322\003\005\002\000\021\0005\321\006\"\002\000\022\0005\321\021\005\002\000\006\000\316\320\021\005\002\000\021\000\000\321\021%\032\000\003\000\000\321\003!\032\000\020\0004\321\003\021\000\000\006\000\316\320\021\005\002\000\002\000\000\321\003!\032\000\002\000\205\322\002\037\000\000\002\0004\321\002\035\000\000\000\000p\334\026\002\000\000\000\000P\334\026\000\000\002\000\000\200\277\004\200I\334\001\000\004\003p\000\214\277\002\000\205\322\002\007\002\000\006\200H\334\001\000\004\001\377\000\204\276\377\003\000\000\000\000\023\321\000\t\000\000p\017\214\277\000\004\350\321\002\003\002\004\000\000p\334\f\000\000\000\301\002\000~\000\000p\334\016\000\000\000\000\000P\334\f\000\000\000\000\000\200\277\000\000P\334\006\000\000\001p\000\214\277\004\000\311\320\000\003\002\000~\001\210\276\b\004\204\206\004\001\376\276%\000\210\277\017x\204\270\004\220\004\216\210\002 ~\004\002\"~\377\002$~\244\000\000\000\004\002&~\377\002(~\250\000\000\000\004\002*~\377\002,~\254\000\000\000\004\002.~\377\0020~\260\000\000\000\004\0022~\377\0024~\264\000\000\000\004\0026~\377\0028~\270\000\000\000\004\002:~\377\002<~\274\000\000\000\004\002>~\377\002@~\300\000\000\000\004\002B~\377\002\000~\377\377\177\177\000\000p\334\026\000\000\000\200\002\000~\000\000p\334\022\000\000\000\200\001\212\276\002\000\202\277~\b\376\207*\003\202\277\000\000P\334\022\000\000\000\000\000P\334\n\000\000\001p\000\214\277\004\000\301\320\000\003\002\000\301\001\206\276\f~\214\207~\001\216\276\016\004\204\206\004\001\376\276\020\000\210\277\000\000P\334\022\000\000\000\000\000P\334\b\000\000\001p\000\214\277\000\000\205\322\000\003\002\000\000\000p\334\032\000\000\000\200\002\000~\000\000p\334\034\000\000\000\000\000p\334\024\000\000\000\200\001\220\276\006\000\202\277~\016\376\207~\f\204\206\004\n\212\207~\n\376\211\336\377\211\277\333\377\202\277\000\000P\334\024\000\000\000\000\000P\334\b\000\000\001p\000\214\277\004\000\301\320\000\003\002\000\301\001\206\276\022~\222\207~\001\224\276\024\004\204\206\004\001\376\276\301\002\210\277\000\000P\334\f\000\000\000\000\000P\334\024\000\000\001\000\000P\334\006\000\000\002p\000\214\277\000\004\350\321\001\005\002\004\000\000p\334\036\000\000\000\000\034\204\276\004\377\004\200\350 \000\000\005\377\005\202\000\000\000\000\002\001\006\300\000\000\000\000\177\300\214\277\000P\263\323\004\b\000\030W\000@\334\000\000\000\000p\000\214\277W\000`\334\020\000\000\000\000P\263\323\004\b\000\030V\000@\334\000\000\000\000p\000\214\277V\000`\334\020\000\000\000\000P\263\323\004\b\000\030U\000@\334\000\000\000\000p\000\214\277U\000`\334\020\000\000\000\000P\263\323\004\b\000\030T\000@\334\000\000\000\000p\000\214\277T\000`\334\020\000\000\000\000P\263\323\004\b\000\030S\000@\334\000\000\000\000p\000\214\277S\000`\334\020\000\000\000\000P\263\323\004\b\000\030R\000@\334\000\000\000\000p\000\214\277R\000`\334\020\000\000\000\000P\263\323\004\b\000\030Q\000@\334\000\000\000\000p\000\214\277Q\000`\334\020\000\000\000\000P\263\323\004\b\000\030P\000@\334\000\000\000\000p\000\214\277P\000`\334\020\000\000\000\000P\263\323\004\b\000\030O\000@\334\000\000\000\000p\000\214\277O\000`\334\020\000\000\000\000P\263\323\004\b\000\030N\000@\334\000\000\000\000p\000\214\277N\000`\334\020\000\000\000\000P\263\323\004\b\000\030M\000@\334\000\000\000\000p\000\214\277M\000`\334\020\000\000\000\000P\263\323\004\b\000\030L\000@\334\000\000\000\000p\000\214\277L\000`\334\020\000\000\000\000P\263\323\004\b\000\030K\000@\334\000\000\000\000p\000\214\277K\000`\334\020\000\000\000\000P\263\323\004\b\000\030J\000@\334\000\000\000\000p\000\214\277J\000`\334\020\000\000\000\000P\263\323\004\b\000\030I\000@\334\000\000\000\000p\000\214\277I\000`\334\020\000\000\000\000P\263\323\004\b\000\030H\000@\334\000\000\000\000p\000\214\277H\000`\334\020\000\000\000\000P\263\323\004\b\000\030G\000@\334\000\000\000\000p\000\214\277G\000`\334\020\000\000\000\000P\263\323\004\b\000\030F\000@\334\000\000\000\000p\000\214\277F\000`\334\020\000\000\000\000P\263\323\004\b\000\030E\000@\334\000\000\000\000p\000\214\277E\000`\334\020\000\000\000\000P\263\323\004\b\000\030D\000@\334\000\000\000\000p\000\214\277D\000`\334\020\000\000\000\000P\263\323\004\b\000\030C\000@\334\000\000\000\000p\000\214\277C\000`\334\020\000\000\000\000P\263\323\004\b\000\030B\000@\334\000\000\000\000p\000\214\277B\000`\334\020\000\000\000\000P\263\323\004\b\000\030A\000@\334\000\000\000\000p\000\214\277A\000`\334\020\000\000\000\000P\263\323\004\b\000\030@\000@\334\000\000\000\000p\000\214\277@\000`\334\020\000\000\000\000P\263\323\004\b\000\030?\000@\334\000\000\000\000p\000\214\277?\000`\334\020\000\000\000\000P\263\323\004\b\000\030>\000@\334\000\000\000\000p\000\214\277>\000`\334\020\000\000\000\000P\263\323\004\b\000\030=\000@\334\000\000\000\000p\000\214\277=\000`\334\020\000\000\000\000P\263\323\004\b\000\030<\000@\334\000\000\000\000p\000\214\277<\000`\334\020\000\000\000\000P\263\323\004\b\000\030;\000@\334\000\000\000\000p\000\214\277;\000`\334\020\000\000\000\000P\263\323\004\b\000\030:\000@\334\000\000\000\000p\000\214\277:\000`\334\020\000\000\000\000P\263\323\004\b\000\0309\000@\334\000\000\000\000p\000\214\2779\000`\334\020\000\000\000\000P\263\323\004\b\000\0308\000@\334\000\000\000\000p\000\214\2778\000`\334\020\000\000\000\000P\263\323\004\b\000\0307\000@\334\000\000\000\000p\000\214\2777\000`\334\020\000\000\000\000P\263\323\004\b\000\0306\000@\334\000\000\000\000p\000\214\2776\000`\334\020\000\000\000\000P\263\323\004\b\000\0305\000@\334\000\000\000\000p\000\214\2775\000`\334\020\000\000\000\000P\263\323\004\b\000\0304\000@\334\000\000\000\000p\000\214\2774\000`\334\020\000\000\000\000P\263\323\004\b\000\0303\000@\334\000\000\000\000p\000\214\2773\000`\334\020\000\000\000\000P\263\323\004\b\000\0302\000@\334\000\000\000\000p\000\214\2772\000`\334\020\000\000\000\000P\263\323\004\b\000\0301\000@\334\000\000\000\000p\000\214\2771\000`\334\020\000\000\000\000P\263\323\004\b\000\0300\000@\334\000\000\000\000p\000\214\2770\000`\334\020\000\000\000\000P\263\323\004\b\000\030/\000@\334\000\000\000\000p\000\214\277/\000`\334\020\000\000\000\000P\263\323\004\b\000\030.\000@\334\000\000\000\000p\000\214\277.\000`\334\020\000\000\000\000P\263\323\004\b\000\030-\000@\334\000\000\000\000p\000\214\277-\000`\334\020\000\000\000\000P\263\323\004\b\000\030,\000@\334\000\000\000\000p\000\214\277,\000`\334\020\000\000\000\000P\263\323\004\b\000\030+\000@\334\000\000\000\000p\000\214\277+\000`\334\020\000\000\000\000P\263\323\004\b\000\030*\000@\334\000\000\000\000p\000\214\277*\000`\334\020\000\000\000\000P\263\323\004\b\000\030)\000@\334\000\000\000\000p\000\214\277)\000`\334\020\000\000\000\000P\263\323\004\b\000\030(\000@\334\000\000\000\000p\000\214\277(\000`\334\020\000\000\000\000P\263\323\004\b\000\030'\000@\334\000\000\000\000p\000\214\277'\000`\334\020\000\000\000\000P\263\323\004\b\000\030&\000@\334\000\000\000\000p\000\214\277&\000`\334\020\000\000\000\000P\263\323\004\b\000\030%\000@\334\000\000\000\000p\000\214\277%\000`\334\020\000\000\000\000P\263\323\004\b\000\030$\000@\334\000\000\000\000p\000\214\277$\000`\334\020\000\000\000\000P\263\323\004\b\000\030#\000@\334\000\000\000\000p\000\214\277#\000`\334\020\000\000\000\000P\263\323\004\b\000\030\"\000@\334\000\000\000\000p\000\214\277\"\000`\334\020\000\000\000\000P\263\323\004\b\000\030!\000@\334\000\000\000\000p\000\214\277!\000`\334\020\000\000\000\000P\263\323\004\b\000\030 \000@\334\000\000\000\000p\000\214\277 \000`\334\020\000\000\000\000P\263\323\004\b\000\030\037\000@\334\000\000\000\000p\000\214\277\037\000`\334\020\000\000\000\000P\263\323\004\b\000\030\036\000@\334\000\000\000\000p\000\214\277\036\000`\334\020\000\000\000\000P\263\323\004\b\000\030\035\000@\334\000\000\000\000p\000\214\277\035\000`\334\020\000\000\000\000P\263\323\004\b\000\030\034\000@\334\000\000\000\000p\000\214\277\034\000`\334\020\000\000\000\000P\263\323\004\b\000\030\033\000@\334\000\000\000\000p\000\214\277\033\000`\334\020\000\000\000\000P\263\323\004\b\000\030\032\000@\334\000\000\000\000p\000\214\277\032\000`\334\020\000\000\000\000P\263\323\004\b\000\030\031\000@\334\000\000\000\000p\000\214\277\031\000`\334\020\000\000\000\000P\263\323\004\b\000\030\030\000@\334\000\000\000\000p\000\214\277\030\000`\334\020\000\000\000\000P\263\323\004\b\000\030\027\000@\334\000\000\000\000p\000\214\277\027\000`\334\020\000\000\000\000P\263\323\004\b\000\030\026\000@\334\000\000\000\000p\000\214\277\026\000`\334\020\000\000\000\000P\263\323\004\b\000\030\025\000@\334\000\000\000\000p\000\214\277\025\000`\334\020\000\000\000\000P\263\323\004\b\000\030\024\000@\334\000\000\000\000p\000\214\277\024\000`\334\020\000\000\000\000P\263\323\004\b\000\030\023\000@\334\000\000\000\000p\000\214\277\023\000`\334\020\000\000\000\000P\263\323\004\b\000\030\022\000@\334\000\000\000\000p\000\214\277\022\000`\334\020\000\000\000\000P\263\323\004\b\000\030\021\000@\334\000\000\000\000p\000\214\277\021\000`\334\020\000\000\000\000P\263\323\004\b\000\030\020\000@\334\000\000\000\000p\000\214\277\020\000`\334\020\000\000\000\000P\263\323\004\b\000\030\017\000@\334\000\000\000\000p\000\214\277\017\000`\334\020\000\000\000\000P\263\323\004\b\000\030\016\000@\334\000\000\000\000p\000\214\277\016\000`\334\020\000\000\000\000P\263\323\004\b\000\030\r\000@\334\000\000\000\000p\000\214\277\r\000`\334\020\000\000\000\000P\263\323\004\b\000\030\f\000@\334\000\000\000\000p\000\214\277\f\000`\334\020\000\000\000\000P\263\323\004\b\000\030\013\000@\334\000\000\000\000p\000\214\277\013\000`\334\020\000\000\000\000P\263\323\004\b\000\030\n\000@\334\000\000\000\000p\000\214\277\n\000`\334\020\000\000\000\000P\263\323\004\b\000\030\t\000@\334\000\000\000\000p\000\214\277\t\000`\334\020\000\000\000\000P\263\323\004\b\000\030\b\000@\334\000\000\000\000p\000\214\277\b\000`\334\020\000\000\000\000P\263\323\004\b\000\030\007\000@\334\000\000\000\000p\000\214\277\007\000`\334\020\000\000\000\000P\263\323\004\b\000\030\006\000@\334\000\000\000\000p\000\214\277\006\000`\334\020\000\000\000\000P\263\323\004\b\000\030\005\000@\334\000\000\000\000p\000\214\277\005\000`\334\020\000\000\000\000P\263\323\004\b\000\030\004\000@\334\000\000\000\000p\000\214\277\004\000`\334\020\000\000\000\000P\263\323\004\b\000\030\003\000@\334\000\000\000\000p\000\214\277\003\000`\334\020\000\000\000\000P\263\323\004\b\000\030\002\000@\334\000\000\000\000p\000\214\277\002\000`\334\020\000\000\000\000P\263\323\004\b\000\030\001\000@\334\000\000\000\000p\000\214\277\001\000`\334\020\000\000\000\000P\263\323\004\b\000\030\000\000@\334\000\000\000\000p\000\214\277\000\000`\334\020\000\000\000\000\000P\334\036\000\000#\000\000\200\277H\000T\334\020\000\000\000p\000\214\277\000\200\\\334\000\000\177\000\200\000\232\276~\001\226\276p\017\214\277\000\005\b~\001\005\n~\030\000\352\320\004\000\002\000\002\005\f~\003\005\016~\034\000\352\320\006\004\002\000\030\034\230\206\030 \230\276\001\000\200\277\000 \000\340#\"\001\032~\030\376\210\361\377\211\277\026\001\376\276\000\000P\334\032\000\000\000\000\000P\334\024\000\000\001p\000\214\277\000\0004\321\000\003\002\000\001\000\021\321\237\000\002\000\202\000\204\276\000\000\217\322\004\000\002\000\000\034\204\276\004\377\004\200\224\026\000\000\005\377\005\202\000\000\000\000\002\001\006\300\000\000\000\000\177\300\214\277\000\006\031\321\004\000\002\000\005\002\004~\001\004\034\321\002\003\032\000\000\000P\334\000\000\000\000p\000\214\277\000\000\002\321\"\001\002\000\000\000p\334 \000\000\000\000\000P\334 \000\000\000\000\000\200\277\000\000P\334\034\000\000\001p\000\214\277\001\000;\321\000\001\002\000\000\000p\334\034\001\000\000\006\000\202\277~\024\376\207~\022\204\206\004\020\220\207~\020\376\211-\375\211\277\013\000\202\277\000\000P\334\024\000\000\000\201\000\204\276p\000\214\277\000\0004\321\000\t\000\000\000\000p\334\024\000\000\000\200\001\204\276\022~\222\211\357\377\202\277~\020\376\207\000\000P\334\034\000\000\000p\000\214\277\000\000p\334\030\000\000\000\000\000P\334\030\000\000\000\000\000\200\277\000\000P\334\026\000\000\001p\000\214\277\006\000A\320\000\003\002\000~\001\204\276\004\006\206\206\006\001\376\276\n\000\210\277\000\000P\334\030\000\000\000p\000\214\277\000\000p\334\026\000\000\000\000\000P\334\022\000\000\000p\000\214\277\000\000p\334\016\000\000\000~\004\376\207\000\000P\334\022\000\000\000\201\000\204\276p\000\214\277\000\0004\321\000\t\000\000\000\000p\334\022\000\000\000\200\001\204\276\f~\214\211\363\374\202\277\000\000P\334\f\000\000\000\000\000P\334\006\000\000\001p\000\214\277\006\000\311\320\000\003\002\000~\001\204\276\004\006\206\206\006\001\376\276\022\000\210\277\000\000P\334\016\000\000\006\000\000T\334\004\000\000\000\000\000P\334\f\000\000\002\200\000\206\276\200\002\006~\202\000\206\276p\000\214\277\002\000\217\322\006\004\002\000\000\006\031\321\000\005\002\000\001\006\034\321\001\007\032\000\000\000p\334\000\006\000\000~\004\376\207\000\000\201\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\000\000\200\277\007\000\000\000\000\000\000\000\320\f\000\000\000\000\000\000\b\000\000\000\000\000\000\0000\000\000\000\000\000\000\000\t\000\000\000\000\000\000\000\030\000\000\000\000\000\000\000\006\000\000\000\000\000\000\000\260\n\000\000\000\000\000\000\013\000\000\000\000\000\000\000\030\000\000\000\000\000\000\000\005\000\000\000\000\000\000\000 \f\000\000\000\000\000\000\n\000\000\000\000\000\000\000\251\000\000\000\000\000\000\000\365\376\377o\000\000\000\000\210\013\000\000\000\000\000\000\004\000\000\000\000\000\000\000\320\013\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000clang version 16.0.0 (https://github.com/llvm/llvm-project.git 159fb378f779ac79f7d456ea233892ad526b56d8)\000\000clang version 3.8.0 (tags/RELEASE_380/final)\000Linker: LLD 16.0.0\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\251\000\000\000\000\002\t\000\200E\000\000\000\000\000\000\000\000\000\000\000\000\000\000\001\000\000\000\022\003\b\000\000\036\000\000\000\000\000\000X\002\000\000\000\000\000\000\032\000\000\000\021\000\007\000\000\r\000\000\000\000\000\000@\000\000\000\000\000\000\0006\000\000\000\022\003\b\000\000!\000\000\000\000\000\000l\020\000\000\000\000\000\000T\000\000\000\021\000\013\0000g\000\000\000\000\000\000X\000\000\000\000\000\000\000_\000\000\000\021\000\013\0000V\000\000\000\000\000\000\000\021\000\000\000\000\000\000j\000\000\000\021\000\007\000@\r\000\000\000\000\000\000@\000\000\000\000\000\000\000\213\000\000\000\021\000\013\000\220g\000\000\000\000\000\000X\000\000\000\000\000\000\000\236\000\000\000\021\000\013\000\360g\000\000\000\000\000\000X\000\000\000\000\000\000\000\000.note\000.dynsym\000.gnu.hash\000.hash\000.dynstr\000.rela.dyn\000.rodata\000.text\000.dynamic\000.got\000.bss\000.AMDGPU.csdata\000.comment\000.symtab\000.shstrtab\000.strtab\000\000_Z14invert_mappingPfS_ii\000_Z14invert_mappingPfS_ii.kd\000_Z11kmeansPointPfiiiPiS_S_S0_\000t_features\000c_clusters\000_Z11kmeansPointPfiiiPiS_S_S0_.kd\000t_features_flipped\000t_clusters\000_DYNAMIC\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\001\000\000\000\007\000\000\000\002\000\000\000\000\000\000\0008\002\000\000\000\000\000\0008\002\000\000\000\000\000\000x\b\000\000\000\000\000\000\000\000\000\000\000\000\000\000\004\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\007\000\000\000\013\000\000\000\002\000\000\000\000\000\000\000\260\n\000\000\000\000\000\000\260\n\000\000\000\000\000\000\330\000\000\000\000\000\000\000\005\000\000\000\001\000\000\000\b\000\000\000\000\000\000\000\030\000\000\000\000\000\000\000\017\000\000\000\366\377\377o\002\000\000\000\000\000\000\000\210\013\000\000\000\000\000\000\210\013\000\000\000\000\000\000H\000\000\000\000\000\000\000\002\000\000\000\000\000\000\000\b\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\031\000\000\000\005\000\000\000\002\000\000\000\000\000\000\000\320\013\000\000\000\000\000\000\320\013\000\000\000\000\000\000P\000\000\000\000\000\000\000\002\000\000\000\000\000\000\000\004\000\000\000\000\000\000\000\004\000\000\000\000\000\000\000\037\000\000\000\003\000\000\000\002\000\000\000\000\000\000\000 \f\000\000\000\000\000\000 \f\000\000\000\000\000\000\251\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\001\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000'\000\000\000\004\000\000\000\002\000\000\000\000\000\000\000\320\f\000\000\000\000\000\000\320\f\000\000\000\000\000\0000\000\000\000\000\000\000\000\002\000\000\000\000\000\000\000\b\000\000\000\000\000\000\000\030\000\000\000\000\000\000\0001\000\000\000\001\000\000\000\002\000\000\000\000\000\000\000\000\r\000\000\000\000\000\000\000\r\000\000\000\000\000\000\200\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000@\000\000\000\000\000\000\000\000\000\000\000\000\000\000\0009\000\000\000\001\000\000\000\006\000\000\000\000\000\000\000\000\036\000\000\000\000\000\000\000\016\000\000\000\000\000\000\200\027\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\001\000\000\000\000\000\000\000\000\000\000\000\000\000\000?\000\000\000\006\000\000\000\003\000\000\000\000\000\000\000\200E\000\000\000\000\000\000\200%\000\000\000\000\000\000\240\000\000\000\000\000\000\000\005\000\000\000\000\000\000\000\b\000\000\000\000\000\000\000\020\000\000\000\000\000\000\000H\000\000\000\001\000\000\000\003\000\000\000\000\000\000\000 F\000\000\000\000\000\000 &\000\000\000\000\000\000\020\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\b\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000M\000\000\000\b\000\000\000\003\000\000\000\000\000\000\0000V\000\000\000\000\000\0000&\000\000\000\000\000\000\030\022\000\000\000\000\000\000\000\000\000\000\000\000\000\000\020\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000R\000\000\000\001\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\0000&\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\001\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000a\000\000\000\001\000\000\0000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\0000&\000\000\000\000\000\000\252\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\001\000\000\000\000\000\000\000\001\000\000\000\000\000\000\000j\000\000\000\002\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\340&\000\000\000\000\000\000\360\000\000\000\000\000\000\000\020\000\000\000\002\000\000\000\b\000\000\000\000\000\000\000\030\000\000\000\000\000\000\000r\000\000\000\003\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\320'\000\000\000\000\000\000\204\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\001\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000|\000\000\000\003\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000T(\000\000\000\000\000\000\262\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\001\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000"
	.size	_cupbop_amdgpu_fatbin_wrapper, 15689

	.ident	"clang version 16.0.0 (https://github.com/llvm/llvm-project.git 159fb378f779ac79f7d456ea233892ad526b56d8)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
	.addrsig_sym _Z29__device_stub__invert_mappingPfS_ii
	.addrsig_sym _Z26__device_stub__kmeansPointPfiiiPiS_S_S0_
	.addrsig_sym _GLOBAL__sub_I_kmeans_cuda.cu
	.addrsig_sym __cuda_module_ctor
	.addrsig_sym __cuda_module_dtor
	.addrsig_sym t_features
	.addrsig_sym t_features_flipped
	.addrsig_sym t_clusters
	.addrsig_sym c_clusters
	.addrsig_sym feature_d
	.addrsig_sym feature_flipped_d
	.addrsig_sym membership_d
	.addrsig_sym clusters_d
	.addrsig_sym __cuda_fatbin_wrapper
	.addrsig_sym _cupbop_amdgpu_fatbin_wrapper

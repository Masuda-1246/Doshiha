	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 12, 0	sdk_version 12, 3
	.section	__TEXT,__literal16,16byte_literals
	.p2align	4                               ## -- Begin function main
LCPI0_0:
	.quad	0x8000000000000000              ## double -0
	.quad	0x8000000000000000              ## double -0
LCPI0_1:
	.quad	0x3fdfffffffffffff              ## double 0.49999999999999994
	.quad	0x3fdfffffffffffff              ## double 0.49999999999999994
	.section	__TEXT,__literal8,8byte_literals
	.p2align	3
LCPI0_2:
	.quad	0x406e000000000000              ## double 240
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_main
	.p2align	4, 0x90
_main:                                  ## @main
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movl	$0, -4(%rbp)
	movl	$67108864, %eax                 ## imm = 0x4000000
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	movw	$3843, (%rax)                   ## imm = 0xF03
	movw	$32736, -18(%rbp)               ## imm = 0x7FE0
	movl	$100663296, %eax                ## imm = 0x6000000
	movq	%rax, -16(%rbp)
	movw	$31, -20(%rbp)
	movw	$112, -22(%rbp)
	movw	$108, -24(%rbp)
	movw	$112, -26(%rbp)
	movw	$108, -28(%rbp)
	movw	-28(%rbp), %ax
	movzwl	%ax, %eax
	movw	-24(%rbp), %cx
	movzwl	%cx, %ecx
	subl	%ecx, %eax
	movw	-22(%rbp), %cx
	movzwl	%cx, %ecx
	movw	-26(%rbp), %dx
	movzwl	%dx, %edx
	subl	%edx, %ecx
	cltd
	idivl	%ecx
                                        ## kill: def $ax killed $ax killed $eax
	movw	%ax, -30(%rbp)
	movl	$0, -36(%rbp)
LBB0_1:                                 ## =>This Inner Loop Header: Depth=1
	cmpl	$38400, -36(%rbp)               ## imm = 0x9600
	jge	LBB0_4
## %bb.2:                               ##   in Loop: Header=BB0_1 Depth=1
	movw	-18(%rbp), %cx
	movq	-16(%rbp), %rax
	movw	%cx, (%rax)
	movq	-16(%rbp), %rax
	addq	$2, %rax
	movq	%rax, -16(%rbp)
## %bb.3:                               ##   in Loop: Header=BB0_1 Depth=1
	movl	-36(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -36(%rbp)
	jmp	LBB0_1
LBB0_4:
	movl	$0, -36(%rbp)
LBB0_5:                                 ## =>This Inner Loop Header: Depth=1
	movl	-36(%rbp), %eax
	movw	-26(%rbp), %cx
	movzwl	%cx, %ecx
	movw	-22(%rbp), %dx
	movzwl	%dx, %edx
	subl	%edx, %ecx
	cmpl	%ecx, %eax
	jge	LBB0_8
## %bb.6:                               ##   in Loop: Header=BB0_5 Depth=1
	movq	$100663296, -16(%rbp)           ## imm = 0x6000000
	movzwl	-22(%rbp), %eax
	movl	-36(%rbp), %ecx
	addl	%ecx, %eax
	cvtsi2sd	%eax, %xmm0
	movzwl	-24(%rbp), %eax
	cvtsi2sd	%eax, %xmm1
	movzwl	-30(%rbp), %eax
	movl	-36(%rbp), %ecx
	imull	%ecx, %eax
	cvtsi2sd	%eax, %xmm2
	movaps	%xmm2, %xmm4
	movaps	LCPI0_0(%rip), %xmm3            ## xmm3 = [-0.0E+0,-0.0E+0]
	pand	%xmm3, %xmm4
	movaps	LCPI0_1(%rip), %xmm3            ## xmm3 = [4.9999999999999994E-1,4.9999999999999994E-1]
	por	%xmm4, %xmm3
	addsd	%xmm3, %xmm2
	roundsd	$11, %xmm2, %xmm2
	addsd	%xmm2, %xmm1
	movsd	LCPI0_2(%rip), %xmm2            ## xmm2 = mem[0],zero
	mulsd	%xmm2, %xmm1
	addsd	%xmm1, %xmm0
	cvttsd2si	%xmm0, %eax
                                        ## kill: def $ax killed $ax killed $eax
	movw	%ax, -32(%rbp)
	movw	-32(%rbp), %ax
	movzwl	%ax, %ecx
	movq	-16(%rbp), %rax
	movslq	%ecx, %rcx
	shlq	$1, %rcx
	addq	%rcx, %rax
	movq	%rax, -16(%rbp)
	movw	-20(%rbp), %cx
	movq	-16(%rbp), %rax
	movw	%cx, (%rax)
## %bb.7:                               ##   in Loop: Header=BB0_5 Depth=1
	movl	-36(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -36(%rbp)
	jmp	LBB0_5
LBB0_8:
	jmp	LBB0_9
LBB0_9:
	xorl	%eax, %eax
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
.subsections_via_symbols

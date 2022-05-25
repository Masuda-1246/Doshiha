	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 12, 0	sdk_version 12, 3
	.globl	_main                           ## -- Begin function main
	.p2align	4, 0x90
_main:                                  ## @main
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$80, %rsp
	movl	$0, -4(%rbp)
	movl	$100, -16(%rbp)
	movl	$100, -20(%rbp)
	movl	$80, -24(%rbp)
	movl	$100, -28(%rbp)
	movw	$64, -58(%rbp)
	movw	$128, -60(%rbp)
	movw	$16, -62(%rbp)
	movw	$32, -64(%rbp)
	movw	$32736, -66(%rbp)               ## imm = 0x7FE0
	movw	$31, -68(%rbp)
	movl	$67109168, %eax                 ## imm = 0x4000130
	movq	%rax, -56(%rbp)
	movq	-56(%rbp), %rax
	movw	(%rax), %ax
	movw	%ax, -42(%rbp)
	movl	$67108864, %eax                 ## imm = 0x4000000
	movq	%rax, -40(%rbp)
	movl	$0, -8(%rbp)
LBB0_1:                                 ## =>This Inner Loop Header: Depth=1
	cmpl	$38400, -8(%rbp)                ## imm = 0x9600
	jge	LBB0_4
## %bb.2:                               ##   in Loop: Header=BB0_1 Depth=1
	movw	-66(%rbp), %cx
	movq	-40(%rbp), %rax
	movw	%cx, (%rax)
	movq	-40(%rbp), %rax
	addq	$2, %rax
	movq	%rax, -40(%rbp)
## %bb.3:                               ##   in Loop: Header=BB0_1 Depth=1
	movl	-8(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -8(%rbp)
	jmp	LBB0_1
LBB0_4:
	movw	-68(%rbp), %ax
	movzwl	%ax, %edi
	callq	_create_snake
LBB0_5:                                 ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB0_6 Depth 2
	movl	$0, -12(%rbp)
LBB0_6:                                 ##   Parent Loop BB0_5 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	cmpl	$10000, -12(%rbp)               ## imm = 0x2710
	jge	LBB0_9
## %bb.7:                               ##   in Loop: Header=BB0_6 Depth=2
	jmp	LBB0_8
LBB0_8:                                 ##   in Loop: Header=BB0_6 Depth=2
	movl	-12(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -12(%rbp)
	jmp	LBB0_6
LBB0_9:                                 ##   in Loop: Header=BB0_5 Depth=1
	movl	$67109168, %eax                 ## imm = 0x4000130
	movq	%rax, -56(%rbp)
	movq	-56(%rbp), %rax
	movw	(%rax), %ax
	movw	%ax, -42(%rbp)
	movw	-42(%rbp), %ax
	movzwl	%ax, %eax
	movw	-58(%rbp), %cx
	movzwl	%cx, %ecx
	andl	%ecx, %eax
	movw	-58(%rbp), %cx
	movzwl	%cx, %ecx
	cmpl	%ecx, %eax
	je	LBB0_11
## %bb.10:                              ##   in Loop: Header=BB0_5 Depth=1
	movl	-20(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -20(%rbp)
	movl	-16(%rbp), %edi
	movl	-20(%rbp), %esi
	movw	-66(%rbp), %dx
	movl	-24(%rbp), %ecx
	movl	-28(%rbp), %r8d
	movw	-68(%rbp), %ax
	movzwl	%dx, %edx
	movzwl	%ax, %r9d
	callq	_move_snake
	movl	-28(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -28(%rbp)
	jmp	LBB0_20
LBB0_11:                                ##   in Loop: Header=BB0_5 Depth=1
	movw	-42(%rbp), %ax
	movzwl	%ax, %eax
	movw	-60(%rbp), %cx
	movzwl	%cx, %ecx
	andl	%ecx, %eax
	movw	-60(%rbp), %cx
	movzwl	%cx, %ecx
	cmpl	%ecx, %eax
	je	LBB0_13
## %bb.12:                              ##   in Loop: Header=BB0_5 Depth=1
	movl	-20(%rbp), %eax
	subl	$1, %eax
	movl	%eax, -20(%rbp)
	movl	-16(%rbp), %edi
	movl	-20(%rbp), %esi
	movw	-66(%rbp), %dx
	movl	-24(%rbp), %ecx
	movl	-28(%rbp), %r8d
	movw	-68(%rbp), %ax
	movzwl	%dx, %edx
	movzwl	%ax, %r9d
	callq	_move_snake
	movl	-28(%rbp), %eax
	subl	$1, %eax
	movl	%eax, -28(%rbp)
	jmp	LBB0_19
LBB0_13:                                ##   in Loop: Header=BB0_5 Depth=1
	movw	-42(%rbp), %ax
	movzwl	%ax, %eax
	movw	-62(%rbp), %cx
	movzwl	%cx, %ecx
	andl	%ecx, %eax
	movw	-62(%rbp), %cx
	movzwl	%cx, %ecx
	cmpl	%ecx, %eax
	je	LBB0_15
## %bb.14:                              ##   in Loop: Header=BB0_5 Depth=1
	movl	-16(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -16(%rbp)
	movl	-16(%rbp), %edi
	movl	-20(%rbp), %esi
	movw	-66(%rbp), %dx
	movl	-24(%rbp), %ecx
	movl	-28(%rbp), %r8d
	movw	-68(%rbp), %ax
	movzwl	%dx, %edx
	movzwl	%ax, %r9d
	callq	_move_snake
	movl	-24(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -24(%rbp)
	jmp	LBB0_18
LBB0_15:                                ##   in Loop: Header=BB0_5 Depth=1
	movw	-42(%rbp), %ax
	movzwl	%ax, %eax
	movw	-64(%rbp), %cx
	movzwl	%cx, %ecx
	andl	%ecx, %eax
	movw	-64(%rbp), %cx
	movzwl	%cx, %ecx
	cmpl	%ecx, %eax
	je	LBB0_17
## %bb.16:                              ##   in Loop: Header=BB0_5 Depth=1
	movl	-16(%rbp), %eax
	subl	$1, %eax
	movl	%eax, -16(%rbp)
	movl	-16(%rbp), %edi
	movl	-20(%rbp), %esi
	movw	-66(%rbp), %dx
	movl	-24(%rbp), %ecx
	movl	-28(%rbp), %r8d
	movw	-68(%rbp), %ax
	movzwl	%dx, %edx
	movzwl	%ax, %r9d
	callq	_move_snake
	movl	-24(%rbp), %eax
	subl	$1, %eax
	movl	%eax, -24(%rbp)
LBB0_17:                                ##   in Loop: Header=BB0_5 Depth=1
	jmp	LBB0_18
LBB0_18:                                ##   in Loop: Header=BB0_5 Depth=1
	jmp	LBB0_19
LBB0_19:                                ##   in Loop: Header=BB0_5 Depth=1
	jmp	LBB0_20
LBB0_20:                                ##   in Loop: Header=BB0_5 Depth=1
	jmp	LBB0_5
	.cfi_endproc
                                        ## -- End function
	.globl	_create_snake                   ## -- Begin function create_snake
	.p2align	4, 0x90
_create_snake:                          ## @create_snake
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movw	%di, %ax
	movw	%ax, -2(%rbp)
	movl	$100663296, %eax                ## imm = 0x6000000
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	addq	$48200, %rax                    ## imm = 0xBC48
	movq	%rax, -16(%rbp)
	movl	$0, -20(%rbp)
LBB1_1:                                 ## =>This Inner Loop Header: Depth=1
	cmpl	$20, -20(%rbp)
	jge	LBB1_4
## %bb.2:                               ##   in Loop: Header=BB1_1 Depth=1
	movw	-2(%rbp), %cx
	movq	-16(%rbp), %rax
	movw	%cx, (%rax)
	movq	-16(%rbp), %rax
	addq	$2, %rax
	movq	%rax, -16(%rbp)
## %bb.3:                               ##   in Loop: Header=BB1_1 Depth=1
	movl	-20(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -20(%rbp)
	jmp	LBB1_1
LBB1_4:
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_move_snake                     ## -- Begin function move_snake
	.p2align	4, 0x90
_move_snake:                            ## @move_snake
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movw	%r9w, %ax
                                        ## kill: def $dx killed $dx killed $edx
	movl	%edi, -4(%rbp)
	movl	%esi, -8(%rbp)
	movw	%dx, -10(%rbp)
	movl	%ecx, -16(%rbp)
	movl	%r8d, -20(%rbp)
	movw	%ax, -22(%rbp)
	movl	$100663296, %eax                ## imm = 0x6000000
	movq	%rax, -32(%rbp)
	movl	$100663296, %eax                ## imm = 0x6000000
	movq	%rax, -40(%rbp)
	imull	$240, -8(%rbp), %ecx
	addl	-4(%rbp), %ecx
	movq	-32(%rbp), %rax
	movslq	%ecx, %rcx
	shlq	$1, %rcx
	addq	%rcx, %rax
	movq	%rax, -32(%rbp)
	imull	$240, -20(%rbp), %ecx
	addl	-16(%rbp), %ecx
	movq	-40(%rbp), %rax
	movslq	%ecx, %rcx
	shlq	$1, %rcx
	addq	%rcx, %rax
	movq	%rax, -40(%rbp)
	movw	-22(%rbp), %cx
	movq	-32(%rbp), %rax
	movw	%cx, (%rax)
	movw	-10(%rbp), %cx
	movq	-40(%rbp), %rax
	movw	%cx, (%rax)
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
.subsections_via_symbols

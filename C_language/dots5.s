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
	movl	$0, -4(%rbp)
	movl	$67108864, %eax                 ## imm = 0x4000000
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	movw	$3843, (%rax)                   ## imm = 0xF03
	movw	$32767, -18(%rbp)               ## imm = 0x7FFF
	movl	$100663296, %eax                ## imm = 0x6000000
	movq	%rax, -16(%rbp)
	movl	$0, -24(%rbp)
LBB0_1:                                 ## =>This Inner Loop Header: Depth=1
	cmpl	$4, -24(%rbp)
	jge	LBB0_4
## %bb.2:                               ##   in Loop: Header=BB0_1 Depth=1
	movw	-18(%rbp), %cx
	movq	-16(%rbp), %rax
	movw	%cx, (%rax)
	movq	-16(%rbp), %rax
	addq	$4, %rax
	movq	%rax, -16(%rbp)
## %bb.3:                               ##   in Loop: Header=BB0_1 Depth=1
	movl	-24(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -24(%rbp)
	jmp	LBB0_1
LBB0_4:
	jmp	LBB0_5
LBB0_5:                                 ## =>This Inner Loop Header: Depth=1
	jmp	LBB0_5
	.cfi_endproc
                                        ## -- End function
.subsections_via_symbols

	.file	"sort.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"\tSorted: "
.LC1:
	.string	"%d "
.LC2:
	.string	"\nProcess returned %d"
	.text
	.p2align 4,,15
	.globl	bubble_sort
	.type	bubble_sort, @function
bubble_sort:
.LFB41:
	.cfi_startproc
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	movl	%esi, %r12d
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	movq	%rdi, %rbp
	movl	%edx, %ebx
	subq	$8, %rsp
	.cfi_def_cfa_offset 48
	testl	%esi, %esi
	jle	.L2
	leal	-2(%rsi), %r8d
	leaq	4(%rdi), %r9
	cmpl	$-1, %r8d
	je	.L2
	.p2align 4,,10
	.p2align 3
.L6:
	movl	%r8d, %edx
	movq	%rbp, %rax
	movl	$1, %edi
	leaq	(%r9,%rdx,4), %rsi
	.p2align 4,,10
	.p2align 3
.L5:
	movl	(%rax), %edx
	movl	4(%rax), %ecx
	cmpl	%ecx, %edx
	jle	.L4
	movl	%ecx, (%rax)
	movl	%edx, 4(%rax)
	addl	$1, %ebx
	xorl	%edi, %edi
.L4:
	addq	$4, %rax
	cmpq	%rsi, %rax
	jne	.L5
	testb	%dil, %dil
	jne	.L2
	subl	$1, %r8d
	cmpl	$-1, %r8d
	jne	.L6
.L2:
	leaq	.LC0(%rip), %rsi
	xorl	%eax, %eax
	movl	$1, %edi
	call	__printf_chk@PLT
	testl	%r12d, %r12d
	jle	.L7
	leal	-1(%r12), %eax
	leaq	.LC1(%rip), %r12
	leaq	4(%rbp,%rax,4), %r13
	.p2align 4,,10
	.p2align 3
.L8:
	movl	0(%rbp), %edx
	xorl	%eax, %eax
	movq	%r12, %rsi
	movl	$1, %edi
	addq	$4, %rbp
	call	__printf_chk@PLT
	cmpq	%rbp, %r13
	jne	.L8
.L7:
	addq	$8, %rsp
	.cfi_def_cfa_offset 40
	movl	%ebx, %edx
	leaq	.LC2(%rip), %rsi
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_def_cfa_offset 8
	movl	$1, %edi
	xorl	%eax, %eax
	jmp	__printf_chk@PLT
	.cfi_endproc
.LFE41:
	.size	bubble_sort, .-bubble_sort
	.ident	"GCC: (Ubuntu 7.5.0-3ubuntu1~18.04) 7.5.0"
	.section	.note.GNU-stack,"",@progbits

	.file	"sort.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%d "
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC1:
	.string	"\nNumber of elements, involved in sorting and chaging position: %d"
	.section	.rodata.str1.1
.LC2:
	.string	"\tSorted: "
	.text
	.p2align 4,,15
	.globl	bubble_sort
	.type	bubble_sort, @function
bubble_sort:
.LFB23:
	.cfi_startproc
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	movl	%ecx, %ebx
	subq	$8, %rsp
	.cfi_def_cfa_offset 48
	testl	%edx, %edx
	jle	.L7
	leal	-2(%rdx), %r10d
	movq	%rdi, %r12
	leaq	4(%rdi), %r11
	cmpl	$-1, %r10d
	je	.L2
	.p2align 4,,10
	.p2align 3
.L6:
	movl	%r10d, %ecx
	movq	%r12, %rax
	movl	$1, %r9d
	leaq	(%r11,%rcx,4), %rcx
	.p2align 4,,10
	.p2align 3
.L5:
	movl	(%rax), %edi
	movl	4(%rax), %r8d
	cmpl	%r8d, %edi
	jle	.L4
	movl	%r8d, (%rax)
	movl	%edi, 4(%rax)
	addl	$1, %ebx
	xorl	%r9d, %r9d
.L4:
	addq	$4, %rax
	cmpq	%rcx, %rax
	jne	.L5
	testb	%r9b, %r9b
	jne	.L2
	subl	$1, %r10d
	cmpl	$-1, %r10d
	jne	.L6
.L2:
	testl	%edx, %edx
	jle	.L7
	movq	%r12, %rax
	leal	-1(%rdx), %r13d
	movl	$5, %edi
	shrq	$2, %rax
	movq	%r12, %rbp
	negq	%rax
	andl	$3, %eax
	leal	3(%rax), %ecx
	cmpl	$5, %ecx
	cmovb	%edi, %ecx
	cmpl	%ecx, %r13d
	jb	.L26
	xorl	%r9d, %r9d
	testl	%eax, %eax
	je	.L9
	movl	(%rsi), %ecx
	cmpl	%ecx, (%r12)
	movl	$1, %r9d
	setne	%cl
	movzbl	%cl, %ecx
	addl	%ecx, %ebx
	cmpl	$1, %eax
	je	.L9
	movl	4(%rsi), %ecx
	cmpl	%ecx, 4(%r12)
	movl	$2, %r9d
	setne	%cl
	movzbl	%cl, %ecx
	addl	%ecx, %ebx
	cmpl	$3, %eax
	jne	.L9
	movl	8(%r12), %ecx
	cmpl	%ecx, 8(%rsi)
	movl	$3, %r9d
	setne	%cl
	movzbl	%cl, %ecx
	addl	%ecx, %ebx
.L9:
	movl	%edx, %r8d
	movl	%eax, %ecx
	xorl	%edi, %edi
	subl	%eax, %r8d
	pxor	%xmm1, %xmm1
	pcmpeqd	%xmm2, %xmm2
	salq	$2, %rcx
	movl	%r8d, %r10d
	leaq	(%r12,%rcx), %r11
	xorl	%eax, %eax
	shrl	$2, %r10d
	addq	%rsi, %rcx
	.p2align 4,,10
	.p2align 3
.L15:
	movdqu	(%rcx,%rax), %xmm0
	addl	$1, %edi
	pcmpeqd	(%r11,%rax), %xmm0
	addq	$16, %rax
	cmpl	%edi, %r10d
	pandn	%xmm2, %xmm0
	psubd	%xmm0, %xmm1
	ja	.L15
	movdqa	%xmm1, %xmm0
	movl	%r8d, %ecx
	andl	$-4, %ecx
	psrldq	$8, %xmm0
	paddd	%xmm0, %xmm1
	movdqa	%xmm1, %xmm0
	psrldq	$4, %xmm0
	paddd	%xmm0, %xmm1
	movd	%xmm1, %eax
	addl	%eax, %ebx
	cmpl	%ecx, %r8d
	leal	(%rcx,%r9), %eax
	je	.L16
.L8:
	movslq	%eax, %rcx
	movl	(%rsi,%rcx,4), %edi
	cmpl	%edi, (%r12,%rcx,4)
	je	.L17
	addl	$1, %ebx
.L17:
	leal	1(%rax), %ecx
	cmpl	%edx, %ecx
	jge	.L16
	movslq	%ecx, %rcx
	movl	(%r12,%rcx,4), %edi
	cmpl	%edi, (%rsi,%rcx,4)
	je	.L18
	addl	$1, %ebx
.L18:
	leal	2(%rax), %ecx
	cmpl	%edx, %ecx
	jge	.L16
	movslq	%ecx, %rcx
	movl	(%rsi,%rcx,4), %edi
	cmpl	%edi, (%r12,%rcx,4)
	je	.L19
	addl	$1, %ebx
.L19:
	leal	3(%rax), %ecx
	cmpl	%ecx, %edx
	jle	.L16
	movslq	%ecx, %rcx
	movl	(%rsi,%rcx,4), %edi
	cmpl	%edi, (%r12,%rcx,4)
	je	.L20
	addl	$1, %ebx
.L20:
	leal	4(%rax), %ecx
	cmpl	%ecx, %edx
	jle	.L16
	movslq	%ecx, %rcx
	movl	(%rsi,%rcx,4), %edi
	cmpl	%edi, (%r12,%rcx,4)
	je	.L21
	addl	$1, %ebx
.L21:
	addl	$5, %eax
	cmpl	%eax, %edx
	jle	.L16
	cltq
	movl	(%rsi,%rax,4), %esi
	cmpl	%esi, (%r12,%rax,4)
	je	.L16
	addl	$1, %ebx
.L16:
	leaq	.LC2(%rip), %rsi
	leaq	4(%r12,%r13,4), %r13
	leaq	.LC0(%rip), %r12
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	.p2align 4,,10
	.p2align 3
.L24:
	movl	0(%rbp), %edx
	xorl	%eax, %eax
	movq	%r12, %rsi
	movl	$1, %edi
	addq	$4, %rbp
	call	__printf_chk@PLT
	cmpq	%r13, %rbp
	jne	.L24
.L25:
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	movl	%ebx, %edx
	leaq	.LC1(%rip), %rsi
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
.L7:
	.cfi_restore_state
	leaq	.LC2(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	jmp	.L25
.L26:
	xorl	%eax, %eax
	jmp	.L8
	.cfi_endproc
.LFE23:
	.size	bubble_sort, .-bubble_sort
	.ident	"GCC: (Ubuntu 7.5.0-3ubuntu1~18.04) 7.5.0"
	.section	.note.GNU-stack,"",@progbits

	.file	"sort.c"
	.text
	.section .rdata,"dr"
.LC0:
	.ascii "%d \0"
	.align 8
.LC1:
	.ascii "Number of elements, involved in sorting  and changing position: %d\0"
.LC2:
	.ascii "\11Sorted: \0"
	.text
	.p2align 4,,15
	.globl	bubble_sort
	.def	bubble_sort;	.scl	2;	.type	32;	.endef
	.seh_proc	bubble_sort
bubble_sort:
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$40, %rsp
	.seh_stackalloc	40
	.seh_endprologue
	movq	%rcx, %rbx
	movl	%r9d, %esi
	testl	%r8d, %r8d
	jle	.L15
	leal	-2(%r8), %edi
	leaq	4(%rcx), %rbp
	.p2align 4,,10
.L3:
	cmpl	$-1, %edi
	je	.L2
	movl	%edi, %ecx
	movq	%rbx, %rax
	movl	$1, %r11d
	leaq	0(%rbp,%rcx,4), %r10
	.p2align 4,,10
.L7:
	movl	(%rax), %ecx
	movl	4(%rax), %r9d
	cmpl	%r9d, %ecx
	jle	.L6
	movl	%r9d, (%rax)
	xorl	%r11d, %r11d
	movl	%ecx, 4(%rax)
.L6:
	addq	$4, %rax
	cmpq	%r10, %rax
	jne	.L7
	subl	$1, %edi
	testb	%r11b, %r11b
	je	.L3
	.p2align 4,,10
.L2:
	leal	-1(%r8), %ecx
	xorl	%edi, %edi
	testl	%r8d, %r8d
	jg	.L10
	jmp	.L15
	.p2align 4,,10
.L14:
	movq	%rax, %rdi
.L10:
	movl	(%rdx,%rdi,4), %eax
	cmpl	%eax, (%rbx,%rdi,4)
	je	.L9
	addl	$1, %esi
.L9:
	leaq	1(%rdi), %rax
	cmpq	%rcx, %rdi
	jne	.L14
	leaq	.LC2(%rip), %rcx
	leaq	4(%rbx,%rdi,4), %rbp
	call	printf
	leaq	.LC0(%rip), %rdi
	.p2align 4,,10
.L12:
	movl	(%rbx), %edx
	movq	%rdi, %rcx
	addq	$4, %rbx
	call	printf
	cmpq	%rbx, %rbp
	jne	.L12
.L13:
	movl	$10, %ecx
	call	putchar
	movl	%esi, %edx
	leaq	.LC1(%rip), %rcx
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	jmp	printf
.L15:
	leaq	.LC2(%rip), %rcx
	call	printf
	jmp	.L13
	.seh_endproc
	.ident	"GCC: (GNU) 8.3.0"
	.def	printf;	.scl	2;	.type	32;	.endef
	.def	putchar;	.scl	2;	.type	32;	.endef

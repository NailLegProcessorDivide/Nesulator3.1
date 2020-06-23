	.file	"cpu.c"
	.text
	.p2align 4,,15
	.globl	CLC
	.def	CLC;	.scl	2;	.type	32;	.endef
	.seh_proc	CLC
CLC:
	.seh_endprologue
	andb	$-2, 6(%rcx)
	movl	$2, %eax
	ret
	.seh_endproc
	.p2align 4,,15
	.globl	CLI
	.def	CLI;	.scl	2;	.type	32;	.endef
	.seh_proc	CLI
CLI:
	.seh_endprologue
	andb	$-5, 6(%rcx)
	movl	$2, %eax
	ret
	.seh_endproc
	.p2align 4,,15
	.globl	CLV
	.def	CLV;	.scl	2;	.type	32;	.endef
	.seh_proc	CLV
CLV:
	.seh_endprologue
	andb	$-65, 6(%rcx)
	movl	$2, %eax
	ret
	.seh_endproc
	.p2align 4,,15
	.globl	CLD
	.def	CLD;	.scl	2;	.type	32;	.endef
	.seh_proc	CLD
CLD:
	.seh_endprologue
	andb	$-9, 6(%rcx)
	movl	$2, %eax
	ret
	.seh_endproc
	.p2align 4,,15
	.globl	SEC
	.def	SEC;	.scl	2;	.type	32;	.endef
	.seh_proc	SEC
SEC:
	.seh_endprologue
	orb	$1, 6(%rcx)
	movl	$2, %eax
	ret
	.seh_endproc
	.p2align 4,,15
	.globl	SEI
	.def	SEI;	.scl	2;	.type	32;	.endef
	.seh_proc	SEI
SEI:
	.seh_endprologue
	orb	$4, 6(%rcx)
	movl	$2, %eax
	ret
	.seh_endproc
	.p2align 4,,15
	.globl	SED
	.def	SED;	.scl	2;	.type	32;	.endef
	.seh_proc	SED
SED:
	.seh_endprologue
	orb	$8, 6(%rcx)
	movl	$2, %eax
	ret
	.seh_endproc
	.p2align 4,,15
	.globl	ROLA
	.def	ROLA;	.scl	2;	.type	32;	.endef
	.seh_proc	ROLA
ROLA:
	.seh_endprologue
	movzbl	6(%rcx), %eax
	movzbl	(%rcx), %edx
	movl	%eax, %r8d
	rolb	%dl
	andl	$127, %eax
	orl	$-128, %r8d
	testb	%dl, %dl
	movb	%dl, (%rcx)
	cmovs	%r8d, %eax
	testb	%dl, %dl
	movb	%al, 6(%rcx)
	jne	.L12
	orl	$2, %eax
.L13:
	andl	$-2, %eax
	movb	%al, 6(%rcx)
	movl	$2, %eax
	ret
	.p2align 4,,10
.L12:
	andl	$-3, %eax
	andl	$1, %edx
	movb	%al, 6(%rcx)
	je	.L13
	orl	$1, %eax
	movb	%al, 6(%rcx)
	movl	$2, %eax
	ret
	.seh_endproc
	.p2align 4,,15
	.globl	LSRA
	.def	LSRA;	.scl	2;	.type	32;	.endef
	.seh_proc	LSRA
LSRA:
	.seh_endprologue
	movzbl	(%rcx), %r8d
	movzbl	6(%rcx), %edx
	movl	%r8d, %r9d
	movl	%edx, %eax
	andl	$125, %edx
	shrb	%r9b
	andl	$127, %eax
	orl	$2, %eax
	testb	%r9b, %r9b
	movb	%r9b, (%rcx)
	cmovne	%edx, %eax
	movl	%eax, %edx
	andl	$-2, %eax
	orl	$1, %edx
	andl	$1, %r8d
	cmovne	%edx, %eax
	movb	%al, 6(%rcx)
	movl	$2, %eax
	ret
	.seh_endproc
	.p2align 4,,15
	.globl	RORA
	.def	RORA;	.scl	2;	.type	32;	.endef
	.seh_proc	RORA
RORA:
	.seh_endprologue
	movzbl	6(%rcx), %eax
	movzbl	(%rcx), %r8d
	movl	%eax, %edx
	movl	%r8d, %r9d
	movl	%eax, %r10d
	shrb	%r9b
	sall	$7, %edx
	orl	$-128, %r10d
	andl	$127, %eax
	orb	%r9b, %dl
	cmovs	%r10d, %eax
	movb	%dl, (%rcx)
	movl	%eax, %r9d
	andl	$-3, %eax
	orl	$2, %r9d
	testb	%dl, %dl
	cmove	%r9d, %eax
	movl	%eax, %r9d
	andl	$-2, %eax
	orl	$1, %r9d
	andl	$1, %r8d
	cmovne	%r9d, %eax
	movb	%al, 6(%rcx)
	movl	$2, %eax
	ret
	.seh_endproc
	.p2align 4,,15
	.globl	TAX
	.def	TAX;	.scl	2;	.type	32;	.endef
	.seh_proc	TAX
TAX:
	.seh_endprologue
	movzbl	(%rcx), %edx
	movzbl	6(%rcx), %eax
	testb	%dl, %dl
	movb	%dl, 1(%rcx)
	js	.L34
	andl	$127, %eax
	testb	%dl, %dl
	movb	%al, 6(%rcx)
	jne	.L32
	orl	$2, %eax
	movb	%al, 6(%rcx)
	movl	$2, %eax
	ret
	.p2align 4,,10
.L34:
	orl	$-128, %eax
.L32:
	andl	$-3, %eax
	movb	%al, 6(%rcx)
	movl	$2, %eax
	ret
	.seh_endproc
	.p2align 4,,15
	.globl	TAY
	.def	TAY;	.scl	2;	.type	32;	.endef
	.seh_proc	TAY
TAY:
	.seh_endprologue
	movzbl	(%rcx), %edx
	movzbl	6(%rcx), %eax
	testb	%dl, %dl
	movb	%dl, 2(%rcx)
	js	.L39
	andl	$127, %eax
	testb	%dl, %dl
	movb	%al, 6(%rcx)
	jne	.L37
	orl	$2, %eax
	movb	%al, 6(%rcx)
	movl	$2, %eax
	ret
	.p2align 4,,10
.L39:
	orl	$-128, %eax
.L37:
	andl	$-3, %eax
	movb	%al, 6(%rcx)
	movl	$2, %eax
	ret
	.seh_endproc
	.p2align 4,,15
	.globl	TSPX
	.def	TSPX;	.scl	2;	.type	32;	.endef
	.seh_proc	TSPX
TSPX:
	.seh_endprologue
	movzbl	3(%rcx), %edx
	movzbl	6(%rcx), %eax
	testb	%dl, %dl
	movb	%dl, 1(%rcx)
	js	.L44
	andl	$127, %eax
	testb	%dl, %dl
	movb	%al, 6(%rcx)
	jne	.L42
	orl	$2, %eax
	movb	%al, 6(%rcx)
	movl	$2, %eax
	ret
	.p2align 4,,10
.L44:
	orl	$-128, %eax
.L42:
	andl	$-3, %eax
	movb	%al, 6(%rcx)
	movl	$2, %eax
	ret
	.seh_endproc
	.p2align 4,,15
	.globl	TXA
	.def	TXA;	.scl	2;	.type	32;	.endef
	.seh_proc	TXA
TXA:
	.seh_endprologue
	movzbl	1(%rcx), %edx
	movzbl	6(%rcx), %eax
	testb	%dl, %dl
	movb	%dl, (%rcx)
	js	.L49
	andl	$127, %eax
	testb	%dl, %dl
	movb	%al, 6(%rcx)
	jne	.L47
	orl	$2, %eax
	movb	%al, 6(%rcx)
	movl	$2, %eax
	ret
	.p2align 4,,10
.L49:
	orl	$-128, %eax
.L47:
	andl	$-3, %eax
	movb	%al, 6(%rcx)
	movl	$2, %eax
	ret
	.seh_endproc
	.p2align 4,,15
	.globl	TYA
	.def	TYA;	.scl	2;	.type	32;	.endef
	.seh_proc	TYA
TYA:
	.seh_endprologue
	movzbl	2(%rcx), %edx
	movzbl	6(%rcx), %eax
	testb	%dl, %dl
	movb	%dl, (%rcx)
	js	.L54
	andl	$127, %eax
	testb	%dl, %dl
	movb	%al, 6(%rcx)
	jne	.L52
	orl	$2, %eax
	movb	%al, 6(%rcx)
	movl	$2, %eax
	ret
	.p2align 4,,10
.L54:
	orl	$-128, %eax
.L52:
	andl	$-3, %eax
	movb	%al, 6(%rcx)
	movl	$2, %eax
	ret
	.seh_endproc
	.p2align 4,,15
	.globl	TXS
	.def	TXS;	.scl	2;	.type	32;	.endef
	.seh_proc	TXS
TXS:
	.seh_endprologue
	movzbl	1(%rcx), %eax
	movb	%al, 3(%rcx)
	movl	$2, %eax
	ret
	.seh_endproc
	.p2align 4,,15
	.globl	INX
	.def	INX;	.scl	2;	.type	32;	.endef
	.seh_proc	INX
INX:
	.seh_endprologue
	movzbl	1(%rcx), %eax
	leal	1(%rax), %edx
	movzbl	6(%rcx), %eax
	testb	%dl, %dl
	movb	%dl, 1(%rcx)
	js	.L60
	andl	$127, %eax
	testb	%dl, %dl
	movb	%al, 6(%rcx)
	jne	.L58
	orl	$2, %eax
	movb	%al, 6(%rcx)
	movl	$2, %eax
	ret
	.p2align 4,,10
.L60:
	orl	$-128, %eax
.L58:
	andl	$-3, %eax
	movb	%al, 6(%rcx)
	movl	$2, %eax
	ret
	.seh_endproc
	.p2align 4,,15
	.globl	INY
	.def	INY;	.scl	2;	.type	32;	.endef
	.seh_proc	INY
INY:
	.seh_endprologue
	movzbl	2(%rcx), %eax
	leal	1(%rax), %edx
	movzbl	6(%rcx), %eax
	testb	%dl, %dl
	movb	%dl, 2(%rcx)
	js	.L65
	andl	$127, %eax
	testb	%dl, %dl
	movb	%al, 6(%rcx)
	jne	.L63
	orl	$2, %eax
	movb	%al, 6(%rcx)
	movl	$2, %eax
	ret
	.p2align 4,,10
.L65:
	orl	$-128, %eax
.L63:
	andl	$-3, %eax
	movb	%al, 6(%rcx)
	movl	$2, %eax
	ret
	.seh_endproc
	.p2align 4,,15
	.globl	DEX
	.def	DEX;	.scl	2;	.type	32;	.endef
	.seh_proc	DEX
DEX:
	.seh_endprologue
	movzbl	1(%rcx), %eax
	leal	-1(%rax), %edx
	movzbl	6(%rcx), %eax
	testb	%dl, %dl
	movb	%dl, 1(%rcx)
	js	.L70
	andl	$127, %eax
	testb	%dl, %dl
	movb	%al, 6(%rcx)
	jne	.L68
	orl	$2, %eax
	movb	%al, 6(%rcx)
	movl	$2, %eax
	ret
	.p2align 4,,10
.L70:
	orl	$-128, %eax
.L68:
	andl	$-3, %eax
	movb	%al, 6(%rcx)
	movl	$2, %eax
	ret
	.seh_endproc
	.p2align 4,,15
	.globl	DEY
	.def	DEY;	.scl	2;	.type	32;	.endef
	.seh_proc	DEY
DEY:
	.seh_endprologue
	movzbl	2(%rcx), %eax
	leal	-1(%rax), %edx
	movzbl	6(%rcx), %eax
	testb	%dl, %dl
	movb	%dl, 2(%rcx)
	js	.L75
	andl	$127, %eax
	testb	%dl, %dl
	movb	%al, 6(%rcx)
	jne	.L73
	orl	$2, %eax
	movb	%al, 6(%rcx)
	movl	$2, %eax
	ret
	.p2align 4,,10
.L75:
	orl	$-128, %eax
.L73:
	andl	$-3, %eax
	movb	%al, 6(%rcx)
	movl	$2, %eax
	ret
	.seh_endproc
	.p2align 4,,15
	.globl	NOP
	.def	NOP;	.scl	2;	.type	32;	.endef
	.seh_proc	NOP
NOP:
	.seh_endprologue
	movl	$2, %eax
	ret
	.seh_endproc
	.p2align 4,,15
	.globl	NOP_imm
	.def	NOP_imm;	.scl	2;	.type	32;	.endef
	.seh_proc	NOP_imm
NOP_imm:
	.seh_endprologue
	addw	$1, 4(%rcx)
	movl	$2, %eax
	ret
	.seh_endproc
	.p2align 4,,15
	.globl	ERR
	.def	ERR;	.scl	2;	.type	32;	.endef
	.seh_proc	ERR
ERR:
	subq	$40, %rsp
	.seh_stackalloc	40
	.seh_endprologue
	call	*__imp___iob_func(%rip)
	movq	%rax, %rcx
	call	getc
	movl	$10000000, %eax
	addq	$40, %rsp
	ret
	.seh_endproc
	.p2align 4,,15
	.globl	ASLA
	.def	ASLA;	.scl	2;	.type	32;	.endef
	.seh_proc	ASLA
ASLA:
	.seh_endprologue
	movzbl	6(%rcx), %eax
	movzbl	(%rcx), %edx
	movl	%eax, %r8d
	addl	%edx, %edx
	andl	$127, %eax
	orl	$-128, %r8d
	testb	$-128, %dl
	movb	%dl, (%rcx)
	cmovne	%r8d, %eax
	movl	%eax, %r8d
	andl	$-3, %eax
	orl	$2, %r8d
	testb	$-2, %dl
	cmove	%r8d, %eax
	movl	%eax, %r8d
	andl	$-2, %eax
	orl	$1, %r8d
	andb	$1, %dh
	cmovne	%r8d, %eax
	movb	%al, 6(%rcx)
	movl	$2, %eax
	ret
	.seh_endproc
	.p2align 4,,15
	.globl	NOP_absx
	.def	NOP_absx;	.scl	2;	.type	32;	.endef
	.seh_proc	NOP_absx
NOP_absx:
	pushq	%r12
	.seh_pushreg	%r12
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movzwl	4(%rcx), %ebp
	movq	16(%rcx), %rdx
	movq	%rcx, %rsi
	testq	%rdx, %rdx
	movl	%ebp, %edi
	je	.L87
	xorl	%ebx, %ebx
	.p2align 4,,10
.L89:
	movq	%rbx, %rax
	salq	$5, %rax
	addq	8(%rsi), %rax
	movzwl	16(%rax), %ecx
	cmpw	%cx, %di
	jb	.L88
	movzwl	18(%rax), %r8d
	movzwl	%cx, %r9d
	addl	%r9d, %r8d
	cmpl	%r8d, %ebp
	jge	.L88
	movl	%edi, %edx
	subl	%ecx, %edx
	movq	24(%rax), %rcx
	movzwl	%dx, %edx
	call	*(%rax)
	movq	16(%rsi), %rdx
.L88:
	addq	$1, %rbx
	cmpq	%rdx, %rbx
	jb	.L89
	movzwl	4(%rsi), %edi
	testq	%rdx, %rdx
	leal	1(%rdi), %r12d
	movzwl	%r12w, %ebp
	je	.L87
	xorl	%ebx, %ebx
	.p2align 4,,10
.L91:
	movq	%rbx, %rax
	salq	$5, %rax
	addq	8(%rsi), %rax
	movzwl	16(%rax), %ecx
	cmpw	%cx, %r12w
	jb	.L90
	movzwl	18(%rax), %r8d
	movzwl	%cx, %r9d
	addl	%r9d, %r8d
	cmpl	%r8d, %ebp
	jge	.L90
	movl	%r12d, %edx
	subl	%ecx, %edx
	movq	24(%rax), %rcx
	movzwl	%dx, %edx
	call	*(%rax)
	movq	16(%rsi), %rdx
.L90:
	addq	$1, %rbx
	cmpq	%rdx, %rbx
	jb	.L91
	movzwl	4(%rsi), %edi
.L87:
	addl	$2, %edi
	movl	$4, %eax
	movw	%di, 4(%rsi)
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	ret
	.seh_endproc
	.p2align 4,,15
	.globl	NOP_abss
	.def	NOP_abss;	.scl	2;	.type	32;	.endef
	.seh_proc	NOP_abss
NOP_abss:
	pushq	%r12
	.seh_pushreg	%r12
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movzwl	4(%rcx), %ebp
	movq	16(%rcx), %rdx
	movq	%rcx, %rsi
	testq	%rdx, %rdx
	movl	%ebp, %edi
	je	.L101
	xorl	%ebx, %ebx
	.p2align 4,,10
.L103:
	movq	%rbx, %rax
	salq	$5, %rax
	addq	8(%rsi), %rax
	movzwl	16(%rax), %ecx
	cmpw	%cx, %di
	jb	.L102
	movzwl	18(%rax), %r8d
	movzwl	%cx, %r9d
	addl	%r9d, %r8d
	cmpl	%r8d, %ebp
	jge	.L102
	movl	%edi, %edx
	subl	%ecx, %edx
	movq	24(%rax), %rcx
	movzwl	%dx, %edx
	call	*(%rax)
	movq	16(%rsi), %rdx
.L102:
	addq	$1, %rbx
	cmpq	%rdx, %rbx
	jb	.L103
	movzwl	4(%rsi), %edi
	testq	%rdx, %rdx
	leal	1(%rdi), %r12d
	movzwl	%r12w, %ebp
	je	.L101
	xorl	%ebx, %ebx
	.p2align 4,,10
.L105:
	movq	%rbx, %rax
	salq	$5, %rax
	addq	8(%rsi), %rax
	movzwl	16(%rax), %ecx
	cmpw	%cx, %r12w
	jb	.L104
	movzwl	18(%rax), %r8d
	movzwl	%cx, %r9d
	addl	%r9d, %r8d
	cmpl	%r8d, %ebp
	jge	.L104
	movl	%r12d, %edx
	subl	%ecx, %edx
	movq	24(%rax), %rcx
	movzwl	%dx, %edx
	call	*(%rax)
	movq	16(%rsi), %rdx
.L104:
	addq	$1, %rbx
	cmpq	%rdx, %rbx
	jb	.L105
	movzwl	4(%rsi), %edi
.L101:
	addl	$2, %edi
	movl	$4, %eax
	movw	%di, 4(%rsi)
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	ret
	.seh_endproc
	.p2align 4,,15
	.globl	JMP_abss
	.def	JMP_abss;	.scl	2;	.type	32;	.endef
	.seh_proc	JMP_abss
JMP_abss:
	pushq	%r12
	.seh_pushreg	%r12
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movzwl	4(%rcx), %edi
	movq	16(%rcx), %r9
	movq	%rcx, %rsi
	testq	%r9, %r9
	movl	%edi, %ebp
	je	.L120
	xorl	%eax, %eax
	xorl	%ebx, %ebx
	.p2align 4,,10
.L117:
	movq	%rbx, %r8
	salq	$5, %r8
	addq	8(%rsi), %r8
	movzwl	16(%r8), %edx
	cmpw	%dx, %bp
	jb	.L116
	movzwl	18(%r8), %ecx
	movzwl	%dx, %r10d
	addl	%r10d, %ecx
	cmpl	%ecx, %edi
	jge	.L116
	movl	%ebp, %eax
	movq	24(%r8), %rcx
	subl	%edx, %eax
	movzwl	%ax, %edx
	call	*(%r8)
	movq	16(%rsi), %r9
.L116:
	addq	$1, %rbx
	cmpq	%r9, %rbx
	jb	.L117
	movzbl	%al, %ebx
	movzwl	4(%rsi), %eax
	testq	%r9, %r9
	leal	1(%rax), %r12d
	movzwl	%r12w, %edi
	je	.L115
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	.p2align 4,,10
.L118:
	movq	%rbp, %r8
	salq	$5, %r8
	addq	8(%rsi), %r8
	movzwl	16(%r8), %edx
	cmpw	%dx, %r12w
	jb	.L119
	movzwl	18(%r8), %ecx
	movzwl	%dx, %r10d
	addl	%r10d, %ecx
	cmpl	%ecx, %edi
	jge	.L119
	movl	%r12d, %eax
	movq	24(%r8), %rcx
	subl	%edx, %eax
	movzwl	%ax, %edx
	call	*(%r8)
	movq	16(%rsi), %r9
.L119:
	addq	$1, %rbp
	cmpq	%r9, %rbp
	jb	.L118
	sall	$8, %eax
	orl	%eax, %ebx
.L115:
	movl	$3, %eax
	movw	%bx, 4(%rsi)
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	ret
	.p2align 4,,10
.L120:
	xorl	%ebx, %ebx
	jmp	.L115
	.seh_endproc
	.p2align 4,,15
	.globl	JMP_ind
	.def	JMP_ind;	.scl	2;	.type	32;	.endef
	.seh_proc	JMP_ind
JMP_ind:
	pushq	%r13
	.seh_pushreg	%r13
	pushq	%r12
	.seh_pushreg	%r12
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
	movzwl	4(%rcx), %edi
	movq	16(%rcx), %rdx
	movq	%rcx, %rbx
	testq	%rdx, %rdx
	movl	%edi, %ebp
	je	.L137
	xorl	%eax, %eax
	xorl	%esi, %esi
	.p2align 4,,10
.L127:
	movq	%rsi, %r8
	salq	$5, %r8
	addq	8(%rbx), %r8
	movzwl	16(%r8), %ecx
	cmpw	%cx, %bp
	jb	.L126
	movzwl	18(%r8), %r9d
	movzwl	%cx, %r10d
	addl	%r10d, %r9d
	cmpl	%r9d, %edi
	jge	.L126
	movl	%ebp, %edx
	subl	%ecx, %edx
	movq	24(%r8), %rcx
	movzwl	%dx, %edx
	call	*(%r8)
	movq	16(%rbx), %rdx
.L126:
	addq	$1, %rsi
	cmpq	%rdx, %rsi
	jb	.L127
	movzbl	%al, %r12d
	movzwl	4(%rbx), %eax
	testq	%rdx, %rdx
	leal	1(%rax), %r13d
	movzwl	%r13w, %edi
	je	.L137
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	.p2align 4,,10
.L130:
	movq	%rbp, %r8
	salq	$5, %r8
	addq	8(%rbx), %r8
	movzwl	16(%r8), %ecx
	cmpw	%cx, %r13w
	jb	.L129
	movzwl	18(%r8), %r9d
	movzwl	%cx, %r10d
	addl	%r10d, %r9d
	cmpl	%r9d, %edi
	jge	.L129
	movl	%r13d, %edx
	subl	%ecx, %edx
	movq	24(%r8), %rcx
	movzwl	%dx, %edx
	call	*(%r8)
	movq	16(%rbx), %rdx
.L129:
	addq	$1, %rbp
	cmpq	%rdx, %rbp
	jb	.L130
	sall	$8, %eax
	orl	%eax, %r12d
	testq	%rdx, %rdx
	movzwl	%r12w, %edi
	je	.L137
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	.p2align 4,,10
.L132:
	movq	%rbp, %r8
	salq	$5, %r8
	addq	8(%rbx), %r8
	movzwl	16(%r8), %ecx
	cmpw	%r12w, %cx
	ja	.L131
	movzwl	18(%r8), %r9d
	movzwl	%cx, %r10d
	addl	%r10d, %r9d
	cmpl	%edi, %r9d
	jle	.L131
	movl	%r12d, %edx
	subl	%ecx, %edx
	movq	24(%r8), %rcx
	movzwl	%dx, %edx
	call	*(%r8)
	movq	16(%rbx), %rdx
.L131:
	addq	$1, %rbp
	cmpq	%rdx, %rbp
	jb	.L132
	movzbl	%al, %esi
	leal	1(%r12), %eax
	movl	%r12d, %ecx
	xorb	%cl, %cl
	movzbl	%al, %eax
	orl	%ecx, %eax
	testq	%rdx, %rdx
	movzwl	%ax, %edi
	movl	%edi, %r12d
	je	.L125
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	.p2align 4,,10
.L133:
	movq	%rbp, %r8
	salq	$5, %r8
	addq	8(%rbx), %r8
	movzwl	16(%r8), %ecx
	cmpw	%cx, %r12w
	jb	.L134
	movzwl	18(%r8), %r9d
	movzwl	%cx, %r10d
	addl	%r10d, %r9d
	cmpl	%r9d, %edi
	jge	.L134
	movl	%r12d, %edx
	subl	%ecx, %edx
	movq	24(%r8), %rcx
	movzwl	%dx, %edx
	call	*(%r8)
	movq	16(%rbx), %rdx
.L134:
	addq	$1, %rbp
	cmpq	%rdx, %rbp
	jb	.L133
	sall	$8, %eax
	orl	%eax, %esi
.L125:
	movl	$5, %eax
	movw	%si, 4(%rbx)
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	ret
	.p2align 4,,10
.L137:
	xorl	%esi, %esi
	jmp	.L125
	.seh_endproc
	.p2align 4,,15
	.globl	PHA
	.def	PHA;	.scl	2;	.type	32;	.endef
	.seh_proc	PHA
PHA:
	pushq	%r12
	.seh_pushreg	%r12
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movzbl	3(%rcx), %ebp
	movq	16(%rcx), %r8
	movq	%rcx, %r12
	movzbl	(%rcx), %edi
	leal	-1(%rbp), %eax
	addw	$256, %bp
	testq	%r8, %r8
	movzwl	%bp, %esi
	movb	%al, 3(%rcx)
	je	.L144
	xorl	%ebx, %ebx
	.p2align 4,,10
.L146:
	movq	%rbx, %rax
	salq	$5, %rax
	addq	8(%r12), %rax
	movzwl	16(%rax), %edx
	cmpw	%dx, %bp
	jb	.L145
	movzwl	18(%rax), %ecx
	movzwl	%dx, %r9d
	addl	%r9d, %ecx
	cmpl	%ecx, %esi
	jge	.L145
	movl	%ebp, %ecx
	movl	%edi, %r8d
	subl	%edx, %ecx
	movzwl	%cx, %edx
	movq	24(%rax), %rcx
	call	*8(%rax)
	movq	16(%r12), %r8
.L145:
	addq	$1, %rbx
	cmpq	%r8, %rbx
	jb	.L146
.L144:
	movl	$3, %eax
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	ret
	.seh_endproc
	.p2align 4,,15
	.globl	STA_absx
	.def	STA_absx;	.scl	2;	.type	32;	.endef
	.seh_proc	STA_absx
STA_absx:
	pushq	%r13
	.seh_pushreg	%r13
	pushq	%r12
	.seh_pushreg	%r12
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
	movzwl	4(%rcx), %ebp
	movq	16(%rcx), %r9
	movq	%rcx, %rbx
	movzbl	(%rcx), %esi
	testq	%r9, %r9
	movl	%ebp, %r12d
	je	.L152
	xorl	%eax, %eax
	xorl	%r13d, %r13d
	.p2align 4,,10
.L154:
	movq	%r13, %r8
	salq	$5, %r8
	addq	8(%rbx), %r8
	movzwl	16(%r8), %edx
	cmpw	%dx, %r12w
	jb	.L153
	movzwl	18(%r8), %ecx
	movzwl	%dx, %r10d
	addl	%r10d, %ecx
	cmpl	%ecx, %ebp
	jge	.L153
	movl	%r12d, %eax
	movq	24(%r8), %rcx
	subl	%edx, %eax
	movzwl	%ax, %edx
	call	*(%r8)
	movq	16(%rbx), %r9
.L153:
	addq	$1, %r13
	cmpq	%r9, %r13
	jb	.L154
	movzwl	4(%rbx), %r12d
	testq	%r9, %r9
	movzbl	%al, %edi
	leal	1(%r12), %r13d
	movzwl	%r13w, %ebp
	je	.L152
	xorl	%eax, %eax
	xorl	%r12d, %r12d
	.p2align 4,,10
.L156:
	movq	%r12, %r8
	salq	$5, %r8
	addq	8(%rbx), %r8
	movzwl	16(%r8), %edx
	cmpw	%dx, %r13w
	jb	.L155
	movzwl	18(%r8), %ecx
	movzwl	%dx, %r10d
	addl	%r10d, %ecx
	cmpl	%ecx, %ebp
	jge	.L155
	movl	%r13d, %eax
	movq	24(%r8), %rcx
	subl	%edx, %eax
	movzwl	%ax, %edx
	call	*(%r8)
	movq	16(%rbx), %r9
.L155:
	addq	$1, %r12
	cmpq	%r9, %r12
	jb	.L156
	movzbl	1(%rbx), %r12d
	sall	$8, %eax
	addw	$2, 4(%rbx)
	orl	%eax, %edi
	addl	%edi, %r12d
	testq	%r9, %r9
	movzwl	%r12w, %edi
	je	.L163
	xorl	%ebp, %ebp
	.p2align 4,,10
.L159:
	movq	%rbp, %rax
	salq	$5, %rax
	addq	8(%rbx), %rax
	movzwl	16(%rax), %edx
	cmpw	%r12w, %dx
	ja	.L158
	movzwl	18(%rax), %ecx
	movzwl	%dx, %r8d
	addl	%r8d, %ecx
	cmpl	%ecx, %edi
	jge	.L158
	movl	%r12d, %ecx
	movl	%esi, %r8d
	subl	%edx, %ecx
	movzwl	%cx, %edx
	movq	24(%rax), %rcx
	call	*8(%rax)
	movq	16(%rbx), %r9
.L158:
	addq	$1, %rbp
	cmpq	%r9, %rbp
	jb	.L159
.L163:
	movl	$5, %eax
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	ret
	.p2align 4,,10
.L152:
	leal	2(%r12), %eax
	movw	%ax, 4(%rbx)
	jmp	.L163
	.seh_endproc
	.p2align 4,,15
	.globl	STA_absy
	.def	STA_absy;	.scl	2;	.type	32;	.endef
	.seh_proc	STA_absy
STA_absy:
	pushq	%r13
	.seh_pushreg	%r13
	pushq	%r12
	.seh_pushreg	%r12
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
	movzwl	4(%rcx), %ebp
	movq	16(%rcx), %r9
	movq	%rcx, %rbx
	movzbl	(%rcx), %esi
	testq	%r9, %r9
	movl	%ebp, %r12d
	je	.L174
	xorl	%eax, %eax
	xorl	%r13d, %r13d
	.p2align 4,,10
.L176:
	movq	%r13, %r8
	salq	$5, %r8
	addq	8(%rbx), %r8
	movzwl	16(%r8), %edx
	cmpw	%dx, %r12w
	jb	.L175
	movzwl	18(%r8), %ecx
	movzwl	%dx, %r10d
	addl	%r10d, %ecx
	cmpl	%ecx, %ebp
	jge	.L175
	movl	%r12d, %eax
	movq	24(%r8), %rcx
	subl	%edx, %eax
	movzwl	%ax, %edx
	call	*(%r8)
	movq	16(%rbx), %r9
.L175:
	addq	$1, %r13
	cmpq	%r9, %r13
	jb	.L176
	movzwl	4(%rbx), %r12d
	testq	%r9, %r9
	movzbl	%al, %edi
	leal	1(%r12), %r13d
	movzwl	%r13w, %ebp
	je	.L174
	xorl	%eax, %eax
	xorl	%r12d, %r12d
	.p2align 4,,10
.L178:
	movq	%r12, %r8
	salq	$5, %r8
	addq	8(%rbx), %r8
	movzwl	16(%r8), %edx
	cmpw	%dx, %r13w
	jb	.L177
	movzwl	18(%r8), %ecx
	movzwl	%dx, %r10d
	addl	%r10d, %ecx
	cmpl	%ecx, %ebp
	jge	.L177
	movl	%r13d, %eax
	movq	24(%r8), %rcx
	subl	%edx, %eax
	movzwl	%ax, %edx
	call	*(%r8)
	movq	16(%rbx), %r9
.L177:
	addq	$1, %r12
	cmpq	%r9, %r12
	jb	.L178
	movzbl	2(%rbx), %r12d
	sall	$8, %eax
	addw	$2, 4(%rbx)
	orl	%eax, %edi
	addl	%edi, %r12d
	testq	%r9, %r9
	movzwl	%r12w, %edi
	je	.L185
	xorl	%ebp, %ebp
	.p2align 4,,10
.L181:
	movq	%rbp, %rax
	salq	$5, %rax
	addq	8(%rbx), %rax
	movzwl	16(%rax), %edx
	cmpw	%r12w, %dx
	ja	.L180
	movzwl	18(%rax), %ecx
	movzwl	%dx, %r8d
	addl	%r8d, %ecx
	cmpl	%ecx, %edi
	jge	.L180
	movl	%r12d, %ecx
	movl	%esi, %r8d
	subl	%edx, %ecx
	movzwl	%cx, %edx
	movq	24(%rax), %rcx
	call	*8(%rax)
	movq	16(%rbx), %r9
.L180:
	addq	$1, %rbp
	cmpq	%r9, %rbp
	jb	.L181
.L185:
	movl	$5, %eax
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	ret
	.p2align 4,,10
.L174:
	leal	2(%r12), %eax
	movw	%ax, 4(%rbx)
	jmp	.L185
	.seh_endproc
	.p2align 4,,15
	.globl	STX_abss
	.def	STX_abss;	.scl	2;	.type	32;	.endef
	.seh_proc	STX_abss
STX_abss:
	pushq	%r13
	.seh_pushreg	%r13
	pushq	%r12
	.seh_pushreg	%r12
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
	movzwl	4(%rcx), %ebp
	movq	16(%rcx), %r10
	movq	%rcx, %rbx
	movzbl	1(%rcx), %esi
	testq	%r10, %r10
	movl	%ebp, %r12d
	je	.L196
	xorl	%eax, %eax
	xorl	%r13d, %r13d
	.p2align 4,,10
.L198:
	movq	%r13, %r8
	salq	$5, %r8
	addq	8(%rbx), %r8
	movzwl	16(%r8), %edx
	cmpw	%dx, %r12w
	jb	.L197
	movzwl	18(%r8), %ecx
	movzwl	%dx, %r9d
	addl	%r9d, %ecx
	cmpl	%ecx, %ebp
	jge	.L197
	movl	%r12d, %eax
	movq	24(%r8), %rcx
	subl	%edx, %eax
	movzwl	%ax, %edx
	call	*(%r8)
	movq	16(%rbx), %r10
.L197:
	addq	$1, %r13
	cmpq	%r10, %r13
	jb	.L198
	movzwl	4(%rbx), %r12d
	testq	%r10, %r10
	movzbl	%al, %edi
	leal	1(%r12), %r13d
	movzwl	%r13w, %ebp
	je	.L196
	xorl	%eax, %eax
	xorl	%r12d, %r12d
	.p2align 4,,10
.L200:
	movq	%r12, %r8
	salq	$5, %r8
	addq	8(%rbx), %r8
	movzwl	16(%r8), %edx
	cmpw	%dx, %r13w
	jb	.L199
	movzwl	18(%r8), %ecx
	movzwl	%dx, %r9d
	addl	%r9d, %ecx
	cmpl	%ecx, %ebp
	jge	.L199
	movl	%r13d, %eax
	movq	24(%r8), %rcx
	subl	%edx, %eax
	movzwl	%ax, %edx
	call	*(%r8)
	movq	16(%rbx), %r10
.L199:
	addq	$1, %r12
	cmpq	%r10, %r12
	jb	.L200
	sall	$8, %eax
	addw	$2, 4(%rbx)
	orl	%edi, %eax
	testq	%r10, %r10
	movzwl	%ax, %edi
	movl	%edi, %r12d
	je	.L207
	xorl	%ebp, %ebp
	.p2align 4,,10
.L203:
	movq	%rbp, %r9
	salq	$5, %r9
	addq	8(%rbx), %r9
	movzwl	16(%r9), %edx
	cmpw	%r12w, %dx
	ja	.L202
	movzwl	18(%r9), %ecx
	movzwl	%dx, %eax
	addl	%eax, %ecx
	cmpl	%edi, %ecx
	jle	.L202
	movl	%r12d, %eax
	movq	24(%r9), %rcx
	movl	%esi, %r8d
	subl	%edx, %eax
	movzwl	%ax, %edx
	call	*8(%r9)
	movq	16(%rbx), %r10
.L202:
	addq	$1, %rbp
	cmpq	%r10, %rbp
	jb	.L203
.L207:
	movl	$4, %eax
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	ret
	.p2align 4,,10
.L196:
	leal	2(%r12), %eax
	movw	%ax, 4(%rbx)
	jmp	.L207
	.seh_endproc
	.p2align 4,,15
	.globl	STY_abss
	.def	STY_abss;	.scl	2;	.type	32;	.endef
	.seh_proc	STY_abss
STY_abss:
	pushq	%r13
	.seh_pushreg	%r13
	pushq	%r12
	.seh_pushreg	%r12
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
	movzwl	4(%rcx), %ebp
	movq	16(%rcx), %r10
	movq	%rcx, %rbx
	movzbl	2(%rcx), %esi
	testq	%r10, %r10
	movl	%ebp, %r12d
	je	.L218
	xorl	%eax, %eax
	xorl	%r13d, %r13d
	.p2align 4,,10
.L220:
	movq	%r13, %r8
	salq	$5, %r8
	addq	8(%rbx), %r8
	movzwl	16(%r8), %edx
	cmpw	%dx, %r12w
	jb	.L219
	movzwl	18(%r8), %ecx
	movzwl	%dx, %r9d
	addl	%r9d, %ecx
	cmpl	%ecx, %ebp
	jge	.L219
	movl	%r12d, %eax
	movq	24(%r8), %rcx
	subl	%edx, %eax
	movzwl	%ax, %edx
	call	*(%r8)
	movq	16(%rbx), %r10
.L219:
	addq	$1, %r13
	cmpq	%r10, %r13
	jb	.L220
	movzwl	4(%rbx), %r12d
	testq	%r10, %r10
	movzbl	%al, %edi
	leal	1(%r12), %r13d
	movzwl	%r13w, %ebp
	je	.L218
	xorl	%eax, %eax
	xorl	%r12d, %r12d
	.p2align 4,,10
.L222:
	movq	%r12, %r8
	salq	$5, %r8
	addq	8(%rbx), %r8
	movzwl	16(%r8), %edx
	cmpw	%dx, %r13w
	jb	.L221
	movzwl	18(%r8), %ecx
	movzwl	%dx, %r9d
	addl	%r9d, %ecx
	cmpl	%ecx, %ebp
	jge	.L221
	movl	%r13d, %eax
	movq	24(%r8), %rcx
	subl	%edx, %eax
	movzwl	%ax, %edx
	call	*(%r8)
	movq	16(%rbx), %r10
.L221:
	addq	$1, %r12
	cmpq	%r10, %r12
	jb	.L222
	sall	$8, %eax
	addw	$2, 4(%rbx)
	orl	%edi, %eax
	testq	%r10, %r10
	movzwl	%ax, %edi
	movl	%edi, %r12d
	je	.L229
	xorl	%ebp, %ebp
	.p2align 4,,10
.L225:
	movq	%rbp, %r9
	salq	$5, %r9
	addq	8(%rbx), %r9
	movzwl	16(%r9), %edx
	cmpw	%r12w, %dx
	ja	.L224
	movzwl	18(%r9), %ecx
	movzwl	%dx, %eax
	addl	%eax, %ecx
	cmpl	%edi, %ecx
	jle	.L224
	movl	%r12d, %eax
	movq	24(%r9), %rcx
	movl	%esi, %r8d
	subl	%edx, %eax
	movzwl	%ax, %edx
	call	*8(%r9)
	movq	16(%rbx), %r10
.L224:
	addq	$1, %rbp
	cmpq	%r10, %rbp
	jb	.L225
.L229:
	movl	$4, %eax
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	ret
	.p2align 4,,10
.L218:
	leal	2(%r12), %eax
	movw	%ax, 4(%rbx)
	jmp	.L229
	.seh_endproc
	.p2align 4,,15
	.globl	STA_xind
	.def	STA_xind;	.scl	2;	.type	32;	.endef
	.seh_proc	STA_xind
STA_xind:
	pushq	%r14
	.seh_pushreg	%r14
	pushq	%r13
	.seh_pushreg	%r13
	pushq	%r12
	.seh_pushreg	%r12
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movzwl	4(%rcx), %edi
	movq	16(%rcx), %rdx
	movq	%rcx, %rbx
	movzbl	(%rcx), %esi
	testq	%rdx, %rdx
	movl	%edi, %r13d
	je	.L243
	xorl	%eax, %eax
	xorl	%r12d, %r12d
	.p2align 4,,10
.L242:
	movq	%r12, %r8
	salq	$5, %r8
	addq	8(%rbx), %r8
	movzwl	16(%r8), %ecx
	cmpw	%cx, %r13w
	jb	.L241
	movzwl	18(%r8), %r9d
	movzwl	%cx, %r10d
	addl	%r10d, %r9d
	cmpl	%r9d, %edi
	jge	.L241
	movl	%r13d, %edx
	subl	%ecx, %edx
	movq	24(%r8), %rcx
	movzwl	%dx, %edx
	call	*(%r8)
	movq	16(%rbx), %rdx
.L241:
	addq	$1, %r12
	cmpq	%rdx, %r12
	jb	.L242
	addb	1(%rbx), %al
	testq	%rdx, %rdx
	movzbl	%al, %r12d
	movl	%r12d, %ebp
	movzbl	%r12b, %r14d
	je	.L243
	xorl	%eax, %eax
	xorl	%r13d, %r13d
	.p2align 4,,10
.L245:
	movq	%r13, %r8
	salq	$5, %r8
	addq	8(%rbx), %r8
	movzwl	16(%r8), %ecx
	cmpw	%cx, %r14w
	jb	.L244
	movzwl	18(%r8), %r9d
	movzwl	%cx, %r10d
	addl	%r10d, %r9d
	cmpl	%r9d, %r12d
	jge	.L244
	movl	%r14d, %edx
	subl	%ecx, %edx
	movq	24(%r8), %rcx
	movzwl	%dx, %edx
	call	*(%r8)
	movq	16(%rbx), %rdx
.L244:
	addq	$1, %r13
	cmpq	%rdx, %r13
	jb	.L245
	leal	1(%rbp), %r13d
	testq	%rdx, %rdx
	movzbl	%al, %edi
	movzbl	%r13b, %ebp
	movzbl	%r13b, %r13d
	je	.L243
	xorl	%eax, %eax
	xorl	%r12d, %r12d
	.p2align 4,,10
.L247:
	movq	%r12, %r8
	salq	$5, %r8
	addq	8(%rbx), %r8
	movzwl	16(%r8), %ecx
	cmpw	%cx, %r13w
	jb	.L246
	movzwl	18(%r8), %r9d
	movzwl	%cx, %r10d
	addl	%r10d, %r9d
	cmpl	%r9d, %ebp
	jge	.L246
	movl	%r13d, %edx
	subl	%ecx, %edx
	movq	24(%r8), %rcx
	movzwl	%dx, %edx
	call	*(%r8)
	movq	16(%rbx), %rdx
.L246:
	addq	$1, %r12
	cmpq	%rdx, %r12
	jb	.L247
	sall	$8, %eax
	addw	$1, 4(%rbx)
	orl	%edi, %eax
	testq	%rdx, %rdx
	movzwl	%ax, %edi
	movl	%edi, %r12d
	je	.L254
	xorl	%ebp, %ebp
	.p2align 4,,10
.L250:
	movq	%rbp, %r9
	salq	$5, %r9
	addq	8(%rbx), %r9
	movzwl	16(%r9), %ecx
	cmpw	%r12w, %cx
	ja	.L249
	movzwl	18(%r9), %r8d
	movzwl	%cx, %eax
	addl	%eax, %r8d
	cmpl	%r8d, %edi
	jge	.L249
	movl	%r12d, %edx
	movl	%esi, %r8d
	subl	%ecx, %edx
	movq	24(%r9), %rcx
	movzwl	%dx, %edx
	call	*8(%r9)
	movq	16(%rbx), %rdx
.L249:
	addq	$1, %rbp
	cmpq	%rdx, %rbp
	jb	.L250
.L254:
	movl	$6, %eax
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	ret
	.p2align 4,,10
.L243:
	addw	$1, 4(%rbx)
	jmp	.L254
	.seh_endproc
	.p2align 4,,15
	.globl	STA_abss
	.def	STA_abss;	.scl	2;	.type	32;	.endef
	.seh_proc	STA_abss
STA_abss:
	pushq	%r13
	.seh_pushreg	%r13
	pushq	%r12
	.seh_pushreg	%r12
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
	movzwl	4(%rcx), %ebp
	movq	16(%rcx), %r10
	movq	%rcx, %rbx
	movzbl	(%rcx), %esi
	testq	%r10, %r10
	movl	%ebp, %r12d
	je	.L266
	xorl	%eax, %eax
	xorl	%r13d, %r13d
	.p2align 4,,10
.L268:
	movq	%r13, %r8
	salq	$5, %r8
	addq	8(%rbx), %r8
	movzwl	16(%r8), %edx
	cmpw	%dx, %r12w
	jb	.L267
	movzwl	18(%r8), %ecx
	movzwl	%dx, %r9d
	addl	%r9d, %ecx
	cmpl	%ecx, %ebp
	jge	.L267
	movl	%r12d, %eax
	movq	24(%r8), %rcx
	subl	%edx, %eax
	movzwl	%ax, %edx
	call	*(%r8)
	movq	16(%rbx), %r10
.L267:
	addq	$1, %r13
	cmpq	%r10, %r13
	jb	.L268
	movzwl	4(%rbx), %r12d
	testq	%r10, %r10
	movzbl	%al, %edi
	leal	1(%r12), %r13d
	movzwl	%r13w, %ebp
	je	.L266
	xorl	%eax, %eax
	xorl	%r12d, %r12d
	.p2align 4,,10
.L270:
	movq	%r12, %r8
	salq	$5, %r8
	addq	8(%rbx), %r8
	movzwl	16(%r8), %edx
	cmpw	%dx, %r13w
	jb	.L269
	movzwl	18(%r8), %ecx
	movzwl	%dx, %r9d
	addl	%r9d, %ecx
	cmpl	%ecx, %ebp
	jge	.L269
	movl	%r13d, %eax
	movq	24(%r8), %rcx
	subl	%edx, %eax
	movzwl	%ax, %edx
	call	*(%r8)
	movq	16(%rbx), %r10
.L269:
	addq	$1, %r12
	cmpq	%r10, %r12
	jb	.L270
	sall	$8, %eax
	addw	$2, 4(%rbx)
	orl	%edi, %eax
	testq	%r10, %r10
	movzwl	%ax, %edi
	movl	%edi, %r12d
	je	.L277
	xorl	%ebp, %ebp
	.p2align 4,,10
.L273:
	movq	%rbp, %r9
	salq	$5, %r9
	addq	8(%rbx), %r9
	movzwl	16(%r9), %edx
	cmpw	%r12w, %dx
	ja	.L272
	movzwl	18(%r9), %ecx
	movzwl	%dx, %eax
	addl	%eax, %ecx
	cmpl	%edi, %ecx
	jle	.L272
	movl	%r12d, %eax
	movq	24(%r9), %rcx
	movl	%esi, %r8d
	subl	%edx, %eax
	movzwl	%ax, %edx
	call	*8(%r9)
	movq	16(%rbx), %r10
.L272:
	addq	$1, %rbp
	cmpq	%r10, %rbp
	jb	.L273
.L277:
	movl	$4, %eax
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	ret
	.p2align 4,,10
.L266:
	leal	2(%r12), %eax
	movw	%ax, 4(%rbx)
	jmp	.L277
	.seh_endproc
	.p2align 4,,15
	.globl	STA_indy
	.def	STA_indy;	.scl	2;	.type	32;	.endef
	.seh_proc	STA_indy
STA_indy:
	pushq	%r14
	.seh_pushreg	%r14
	pushq	%r13
	.seh_pushreg	%r13
	pushq	%r12
	.seh_pushreg	%r12
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movzwl	4(%rcx), %edi
	movq	16(%rcx), %rdx
	movq	%rcx, %rbx
	movzbl	(%rcx), %esi
	testq	%rdx, %rdx
	movl	%edi, %r13d
	je	.L288
	xorl	%ebp, %ebp
	xorl	%r12d, %r12d
	.p2align 4,,10
.L290:
	movq	%r12, %rax
	salq	$5, %rax
	addq	8(%rbx), %rax
	movzwl	16(%rax), %ecx
	cmpw	%cx, %r13w
	jb	.L289
	movzwl	18(%rax), %r8d
	movzwl	%cx, %r9d
	addl	%r9d, %r8d
	cmpl	%r8d, %edi
	jge	.L289
	movl	%r13d, %edx
	subl	%ecx, %edx
	movq	24(%rax), %rcx
	movzwl	%dx, %edx
	call	*(%rax)
	movq	16(%rbx), %rdx
	movl	%eax, %ebp
.L289:
	addq	$1, %r12
	cmpq	%rdx, %r12
	jb	.L290
	testq	%rdx, %rdx
	movzbl	%bpl, %r12d
	movzbl	%bpl, %r14d
	je	.L288
	xorl	%eax, %eax
	xorl	%r13d, %r13d
	.p2align 4,,10
.L293:
	movq	%r13, %r8
	salq	$5, %r8
	addq	8(%rbx), %r8
	movzwl	16(%r8), %ecx
	cmpw	%cx, %r14w
	jb	.L292
	movzwl	18(%r8), %r9d
	movzwl	%cx, %r10d
	addl	%r10d, %r9d
	cmpl	%r9d, %r12d
	jge	.L292
	movl	%r14d, %edx
	subl	%ecx, %edx
	movq	24(%r8), %rcx
	movzwl	%dx, %edx
	call	*(%r8)
	movq	16(%rbx), %rdx
.L292:
	addq	$1, %r13
	cmpq	%rdx, %r13
	jb	.L293
	leal	1(%rbp), %r13d
	testq	%rdx, %rdx
	movzbl	%al, %edi
	movzbl	%r13b, %ebp
	movzbl	%r13b, %r13d
	je	.L288
	xorl	%eax, %eax
	xorl	%r12d, %r12d
	.p2align 4,,10
.L295:
	movq	%r12, %r8
	salq	$5, %r8
	addq	8(%rbx), %r8
	movzwl	16(%r8), %ecx
	cmpw	%r13w, %cx
	ja	.L294
	movzwl	18(%r8), %r9d
	movzwl	%cx, %r10d
	addl	%r10d, %r9d
	cmpl	%ebp, %r9d
	jle	.L294
	movl	%r13d, %edx
	subl	%ecx, %edx
	movq	24(%r8), %rcx
	movzwl	%dx, %edx
	call	*(%r8)
	movq	16(%rbx), %rdx
.L294:
	addq	$1, %r12
	cmpq	%rdx, %r12
	jb	.L295
	movzbl	2(%rbx), %r12d
	sall	$8, %eax
	addw	$1, 4(%rbx)
	orl	%eax, %edi
	addl	%edi, %r12d
	testq	%rdx, %rdx
	movzwl	%r12w, %edi
	je	.L302
	xorl	%ebp, %ebp
	.p2align 4,,10
.L298:
	movq	%rbp, %rax
	salq	$5, %rax
	addq	8(%rbx), %rax
	movzwl	16(%rax), %ecx
	cmpw	%r12w, %cx
	ja	.L297
	movzwl	18(%rax), %r8d
	movzwl	%cx, %r9d
	addl	%r9d, %r8d
	cmpl	%r8d, %edi
	jge	.L297
	movl	%r12d, %edx
	movl	%esi, %r8d
	subl	%ecx, %edx
	movq	24(%rax), %rcx
	movzwl	%dx, %edx
	call	*8(%rax)
	movq	16(%rbx), %rdx
.L297:
	addq	$1, %rbp
	cmpq	%rdx, %rbp
	jb	.L298
.L302:
	movl	$6, %eax
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	ret
	.p2align 4,,10
.L288:
	addw	$1, 4(%rbx)
	jmp	.L302
	.seh_endproc
	.p2align 4,,15
	.globl	PHP
	.def	PHP;	.scl	2;	.type	32;	.endef
	.seh_proc	PHP
PHP:
	pushq	%r12
	.seh_pushreg	%r12
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movzbl	3(%rcx), %ebp
	movzbl	6(%rcx), %esi
	movq	16(%rcx), %r8
	movq	%rcx, %r12
	leal	-1(%rbp), %eax
	orl	$48, %esi
	addw	$256, %bp
	testq	%r8, %r8
	movzbl	%sil, %esi
	movzwl	%bp, %edi
	movb	%al, 3(%rcx)
	je	.L314
	xorl	%ebx, %ebx
	.p2align 4,,10
.L316:
	movq	%rbx, %rax
	salq	$5, %rax
	addq	8(%r12), %rax
	movzwl	16(%rax), %edx
	cmpw	%dx, %bp
	jb	.L315
	movzwl	18(%rax), %ecx
	movzwl	%dx, %r9d
	addl	%r9d, %ecx
	cmpl	%ecx, %edi
	jge	.L315
	movl	%ebp, %ecx
	movl	%esi, %r8d
	subl	%edx, %ecx
	movzwl	%cx, %edx
	movq	24(%rax), %rcx
	call	*8(%rax)
	movq	16(%r12), %r8
.L315:
	addq	$1, %rbx
	cmpq	%r8, %rbx
	jb	.L316
.L314:
	movl	$3, %eax
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	ret
	.seh_endproc
	.p2align 4,,15
	.globl	SAX_abss
	.def	SAX_abss;	.scl	2;	.type	32;	.endef
	.seh_proc	SAX_abss
SAX_abss:
	pushq	%r13
	.seh_pushreg	%r13
	pushq	%r12
	.seh_pushreg	%r12
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
	movzbl	(%rcx), %esi
	movzwl	4(%rcx), %ebp
	andb	1(%rcx), %sil
	movq	16(%rcx), %r10
	movq	%rcx, %rbx
	testq	%r10, %r10
	movl	%ebp, %r12d
	movzbl	%sil, %esi
	je	.L322
	xorl	%eax, %eax
	xorl	%r13d, %r13d
	.p2align 4,,10
.L324:
	movq	%r13, %r8
	salq	$5, %r8
	addq	8(%rbx), %r8
	movzwl	16(%r8), %edx
	cmpw	%dx, %r12w
	jb	.L323
	movzwl	18(%r8), %ecx
	movzwl	%dx, %r9d
	addl	%r9d, %ecx
	cmpl	%ecx, %ebp
	jge	.L323
	movl	%r12d, %eax
	movq	24(%r8), %rcx
	subl	%edx, %eax
	movzwl	%ax, %edx
	call	*(%r8)
	movq	16(%rbx), %r10
.L323:
	addq	$1, %r13
	cmpq	%r10, %r13
	jb	.L324
	movzwl	4(%rbx), %r12d
	testq	%r10, %r10
	movzbl	%al, %edi
	leal	1(%r12), %r13d
	movzwl	%r13w, %ebp
	je	.L322
	xorl	%eax, %eax
	xorl	%r12d, %r12d
	.p2align 4,,10
.L326:
	movq	%r12, %r8
	salq	$5, %r8
	addq	8(%rbx), %r8
	movzwl	16(%r8), %edx
	cmpw	%dx, %r13w
	jb	.L325
	movzwl	18(%r8), %ecx
	movzwl	%dx, %r9d
	addl	%r9d, %ecx
	cmpl	%ecx, %ebp
	jge	.L325
	movl	%r13d, %eax
	movq	24(%r8), %rcx
	subl	%edx, %eax
	movzwl	%ax, %edx
	call	*(%r8)
	movq	16(%rbx), %r10
.L325:
	addq	$1, %r12
	cmpq	%r10, %r12
	jb	.L326
	sall	$8, %eax
	addw	$2, 4(%rbx)
	orl	%edi, %eax
	testq	%r10, %r10
	movzwl	%ax, %edi
	movl	%edi, %r12d
	je	.L333
	xorl	%ebp, %ebp
	.p2align 4,,10
.L329:
	movq	%rbp, %r9
	salq	$5, %r9
	addq	8(%rbx), %r9
	movzwl	16(%r9), %edx
	cmpw	%r12w, %dx
	ja	.L328
	movzwl	18(%r9), %ecx
	movzwl	%dx, %eax
	addl	%eax, %ecx
	cmpl	%edi, %ecx
	jle	.L328
	movl	%r12d, %eax
	movq	24(%r9), %rcx
	movl	%esi, %r8d
	subl	%edx, %eax
	movzwl	%ax, %edx
	call	*8(%r9)
	movq	16(%rbx), %r10
.L328:
	addq	$1, %rbp
	cmpq	%r10, %rbp
	jb	.L329
.L333:
	movl	$3, %eax
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	ret
	.p2align 4,,10
.L322:
	leal	2(%r12), %eax
	movw	%ax, 4(%rbx)
	jmp	.L333
	.seh_endproc
	.p2align 4,,15
	.globl	SAX_xind
	.def	SAX_xind;	.scl	2;	.type	32;	.endef
	.seh_proc	SAX_xind
SAX_xind:
	pushq	%r14
	.seh_pushreg	%r14
	pushq	%r13
	.seh_pushreg	%r13
	pushq	%r12
	.seh_pushreg	%r12
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movzbl	(%rcx), %esi
	movzwl	4(%rcx), %edi
	andb	1(%rcx), %sil
	movq	16(%rcx), %rdx
	movq	%rcx, %rbx
	testq	%rdx, %rdx
	movl	%edi, %r13d
	movzbl	%sil, %esi
	je	.L347
	xorl	%eax, %eax
	xorl	%r12d, %r12d
	.p2align 4,,10
.L346:
	movq	%r12, %r8
	salq	$5, %r8
	addq	8(%rbx), %r8
	movzwl	16(%r8), %ecx
	cmpw	%cx, %r13w
	jb	.L345
	movzwl	18(%r8), %r9d
	movzwl	%cx, %r10d
	addl	%r10d, %r9d
	cmpl	%r9d, %edi
	jge	.L345
	movl	%r13d, %edx
	subl	%ecx, %edx
	movq	24(%r8), %rcx
	movzwl	%dx, %edx
	call	*(%r8)
	movq	16(%rbx), %rdx
.L345:
	addq	$1, %r12
	cmpq	%rdx, %r12
	jb	.L346
	addb	1(%rbx), %al
	testq	%rdx, %rdx
	movzbl	%al, %r12d
	movl	%r12d, %ebp
	movzbl	%r12b, %r14d
	je	.L347
	xorl	%eax, %eax
	xorl	%r13d, %r13d
	.p2align 4,,10
.L349:
	movq	%r13, %r8
	salq	$5, %r8
	addq	8(%rbx), %r8
	movzwl	16(%r8), %ecx
	cmpw	%cx, %r14w
	jb	.L348
	movzwl	18(%r8), %r9d
	movzwl	%cx, %r10d
	addl	%r10d, %r9d
	cmpl	%r9d, %r12d
	jge	.L348
	movl	%r14d, %edx
	subl	%ecx, %edx
	movq	24(%r8), %rcx
	movzwl	%dx, %edx
	call	*(%r8)
	movq	16(%rbx), %rdx
.L348:
	addq	$1, %r13
	cmpq	%rdx, %r13
	jb	.L349
	leal	1(%rbp), %r13d
	testq	%rdx, %rdx
	movzbl	%al, %edi
	movzbl	%r13b, %ebp
	movzbl	%r13b, %r13d
	je	.L347
	xorl	%eax, %eax
	xorl	%r12d, %r12d
	.p2align 4,,10
.L351:
	movq	%r12, %r8
	salq	$5, %r8
	addq	8(%rbx), %r8
	movzwl	16(%r8), %ecx
	cmpw	%cx, %r13w
	jb	.L350
	movzwl	18(%r8), %r9d
	movzwl	%cx, %r10d
	addl	%r10d, %r9d
	cmpl	%r9d, %ebp
	jge	.L350
	movl	%r13d, %edx
	subl	%ecx, %edx
	movq	24(%r8), %rcx
	movzwl	%dx, %edx
	call	*(%r8)
	movq	16(%rbx), %rdx
.L350:
	addq	$1, %r12
	cmpq	%rdx, %r12
	jb	.L351
	sall	$8, %eax
	addw	$1, 4(%rbx)
	orl	%edi, %eax
	testq	%rdx, %rdx
	movzwl	%ax, %edi
	movl	%edi, %r12d
	je	.L358
	xorl	%ebp, %ebp
	.p2align 4,,10
.L354:
	movq	%rbp, %r9
	salq	$5, %r9
	addq	8(%rbx), %r9
	movzwl	16(%r9), %ecx
	cmpw	%r12w, %cx
	ja	.L353
	movzwl	18(%r9), %r8d
	movzwl	%cx, %eax
	addl	%eax, %r8d
	cmpl	%r8d, %edi
	jge	.L353
	movl	%r12d, %edx
	movl	%esi, %r8d
	subl	%ecx, %edx
	movq	24(%r9), %rcx
	movzwl	%dx, %edx
	call	*8(%r9)
	movq	16(%rbx), %rdx
.L353:
	addq	$1, %rbp
	cmpq	%rdx, %rbp
	jb	.L354
.L358:
	movl	$3, %eax
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	ret
	.p2align 4,,10
.L347:
	addw	$1, 4(%rbx)
	jmp	.L358
	.seh_endproc
	.p2align 4,,15
	.globl	SYA_absx
	.def	SYA_absx;	.scl	2;	.type	32;	.endef
	.seh_proc	SYA_absx
SYA_absx:
	pushq	%r13
	.seh_pushreg	%r13
	pushq	%r12
	.seh_pushreg	%r12
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
	movzwl	4(%rcx), %edi
	movq	16(%rcx), %rdx
	movq	%rcx, %rbx
	testq	%rdx, %rdx
	movl	%edi, %ebp
	je	.L378
	xorl	%eax, %eax
	xorl	%esi, %esi
	.p2align 4,,10
.L372:
	movq	%rsi, %r8
	salq	$5, %r8
	addq	8(%rbx), %r8
	movzwl	16(%r8), %ecx
	cmpw	%cx, %bp
	jb	.L371
	movzwl	18(%r8), %r9d
	movzwl	%cx, %r10d
	addl	%r10d, %r9d
	cmpl	%r9d, %edi
	jge	.L371
	movl	%ebp, %edx
	subl	%ecx, %edx
	movq	24(%r8), %rcx
	movzwl	%dx, %edx
	call	*(%r8)
	movq	16(%rbx), %rdx
.L371:
	addq	$1, %rsi
	cmpq	%rdx, %rsi
	jb	.L372
	movzwl	4(%rbx), %ebp
	testq	%rdx, %rdx
	movzbl	%al, %esi
	leal	1(%rbp), %r13d
	movzwl	%r13w, %edi
	je	.L370
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	.p2align 4,,10
.L373:
	movq	%rbp, %r8
	salq	$5, %r8
	addq	8(%rbx), %r8
	movzwl	16(%r8), %ecx
	cmpw	%cx, %r13w
	jb	.L374
	movzwl	18(%r8), %r9d
	movzwl	%cx, %r10d
	addl	%r10d, %r9d
	cmpl	%r9d, %edi
	jge	.L374
	movl	%r13d, %edx
	subl	%ecx, %edx
	movq	24(%r8), %rcx
	movzwl	%dx, %edx
	call	*(%r8)
	movq	16(%rbx), %rdx
.L374:
	addq	$1, %rbp
	cmpq	%rdx, %rbp
	jb	.L373
	movzwl	4(%rbx), %ebp
	sall	$8, %eax
	orl	%eax, %esi
.L370:
	movzbl	1(%rbx), %r12d
	leal	2(%rbp), %eax
	movw	%ax, 4(%rbx)
	addl	%esi, %r12d
	movl	%r12d, %esi
	movzwl	%r12w, %edi
	shrw	$8, %si
	addl	$1, %esi
	andb	2(%rbx), %sil
	testq	%rdx, %rdx
	movzbl	%sil, %esi
	je	.L375
	xorl	%ebp, %ebp
	.p2align 4,,10
.L377:
	movq	%rbp, %rax
	salq	$5, %rax
	addq	8(%rbx), %rax
	movzwl	16(%rax), %ecx
	cmpw	%r12w, %cx
	ja	.L376
	movzwl	18(%rax), %r8d
	movzwl	%cx, %r9d
	addl	%r9d, %r8d
	cmpl	%r8d, %edi
	jge	.L376
	movl	%r12d, %edx
	movl	%esi, %r8d
	subl	%ecx, %edx
	movq	24(%rax), %rcx
	movzwl	%dx, %edx
	call	*8(%rax)
	movq	16(%rbx), %rdx
.L376:
	addq	$1, %rbp
	cmpq	%rdx, %rbp
	jb	.L377
.L375:
	movl	$5, %eax
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	ret
	.p2align 4,,10
.L378:
	xorl	%esi, %esi
	jmp	.L370
	.seh_endproc
	.p2align 4,,15
	.globl	SXA_absy
	.def	SXA_absy;	.scl	2;	.type	32;	.endef
	.seh_proc	SXA_absy
SXA_absy:
	pushq	%r13
	.seh_pushreg	%r13
	pushq	%r12
	.seh_pushreg	%r12
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
	movzwl	4(%rcx), %edi
	movq	16(%rcx), %rdx
	movq	%rcx, %rbx
	testq	%rdx, %rdx
	movl	%edi, %ebp
	je	.L395
	xorl	%eax, %eax
	xorl	%esi, %esi
	.p2align 4,,10
.L389:
	movq	%rsi, %r8
	salq	$5, %r8
	addq	8(%rbx), %r8
	movzwl	16(%r8), %ecx
	cmpw	%cx, %bp
	jb	.L388
	movzwl	18(%r8), %r9d
	movzwl	%cx, %r10d
	addl	%r10d, %r9d
	cmpl	%r9d, %edi
	jge	.L388
	movl	%ebp, %edx
	subl	%ecx, %edx
	movq	24(%r8), %rcx
	movzwl	%dx, %edx
	call	*(%r8)
	movq	16(%rbx), %rdx
.L388:
	addq	$1, %rsi
	cmpq	%rdx, %rsi
	jb	.L389
	movzwl	4(%rbx), %ebp
	testq	%rdx, %rdx
	movzbl	%al, %esi
	leal	1(%rbp), %r13d
	movzwl	%r13w, %edi
	je	.L387
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	.p2align 4,,10
.L390:
	movq	%rbp, %r8
	salq	$5, %r8
	addq	8(%rbx), %r8
	movzwl	16(%r8), %ecx
	cmpw	%cx, %r13w
	jb	.L391
	movzwl	18(%r8), %r9d
	movzwl	%cx, %r10d
	addl	%r10d, %r9d
	cmpl	%r9d, %edi
	jge	.L391
	movl	%r13d, %edx
	subl	%ecx, %edx
	movq	24(%r8), %rcx
	movzwl	%dx, %edx
	call	*(%r8)
	movq	16(%rbx), %rdx
.L391:
	addq	$1, %rbp
	cmpq	%rdx, %rbp
	jb	.L390
	movzwl	4(%rbx), %ebp
	sall	$8, %eax
	orl	%eax, %esi
.L387:
	movzbl	2(%rbx), %r12d
	leal	2(%rbp), %eax
	movw	%ax, 4(%rbx)
	addl	%esi, %r12d
	movl	%r12d, %esi
	movzwl	%r12w, %edi
	shrw	$8, %si
	addl	$1, %esi
	andb	1(%rbx), %sil
	testq	%rdx, %rdx
	movzbl	%sil, %esi
	je	.L392
	xorl	%ebp, %ebp
	.p2align 4,,10
.L394:
	movq	%rbp, %rax
	salq	$5, %rax
	addq	8(%rbx), %rax
	movzwl	16(%rax), %ecx
	cmpw	%r12w, %cx
	ja	.L393
	movzwl	18(%rax), %r8d
	movzwl	%cx, %r9d
	addl	%r9d, %r8d
	cmpl	%r8d, %edi
	jge	.L393
	movl	%r12d, %edx
	movl	%esi, %r8d
	subl	%ecx, %edx
	movq	24(%rax), %rcx
	movzwl	%dx, %edx
	call	*8(%rax)
	movq	16(%rbx), %rdx
.L393:
	addq	$1, %rbp
	cmpq	%rdx, %rbp
	jb	.L394
.L392:
	movl	$5, %eax
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	ret
	.p2align 4,,10
.L395:
	xorl	%esi, %esi
	jmp	.L387
	.seh_endproc
	.p2align 4,,15
	.globl	NOP_zpgx
	.def	NOP_zpgx;	.scl	2;	.type	32;	.endef
	.seh_proc	NOP_zpgx
NOP_zpgx:
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
	movzwl	4(%rcx), %ebp
	movq	16(%rcx), %r8
	movq	%rcx, %rdi
	testq	%r8, %r8
	movl	%ebp, %esi
	je	.L404
	xorl	%ebx, %ebx
	.p2align 4,,10
.L406:
	movq	%rbx, %rax
	salq	$5, %rax
	addq	8(%rdi), %rax
	movzwl	16(%rax), %edx
	cmpw	%dx, %si
	jb	.L405
	movzwl	18(%rax), %ecx
	movzwl	%dx, %r9d
	addl	%r9d, %ecx
	cmpl	%ecx, %ebp
	jge	.L405
	movl	%esi, %ecx
	subl	%edx, %ecx
	movzwl	%cx, %edx
	movq	24(%rax), %rcx
	call	*(%rax)
	movq	16(%rdi), %r8
.L405:
	addq	$1, %rbx
	cmpq	%r8, %rbx
	jb	.L406
	movzwl	4(%rdi), %esi
.L404:
	addl	$1, %esi
	movl	$4, %eax
	movw	%si, 4(%rdi)
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	ret
	.seh_endproc
	.p2align 4,,15
	.globl	NOP_zpg
	.def	NOP_zpg;	.scl	2;	.type	32;	.endef
	.seh_proc	NOP_zpg
NOP_zpg:
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
	movzwl	4(%rcx), %ebp
	movq	16(%rcx), %r8
	movq	%rcx, %rdi
	testq	%r8, %r8
	movl	%ebp, %esi
	je	.L412
	xorl	%ebx, %ebx
	.p2align 4,,10
.L414:
	movq	%rbx, %rax
	salq	$5, %rax
	addq	8(%rdi), %rax
	movzwl	16(%rax), %edx
	cmpw	%dx, %si
	jb	.L413
	movzwl	18(%rax), %ecx
	movzwl	%dx, %r9d
	addl	%r9d, %ecx
	cmpl	%ecx, %ebp
	jge	.L413
	movl	%esi, %ecx
	subl	%edx, %ecx
	movzwl	%cx, %edx
	movq	24(%rax), %rcx
	call	*(%rax)
	movq	16(%rdi), %r8
.L413:
	addq	$1, %rbx
	cmpq	%r8, %rbx
	jb	.L414
	movzwl	4(%rdi), %esi
.L412:
	addl	$1, %esi
	movl	$3, %eax
	movw	%si, 4(%rdi)
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	ret
	.seh_endproc
	.p2align 4,,15
	.globl	STY_zpg
	.def	STY_zpg;	.scl	2;	.type	32;	.endef
	.seh_proc	STY_zpg
STY_zpg:
	pushq	%r13
	.seh_pushreg	%r13
	pushq	%r12
	.seh_pushreg	%r12
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
	movzwl	4(%rcx), %edi
	movq	16(%rcx), %r10
	movq	%rcx, %rsi
	movzbl	2(%rcx), %ebx
	testq	%r10, %r10
	movl	%edi, %r13d
	je	.L420
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	.p2align 4,,10
.L422:
	movq	%rbp, %r8
	salq	$5, %r8
	addq	8(%rsi), %r8
	movzwl	16(%r8), %edx
	cmpw	%dx, %r13w
	jb	.L421
	movzwl	18(%r8), %ecx
	movzwl	%dx, %r9d
	addl	%r9d, %ecx
	cmpl	%ecx, %edi
	jge	.L421
	movl	%r13d, %eax
	movq	24(%r8), %rcx
	subl	%edx, %eax
	movzwl	%ax, %edx
	call	*(%r8)
	movq	16(%rsi), %r10
.L421:
	addq	$1, %rbp
	cmpq	%r10, %rbp
	jb	.L422
	addw	$1, 4(%rsi)
	testq	%r10, %r10
	movzbl	%al, %edi
	movzbl	%al, %r12d
	je	.L427
	xorl	%ebp, %ebp
	.p2align 4,,10
.L425:
	movq	%rbp, %r9
	salq	$5, %r9
	addq	8(%rsi), %r9
	movzwl	16(%r9), %edx
	cmpw	%r12w, %dx
	ja	.L424
	movzwl	18(%r9), %ecx
	movzwl	%dx, %eax
	addl	%eax, %ecx
	cmpl	%edi, %ecx
	jle	.L424
	movl	%r12d, %eax
	movq	24(%r9), %rcx
	movl	%ebx, %r8d
	subl	%edx, %eax
	movzwl	%ax, %edx
	call	*8(%r9)
	movq	16(%rsi), %r10
.L424:
	addq	$1, %rbp
	cmpq	%r10, %rbp
	jb	.L425
.L427:
	movl	$3, %eax
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	ret
	.p2align 4,,10
.L420:
	addl	$1, %r13d
	movw	%r13w, 4(%rcx)
	jmp	.L427
	.seh_endproc
	.p2align 4,,15
	.globl	PLP
	.def	PLP;	.scl	2;	.type	32;	.endef
	.seh_proc	PLP
PLP:
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
	movzbl	3(%rcx), %eax
	movq	16(%rcx), %r9
	movq	%rcx, %rdi
	leal	1(%rax), %esi
	xorl	%eax, %eax
	movb	%sil, 3(%rcx)
	movzbl	%sil, %esi
	addw	$256, %si
	testq	%r9, %r9
	movzwl	%si, %ebp
	je	.L433
	xorl	%ebx, %ebx
	.p2align 4,,10
.L435:
	movq	%rbx, %r8
	salq	$5, %r8
	addq	8(%rdi), %r8
	movzwl	16(%r8), %edx
	cmpw	%dx, %si
	jb	.L434
	movzwl	18(%r8), %ecx
	movzwl	%dx, %r10d
	addl	%r10d, %ecx
	cmpl	%ecx, %ebp
	jge	.L434
	movl	%esi, %eax
	movq	24(%r8), %rcx
	subl	%edx, %eax
	movzwl	%ax, %edx
	call	*(%r8)
	movq	16(%rdi), %r9
.L434:
	addq	$1, %rbx
	cmpq	%r9, %rbx
	jb	.L435
	andl	$-49, %eax
.L433:
	movzbl	6(%rdi), %edx
	andl	$48, %edx
	orl	%edx, %eax
	movb	%al, 6(%rdi)
	movl	$4, %eax
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	ret
	.seh_endproc
	.p2align 4,,15
	.globl	STA_zpg
	.def	STA_zpg;	.scl	2;	.type	32;	.endef
	.seh_proc	STA_zpg
STA_zpg:
	pushq	%r13
	.seh_pushreg	%r13
	pushq	%r12
	.seh_pushreg	%r12
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
	movzwl	4(%rcx), %edi
	movq	16(%rcx), %r10
	movq	%rcx, %rsi
	movzbl	(%rcx), %ebx
	testq	%r10, %r10
	movl	%edi, %r13d
	je	.L439
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	.p2align 4,,10
.L441:
	movq	%rbp, %r8
	salq	$5, %r8
	addq	8(%rsi), %r8
	movzwl	16(%r8), %edx
	cmpw	%dx, %r13w
	jb	.L440
	movzwl	18(%r8), %ecx
	movzwl	%dx, %r9d
	addl	%r9d, %ecx
	cmpl	%ecx, %edi
	jge	.L440
	movl	%r13d, %eax
	movq	24(%r8), %rcx
	subl	%edx, %eax
	movzwl	%ax, %edx
	call	*(%r8)
	movq	16(%rsi), %r10
.L440:
	addq	$1, %rbp
	cmpq	%r10, %rbp
	jb	.L441
	addw	$1, 4(%rsi)
	testq	%r10, %r10
	movzbl	%al, %edi
	movzbl	%al, %r12d
	je	.L446
	xorl	%ebp, %ebp
	.p2align 4,,10
.L444:
	movq	%rbp, %r9
	salq	$5, %r9
	addq	8(%rsi), %r9
	movzwl	16(%r9), %edx
	cmpw	%r12w, %dx
	ja	.L443
	movzwl	18(%r9), %ecx
	movzwl	%dx, %eax
	addl	%eax, %ecx
	cmpl	%edi, %ecx
	jle	.L443
	movl	%r12d, %eax
	movq	24(%r9), %rcx
	movl	%ebx, %r8d
	subl	%edx, %eax
	movzwl	%ax, %edx
	call	*8(%r9)
	movq	16(%rsi), %r10
.L443:
	addq	$1, %rbp
	cmpq	%r10, %rbp
	jb	.L444
.L446:
	movl	$3, %eax
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	ret
	.p2align 4,,10
.L439:
	addl	$1, %r13d
	movw	%r13w, 4(%rcx)
	jmp	.L446
	.seh_endproc
	.p2align 4,,15
	.globl	BNC
	.def	BNC;	.scl	2;	.type	32;	.endef
	.seh_proc	BNC
BNC:
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
	movzwl	4(%rcx), %edi
	movq	16(%rcx), %r9
	movq	%rcx, %rsi
	testq	%r9, %r9
	leal	1(%rdi), %edx
	movl	%edi, %ebp
	movw	%dx, 4(%rcx)
	je	.L456
	xorl	%eax, %eax
	xorl	%ebx, %ebx
	.p2align 4,,10
.L454:
	movq	%rbx, %r8
	salq	$5, %r8
	addq	8(%rsi), %r8
	movzwl	16(%r8), %edx
	cmpw	%dx, %bp
	jb	.L453
	movzwl	18(%r8), %ecx
	movzwl	%dx, %r10d
	addl	%r10d, %ecx
	cmpl	%ecx, %edi
	jge	.L453
	movl	%ebp, %eax
	movq	24(%r8), %rcx
	subl	%edx, %eax
	movzwl	%ax, %edx
	call	*(%r8)
	movq	16(%rsi), %r9
.L453:
	addq	$1, %rbx
	cmpq	%r9, %rbx
	jb	.L454
	movzwl	4(%rsi), %edx
	cbtw
.L452:
	cmpb	$0, 6(%rsi)
	js	.L455
	addl	%edx, %eax
	movw	%ax, 4(%rsi)
.L455:
	movl	$2, %eax
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	ret
	.p2align 4,,10
.L456:
	xorl	%eax, %eax
	jmp	.L452
	.seh_endproc
	.p2align 4,,15
	.globl	BNS
	.def	BNS;	.scl	2;	.type	32;	.endef
	.seh_proc	BNS
BNS:
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
	movzwl	4(%rcx), %edi
	movq	16(%rcx), %r9
	movq	%rcx, %rsi
	testq	%r9, %r9
	leal	1(%rdi), %edx
	movl	%edi, %ebp
	movw	%dx, 4(%rcx)
	je	.L463
	xorl	%eax, %eax
	xorl	%ebx, %ebx
	.p2align 4,,10
.L461:
	movq	%rbx, %r8
	salq	$5, %r8
	addq	8(%rsi), %r8
	movzwl	16(%r8), %edx
	cmpw	%dx, %bp
	jb	.L460
	movzwl	18(%r8), %ecx
	movzwl	%dx, %r10d
	addl	%r10d, %ecx
	cmpl	%ecx, %edi
	jge	.L460
	movl	%ebp, %eax
	movq	24(%r8), %rcx
	subl	%edx, %eax
	movzwl	%ax, %edx
	call	*(%r8)
	movq	16(%rsi), %r9
.L460:
	addq	$1, %rbx
	cmpq	%r9, %rbx
	jb	.L461
	movzwl	4(%rsi), %edx
	cbtw
.L459:
	cmpb	$0, 6(%rsi)
	jns	.L462
	addl	%edx, %eax
	movw	%ax, 4(%rsi)
.L462:
	movl	$2, %eax
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	ret
	.p2align 4,,10
.L463:
	xorl	%eax, %eax
	jmp	.L459
	.seh_endproc
	.p2align 4,,15
	.globl	STX_zpg
	.def	STX_zpg;	.scl	2;	.type	32;	.endef
	.seh_proc	STX_zpg
STX_zpg:
	pushq	%r13
	.seh_pushreg	%r13
	pushq	%r12
	.seh_pushreg	%r12
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
	movzwl	4(%rcx), %edi
	movq	16(%rcx), %r10
	movq	%rcx, %rsi
	movzbl	1(%rcx), %ebx
	testq	%r10, %r10
	movl	%edi, %r13d
	je	.L466
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	.p2align 4,,10
.L468:
	movq	%rbp, %r8
	salq	$5, %r8
	addq	8(%rsi), %r8
	movzwl	16(%r8), %edx
	cmpw	%dx, %r13w
	jb	.L467
	movzwl	18(%r8), %ecx
	movzwl	%dx, %r9d
	addl	%r9d, %ecx
	cmpl	%ecx, %edi
	jge	.L467
	movl	%r13d, %eax
	movq	24(%r8), %rcx
	subl	%edx, %eax
	movzwl	%ax, %edx
	call	*(%r8)
	movq	16(%rsi), %r10
.L467:
	addq	$1, %rbp
	cmpq	%r10, %rbp
	jb	.L468
	addw	$1, 4(%rsi)
	testq	%r10, %r10
	movzbl	%al, %edi
	movzbl	%al, %r12d
	je	.L473
	xorl	%ebp, %ebp
	.p2align 4,,10
.L471:
	movq	%rbp, %r9
	salq	$5, %r9
	addq	8(%rsi), %r9
	movzwl	16(%r9), %edx
	cmpw	%r12w, %dx
	ja	.L470
	movzwl	18(%r9), %ecx
	movzwl	%dx, %eax
	addl	%eax, %ecx
	cmpl	%edi, %ecx
	jle	.L470
	movl	%r12d, %eax
	movq	24(%r9), %rcx
	movl	%ebx, %r8d
	subl	%edx, %eax
	movzwl	%ax, %edx
	call	*8(%r9)
	movq	16(%rsi), %r10
.L470:
	addq	$1, %rbp
	cmpq	%r10, %rbp
	jb	.L471
.L473:
	movl	$3, %eax
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	ret
	.p2align 4,,10
.L466:
	addl	$1, %r13d
	movw	%r13w, 4(%rcx)
	jmp	.L473
	.seh_endproc
	.p2align 4,,15
	.globl	CMP_absx
	.def	CMP_absx;	.scl	2;	.type	32;	.endef
	.seh_proc	CMP_absx
CMP_absx:
	pushq	%r12
	.seh_pushreg	%r12
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movzwl	4(%rcx), %edi
	movq	16(%rcx), %rdx
	movq	%rcx, %rbx
	testq	%rdx, %rdx
	movl	%edi, %ebp
	je	.L479
	xorl	%eax, %eax
	xorl	%esi, %esi
	.p2align 4,,10
.L481:
	movq	%rsi, %r8
	salq	$5, %r8
	addq	8(%rbx), %r8
	movzwl	16(%r8), %ecx
	cmpw	%cx, %bp
	jb	.L480
	movzwl	18(%r8), %r9d
	movzwl	%cx, %r10d
	addl	%r10d, %r9d
	cmpl	%r9d, %edi
	jge	.L480
	movl	%ebp, %edx
	subl	%ecx, %edx
	movq	24(%r8), %rcx
	movzwl	%dx, %edx
	call	*(%r8)
	movq	16(%rbx), %rdx
.L480:
	addq	$1, %rsi
	cmpq	%rdx, %rsi
	jb	.L481
	movzwl	4(%rbx), %ebp
	testq	%rdx, %rdx
	movzbl	%al, %esi
	leal	1(%rbp), %r12d
	movzwl	%r12w, %edi
	je	.L479
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	.p2align 4,,10
.L483:
	movq	%rbp, %r8
	salq	$5, %r8
	addq	8(%rbx), %r8
	movzwl	16(%r8), %ecx
	cmpw	%cx, %r12w
	jb	.L482
	movzwl	18(%r8), %r9d
	movzwl	%cx, %r10d
	addl	%r10d, %r9d
	cmpl	%r9d, %edi
	jge	.L482
	movl	%r12d, %edx
	subl	%ecx, %edx
	movq	24(%r8), %rcx
	movzwl	%dx, %edx
	call	*(%r8)
	movq	16(%rbx), %rdx
.L482:
	addq	$1, %rbp
	cmpq	%rdx, %rbp
	jb	.L483
	movzbl	1(%rbx), %ebp
	sall	$8, %eax
	addw	$2, 4(%rbx)
	orl	%eax, %esi
	addl	%esi, %ebp
	testq	%rdx, %rdx
	movzwl	%bp, %esi
	je	.L504
	xorl	%eax, %eax
	xorl	%edi, %edi
	.p2align 4,,10
.L486:
	movq	%rdi, %r8
	salq	$5, %r8
	addq	8(%rbx), %r8
	movzwl	16(%r8), %ecx
	cmpw	%bp, %cx
	ja	.L485
	movzwl	18(%r8), %r9d
	movzwl	%cx, %r10d
	addl	%r10d, %r9d
	cmpl	%r9d, %esi
	jge	.L485
	movl	%ebp, %edx
	subl	%ecx, %edx
	movq	24(%r8), %rcx
	movzwl	%dx, %edx
	call	*(%r8)
	movq	16(%rbx), %rdx
.L485:
	addq	$1, %rdi
	cmpq	%rdx, %rdi
	jb	.L486
	notl	%eax
	movzbl	%al, %edx
.L484:
	movzbl	(%rbx), %eax
	leal	1(%rdx,%rax), %edx
	movzbl	6(%rbx), %eax
	movl	%eax, %ecx
	andl	$127, %eax
	orl	$-128, %ecx
	testb	$-128, %dl
	cmovne	%ecx, %eax
	movl	%eax, %ecx
	andl	$-3, %eax
	orl	$2, %ecx
	testb	%dl, %dl
	cmove	%ecx, %eax
	movl	%eax, %ecx
	andl	$-2, %eax
	orl	$1, %ecx
	andb	$1, %dh
	cmovne	%ecx, %eax
	movb	%al, 6(%rbx)
	movl	$4, %eax
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	ret
	.p2align 4,,10
.L479:
	leal	2(%rbp), %eax
	movw	%ax, 4(%rbx)
.L504:
	movl	$255, %edx
	jmp	.L484
	.seh_endproc
	.p2align 4,,15
	.globl	BZC
	.def	BZC;	.scl	2;	.type	32;	.endef
	.seh_proc	BZC
BZC:
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
	movzwl	4(%rcx), %edi
	movq	16(%rcx), %r9
	movq	%rcx, %rsi
	testq	%r9, %r9
	leal	1(%rdi), %edx
	movl	%edi, %ebp
	movw	%dx, 4(%rcx)
	je	.L510
	xorl	%eax, %eax
	xorl	%ebx, %ebx
	.p2align 4,,10
.L508:
	movq	%rbx, %r8
	salq	$5, %r8
	addq	8(%rsi), %r8
	movzwl	16(%r8), %edx
	cmpw	%dx, %bp
	jb	.L507
	movzwl	18(%r8), %ecx
	movzwl	%dx, %r10d
	addl	%r10d, %ecx
	cmpl	%ecx, %edi
	jge	.L507
	movl	%ebp, %eax
	movq	24(%r8), %rcx
	subl	%edx, %eax
	movzwl	%ax, %edx
	call	*(%r8)
	movq	16(%rsi), %r9
.L507:
	addq	$1, %rbx
	cmpq	%r9, %rbx
	jb	.L508
	movzwl	4(%rsi), %edx
	cbtw
.L506:
	testb	$2, 6(%rsi)
	jne	.L509
	addl	%edx, %eax
	movw	%ax, 4(%rsi)
.L509:
	movl	$2, %eax
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	ret
	.p2align 4,,10
.L510:
	xorl	%eax, %eax
	jmp	.L506
	.seh_endproc
	.p2align 4,,15
	.globl	BZS
	.def	BZS;	.scl	2;	.type	32;	.endef
	.seh_proc	BZS
BZS:
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
	movzwl	4(%rcx), %edi
	movq	16(%rcx), %r9
	movq	%rcx, %rsi
	testq	%r9, %r9
	leal	1(%rdi), %edx
	movl	%edi, %ebp
	movw	%dx, 4(%rcx)
	je	.L517
	xorl	%eax, %eax
	xorl	%ebx, %ebx
	.p2align 4,,10
.L515:
	movq	%rbx, %r8
	salq	$5, %r8
	addq	8(%rsi), %r8
	movzwl	16(%r8), %edx
	cmpw	%dx, %bp
	jb	.L514
	movzwl	18(%r8), %ecx
	movzwl	%dx, %r10d
	addl	%r10d, %ecx
	cmpl	%ecx, %edi
	jge	.L514
	movl	%ebp, %eax
	movq	24(%r8), %rcx
	subl	%edx, %eax
	movzwl	%ax, %edx
	call	*(%r8)
	movq	16(%rsi), %r9
.L514:
	addq	$1, %rbx
	cmpq	%r9, %rbx
	jb	.L515
	movzwl	4(%rsi), %edx
	cbtw
.L513:
	testb	$2, 6(%rsi)
	je	.L516
	addl	%edx, %eax
	movw	%ax, 4(%rsi)
.L516:
	movl	$2, %eax
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	ret
	.p2align 4,,10
.L517:
	xorl	%eax, %eax
	jmp	.L513
	.seh_endproc
	.p2align 4,,15
	.globl	BVC
	.def	BVC;	.scl	2;	.type	32;	.endef
	.seh_proc	BVC
BVC:
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
	movzwl	4(%rcx), %edi
	movq	16(%rcx), %r9
	movq	%rcx, %rsi
	testq	%r9, %r9
	leal	1(%rdi), %edx
	movl	%edi, %ebp
	movw	%dx, 4(%rcx)
	je	.L527
	xorl	%eax, %eax
	xorl	%ebx, %ebx
	.p2align 4,,10
.L525:
	movq	%rbx, %r8
	salq	$5, %r8
	addq	8(%rsi), %r8
	movzwl	16(%r8), %edx
	cmpw	%dx, %bp
	jb	.L524
	movzwl	18(%r8), %ecx
	movzwl	%dx, %r10d
	addl	%r10d, %ecx
	cmpl	%ecx, %edi
	jge	.L524
	movl	%ebp, %eax
	movq	24(%r8), %rcx
	subl	%edx, %eax
	movzwl	%ax, %edx
	call	*(%r8)
	movq	16(%rsi), %r9
.L524:
	addq	$1, %rbx
	cmpq	%r9, %rbx
	jb	.L525
	movzwl	4(%rsi), %edx
	cbtw
.L523:
	testb	$64, 6(%rsi)
	jne	.L526
	addl	%edx, %eax
	movw	%ax, 4(%rsi)
.L526:
	movl	$2, %eax
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	ret
	.p2align 4,,10
.L527:
	xorl	%eax, %eax
	jmp	.L523
	.seh_endproc
	.p2align 4,,15
	.globl	BVS
	.def	BVS;	.scl	2;	.type	32;	.endef
	.seh_proc	BVS
BVS:
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
	movzwl	4(%rcx), %edi
	movq	16(%rcx), %r9
	movq	%rcx, %rsi
	testq	%r9, %r9
	leal	1(%rdi), %edx
	movl	%edi, %ebp
	movw	%dx, 4(%rcx)
	je	.L534
	xorl	%eax, %eax
	xorl	%ebx, %ebx
	.p2align 4,,10
.L532:
	movq	%rbx, %r8
	salq	$5, %r8
	addq	8(%rsi), %r8
	movzwl	16(%r8), %edx
	cmpw	%dx, %bp
	jb	.L531
	movzwl	18(%r8), %ecx
	movzwl	%dx, %r10d
	addl	%r10d, %ecx
	cmpl	%ecx, %edi
	jge	.L531
	movl	%ebp, %eax
	movq	24(%r8), %rcx
	subl	%edx, %eax
	movzwl	%ax, %edx
	call	*(%r8)
	movq	16(%rsi), %r9
.L531:
	addq	$1, %rbx
	cmpq	%r9, %rbx
	jb	.L532
	movzwl	4(%rsi), %edx
	cbtw
.L530:
	testb	$64, 6(%rsi)
	je	.L533
	addl	%edx, %eax
	movw	%ax, 4(%rsi)
.L533:
	movl	$2, %eax
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	ret
	.p2align 4,,10
.L534:
	xorl	%eax, %eax
	jmp	.L530
	.seh_endproc
	.p2align 4,,15
	.globl	BCC
	.def	BCC;	.scl	2;	.type	32;	.endef
	.seh_proc	BCC
BCC:
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
	movzwl	4(%rcx), %edi
	movq	16(%rcx), %r9
	movq	%rcx, %rsi
	testq	%r9, %r9
	leal	1(%rdi), %edx
	movl	%edi, %ebp
	movw	%dx, 4(%rcx)
	je	.L544
	xorl	%eax, %eax
	xorl	%ebx, %ebx
	.p2align 4,,10
.L542:
	movq	%rbx, %r8
	salq	$5, %r8
	addq	8(%rsi), %r8
	movzwl	16(%r8), %edx
	cmpw	%dx, %bp
	jb	.L541
	movzwl	18(%r8), %ecx
	movzwl	%dx, %r10d
	addl	%r10d, %ecx
	cmpl	%ecx, %edi
	jge	.L541
	movl	%ebp, %eax
	movq	24(%r8), %rcx
	subl	%edx, %eax
	movzwl	%ax, %edx
	call	*(%r8)
	movq	16(%rsi), %r9
.L541:
	addq	$1, %rbx
	cmpq	%r9, %rbx
	jb	.L542
	movzwl	4(%rsi), %edx
	cbtw
.L540:
	testb	$1, 6(%rsi)
	jne	.L543
	addl	%edx, %eax
	movw	%ax, 4(%rsi)
.L543:
	movl	$2, %eax
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	ret
	.p2align 4,,10
.L544:
	xorl	%eax, %eax
	jmp	.L540
	.seh_endproc
	.p2align 4,,15
	.globl	BCS
	.def	BCS;	.scl	2;	.type	32;	.endef
	.seh_proc	BCS
BCS:
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
	movzwl	4(%rcx), %edi
	movq	16(%rcx), %r9
	movq	%rcx, %rsi
	testq	%r9, %r9
	leal	1(%rdi), %edx
	movl	%edi, %ebp
	movw	%dx, 4(%rcx)
	je	.L551
	xorl	%eax, %eax
	xorl	%ebx, %ebx
	.p2align 4,,10
.L549:
	movq	%rbx, %r8
	salq	$5, %r8
	addq	8(%rsi), %r8
	movzwl	16(%r8), %edx
	cmpw	%dx, %bp
	jb	.L548
	movzwl	18(%r8), %ecx
	movzwl	%dx, %r10d
	addl	%r10d, %ecx
	cmpl	%ecx, %edi
	jge	.L548
	movl	%ebp, %eax
	movq	24(%r8), %rcx
	subl	%edx, %eax
	movzwl	%ax, %edx
	call	*(%r8)
	movq	16(%rsi), %r9
.L548:
	addq	$1, %rbx
	cmpq	%r9, %rbx
	jb	.L549
	movzwl	4(%rsi), %edx
	cbtw
.L547:
	testb	$1, 6(%rsi)
	je	.L550
	addl	%edx, %eax
	movw	%ax, 4(%rsi)
.L550:
	movl	$2, %eax
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	ret
	.p2align 4,,10
.L551:
	xorl	%eax, %eax
	jmp	.L547
	.seh_endproc
	.p2align 4,,15
	.globl	CMP_absy
	.def	CMP_absy;	.scl	2;	.type	32;	.endef
	.seh_proc	CMP_absy
CMP_absy:
	pushq	%r12
	.seh_pushreg	%r12
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movzwl	4(%rcx), %edi
	movq	16(%rcx), %rdx
	movq	%rcx, %rbx
	testq	%rdx, %rdx
	movl	%edi, %ebp
	je	.L557
	xorl	%eax, %eax
	xorl	%esi, %esi
	.p2align 4,,10
.L559:
	movq	%rsi, %r8
	salq	$5, %r8
	addq	8(%rbx), %r8
	movzwl	16(%r8), %ecx
	cmpw	%cx, %bp
	jb	.L558
	movzwl	18(%r8), %r9d
	movzwl	%cx, %r10d
	addl	%r10d, %r9d
	cmpl	%r9d, %edi
	jge	.L558
	movl	%ebp, %edx
	subl	%ecx, %edx
	movq	24(%r8), %rcx
	movzwl	%dx, %edx
	call	*(%r8)
	movq	16(%rbx), %rdx
.L558:
	addq	$1, %rsi
	cmpq	%rdx, %rsi
	jb	.L559
	movzwl	4(%rbx), %ebp
	testq	%rdx, %rdx
	movzbl	%al, %esi
	leal	1(%rbp), %r12d
	movzwl	%r12w, %edi
	je	.L557
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	.p2align 4,,10
.L561:
	movq	%rbp, %r8
	salq	$5, %r8
	addq	8(%rbx), %r8
	movzwl	16(%r8), %ecx
	cmpw	%cx, %r12w
	jb	.L560
	movzwl	18(%r8), %r9d
	movzwl	%cx, %r10d
	addl	%r10d, %r9d
	cmpl	%r9d, %edi
	jge	.L560
	movl	%r12d, %edx
	subl	%ecx, %edx
	movq	24(%r8), %rcx
	movzwl	%dx, %edx
	call	*(%r8)
	movq	16(%rbx), %rdx
.L560:
	addq	$1, %rbp
	cmpq	%rdx, %rbp
	jb	.L561
	movzbl	2(%rbx), %ebp
	sall	$8, %eax
	addw	$2, 4(%rbx)
	orl	%eax, %esi
	addl	%esi, %ebp
	testq	%rdx, %rdx
	movzwl	%bp, %esi
	je	.L582
	xorl	%eax, %eax
	xorl	%edi, %edi
	.p2align 4,,10
.L564:
	movq	%rdi, %r8
	salq	$5, %r8
	addq	8(%rbx), %r8
	movzwl	16(%r8), %ecx
	cmpw	%bp, %cx
	ja	.L563
	movzwl	18(%r8), %r9d
	movzwl	%cx, %r10d
	addl	%r10d, %r9d
	cmpl	%r9d, %esi
	jge	.L563
	movl	%ebp, %edx
	subl	%ecx, %edx
	movq	24(%r8), %rcx
	movzwl	%dx, %edx
	call	*(%r8)
	movq	16(%rbx), %rdx
.L563:
	addq	$1, %rdi
	cmpq	%rdx, %rdi
	jb	.L564
	notl	%eax
	movzbl	%al, %edx
.L562:
	movzbl	(%rbx), %eax
	leal	1(%rdx,%rax), %edx
	movzbl	6(%rbx), %eax
	movl	%eax, %ecx
	andl	$127, %eax
	orl	$-128, %ecx
	testb	$-128, %dl
	cmovne	%ecx, %eax
	movl	%eax, %ecx
	andl	$-3, %eax
	orl	$2, %ecx
	testb	%dl, %dl
	cmove	%ecx, %eax
	movl	%eax, %ecx
	andl	$-2, %eax
	orl	$1, %ecx
	andb	$1, %dh
	cmovne	%ecx, %eax
	movb	%al, 6(%rbx)
	movl	$4, %eax
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	ret
	.p2align 4,,10
.L557:
	leal	2(%rbp), %eax
	movw	%ax, 4(%rbx)
.L582:
	movl	$255, %edx
	jmp	.L562
	.seh_endproc
	.p2align 4,,15
	.globl	CPY_imm
	.def	CPY_imm;	.scl	2;	.type	32;	.endef
	.seh_proc	CPY_imm
CPY_imm:
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
	movzwl	4(%rcx), %edi
	movq	16(%rcx), %r9
	movq	%rcx, %rsi
	testq	%r9, %r9
	leal	1(%rdi), %eax
	movl	%edi, %ebp
	movw	%ax, 4(%rcx)
	je	.L593
	xorl	%eax, %eax
	xorl	%ebx, %ebx
	.p2align 4,,10
.L586:
	movq	%rbx, %r8
	salq	$5, %r8
	addq	8(%rsi), %r8
	movzwl	16(%r8), %edx
	cmpw	%dx, %bp
	jb	.L585
	movzwl	18(%r8), %ecx
	movzwl	%dx, %r10d
	addl	%r10d, %ecx
	cmpl	%ecx, %edi
	jge	.L585
	movl	%ebp, %eax
	movq	24(%r8), %rcx
	subl	%edx, %eax
	movzwl	%ax, %edx
	call	*(%r8)
	movq	16(%rsi), %r9
.L585:
	addq	$1, %rbx
	cmpq	%r9, %rbx
	jb	.L586
	notl	%eax
	movzbl	%al, %edx
.L584:
	movzbl	2(%rsi), %eax
	leal	1(%rdx,%rax), %edx
	movzbl	6(%rsi), %eax
	movl	%eax, %ecx
	andl	$127, %eax
	orl	$-128, %ecx
	testb	$-128, %dl
	cmovne	%ecx, %eax
	movl	%eax, %ecx
	andl	$-3, %eax
	orl	$2, %ecx
	testb	%dl, %dl
	cmove	%ecx, %eax
	movl	%eax, %ecx
	andl	$-2, %eax
	orl	$1, %ecx
	andb	$1, %dh
	cmovne	%ecx, %eax
	movb	%al, 6(%rsi)
	movl	$2, %eax
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	ret
	.p2align 4,,10
.L593:
	movl	$255, %edx
	jmp	.L584
	.seh_endproc
	.p2align 4,,15
	.globl	CPX_abss
	.def	CPX_abss;	.scl	2;	.type	32;	.endef
	.seh_proc	CPX_abss
CPX_abss:
	pushq	%r12
	.seh_pushreg	%r12
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movzwl	4(%rcx), %edi
	movq	16(%rcx), %rdx
	movq	%rcx, %rbx
	testq	%rdx, %rdx
	movl	%edi, %ebp
	je	.L596
	xorl	%eax, %eax
	xorl	%esi, %esi
	.p2align 4,,10
.L598:
	movq	%rsi, %r8
	salq	$5, %r8
	addq	8(%rbx), %r8
	movzwl	16(%r8), %ecx
	cmpw	%cx, %bp
	jb	.L597
	movzwl	18(%r8), %r9d
	movzwl	%cx, %r10d
	addl	%r10d, %r9d
	cmpl	%r9d, %edi
	jge	.L597
	movl	%ebp, %edx
	subl	%ecx, %edx
	movq	24(%r8), %rcx
	movzwl	%dx, %edx
	call	*(%r8)
	movq	16(%rbx), %rdx
.L597:
	addq	$1, %rsi
	cmpq	%rdx, %rsi
	jb	.L598
	movzwl	4(%rbx), %ebp
	testq	%rdx, %rdx
	movzbl	%al, %esi
	leal	1(%rbp), %r12d
	movzwl	%r12w, %edi
	je	.L596
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	.p2align 4,,10
.L600:
	movq	%rbp, %r8
	salq	$5, %r8
	addq	8(%rbx), %r8
	movzwl	16(%r8), %ecx
	cmpw	%cx, %r12w
	jb	.L599
	movzwl	18(%r8), %r9d
	movzwl	%cx, %r10d
	addl	%r10d, %r9d
	cmpl	%r9d, %edi
	jge	.L599
	movl	%r12d, %edx
	subl	%ecx, %edx
	movq	24(%r8), %rcx
	movzwl	%dx, %edx
	call	*(%r8)
	movq	16(%rbx), %rdx
.L599:
	addq	$1, %rbp
	cmpq	%rdx, %rbp
	jb	.L600
	sall	$8, %eax
	addw	$2, 4(%rbx)
	orl	%esi, %eax
	testq	%rdx, %rdx
	movzwl	%ax, %esi
	movl	%esi, %ebp
	je	.L621
	xorl	%eax, %eax
	xorl	%edi, %edi
	.p2align 4,,10
.L603:
	movq	%rdi, %r8
	salq	$5, %r8
	addq	8(%rbx), %r8
	movzwl	16(%r8), %ecx
	cmpw	%bp, %cx
	ja	.L602
	movzwl	18(%r8), %r9d
	movzwl	%cx, %r10d
	addl	%r10d, %r9d
	cmpl	%esi, %r9d
	jle	.L602
	movl	%ebp, %edx
	subl	%ecx, %edx
	movq	24(%r8), %rcx
	movzwl	%dx, %edx
	call	*(%r8)
	movq	16(%rbx), %rdx
.L602:
	addq	$1, %rdi
	cmpq	%rdx, %rdi
	jb	.L603
	notl	%eax
	movzbl	%al, %edx
.L601:
	movzbl	1(%rbx), %eax
	leal	1(%rdx,%rax), %edx
	movzbl	6(%rbx), %eax
	movl	%eax, %ecx
	andl	$127, %eax
	orl	$-128, %ecx
	testb	$-128, %dl
	cmovne	%ecx, %eax
	movl	%eax, %ecx
	andl	$-3, %eax
	orl	$2, %ecx
	testb	%dl, %dl
	cmove	%ecx, %eax
	movl	%eax, %ecx
	andl	$-2, %eax
	orl	$1, %ecx
	andb	$1, %dh
	cmovne	%ecx, %eax
	movb	%al, 6(%rbx)
	movl	$4, %eax
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	ret
	.p2align 4,,10
.L596:
	leal	2(%rbp), %eax
	movw	%ax, 4(%rbx)
.L621:
	movl	$255, %edx
	jmp	.L601
	.seh_endproc
	.p2align 4,,15
	.globl	CMP_abss
	.def	CMP_abss;	.scl	2;	.type	32;	.endef
	.seh_proc	CMP_abss
CMP_abss:
	pushq	%r12
	.seh_pushreg	%r12
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movzwl	4(%rcx), %edi
	movq	16(%rcx), %rdx
	movq	%rcx, %rbx
	testq	%rdx, %rdx
	movl	%edi, %ebp
	je	.L623
	xorl	%eax, %eax
	xorl	%esi, %esi
	.p2align 4,,10
.L625:
	movq	%rsi, %r8
	salq	$5, %r8
	addq	8(%rbx), %r8
	movzwl	16(%r8), %ecx
	cmpw	%cx, %bp
	jb	.L624
	movzwl	18(%r8), %r9d
	movzwl	%cx, %r10d
	addl	%r10d, %r9d
	cmpl	%r9d, %edi
	jge	.L624
	movl	%ebp, %edx
	subl	%ecx, %edx
	movq	24(%r8), %rcx
	movzwl	%dx, %edx
	call	*(%r8)
	movq	16(%rbx), %rdx
.L624:
	addq	$1, %rsi
	cmpq	%rdx, %rsi
	jb	.L625
	movzwl	4(%rbx), %ebp
	testq	%rdx, %rdx
	movzbl	%al, %esi
	leal	1(%rbp), %r12d
	movzwl	%r12w, %edi
	je	.L623
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	.p2align 4,,10
.L627:
	movq	%rbp, %r8
	salq	$5, %r8
	addq	8(%rbx), %r8
	movzwl	16(%r8), %ecx
	cmpw	%cx, %r12w
	jb	.L626
	movzwl	18(%r8), %r9d
	movzwl	%cx, %r10d
	addl	%r10d, %r9d
	cmpl	%r9d, %edi
	jge	.L626
	movl	%r12d, %edx
	subl	%ecx, %edx
	movq	24(%r8), %rcx
	movzwl	%dx, %edx
	call	*(%r8)
	movq	16(%rbx), %rdx
.L626:
	addq	$1, %rbp
	cmpq	%rdx, %rbp
	jb	.L627
	sall	$8, %eax
	addw	$2, 4(%rbx)
	orl	%esi, %eax
	testq	%rdx, %rdx
	movzwl	%ax, %esi
	movl	%esi, %ebp
	je	.L648
	xorl	%eax, %eax
	xorl	%edi, %edi
	.p2align 4,,10
.L630:
	movq	%rdi, %r8
	salq	$5, %r8
	addq	8(%rbx), %r8
	movzwl	16(%r8), %ecx
	cmpw	%bp, %cx
	ja	.L629
	movzwl	18(%r8), %r9d
	movzwl	%cx, %r10d
	addl	%r10d, %r9d
	cmpl	%esi, %r9d
	jle	.L629
	movl	%ebp, %edx
	subl	%ecx, %edx
	movq	24(%r8), %rcx
	movzwl	%dx, %edx
	call	*(%r8)
	movq	16(%rbx), %rdx
.L629:
	addq	$1, %rdi
	cmpq	%rdx, %rdi
	jb	.L630
	notl	%eax
	movzbl	%al, %edx
.L628:
	movzbl	(%rbx), %eax
	leal	1(%rdx,%rax), %edx
	movzbl	6(%rbx), %eax
	movl	%eax, %ecx
	andl	$127, %eax
	orl	$-128, %ecx
	testb	$-128, %dl
	cmovne	%ecx, %eax
	movl	%eax, %ecx
	andl	$-3, %eax
	orl	$2, %ecx
	testb	%dl, %dl
	cmove	%ecx, %eax
	movl	%eax, %ecx
	andl	$-2, %eax
	orl	$1, %ecx
	andb	$1, %dh
	cmovne	%ecx, %eax
	movb	%al, 6(%rbx)
	movl	$4, %eax
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	ret
	.p2align 4,,10
.L623:
	leal	2(%rbp), %eax
	movw	%ax, 4(%rbx)
.L648:
	movl	$255, %edx
	jmp	.L628
	.seh_endproc
	.p2align 4,,15
	.globl	CPY_abss
	.def	CPY_abss;	.scl	2;	.type	32;	.endef
	.seh_proc	CPY_abss
CPY_abss:
	pushq	%r12
	.seh_pushreg	%r12
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movzwl	4(%rcx), %edi
	movq	16(%rcx), %rdx
	movq	%rcx, %rbx
	testq	%rdx, %rdx
	movl	%edi, %ebp
	je	.L650
	xorl	%eax, %eax
	xorl	%esi, %esi
	.p2align 4,,10
.L652:
	movq	%rsi, %r8
	salq	$5, %r8
	addq	8(%rbx), %r8
	movzwl	16(%r8), %ecx
	cmpw	%cx, %bp
	jb	.L651
	movzwl	18(%r8), %r9d
	movzwl	%cx, %r10d
	addl	%r10d, %r9d
	cmpl	%r9d, %edi
	jge	.L651
	movl	%ebp, %edx
	subl	%ecx, %edx
	movq	24(%r8), %rcx
	movzwl	%dx, %edx
	call	*(%r8)
	movq	16(%rbx), %rdx
.L651:
	addq	$1, %rsi
	cmpq	%rdx, %rsi
	jb	.L652
	movzwl	4(%rbx), %ebp
	testq	%rdx, %rdx
	movzbl	%al, %esi
	leal	1(%rbp), %r12d
	movzwl	%r12w, %edi
	je	.L650
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	.p2align 4,,10
.L654:
	movq	%rbp, %r8
	salq	$5, %r8
	addq	8(%rbx), %r8
	movzwl	16(%r8), %ecx
	cmpw	%cx, %r12w
	jb	.L653
	movzwl	18(%r8), %r9d
	movzwl	%cx, %r10d
	addl	%r10d, %r9d
	cmpl	%r9d, %edi
	jge	.L653
	movl	%r12d, %edx
	subl	%ecx, %edx
	movq	24(%r8), %rcx
	movzwl	%dx, %edx
	call	*(%r8)
	movq	16(%rbx), %rdx
.L653:
	addq	$1, %rbp
	cmpq	%rdx, %rbp
	jb	.L654
	sall	$8, %eax
	addw	$2, 4(%rbx)
	orl	%esi, %eax
	testq	%rdx, %rdx
	movzwl	%ax, %esi
	movl	%esi, %ebp
	je	.L675
	xorl	%eax, %eax
	xorl	%edi, %edi
	.p2align 4,,10
.L657:
	movq	%rdi, %r8
	salq	$5, %r8
	addq	8(%rbx), %r8
	movzwl	16(%r8), %ecx
	cmpw	%bp, %cx
	ja	.L656
	movzwl	18(%r8), %r9d
	movzwl	%cx, %r10d
	addl	%r10d, %r9d
	cmpl	%esi, %r9d
	jle	.L656
	movl	%ebp, %edx
	subl	%ecx, %edx
	movq	24(%r8), %rcx
	movzwl	%dx, %edx
	call	*(%r8)
	movq	16(%rbx), %rdx
.L656:
	addq	$1, %rdi
	cmpq	%rdx, %rdi
	jb	.L657
	notl	%eax
	movzbl	%al, %edx
.L655:
	movzbl	2(%rbx), %eax
	leal	1(%rdx,%rax), %edx
	movzbl	6(%rbx), %eax
	movl	%eax, %ecx
	andl	$127, %eax
	orl	$-128, %ecx
	testb	$-128, %dl
	cmovne	%ecx, %eax
	movl	%eax, %ecx
	andl	$-3, %eax
	orl	$2, %ecx
	testb	%dl, %dl
	cmove	%ecx, %eax
	movl	%eax, %ecx
	andl	$-2, %eax
	orl	$1, %ecx
	andb	$1, %dh
	cmovne	%ecx, %eax
	movb	%al, 6(%rbx)
	movl	$4, %eax
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	ret
	.p2align 4,,10
.L650:
	leal	2(%rbp), %eax
	movw	%ax, 4(%rbx)
.L675:
	movl	$255, %edx
	jmp	.L655
	.seh_endproc
	.p2align 4,,15
	.globl	CMP_xind
	.def	CMP_xind;	.scl	2;	.type	32;	.endef
	.seh_proc	CMP_xind
CMP_xind:
	pushq	%r13
	.seh_pushreg	%r13
	pushq	%r12
	.seh_pushreg	%r12
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
	movzwl	4(%rcx), %ebp
	movq	16(%rcx), %rdx
	movq	%rcx, %rbx
	testq	%rdx, %rdx
	movl	%ebp, %r12d
	je	.L680
	xorl	%eax, %eax
	xorl	%esi, %esi
	.p2align 4,,10
.L679:
	movq	%rsi, %r8
	salq	$5, %r8
	addq	8(%rbx), %r8
	movzwl	16(%r8), %ecx
	cmpw	%cx, %r12w
	jb	.L678
	movzwl	18(%r8), %r9d
	movzwl	%cx, %r10d
	addl	%r10d, %r9d
	cmpl	%r9d, %ebp
	jge	.L678
	movl	%r12d, %edx
	subl	%ecx, %edx
	movq	24(%r8), %rcx
	movzwl	%dx, %edx
	call	*(%r8)
	movq	16(%rbx), %rdx
.L678:
	addq	$1, %rsi
	cmpq	%rdx, %rsi
	jb	.L679
	addb	1(%rbx), %al
	testq	%rdx, %rdx
	movzbl	%al, %ebp
	movl	%ebp, %edi
	movzbl	%bpl, %r13d
	je	.L680
	xorl	%eax, %eax
	xorl	%r12d, %r12d
	.p2align 4,,10
.L682:
	movq	%r12, %r8
	salq	$5, %r8
	addq	8(%rbx), %r8
	movzwl	16(%r8), %ecx
	cmpw	%cx, %r13w
	jb	.L681
	movzwl	18(%r8), %r9d
	movzwl	%cx, %r10d
	addl	%r10d, %r9d
	cmpl	%r9d, %ebp
	jge	.L681
	movl	%r13d, %edx
	subl	%ecx, %edx
	movq	24(%r8), %rcx
	movzwl	%dx, %edx
	call	*(%r8)
	movq	16(%rbx), %rdx
.L681:
	addq	$1, %r12
	cmpq	%rdx, %r12
	jb	.L682
	leal	1(%rdi), %r12d
	testq	%rdx, %rdx
	movzbl	%al, %esi
	movzbl	%r12b, %edi
	movzbl	%r12b, %r12d
	je	.L680
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	.p2align 4,,10
.L684:
	movq	%rbp, %r8
	salq	$5, %r8
	addq	8(%rbx), %r8
	movzwl	16(%r8), %ecx
	cmpw	%cx, %r12w
	jb	.L683
	movzwl	18(%r8), %r9d
	movzwl	%cx, %r10d
	addl	%r10d, %r9d
	cmpl	%r9d, %edi
	jge	.L683
	movl	%r12d, %edx
	subl	%ecx, %edx
	movq	24(%r8), %rcx
	movzwl	%dx, %edx
	call	*(%r8)
	movq	16(%rbx), %rdx
.L683:
	addq	$1, %rbp
	cmpq	%rdx, %rbp
	jb	.L684
	sall	$8, %eax
	addw	$1, 4(%rbx)
	orl	%esi, %eax
	testq	%rdx, %rdx
	movzwl	%ax, %esi
	movl	%esi, %ebp
	je	.L706
	xorl	%eax, %eax
	xorl	%edi, %edi
	.p2align 4,,10
.L687:
	movq	%rdi, %r8
	salq	$5, %r8
	addq	8(%rbx), %r8
	movzwl	16(%r8), %ecx
	cmpw	%bp, %cx
	ja	.L686
	movzwl	18(%r8), %r9d
	movzwl	%cx, %r10d
	addl	%r10d, %r9d
	cmpl	%r9d, %esi
	jge	.L686
	movl	%ebp, %edx
	subl	%ecx, %edx
	movq	24(%r8), %rcx
	movzwl	%dx, %edx
	call	*(%r8)
	movq	16(%rbx), %rdx
.L686:
	addq	$1, %rdi
	cmpq	%rdx, %rdi
	jb	.L687
	notl	%eax
	movzbl	%al, %edx
.L685:
	movzbl	(%rbx), %eax
	leal	1(%rdx,%rax), %edx
	movzbl	6(%rbx), %eax
	movl	%eax, %ecx
	andl	$127, %eax
	orl	$-128, %ecx
	testb	$-128, %dl
	cmovne	%ecx, %eax
	movl	%eax, %ecx
	andl	$-3, %eax
	orl	$2, %ecx
	testb	%dl, %dl
	cmove	%ecx, %eax
	movl	%eax, %ecx
	andl	$-2, %eax
	orl	$1, %ecx
	andb	$1, %dh
	cmovne	%ecx, %eax
	movb	%al, 6(%rbx)
	movl	$6, %eax
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	ret
	.p2align 4,,10
.L680:
	addw	$1, 4(%rbx)
.L706:
	movl	$255, %edx
	jmp	.L685
	.seh_endproc
	.p2align 4,,15
	.globl	CPX_imm
	.def	CPX_imm;	.scl	2;	.type	32;	.endef
	.seh_proc	CPX_imm
CPX_imm:
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
	movzwl	4(%rcx), %edi
	movq	16(%rcx), %r9
	movq	%rcx, %rsi
	testq	%r9, %r9
	leal	1(%rdi), %eax
	movl	%edi, %ebp
	movw	%ax, 4(%rcx)
	je	.L717
	xorl	%eax, %eax
	xorl	%ebx, %ebx
	.p2align 4,,10
.L710:
	movq	%rbx, %r8
	salq	$5, %r8
	addq	8(%rsi), %r8
	movzwl	16(%r8), %edx
	cmpw	%dx, %bp
	jb	.L709
	movzwl	18(%r8), %ecx
	movzwl	%dx, %r10d
	addl	%r10d, %ecx
	cmpl	%ecx, %edi
	jge	.L709
	movl	%ebp, %eax
	movq	24(%r8), %rcx
	subl	%edx, %eax
	movzwl	%ax, %edx
	call	*(%r8)
	movq	16(%rsi), %r9
.L709:
	addq	$1, %rbx
	cmpq	%r9, %rbx
	jb	.L710
	notl	%eax
	movzbl	%al, %edx
.L708:
	movzbl	1(%rsi), %eax
	leal	1(%rdx,%rax), %edx
	movzbl	6(%rsi), %eax
	movl	%eax, %ecx
	andl	$127, %eax
	orl	$-128, %ecx
	testb	$-128, %dl
	cmovne	%ecx, %eax
	movl	%eax, %ecx
	andl	$-3, %eax
	orl	$2, %ecx
	testb	%dl, %dl
	cmove	%ecx, %eax
	movl	%eax, %ecx
	andl	$-2, %eax
	orl	$1, %ecx
	andb	$1, %dh
	cmovne	%ecx, %eax
	movb	%al, 6(%rsi)
	movl	$2, %eax
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	ret
	.p2align 4,,10
.L717:
	movl	$255, %edx
	jmp	.L708
	.seh_endproc
	.p2align 4,,15
	.globl	CMP_indy
	.def	CMP_indy;	.scl	2;	.type	32;	.endef
	.seh_proc	CMP_indy
CMP_indy:
	pushq	%r13
	.seh_pushreg	%r13
	pushq	%r12
	.seh_pushreg	%r12
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
	movzwl	4(%rcx), %ebp
	movq	16(%rcx), %rdx
	movq	%rcx, %rbx
	testq	%rdx, %rdx
	movl	%ebp, %r12d
	je	.L720
	xorl	%edi, %edi
	xorl	%esi, %esi
	.p2align 4,,10
.L722:
	movq	%rsi, %rax
	salq	$5, %rax
	addq	8(%rbx), %rax
	movzwl	16(%rax), %ecx
	cmpw	%cx, %r12w
	jb	.L721
	movzwl	18(%rax), %r8d
	movzwl	%cx, %r9d
	addl	%r9d, %r8d
	cmpl	%r8d, %ebp
	jge	.L721
	movl	%r12d, %edx
	subl	%ecx, %edx
	movq	24(%rax), %rcx
	movzwl	%dx, %edx
	call	*(%rax)
	movq	16(%rbx), %rdx
	movl	%eax, %edi
.L721:
	addq	$1, %rsi
	cmpq	%rdx, %rsi
	jb	.L722
	testq	%rdx, %rdx
	movzbl	%dil, %ebp
	movzbl	%dil, %r13d
	je	.L720
	xorl	%eax, %eax
	xorl	%r12d, %r12d
	.p2align 4,,10
.L725:
	movq	%r12, %r8
	salq	$5, %r8
	addq	8(%rbx), %r8
	movzwl	16(%r8), %ecx
	cmpw	%cx, %r13w
	jb	.L724
	movzwl	18(%r8), %r9d
	movzwl	%cx, %r10d
	addl	%r10d, %r9d
	cmpl	%r9d, %ebp
	jge	.L724
	movl	%r13d, %edx
	subl	%ecx, %edx
	movq	24(%r8), %rcx
	movzwl	%dx, %edx
	call	*(%r8)
	movq	16(%rbx), %rdx
.L724:
	addq	$1, %r12
	cmpq	%rdx, %r12
	jb	.L725
	leal	1(%rdi), %r12d
	testq	%rdx, %rdx
	movzbl	%al, %esi
	movzbl	%r12b, %edi
	movzbl	%r12b, %r12d
	je	.L720
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	.p2align 4,,10
.L727:
	movq	%rbp, %r8
	salq	$5, %r8
	addq	8(%rbx), %r8
	movzwl	16(%r8), %ecx
	cmpw	%r12w, %cx
	ja	.L726
	movzwl	18(%r8), %r9d
	movzwl	%cx, %r10d
	addl	%r10d, %r9d
	cmpl	%edi, %r9d
	jle	.L726
	movl	%r12d, %edx
	subl	%ecx, %edx
	movq	24(%r8), %rcx
	movzwl	%dx, %edx
	call	*(%r8)
	movq	16(%rbx), %rdx
.L726:
	addq	$1, %rbp
	cmpq	%rdx, %rbp
	jb	.L727
	movzbl	2(%rbx), %ebp
	sall	$8, %eax
	addw	$1, 4(%rbx)
	orl	%eax, %esi
	addl	%esi, %ebp
	testq	%rdx, %rdx
	movzwl	%bp, %esi
	je	.L749
	xorl	%eax, %eax
	xorl	%edi, %edi
	.p2align 4,,10
.L730:
	movq	%rdi, %r8
	salq	$5, %r8
	addq	8(%rbx), %r8
	movzwl	16(%r8), %ecx
	cmpw	%bp, %cx
	ja	.L729
	movzwl	18(%r8), %r9d
	movzwl	%cx, %r10d
	addl	%r10d, %r9d
	cmpl	%r9d, %esi
	jge	.L729
	movl	%ebp, %edx
	subl	%ecx, %edx
	movq	24(%r8), %rcx
	movzwl	%dx, %edx
	call	*(%r8)
	movq	16(%rbx), %rdx
.L729:
	addq	$1, %rdi
	cmpq	%rdx, %rdi
	jb	.L730
	notl	%eax
	movzbl	%al, %edx
.L728:
	movzbl	(%rbx), %eax
	leal	1(%rdx,%rax), %edx
	movzbl	6(%rbx), %eax
	movl	%eax, %ecx
	andl	$127, %eax
	orl	$-128, %ecx
	testb	$-128, %dl
	cmovne	%ecx, %eax
	movl	%eax, %ecx
	andl	$-3, %eax
	orl	$2, %ecx
	testb	%dl, %dl
	cmove	%ecx, %eax
	movl	%eax, %ecx
	andl	$-2, %eax
	orl	$1, %ecx
	andb	$1, %dh
	cmovne	%ecx, %eax
	movb	%al, 6(%rbx)
	movl	$5, %eax
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	ret
	.p2align 4,,10
.L720:
	addw	$1, 4(%rbx)
.L749:
	movl	$255, %edx
	jmp	.L728
	.seh_endproc
	.p2align 4,,15
	.globl	CMP_imm
	.def	CMP_imm;	.scl	2;	.type	32;	.endef
	.seh_proc	CMP_imm
CMP_imm:
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
	movzwl	4(%rcx), %edi
	movq	16(%rcx), %r9
	movq	%rcx, %rsi
	testq	%r9, %r9
	leal	1(%rdi), %eax
	movl	%edi, %ebp
	movw	%ax, 4(%rcx)
	je	.L760
	xorl	%eax, %eax
	xorl	%ebx, %ebx
	.p2align 4,,10
.L753:
	movq	%rbx, %r8
	salq	$5, %r8
	addq	8(%rsi), %r8
	movzwl	16(%r8), %edx
	cmpw	%dx, %bp
	jb	.L752
	movzwl	18(%r8), %ecx
	movzwl	%dx, %r10d
	addl	%r10d, %ecx
	cmpl	%ecx, %edi
	jge	.L752
	movl	%ebp, %eax
	movq	24(%r8), %rcx
	subl	%edx, %eax
	movzwl	%ax, %edx
	call	*(%r8)
	movq	16(%rsi), %r9
.L752:
	addq	$1, %rbx
	cmpq	%r9, %rbx
	jb	.L753
	notl	%eax
	movzbl	%al, %edx
.L751:
	movzbl	(%rsi), %eax
	leal	1(%rdx,%rax), %edx
	movzbl	6(%rsi), %eax
	movl	%eax, %ecx
	andl	$127, %eax
	orl	$-128, %ecx
	testb	$-128, %dl
	cmovne	%ecx, %eax
	movl	%eax, %ecx
	andl	$-3, %eax
	orl	$2, %ecx
	testb	%dl, %dl
	cmove	%ecx, %eax
	movl	%eax, %ecx
	andl	$-2, %eax
	orl	$1, %ecx
	andb	$1, %dh
	cmovne	%ecx, %eax
	movb	%al, 6(%rsi)
	movl	$2, %eax
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	ret
	.p2align 4,,10
.L760:
	movl	$255, %edx
	jmp	.L751
	.seh_endproc
	.p2align 4,,15
	.globl	STA_zpgx
	.def	STA_zpgx;	.scl	2;	.type	32;	.endef
	.seh_proc	STA_zpgx
STA_zpgx:
	pushq	%r12
	.seh_pushreg	%r12
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movzwl	4(%rcx), %edi
	movq	16(%rcx), %r9
	movq	%rcx, %rsi
	movzbl	(%rcx), %ebx
	testq	%r9, %r9
	movl	%edi, %r12d
	je	.L763
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	.p2align 4,,10
.L765:
	movq	%rbp, %r8
	salq	$5, %r8
	addq	8(%rsi), %r8
	movzwl	16(%r8), %edx
	cmpw	%dx, %r12w
	jb	.L764
	movzwl	18(%r8), %ecx
	movzwl	%dx, %r10d
	addl	%r10d, %ecx
	cmpl	%ecx, %edi
	jge	.L764
	movl	%r12d, %eax
	movq	24(%r8), %rcx
	subl	%edx, %eax
	movzwl	%ax, %edx
	call	*(%r8)
	movq	16(%rsi), %r9
.L764:
	addq	$1, %rbp
	cmpq	%r9, %rbp
	jb	.L765
	addb	1(%rsi), %al
	addw	$1, 4(%rsi)
	testq	%r9, %r9
	movzbl	%al, %edi
	movzbl	%al, %r12d
	je	.L770
	xorl	%ebp, %ebp
	.p2align 4,,10
.L768:
	movq	%rbp, %rax
	salq	$5, %rax
	addq	8(%rsi), %rax
	movzwl	16(%rax), %edx
	cmpw	%dx, %r12w
	jb	.L767
	movzwl	18(%rax), %ecx
	movzwl	%dx, %r8d
	addl	%r8d, %ecx
	cmpl	%ecx, %edi
	jge	.L767
	movl	%r12d, %ecx
	movl	%ebx, %r8d
	subl	%edx, %ecx
	movzwl	%cx, %edx
	movq	24(%rax), %rcx
	call	*8(%rax)
	movq	16(%rsi), %r9
.L767:
	addq	$1, %rbp
	cmpq	%r9, %rbp
	jb	.L768
.L770:
	movl	$4, %eax
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	ret
	.p2align 4,,10
.L763:
	addl	$1, %r12d
	movl	$4, %eax
	movw	%r12w, 4(%rcx)
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	ret
	.seh_endproc
	.p2align 4,,15
	.globl	STX_zpgy
	.def	STX_zpgy;	.scl	2;	.type	32;	.endef
	.seh_proc	STX_zpgy
STX_zpgy:
	pushq	%r12
	.seh_pushreg	%r12
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movzwl	4(%rcx), %edi
	movq	16(%rcx), %r9
	movq	%rcx, %rsi
	movzbl	1(%rcx), %ebx
	testq	%r9, %r9
	movl	%edi, %r12d
	je	.L776
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	.p2align 4,,10
.L778:
	movq	%rbp, %r8
	salq	$5, %r8
	addq	8(%rsi), %r8
	movzwl	16(%r8), %edx
	cmpw	%dx, %r12w
	jb	.L777
	movzwl	18(%r8), %ecx
	movzwl	%dx, %r10d
	addl	%r10d, %ecx
	cmpl	%ecx, %edi
	jge	.L777
	movl	%r12d, %eax
	movq	24(%r8), %rcx
	subl	%edx, %eax
	movzwl	%ax, %edx
	call	*(%r8)
	movq	16(%rsi), %r9
.L777:
	addq	$1, %rbp
	cmpq	%r9, %rbp
	jb	.L778
	addb	2(%rsi), %al
	addw	$1, 4(%rsi)
	testq	%r9, %r9
	movzbl	%al, %edi
	movzbl	%al, %r12d
	je	.L783
	xorl	%ebp, %ebp
	.p2align 4,,10
.L781:
	movq	%rbp, %rax
	salq	$5, %rax
	addq	8(%rsi), %rax
	movzwl	16(%rax), %edx
	cmpw	%dx, %r12w
	jb	.L780
	movzwl	18(%rax), %ecx
	movzwl	%dx, %r8d
	addl	%r8d, %ecx
	cmpl	%ecx, %edi
	jge	.L780
	movl	%r12d, %ecx
	movl	%ebx, %r8d
	subl	%edx, %ecx
	movzwl	%cx, %edx
	movq	24(%rax), %rcx
	call	*8(%rax)
	movq	16(%rsi), %r9
.L780:
	addq	$1, %rbp
	cmpq	%r9, %rbp
	jb	.L781
.L783:
	movl	$4, %eax
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	ret
	.p2align 4,,10
.L776:
	addl	$1, %r12d
	movl	$4, %eax
	movw	%r12w, 4(%rcx)
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	ret
	.seh_endproc
	.p2align 4,,15
	.globl	ASL_absx
	.def	ASL_absx;	.scl	2;	.type	32;	.endef
	.seh_proc	ASL_absx
ASL_absx:
	pushq	%r15
	.seh_pushreg	%r15
	pushq	%r14
	.seh_pushreg	%r14
	pushq	%r13
	.seh_pushreg	%r13
	pushq	%r12
	.seh_pushreg	%r12
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
	movzwl	4(%rcx), %edi
	movq	16(%rcx), %rdx
	movq	%rcx, %rbx
	testq	%rdx, %rdx
	movl	%edi, %ebp
	je	.L789
	xorl	%eax, %eax
	xorl	%esi, %esi
	.p2align 4,,10
.L791:
	movq	%rsi, %r8
	salq	$5, %r8
	addq	8(%rbx), %r8
	movzwl	16(%r8), %ecx
	cmpw	%cx, %bp
	jb	.L790
	movzwl	18(%r8), %r9d
	movzwl	%cx, %r10d
	addl	%r10d, %r9d
	cmpl	%r9d, %edi
	jge	.L790
	movl	%ebp, %edx
	subl	%ecx, %edx
	movq	24(%r8), %rcx
	movzwl	%dx, %edx
	call	*(%r8)
	movq	16(%rbx), %rdx
.L790:
	addq	$1, %rsi
	cmpq	%rdx, %rsi
	jb	.L791
	movzwl	4(%rbx), %ebp
	testq	%rdx, %rdx
	movzbl	%al, %esi
	leal	1(%rbp), %r12d
	movzwl	%r12w, %edi
	je	.L789
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	.p2align 4,,10
.L793:
	movq	%rbp, %r8
	salq	$5, %r8
	addq	8(%rbx), %r8
	movzwl	16(%r8), %ecx
	cmpw	%cx, %r12w
	jb	.L792
	movzwl	18(%r8), %r9d
	movzwl	%cx, %r10d
	addl	%r10d, %r9d
	cmpl	%r9d, %edi
	jge	.L792
	movl	%r12d, %edx
	subl	%ecx, %edx
	movq	24(%r8), %rcx
	movzwl	%dx, %edx
	call	*(%r8)
	movq	16(%rbx), %rdx
.L792:
	addq	$1, %rbp
	cmpq	%rdx, %rbp
	jb	.L793
	movzbl	1(%rbx), %r14d
	sall	$8, %eax
	addw	$2, 4(%rbx)
	orl	%eax, %esi
	addl	%esi, %r14d
	testq	%rdx, %rdx
	movzwl	%r14w, %edi
	je	.L794
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	.p2align 4,,10
.L796:
	movq	%rbp, %r8
	salq	$5, %r8
	addq	8(%rbx), %r8
	movzwl	16(%r8), %ecx
	cmpw	%r14w, %cx
	ja	.L795
	movzwl	18(%r8), %r9d
	movzwl	%cx, %r10d
	addl	%r10d, %r9d
	cmpl	%r9d, %edi
	jge	.L795
	movl	%r14d, %edx
	subl	%ecx, %edx
	movq	24(%r8), %rcx
	movzwl	%dx, %edx
	call	*(%r8)
	movq	16(%rbx), %rdx
.L795:
	addq	$1, %rbp
	cmpq	%rdx, %rbp
	jb	.L796
	movzbl	%al, %esi
	addl	%esi, %esi
	movl	%esi, %r13d
	movzbl	%sil, %ebp
	movzbl	%sil, %r12d
	andw	$128, %r13w
	andw	$256, %si
	testq	%rdx, %rdx
	je	.L797
	xorl	%r15d, %r15d
	.p2align 4,,10
.L799:
	movq	%r15, %rax
	salq	$5, %rax
	addq	8(%rbx), %rax
	movzwl	16(%rax), %ecx
	cmpw	%r14w, %cx
	ja	.L798
	movzwl	18(%rax), %r8d
	movzwl	%cx, %r9d
	addl	%r9d, %r8d
	cmpl	%r8d, %edi
	jge	.L798
	movl	%r14d, %edx
	movl	%ebp, %r8d
	subl	%ecx, %edx
	movq	24(%rax), %rcx
	movzwl	%dx, %edx
	call	*8(%rax)
	movq	16(%rbx), %rdx
.L798:
	addq	$1, %r15
	cmpq	%rdx, %r15
	jb	.L799
.L797:
	movzbl	6(%rbx), %eax
	movl	%eax, %edx
	andl	$127, %eax
	orl	$-128, %edx
	testw	%r13w, %r13w
	cmove	%eax, %edx
	movl	%edx, %eax
	andl	$-3, %eax
	testw	%r12w, %r12w
	je	.L800
.L804:
	movl	%eax, %edx
	andl	$-2, %eax
	orl	$1, %edx
	testw	%si, %si
	cmovne	%edx, %eax
	movb	%al, 6(%rbx)
	movl	$7, %eax
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	ret
	.p2align 4,,10
.L789:
	leal	2(%rbp), %eax
	movw	%ax, 4(%rbx)
.L794:
	movzbl	6(%rbx), %edx
	xorl	%esi, %esi
	andl	$127, %edx
.L800:
	movl	%edx, %eax
	orl	$2, %eax
	jmp	.L804
	.seh_endproc
	.p2align 4,,15
	.globl	STY_zpgx
	.def	STY_zpgx;	.scl	2;	.type	32;	.endef
	.seh_proc	STY_zpgx
STY_zpgx:
	pushq	%r12
	.seh_pushreg	%r12
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movzwl	4(%rcx), %edi
	movq	16(%rcx), %r9
	movq	%rcx, %rsi
	movzbl	2(%rcx), %ebx
	testq	%r9, %r9
	movl	%edi, %r12d
	je	.L825
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	.p2align 4,,10
.L827:
	movq	%rbp, %r8
	salq	$5, %r8
	addq	8(%rsi), %r8
	movzwl	16(%r8), %edx
	cmpw	%dx, %r12w
	jb	.L826
	movzwl	18(%r8), %ecx
	movzwl	%dx, %r10d
	addl	%r10d, %ecx
	cmpl	%ecx, %edi
	jge	.L826
	movl	%r12d, %eax
	movq	24(%r8), %rcx
	subl	%edx, %eax
	movzwl	%ax, %edx
	call	*(%r8)
	movq	16(%rsi), %r9
.L826:
	addq	$1, %rbp
	cmpq	%r9, %rbp
	jb	.L827
	addb	1(%rsi), %al
	addw	$1, 4(%rsi)
	testq	%r9, %r9
	movzbl	%al, %edi
	movzbl	%al, %r12d
	je	.L832
	xorl	%ebp, %ebp
	.p2align 4,,10
.L830:
	movq	%rbp, %rax
	salq	$5, %rax
	addq	8(%rsi), %rax
	movzwl	16(%rax), %edx
	cmpw	%dx, %r12w
	jb	.L829
	movzwl	18(%rax), %ecx
	movzwl	%dx, %r8d
	addl	%r8d, %ecx
	cmpl	%ecx, %edi
	jge	.L829
	movl	%r12d, %ecx
	movl	%ebx, %r8d
	subl	%edx, %ecx
	movzwl	%cx, %edx
	movq	24(%rax), %rcx
	call	*8(%rax)
	movq	16(%rsi), %r9
.L829:
	addq	$1, %rbp
	cmpq	%r9, %rbp
	jb	.L830
.L832:
	movl	$4, %eax
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	ret
	.p2align 4,,10
.L825:
	addl	$1, %r12d
	movl	$4, %eax
	movw	%r12w, 4(%rcx)
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	ret
	.seh_endproc
	.p2align 4,,15
	.globl	ASL_abss
	.def	ASL_abss;	.scl	2;	.type	32;	.endef
	.seh_proc	ASL_abss
ASL_abss:
	pushq	%r15
	.seh_pushreg	%r15
	pushq	%r14
	.seh_pushreg	%r14
	pushq	%r13
	.seh_pushreg	%r13
	pushq	%r12
	.seh_pushreg	%r12
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
	movzwl	4(%rcx), %edi
	movq	16(%rcx), %rdx
	movq	%rcx, %rbx
	testq	%rdx, %rdx
	movl	%edi, %ebp
	je	.L838
	xorl	%eax, %eax
	xorl	%esi, %esi
	.p2align 4,,10
.L840:
	movq	%rsi, %r8
	salq	$5, %r8
	addq	8(%rbx), %r8
	movzwl	16(%r8), %ecx
	cmpw	%cx, %bp
	jb	.L839
	movzwl	18(%r8), %r9d
	movzwl	%cx, %r10d
	addl	%r10d, %r9d
	cmpl	%r9d, %edi
	jge	.L839
	movl	%ebp, %edx
	subl	%ecx, %edx
	movq	24(%r8), %rcx
	movzwl	%dx, %edx
	call	*(%r8)
	movq	16(%rbx), %rdx
.L839:
	addq	$1, %rsi
	cmpq	%rdx, %rsi
	jb	.L840
	movzwl	4(%rbx), %ebp
	testq	%rdx, %rdx
	movzbl	%al, %r14d
	leal	1(%rbp), %r12d
	movzwl	%r12w, %edi
	je	.L838
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	.p2align 4,,10
.L842:
	movq	%rbp, %r8
	salq	$5, %r8
	addq	8(%rbx), %r8
	movzwl	16(%r8), %ecx
	cmpw	%cx, %r12w
	jb	.L841
	movzwl	18(%r8), %r9d
	movzwl	%cx, %r10d
	addl	%r10d, %r9d
	cmpl	%r9d, %edi
	jge	.L841
	movl	%r12d, %edx
	subl	%ecx, %edx
	movq	24(%r8), %rcx
	movzwl	%dx, %edx
	call	*(%r8)
	movq	16(%rbx), %rdx
.L841:
	addq	$1, %rbp
	cmpq	%rdx, %rbp
	jb	.L842
	sall	$8, %eax
	addw	$2, 4(%rbx)
	orl	%eax, %r14d
	testq	%rdx, %rdx
	movzwl	%r14w, %edi
	je	.L843
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	.p2align 4,,10
.L845:
	movq	%rbp, %r8
	salq	$5, %r8
	addq	8(%rbx), %r8
	movzwl	16(%r8), %ecx
	cmpw	%r14w, %cx
	ja	.L844
	movzwl	18(%r8), %r9d
	movzwl	%cx, %r10d
	addl	%r10d, %r9d
	cmpl	%edi, %r9d
	jle	.L844
	movl	%r14d, %edx
	subl	%ecx, %edx
	movq	24(%r8), %rcx
	movzwl	%dx, %edx
	call	*(%r8)
	movq	16(%rbx), %rdx
.L844:
	addq	$1, %rbp
	cmpq	%rdx, %rbp
	jb	.L845
	movzbl	%al, %esi
	addl	%esi, %esi
	movl	%esi, %r13d
	movzbl	%sil, %ebp
	movzbl	%sil, %r12d
	andw	$128, %r13w
	andw	$256, %si
	testq	%rdx, %rdx
	je	.L846
	xorl	%r15d, %r15d
	.p2align 4,,10
.L848:
	movq	%r15, %r9
	salq	$5, %r9
	addq	8(%rbx), %r9
	movzwl	16(%r9), %eax
	cmpw	%r14w, %ax
	ja	.L847
	movzwl	18(%r9), %ecx
	movzwl	%ax, %r8d
	addl	%r8d, %ecx
	cmpl	%edi, %ecx
	jle	.L847
	movl	%r14d, %edx
	movq	24(%r9), %rcx
	movl	%ebp, %r8d
	subl	%eax, %edx
	movzwl	%dx, %edx
	call	*8(%r9)
	movq	16(%rbx), %rdx
.L847:
	addq	$1, %r15
	cmpq	%rdx, %r15
	jb	.L848
.L846:
	movzbl	6(%rbx), %eax
	movl	%eax, %edx
	andl	$127, %eax
	orl	$-128, %edx
	testw	%r13w, %r13w
	cmove	%eax, %edx
	movl	%edx, %eax
	andl	$-3, %eax
	testw	%r12w, %r12w
	je	.L849
.L853:
	movl	%eax, %edx
	andl	$-2, %eax
	orl	$1, %edx
	testw	%si, %si
	cmovne	%edx, %eax
	movb	%al, 6(%rbx)
	movl	$6, %eax
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	ret
	.p2align 4,,10
.L838:
	leal	2(%rbp), %eax
	movw	%ax, 4(%rbx)
.L843:
	movzbl	6(%rbx), %edx
	xorl	%esi, %esi
	andl	$127, %edx
.L849:
	movl	%edx, %eax
	orl	$2, %eax
	jmp	.L853
	.seh_endproc
	.p2align 4,,15
	.globl	SAX_zpg
	.def	SAX_zpg;	.scl	2;	.type	32;	.endef
	.seh_proc	SAX_zpg
SAX_zpg:
	pushq	%r13
	.seh_pushreg	%r13
	pushq	%r12
	.seh_pushreg	%r12
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
	movzbl	(%rcx), %ebx
	movzwl	4(%rcx), %edi
	andb	1(%rcx), %bl
	movq	16(%rcx), %r10
	movq	%rcx, %rsi
	testq	%r10, %r10
	movl	%edi, %r13d
	movzbl	%bl, %ebx
	je	.L874
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	.p2align 4,,10
.L876:
	movq	%rbp, %r8
	salq	$5, %r8
	addq	8(%rsi), %r8
	movzwl	16(%r8), %edx
	cmpw	%dx, %r13w
	jb	.L875
	movzwl	18(%r8), %ecx
	movzwl	%dx, %r9d
	addl	%r9d, %ecx
	cmpl	%ecx, %edi
	jge	.L875
	movl	%r13d, %eax
	movq	24(%r8), %rcx
	subl	%edx, %eax
	movzwl	%ax, %edx
	call	*(%r8)
	movq	16(%rsi), %r10
.L875:
	addq	$1, %rbp
	cmpq	%r10, %rbp
	jb	.L876
	addw	$1, 4(%rsi)
	testq	%r10, %r10
	movzbl	%al, %edi
	movzbl	%al, %r12d
	je	.L881
	xorl	%ebp, %ebp
	.p2align 4,,10
.L879:
	movq	%rbp, %r9
	salq	$5, %r9
	addq	8(%rsi), %r9
	movzwl	16(%r9), %edx
	cmpw	%r12w, %dx
	ja	.L878
	movzwl	18(%r9), %ecx
	movzwl	%dx, %eax
	addl	%eax, %ecx
	cmpl	%edi, %ecx
	jle	.L878
	movl	%r12d, %eax
	movq	24(%r9), %rcx
	movl	%ebx, %r8d
	subl	%edx, %eax
	movzwl	%ax, %edx
	call	*8(%r9)
	movq	16(%rsi), %r10
.L878:
	addq	$1, %rbp
	cmpq	%r10, %rbp
	jb	.L879
.L881:
	movl	$3, %eax
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	ret
	.p2align 4,,10
.L874:
	addl	$1, %r13d
	movw	%r13w, 4(%rcx)
	jmp	.L881
	.seh_endproc
	.p2align 4,,15
	.globl	SAX_zpgy
	.def	SAX_zpgy;	.scl	2;	.type	32;	.endef
	.seh_proc	SAX_zpgy
SAX_zpgy:
	pushq	%r12
	.seh_pushreg	%r12
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movzbl	(%rcx), %ebx
	movzwl	4(%rcx), %edi
	andb	1(%rcx), %bl
	movq	16(%rcx), %r9
	movq	%rcx, %rsi
	testq	%r9, %r9
	movl	%edi, %r12d
	movzbl	%bl, %ebx
	je	.L887
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	.p2align 4,,10
.L889:
	movq	%rbp, %r8
	salq	$5, %r8
	addq	8(%rsi), %r8
	movzwl	16(%r8), %edx
	cmpw	%dx, %r12w
	jb	.L888
	movzwl	18(%r8), %ecx
	movzwl	%dx, %r10d
	addl	%r10d, %ecx
	cmpl	%ecx, %edi
	jge	.L888
	movl	%r12d, %eax
	movq	24(%r8), %rcx
	subl	%edx, %eax
	movzwl	%ax, %edx
	call	*(%r8)
	movq	16(%rsi), %r9
.L888:
	addq	$1, %rbp
	cmpq	%r9, %rbp
	jb	.L889
	addb	2(%rsi), %al
	addw	$1, 4(%rsi)
	testq	%r9, %r9
	movzbl	%al, %edi
	movzbl	%al, %r12d
	je	.L894
	xorl	%ebp, %ebp
	.p2align 4,,10
.L892:
	movq	%rbp, %rax
	salq	$5, %rax
	addq	8(%rsi), %rax
	movzwl	16(%rax), %edx
	cmpw	%dx, %r12w
	jb	.L891
	movzwl	18(%rax), %ecx
	movzwl	%dx, %r8d
	addl	%r8d, %ecx
	cmpl	%ecx, %edi
	jge	.L891
	movl	%r12d, %ecx
	movl	%ebx, %r8d
	subl	%edx, %ecx
	movzwl	%cx, %edx
	movq	24(%rax), %rcx
	call	*8(%rax)
	movq	16(%rsi), %r9
.L891:
	addq	$1, %rbp
	cmpq	%r9, %rbp
	jb	.L892
.L894:
	movl	$3, %eax
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	ret
	.p2align 4,,10
.L887:
	addl	$1, %r12d
	movl	$3, %eax
	movw	%r12w, 4(%rcx)
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	ret
	.seh_endproc
	.p2align 4,,15
	.globl	CMP_zpg
	.def	CMP_zpg;	.scl	2;	.type	32;	.endef
	.seh_proc	CMP_zpg
CMP_zpg:
	pushq	%r12
	.seh_pushreg	%r12
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movzwl	4(%rcx), %ebp
	movq	16(%rcx), %rdx
	movq	%rcx, %rbx
	testq	%rdx, %rdx
	movl	%ebp, %r12d
	je	.L900
	xorl	%eax, %eax
	xorl	%esi, %esi
	.p2align 4,,10
.L902:
	movq	%rsi, %r8
	salq	$5, %r8
	addq	8(%rbx), %r8
	movzwl	16(%r8), %ecx
	cmpw	%cx, %r12w
	jb	.L901
	movzwl	18(%r8), %r9d
	movzwl	%cx, %r10d
	addl	%r10d, %r9d
	cmpl	%r9d, %ebp
	jge	.L901
	movl	%r12d, %edx
	subl	%ecx, %edx
	movq	24(%r8), %rcx
	movzwl	%dx, %edx
	call	*(%r8)
	movq	16(%rbx), %rdx
.L901:
	addq	$1, %rsi
	cmpq	%rdx, %rsi
	jb	.L902
	addw	$1, 4(%rbx)
	testq	%rdx, %rdx
	movzbl	%al, %ebp
	movzbl	%al, %edi
	je	.L916
	xorl	%eax, %eax
	xorl	%esi, %esi
	.p2align 4,,10
.L905:
	movq	%rsi, %r8
	salq	$5, %r8
	addq	8(%rbx), %r8
	movzwl	16(%r8), %ecx
	cmpw	%di, %cx
	ja	.L904
	movzwl	18(%r8), %r9d
	movzwl	%cx, %r10d
	addl	%r10d, %r9d
	cmpl	%ebp, %r9d
	jle	.L904
	movl	%edi, %edx
	subl	%ecx, %edx
	movq	24(%r8), %rcx
	movzwl	%dx, %edx
	call	*(%r8)
	movq	16(%rbx), %rdx
.L904:
	addq	$1, %rsi
	cmpq	%rdx, %rsi
	jb	.L905
	notl	%eax
	movzbl	%al, %edx
.L903:
	movzbl	(%rbx), %eax
	leal	1(%rdx,%rax), %edx
	movzbl	6(%rbx), %eax
	movl	%eax, %ecx
	andl	$127, %eax
	orl	$-128, %ecx
	testb	$-128, %dl
	cmovne	%ecx, %eax
	movl	%eax, %ecx
	andl	$-3, %eax
	orl	$2, %ecx
	testb	%dl, %dl
	cmove	%ecx, %eax
	movl	%eax, %ecx
	andl	$-2, %eax
	orl	$1, %ecx
	andb	$1, %dh
	cmovne	%ecx, %eax
	movb	%al, 6(%rbx)
	movl	$3, %eax
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	ret
	.p2align 4,,10
.L900:
	addl	$1, %r12d
	movw	%r12w, 4(%rcx)
.L916:
	movl	$255, %edx
	jmp	.L903
	.seh_endproc
	.p2align 4,,15
	.globl	CPX_zpg
	.def	CPX_zpg;	.scl	2;	.type	32;	.endef
	.seh_proc	CPX_zpg
CPX_zpg:
	pushq	%r12
	.seh_pushreg	%r12
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movzwl	4(%rcx), %ebp
	movq	16(%rcx), %rdx
	movq	%rcx, %rbx
	testq	%rdx, %rdx
	movl	%ebp, %r12d
	je	.L918
	xorl	%eax, %eax
	xorl	%esi, %esi
	.p2align 4,,10
.L920:
	movq	%rsi, %r8
	salq	$5, %r8
	addq	8(%rbx), %r8
	movzwl	16(%r8), %ecx
	cmpw	%cx, %r12w
	jb	.L919
	movzwl	18(%r8), %r9d
	movzwl	%cx, %r10d
	addl	%r10d, %r9d
	cmpl	%r9d, %ebp
	jge	.L919
	movl	%r12d, %edx
	subl	%ecx, %edx
	movq	24(%r8), %rcx
	movzwl	%dx, %edx
	call	*(%r8)
	movq	16(%rbx), %rdx
.L919:
	addq	$1, %rsi
	cmpq	%rdx, %rsi
	jb	.L920
	addw	$1, 4(%rbx)
	testq	%rdx, %rdx
	movzbl	%al, %ebp
	movzbl	%al, %edi
	je	.L934
	xorl	%eax, %eax
	xorl	%esi, %esi
	.p2align 4,,10
.L923:
	movq	%rsi, %r8
	salq	$5, %r8
	addq	8(%rbx), %r8
	movzwl	16(%r8), %ecx
	cmpw	%di, %cx
	ja	.L922
	movzwl	18(%r8), %r9d
	movzwl	%cx, %r10d
	addl	%r10d, %r9d
	cmpl	%ebp, %r9d
	jle	.L922
	movl	%edi, %edx
	subl	%ecx, %edx
	movq	24(%r8), %rcx
	movzwl	%dx, %edx
	call	*(%r8)
	movq	16(%rbx), %rdx
.L922:
	addq	$1, %rsi
	cmpq	%rdx, %rsi
	jb	.L923
	notl	%eax
	movzbl	%al, %edx
.L921:
	movzbl	1(%rbx), %eax
	leal	1(%rdx,%rax), %edx
	movzbl	6(%rbx), %eax
	movl	%eax, %ecx
	andl	$127, %eax
	orl	$-128, %ecx
	testb	$-128, %dl
	cmovne	%ecx, %eax
	movl	%eax, %ecx
	andl	$-3, %eax
	orl	$2, %ecx
	testb	%dl, %dl
	cmove	%ecx, %eax
	movl	%eax, %ecx
	andl	$-2, %eax
	orl	$1, %ecx
	andb	$1, %dh
	cmovne	%ecx, %eax
	movb	%al, 6(%rbx)
	movl	$3, %eax
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	ret
	.p2align 4,,10
.L918:
	addl	$1, %r12d
	movw	%r12w, 4(%rcx)
.L934:
	movl	$255, %edx
	jmp	.L921
	.seh_endproc
	.p2align 4,,15
	.globl	CPY_zpg
	.def	CPY_zpg;	.scl	2;	.type	32;	.endef
	.seh_proc	CPY_zpg
CPY_zpg:
	pushq	%r12
	.seh_pushreg	%r12
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movzwl	4(%rcx), %ebp
	movq	16(%rcx), %rdx
	movq	%rcx, %rbx
	testq	%rdx, %rdx
	movl	%ebp, %r12d
	je	.L936
	xorl	%eax, %eax
	xorl	%esi, %esi
	.p2align 4,,10
.L938:
	movq	%rsi, %r8
	salq	$5, %r8
	addq	8(%rbx), %r8
	movzwl	16(%r8), %ecx
	cmpw	%cx, %r12w
	jb	.L937
	movzwl	18(%r8), %r9d
	movzwl	%cx, %r10d
	addl	%r10d, %r9d
	cmpl	%r9d, %ebp
	jge	.L937
	movl	%r12d, %edx
	subl	%ecx, %edx
	movq	24(%r8), %rcx
	movzwl	%dx, %edx
	call	*(%r8)
	movq	16(%rbx), %rdx
.L937:
	addq	$1, %rsi
	cmpq	%rdx, %rsi
	jb	.L938
	addw	$1, 4(%rbx)
	testq	%rdx, %rdx
	movzbl	%al, %ebp
	movzbl	%al, %edi
	je	.L952
	xorl	%eax, %eax
	xorl	%esi, %esi
	.p2align 4,,10
.L941:
	movq	%rsi, %r8
	salq	$5, %r8
	addq	8(%rbx), %r8
	movzwl	16(%r8), %ecx
	cmpw	%di, %cx
	ja	.L940
	movzwl	18(%r8), %r9d
	movzwl	%cx, %r10d
	addl	%r10d, %r9d
	cmpl	%ebp, %r9d
	jle	.L940
	movl	%edi, %edx
	subl	%ecx, %edx
	movq	24(%r8), %rcx
	movzwl	%dx, %edx
	call	*(%r8)
	movq	16(%rbx), %rdx
.L940:
	addq	$1, %rsi
	cmpq	%rdx, %rsi
	jb	.L941
	notl	%eax
	movzbl	%al, %edx
.L939:
	movzbl	2(%rbx), %eax
	leal	1(%rdx,%rax), %edx
	movzbl	6(%rbx), %eax
	movl	%eax, %ecx
	andl	$127, %eax
	orl	$-128, %ecx
	testb	$-128, %dl
	cmovne	%ecx, %eax
	movl	%eax, %ecx
	andl	$-3, %eax
	orl	$2, %ecx
	testb	%dl, %dl
	cmove	%ecx, %eax
	movl	%eax, %ecx
	andl	$-2, %eax
	orl	$1, %ecx
	andb	$1, %dh
	cmovne	%ecx, %eax
	movb	%al, 6(%rbx)
	movl	$3, %eax
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	ret
	.p2align 4,,10
.L936:
	addl	$1, %r12d
	movw	%r12w, 4(%rcx)
.L952:
	movl	$255, %edx
	jmp	.L939
	.seh_endproc
	.p2align 4,,15
	.globl	ASL_zpg
	.def	ASL_zpg;	.scl	2;	.type	32;	.endef
	.seh_proc	ASL_zpg
ASL_zpg:
	pushq	%r15
	.seh_pushreg	%r15
	pushq	%r14
	.seh_pushreg	%r14
	pushq	%r13
	.seh_pushreg	%r13
	pushq	%r12
	.seh_pushreg	%r12
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
	movzwl	4(%rcx), %edi
	movq	16(%rcx), %rdx
	movq	%rcx, %rbx
	testq	%rdx, %rdx
	movl	%edi, %ebp
	je	.L954
	xorl	%eax, %eax
	xorl	%esi, %esi
	.p2align 4,,10
.L956:
	movq	%rsi, %r8
	salq	$5, %r8
	addq	8(%rbx), %r8
	movzwl	16(%r8), %ecx
	cmpw	%cx, %bp
	jb	.L955
	movzwl	18(%r8), %r9d
	movzwl	%cx, %r10d
	addl	%r10d, %r9d
	cmpl	%r9d, %edi
	jge	.L955
	movl	%ebp, %edx
	subl	%ecx, %edx
	movq	24(%r8), %rcx
	movzwl	%dx, %edx
	call	*(%r8)
	movq	16(%rbx), %rdx
.L955:
	addq	$1, %rsi
	cmpq	%rdx, %rsi
	jb	.L956
	addw	$1, 4(%rbx)
	testq	%rdx, %rdx
	movzbl	%al, %edi
	movzbl	%al, %r14d
	je	.L957
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	.p2align 4,,10
.L959:
	movq	%rbp, %r8
	salq	$5, %r8
	addq	8(%rbx), %r8
	movzwl	16(%r8), %ecx
	cmpw	%r14w, %cx
	ja	.L958
	movzwl	18(%r8), %r9d
	movzwl	%cx, %r10d
	addl	%r10d, %r9d
	cmpl	%edi, %r9d
	jle	.L958
	movl	%r14d, %edx
	subl	%ecx, %edx
	movq	24(%r8), %rcx
	movzwl	%dx, %edx
	call	*(%r8)
	movq	16(%rbx), %rdx
.L958:
	addq	$1, %rbp
	cmpq	%rdx, %rbp
	jb	.L959
	movzbl	%al, %esi
	addl	%esi, %esi
	movl	%esi, %r13d
	movzbl	%sil, %ebp
	movzbl	%sil, %r12d
	andw	$128, %r13w
	andw	$256, %si
	testq	%rdx, %rdx
	je	.L960
	xorl	%r15d, %r15d
	.p2align 4,,10
.L962:
	movq	%r15, %r9
	salq	$5, %r9
	addq	8(%rbx), %r9
	movzwl	16(%r9), %eax
	cmpw	%r14w, %ax
	ja	.L961
	movzwl	18(%r9), %ecx
	movzwl	%ax, %r8d
	addl	%r8d, %ecx
	cmpl	%edi, %ecx
	jle	.L961
	movl	%r14d, %edx
	movq	24(%r9), %rcx
	movl	%ebp, %r8d
	subl	%eax, %edx
	movzwl	%dx, %edx
	call	*8(%r9)
	movq	16(%rbx), %rdx
.L961:
	addq	$1, %r15
	cmpq	%rdx, %r15
	jb	.L962
.L960:
	movzbl	6(%rbx), %eax
	movl	%eax, %edx
	andl	$127, %eax
	orl	$-128, %edx
	testw	%r13w, %r13w
	cmove	%eax, %edx
	movl	%edx, %eax
	andl	$-3, %eax
	testw	%r12w, %r12w
	je	.L963
.L967:
	movl	%eax, %edx
	andl	$-2, %eax
	orl	$1, %edx
	testw	%si, %si
	cmovne	%edx, %eax
	movb	%al, 6(%rbx)
	movl	$5, %eax
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	ret
	.p2align 4,,10
.L954:
	addl	$1, %ebp
	movw	%bp, 4(%rcx)
.L957:
	movzbl	6(%rbx), %edx
	xorl	%esi, %esi
	andl	$127, %edx
.L963:
	movl	%edx, %eax
	orl	$2, %eax
	jmp	.L967
	.seh_endproc
	.p2align 4,,15
	.globl	CMP_zpgx
	.def	CMP_zpgx;	.scl	2;	.type	32;	.endef
	.seh_proc	CMP_zpgx
CMP_zpgx:
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
	movzwl	4(%rcx), %ebp
	movq	16(%rcx), %rdx
	movq	%rcx, %rbx
	testq	%rdx, %rdx
	movl	%ebp, %edi
	je	.L981
	xorl	%eax, %eax
	xorl	%esi, %esi
	.p2align 4,,10
.L983:
	movq	%rsi, %r8
	salq	$5, %r8
	addq	8(%rbx), %r8
	movzwl	16(%r8), %ecx
	cmpw	%cx, %di
	jb	.L982
	movzwl	18(%r8), %r9d
	movzwl	%cx, %r10d
	addl	%r10d, %r9d
	cmpl	%r9d, %ebp
	jge	.L982
	movl	%edi, %edx
	subl	%ecx, %edx
	movq	24(%r8), %rcx
	movzwl	%dx, %edx
	call	*(%r8)
	movq	16(%rbx), %rdx
.L982:
	addq	$1, %rsi
	cmpq	%rdx, %rsi
	jb	.L983
	addb	1(%rbx), %al
	addw	$1, 4(%rbx)
	testq	%rdx, %rdx
	movzbl	%al, %ebp
	movzbl	%al, %edi
	je	.L997
	xorl	%eax, %eax
	xorl	%esi, %esi
	.p2align 4,,10
.L986:
	movq	%rsi, %r8
	salq	$5, %r8
	addq	8(%rbx), %r8
	movzwl	16(%r8), %ecx
	cmpw	%cx, %di
	jb	.L985
	movzwl	18(%r8), %r9d
	movzwl	%cx, %r10d
	addl	%r10d, %r9d
	cmpl	%r9d, %ebp
	jge	.L985
	movl	%edi, %edx
	subl	%ecx, %edx
	movq	24(%r8), %rcx
	movzwl	%dx, %edx
	call	*(%r8)
	movq	16(%rbx), %rdx
.L985:
	addq	$1, %rsi
	cmpq	%rdx, %rsi
	jb	.L986
	notl	%eax
	movzbl	%al, %edx
.L984:
	movzbl	(%rbx), %eax
	leal	1(%rdx,%rax), %edx
	movzbl	6(%rbx), %eax
	movl	%eax, %ecx
	andl	$127, %eax
	orl	$-128, %ecx
	testb	$-128, %dl
	cmovne	%ecx, %eax
	movl	%eax, %ecx
	andl	$-3, %eax
	orl	$2, %ecx
	testb	%dl, %dl
	cmove	%ecx, %eax
	movl	%eax, %ecx
	andl	$-2, %eax
	orl	$1, %ecx
	andb	$1, %dh
	cmovne	%ecx, %eax
	movb	%al, 6(%rbx)
	movl	$4, %eax
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	ret
	.p2align 4,,10
.L981:
	addl	$1, %edi
	movw	%di, 4(%rcx)
.L997:
	movl	$255, %edx
	jmp	.L984
	.seh_endproc
	.p2align 4,,15
	.globl	RTS
	.def	RTS;	.scl	2;	.type	32;	.endef
	.seh_proc	RTS
RTS:
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
	movzbl	3(%rcx), %eax
	movq	16(%rcx), %rdx
	movq	%rcx, %rbx
	leal	1(%rax), %edi
	movb	%dil, 3(%rcx)
	movzbl	%dil, %edi
	addw	$256, %di
	testq	%rdx, %rdx
	movzwl	%di, %ebp
	je	.L999
	xorl	%eax, %eax
	xorl	%esi, %esi
	.p2align 4,,10
.L1001:
	movq	%rsi, %r8
	salq	$5, %r8
	addq	8(%rbx), %r8
	movzwl	16(%r8), %ecx
	cmpw	%cx, %di
	jb	.L1000
	movzwl	18(%r8), %r9d
	movzwl	%cx, %r10d
	addl	%r10d, %r9d
	cmpl	%r9d, %ebp
	jge	.L1000
	movl	%edi, %edx
	subl	%ecx, %edx
	movq	24(%r8), %rcx
	movzwl	%dx, %edx
	call	*(%r8)
	movq	16(%rbx), %rdx
.L1000:
	addq	$1, %rsi
	cmpq	%rdx, %rsi
	jb	.L1001
	movzbl	%al, %eax
	leal	1(%rax), %ecx
	movzbl	3(%rbx), %eax
	movw	%cx, 4(%rbx)
	leal	1(%rax), %edi
	movb	%dil, 3(%rbx)
	movzbl	%dil, %edi
	addw	$256, %di
	testq	%rdx, %rdx
	movzwl	%di, %ebp
	je	.L1005
	xorl	%eax, %eax
	xorl	%esi, %esi
	.p2align 4,,10
.L1004:
	movq	%rsi, %r8
	salq	$5, %r8
	addq	8(%rbx), %r8
	movzwl	16(%r8), %ecx
	cmpw	%cx, %di
	jb	.L1003
	movzwl	18(%r8), %r9d
	movzwl	%cx, %r10d
	addl	%r10d, %r9d
	cmpl	%r9d, %ebp
	jge	.L1003
	movl	%edi, %edx
	subl	%ecx, %edx
	movq	24(%r8), %rcx
	movzwl	%dx, %edx
	call	*(%r8)
	movq	16(%rbx), %rdx
.L1003:
	addq	$1, %rsi
	cmpq	%rdx, %rsi
	jb	.L1004
	movzwl	4(%rbx), %ecx
	sall	$8, %eax
.L1002:
	addl	%eax, %ecx
	movl	$6, %eax
	movw	%cx, 4(%rbx)
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	ret
	.p2align 4,,10
.L999:
	addl	$2, %eax
	movb	%al, 3(%rcx)
	xorl	%eax, %eax
	movl	$1, %ecx
	jmp	.L1002
.L1005:
	xorl	%eax, %eax
	jmp	.L1002
	.seh_endproc
	.p2align 4,,15
	.globl	ASL_zpgx
	.def	ASL_zpgx;	.scl	2;	.type	32;	.endef
	.seh_proc	ASL_zpgx
ASL_zpgx:
	pushq	%r15
	.seh_pushreg	%r15
	pushq	%r14
	.seh_pushreg	%r14
	pushq	%r13
	.seh_pushreg	%r13
	pushq	%r12
	.seh_pushreg	%r12
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
	movzwl	4(%rcx), %edi
	movq	16(%rcx), %rdx
	movq	%rcx, %rbx
	testq	%rdx, %rdx
	movl	%edi, %ebp
	je	.L1010
	xorl	%eax, %eax
	xorl	%esi, %esi
	.p2align 4,,10
.L1012:
	movq	%rsi, %r8
	salq	$5, %r8
	addq	8(%rbx), %r8
	movzwl	16(%r8), %ecx
	cmpw	%cx, %bp
	jb	.L1011
	movzwl	18(%r8), %r9d
	movzwl	%cx, %r10d
	addl	%r10d, %r9d
	cmpl	%r9d, %edi
	jge	.L1011
	movl	%ebp, %edx
	subl	%ecx, %edx
	movq	24(%r8), %rcx
	movzwl	%dx, %edx
	call	*(%r8)
	movq	16(%rbx), %rdx
.L1011:
	addq	$1, %rsi
	cmpq	%rdx, %rsi
	jb	.L1012
	addb	1(%rbx), %al
	addw	$1, 4(%rbx)
	testq	%rdx, %rdx
	movzbl	%al, %edi
	movzbl	%al, %r14d
	je	.L1013
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	.p2align 4,,10
.L1015:
	movq	%rbp, %r8
	salq	$5, %r8
	addq	8(%rbx), %r8
	movzwl	16(%r8), %ecx
	cmpw	%cx, %r14w
	jb	.L1014
	movzwl	18(%r8), %r9d
	movzwl	%cx, %r10d
	addl	%r10d, %r9d
	cmpl	%r9d, %edi
	jge	.L1014
	movl	%r14d, %edx
	subl	%ecx, %edx
	movq	24(%r8), %rcx
	movzwl	%dx, %edx
	call	*(%r8)
	movq	16(%rbx), %rdx
.L1014:
	addq	$1, %rbp
	cmpq	%rdx, %rbp
	jb	.L1015
	movzbl	%al, %esi
	addl	%esi, %esi
	movl	%esi, %r13d
	movzbl	%sil, %ebp
	movzbl	%sil, %r12d
	andw	$128, %r13w
	andw	$256, %si
	testq	%rdx, %rdx
	je	.L1016
	xorl	%r15d, %r15d
	.p2align 4,,10
.L1018:
	movq	%r15, %rax
	salq	$5, %rax
	addq	8(%rbx), %rax
	movzwl	16(%rax), %ecx
	cmpw	%r14w, %cx
	ja	.L1017
	movzwl	18(%rax), %r8d
	movzwl	%cx, %r9d
	addl	%r9d, %r8d
	cmpl	%r8d, %edi
	jge	.L1017
	movl	%r14d, %edx
	movl	%ebp, %r8d
	subl	%ecx, %edx
	movq	24(%rax), %rcx
	movzwl	%dx, %edx
	call	*8(%rax)
	movq	16(%rbx), %rdx
.L1017:
	addq	$1, %r15
	cmpq	%rdx, %r15
	jb	.L1018
.L1016:
	movzbl	6(%rbx), %eax
	movl	%eax, %edx
	andl	$127, %eax
	orl	$-128, %edx
	testw	%r13w, %r13w
	cmove	%eax, %edx
	movl	%edx, %eax
	andl	$-3, %eax
	testw	%r12w, %r12w
	je	.L1019
.L1023:
	movl	%eax, %edx
	andl	$-2, %eax
	orl	$1, %edx
	testw	%si, %si
	cmovne	%edx, %eax
	movb	%al, 6(%rbx)
	movl	$6, %eax
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	ret
	.p2align 4,,10
.L1010:
	addl	$1, %ebp
	movw	%bp, 4(%rcx)
.L1013:
	movzbl	6(%rbx), %edx
	xorl	%esi, %esi
	andl	$127, %edx
.L1019:
	movl	%edx, %eax
	orl	$2, %eax
	jmp	.L1023
	.seh_endproc
	.p2align 4,,15
	.globl	BIT_abss
	.def	BIT_abss;	.scl	2;	.type	32;	.endef
	.seh_proc	BIT_abss
BIT_abss:
	pushq	%r12
	.seh_pushreg	%r12
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movzwl	4(%rcx), %edi
	movq	16(%rcx), %rdx
	movq	%rcx, %rbx
	testq	%rdx, %rdx
	movl	%edi, %ebp
	je	.L1037
	xorl	%eax, %eax
	xorl	%esi, %esi
	.p2align 4,,10
.L1039:
	movq	%rsi, %r8
	salq	$5, %r8
	addq	8(%rbx), %r8
	movzwl	16(%r8), %ecx
	cmpw	%cx, %bp
	jb	.L1038
	movzwl	18(%r8), %r9d
	movzwl	%cx, %r10d
	addl	%r10d, %r9d
	cmpl	%r9d, %edi
	jge	.L1038
	movl	%ebp, %edx
	subl	%ecx, %edx
	movq	24(%r8), %rcx
	movzwl	%dx, %edx
	call	*(%r8)
	movq	16(%rbx), %rdx
.L1038:
	addq	$1, %rsi
	cmpq	%rdx, %rsi
	jb	.L1039
	movzwl	4(%rbx), %ebp
	testq	%rdx, %rdx
	movzbl	%al, %esi
	leal	1(%rbp), %r12d
	movzwl	%r12w, %edi
	je	.L1037
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	.p2align 4,,10
.L1041:
	movq	%rbp, %r8
	salq	$5, %r8
	addq	8(%rbx), %r8
	movzwl	16(%r8), %ecx
	cmpw	%cx, %r12w
	jb	.L1040
	movzwl	18(%r8), %r9d
	movzwl	%cx, %r10d
	addl	%r10d, %r9d
	cmpl	%r9d, %edi
	jge	.L1040
	movl	%r12d, %edx
	subl	%ecx, %edx
	movq	24(%r8), %rcx
	movzwl	%dx, %edx
	call	*(%r8)
	movq	16(%rbx), %rdx
.L1040:
	addq	$1, %rbp
	cmpq	%rdx, %rbp
	jb	.L1041
	sall	$8, %eax
	addw	$2, 4(%rbx)
	orl	%eax, %esi
	testq	%rdx, %rdx
	movzwl	%si, %edi
	je	.L1047
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	.p2align 4,,10
.L1042:
	movq	%rbp, %r8
	salq	$5, %r8
	addq	8(%rbx), %r8
	movzwl	16(%r8), %ecx
	cmpw	%si, %cx
	ja	.L1044
	movzwl	18(%r8), %r9d
	movzwl	%cx, %r10d
	addl	%r10d, %r9d
	cmpl	%edi, %r9d
	jle	.L1044
	movl	%esi, %edx
	subl	%ecx, %edx
	movq	24(%r8), %rcx
	movzwl	%dx, %edx
	call	*(%r8)
	movq	16(%rbx), %rdx
.L1044:
	addq	$1, %rbp
	cmpq	%rdx, %rbp
	jb	.L1042
	movzbl	6(%rbx), %ecx
	movl	%eax, %r8d
	andl	$-64, %r8d
	movl	%ecx, %edx
	andl	$-3, %edx
	testb	%al, (%rbx)
	je	.L1043
.L1046:
	andl	$63, %edx
	movl	$4, %eax
	orl	%r8d, %edx
	movb	%dl, 6(%rbx)
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	ret
	.p2align 4,,10
.L1037:
	leal	2(%rbp), %eax
	movw	%ax, 4(%rbx)
.L1047:
	movzbl	6(%rbx), %ecx
	xorl	%r8d, %r8d
.L1043:
	orl	$2, %ecx
	movl	%ecx, %edx
	jmp	.L1046
	.seh_endproc
	.p2align 4,,15
	.globl	LDY_abss
	.def	LDY_abss;	.scl	2;	.type	32;	.endef
	.seh_proc	LDY_abss
LDY_abss:
	pushq	%r12
	.seh_pushreg	%r12
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movzwl	4(%rcx), %edi
	movq	16(%rcx), %rdx
	movq	%rcx, %rbx
	testq	%rdx, %rdx
	movl	%edi, %ebp
	je	.L1060
	xorl	%eax, %eax
	xorl	%esi, %esi
	.p2align 4,,10
.L1062:
	movq	%rsi, %r8
	salq	$5, %r8
	addq	8(%rbx), %r8
	movzwl	16(%r8), %ecx
	cmpw	%cx, %bp
	jb	.L1061
	movzwl	18(%r8), %r9d
	movzwl	%cx, %r10d
	addl	%r10d, %r9d
	cmpl	%r9d, %edi
	jge	.L1061
	movl	%ebp, %edx
	subl	%ecx, %edx
	movq	24(%r8), %rcx
	movzwl	%dx, %edx
	call	*(%r8)
	movq	16(%rbx), %rdx
.L1061:
	addq	$1, %rsi
	cmpq	%rdx, %rsi
	jb	.L1062
	movzwl	4(%rbx), %ebp
	testq	%rdx, %rdx
	movzbl	%al, %esi
	leal	1(%rbp), %r12d
	movzwl	%r12w, %edi
	je	.L1060
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	.p2align 4,,10
.L1064:
	movq	%rbp, %r8
	salq	$5, %r8
	addq	8(%rbx), %r8
	movzwl	16(%r8), %ecx
	cmpw	%cx, %r12w
	jb	.L1063
	movzwl	18(%r8), %r9d
	movzwl	%cx, %r10d
	addl	%r10d, %r9d
	cmpl	%r9d, %edi
	jge	.L1063
	movl	%r12d, %edx
	subl	%ecx, %edx
	movq	24(%r8), %rcx
	movzwl	%dx, %edx
	call	*(%r8)
	movq	16(%rbx), %rdx
.L1063:
	addq	$1, %rbp
	cmpq	%rdx, %rbp
	jb	.L1064
	sall	$8, %eax
	addw	$2, 4(%rbx)
	orl	%eax, %esi
	testq	%rdx, %rdx
	movzwl	%si, %edi
	je	.L1065
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	.p2align 4,,10
.L1067:
	movq	%rbp, %r8
	salq	$5, %r8
	addq	8(%rbx), %r8
	movzwl	16(%r8), %ecx
	cmpw	%si, %cx
	ja	.L1066
	movzwl	18(%r8), %r9d
	movzwl	%cx, %r10d
	addl	%r10d, %r9d
	cmpl	%edi, %r9d
	jle	.L1066
	movl	%esi, %edx
	subl	%ecx, %edx
	movq	24(%r8), %rcx
	movzwl	%dx, %edx
	call	*(%r8)
	movq	16(%rbx), %rdx
.L1066:
	addq	$1, %rbp
	cmpq	%rdx, %rbp
	jb	.L1067
	testb	%al, %al
	movb	%al, 2(%rbx)
	movzbl	6(%rbx), %edx
	js	.L1087
	andl	$127, %edx
	testb	%al, %al
	movb	%dl, 6(%rbx)
	jne	.L1071
	orl	$2, %edx
	jmp	.L1072
	.p2align 4,,10
.L1087:
	orl	$-128, %edx
.L1071:
	andl	$-3, %edx
.L1072:
	movl	$4, %eax
	movb	%dl, 6(%rbx)
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	ret
	.p2align 4,,10
.L1060:
	leal	2(%rbp), %eax
	movw	%ax, 4(%rbx)
.L1065:
	movzbl	6(%rbx), %edx
	movb	$0, 2(%rbx)
	andl	$127, %edx
	orl	$2, %edx
	jmp	.L1072
	.seh_endproc
	.p2align 4,,15
	.globl	LDA_absy
	.def	LDA_absy;	.scl	2;	.type	32;	.endef
	.seh_proc	LDA_absy
LDA_absy:
	pushq	%r12
	.seh_pushreg	%r12
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movzwl	4(%rcx), %edi
	movq	16(%rcx), %rdx
	movq	%rcx, %rbx
	testq	%rdx, %rdx
	movl	%edi, %ebp
	je	.L1089
	xorl	%eax, %eax
	xorl	%esi, %esi
	.p2align 4,,10
.L1091:
	movq	%rsi, %r8
	salq	$5, %r8
	addq	8(%rbx), %r8
	movzwl	16(%r8), %ecx
	cmpw	%cx, %bp
	jb	.L1090
	movzwl	18(%r8), %r9d
	movzwl	%cx, %r10d
	addl	%r10d, %r9d
	cmpl	%r9d, %edi
	jge	.L1090
	movl	%ebp, %edx
	subl	%ecx, %edx
	movq	24(%r8), %rcx
	movzwl	%dx, %edx
	call	*(%r8)
	movq	16(%rbx), %rdx
.L1090:
	addq	$1, %rsi
	cmpq	%rdx, %rsi
	jb	.L1091
	movzwl	4(%rbx), %ebp
	testq	%rdx, %rdx
	movzbl	%al, %esi
	leal	1(%rbp), %r12d
	movzwl	%r12w, %edi
	je	.L1089
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	.p2align 4,,10
.L1093:
	movq	%rbp, %r8
	salq	$5, %r8
	addq	8(%rbx), %r8
	movzwl	16(%r8), %ecx
	cmpw	%cx, %r12w
	jb	.L1092
	movzwl	18(%r8), %r9d
	movzwl	%cx, %r10d
	addl	%r10d, %r9d
	cmpl	%r9d, %edi
	jge	.L1092
	movl	%r12d, %edx
	subl	%ecx, %edx
	movq	24(%r8), %rcx
	movzwl	%dx, %edx
	call	*(%r8)
	movq	16(%rbx), %rdx
.L1092:
	addq	$1, %rbp
	cmpq	%rdx, %rbp
	jb	.L1093
	movzbl	2(%rbx), %ebp
	sall	$8, %eax
	addw	$2, 4(%rbx)
	orl	%eax, %esi
	addl	%esi, %ebp
	testq	%rdx, %rdx
	movzwl	%bp, %edi
	je	.L1094
	xorl	%eax, %eax
	xorl	%esi, %esi
	.p2align 4,,10
.L1096:
	movq	%rsi, %r8
	salq	$5, %r8
	addq	8(%rbx), %r8
	movzwl	16(%r8), %ecx
	cmpw	%bp, %cx
	ja	.L1095
	movzwl	18(%r8), %r9d
	movzwl	%cx, %r10d
	addl	%r10d, %r9d
	cmpl	%r9d, %edi
	jge	.L1095
	movl	%ebp, %edx
	subl	%ecx, %edx
	movq	24(%r8), %rcx
	movzwl	%dx, %edx
	call	*(%r8)
	movq	16(%rbx), %rdx
.L1095:
	addq	$1, %rsi
	cmpq	%rdx, %rsi
	jb	.L1096
	testb	%al, %al
	movb	%al, (%rbx)
	movzbl	6(%rbx), %edx
	js	.L1116
	andl	$127, %edx
	testb	%al, %al
	movb	%dl, 6(%rbx)
	jne	.L1100
	orl	$2, %edx
	jmp	.L1101
	.p2align 4,,10
.L1116:
	orl	$-128, %edx
.L1100:
	andl	$-3, %edx
.L1101:
	movl	$4, %eax
	movb	%dl, 6(%rbx)
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	ret
	.p2align 4,,10
.L1089:
	leal	2(%rbp), %eax
	movw	%ax, 4(%rbx)
.L1094:
	movzbl	6(%rbx), %edx
	movb	$0, (%rbx)
	andl	$127, %edx
	orl	$2, %edx
	jmp	.L1101
	.seh_endproc
	.p2align 4,,15
	.globl	LDA_indy
	.def	LDA_indy;	.scl	2;	.type	32;	.endef
	.seh_proc	LDA_indy
LDA_indy:
	pushq	%r13
	.seh_pushreg	%r13
	pushq	%r12
	.seh_pushreg	%r12
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
	movzwl	4(%rcx), %ebp
	movq	16(%rcx), %rdx
	movq	%rcx, %rbx
	testq	%rdx, %rdx
	movl	%ebp, %r12d
	je	.L1118
	xorl	%edi, %edi
	xorl	%esi, %esi
	.p2align 4,,10
.L1120:
	movq	%rsi, %rax
	salq	$5, %rax
	addq	8(%rbx), %rax
	movzwl	16(%rax), %ecx
	cmpw	%cx, %r12w
	jb	.L1119
	movzwl	18(%rax), %r8d
	movzwl	%cx, %r9d
	addl	%r9d, %r8d
	cmpl	%r8d, %ebp
	jge	.L1119
	movl	%r12d, %edx
	subl	%ecx, %edx
	movq	24(%rax), %rcx
	movzwl	%dx, %edx
	call	*(%rax)
	movq	16(%rbx), %rdx
	movl	%eax, %edi
.L1119:
	addq	$1, %rsi
	cmpq	%rdx, %rsi
	jb	.L1120
	testq	%rdx, %rdx
	movzbl	%dil, %ebp
	movzbl	%dil, %r13d
	je	.L1118
	xorl	%eax, %eax
	xorl	%r12d, %r12d
	.p2align 4,,10
.L1123:
	movq	%r12, %r8
	salq	$5, %r8
	addq	8(%rbx), %r8
	movzwl	16(%r8), %ecx
	cmpw	%cx, %r13w
	jb	.L1122
	movzwl	18(%r8), %r9d
	movzwl	%cx, %r10d
	addl	%r10d, %r9d
	cmpl	%r9d, %ebp
	jge	.L1122
	movl	%r13d, %edx
	subl	%ecx, %edx
	movq	24(%r8), %rcx
	movzwl	%dx, %edx
	call	*(%r8)
	movq	16(%rbx), %rdx
.L1122:
	addq	$1, %r12
	cmpq	%rdx, %r12
	jb	.L1123
	leal	1(%rdi), %r12d
	testq	%rdx, %rdx
	movzbl	%al, %esi
	movzbl	%r12b, %edi
	movzbl	%r12b, %r12d
	je	.L1118
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	.p2align 4,,10
.L1125:
	movq	%rbp, %r8
	salq	$5, %r8
	addq	8(%rbx), %r8
	movzwl	16(%r8), %ecx
	cmpw	%r12w, %cx
	ja	.L1124
	movzwl	18(%r8), %r9d
	movzwl	%cx, %r10d
	addl	%r10d, %r9d
	cmpl	%edi, %r9d
	jle	.L1124
	movl	%r12d, %edx
	subl	%ecx, %edx
	movq	24(%r8), %rcx
	movzwl	%dx, %edx
	call	*(%r8)
	movq	16(%rbx), %rdx
.L1124:
	addq	$1, %rbp
	cmpq	%rdx, %rbp
	jb	.L1125
	sall	$8, %eax
	addw	$1, 4(%rbx)
	orl	%eax, %esi
	movzbl	2(%rbx), %eax
	addl	%eax, %esi
	testq	%rdx, %rdx
	movzwl	%si, %edi
	je	.L1126
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	.p2align 4,,10
.L1128:
	movq	%rbp, %r8
	salq	$5, %r8
	addq	8(%rbx), %r8
	movzwl	16(%r8), %ecx
	cmpw	%si, %cx
	ja	.L1127
	movzwl	18(%r8), %r9d
	movzwl	%cx, %r10d
	addl	%r10d, %r9d
	cmpl	%r9d, %edi
	jge	.L1127
	movl	%esi, %edx
	subl	%ecx, %edx
	movq	24(%r8), %rcx
	movzwl	%dx, %edx
	call	*(%r8)
	movq	16(%rbx), %rdx
.L1127:
	addq	$1, %rbp
	cmpq	%rdx, %rbp
	jb	.L1128
	testb	%al, %al
	movb	%al, (%rbx)
	movzbl	6(%rbx), %edx
	js	.L1149
	andl	$127, %edx
	testb	%al, %al
	movb	%dl, 6(%rbx)
	jne	.L1132
	orl	$2, %edx
	jmp	.L1133
	.p2align 4,,10
.L1149:
	orl	$-128, %edx
.L1132:
	andl	$-3, %edx
.L1133:
	movl	$5, %eax
	movb	%dl, 6(%rbx)
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	ret
	.p2align 4,,10
.L1118:
	addw	$1, 4(%rbx)
.L1126:
	movzbl	6(%rbx), %edx
	movb	$0, (%rbx)
	andl	$127, %edx
	orl	$2, %edx
	jmp	.L1133
	.seh_endproc
	.p2align 4,,15
	.globl	LDA_xind
	.def	LDA_xind;	.scl	2;	.type	32;	.endef
	.seh_proc	LDA_xind
LDA_xind:
	pushq	%r13
	.seh_pushreg	%r13
	pushq	%r12
	.seh_pushreg	%r12
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
	movzwl	4(%rcx), %ebp
	movq	16(%rcx), %rdx
	movq	%rcx, %rbx
	testq	%rdx, %rdx
	movl	%ebp, %r12d
	je	.L1154
	xorl	%eax, %eax
	xorl	%esi, %esi
	.p2align 4,,10
.L1153:
	movq	%rsi, %r8
	salq	$5, %r8
	addq	8(%rbx), %r8
	movzwl	16(%r8), %ecx
	cmpw	%cx, %r12w
	jb	.L1152
	movzwl	18(%r8), %r9d
	movzwl	%cx, %r10d
	addl	%r10d, %r9d
	cmpl	%r9d, %ebp
	jge	.L1152
	movl	%r12d, %edx
	subl	%ecx, %edx
	movq	24(%r8), %rcx
	movzwl	%dx, %edx
	call	*(%r8)
	movq	16(%rbx), %rdx
.L1152:
	addq	$1, %rsi
	cmpq	%rdx, %rsi
	jb	.L1153
	addb	1(%rbx), %al
	testq	%rdx, %rdx
	movzbl	%al, %ebp
	movl	%ebp, %edi
	movzbl	%bpl, %r13d
	je	.L1154
	xorl	%eax, %eax
	xorl	%r12d, %r12d
	.p2align 4,,10
.L1156:
	movq	%r12, %r8
	salq	$5, %r8
	addq	8(%rbx), %r8
	movzwl	16(%r8), %ecx
	cmpw	%cx, %r13w
	jb	.L1155
	movzwl	18(%r8), %r9d
	movzwl	%cx, %r10d
	addl	%r10d, %r9d
	cmpl	%r9d, %ebp
	jge	.L1155
	movl	%r13d, %edx
	subl	%ecx, %edx
	movq	24(%r8), %rcx
	movzwl	%dx, %edx
	call	*(%r8)
	movq	16(%rbx), %rdx
.L1155:
	addq	$1, %r12
	cmpq	%rdx, %r12
	jb	.L1156
	leal	1(%rdi), %r12d
	testq	%rdx, %rdx
	movzbl	%al, %esi
	movzbl	%r12b, %edi
	movzbl	%r12b, %r12d
	je	.L1154
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	.p2align 4,,10
.L1158:
	movq	%rbp, %r8
	salq	$5, %r8
	addq	8(%rbx), %r8
	movzwl	16(%r8), %ecx
	cmpw	%cx, %r12w
	jb	.L1157
	movzwl	18(%r8), %r9d
	movzwl	%cx, %r10d
	addl	%r10d, %r9d
	cmpl	%r9d, %edi
	jge	.L1157
	movl	%r12d, %edx
	subl	%ecx, %edx
	movq	24(%r8), %rcx
	movzwl	%dx, %edx
	call	*(%r8)
	movq	16(%rbx), %rdx
.L1157:
	addq	$1, %rbp
	cmpq	%rdx, %rbp
	jb	.L1158
	sall	$8, %eax
	addw	$1, 4(%rbx)
	orl	%eax, %esi
	testq	%rdx, %rdx
	movzwl	%si, %edi
	je	.L1159
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	.p2align 4,,10
.L1161:
	movq	%rbp, %r8
	salq	$5, %r8
	addq	8(%rbx), %r8
	movzwl	16(%r8), %ecx
	cmpw	%si, %cx
	ja	.L1160
	movzwl	18(%r8), %r9d
	movzwl	%cx, %r10d
	addl	%r10d, %r9d
	cmpl	%r9d, %edi
	jge	.L1160
	movl	%esi, %edx
	subl	%ecx, %edx
	movq	24(%r8), %rcx
	movzwl	%dx, %edx
	call	*(%r8)
	movq	16(%rbx), %rdx
.L1160:
	addq	$1, %rbp
	cmpq	%rdx, %rbp
	jb	.L1161
	testb	%al, %al
	movb	%al, (%rbx)
	movzbl	6(%rbx), %edx
	js	.L1182
	andl	$127, %edx
	testb	%al, %al
	movb	%dl, 6(%rbx)
	jne	.L1165
	orl	$2, %edx
	jmp	.L1166
	.p2align 4,,10
.L1182:
	orl	$-128, %edx
.L1165:
	andl	$-3, %edx
.L1166:
	movl	$6, %eax
	movb	%dl, 6(%rbx)
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	ret
	.p2align 4,,10
.L1154:
	addw	$1, 4(%rbx)
.L1159:
	movzbl	6(%rbx), %edx
	movb	$0, (%rbx)
	andl	$127, %edx
	orl	$2, %edx
	jmp	.L1166
	.seh_endproc
	.p2align 4,,15
	.globl	LDA_abss
	.def	LDA_abss;	.scl	2;	.type	32;	.endef
	.seh_proc	LDA_abss
LDA_abss:
	pushq	%r12
	.seh_pushreg	%r12
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movzwl	4(%rcx), %edi
	movq	16(%rcx), %rdx
	movq	%rcx, %rbx
	testq	%rdx, %rdx
	movl	%edi, %ebp
	je	.L1184
	xorl	%eax, %eax
	xorl	%esi, %esi
	.p2align 4,,10
.L1186:
	movq	%rsi, %r8
	salq	$5, %r8
	addq	8(%rbx), %r8
	movzwl	16(%r8), %ecx
	cmpw	%cx, %bp
	jb	.L1185
	movzwl	18(%r8), %r9d
	movzwl	%cx, %r10d
	addl	%r10d, %r9d
	cmpl	%r9d, %edi
	jge	.L1185
	movl	%ebp, %edx
	subl	%ecx, %edx
	movq	24(%r8), %rcx
	movzwl	%dx, %edx
	call	*(%r8)
	movq	16(%rbx), %rdx
.L1185:
	addq	$1, %rsi
	cmpq	%rdx, %rsi
	jb	.L1186
	movzwl	4(%rbx), %ebp
	testq	%rdx, %rdx
	movzbl	%al, %esi
	leal	1(%rbp), %r12d
	movzwl	%r12w, %edi
	je	.L1184
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	.p2align 4,,10
.L1188:
	movq	%rbp, %r8
	salq	$5, %r8
	addq	8(%rbx), %r8
	movzwl	16(%r8), %ecx
	cmpw	%cx, %r12w
	jb	.L1187
	movzwl	18(%r8), %r9d
	movzwl	%cx, %r10d
	addl	%r10d, %r9d
	cmpl	%r9d, %edi
	jge	.L1187
	movl	%r12d, %edx
	subl	%ecx, %edx
	movq	24(%r8), %rcx
	movzwl	%dx, %edx
	call	*(%r8)
	movq	16(%rbx), %rdx
.L1187:
	addq	$1, %rbp
	cmpq	%rdx, %rbp
	jb	.L1188
	sall	$8, %eax
	addw	$2, 4(%rbx)
	orl	%eax, %esi
	testq	%rdx, %rdx
	movzwl	%si, %edi
	je	.L1189
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	.p2align 4,,10
.L1191:
	movq	%rbp, %r8
	salq	$5, %r8
	addq	8(%rbx), %r8
	movzwl	16(%r8), %ecx
	cmpw	%si, %cx
	ja	.L1190
	movzwl	18(%r8), %r9d
	movzwl	%cx, %r10d
	addl	%r10d, %r9d
	cmpl	%edi, %r9d
	jle	.L1190
	movl	%esi, %edx
	subl	%ecx, %edx
	movq	24(%r8), %rcx
	movzwl	%dx, %edx
	call	*(%r8)
	movq	16(%rbx), %rdx
.L1190:
	addq	$1, %rbp
	cmpq	%rdx, %rbp
	jb	.L1191
	testb	%al, %al
	movb	%al, (%rbx)
	movzbl	6(%rbx), %edx
	js	.L1211
	andl	$127, %edx
	testb	%al, %al
	movb	%dl, 6(%rbx)
	jne	.L1195
	orl	$2, %edx
	jmp	.L1196
	.p2align 4,,10
.L1211:
	orl	$-128, %edx
.L1195:
	andl	$-3, %edx
.L1196:
	movl	$4, %eax
	movb	%dl, 6(%rbx)
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	ret
	.p2align 4,,10
.L1184:
	leal	2(%rbp), %eax
	movw	%ax, 4(%rbx)
.L1189:
	movzbl	6(%rbx), %edx
	movb	$0, (%rbx)
	andl	$127, %edx
	orl	$2, %edx
	jmp	.L1196
	.seh_endproc
	.p2align 4,,15
	.globl	LDX_imm
	.def	LDX_imm;	.scl	2;	.type	32;	.endef
	.seh_proc	LDX_imm
LDX_imm:
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
	movzwl	4(%rcx), %edi
	movq	16(%rcx), %r9
	movq	%rcx, %rsi
	testq	%r9, %r9
	leal	1(%rdi), %eax
	movl	%edi, %ebp
	movw	%ax, 4(%rcx)
	je	.L1213
	xorl	%eax, %eax
	xorl	%ebx, %ebx
	.p2align 4,,10
.L1215:
	movq	%rbx, %r8
	salq	$5, %r8
	addq	8(%rsi), %r8
	movzwl	16(%r8), %edx
	cmpw	%dx, %bp
	jb	.L1214
	movzwl	18(%r8), %ecx
	movzwl	%dx, %r10d
	addl	%r10d, %ecx
	cmpl	%ecx, %edi
	jge	.L1214
	movl	%ebp, %eax
	movq	24(%r8), %rcx
	subl	%edx, %eax
	movzwl	%ax, %edx
	call	*(%r8)
	movq	16(%rsi), %r9
.L1214:
	addq	$1, %rbx
	cmpq	%r9, %rbx
	jb	.L1215
	testb	%al, %al
	movb	%al, 1(%rsi)
	movzbl	6(%rsi), %edx
	js	.L1223
	andl	$127, %edx
	testb	%al, %al
	movb	%dl, 6(%rsi)
	jne	.L1219
	orl	$2, %edx
	jmp	.L1220
	.p2align 4,,10
.L1223:
	orl	$-128, %edx
.L1219:
	andl	$-3, %edx
.L1220:
	movl	$2, %eax
	movb	%dl, 6(%rsi)
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	ret
	.p2align 4,,10
.L1213:
	movzbl	6(%rcx), %edx
	movb	$0, 1(%rcx)
	andl	$127, %edx
	orl	$2, %edx
	jmp	.L1220
	.seh_endproc
	.p2align 4,,15
	.globl	LDY_absx
	.def	LDY_absx;	.scl	2;	.type	32;	.endef
	.seh_proc	LDY_absx
LDY_absx:
	pushq	%r12
	.seh_pushreg	%r12
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movzwl	4(%rcx), %edi
	movq	16(%rcx), %rdx
	movq	%rcx, %rbx
	testq	%rdx, %rdx
	movl	%edi, %ebp
	je	.L1225
	xorl	%eax, %eax
	xorl	%esi, %esi
	.p2align 4,,10
.L1227:
	movq	%rsi, %r8
	salq	$5, %r8
	addq	8(%rbx), %r8
	movzwl	16(%r8), %ecx
	cmpw	%cx, %bp
	jb	.L1226
	movzwl	18(%r8), %r9d
	movzwl	%cx, %r10d
	addl	%r10d, %r9d
	cmpl	%r9d, %edi
	jge	.L1226
	movl	%ebp, %edx
	subl	%ecx, %edx
	movq	24(%r8), %rcx
	movzwl	%dx, %edx
	call	*(%r8)
	movq	16(%rbx), %rdx
.L1226:
	addq	$1, %rsi
	cmpq	%rdx, %rsi
	jb	.L1227
	movzwl	4(%rbx), %ebp
	testq	%rdx, %rdx
	movzbl	%al, %esi
	leal	1(%rbp), %r12d
	movzwl	%r12w, %edi
	je	.L1225
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	.p2align 4,,10
.L1229:
	movq	%rbp, %r8
	salq	$5, %r8
	addq	8(%rbx), %r8
	movzwl	16(%r8), %ecx
	cmpw	%cx, %r12w
	jb	.L1228
	movzwl	18(%r8), %r9d
	movzwl	%cx, %r10d
	addl	%r10d, %r9d
	cmpl	%r9d, %edi
	jge	.L1228
	movl	%r12d, %edx
	subl	%ecx, %edx
	movq	24(%r8), %rcx
	movzwl	%dx, %edx
	call	*(%r8)
	movq	16(%rbx), %rdx
.L1228:
	addq	$1, %rbp
	cmpq	%rdx, %rbp
	jb	.L1229
	movzbl	1(%rbx), %ebp
	sall	$8, %eax
	addw	$2, 4(%rbx)
	orl	%eax, %esi
	addl	%esi, %ebp
	testq	%rdx, %rdx
	movzwl	%bp, %edi
	je	.L1230
	xorl	%eax, %eax
	xorl	%esi, %esi
	.p2align 4,,10
.L1232:
	movq	%rsi, %r8
	salq	$5, %r8
	addq	8(%rbx), %r8
	movzwl	16(%r8), %ecx
	cmpw	%bp, %cx
	ja	.L1231
	movzwl	18(%r8), %r9d
	movzwl	%cx, %r10d
	addl	%r10d, %r9d
	cmpl	%r9d, %edi
	jge	.L1231
	movl	%ebp, %edx
	subl	%ecx, %edx
	movq	24(%r8), %rcx
	movzwl	%dx, %edx
	call	*(%r8)
	movq	16(%rbx), %rdx
.L1231:
	addq	$1, %rsi
	cmpq	%rdx, %rsi
	jb	.L1232
	testb	%al, %al
	movb	%al, 2(%rbx)
	movzbl	6(%rbx), %edx
	js	.L1252
	andl	$127, %edx
	testb	%al, %al
	movb	%dl, 6(%rbx)
	jne	.L1236
	orl	$2, %edx
	jmp	.L1237
	.p2align 4,,10
.L1252:
	orl	$-128, %edx
.L1236:
	andl	$-3, %edx
.L1237:
	movl	$4, %eax
	movb	%dl, 6(%rbx)
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	ret
	.p2align 4,,10
.L1225:
	leal	2(%rbp), %eax
	movw	%ax, 4(%rbx)
.L1230:
	movzbl	6(%rbx), %edx
	movb	$0, 2(%rbx)
	andl	$127, %edx
	orl	$2, %edx
	jmp	.L1237
	.seh_endproc
	.p2align 4,,15
	.globl	LDX_absy
	.def	LDX_absy;	.scl	2;	.type	32;	.endef
	.seh_proc	LDX_absy
LDX_absy:
	pushq	%r12
	.seh_pushreg	%r12
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movzwl	4(%rcx), %edi
	movq	16(%rcx), %rdx
	movq	%rcx, %rbx
	testq	%rdx, %rdx
	movl	%edi, %ebp
	je	.L1254
	xorl	%eax, %eax
	xorl	%esi, %esi
	.p2align 4,,10
.L1256:
	movq	%rsi, %r8
	salq	$5, %r8
	addq	8(%rbx), %r8
	movzwl	16(%r8), %ecx
	cmpw	%cx, %bp
	jb	.L1255
	movzwl	18(%r8), %r9d
	movzwl	%cx, %r10d
	addl	%r10d, %r9d
	cmpl	%r9d, %edi
	jge	.L1255
	movl	%ebp, %edx
	subl	%ecx, %edx
	movq	24(%r8), %rcx
	movzwl	%dx, %edx
	call	*(%r8)
	movq	16(%rbx), %rdx
.L1255:
	addq	$1, %rsi
	cmpq	%rdx, %rsi
	jb	.L1256
	movzwl	4(%rbx), %ebp
	testq	%rdx, %rdx
	movzbl	%al, %esi
	leal	1(%rbp), %r12d
	movzwl	%r12w, %edi
	je	.L1254
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	.p2align 4,,10
.L1258:
	movq	%rbp, %r8
	salq	$5, %r8
	addq	8(%rbx), %r8
	movzwl	16(%r8), %ecx
	cmpw	%cx, %r12w
	jb	.L1257
	movzwl	18(%r8), %r9d
	movzwl	%cx, %r10d
	addl	%r10d, %r9d
	cmpl	%r9d, %edi
	jge	.L1257
	movl	%r12d, %edx
	subl	%ecx, %edx
	movq	24(%r8), %rcx
	movzwl	%dx, %edx
	call	*(%r8)
	movq	16(%rbx), %rdx
.L1257:
	addq	$1, %rbp
	cmpq	%rdx, %rbp
	jb	.L1258
	movzbl	2(%rbx), %ebp
	sall	$8, %eax
	addw	$2, 4(%rbx)
	orl	%eax, %esi
	addl	%esi, %ebp
	testq	%rdx, %rdx
	movzwl	%bp, %edi
	je	.L1259
	xorl	%eax, %eax
	xorl	%esi, %esi
	.p2align 4,,10
.L1261:
	movq	%rsi, %r8
	salq	$5, %r8
	addq	8(%rbx), %r8
	movzwl	16(%r8), %ecx
	cmpw	%bp, %cx
	ja	.L1260
	movzwl	18(%r8), %r9d
	movzwl	%cx, %r10d
	addl	%r10d, %r9d
	cmpl	%r9d, %edi
	jge	.L1260
	movl	%ebp, %edx
	subl	%ecx, %edx
	movq	24(%r8), %rcx
	movzwl	%dx, %edx
	call	*(%r8)
	movq	16(%rbx), %rdx
.L1260:
	addq	$1, %rsi
	cmpq	%rdx, %rsi
	jb	.L1261
	testb	%al, %al
	movb	%al, 1(%rbx)
	movzbl	6(%rbx), %edx
	js	.L1281
	andl	$127, %edx
	testb	%al, %al
	movb	%dl, 6(%rbx)
	jne	.L1265
	orl	$2, %edx
	jmp	.L1266
	.p2align 4,,10
.L1281:
	orl	$-128, %edx
.L1265:
	andl	$-3, %edx
.L1266:
	movl	$4, %eax
	movb	%dl, 6(%rbx)
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	ret
	.p2align 4,,10
.L1254:
	leal	2(%rbp), %eax
	movw	%ax, 4(%rbx)
.L1259:
	movzbl	6(%rbx), %edx
	movb	$0, 1(%rbx)
	andl	$127, %edx
	orl	$2, %edx
	jmp	.L1266
	.seh_endproc
	.p2align 4,,15
	.globl	LDY_imm
	.def	LDY_imm;	.scl	2;	.type	32;	.endef
	.seh_proc	LDY_imm
LDY_imm:
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
	movzwl	4(%rcx), %edi
	movq	16(%rcx), %r9
	movq	%rcx, %rsi
	testq	%r9, %r9
	leal	1(%rdi), %eax
	movl	%edi, %ebp
	movw	%ax, 4(%rcx)
	je	.L1283
	xorl	%eax, %eax
	xorl	%ebx, %ebx
	.p2align 4,,10
.L1285:
	movq	%rbx, %r8
	salq	$5, %r8
	addq	8(%rsi), %r8
	movzwl	16(%r8), %edx
	cmpw	%dx, %bp
	jb	.L1284
	movzwl	18(%r8), %ecx
	movzwl	%dx, %r10d
	addl	%r10d, %ecx
	cmpl	%ecx, %edi
	jge	.L1284
	movl	%ebp, %eax
	movq	24(%r8), %rcx
	subl	%edx, %eax
	movzwl	%ax, %edx
	call	*(%r8)
	movq	16(%rsi), %r9
.L1284:
	addq	$1, %rbx
	cmpq	%r9, %rbx
	jb	.L1285
	testb	%al, %al
	movb	%al, 2(%rsi)
	movzbl	6(%rsi), %edx
	js	.L1293
	andl	$127, %edx
	testb	%al, %al
	movb	%dl, 6(%rsi)
	jne	.L1289
	orl	$2, %edx
	jmp	.L1290
	.p2align 4,,10
.L1293:
	orl	$-128, %edx
.L1289:
	andl	$-3, %edx
.L1290:
	movl	$2, %eax
	movb	%dl, 6(%rsi)
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	ret
	.p2align 4,,10
.L1283:
	movzbl	6(%rcx), %edx
	movb	$0, 2(%rcx)
	andl	$127, %edx
	orl	$2, %edx
	jmp	.L1290
	.seh_endproc
	.p2align 4,,15
	.globl	LDA_imm
	.def	LDA_imm;	.scl	2;	.type	32;	.endef
	.seh_proc	LDA_imm
LDA_imm:
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
	movzwl	4(%rcx), %edi
	movq	16(%rcx), %r9
	movq	%rcx, %rsi
	testq	%r9, %r9
	leal	1(%rdi), %eax
	movl	%edi, %ebp
	movw	%ax, 4(%rcx)
	je	.L1295
	xorl	%eax, %eax
	xorl	%ebx, %ebx
	.p2align 4,,10
.L1297:
	movq	%rbx, %r8
	salq	$5, %r8
	addq	8(%rsi), %r8
	movzwl	16(%r8), %edx
	cmpw	%dx, %bp
	jb	.L1296
	movzwl	18(%r8), %ecx
	movzwl	%dx, %r10d
	addl	%r10d, %ecx
	cmpl	%ecx, %edi
	jge	.L1296
	movl	%ebp, %eax
	movq	24(%r8), %rcx
	subl	%edx, %eax
	movzwl	%ax, %edx
	call	*(%r8)
	movq	16(%rsi), %r9
.L1296:
	addq	$1, %rbx
	cmpq	%r9, %rbx
	jb	.L1297
	testb	%al, %al
	movb	%al, (%rsi)
	movzbl	6(%rsi), %edx
	js	.L1305
	andl	$127, %edx
	testb	%al, %al
	movb	%dl, 6(%rsi)
	jne	.L1301
	orl	$2, %edx
	jmp	.L1302
	.p2align 4,,10
.L1305:
	orl	$-128, %edx
.L1301:
	andl	$-3, %edx
.L1302:
	movl	$2, %eax
	movb	%dl, 6(%rsi)
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	ret
	.p2align 4,,10
.L1295:
	movzbl	6(%rcx), %edx
	movb	$0, (%rcx)
	andl	$127, %edx
	orl	$2, %edx
	jmp	.L1302
	.seh_endproc
	.p2align 4,,15
	.globl	LDX_abss
	.def	LDX_abss;	.scl	2;	.type	32;	.endef
	.seh_proc	LDX_abss
LDX_abss:
	pushq	%r12
	.seh_pushreg	%r12
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movzwl	4(%rcx), %edi
	movq	16(%rcx), %rdx
	movq	%rcx, %rbx
	testq	%rdx, %rdx
	movl	%edi, %ebp
	je	.L1307
	xorl	%eax, %eax
	xorl	%esi, %esi
	.p2align 4,,10
.L1309:
	movq	%rsi, %r8
	salq	$5, %r8
	addq	8(%rbx), %r8
	movzwl	16(%r8), %ecx
	cmpw	%cx, %bp
	jb	.L1308
	movzwl	18(%r8), %r9d
	movzwl	%cx, %r10d
	addl	%r10d, %r9d
	cmpl	%r9d, %edi
	jge	.L1308
	movl	%ebp, %edx
	subl	%ecx, %edx
	movq	24(%r8), %rcx
	movzwl	%dx, %edx
	call	*(%r8)
	movq	16(%rbx), %rdx
.L1308:
	addq	$1, %rsi
	cmpq	%rdx, %rsi
	jb	.L1309
	movzwl	4(%rbx), %ebp
	testq	%rdx, %rdx
	movzbl	%al, %esi
	leal	1(%rbp), %r12d
	movzwl	%r12w, %edi
	je	.L1307
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	.p2align 4,,10
.L1311:
	movq	%rbp, %r8
	salq	$5, %r8
	addq	8(%rbx), %r8
	movzwl	16(%r8), %ecx
	cmpw	%cx, %r12w
	jb	.L1310
	movzwl	18(%r8), %r9d
	movzwl	%cx, %r10d
	addl	%r10d, %r9d
	cmpl	%r9d, %edi
	jge	.L1310
	movl	%r12d, %edx
	subl	%ecx, %edx
	movq	24(%r8), %rcx
	movzwl	%dx, %edx
	call	*(%r8)
	movq	16(%rbx), %rdx
.L1310:
	addq	$1, %rbp
	cmpq	%rdx, %rbp
	jb	.L1311
	sall	$8, %eax
	addw	$2, 4(%rbx)
	orl	%eax, %esi
	testq	%rdx, %rdx
	movzwl	%si, %edi
	je	.L1312
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	.p2align 4,,10
.L1314:
	movq	%rbp, %r8
	salq	$5, %r8
	addq	8(%rbx), %r8
	movzwl	16(%r8), %ecx
	cmpw	%si, %cx
	ja	.L1313
	movzwl	18(%r8), %r9d
	movzwl	%cx, %r10d
	addl	%r10d, %r9d
	cmpl	%edi, %r9d
	jle	.L1313
	movl	%esi, %edx
	subl	%ecx, %edx
	movq	24(%r8), %rcx
	movzwl	%dx, %edx
	call	*(%r8)
	movq	16(%rbx), %rdx
.L1313:
	addq	$1, %rbp
	cmpq	%rdx, %rbp
	jb	.L1314
	testb	%al, %al
	movb	%al, 1(%rbx)
	movzbl	6(%rbx), %edx
	js	.L1334
	andl	$127, %edx
	testb	%al, %al
	movb	%dl, 6(%rbx)
	jne	.L1318
	orl	$2, %edx
	jmp	.L1319
	.p2align 4,,10
.L1334:
	orl	$-128, %edx
.L1318:
	andl	$-3, %edx
.L1319:
	movl	$4, %eax
	movb	%dl, 6(%rbx)
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	ret
	.p2align 4,,10
.L1307:
	leal	2(%rbp), %eax
	movw	%ax, 4(%rbx)
.L1312:
	movzbl	6(%rbx), %edx
	movb	$0, 1(%rbx)
	andl	$127, %edx
	orl	$2, %edx
	jmp	.L1319
	.seh_endproc
	.p2align 4,,15
	.globl	LDA_absx
	.def	LDA_absx;	.scl	2;	.type	32;	.endef
	.seh_proc	LDA_absx
LDA_absx:
	pushq	%r12
	.seh_pushreg	%r12
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movzwl	4(%rcx), %edi
	movq	16(%rcx), %rdx
	movq	%rcx, %rbx
	testq	%rdx, %rdx
	movl	%edi, %ebp
	je	.L1336
	xorl	%eax, %eax
	xorl	%esi, %esi
	.p2align 4,,10
.L1338:
	movq	%rsi, %r8
	salq	$5, %r8
	addq	8(%rbx), %r8
	movzwl	16(%r8), %ecx
	cmpw	%cx, %bp
	jb	.L1337
	movzwl	18(%r8), %r9d
	movzwl	%cx, %r10d
	addl	%r10d, %r9d
	cmpl	%r9d, %edi
	jge	.L1337
	movl	%ebp, %edx
	subl	%ecx, %edx
	movq	24(%r8), %rcx
	movzwl	%dx, %edx
	call	*(%r8)
	movq	16(%rbx), %rdx
.L1337:
	addq	$1, %rsi
	cmpq	%rdx, %rsi
	jb	.L1338
	movzwl	4(%rbx), %ebp
	testq	%rdx, %rdx
	movzbl	%al, %esi
	leal	1(%rbp), %r12d
	movzwl	%r12w, %edi
	je	.L1336
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	.p2align 4,,10
.L1340:
	movq	%rbp, %r8
	salq	$5, %r8
	addq	8(%rbx), %r8
	movzwl	16(%r8), %ecx
	cmpw	%cx, %r12w
	jb	.L1339
	movzwl	18(%r8), %r9d
	movzwl	%cx, %r10d
	addl	%r10d, %r9d
	cmpl	%r9d, %edi
	jge	.L1339
	movl	%r12d, %edx
	subl	%ecx, %edx
	movq	24(%r8), %rcx
	movzwl	%dx, %edx
	call	*(%r8)
	movq	16(%rbx), %rdx
.L1339:
	addq	$1, %rbp
	cmpq	%rdx, %rbp
	jb	.L1340
	movzbl	1(%rbx), %ebp
	sall	$8, %eax
	addw	$2, 4(%rbx)
	orl	%eax, %esi
	addl	%esi, %ebp
	testq	%rdx, %rdx
	movzwl	%bp, %edi
	je	.L1341
	xorl	%eax, %eax
	xorl	%esi, %esi
	.p2align 4,,10
.L1343:
	movq	%rsi, %r8
	salq	$5, %r8
	addq	8(%rbx), %r8
	movzwl	16(%r8), %ecx
	cmpw	%bp, %cx
	ja	.L1342
	movzwl	18(%r8), %r9d
	movzwl	%cx, %r10d
	addl	%r10d, %r9d
	cmpl	%r9d, %edi
	jge	.L1342
	movl	%ebp, %edx
	subl	%ecx, %edx
	movq	24(%r8), %rcx
	movzwl	%dx, %edx
	call	*(%r8)
	movq	16(%rbx), %rdx
.L1342:
	addq	$1, %rsi
	cmpq	%rdx, %rsi
	jb	.L1343
	testb	%al, %al
	movb	%al, (%rbx)
	movzbl	6(%rbx), %edx
	js	.L1363
	andl	$127, %edx
	testb	%al, %al
	movb	%dl, 6(%rbx)
	jne	.L1347
	orl	$2, %edx
	jmp	.L1348
	.p2align 4,,10
.L1363:
	orl	$-128, %edx
.L1347:
	andl	$-3, %edx
.L1348:
	movl	$4, %eax
	movb	%dl, 6(%rbx)
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	ret
	.p2align 4,,10
.L1336:
	leal	2(%rbp), %eax
	movw	%ax, 4(%rbx)
.L1341:
	movzbl	6(%rbx), %edx
	movb	$0, (%rbx)
	andl	$127, %edx
	orl	$2, %edx
	jmp	.L1348
	.seh_endproc
	.p2align 4,,15
	.globl	PLA
	.def	PLA;	.scl	2;	.type	32;	.endef
	.seh_proc	PLA
PLA:
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
	movzbl	3(%rcx), %eax
	movq	16(%rcx), %r9
	movq	%rcx, %rdi
	leal	1(%rax), %esi
	movb	%sil, 3(%rcx)
	movzbl	%sil, %esi
	addw	$256, %si
	testq	%r9, %r9
	movzwl	%si, %ebp
	je	.L1365
	xorl	%eax, %eax
	xorl	%ebx, %ebx
	.p2align 4,,10
.L1367:
	movq	%rbx, %r8
	salq	$5, %r8
	addq	8(%rdi), %r8
	movzwl	16(%r8), %edx
	cmpw	%dx, %si
	jb	.L1366
	movzwl	18(%r8), %ecx
	movzwl	%dx, %r10d
	addl	%r10d, %ecx
	cmpl	%ecx, %ebp
	jge	.L1366
	movl	%esi, %eax
	movq	24(%r8), %rcx
	subl	%edx, %eax
	movzwl	%ax, %edx
	call	*(%r8)
	movq	16(%rdi), %r9
.L1366:
	addq	$1, %rbx
	cmpq	%r9, %rbx
	jb	.L1367
	testb	%al, %al
	movb	%al, (%rdi)
	movzbl	6(%rdi), %edx
	js	.L1375
	andl	$127, %edx
	testb	%al, %al
	movb	%dl, 6(%rdi)
	jne	.L1371
	orl	$2, %edx
	jmp	.L1372
	.p2align 4,,10
.L1375:
	orl	$-128, %edx
.L1371:
	andl	$-3, %edx
.L1372:
	movl	$4, %eax
	movb	%dl, 6(%rdi)
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	ret
	.p2align 4,,10
.L1365:
	movzbl	6(%rcx), %edx
	movb	$0, (%rcx)
	andl	$127, %edx
	orl	$2, %edx
	jmp	.L1372
	.seh_endproc
	.p2align 4,,15
	.globl	LAX_indy
	.def	LAX_indy;	.scl	2;	.type	32;	.endef
	.seh_proc	LAX_indy
LAX_indy:
	pushq	%r13
	.seh_pushreg	%r13
	pushq	%r12
	.seh_pushreg	%r12
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
	movzwl	4(%rcx), %ebp
	movq	16(%rcx), %rdx
	movq	%rcx, %rbx
	testq	%rdx, %rdx
	movl	%ebp, %r12d
	je	.L1377
	xorl	%edi, %edi
	xorl	%esi, %esi
	.p2align 4,,10
.L1379:
	movq	%rsi, %rax
	salq	$5, %rax
	addq	8(%rbx), %rax
	movzwl	16(%rax), %ecx
	cmpw	%cx, %r12w
	jb	.L1378
	movzwl	18(%rax), %r8d
	movzwl	%cx, %r9d
	addl	%r9d, %r8d
	cmpl	%r8d, %ebp
	jge	.L1378
	movl	%r12d, %edx
	subl	%ecx, %edx
	movq	24(%rax), %rcx
	movzwl	%dx, %edx
	call	*(%rax)
	movq	16(%rbx), %rdx
	movl	%eax, %edi
.L1378:
	addq	$1, %rsi
	cmpq	%rdx, %rsi
	jb	.L1379
	testq	%rdx, %rdx
	movzbl	%dil, %ebp
	movzbl	%dil, %r13d
	je	.L1377
	xorl	%eax, %eax
	xorl	%r12d, %r12d
	.p2align 4,,10
.L1382:
	movq	%r12, %r8
	salq	$5, %r8
	addq	8(%rbx), %r8
	movzwl	16(%r8), %ecx
	cmpw	%cx, %r13w
	jb	.L1381
	movzwl	18(%r8), %r9d
	movzwl	%cx, %r10d
	addl	%r10d, %r9d
	cmpl	%r9d, %ebp
	jge	.L1381
	movl	%r13d, %edx
	subl	%ecx, %edx
	movq	24(%r8), %rcx
	movzwl	%dx, %edx
	call	*(%r8)
	movq	16(%rbx), %rdx
.L1381:
	addq	$1, %r12
	cmpq	%rdx, %r12
	jb	.L1382
	leal	1(%rdi), %r12d
	testq	%rdx, %rdx
	movzbl	%al, %esi
	movzbl	%r12b, %edi
	movzbl	%r12b, %r12d
	je	.L1377
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	.p2align 4,,10
.L1384:
	movq	%rbp, %r8
	salq	$5, %r8
	addq	8(%rbx), %r8
	movzwl	16(%r8), %ecx
	cmpw	%r12w, %cx
	ja	.L1383
	movzwl	18(%r8), %r9d
	movzwl	%cx, %r10d
	addl	%r10d, %r9d
	cmpl	%edi, %r9d
	jle	.L1383
	movl	%r12d, %edx
	subl	%ecx, %edx
	movq	24(%r8), %rcx
	movzwl	%dx, %edx
	call	*(%r8)
	movq	16(%rbx), %rdx
.L1383:
	addq	$1, %rbp
	cmpq	%rdx, %rbp
	jb	.L1384
	sall	$8, %eax
	addw	$1, 4(%rbx)
	orl	%eax, %esi
	movzbl	2(%rbx), %eax
	addl	%eax, %esi
	testq	%rdx, %rdx
	movzwl	%si, %edi
	je	.L1385
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	.p2align 4,,10
.L1387:
	movq	%rbp, %r8
	salq	$5, %r8
	addq	8(%rbx), %r8
	movzwl	16(%r8), %ecx
	cmpw	%si, %cx
	ja	.L1386
	movzwl	18(%r8), %r9d
	movzwl	%cx, %r10d
	addl	%r10d, %r9d
	cmpl	%r9d, %edi
	jge	.L1386
	movl	%esi, %edx
	subl	%ecx, %edx
	movq	24(%r8), %rcx
	movzwl	%dx, %edx
	call	*(%r8)
	movq	16(%rbx), %rdx
.L1386:
	addq	$1, %rbp
	cmpq	%rdx, %rbp
	jb	.L1387
	testb	%al, %al
	movb	%al, (%rbx)
	movb	%al, 1(%rbx)
	movzbl	6(%rbx), %edx
	js	.L1408
	andl	$127, %edx
	testb	%al, %al
	movb	%dl, 6(%rbx)
	jne	.L1391
	orl	$2, %edx
	jmp	.L1392
	.p2align 4,,10
.L1408:
	orl	$-128, %edx
.L1391:
	andl	$-3, %edx
.L1392:
	movl	$4, %eax
	movb	%dl, 6(%rbx)
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	ret
	.p2align 4,,10
.L1377:
	addw	$1, 4(%rbx)
.L1385:
	movzbl	6(%rbx), %edx
	xorl	%eax, %eax
	movw	%ax, (%rbx)
	andl	$127, %edx
	orl	$2, %edx
	jmp	.L1392
	.seh_endproc
	.p2align 4,,15
	.globl	LAX_abss
	.def	LAX_abss;	.scl	2;	.type	32;	.endef
	.seh_proc	LAX_abss
LAX_abss:
	pushq	%r12
	.seh_pushreg	%r12
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movzwl	4(%rcx), %edi
	movq	16(%rcx), %rdx
	movq	%rcx, %rbx
	testq	%rdx, %rdx
	movl	%edi, %ebp
	je	.L1410
	xorl	%eax, %eax
	xorl	%esi, %esi
	.p2align 4,,10
.L1412:
	movq	%rsi, %r8
	salq	$5, %r8
	addq	8(%rbx), %r8
	movzwl	16(%r8), %ecx
	cmpw	%cx, %bp
	jb	.L1411
	movzwl	18(%r8), %r9d
	movzwl	%cx, %r10d
	addl	%r10d, %r9d
	cmpl	%r9d, %edi
	jge	.L1411
	movl	%ebp, %edx
	subl	%ecx, %edx
	movq	24(%r8), %rcx
	movzwl	%dx, %edx
	call	*(%r8)
	movq	16(%rbx), %rdx
.L1411:
	addq	$1, %rsi
	cmpq	%rdx, %rsi
	jb	.L1412
	movzwl	4(%rbx), %ebp
	testq	%rdx, %rdx
	movzbl	%al, %esi
	leal	1(%rbp), %r12d
	movzwl	%r12w, %edi
	je	.L1410
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	.p2align 4,,10
.L1414:
	movq	%rbp, %r8
	salq	$5, %r8
	addq	8(%rbx), %r8
	movzwl	16(%r8), %ecx
	cmpw	%cx, %r12w
	jb	.L1413
	movzwl	18(%r8), %r9d
	movzwl	%cx, %r10d
	addl	%r10d, %r9d
	cmpl	%r9d, %edi
	jge	.L1413
	movl	%r12d, %edx
	subl	%ecx, %edx
	movq	24(%r8), %rcx
	movzwl	%dx, %edx
	call	*(%r8)
	movq	16(%rbx), %rdx
.L1413:
	addq	$1, %rbp
	cmpq	%rdx, %rbp
	jb	.L1414
	sall	$8, %eax
	addw	$2, 4(%rbx)
	orl	%eax, %esi
	testq	%rdx, %rdx
	movzwl	%si, %edi
	je	.L1415
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	.p2align 4,,10
.L1417:
	movq	%rbp, %r8
	salq	$5, %r8
	addq	8(%rbx), %r8
	movzwl	16(%r8), %ecx
	cmpw	%si, %cx
	ja	.L1416
	movzwl	18(%r8), %r9d
	movzwl	%cx, %r10d
	addl	%r10d, %r9d
	cmpl	%edi, %r9d
	jle	.L1416
	movl	%esi, %edx
	subl	%ecx, %edx
	movq	24(%r8), %rcx
	movzwl	%dx, %edx
	call	*(%r8)
	movq	16(%rbx), %rdx
.L1416:
	addq	$1, %rbp
	cmpq	%rdx, %rbp
	jb	.L1417
	testb	%al, %al
	movb	%al, (%rbx)
	movb	%al, 1(%rbx)
	movzbl	6(%rbx), %edx
	js	.L1437
	andl	$127, %edx
	testb	%al, %al
	movb	%dl, 6(%rbx)
	jne	.L1421
	orl	$2, %edx
	jmp	.L1422
	.p2align 4,,10
.L1437:
	orl	$-128, %edx
.L1421:
	andl	$-3, %edx
.L1422:
	movl	$4, %eax
	movb	%dl, 6(%rbx)
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	ret
	.p2align 4,,10
.L1410:
	leal	2(%rbp), %eax
	movw	%ax, 4(%rbx)
.L1415:
	movzbl	6(%rbx), %edx
	xorl	%eax, %eax
	movw	%ax, (%rbx)
	andl	$127, %edx
	orl	$2, %edx
	jmp	.L1422
	.seh_endproc
	.p2align 4,,15
	.globl	JSR
	.def	JSR;	.scl	2;	.type	32;	.endef
	.seh_proc	JSR
JSR:
	pushq	%r13
	.seh_pushreg	%r13
	pushq	%r12
	.seh_pushreg	%r12
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
	movzwl	4(%rcx), %ebp
	movq	16(%rcx), %rdx
	movq	%rcx, %rbx
	testq	%rdx, %rdx
	movl	%ebp, %r12d
	je	.L1450
	xorl	%eax, %eax
	xorl	%esi, %esi
	.p2align 4,,10
.L1441:
	movq	%rsi, %r8
	salq	$5, %r8
	addq	8(%rbx), %r8
	movzwl	16(%r8), %ecx
	cmpw	%cx, %r12w
	jb	.L1440
	movzwl	18(%r8), %r9d
	movzwl	%cx, %r10d
	addl	%r10d, %r9d
	cmpl	%r9d, %ebp
	jge	.L1440
	movl	%r12d, %edx
	subl	%ecx, %edx
	movq	24(%r8), %rcx
	movzwl	%dx, %edx
	call	*(%r8)
	movq	16(%rbx), %rdx
.L1440:
	addq	$1, %rsi
	cmpq	%rdx, %rsi
	jb	.L1441
	movzbl	%al, %esi
	movzwl	4(%rbx), %eax
	testq	%rdx, %rdx
	leal	1(%rax), %r13d
	movzwl	%r13w, %ebp
	je	.L1439
	xorl	%eax, %eax
	xorl	%r12d, %r12d
	.p2align 4,,10
.L1442:
	movq	%r12, %r8
	salq	$5, %r8
	addq	8(%rbx), %r8
	movzwl	16(%r8), %ecx
	cmpw	%cx, %r13w
	jb	.L1443
	movzwl	18(%r8), %r9d
	movzwl	%cx, %r10d
	addl	%r10d, %r9d
	cmpl	%r9d, %ebp
	jge	.L1443
	movl	%r13d, %edx
	subl	%ecx, %edx
	movq	24(%r8), %rcx
	movzwl	%dx, %edx
	call	*(%r8)
	movq	16(%rbx), %rdx
.L1443:
	addq	$1, %r12
	cmpq	%rdx, %r12
	jb	.L1442
	sall	$8, %eax
	movzbl	3(%rbx), %r13d
	orl	%eax, %esi
	movzwl	4(%rbx), %eax
	addl	$1, %eax
	movw	%ax, 4(%rbx)
	movzbl	%ah, %edi
	movl	%r13d, %eax
	leal	-1(%rax), %ecx
	addw	$256, %r13w
	testq	%rdx, %rdx
	movzwl	%r13w, %ebp
	movb	%cl, 3(%rbx)
	je	.L1444
	xorl	%r12d, %r12d
	.p2align 4,,10
.L1446:
	movq	%r12, %r9
	salq	$5, %r9
	addq	8(%rbx), %r9
	movzwl	16(%r9), %ecx
	cmpw	%cx, %r13w
	jb	.L1445
	movzwl	18(%r9), %eax
	movzwl	%cx, %r8d
	addl	%r8d, %eax
	cmpl	%eax, %ebp
	jge	.L1445
	movl	%r13d, %edx
	movl	%edi, %r8d
	subl	%ecx, %edx
	movq	24(%r9), %rcx
	movzwl	%dx, %edx
	call	*8(%r9)
	movq	16(%rbx), %rdx
.L1445:
	addq	$1, %r12
	cmpq	%rdx, %r12
	jb	.L1446
	movzbl	3(%rbx), %r13d
	movzbl	4(%rbx), %ebp
	leal	-1(%r13), %eax
	addw	$256, %r13w
	testq	%rdx, %rdx
	movzwl	%r13w, %edi
	movb	%al, 3(%rbx)
	je	.L1447
	xorl	%r12d, %r12d
	.p2align 4,,10
.L1449:
	movq	%r12, %r9
	salq	$5, %r9
	addq	8(%rbx), %r9
	movzwl	16(%r9), %ecx
	cmpw	%cx, %r13w
	jb	.L1448
	movzwl	18(%r9), %r8d
	movzwl	%cx, %eax
	addl	%eax, %r8d
	cmpl	%r8d, %edi
	jge	.L1448
	movl	%r13d, %edx
	movl	%ebp, %r8d
	subl	%ecx, %edx
	movq	24(%r9), %rcx
	movzwl	%dx, %edx
	call	*8(%r9)
	movq	16(%rbx), %rdx
.L1448:
	addq	$1, %r12
	cmpq	%rdx, %r12
	jb	.L1449
.L1447:
	movl	$6, %eax
	movw	%si, 4(%rbx)
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	ret
	.p2align 4,,10
.L1450:
	xorl	%esi, %esi
.L1439:
	subb	$2, 3(%rbx)
	jmp	.L1447
.L1444:
	subl	$2, %eax
	movb	%al, 3(%rbx)
	jmp	.L1447
	.seh_endproc
	.p2align 4,,15
	.globl	LAX_absy
	.def	LAX_absy;	.scl	2;	.type	32;	.endef
	.seh_proc	LAX_absy
LAX_absy:
	pushq	%r12
	.seh_pushreg	%r12
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movzwl	4(%rcx), %edi
	movq	16(%rcx), %rdx
	movq	%rcx, %rbx
	testq	%rdx, %rdx
	movl	%edi, %ebp
	je	.L1461
	xorl	%eax, %eax
	xorl	%esi, %esi
	.p2align 4,,10
.L1463:
	movq	%rsi, %r8
	salq	$5, %r8
	addq	8(%rbx), %r8
	movzwl	16(%r8), %ecx
	cmpw	%cx, %bp
	jb	.L1462
	movzwl	18(%r8), %r9d
	movzwl	%cx, %r10d
	addl	%r10d, %r9d
	cmpl	%r9d, %edi
	jge	.L1462
	movl	%ebp, %edx
	subl	%ecx, %edx
	movq	24(%r8), %rcx
	movzwl	%dx, %edx
	call	*(%r8)
	movq	16(%rbx), %rdx
.L1462:
	addq	$1, %rsi
	cmpq	%rdx, %rsi
	jb	.L1463
	movzwl	4(%rbx), %ebp
	testq	%rdx, %rdx
	movzbl	%al, %esi
	leal	1(%rbp), %r12d
	movzwl	%r12w, %edi
	je	.L1461
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	.p2align 4,,10
.L1465:
	movq	%rbp, %r8
	salq	$5, %r8
	addq	8(%rbx), %r8
	movzwl	16(%r8), %ecx
	cmpw	%cx, %r12w
	jb	.L1464
	movzwl	18(%r8), %r9d
	movzwl	%cx, %r10d
	addl	%r10d, %r9d
	cmpl	%r9d, %edi
	jge	.L1464
	movl	%r12d, %edx
	subl	%ecx, %edx
	movq	24(%r8), %rcx
	movzwl	%dx, %edx
	call	*(%r8)
	movq	16(%rbx), %rdx
.L1464:
	addq	$1, %rbp
	cmpq	%rdx, %rbp
	jb	.L1465
	movzbl	2(%rbx), %ebp
	sall	$8, %eax
	addw	$2, 4(%rbx)
	orl	%eax, %esi
	addl	%esi, %ebp
	testq	%rdx, %rdx
	movzwl	%bp, %edi
	je	.L1466
	xorl	%eax, %eax
	xorl	%esi, %esi
	.p2align 4,,10
.L1468:
	movq	%rsi, %r8
	salq	$5, %r8
	addq	8(%rbx), %r8
	movzwl	16(%r8), %ecx
	cmpw	%bp, %cx
	ja	.L1467
	movzwl	18(%r8), %r9d
	movzwl	%cx, %r10d
	addl	%r10d, %r9d
	cmpl	%r9d, %edi
	jge	.L1467
	movl	%ebp, %edx
	subl	%ecx, %edx
	movq	24(%r8), %rcx
	movzwl	%dx, %edx
	call	*(%r8)
	movq	16(%rbx), %rdx
.L1467:
	addq	$1, %rsi
	cmpq	%rdx, %rsi
	jb	.L1468
	testb	%al, %al
	movb	%al, (%rbx)
	movb	%al, 1(%rbx)
	movzbl	6(%rbx), %edx
	js	.L1488
	andl	$127, %edx
	testb	%al, %al
	movb	%dl, 6(%rbx)
	jne	.L1472
	orl	$2, %edx
	jmp	.L1473
	.p2align 4,,10
.L1488:
	orl	$-128, %edx
.L1472:
	andl	$-3, %edx
.L1473:
	movl	$4, %eax
	movb	%dl, 6(%rbx)
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	ret
	.p2align 4,,10
.L1461:
	leal	2(%rbp), %eax
	movw	%ax, 4(%rbx)
.L1466:
	movzbl	6(%rbx), %edx
	xorl	%eax, %eax
	movw	%ax, (%rbx)
	andl	$127, %edx
	orl	$2, %edx
	jmp	.L1473
	.seh_endproc
	.p2align 4,,15
	.globl	LAX_xind
	.def	LAX_xind;	.scl	2;	.type	32;	.endef
	.seh_proc	LAX_xind
LAX_xind:
	pushq	%r13
	.seh_pushreg	%r13
	pushq	%r12
	.seh_pushreg	%r12
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
	movzwl	4(%rcx), %ebp
	movq	16(%rcx), %rdx
	movq	%rcx, %rbx
	testq	%rdx, %rdx
	movl	%ebp, %r12d
	je	.L1493
	xorl	%eax, %eax
	xorl	%esi, %esi
	.p2align 4,,10
.L1492:
	movq	%rsi, %r8
	salq	$5, %r8
	addq	8(%rbx), %r8
	movzwl	16(%r8), %ecx
	cmpw	%cx, %r12w
	jb	.L1491
	movzwl	18(%r8), %r9d
	movzwl	%cx, %r10d
	addl	%r10d, %r9d
	cmpl	%r9d, %ebp
	jge	.L1491
	movl	%r12d, %edx
	subl	%ecx, %edx
	movq	24(%r8), %rcx
	movzwl	%dx, %edx
	call	*(%r8)
	movq	16(%rbx), %rdx
.L1491:
	addq	$1, %rsi
	cmpq	%rdx, %rsi
	jb	.L1492
	addb	1(%rbx), %al
	testq	%rdx, %rdx
	movzbl	%al, %ebp
	movl	%ebp, %edi
	movzbl	%bpl, %r13d
	je	.L1493
	xorl	%eax, %eax
	xorl	%r12d, %r12d
	.p2align 4,,10
.L1495:
	movq	%r12, %r8
	salq	$5, %r8
	addq	8(%rbx), %r8
	movzwl	16(%r8), %ecx
	cmpw	%cx, %r13w
	jb	.L1494
	movzwl	18(%r8), %r9d
	movzwl	%cx, %r10d
	addl	%r10d, %r9d
	cmpl	%r9d, %ebp
	jge	.L1494
	movl	%r13d, %edx
	subl	%ecx, %edx
	movq	24(%r8), %rcx
	movzwl	%dx, %edx
	call	*(%r8)
	movq	16(%rbx), %rdx
.L1494:
	addq	$1, %r12
	cmpq	%rdx, %r12
	jb	.L1495
	leal	1(%rdi), %r12d
	testq	%rdx, %rdx
	movzbl	%al, %esi
	movzbl	%r12b, %edi
	movzbl	%r12b, %r12d
	je	.L1493
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	.p2align 4,,10
.L1497:
	movq	%rbp, %r8
	salq	$5, %r8
	addq	8(%rbx), %r8
	movzwl	16(%r8), %ecx
	cmpw	%cx, %r12w
	jb	.L1496
	movzwl	18(%r8), %r9d
	movzwl	%cx, %r10d
	addl	%r10d, %r9d
	cmpl	%r9d, %edi
	jge	.L1496
	movl	%r12d, %edx
	subl	%ecx, %edx
	movq	24(%r8), %rcx
	movzwl	%dx, %edx
	call	*(%r8)
	movq	16(%rbx), %rdx
.L1496:
	addq	$1, %rbp
	cmpq	%rdx, %rbp
	jb	.L1497
	sall	$8, %eax
	addw	$1, 4(%rbx)
	orl	%eax, %esi
	testq	%rdx, %rdx
	movzwl	%si, %edi
	je	.L1498
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	.p2align 4,,10
.L1500:
	movq	%rbp, %r8
	salq	$5, %r8
	addq	8(%rbx), %r8
	movzwl	16(%r8), %ecx
	cmpw	%si, %cx
	ja	.L1499
	movzwl	18(%r8), %r9d
	movzwl	%cx, %r10d
	addl	%r10d, %r9d
	cmpl	%r9d, %edi
	jge	.L1499
	movl	%esi, %edx
	subl	%ecx, %edx
	movq	24(%r8), %rcx
	movzwl	%dx, %edx
	call	*(%r8)
	movq	16(%rbx), %rdx
.L1499:
	addq	$1, %rbp
	cmpq	%rdx, %rbp
	jb	.L1500
	testb	%al, %al
	movb	%al, (%rbx)
	movb	%al, 1(%rbx)
	movzbl	6(%rbx), %edx
	js	.L1521
	andl	$127, %edx
	testb	%al, %al
	movb	%dl, 6(%rbx)
	jne	.L1504
	orl	$2, %edx
	jmp	.L1505
	.p2align 4,,10
.L1521:
	orl	$-128, %edx
.L1504:
	andl	$-3, %edx
.L1505:
	movl	$6, %eax
	movb	%dl, 6(%rbx)
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	ret
	.p2align 4,,10
.L1493:
	addw	$1, 4(%rbx)
.L1498:
	movzbl	6(%rbx), %edx
	xorl	%eax, %eax
	movw	%ax, (%rbx)
	andl	$127, %edx
	orl	$2, %edx
	jmp	.L1505
	.seh_endproc
	.p2align 4,,15
	.globl	AND_indy
	.def	AND_indy;	.scl	2;	.type	32;	.endef
	.seh_proc	AND_indy
AND_indy:
	pushq	%r14
	.seh_pushreg	%r14
	pushq	%r13
	.seh_pushreg	%r13
	pushq	%r12
	.seh_pushreg	%r12
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movzwl	4(%rcx), %edi
	movq	16(%rcx), %rdx
	movq	%rcx, %rbx
	movzbl	(%rcx), %esi
	testq	%rdx, %rdx
	movl	%edi, %r13d
	je	.L1523
	xorl	%ebp, %ebp
	xorl	%r12d, %r12d
	.p2align 4,,10
.L1525:
	movq	%r12, %rax
	salq	$5, %rax
	addq	8(%rbx), %rax
	movzwl	16(%rax), %ecx
	cmpw	%cx, %r13w
	jb	.L1524
	movzwl	18(%rax), %r8d
	movzwl	%cx, %r9d
	addl	%r9d, %r8d
	cmpl	%r8d, %edi
	jge	.L1524
	movl	%r13d, %edx
	subl	%ecx, %edx
	movq	24(%rax), %rcx
	movzwl	%dx, %edx
	call	*(%rax)
	movq	16(%rbx), %rdx
	movl	%eax, %ebp
.L1524:
	addq	$1, %r12
	cmpq	%rdx, %r12
	jb	.L1525
	testq	%rdx, %rdx
	movzbl	%bpl, %r12d
	movzbl	%bpl, %r14d
	je	.L1523
	xorl	%eax, %eax
	xorl	%r13d, %r13d
	.p2align 4,,10
.L1528:
	movq	%r13, %r8
	salq	$5, %r8
	addq	8(%rbx), %r8
	movzwl	16(%r8), %ecx
	cmpw	%cx, %r14w
	jb	.L1527
	movzwl	18(%r8), %r9d
	movzwl	%cx, %r10d
	addl	%r10d, %r9d
	cmpl	%r9d, %r12d
	jge	.L1527
	movl	%r14d, %edx
	subl	%ecx, %edx
	movq	24(%r8), %rcx
	movzwl	%dx, %edx
	call	*(%r8)
	movq	16(%rbx), %rdx
.L1527:
	addq	$1, %r13
	cmpq	%rdx, %r13
	jb	.L1528
	leal	1(%rbp), %r13d
	testq	%rdx, %rdx
	movzbl	%al, %edi
	movzbl	%r13b, %ebp
	movzbl	%r13b, %r13d
	je	.L1523
	xorl	%eax, %eax
	xorl	%r12d, %r12d
	.p2align 4,,10
.L1530:
	movq	%r12, %r8
	salq	$5, %r8
	addq	8(%rbx), %r8
	movzwl	16(%r8), %ecx
	cmpw	%r13w, %cx
	ja	.L1529
	movzwl	18(%r8), %r9d
	movzwl	%cx, %r10d
	addl	%r10d, %r9d
	cmpl	%ebp, %r9d
	jle	.L1529
	movl	%r13d, %edx
	subl	%ecx, %edx
	movq	24(%r8), %rcx
	movzwl	%dx, %edx
	call	*(%r8)
	movq	16(%rbx), %rdx
.L1529:
	addq	$1, %r12
	cmpq	%rdx, %r12
	jb	.L1530
	movzbl	2(%rbx), %r12d
	sall	$8, %eax
	addw	$1, 4(%rbx)
	orl	%eax, %edi
	addl	%edi, %r12d
	testq	%rdx, %rdx
	movzwl	%r12w, %edi
	je	.L1531
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	.p2align 4,,10
.L1533:
	movq	%rbp, %r8
	salq	$5, %r8
	addq	8(%rbx), %r8
	movzwl	16(%r8), %ecx
	cmpw	%r12w, %cx
	ja	.L1532
	movzwl	18(%r8), %r9d
	movzwl	%cx, %r10d
	addl	%r10d, %r9d
	cmpl	%r9d, %edi
	jge	.L1532
	movl	%r12d, %edx
	subl	%ecx, %edx
	movq	24(%r8), %rcx
	movzwl	%dx, %edx
	call	*(%r8)
	movq	16(%rbx), %rdx
.L1532:
	addq	$1, %rbp
	cmpq	%rdx, %rbp
	jb	.L1533
	andl	%eax, %esi
	movzbl	6(%rbx), %edx
	testb	%sil, %sil
	movb	%sil, (%rbx)
	js	.L1552
	andl	$127, %edx
	testb	%sil, %sil
	movb	%dl, 6(%rbx)
	jne	.L1535
.L1537:
	orl	$2, %edx
.L1536:
	movl	$5, %eax
	movb	%dl, 6(%rbx)
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	ret
	.p2align 4,,10
.L1552:
	orl	$-128, %edx
.L1535:
	andl	$-3, %edx
	jmp	.L1536
	.p2align 4,,10
.L1523:
	addw	$1, 4(%rbx)
.L1531:
	movzbl	6(%rbx), %edx
	movb	$0, (%rbx)
	andl	$127, %edx
	jmp	.L1537
	.seh_endproc
	.p2align 4,,15
	.globl	EOR_imm
	.def	EOR_imm;	.scl	2;	.type	32;	.endef
	.seh_proc	EOR_imm
EOR_imm:
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
	movzwl	4(%rcx), %edi
	movq	16(%rcx), %r9
	movq	%rcx, %rsi
	leal	1(%rdi), %eax
	movl	%edi, %ebp
	movw	%ax, 4(%rcx)
	xorl	%eax, %eax
	testq	%r9, %r9
	je	.L1554
	xorl	%ebx, %ebx
	.p2align 4,,10
.L1556:
	movq	%rbx, %r8
	salq	$5, %r8
	addq	8(%rsi), %r8
	movzwl	16(%r8), %edx
	cmpw	%dx, %bp
	jb	.L1555
	movzwl	18(%r8), %ecx
	movzwl	%dx, %r10d
	addl	%r10d, %ecx
	cmpl	%ecx, %edi
	jge	.L1555
	movl	%ebp, %eax
	movq	24(%r8), %rcx
	subl	%edx, %eax
	movzwl	%ax, %edx
	call	*(%r8)
	movq	16(%rsi), %r9
.L1555:
	addq	$1, %rbx
	cmpq	%r9, %rbx
	jb	.L1556
.L1554:
	movzbl	(%rsi), %ecx
	movzbl	6(%rsi), %edx
	movl	%ecx, %r8d
	movl	%edx, %r9d
	andl	$127, %edx
	xorl	%eax, %r8d
	orl	$-128, %r9d
	testb	%r8b, %r8b
	movb	%r8b, (%rsi)
	cmovs	%r9d, %edx
	movl	%edx, %r8d
	andl	$-3, %edx
	orl	$2, %r8d
	cmpb	%al, %cl
	movl	$2, %eax
	cmove	%r8d, %edx
	movb	%dl, 6(%rsi)
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	ret
	.seh_endproc
	.p2align 4,,15
	.globl	EOR_absy
	.def	EOR_absy;	.scl	2;	.type	32;	.endef
	.seh_proc	EOR_absy
EOR_absy:
	pushq	%r12
	.seh_pushreg	%r12
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movzwl	4(%rcx), %edi
	movq	16(%rcx), %rdx
	movq	%rcx, %rbx
	testq	%rdx, %rdx
	movl	%edi, %ebp
	je	.L1564
	xorl	%eax, %eax
	xorl	%esi, %esi
	.p2align 4,,10
.L1566:
	movq	%rsi, %r8
	salq	$5, %r8
	addq	8(%rbx), %r8
	movzwl	16(%r8), %ecx
	cmpw	%cx, %bp
	jb	.L1565
	movzwl	18(%r8), %r9d
	movzwl	%cx, %r10d
	addl	%r10d, %r9d
	cmpl	%r9d, %edi
	jge	.L1565
	movl	%ebp, %edx
	subl	%ecx, %edx
	movq	24(%r8), %rcx
	movzwl	%dx, %edx
	call	*(%r8)
	movq	16(%rbx), %rdx
.L1565:
	addq	$1, %rsi
	cmpq	%rdx, %rsi
	jb	.L1566
	movzwl	4(%rbx), %ebp
	testq	%rdx, %rdx
	movzbl	%al, %esi
	leal	1(%rbp), %r12d
	movzwl	%r12w, %edi
	je	.L1564
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	.p2align 4,,10
.L1568:
	movq	%rbp, %r8
	salq	$5, %r8
	addq	8(%rbx), %r8
	movzwl	16(%r8), %ecx
	cmpw	%cx, %r12w
	jb	.L1567
	movzwl	18(%r8), %r9d
	movzwl	%cx, %r10d
	addl	%r10d, %r9d
	cmpl	%r9d, %edi
	jge	.L1567
	movl	%r12d, %edx
	subl	%ecx, %edx
	movq	24(%r8), %rcx
	movzwl	%dx, %edx
	call	*(%r8)
	movq	16(%rbx), %rdx
.L1567:
	addq	$1, %rbp
	cmpq	%rdx, %rbp
	jb	.L1568
	movzbl	2(%rbx), %ebp
	sall	$8, %eax
	addw	$2, 4(%rbx)
	orl	%eax, %esi
	xorl	%eax, %eax
	addl	%esi, %ebp
	testq	%rdx, %rdx
	movzwl	%bp, %edi
	je	.L1569
	xorl	%esi, %esi
	.p2align 4,,10
.L1571:
	movq	%rsi, %r8
	salq	$5, %r8
	addq	8(%rbx), %r8
	movzwl	16(%r8), %ecx
	cmpw	%bp, %cx
	ja	.L1570
	movzwl	18(%r8), %r9d
	movzwl	%cx, %r10d
	addl	%r10d, %r9d
	cmpl	%r9d, %edi
	jge	.L1570
	movl	%ebp, %edx
	subl	%ecx, %edx
	movq	24(%r8), %rcx
	movzwl	%dx, %edx
	call	*(%r8)
	movq	16(%rbx), %rdx
.L1570:
	addq	$1, %rsi
	cmpq	%rdx, %rsi
	jb	.L1571
.L1569:
	movzbl	(%rbx), %ecx
	movzbl	6(%rbx), %edx
	movl	%ecx, %r8d
	movl	%edx, %r9d
	andl	$127, %edx
	xorl	%eax, %r8d
	orl	$-128, %r9d
	testb	%r8b, %r8b
	movb	%r8b, (%rbx)
	cmovs	%r9d, %edx
	movl	%edx, %r8d
	andl	$-3, %edx
	orl	$2, %r8d
	cmpb	%al, %cl
	movl	$4, %eax
	cmove	%r8d, %edx
	movb	%dl, 6(%rbx)
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	ret
	.p2align 4,,10
.L1564:
	leal	2(%rbp), %eax
	movw	%ax, 4(%rbx)
	xorl	%eax, %eax
	jmp	.L1569
	.seh_endproc
	.p2align 4,,15
	.globl	ORA_imm
	.def	ORA_imm;	.scl	2;	.type	32;	.endef
	.seh_proc	ORA_imm
ORA_imm:
	pushq	%r12
	.seh_pushreg	%r12
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movzwl	4(%rcx), %edi
	movq	16(%rcx), %r9
	movq	%rcx, %rsi
	movzbl	(%rcx), %r12d
	testq	%r9, %r9
	leal	1(%rdi), %eax
	movl	%edi, %ebp
	movw	%ax, 4(%rcx)
	je	.L1588
	xorl	%eax, %eax
	xorl	%ebx, %ebx
	.p2align 4,,10
.L1590:
	movq	%rbx, %r8
	salq	$5, %r8
	addq	8(%rsi), %r8
	movzwl	16(%r8), %edx
	cmpw	%dx, %bp
	jb	.L1589
	movzwl	18(%r8), %ecx
	movzwl	%dx, %r10d
	addl	%r10d, %ecx
	cmpl	%ecx, %edi
	jge	.L1589
	movl	%ebp, %eax
	movq	24(%r8), %rcx
	subl	%edx, %eax
	movzwl	%ax, %edx
	call	*(%r8)
	movq	16(%rsi), %r9
.L1589:
	addq	$1, %rbx
	cmpq	%r9, %rbx
	jb	.L1590
	orl	%eax, %r12d
.L1588:
	testb	%r12b, %r12b
	movb	%r12b, (%rsi)
	movzbl	6(%rsi), %eax
	js	.L1598
	andl	$127, %eax
	testb	%r12b, %r12b
	movb	%al, 6(%rsi)
	jne	.L1592
	orl	$2, %eax
	jmp	.L1593
	.p2align 4,,10
.L1598:
	orl	$-128, %eax
.L1592:
	andl	$-3, %eax
.L1593:
	movb	%al, 6(%rsi)
	movl	$2, %eax
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	ret
	.seh_endproc
	.p2align 4,,15
	.globl	EOR_abss
	.def	EOR_abss;	.scl	2;	.type	32;	.endef
	.seh_proc	EOR_abss
EOR_abss:
	pushq	%r12
	.seh_pushreg	%r12
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movzwl	4(%rcx), %edi
	movq	16(%rcx), %rdx
	movq	%rcx, %rbx
	testq	%rdx, %rdx
	movl	%edi, %ebp
	je	.L1600
	xorl	%eax, %eax
	xorl	%esi, %esi
	.p2align 4,,10
.L1602:
	movq	%rsi, %r8
	salq	$5, %r8
	addq	8(%rbx), %r8
	movzwl	16(%r8), %ecx
	cmpw	%cx, %bp
	jb	.L1601
	movzwl	18(%r8), %r9d
	movzwl	%cx, %r10d
	addl	%r10d, %r9d
	cmpl	%r9d, %edi
	jge	.L1601
	movl	%ebp, %edx
	subl	%ecx, %edx
	movq	24(%r8), %rcx
	movzwl	%dx, %edx
	call	*(%r8)
	movq	16(%rbx), %rdx
.L1601:
	addq	$1, %rsi
	cmpq	%rdx, %rsi
	jb	.L1602
	movzwl	4(%rbx), %ebp
	testq	%rdx, %rdx
	movzbl	%al, %esi
	leal	1(%rbp), %r12d
	movzwl	%r12w, %edi
	je	.L1600
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	.p2align 4,,10
.L1604:
	movq	%rbp, %r8
	salq	$5, %r8
	addq	8(%rbx), %r8
	movzwl	16(%r8), %ecx
	cmpw	%cx, %r12w
	jb	.L1603
	movzwl	18(%r8), %r9d
	movzwl	%cx, %r10d
	addl	%r10d, %r9d
	cmpl	%r9d, %edi
	jge	.L1603
	movl	%r12d, %edx
	subl	%ecx, %edx
	movq	24(%r8), %rcx
	movzwl	%dx, %edx
	call	*(%r8)
	movq	16(%rbx), %rdx
.L1603:
	addq	$1, %rbp
	cmpq	%rdx, %rbp
	jb	.L1604
	sall	$8, %eax
	addw	$2, 4(%rbx)
	orl	%eax, %esi
	xorl	%eax, %eax
	testq	%rdx, %rdx
	movzwl	%si, %edi
	je	.L1605
	xorl	%ebp, %ebp
	.p2align 4,,10
.L1607:
	movq	%rbp, %r8
	salq	$5, %r8
	addq	8(%rbx), %r8
	movzwl	16(%r8), %ecx
	cmpw	%si, %cx
	ja	.L1606
	movzwl	18(%r8), %r9d
	movzwl	%cx, %r10d
	addl	%r10d, %r9d
	cmpl	%edi, %r9d
	jle	.L1606
	movl	%esi, %edx
	subl	%ecx, %edx
	movq	24(%r8), %rcx
	movzwl	%dx, %edx
	call	*(%r8)
	movq	16(%rbx), %rdx
.L1606:
	addq	$1, %rbp
	cmpq	%rdx, %rbp
	jb	.L1607
.L1605:
	movzbl	(%rbx), %ecx
	movzbl	6(%rbx), %edx
	movl	%ecx, %r8d
	movl	%edx, %r9d
	andl	$127, %edx
	xorl	%eax, %r8d
	orl	$-128, %r9d
	testb	%r8b, %r8b
	movb	%r8b, (%rbx)
	cmovs	%r9d, %edx
	movl	%edx, %r8d
	andl	$-3, %edx
	orl	$2, %r8d
	cmpb	%al, %cl
	movl	$4, %eax
	cmove	%r8d, %edx
	movb	%dl, 6(%rbx)
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	ret
	.p2align 4,,10
.L1600:
	leal	2(%rbp), %eax
	movw	%ax, 4(%rbx)
	xorl	%eax, %eax
	jmp	.L1605
	.seh_endproc
	.p2align 4,,15
	.globl	ORA_indy
	.def	ORA_indy;	.scl	2;	.type	32;	.endef
	.seh_proc	ORA_indy
ORA_indy:
	pushq	%r14
	.seh_pushreg	%r14
	pushq	%r13
	.seh_pushreg	%r13
	pushq	%r12
	.seh_pushreg	%r12
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movzwl	4(%rcx), %edi
	movq	16(%rcx), %rdx
	movq	%rcx, %rbx
	movzbl	(%rcx), %esi
	testq	%rdx, %rdx
	movl	%edi, %r13d
	je	.L1624
	xorl	%ebp, %ebp
	xorl	%r12d, %r12d
	.p2align 4,,10
.L1626:
	movq	%r12, %r8
	salq	$5, %r8
	addq	8(%rbx), %r8
	movzwl	16(%r8), %eax
	cmpw	%ax, %r13w
	jb	.L1625
	movzwl	18(%r8), %ecx
	movzwl	%ax, %r9d
	addl	%r9d, %ecx
	cmpl	%ecx, %edi
	jge	.L1625
	movl	%r13d, %edx
	movq	24(%r8), %rcx
	subl	%eax, %edx
	movzwl	%dx, %edx
	call	*(%r8)
	movq	16(%rbx), %rdx
	movl	%eax, %ebp
.L1625:
	addq	$1, %r12
	cmpq	%rdx, %r12
	jb	.L1626
	testq	%rdx, %rdx
	movzbl	%bpl, %r12d
	movzbl	%bpl, %r14d
	je	.L1624
	xorl	%eax, %eax
	xorl	%r13d, %r13d
	.p2align 4,,10
.L1629:
	movq	%r13, %r8
	salq	$5, %r8
	addq	8(%rbx), %r8
	movzwl	16(%r8), %ecx
	cmpw	%cx, %r14w
	jb	.L1628
	movzwl	18(%r8), %r9d
	movzwl	%cx, %r10d
	addl	%r10d, %r9d
	cmpl	%r9d, %r12d
	jge	.L1628
	movl	%r14d, %edx
	subl	%ecx, %edx
	movq	24(%r8), %rcx
	movzwl	%dx, %edx
	call	*(%r8)
	movq	16(%rbx), %rdx
.L1628:
	addq	$1, %r13
	cmpq	%rdx, %r13
	jb	.L1629
	leal	1(%rbp), %r13d
	testq	%rdx, %rdx
	movzbl	%al, %edi
	movzbl	%r13b, %ebp
	movzbl	%r13b, %r13d
	je	.L1624
	xorl	%eax, %eax
	xorl	%r12d, %r12d
	.p2align 4,,10
.L1631:
	movq	%r12, %r8
	salq	$5, %r8
	addq	8(%rbx), %r8
	movzwl	16(%r8), %ecx
	cmpw	%r13w, %cx
	ja	.L1630
	movzwl	18(%r8), %r9d
	movzwl	%cx, %r10d
	addl	%r10d, %r9d
	cmpl	%ebp, %r9d
	jle	.L1630
	movl	%r13d, %edx
	subl	%ecx, %edx
	movq	24(%r8), %rcx
	movzwl	%dx, %edx
	call	*(%r8)
	movq	16(%rbx), %rdx
.L1630:
	addq	$1, %r12
	cmpq	%rdx, %r12
	jb	.L1631
	movzbl	2(%rbx), %r12d
	sall	$8, %eax
	addw	$1, 4(%rbx)
	orl	%eax, %edi
	addl	%edi, %r12d
	testq	%rdx, %rdx
	movzwl	%r12w, %edi
	je	.L1632
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	.p2align 4,,10
.L1634:
	movq	%rbp, %r8
	salq	$5, %r8
	addq	8(%rbx), %r8
	movzwl	16(%r8), %ecx
	cmpw	%r12w, %cx
	ja	.L1633
	movzwl	18(%r8), %r9d
	movzwl	%cx, %r10d
	addl	%r10d, %r9d
	cmpl	%r9d, %edi
	jge	.L1633
	movl	%r12d, %edx
	subl	%ecx, %edx
	movq	24(%r8), %rcx
	movzwl	%dx, %edx
	call	*(%r8)
	movq	16(%rbx), %rdx
.L1633:
	addq	$1, %rbp
	cmpq	%rdx, %rbp
	jb	.L1634
	orl	%eax, %esi
.L1632:
	testb	%sil, %sil
	movb	%sil, (%rbx)
	movzbl	6(%rbx), %eax
	js	.L1652
	andl	$127, %eax
	testb	%sil, %sil
	movb	%al, 6(%rbx)
	jne	.L1636
	orl	$2, %eax
	jmp	.L1637
	.p2align 4,,10
.L1652:
	orl	$-128, %eax
.L1636:
	andl	$-3, %eax
.L1637:
	movb	%al, 6(%rbx)
	movl	$5, %eax
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	ret
	.p2align 4,,10
.L1624:
	addw	$1, 4(%rbx)
	jmp	.L1632
	.seh_endproc
	.p2align 4,,15
	.globl	AND_absy
	.def	AND_absy;	.scl	2;	.type	32;	.endef
	.seh_proc	AND_absy
AND_absy:
	pushq	%r13
	.seh_pushreg	%r13
	pushq	%r12
	.seh_pushreg	%r12
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
	movzwl	4(%rcx), %ebp
	movq	16(%rcx), %r9
	movq	%rcx, %rbx
	movzbl	(%rcx), %esi
	testq	%r9, %r9
	movl	%ebp, %r12d
	je	.L1654
	xorl	%eax, %eax
	xorl	%r13d, %r13d
	.p2align 4,,10
.L1656:
	movq	%r13, %r8
	salq	$5, %r8
	addq	8(%rbx), %r8
	movzwl	16(%r8), %edx
	cmpw	%dx, %r12w
	jb	.L1655
	movzwl	18(%r8), %ecx
	movzwl	%dx, %r10d
	addl	%r10d, %ecx
	cmpl	%ecx, %ebp
	jge	.L1655
	movl	%r12d, %eax
	movq	24(%r8), %rcx
	subl	%edx, %eax
	movzwl	%ax, %edx
	call	*(%r8)
	movq	16(%rbx), %r9
.L1655:
	addq	$1, %r13
	cmpq	%r9, %r13
	jb	.L1656
	movzwl	4(%rbx), %r12d
	testq	%r9, %r9
	movzbl	%al, %edi
	leal	1(%r12), %r13d
	movzwl	%r13w, %ebp
	je	.L1654
	xorl	%eax, %eax
	xorl	%r12d, %r12d
	.p2align 4,,10
.L1658:
	movq	%r12, %r8
	salq	$5, %r8
	addq	8(%rbx), %r8
	movzwl	16(%r8), %edx
	cmpw	%dx, %r13w
	jb	.L1657
	movzwl	18(%r8), %ecx
	movzwl	%dx, %r10d
	addl	%r10d, %ecx
	cmpl	%ecx, %ebp
	jge	.L1657
	movl	%r13d, %eax
	movq	24(%r8), %rcx
	subl	%edx, %eax
	movzwl	%ax, %edx
	call	*(%r8)
	movq	16(%rbx), %r9
.L1657:
	addq	$1, %r12
	cmpq	%r9, %r12
	jb	.L1658
	movzbl	2(%rbx), %r12d
	sall	$8, %eax
	addw	$2, 4(%rbx)
	orl	%eax, %edi
	addl	%edi, %r12d
	testq	%r9, %r9
	movzwl	%r12w, %edi
	je	.L1659
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	.p2align 4,,10
.L1661:
	movq	%rbp, %r8
	salq	$5, %r8
	addq	8(%rbx), %r8
	movzwl	16(%r8), %edx
	cmpw	%r12w, %dx
	ja	.L1660
	movzwl	18(%r8), %ecx
	movzwl	%dx, %r10d
	addl	%r10d, %ecx
	cmpl	%ecx, %edi
	jge	.L1660
	movl	%r12d, %eax
	movq	24(%r8), %rcx
	subl	%edx, %eax
	movzwl	%ax, %edx
	call	*(%r8)
	movq	16(%rbx), %r9
.L1660:
	addq	$1, %rbp
	cmpq	%r9, %rbp
	jb	.L1661
	andl	%eax, %esi
	movzbl	6(%rbx), %edx
	testb	%sil, %sil
	movb	%sil, (%rbx)
	js	.L1679
	andl	$127, %edx
	testb	%sil, %sil
	movb	%dl, 6(%rbx)
	jne	.L1663
.L1665:
	orl	$2, %edx
.L1664:
	movl	$4, %eax
	movb	%dl, 6(%rbx)
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	ret
	.p2align 4,,10
.L1679:
	orl	$-128, %edx
.L1663:
	andl	$-3, %edx
	jmp	.L1664
	.p2align 4,,10
.L1654:
	leal	2(%r12), %eax
	movw	%ax, 4(%rbx)
.L1659:
	movzbl	6(%rbx), %edx
	movb	$0, (%rbx)
	andl	$127, %edx
	jmp	.L1665
	.seh_endproc
	.p2align 4,,15
	.globl	EOR_xind
	.def	EOR_xind;	.scl	2;	.type	32;	.endef
	.seh_proc	EOR_xind
EOR_xind:
	pushq	%r13
	.seh_pushreg	%r13
	pushq	%r12
	.seh_pushreg	%r12
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
	movzwl	4(%rcx), %ebp
	movq	16(%rcx), %rdx
	movq	%rcx, %rbx
	testq	%rdx, %rdx
	movl	%ebp, %r12d
	je	.L1684
	xorl	%eax, %eax
	xorl	%esi, %esi
	.p2align 4,,10
.L1683:
	movq	%rsi, %r8
	salq	$5, %r8
	addq	8(%rbx), %r8
	movzwl	16(%r8), %ecx
	cmpw	%cx, %r12w
	jb	.L1682
	movzwl	18(%r8), %r9d
	movzwl	%cx, %r10d
	addl	%r10d, %r9d
	cmpl	%r9d, %ebp
	jge	.L1682
	movl	%r12d, %edx
	subl	%ecx, %edx
	movq	24(%r8), %rcx
	movzwl	%dx, %edx
	call	*(%r8)
	movq	16(%rbx), %rdx
.L1682:
	addq	$1, %rsi
	cmpq	%rdx, %rsi
	jb	.L1683
	addb	1(%rbx), %al
	testq	%rdx, %rdx
	movzbl	%al, %ebp
	movl	%ebp, %edi
	movzbl	%bpl, %r13d
	je	.L1684
	xorl	%eax, %eax
	xorl	%r12d, %r12d
	.p2align 4,,10
.L1686:
	movq	%r12, %r8
	salq	$5, %r8
	addq	8(%rbx), %r8
	movzwl	16(%r8), %ecx
	cmpw	%cx, %r13w
	jb	.L1685
	movzwl	18(%r8), %r9d
	movzwl	%cx, %r10d
	addl	%r10d, %r9d
	cmpl	%r9d, %ebp
	jge	.L1685
	movl	%r13d, %edx
	subl	%ecx, %edx
	movq	24(%r8), %rcx
	movzwl	%dx, %edx
	call	*(%r8)
	movq	16(%rbx), %rdx
.L1685:
	addq	$1, %r12
	cmpq	%rdx, %r12
	jb	.L1686
	leal	1(%rdi), %r12d
	testq	%rdx, %rdx
	movzbl	%al, %esi
	movzbl	%r12b, %edi
	movzbl	%r12b, %r12d
	je	.L1684
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	.p2align 4,,10
.L1688:
	movq	%rbp, %r8
	salq	$5, %r8
	addq	8(%rbx), %r8
	movzwl	16(%r8), %ecx
	cmpw	%cx, %r12w
	jb	.L1687
	movzwl	18(%r8), %r9d
	movzwl	%cx, %r10d
	addl	%r10d, %r9d
	cmpl	%r9d, %edi
	jge	.L1687
	movl	%r12d, %edx
	subl	%ecx, %edx
	movq	24(%r8), %rcx
	movzwl	%dx, %edx
	call	*(%r8)
	movq	16(%rbx), %rdx
.L1687:
	addq	$1, %rbp
	cmpq	%rdx, %rbp
	jb	.L1688
	sall	$8, %eax
	addw	$1, 4(%rbx)
	orl	%eax, %esi
	xorl	%eax, %eax
	testq	%rdx, %rdx
	movzwl	%si, %edi
	je	.L1689
	xorl	%ebp, %ebp
	.p2align 4,,10
.L1691:
	movq	%rbp, %r8
	salq	$5, %r8
	addq	8(%rbx), %r8
	movzwl	16(%r8), %ecx
	cmpw	%si, %cx
	ja	.L1690
	movzwl	18(%r8), %r9d
	movzwl	%cx, %r10d
	addl	%r10d, %r9d
	cmpl	%r9d, %edi
	jge	.L1690
	movl	%esi, %edx
	subl	%ecx, %edx
	movq	24(%r8), %rcx
	movzwl	%dx, %edx
	call	*(%r8)
	movq	16(%rbx), %rdx
.L1690:
	addq	$1, %rbp
	cmpq	%rdx, %rbp
	jb	.L1691
.L1689:
	movzbl	(%rbx), %ecx
	movzbl	6(%rbx), %edx
	movl	%ecx, %r8d
	movl	%edx, %r9d
	andl	$127, %edx
	xorl	%eax, %r8d
	orl	$-128, %r9d
	testb	%r8b, %r8b
	movb	%r8b, (%rbx)
	cmovs	%r9d, %edx
	movl	%edx, %r8d
	andl	$-3, %edx
	orl	$2, %r8d
	cmpb	%al, %cl
	movl	$6, %eax
	cmove	%r8d, %edx
	movb	%dl, 6(%rbx)
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	ret
	.p2align 4,,10
.L1684:
	addw	$1, 4(%rbx)
	xorl	%eax, %eax
	jmp	.L1689
	.seh_endproc
	.p2align 4,,15
	.globl	ORA_absx
	.def	ORA_absx;	.scl	2;	.type	32;	.endef
	.seh_proc	ORA_absx
ORA_absx:
	pushq	%r13
	.seh_pushreg	%r13
	pushq	%r12
	.seh_pushreg	%r12
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
	movzwl	4(%rcx), %ebp
	movq	16(%rcx), %r9
	movq	%rcx, %rbx
	movzbl	(%rcx), %esi
	testq	%r9, %r9
	movl	%ebp, %r12d
	je	.L1709
	xorl	%eax, %eax
	xorl	%r13d, %r13d
	.p2align 4,,10
.L1711:
	movq	%r13, %r8
	salq	$5, %r8
	addq	8(%rbx), %r8
	movzwl	16(%r8), %edx
	cmpw	%dx, %r12w
	jb	.L1710
	movzwl	18(%r8), %ecx
	movzwl	%dx, %r10d
	addl	%r10d, %ecx
	cmpl	%ecx, %ebp
	jge	.L1710
	movl	%r12d, %eax
	movq	24(%r8), %rcx
	subl	%edx, %eax
	movzwl	%ax, %edx
	call	*(%r8)
	movq	16(%rbx), %r9
.L1710:
	addq	$1, %r13
	cmpq	%r9, %r13
	jb	.L1711
	movzwl	4(%rbx), %r12d
	testq	%r9, %r9
	movzbl	%al, %edi
	leal	1(%r12), %r13d
	movzwl	%r13w, %ebp
	je	.L1709
	xorl	%eax, %eax
	xorl	%r12d, %r12d
	.p2align 4,,10
.L1713:
	movq	%r12, %r8
	salq	$5, %r8
	addq	8(%rbx), %r8
	movzwl	16(%r8), %edx
	cmpw	%dx, %r13w
	jb	.L1712
	movzwl	18(%r8), %ecx
	movzwl	%dx, %r10d
	addl	%r10d, %ecx
	cmpl	%ecx, %ebp
	jge	.L1712
	movl	%r13d, %eax
	movq	24(%r8), %rcx
	subl	%edx, %eax
	movzwl	%ax, %edx
	call	*(%r8)
	movq	16(%rbx), %r9
.L1712:
	addq	$1, %r12
	cmpq	%r9, %r12
	jb	.L1713
	movzbl	1(%rbx), %r12d
	sall	$8, %eax
	addw	$2, 4(%rbx)
	orl	%eax, %edi
	addl	%edi, %r12d
	testq	%r9, %r9
	movzwl	%r12w, %edi
	je	.L1714
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	.p2align 4,,10
.L1716:
	movq	%rbp, %r8
	salq	$5, %r8
	addq	8(%rbx), %r8
	movzwl	16(%r8), %edx
	cmpw	%r12w, %dx
	ja	.L1715
	movzwl	18(%r8), %ecx
	movzwl	%dx, %r10d
	addl	%r10d, %ecx
	cmpl	%ecx, %edi
	jge	.L1715
	movl	%r12d, %eax
	movq	24(%r8), %rcx
	subl	%edx, %eax
	movzwl	%ax, %edx
	call	*(%r8)
	movq	16(%rbx), %r9
.L1715:
	addq	$1, %rbp
	cmpq	%r9, %rbp
	jb	.L1716
	orl	%eax, %esi
.L1714:
	testb	%sil, %sil
	movb	%sil, (%rbx)
	movzbl	6(%rbx), %eax
	js	.L1733
	andl	$127, %eax
	testb	%sil, %sil
	movb	%al, 6(%rbx)
	jne	.L1718
	orl	$2, %eax
	jmp	.L1719
	.p2align 4,,10
.L1733:
	orl	$-128, %eax
.L1718:
	andl	$-3, %eax
.L1719:
	movb	%al, 6(%rbx)
	movl	$4, %eax
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	ret
	.p2align 4,,10
.L1709:
	leal	2(%r12), %eax
	movw	%ax, 4(%rbx)
	jmp	.L1714
	.seh_endproc
	.p2align 4,,15
	.globl	EOR_absx
	.def	EOR_absx;	.scl	2;	.type	32;	.endef
	.seh_proc	EOR_absx
EOR_absx:
	pushq	%r12
	.seh_pushreg	%r12
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movzwl	4(%rcx), %edi
	movq	16(%rcx), %rdx
	movq	%rcx, %rbx
	testq	%rdx, %rdx
	movl	%edi, %ebp
	je	.L1735
	xorl	%eax, %eax
	xorl	%esi, %esi
	.p2align 4,,10
.L1737:
	movq	%rsi, %r8
	salq	$5, %r8
	addq	8(%rbx), %r8
	movzwl	16(%r8), %ecx
	cmpw	%cx, %bp
	jb	.L1736
	movzwl	18(%r8), %r9d
	movzwl	%cx, %r10d
	addl	%r10d, %r9d
	cmpl	%r9d, %edi
	jge	.L1736
	movl	%ebp, %edx
	subl	%ecx, %edx
	movq	24(%r8), %rcx
	movzwl	%dx, %edx
	call	*(%r8)
	movq	16(%rbx), %rdx
.L1736:
	addq	$1, %rsi
	cmpq	%rdx, %rsi
	jb	.L1737
	movzwl	4(%rbx), %ebp
	testq	%rdx, %rdx
	movzbl	%al, %esi
	leal	1(%rbp), %r12d
	movzwl	%r12w, %edi
	je	.L1735
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	.p2align 4,,10
.L1739:
	movq	%rbp, %r8
	salq	$5, %r8
	addq	8(%rbx), %r8
	movzwl	16(%r8), %ecx
	cmpw	%cx, %r12w
	jb	.L1738
	movzwl	18(%r8), %r9d
	movzwl	%cx, %r10d
	addl	%r10d, %r9d
	cmpl	%r9d, %edi
	jge	.L1738
	movl	%r12d, %edx
	subl	%ecx, %edx
	movq	24(%r8), %rcx
	movzwl	%dx, %edx
	call	*(%r8)
	movq	16(%rbx), %rdx
.L1738:
	addq	$1, %rbp
	cmpq	%rdx, %rbp
	jb	.L1739
	movzbl	1(%rbx), %ebp
	sall	$8, %eax
	addw	$2, 4(%rbx)
	orl	%eax, %esi
	xorl	%eax, %eax
	addl	%esi, %ebp
	testq	%rdx, %rdx
	movzwl	%bp, %edi
	je	.L1740
	xorl	%esi, %esi
	.p2align 4,,10
.L1742:
	movq	%rsi, %r8
	salq	$5, %r8
	addq	8(%rbx), %r8
	movzwl	16(%r8), %ecx
	cmpw	%bp, %cx
	ja	.L1741
	movzwl	18(%r8), %r9d
	movzwl	%cx, %r10d
	addl	%r10d, %r9d
	cmpl	%r9d, %edi
	jge	.L1741
	movl	%ebp, %edx
	subl	%ecx, %edx
	movq	24(%r8), %rcx
	movzwl	%dx, %edx
	call	*(%r8)
	movq	16(%rbx), %rdx
.L1741:
	addq	$1, %rsi
	cmpq	%rdx, %rsi
	jb	.L1742
.L1740:
	movzbl	(%rbx), %ecx
	movzbl	6(%rbx), %edx
	movl	%ecx, %r8d
	movl	%edx, %r9d
	andl	$127, %edx
	xorl	%eax, %r8d
	orl	$-128, %r9d
	testb	%r8b, %r8b
	movb	%r8b, (%rbx)
	cmovs	%r9d, %edx
	movl	%edx, %r8d
	andl	$-3, %edx
	orl	$2, %r8d
	cmpb	%al, %cl
	movl	$4, %eax
	cmove	%r8d, %edx
	movb	%dl, 6(%rbx)
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	ret
	.p2align 4,,10
.L1735:
	leal	2(%rbp), %eax
	movw	%ax, 4(%rbx)
	xorl	%eax, %eax
	jmp	.L1740
	.seh_endproc
	.p2align 4,,15
	.globl	ORA_abss
	.def	ORA_abss;	.scl	2;	.type	32;	.endef
	.seh_proc	ORA_abss
ORA_abss:
	pushq	%r13
	.seh_pushreg	%r13
	pushq	%r12
	.seh_pushreg	%r12
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
	movzwl	4(%rcx), %ebp
	movq	16(%rcx), %r9
	movq	%rcx, %rbx
	movzbl	(%rcx), %esi
	testq	%r9, %r9
	movl	%ebp, %r12d
	je	.L1759
	xorl	%eax, %eax
	xorl	%r13d, %r13d
	.p2align 4,,10
.L1761:
	movq	%r13, %r8
	salq	$5, %r8
	addq	8(%rbx), %r8
	movzwl	16(%r8), %edx
	cmpw	%dx, %r12w
	jb	.L1760
	movzwl	18(%r8), %ecx
	movzwl	%dx, %r10d
	addl	%r10d, %ecx
	cmpl	%ecx, %ebp
	jge	.L1760
	movl	%r12d, %eax
	movq	24(%r8), %rcx
	subl	%edx, %eax
	movzwl	%ax, %edx
	call	*(%r8)
	movq	16(%rbx), %r9
.L1760:
	addq	$1, %r13
	cmpq	%r9, %r13
	jb	.L1761
	movzwl	4(%rbx), %r12d
	testq	%r9, %r9
	movzbl	%al, %edi
	leal	1(%r12), %r13d
	movzwl	%r13w, %ebp
	je	.L1759
	xorl	%eax, %eax
	xorl	%r12d, %r12d
	.p2align 4,,10
.L1763:
	movq	%r12, %r8
	salq	$5, %r8
	addq	8(%rbx), %r8
	movzwl	16(%r8), %edx
	cmpw	%dx, %r13w
	jb	.L1762
	movzwl	18(%r8), %ecx
	movzwl	%dx, %r10d
	addl	%r10d, %ecx
	cmpl	%ecx, %ebp
	jge	.L1762
	movl	%r13d, %eax
	movq	24(%r8), %rcx
	subl	%edx, %eax
	movzwl	%ax, %edx
	call	*(%r8)
	movq	16(%rbx), %r9
.L1762:
	addq	$1, %r12
	cmpq	%r9, %r12
	jb	.L1763
	sall	$8, %eax
	addw	$2, 4(%rbx)
	orl	%edi, %eax
	testq	%r9, %r9
	movzwl	%ax, %edi
	movl	%edi, %r12d
	je	.L1764
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	.p2align 4,,10
.L1766:
	movq	%rbp, %r8
	salq	$5, %r8
	addq	8(%rbx), %r8
	movzwl	16(%r8), %edx
	cmpw	%r12w, %dx
	ja	.L1765
	movzwl	18(%r8), %ecx
	movzwl	%dx, %r10d
	addl	%r10d, %ecx
	cmpl	%edi, %ecx
	jle	.L1765
	movl	%r12d, %eax
	movq	24(%r8), %rcx
	subl	%edx, %eax
	movzwl	%ax, %edx
	call	*(%r8)
	movq	16(%rbx), %r9
.L1765:
	addq	$1, %rbp
	cmpq	%r9, %rbp
	jb	.L1766
	orl	%eax, %esi
.L1764:
	testb	%sil, %sil
	movb	%sil, (%rbx)
	movzbl	6(%rbx), %eax
	js	.L1783
	andl	$127, %eax
	testb	%sil, %sil
	movb	%al, 6(%rbx)
	jne	.L1768
	orl	$2, %eax
	jmp	.L1769
	.p2align 4,,10
.L1783:
	orl	$-128, %eax
.L1768:
	andl	$-3, %eax
.L1769:
	movb	%al, 6(%rbx)
	movl	$4, %eax
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	ret
	.p2align 4,,10
.L1759:
	leal	2(%r12), %eax
	movw	%ax, 4(%rbx)
	jmp	.L1764
	.seh_endproc
	.p2align 4,,15
	.globl	EOR_indy
	.def	EOR_indy;	.scl	2;	.type	32;	.endef
	.seh_proc	EOR_indy
EOR_indy:
	pushq	%r13
	.seh_pushreg	%r13
	pushq	%r12
	.seh_pushreg	%r12
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
	movzwl	4(%rcx), %ebp
	movq	16(%rcx), %rdx
	movq	%rcx, %rbx
	testq	%rdx, %rdx
	movl	%ebp, %r12d
	je	.L1785
	xorl	%edi, %edi
	xorl	%esi, %esi
	.p2align 4,,10
.L1787:
	movq	%rsi, %rax
	salq	$5, %rax
	addq	8(%rbx), %rax
	movzwl	16(%rax), %ecx
	cmpw	%cx, %r12w
	jb	.L1786
	movzwl	18(%rax), %r8d
	movzwl	%cx, %r9d
	addl	%r9d, %r8d
	cmpl	%r8d, %ebp
	jge	.L1786
	movl	%r12d, %edx
	subl	%ecx, %edx
	movq	24(%rax), %rcx
	movzwl	%dx, %edx
	call	*(%rax)
	movq	16(%rbx), %rdx
	movl	%eax, %edi
.L1786:
	addq	$1, %rsi
	cmpq	%rdx, %rsi
	jb	.L1787
	testq	%rdx, %rdx
	movzbl	%dil, %ebp
	movzbl	%dil, %r13d
	je	.L1785
	xorl	%eax, %eax
	xorl	%r12d, %r12d
	.p2align 4,,10
.L1790:
	movq	%r12, %r8
	salq	$5, %r8
	addq	8(%rbx), %r8
	movzwl	16(%r8), %ecx
	cmpw	%cx, %r13w
	jb	.L1789
	movzwl	18(%r8), %r9d
	movzwl	%cx, %r10d
	addl	%r10d, %r9d
	cmpl	%r9d, %ebp
	jge	.L1789
	movl	%r13d, %edx
	subl	%ecx, %edx
	movq	24(%r8), %rcx
	movzwl	%dx, %edx
	call	*(%r8)
	movq	16(%rbx), %rdx
.L1789:
	addq	$1, %r12
	cmpq	%rdx, %r12
	jb	.L1790
	leal	1(%rdi), %r12d
	testq	%rdx, %rdx
	movzbl	%al, %esi
	movzbl	%r12b, %edi
	movzbl	%r12b, %r12d
	je	.L1785
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	.p2align 4,,10
.L1792:
	movq	%rbp, %r8
	salq	$5, %r8
	addq	8(%rbx), %r8
	movzwl	16(%r8), %ecx
	cmpw	%r12w, %cx
	ja	.L1791
	movzwl	18(%r8), %r9d
	movzwl	%cx, %r10d
	addl	%r10d, %r9d
	cmpl	%edi, %r9d
	jle	.L1791
	movl	%r12d, %edx
	subl	%ecx, %edx
	movq	24(%r8), %rcx
	movzwl	%dx, %edx
	call	*(%r8)
	movq	16(%rbx), %rdx
.L1791:
	addq	$1, %rbp
	cmpq	%rdx, %rbp
	jb	.L1792
	sall	$8, %eax
	addw	$1, 4(%rbx)
	orl	%eax, %esi
	movzbl	2(%rbx), %eax
	addl	%eax, %esi
	xorl	%eax, %eax
	testq	%rdx, %rdx
	movzwl	%si, %edi
	je	.L1793
	xorl	%ebp, %ebp
	.p2align 4,,10
.L1795:
	movq	%rbp, %r8
	salq	$5, %r8
	addq	8(%rbx), %r8
	movzwl	16(%r8), %ecx
	cmpw	%si, %cx
	ja	.L1794
	movzwl	18(%r8), %r9d
	movzwl	%cx, %r10d
	addl	%r10d, %r9d
	cmpl	%r9d, %edi
	jge	.L1794
	movl	%esi, %edx
	subl	%ecx, %edx
	movq	24(%r8), %rcx
	movzwl	%dx, %edx
	call	*(%r8)
	movq	16(%rbx), %rdx
.L1794:
	addq	$1, %rbp
	cmpq	%rdx, %rbp
	jb	.L1795
.L1793:
	movzbl	(%rbx), %ecx
	movzbl	6(%rbx), %edx
	movl	%ecx, %r8d
	movl	%edx, %r9d
	andl	$127, %edx
	xorl	%eax, %r8d
	orl	$-128, %r9d
	testb	%r8b, %r8b
	movb	%r8b, (%rbx)
	cmovs	%r9d, %edx
	movl	%edx, %r8d
	andl	$-3, %edx
	orl	$2, %r8d
	cmpb	%al, %cl
	movl	$5, %eax
	cmove	%r8d, %edx
	movb	%dl, 6(%rbx)
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	ret
	.p2align 4,,10
.L1785:
	addw	$1, 4(%rbx)
	xorl	%eax, %eax
	jmp	.L1793
	.seh_endproc
	.p2align 4,,15
	.globl	AND_abss
	.def	AND_abss;	.scl	2;	.type	32;	.endef
	.seh_proc	AND_abss
AND_abss:
	pushq	%r13
	.seh_pushreg	%r13
	pushq	%r12
	.seh_pushreg	%r12
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
	movzwl	4(%rcx), %ebp
	movq	16(%rcx), %r9
	movq	%rcx, %rbx
	movzbl	(%rcx), %esi
	testq	%r9, %r9
	movl	%ebp, %r12d
	je	.L1813
	xorl	%eax, %eax
	xorl	%r13d, %r13d
	.p2align 4,,10
.L1815:
	movq	%r13, %r8
	salq	$5, %r8
	addq	8(%rbx), %r8
	movzwl	16(%r8), %edx
	cmpw	%dx, %r12w
	jb	.L1814
	movzwl	18(%r8), %ecx
	movzwl	%dx, %r10d
	addl	%r10d, %ecx
	cmpl	%ecx, %ebp
	jge	.L1814
	movl	%r12d, %eax
	movq	24(%r8), %rcx
	subl	%edx, %eax
	movzwl	%ax, %edx
	call	*(%r8)
	movq	16(%rbx), %r9
.L1814:
	addq	$1, %r13
	cmpq	%r9, %r13
	jb	.L1815
	movzwl	4(%rbx), %r12d
	testq	%r9, %r9
	movzbl	%al, %edi
	leal	1(%r12), %r13d
	movzwl	%r13w, %ebp
	je	.L1813
	xorl	%eax, %eax
	xorl	%r12d, %r12d
	.p2align 4,,10
.L1817:
	movq	%r12, %r8
	salq	$5, %r8
	addq	8(%rbx), %r8
	movzwl	16(%r8), %edx
	cmpw	%dx, %r13w
	jb	.L1816
	movzwl	18(%r8), %ecx
	movzwl	%dx, %r10d
	addl	%r10d, %ecx
	cmpl	%ecx, %ebp
	jge	.L1816
	movl	%r13d, %eax
	movq	24(%r8), %rcx
	subl	%edx, %eax
	movzwl	%ax, %edx
	call	*(%r8)
	movq	16(%rbx), %r9
.L1816:
	addq	$1, %r12
	cmpq	%r9, %r12
	jb	.L1817
	sall	$8, %eax
	addw	$2, 4(%rbx)
	orl	%edi, %eax
	testq	%r9, %r9
	movzwl	%ax, %edi
	movl	%edi, %r12d
	je	.L1818
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	.p2align 4,,10
.L1820:
	movq	%rbp, %r8
	salq	$5, %r8
	addq	8(%rbx), %r8
	movzwl	16(%r8), %edx
	cmpw	%r12w, %dx
	ja	.L1819
	movzwl	18(%r8), %ecx
	movzwl	%dx, %r10d
	addl	%r10d, %ecx
	cmpl	%edi, %ecx
	jle	.L1819
	movl	%r12d, %eax
	movq	24(%r8), %rcx
	subl	%edx, %eax
	movzwl	%ax, %edx
	call	*(%r8)
	movq	16(%rbx), %r9
.L1819:
	addq	$1, %rbp
	cmpq	%r9, %rbp
	jb	.L1820
	andl	%eax, %esi
	movzbl	6(%rbx), %edx
	testb	%sil, %sil
	movb	%sil, (%rbx)
	js	.L1838
	andl	$127, %edx
	testb	%sil, %sil
	movb	%dl, 6(%rbx)
	jne	.L1822
.L1824:
	orl	$2, %edx
.L1823:
	movl	$4, %eax
	movb	%dl, 6(%rbx)
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	ret
	.p2align 4,,10
.L1838:
	orl	$-128, %edx
.L1822:
	andl	$-3, %edx
	jmp	.L1823
	.p2align 4,,10
.L1813:
	leal	2(%r12), %eax
	movw	%ax, 4(%rbx)
.L1818:
	movzbl	6(%rbx), %edx
	movb	$0, (%rbx)
	andl	$127, %edx
	jmp	.L1824
	.seh_endproc
	.p2align 4,,15
	.globl	ORA_xind
	.def	ORA_xind;	.scl	2;	.type	32;	.endef
	.seh_proc	ORA_xind
ORA_xind:
	pushq	%r14
	.seh_pushreg	%r14
	pushq	%r13
	.seh_pushreg	%r13
	pushq	%r12
	.seh_pushreg	%r12
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movzwl	4(%rcx), %edi
	movq	16(%rcx), %rdx
	movq	%rcx, %rbx
	movzbl	(%rcx), %esi
	testq	%rdx, %rdx
	movl	%edi, %r13d
	je	.L1843
	xorl	%eax, %eax
	xorl	%r12d, %r12d
	.p2align 4,,10
.L1842:
	movq	%r12, %r8
	salq	$5, %r8
	addq	8(%rbx), %r8
	movzwl	16(%r8), %ecx
	cmpw	%cx, %r13w
	jb	.L1841
	movzwl	18(%r8), %r9d
	movzwl	%cx, %r10d
	addl	%r10d, %r9d
	cmpl	%r9d, %edi
	jge	.L1841
	movl	%r13d, %edx
	subl	%ecx, %edx
	movq	24(%r8), %rcx
	movzwl	%dx, %edx
	call	*(%r8)
	movq	16(%rbx), %rdx
.L1841:
	addq	$1, %r12
	cmpq	%rdx, %r12
	jb	.L1842
	addb	1(%rbx), %al
	testq	%rdx, %rdx
	movzbl	%al, %r12d
	movl	%r12d, %ebp
	movzbl	%r12b, %r14d
	je	.L1843
	xorl	%eax, %eax
	xorl	%r13d, %r13d
	.p2align 4,,10
.L1845:
	movq	%r13, %r8
	salq	$5, %r8
	addq	8(%rbx), %r8
	movzwl	16(%r8), %ecx
	cmpw	%cx, %r14w
	jb	.L1844
	movzwl	18(%r8), %r9d
	movzwl	%cx, %r10d
	addl	%r10d, %r9d
	cmpl	%r9d, %r12d
	jge	.L1844
	movl	%r14d, %edx
	subl	%ecx, %edx
	movq	24(%r8), %rcx
	movzwl	%dx, %edx
	call	*(%r8)
	movq	16(%rbx), %rdx
.L1844:
	addq	$1, %r13
	cmpq	%rdx, %r13
	jb	.L1845
	leal	1(%rbp), %r13d
	testq	%rdx, %rdx
	movzbl	%al, %edi
	movzbl	%r13b, %ebp
	movzbl	%r13b, %r13d
	je	.L1843
	xorl	%eax, %eax
	xorl	%r12d, %r12d
	.p2align 4,,10
.L1847:
	movq	%r12, %r8
	salq	$5, %r8
	addq	8(%rbx), %r8
	movzwl	16(%r8), %ecx
	cmpw	%cx, %r13w
	jb	.L1846
	movzwl	18(%r8), %r9d
	movzwl	%cx, %r10d
	addl	%r10d, %r9d
	cmpl	%r9d, %ebp
	jge	.L1846
	movl	%r13d, %edx
	subl	%ecx, %edx
	movq	24(%r8), %rcx
	movzwl	%dx, %edx
	call	*(%r8)
	movq	16(%rbx), %rdx
.L1846:
	addq	$1, %r12
	cmpq	%rdx, %r12
	jb	.L1847
	sall	$8, %eax
	addw	$1, 4(%rbx)
	orl	%edi, %eax
	testq	%rdx, %rdx
	movzwl	%ax, %edi
	movl	%edi, %r12d
	je	.L1848
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	.p2align 4,,10
.L1850:
	movq	%rbp, %r8
	salq	$5, %r8
	addq	8(%rbx), %r8
	movzwl	16(%r8), %ecx
	cmpw	%r12w, %cx
	ja	.L1849
	movzwl	18(%r8), %r9d
	movzwl	%cx, %r10d
	addl	%r10d, %r9d
	cmpl	%r9d, %edi
	jge	.L1849
	movl	%r12d, %edx
	subl	%ecx, %edx
	movq	24(%r8), %rcx
	movzwl	%dx, %edx
	call	*(%r8)
	movq	16(%rbx), %rdx
.L1849:
	addq	$1, %rbp
	cmpq	%rdx, %rbp
	jb	.L1850
	orl	%eax, %esi
.L1848:
	testb	%sil, %sil
	movb	%sil, (%rbx)
	movzbl	6(%rbx), %eax
	js	.L1868
	andl	$127, %eax
	testb	%sil, %sil
	movb	%al, 6(%rbx)
	jne	.L1852
	orl	$2, %eax
	jmp	.L1853
	.p2align 4,,10
.L1868:
	orl	$-128, %eax
.L1852:
	andl	$-3, %eax
.L1853:
	movb	%al, 6(%rbx)
	movl	$6, %eax
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	ret
	.p2align 4,,10
.L1843:
	addw	$1, 4(%rbx)
	jmp	.L1848
	.seh_endproc
	.p2align 4,,15
	.globl	AND_xind
	.def	AND_xind;	.scl	2;	.type	32;	.endef
	.seh_proc	AND_xind
AND_xind:
	pushq	%r14
	.seh_pushreg	%r14
	pushq	%r13
	.seh_pushreg	%r13
	pushq	%r12
	.seh_pushreg	%r12
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movzwl	4(%rcx), %edi
	movq	16(%rcx), %rdx
	movq	%rcx, %rbx
	movzbl	(%rcx), %esi
	testq	%rdx, %rdx
	movl	%edi, %r13d
	je	.L1870
	xorl	%eax, %eax
	xorl	%r12d, %r12d
	.p2align 4,,10
.L1872:
	movq	%r12, %r8
	salq	$5, %r8
	addq	8(%rbx), %r8
	movzwl	16(%r8), %ecx
	cmpw	%cx, %r13w
	jb	.L1871
	movzwl	18(%r8), %r9d
	movzwl	%cx, %r10d
	addl	%r10d, %r9d
	cmpl	%r9d, %edi
	jge	.L1871
	movl	%r13d, %edx
	subl	%ecx, %edx
	movq	24(%r8), %rcx
	movzwl	%dx, %edx
	call	*(%r8)
	movq	16(%rbx), %rdx
.L1871:
	addq	$1, %r12
	cmpq	%rdx, %r12
	jb	.L1872
	addb	1(%rbx), %al
	testq	%rdx, %rdx
	movzbl	%al, %r12d
	movl	%r12d, %ebp
	movzbl	%r12b, %r14d
	je	.L1870
	xorl	%eax, %eax
	xorl	%r13d, %r13d
	.p2align 4,,10
.L1875:
	movq	%r13, %r8
	salq	$5, %r8
	addq	8(%rbx), %r8
	movzwl	16(%r8), %ecx
	cmpw	%cx, %r14w
	jb	.L1874
	movzwl	18(%r8), %r9d
	movzwl	%cx, %r10d
	addl	%r10d, %r9d
	cmpl	%r9d, %r12d
	jge	.L1874
	movl	%r14d, %edx
	subl	%ecx, %edx
	movq	24(%r8), %rcx
	movzwl	%dx, %edx
	call	*(%r8)
	movq	16(%rbx), %rdx
.L1874:
	addq	$1, %r13
	cmpq	%rdx, %r13
	jb	.L1875
	leal	1(%rbp), %r13d
	testq	%rdx, %rdx
	movzbl	%al, %edi
	movzbl	%r13b, %ebp
	movzbl	%r13b, %r13d
	je	.L1870
	xorl	%eax, %eax
	xorl	%r12d, %r12d
	.p2align 4,,10
.L1877:
	movq	%r12, %r8
	salq	$5, %r8
	addq	8(%rbx), %r8
	movzwl	16(%r8), %ecx
	cmpw	%cx, %r13w
	jb	.L1876
	movzwl	18(%r8), %r9d
	movzwl	%cx, %r10d
	addl	%r10d, %r9d
	cmpl	%r9d, %ebp
	jge	.L1876
	movl	%r13d, %edx
	subl	%ecx, %edx
	movq	24(%r8), %rcx
	movzwl	%dx, %edx
	call	*(%r8)
	movq	16(%rbx), %rdx
.L1876:
	addq	$1, %r12
	cmpq	%rdx, %r12
	jb	.L1877
	sall	$8, %eax
	addw	$1, 4(%rbx)
	orl	%edi, %eax
	testq	%rdx, %rdx
	movzwl	%ax, %edi
	movl	%edi, %r12d
	je	.L1878
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	.p2align 4,,10
.L1880:
	movq	%rbp, %r8
	salq	$5, %r8
	addq	8(%rbx), %r8
	movzwl	16(%r8), %ecx
	cmpw	%r12w, %cx
	ja	.L1879
	movzwl	18(%r8), %r9d
	movzwl	%cx, %r10d
	addl	%r10d, %r9d
	cmpl	%r9d, %edi
	jge	.L1879
	movl	%r12d, %edx
	subl	%ecx, %edx
	movq	24(%r8), %rcx
	movzwl	%dx, %edx
	call	*(%r8)
	movq	16(%rbx), %rdx
.L1879:
	addq	$1, %rbp
	cmpq	%rdx, %rbp
	jb	.L1880
	andl	%eax, %esi
	movzbl	6(%rbx), %edx
	testb	%sil, %sil
	movb	%sil, (%rbx)
	js	.L1899
	andl	$127, %edx
	testb	%sil, %sil
	movb	%dl, 6(%rbx)
	jne	.L1882
.L1884:
	orl	$2, %edx
.L1883:
	movl	$6, %eax
	movb	%dl, 6(%rbx)
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	ret
	.p2align 4,,10
.L1899:
	orl	$-128, %edx
.L1882:
	andl	$-3, %edx
	jmp	.L1883
	.p2align 4,,10
.L1870:
	addw	$1, 4(%rbx)
.L1878:
	movzbl	6(%rbx), %edx
	movb	$0, (%rbx)
	andl	$127, %edx
	jmp	.L1884
	.seh_endproc
	.p2align 4,,15
	.globl	AND_imm
	.def	AND_imm;	.scl	2;	.type	32;	.endef
	.seh_proc	AND_imm
AND_imm:
	pushq	%r12
	.seh_pushreg	%r12
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movzwl	4(%rcx), %edi
	movq	16(%rcx), %r9
	movq	%rcx, %rbp
	movzbl	(%rcx), %esi
	testq	%r9, %r9
	leal	1(%rdi), %eax
	movl	%edi, %r12d
	movw	%ax, 4(%rcx)
	je	.L1901
	xorl	%eax, %eax
	xorl	%ebx, %ebx
	.p2align 4,,10
.L1903:
	movq	%rbx, %r8
	salq	$5, %r8
	addq	8(%rbp), %r8
	movzwl	16(%r8), %edx
	cmpw	%dx, %r12w
	jb	.L1902
	movzwl	18(%r8), %ecx
	movzwl	%dx, %r10d
	addl	%r10d, %ecx
	cmpl	%ecx, %edi
	jge	.L1902
	movl	%r12d, %eax
	movq	24(%r8), %rcx
	subl	%edx, %eax
	movzwl	%ax, %edx
	call	*(%r8)
	movq	16(%rbp), %r9
.L1902:
	addq	$1, %rbx
	cmpq	%r9, %rbx
	jb	.L1903
	andl	%eax, %esi
	movzbl	6(%rbp), %edx
	testb	%sil, %sil
	movb	%sil, 0(%rbp)
	js	.L1910
	andl	$127, %edx
	testb	%sil, %sil
	movb	%dl, 6(%rbp)
	jne	.L1905
.L1907:
	orl	$2, %edx
.L1906:
	movl	$2, %eax
	movb	%dl, 6(%rbp)
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	ret
	.p2align 4,,10
.L1910:
	orl	$-128, %edx
.L1905:
	andl	$-3, %edx
	jmp	.L1906
	.p2align 4,,10
.L1901:
	movzbl	6(%rcx), %edx
	movb	$0, (%rcx)
	andl	$127, %edx
	jmp	.L1907
	.seh_endproc
	.p2align 4,,15
	.globl	AND_absx
	.def	AND_absx;	.scl	2;	.type	32;	.endef
	.seh_proc	AND_absx
AND_absx:
	pushq	%r13
	.seh_pushreg	%r13
	pushq	%r12
	.seh_pushreg	%r12
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
	movzwl	4(%rcx), %ebp
	movq	16(%rcx), %r9
	movq	%rcx, %rbx
	movzbl	(%rcx), %esi
	testq	%r9, %r9
	movl	%ebp, %r12d
	je	.L1912
	xorl	%eax, %eax
	xorl	%r13d, %r13d
	.p2align 4,,10
.L1914:
	movq	%r13, %r8
	salq	$5, %r8
	addq	8(%rbx), %r8
	movzwl	16(%r8), %edx
	cmpw	%dx, %r12w
	jb	.L1913
	movzwl	18(%r8), %ecx
	movzwl	%dx, %r10d
	addl	%r10d, %ecx
	cmpl	%ecx, %ebp
	jge	.L1913
	movl	%r12d, %eax
	movq	24(%r8), %rcx
	subl	%edx, %eax
	movzwl	%ax, %edx
	call	*(%r8)
	movq	16(%rbx), %r9
.L1913:
	addq	$1, %r13
	cmpq	%r9, %r13
	jb	.L1914
	movzwl	4(%rbx), %r12d
	testq	%r9, %r9
	movzbl	%al, %edi
	leal	1(%r12), %r13d
	movzwl	%r13w, %ebp
	je	.L1912
	xorl	%eax, %eax
	xorl	%r12d, %r12d
	.p2align 4,,10
.L1916:
	movq	%r12, %r8
	salq	$5, %r8
	addq	8(%rbx), %r8
	movzwl	16(%r8), %edx
	cmpw	%dx, %r13w
	jb	.L1915
	movzwl	18(%r8), %ecx
	movzwl	%dx, %r10d
	addl	%r10d, %ecx
	cmpl	%ecx, %ebp
	jge	.L1915
	movl	%r13d, %eax
	movq	24(%r8), %rcx
	subl	%edx, %eax
	movzwl	%ax, %edx
	call	*(%r8)
	movq	16(%rbx), %r9
.L1915:
	addq	$1, %r12
	cmpq	%r9, %r12
	jb	.L1916
	movzbl	1(%rbx), %r12d
	sall	$8, %eax
	addw	$2, 4(%rbx)
	orl	%eax, %edi
	addl	%edi, %r12d
	testq	%r9, %r9
	movzwl	%r12w, %edi
	je	.L1917
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	.p2align 4,,10
.L1919:
	movq	%rbp, %r8
	salq	$5, %r8
	addq	8(%rbx), %r8
	movzwl	16(%r8), %edx
	cmpw	%r12w, %dx
	ja	.L1918
	movzwl	18(%r8), %ecx
	movzwl	%dx, %r10d
	addl	%r10d, %ecx
	cmpl	%ecx, %edi
	jge	.L1918
	movl	%r12d, %eax
	movq	24(%r8), %rcx
	subl	%edx, %eax
	movzwl	%ax, %edx
	call	*(%r8)
	movq	16(%rbx), %r9
.L1918:
	addq	$1, %rbp
	cmpq	%r9, %rbp
	jb	.L1919
	andl	%eax, %esi
	movzbl	6(%rbx), %edx
	testb	%sil, %sil
	movb	%sil, (%rbx)
	js	.L1937
	andl	$127, %edx
	testb	%sil, %sil
	movb	%dl, 6(%rbx)
	jne	.L1921
.L1923:
	orl	$2, %edx
.L1922:
	movl	$4, %eax
	movb	%dl, 6(%rbx)
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	ret
	.p2align 4,,10
.L1937:
	orl	$-128, %edx
.L1921:
	andl	$-3, %edx
	jmp	.L1922
	.p2align 4,,10
.L1912:
	leal	2(%r12), %eax
	movw	%ax, 4(%rbx)
.L1917:
	movzbl	6(%rbx), %edx
	movb	$0, (%rbx)
	andl	$127, %edx
	jmp	.L1923
	.seh_endproc
	.p2align 4,,15
	.globl	ORA_absy
	.def	ORA_absy;	.scl	2;	.type	32;	.endef
	.seh_proc	ORA_absy
ORA_absy:
	pushq	%r13
	.seh_pushreg	%r13
	pushq	%r12
	.seh_pushreg	%r12
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
	movzwl	4(%rcx), %ebp
	movq	16(%rcx), %r9
	movq	%rcx, %rbx
	movzbl	(%rcx), %esi
	testq	%r9, %r9
	movl	%ebp, %r12d
	je	.L1939
	xorl	%eax, %eax
	xorl	%r13d, %r13d
	.p2align 4,,10
.L1941:
	movq	%r13, %r8
	salq	$5, %r8
	addq	8(%rbx), %r8
	movzwl	16(%r8), %edx
	cmpw	%dx, %r12w
	jb	.L1940
	movzwl	18(%r8), %ecx
	movzwl	%dx, %r10d
	addl	%r10d, %ecx
	cmpl	%ecx, %ebp
	jge	.L1940
	movl	%r12d, %eax
	movq	24(%r8), %rcx
	subl	%edx, %eax
	movzwl	%ax, %edx
	call	*(%r8)
	movq	16(%rbx), %r9
.L1940:
	addq	$1, %r13
	cmpq	%r9, %r13
	jb	.L1941
	movzwl	4(%rbx), %r12d
	testq	%r9, %r9
	movzbl	%al, %edi
	leal	1(%r12), %r13d
	movzwl	%r13w, %ebp
	je	.L1939
	xorl	%eax, %eax
	xorl	%r12d, %r12d
	.p2align 4,,10
.L1943:
	movq	%r12, %r8
	salq	$5, %r8
	addq	8(%rbx), %r8
	movzwl	16(%r8), %edx
	cmpw	%dx, %r13w
	jb	.L1942
	movzwl	18(%r8), %ecx
	movzwl	%dx, %r10d
	addl	%r10d, %ecx
	cmpl	%ecx, %ebp
	jge	.L1942
	movl	%r13d, %eax
	movq	24(%r8), %rcx
	subl	%edx, %eax
	movzwl	%ax, %edx
	call	*(%r8)
	movq	16(%rbx), %r9
.L1942:
	addq	$1, %r12
	cmpq	%r9, %r12
	jb	.L1943
	movzbl	2(%rbx), %r12d
	sall	$8, %eax
	addw	$2, 4(%rbx)
	orl	%eax, %edi
	addl	%edi, %r12d
	testq	%r9, %r9
	movzwl	%r12w, %edi
	je	.L1944
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	.p2align 4,,10
.L1946:
	movq	%rbp, %r8
	salq	$5, %r8
	addq	8(%rbx), %r8
	movzwl	16(%r8), %edx
	cmpw	%r12w, %dx
	ja	.L1945
	movzwl	18(%r8), %ecx
	movzwl	%dx, %r10d
	addl	%r10d, %ecx
	cmpl	%ecx, %edi
	jge	.L1945
	movl	%r12d, %eax
	movq	24(%r8), %rcx
	subl	%edx, %eax
	movzwl	%ax, %edx
	call	*(%r8)
	movq	16(%rbx), %r9
.L1945:
	addq	$1, %rbp
	cmpq	%r9, %rbp
	jb	.L1946
	orl	%eax, %esi
.L1944:
	testb	%sil, %sil
	movb	%sil, (%rbx)
	movzbl	6(%rbx), %eax
	js	.L1963
	andl	$127, %eax
	testb	%sil, %sil
	movb	%al, 6(%rbx)
	jne	.L1948
	orl	$2, %eax
	jmp	.L1949
	.p2align 4,,10
.L1963:
	orl	$-128, %eax
.L1948:
	andl	$-3, %eax
.L1949:
	movb	%al, 6(%rbx)
	movl	$4, %eax
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	ret
	.p2align 4,,10
.L1939:
	leal	2(%r12), %eax
	movw	%ax, 4(%rbx)
	jmp	.L1944
	.seh_endproc
	.section .rdata,"dr"
.LC0:
	.ascii "CREATED CPU\12\0"
	.text
	.p2align 4,,15
	.globl	createCpu
	.def	createCpu;	.scl	2;	.type	32;	.endef
	.seh_proc	createCpu
createCpu:
	subq	$40, %rsp
	.seh_stackalloc	40
	.seh_endprologue
	movabsq	$10273836649938944, %rax
	movq	%rax, (%rcx)
	movq	$0, 8(%rcx)
	movq	$0, 16(%rcx)
	call	*__imp___iob_func(%rip)
	leaq	.LC0(%rip), %rcx
	leaq	48(%rax), %r9
	movl	$12, %r8d
	movl	$1, %edx
	addq	$40, %rsp
	jmp	fwrite
	.seh_endproc
	.p2align 4,,15
	.globl	add_mos6502_device
	.def	add_mos6502_device;	.scl	2;	.type	32;	.endef
	.seh_proc	add_mos6502_device
add_mos6502_device:
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$40, %rsp
	.seh_stackalloc	40
	.seh_endprologue
	movq	16(%rcx), %rax
	movq	%rdx, %rsi
	movq	%rcx, %rbx
	leaq	1(%rax), %rdx
	movq	%rdx, 16(%rcx)
	movq	8(%rcx), %rcx
	salq	$5, %rdx
	call	realloc
	testq	%rax, %rax
	je	.L1968
	movq	16(%rbx), %rdx
	movq	%rax, 8(%rbx)
	movq	(%rsi), %rcx
	movq	8(%rsi), %rbx
	salq	$5, %rdx
	addq	%rdx, %rax
	movq	%rcx, -32(%rax)
	movq	%rbx, -24(%rax)
	movq	16(%rsi), %rcx
	movq	24(%rsi), %rbx
	movq	%rcx, -16(%rax)
	movq	%rbx, -8(%rax)
	movl	$1, %eax
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	ret
	.p2align 4,,10
.L1968:
	movq	8(%rbx), %rcx
	call	free
	xorl	%eax, %eax
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	ret
	.seh_endproc
	.p2align 4,,15
	.globl	read_mos6502
	.def	read_mos6502;	.scl	2;	.type	32;	.endef
	.seh_proc	read_mos6502
read_mos6502:
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
	movq	16(%rcx), %r9
	movq	%rcx, %rbp
	movl	%edx, %esi
	testq	%r9, %r9
	je	.L1973
	xorl	%ebx, %ebx
	xorl	%eax, %eax
	movzwl	%dx, %edi
	.p2align 4,,10
.L1972:
	movq	%rbx, %r8
	salq	$5, %r8
	addq	8(%rbp), %r8
	movzwl	16(%r8), %ecx
	cmpw	%si, %cx
	ja	.L1971
	movzwl	18(%r8), %edx
	movzwl	%cx, %r10d
	addl	%r10d, %edx
	cmpl	%edi, %edx
	jle	.L1971
	movl	%esi, %edx
	subl	%ecx, %edx
	movq	24(%r8), %rcx
	movzwl	%dx, %edx
	call	*(%r8)
	movq	16(%rbp), %r9
.L1971:
	addq	$1, %rbx
	cmpq	%r9, %rbx
	jb	.L1972
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	ret
	.p2align 4,,10
.L1973:
	xorl	%eax, %eax
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	ret
	.seh_endproc
	.p2align 4,,15
	.globl	RTI
	.def	RTI;	.scl	2;	.type	32;	.endef
	.seh_proc	RTI
RTI:
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movzbl	3(%rcx), %eax
	movq	%rcx, %rbx
	addl	$1, %eax
	movb	%al, 3(%rcx)
	movzbl	%al, %eax
	leal	256(%rax), %edx
	call	read_mos6502
	orl	$32, %eax
	movq	%rbx, %rcx
	movb	%al, 6(%rbx)
	movzbl	3(%rbx), %eax
	addl	$1, %eax
	movb	%al, 3(%rbx)
	movzbl	%al, %eax
	leal	256(%rax), %edx
	call	read_mos6502
	movzbl	%al, %eax
	movq	%rbx, %rcx
	movw	%ax, 4(%rbx)
	movzbl	3(%rbx), %eax
	addl	$1, %eax
	movb	%al, 3(%rbx)
	movzbl	%al, %eax
	leal	256(%rax), %edx
	call	read_mos6502
	sall	$8, %eax
	addw	%ax, 4(%rbx)
	movl	$6, %eax
	addq	$32, %rsp
	popq	%rbx
	ret
	.seh_endproc
	.p2align 4,,15
	.globl	ADC_imm
	.def	ADC_imm;	.scl	2;	.type	32;	.endef
	.seh_proc	ADC_imm
ADC_imm:
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movzwl	4(%rcx), %edx
	movq	%rcx, %rbx
	leal	1(%rdx), %eax
	movw	%ax, 4(%rcx)
	call	read_mos6502
	movzbl	6(%rbx), %edx
	movzbl	(%rbx), %ecx
	movl	%edx, %r8d
	movl	%ecx, %r9d
	andl	$1, %r8d
	xorl	%eax, %r9d
	addl	%ecx, %r8d
	movzbl	%al, %ecx
	notl	%r9d
	addl	%r8d, %ecx
	movl	%edx, %r8d
	andl	$127, %edx
	orl	$-128, %r8d
	testb	$-128, %cl
	movb	%cl, (%rbx)
	cmovne	%r8d, %edx
	movl	%edx, %r8d
	andl	$-3, %edx
	orl	$2, %r8d
	testb	%cl, %cl
	cmove	%r8d, %edx
	movl	%edx, %r8d
	andl	$-2, %edx
	orl	$1, %r8d
	testb	$1, %ch
	cmovne	%r8d, %edx
	xorl	%ecx, %eax
	movl	%edx, %ecx
	andl	$-65, %edx
	orl	$64, %ecx
	testb	%r9b, %al
	movl	$2, %eax
	cmovs	%ecx, %edx
	movb	%dl, 6(%rbx)
	addq	$32, %rsp
	popq	%rbx
	ret
	.seh_endproc
	.p2align 4,,15
	.globl	SBC_imm
	.def	SBC_imm;	.scl	2;	.type	32;	.endef
	.seh_proc	SBC_imm
SBC_imm:
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movzwl	4(%rcx), %edx
	movq	%rcx, %rbx
	leal	1(%rdx), %eax
	movw	%ax, 4(%rcx)
	call	read_mos6502
	movzbl	6(%rbx), %edx
	movzbl	(%rbx), %r8d
	movl	%edx, %ecx
	movl	%r8d, %r9d
	andl	$1, %ecx
	addl	%ecx, %r8d
	movl	%eax, %ecx
	notl	%ecx
	movzbl	%cl, %ecx
	addl	%r8d, %ecx
	movl	%edx, %r8d
	andl	$127, %edx
	orl	$-128, %r8d
	testb	$-128, %cl
	cmovne	%r8d, %edx
	movl	%edx, %r8d
	andl	$-3, %edx
	orl	$2, %r8d
	testb	%cl, %cl
	cmove	%r8d, %edx
	movl	%edx, %r8d
	andl	$-2, %edx
	orl	$1, %r8d
	testb	$1, %ch
	cmovne	%r8d, %edx
	xorl	%r8d, %r8d
	cmpb	%cl, %r9b
	setl	%r8b
	testb	%al, %al
	jns	.L1993
	xorl	%r8d, %r8d
	cmpb	%cl, %r9b
	setg	%r8b
.L1993:
	movl	%edx, %eax
	andl	$-65, %edx
	movb	%cl, (%rbx)
	orl	$64, %eax
	testl	%r8d, %r8d
	cmovne	%eax, %edx
	movl	$2, %eax
	movb	%dl, 6(%rbx)
	addq	$32, %rsp
	popq	%rbx
	ret
	.seh_endproc
	.p2align 4,,15
	.globl	ORA_zpg
	.def	ORA_zpg;	.scl	2;	.type	32;	.endef
	.seh_proc	ORA_zpg
ORA_zpg:
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$40, %rsp
	.seh_stackalloc	40
	.seh_endprologue
	movzwl	4(%rcx), %edx
	movzbl	(%rcx), %esi
	movq	%rcx, %rbx
	call	read_mos6502
	addw	$1, 4(%rbx)
	movzbl	%al, %edx
	movq	%rbx, %rcx
	call	read_mos6502
	orl	%esi, %eax
	movzbl	6(%rbx), %edx
	testb	%al, %al
	movb	%al, (%rbx)
	js	.L2000
	andl	$127, %edx
	testb	%al, %al
	movb	%dl, 6(%rbx)
	jne	.L1998
	orl	$2, %edx
	movl	$3, %eax
	movb	%dl, 6(%rbx)
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	ret
	.p2align 4,,10
.L2000:
	orl	$-128, %edx
.L1998:
	andl	$-3, %edx
	movl	$3, %eax
	movb	%dl, 6(%rbx)
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	ret
	.seh_endproc
	.p2align 4,,15
	.globl	BIT_zpg
	.def	BIT_zpg;	.scl	2;	.type	32;	.endef
	.seh_proc	BIT_zpg
BIT_zpg:
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movzwl	4(%rcx), %edx
	movq	%rcx, %rbx
	call	read_mos6502
	addw	$1, 4(%rbx)
	movzbl	%al, %edx
	movq	%rbx, %rcx
	call	read_mos6502
	testb	%al, (%rbx)
	movzbl	6(%rbx), %edx
	je	.L2004
	andl	$-3, %edx
.L2003:
	andl	$63, %edx
	andl	$-64, %eax
	orl	%edx, %eax
	movb	%al, 6(%rbx)
	movl	$3, %eax
	addq	$32, %rsp
	popq	%rbx
	ret
	.p2align 4,,10
.L2004:
	orl	$2, %edx
	jmp	.L2003
	.seh_endproc
	.p2align 4,,15
	.globl	AND_zpg
	.def	AND_zpg;	.scl	2;	.type	32;	.endef
	.seh_proc	AND_zpg
AND_zpg:
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$40, %rsp
	.seh_stackalloc	40
	.seh_endprologue
	movzwl	4(%rcx), %edx
	movzbl	(%rcx), %esi
	movq	%rcx, %rbx
	call	read_mos6502
	addw	$1, 4(%rbx)
	movzbl	%al, %edx
	movq	%rbx, %rcx
	call	read_mos6502
	andl	%esi, %eax
	movzbl	6(%rbx), %edx
	testb	%al, %al
	movb	%al, (%rbx)
	js	.L2009
	andl	$127, %edx
	testb	%al, %al
	movb	%dl, 6(%rbx)
	jne	.L2007
	orl	$2, %edx
	movl	$3, %eax
	movb	%dl, 6(%rbx)
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	ret
	.p2align 4,,10
.L2009:
	orl	$-128, %edx
.L2007:
	andl	$-3, %edx
	movl	$3, %eax
	movb	%dl, 6(%rbx)
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	ret
	.seh_endproc
	.p2align 4,,15
	.globl	EOR_zpg
	.def	EOR_zpg;	.scl	2;	.type	32;	.endef
	.seh_proc	EOR_zpg
EOR_zpg:
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movzwl	4(%rcx), %edx
	movq	%rcx, %rbx
	call	read_mos6502
	addw	$1, 4(%rbx)
	movzbl	%al, %edx
	movq	%rbx, %rcx
	call	read_mos6502
	movzbl	(%rbx), %ecx
	movl	%ecx, %edx
	xorl	%eax, %edx
	testb	%dl, %dl
	movb	%dl, (%rbx)
	movzbl	6(%rbx), %edx
	js	.L2015
	andl	$127, %edx
.L2012:
	movl	%edx, %r8d
	andl	$-3, %edx
	orl	$2, %r8d
	cmpb	%al, %cl
	movl	$3, %eax
	cmove	%r8d, %edx
	movb	%dl, 6(%rbx)
	addq	$32, %rsp
	popq	%rbx
	ret
	.p2align 4,,10
.L2015:
	orl	$-128, %edx
	jmp	.L2012
	.seh_endproc
	.p2align 4,,15
	.globl	ADC_zpg
	.def	ADC_zpg;	.scl	2;	.type	32;	.endef
	.seh_proc	ADC_zpg
ADC_zpg:
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movzwl	4(%rcx), %edx
	movq	%rcx, %rbx
	call	read_mos6502
	addw	$1, 4(%rbx)
	movq	%rbx, %rcx
	movzbl	%al, %edx
	call	read_mos6502
	movzbl	6(%rbx), %edx
	movzbl	(%rbx), %ecx
	movl	%edx, %r8d
	movl	%ecx, %r9d
	andl	$1, %r8d
	xorl	%eax, %r9d
	addl	%ecx, %r8d
	movzbl	%al, %ecx
	notl	%r9d
	addl	%r8d, %ecx
	movl	%edx, %r8d
	andl	$127, %edx
	orl	$-128, %r8d
	testb	$-128, %cl
	movb	%cl, (%rbx)
	cmovne	%r8d, %edx
	movl	%edx, %r8d
	andl	$-3, %edx
	orl	$2, %r8d
	testb	%cl, %cl
	cmove	%r8d, %edx
	movl	%edx, %r8d
	andl	$-2, %edx
	orl	$1, %r8d
	testb	$1, %ch
	cmovne	%r8d, %edx
	xorl	%ecx, %eax
	movl	%edx, %ecx
	andl	$-65, %edx
	orl	$64, %ecx
	testb	%r9b, %al
	movl	$3, %eax
	cmovs	%ecx, %edx
	movb	%dl, 6(%rbx)
	addq	$32, %rsp
	popq	%rbx
	ret
	.seh_endproc
	.p2align 4,,15
	.globl	SBC_zpg
	.def	SBC_zpg;	.scl	2;	.type	32;	.endef
	.seh_proc	SBC_zpg
SBC_zpg:
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movzwl	4(%rcx), %edx
	movq	%rcx, %rbx
	call	read_mos6502
	addw	$1, 4(%rbx)
	movzbl	%al, %edx
	movq	%rbx, %rcx
	call	read_mos6502
	movzbl	6(%rbx), %edx
	movzbl	(%rbx), %r8d
	movl	%edx, %ecx
	movl	%r8d, %r9d
	andl	$1, %ecx
	addl	%ecx, %r8d
	movl	%eax, %ecx
	notl	%ecx
	movzbl	%cl, %ecx
	addl	%r8d, %ecx
	movl	%edx, %r8d
	andl	$127, %edx
	orl	$-128, %r8d
	testb	$-128, %cl
	cmovne	%r8d, %edx
	movl	%edx, %r8d
	andl	$-3, %edx
	orl	$2, %r8d
	testb	%cl, %cl
	cmove	%r8d, %edx
	movl	%edx, %r8d
	andl	$-2, %edx
	orl	$1, %r8d
	testb	$1, %ch
	cmovne	%r8d, %edx
	xorl	%r8d, %r8d
	cmpb	%cl, %r9b
	setl	%r8b
	testb	%al, %al
	jns	.L2033
	xorl	%r8d, %r8d
	cmpb	%cl, %r9b
	setg	%r8b
.L2033:
	movl	%edx, %eax
	andl	$-65, %edx
	movb	%cl, (%rbx)
	orl	$64, %eax
	testl	%r8d, %r8d
	cmovne	%eax, %edx
	movl	$3, %eax
	movb	%dl, 6(%rbx)
	addq	$32, %rsp
	popq	%rbx
	ret
	.seh_endproc
	.p2align 4,,15
	.globl	LDA_zpg
	.def	LDA_zpg;	.scl	2;	.type	32;	.endef
	.seh_proc	LDA_zpg
LDA_zpg:
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movzwl	4(%rcx), %edx
	movq	%rcx, %rbx
	call	read_mos6502
	addw	$1, 4(%rbx)
	movzbl	%al, %edx
	movq	%rbx, %rcx
	call	read_mos6502
	testb	%al, %al
	movb	%al, (%rbx)
	movzbl	6(%rbx), %edx
	js	.L2040
	andl	$127, %edx
	testb	%al, %al
	movb	%dl, 6(%rbx)
	jne	.L2038
	orl	$2, %edx
	movl	$3, %eax
	movb	%dl, 6(%rbx)
	addq	$32, %rsp
	popq	%rbx
	ret
	.p2align 4,,10
.L2040:
	orl	$-128, %edx
.L2038:
	andl	$-3, %edx
	movl	$3, %eax
	movb	%dl, 6(%rbx)
	addq	$32, %rsp
	popq	%rbx
	ret
	.seh_endproc
	.p2align 4,,15
	.globl	LDX_zpg
	.def	LDX_zpg;	.scl	2;	.type	32;	.endef
	.seh_proc	LDX_zpg
LDX_zpg:
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movzwl	4(%rcx), %edx
	movq	%rcx, %rbx
	call	read_mos6502
	addw	$1, 4(%rbx)
	movzbl	%al, %edx
	movq	%rbx, %rcx
	call	read_mos6502
	testb	%al, %al
	movb	%al, 1(%rbx)
	movzbl	6(%rbx), %edx
	js	.L2045
	andl	$127, %edx
	testb	%al, %al
	movb	%dl, 6(%rbx)
	jne	.L2043
	orl	$2, %edx
	movl	$3, %eax
	movb	%dl, 6(%rbx)
	addq	$32, %rsp
	popq	%rbx
	ret
	.p2align 4,,10
.L2045:
	orl	$-128, %edx
.L2043:
	andl	$-3, %edx
	movl	$3, %eax
	movb	%dl, 6(%rbx)
	addq	$32, %rsp
	popq	%rbx
	ret
	.seh_endproc
	.p2align 4,,15
	.globl	LDY_zpg
	.def	LDY_zpg;	.scl	2;	.type	32;	.endef
	.seh_proc	LDY_zpg
LDY_zpg:
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movzwl	4(%rcx), %edx
	movq	%rcx, %rbx
	call	read_mos6502
	addw	$1, 4(%rbx)
	movzbl	%al, %edx
	movq	%rbx, %rcx
	call	read_mos6502
	testb	%al, %al
	movb	%al, 2(%rbx)
	movzbl	6(%rbx), %edx
	js	.L2050
	andl	$127, %edx
	testb	%al, %al
	movb	%dl, 6(%rbx)
	jne	.L2048
	orl	$2, %edx
	movl	$3, %eax
	movb	%dl, 6(%rbx)
	addq	$32, %rsp
	popq	%rbx
	ret
	.p2align 4,,10
.L2050:
	orl	$-128, %edx
.L2048:
	andl	$-3, %edx
	movl	$3, %eax
	movb	%dl, 6(%rbx)
	addq	$32, %rsp
	popq	%rbx
	ret
	.seh_endproc
	.p2align 4,,15
	.globl	LAX_zpg
	.def	LAX_zpg;	.scl	2;	.type	32;	.endef
	.seh_proc	LAX_zpg
LAX_zpg:
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movzwl	4(%rcx), %edx
	movq	%rcx, %rbx
	call	read_mos6502
	addw	$1, 4(%rbx)
	movzbl	%al, %edx
	movq	%rbx, %rcx
	call	read_mos6502
	testb	%al, %al
	movb	%al, (%rbx)
	movb	%al, 1(%rbx)
	movzbl	6(%rbx), %edx
	js	.L2055
	andl	$127, %edx
	testb	%al, %al
	movb	%dl, 6(%rbx)
	jne	.L2053
	orl	$2, %edx
	movl	$3, %eax
	movb	%dl, 6(%rbx)
	addq	$32, %rsp
	popq	%rbx
	ret
	.p2align 4,,10
.L2055:
	orl	$-128, %edx
.L2053:
	andl	$-3, %edx
	movl	$3, %eax
	movb	%dl, 6(%rbx)
	addq	$32, %rsp
	popq	%rbx
	ret
	.seh_endproc
	.p2align 4,,15
	.globl	ORA_zpgx
	.def	ORA_zpgx;	.scl	2;	.type	32;	.endef
	.seh_proc	ORA_zpgx
ORA_zpgx:
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$40, %rsp
	.seh_stackalloc	40
	.seh_endprologue
	movzwl	4(%rcx), %edx
	movzbl	(%rcx), %esi
	movq	%rcx, %rbx
	call	read_mos6502
	addb	1(%rbx), %al
	addw	$1, 4(%rbx)
	movq	%rbx, %rcx
	movzbl	%al, %edx
	call	read_mos6502
	orl	%esi, %eax
	movzbl	6(%rbx), %edx
	testb	%al, %al
	movb	%al, (%rbx)
	js	.L2060
	andl	$127, %edx
	testb	%al, %al
	movb	%dl, 6(%rbx)
	jne	.L2058
	orl	$2, %edx
	movl	$4, %eax
	movb	%dl, 6(%rbx)
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	ret
	.p2align 4,,10
.L2060:
	orl	$-128, %edx
.L2058:
	andl	$-3, %edx
	movl	$4, %eax
	movb	%dl, 6(%rbx)
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	ret
	.seh_endproc
	.p2align 4,,15
	.globl	AND_zpgx
	.def	AND_zpgx;	.scl	2;	.type	32;	.endef
	.seh_proc	AND_zpgx
AND_zpgx:
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$40, %rsp
	.seh_stackalloc	40
	.seh_endprologue
	movzwl	4(%rcx), %edx
	movzbl	(%rcx), %esi
	movq	%rcx, %rbx
	call	read_mos6502
	addb	1(%rbx), %al
	addw	$1, 4(%rbx)
	movq	%rbx, %rcx
	movzbl	%al, %edx
	call	read_mos6502
	andl	%esi, %eax
	movzbl	6(%rbx), %edx
	testb	%al, %al
	movb	%al, (%rbx)
	js	.L2065
	andl	$127, %edx
	testb	%al, %al
	movb	%dl, 6(%rbx)
	jne	.L2063
	orl	$2, %edx
	movl	$4, %eax
	movb	%dl, 6(%rbx)
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	ret
	.p2align 4,,10
.L2065:
	orl	$-128, %edx
.L2063:
	andl	$-3, %edx
	movl	$4, %eax
	movb	%dl, 6(%rbx)
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	ret
	.seh_endproc
	.p2align 4,,15
	.globl	EOR_zpgx
	.def	EOR_zpgx;	.scl	2;	.type	32;	.endef
	.seh_proc	EOR_zpgx
EOR_zpgx:
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movzwl	4(%rcx), %edx
	movq	%rcx, %rbx
	call	read_mos6502
	addb	1(%rbx), %al
	addw	$1, 4(%rbx)
	movq	%rbx, %rcx
	movzbl	%al, %edx
	call	read_mos6502
	movzbl	(%rbx), %ecx
	movl	%ecx, %edx
	xorl	%eax, %edx
	testb	%dl, %dl
	movb	%dl, (%rbx)
	movzbl	6(%rbx), %edx
	js	.L2071
	andl	$127, %edx
.L2068:
	movl	%edx, %r8d
	andl	$-3, %edx
	orl	$2, %r8d
	cmpb	%al, %cl
	movl	$4, %eax
	cmove	%r8d, %edx
	movb	%dl, 6(%rbx)
	addq	$32, %rsp
	popq	%rbx
	ret
	.p2align 4,,10
.L2071:
	orl	$-128, %edx
	jmp	.L2068
	.seh_endproc
	.p2align 4,,15
	.globl	ADC_zpgx
	.def	ADC_zpgx;	.scl	2;	.type	32;	.endef
	.seh_proc	ADC_zpgx
ADC_zpgx:
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movzwl	4(%rcx), %edx
	movq	%rcx, %rbx
	call	read_mos6502
	addb	1(%rbx), %al
	addw	$1, 4(%rbx)
	movq	%rbx, %rcx
	movzbl	%al, %edx
	call	read_mos6502
	movzbl	6(%rbx), %edx
	movzbl	(%rbx), %ecx
	movl	%edx, %r8d
	movl	%ecx, %r9d
	andl	$1, %r8d
	xorl	%eax, %r9d
	addl	%ecx, %r8d
	movzbl	%al, %ecx
	notl	%r9d
	addl	%r8d, %ecx
	movl	%edx, %r8d
	andl	$127, %edx
	orl	$-128, %r8d
	testb	$-128, %cl
	movb	%cl, (%rbx)
	cmovne	%r8d, %edx
	movl	%edx, %r8d
	andl	$-3, %edx
	orl	$2, %r8d
	testb	%cl, %cl
	cmove	%r8d, %edx
	movl	%edx, %r8d
	andl	$-2, %edx
	orl	$1, %r8d
	testb	$1, %ch
	cmovne	%r8d, %edx
	xorl	%ecx, %eax
	movl	%edx, %ecx
	andl	$-65, %edx
	orl	$64, %ecx
	testb	%r9b, %al
	movl	$4, %eax
	cmovs	%ecx, %edx
	movb	%dl, 6(%rbx)
	addq	$32, %rsp
	popq	%rbx
	ret
	.seh_endproc
	.p2align 4,,15
	.globl	SBC_zpgx
	.def	SBC_zpgx;	.scl	2;	.type	32;	.endef
	.seh_proc	SBC_zpgx
SBC_zpgx:
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movzwl	4(%rcx), %edx
	movq	%rcx, %rbx
	call	read_mos6502
	addb	1(%rbx), %al
	addw	$1, 4(%rbx)
	movq	%rbx, %rcx
	movzbl	%al, %edx
	call	read_mos6502
	movzbl	6(%rbx), %edx
	movzbl	(%rbx), %r8d
	movl	%edx, %ecx
	movl	%r8d, %r9d
	andl	$1, %ecx
	addl	%ecx, %r8d
	movl	%eax, %ecx
	notl	%ecx
	movzbl	%cl, %ecx
	addl	%r8d, %ecx
	movl	%edx, %r8d
	andl	$127, %edx
	orl	$-128, %r8d
	testb	$-128, %cl
	cmovne	%r8d, %edx
	movl	%edx, %r8d
	andl	$-3, %edx
	orl	$2, %r8d
	testb	%cl, %cl
	cmove	%r8d, %edx
	movl	%edx, %r8d
	andl	$-2, %edx
	orl	$1, %r8d
	testb	$1, %ch
	cmovne	%r8d, %edx
	xorl	%r8d, %r8d
	cmpb	%cl, %r9b
	setl	%r8b
	testb	%al, %al
	jns	.L2089
	xorl	%r8d, %r8d
	cmpb	%cl, %r9b
	setg	%r8b
.L2089:
	movl	%edx, %eax
	andl	$-65, %edx
	movb	%cl, (%rbx)
	orl	$64, %eax
	testl	%r8d, %r8d
	cmovne	%eax, %edx
	movl	$4, %eax
	movb	%dl, 6(%rbx)
	addq	$32, %rsp
	popq	%rbx
	ret
	.seh_endproc
	.p2align 4,,15
	.globl	LDA_zpgx
	.def	LDA_zpgx;	.scl	2;	.type	32;	.endef
	.seh_proc	LDA_zpgx
LDA_zpgx:
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movzwl	4(%rcx), %edx
	movq	%rcx, %rbx
	call	read_mos6502
	addb	1(%rbx), %al
	addw	$1, 4(%rbx)
	movq	%rbx, %rcx
	movzbl	%al, %edx
	call	read_mos6502
	testb	%al, %al
	movb	%al, (%rbx)
	movzbl	6(%rbx), %edx
	js	.L2096
	andl	$127, %edx
	testb	%al, %al
	movb	%dl, 6(%rbx)
	jne	.L2094
	orl	$2, %edx
	movl	$4, %eax
	movb	%dl, 6(%rbx)
	addq	$32, %rsp
	popq	%rbx
	ret
	.p2align 4,,10
.L2096:
	orl	$-128, %edx
.L2094:
	andl	$-3, %edx
	movl	$4, %eax
	movb	%dl, 6(%rbx)
	addq	$32, %rsp
	popq	%rbx
	ret
	.seh_endproc
	.p2align 4,,15
	.globl	LDY_zpgx
	.def	LDY_zpgx;	.scl	2;	.type	32;	.endef
	.seh_proc	LDY_zpgx
LDY_zpgx:
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movzwl	4(%rcx), %edx
	movq	%rcx, %rbx
	call	read_mos6502
	addb	1(%rbx), %al
	addw	$1, 4(%rbx)
	movq	%rbx, %rcx
	movzbl	%al, %edx
	call	read_mos6502
	testb	%al, %al
	movb	%al, 2(%rbx)
	movzbl	6(%rbx), %edx
	js	.L2101
	andl	$127, %edx
	testb	%al, %al
	movb	%dl, 6(%rbx)
	jne	.L2099
	orl	$2, %edx
	movl	$4, %eax
	movb	%dl, 6(%rbx)
	addq	$32, %rsp
	popq	%rbx
	ret
	.p2align 4,,10
.L2101:
	orl	$-128, %edx
.L2099:
	andl	$-3, %edx
	movl	$4, %eax
	movb	%dl, 6(%rbx)
	addq	$32, %rsp
	popq	%rbx
	ret
	.seh_endproc
	.p2align 4,,15
	.globl	LDX_zpgy
	.def	LDX_zpgy;	.scl	2;	.type	32;	.endef
	.seh_proc	LDX_zpgy
LDX_zpgy:
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movzwl	4(%rcx), %edx
	movq	%rcx, %rbx
	call	read_mos6502
	addb	2(%rbx), %al
	addw	$1, 4(%rbx)
	movq	%rbx, %rcx
	movzbl	%al, %edx
	call	read_mos6502
	testb	%al, %al
	movb	%al, 1(%rbx)
	movzbl	6(%rbx), %edx
	js	.L2106
	andl	$127, %edx
	testb	%al, %al
	movb	%dl, 6(%rbx)
	jne	.L2104
	orl	$2, %edx
	movl	$4, %eax
	movb	%dl, 6(%rbx)
	addq	$32, %rsp
	popq	%rbx
	ret
	.p2align 4,,10
.L2106:
	orl	$-128, %edx
.L2104:
	andl	$-3, %edx
	movl	$4, %eax
	movb	%dl, 6(%rbx)
	addq	$32, %rsp
	popq	%rbx
	ret
	.seh_endproc
	.p2align 4,,15
	.globl	LAX_zpgy
	.def	LAX_zpgy;	.scl	2;	.type	32;	.endef
	.seh_proc	LAX_zpgy
LAX_zpgy:
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movzwl	4(%rcx), %edx
	movq	%rcx, %rbx
	call	read_mos6502
	addb	2(%rbx), %al
	addw	$1, 4(%rbx)
	movq	%rbx, %rcx
	movzbl	%al, %edx
	call	read_mos6502
	testb	%al, %al
	movb	%al, (%rbx)
	movb	%al, 1(%rbx)
	movzbl	6(%rbx), %edx
	js	.L2111
	andl	$127, %edx
	testb	%al, %al
	movb	%dl, 6(%rbx)
	jne	.L2109
	orl	$2, %edx
	movl	$4, %eax
	movb	%dl, 6(%rbx)
	addq	$32, %rsp
	popq	%rbx
	ret
	.p2align 4,,10
.L2111:
	orl	$-128, %edx
.L2109:
	andl	$-3, %edx
	movl	$4, %eax
	movb	%dl, 6(%rbx)
	addq	$32, %rsp
	popq	%rbx
	ret
	.seh_endproc
	.p2align 4,,15
	.globl	ADC_absy
	.def	ADC_absy;	.scl	2;	.type	32;	.endef
	.seh_proc	ADC_absy
ADC_absy:
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$40, %rsp
	.seh_stackalloc	40
	.seh_endprologue
	movzwl	4(%rcx), %edx
	movq	%rcx, %rbx
	call	read_mos6502
	movzbl	%al, %esi
	movzwl	4(%rbx), %eax
	movq	%rbx, %rcx
	leal	1(%rax), %edx
	movzwl	%dx, %edx
	call	read_mos6502
	movl	%eax, %edx
	movzbl	2(%rbx), %eax
	addw	$2, 4(%rbx)
	sall	$8, %edx
	movq	%rbx, %rcx
	orl	%esi, %edx
	addl	%eax, %edx
	movzwl	%dx, %edx
	call	read_mos6502
	movzbl	6(%rbx), %edx
	movzbl	(%rbx), %ecx
	movl	%edx, %r8d
	movl	%ecx, %r9d
	andl	$1, %r8d
	xorl	%eax, %r9d
	addl	%ecx, %r8d
	movzbl	%al, %ecx
	notl	%r9d
	addl	%r8d, %ecx
	movl	%edx, %r8d
	andl	$127, %edx
	orl	$-128, %r8d
	testb	$-128, %cl
	movb	%cl, (%rbx)
	cmovne	%r8d, %edx
	movl	%edx, %r8d
	andl	$-3, %edx
	orl	$2, %r8d
	testb	%cl, %cl
	cmove	%r8d, %edx
	movl	%edx, %r8d
	andl	$-2, %edx
	orl	$1, %r8d
	testb	$1, %ch
	cmovne	%r8d, %edx
	xorl	%ecx, %eax
	movl	%edx, %ecx
	andl	$-65, %edx
	orl	$64, %ecx
	testb	%r9b, %al
	movl	$4, %eax
	cmovs	%ecx, %edx
	movb	%dl, 6(%rbx)
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	ret
	.seh_endproc
	.p2align 4,,15
	.globl	SBC_absy
	.def	SBC_absy;	.scl	2;	.type	32;	.endef
	.seh_proc	SBC_absy
SBC_absy:
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$40, %rsp
	.seh_stackalloc	40
	.seh_endprologue
	movzwl	4(%rcx), %edx
	movq	%rcx, %rbx
	call	read_mos6502
	movzbl	%al, %esi
	movzwl	4(%rbx), %eax
	movq	%rbx, %rcx
	leal	1(%rax), %edx
	movzwl	%dx, %edx
	call	read_mos6502
	movl	%eax, %edx
	movzbl	2(%rbx), %eax
	addw	$2, 4(%rbx)
	sall	$8, %edx
	movq	%rbx, %rcx
	orl	%esi, %edx
	addl	%eax, %edx
	movzwl	%dx, %edx
	call	read_mos6502
	movzbl	6(%rbx), %edx
	movzbl	(%rbx), %r8d
	movl	%edx, %ecx
	movl	%r8d, %r9d
	andl	$1, %ecx
	addl	%ecx, %r8d
	movl	%eax, %ecx
	notl	%ecx
	movzbl	%cl, %ecx
	addl	%r8d, %ecx
	movl	%edx, %r8d
	andl	$127, %edx
	orl	$-128, %r8d
	testb	$-128, %cl
	cmovne	%r8d, %edx
	movl	%edx, %r8d
	andl	$-3, %edx
	orl	$2, %r8d
	testb	%cl, %cl
	cmove	%r8d, %edx
	movl	%edx, %r8d
	andl	$-2, %edx
	orl	$1, %r8d
	testb	$1, %ch
	cmovne	%r8d, %edx
	xorl	%r8d, %r8d
	cmpb	%cl, %r9b
	setl	%r8b
	testb	%al, %al
	jns	.L2129
	xorl	%r8d, %r8d
	cmpb	%cl, %r9b
	setg	%r8b
.L2129:
	movl	%edx, %eax
	andl	$-65, %edx
	movb	%cl, (%rbx)
	orl	$64, %eax
	testl	%r8d, %r8d
	cmovne	%eax, %edx
	movl	$4, %eax
	movb	%dl, 6(%rbx)
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	ret
	.seh_endproc
	.p2align 4,,15
	.globl	DEC_abss
	.def	DEC_abss;	.scl	2;	.type	32;	.endef
	.seh_proc	DEC_abss
DEC_abss:
	pushq	%r13
	.seh_pushreg	%r13
	pushq	%r12
	.seh_pushreg	%r12
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
	movzwl	4(%rcx), %edx
	movq	%rcx, %r12
	call	read_mos6502
	movzbl	%al, %ebx
	movzwl	4(%r12), %eax
	movq	%r12, %rcx
	leal	1(%rax), %edx
	movzwl	%dx, %edx
	call	read_mos6502
	movl	%eax, %r13d
	addw	$2, 4(%r12)
	movq	%r12, %rcx
	sall	$8, %r13d
	orl	%ebx, %r13d
	movzwl	%r13w, %esi
	movl	%esi, %edx
	call	read_mos6502
	leal	-1(%rax), %ebx
	movq	16(%r12), %rax
	movzbl	%bl, %edi
	testq	%rax, %rax
	je	.L2133
	xorl	%ebp, %ebp
	.p2align 4,,10
.L2135:
	movq	%rbp, %r9
	salq	$5, %r9
	addq	8(%r12), %r9
	movzwl	16(%r9), %edx
	cmpw	%r13w, %dx
	ja	.L2134
	movzwl	18(%r9), %ecx
	movzwl	%dx, %r8d
	addl	%r8d, %ecx
	cmpl	%ecx, %esi
	jge	.L2134
	movl	%r13d, %eax
	movq	24(%r9), %rcx
	movl	%edi, %r8d
	subl	%edx, %eax
	movzwl	%ax, %edx
	call	*8(%r9)
	movq	16(%r12), %rax
.L2134:
	addq	$1, %rbp
	cmpq	%rax, %rbp
	jb	.L2135
.L2133:
	testb	%bl, %bl
	movzbl	6(%r12), %eax
	js	.L2143
	andl	$127, %eax
	testb	%bl, %bl
	movb	%al, 6(%r12)
	jne	.L2137
	orl	$2, %eax
	jmp	.L2138
	.p2align 4,,10
.L2143:
	orl	$-128, %eax
.L2137:
	andl	$-3, %eax
.L2138:
	movb	%al, 6(%r12)
	movl	$6, %eax
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	ret
	.seh_endproc
	.p2align 4,,15
	.globl	ADC_abss
	.def	ADC_abss;	.scl	2;	.type	32;	.endef
	.seh_proc	ADC_abss
ADC_abss:
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$40, %rsp
	.seh_stackalloc	40
	.seh_endprologue
	movzwl	4(%rcx), %edx
	movq	%rcx, %rbx
	call	read_mos6502
	movzbl	%al, %esi
	movzwl	4(%rbx), %eax
	movq	%rbx, %rcx
	leal	1(%rax), %edx
	movzwl	%dx, %edx
	call	read_mos6502
	addw	$2, 4(%rbx)
	movl	%eax, %edx
	movq	%rbx, %rcx
	sall	$8, %edx
	orl	%esi, %edx
	movzwl	%dx, %edx
	call	read_mos6502
	movzbl	6(%rbx), %edx
	movzbl	(%rbx), %ecx
	movl	%edx, %r8d
	movl	%ecx, %r9d
	andl	$1, %r8d
	xorl	%eax, %r9d
	addl	%ecx, %r8d
	movzbl	%al, %ecx
	notl	%r9d
	addl	%r8d, %ecx
	movl	%edx, %r8d
	andl	$127, %edx
	orl	$-128, %r8d
	testb	$-128, %cl
	movb	%cl, (%rbx)
	cmovne	%r8d, %edx
	movl	%edx, %r8d
	andl	$-3, %edx
	orl	$2, %r8d
	testb	%cl, %cl
	cmove	%r8d, %edx
	movl	%edx, %r8d
	andl	$-2, %edx
	orl	$1, %r8d
	testb	$1, %ch
	cmovne	%r8d, %edx
	xorl	%ecx, %eax
	movl	%edx, %ecx
	andl	$-65, %edx
	orl	$64, %ecx
	testb	%r9b, %al
	movl	$4, %eax
	cmovs	%ecx, %edx
	movb	%dl, 6(%rbx)
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	ret
	.seh_endproc
	.p2align 4,,15
	.globl	SBC_abss
	.def	SBC_abss;	.scl	2;	.type	32;	.endef
	.seh_proc	SBC_abss
SBC_abss:
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$40, %rsp
	.seh_stackalloc	40
	.seh_endprologue
	movzwl	4(%rcx), %edx
	movq	%rcx, %rbx
	call	read_mos6502
	movzbl	%al, %esi
	movzwl	4(%rbx), %eax
	movq	%rbx, %rcx
	leal	1(%rax), %edx
	movzwl	%dx, %edx
	call	read_mos6502
	addw	$2, 4(%rbx)
	movl	%eax, %edx
	movq	%rbx, %rcx
	sall	$8, %edx
	orl	%esi, %edx
	movzwl	%dx, %edx
	call	read_mos6502
	movzbl	6(%rbx), %edx
	movzbl	(%rbx), %r8d
	movl	%edx, %ecx
	movl	%r8d, %r9d
	andl	$1, %ecx
	addl	%ecx, %r8d
	movl	%eax, %ecx
	notl	%ecx
	movzbl	%cl, %ecx
	addl	%r8d, %ecx
	movl	%edx, %r8d
	andl	$127, %edx
	orl	$-128, %r8d
	testb	$-128, %cl
	cmovne	%r8d, %edx
	movl	%edx, %r8d
	andl	$-3, %edx
	orl	$2, %r8d
	testb	%cl, %cl
	cmove	%r8d, %edx
	movl	%edx, %r8d
	andl	$-2, %edx
	orl	$1, %r8d
	testb	$1, %ch
	cmovne	%r8d, %edx
	xorl	%r8d, %r8d
	cmpb	%cl, %r9b
	setl	%r8b
	testb	%al, %al
	jns	.L2161
	xorl	%r8d, %r8d
	cmpb	%cl, %r9b
	setg	%r8b
.L2161:
	movl	%edx, %eax
	andl	$-65, %edx
	movb	%cl, (%rbx)
	orl	$64, %eax
	testl	%r8d, %r8d
	cmovne	%eax, %edx
	movl	$4, %eax
	movb	%dl, 6(%rbx)
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	ret
	.seh_endproc
	.p2align 4,,15
	.globl	ADC_indy
	.def	ADC_indy;	.scl	2;	.type	32;	.endef
	.seh_proc	ADC_indy
ADC_indy:
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movzwl	4(%rcx), %edx
	movq	%rcx, %rbx
	call	read_mos6502
	movzbl	%al, %edx
	movq	%rbx, %rcx
	movl	%edx, %esi
	addl	$1, %esi
	call	read_mos6502
	movzbl	%sil, %edx
	movq	%rbx, %rcx
	movzbl	%al, %edi
	call	read_mos6502
	movl	%eax, %edx
	movzbl	2(%rbx), %eax
	addw	$1, 4(%rbx)
	sall	$8, %edx
	movq	%rbx, %rcx
	orl	%edi, %edx
	addl	%eax, %edx
	movzwl	%dx, %edx
	call	read_mos6502
	movzbl	6(%rbx), %edx
	movzbl	(%rbx), %ecx
	movl	%edx, %r8d
	movl	%ecx, %r9d
	andl	$1, %r8d
	xorl	%eax, %r9d
	addl	%ecx, %r8d
	movzbl	%al, %ecx
	notl	%r9d
	addl	%r8d, %ecx
	movl	%edx, %r8d
	andl	$127, %edx
	orl	$-128, %r8d
	testb	$-128, %cl
	movb	%cl, (%rbx)
	cmovne	%r8d, %edx
	movl	%edx, %r8d
	andl	$-3, %edx
	orl	$2, %r8d
	testb	%cl, %cl
	cmove	%r8d, %edx
	movl	%edx, %r8d
	andl	$-2, %edx
	orl	$1, %r8d
	testb	$1, %ch
	cmovne	%r8d, %edx
	xorl	%ecx, %eax
	movl	%edx, %ecx
	andl	$-65, %edx
	orl	$64, %ecx
	testb	%r9b, %al
	movl	$5, %eax
	cmovs	%ecx, %edx
	movb	%dl, 6(%rbx)
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	ret
	.seh_endproc
	.p2align 4,,15
	.globl	SBC_indy
	.def	SBC_indy;	.scl	2;	.type	32;	.endef
	.seh_proc	SBC_indy
SBC_indy:
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movzwl	4(%rcx), %edx
	movq	%rcx, %rbx
	call	read_mos6502
	movzbl	%al, %edx
	movq	%rbx, %rcx
	movl	%edx, %esi
	addl	$1, %esi
	call	read_mos6502
	movzbl	%sil, %edx
	movq	%rbx, %rcx
	movzbl	%al, %edi
	call	read_mos6502
	movl	%eax, %edx
	movzbl	2(%rbx), %eax
	addw	$1, 4(%rbx)
	sall	$8, %edx
	movq	%rbx, %rcx
	orl	%edi, %edx
	addl	%eax, %edx
	movzwl	%dx, %edx
	call	read_mos6502
	movzbl	6(%rbx), %edx
	movzbl	(%rbx), %r8d
	movl	%edx, %ecx
	movl	%r8d, %r9d
	andl	$1, %ecx
	addl	%ecx, %r8d
	movl	%eax, %ecx
	notl	%ecx
	movzbl	%cl, %ecx
	addl	%r8d, %ecx
	movl	%edx, %r8d
	andl	$127, %edx
	orl	$-128, %r8d
	testb	$-128, %cl
	cmovne	%r8d, %edx
	movl	%edx, %r8d
	andl	$-3, %edx
	orl	$2, %r8d
	testb	%cl, %cl
	cmove	%r8d, %edx
	movl	%edx, %r8d
	andl	$-2, %edx
	orl	$1, %r8d
	testb	$1, %ch
	cmovne	%r8d, %edx
	xorl	%r8d, %r8d
	cmpb	%cl, %r9b
	setl	%r8b
	testb	%al, %al
	jns	.L2181
	xorl	%r8d, %r8d
	cmpb	%cl, %r9b
	setg	%r8b
.L2181:
	movl	%edx, %eax
	andl	$-65, %edx
	movb	%cl, (%rbx)
	orl	$64, %eax
	testl	%r8d, %r8d
	cmovne	%eax, %edx
	movl	$5, %eax
	movb	%dl, 6(%rbx)
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	ret
	.seh_endproc
	.p2align 4,,15
	.globl	ADC_xind
	.def	ADC_xind;	.scl	2;	.type	32;	.endef
	.seh_proc	ADC_xind
ADC_xind:
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movzwl	4(%rcx), %edx
	movq	%rcx, %rbx
	call	read_mos6502
	addb	1(%rbx), %al
	movq	%rbx, %rcx
	movzbl	%al, %edx
	movl	%edx, %esi
	call	read_mos6502
	leal	1(%rsi), %edx
	movq	%rbx, %rcx
	movzbl	%al, %edi
	movzbl	%dl, %edx
	call	read_mos6502
	addw	$1, 4(%rbx)
	movl	%eax, %edx
	movq	%rbx, %rcx
	sall	$8, %edx
	orl	%edi, %edx
	movzwl	%dx, %edx
	call	read_mos6502
	movzbl	6(%rbx), %edx
	movzbl	(%rbx), %ecx
	movl	%edx, %r8d
	movl	%ecx, %r9d
	andl	$1, %r8d
	xorl	%eax, %r9d
	addl	%ecx, %r8d
	movzbl	%al, %ecx
	notl	%r9d
	addl	%r8d, %ecx
	movl	%edx, %r8d
	andl	$127, %edx
	orl	$-128, %r8d
	testb	$-128, %cl
	movb	%cl, (%rbx)
	cmovne	%r8d, %edx
	movl	%edx, %r8d
	andl	$-3, %edx
	orl	$2, %r8d
	testb	%cl, %cl
	cmove	%r8d, %edx
	movl	%edx, %r8d
	andl	$-2, %edx
	orl	$1, %r8d
	testb	$1, %ch
	cmovne	%r8d, %edx
	xorl	%ecx, %eax
	movl	%edx, %ecx
	andl	$-65, %edx
	orl	$64, %ecx
	testb	%r9b, %al
	movl	$6, %eax
	cmovs	%ecx, %edx
	movb	%dl, 6(%rbx)
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	ret
	.seh_endproc
	.p2align 4,,15
	.globl	write_mos6502
	.def	write_mos6502;	.scl	2;	.type	32;	.endef
	.seh_proc	write_mos6502
write_mos6502:
	pushq	%r12
	.seh_pushreg	%r12
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movl	%edx, %ebp
	movq	16(%rcx), %rdx
	movq	%rcx, %r12
	testq	%rdx, %rdx
	je	.L2193
	xorl	%ebx, %ebx
	movzwl	%bp, %edi
	movzbl	%r8b, %esi
	.p2align 4,,10
.L2196:
	movq	%rbx, %rax
	salq	$5, %rax
	addq	8(%r12), %rax
	movzwl	16(%rax), %ecx
	cmpw	%bp, %cx
	ja	.L2195
	movzwl	18(%rax), %r9d
	movzwl	%cx, %r8d
	addl	%r8d, %r9d
	cmpl	%edi, %r9d
	jle	.L2195
	movl	%ebp, %edx
	movl	%esi, %r8d
	subl	%ecx, %edx
	movq	24(%rax), %rcx
	movzwl	%dx, %edx
	call	*8(%rax)
	movq	16(%r12), %rdx
.L2195:
	addq	$1, %rbx
	cmpq	%rdx, %rbx
	jb	.L2196
.L2193:
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	ret
	.seh_endproc
	.p2align 4,,15
	.globl	BRK
	.def	BRK;	.scl	2;	.type	32;	.endef
	.seh_proc	BRK
BRK:
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movzwl	4(%rcx), %eax
	movzbl	3(%rcx), %edx
	movq	%rcx, %rbx
	addl	$2, %eax
	movw	%ax, 4(%rcx)
	leal	-1(%rdx), %ecx
	movzbl	%ah, %eax
	movl	%eax, %r8d
	addl	$256, %edx
	movb	%cl, 3(%rbx)
	movq	%rbx, %rcx
	call	write_mos6502
	movzbl	3(%rbx), %eax
	movzbl	4(%rbx), %r8d
	movq	%rbx, %rcx
	leal	-1(%rax), %edx
	movb	%dl, 3(%rbx)
	leal	256(%rax), %edx
	call	write_mos6502
	movzbl	3(%rbx), %eax
	movzbl	6(%rbx), %r8d
	movq	%rbx, %rcx
	leal	-1(%rax), %edx
	orl	$48, %r8d
	movb	%r8b, 6(%rbx)
	movzbl	%r8b, %r8d
	movb	%dl, 3(%rbx)
	leal	256(%rax), %edx
	call	write_mos6502
	orb	$4, 6(%rbx)
	movq	%rbx, %rcx
	movl	$65534, %edx
	call	read_mos6502
	movzbl	%al, %eax
	movl	$65535, %edx
	movq	%rbx, %rcx
	movw	%ax, 4(%rbx)
	call	read_mos6502
	sall	$8, %eax
	orw	%ax, 4(%rbx)
	movl	$7, %eax
	addq	$32, %rsp
	popq	%rbx
	ret
	.seh_endproc
	.p2align 4,,15
	.globl	LSR_abss
	.def	LSR_abss;	.scl	2;	.type	32;	.endef
	.seh_proc	LSR_abss
LSR_abss:
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
	movzwl	4(%rcx), %edx
	movq	%rcx, %rbx
	call	read_mos6502
	movzbl	%al, %esi
	movzwl	4(%rbx), %eax
	movq	%rbx, %rcx
	leal	1(%rax), %edx
	movzwl	%dx, %edx
	call	read_mos6502
	addw	$2, 4(%rbx)
	sall	$8, %eax
	movq	%rbx, %rcx
	orl	%esi, %eax
	movzwl	%ax, %esi
	movl	%esi, %edx
	call	read_mos6502
	movl	%eax, %ebp
	movl	%esi, %edx
	movq	%rbx, %rcx
	shrb	%bpl
	movl	%eax, %edi
	movl	%ebp, %r8d
	andl	$127, %r8d
	call	write_mos6502
	movzbl	6(%rbx), %ecx
	movl	%ecx, %edx
	andl	$125, %ecx
	andl	$127, %edx
	orl	$2, %edx
	testb	%bpl, %bpl
	cmovne	%ecx, %edx
	movl	%edx, %eax
	andl	$-2, %edx
	orl	$1, %eax
	andl	$1, %edi
	cmovne	%eax, %edx
	movl	$4, %eax
	movb	%dl, 6(%rbx)
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	ret
	.seh_endproc
	.p2align 4,,15
	.globl	INC_abss
	.def	INC_abss;	.scl	2;	.type	32;	.endef
	.seh_proc	INC_abss
INC_abss:
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$40, %rsp
	.seh_stackalloc	40
	.seh_endprologue
	movzwl	4(%rcx), %edx
	movq	%rcx, %rbx
	call	read_mos6502
	movzbl	%al, %esi
	movzwl	4(%rbx), %eax
	movq	%rbx, %rcx
	leal	1(%rax), %edx
	movzwl	%dx, %edx
	call	read_mos6502
	addw	$2, 4(%rbx)
	sall	$8, %eax
	movq	%rbx, %rcx
	orl	%esi, %eax
	movzwl	%ax, %esi
	movl	%esi, %edx
	call	read_mos6502
	addl	$1, %eax
	movzbl	6(%rbx), %edx
	testb	%al, %al
	movzbl	%al, %r8d
	js	.L2211
	andl	$127, %edx
	testb	%al, %al
	movb	%dl, 6(%rbx)
	jne	.L2209
	orl	$2, %edx
	jmp	.L2210
	.p2align 4,,10
.L2211:
	orl	$-128, %edx
.L2209:
	andl	$-3, %edx
.L2210:
	movb	%dl, 6(%rbx)
	movq	%rbx, %rcx
	movl	%esi, %edx
	call	write_mos6502
	movl	$6, %eax
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	ret
	.seh_endproc
	.p2align 4,,15
	.globl	SLO_absy
	.def	SLO_absy;	.scl	2;	.type	32;	.endef
	.seh_proc	SLO_absy
SLO_absy:
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movzwl	4(%rcx), %edx
	movq	%rcx, %rbx
	call	read_mos6502
	movzbl	%al, %edi
	movzwl	4(%rbx), %eax
	movq	%rbx, %rcx
	leal	1(%rax), %edx
	movzwl	%dx, %edx
	call	read_mos6502
	movl	%eax, %esi
	movzbl	2(%rbx), %eax
	addw	$2, 4(%rbx)
	sall	$8, %esi
	movq	%rbx, %rcx
	orl	%edi, %esi
	addl	%eax, %esi
	movzwl	%si, %esi
	movl	%esi, %edx
	call	read_mos6502
	movzbl	%al, %edi
	movl	%esi, %edx
	movq	%rbx, %rcx
	addl	%edi, %edi
	movl	%edi, %r8d
	andl	$254, %r8d
	call	write_mos6502
	testb	$-128, %dil
	movzbl	6(%rbx), %edx
	je	.L2213
	orl	$-128, %edx
.L2214:
	movl	%edx, %eax
	andl	$-3, %edx
	movq	%rbx, %rcx
	orl	$2, %eax
	testb	$-2, %dil
	movzbl	(%rbx), %esi
	cmove	%eax, %edx
	movl	%edx, %eax
	andl	$-2, %edx
	orl	$1, %eax
	testw	$256, %di
	cmovne	%eax, %edx
	movb	%dl, 6(%rbx)
	movzwl	4(%rbx), %edx
	call	read_mos6502
	movzbl	%al, %edi
	movzwl	4(%rbx), %eax
	movq	%rbx, %rcx
	leal	1(%rax), %edx
	movzwl	%dx, %edx
	call	read_mos6502
	movl	%eax, %edx
	movzbl	2(%rbx), %eax
	addw	$2, 4(%rbx)
	sall	$8, %edx
	movq	%rbx, %rcx
	orl	%edi, %edx
	addl	%eax, %edx
	movzwl	%dx, %edx
	call	read_mos6502
	orl	%eax, %esi
	movzbl	6(%rbx), %edx
	testb	%sil, %sil
	movb	%sil, (%rbx)
	js	.L2222
	andl	$127, %edx
	testb	%sil, %sil
	movb	%dl, 6(%rbx)
	jne	.L2220
	orl	$2, %edx
	movl	$7, %eax
	movb	%dl, 6(%rbx)
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	ret
	.p2align 4,,10
.L2222:
	orl	$-128, %edx
.L2220:
	andl	$-3, %edx
	movl	$7, %eax
	movb	%dl, 6(%rbx)
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	ret
	.p2align 4,,10
.L2213:
	andl	$127, %edx
	jmp	.L2214
	.seh_endproc
	.p2align 4,,15
	.globl	SRE_absy
	.def	SRE_absy;	.scl	2;	.type	32;	.endef
	.seh_proc	SRE_absy
SRE_absy:
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
	movzwl	4(%rcx), %edx
	movq	%rcx, %rbx
	call	read_mos6502
	movzbl	%al, %edi
	movzwl	4(%rbx), %eax
	movq	%rbx, %rcx
	leal	1(%rax), %edx
	movzwl	%dx, %edx
	call	read_mos6502
	movl	%eax, %esi
	movzbl	2(%rbx), %eax
	addw	$2, 4(%rbx)
	sall	$8, %esi
	movq	%rbx, %rcx
	orl	%edi, %esi
	addl	%eax, %esi
	movzwl	%si, %esi
	movl	%esi, %edx
	call	read_mos6502
	movl	%eax, %edi
	movl	%eax, %ebp
	movl	%esi, %edx
	shrb	%dil
	movq	%rbx, %rcx
	movl	%edi, %r8d
	andl	$127, %r8d
	call	write_mos6502
	andl	$1, %ebp
	movzbl	6(%rbx), %eax
	je	.L2224
	orl	$1, %eax
.L2225:
	movl	%eax, %edx
	andl	$125, %eax
	movq	%rbx, %rcx
	andl	$127, %edx
	orl	$2, %edx
	testb	%dil, %dil
	cmove	%edx, %eax
	movzwl	4(%rbx), %edx
	andl	$-2, %eax
	movb	%al, 6(%rbx)
	call	read_mos6502
	movzbl	%al, %esi
	movzwl	4(%rbx), %eax
	movq	%rbx, %rcx
	leal	1(%rax), %edx
	movzwl	%dx, %edx
	call	read_mos6502
	movl	%eax, %edx
	movzbl	2(%rbx), %eax
	addw	$2, 4(%rbx)
	sall	$8, %edx
	movq	%rbx, %rcx
	orl	%esi, %edx
	addl	%eax, %edx
	movzwl	%dx, %edx
	call	read_mos6502
	movzbl	(%rbx), %ecx
	movl	%ecx, %edx
	xorl	%eax, %edx
	testb	%dl, %dl
	movb	%dl, (%rbx)
	movzbl	6(%rbx), %edx
	js	.L2232
	andl	$127, %edx
.L2229:
	movl	%edx, %r8d
	andl	$-3, %edx
	orl	$2, %r8d
	cmpb	%al, %cl
	movl	$7, %eax
	cmove	%r8d, %edx
	movb	%dl, 6(%rbx)
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	ret
	.p2align 4,,10
.L2224:
	andl	$-2, %eax
	jmp	.L2225
	.p2align 4,,10
.L2232:
	orl	$-128, %edx
	jmp	.L2229
	.seh_endproc
	.p2align 4,,15
	.globl	SLO_zpg
	.def	SLO_zpg;	.scl	2;	.type	32;	.endef
	.seh_proc	SLO_zpg
SLO_zpg:
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movzwl	4(%rcx), %edx
	movq	%rcx, %rbx
	call	read_mos6502
	addw	$1, 4(%rbx)
	movzbl	%al, %edi
	movq	%rbx, %rcx
	movl	%edi, %edx
	call	read_mos6502
	movzbl	%al, %esi
	movl	%edi, %edx
	movq	%rbx, %rcx
	addl	%esi, %esi
	movl	%esi, %r8d
	andl	$254, %r8d
	call	write_mos6502
	testb	$-128, %sil
	movzbl	6(%rbx), %edx
	je	.L2234
	orl	$-128, %edx
.L2235:
	movl	%edx, %eax
	andl	$-3, %edx
	movq	%rbx, %rcx
	orl	$2, %eax
	testb	$-2, %sil
	cmove	%eax, %edx
	movl	%edx, %eax
	andl	$-2, %edx
	orl	$1, %eax
	testw	$256, %si
	movzbl	(%rbx), %esi
	cmovne	%eax, %edx
	movb	%dl, 6(%rbx)
	movzwl	4(%rbx), %edx
	call	read_mos6502
	addw	$1, 4(%rbx)
	movzbl	%al, %edx
	movq	%rbx, %rcx
	call	read_mos6502
	orl	%esi, %eax
	movzbl	6(%rbx), %edx
	testb	%al, %al
	movb	%al, (%rbx)
	js	.L2243
	andl	$127, %edx
	testb	%al, %al
	movb	%dl, 6(%rbx)
	jne	.L2241
	orl	$2, %edx
	movl	$5, %eax
	movb	%dl, 6(%rbx)
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	ret
	.p2align 4,,10
.L2243:
	orl	$-128, %edx
.L2241:
	andl	$-3, %edx
	movl	$5, %eax
	movb	%dl, 6(%rbx)
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	ret
	.p2align 4,,10
.L2234:
	andl	$127, %edx
	jmp	.L2235
	.seh_endproc
	.p2align 4,,15
	.globl	SRE_zpg
	.def	SRE_zpg;	.scl	2;	.type	32;	.endef
	.seh_proc	SRE_zpg
SRE_zpg:
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
	movzwl	4(%rcx), %edx
	movq	%rcx, %rbx
	call	read_mos6502
	addw	$1, 4(%rbx)
	movzbl	%al, %esi
	movq	%rbx, %rcx
	movl	%esi, %edx
	call	read_mos6502
	movl	%eax, %edi
	movl	%eax, %ebp
	movl	%esi, %edx
	shrb	%dil
	movq	%rbx, %rcx
	movl	%edi, %r8d
	andl	$127, %r8d
	call	write_mos6502
	andl	$1, %ebp
	movzbl	6(%rbx), %eax
	je	.L2245
	orl	$1, %eax
.L2246:
	movl	%eax, %edx
	andl	$125, %eax
	movq	%rbx, %rcx
	andl	$127, %edx
	orl	$2, %edx
	testb	%dil, %dil
	cmove	%edx, %eax
	movzwl	4(%rbx), %edx
	andl	$-2, %eax
	movb	%al, 6(%rbx)
	call	read_mos6502
	addw	$1, 4(%rbx)
	movzbl	%al, %edx
	movq	%rbx, %rcx
	call	read_mos6502
	movzbl	(%rbx), %ecx
	movl	%ecx, %edx
	xorl	%eax, %edx
	testb	%dl, %dl
	movb	%dl, (%rbx)
	movzbl	6(%rbx), %edx
	js	.L2253
	andl	$127, %edx
.L2250:
	movl	%edx, %r8d
	andl	$-3, %edx
	orl	$2, %r8d
	cmpb	%al, %cl
	movl	$5, %eax
	cmove	%r8d, %edx
	movb	%dl, 6(%rbx)
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	ret
	.p2align 4,,10
.L2245:
	andl	$-2, %eax
	jmp	.L2246
	.p2align 4,,10
.L2253:
	orl	$-128, %edx
	jmp	.L2250
	.seh_endproc
	.p2align 4,,15
	.globl	ROL_zpg
	.def	ROL_zpg;	.scl	2;	.type	32;	.endef
	.seh_proc	ROL_zpg
ROL_zpg:
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movzwl	4(%rcx), %edx
	movq	%rcx, %rbx
	call	read_mos6502
	addw	$1, 4(%rbx)
	movzbl	%al, %edi
	movq	%rbx, %rcx
	movl	%edi, %edx
	call	read_mos6502
	rolb	%al
	movl	%edi, %edx
	movq	%rbx, %rcx
	movzbl	%al, %r8d
	movl	%r8d, %esi
	call	write_mos6502
	testb	%sil, %sil
	movzbl	6(%rbx), %edx
	js	.L2263
	andl	$127, %edx
.L2256:
	testb	%sil, %sil
	movb	%dl, 6(%rbx)
	jne	.L2257
	orl	$2, %edx
.L2258:
	andl	$-2, %edx
	movl	$5, %eax
	movb	%dl, 6(%rbx)
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	ret
	.p2align 4,,10
.L2257:
	andl	$-3, %edx
	andl	$1, %esi
	movb	%dl, 6(%rbx)
	je	.L2258
	orl	$1, %edx
	movl	$5, %eax
	movb	%dl, 6(%rbx)
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	ret
	.p2align 4,,10
.L2263:
	orl	$-128, %edx
	jmp	.L2256
	.seh_endproc
	.p2align 4,,15
	.globl	LSR_zpg
	.def	LSR_zpg;	.scl	2;	.type	32;	.endef
	.seh_proc	LSR_zpg
LSR_zpg:
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
	movzwl	4(%rcx), %edx
	movq	%rcx, %rbx
	call	read_mos6502
	addw	$1, 4(%rbx)
	movzbl	%al, %esi
	movq	%rbx, %rcx
	movl	%esi, %edx
	call	read_mos6502
	movl	%eax, %ebp
	movl	%esi, %edx
	movq	%rbx, %rcx
	shrb	%bpl
	movl	%eax, %edi
	movl	%ebp, %r8d
	andl	$127, %r8d
	call	write_mos6502
	movzbl	6(%rbx), %ecx
	movl	%ecx, %edx
	andl	$125, %ecx
	andl	$127, %edx
	orl	$2, %edx
	testb	%bpl, %bpl
	cmovne	%ecx, %edx
	movl	%edx, %eax
	andl	$-2, %edx
	orl	$1, %eax
	andl	$1, %edi
	cmovne	%eax, %edx
	movl	$3, %eax
	movb	%dl, 6(%rbx)
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	ret
	.seh_endproc
	.p2align 4,,15
	.globl	ROR_zpg
	.def	ROR_zpg;	.scl	2;	.type	32;	.endef
	.seh_proc	ROR_zpg
ROR_zpg:
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$40, %rsp
	.seh_stackalloc	40
	.seh_endprologue
	movzwl	4(%rcx), %edx
	movq	%rcx, %rbx
	call	read_mos6502
	addw	$1, 4(%rbx)
	movzbl	%al, %esi
	movq	%rbx, %rcx
	movl	%esi, %edx
	call	read_mos6502
	movzbl	6(%rbx), %edx
	movl	%eax, %ecx
	shrb	%cl
	movl	%edx, %r8d
	movl	%edx, %r9d
	andl	$127, %edx
	sall	$7, %r8d
	orl	$-128, %r9d
	orb	%cl, %r8b
	cmovs	%r9d, %edx
	movl	%edx, %ecx
	andl	$-3, %edx
	orl	$2, %ecx
	testb	%r8b, %r8b
	movzbl	%r8b, %r8d
	cmove	%ecx, %edx
	movl	%edx, %ecx
	andl	$-2, %edx
	orl	$1, %ecx
	testb	$1, %al
	cmovne	%ecx, %edx
	movq	%rbx, %rcx
	movb	%dl, 6(%rbx)
	movl	%esi, %edx
	call	write_mos6502
	movl	$5, %eax
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	ret
	.seh_endproc
	.p2align 4,,15
	.globl	INC_zpg
	.def	INC_zpg;	.scl	2;	.type	32;	.endef
	.seh_proc	INC_zpg
INC_zpg:
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$40, %rsp
	.seh_stackalloc	40
	.seh_endprologue
	movzwl	4(%rcx), %edx
	movq	%rcx, %rbx
	call	read_mos6502
	addw	$1, 4(%rbx)
	movzbl	%al, %esi
	movq	%rbx, %rcx
	movl	%esi, %edx
	call	read_mos6502
	addl	$1, %eax
	movzbl	6(%rbx), %edx
	testb	%al, %al
	movzbl	%al, %r8d
	js	.L2280
	andl	$127, %edx
	testb	%al, %al
	movb	%dl, 6(%rbx)
	jne	.L2278
	orl	$2, %edx
	jmp	.L2279
	.p2align 4,,10
.L2280:
	orl	$-128, %edx
.L2278:
	andl	$-3, %edx
.L2279:
	movb	%dl, 6(%rbx)
	movq	%rbx, %rcx
	movl	%esi, %edx
	call	write_mos6502
	movl	$5, %eax
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	ret
	.seh_endproc
	.p2align 4,,15
	.globl	DEC_zpg
	.def	DEC_zpg;	.scl	2;	.type	32;	.endef
	.seh_proc	DEC_zpg
DEC_zpg:
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movzwl	4(%rcx), %edx
	movq	%rcx, %rbx
	call	read_mos6502
	addw	$1, 4(%rbx)
	movzbl	%al, %edi
	movq	%rbx, %rcx
	movl	%edi, %edx
	call	read_mos6502
	leal	-1(%rax), %esi
	movl	%edi, %edx
	movq	%rbx, %rcx
	movzbl	%sil, %r8d
	call	write_mos6502
	testb	%sil, %sil
	movzbl	6(%rbx), %edx
	js	.L2285
	andl	$127, %edx
	testb	%sil, %sil
	movb	%dl, 6(%rbx)
	jne	.L2283
	orl	$2, %edx
	movl	$5, %eax
	movb	%dl, 6(%rbx)
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	ret
	.p2align 4,,10
.L2285:
	orl	$-128, %edx
.L2283:
	andl	$-3, %edx
	movl	$5, %eax
	movb	%dl, 6(%rbx)
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	ret
	.seh_endproc
	.p2align 4,,15
	.globl	SLO_zpgx
	.def	SLO_zpgx;	.scl	2;	.type	32;	.endef
	.seh_proc	SLO_zpgx
SLO_zpgx:
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movzwl	4(%rcx), %edx
	movq	%rcx, %rbx
	call	read_mos6502
	addb	1(%rbx), %al
	addw	$1, 4(%rbx)
	movq	%rbx, %rcx
	movzbl	%al, %edi
	movl	%edi, %edx
	call	read_mos6502
	movzbl	%al, %esi
	movl	%edi, %edx
	movq	%rbx, %rcx
	addl	%esi, %esi
	movl	%esi, %r8d
	andl	$254, %r8d
	call	write_mos6502
	testb	$-128, %sil
	movzbl	6(%rbx), %edx
	je	.L2287
	orl	$-128, %edx
.L2288:
	movl	%edx, %eax
	andl	$-3, %edx
	movq	%rbx, %rcx
	orl	$2, %eax
	testb	$-2, %sil
	cmove	%eax, %edx
	movl	%edx, %eax
	andl	$-2, %edx
	orl	$1, %eax
	testw	$256, %si
	movzbl	(%rbx), %esi
	cmovne	%eax, %edx
	movb	%dl, 6(%rbx)
	movzwl	4(%rbx), %edx
	call	read_mos6502
	addb	1(%rbx), %al
	addw	$1, 4(%rbx)
	movq	%rbx, %rcx
	movzbl	%al, %edx
	call	read_mos6502
	orl	%esi, %eax
	movzbl	6(%rbx), %edx
	testb	%al, %al
	movb	%al, (%rbx)
	js	.L2296
	andl	$127, %edx
	testb	%al, %al
	movb	%dl, 6(%rbx)
	jne	.L2294
	orl	$2, %edx
	movl	$6, %eax
	movb	%dl, 6(%rbx)
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	ret
	.p2align 4,,10
.L2296:
	orl	$-128, %edx
.L2294:
	andl	$-3, %edx
	movl	$6, %eax
	movb	%dl, 6(%rbx)
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	ret
	.p2align 4,,10
.L2287:
	andl	$127, %edx
	jmp	.L2288
	.seh_endproc
	.p2align 4,,15
	.globl	SRE_zpgx
	.def	SRE_zpgx;	.scl	2;	.type	32;	.endef
	.seh_proc	SRE_zpgx
SRE_zpgx:
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
	movzwl	4(%rcx), %edx
	movq	%rcx, %rbx
	call	read_mos6502
	addb	1(%rbx), %al
	addw	$1, 4(%rbx)
	movq	%rbx, %rcx
	movzbl	%al, %esi
	movl	%esi, %edx
	call	read_mos6502
	movl	%eax, %edi
	movl	%eax, %ebp
	movl	%esi, %edx
	shrb	%dil
	movq	%rbx, %rcx
	movl	%edi, %r8d
	andl	$127, %r8d
	call	write_mos6502
	andl	$1, %ebp
	movzbl	6(%rbx), %eax
	je	.L2298
	orl	$1, %eax
.L2299:
	movl	%eax, %edx
	andl	$125, %eax
	movq	%rbx, %rcx
	andl	$127, %edx
	orl	$2, %edx
	testb	%dil, %dil
	cmove	%edx, %eax
	movzwl	4(%rbx), %edx
	andl	$-2, %eax
	movb	%al, 6(%rbx)
	call	read_mos6502
	addb	1(%rbx), %al
	addw	$1, 4(%rbx)
	movq	%rbx, %rcx
	movzbl	%al, %edx
	call	read_mos6502
	movzbl	(%rbx), %ecx
	movl	%ecx, %edx
	xorl	%eax, %edx
	testb	%dl, %dl
	movb	%dl, (%rbx)
	movzbl	6(%rbx), %edx
	js	.L2306
	andl	$127, %edx
.L2303:
	movl	%edx, %r8d
	andl	$-3, %edx
	orl	$2, %r8d
	cmpb	%al, %cl
	movl	$6, %eax
	cmove	%r8d, %edx
	movb	%dl, 6(%rbx)
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	ret
	.p2align 4,,10
.L2298:
	andl	$-2, %eax
	jmp	.L2299
	.p2align 4,,10
.L2306:
	orl	$-128, %edx
	jmp	.L2303
	.seh_endproc
	.p2align 4,,15
	.globl	ROL_zpgx
	.def	ROL_zpgx;	.scl	2;	.type	32;	.endef
	.seh_proc	ROL_zpgx
ROL_zpgx:
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movzwl	4(%rcx), %edx
	movq	%rcx, %rbx
	call	read_mos6502
	addb	1(%rbx), %al
	addw	$1, 4(%rbx)
	movq	%rbx, %rcx
	movzbl	%al, %esi
	movl	%esi, %edx
	call	read_mos6502
	rolb	%al
	movl	%esi, %edx
	movq	%rbx, %rcx
	movzbl	%al, %r8d
	movl	%r8d, %edi
	call	write_mos6502
	testb	%dil, %dil
	movzbl	6(%rbx), %edx
	js	.L2316
	andl	$127, %edx
.L2309:
	testb	%dil, %dil
	movb	%dl, 6(%rbx)
	jne	.L2310
	orl	$2, %edx
.L2311:
	andl	$-2, %edx
	movl	$6, %eax
	movb	%dl, 6(%rbx)
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	ret
	.p2align 4,,10
.L2310:
	andl	$-3, %edx
	andl	$1, %edi
	movb	%dl, 6(%rbx)
	je	.L2311
	orl	$1, %edx
	movl	$6, %eax
	movb	%dl, 6(%rbx)
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	ret
	.p2align 4,,10
.L2316:
	orl	$-128, %edx
	jmp	.L2309
	.seh_endproc
	.p2align 4,,15
	.globl	LSR_zpgx
	.def	LSR_zpgx;	.scl	2;	.type	32;	.endef
	.seh_proc	LSR_zpgx
LSR_zpgx:
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
	movzwl	4(%rcx), %edx
	movq	%rcx, %rbx
	call	read_mos6502
	addb	1(%rbx), %al
	addw	$1, 4(%rbx)
	movq	%rbx, %rcx
	movzbl	%al, %esi
	movl	%esi, %edx
	call	read_mos6502
	movl	%eax, %ebp
	movl	%esi, %edx
	movq	%rbx, %rcx
	shrb	%bpl
	movl	%eax, %edi
	movl	%ebp, %r8d
	andl	$127, %r8d
	call	write_mos6502
	movzbl	6(%rbx), %ecx
	movl	%ecx, %edx
	andl	$125, %ecx
	andl	$127, %edx
	orl	$2, %edx
	testb	%bpl, %bpl
	cmovne	%ecx, %edx
	movl	%edx, %eax
	andl	$-2, %edx
	orl	$1, %eax
	andl	$1, %edi
	cmovne	%eax, %edx
	movl	$4, %eax
	movb	%dl, 6(%rbx)
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	ret
	.seh_endproc
	.p2align 4,,15
	.globl	ROR_zpgx
	.def	ROR_zpgx;	.scl	2;	.type	32;	.endef
	.seh_proc	ROR_zpgx
ROR_zpgx:
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$40, %rsp
	.seh_stackalloc	40
	.seh_endprologue
	movzwl	4(%rcx), %edx
	movq	%rcx, %rbx
	call	read_mos6502
	addb	1(%rbx), %al
	addw	$1, 4(%rbx)
	movq	%rbx, %rcx
	movzbl	%al, %esi
	movl	%esi, %edx
	call	read_mos6502
	movzbl	6(%rbx), %edx
	movl	%eax, %ecx
	shrb	%cl
	movl	%edx, %r8d
	movl	%edx, %r9d
	andl	$127, %edx
	sall	$7, %r8d
	orl	$-128, %r9d
	orb	%cl, %r8b
	cmovs	%r9d, %edx
	movl	%edx, %ecx
	andl	$-3, %edx
	orl	$2, %ecx
	testb	%r8b, %r8b
	movzbl	%r8b, %r8d
	cmove	%ecx, %edx
	movl	%edx, %ecx
	andl	$-2, %edx
	orl	$1, %ecx
	testb	$1, %al
	cmovne	%ecx, %edx
	movq	%rbx, %rcx
	movb	%dl, 6(%rbx)
	movl	%esi, %edx
	call	write_mos6502
	movl	$6, %eax
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	ret
	.seh_endproc
	.p2align 4,,15
	.globl	INC_zpgx
	.def	INC_zpgx;	.scl	2;	.type	32;	.endef
	.seh_proc	INC_zpgx
INC_zpgx:
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$40, %rsp
	.seh_stackalloc	40
	.seh_endprologue
	movzwl	4(%rcx), %edx
	movq	%rcx, %rbx
	call	read_mos6502
	addb	1(%rbx), %al
	addw	$1, 4(%rbx)
	movq	%rbx, %rcx
	movzbl	%al, %esi
	movl	%esi, %edx
	call	read_mos6502
	addl	$1, %eax
	movzbl	6(%rbx), %edx
	testb	%al, %al
	movzbl	%al, %r8d
	js	.L2333
	andl	$127, %edx
	testb	%al, %al
	movb	%dl, 6(%rbx)
	jne	.L2331
	orl	$2, %edx
	jmp	.L2332
	.p2align 4,,10
.L2333:
	orl	$-128, %edx
.L2331:
	andl	$-3, %edx
.L2332:
	movb	%dl, 6(%rbx)
	movq	%rbx, %rcx
	movl	%esi, %edx
	call	write_mos6502
	movl	$6, %eax
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	ret
	.seh_endproc
	.p2align 4,,15
	.globl	DEC_zpgx
	.def	DEC_zpgx;	.scl	2;	.type	32;	.endef
	.seh_proc	DEC_zpgx
DEC_zpgx:
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movzwl	4(%rcx), %edx
	movq	%rcx, %rbx
	call	read_mos6502
	addb	1(%rbx), %al
	addw	$1, 4(%rbx)
	movq	%rbx, %rcx
	movzbl	%al, %esi
	movl	%esi, %edx
	call	read_mos6502
	leal	-1(%rax), %edi
	movl	%esi, %edx
	movq	%rbx, %rcx
	movzbl	%dil, %r8d
	call	write_mos6502
	testb	%dil, %dil
	movzbl	6(%rbx), %edx
	js	.L2338
	andl	$127, %edx
	testb	%dil, %dil
	movb	%dl, 6(%rbx)
	jne	.L2336
	orl	$2, %edx
	movl	$6, %eax
	movb	%dl, 6(%rbx)
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	ret
	.p2align 4,,10
.L2338:
	orl	$-128, %edx
.L2336:
	andl	$-3, %edx
	movl	$6, %eax
	movb	%dl, 6(%rbx)
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	ret
	.seh_endproc
	.section .rdata,"dr"
.LC1:
	.ascii "PAGE %02x\12\0"
.LC2:
	.ascii "%02X \0"
	.text
	.p2align 4,,15
	.globl	printPage
	.def	printPage;	.scl	2;	.type	32;	.endef
	.seh_proc	printPage
printPage:
	pushq	%r14
	.seh_pushreg	%r14
	pushq	%r13
	.seh_pushreg	%r13
	pushq	%r12
	.seh_pushreg	%r12
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	leaq	.LC2(%rip), %rdi
	movl	%edx, %ebx
	movq	%rcx, %r14
	leaq	.LC1(%rip), %rcx
	sall	$8, %ebx
	movzbl	%dl, %edx
	leal	16(%rbx), %esi
	leal	272(%rbx), %ebp
	call	printf
	.p2align 4,,10
.L2340:
	leal	-16(%rsi), %r13d
	.p2align 4,,10
.L2344:
	movq	16(%r14), %r10
	movzwl	%r13w, %ebx
	testq	%r10, %r10
	je	.L2346
	xorl	%eax, %eax
	xorl	%r12d, %r12d
	.p2align 4,,10
.L2343:
	movq	%r12, %r8
	salq	$5, %r8
	addq	8(%r14), %r8
	movzwl	16(%r8), %ecx
	cmpw	%r13w, %cx
	ja	.L2342
	movzwl	18(%r8), %r9d
	movzwl	%cx, %edx
	addl	%edx, %r9d
	cmpl	%r9d, %ebx
	jge	.L2342
	movl	%r13d, %edx
	subl	%ecx, %edx
	movq	24(%r8), %rcx
	movzwl	%dx, %edx
	call	*(%r8)
	movq	16(%r14), %r10
.L2342:
	addq	$1, %r12
	cmpq	%r10, %r12
	jb	.L2343
	movzbl	%al, %edx
.L2341:
	movq	%rdi, %rcx
	addl	$1, %r13d
	call	printf
	cmpw	%r13w, %si
	jne	.L2344
	movl	$10, %ecx
	addl	$16, %esi
	call	putchar
	cmpw	%si, %bp
	jne	.L2340
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	ret
	.p2align 4,,10
.L2346:
	xorl	%edx, %edx
	jmp	.L2341
	.seh_endproc
	.section .rdata,"dr"
	.align 8
.LC3:
	.ascii "CPU REGISTERS:\12-- A    =0x%02X\12-- X    =0x%02X\12-- Y    =0x%02x\12-- SP   =0x%02X\12-- PC   =0x%04X\12-- FLAGS=0x%02X\12\0"
	.text
	.p2align 4,,15
	.globl	printRegisters
	.def	printRegisters;	.scl	2;	.type	32;	.endef
	.seh_proc	printRegisters
printRegisters:
	pushq	%r13
	.seh_pushreg	%r13
	pushq	%r12
	.seh_pushreg	%r12
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$72, %rsp
	.seh_stackalloc	72
	.seh_endprologue
	movzbl	3(%rcx), %ebx
	movzbl	6(%rcx), %r13d
	movzwl	4(%rcx), %r12d
	movzbl	2(%rcx), %ebp
	movzbl	1(%rcx), %edi
	movzbl	(%rcx), %esi
	call	*__imp___iob_func(%rip)
	addl	$256, %ebx
	leaq	48(%rax), %rcx
	leaq	.LC3(%rip), %rdx
	movl	%r13d, 56(%rsp)
	movl	%r12d, 48(%rsp)
	movl	%ebx, 40(%rsp)
	movl	%ebp, 32(%rsp)
	movl	%edi, %r9d
	movl	%esi, %r8d
	call	fprintf
	nop
	addq	$72, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	ret
	.seh_endproc
	.p2align 4,,15
	.globl	triggerNMI
	.def	triggerNMI;	.scl	2;	.type	32;	.endef
	.seh_proc	triggerNMI
triggerNMI:
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movzwl	4(%rcx), %eax
	movzbl	3(%rcx), %edx
	movq	%rcx, %rbx
	addl	$2, %eax
	movw	%ax, 4(%rcx)
	leal	-1(%rdx), %ecx
	movzbl	%ah, %eax
	movl	%eax, %r8d
	addl	$256, %edx
	movb	%cl, 3(%rbx)
	movq	%rbx, %rcx
	call	write_mos6502
	movzbl	3(%rbx), %eax
	movzbl	4(%rbx), %r8d
	movq	%rbx, %rcx
	leal	-1(%rax), %edx
	movb	%dl, 3(%rbx)
	leal	256(%rax), %edx
	call	write_mos6502
	movzbl	3(%rbx), %eax
	movzbl	6(%rbx), %r8d
	movq	%rbx, %rcx
	leal	-1(%rax), %edx
	orl	$32, %r8d
	andl	$-17, %r8d
	movb	%dl, 3(%rbx)
	leal	256(%rax), %edx
	movb	%r8b, 6(%rbx)
	movzbl	%r8b, %r8d
	call	write_mos6502
	orb	$4, 6(%rbx)
	movq	%rbx, %rcx
	movl	$65530, %edx
	call	read_mos6502
	movzbl	%al, %eax
	movl	$65531, %edx
	movq	%rbx, %rcx
	movw	%ax, 4(%rbx)
	call	read_mos6502
	sall	$8, %eax
	orw	%ax, 4(%rbx)
	addq	$32, %rsp
	popq	%rbx
	ret
	.seh_endproc
	.p2align 4,,15
	.globl	triggerRST
	.def	triggerRST;	.scl	2;	.type	32;	.endef
	.seh_proc	triggerRST
triggerRST:
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movzwl	4(%rcx), %eax
	movzbl	3(%rcx), %edx
	movq	%rcx, %rbx
	addl	$2, %eax
	movw	%ax, 4(%rcx)
	leal	-1(%rdx), %ecx
	movzbl	%ah, %eax
	movl	%eax, %r8d
	addl	$256, %edx
	movb	%cl, 3(%rbx)
	movq	%rbx, %rcx
	call	write_mos6502
	movzbl	3(%rbx), %eax
	movzbl	4(%rbx), %r8d
	movq	%rbx, %rcx
	leal	-1(%rax), %edx
	movb	%dl, 3(%rbx)
	leal	256(%rax), %edx
	call	write_mos6502
	movzbl	3(%rbx), %eax
	movzbl	6(%rbx), %r8d
	movq	%rbx, %rcx
	leal	-1(%rax), %edx
	movb	%dl, 3(%rbx)
	leal	256(%rax), %edx
	call	write_mos6502
	orb	$4, 6(%rbx)
	movq	%rbx, %rcx
	movl	$65532, %edx
	call	read_mos6502
	movzbl	%al, %eax
	movl	$65533, %edx
	movq	%rbx, %rcx
	movw	%ax, 4(%rbx)
	call	read_mos6502
	sall	$8, %eax
	orw	%ax, 4(%rbx)
	addq	$32, %rsp
	popq	%rbx
	ret
	.seh_endproc
	.p2align 4,,15
	.globl	triggerIRQ
	.def	triggerIRQ;	.scl	2;	.type	32;	.endef
	.seh_proc	triggerIRQ
triggerIRQ:
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movzwl	4(%rcx), %eax
	movzbl	3(%rcx), %edx
	movq	%rcx, %rbx
	addl	$2, %eax
	movw	%ax, 4(%rcx)
	leal	-1(%rdx), %ecx
	movzbl	%ah, %eax
	movl	%eax, %r8d
	addl	$256, %edx
	movb	%cl, 3(%rbx)
	movq	%rbx, %rcx
	call	write_mos6502
	movzbl	3(%rbx), %eax
	movzbl	4(%rbx), %r8d
	movq	%rbx, %rcx
	leal	-1(%rax), %edx
	movb	%dl, 3(%rbx)
	leal	256(%rax), %edx
	call	write_mos6502
	movzbl	3(%rbx), %eax
	movzbl	6(%rbx), %r8d
	movq	%rbx, %rcx
	leal	-1(%rax), %edx
	orl	$32, %r8d
	andl	$-17, %r8d
	movb	%dl, 3(%rbx)
	leal	256(%rax), %edx
	movb	%r8b, 6(%rbx)
	movzbl	%r8b, %r8d
	call	write_mos6502
	orb	$4, 6(%rbx)
	movq	%rbx, %rcx
	movl	$65534, %edx
	call	read_mos6502
	movzbl	%al, %eax
	movl	$65535, %edx
	movq	%rbx, %rcx
	movw	%ax, 4(%rbx)
	call	read_mos6502
	sall	$8, %eax
	orw	%ax, 4(%rbx)
	addq	$32, %rsp
	popq	%rbx
	ret
	.seh_endproc
	.p2align 4,,15
	.globl	abss
	.def	abss;	.scl	2;	.type	32;	.endef
	.seh_proc	abss
abss:
	pushq	%r12
	.seh_pushreg	%r12
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movzwl	4(%rcx), %edi
	movq	16(%rcx), %r9
	movq	%rcx, %rsi
	testq	%r9, %r9
	movl	%edi, %ebp
	je	.L2359
	xorl	%eax, %eax
	xorl	%ebx, %ebx
	.p2align 4,,10
.L2356:
	movq	%rbx, %r8
	salq	$5, %r8
	addq	8(%rsi), %r8
	movzwl	16(%r8), %edx
	cmpw	%dx, %bp
	jb	.L2355
	movzwl	18(%r8), %ecx
	movzwl	%dx, %r10d
	addl	%r10d, %ecx
	cmpl	%ecx, %edi
	jge	.L2355
	movl	%ebp, %eax
	movq	24(%r8), %rcx
	subl	%edx, %eax
	movzwl	%ax, %edx
	call	*(%r8)
	movq	16(%rsi), %r9
.L2355:
	addq	$1, %rbx
	cmpq	%r9, %rbx
	jb	.L2356
	movzwl	4(%rsi), %ebp
	testq	%r9, %r9
	movzbl	%al, %ebx
	leal	1(%rbp), %r12d
	movzwl	%r12w, %edi
	je	.L2363
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	.p2align 4,,10
.L2357:
	movq	%rbp, %r8
	salq	$5, %r8
	addq	8(%rsi), %r8
	movzwl	16(%r8), %edx
	cmpw	%dx, %r12w
	jb	.L2358
	movzwl	18(%r8), %ecx
	movzwl	%dx, %r10d
	addl	%r10d, %ecx
	cmpl	%ecx, %edi
	jge	.L2358
	movl	%r12d, %eax
	movq	24(%r8), %rcx
	subl	%edx, %eax
	movzwl	%ax, %edx
	call	*(%r8)
	movq	16(%rsi), %r9
.L2358:
	addq	$1, %rbp
	cmpq	%r9, %rbp
	jb	.L2357
	movzwl	4(%rsi), %ebp
	sall	$8, %eax
	orl	%ebx, %eax
.L2354:
	leal	2(%rbp), %edx
	movw	%dx, 4(%rsi)
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	ret
	.p2align 4,,10
.L2359:
	xorl	%eax, %eax
	jmp	.L2354
.L2363:
	movl	%ebx, %eax
	jmp	.L2354
	.seh_endproc
	.p2align 4,,15
	.globl	SLO_abss
	.def	SLO_abss;	.scl	2;	.type	32;	.endef
	.seh_proc	SLO_abss
SLO_abss:
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movq	%rcx, %rbx
	call	abss
	movzwl	%ax, %edi
	movq	%rbx, %rcx
	movl	%edi, %edx
	call	read_mos6502
	movzbl	%al, %esi
	movl	%edi, %edx
	movq	%rbx, %rcx
	addl	%esi, %esi
	movl	%esi, %r8d
	andl	$254, %r8d
	call	write_mos6502
	testb	$-128, %sil
	movzbl	6(%rbx), %edx
	je	.L2365
	orl	$-128, %edx
.L2366:
	movl	%edx, %eax
	andl	$-3, %edx
	movq	%rbx, %rcx
	orl	$2, %eax
	testb	$-2, %sil
	cmove	%eax, %edx
	movl	%edx, %eax
	andl	$-2, %edx
	orl	$1, %eax
	testw	$256, %si
	movzbl	(%rbx), %esi
	cmovne	%eax, %edx
	movb	%dl, 6(%rbx)
	call	abss
	movq	%rbx, %rcx
	movzwl	%ax, %edx
	call	read_mos6502
	orl	%esi, %eax
	movzbl	6(%rbx), %edx
	testb	%al, %al
	movb	%al, (%rbx)
	js	.L2374
	andl	$127, %edx
	testb	%al, %al
	movb	%dl, 6(%rbx)
	jne	.L2372
	orl	$2, %edx
	movl	$6, %eax
	movb	%dl, 6(%rbx)
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	ret
	.p2align 4,,10
.L2374:
	orl	$-128, %edx
.L2372:
	andl	$-3, %edx
	movl	$6, %eax
	movb	%dl, 6(%rbx)
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	ret
	.p2align 4,,10
.L2365:
	andl	$127, %edx
	jmp	.L2366
	.seh_endproc
	.p2align 4,,15
	.globl	SRE_abss
	.def	SRE_abss;	.scl	2;	.type	32;	.endef
	.seh_proc	SRE_abss
SRE_abss:
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
	call	abss
	movzwl	%ax, %esi
	movq	%rbx, %rcx
	movl	%esi, %edx
	call	read_mos6502
	movl	%eax, %edi
	movl	%eax, %ebp
	movl	%esi, %edx
	shrb	%dil
	movq	%rbx, %rcx
	movl	%edi, %r8d
	andl	$127, %r8d
	call	write_mos6502
	andl	$1, %ebp
	movzbl	6(%rbx), %eax
	je	.L2376
	orl	$1, %eax
.L2377:
	movl	%eax, %edx
	andl	$125, %eax
	movq	%rbx, %rcx
	andl	$127, %edx
	orl	$2, %edx
	testb	%dil, %dil
	cmove	%edx, %eax
	andl	$-2, %eax
	movb	%al, 6(%rbx)
	call	abss
	movq	%rbx, %rcx
	movzwl	%ax, %edx
	call	read_mos6502
	movzbl	(%rbx), %ecx
	movl	%ecx, %edx
	xorl	%eax, %edx
	testb	%dl, %dl
	movb	%dl, (%rbx)
	movzbl	6(%rbx), %edx
	js	.L2384
	andl	$127, %edx
.L2381:
	movl	%edx, %r8d
	andl	$-3, %edx
	orl	$2, %r8d
	cmpb	%al, %cl
	movl	$6, %eax
	cmove	%r8d, %edx
	movb	%dl, 6(%rbx)
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	ret
	.p2align 4,,10
.L2376:
	andl	$-2, %eax
	jmp	.L2377
	.p2align 4,,10
.L2384:
	orl	$-128, %edx
	jmp	.L2381
	.seh_endproc
	.p2align 4,,15
	.globl	ROL_abss
	.def	ROL_abss;	.scl	2;	.type	32;	.endef
	.seh_proc	ROL_abss
ROL_abss:
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movq	%rcx, %rbx
	call	abss
	movzwl	%ax, %edi
	movq	%rbx, %rcx
	movl	%edi, %edx
	call	read_mos6502
	rolb	%al
	movl	%edi, %edx
	movq	%rbx, %rcx
	movzbl	%al, %r8d
	movl	%r8d, %esi
	call	write_mos6502
	testb	%sil, %sil
	movzbl	6(%rbx), %edx
	js	.L2394
	andl	$127, %edx
.L2387:
	testb	%sil, %sil
	movb	%dl, 6(%rbx)
	jne	.L2388
	orl	$2, %edx
.L2389:
	andl	$-2, %edx
	movl	$6, %eax
	movb	%dl, 6(%rbx)
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	ret
	.p2align 4,,10
.L2388:
	andl	$-3, %edx
	andl	$1, %esi
	movb	%dl, 6(%rbx)
	je	.L2389
	orl	$1, %edx
	movl	$6, %eax
	movb	%dl, 6(%rbx)
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	ret
	.p2align 4,,10
.L2394:
	orl	$-128, %edx
	jmp	.L2387
	.seh_endproc
	.p2align 4,,15
	.globl	ROR_abss
	.def	ROR_abss;	.scl	2;	.type	32;	.endef
	.seh_proc	ROR_abss
ROR_abss:
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$40, %rsp
	.seh_stackalloc	40
	.seh_endprologue
	movq	%rcx, %rbx
	call	abss
	movzwl	%ax, %esi
	movq	%rbx, %rcx
	movl	%esi, %edx
	call	read_mos6502
	movzbl	6(%rbx), %edx
	movl	%eax, %ecx
	shrb	%cl
	movl	%edx, %r8d
	movl	%edx, %r9d
	andl	$127, %edx
	sall	$7, %r8d
	orl	$-128, %r9d
	orb	%cl, %r8b
	cmovs	%r9d, %edx
	movl	%edx, %ecx
	andl	$-3, %edx
	orl	$2, %ecx
	testb	%r8b, %r8b
	movzbl	%r8b, %r8d
	cmove	%ecx, %edx
	movl	%edx, %ecx
	andl	$-2, %edx
	orl	$1, %ecx
	testb	$1, %al
	cmovne	%ecx, %edx
	movq	%rbx, %rcx
	movb	%dl, 6(%rbx)
	movl	%esi, %edx
	call	write_mos6502
	movl	$6, %eax
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	ret
	.seh_endproc
	.p2align 4,,15
	.globl	accRead
	.def	accRead;	.scl	2;	.type	32;	.endef
	.seh_proc	accRead
accRead:
	.seh_endprologue
	movzbl	(%rcx), %eax
	ret
	.seh_endproc
	.p2align 4,,15
	.globl	accWrite
	.def	accWrite;	.scl	2;	.type	32;	.endef
	.seh_proc	accWrite
accWrite:
	.seh_endprologue
	movb	%dl, (%rcx)
	ret
	.seh_endproc
	.p2align 4,,15
	.globl	absx
	.def	absx;	.scl	2;	.type	32;	.endef
	.seh_proc	absx
absx:
	pushq	%r12
	.seh_pushreg	%r12
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movzwl	4(%rcx), %edi
	movq	16(%rcx), %r9
	movq	%rcx, %rsi
	testq	%r9, %r9
	movl	%edi, %ebp
	je	.L2410
	xorl	%eax, %eax
	xorl	%ebx, %ebx
	.p2align 4,,10
.L2407:
	movq	%rbx, %r8
	salq	$5, %r8
	addq	8(%rsi), %r8
	movzwl	16(%r8), %edx
	cmpw	%dx, %bp
	jb	.L2406
	movzwl	18(%r8), %ecx
	movzwl	%dx, %r10d
	addl	%r10d, %ecx
	cmpl	%ecx, %edi
	jge	.L2406
	movl	%ebp, %eax
	movq	24(%r8), %rcx
	subl	%edx, %eax
	movzwl	%ax, %edx
	call	*(%r8)
	movq	16(%rsi), %r9
.L2406:
	addq	$1, %rbx
	cmpq	%r9, %rbx
	jb	.L2407
	movzwl	4(%rsi), %ebp
	testq	%r9, %r9
	movzbl	%al, %ebx
	leal	1(%rbp), %r12d
	movzwl	%r12w, %edi
	je	.L2405
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	.p2align 4,,10
.L2408:
	movq	%rbp, %r8
	salq	$5, %r8
	addq	8(%rsi), %r8
	movzwl	16(%r8), %edx
	cmpw	%dx, %r12w
	jb	.L2409
	movzwl	18(%r8), %ecx
	movzwl	%dx, %r10d
	addl	%r10d, %ecx
	cmpl	%ecx, %edi
	jge	.L2409
	movl	%r12d, %eax
	movq	24(%r8), %rcx
	subl	%edx, %eax
	movzwl	%ax, %edx
	call	*(%r8)
	movq	16(%rsi), %r9
.L2409:
	addq	$1, %rbp
	cmpq	%r9, %rbp
	jb	.L2408
	movzwl	4(%rsi), %ebp
	sall	$8, %eax
	orl	%eax, %ebx
.L2405:
	movzbl	1(%rsi), %eax
	leal	2(%rbp), %edx
	movw	%dx, 4(%rsi)
	addl	%ebx, %eax
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	ret
	.p2align 4,,10
.L2410:
	xorl	%ebx, %ebx
	jmp	.L2405
	.seh_endproc
	.p2align 4,,15
	.globl	SLO_absx
	.def	SLO_absx;	.scl	2;	.type	32;	.endef
	.seh_proc	SLO_absx
SLO_absx:
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movq	%rcx, %rbx
	call	absx
	movzwl	%ax, %edi
	movq	%rbx, %rcx
	movl	%edi, %edx
	call	read_mos6502
	movzbl	%al, %esi
	movl	%edi, %edx
	movq	%rbx, %rcx
	addl	%esi, %esi
	movl	%esi, %r8d
	andl	$254, %r8d
	call	write_mos6502
	testb	$-128, %sil
	movzbl	6(%rbx), %edx
	je	.L2415
	orl	$-128, %edx
.L2416:
	movl	%edx, %eax
	andl	$-3, %edx
	movq	%rbx, %rcx
	orl	$2, %eax
	testb	$-2, %sil
	cmove	%eax, %edx
	movl	%edx, %eax
	andl	$-2, %edx
	orl	$1, %eax
	testw	$256, %si
	movzbl	(%rbx), %esi
	cmovne	%eax, %edx
	movb	%dl, 6(%rbx)
	call	absx
	movq	%rbx, %rcx
	movzwl	%ax, %edx
	call	read_mos6502
	orl	%esi, %eax
	movzbl	6(%rbx), %edx
	testb	%al, %al
	movb	%al, (%rbx)
	js	.L2424
	andl	$127, %edx
	testb	%al, %al
	movb	%dl, 6(%rbx)
	jne	.L2422
	orl	$2, %edx
	movl	$7, %eax
	movb	%dl, 6(%rbx)
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	ret
	.p2align 4,,10
.L2424:
	orl	$-128, %edx
.L2422:
	andl	$-3, %edx
	movl	$7, %eax
	movb	%dl, 6(%rbx)
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	ret
	.p2align 4,,10
.L2415:
	andl	$127, %edx
	jmp	.L2416
	.seh_endproc
	.p2align 4,,15
	.globl	SRE_absx
	.def	SRE_absx;	.scl	2;	.type	32;	.endef
	.seh_proc	SRE_absx
SRE_absx:
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
	call	absx
	movzwl	%ax, %esi
	movq	%rbx, %rcx
	movl	%esi, %edx
	call	read_mos6502
	movl	%eax, %edi
	movl	%eax, %ebp
	movl	%esi, %edx
	shrb	%dil
	movq	%rbx, %rcx
	movl	%edi, %r8d
	andl	$127, %r8d
	call	write_mos6502
	andl	$1, %ebp
	movzbl	6(%rbx), %eax
	je	.L2426
	orl	$1, %eax
.L2427:
	movl	%eax, %edx
	andl	$125, %eax
	movq	%rbx, %rcx
	andl	$127, %edx
	orl	$2, %edx
	testb	%dil, %dil
	cmove	%edx, %eax
	andl	$-2, %eax
	movb	%al, 6(%rbx)
	call	absx
	movq	%rbx, %rcx
	movzwl	%ax, %edx
	call	read_mos6502
	movzbl	(%rbx), %ecx
	movl	%ecx, %edx
	xorl	%eax, %edx
	testb	%dl, %dl
	movb	%dl, (%rbx)
	movzbl	6(%rbx), %edx
	js	.L2434
	andl	$127, %edx
.L2431:
	movl	%edx, %r8d
	andl	$-3, %edx
	orl	$2, %r8d
	cmpb	%al, %cl
	movl	$7, %eax
	cmove	%r8d, %edx
	movb	%dl, 6(%rbx)
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	ret
	.p2align 4,,10
.L2426:
	andl	$-2, %eax
	jmp	.L2427
	.p2align 4,,10
.L2434:
	orl	$-128, %edx
	jmp	.L2431
	.seh_endproc
	.p2align 4,,15
	.globl	ROL_absx
	.def	ROL_absx;	.scl	2;	.type	32;	.endef
	.seh_proc	ROL_absx
ROL_absx:
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movq	%rcx, %rbx
	call	absx
	movzwl	%ax, %edi
	movq	%rbx, %rcx
	movl	%edi, %edx
	call	read_mos6502
	rolb	%al
	movl	%edi, %edx
	movq	%rbx, %rcx
	movzbl	%al, %r8d
	movl	%r8d, %esi
	call	write_mos6502
	testb	%sil, %sil
	movzbl	6(%rbx), %edx
	js	.L2444
	andl	$127, %edx
.L2437:
	testb	%sil, %sil
	movb	%dl, 6(%rbx)
	jne	.L2438
	orl	$2, %edx
.L2439:
	andl	$-2, %edx
	movl	$7, %eax
	movb	%dl, 6(%rbx)
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	ret
	.p2align 4,,10
.L2438:
	andl	$-3, %edx
	andl	$1, %esi
	movb	%dl, 6(%rbx)
	je	.L2439
	orl	$1, %edx
	movl	$7, %eax
	movb	%dl, 6(%rbx)
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	ret
	.p2align 4,,10
.L2444:
	orl	$-128, %edx
	jmp	.L2437
	.seh_endproc
	.p2align 4,,15
	.globl	LSR_absx
	.def	LSR_absx;	.scl	2;	.type	32;	.endef
	.seh_proc	LSR_absx
LSR_absx:
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
	call	absx
	movzwl	%ax, %esi
	movq	%rbx, %rcx
	movl	%esi, %edx
	call	read_mos6502
	movl	%eax, %ebp
	movl	%esi, %edx
	movq	%rbx, %rcx
	shrb	%bpl
	movl	%eax, %edi
	movl	%ebp, %r8d
	andl	$127, %r8d
	call	write_mos6502
	movzbl	6(%rbx), %ecx
	movl	%ecx, %edx
	andl	$125, %ecx
	andl	$127, %edx
	orl	$2, %edx
	testb	%bpl, %bpl
	cmovne	%ecx, %edx
	movl	%edx, %eax
	andl	$-2, %edx
	orl	$1, %eax
	andl	$1, %edi
	cmovne	%eax, %edx
	movl	$5, %eax
	movb	%dl, 6(%rbx)
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	ret
	.seh_endproc
	.p2align 4,,15
	.globl	ADC_absx
	.def	ADC_absx;	.scl	2;	.type	32;	.endef
	.seh_proc	ADC_absx
ADC_absx:
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movq	%rcx, %rbx
	call	absx
	movq	%rbx, %rcx
	movzwl	%ax, %edx
	call	read_mos6502
	movzbl	6(%rbx), %edx
	movzbl	(%rbx), %ecx
	movl	%edx, %r8d
	movl	%ecx, %r9d
	andl	$1, %r8d
	xorl	%eax, %r9d
	addl	%ecx, %r8d
	movzbl	%al, %ecx
	notl	%r9d
	addl	%r8d, %ecx
	movl	%edx, %r8d
	andl	$127, %edx
	orl	$-128, %r8d
	testb	$-128, %cl
	movb	%cl, (%rbx)
	cmovne	%r8d, %edx
	movl	%edx, %r8d
	andl	$-3, %edx
	orl	$2, %r8d
	testb	%cl, %cl
	cmove	%r8d, %edx
	movl	%edx, %r8d
	andl	$-2, %edx
	orl	$1, %r8d
	testb	$1, %ch
	cmovne	%r8d, %edx
	xorl	%ecx, %eax
	movl	%edx, %ecx
	andl	$-65, %edx
	orl	$64, %ecx
	testb	%r9b, %al
	movl	$4, %eax
	cmovs	%ecx, %edx
	movb	%dl, 6(%rbx)
	addq	$32, %rsp
	popq	%rbx
	ret
	.seh_endproc
	.p2align 4,,15
	.globl	SBC_absx
	.def	SBC_absx;	.scl	2;	.type	32;	.endef
	.seh_proc	SBC_absx
SBC_absx:
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movq	%rcx, %rbx
	call	absx
	movq	%rbx, %rcx
	movzwl	%ax, %edx
	call	read_mos6502
	movzbl	6(%rbx), %edx
	movzbl	(%rbx), %r8d
	movl	%edx, %ecx
	movl	%r8d, %r9d
	andl	$1, %ecx
	addl	%ecx, %r8d
	movl	%eax, %ecx
	notl	%ecx
	movzbl	%cl, %ecx
	addl	%r8d, %ecx
	movl	%edx, %r8d
	andl	$127, %edx
	orl	$-128, %r8d
	testb	$-128, %cl
	cmovne	%r8d, %edx
	movl	%edx, %r8d
	andl	$-3, %edx
	orl	$2, %r8d
	testb	%cl, %cl
	cmove	%r8d, %edx
	movl	%edx, %r8d
	andl	$-2, %edx
	orl	$1, %r8d
	testb	$1, %ch
	cmovne	%r8d, %edx
	xorl	%r8d, %r8d
	cmpb	%cl, %r9b
	setl	%r8b
	testb	%al, %al
	jns	.L2467
	xorl	%r8d, %r8d
	cmpb	%cl, %r9b
	setg	%r8b
.L2467:
	movl	%edx, %eax
	andl	$-65, %edx
	movb	%cl, (%rbx)
	orl	$64, %eax
	testl	%r8d, %r8d
	cmovne	%eax, %edx
	movl	$4, %eax
	movb	%dl, 6(%rbx)
	addq	$32, %rsp
	popq	%rbx
	ret
	.seh_endproc
	.p2align 4,,15
	.globl	ROR_absx
	.def	ROR_absx;	.scl	2;	.type	32;	.endef
	.seh_proc	ROR_absx
ROR_absx:
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$40, %rsp
	.seh_stackalloc	40
	.seh_endprologue
	movq	%rcx, %rbx
	call	absx
	movzwl	%ax, %esi
	movq	%rbx, %rcx
	movl	%esi, %edx
	call	read_mos6502
	movzbl	6(%rbx), %edx
	movl	%eax, %ecx
	shrb	%cl
	movl	%edx, %r8d
	movl	%edx, %r9d
	andl	$127, %edx
	sall	$7, %r8d
	orl	$-128, %r9d
	orb	%cl, %r8b
	cmovs	%r9d, %edx
	movl	%edx, %ecx
	andl	$-3, %edx
	orl	$2, %ecx
	testb	%r8b, %r8b
	movzbl	%r8b, %r8d
	cmove	%ecx, %edx
	movl	%edx, %ecx
	andl	$-2, %edx
	orl	$1, %ecx
	testb	$1, %al
	cmovne	%ecx, %edx
	movq	%rbx, %rcx
	movb	%dl, 6(%rbx)
	movl	%esi, %edx
	call	write_mos6502
	movl	$7, %eax
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	ret
	.seh_endproc
	.p2align 4,,15
	.globl	INC_absx
	.def	INC_absx;	.scl	2;	.type	32;	.endef
	.seh_proc	INC_absx
INC_absx:
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$40, %rsp
	.seh_stackalloc	40
	.seh_endprologue
	movq	%rcx, %rbx
	call	absx
	movzwl	%ax, %esi
	movq	%rbx, %rcx
	movl	%esi, %edx
	call	read_mos6502
	addl	$1, %eax
	movzbl	6(%rbx), %edx
	testb	%al, %al
	movzbl	%al, %r8d
	js	.L2481
	andl	$127, %edx
	testb	%al, %al
	movb	%dl, 6(%rbx)
	jne	.L2479
	orl	$2, %edx
	jmp	.L2480
	.p2align 4,,10
.L2481:
	orl	$-128, %edx
.L2479:
	andl	$-3, %edx
.L2480:
	movb	%dl, 6(%rbx)
	movq	%rbx, %rcx
	movl	%esi, %edx
	call	write_mos6502
	movl	$7, %eax
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	ret
	.seh_endproc
	.p2align 4,,15
	.globl	DEC_absx
	.def	DEC_absx;	.scl	2;	.type	32;	.endef
	.seh_proc	DEC_absx
DEC_absx:
	pushq	%r13
	.seh_pushreg	%r13
	pushq	%r12
	.seh_pushreg	%r12
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
	movq	%rcx, %r12
	call	absx
	movzwl	%ax, %esi
	movq	%r12, %rcx
	movl	%esi, %edx
	movl	%esi, %r13d
	call	read_mos6502
	leal	-1(%rax), %ebx
	movq	16(%r12), %rax
	movzbl	%bl, %edi
	testq	%rax, %rax
	je	.L2483
	xorl	%ebp, %ebp
	.p2align 4,,10
.L2485:
	movq	%rbp, %r9
	salq	$5, %r9
	addq	8(%r12), %r9
	movzwl	16(%r9), %edx
	cmpw	%dx, %r13w
	jb	.L2484
	movzwl	18(%r9), %ecx
	movzwl	%dx, %r8d
	addl	%r8d, %ecx
	cmpl	%ecx, %esi
	jge	.L2484
	movl	%r13d, %eax
	movq	24(%r9), %rcx
	movl	%edi, %r8d
	subl	%edx, %eax
	movzwl	%ax, %edx
	call	*8(%r9)
	movq	16(%r12), %rax
.L2484:
	addq	$1, %rbp
	cmpq	%rax, %rbp
	jb	.L2485
.L2483:
	testb	%bl, %bl
	movzbl	6(%r12), %eax
	js	.L2493
	andl	$127, %eax
	testb	%bl, %bl
	movb	%al, 6(%r12)
	jne	.L2487
	orl	$2, %eax
	jmp	.L2488
	.p2align 4,,10
.L2493:
	orl	$-128, %eax
.L2487:
	andl	$-3, %eax
.L2488:
	movb	%al, 6(%r12)
	movl	$7, %eax
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	ret
	.seh_endproc
	.p2align 4,,15
	.globl	absy
	.def	absy;	.scl	2;	.type	32;	.endef
	.seh_proc	absy
absy:
	pushq	%r12
	.seh_pushreg	%r12
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movzwl	4(%rcx), %edi
	movq	16(%rcx), %r9
	movq	%rcx, %rsi
	testq	%r9, %r9
	movl	%edi, %ebp
	je	.L2500
	xorl	%eax, %eax
	xorl	%ebx, %ebx
	.p2align 4,,10
.L2497:
	movq	%rbx, %r8
	salq	$5, %r8
	addq	8(%rsi), %r8
	movzwl	16(%r8), %edx
	cmpw	%dx, %bp
	jb	.L2496
	movzwl	18(%r8), %ecx
	movzwl	%dx, %r10d
	addl	%r10d, %ecx
	cmpl	%ecx, %edi
	jge	.L2496
	movl	%ebp, %eax
	movq	24(%r8), %rcx
	subl	%edx, %eax
	movzwl	%ax, %edx
	call	*(%r8)
	movq	16(%rsi), %r9
.L2496:
	addq	$1, %rbx
	cmpq	%r9, %rbx
	jb	.L2497
	movzwl	4(%rsi), %ebp
	testq	%r9, %r9
	movzbl	%al, %ebx
	leal	1(%rbp), %r12d
	movzwl	%r12w, %edi
	je	.L2495
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	.p2align 4,,10
.L2498:
	movq	%rbp, %r8
	salq	$5, %r8
	addq	8(%rsi), %r8
	movzwl	16(%r8), %edx
	cmpw	%dx, %r12w
	jb	.L2499
	movzwl	18(%r8), %ecx
	movzwl	%dx, %r10d
	addl	%r10d, %ecx
	cmpl	%ecx, %edi
	jge	.L2499
	movl	%r12d, %eax
	movq	24(%r8), %rcx
	subl	%edx, %eax
	movzwl	%ax, %edx
	call	*(%r8)
	movq	16(%rsi), %r9
.L2499:
	addq	$1, %rbp
	cmpq	%r9, %rbp
	jb	.L2498
	movzwl	4(%rsi), %ebp
	sall	$8, %eax
	orl	%eax, %ebx
.L2495:
	movzbl	2(%rsi), %eax
	leal	2(%rbp), %edx
	movw	%dx, 4(%rsi)
	addl	%ebx, %eax
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	ret
	.p2align 4,,10
.L2500:
	xorl	%ebx, %ebx
	jmp	.L2495
	.seh_endproc
	.p2align 4,,15
	.globl	imm
	.def	imm;	.scl	2;	.type	32;	.endef
	.seh_proc	imm
imm:
	.seh_endprologue
	movzwl	4(%rcx), %eax
	leal	1(%rax), %edx
	movw	%dx, 4(%rcx)
	ret
	.seh_endproc
	.p2align 4,,15
	.globl	ind
	.def	ind;	.scl	2;	.type	32;	.endef
	.seh_proc	ind
ind:
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movzwl	4(%rcx), %edx
	movq	%rcx, %rsi
	call	read_mos6502
	movzbl	%al, %edi
	movzwl	4(%rsi), %eax
	movq	%rsi, %rcx
	leal	1(%rax), %edx
	movzwl	%dx, %edx
	call	read_mos6502
	movl	%eax, %ebx
	movq	%rsi, %rcx
	sall	$8, %ebx
	orl	%edi, %ebx
	movzwl	%bx, %edx
	call	read_mos6502
	leal	1(%rbx), %edx
	xorb	%bl, %bl
	movq	%rsi, %rcx
	movzbl	%al, %edi
	movzbl	%dl, %edx
	orl	%edx, %ebx
	movzwl	%bx, %edx
	call	read_mos6502
	addw	$2, 4(%rsi)
	sall	$8, %eax
	orl	%edi, %eax
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	ret
	.seh_endproc
	.p2align 4,,15
	.globl	xind
	.def	xind;	.scl	2;	.type	32;	.endef
	.seh_proc	xind
xind:
	pushq	%r13
	.seh_pushreg	%r13
	pushq	%r12
	.seh_pushreg	%r12
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
	movzwl	4(%rcx), %ebp
	movq	16(%rcx), %r9
	movq	%rcx, %rbx
	testq	%r9, %r9
	movl	%ebp, %r12d
	je	.L2515
	xorl	%eax, %eax
	xorl	%esi, %esi
	.p2align 4,,10
.L2509:
	movq	%rsi, %r8
	salq	$5, %r8
	addq	8(%rbx), %r8
	movzwl	16(%r8), %edx
	cmpw	%dx, %r12w
	jb	.L2508
	movzwl	18(%r8), %ecx
	movzwl	%dx, %r10d
	addl	%r10d, %ecx
	cmpl	%ecx, %ebp
	jge	.L2508
	movl	%r12d, %eax
	movq	24(%r8), %rcx
	subl	%edx, %eax
	movzwl	%ax, %edx
	call	*(%r8)
	movq	16(%rbx), %r9
.L2508:
	addq	$1, %rsi
	cmpq	%r9, %rsi
	jb	.L2509
	addb	1(%rbx), %al
	testq	%r9, %r9
	movzbl	%al, %ebp
	movl	%ebp, %edi
	movzbl	%bpl, %r13d
	je	.L2515
	xorl	%eax, %eax
	xorl	%r12d, %r12d
	.p2align 4,,10
.L2511:
	movq	%r12, %r8
	salq	$5, %r8
	addq	8(%rbx), %r8
	movzwl	16(%r8), %edx
	cmpw	%dx, %r13w
	jb	.L2510
	movzwl	18(%r8), %ecx
	movzwl	%dx, %r10d
	addl	%r10d, %ecx
	cmpl	%ecx, %ebp
	jge	.L2510
	movl	%r13d, %eax
	movq	24(%r8), %rcx
	subl	%edx, %eax
	movzwl	%ax, %edx
	call	*(%r8)
	movq	16(%rbx), %r9
.L2510:
	addq	$1, %r12
	cmpq	%r9, %r12
	jb	.L2511
	leal	1(%rdi), %r12d
	testq	%r9, %r9
	movzbl	%al, %esi
	movzbl	%r12b, %edi
	movzbl	%r12b, %r12d
	je	.L2516
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	.p2align 4,,10
.L2513:
	movq	%rbp, %r8
	salq	$5, %r8
	addq	8(%rbx), %r8
	movzwl	16(%r8), %edx
	cmpw	%dx, %r12w
	jb	.L2512
	movzwl	18(%r8), %ecx
	movzwl	%dx, %r10d
	addl	%r10d, %ecx
	cmpl	%ecx, %edi
	jge	.L2512
	movl	%r12d, %eax
	movq	24(%r8), %rcx
	subl	%edx, %eax
	movzwl	%ax, %edx
	call	*(%r8)
	movq	16(%rbx), %r9
.L2512:
	addq	$1, %rbp
	cmpq	%r9, %rbp
	jb	.L2513
	sall	$8, %eax
.L2507:
	addw	$1, 4(%rbx)
	orl	%esi, %eax
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	ret
	.p2align 4,,10
.L2515:
	xorl	%eax, %eax
	xorl	%esi, %esi
	jmp	.L2507
.L2516:
	xorl	%eax, %eax
	jmp	.L2507
	.seh_endproc
	.p2align 4,,15
	.globl	SLO_xind
	.def	SLO_xind;	.scl	2;	.type	32;	.endef
	.seh_proc	SLO_xind
SLO_xind:
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movq	%rcx, %rbx
	call	xind
	movzwl	%ax, %edi
	movq	%rbx, %rcx
	movl	%edi, %edx
	call	read_mos6502
	movzbl	%al, %esi
	movl	%edi, %edx
	movq	%rbx, %rcx
	addl	%esi, %esi
	movl	%esi, %r8d
	andl	$254, %r8d
	call	write_mos6502
	testb	$-128, %sil
	movzbl	6(%rbx), %edx
	je	.L2521
	orl	$-128, %edx
.L2522:
	movl	%edx, %eax
	andl	$-3, %edx
	movq	%rbx, %rcx
	orl	$2, %eax
	testb	$-2, %sil
	cmove	%eax, %edx
	movl	%edx, %eax
	andl	$-2, %edx
	orl	$1, %eax
	testw	$256, %si
	movzbl	(%rbx), %esi
	cmovne	%eax, %edx
	movb	%dl, 6(%rbx)
	call	xind
	movq	%rbx, %rcx
	movzwl	%ax, %edx
	call	read_mos6502
	orl	%esi, %eax
	movzbl	6(%rbx), %edx
	testb	%al, %al
	movb	%al, (%rbx)
	js	.L2530
	andl	$127, %edx
	testb	%al, %al
	movb	%dl, 6(%rbx)
	jne	.L2528
	orl	$2, %edx
	movl	$8, %eax
	movb	%dl, 6(%rbx)
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	ret
	.p2align 4,,10
.L2530:
	orl	$-128, %edx
.L2528:
	andl	$-3, %edx
	movl	$8, %eax
	movb	%dl, 6(%rbx)
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	ret
	.p2align 4,,10
.L2521:
	andl	$127, %edx
	jmp	.L2522
	.seh_endproc
	.p2align 4,,15
	.globl	SRE_xind
	.def	SRE_xind;	.scl	2;	.type	32;	.endef
	.seh_proc	SRE_xind
SRE_xind:
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
	call	xind
	movzwl	%ax, %esi
	movq	%rbx, %rcx
	movl	%esi, %edx
	call	read_mos6502
	movl	%eax, %edi
	movl	%eax, %ebp
	movl	%esi, %edx
	shrb	%dil
	movq	%rbx, %rcx
	movl	%edi, %r8d
	andl	$127, %r8d
	call	write_mos6502
	andl	$1, %ebp
	movzbl	6(%rbx), %eax
	je	.L2532
	orl	$1, %eax
.L2533:
	movl	%eax, %edx
	andl	$125, %eax
	movq	%rbx, %rcx
	andl	$127, %edx
	orl	$2, %edx
	testb	%dil, %dil
	cmove	%edx, %eax
	andl	$-2, %eax
	movb	%al, 6(%rbx)
	call	xind
	movq	%rbx, %rcx
	movzwl	%ax, %edx
	call	read_mos6502
	movzbl	(%rbx), %ecx
	movl	%ecx, %edx
	xorl	%eax, %edx
	testb	%dl, %dl
	movb	%dl, (%rbx)
	movzbl	6(%rbx), %edx
	js	.L2540
	andl	$127, %edx
.L2537:
	movl	%edx, %r8d
	andl	$-3, %edx
	orl	$2, %r8d
	cmpb	%al, %cl
	movl	$8, %eax
	cmove	%r8d, %edx
	movb	%dl, 6(%rbx)
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	ret
	.p2align 4,,10
.L2532:
	andl	$-2, %eax
	jmp	.L2533
	.p2align 4,,10
.L2540:
	orl	$-128, %edx
	jmp	.L2537
	.seh_endproc
	.p2align 4,,15
	.globl	SBC_xind
	.def	SBC_xind;	.scl	2;	.type	32;	.endef
	.seh_proc	SBC_xind
SBC_xind:
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movq	%rcx, %rbx
	call	xind
	movq	%rbx, %rcx
	movzwl	%ax, %edx
	call	read_mos6502
	movzbl	6(%rbx), %edx
	movzbl	(%rbx), %r8d
	movl	%edx, %ecx
	movl	%r8d, %r9d
	andl	$1, %ecx
	addl	%ecx, %r8d
	movl	%eax, %ecx
	notl	%ecx
	movzbl	%cl, %ecx
	addl	%r8d, %ecx
	movl	%edx, %r8d
	andl	$127, %edx
	orl	$-128, %r8d
	testb	$-128, %cl
	cmovne	%r8d, %edx
	movl	%edx, %r8d
	andl	$-3, %edx
	orl	$2, %r8d
	testb	%cl, %cl
	cmove	%r8d, %edx
	movl	%edx, %r8d
	andl	$-2, %edx
	orl	$1, %r8d
	testb	$1, %ch
	cmovne	%r8d, %edx
	xorl	%r8d, %r8d
	cmpb	%cl, %r9b
	setl	%r8b
	testb	%al, %al
	jns	.L2549
	xorl	%r8d, %r8d
	cmpb	%cl, %r9b
	setg	%r8b
.L2549:
	movl	%edx, %eax
	andl	$-65, %edx
	movb	%cl, (%rbx)
	orl	$64, %eax
	testl	%r8d, %r8d
	cmovne	%eax, %edx
	movl	$6, %eax
	movb	%dl, 6(%rbx)
	addq	$32, %rsp
	popq	%rbx
	ret
	.seh_endproc
	.p2align 4,,15
	.globl	indy
	.def	indy;	.scl	2;	.type	32;	.endef
	.seh_proc	indy
indy:
	pushq	%r13
	.seh_pushreg	%r13
	pushq	%r12
	.seh_pushreg	%r12
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
	movzwl	4(%rcx), %ebp
	movq	16(%rcx), %r9
	movq	%rcx, %rbx
	testq	%r9, %r9
	movl	%ebp, %r12d
	je	.L2561
	xorl	%edi, %edi
	xorl	%esi, %esi
	.p2align 4,,10
.L2555:
	movq	%rsi, %rax
	salq	$5, %rax
	addq	8(%rbx), %rax
	movzwl	16(%rax), %edx
	cmpw	%dx, %r12w
	jb	.L2554
	movzwl	18(%rax), %ecx
	movzwl	%dx, %r8d
	addl	%r8d, %ecx
	cmpl	%ecx, %ebp
	jge	.L2554
	movl	%r12d, %edi
	movq	24(%rax), %rcx
	subl	%edx, %edi
	movzwl	%di, %edx
	call	*(%rax)
	movq	16(%rbx), %r9
	movl	%eax, %edi
.L2554:
	addq	$1, %rsi
	cmpq	%r9, %rsi
	jb	.L2555
	testq	%r9, %r9
	movzbl	%dil, %ebp
	movzbl	%dil, %r13d
	je	.L2561
	xorl	%eax, %eax
	xorl	%r12d, %r12d
	.p2align 4,,10
.L2557:
	movq	%r12, %r8
	salq	$5, %r8
	addq	8(%rbx), %r8
	movzwl	16(%r8), %edx
	cmpw	%dx, %r13w
	jb	.L2556
	movzwl	18(%r8), %ecx
	movzwl	%dx, %r10d
	addl	%r10d, %ecx
	cmpl	%ecx, %ebp
	jge	.L2556
	movl	%r13d, %eax
	movq	24(%r8), %rcx
	subl	%edx, %eax
	movzwl	%ax, %edx
	call	*(%r8)
	movq	16(%rbx), %r9
.L2556:
	addq	$1, %r12
	cmpq	%r9, %r12
	jb	.L2557
	leal	1(%rdi), %r12d
	testq	%r9, %r9
	movzbl	%al, %esi
	movzbl	%r12b, %edi
	movzbl	%r12b, %r12d
	je	.L2562
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	.p2align 4,,10
.L2559:
	movq	%rbp, %r8
	salq	$5, %r8
	addq	8(%rbx), %r8
	movzwl	16(%r8), %edx
	cmpw	%r12w, %dx
	ja	.L2558
	movzwl	18(%r8), %ecx
	movzwl	%dx, %r10d
	addl	%r10d, %ecx
	cmpl	%edi, %ecx
	jle	.L2558
	movl	%r12d, %eax
	movq	24(%r8), %rcx
	subl	%edx, %eax
	movzwl	%ax, %edx
	call	*(%r8)
	movq	16(%rbx), %r9
.L2558:
	addq	$1, %rbp
	cmpq	%r9, %rbp
	jb	.L2559
	sall	$8, %eax
.L2553:
	orl	%esi, %eax
	movzbl	2(%rbx), %esi
	addw	$1, 4(%rbx)
	addl	%esi, %eax
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	ret
	.p2align 4,,10
.L2561:
	xorl	%eax, %eax
	xorl	%esi, %esi
	jmp	.L2553
.L2562:
	xorl	%eax, %eax
	jmp	.L2553
	.seh_endproc
	.p2align 4,,15
	.globl	SLO_indy
	.def	SLO_indy;	.scl	2;	.type	32;	.endef
	.seh_proc	SLO_indy
SLO_indy:
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movq	%rcx, %rbx
	call	indy
	movzwl	%ax, %edi
	movq	%rbx, %rcx
	movl	%edi, %edx
	call	read_mos6502
	movzbl	%al, %esi
	movl	%edi, %edx
	movq	%rbx, %rcx
	addl	%esi, %esi
	movl	%esi, %r8d
	andl	$254, %r8d
	call	write_mos6502
	testb	$-128, %sil
	movzbl	6(%rbx), %edx
	je	.L2567
	orl	$-128, %edx
.L2568:
	movl	%edx, %eax
	andl	$-3, %edx
	movq	%rbx, %rcx
	orl	$2, %eax
	testb	$-2, %sil
	cmove	%eax, %edx
	movl	%edx, %eax
	andl	$-2, %edx
	orl	$1, %eax
	testw	$256, %si
	movzbl	(%rbx), %esi
	cmovne	%eax, %edx
	movb	%dl, 6(%rbx)
	call	indy
	movq	%rbx, %rcx
	movzwl	%ax, %edx
	call	read_mos6502
	orl	%esi, %eax
	movzbl	6(%rbx), %edx
	testb	%al, %al
	movb	%al, (%rbx)
	js	.L2576
	andl	$127, %edx
	testb	%al, %al
	movb	%dl, 6(%rbx)
	jne	.L2574
	orl	$2, %edx
	movl	$8, %eax
	movb	%dl, 6(%rbx)
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	ret
	.p2align 4,,10
.L2576:
	orl	$-128, %edx
.L2574:
	andl	$-3, %edx
	movl	$8, %eax
	movb	%dl, 6(%rbx)
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	ret
	.p2align 4,,10
.L2567:
	andl	$127, %edx
	jmp	.L2568
	.seh_endproc
	.p2align 4,,15
	.globl	SRE_indy
	.def	SRE_indy;	.scl	2;	.type	32;	.endef
	.seh_proc	SRE_indy
SRE_indy:
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
	call	indy
	movzwl	%ax, %esi
	movq	%rbx, %rcx
	movl	%esi, %edx
	call	read_mos6502
	movl	%eax, %edi
	movl	%eax, %ebp
	movl	%esi, %edx
	shrb	%dil
	movq	%rbx, %rcx
	movl	%edi, %r8d
	andl	$127, %r8d
	call	write_mos6502
	andl	$1, %ebp
	movzbl	6(%rbx), %eax
	je	.L2578
	orl	$1, %eax
.L2579:
	movl	%eax, %edx
	andl	$125, %eax
	movq	%rbx, %rcx
	andl	$127, %edx
	orl	$2, %edx
	testb	%dil, %dil
	cmove	%edx, %eax
	andl	$-2, %eax
	movb	%al, 6(%rbx)
	call	indy
	movq	%rbx, %rcx
	movzwl	%ax, %edx
	call	read_mos6502
	movzbl	(%rbx), %ecx
	movl	%ecx, %edx
	xorl	%eax, %edx
	testb	%dl, %dl
	movb	%dl, (%rbx)
	movzbl	6(%rbx), %edx
	js	.L2586
	andl	$127, %edx
.L2583:
	movl	%edx, %r8d
	andl	$-3, %edx
	orl	$2, %r8d
	cmpb	%al, %cl
	movl	$8, %eax
	cmove	%r8d, %edx
	movb	%dl, 6(%rbx)
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	ret
	.p2align 4,,10
.L2578:
	andl	$-2, %eax
	jmp	.L2579
	.p2align 4,,10
.L2586:
	orl	$-128, %edx
	jmp	.L2583
	.seh_endproc
	.p2align 4,,15
	.globl	zpg
	.def	zpg;	.scl	2;	.type	32;	.endef
	.seh_proc	zpg
zpg:
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
	movzwl	4(%rcx), %ebp
	movq	16(%rcx), %r9
	movq	%rcx, %rdi
	testq	%r9, %r9
	movl	%ebp, %esi
	je	.L2591
	xorl	%eax, %eax
	xorl	%ebx, %ebx
	.p2align 4,,10
.L2590:
	movq	%rbx, %r8
	salq	$5, %r8
	addq	8(%rdi), %r8
	movzwl	16(%r8), %edx
	cmpw	%dx, %si
	jb	.L2589
	movzwl	18(%r8), %ecx
	movzwl	%dx, %r10d
	addl	%r10d, %ecx
	cmpl	%ecx, %ebp
	jge	.L2589
	movl	%esi, %eax
	movq	24(%r8), %rcx
	subl	%edx, %eax
	movzwl	%ax, %edx
	call	*(%r8)
	movq	16(%rdi), %r9
.L2589:
	addq	$1, %rbx
	cmpq	%r9, %rbx
	jb	.L2590
	movzwl	4(%rdi), %esi
	movzbl	%al, %eax
	addl	$1, %esi
	movw	%si, 4(%rdi)
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	ret
	.p2align 4,,10
.L2591:
	xorl	%eax, %eax
	addl	$1, %esi
	movw	%si, 4(%rdi)
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	ret
	.seh_endproc
	.p2align 4,,15
	.globl	zpgx
	.def	zpgx;	.scl	2;	.type	32;	.endef
	.seh_proc	zpgx
zpgx:
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
	movzwl	4(%rcx), %ebp
	movq	16(%rcx), %r9
	xorl	%eax, %eax
	movq	%rcx, %rsi
	testq	%r9, %r9
	movl	%ebp, %edi
	je	.L2594
	xorl	%ebx, %ebx
	.p2align 4,,10
.L2596:
	movq	%rbx, %r8
	salq	$5, %r8
	addq	8(%rsi), %r8
	movzwl	16(%r8), %edx
	cmpw	%dx, %di
	jb	.L2595
	movzwl	18(%r8), %ecx
	movzwl	%dx, %r10d
	addl	%r10d, %ecx
	cmpl	%ecx, %ebp
	jge	.L2595
	movl	%edi, %eax
	movq	24(%r8), %rcx
	subl	%edx, %eax
	movzwl	%ax, %edx
	call	*(%r8)
	movq	16(%rsi), %r9
.L2595:
	addq	$1, %rbx
	cmpq	%r9, %rbx
	jb	.L2596
	movzwl	4(%rsi), %edi
.L2594:
	addb	1(%rsi), %al
	addl	$1, %edi
	movw	%di, 4(%rsi)
	movzbl	%al, %eax
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	ret
	.seh_endproc
	.p2align 4,,15
	.globl	zpgy
	.def	zpgy;	.scl	2;	.type	32;	.endef
	.seh_proc	zpgy
zpgy:
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
	movzwl	4(%rcx), %ebp
	movq	16(%rcx), %r9
	xorl	%eax, %eax
	movq	%rcx, %rsi
	testq	%r9, %r9
	movl	%ebp, %edi
	je	.L2600
	xorl	%ebx, %ebx
	.p2align 4,,10
.L2602:
	movq	%rbx, %r8
	salq	$5, %r8
	addq	8(%rsi), %r8
	movzwl	16(%r8), %edx
	cmpw	%dx, %di
	jb	.L2601
	movzwl	18(%r8), %ecx
	movzwl	%dx, %r10d
	addl	%r10d, %ecx
	cmpl	%ecx, %ebp
	jge	.L2601
	movl	%edi, %eax
	movq	24(%r8), %rcx
	subl	%edx, %eax
	movzwl	%ax, %edx
	call	*(%r8)
	movq	16(%rsi), %r9
.L2601:
	addq	$1, %rbx
	cmpq	%r9, %rbx
	jb	.L2602
	movzwl	4(%rsi), %edi
.L2600:
	addb	2(%rsi), %al
	addl	$1, %edi
	movw	%di, 4(%rsi)
	movzbl	%al, %eax
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	ret
	.seh_endproc
	.p2align 4,,15
	.globl	rel
	.def	rel;	.scl	2;	.type	32;	.endef
	.seh_proc	rel
rel:
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
	movzwl	4(%rcx), %edi
	movq	16(%rcx), %r9
	movq	%rcx, %rsi
	testq	%r9, %r9
	leal	1(%rdi), %edx
	movl	%edi, %ebp
	movw	%dx, 4(%rcx)
	je	.L2609
	xorl	%eax, %eax
	xorl	%ebx, %ebx
	.p2align 4,,10
.L2608:
	movq	%rbx, %r8
	salq	$5, %r8
	addq	8(%rsi), %r8
	movzwl	16(%r8), %edx
	cmpw	%dx, %bp
	jb	.L2607
	movzwl	18(%r8), %ecx
	movzwl	%dx, %r10d
	addl	%r10d, %ecx
	cmpl	%ecx, %edi
	jge	.L2607
	movl	%ebp, %eax
	movq	24(%r8), %rcx
	subl	%edx, %eax
	movzwl	%ax, %edx
	call	*(%r8)
	movq	16(%rsi), %r9
.L2607:
	addq	$1, %rbx
	cmpq	%r9, %rbx
	jb	.L2608
	movzwl	4(%rsi), %edx
	cbtw
	addl	%edx, %eax
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	ret
	.p2align 4,,10
.L2609:
	xorl	%eax, %eax
	addl	%edx, %eax
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
	.align 8
.LC4:
	.ascii "\12%i\11-----------------------------------------------------------------------------------------------------------\12\0"
	.align 8
.LC5:
	.ascii "| EXPECTED ==>\11 0x%04X 0x%02X (%-9s), A: 0x%02X, X: 0x%02X, Y: 0x%02X, FLAGS: %c%c%c%c%c%c%c%c, SP: 0x%02X\12\0"
	.align 8
.LC6:
	.ascii "| ACTUAL   ==>\11 0x%04X 0x%02X (%-9s), A: 0x%02X, X: 0x%02X, Y: 0x%02X, FLAGS: %c%c%c%c%c%c%c%c, SP: 0x%02X\12\0"
.LC7:
	.ascii "| NOT SAME ==> \11\0"
.LC8:
	.ascii " !!PC!! \0"
.LC9:
	.ascii " !!OPCODE!! \0"
.LC10:
	.ascii " !!A!! \0"
.LC11:
	.ascii " !!X!! \0"
.LC12:
	.ascii " !!Y!! \0"
.LC13:
	.ascii " !!FLAGS!! \0"
.LC14:
	.ascii " !!SP!! \0"
	.align 8
.LC15:
	.ascii "| %i) CORRECT ==>\11 0x%04X 0x%02X (%-9s), A: 0x%02X, X: 0x%02X, Y: 0x%02X, FLAGS: %c%c%c%c%c%c%c%c, SP: 0x%02X\12\0"
	.text
	.p2align 4,,15
	.globl	stepCpu
	.def	stepCpu;	.scl	2;	.type	32;	.endef
	.seh_proc	stepCpu
stepCpu:
	pushq	%r15
	.seh_pushreg	%r15
	pushq	%r14
	.seh_pushreg	%r14
	pushq	%r13
	.seh_pushreg	%r13
	pushq	%r12
	.seh_pushreg	%r12
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$200, %rsp
	.seh_stackalloc	200
	.seh_endprologue
	movzwl	4(%rcx), %edx
	leaq	pc_expected(%rip), %r15
	movq	%rcx, %rbx
	leal	1(%rdx), %eax
	movw	%ax, 4(%rcx)
	call	read_mos6502
	movb	%al, 151(%rsp)
	movslq	counter(%rip), %rax
	movzwl	4(%rbx), %r8d
	movzwl	(%r15,%rax,2), %ecx
	movq	%rax, %rdx
	subl	$1, %r8d
	cmpl	%r8d, %ecx
	jne	.L2680
	leaq	opcode_expected(%rip), %rsi
	movzbl	(%rsi,%rax), %r8d
	movq	%rsi, 168(%rsp)
	cmpb	151(%rsp), %r8b
	je	.L2676
.L2678:
	leaq	a_expected(%rip), %rax
	movq	%rax, 176(%rsp)
.L2679:
	leaq	x_expected(%rip), %rax
	leaq	flag_expected(%rip), %r13
	movq	%rax, 184(%rsp)
	leaq	y_expected(%rip), %rax
	movq	%rax, 152(%rsp)
	leaq	sp_expected(%rip), %rax
	movq	%rax, 160(%rsp)
.L2612:
	leaq	.LC4(%rip), %rcx
	call	printf
	movslq	counter(%rip), %rcx
	movq	160(%rsp), %rax
	leaq	instructions(%rip), %r9
	movzbl	(%rax,%rcx), %eax
	movl	%eax, 120(%rsp)
	movsbl	0(%r13,%rcx), %eax
	movl	%eax, %edx
	andl	$1, %edx
	cmpb	$1, %dl
	movl	%eax, %edx
	sbbl	%r14d, %r14d
	andl	$2, %edx
	andl	$-22, %r14d
	addl	$67, %r14d
	cmpb	$1, %dl
	movl	%eax, %edx
	sbbl	%r12d, %r12d
	andl	$4, %edx
	andl	$-45, %r12d
	addl	$90, %r12d
	cmpb	$1, %dl
	movl	%eax, %edx
	sbbl	%ebp, %ebp
	andl	$8, %edx
	andl	$-28, %ebp
	addl	$73, %ebp
	cmpb	$1, %dl
	movl	%eax, %edx
	sbbl	%edi, %edi
	andl	$16, %edx
	andl	$-23, %edi
	addl	$68, %edi
	cmpb	$1, %dl
	movl	%eax, %edx
	sbbl	%esi, %esi
	andl	$32, %edx
	andl	$-21, %esi
	addl	$66, %esi
	cmpb	$1, %dl
	movl	%eax, %edx
	sbbl	%r11d, %r11d
	andl	$64, %edx
	andl	$-75, %r11d
	addl	$120, %r11d
	cmpb	$1, %dl
	movq	168(%rsp), %rdx
	sbbl	%r10d, %r10d
	sarl	$31, %eax
	andl	$33, %eax
	andl	$-41, %r10d
	movzbl	(%rdx,%rcx), %edx
	addl	$45, %eax
	addl	$86, %r10d
	movq	(%r9,%rdx,8), %r9
	movq	%rdx, %r8
	movzwl	(%r15,%rcx,2), %edx
	movl	%eax, 56(%rsp)
	movq	152(%rsp), %rax
	movl	%r14d, 112(%rsp)
	movl	%r12d, 104(%rsp)
	movl	%ebp, 96(%rsp)
	movl	%edi, 88(%rsp)
	movl	%esi, 80(%rsp)
	movl	%r11d, 72(%rsp)
	movl	%r10d, 64(%rsp)
	movzbl	(%rax,%rcx), %eax
	movl	%eax, 48(%rsp)
	movq	184(%rsp), %rax
	movzbl	(%rax,%rcx), %eax
	movl	%eax, 40(%rsp)
	movq	176(%rsp), %rax
	movzbl	(%rax,%rcx), %eax
	leaq	.LC5(%rip), %rcx
	movl	%eax, 32(%rsp)
	call	printf
	movzbl	3(%rbx), %eax
	movzbl	151(%rsp), %esi
	leaq	instructions(%rip), %r9
	movl	%eax, 120(%rsp)
	movsbl	6(%rbx), %eax
	movq	%rsi, %r8
	movq	(%r9,%rsi,8), %r9
	movl	%eax, %edx
	andl	$1, %edx
	cmpb	$1, %dl
	movl	%eax, %edx
	sbbl	%r14d, %r14d
	andl	$2, %edx
	andl	$-22, %r14d
	addl	$67, %r14d
	cmpb	$1, %dl
	movl	%eax, %edx
	sbbl	%r12d, %r12d
	andl	$4, %edx
	movl	%r14d, 112(%rsp)
	andl	$-45, %r12d
	addl	$90, %r12d
	cmpb	$1, %dl
	movl	%eax, %edx
	sbbl	%ebp, %ebp
	andl	$8, %edx
	movl	%r12d, 104(%rsp)
	andl	$-28, %ebp
	addl	$73, %ebp
	cmpb	$1, %dl
	movl	%eax, %edx
	sbbl	%edi, %edi
	andl	$16, %edx
	movl	%ebp, 96(%rsp)
	andl	$-23, %edi
	addl	$68, %edi
	cmpb	$1, %dl
	movl	%eax, %edx
	sbbl	%r11d, %r11d
	andl	$32, %edx
	movl	%edi, 88(%rsp)
	andl	$-21, %r11d
	addl	$66, %r11d
	cmpb	$1, %dl
	movl	%eax, %edx
	sbbl	%r10d, %r10d
	andl	$64, %edx
	movl	%r11d, 80(%rsp)
	andl	$-75, %r10d
	addl	$120, %r10d
	cmpb	$1, %dl
	movzwl	4(%rbx), %edx
	sbbl	%ecx, %ecx
	sarl	$31, %eax
	movl	%r10d, 72(%rsp)
	andl	$33, %eax
	andl	$-41, %ecx
	addl	$45, %eax
	addl	$86, %ecx
	movl	%eax, 56(%rsp)
	movzbl	2(%rbx), %eax
	subl	$1, %edx
	movl	%ecx, 64(%rsp)
	leaq	.LC6(%rip), %rcx
	movl	%eax, 48(%rsp)
	movzbl	1(%rbx), %eax
	movl	%eax, 40(%rsp)
	movzbl	(%rbx), %eax
	movl	%eax, 32(%rsp)
	call	printf
	leaq	.LC7(%rip), %rcx
	call	printf
	movslq	counter(%rip), %rdx
	movzwl	4(%rbx), %ecx
	movzwl	(%r15,%rdx,2), %r8d
	subl	$1, %ecx
	movq	%rdx, %rax
	cmpl	%ecx, %r8d
	je	.L2630
	leaq	.LC8(%rip), %rcx
	call	printf
	movslq	counter(%rip), %rdx
	movq	%rdx, %rax
.L2630:
	movq	168(%rsp), %rdi
	movzbl	151(%rsp), %ecx
	cmpb	%cl, (%rdi,%rdx)
	je	.L2631
	leaq	.LC9(%rip), %rcx
	call	printf
	movslq	counter(%rip), %rdx
	movq	%rdx, %rax
.L2631:
	movq	176(%rsp), %rdi
	movzbl	(%rbx), %ecx
	cmpb	%cl, (%rdi,%rdx)
	je	.L2632
	leaq	.LC10(%rip), %rcx
	call	printf
	movslq	counter(%rip), %rdx
	movq	%rdx, %rax
.L2632:
	movq	184(%rsp), %rdi
	movzbl	1(%rbx), %ecx
	cmpb	%cl, (%rdi,%rdx)
	je	.L2633
	leaq	.LC11(%rip), %rcx
	call	printf
	movslq	counter(%rip), %rdx
	movq	%rdx, %rax
.L2633:
	movq	152(%rsp), %rdi
	movzbl	2(%rbx), %ecx
	cmpb	%cl, (%rdi,%rdx)
	je	.L2634
	leaq	.LC12(%rip), %rcx
	call	printf
	movslq	counter(%rip), %rdx
	movq	%rdx, %rax
.L2634:
	movzbl	6(%rbx), %edi
	cmpb	%dil, 0(%r13,%rdx)
	je	.L2635
	leaq	.LC13(%rip), %rcx
	call	printf
	movslq	counter(%rip), %rdx
	movq	%rdx, %rax
.L2635:
	movq	160(%rsp), %rdi
	movzbl	3(%rbx), %ecx
	cmpb	%cl, (%rdi,%rdx)
	je	.L2636
	leaq	.LC14(%rip), %rcx
	call	printf
	movl	counter(%rip), %eax
.L2636:
	addl	$1, %eax
	movq	%rbx, %rcx
	movl	%eax, counter(%rip)
	leaq	cpuopmap(%rip), %rax
	movq	(%rax,%rsi,8), %rax
	addq	$200, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	rex.W jmp	*%rax
	.p2align 4,,10
.L2680:
	leaq	opcode_expected(%rip), %rax
	movq	%rax, 168(%rsp)
	jmp	.L2678
	.p2align 4,,10
.L2676:
	leaq	a_expected(%rip), %rsi
	movzbl	(%rsi,%rax), %r9d
	movq	%rsi, 176(%rsp)
	cmpb	(%rbx), %r9b
	jne	.L2679
	leaq	x_expected(%rip), %rsi
	leaq	flag_expected(%rip), %r13
	movzbl	(%rsi,%rax), %r10d
	movq	%rsi, 184(%rsp)
	leaq	y_expected(%rip), %rsi
	cmpb	1(%rbx), %r10b
	movq	%rsi, 152(%rsp)
	leaq	sp_expected(%rip), %rsi
	movq	%rsi, 160(%rsp)
	jne	.L2612
	leaq	y_expected(%rip), %rsi
	movzbl	(%rsi,%rax), %r11d
	cmpb	2(%rbx), %r11b
	jne	.L2612
	movsbl	0(%r13,%rax), %esi
	cmpb	6(%rbx), %sil
	jne	.L2612
	leaq	sp_expected(%rip), %rdi
	movzbl	(%rdi,%rax), %eax
	cmpb	3(%rbx), %al
	jne	.L2612
	movl	%eax, 128(%rsp)
	movl	%esi, %eax
	movl	%esi, %r15d
	andl	$1, %eax
	movl	%r9d, 40(%rsp)
	movl	%r11d, 56(%rsp)
	cmpb	$1, %al
	movl	%esi, %eax
	movl	%r10d, 48(%rsp)
	sbbl	%r14d, %r14d
	andl	$2, %eax
	movl	%r8d, %r9d
	andl	$-22, %r14d
	addl	$67, %r14d
	cmpb	$1, %al
	movl	%esi, %eax
	sbbl	%r13d, %r13d
	andl	$4, %eax
	movl	%r14d, 120(%rsp)
	andl	$-45, %r13d
	addl	$90, %r13d
	cmpb	$1, %al
	movl	%esi, %eax
	sbbl	%r12d, %r12d
	andl	$8, %eax
	movl	%r13d, 112(%rsp)
	andl	$-28, %r12d
	addl	$73, %r12d
	cmpb	$1, %al
	movl	%esi, %eax
	sbbl	%ebp, %ebp
	andl	$16, %eax
	movl	%r12d, 104(%rsp)
	andl	$-23, %ebp
	addl	$68, %ebp
	cmpb	$1, %al
	movl	%esi, %eax
	sbbl	%edi, %edi
	andl	$32, %eax
	movl	%ebp, 96(%rsp)
	andl	$-21, %edi
	addl	$66, %edi
	cmpb	$1, %al
	sbbl	%eax, %eax
	andl	$64, %r15d
	movl	%edi, 88(%rsp)
	andl	$-75, %eax
	addl	$120, %eax
	cmpb	$1, %r15b
	sbbl	%r15d, %r15d
	sarl	$31, %esi
	movl	%eax, 80(%rsp)
	andl	$33, %esi
	andl	$-41, %r15d
	leaq	instructions(%rip), %rax
	addl	$45, %esi
	addl	$86, %r15d
	movl	%esi, 64(%rsp)
	movslq	%r8d, %rsi
	movl	%r15d, 72(%rsp)
	movq	(%rax,%rsi,8), %rax
	movl	%ecx, %r8d
	leaq	.LC15(%rip), %rcx
	movq	%rax, 32(%rsp)
	call	printf
	movl	counter(%rip), %eax
	jmp	.L2636
	.seh_endproc
	.globl	counter
	.bss
	.align 4
counter:
	.space 4
	.globl	instructions
	.section .rdata,"dr"
.LC16:
	.ascii "BRK\0"
.LC17:
	.ascii "ORA_xind\0"
.LC18:
	.ascii "ERR\0"
.LC19:
	.ascii "ORA_zpg\0"
.LC20:
	.ascii "ASL_zpg\0"
.LC21:
	.ascii "PHP\0"
.LC22:
	.ascii "ORA_imm\0"
.LC23:
	.ascii "ASLA\0"
.LC24:
	.ascii "ORA_abss\0"
.LC25:
	.ascii "ASL_abss\0"
.LC26:
	.ascii "BNC\0"
.LC27:
	.ascii "ORA_indy\0"
.LC28:
	.ascii "ORA_zpgx\0"
.LC29:
	.ascii "ASL_zpgx\0"
.LC30:
	.ascii "CLC\0"
.LC31:
	.ascii "ORA_absy\0"
.LC32:
	.ascii "ORA_absx\0"
.LC33:
	.ascii "ASL_absx\0"
.LC34:
	.ascii "JSR\0"
.LC35:
	.ascii "AND_xind\0"
.LC36:
	.ascii "BIT_zpg\0"
.LC37:
	.ascii "AND_zpg\0"
.LC38:
	.ascii "ROL_zpg\0"
.LC39:
	.ascii "PLP\0"
.LC40:
	.ascii "AND_imm\0"
.LC41:
	.ascii "ROLA\0"
.LC42:
	.ascii "BIT_abss\0"
.LC43:
	.ascii "AND_abss\0"
.LC44:
	.ascii "ROL_abss\0"
.LC45:
	.ascii "BNS\0"
.LC46:
	.ascii "AND_indy\0"
.LC47:
	.ascii "AND_zpgx\0"
.LC48:
	.ascii "ROL_zpgx\0"
.LC49:
	.ascii "SEC\0"
.LC50:
	.ascii "AND_absy\0"
.LC51:
	.ascii "AND_absx\0"
.LC52:
	.ascii "ROL_absx\0"
.LC53:
	.ascii "RTI\0"
.LC54:
	.ascii "EOR_xind\0"
.LC55:
	.ascii "EOR_zpg\0"
.LC56:
	.ascii "LSR_zpg\0"
.LC57:
	.ascii "PHA\0"
.LC58:
	.ascii "EOR_imm\0"
.LC59:
	.ascii "LSRA\0"
.LC60:
	.ascii "JMP_abss\0"
.LC61:
	.ascii "EOR_abss\0"
.LC62:
	.ascii "LSR_abss\0"
.LC63:
	.ascii "BVC\0"
.LC64:
	.ascii "EOR_indy\0"
.LC65:
	.ascii "EOR_zpgx\0"
.LC66:
	.ascii "LSR_zpgx\0"
.LC67:
	.ascii "CLI\0"
.LC68:
	.ascii "EOR_absy\0"
.LC69:
	.ascii "EOR_absx\0"
.LC70:
	.ascii "LSR_absx\0"
.LC71:
	.ascii "RTS\0"
.LC72:
	.ascii "ADC_xind\0"
.LC73:
	.ascii "ADC_zpg\0"
.LC74:
	.ascii "ROR_zpg\0"
.LC75:
	.ascii "PLA\0"
.LC76:
	.ascii "ADC_imm\0"
.LC77:
	.ascii "RORA\0"
.LC78:
	.ascii "JMP_ind\0"
.LC79:
	.ascii "ADC_abss\0"
.LC80:
	.ascii "ROR_abss\0"
.LC81:
	.ascii "BVS\0"
.LC82:
	.ascii "ADC_indy\0"
.LC83:
	.ascii "ADC_zpgx\0"
.LC84:
	.ascii "ROR_zpgx\0"
.LC85:
	.ascii "SEI\0"
.LC86:
	.ascii "ADC_absy\0"
.LC87:
	.ascii "ADC_absx\0"
.LC88:
	.ascii "ROR_absx\0"
.LC89:
	.ascii "STA_xind\0"
.LC90:
	.ascii "STY_zpg\0"
.LC91:
	.ascii "STA_zpg\0"
.LC92:
	.ascii "STX_zpg\0"
.LC93:
	.ascii "DEY\0"
.LC94:
	.ascii "TXA\0"
.LC95:
	.ascii "STY_abss\0"
.LC96:
	.ascii "STA_abss\0"
.LC97:
	.ascii "STX_abss\0"
.LC98:
	.ascii "BCC\0"
.LC99:
	.ascii "STA_indy\0"
.LC100:
	.ascii "STY_zpgx\0"
.LC101:
	.ascii "STA_zpgx\0"
.LC102:
	.ascii "STX_zpgy\0"
.LC103:
	.ascii "TYA\0"
.LC104:
	.ascii "STA_absy\0"
.LC105:
	.ascii "TXS\0"
.LC106:
	.ascii "STA_absx\0"
.LC107:
	.ascii "LDY_imm\0"
.LC108:
	.ascii "LDA_xind\0"
.LC109:
	.ascii "LDX_imm\0"
.LC110:
	.ascii "LDY_zpg\0"
.LC111:
	.ascii "LDA_zpg\0"
.LC112:
	.ascii "LDX_zpg\0"
.LC113:
	.ascii "TAY\0"
.LC114:
	.ascii "LDA_imm\0"
.LC115:
	.ascii "TAX\0"
.LC116:
	.ascii "LDY_abss\0"
.LC117:
	.ascii "LDA_abss\0"
.LC118:
	.ascii "LDX_abss\0"
.LC119:
	.ascii "BCS\0"
.LC120:
	.ascii "LDA_indy\0"
.LC121:
	.ascii "LDY_zpgx\0"
.LC122:
	.ascii "LDA_zpgx\0"
.LC123:
	.ascii "LDX_zpgy\0"
.LC124:
	.ascii "CLV\0"
.LC125:
	.ascii "LDA_absy\0"
.LC126:
	.ascii "TSPX\0"
.LC127:
	.ascii "LDY_absx\0"
.LC128:
	.ascii "LDA_absx\0"
.LC129:
	.ascii "LDX_absy\0"
.LC130:
	.ascii "CPY_imm\0"
.LC131:
	.ascii "CMP_xind\0"
.LC132:
	.ascii "CPY_zpg\0"
.LC133:
	.ascii "CMP_zpg\0"
.LC134:
	.ascii "DEC_zpg\0"
.LC135:
	.ascii "INY\0"
.LC136:
	.ascii "CMP_imm\0"
.LC137:
	.ascii "DEX\0"
.LC138:
	.ascii "CPY_abss\0"
.LC139:
	.ascii "CMP_abss\0"
.LC140:
	.ascii "DEC_abss\0"
.LC141:
	.ascii "BZC\0"
.LC142:
	.ascii "CMP_indy\0"
.LC143:
	.ascii "CMP_zpgx\0"
.LC144:
	.ascii "DEC_zpgx\0"
.LC145:
	.ascii "CLD\0"
.LC146:
	.ascii "CMP_absy\0"
.LC147:
	.ascii "CMP_absx\0"
.LC148:
	.ascii "DEC_absx\0"
.LC149:
	.ascii "CPX_imm\0"
.LC150:
	.ascii "SBC_xind\0"
.LC151:
	.ascii "CPX_zpg\0"
.LC152:
	.ascii "SBC_zpg\0"
.LC153:
	.ascii "INC_zpg\0"
.LC154:
	.ascii "INX\0"
.LC155:
	.ascii "SBC_imm\0"
.LC156:
	.ascii "NOP\0"
.LC157:
	.ascii "CPX_abss\0"
.LC158:
	.ascii "SBC_abss\0"
.LC159:
	.ascii "INC_abss\0"
.LC160:
	.ascii "BZS\0"
.LC161:
	.ascii "SBC_indy\0"
.LC162:
	.ascii "SBC_zpgx\0"
.LC163:
	.ascii "INC_zpgx\0"
.LC164:
	.ascii "SED\0"
.LC165:
	.ascii "SBC_absy\0"
.LC166:
	.ascii "SBC_absx\0"
.LC167:
	.ascii "INC_absx\0"
	.data
	.align 32
instructions:
	.quad	.LC16
	.quad	.LC17
	.quad	.LC18
	.quad	.LC18
	.quad	.LC18
	.quad	.LC19
	.quad	.LC20
	.quad	.LC18
	.quad	.LC21
	.quad	.LC22
	.quad	.LC23
	.quad	.LC18
	.quad	.LC18
	.quad	.LC24
	.quad	.LC25
	.quad	.LC18
	.quad	.LC26
	.quad	.LC27
	.quad	.LC18
	.quad	.LC18
	.quad	.LC18
	.quad	.LC28
	.quad	.LC29
	.quad	.LC18
	.quad	.LC30
	.quad	.LC31
	.quad	.LC18
	.quad	.LC18
	.quad	.LC18
	.quad	.LC32
	.quad	.LC33
	.quad	.LC18
	.quad	.LC34
	.quad	.LC35
	.quad	.LC18
	.quad	.LC18
	.quad	.LC36
	.quad	.LC37
	.quad	.LC38
	.quad	.LC18
	.quad	.LC39
	.quad	.LC40
	.quad	.LC41
	.quad	.LC18
	.quad	.LC42
	.quad	.LC43
	.quad	.LC44
	.quad	.LC18
	.quad	.LC45
	.quad	.LC46
	.quad	.LC18
	.quad	.LC18
	.quad	.LC18
	.quad	.LC47
	.quad	.LC48
	.quad	.LC18
	.quad	.LC49
	.quad	.LC50
	.quad	.LC18
	.quad	.LC18
	.quad	.LC18
	.quad	.LC51
	.quad	.LC52
	.quad	.LC18
	.quad	.LC53
	.quad	.LC54
	.quad	.LC18
	.quad	.LC18
	.quad	.LC18
	.quad	.LC55
	.quad	.LC56
	.quad	.LC18
	.quad	.LC57
	.quad	.LC58
	.quad	.LC59
	.quad	.LC18
	.quad	.LC60
	.quad	.LC61
	.quad	.LC62
	.quad	.LC18
	.quad	.LC63
	.quad	.LC64
	.quad	.LC18
	.quad	.LC18
	.quad	.LC18
	.quad	.LC65
	.quad	.LC66
	.quad	.LC18
	.quad	.LC67
	.quad	.LC68
	.quad	.LC18
	.quad	.LC18
	.quad	.LC18
	.quad	.LC69
	.quad	.LC70
	.quad	.LC18
	.quad	.LC71
	.quad	.LC72
	.quad	.LC18
	.quad	.LC18
	.quad	.LC18
	.quad	.LC73
	.quad	.LC74
	.quad	.LC18
	.quad	.LC75
	.quad	.LC76
	.quad	.LC77
	.quad	.LC18
	.quad	.LC78
	.quad	.LC79
	.quad	.LC80
	.quad	.LC18
	.quad	.LC81
	.quad	.LC82
	.quad	.LC18
	.quad	.LC18
	.quad	.LC18
	.quad	.LC83
	.quad	.LC84
	.quad	.LC18
	.quad	.LC85
	.quad	.LC86
	.quad	.LC18
	.quad	.LC18
	.quad	.LC18
	.quad	.LC87
	.quad	.LC88
	.quad	.LC18
	.quad	.LC18
	.quad	.LC89
	.quad	.LC18
	.quad	.LC18
	.quad	.LC90
	.quad	.LC91
	.quad	.LC92
	.quad	.LC18
	.quad	.LC93
	.quad	.LC18
	.quad	.LC94
	.quad	.LC18
	.quad	.LC95
	.quad	.LC96
	.quad	.LC97
	.quad	.LC18
	.quad	.LC98
	.quad	.LC99
	.quad	.LC18
	.quad	.LC18
	.quad	.LC100
	.quad	.LC101
	.quad	.LC102
	.quad	.LC18
	.quad	.LC103
	.quad	.LC104
	.quad	.LC105
	.quad	.LC18
	.quad	.LC18
	.quad	.LC106
	.quad	.LC18
	.quad	.LC18
	.quad	.LC107
	.quad	.LC108
	.quad	.LC109
	.quad	.LC18
	.quad	.LC110
	.quad	.LC111
	.quad	.LC112
	.quad	.LC18
	.quad	.LC113
	.quad	.LC114
	.quad	.LC115
	.quad	.LC18
	.quad	.LC116
	.quad	.LC117
	.quad	.LC118
	.quad	.LC18
	.quad	.LC119
	.quad	.LC120
	.quad	.LC18
	.quad	.LC18
	.quad	.LC121
	.quad	.LC122
	.quad	.LC123
	.quad	.LC18
	.quad	.LC124
	.quad	.LC125
	.quad	.LC126
	.quad	.LC18
	.quad	.LC127
	.quad	.LC128
	.quad	.LC129
	.quad	.LC18
	.quad	.LC130
	.quad	.LC131
	.quad	.LC18
	.quad	.LC18
	.quad	.LC132
	.quad	.LC133
	.quad	.LC134
	.quad	.LC18
	.quad	.LC135
	.quad	.LC136
	.quad	.LC137
	.quad	.LC18
	.quad	.LC138
	.quad	.LC139
	.quad	.LC140
	.quad	.LC18
	.quad	.LC141
	.quad	.LC142
	.quad	.LC18
	.quad	.LC18
	.quad	.LC18
	.quad	.LC143
	.quad	.LC144
	.quad	.LC18
	.quad	.LC145
	.quad	.LC146
	.quad	.LC18
	.quad	.LC18
	.quad	.LC18
	.quad	.LC147
	.quad	.LC148
	.quad	.LC18
	.quad	.LC149
	.quad	.LC150
	.quad	.LC18
	.quad	.LC18
	.quad	.LC151
	.quad	.LC152
	.quad	.LC153
	.quad	.LC18
	.quad	.LC154
	.quad	.LC155
	.quad	.LC156
	.quad	.LC18
	.quad	.LC157
	.quad	.LC158
	.quad	.LC159
	.quad	.LC18
	.quad	.LC160
	.quad	.LC161
	.quad	.LC18
	.quad	.LC18
	.quad	.LC18
	.quad	.LC162
	.quad	.LC163
	.quad	.LC18
	.quad	.LC164
	.quad	.LC165
	.quad	.LC18
	.quad	.LC18
	.quad	.LC18
	.quad	.LC166
	.quad	.LC167
	.quad	.LC18
	.section .rdata,"dr"
	.align 32
cpuopmap:
	.quad	BRK
	.quad	ORA_xind
	.quad	ERR
	.quad	SLO_xind
	.quad	NOP_zpg
	.quad	ORA_zpg
	.quad	ASL_zpg
	.quad	SLO_zpg
	.quad	PHP
	.quad	ORA_imm
	.quad	ASLA
	.quad	ERR
	.quad	NOP_abss
	.quad	ORA_abss
	.quad	ASL_abss
	.quad	SLO_abss
	.quad	BNC
	.quad	ORA_indy
	.quad	ERR
	.quad	SLO_indy
	.quad	NOP_zpgx
	.quad	ORA_zpgx
	.quad	ASL_zpgx
	.quad	SLO_zpgx
	.quad	CLC
	.quad	ORA_absy
	.quad	NOP
	.quad	SLO_absy
	.quad	NOP_absx
	.quad	ORA_absx
	.quad	ASL_absx
	.quad	SLO_absx
	.quad	JSR
	.quad	AND_xind
	.quad	ERR
	.quad	ERR
	.quad	BIT_zpg
	.quad	AND_zpg
	.quad	ROL_zpg
	.quad	ERR
	.quad	PLP
	.quad	AND_imm
	.quad	ROLA
	.quad	ERR
	.quad	BIT_abss
	.quad	AND_abss
	.quad	ROL_abss
	.quad	ERR
	.quad	BNS
	.quad	AND_indy
	.quad	ERR
	.quad	ERR
	.quad	NOP_zpgx
	.quad	AND_zpgx
	.quad	ROL_zpgx
	.quad	ERR
	.quad	SEC
	.quad	AND_absy
	.quad	NOP
	.quad	ERR
	.quad	NOP_absx
	.quad	AND_absx
	.quad	ROL_absx
	.quad	ERR
	.quad	RTI
	.quad	EOR_xind
	.quad	ERR
	.quad	SRE_xind
	.quad	NOP_zpg
	.quad	EOR_zpg
	.quad	LSR_zpg
	.quad	SRE_zpg
	.quad	PHA
	.quad	EOR_imm
	.quad	LSRA
	.quad	ERR
	.quad	JMP_abss
	.quad	EOR_abss
	.quad	LSR_abss
	.quad	SRE_abss
	.quad	BVC
	.quad	EOR_indy
	.quad	ERR
	.quad	SRE_indy
	.quad	NOP_zpgx
	.quad	EOR_zpgx
	.quad	LSR_zpgx
	.quad	SRE_zpgx
	.quad	CLI
	.quad	EOR_absy
	.quad	NOP
	.quad	SRE_absy
	.quad	NOP_absx
	.quad	EOR_absx
	.quad	LSR_absx
	.quad	SRE_absx
	.quad	RTS
	.quad	ADC_xind
	.quad	ERR
	.quad	ERR
	.quad	NOP_zpg
	.quad	ADC_zpg
	.quad	ROR_zpg
	.quad	ERR
	.quad	PLA
	.quad	ADC_imm
	.quad	RORA
	.quad	ERR
	.quad	JMP_ind
	.quad	ADC_abss
	.quad	ROR_abss
	.quad	ERR
	.quad	BVS
	.quad	ADC_indy
	.quad	ERR
	.quad	ERR
	.quad	NOP_zpgx
	.quad	ADC_zpgx
	.quad	ROR_zpgx
	.quad	ERR
	.quad	SEI
	.quad	ADC_absy
	.quad	NOP
	.quad	ERR
	.quad	NOP_absx
	.quad	ADC_absx
	.quad	ROR_absx
	.quad	ERR
	.quad	NOP_imm
	.quad	STA_xind
	.quad	ERR
	.quad	SAX_xind
	.quad	STY_zpg
	.quad	STA_zpg
	.quad	STX_zpg
	.quad	SAX_zpg
	.quad	DEY
	.quad	ERR
	.quad	TXA
	.quad	ERR
	.quad	STY_abss
	.quad	STA_abss
	.quad	STX_abss
	.quad	SAX_abss
	.quad	BCC
	.quad	STA_indy
	.quad	ERR
	.quad	ERR
	.quad	STY_zpgx
	.quad	STA_zpgx
	.quad	STX_zpgy
	.quad	SAX_zpgy
	.quad	TYA
	.quad	STA_absy
	.quad	TXS
	.quad	ERR
	.quad	SYA_absx
	.quad	STA_absx
	.quad	SXA_absy
	.quad	ERR
	.quad	LDY_imm
	.quad	LDA_xind
	.quad	LDX_imm
	.quad	LAX_xind
	.quad	LDY_zpg
	.quad	LDA_zpg
	.quad	LDX_zpg
	.quad	LAX_zpg
	.quad	TAY
	.quad	LDA_imm
	.quad	TAX
	.quad	ERR
	.quad	LDY_abss
	.quad	LDA_abss
	.quad	LDX_abss
	.quad	LAX_abss
	.quad	BCS
	.quad	LDA_indy
	.quad	ERR
	.quad	LAX_indy
	.quad	LDY_zpgx
	.quad	LDA_zpgx
	.quad	LDX_zpgy
	.quad	LAX_zpgy
	.quad	CLV
	.quad	LDA_absy
	.quad	TSPX
	.quad	ERR
	.quad	LDY_absx
	.quad	LDA_absx
	.quad	LDX_absy
	.quad	LAX_absy
	.quad	CPY_imm
	.quad	CMP_xind
	.quad	ERR
	.quad	ERR
	.quad	CPY_zpg
	.quad	CMP_zpg
	.quad	DEC_zpg
	.quad	ERR
	.quad	INY
	.quad	CMP_imm
	.quad	DEX
	.quad	ERR
	.quad	CPY_abss
	.quad	CMP_abss
	.quad	DEC_abss
	.quad	ERR
	.quad	BZC
	.quad	CMP_indy
	.quad	ERR
	.quad	ERR
	.quad	NOP_zpgx
	.quad	CMP_zpgx
	.quad	DEC_zpgx
	.quad	ERR
	.quad	CLD
	.quad	CMP_absy
	.quad	NOP
	.quad	ERR
	.quad	NOP_absx
	.quad	CMP_absx
	.quad	DEC_absx
	.quad	ERR
	.quad	CPX_imm
	.quad	SBC_xind
	.quad	ERR
	.quad	ERR
	.quad	CPX_zpg
	.quad	SBC_zpg
	.quad	INC_zpg
	.quad	ERR
	.quad	INX
	.quad	SBC_imm
	.quad	NOP
	.quad	SBC_imm
	.quad	CPX_abss
	.quad	SBC_abss
	.quad	INC_abss
	.quad	ERR
	.quad	BZS
	.quad	SBC_indy
	.quad	ERR
	.quad	ERR
	.quad	NOP_zpgx
	.quad	SBC_zpgx
	.quad	INC_zpgx
	.quad	ERR
	.quad	SED
	.quad	SBC_absy
	.quad	NOP
	.quad	ERR
	.quad	NOP_absx
	.quad	SBC_absx
	.quad	INC_absx
	.quad	ERR
	.comm	sp_expected, 8992, 5
	.comm	flag_expected, 8992, 5
	.comm	y_expected, 8992, 5
	.comm	x_expected, 8992, 5
	.comm	a_expected, 8992, 5
	.comm	opcode_expected, 8992, 5
	.comm	pc_expected, 17984, 5
	.ident	"GCC: (Rev1, Built by MSYS2 project) 7.2.0"
	.def	getc;	.scl	2;	.type	32;	.endef
	.def	fwrite;	.scl	2;	.type	32;	.endef
	.def	realloc;	.scl	2;	.type	32;	.endef
	.def	free;	.scl	2;	.type	32;	.endef
	.def	printf;	.scl	2;	.type	32;	.endef
	.def	putchar;	.scl	2;	.type	32;	.endef
	.def	fprintf;	.scl	2;	.type	32;	.endef

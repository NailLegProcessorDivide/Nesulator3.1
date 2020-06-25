	.text
	.file	"cpu.c"
	.globl	createCpu               # -- Begin function createCpu
	.p2align	4, 0x90
	.type	createCpu,@function
createCpu:                              # @createCpu
	.cfi_startproc
# %bb.0:
	movl	$0, (%rdi)
	movw	$-32768, 4(%rdi)        # imm = 0x8000
	movb	$36, 6(%rdi)
	xorps	%xmm0, %xmm0
	movups	%xmm0, 7(%rdi)
	movb	$0, 23(%rdi)
	movq	stdout(%rip), %rcx
	movl	$.L.str, %edi
	movl	$12, %esi
	movl	$1, %edx
	jmp	fwrite                  # TAILCALL
.Lfunc_end0:
	.size	createCpu, .Lfunc_end0-createCpu
	.cfi_endproc
                                        # -- End function
	.globl	add_mos6502_device      # -- Begin function add_mos6502_device
	.p2align	4, 0x90
	.type	add_mos6502_device,@function
add_mos6502_device:                     # @add_mos6502_device
	.cfi_startproc
# %bb.0:
	pushq	%r14
	.cfi_def_cfa_offset 16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	pushq	%rax
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -24
	.cfi_offset %r14, -16
	movq	%rsi, %r14
	movq	%rdi, %rbx
	movq	8(%rdi), %rdi
	movq	16(%rbx), %rsi
	addq	$1, %rsi
	movq	%rsi, 16(%rbx)
	shlq	$5, %rsi
	callq	realloc
	testq	%rax, %rax
	je	.LBB1_1
# %bb.2:
	movq	%rax, 8(%rbx)
	movq	16(%rbx), %rcx
	shlq	$5, %rcx
	movups	(%r14), %xmm0
	movups	16(%r14), %xmm1
	movups	%xmm1, -16(%rcx,%rax)
	movups	%xmm0, -32(%rcx,%rax)
	movb	$1, %al
                                        # kill: def $al killed $al killed $eax
	addq	$8, %rsp
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	retq
.LBB1_1:
	.cfi_def_cfa_offset 32
	movq	8(%rbx), %rdi
	callq	free
	xorl	%eax, %eax
                                        # kill: def $al killed $al killed $eax
	addq	$8, %rsp
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end1:
	.size	add_mos6502_device, .Lfunc_end1-add_mos6502_device
	.cfi_endproc
                                        # -- End function
	.globl	read_mos6502            # -- Begin function read_mos6502
	.p2align	4, 0x90
	.type	read_mos6502,@function
read_mos6502:                           # @read_mos6502
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r12
	.cfi_def_cfa_offset 40
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset %rbx, -48
	.cfi_offset %r12, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	16(%rdi), %rcx
	testq	%rcx, %rcx
	je	.LBB2_1
# %bb.3:
	movl	%esi, %r15d
	movq	%rdi, %r12
	movzwl	%r15w, %r14d
	movl	$24, %ebp
	xorl	%eax, %eax
	xorl	%ebx, %ebx
	jmp	.LBB2_4
	.p2align	4, 0x90
.LBB2_7:                                #   in Loop: Header=BB2_4 Depth=1
	addq	$1, %rbx
	addq	$32, %rbp
	cmpq	%rcx, %rbx
	jae	.LBB2_2
.LBB2_4:                                # =>This Inner Loop Header: Depth=1
	movq	8(%r12), %rdx
	movzwl	-8(%rdx,%rbp), %esi
	cmpw	%r15w, %si
	ja	.LBB2_7
# %bb.5:                                #   in Loop: Header=BB2_4 Depth=1
	movzwl	-6(%rdx,%rbp), %edi
	addl	%esi, %edi
	cmpl	%r14d, %edi
	jbe	.LBB2_7
# %bb.6:                                #   in Loop: Header=BB2_4 Depth=1
	movq	(%rdx,%rbp), %rdi
	movl	%r15d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbp)
                                        # kill: def $al killed $al def $rax
	movq	16(%r12), %rcx
	jmp	.LBB2_7
.LBB2_1:
	xorl	%eax, %eax
.LBB2_2:
                                        # kill: def $al killed $al killed $rax
	popq	%rbx
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end2:
	.size	read_mos6502, .Lfunc_end2-read_mos6502
	.cfi_endproc
                                        # -- End function
	.globl	write_mos6502           # -- Begin function write_mos6502
	.p2align	4, 0x90
	.type	write_mos6502,@function
write_mos6502:                          # @write_mos6502
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r13
	.cfi_def_cfa_offset 40
	pushq	%r12
	.cfi_def_cfa_offset 48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	pushq	%rax
	.cfi_def_cfa_offset 64
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	16(%rdi), %rax
	testq	%rax, %rax
	je	.LBB3_6
# %bb.1:
	movl	%esi, %r12d
	movq	%rdi, %r13
	movzwl	%r12w, %r15d
	movl	$24, %ebp
	xorl	%ebx, %ebx
	movzbl	%dl, %r14d
	jmp	.LBB3_2
	.p2align	4, 0x90
.LBB3_5:                                #   in Loop: Header=BB3_2 Depth=1
	addq	$1, %rbx
	addq	$32, %rbp
	cmpq	%rax, %rbx
	jae	.LBB3_6
.LBB3_2:                                # =>This Inner Loop Header: Depth=1
	movq	8(%r13), %rcx
	movzwl	-8(%rcx,%rbp), %edx
	cmpw	%r12w, %dx
	ja	.LBB3_5
# %bb.3:                                #   in Loop: Header=BB3_2 Depth=1
	movzwl	-6(%rcx,%rbp), %esi
	addl	%edx, %esi
	cmpl	%r15d, %esi
	jbe	.LBB3_5
# %bb.4:                                #   in Loop: Header=BB3_2 Depth=1
	movq	(%rcx,%rbp), %rdi
	movl	%r12d, %eax
	subl	%edx, %eax
	movzwl	%ax, %esi
	movl	%r14d, %edx
	callq	*-16(%rcx,%rbp)
	movq	16(%r13), %rax
	jmp	.LBB3_5
.LBB3_6:
	addq	$8, %rsp
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%r12
	.cfi_def_cfa_offset 40
	popq	%r13
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end3:
	.size	write_mos6502, .Lfunc_end3-write_mos6502
	.cfi_endproc
                                        # -- End function
	.globl	printPage               # -- Begin function printPage
	.p2align	4, 0x90
	.type	printPage,@function
printPage:                              # @printPage
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r13
	.cfi_def_cfa_offset 40
	pushq	%r12
	.cfi_def_cfa_offset 48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	subq	$312, %rsp              # imm = 0x138
	.cfi_def_cfa_offset 368
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%rdi, %rbx
	movl	%esi, 4(%rsp)           # 4-byte Spill
	movl	%esi, %eax
	shlq	$8, %rax
	movq	%rax, 16(%rsp)          # 8-byte Spill
	movq	16(%rdi), %rcx
	xorl	%eax, %eax
	jmp	.LBB4_1
	.p2align	4, 0x90
.LBB4_4:                                #   in Loop: Header=BB4_1 Depth=1
	movq	8(%rsp), %rax           # 8-byte Reload
	addq	$1, %rax
	cmpq	$16, %rax
	je	.LBB4_5
.LBB4_1:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB4_2 Depth 2
                                        #       Child Loop BB4_9 Depth 3
	movq	%rax, 8(%rsp)           # 8-byte Spill
	shlq	$4, %rax
	movq	%rcx, %rdx
	xorl	%esi, %esi
	movq	%rax, 24(%rsp)          # 8-byte Spill
	jmp	.LBB4_2
	.p2align	4, 0x90
.LBB4_3:                                #   in Loop: Header=BB4_2 Depth=2
	xorl	%edx, %edx
	xorl	%eax, %eax
.LBB4_13:                               #   in Loop: Header=BB4_2 Depth=2
	movq	32(%rsp), %rsi          # 8-byte Reload
	movb	%al, 48(%rsp,%rsi)
	movq	40(%rsp), %rsi          # 8-byte Reload
	addq	$1, %rsi
	cmpq	$16, %rsi
	movq	24(%rsp), %rax          # 8-byte Reload
	je	.LBB4_4
.LBB4_2:                                #   Parent Loop BB4_1 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB4_9 Depth 3
	leaq	(%rsi,%rax), %rdi
	testq	%rdx, %rdx
	movq	%rsi, 40(%rsp)          # 8-byte Spill
	movq	%rdi, 32(%rsp)          # 8-byte Spill
	je	.LBB4_3
# %bb.8:                                #   in Loop: Header=BB4_2 Depth=2
	leal	(%rsi,%rax), %r15d
	movq	16(%rsp), %rax          # 8-byte Reload
	leaq	(%rdi,%rax), %r12
	addl	%eax, %r15d
	movl	$24, %r13d
	xorl	%eax, %eax
	xorl	%r14d, %r14d
	jmp	.LBB4_9
	.p2align	4, 0x90
.LBB4_12:                               #   in Loop: Header=BB4_9 Depth=3
	addq	$1, %r14
	addq	$32, %r13
	cmpq	%rdx, %r14
	jae	.LBB4_13
.LBB4_9:                                #   Parent Loop BB4_1 Depth=1
                                        #     Parent Loop BB4_2 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movq	8(%rbx), %rbp
	movzwl	-8(%rbp,%r13), %esi
	cmpw	%r15w, %si
	ja	.LBB4_12
# %bb.10:                               #   in Loop: Header=BB4_9 Depth=3
	movzwl	-6(%rbp,%r13), %edi
	addq	%rsi, %rdi
	cmpq	%r12, %rdi
	jbe	.LBB4_12
# %bb.11:                               #   in Loop: Header=BB4_9 Depth=3
	movq	(%rbp,%r13), %rdi
	movl	%r15d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rbp,%r13)
                                        # kill: def $al killed $al def $rax
	movq	16(%rbx), %rcx
	movq	%rcx, %rdx
	jmp	.LBB4_12
.LBB4_5:
	movl	$.L.str.1, %edi
	movl	4(%rsp), %esi           # 4-byte Reload
	xorl	%eax, %eax
	callq	printf
	xorl	%ebx, %ebx
	.p2align	4, 0x90
.LBB4_6:                                # =>This Inner Loop Header: Depth=1
	movzbl	48(%rsp,%rbx), %esi
	movl	$.L.str.2, %edi
	xorl	%eax, %eax
	callq	printf
	movzbl	49(%rsp,%rbx), %esi
	movl	$.L.str.2, %edi
	xorl	%eax, %eax
	callq	printf
	movzbl	50(%rsp,%rbx), %esi
	movl	$.L.str.2, %edi
	xorl	%eax, %eax
	callq	printf
	movzbl	51(%rsp,%rbx), %esi
	movl	$.L.str.2, %edi
	xorl	%eax, %eax
	callq	printf
	movzbl	52(%rsp,%rbx), %esi
	movl	$.L.str.2, %edi
	xorl	%eax, %eax
	callq	printf
	movzbl	53(%rsp,%rbx), %esi
	movl	$.L.str.2, %edi
	xorl	%eax, %eax
	callq	printf
	movzbl	54(%rsp,%rbx), %esi
	movl	$.L.str.2, %edi
	xorl	%eax, %eax
	callq	printf
	movzbl	55(%rsp,%rbx), %esi
	movl	$.L.str.2, %edi
	xorl	%eax, %eax
	callq	printf
	movzbl	56(%rsp,%rbx), %esi
	movl	$.L.str.2, %edi
	xorl	%eax, %eax
	callq	printf
	movzbl	57(%rsp,%rbx), %esi
	movl	$.L.str.2, %edi
	xorl	%eax, %eax
	callq	printf
	movzbl	58(%rsp,%rbx), %esi
	movl	$.L.str.2, %edi
	xorl	%eax, %eax
	callq	printf
	movzbl	59(%rsp,%rbx), %esi
	movl	$.L.str.2, %edi
	xorl	%eax, %eax
	callq	printf
	movzbl	60(%rsp,%rbx), %esi
	movl	$.L.str.2, %edi
	xorl	%eax, %eax
	callq	printf
	movzbl	61(%rsp,%rbx), %esi
	movl	$.L.str.2, %edi
	xorl	%eax, %eax
	callq	printf
	movzbl	62(%rsp,%rbx), %esi
	movl	$.L.str.2, %edi
	xorl	%eax, %eax
	callq	printf
	movzbl	63(%rsp,%rbx), %esi
	movl	$.L.str.2, %edi
	xorl	%eax, %eax
	callq	printf
	movl	$10, %edi
	callq	putchar
	addq	$16, %rbx
	cmpq	$256, %rbx              # imm = 0x100
	jne	.LBB4_6
# %bb.7:
	addq	$312, %rsp              # imm = 0x138
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%r12
	.cfi_def_cfa_offset 40
	popq	%r13
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end4:
	.size	printPage, .Lfunc_end4-printPage
	.cfi_endproc
                                        # -- End function
	.globl	printRegisters          # -- Begin function printRegisters
	.p2align	4, 0x90
	.type	printRegisters,@function
printRegisters:                         # @printRegisters
	.cfi_startproc
# %bb.0:
	pushq	%rax
	.cfi_def_cfa_offset 16
	movq	stdout(%rip), %rax
	movzbl	(%rdi), %edx
	movzbl	1(%rdi), %ecx
	movzbl	2(%rdi), %r8d
	movzbl	3(%rdi), %r9d
	orl	$256, %r9d              # imm = 0x100
	movzwl	4(%rdi), %r10d
	movzbl	6(%rdi), %r11d
	movl	$.L.str.4, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	pushq	%r11
	.cfi_adjust_cfa_offset 8
	pushq	%r10
	.cfi_adjust_cfa_offset 8
	callq	fprintf
	addq	$16, %rsp
	.cfi_adjust_cfa_offset -16
	popq	%rax
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end5:
	.size	printRegisters, .Lfunc_end5-printRegisters
	.cfi_endproc
                                        # -- End function
	.globl	triggerNMI              # -- Begin function triggerNMI
	.p2align	4, 0x90
	.type	triggerNMI,@function
triggerNMI:                             # @triggerNMI
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r13
	.cfi_def_cfa_offset 40
	pushq	%r12
	.cfi_def_cfa_offset 48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	pushq	%rax
	.cfi_def_cfa_offset 64
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%rdi, %r12
	movl	4(%rdi), %r14d
	addl	$2, %r14d
	movw	%r14w, 4(%rdi)
	movzbl	3(%rdi), %r15d
	leal	-1(%r15), %eax
	movb	%al, 3(%rdi)
	movq	16(%rdi), %rcx
	testq	%rcx, %rcx
	je	.LBB6_13
# %bb.1:
	shrl	$8, %r14d
	orl	$256, %r15d             # imm = 0x100
	movl	$24, %ebx
	xorl	%ebp, %ebp
	jmp	.LBB6_3
	.p2align	4, 0x90
.LBB6_2:                                #   in Loop: Header=BB6_3 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rcx, %rbp
	jae	.LBB6_6
.LBB6_3:                                # =>This Inner Loop Header: Depth=1
	movq	8(%r12), %rax
	movzwl	-8(%rax,%rbx), %edx
	cmpw	%dx, %r15w
	jb	.LBB6_2
# %bb.4:                                #   in Loop: Header=BB6_3 Depth=1
	movzwl	-6(%rax,%rbx), %esi
	addl	%edx, %esi
	cmpl	%r15d, %esi
	jbe	.LBB6_2
# %bb.5:                                #   in Loop: Header=BB6_3 Depth=1
	movq	(%rax,%rbx), %rdi
	movzwl	%r15w, %ecx
	subl	%edx, %ecx
	movzwl	%cx, %esi
	movzbl	%r14b, %edx
	callq	*-16(%rax,%rbx)
	movq	16(%r12), %rcx
	jmp	.LBB6_2
.LBB6_6:
	movb	4(%r12), %r14b
	movzbl	3(%r12), %r15d
	leal	-1(%r15), %eax
	movb	%al, 3(%r12)
	testq	%rcx, %rcx
	je	.LBB6_14
# %bb.7:
	orl	$256, %r15d             # imm = 0x100
	movl	$24, %ebx
	xorl	%ebp, %ebp
	jmp	.LBB6_9
	.p2align	4, 0x90
.LBB6_8:                                #   in Loop: Header=BB6_9 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rcx, %rbp
	jae	.LBB6_12
.LBB6_9:                                # =>This Inner Loop Header: Depth=1
	movq	8(%r12), %rax
	movzwl	-8(%rax,%rbx), %edx
	cmpw	%dx, %r15w
	jb	.LBB6_8
# %bb.10:                               #   in Loop: Header=BB6_9 Depth=1
	movzwl	-6(%rax,%rbx), %esi
	addl	%edx, %esi
	cmpl	%r15d, %esi
	jbe	.LBB6_8
# %bb.11:                               #   in Loop: Header=BB6_9 Depth=1
	movq	(%rax,%rbx), %rdi
	movzwl	%r15w, %ecx
	subl	%edx, %ecx
	movzwl	%cx, %esi
	movzbl	%r14b, %edx
	callq	*-16(%rax,%rbx)
	movq	16(%r12), %rcx
	jmp	.LBB6_8
.LBB6_12:
	movb	3(%r12), %al
	jmp	.LBB6_15
.LBB6_13:
	leal	-2(%r15), %eax
	movb	%al, 3(%r12)
.LBB6_14:
	xorl	%ecx, %ecx
.LBB6_15:
	movb	6(%r12), %dl
	andb	$-49, %dl
	leal	32(%rdx), %r14d
	movb	%r14b, 6(%r12)
	leal	-1(%rax), %esi
	movb	%sil, 3(%r12)
	testq	%rcx, %rcx
	je	.LBB6_33
# %bb.16:
	movzbl	%al, %r13d
	orl	$256, %r13d             # imm = 0x100
	movzwl	%r13w, %r15d
	movl	$24, %ebx
	xorl	%ebp, %ebp
	jmp	.LBB6_18
	.p2align	4, 0x90
.LBB6_17:                               #   in Loop: Header=BB6_18 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rcx, %rbp
	jae	.LBB6_21
.LBB6_18:                               # =>This Inner Loop Header: Depth=1
	movq	8(%r12), %rax
	movzwl	-8(%rax,%rbx), %edx
	cmpw	%dx, %r13w
	jb	.LBB6_17
# %bb.19:                               #   in Loop: Header=BB6_18 Depth=1
	movzwl	-6(%rax,%rbx), %esi
	addl	%edx, %esi
	cmpl	%r15d, %esi
	jbe	.LBB6_17
# %bb.20:                               #   in Loop: Header=BB6_18 Depth=1
	movq	(%rax,%rbx), %rdi
	movl	%r15d, %ecx
	subl	%edx, %ecx
	movzwl	%cx, %esi
	movzbl	%r14b, %edx
	callq	*-16(%rax,%rbx)
	movq	16(%r12), %rcx
	jmp	.LBB6_17
.LBB6_21:
	orb	$4, 6(%r12)
	testq	%rcx, %rcx
	je	.LBB6_34
# %bb.22:
	movl	$24, %ebp
	xorl	%eax, %eax
	xorl	%ebx, %ebx
	jmp	.LBB6_24
	.p2align	4, 0x90
.LBB6_23:                               #   in Loop: Header=BB6_24 Depth=1
	addq	$1, %rbx
	addq	$32, %rbp
	cmpq	%rcx, %rbx
	jae	.LBB6_27
.LBB6_24:                               # =>This Inner Loop Header: Depth=1
	movq	8(%r12), %rdx
	movzwl	-8(%rdx,%rbp), %esi
	cmpl	$65530, %esi            # imm = 0xFFFA
	ja	.LBB6_23
# %bb.25:                               #   in Loop: Header=BB6_24 Depth=1
	movzwl	-6(%rdx,%rbp), %edi
	addl	%esi, %edi
	cmpl	$65531, %edi            # imm = 0xFFFB
	jb	.LBB6_23
# %bb.26:                               #   in Loop: Header=BB6_24 Depth=1
	movq	(%rdx,%rbp), %rdi
	movl	$-6, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbp)
                                        # kill: def $al killed $al def $rax
	movq	16(%r12), %rcx
	jmp	.LBB6_23
.LBB6_27:
	movzbl	%al, %edx
	movw	%dx, 4(%r12)
	testq	%rcx, %rcx
	je	.LBB6_36
# %bb.28:
	movl	$24, %ebp
	xorl	%eax, %eax
	xorl	%ebx, %ebx
	jmp	.LBB6_30
	.p2align	4, 0x90
.LBB6_29:                               #   in Loop: Header=BB6_30 Depth=1
	addq	$1, %rbx
	addq	$32, %rbp
	cmpq	%rcx, %rbx
	jae	.LBB6_35
.LBB6_30:                               # =>This Inner Loop Header: Depth=1
	movq	8(%r12), %rdx
	movzwl	-8(%rdx,%rbp), %esi
	cmpl	$65531, %esi            # imm = 0xFFFB
	ja	.LBB6_29
# %bb.31:                               #   in Loop: Header=BB6_30 Depth=1
	movzwl	-6(%rdx,%rbp), %edi
	addl	%esi, %edi
	cmpl	$65532, %edi            # imm = 0xFFFC
	jb	.LBB6_29
# %bb.32:                               #   in Loop: Header=BB6_30 Depth=1
	movq	(%rdx,%rbp), %rdi
	movl	$-5, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbp)
                                        # kill: def $al killed $al def $rax
	movq	16(%r12), %rcx
	jmp	.LBB6_29
.LBB6_33:
	orb	$36, %dl
	movb	%dl, 6(%r12)
.LBB6_34:
	movw	$0, 4(%r12)
	xorl	%edx, %edx
.LBB6_36:
	xorl	%eax, %eax
	jmp	.LBB6_37
.LBB6_35:
	movzwl	4(%r12), %edx
.LBB6_37:
	movzbl	%al, %eax
	shll	$8, %eax
	orl	%eax, %edx
	movw	%dx, 4(%r12)
	addq	$8, %rsp
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%r12
	.cfi_def_cfa_offset 40
	popq	%r13
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end6:
	.size	triggerNMI, .Lfunc_end6-triggerNMI
	.cfi_endproc
                                        # -- End function
	.globl	triggerRST              # -- Begin function triggerRST
	.p2align	4, 0x90
	.type	triggerRST,@function
triggerRST:                             # @triggerRST
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r13
	.cfi_def_cfa_offset 40
	pushq	%r12
	.cfi_def_cfa_offset 48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	pushq	%rax
	.cfi_def_cfa_offset 64
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%rdi, %r12
	movl	4(%rdi), %r14d
	addl	$2, %r14d
	movw	%r14w, 4(%rdi)
	movzbl	3(%rdi), %r15d
	leal	-1(%r15), %eax
	movb	%al, 3(%rdi)
	movq	16(%rdi), %rcx
	testq	%rcx, %rcx
	je	.LBB7_13
# %bb.1:
	shrl	$8, %r14d
	orl	$256, %r15d             # imm = 0x100
	movl	$24, %ebx
	xorl	%ebp, %ebp
	jmp	.LBB7_3
	.p2align	4, 0x90
.LBB7_2:                                #   in Loop: Header=BB7_3 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rcx, %rbp
	jae	.LBB7_6
.LBB7_3:                                # =>This Inner Loop Header: Depth=1
	movq	8(%r12), %rax
	movzwl	-8(%rax,%rbx), %edx
	cmpw	%dx, %r15w
	jb	.LBB7_2
# %bb.4:                                #   in Loop: Header=BB7_3 Depth=1
	movzwl	-6(%rax,%rbx), %esi
	addl	%edx, %esi
	cmpl	%r15d, %esi
	jbe	.LBB7_2
# %bb.5:                                #   in Loop: Header=BB7_3 Depth=1
	movq	(%rax,%rbx), %rdi
	movzwl	%r15w, %ecx
	subl	%edx, %ecx
	movzwl	%cx, %esi
	movzbl	%r14b, %edx
	callq	*-16(%rax,%rbx)
	movq	16(%r12), %rcx
	jmp	.LBB7_2
.LBB7_6:
	movb	4(%r12), %r14b
	movzbl	3(%r12), %r15d
	leal	-1(%r15), %eax
	movb	%al, 3(%r12)
	testq	%rcx, %rcx
	je	.LBB7_14
# %bb.7:
	orl	$256, %r15d             # imm = 0x100
	movl	$24, %ebx
	xorl	%ebp, %ebp
	jmp	.LBB7_9
	.p2align	4, 0x90
.LBB7_8:                                #   in Loop: Header=BB7_9 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rcx, %rbp
	jae	.LBB7_12
.LBB7_9:                                # =>This Inner Loop Header: Depth=1
	movq	8(%r12), %rax
	movzwl	-8(%rax,%rbx), %edx
	cmpw	%dx, %r15w
	jb	.LBB7_8
# %bb.10:                               #   in Loop: Header=BB7_9 Depth=1
	movzwl	-6(%rax,%rbx), %esi
	addl	%edx, %esi
	cmpl	%r15d, %esi
	jbe	.LBB7_8
# %bb.11:                               #   in Loop: Header=BB7_9 Depth=1
	movq	(%rax,%rbx), %rdi
	movzwl	%r15w, %ecx
	subl	%edx, %ecx
	movzwl	%cx, %esi
	movzbl	%r14b, %edx
	callq	*-16(%rax,%rbx)
	movq	16(%r12), %rcx
	jmp	.LBB7_8
.LBB7_12:
	movb	3(%r12), %al
	jmp	.LBB7_15
.LBB7_13:
	leal	-2(%r15), %eax
	movb	%al, 3(%r12)
.LBB7_14:
	xorl	%ecx, %ecx
.LBB7_15:
	movb	6(%r12), %r14b
	leal	-1(%rax), %edx
	movb	%dl, 3(%r12)
	testq	%rcx, %rcx
	je	.LBB7_33
# %bb.16:
	movzbl	%al, %r13d
	orl	$256, %r13d             # imm = 0x100
	movzwl	%r13w, %r15d
	movl	$24, %ebx
	xorl	%ebp, %ebp
	jmp	.LBB7_18
	.p2align	4, 0x90
.LBB7_17:                               #   in Loop: Header=BB7_18 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rcx, %rbp
	jae	.LBB7_21
.LBB7_18:                               # =>This Inner Loop Header: Depth=1
	movq	8(%r12), %rax
	movzwl	-8(%rax,%rbx), %edx
	cmpw	%dx, %r13w
	jb	.LBB7_17
# %bb.19:                               #   in Loop: Header=BB7_18 Depth=1
	movzwl	-6(%rax,%rbx), %esi
	addl	%edx, %esi
	cmpl	%r15d, %esi
	jbe	.LBB7_17
# %bb.20:                               #   in Loop: Header=BB7_18 Depth=1
	movq	(%rax,%rbx), %rdi
	movl	%r15d, %ecx
	subl	%edx, %ecx
	movzwl	%cx, %esi
	movzbl	%r14b, %edx
	callq	*-16(%rax,%rbx)
	movq	16(%r12), %rcx
	jmp	.LBB7_17
.LBB7_21:
	orb	$4, 6(%r12)
	testq	%rcx, %rcx
	je	.LBB7_34
# %bb.22:
	movl	$24, %ebp
	xorl	%eax, %eax
	xorl	%ebx, %ebx
	jmp	.LBB7_24
	.p2align	4, 0x90
.LBB7_23:                               #   in Loop: Header=BB7_24 Depth=1
	addq	$1, %rbx
	addq	$32, %rbp
	cmpq	%rcx, %rbx
	jae	.LBB7_27
.LBB7_24:                               # =>This Inner Loop Header: Depth=1
	movq	8(%r12), %rdx
	movzwl	-8(%rdx,%rbp), %esi
	cmpl	$65532, %esi            # imm = 0xFFFC
	ja	.LBB7_23
# %bb.25:                               #   in Loop: Header=BB7_24 Depth=1
	movzwl	-6(%rdx,%rbp), %edi
	addl	%esi, %edi
	cmpl	$65533, %edi            # imm = 0xFFFD
	jb	.LBB7_23
# %bb.26:                               #   in Loop: Header=BB7_24 Depth=1
	movq	(%rdx,%rbp), %rdi
	movl	$-4, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbp)
                                        # kill: def $al killed $al def $rax
	movq	16(%r12), %rcx
	jmp	.LBB7_23
.LBB7_27:
	movzbl	%al, %edx
	movw	%dx, 4(%r12)
	testq	%rcx, %rcx
	je	.LBB7_36
# %bb.28:
	movl	$24, %ebp
	xorl	%eax, %eax
	xorl	%ebx, %ebx
	jmp	.LBB7_30
	.p2align	4, 0x90
.LBB7_29:                               #   in Loop: Header=BB7_30 Depth=1
	addq	$1, %rbx
	addq	$32, %rbp
	cmpq	%rcx, %rbx
	jae	.LBB7_35
.LBB7_30:                               # =>This Inner Loop Header: Depth=1
	movq	8(%r12), %rdx
	movzwl	-8(%rdx,%rbp), %esi
	cmpl	$65533, %esi            # imm = 0xFFFD
	ja	.LBB7_29
# %bb.31:                               #   in Loop: Header=BB7_30 Depth=1
	movzwl	-6(%rdx,%rbp), %edi
	addl	%esi, %edi
	cmpl	$65534, %edi            # imm = 0xFFFE
	jb	.LBB7_29
# %bb.32:                               #   in Loop: Header=BB7_30 Depth=1
	movq	(%rdx,%rbp), %rdi
	movl	$-3, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbp)
                                        # kill: def $al killed $al def $rax
	movq	16(%r12), %rcx
	jmp	.LBB7_29
.LBB7_33:
	orb	$4, %r14b
	movb	%r14b, 6(%r12)
.LBB7_34:
	movw	$0, 4(%r12)
	xorl	%edx, %edx
.LBB7_36:
	xorl	%eax, %eax
	jmp	.LBB7_37
.LBB7_35:
	movzwl	4(%r12), %edx
.LBB7_37:
	movzbl	%al, %eax
	shll	$8, %eax
	orl	%eax, %edx
	movw	%dx, 4(%r12)
	addq	$8, %rsp
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%r12
	.cfi_def_cfa_offset 40
	popq	%r13
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end7:
	.size	triggerRST, .Lfunc_end7-triggerRST
	.cfi_endproc
                                        # -- End function
	.globl	triggerIRQ              # -- Begin function triggerIRQ
	.p2align	4, 0x90
	.type	triggerIRQ,@function
triggerIRQ:                             # @triggerIRQ
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r13
	.cfi_def_cfa_offset 40
	pushq	%r12
	.cfi_def_cfa_offset 48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	pushq	%rax
	.cfi_def_cfa_offset 64
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%rdi, %r12
	movl	4(%rdi), %r14d
	addl	$2, %r14d
	movw	%r14w, 4(%rdi)
	movzbl	3(%rdi), %r15d
	leal	-1(%r15), %eax
	movb	%al, 3(%rdi)
	movq	16(%rdi), %rcx
	testq	%rcx, %rcx
	je	.LBB8_13
# %bb.1:
	shrl	$8, %r14d
	orl	$256, %r15d             # imm = 0x100
	movl	$24, %ebx
	xorl	%ebp, %ebp
	jmp	.LBB8_3
	.p2align	4, 0x90
.LBB8_2:                                #   in Loop: Header=BB8_3 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rcx, %rbp
	jae	.LBB8_6
.LBB8_3:                                # =>This Inner Loop Header: Depth=1
	movq	8(%r12), %rax
	movzwl	-8(%rax,%rbx), %edx
	cmpw	%dx, %r15w
	jb	.LBB8_2
# %bb.4:                                #   in Loop: Header=BB8_3 Depth=1
	movzwl	-6(%rax,%rbx), %esi
	addl	%edx, %esi
	cmpl	%r15d, %esi
	jbe	.LBB8_2
# %bb.5:                                #   in Loop: Header=BB8_3 Depth=1
	movq	(%rax,%rbx), %rdi
	movzwl	%r15w, %ecx
	subl	%edx, %ecx
	movzwl	%cx, %esi
	movzbl	%r14b, %edx
	callq	*-16(%rax,%rbx)
	movq	16(%r12), %rcx
	jmp	.LBB8_2
.LBB8_6:
	movb	4(%r12), %r14b
	movzbl	3(%r12), %r15d
	leal	-1(%r15), %eax
	movb	%al, 3(%r12)
	testq	%rcx, %rcx
	je	.LBB8_14
# %bb.7:
	orl	$256, %r15d             # imm = 0x100
	movl	$24, %ebx
	xorl	%ebp, %ebp
	jmp	.LBB8_9
	.p2align	4, 0x90
.LBB8_8:                                #   in Loop: Header=BB8_9 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rcx, %rbp
	jae	.LBB8_12
.LBB8_9:                                # =>This Inner Loop Header: Depth=1
	movq	8(%r12), %rax
	movzwl	-8(%rax,%rbx), %edx
	cmpw	%dx, %r15w
	jb	.LBB8_8
# %bb.10:                               #   in Loop: Header=BB8_9 Depth=1
	movzwl	-6(%rax,%rbx), %esi
	addl	%edx, %esi
	cmpl	%r15d, %esi
	jbe	.LBB8_8
# %bb.11:                               #   in Loop: Header=BB8_9 Depth=1
	movq	(%rax,%rbx), %rdi
	movzwl	%r15w, %ecx
	subl	%edx, %ecx
	movzwl	%cx, %esi
	movzbl	%r14b, %edx
	callq	*-16(%rax,%rbx)
	movq	16(%r12), %rcx
	jmp	.LBB8_8
.LBB8_12:
	movb	3(%r12), %al
	jmp	.LBB8_15
.LBB8_13:
	leal	-2(%r15), %eax
	movb	%al, 3(%r12)
.LBB8_14:
	xorl	%ecx, %ecx
.LBB8_15:
	movb	6(%r12), %dl
	andb	$-49, %dl
	leal	32(%rdx), %r14d
	movb	%r14b, 6(%r12)
	leal	-1(%rax), %esi
	movb	%sil, 3(%r12)
	testq	%rcx, %rcx
	je	.LBB8_32
# %bb.16:
	movzbl	%al, %r13d
	orl	$256, %r13d             # imm = 0x100
	movzwl	%r13w, %r15d
	movl	$24, %ebx
	xorl	%ebp, %ebp
	jmp	.LBB8_18
	.p2align	4, 0x90
.LBB8_17:                               #   in Loop: Header=BB8_18 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rcx, %rbp
	jae	.LBB8_21
.LBB8_18:                               # =>This Inner Loop Header: Depth=1
	movq	8(%r12), %rax
	movzwl	-8(%rax,%rbx), %edx
	cmpw	%dx, %r13w
	jb	.LBB8_17
# %bb.19:                               #   in Loop: Header=BB8_18 Depth=1
	movzwl	-6(%rax,%rbx), %esi
	addl	%edx, %esi
	cmpl	%r15d, %esi
	jbe	.LBB8_17
# %bb.20:                               #   in Loop: Header=BB8_18 Depth=1
	movq	(%rax,%rbx), %rdi
	movl	%r15d, %ecx
	subl	%edx, %ecx
	movzwl	%cx, %esi
	movzbl	%r14b, %edx
	callq	*-16(%rax,%rbx)
	movq	16(%r12), %rcx
	jmp	.LBB8_17
.LBB8_21:
	orb	$4, 6(%r12)
	testq	%rcx, %rcx
	je	.LBB8_33
# %bb.22:
	movl	$24, %ebp
	xorl	%eax, %eax
	xorl	%ebx, %ebx
	jmp	.LBB8_24
	.p2align	4, 0x90
.LBB8_23:                               #   in Loop: Header=BB8_24 Depth=1
	addq	$1, %rbx
	addq	$32, %rbp
	cmpq	%rcx, %rbx
	jae	.LBB8_27
.LBB8_24:                               # =>This Inner Loop Header: Depth=1
	movq	8(%r12), %rdx
	movzwl	-8(%rdx,%rbp), %esi
	cmpl	$65535, %esi            # imm = 0xFFFF
	je	.LBB8_23
# %bb.25:                               #   in Loop: Header=BB8_24 Depth=1
	movzwl	-6(%rdx,%rbp), %edi
	addl	%esi, %edi
	cmpl	$65535, %edi            # imm = 0xFFFF
	jb	.LBB8_23
# %bb.26:                               #   in Loop: Header=BB8_24 Depth=1
	movq	(%rdx,%rbp), %rdi
	movl	$-2, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbp)
                                        # kill: def $al killed $al def $rax
	movq	16(%r12), %rcx
	jmp	.LBB8_23
.LBB8_27:
	movzbl	%al, %edx
	movw	%dx, 4(%r12)
	testq	%rcx, %rcx
	je	.LBB8_35
# %bb.28:
	movl	$24, %ebp
	xorl	%eax, %eax
	xorl	%ebx, %ebx
	jmp	.LBB8_30
	.p2align	4, 0x90
.LBB8_29:                               #   in Loop: Header=BB8_30 Depth=1
	addq	$1, %rbx
	addq	$32, %rbp
	cmpq	%rcx, %rbx
	jae	.LBB8_34
.LBB8_30:                               # =>This Inner Loop Header: Depth=1
	movq	8(%r12), %rdx
	movzwl	-8(%rdx,%rbp), %esi
	movzwl	-6(%rdx,%rbp), %edi
	addl	%esi, %edi
	cmpl	$65536, %edi            # imm = 0x10000
	jb	.LBB8_29
# %bb.31:                               #   in Loop: Header=BB8_30 Depth=1
	movq	(%rdx,%rbp), %rdi
	notl	%esi
	movzwl	%si, %esi
	callq	*-24(%rdx,%rbp)
                                        # kill: def $al killed $al def $rax
	movq	16(%r12), %rcx
	jmp	.LBB8_29
.LBB8_32:
	orb	$36, %dl
	movb	%dl, 6(%r12)
.LBB8_33:
	movw	$0, 4(%r12)
	xorl	%edx, %edx
.LBB8_35:
	xorl	%eax, %eax
	jmp	.LBB8_36
.LBB8_34:
	movzwl	4(%r12), %edx
.LBB8_36:
	movzbl	%al, %eax
	shll	$8, %eax
	orl	%eax, %edx
	movw	%dx, 4(%r12)
	addq	$8, %rsp
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%r12
	.cfi_def_cfa_offset 40
	popq	%r13
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end8:
	.size	triggerIRQ, .Lfunc_end8-triggerIRQ
	.cfi_endproc
                                        # -- End function
	.globl	BRK                     # -- Begin function BRK
	.p2align	4, 0x90
	.type	BRK,@function
BRK:                                    # @BRK
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r13
	.cfi_def_cfa_offset 40
	pushq	%r12
	.cfi_def_cfa_offset 48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	pushq	%rax
	.cfi_def_cfa_offset 64
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%rdi, %r12
	movl	4(%rdi), %r14d
	addl	$2, %r14d
	movw	%r14w, 4(%rdi)
	movzbl	3(%rdi), %r15d
	leal	-1(%r15), %eax
	movb	%al, 3(%rdi)
	movq	16(%rdi), %rcx
	testq	%rcx, %rcx
	je	.LBB9_13
# %bb.1:
	shrl	$8, %r14d
	orl	$256, %r15d             # imm = 0x100
	movl	$24, %ebx
	xorl	%ebp, %ebp
	jmp	.LBB9_3
	.p2align	4, 0x90
.LBB9_2:                                #   in Loop: Header=BB9_3 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rcx, %rbp
	jae	.LBB9_6
.LBB9_3:                                # =>This Inner Loop Header: Depth=1
	movq	8(%r12), %rax
	movzwl	-8(%rax,%rbx), %edx
	cmpw	%dx, %r15w
	jb	.LBB9_2
# %bb.4:                                #   in Loop: Header=BB9_3 Depth=1
	movzwl	-6(%rax,%rbx), %esi
	addl	%edx, %esi
	cmpl	%r15d, %esi
	jbe	.LBB9_2
# %bb.5:                                #   in Loop: Header=BB9_3 Depth=1
	movq	(%rax,%rbx), %rdi
	movzwl	%r15w, %ecx
	subl	%edx, %ecx
	movzwl	%cx, %esi
	movzbl	%r14b, %edx
	callq	*-16(%rax,%rbx)
	movq	16(%r12), %rcx
	jmp	.LBB9_2
.LBB9_6:
	movb	4(%r12), %r14b
	movzbl	3(%r12), %r15d
	leal	-1(%r15), %eax
	movb	%al, 3(%r12)
	testq	%rcx, %rcx
	je	.LBB9_14
# %bb.7:
	orl	$256, %r15d             # imm = 0x100
	movl	$24, %ebx
	xorl	%ebp, %ebp
	jmp	.LBB9_9
	.p2align	4, 0x90
.LBB9_8:                                #   in Loop: Header=BB9_9 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rcx, %rbp
	jae	.LBB9_12
.LBB9_9:                                # =>This Inner Loop Header: Depth=1
	movq	8(%r12), %rax
	movzwl	-8(%rax,%rbx), %edx
	cmpw	%dx, %r15w
	jb	.LBB9_8
# %bb.10:                               #   in Loop: Header=BB9_9 Depth=1
	movzwl	-6(%rax,%rbx), %esi
	addl	%edx, %esi
	cmpl	%r15d, %esi
	jbe	.LBB9_8
# %bb.11:                               #   in Loop: Header=BB9_9 Depth=1
	movq	(%rax,%rbx), %rdi
	movzwl	%r15w, %ecx
	subl	%edx, %ecx
	movzwl	%cx, %esi
	movzbl	%r14b, %edx
	callq	*-16(%rax,%rbx)
	movq	16(%r12), %rcx
	jmp	.LBB9_8
.LBB9_12:
	movb	3(%r12), %al
	jmp	.LBB9_15
.LBB9_13:
	leal	-2(%r15), %eax
	movb	%al, 3(%r12)
.LBB9_14:
	xorl	%ecx, %ecx
.LBB9_15:
	movb	6(%r12), %dl
	movl	%edx, %r14d
	orb	$48, %r14b
	movb	%r14b, 6(%r12)
	leal	-1(%rax), %esi
	movb	%sil, 3(%r12)
	testq	%rcx, %rcx
	je	.LBB9_32
# %bb.16:
	movzbl	%al, %r13d
	orl	$256, %r13d             # imm = 0x100
	movzwl	%r13w, %r15d
	movl	$24, %ebx
	xorl	%ebp, %ebp
	jmp	.LBB9_18
	.p2align	4, 0x90
.LBB9_17:                               #   in Loop: Header=BB9_18 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rcx, %rbp
	jae	.LBB9_21
.LBB9_18:                               # =>This Inner Loop Header: Depth=1
	movq	8(%r12), %rax
	movzwl	-8(%rax,%rbx), %edx
	cmpw	%dx, %r13w
	jb	.LBB9_17
# %bb.19:                               #   in Loop: Header=BB9_18 Depth=1
	movzwl	-6(%rax,%rbx), %esi
	addl	%edx, %esi
	cmpl	%r15d, %esi
	jbe	.LBB9_17
# %bb.20:                               #   in Loop: Header=BB9_18 Depth=1
	movq	(%rax,%rbx), %rdi
	movl	%r15d, %ecx
	subl	%edx, %ecx
	movzwl	%cx, %esi
	movzbl	%r14b, %edx
	callq	*-16(%rax,%rbx)
	movq	16(%r12), %rcx
	jmp	.LBB9_17
.LBB9_21:
	orb	$4, 6(%r12)
	testq	%rcx, %rcx
	je	.LBB9_33
# %bb.22:
	movl	$24, %ebp
	xorl	%eax, %eax
	xorl	%ebx, %ebx
	jmp	.LBB9_24
	.p2align	4, 0x90
.LBB9_23:                               #   in Loop: Header=BB9_24 Depth=1
	addq	$1, %rbx
	addq	$32, %rbp
	cmpq	%rcx, %rbx
	jae	.LBB9_27
.LBB9_24:                               # =>This Inner Loop Header: Depth=1
	movq	8(%r12), %rdx
	movzwl	-8(%rdx,%rbp), %esi
	cmpl	$65535, %esi            # imm = 0xFFFF
	je	.LBB9_23
# %bb.25:                               #   in Loop: Header=BB9_24 Depth=1
	movzwl	-6(%rdx,%rbp), %edi
	addl	%esi, %edi
	cmpl	$65535, %edi            # imm = 0xFFFF
	jb	.LBB9_23
# %bb.26:                               #   in Loop: Header=BB9_24 Depth=1
	movq	(%rdx,%rbp), %rdi
	movl	$-2, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbp)
                                        # kill: def $al killed $al def $rax
	movq	16(%r12), %rcx
	jmp	.LBB9_23
.LBB9_27:
	movzbl	%al, %edx
	movw	%dx, 4(%r12)
	testq	%rcx, %rcx
	je	.LBB9_35
# %bb.28:
	movl	$24, %ebp
	xorl	%eax, %eax
	xorl	%ebx, %ebx
	jmp	.LBB9_30
	.p2align	4, 0x90
.LBB9_29:                               #   in Loop: Header=BB9_30 Depth=1
	addq	$1, %rbx
	addq	$32, %rbp
	cmpq	%rcx, %rbx
	jae	.LBB9_34
.LBB9_30:                               # =>This Inner Loop Header: Depth=1
	movq	8(%r12), %rdx
	movzwl	-8(%rdx,%rbp), %esi
	movzwl	-6(%rdx,%rbp), %edi
	addl	%esi, %edi
	cmpl	$65536, %edi            # imm = 0x10000
	jb	.LBB9_29
# %bb.31:                               #   in Loop: Header=BB9_30 Depth=1
	movq	(%rdx,%rbp), %rdi
	notl	%esi
	movzwl	%si, %esi
	callq	*-24(%rdx,%rbp)
                                        # kill: def $al killed $al def $rax
	movq	16(%r12), %rcx
	jmp	.LBB9_29
.LBB9_32:
	orb	$52, %dl
	movb	%dl, 6(%r12)
.LBB9_33:
	movw	$0, 4(%r12)
	xorl	%edx, %edx
.LBB9_35:
	xorl	%eax, %eax
	jmp	.LBB9_36
.LBB9_34:
	movzwl	4(%r12), %edx
.LBB9_36:
	movzbl	%al, %eax
	shll	$8, %eax
	orl	%eax, %edx
	movw	%dx, 4(%r12)
	movl	$7, %eax
	addq	$8, %rsp
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%r12
	.cfi_def_cfa_offset 40
	popq	%r13
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end9:
	.size	BRK, .Lfunc_end9-BRK
	.cfi_endproc
                                        # -- End function
	.globl	CLC                     # -- Begin function CLC
	.p2align	4, 0x90
	.type	CLC,@function
CLC:                                    # @CLC
	.cfi_startproc
# %bb.0:
	andb	$-2, 6(%rdi)
	movl	$2, %eax
	retq
.Lfunc_end10:
	.size	CLC, .Lfunc_end10-CLC
	.cfi_endproc
                                        # -- End function
	.globl	CLI                     # -- Begin function CLI
	.p2align	4, 0x90
	.type	CLI,@function
CLI:                                    # @CLI
	.cfi_startproc
# %bb.0:
	andb	$-5, 6(%rdi)
	movl	$2, %eax
	retq
.Lfunc_end11:
	.size	CLI, .Lfunc_end11-CLI
	.cfi_endproc
                                        # -- End function
	.globl	CLV                     # -- Begin function CLV
	.p2align	4, 0x90
	.type	CLV,@function
CLV:                                    # @CLV
	.cfi_startproc
# %bb.0:
	andb	$-65, 6(%rdi)
	movl	$2, %eax
	retq
.Lfunc_end12:
	.size	CLV, .Lfunc_end12-CLV
	.cfi_endproc
                                        # -- End function
	.globl	CLD                     # -- Begin function CLD
	.p2align	4, 0x90
	.type	CLD,@function
CLD:                                    # @CLD
	.cfi_startproc
# %bb.0:
	andb	$-9, 6(%rdi)
	movl	$2, %eax
	retq
.Lfunc_end13:
	.size	CLD, .Lfunc_end13-CLD
	.cfi_endproc
                                        # -- End function
	.globl	SEC                     # -- Begin function SEC
	.p2align	4, 0x90
	.type	SEC,@function
SEC:                                    # @SEC
	.cfi_startproc
# %bb.0:
	orb	$1, 6(%rdi)
	movl	$2, %eax
	retq
.Lfunc_end14:
	.size	SEC, .Lfunc_end14-SEC
	.cfi_endproc
                                        # -- End function
	.globl	SEI                     # -- Begin function SEI
	.p2align	4, 0x90
	.type	SEI,@function
SEI:                                    # @SEI
	.cfi_startproc
# %bb.0:
	orb	$4, 6(%rdi)
	movl	$2, %eax
	retq
.Lfunc_end15:
	.size	SEI, .Lfunc_end15-SEI
	.cfi_endproc
                                        # -- End function
	.globl	SED                     # -- Begin function SED
	.p2align	4, 0x90
	.type	SED,@function
SED:                                    # @SED
	.cfi_startproc
# %bb.0:
	orb	$8, 6(%rdi)
	movl	$2, %eax
	retq
.Lfunc_end16:
	.size	SED, .Lfunc_end16-SED
	.cfi_endproc
                                        # -- End function
	.globl	ORA_imm                 # -- Begin function ORA_imm
	.p2align	4, 0x90
	.type	ORA_imm,@function
ORA_imm:                                # @ORA_imm
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r12
	.cfi_def_cfa_offset 40
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset %rbx, -48
	.cfi_offset %r12, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%rdi, %r15
	movb	(%rdi), %r14b
	movzwl	4(%rdi), %r12d
	leal	1(%r12), %eax
	movw	%ax, 4(%rdi)
	movq	16(%rdi), %rcx
	testq	%rcx, %rcx
	je	.LBB17_1
# %bb.2:
	movl	$24, %ebx
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	jmp	.LBB17_3
	.p2align	4, 0x90
.LBB17_6:                               #   in Loop: Header=BB17_3 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rcx, %rbp
	jae	.LBB17_7
.LBB17_3:                               # =>This Inner Loop Header: Depth=1
	movq	8(%r15), %rdx
	movzwl	-8(%rdx,%rbx), %esi
	cmpw	%si, %r12w
	jb	.LBB17_6
# %bb.4:                                #   in Loop: Header=BB17_3 Depth=1
	movzwl	-6(%rdx,%rbx), %edi
	addl	%esi, %edi
	cmpl	%r12d, %edi
	jbe	.LBB17_6
# %bb.5:                                #   in Loop: Header=BB17_3 Depth=1
	movq	(%rdx,%rbx), %rdi
	movl	%r12d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbx)
                                        # kill: def $al killed $al def $rax
	movq	16(%r15), %rcx
	jmp	.LBB17_6
.LBB17_1:
	xorl	%eax, %eax
.LBB17_7:
	orb	%r14b, %al
	movb	%al, (%r15)
	movb	6(%r15), %cl
	js	.LBB17_8
# %bb.10:
	andb	$127, %cl
	movb	%cl, 6(%r15)
	testb	%al, %al
	jne	.LBB17_9
# %bb.11:
	orb	$2, %cl
	jmp	.LBB17_12
.LBB17_8:
	orb	$-128, %cl
	movb	%cl, 6(%r15)
.LBB17_9:
	andb	$-3, %cl
.LBB17_12:
	movb	%cl, 6(%r15)
	movl	$2, %eax
	popq	%rbx
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end17:
	.size	ORA_imm, .Lfunc_end17-ORA_imm
	.cfi_endproc
                                        # -- End function
	.globl	ORA_zpg                 # -- Begin function ORA_zpg
	.p2align	4, 0x90
	.type	ORA_zpg,@function
ORA_zpg:                                # @ORA_zpg
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r12
	.cfi_def_cfa_offset 40
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset %rbx, -48
	.cfi_offset %r12, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%rdi, %r15
	movb	(%rdi), %r14b
	movzwl	4(%rdi), %r12d
	movq	16(%rdi), %rcx
	testq	%rcx, %rcx
	je	.LBB18_1
# %bb.2:
	movl	$24, %ebx
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	jmp	.LBB18_3
	.p2align	4, 0x90
.LBB18_6:                               #   in Loop: Header=BB18_3 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rcx, %rbp
	jae	.LBB18_7
.LBB18_3:                               # =>This Inner Loop Header: Depth=1
	movq	8(%r15), %rdx
	movzwl	-8(%rdx,%rbx), %esi
	cmpw	%si, %r12w
	jb	.LBB18_6
# %bb.4:                                #   in Loop: Header=BB18_3 Depth=1
	movzwl	-6(%rdx,%rbx), %edi
	addl	%esi, %edi
	cmpl	%r12d, %edi
	jbe	.LBB18_6
# %bb.5:                                #   in Loop: Header=BB18_3 Depth=1
	movq	(%rdx,%rbx), %rdi
	movl	%r12d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbx)
                                        # kill: def $al killed $al def $rax
	movq	16(%r15), %rcx
	jmp	.LBB18_6
.LBB18_7:
	addw	$1, 4(%r15)
	testq	%rcx, %rcx
	je	.LBB18_8
# %bb.9:
	movzbl	%al, %r12d
	movl	$24, %ebx
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	jmp	.LBB18_10
	.p2align	4, 0x90
.LBB18_13:                              #   in Loop: Header=BB18_10 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rcx, %rbp
	jae	.LBB18_14
.LBB18_10:                              # =>This Inner Loop Header: Depth=1
	movq	8(%r15), %rdx
	movzwl	-8(%rdx,%rbx), %esi
	cmpw	%r12w, %si
	ja	.LBB18_13
# %bb.11:                               #   in Loop: Header=BB18_10 Depth=1
	movzwl	-6(%rdx,%rbx), %edi
	addl	%esi, %edi
	cmpl	%r12d, %edi
	jbe	.LBB18_13
# %bb.12:                               #   in Loop: Header=BB18_10 Depth=1
	movq	(%rdx,%rbx), %rdi
	movzwl	%r12w, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbx)
                                        # kill: def $al killed $al def $rax
	movq	16(%r15), %rcx
	jmp	.LBB18_13
.LBB18_1:
	addl	$1, %r12d
	movw	%r12w, 4(%r15)
	xorl	%eax, %eax
.LBB18_14:
	orb	%r14b, %al
	movb	%al, (%r15)
	movb	6(%r15), %cl
	js	.LBB18_15
.LBB18_17:
	andb	$127, %cl
	movb	%cl, 6(%r15)
	testb	%al, %al
	jne	.LBB18_16
# %bb.18:
	orb	$2, %cl
	jmp	.LBB18_19
.LBB18_8:
	xorl	%eax, %eax
	orb	%r14b, %al
	movb	%al, (%r15)
	movb	6(%r15), %cl
	jns	.LBB18_17
.LBB18_15:
	orb	$-128, %cl
	movb	%cl, 6(%r15)
.LBB18_16:
	andb	$-3, %cl
.LBB18_19:
	movb	%cl, 6(%r15)
	movl	$3, %eax
	popq	%rbx
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end18:
	.size	ORA_zpg, .Lfunc_end18-ORA_zpg
	.cfi_endproc
                                        # -- End function
	.globl	ORA_zpgx                # -- Begin function ORA_zpgx
	.p2align	4, 0x90
	.type	ORA_zpgx,@function
ORA_zpgx:                               # @ORA_zpgx
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r13
	.cfi_def_cfa_offset 40
	pushq	%r12
	.cfi_def_cfa_offset 48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	pushq	%rax
	.cfi_def_cfa_offset 64
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%rdi, %r13
	movb	(%rdi), %r14b
	movzwl	4(%rdi), %r12d
	movq	16(%rdi), %rcx
	testq	%rcx, %rcx
	je	.LBB19_1
# %bb.2:
	movzwl	%r12w, %r15d
	movl	$24, %ebp
	xorl	%eax, %eax
	xorl	%ebx, %ebx
	jmp	.LBB19_3
	.p2align	4, 0x90
.LBB19_6:                               #   in Loop: Header=BB19_3 Depth=1
	addq	$1, %rbx
	addq	$32, %rbp
	cmpq	%rcx, %rbx
	jae	.LBB19_7
.LBB19_3:                               # =>This Inner Loop Header: Depth=1
	movq	8(%r13), %rdx
	movzwl	-8(%rdx,%rbp), %esi
	cmpw	%si, %r12w
	jb	.LBB19_6
# %bb.4:                                #   in Loop: Header=BB19_3 Depth=1
	movzwl	-6(%rdx,%rbp), %edi
	addl	%esi, %edi
	cmpl	%r15d, %edi
	jbe	.LBB19_6
# %bb.5:                                #   in Loop: Header=BB19_3 Depth=1
	movq	(%rdx,%rbp), %rdi
	movl	%r12d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbp)
                                        # kill: def $al killed $al def $rax
	movq	16(%r13), %rcx
	jmp	.LBB19_6
.LBB19_7:
	movzwl	4(%r13), %r12d
	jmp	.LBB19_8
.LBB19_1:
	xorl	%ecx, %ecx
	xorl	%eax, %eax
.LBB19_8:
	addb	1(%r13), %al
	addl	$1, %r12d
	movw	%r12w, 4(%r13)
	testq	%rcx, %rcx
	je	.LBB19_9
# %bb.10:
	movzbl	%al, %r12d
	movzwl	%r12w, %r15d
	movl	$24, %ebp
	xorl	%eax, %eax
	xorl	%ebx, %ebx
	jmp	.LBB19_11
	.p2align	4, 0x90
.LBB19_14:                              #   in Loop: Header=BB19_11 Depth=1
	addq	$1, %rbx
	addq	$32, %rbp
	cmpq	%rcx, %rbx
	jae	.LBB19_15
.LBB19_11:                              # =>This Inner Loop Header: Depth=1
	movq	8(%r13), %rdx
	movzwl	-8(%rdx,%rbp), %esi
	cmpw	%r12w, %si
	ja	.LBB19_14
# %bb.12:                               #   in Loop: Header=BB19_11 Depth=1
	movzwl	-6(%rdx,%rbp), %edi
	addl	%esi, %edi
	cmpl	%r15d, %edi
	jbe	.LBB19_14
# %bb.13:                               #   in Loop: Header=BB19_11 Depth=1
	movq	(%rdx,%rbp), %rdi
	movl	%r15d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbp)
                                        # kill: def $al killed $al def $rax
	movq	16(%r13), %rcx
	jmp	.LBB19_14
.LBB19_9:
	xorl	%eax, %eax
.LBB19_15:
	orb	%r14b, %al
	movb	%al, (%r13)
	movb	6(%r13), %cl
	js	.LBB19_16
# %bb.18:
	andb	$127, %cl
	movb	%cl, 6(%r13)
	testb	%al, %al
	jne	.LBB19_17
# %bb.19:
	orb	$2, %cl
	jmp	.LBB19_20
.LBB19_16:
	orb	$-128, %cl
	movb	%cl, 6(%r13)
.LBB19_17:
	andb	$-3, %cl
.LBB19_20:
	movb	%cl, 6(%r13)
	movl	$4, %eax
	addq	$8, %rsp
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%r12
	.cfi_def_cfa_offset 40
	popq	%r13
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end19:
	.size	ORA_zpgx, .Lfunc_end19-ORA_zpgx
	.cfi_endproc
                                        # -- End function
	.globl	ORA_abss                # -- Begin function ORA_abss
	.p2align	4, 0x90
	.type	ORA_abss,@function
ORA_abss:                               # @ORA_abss
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r13
	.cfi_def_cfa_offset 40
	pushq	%r12
	.cfi_def_cfa_offset 48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	pushq	%rax
	.cfi_def_cfa_offset 64
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%rdi, %r13
	movb	(%rdi), %r12b
	movzwl	4(%rdi), %r14d
	movq	16(%rdi), %rcx
	testq	%rcx, %rcx
	movb	%r12b, 7(%rsp)          # 1-byte Spill
	je	.LBB20_12
# %bb.1:
	movzwl	%r14w, %r15d
	movl	$24, %ebx
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	jmp	.LBB20_3
	.p2align	4, 0x90
.LBB20_2:                               #   in Loop: Header=BB20_3 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rcx, %rbp
	jae	.LBB20_6
.LBB20_3:                               # =>This Inner Loop Header: Depth=1
	movq	8(%r13), %rdx
	movzwl	-8(%rdx,%rbx), %esi
	cmpw	%si, %r14w
	jb	.LBB20_2
# %bb.4:                                #   in Loop: Header=BB20_3 Depth=1
	movzwl	-6(%rdx,%rbx), %edi
	addl	%esi, %edi
	cmpl	%r15d, %edi
	jbe	.LBB20_2
# %bb.5:                                #   in Loop: Header=BB20_3 Depth=1
	movq	(%rdx,%rbx), %rdi
	movl	%r14d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbx)
                                        # kill: def $al killed $al def $rax
	movq	16(%r13), %rcx
	jmp	.LBB20_2
.LBB20_6:
	movl	4(%r13), %r14d
	testq	%rcx, %rcx
	je	.LBB20_12
# %bb.7:
	movzbl	%al, %r15d
	addl	$1, %r14d
	movzwl	%r14w, %r12d
	movl	$24, %ebx
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	jmp	.LBB20_9
	.p2align	4, 0x90
.LBB20_8:                               #   in Loop: Header=BB20_9 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rcx, %rbp
	jae	.LBB20_13
.LBB20_9:                               # =>This Inner Loop Header: Depth=1
	movq	8(%r13), %rdx
	movzwl	-8(%rdx,%rbx), %esi
	cmpw	%si, %r14w
	jb	.LBB20_8
# %bb.10:                               #   in Loop: Header=BB20_9 Depth=1
	movzwl	-6(%rdx,%rbx), %edi
	addl	%esi, %edi
	cmpl	%r12d, %edi
	jbe	.LBB20_8
# %bb.11:                               #   in Loop: Header=BB20_9 Depth=1
	movq	(%rdx,%rbx), %rdi
	movl	%r14d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbx)
                                        # kill: def $al killed $al def $rax
	movq	16(%r13), %rcx
	jmp	.LBB20_8
.LBB20_12:
	addl	$2, %r14d
	movw	%r14w, 4(%r13)
.LBB20_19:
	xorl	%eax, %eax
.LBB20_20:
	orb	7(%rsp), %al            # 1-byte Folded Reload
	movb	%al, (%r13)
	movb	6(%r13), %cl
	js	.LBB20_23
# %bb.21:
	andb	$127, %cl
	movb	%cl, 6(%r13)
	testb	%al, %al
	jne	.LBB20_24
# %bb.22:
	orb	$2, %cl
	jmp	.LBB20_25
.LBB20_13:
	addw	$2, 4(%r13)
	testq	%rcx, %rcx
	je	.LBB20_19
# %bb.14:
	movzbl	%al, %eax
	shll	$8, %eax
	movzwl	%r15w, %r12d
	orl	%eax, %r12d
	movzwl	%r12w, %r15d
	movl	$24, %ebp
	xorl	%eax, %eax
	xorl	%ebx, %ebx
	jmp	.LBB20_16
	.p2align	4, 0x90
.LBB20_15:                              #   in Loop: Header=BB20_16 Depth=1
	addq	$1, %rbx
	addq	$32, %rbp
	cmpq	%rcx, %rbx
	jae	.LBB20_20
.LBB20_16:                              # =>This Inner Loop Header: Depth=1
	movq	8(%r13), %rdx
	movzwl	-8(%rdx,%rbp), %esi
	cmpw	%si, %r12w
	jb	.LBB20_15
# %bb.17:                               #   in Loop: Header=BB20_16 Depth=1
	movzwl	-6(%rdx,%rbp), %edi
	addl	%esi, %edi
	cmpl	%r15d, %edi
	jbe	.LBB20_15
# %bb.18:                               #   in Loop: Header=BB20_16 Depth=1
	movq	(%rdx,%rbp), %rdi
	movl	%r12d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbp)
                                        # kill: def $al killed $al def $rax
	movq	16(%r13), %rcx
	jmp	.LBB20_15
.LBB20_23:
	orb	$-128, %cl
	movb	%cl, 6(%r13)
.LBB20_24:
	andb	$-3, %cl
.LBB20_25:
	movb	%cl, 6(%r13)
	movl	$4, %eax
	addq	$8, %rsp
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%r12
	.cfi_def_cfa_offset 40
	popq	%r13
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end20:
	.size	ORA_abss, .Lfunc_end20-ORA_abss
	.cfi_endproc
                                        # -- End function
	.globl	ORA_absx                # -- Begin function ORA_absx
	.p2align	4, 0x90
	.type	ORA_absx,@function
ORA_absx:                               # @ORA_absx
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r13
	.cfi_def_cfa_offset 40
	pushq	%r12
	.cfi_def_cfa_offset 48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	pushq	%rax
	.cfi_def_cfa_offset 64
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%rdi, %r13
	movb	(%rdi), %al
	movzwl	4(%rdi), %r14d
	movq	16(%rdi), %rcx
	testq	%rcx, %rcx
	movb	%al, 7(%rsp)            # 1-byte Spill
	je	.LBB21_13
# %bb.1:
	movzwl	%r14w, %r15d
	movl	$24, %ebx
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	jmp	.LBB21_3
	.p2align	4, 0x90
.LBB21_2:                               #   in Loop: Header=BB21_3 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rcx, %rbp
	jae	.LBB21_6
.LBB21_3:                               # =>This Inner Loop Header: Depth=1
	movq	8(%r13), %rdx
	movzwl	-8(%rdx,%rbx), %esi
	cmpw	%si, %r14w
	jb	.LBB21_2
# %bb.4:                                #   in Loop: Header=BB21_3 Depth=1
	movzwl	-6(%rdx,%rbx), %edi
	addl	%esi, %edi
	cmpl	%r15d, %edi
	jbe	.LBB21_2
# %bb.5:                                #   in Loop: Header=BB21_3 Depth=1
	movq	(%rdx,%rbx), %rdi
	movl	%r14d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbx)
                                        # kill: def $al killed $al def $rax
	movq	16(%r13), %rcx
	jmp	.LBB21_2
.LBB21_6:
	movzbl	%al, %r15d
	movl	4(%r13), %r14d
	testq	%rcx, %rcx
	je	.LBB21_14
# %bb.7:
	addl	$1, %r14d
	movzwl	%r14w, %r12d
	movl	$24, %ebx
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	jmp	.LBB21_9
	.p2align	4, 0x90
.LBB21_8:                               #   in Loop: Header=BB21_9 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rcx, %rbp
	jae	.LBB21_12
.LBB21_9:                               # =>This Inner Loop Header: Depth=1
	movq	8(%r13), %rdx
	movzwl	-8(%rdx,%rbx), %esi
	cmpw	%si, %r14w
	jb	.LBB21_8
# %bb.10:                               #   in Loop: Header=BB21_9 Depth=1
	movzwl	-6(%rdx,%rbx), %edi
	addl	%esi, %edi
	cmpl	%r12d, %edi
	jbe	.LBB21_8
# %bb.11:                               #   in Loop: Header=BB21_9 Depth=1
	movq	(%rdx,%rbx), %rdi
	movl	%r14d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbx)
                                        # kill: def $al killed $al def $rax
	movq	16(%r13), %rcx
	jmp	.LBB21_8
.LBB21_12:
	movzwl	4(%r13), %r14d
	jmp	.LBB21_16
.LBB21_13:
	xorl	%ecx, %ecx
	xorl	%r15d, %r15d
	jmp	.LBB21_15
.LBB21_14:
	xorl	%ecx, %ecx
.LBB21_15:
	xorl	%eax, %eax
.LBB21_16:
	movzbl	1(%r13), %edx
	addl	$2, %r14d
	movw	%r14w, 4(%r13)
	testq	%rcx, %rcx
	je	.LBB21_22
# %bb.17:
	movzbl	%al, %eax
	shll	$8, %eax
	movzwl	%r15w, %r12d
	orl	%eax, %r12d
	addl	%edx, %r12d
	movzwl	%r12w, %r15d
	movl	$24, %ebx
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	jmp	.LBB21_19
	.p2align	4, 0x90
.LBB21_18:                              #   in Loop: Header=BB21_19 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rcx, %rbp
	jae	.LBB21_23
.LBB21_19:                              # =>This Inner Loop Header: Depth=1
	movq	8(%r13), %rdx
	movzwl	-8(%rdx,%rbx), %esi
	cmpw	%si, %r12w
	jb	.LBB21_18
# %bb.20:                               #   in Loop: Header=BB21_19 Depth=1
	movzwl	-6(%rdx,%rbx), %edi
	addl	%esi, %edi
	cmpl	%r15d, %edi
	jbe	.LBB21_18
# %bb.21:                               #   in Loop: Header=BB21_19 Depth=1
	movq	(%rdx,%rbx), %rdi
	movl	%r12d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbx)
                                        # kill: def $al killed $al def $rax
	movq	16(%r13), %rcx
	jmp	.LBB21_18
.LBB21_22:
	xorl	%eax, %eax
.LBB21_23:
	orb	7(%rsp), %al            # 1-byte Folded Reload
	movb	%al, (%r13)
	movb	6(%r13), %cl
	js	.LBB21_26
# %bb.24:
	andb	$127, %cl
	movb	%cl, 6(%r13)
	testb	%al, %al
	jne	.LBB21_27
# %bb.25:
	orb	$2, %cl
	jmp	.LBB21_28
.LBB21_26:
	orb	$-128, %cl
	movb	%cl, 6(%r13)
.LBB21_27:
	andb	$-3, %cl
.LBB21_28:
	movb	%cl, 6(%r13)
	movl	$4, %eax
	addq	$8, %rsp
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%r12
	.cfi_def_cfa_offset 40
	popq	%r13
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end21:
	.size	ORA_absx, .Lfunc_end21-ORA_absx
	.cfi_endproc
                                        # -- End function
	.globl	ORA_absy                # -- Begin function ORA_absy
	.p2align	4, 0x90
	.type	ORA_absy,@function
ORA_absy:                               # @ORA_absy
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r13
	.cfi_def_cfa_offset 40
	pushq	%r12
	.cfi_def_cfa_offset 48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	pushq	%rax
	.cfi_def_cfa_offset 64
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%rdi, %r13
	movb	(%rdi), %al
	movzwl	4(%rdi), %r14d
	movq	16(%rdi), %rcx
	testq	%rcx, %rcx
	movb	%al, 7(%rsp)            # 1-byte Spill
	je	.LBB22_13
# %bb.1:
	movzwl	%r14w, %r15d
	movl	$24, %ebx
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	jmp	.LBB22_3
	.p2align	4, 0x90
.LBB22_2:                               #   in Loop: Header=BB22_3 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rcx, %rbp
	jae	.LBB22_6
.LBB22_3:                               # =>This Inner Loop Header: Depth=1
	movq	8(%r13), %rdx
	movzwl	-8(%rdx,%rbx), %esi
	cmpw	%si, %r14w
	jb	.LBB22_2
# %bb.4:                                #   in Loop: Header=BB22_3 Depth=1
	movzwl	-6(%rdx,%rbx), %edi
	addl	%esi, %edi
	cmpl	%r15d, %edi
	jbe	.LBB22_2
# %bb.5:                                #   in Loop: Header=BB22_3 Depth=1
	movq	(%rdx,%rbx), %rdi
	movl	%r14d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbx)
                                        # kill: def $al killed $al def $rax
	movq	16(%r13), %rcx
	jmp	.LBB22_2
.LBB22_6:
	movzbl	%al, %r15d
	movl	4(%r13), %r14d
	testq	%rcx, %rcx
	je	.LBB22_14
# %bb.7:
	addl	$1, %r14d
	movzwl	%r14w, %r12d
	movl	$24, %ebx
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	jmp	.LBB22_9
	.p2align	4, 0x90
.LBB22_8:                               #   in Loop: Header=BB22_9 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rcx, %rbp
	jae	.LBB22_12
.LBB22_9:                               # =>This Inner Loop Header: Depth=1
	movq	8(%r13), %rdx
	movzwl	-8(%rdx,%rbx), %esi
	cmpw	%si, %r14w
	jb	.LBB22_8
# %bb.10:                               #   in Loop: Header=BB22_9 Depth=1
	movzwl	-6(%rdx,%rbx), %edi
	addl	%esi, %edi
	cmpl	%r12d, %edi
	jbe	.LBB22_8
# %bb.11:                               #   in Loop: Header=BB22_9 Depth=1
	movq	(%rdx,%rbx), %rdi
	movl	%r14d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbx)
                                        # kill: def $al killed $al def $rax
	movq	16(%r13), %rcx
	jmp	.LBB22_8
.LBB22_12:
	movzwl	4(%r13), %r14d
	jmp	.LBB22_16
.LBB22_13:
	xorl	%ecx, %ecx
	xorl	%r15d, %r15d
	jmp	.LBB22_15
.LBB22_14:
	xorl	%ecx, %ecx
.LBB22_15:
	xorl	%eax, %eax
.LBB22_16:
	movzbl	2(%r13), %edx
	addl	$2, %r14d
	movw	%r14w, 4(%r13)
	testq	%rcx, %rcx
	je	.LBB22_22
# %bb.17:
	movzbl	%al, %eax
	shll	$8, %eax
	movzwl	%r15w, %r12d
	orl	%eax, %r12d
	addl	%edx, %r12d
	movzwl	%r12w, %r15d
	movl	$24, %ebx
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	jmp	.LBB22_19
	.p2align	4, 0x90
.LBB22_18:                              #   in Loop: Header=BB22_19 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rcx, %rbp
	jae	.LBB22_23
.LBB22_19:                              # =>This Inner Loop Header: Depth=1
	movq	8(%r13), %rdx
	movzwl	-8(%rdx,%rbx), %esi
	cmpw	%si, %r12w
	jb	.LBB22_18
# %bb.20:                               #   in Loop: Header=BB22_19 Depth=1
	movzwl	-6(%rdx,%rbx), %edi
	addl	%esi, %edi
	cmpl	%r15d, %edi
	jbe	.LBB22_18
# %bb.21:                               #   in Loop: Header=BB22_19 Depth=1
	movq	(%rdx,%rbx), %rdi
	movl	%r12d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbx)
                                        # kill: def $al killed $al def $rax
	movq	16(%r13), %rcx
	jmp	.LBB22_18
.LBB22_22:
	xorl	%eax, %eax
.LBB22_23:
	orb	7(%rsp), %al            # 1-byte Folded Reload
	movb	%al, (%r13)
	movb	6(%r13), %cl
	js	.LBB22_26
# %bb.24:
	andb	$127, %cl
	movb	%cl, 6(%r13)
	testb	%al, %al
	jne	.LBB22_27
# %bb.25:
	orb	$2, %cl
	jmp	.LBB22_28
.LBB22_26:
	orb	$-128, %cl
	movb	%cl, 6(%r13)
.LBB22_27:
	andb	$-3, %cl
.LBB22_28:
	movb	%cl, 6(%r13)
	movl	$4, %eax
	addq	$8, %rsp
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%r12
	.cfi_def_cfa_offset 40
	popq	%r13
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end22:
	.size	ORA_absy, .Lfunc_end22-ORA_absy
	.cfi_endproc
                                        # -- End function
	.globl	ORA_xind                # -- Begin function ORA_xind
	.p2align	4, 0x90
	.type	ORA_xind,@function
ORA_xind:                               # @ORA_xind
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r13
	.cfi_def_cfa_offset 40
	pushq	%r12
	.cfi_def_cfa_offset 48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	pushq	%rax
	.cfi_def_cfa_offset 64
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%rdi, %r13
	movb	(%rdi), %r14b
	callq	xind
	movq	16(%r13), %rcx
	testq	%rcx, %rcx
	je	.LBB23_1
# %bb.2:
	movl	%eax, %r12d
	movzwl	%ax, %r15d
	movl	$24, %ebp
	xorl	%eax, %eax
	xorl	%ebx, %ebx
	jmp	.LBB23_3
	.p2align	4, 0x90
.LBB23_6:                               #   in Loop: Header=BB23_3 Depth=1
	addq	$1, %rbx
	addq	$32, %rbp
	cmpq	%rcx, %rbx
	jae	.LBB23_7
.LBB23_3:                               # =>This Inner Loop Header: Depth=1
	movq	8(%r13), %rdx
	movzwl	-8(%rdx,%rbp), %esi
	cmpw	%si, %r12w
	jb	.LBB23_6
# %bb.4:                                #   in Loop: Header=BB23_3 Depth=1
	movzwl	-6(%rdx,%rbp), %edi
	addl	%esi, %edi
	cmpl	%r15d, %edi
	jbe	.LBB23_6
# %bb.5:                                #   in Loop: Header=BB23_3 Depth=1
	movq	(%rdx,%rbp), %rdi
	movl	%r15d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbp)
                                        # kill: def $al killed $al def $rax
	movq	16(%r13), %rcx
	jmp	.LBB23_6
.LBB23_1:
	xorl	%eax, %eax
.LBB23_7:
	orb	%r14b, %al
	movb	%al, (%r13)
	movb	6(%r13), %cl
	js	.LBB23_8
# %bb.10:
	andb	$127, %cl
	movb	%cl, 6(%r13)
	testb	%al, %al
	jne	.LBB23_9
# %bb.11:
	orb	$2, %cl
	jmp	.LBB23_12
.LBB23_8:
	orb	$-128, %cl
	movb	%cl, 6(%r13)
.LBB23_9:
	andb	$-3, %cl
.LBB23_12:
	movb	%cl, 6(%r13)
	movl	$6, %eax
	addq	$8, %rsp
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%r12
	.cfi_def_cfa_offset 40
	popq	%r13
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end23:
	.size	ORA_xind, .Lfunc_end23-ORA_xind
	.cfi_endproc
                                        # -- End function
	.globl	ORA_indy                # -- Begin function ORA_indy
	.p2align	4, 0x90
	.type	ORA_indy,@function
ORA_indy:                               # @ORA_indy
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r13
	.cfi_def_cfa_offset 40
	pushq	%r12
	.cfi_def_cfa_offset 48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	pushq	%rax
	.cfi_def_cfa_offset 64
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%rdi, %r13
	movb	(%rdi), %r14b
	callq	indy
	movq	16(%r13), %rcx
	testq	%rcx, %rcx
	je	.LBB24_1
# %bb.2:
	movl	%eax, %r12d
	movzwl	%ax, %r15d
	movl	$24, %ebp
	xorl	%eax, %eax
	xorl	%ebx, %ebx
	jmp	.LBB24_3
	.p2align	4, 0x90
.LBB24_6:                               #   in Loop: Header=BB24_3 Depth=1
	addq	$1, %rbx
	addq	$32, %rbp
	cmpq	%rcx, %rbx
	jae	.LBB24_7
.LBB24_3:                               # =>This Inner Loop Header: Depth=1
	movq	8(%r13), %rdx
	movzwl	-8(%rdx,%rbp), %esi
	cmpw	%si, %r12w
	jb	.LBB24_6
# %bb.4:                                #   in Loop: Header=BB24_3 Depth=1
	movzwl	-6(%rdx,%rbp), %edi
	addl	%esi, %edi
	cmpl	%r15d, %edi
	jbe	.LBB24_6
# %bb.5:                                #   in Loop: Header=BB24_3 Depth=1
	movq	(%rdx,%rbp), %rdi
	movl	%r15d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbp)
                                        # kill: def $al killed $al def $rax
	movq	16(%r13), %rcx
	jmp	.LBB24_6
.LBB24_1:
	xorl	%eax, %eax
.LBB24_7:
	orb	%r14b, %al
	movb	%al, (%r13)
	movb	6(%r13), %cl
	js	.LBB24_8
# %bb.10:
	andb	$127, %cl
	movb	%cl, 6(%r13)
	testb	%al, %al
	jne	.LBB24_9
# %bb.11:
	orb	$2, %cl
	jmp	.LBB24_12
.LBB24_8:
	orb	$-128, %cl
	movb	%cl, 6(%r13)
.LBB24_9:
	andb	$-3, %cl
.LBB24_12:
	movb	%cl, 6(%r13)
	movl	$5, %eax
	addq	$8, %rsp
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%r12
	.cfi_def_cfa_offset 40
	popq	%r13
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end24:
	.size	ORA_indy, .Lfunc_end24-ORA_indy
	.cfi_endproc
                                        # -- End function
	.globl	ASL_zpg                 # -- Begin function ASL_zpg
	.p2align	4, 0x90
	.type	ASL_zpg,@function
ASL_zpg:                                # @ASL_zpg
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r12
	.cfi_def_cfa_offset 40
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset %rbx, -48
	.cfi_offset %r12, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%rdi, %r15
	movzwl	4(%rdi), %r14d
	movq	16(%rdi), %rcx
	testq	%rcx, %rcx
	je	.LBB25_1
# %bb.3:
	movl	$24, %ebx
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	jmp	.LBB25_4
	.p2align	4, 0x90
.LBB25_7:                               #   in Loop: Header=BB25_4 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rcx, %rbp
	jae	.LBB25_8
.LBB25_4:                               # =>This Inner Loop Header: Depth=1
	movq	8(%r15), %rdx
	movzwl	-8(%rdx,%rbx), %esi
	cmpw	%si, %r14w
	jb	.LBB25_7
# %bb.5:                                #   in Loop: Header=BB25_4 Depth=1
	movzwl	-6(%rdx,%rbx), %edi
	addl	%esi, %edi
	cmpl	%r14d, %edi
	jbe	.LBB25_7
# %bb.6:                                #   in Loop: Header=BB25_4 Depth=1
	movq	(%rdx,%rbx), %rdi
	movl	%r14d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbx)
                                        # kill: def $al killed $al def $rax
	movq	16(%r15), %rcx
	jmp	.LBB25_7
.LBB25_8:
	addw	$1, 4(%r15)
	testq	%rcx, %rcx
	je	.LBB25_2
# %bb.9:
	movzbl	%al, %r12d
	movl	$24, %ebx
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	jmp	.LBB25_10
	.p2align	4, 0x90
.LBB25_13:                              #   in Loop: Header=BB25_10 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rcx, %rbp
	jae	.LBB25_14
.LBB25_10:                              # =>This Inner Loop Header: Depth=1
	movq	8(%r15), %rdx
	movzwl	-8(%rdx,%rbx), %esi
	cmpw	%r12w, %si
	ja	.LBB25_13
# %bb.11:                               #   in Loop: Header=BB25_10 Depth=1
	movzwl	-6(%rdx,%rbx), %edi
	addl	%esi, %edi
	cmpl	%r12d, %edi
	jbe	.LBB25_13
# %bb.12:                               #   in Loop: Header=BB25_10 Depth=1
	movq	(%rdx,%rbx), %rdi
	movzwl	%r12w, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbx)
                                        # kill: def $al killed $al def $rax
	movq	16(%r15), %rcx
	jmp	.LBB25_13
.LBB25_1:
	addl	$1, %r14d
	movw	%r14w, 4(%r15)
.LBB25_2:
	movb	6(%r15), %cl
	addq	$6, %r15
	andb	$127, %cl
	xorl	%eax, %eax
	jmp	.LBB25_21
.LBB25_14:
	movzbl	%al, %r14d
	addl	%r14d, %r14d
	testq	%rcx, %rcx
	je	.LBB25_20
# %bb.15:
	movl	$24, %ebx
	xorl	%ebp, %ebp
	jmp	.LBB25_16
	.p2align	4, 0x90
.LBB25_19:                              #   in Loop: Header=BB25_16 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rcx, %rbp
	jae	.LBB25_20
.LBB25_16:                              # =>This Inner Loop Header: Depth=1
	movq	8(%r15), %rax
	movzwl	-8(%rax,%rbx), %edx
	cmpw	%r12w, %dx
	ja	.LBB25_19
# %bb.17:                               #   in Loop: Header=BB25_16 Depth=1
	movzwl	-6(%rax,%rbx), %esi
	addl	%edx, %esi
	cmpl	%r12d, %esi
	jbe	.LBB25_19
# %bb.18:                               #   in Loop: Header=BB25_16 Depth=1
	movq	(%rax,%rbx), %rdi
	movzwl	%r12w, %ecx
	subl	%edx, %ecx
	movzwl	%cx, %esi
	movzbl	%r14b, %edx
	callq	*-16(%rax,%rbx)
	movq	16(%r15), %rcx
	jmp	.LBB25_19
.LBB25_20:
	movzwl	%r14w, %eax
	movb	6(%r15), %cl
	addq	$6, %r15
	movl	%ecx, %edx
	andb	$127, %dl
	orb	$-128, %cl
	testb	%r14b, %r14b
	movzbl	%cl, %esi
	movzbl	%dl, %ecx
	cmovsl	%esi, %ecx
.LBB25_21:
	movl	%ecx, %edx
	andb	$-3, %dl
	orb	$2, %cl
	testb	%al, %al
	movzbl	%cl, %ecx
	movzbl	%dl, %edx
	cmovel	%ecx, %edx
	movl	%edx, %ecx
	andb	$-2, %cl
	orb	$1, %dl
	testl	$256, %eax              # imm = 0x100
	movzbl	%cl, %eax
	movzbl	%dl, %ecx
	cmovel	%eax, %ecx
	movb	%cl, (%r15)
	movl	$5, %eax
	popq	%rbx
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end25:
	.size	ASL_zpg, .Lfunc_end25-ASL_zpg
	.cfi_endproc
                                        # -- End function
	.globl	ASL_zpgx                # -- Begin function ASL_zpgx
	.p2align	4, 0x90
	.type	ASL_zpgx,@function
ASL_zpgx:                               # @ASL_zpgx
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r13
	.cfi_def_cfa_offset 40
	pushq	%r12
	.cfi_def_cfa_offset 48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	pushq	%rax
	.cfi_def_cfa_offset 64
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%rdi, %r12
	movzwl	4(%rdi), %r15d
	movq	16(%rdi), %rcx
	testq	%rcx, %rcx
	je	.LBB26_1
# %bb.2:
	movzwl	%r15w, %r14d
	movl	$24, %ebx
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	jmp	.LBB26_3
	.p2align	4, 0x90
.LBB26_6:                               #   in Loop: Header=BB26_3 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rcx, %rbp
	jae	.LBB26_7
.LBB26_3:                               # =>This Inner Loop Header: Depth=1
	movq	8(%r12), %rdx
	movzwl	-8(%rdx,%rbx), %esi
	cmpw	%si, %r15w
	jb	.LBB26_6
# %bb.4:                                #   in Loop: Header=BB26_3 Depth=1
	movzwl	-6(%rdx,%rbx), %edi
	addl	%esi, %edi
	cmpl	%r14d, %edi
	jbe	.LBB26_6
# %bb.5:                                #   in Loop: Header=BB26_3 Depth=1
	movq	(%rdx,%rbx), %rdi
	movl	%r15d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbx)
                                        # kill: def $al killed $al def $rax
	movq	16(%r12), %rcx
	jmp	.LBB26_6
.LBB26_7:
	movzwl	4(%r12), %r15d
	jmp	.LBB26_8
.LBB26_1:
	xorl	%ecx, %ecx
	xorl	%eax, %eax
.LBB26_8:
	addb	1(%r12), %al
	addl	$1, %r15d
	movw	%r15w, 4(%r12)
	testq	%rcx, %rcx
	je	.LBB26_9
# %bb.10:
	movzbl	%al, %r13d
	movzwl	%r13w, %r14d
	movl	$24, %ebx
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	jmp	.LBB26_11
	.p2align	4, 0x90
.LBB26_14:                              #   in Loop: Header=BB26_11 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rcx, %rbp
	jae	.LBB26_15
.LBB26_11:                              # =>This Inner Loop Header: Depth=1
	movq	8(%r12), %rdx
	movzwl	-8(%rdx,%rbx), %esi
	cmpw	%r13w, %si
	ja	.LBB26_14
# %bb.12:                               #   in Loop: Header=BB26_11 Depth=1
	movzwl	-6(%rdx,%rbx), %edi
	addl	%esi, %edi
	cmpl	%r14d, %edi
	jbe	.LBB26_14
# %bb.13:                               #   in Loop: Header=BB26_11 Depth=1
	movq	(%rdx,%rbx), %rdi
	movl	%r14d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbx)
                                        # kill: def $al killed $al def $rax
	movq	16(%r12), %rcx
	jmp	.LBB26_14
.LBB26_15:
	movzbl	%al, %r15d
	addl	%r15d, %r15d
	testq	%rcx, %rcx
	je	.LBB26_21
# %bb.16:
	movl	$24, %ebx
	xorl	%ebp, %ebp
	jmp	.LBB26_17
	.p2align	4, 0x90
.LBB26_20:                              #   in Loop: Header=BB26_17 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rcx, %rbp
	jae	.LBB26_21
.LBB26_17:                              # =>This Inner Loop Header: Depth=1
	movq	8(%r12), %rax
	movzwl	-8(%rax,%rbx), %edx
	cmpw	%r13w, %dx
	ja	.LBB26_20
# %bb.18:                               #   in Loop: Header=BB26_17 Depth=1
	movzwl	-6(%rax,%rbx), %esi
	addl	%edx, %esi
	cmpl	%r14d, %esi
	jbe	.LBB26_20
# %bb.19:                               #   in Loop: Header=BB26_17 Depth=1
	movq	(%rax,%rbx), %rdi
	movl	%r14d, %ecx
	subl	%edx, %ecx
	movzwl	%cx, %esi
	movzbl	%r15b, %edx
	callq	*-16(%rax,%rbx)
	movq	16(%r12), %rcx
	jmp	.LBB26_20
.LBB26_21:
	movzwl	%r15w, %eax
	movb	6(%r12), %cl
	addq	$6, %r12
	movl	%ecx, %edx
	andb	$127, %dl
	orb	$-128, %cl
	testb	%r15b, %r15b
	movzbl	%cl, %esi
	movzbl	%dl, %ecx
	cmovsl	%esi, %ecx
	jmp	.LBB26_22
.LBB26_9:
	movb	6(%r12), %cl
	addq	$6, %r12
	andb	$127, %cl
	xorl	%eax, %eax
.LBB26_22:
	movl	%ecx, %edx
	andb	$-3, %dl
	orb	$2, %cl
	testb	%al, %al
	movzbl	%cl, %ecx
	movzbl	%dl, %edx
	cmovel	%ecx, %edx
	movl	%edx, %ecx
	andb	$-2, %cl
	orb	$1, %dl
	testl	$256, %eax              # imm = 0x100
	movzbl	%cl, %eax
	movzbl	%dl, %ecx
	cmovel	%eax, %ecx
	movb	%cl, (%r12)
	movl	$6, %eax
	addq	$8, %rsp
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%r12
	.cfi_def_cfa_offset 40
	popq	%r13
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end26:
	.size	ASL_zpgx, .Lfunc_end26-ASL_zpgx
	.cfi_endproc
                                        # -- End function
	.globl	ASL_abss                # -- Begin function ASL_abss
	.p2align	4, 0x90
	.type	ASL_abss,@function
ASL_abss:                               # @ASL_abss
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r13
	.cfi_def_cfa_offset 40
	pushq	%r12
	.cfi_def_cfa_offset 48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	pushq	%rax
	.cfi_def_cfa_offset 64
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%rdi, %r12
	movzwl	4(%rdi), %r13d
	movq	16(%rdi), %rcx
	testq	%rcx, %rcx
	je	.LBB27_27
# %bb.1:
	movzwl	%r13w, %r14d
	movl	$24, %ebx
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	jmp	.LBB27_2
	.p2align	4, 0x90
.LBB27_5:                               #   in Loop: Header=BB27_2 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rcx, %rbp
	jae	.LBB27_6
.LBB27_2:                               # =>This Inner Loop Header: Depth=1
	movq	8(%r12), %rdx
	movzwl	-8(%rdx,%rbx), %esi
	cmpw	%si, %r13w
	jb	.LBB27_5
# %bb.3:                                #   in Loop: Header=BB27_2 Depth=1
	movzwl	-6(%rdx,%rbx), %edi
	addl	%esi, %edi
	cmpl	%r14d, %edi
	jbe	.LBB27_5
# %bb.4:                                #   in Loop: Header=BB27_2 Depth=1
	movq	(%rdx,%rbx), %rdi
	movl	%r13d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbx)
                                        # kill: def $al killed $al def $rax
	movq	16(%r12), %rcx
	jmp	.LBB27_5
.LBB27_6:
	movl	4(%r12), %r13d
	testq	%rcx, %rcx
	je	.LBB27_27
# %bb.7:
	movzbl	%al, %r14d
	addl	$1, %r13d
	movzwl	%r13w, %r15d
	movl	$24, %ebx
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	jmp	.LBB27_8
	.p2align	4, 0x90
.LBB27_11:                              #   in Loop: Header=BB27_8 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rcx, %rbp
	jae	.LBB27_12
.LBB27_8:                               # =>This Inner Loop Header: Depth=1
	movq	8(%r12), %rdx
	movzwl	-8(%rdx,%rbx), %esi
	cmpw	%si, %r13w
	jb	.LBB27_11
# %bb.9:                                #   in Loop: Header=BB27_8 Depth=1
	movzwl	-6(%rdx,%rbx), %edi
	addl	%esi, %edi
	cmpl	%r15d, %edi
	jbe	.LBB27_11
# %bb.10:                               #   in Loop: Header=BB27_8 Depth=1
	movq	(%rdx,%rbx), %rdi
	movl	%r13d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbx)
                                        # kill: def $al killed $al def $rax
	movq	16(%r12), %rcx
	jmp	.LBB27_11
.LBB27_27:
	addl	$2, %r13d
	movw	%r13w, 4(%r12)
.LBB27_13:
	movb	6(%r12), %cl
	addq	$6, %r12
	andb	$127, %cl
	xorl	%eax, %eax
	jmp	.LBB27_26
.LBB27_12:
	addw	$2, 4(%r12)
	testq	%rcx, %rcx
	je	.LBB27_13
# %bb.14:
	movzbl	%al, %eax
	shll	$8, %eax
	movzwl	%r14w, %r13d
	orl	%eax, %r13d
	movzwl	%r13w, %r14d
	movl	$24, %ebx
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	jmp	.LBB27_15
	.p2align	4, 0x90
.LBB27_18:                              #   in Loop: Header=BB27_15 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rcx, %rbp
	jae	.LBB27_19
.LBB27_15:                              # =>This Inner Loop Header: Depth=1
	movq	8(%r12), %rdx
	movzwl	-8(%rdx,%rbx), %esi
	cmpw	%si, %r13w
	jb	.LBB27_18
# %bb.16:                               #   in Loop: Header=BB27_15 Depth=1
	movzwl	-6(%rdx,%rbx), %edi
	addl	%esi, %edi
	cmpl	%r14d, %edi
	jbe	.LBB27_18
# %bb.17:                               #   in Loop: Header=BB27_15 Depth=1
	movq	(%rdx,%rbx), %rdi
	movl	%r13d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbx)
                                        # kill: def $al killed $al def $rax
	movq	16(%r12), %rcx
	jmp	.LBB27_18
.LBB27_19:
	movzbl	%al, %r15d
	addl	%r15d, %r15d
	testq	%rcx, %rcx
	je	.LBB27_25
# %bb.20:
	movl	$24, %ebx
	xorl	%ebp, %ebp
	jmp	.LBB27_21
	.p2align	4, 0x90
.LBB27_24:                              #   in Loop: Header=BB27_21 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rcx, %rbp
	jae	.LBB27_25
.LBB27_21:                              # =>This Inner Loop Header: Depth=1
	movq	8(%r12), %rax
	movzwl	-8(%rax,%rbx), %edx
	cmpw	%dx, %r13w
	jb	.LBB27_24
# %bb.22:                               #   in Loop: Header=BB27_21 Depth=1
	movzwl	-6(%rax,%rbx), %esi
	addl	%edx, %esi
	cmpl	%r14d, %esi
	jbe	.LBB27_24
# %bb.23:                               #   in Loop: Header=BB27_21 Depth=1
	movq	(%rax,%rbx), %rdi
	movl	%r13d, %ecx
	subl	%edx, %ecx
	movzwl	%cx, %esi
	movzbl	%r15b, %edx
	callq	*-16(%rax,%rbx)
	movq	16(%r12), %rcx
	jmp	.LBB27_24
.LBB27_25:
	movzwl	%r15w, %eax
	movb	6(%r12), %cl
	addq	$6, %r12
	movl	%ecx, %edx
	andb	$127, %dl
	orb	$-128, %cl
	testb	%r15b, %r15b
	movzbl	%cl, %esi
	movzbl	%dl, %ecx
	cmovsl	%esi, %ecx
.LBB27_26:
	movl	%ecx, %edx
	andb	$-3, %dl
	orb	$2, %cl
	testb	%al, %al
	movzbl	%cl, %ecx
	movzbl	%dl, %edx
	cmovel	%ecx, %edx
	movl	%edx, %ecx
	andb	$-2, %cl
	orb	$1, %dl
	testl	$256, %eax              # imm = 0x100
	movzbl	%cl, %eax
	movzbl	%dl, %ecx
	cmovel	%eax, %ecx
	movb	%cl, (%r12)
	movl	$6, %eax
	addq	$8, %rsp
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%r12
	.cfi_def_cfa_offset 40
	popq	%r13
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end27:
	.size	ASL_abss, .Lfunc_end27-ASL_abss
	.cfi_endproc
                                        # -- End function
	.globl	ASL_absx                # -- Begin function ASL_absx
	.p2align	4, 0x90
	.type	ASL_absx,@function
ASL_absx:                               # @ASL_absx
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r13
	.cfi_def_cfa_offset 40
	pushq	%r12
	.cfi_def_cfa_offset 48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	pushq	%rax
	.cfi_def_cfa_offset 64
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%rdi, %r12
	movzwl	4(%rdi), %r13d
	movq	16(%rdi), %rcx
	testq	%rcx, %rcx
	je	.LBB28_13
# %bb.1:
	movzwl	%r13w, %r14d
	movl	$24, %ebx
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	jmp	.LBB28_3
	.p2align	4, 0x90
.LBB28_2:                               #   in Loop: Header=BB28_3 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rcx, %rbp
	jae	.LBB28_6
.LBB28_3:                               # =>This Inner Loop Header: Depth=1
	movq	8(%r12), %rdx
	movzwl	-8(%rdx,%rbx), %esi
	cmpw	%si, %r13w
	jb	.LBB28_2
# %bb.4:                                #   in Loop: Header=BB28_3 Depth=1
	movzwl	-6(%rdx,%rbx), %edi
	addl	%esi, %edi
	cmpl	%r14d, %edi
	jbe	.LBB28_2
# %bb.5:                                #   in Loop: Header=BB28_3 Depth=1
	movq	(%rdx,%rbx), %rdi
	movl	%r13d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbx)
                                        # kill: def $al killed $al def $rax
	movq	16(%r12), %rcx
	jmp	.LBB28_2
.LBB28_6:
	movzbl	%al, %r14d
	movl	4(%r12), %r13d
	testq	%rcx, %rcx
	je	.LBB28_14
# %bb.7:
	addl	$1, %r13d
	movzwl	%r13w, %r15d
	movl	$24, %ebx
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	jmp	.LBB28_9
	.p2align	4, 0x90
.LBB28_8:                               #   in Loop: Header=BB28_9 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rcx, %rbp
	jae	.LBB28_12
.LBB28_9:                               # =>This Inner Loop Header: Depth=1
	movq	8(%r12), %rdx
	movzwl	-8(%rdx,%rbx), %esi
	cmpw	%si, %r13w
	jb	.LBB28_8
# %bb.10:                               #   in Loop: Header=BB28_9 Depth=1
	movzwl	-6(%rdx,%rbx), %edi
	addl	%esi, %edi
	cmpl	%r15d, %edi
	jbe	.LBB28_8
# %bb.11:                               #   in Loop: Header=BB28_9 Depth=1
	movq	(%rdx,%rbx), %rdi
	movl	%r13d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbx)
                                        # kill: def $al killed $al def $rax
	movq	16(%r12), %rcx
	jmp	.LBB28_8
.LBB28_12:
	movzwl	4(%r12), %r13d
	jmp	.LBB28_16
.LBB28_13:
	xorl	%ecx, %ecx
	xorl	%r14d, %r14d
	jmp	.LBB28_15
.LBB28_14:
	xorl	%ecx, %ecx
.LBB28_15:
	xorl	%eax, %eax
.LBB28_16:
	movzbl	1(%r12), %edx
	addl	$2, %r13d
	movw	%r13w, 4(%r12)
	testq	%rcx, %rcx
	je	.LBB28_29
# %bb.17:
	movzbl	%al, %eax
	shll	$8, %eax
	movzwl	%r14w, %r13d
	orl	%eax, %r13d
	addl	%edx, %r13d
	movzwl	%r13w, %r14d
	movl	$24, %ebx
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	jmp	.LBB28_19
	.p2align	4, 0x90
.LBB28_18:                              #   in Loop: Header=BB28_19 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rcx, %rbp
	jae	.LBB28_22
.LBB28_19:                              # =>This Inner Loop Header: Depth=1
	movq	8(%r12), %rdx
	movzwl	-8(%rdx,%rbx), %esi
	cmpw	%si, %r13w
	jb	.LBB28_18
# %bb.20:                               #   in Loop: Header=BB28_19 Depth=1
	movzwl	-6(%rdx,%rbx), %edi
	addl	%esi, %edi
	cmpl	%r14d, %edi
	jbe	.LBB28_18
# %bb.21:                               #   in Loop: Header=BB28_19 Depth=1
	movq	(%rdx,%rbx), %rdi
	movl	%r13d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbx)
                                        # kill: def $al killed $al def $rax
	movq	16(%r12), %rcx
	jmp	.LBB28_18
.LBB28_22:
	movzbl	%al, %r15d
	addl	%r15d, %r15d
	testq	%rcx, %rcx
	je	.LBB28_28
# %bb.23:
	movl	$24, %ebx
	xorl	%ebp, %ebp
	jmp	.LBB28_25
	.p2align	4, 0x90
.LBB28_24:                              #   in Loop: Header=BB28_25 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rcx, %rbp
	jae	.LBB28_28
.LBB28_25:                              # =>This Inner Loop Header: Depth=1
	movq	8(%r12), %rax
	movzwl	-8(%rax,%rbx), %edx
	cmpw	%dx, %r13w
	jb	.LBB28_24
# %bb.26:                               #   in Loop: Header=BB28_25 Depth=1
	movzwl	-6(%rax,%rbx), %esi
	addl	%edx, %esi
	cmpl	%r14d, %esi
	jbe	.LBB28_24
# %bb.27:                               #   in Loop: Header=BB28_25 Depth=1
	movq	(%rax,%rbx), %rdi
	movl	%r13d, %ecx
	subl	%edx, %ecx
	movzwl	%cx, %esi
	movzbl	%r15b, %edx
	callq	*-16(%rax,%rbx)
	movq	16(%r12), %rcx
	jmp	.LBB28_24
.LBB28_28:
	movzwl	%r15w, %eax
	movb	6(%r12), %cl
	addq	$6, %r12
	movl	%ecx, %edx
	andb	$127, %dl
	orb	$-128, %cl
	testb	%r15b, %r15b
	movzbl	%cl, %esi
	movzbl	%dl, %ecx
	cmovsl	%esi, %ecx
	jmp	.LBB28_30
.LBB28_29:
	movb	6(%r12), %cl
	addq	$6, %r12
	andb	$127, %cl
	xorl	%eax, %eax
.LBB28_30:
	movl	%ecx, %edx
	andb	$-3, %dl
	orb	$2, %cl
	testb	%al, %al
	movzbl	%cl, %ecx
	movzbl	%dl, %edx
	cmovel	%ecx, %edx
	movl	%edx, %ecx
	andb	$-2, %cl
	orb	$1, %dl
	testl	$256, %eax              # imm = 0x100
	movzbl	%cl, %eax
	movzbl	%dl, %ecx
	cmovel	%eax, %ecx
	movb	%cl, (%r12)
	movl	$7, %eax
	addq	$8, %rsp
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%r12
	.cfi_def_cfa_offset 40
	popq	%r13
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end28:
	.size	ASL_absx, .Lfunc_end28-ASL_absx
	.cfi_endproc
                                        # -- End function
	.globl	ASLA                    # -- Begin function ASLA
	.p2align	4, 0x90
	.type	ASLA,@function
ASLA:                                   # @ASLA
	.cfi_startproc
# %bb.0:
	movzbl	(%rdi), %eax
	addl	%eax, %eax
	movb	6(%rdi), %cl
	movl	%ecx, %edx
	andb	$127, %dl
	orb	$-128, %cl
	movzbl	%cl, %ecx
	movzbl	%dl, %edx
	testb	%al, %al
	cmovsl	%ecx, %edx
	movl	%edx, %ecx
	andb	$-3, %cl
	orb	$2, %dl
	testb	%al, %al
	movb	%al, (%rdi)
	movzbl	%dl, %edx
	movzbl	%cl, %ecx
	cmovel	%edx, %ecx
	movl	%ecx, %edx
	andb	$-2, %dl
	orb	$1, %cl
	testl	$256, %eax              # imm = 0x100
	movzbl	%dl, %eax
	movzbl	%cl, %ecx
	cmovel	%eax, %ecx
	movb	%cl, 6(%rdi)
	movl	$2, %eax
	retq
.Lfunc_end29:
	.size	ASLA, .Lfunc_end29-ASLA
	.cfi_endproc
                                        # -- End function
	.globl	SLO_zpg                 # -- Begin function SLO_zpg
	.p2align	4, 0x90
	.type	SLO_zpg,@function
SLO_zpg:                                # @SLO_zpg
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r13
	.cfi_def_cfa_offset 40
	pushq	%r12
	.cfi_def_cfa_offset 48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	pushq	%rax
	.cfi_def_cfa_offset 64
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%rdi, %r13
	movzwl	4(%rdi), %r15d
	movq	16(%rdi), %rcx
	testq	%rcx, %rcx
	je	.LBB30_1
# %bb.3:
	movl	$24, %ebx
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	jmp	.LBB30_4
	.p2align	4, 0x90
.LBB30_7:                               #   in Loop: Header=BB30_4 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rcx, %rbp
	jae	.LBB30_8
.LBB30_4:                               # =>This Inner Loop Header: Depth=1
	movq	8(%r13), %rdx
	movzwl	-8(%rdx,%rbx), %esi
	cmpw	%si, %r15w
	jb	.LBB30_7
# %bb.5:                                #   in Loop: Header=BB30_4 Depth=1
	movzwl	-6(%rdx,%rbx), %edi
	addl	%esi, %edi
	cmpl	%r15d, %edi
	jbe	.LBB30_7
# %bb.6:                                #   in Loop: Header=BB30_4 Depth=1
	movq	(%rdx,%rbx), %rdi
	movl	%r15d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbx)
                                        # kill: def $al killed $al def $rax
	movq	16(%r13), %rcx
	jmp	.LBB30_7
.LBB30_8:
	movl	4(%r13), %r15d
	addl	$1, %r15d
	movw	%r15w, 4(%r13)
	testq	%rcx, %rcx
	je	.LBB30_2
# %bb.9:
	movzbl	%al, %r14d
	movl	$24, %ebx
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	jmp	.LBB30_10
	.p2align	4, 0x90
.LBB30_13:                              #   in Loop: Header=BB30_10 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rcx, %rbp
	jae	.LBB30_14
.LBB30_10:                              # =>This Inner Loop Header: Depth=1
	movq	8(%r13), %rdx
	movzwl	-8(%rdx,%rbx), %esi
	cmpw	%r14w, %si
	ja	.LBB30_13
# %bb.11:                               #   in Loop: Header=BB30_10 Depth=1
	movzwl	-6(%rdx,%rbx), %edi
	addl	%esi, %edi
	cmpl	%r14d, %edi
	jbe	.LBB30_13
# %bb.12:                               #   in Loop: Header=BB30_10 Depth=1
	movq	(%rdx,%rbx), %rdi
	movzwl	%r14w, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbx)
                                        # kill: def $al killed $al def $rax
	movq	16(%r13), %rcx
	jmp	.LBB30_13
.LBB30_14:
	movzbl	%al, %r15d
	addl	%r15d, %r15d
	testq	%rcx, %rcx
	je	.LBB30_15
# %bb.16:
	movl	$24, %ebx
	xorl	%ebp, %ebp
	jmp	.LBB30_17
	.p2align	4, 0x90
.LBB30_20:                              #   in Loop: Header=BB30_17 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rcx, %rbp
	jae	.LBB30_21
.LBB30_17:                              # =>This Inner Loop Header: Depth=1
	movq	8(%r13), %rax
	movzwl	-8(%rax,%rbx), %edx
	cmpw	%r14w, %dx
	ja	.LBB30_20
# %bb.18:                               #   in Loop: Header=BB30_17 Depth=1
	movzwl	-6(%rax,%rbx), %esi
	addl	%edx, %esi
	cmpl	%r14d, %esi
	jbe	.LBB30_20
# %bb.19:                               #   in Loop: Header=BB30_17 Depth=1
	movq	(%rax,%rbx), %rdi
	movzwl	%r14w, %ecx
	subl	%edx, %ecx
	movzwl	%cx, %esi
	movzbl	%r15b, %edx
	callq	*-16(%rax,%rbx)
	movq	16(%r13), %rcx
	jmp	.LBB30_20
.LBB30_1:
	addl	$1, %r15d
	movw	%r15w, 4(%r13)
.LBB30_2:
	leaq	6(%r13), %rax
	movq	%rax, (%rsp)            # 8-byte Spill
	movb	6(%r13), %dl
	andb	$127, %dl
	xorl	%ecx, %ecx
	xorl	%eax, %eax
	jmp	.LBB30_22
.LBB30_15:
	xorl	%ecx, %ecx
.LBB30_21:
	movzwl	%r15w, %eax
	leaq	6(%r13), %rdx
	movq	%rdx, (%rsp)            # 8-byte Spill
	movb	6(%r13), %dl
	movl	%edx, %ebx
	andb	$127, %bl
	orb	$-128, %dl
	testb	%r15b, %r15b
	movzbl	%dl, %esi
	movzbl	%bl, %edx
	cmovsl	%esi, %edx
	movzwl	4(%r13), %r15d
.LBB30_22:
	movl	%edx, %ebx
	andb	$-3, %bl
	orb	$2, %dl
	testb	%al, %al
	movzbl	%dl, %edx
	movzbl	%bl, %esi
	cmovel	%edx, %esi
	movl	%esi, %edx
	andb	$-2, %dl
	orb	$1, %sil
	testl	$256, %eax              # imm = 0x100
	movzbl	%dl, %eax
	movzbl	%sil, %edx
	cmovel	%eax, %edx
	movb	%dl, 6(%r13)
	movb	(%r13), %r14b
	testq	%rcx, %rcx
	je	.LBB30_23
# %bb.24:
	movzwl	%r15w, %r12d
	movl	$24, %ebx
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	jmp	.LBB30_25
	.p2align	4, 0x90
.LBB30_28:                              #   in Loop: Header=BB30_25 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rcx, %rbp
	jae	.LBB30_29
.LBB30_25:                              # =>This Inner Loop Header: Depth=1
	movq	8(%r13), %rdx
	movzwl	-8(%rdx,%rbx), %esi
	cmpw	%si, %r15w
	jb	.LBB30_28
# %bb.26:                               #   in Loop: Header=BB30_25 Depth=1
	movzwl	-6(%rdx,%rbx), %edi
	addl	%esi, %edi
	cmpl	%r12d, %edi
	jbe	.LBB30_28
# %bb.27:                               #   in Loop: Header=BB30_25 Depth=1
	movq	(%rdx,%rbx), %rdi
	movl	%r15d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbx)
                                        # kill: def $al killed $al def $rax
	movq	16(%r13), %rcx
	jmp	.LBB30_28
.LBB30_29:
	addw	$1, 4(%r13)
	testq	%rcx, %rcx
	je	.LBB30_30
# %bb.31:
	movzbl	%al, %r12d
	movl	$24, %ebx
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	movq	(%rsp), %r15            # 8-byte Reload
	jmp	.LBB30_32
	.p2align	4, 0x90
.LBB30_35:                              #   in Loop: Header=BB30_32 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rcx, %rbp
	jae	.LBB30_36
.LBB30_32:                              # =>This Inner Loop Header: Depth=1
	movq	8(%r13), %rdx
	movzwl	-8(%rdx,%rbx), %esi
	cmpw	%r12w, %si
	ja	.LBB30_35
# %bb.33:                               #   in Loop: Header=BB30_32 Depth=1
	movzwl	-6(%rdx,%rbx), %edi
	addl	%esi, %edi
	cmpl	%r12d, %edi
	jbe	.LBB30_35
# %bb.34:                               #   in Loop: Header=BB30_32 Depth=1
	movq	(%rdx,%rbx), %rdi
	movzwl	%r12w, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbx)
                                        # kill: def $al killed $al def $rax
	movq	16(%r13), %rcx
	jmp	.LBB30_35
.LBB30_23:
	addl	$1, %r15d
	movw	%r15w, 4(%r13)
.LBB30_30:
	xorl	%eax, %eax
	movq	(%rsp), %r15            # 8-byte Reload
.LBB30_36:
	orb	%r14b, %al
	movb	%al, (%r13)
	movb	6(%r13), %cl
	js	.LBB30_37
# %bb.39:
	andb	$127, %cl
	movb	%cl, (%r15)
	testb	%al, %al
	jne	.LBB30_38
# %bb.40:
	orb	$2, %cl
	jmp	.LBB30_41
.LBB30_37:
	orb	$-128, %cl
	movb	%cl, (%r15)
.LBB30_38:
	andb	$-3, %cl
.LBB30_41:
	movb	%cl, (%r15)
	movl	$5, %eax
	addq	$8, %rsp
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%r12
	.cfi_def_cfa_offset 40
	popq	%r13
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end30:
	.size	SLO_zpg, .Lfunc_end30-SLO_zpg
	.cfi_endproc
                                        # -- End function
	.globl	SLO_zpgx                # -- Begin function SLO_zpgx
	.p2align	4, 0x90
	.type	SLO_zpgx,@function
SLO_zpgx:                               # @SLO_zpgx
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r13
	.cfi_def_cfa_offset 40
	pushq	%r12
	.cfi_def_cfa_offset 48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	subq	$24, %rsp
	.cfi_def_cfa_offset 80
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%rdi, %r15
	movzwl	4(%rdi), %r13d
	movq	16(%rdi), %rcx
	testq	%rcx, %rcx
	je	.LBB31_1
# %bb.2:
	movzwl	%r13w, %r14d
	movl	$24, %ebp
	xorl	%eax, %eax
	xorl	%ebx, %ebx
	jmp	.LBB31_3
	.p2align	4, 0x90
.LBB31_6:                               #   in Loop: Header=BB31_3 Depth=1
	addq	$1, %rbx
	addq	$32, %rbp
	cmpq	%rcx, %rbx
	jae	.LBB31_7
.LBB31_3:                               # =>This Inner Loop Header: Depth=1
	movq	8(%r15), %rdx
	movzwl	-8(%rdx,%rbp), %esi
	cmpw	%si, %r13w
	jb	.LBB31_6
# %bb.4:                                #   in Loop: Header=BB31_3 Depth=1
	movzwl	-6(%rdx,%rbp), %edi
	addl	%esi, %edi
	cmpl	%r14d, %edi
	jbe	.LBB31_6
# %bb.5:                                #   in Loop: Header=BB31_3 Depth=1
	movq	(%rdx,%rbp), %rdi
	movl	%r13d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbp)
                                        # kill: def $al killed $al def $rax
	movq	16(%r15), %rcx
	jmp	.LBB31_6
.LBB31_7:
	movzwl	4(%r15), %r13d
	jmp	.LBB31_8
.LBB31_1:
	xorl	%ecx, %ecx
	xorl	%eax, %eax
.LBB31_8:
	addb	1(%r15), %al
	addl	$1, %r13d
	movw	%r13w, 4(%r15)
	testq	%rcx, %rcx
	je	.LBB31_9
# %bb.10:
	movzbl	%al, %r12d
	movzwl	%r12w, %r14d
	movl	$24, %ebp
	xorl	%eax, %eax
	xorl	%ebx, %ebx
	jmp	.LBB31_11
	.p2align	4, 0x90
.LBB31_14:                              #   in Loop: Header=BB31_11 Depth=1
	addq	$1, %rbx
	addq	$32, %rbp
	cmpq	%rcx, %rbx
	jae	.LBB31_15
.LBB31_11:                              # =>This Inner Loop Header: Depth=1
	movq	8(%r15), %rdx
	movzwl	-8(%rdx,%rbp), %esi
	cmpw	%r12w, %si
	ja	.LBB31_14
# %bb.12:                               #   in Loop: Header=BB31_11 Depth=1
	movzwl	-6(%rdx,%rbp), %edi
	addl	%esi, %edi
	cmpl	%r14d, %edi
	jbe	.LBB31_14
# %bb.13:                               #   in Loop: Header=BB31_11 Depth=1
	movq	(%rdx,%rbp), %rdi
	movl	%r14d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbp)
                                        # kill: def $al killed $al def $rax
	movq	16(%r15), %rcx
	jmp	.LBB31_14
.LBB31_15:
	movzbl	%al, %r13d
	addl	%r13d, %r13d
	testq	%rcx, %rcx
	je	.LBB31_16
# %bb.17:
	movl	$24, %ebp
	xorl	%ebx, %ebx
	jmp	.LBB31_18
	.p2align	4, 0x90
.LBB31_21:                              #   in Loop: Header=BB31_18 Depth=1
	addq	$1, %rbx
	addq	$32, %rbp
	cmpq	%rcx, %rbx
	jae	.LBB31_22
.LBB31_18:                              # =>This Inner Loop Header: Depth=1
	movq	8(%r15), %rax
	movzwl	-8(%rax,%rbp), %edx
	cmpw	%r12w, %dx
	ja	.LBB31_21
# %bb.19:                               #   in Loop: Header=BB31_18 Depth=1
	movzwl	-6(%rax,%rbp), %esi
	addl	%edx, %esi
	cmpl	%r14d, %esi
	jbe	.LBB31_21
# %bb.20:                               #   in Loop: Header=BB31_18 Depth=1
	movq	(%rax,%rbp), %rdi
	movl	%r14d, %ecx
	subl	%edx, %ecx
	movzwl	%cx, %esi
	movzbl	%r13b, %edx
	callq	*-16(%rax,%rbp)
	movq	16(%r15), %rcx
	jmp	.LBB31_21
.LBB31_9:
	leaq	6(%r15), %rax
	movq	%rax, 16(%rsp)          # 8-byte Spill
	movb	6(%r15), %dl
	andb	$127, %dl
	xorl	%ecx, %ecx
	xorl	%eax, %eax
	jmp	.LBB31_23
.LBB31_16:
	xorl	%ecx, %ecx
.LBB31_22:
	movzwl	%r13w, %eax
	leaq	6(%r15), %rdx
	movq	%rdx, 16(%rsp)          # 8-byte Spill
	movb	6(%r15), %dl
	movl	%edx, %ebx
	andb	$127, %bl
	orb	$-128, %dl
	testb	%r13b, %r13b
	movzbl	%dl, %esi
	movzbl	%bl, %edx
	cmovsl	%esi, %edx
	movzwl	4(%r15), %r13d
.LBB31_23:
	movl	%edx, %ebx
	andb	$-3, %bl
	orb	$2, %dl
	testb	%al, %al
	movzbl	%dl, %edx
	movzbl	%bl, %esi
	cmovel	%edx, %esi
	movl	%esi, %edx
	andb	$-2, %dl
	orb	$1, %sil
	testl	$256, %eax              # imm = 0x100
	movzbl	%dl, %eax
	movzbl	%sil, %edx
	cmovel	%eax, %edx
	movb	%dl, 6(%r15)
	movb	(%r15), %bl
	testq	%rcx, %rcx
	je	.LBB31_24
# %bb.25:
	movb	%bl, 15(%rsp)           # 1-byte Spill
	movzwl	%r13w, %r12d
	movl	$24, %ebp
	xorl	%eax, %eax
	xorl	%ebx, %ebx
	jmp	.LBB31_26
	.p2align	4, 0x90
.LBB31_29:                              #   in Loop: Header=BB31_26 Depth=1
	addq	$1, %rbx
	addq	$32, %rbp
	cmpq	%rcx, %rbx
	jae	.LBB31_30
.LBB31_26:                              # =>This Inner Loop Header: Depth=1
	movq	8(%r15), %rdx
	movzwl	-8(%rdx,%rbp), %esi
	cmpw	%si, %r13w
	jb	.LBB31_29
# %bb.27:                               #   in Loop: Header=BB31_26 Depth=1
	movzwl	-6(%rdx,%rbp), %edi
	addl	%esi, %edi
	cmpl	%r12d, %edi
	jbe	.LBB31_29
# %bb.28:                               #   in Loop: Header=BB31_26 Depth=1
	movq	(%rdx,%rbp), %rdi
	movl	%r13d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbp)
                                        # kill: def $al killed $al def $rax
	movq	16(%r15), %rcx
	jmp	.LBB31_29
.LBB31_30:
	addb	1(%r15), %al
	addw	$1, 4(%r15)
	testq	%rcx, %rcx
	je	.LBB31_31
# %bb.32:
	movzbl	%al, %r13d
	movzwl	%r13w, %r12d
	movl	$24, %ebp
	xorl	%eax, %eax
	xorl	%r14d, %r14d
	movb	15(%rsp), %bl           # 1-byte Reload
	jmp	.LBB31_33
	.p2align	4, 0x90
.LBB31_36:                              #   in Loop: Header=BB31_33 Depth=1
	addq	$1, %r14
	addq	$32, %rbp
	cmpq	%rcx, %r14
	jae	.LBB31_37
.LBB31_33:                              # =>This Inner Loop Header: Depth=1
	movq	8(%r15), %rdx
	movzwl	-8(%rdx,%rbp), %esi
	cmpw	%r13w, %si
	ja	.LBB31_36
# %bb.34:                               #   in Loop: Header=BB31_33 Depth=1
	movzwl	-6(%rdx,%rbp), %edi
	addl	%esi, %edi
	cmpl	%r12d, %edi
	jbe	.LBB31_36
# %bb.35:                               #   in Loop: Header=BB31_33 Depth=1
	movq	(%rdx,%rbp), %rdi
	movl	%r12d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbp)
                                        # kill: def $al killed $al def $rax
	movq	16(%r15), %rcx
	jmp	.LBB31_36
.LBB31_24:
	addl	$1, %r13d
	movw	%r13w, 4(%r15)
	xorl	%eax, %eax
.LBB31_37:
	orb	%bl, %al
	movb	%al, (%r15)
	movb	6(%r15), %cl
	js	.LBB31_38
.LBB31_40:
	andb	$127, %cl
	movq	16(%rsp), %rdx          # 8-byte Reload
	movb	%cl, (%rdx)
	testb	%al, %al
	jne	.LBB31_39
# %bb.41:
	orb	$2, %cl
	jmp	.LBB31_42
.LBB31_31:
	xorl	%eax, %eax
	movb	15(%rsp), %bl           # 1-byte Reload
	orb	%bl, %al
	movb	%al, (%r15)
	movb	6(%r15), %cl
	jns	.LBB31_40
.LBB31_38:
	orb	$-128, %cl
	movq	16(%rsp), %rdx          # 8-byte Reload
	movb	%cl, (%rdx)
.LBB31_39:
	andb	$-3, %cl
.LBB31_42:
	movb	%cl, (%rdx)
	movl	$6, %eax
	addq	$24, %rsp
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%r12
	.cfi_def_cfa_offset 40
	popq	%r13
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end31:
	.size	SLO_zpgx, .Lfunc_end31-SLO_zpgx
	.cfi_endproc
                                        # -- End function
	.globl	SLO_abss                # -- Begin function SLO_abss
	.p2align	4, 0x90
	.type	SLO_abss,@function
SLO_abss:                               # @SLO_abss
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r13
	.cfi_def_cfa_offset 40
	pushq	%r12
	.cfi_def_cfa_offset 48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	pushq	%rax
	.cfi_def_cfa_offset 64
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%rdi, %r15
	movzwl	4(%rdi), %r13d
	movq	16(%rdi), %rcx
	testq	%rcx, %rcx
	je	.LBB32_12
# %bb.1:
	movzwl	%r13w, %r14d
	movl	$24, %ebx
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	jmp	.LBB32_3
	.p2align	4, 0x90
.LBB32_2:                               #   in Loop: Header=BB32_3 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rcx, %rbp
	jae	.LBB32_6
.LBB32_3:                               # =>This Inner Loop Header: Depth=1
	movq	8(%r15), %rdx
	movzwl	-8(%rdx,%rbx), %esi
	cmpw	%si, %r13w
	jb	.LBB32_2
# %bb.4:                                #   in Loop: Header=BB32_3 Depth=1
	movzwl	-6(%rdx,%rbx), %edi
	addl	%esi, %edi
	cmpl	%r14d, %edi
	jbe	.LBB32_2
# %bb.5:                                #   in Loop: Header=BB32_3 Depth=1
	movq	(%rdx,%rbx), %rdi
	movl	%r13d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbx)
                                        # kill: def $al killed $al def $rax
	movq	16(%r15), %rcx
	jmp	.LBB32_2
.LBB32_6:
	movl	4(%r15), %r13d
	testq	%rcx, %rcx
	je	.LBB32_12
# %bb.7:
	movzbl	%al, %r14d
	addl	$1, %r13d
	movzwl	%r13w, %r12d
	movl	$24, %ebx
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	jmp	.LBB32_9
	.p2align	4, 0x90
.LBB32_8:                               #   in Loop: Header=BB32_9 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rcx, %rbp
	jae	.LBB32_14
.LBB32_9:                               # =>This Inner Loop Header: Depth=1
	movq	8(%r15), %rdx
	movzwl	-8(%rdx,%rbx), %esi
	cmpw	%si, %r13w
	jb	.LBB32_8
# %bb.10:                               #   in Loop: Header=BB32_9 Depth=1
	movzwl	-6(%rdx,%rbx), %edi
	addl	%esi, %edi
	cmpl	%r12d, %edi
	jbe	.LBB32_8
# %bb.11:                               #   in Loop: Header=BB32_9 Depth=1
	movq	(%rdx,%rbx), %rdi
	movl	%r13d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbx)
                                        # kill: def $al killed $al def $rax
	movq	16(%r15), %rcx
	jmp	.LBB32_8
.LBB32_12:
	addl	$2, %r13d
	movw	%r13w, 4(%r15)
.LBB32_13:
	leaq	6(%r15), %r14
	movb	6(%r15), %dl
	andb	$127, %dl
	xorl	%ecx, %ecx
	xorl	%eax, %eax
	jmp	.LBB32_28
.LBB32_14:
	movl	4(%r15), %r13d
	addl	$2, %r13d
	movw	%r13w, 4(%r15)
	testq	%rcx, %rcx
	je	.LBB32_13
# %bb.15:
	movzbl	%al, %eax
	shll	$8, %eax
	movzwl	%r14w, %r13d
	orl	%eax, %r13d
	movzwl	%r13w, %r14d
	movl	$24, %ebx
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	jmp	.LBB32_17
	.p2align	4, 0x90
.LBB32_16:                              #   in Loop: Header=BB32_17 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rcx, %rbp
	jae	.LBB32_20
.LBB32_17:                              # =>This Inner Loop Header: Depth=1
	movq	8(%r15), %rdx
	movzwl	-8(%rdx,%rbx), %esi
	cmpw	%si, %r13w
	jb	.LBB32_16
# %bb.18:                               #   in Loop: Header=BB32_17 Depth=1
	movzwl	-6(%rdx,%rbx), %edi
	addl	%esi, %edi
	cmpl	%r14d, %edi
	jbe	.LBB32_16
# %bb.19:                               #   in Loop: Header=BB32_17 Depth=1
	movq	(%rdx,%rbx), %rdi
	movl	%r13d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbx)
                                        # kill: def $al killed $al def $rax
	movq	16(%r15), %rcx
	jmp	.LBB32_16
.LBB32_20:
	movzbl	%al, %r12d
	addl	%r12d, %r12d
	testq	%rcx, %rcx
	je	.LBB32_26
# %bb.21:
	movl	$24, %ebx
	xorl	%ebp, %ebp
	jmp	.LBB32_23
	.p2align	4, 0x90
.LBB32_22:                              #   in Loop: Header=BB32_23 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rcx, %rbp
	jae	.LBB32_27
.LBB32_23:                              # =>This Inner Loop Header: Depth=1
	movq	8(%r15), %rax
	movzwl	-8(%rax,%rbx), %edx
	cmpw	%dx, %r13w
	jb	.LBB32_22
# %bb.24:                               #   in Loop: Header=BB32_23 Depth=1
	movzwl	-6(%rax,%rbx), %esi
	addl	%edx, %esi
	cmpl	%r14d, %esi
	jbe	.LBB32_22
# %bb.25:                               #   in Loop: Header=BB32_23 Depth=1
	movq	(%rax,%rbx), %rdi
	movl	%r13d, %ecx
	subl	%edx, %ecx
	movzwl	%cx, %esi
	movzbl	%r12b, %edx
	callq	*-16(%rax,%rbx)
	movq	16(%r15), %rcx
	jmp	.LBB32_22
.LBB32_26:
	xorl	%ecx, %ecx
.LBB32_27:
	movzwl	%r12w, %eax
	leaq	6(%r15), %r14
	movb	6(%r15), %dl
	movl	%edx, %ebx
	andb	$127, %bl
	orb	$-128, %dl
	testb	%r12b, %r12b
	movzbl	%dl, %esi
	movzbl	%bl, %edx
	cmovsl	%esi, %edx
	movzwl	4(%r15), %r13d
.LBB32_28:
	movl	%edx, %ebx
	andb	$-3, %bl
	orb	$2, %dl
	testb	%al, %al
	movzbl	%dl, %edx
	movzbl	%bl, %esi
	cmovel	%edx, %esi
	movl	%esi, %edx
	andb	$-2, %dl
	orb	$1, %sil
	testl	$256, %eax              # imm = 0x100
	movzbl	%dl, %eax
	movzbl	%sil, %edx
	cmovel	%eax, %edx
	movb	%dl, 6(%r15)
	movb	(%r15), %al
	testq	%rcx, %rcx
	movb	%al, 3(%rsp)            # 1-byte Spill
	je	.LBB32_40
# %bb.29:
	movzwl	%r13w, %r12d
	movl	$24, %ebx
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	jmp	.LBB32_31
	.p2align	4, 0x90
.LBB32_30:                              #   in Loop: Header=BB32_31 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rcx, %rbp
	jae	.LBB32_34
.LBB32_31:                              # =>This Inner Loop Header: Depth=1
	movq	8(%r15), %rdx
	movzwl	-8(%rdx,%rbx), %esi
	cmpw	%si, %r13w
	jb	.LBB32_30
# %bb.32:                               #   in Loop: Header=BB32_31 Depth=1
	movzwl	-6(%rdx,%rbx), %edi
	addl	%esi, %edi
	cmpl	%r12d, %edi
	jbe	.LBB32_30
# %bb.33:                               #   in Loop: Header=BB32_31 Depth=1
	movq	(%rdx,%rbx), %rdi
	movl	%r13d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbx)
                                        # kill: def $al killed $al def $rax
	movq	16(%r15), %rcx
	jmp	.LBB32_30
.LBB32_34:
	movl	4(%r15), %r13d
	testq	%rcx, %rcx
	je	.LBB32_40
# %bb.35:
	movzbl	%al, %eax
	movl	%eax, 4(%rsp)           # 4-byte Spill
	addl	$1, %r13d
	movzwl	%r13w, %ebp
	movl	$24, %ebx
	xorl	%eax, %eax
	xorl	%r12d, %r12d
	jmp	.LBB32_37
	.p2align	4, 0x90
.LBB32_36:                              #   in Loop: Header=BB32_37 Depth=1
	addq	$1, %r12
	addq	$32, %rbx
	cmpq	%rcx, %r12
	jae	.LBB32_45
.LBB32_37:                              # =>This Inner Loop Header: Depth=1
	movq	8(%r15), %rdx
	movzwl	-8(%rdx,%rbx), %esi
	cmpw	%si, %r13w
	jb	.LBB32_36
# %bb.38:                               #   in Loop: Header=BB32_37 Depth=1
	movzwl	-6(%rdx,%rbx), %edi
	addl	%esi, %edi
	cmpl	%ebp, %edi
	jbe	.LBB32_36
# %bb.39:                               #   in Loop: Header=BB32_37 Depth=1
	movq	(%rdx,%rbx), %rdi
	movl	%r13d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbx)
                                        # kill: def $al killed $al def $rax
	movq	16(%r15), %rcx
	jmp	.LBB32_36
.LBB32_40:
	addl	$2, %r13d
	movw	%r13w, 4(%r15)
.LBB32_41:
	xorl	%eax, %eax
.LBB32_42:
	orb	3(%rsp), %al            # 1-byte Folded Reload
	movb	%al, (%r15)
	movb	6(%r15), %cl
	js	.LBB32_51
# %bb.43:
	andb	$127, %cl
	movb	%cl, (%r14)
	testb	%al, %al
	jne	.LBB32_52
# %bb.44:
	orb	$2, %cl
	jmp	.LBB32_53
.LBB32_45:
	addw	$2, 4(%r15)
	testq	%rcx, %rcx
	je	.LBB32_41
# %bb.46:
	movzbl	%al, %eax
	shll	$8, %eax
	movzwl	4(%rsp), %r13d          # 2-byte Folded Reload
	orl	%eax, %r13d
	movzwl	%r13w, %r12d
	movl	$24, %ebp
	xorl	%eax, %eax
	xorl	%ebx, %ebx
	jmp	.LBB32_48
	.p2align	4, 0x90
.LBB32_47:                              #   in Loop: Header=BB32_48 Depth=1
	addq	$1, %rbx
	addq	$32, %rbp
	cmpq	%rcx, %rbx
	jae	.LBB32_42
.LBB32_48:                              # =>This Inner Loop Header: Depth=1
	movq	8(%r15), %rdx
	movzwl	-8(%rdx,%rbp), %esi
	cmpw	%si, %r13w
	jb	.LBB32_47
# %bb.49:                               #   in Loop: Header=BB32_48 Depth=1
	movzwl	-6(%rdx,%rbp), %edi
	addl	%esi, %edi
	cmpl	%r12d, %edi
	jbe	.LBB32_47
# %bb.50:                               #   in Loop: Header=BB32_48 Depth=1
	movq	(%rdx,%rbp), %rdi
	movl	%r13d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbp)
                                        # kill: def $al killed $al def $rax
	movq	16(%r15), %rcx
	jmp	.LBB32_47
.LBB32_51:
	orb	$-128, %cl
	movb	%cl, (%r14)
.LBB32_52:
	andb	$-3, %cl
.LBB32_53:
	movb	%cl, (%r14)
	movl	$6, %eax
	addq	$8, %rsp
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%r12
	.cfi_def_cfa_offset 40
	popq	%r13
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end32:
	.size	SLO_abss, .Lfunc_end32-SLO_abss
	.cfi_endproc
                                        # -- End function
	.globl	SLO_absx                # -- Begin function SLO_absx
	.p2align	4, 0x90
	.type	SLO_absx,@function
SLO_absx:                               # @SLO_absx
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r13
	.cfi_def_cfa_offset 40
	pushq	%r12
	.cfi_def_cfa_offset 48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	subq	$24, %rsp
	.cfi_def_cfa_offset 80
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%rdi, %r15
	movzwl	4(%rdi), %r13d
	movq	16(%rdi), %rcx
	testq	%rcx, %rcx
	je	.LBB33_13
# %bb.1:
	movzwl	%r13w, %r14d
	movl	$24, %ebx
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	jmp	.LBB33_3
	.p2align	4, 0x90
.LBB33_2:                               #   in Loop: Header=BB33_3 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rcx, %rbp
	jae	.LBB33_6
.LBB33_3:                               # =>This Inner Loop Header: Depth=1
	movq	8(%r15), %rdx
	movzwl	-8(%rdx,%rbx), %esi
	cmpw	%si, %r13w
	jb	.LBB33_2
# %bb.4:                                #   in Loop: Header=BB33_3 Depth=1
	movzwl	-6(%rdx,%rbx), %edi
	addl	%esi, %edi
	cmpl	%r14d, %edi
	jbe	.LBB33_2
# %bb.5:                                #   in Loop: Header=BB33_3 Depth=1
	movq	(%rdx,%rbx), %rdi
	movl	%r13d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbx)
                                        # kill: def $al killed $al def $rax
	movq	16(%r15), %rcx
	jmp	.LBB33_2
.LBB33_6:
	movzbl	%al, %r14d
	movl	4(%r15), %r13d
	testq	%rcx, %rcx
	je	.LBB33_14
# %bb.7:
	addl	$1, %r13d
	movzwl	%r13w, %r12d
	movl	$24, %ebx
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	jmp	.LBB33_9
	.p2align	4, 0x90
.LBB33_8:                               #   in Loop: Header=BB33_9 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rcx, %rbp
	jae	.LBB33_12
.LBB33_9:                               # =>This Inner Loop Header: Depth=1
	movq	8(%r15), %rdx
	movzwl	-8(%rdx,%rbx), %esi
	cmpw	%si, %r13w
	jb	.LBB33_8
# %bb.10:                               #   in Loop: Header=BB33_9 Depth=1
	movzwl	-6(%rdx,%rbx), %edi
	addl	%esi, %edi
	cmpl	%r12d, %edi
	jbe	.LBB33_8
# %bb.11:                               #   in Loop: Header=BB33_9 Depth=1
	movq	(%rdx,%rbx), %rdi
	movl	%r13d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbx)
                                        # kill: def $al killed $al def $rax
	movq	16(%r15), %rcx
	jmp	.LBB33_8
.LBB33_12:
	movzwl	4(%r15), %r13d
	jmp	.LBB33_16
.LBB33_13:
	xorl	%ecx, %ecx
	xorl	%r14d, %r14d
	jmp	.LBB33_15
.LBB33_14:
	xorl	%ecx, %ecx
.LBB33_15:
	xorl	%eax, %eax
.LBB33_16:
	movzbl	1(%r15), %edx
	addl	$2, %r13d
	movw	%r13w, 4(%r15)
	testq	%rcx, %rcx
	je	.LBB33_28
# %bb.17:
	movzbl	%al, %eax
	shll	$8, %eax
	movzwl	%r14w, %r13d
	orl	%eax, %r13d
	addl	%edx, %r13d
	movzwl	%r13w, %r14d
	movl	$24, %ebx
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	jmp	.LBB33_19
	.p2align	4, 0x90
.LBB33_18:                              #   in Loop: Header=BB33_19 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rcx, %rbp
	jae	.LBB33_22
.LBB33_19:                              # =>This Inner Loop Header: Depth=1
	movq	8(%r15), %rdx
	movzwl	-8(%rdx,%rbx), %esi
	cmpw	%si, %r13w
	jb	.LBB33_18
# %bb.20:                               #   in Loop: Header=BB33_19 Depth=1
	movzwl	-6(%rdx,%rbx), %edi
	addl	%esi, %edi
	cmpl	%r14d, %edi
	jbe	.LBB33_18
# %bb.21:                               #   in Loop: Header=BB33_19 Depth=1
	movq	(%rdx,%rbx), %rdi
	movl	%r13d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbx)
                                        # kill: def $al killed $al def $rax
	movq	16(%r15), %rcx
	jmp	.LBB33_18
.LBB33_22:
	movzbl	%al, %r12d
	addl	%r12d, %r12d
	testq	%rcx, %rcx
	je	.LBB33_29
# %bb.23:
	movl	$24, %ebx
	xorl	%ebp, %ebp
	jmp	.LBB33_25
	.p2align	4, 0x90
.LBB33_24:                              #   in Loop: Header=BB33_25 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rcx, %rbp
	jae	.LBB33_30
.LBB33_25:                              # =>This Inner Loop Header: Depth=1
	movq	8(%r15), %rax
	movzwl	-8(%rax,%rbx), %edx
	cmpw	%dx, %r13w
	jb	.LBB33_24
# %bb.26:                               #   in Loop: Header=BB33_25 Depth=1
	movzwl	-6(%rax,%rbx), %esi
	addl	%edx, %esi
	cmpl	%r14d, %esi
	jbe	.LBB33_24
# %bb.27:                               #   in Loop: Header=BB33_25 Depth=1
	movq	(%rax,%rbx), %rdi
	movl	%r13d, %ecx
	subl	%edx, %ecx
	movzwl	%cx, %esi
	movzbl	%r12b, %edx
	callq	*-16(%rax,%rbx)
	movq	16(%r15), %rcx
	jmp	.LBB33_24
.LBB33_28:
	leaq	6(%r15), %r14
	movb	6(%r15), %dl
	andb	$127, %dl
	xorl	%ecx, %ecx
	xorl	%eax, %eax
	jmp	.LBB33_31
.LBB33_29:
	xorl	%ecx, %ecx
.LBB33_30:
	movzwl	%r12w, %eax
	leaq	6(%r15), %r14
	movb	6(%r15), %dl
	movl	%edx, %ebx
	andb	$127, %bl
	orb	$-128, %dl
	testb	%r12b, %r12b
	movzbl	%dl, %esi
	movzbl	%bl, %edx
	cmovsl	%esi, %edx
	movzwl	4(%r15), %r13d
.LBB33_31:
	movl	%edx, %ebx
	andb	$-3, %bl
	orb	$2, %dl
	testb	%al, %al
	movzbl	%dl, %edx
	movzbl	%bl, %esi
	cmovel	%edx, %esi
	movl	%esi, %edx
	andb	$-2, %dl
	orb	$1, %sil
	testl	$256, %eax              # imm = 0x100
	movzbl	%dl, %eax
	movzbl	%sil, %edx
	cmovel	%eax, %edx
	movb	%dl, 6(%r15)
	movb	(%r15), %al
	testq	%rcx, %rcx
	movb	%al, 15(%rsp)           # 1-byte Spill
	je	.LBB33_44
# %bb.32:
	movzwl	%r13w, %r12d
	movl	$24, %ebx
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	jmp	.LBB33_34
	.p2align	4, 0x90
.LBB33_33:                              #   in Loop: Header=BB33_34 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rcx, %rbp
	jae	.LBB33_37
.LBB33_34:                              # =>This Inner Loop Header: Depth=1
	movq	8(%r15), %rdx
	movzwl	-8(%rdx,%rbx), %esi
	cmpw	%si, %r13w
	jb	.LBB33_33
# %bb.35:                               #   in Loop: Header=BB33_34 Depth=1
	movzwl	-6(%rdx,%rbx), %edi
	addl	%esi, %edi
	cmpl	%r12d, %edi
	jbe	.LBB33_33
# %bb.36:                               #   in Loop: Header=BB33_34 Depth=1
	movq	(%rdx,%rbx), %rdi
	movl	%r13d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbx)
                                        # kill: def $al killed $al def $rax
	movq	16(%r15), %rcx
	jmp	.LBB33_33
.LBB33_37:
	movzbl	%al, %r12d
	movl	4(%r15), %r13d
	testq	%rcx, %rcx
	je	.LBB33_45
# %bb.38:
	movq	%r14, 16(%rsp)          # 8-byte Spill
	addl	$1, %r13d
	movzwl	%r13w, %ebp
	movl	$24, %ebx
	xorl	%eax, %eax
	xorl	%r14d, %r14d
	jmp	.LBB33_40
	.p2align	4, 0x90
.LBB33_39:                              #   in Loop: Header=BB33_40 Depth=1
	addq	$1, %r14
	addq	$32, %rbx
	cmpq	%rcx, %r14
	jae	.LBB33_43
.LBB33_40:                              # =>This Inner Loop Header: Depth=1
	movq	8(%r15), %rdx
	movzwl	-8(%rdx,%rbx), %esi
	cmpw	%si, %r13w
	jb	.LBB33_39
# %bb.41:                               #   in Loop: Header=BB33_40 Depth=1
	movzwl	-6(%rdx,%rbx), %edi
	addl	%esi, %edi
	cmpl	%ebp, %edi
	jbe	.LBB33_39
# %bb.42:                               #   in Loop: Header=BB33_40 Depth=1
	movq	(%rdx,%rbx), %rdi
	movl	%r13d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbx)
                                        # kill: def $al killed $al def $rax
	movq	16(%r15), %rcx
	jmp	.LBB33_39
.LBB33_43:
	movzwl	4(%r15), %r13d
	movq	16(%rsp), %r14          # 8-byte Reload
	jmp	.LBB33_47
.LBB33_44:
	xorl	%ecx, %ecx
	xorl	%r12d, %r12d
	jmp	.LBB33_46
.LBB33_45:
	xorl	%ecx, %ecx
.LBB33_46:
	xorl	%eax, %eax
.LBB33_47:
	movzbl	1(%r15), %edx
	addl	$2, %r13d
	movw	%r13w, 4(%r15)
	testq	%rcx, %rcx
	je	.LBB33_53
# %bb.48:
	movzbl	%al, %eax
	shll	$8, %eax
	movzwl	%r12w, %r13d
	orl	%eax, %r13d
	addl	%edx, %r13d
	movzwl	%r13w, %r12d
	movl	$24, %ebx
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	jmp	.LBB33_50
	.p2align	4, 0x90
.LBB33_49:                              #   in Loop: Header=BB33_50 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rcx, %rbp
	jae	.LBB33_54
.LBB33_50:                              # =>This Inner Loop Header: Depth=1
	movq	8(%r15), %rdx
	movzwl	-8(%rdx,%rbx), %esi
	cmpw	%si, %r13w
	jb	.LBB33_49
# %bb.51:                               #   in Loop: Header=BB33_50 Depth=1
	movzwl	-6(%rdx,%rbx), %edi
	addl	%esi, %edi
	cmpl	%r12d, %edi
	jbe	.LBB33_49
# %bb.52:                               #   in Loop: Header=BB33_50 Depth=1
	movq	(%rdx,%rbx), %rdi
	movl	%r13d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbx)
                                        # kill: def $al killed $al def $rax
	movq	16(%r15), %rcx
	jmp	.LBB33_49
.LBB33_53:
	xorl	%eax, %eax
.LBB33_54:
	orb	15(%rsp), %al           # 1-byte Folded Reload
	movb	%al, (%r15)
	movb	6(%r15), %cl
	js	.LBB33_57
# %bb.55:
	andb	$127, %cl
	movb	%cl, (%r14)
	testb	%al, %al
	jne	.LBB33_58
# %bb.56:
	orb	$2, %cl
	jmp	.LBB33_59
.LBB33_57:
	orb	$-128, %cl
	movb	%cl, (%r14)
.LBB33_58:
	andb	$-3, %cl
.LBB33_59:
	movb	%cl, (%r14)
	movl	$7, %eax
	addq	$24, %rsp
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%r12
	.cfi_def_cfa_offset 40
	popq	%r13
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end33:
	.size	SLO_absx, .Lfunc_end33-SLO_absx
	.cfi_endproc
                                        # -- End function
	.globl	SLO_absy                # -- Begin function SLO_absy
	.p2align	4, 0x90
	.type	SLO_absy,@function
SLO_absy:                               # @SLO_absy
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r13
	.cfi_def_cfa_offset 40
	pushq	%r12
	.cfi_def_cfa_offset 48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	subq	$24, %rsp
	.cfi_def_cfa_offset 80
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%rdi, %r15
	movzwl	4(%rdi), %r13d
	movq	16(%rdi), %rcx
	testq	%rcx, %rcx
	je	.LBB34_13
# %bb.1:
	movzwl	%r13w, %r14d
	movl	$24, %ebx
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	jmp	.LBB34_3
	.p2align	4, 0x90
.LBB34_2:                               #   in Loop: Header=BB34_3 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rcx, %rbp
	jae	.LBB34_6
.LBB34_3:                               # =>This Inner Loop Header: Depth=1
	movq	8(%r15), %rdx
	movzwl	-8(%rdx,%rbx), %esi
	cmpw	%si, %r13w
	jb	.LBB34_2
# %bb.4:                                #   in Loop: Header=BB34_3 Depth=1
	movzwl	-6(%rdx,%rbx), %edi
	addl	%esi, %edi
	cmpl	%r14d, %edi
	jbe	.LBB34_2
# %bb.5:                                #   in Loop: Header=BB34_3 Depth=1
	movq	(%rdx,%rbx), %rdi
	movl	%r13d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbx)
                                        # kill: def $al killed $al def $rax
	movq	16(%r15), %rcx
	jmp	.LBB34_2
.LBB34_6:
	movzbl	%al, %r14d
	movl	4(%r15), %r13d
	testq	%rcx, %rcx
	je	.LBB34_14
# %bb.7:
	addl	$1, %r13d
	movzwl	%r13w, %r12d
	movl	$24, %ebx
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	jmp	.LBB34_9
	.p2align	4, 0x90
.LBB34_8:                               #   in Loop: Header=BB34_9 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rcx, %rbp
	jae	.LBB34_12
.LBB34_9:                               # =>This Inner Loop Header: Depth=1
	movq	8(%r15), %rdx
	movzwl	-8(%rdx,%rbx), %esi
	cmpw	%si, %r13w
	jb	.LBB34_8
# %bb.10:                               #   in Loop: Header=BB34_9 Depth=1
	movzwl	-6(%rdx,%rbx), %edi
	addl	%esi, %edi
	cmpl	%r12d, %edi
	jbe	.LBB34_8
# %bb.11:                               #   in Loop: Header=BB34_9 Depth=1
	movq	(%rdx,%rbx), %rdi
	movl	%r13d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbx)
                                        # kill: def $al killed $al def $rax
	movq	16(%r15), %rcx
	jmp	.LBB34_8
.LBB34_12:
	movzwl	4(%r15), %r13d
	jmp	.LBB34_16
.LBB34_13:
	xorl	%ecx, %ecx
	xorl	%r14d, %r14d
	jmp	.LBB34_15
.LBB34_14:
	xorl	%ecx, %ecx
.LBB34_15:
	xorl	%eax, %eax
.LBB34_16:
	movzbl	2(%r15), %edx
	addl	$2, %r13d
	movw	%r13w, 4(%r15)
	testq	%rcx, %rcx
	je	.LBB34_28
# %bb.17:
	movzbl	%al, %eax
	shll	$8, %eax
	movzwl	%r14w, %r13d
	orl	%eax, %r13d
	addl	%edx, %r13d
	movzwl	%r13w, %r14d
	movl	$24, %ebx
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	jmp	.LBB34_19
	.p2align	4, 0x90
.LBB34_18:                              #   in Loop: Header=BB34_19 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rcx, %rbp
	jae	.LBB34_22
.LBB34_19:                              # =>This Inner Loop Header: Depth=1
	movq	8(%r15), %rdx
	movzwl	-8(%rdx,%rbx), %esi
	cmpw	%si, %r13w
	jb	.LBB34_18
# %bb.20:                               #   in Loop: Header=BB34_19 Depth=1
	movzwl	-6(%rdx,%rbx), %edi
	addl	%esi, %edi
	cmpl	%r14d, %edi
	jbe	.LBB34_18
# %bb.21:                               #   in Loop: Header=BB34_19 Depth=1
	movq	(%rdx,%rbx), %rdi
	movl	%r13d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbx)
                                        # kill: def $al killed $al def $rax
	movq	16(%r15), %rcx
	jmp	.LBB34_18
.LBB34_22:
	movzbl	%al, %r12d
	addl	%r12d, %r12d
	testq	%rcx, %rcx
	je	.LBB34_29
# %bb.23:
	movl	$24, %ebx
	xorl	%ebp, %ebp
	jmp	.LBB34_25
	.p2align	4, 0x90
.LBB34_24:                              #   in Loop: Header=BB34_25 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rcx, %rbp
	jae	.LBB34_30
.LBB34_25:                              # =>This Inner Loop Header: Depth=1
	movq	8(%r15), %rax
	movzwl	-8(%rax,%rbx), %edx
	cmpw	%dx, %r13w
	jb	.LBB34_24
# %bb.26:                               #   in Loop: Header=BB34_25 Depth=1
	movzwl	-6(%rax,%rbx), %esi
	addl	%edx, %esi
	cmpl	%r14d, %esi
	jbe	.LBB34_24
# %bb.27:                               #   in Loop: Header=BB34_25 Depth=1
	movq	(%rax,%rbx), %rdi
	movl	%r13d, %ecx
	subl	%edx, %ecx
	movzwl	%cx, %esi
	movzbl	%r12b, %edx
	callq	*-16(%rax,%rbx)
	movq	16(%r15), %rcx
	jmp	.LBB34_24
.LBB34_28:
	leaq	6(%r15), %r14
	movb	6(%r15), %dl
	andb	$127, %dl
	xorl	%ecx, %ecx
	xorl	%eax, %eax
	jmp	.LBB34_31
.LBB34_29:
	xorl	%ecx, %ecx
.LBB34_30:
	movzwl	%r12w, %eax
	leaq	6(%r15), %r14
	movb	6(%r15), %dl
	movl	%edx, %ebx
	andb	$127, %bl
	orb	$-128, %dl
	testb	%r12b, %r12b
	movzbl	%dl, %esi
	movzbl	%bl, %edx
	cmovsl	%esi, %edx
	movzwl	4(%r15), %r13d
.LBB34_31:
	movl	%edx, %ebx
	andb	$-3, %bl
	orb	$2, %dl
	testb	%al, %al
	movzbl	%dl, %edx
	movzbl	%bl, %esi
	cmovel	%edx, %esi
	movl	%esi, %edx
	andb	$-2, %dl
	orb	$1, %sil
	testl	$256, %eax              # imm = 0x100
	movzbl	%dl, %eax
	movzbl	%sil, %edx
	cmovel	%eax, %edx
	movb	%dl, 6(%r15)
	movb	(%r15), %al
	testq	%rcx, %rcx
	movb	%al, 15(%rsp)           # 1-byte Spill
	je	.LBB34_44
# %bb.32:
	movzwl	%r13w, %r12d
	movl	$24, %ebx
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	jmp	.LBB34_34
	.p2align	4, 0x90
.LBB34_33:                              #   in Loop: Header=BB34_34 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rcx, %rbp
	jae	.LBB34_37
.LBB34_34:                              # =>This Inner Loop Header: Depth=1
	movq	8(%r15), %rdx
	movzwl	-8(%rdx,%rbx), %esi
	cmpw	%si, %r13w
	jb	.LBB34_33
# %bb.35:                               #   in Loop: Header=BB34_34 Depth=1
	movzwl	-6(%rdx,%rbx), %edi
	addl	%esi, %edi
	cmpl	%r12d, %edi
	jbe	.LBB34_33
# %bb.36:                               #   in Loop: Header=BB34_34 Depth=1
	movq	(%rdx,%rbx), %rdi
	movl	%r13d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbx)
                                        # kill: def $al killed $al def $rax
	movq	16(%r15), %rcx
	jmp	.LBB34_33
.LBB34_37:
	movzbl	%al, %r12d
	movl	4(%r15), %r13d
	testq	%rcx, %rcx
	je	.LBB34_45
# %bb.38:
	movq	%r14, 16(%rsp)          # 8-byte Spill
	addl	$1, %r13d
	movzwl	%r13w, %ebp
	movl	$24, %ebx
	xorl	%eax, %eax
	xorl	%r14d, %r14d
	jmp	.LBB34_40
	.p2align	4, 0x90
.LBB34_39:                              #   in Loop: Header=BB34_40 Depth=1
	addq	$1, %r14
	addq	$32, %rbx
	cmpq	%rcx, %r14
	jae	.LBB34_43
.LBB34_40:                              # =>This Inner Loop Header: Depth=1
	movq	8(%r15), %rdx
	movzwl	-8(%rdx,%rbx), %esi
	cmpw	%si, %r13w
	jb	.LBB34_39
# %bb.41:                               #   in Loop: Header=BB34_40 Depth=1
	movzwl	-6(%rdx,%rbx), %edi
	addl	%esi, %edi
	cmpl	%ebp, %edi
	jbe	.LBB34_39
# %bb.42:                               #   in Loop: Header=BB34_40 Depth=1
	movq	(%rdx,%rbx), %rdi
	movl	%r13d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbx)
                                        # kill: def $al killed $al def $rax
	movq	16(%r15), %rcx
	jmp	.LBB34_39
.LBB34_43:
	movzwl	4(%r15), %r13d
	movq	16(%rsp), %r14          # 8-byte Reload
	jmp	.LBB34_47
.LBB34_44:
	xorl	%ecx, %ecx
	xorl	%r12d, %r12d
	jmp	.LBB34_46
.LBB34_45:
	xorl	%ecx, %ecx
.LBB34_46:
	xorl	%eax, %eax
.LBB34_47:
	movzbl	2(%r15), %edx
	addl	$2, %r13d
	movw	%r13w, 4(%r15)
	testq	%rcx, %rcx
	je	.LBB34_53
# %bb.48:
	movzbl	%al, %eax
	shll	$8, %eax
	movzwl	%r12w, %r13d
	orl	%eax, %r13d
	addl	%edx, %r13d
	movzwl	%r13w, %r12d
	movl	$24, %ebx
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	jmp	.LBB34_50
	.p2align	4, 0x90
.LBB34_49:                              #   in Loop: Header=BB34_50 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rcx, %rbp
	jae	.LBB34_54
.LBB34_50:                              # =>This Inner Loop Header: Depth=1
	movq	8(%r15), %rdx
	movzwl	-8(%rdx,%rbx), %esi
	cmpw	%si, %r13w
	jb	.LBB34_49
# %bb.51:                               #   in Loop: Header=BB34_50 Depth=1
	movzwl	-6(%rdx,%rbx), %edi
	addl	%esi, %edi
	cmpl	%r12d, %edi
	jbe	.LBB34_49
# %bb.52:                               #   in Loop: Header=BB34_50 Depth=1
	movq	(%rdx,%rbx), %rdi
	movl	%r13d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbx)
                                        # kill: def $al killed $al def $rax
	movq	16(%r15), %rcx
	jmp	.LBB34_49
.LBB34_53:
	xorl	%eax, %eax
.LBB34_54:
	orb	15(%rsp), %al           # 1-byte Folded Reload
	movb	%al, (%r15)
	movb	6(%r15), %cl
	js	.LBB34_57
# %bb.55:
	andb	$127, %cl
	movb	%cl, (%r14)
	testb	%al, %al
	jne	.LBB34_58
# %bb.56:
	orb	$2, %cl
	jmp	.LBB34_59
.LBB34_57:
	orb	$-128, %cl
	movb	%cl, (%r14)
.LBB34_58:
	andb	$-3, %cl
.LBB34_59:
	movb	%cl, (%r14)
	movl	$7, %eax
	addq	$24, %rsp
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%r12
	.cfi_def_cfa_offset 40
	popq	%r13
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end34:
	.size	SLO_absy, .Lfunc_end34-SLO_absy
	.cfi_endproc
                                        # -- End function
	.globl	SLO_xind                # -- Begin function SLO_xind
	.p2align	4, 0x90
	.type	SLO_xind,@function
SLO_xind:                               # @SLO_xind
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r13
	.cfi_def_cfa_offset 40
	pushq	%r12
	.cfi_def_cfa_offset 48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	pushq	%rax
	.cfi_def_cfa_offset 64
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%rdi, %r15
	callq	xind
	movq	16(%r15), %rcx
	testq	%rcx, %rcx
	je	.LBB35_1
# %bb.2:
	movl	%eax, %r12d
	movzwl	%ax, %r14d
	movl	$24, %ebp
	xorl	%eax, %eax
	xorl	%ebx, %ebx
	jmp	.LBB35_3
	.p2align	4, 0x90
.LBB35_6:                               #   in Loop: Header=BB35_3 Depth=1
	addq	$1, %rbx
	addq	$32, %rbp
	cmpq	%rcx, %rbx
	jae	.LBB35_7
.LBB35_3:                               # =>This Inner Loop Header: Depth=1
	movq	8(%r15), %rdx
	movzwl	-8(%rdx,%rbp), %esi
	cmpw	%si, %r12w
	jb	.LBB35_6
# %bb.4:                                #   in Loop: Header=BB35_3 Depth=1
	movzwl	-6(%rdx,%rbp), %edi
	addl	%esi, %edi
	cmpl	%r14d, %edi
	jbe	.LBB35_6
# %bb.5:                                #   in Loop: Header=BB35_3 Depth=1
	movq	(%rdx,%rbp), %rdi
	movl	%r14d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbp)
                                        # kill: def $al killed $al def $rax
	movq	16(%r15), %rcx
	jmp	.LBB35_6
.LBB35_7:
	movzbl	%al, %r13d
	addl	%r13d, %r13d
	testq	%rcx, %rcx
	je	.LBB35_13
# %bb.8:
	movl	$24, %ebp
	xorl	%ebx, %ebx
	jmp	.LBB35_9
	.p2align	4, 0x90
.LBB35_12:                              #   in Loop: Header=BB35_9 Depth=1
	addq	$1, %rbx
	addq	$32, %rbp
	cmpq	%rcx, %rbx
	jae	.LBB35_13
.LBB35_9:                               # =>This Inner Loop Header: Depth=1
	movq	8(%r15), %rax
	movzwl	-8(%rax,%rbp), %edx
	cmpw	%dx, %r12w
	jb	.LBB35_12
# %bb.10:                               #   in Loop: Header=BB35_9 Depth=1
	movzwl	-6(%rax,%rbp), %esi
	addl	%edx, %esi
	cmpl	%r14d, %esi
	jbe	.LBB35_12
# %bb.11:                               #   in Loop: Header=BB35_9 Depth=1
	movq	(%rax,%rbp), %rdi
	movl	%r12d, %ecx
	subl	%edx, %ecx
	movzwl	%cx, %esi
	movzbl	%r13b, %edx
	callq	*-16(%rax,%rbp)
	movq	16(%r15), %rcx
	jmp	.LBB35_12
.LBB35_13:
	movzwl	%r13w, %eax
	leaq	6(%r15), %rcx
	movq	%rcx, (%rsp)            # 8-byte Spill
	movb	6(%r15), %cl
	movl	%ecx, %edx
	andb	$127, %dl
	orb	$-128, %cl
	testb	%r13b, %r13b
	movzbl	%cl, %esi
	movzbl	%dl, %ecx
	cmovsl	%esi, %ecx
	jmp	.LBB35_14
.LBB35_1:
	leaq	6(%r15), %rax
	movq	%rax, (%rsp)            # 8-byte Spill
	movb	6(%r15), %cl
	andb	$127, %cl
	xorl	%eax, %eax
.LBB35_14:
	movl	%ecx, %edx
	andb	$-3, %dl
	orb	$2, %cl
	testb	%al, %al
	movzbl	%cl, %ecx
	movzbl	%dl, %edx
	cmovel	%ecx, %edx
	movl	%edx, %ecx
	andb	$-2, %cl
	orb	$1, %dl
	testl	$256, %eax              # imm = 0x100
	movzbl	%cl, %eax
	movzbl	%dl, %ecx
	cmovel	%eax, %ecx
	movb	%cl, 6(%r15)
	movb	(%r15), %bl
	movq	%r15, %rdi
	callq	xind
	movq	16(%r15), %rcx
	testq	%rcx, %rcx
	je	.LBB35_15
# %bb.16:
	movl	%eax, %r13d
	movzwl	%ax, %r12d
	movl	$24, %ebp
	xorl	%eax, %eax
	xorl	%r14d, %r14d
	jmp	.LBB35_17
	.p2align	4, 0x90
.LBB35_20:                              #   in Loop: Header=BB35_17 Depth=1
	addq	$1, %r14
	addq	$32, %rbp
	cmpq	%rcx, %r14
	jae	.LBB35_21
.LBB35_17:                              # =>This Inner Loop Header: Depth=1
	movq	8(%r15), %rdx
	movzwl	-8(%rdx,%rbp), %esi
	cmpw	%si, %r13w
	jb	.LBB35_20
# %bb.18:                               #   in Loop: Header=BB35_17 Depth=1
	movzwl	-6(%rdx,%rbp), %edi
	addl	%esi, %edi
	cmpl	%r12d, %edi
	jbe	.LBB35_20
# %bb.19:                               #   in Loop: Header=BB35_17 Depth=1
	movq	(%rdx,%rbp), %rdi
	movl	%r12d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbp)
                                        # kill: def $al killed $al def $rax
	movq	16(%r15), %rcx
	jmp	.LBB35_20
.LBB35_15:
	xorl	%eax, %eax
.LBB35_21:
	orb	%bl, %al
	movb	%al, (%r15)
	movb	6(%r15), %cl
	js	.LBB35_22
# %bb.24:
	andb	$127, %cl
	movq	(%rsp), %rdx            # 8-byte Reload
	movb	%cl, (%rdx)
	testb	%al, %al
	jne	.LBB35_23
# %bb.25:
	orb	$2, %cl
	jmp	.LBB35_26
.LBB35_22:
	orb	$-128, %cl
	movq	(%rsp), %rdx            # 8-byte Reload
	movb	%cl, (%rdx)
.LBB35_23:
	andb	$-3, %cl
.LBB35_26:
	movb	%cl, (%rdx)
	movl	$8, %eax
	addq	$8, %rsp
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%r12
	.cfi_def_cfa_offset 40
	popq	%r13
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end35:
	.size	SLO_xind, .Lfunc_end35-SLO_xind
	.cfi_endproc
                                        # -- End function
	.globl	SLO_indy                # -- Begin function SLO_indy
	.p2align	4, 0x90
	.type	SLO_indy,@function
SLO_indy:                               # @SLO_indy
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r13
	.cfi_def_cfa_offset 40
	pushq	%r12
	.cfi_def_cfa_offset 48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	pushq	%rax
	.cfi_def_cfa_offset 64
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%rdi, %r15
	callq	indy
	movq	16(%r15), %rcx
	testq	%rcx, %rcx
	je	.LBB36_1
# %bb.2:
	movl	%eax, %r12d
	movzwl	%ax, %r14d
	movl	$24, %ebp
	xorl	%eax, %eax
	xorl	%ebx, %ebx
	jmp	.LBB36_3
	.p2align	4, 0x90
.LBB36_6:                               #   in Loop: Header=BB36_3 Depth=1
	addq	$1, %rbx
	addq	$32, %rbp
	cmpq	%rcx, %rbx
	jae	.LBB36_7
.LBB36_3:                               # =>This Inner Loop Header: Depth=1
	movq	8(%r15), %rdx
	movzwl	-8(%rdx,%rbp), %esi
	cmpw	%si, %r12w
	jb	.LBB36_6
# %bb.4:                                #   in Loop: Header=BB36_3 Depth=1
	movzwl	-6(%rdx,%rbp), %edi
	addl	%esi, %edi
	cmpl	%r14d, %edi
	jbe	.LBB36_6
# %bb.5:                                #   in Loop: Header=BB36_3 Depth=1
	movq	(%rdx,%rbp), %rdi
	movl	%r14d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbp)
                                        # kill: def $al killed $al def $rax
	movq	16(%r15), %rcx
	jmp	.LBB36_6
.LBB36_7:
	movzbl	%al, %r13d
	addl	%r13d, %r13d
	testq	%rcx, %rcx
	je	.LBB36_13
# %bb.8:
	movl	$24, %ebp
	xorl	%ebx, %ebx
	jmp	.LBB36_9
	.p2align	4, 0x90
.LBB36_12:                              #   in Loop: Header=BB36_9 Depth=1
	addq	$1, %rbx
	addq	$32, %rbp
	cmpq	%rcx, %rbx
	jae	.LBB36_13
.LBB36_9:                               # =>This Inner Loop Header: Depth=1
	movq	8(%r15), %rax
	movzwl	-8(%rax,%rbp), %edx
	cmpw	%dx, %r12w
	jb	.LBB36_12
# %bb.10:                               #   in Loop: Header=BB36_9 Depth=1
	movzwl	-6(%rax,%rbp), %esi
	addl	%edx, %esi
	cmpl	%r14d, %esi
	jbe	.LBB36_12
# %bb.11:                               #   in Loop: Header=BB36_9 Depth=1
	movq	(%rax,%rbp), %rdi
	movl	%r12d, %ecx
	subl	%edx, %ecx
	movzwl	%cx, %esi
	movzbl	%r13b, %edx
	callq	*-16(%rax,%rbp)
	movq	16(%r15), %rcx
	jmp	.LBB36_12
.LBB36_13:
	movzwl	%r13w, %eax
	leaq	6(%r15), %rcx
	movq	%rcx, (%rsp)            # 8-byte Spill
	movb	6(%r15), %cl
	movl	%ecx, %edx
	andb	$127, %dl
	orb	$-128, %cl
	testb	%r13b, %r13b
	movzbl	%cl, %esi
	movzbl	%dl, %ecx
	cmovsl	%esi, %ecx
	jmp	.LBB36_14
.LBB36_1:
	leaq	6(%r15), %rax
	movq	%rax, (%rsp)            # 8-byte Spill
	movb	6(%r15), %cl
	andb	$127, %cl
	xorl	%eax, %eax
.LBB36_14:
	movl	%ecx, %edx
	andb	$-3, %dl
	orb	$2, %cl
	testb	%al, %al
	movzbl	%cl, %ecx
	movzbl	%dl, %edx
	cmovel	%ecx, %edx
	movl	%edx, %ecx
	andb	$-2, %cl
	orb	$1, %dl
	testl	$256, %eax              # imm = 0x100
	movzbl	%cl, %eax
	movzbl	%dl, %ecx
	cmovel	%eax, %ecx
	movb	%cl, 6(%r15)
	movb	(%r15), %bl
	movq	%r15, %rdi
	callq	indy
	movq	16(%r15), %rcx
	testq	%rcx, %rcx
	je	.LBB36_15
# %bb.16:
	movl	%eax, %r13d
	movzwl	%ax, %r12d
	movl	$24, %ebp
	xorl	%eax, %eax
	xorl	%r14d, %r14d
	jmp	.LBB36_17
	.p2align	4, 0x90
.LBB36_20:                              #   in Loop: Header=BB36_17 Depth=1
	addq	$1, %r14
	addq	$32, %rbp
	cmpq	%rcx, %r14
	jae	.LBB36_21
.LBB36_17:                              # =>This Inner Loop Header: Depth=1
	movq	8(%r15), %rdx
	movzwl	-8(%rdx,%rbp), %esi
	cmpw	%si, %r13w
	jb	.LBB36_20
# %bb.18:                               #   in Loop: Header=BB36_17 Depth=1
	movzwl	-6(%rdx,%rbp), %edi
	addl	%esi, %edi
	cmpl	%r12d, %edi
	jbe	.LBB36_20
# %bb.19:                               #   in Loop: Header=BB36_17 Depth=1
	movq	(%rdx,%rbp), %rdi
	movl	%r12d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbp)
                                        # kill: def $al killed $al def $rax
	movq	16(%r15), %rcx
	jmp	.LBB36_20
.LBB36_15:
	xorl	%eax, %eax
.LBB36_21:
	orb	%bl, %al
	movb	%al, (%r15)
	movb	6(%r15), %cl
	js	.LBB36_22
# %bb.24:
	andb	$127, %cl
	movq	(%rsp), %rdx            # 8-byte Reload
	movb	%cl, (%rdx)
	testb	%al, %al
	jne	.LBB36_23
# %bb.25:
	orb	$2, %cl
	jmp	.LBB36_26
.LBB36_22:
	orb	$-128, %cl
	movq	(%rsp), %rdx            # 8-byte Reload
	movb	%cl, (%rdx)
.LBB36_23:
	andb	$-3, %cl
.LBB36_26:
	movb	%cl, (%rdx)
	movl	$8, %eax
	addq	$8, %rsp
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%r12
	.cfi_def_cfa_offset 40
	popq	%r13
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end36:
	.size	SLO_indy, .Lfunc_end36-SLO_indy
	.cfi_endproc
                                        # -- End function
	.globl	SRE_zpg                 # -- Begin function SRE_zpg
	.p2align	4, 0x90
	.type	SRE_zpg,@function
SRE_zpg:                                # @SRE_zpg
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r13
	.cfi_def_cfa_offset 40
	pushq	%r12
	.cfi_def_cfa_offset 48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	pushq	%rax
	.cfi_def_cfa_offset 64
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%rdi, %r12
	movzwl	4(%rdi), %r14d
	movq	16(%rdi), %rcx
	testq	%rcx, %rcx
	je	.LBB37_1
# %bb.2:
	movl	$24, %ebx
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	jmp	.LBB37_3
	.p2align	4, 0x90
.LBB37_6:                               #   in Loop: Header=BB37_3 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rcx, %rbp
	jae	.LBB37_7
.LBB37_3:                               # =>This Inner Loop Header: Depth=1
	movq	8(%r12), %rdx
	movzwl	-8(%rdx,%rbx), %esi
	cmpw	%si, %r14w
	jb	.LBB37_6
# %bb.4:                                #   in Loop: Header=BB37_3 Depth=1
	movzwl	-6(%rdx,%rbx), %edi
	addl	%esi, %edi
	cmpl	%r14d, %edi
	jbe	.LBB37_6
# %bb.5:                                #   in Loop: Header=BB37_3 Depth=1
	movq	(%rdx,%rbx), %rdi
	movl	%r14d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbx)
                                        # kill: def $al killed $al def $rax
	movq	16(%r12), %rcx
	jmp	.LBB37_6
.LBB37_7:
	addw	$1, 4(%r12)
	testq	%rcx, %rcx
	je	.LBB37_8
# %bb.10:
	movzbl	%al, %r13d
	movl	$24, %ebx
	xorl	%r14d, %r14d
	xorl	%ebp, %ebp
	jmp	.LBB37_11
	.p2align	4, 0x90
.LBB37_14:                              #   in Loop: Header=BB37_11 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rcx, %rbp
	jae	.LBB37_15
.LBB37_11:                              # =>This Inner Loop Header: Depth=1
	movq	8(%r12), %rdx
	movzwl	-8(%rdx,%rbx), %eax
	cmpw	%r13w, %ax
	ja	.LBB37_14
# %bb.12:                               #   in Loop: Header=BB37_11 Depth=1
	movzwl	-6(%rdx,%rbx), %esi
	addl	%eax, %esi
	cmpl	%r13d, %esi
	jbe	.LBB37_14
# %bb.13:                               #   in Loop: Header=BB37_11 Depth=1
	movq	(%rdx,%rbx), %rdi
	movzwl	%r13w, %ecx
	subl	%eax, %ecx
	movzwl	%cx, %esi
	callq	*-24(%rdx,%rbx)
	movl	%eax, %r14d
	movq	16(%r12), %rcx
	jmp	.LBB37_14
.LBB37_15:
	movl	%r14d, %r15d
	shrb	%r15b
	testq	%rcx, %rcx
	je	.LBB37_16
# %bb.17:
	movl	$24, %ebx
	xorl	%ebp, %ebp
	movzwl	%r13w, %eax
	movl	%eax, 4(%rsp)           # 4-byte Spill
	jmp	.LBB37_18
	.p2align	4, 0x90
.LBB37_21:                              #   in Loop: Header=BB37_18 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rcx, %rbp
	jae	.LBB37_22
.LBB37_18:                              # =>This Inner Loop Header: Depth=1
	movq	8(%r12), %rax
	movzwl	-8(%rax,%rbx), %edx
	cmpw	%r13w, %dx
	ja	.LBB37_21
# %bb.19:                               #   in Loop: Header=BB37_18 Depth=1
	movzwl	-6(%rax,%rbx), %esi
	addl	%edx, %esi
	cmpl	%r13d, %esi
	jbe	.LBB37_21
# %bb.20:                               #   in Loop: Header=BB37_18 Depth=1
	movq	(%rax,%rbx), %rdi
	movl	4(%rsp), %ecx           # 4-byte Reload
	subl	%edx, %ecx
	movzwl	%cx, %esi
	movzbl	%r15b, %edx
	callq	*-16(%rax,%rbx)
	movq	16(%r12), %rcx
	jmp	.LBB37_21
.LBB37_1:
	addl	$1, %r14d
	movw	%r14w, 4(%r12)
.LBB37_8:
	xorl	%ecx, %ecx
	xorl	%r15d, %r15d
	jmp	.LBB37_9
.LBB37_16:
	xorl	%ecx, %ecx
.LBB37_22:
	testb	$1, %r14b
	jne	.LBB37_23
.LBB37_9:
	movb	6(%r12), %al
	andb	$-2, %al
.LBB37_24:
	movb	%al, 6(%r12)
	andb	$124, %al
	leal	2(%rax), %edx
	testb	%r15b, %r15b
	movzbl	%al, %eax
	movzbl	%dl, %edx
	cmovnel	%eax, %edx
	movb	%dl, 6(%r12)
	movzwl	4(%r12), %r14d
	testq	%rcx, %rcx
	je	.LBB37_25
# %bb.26:
	movl	$24, %ebx
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	jmp	.LBB37_27
	.p2align	4, 0x90
.LBB37_30:                              #   in Loop: Header=BB37_27 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rcx, %rbp
	jae	.LBB37_31
.LBB37_27:                              # =>This Inner Loop Header: Depth=1
	movq	8(%r12), %rdx
	movzwl	-8(%rdx,%rbx), %esi
	cmpw	%si, %r14w
	jb	.LBB37_30
# %bb.28:                               #   in Loop: Header=BB37_27 Depth=1
	movzwl	-6(%rdx,%rbx), %edi
	addl	%esi, %edi
	cmpl	%r14d, %edi
	jbe	.LBB37_30
# %bb.29:                               #   in Loop: Header=BB37_27 Depth=1
	movq	(%rdx,%rbx), %rdi
	movl	%r14d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbx)
                                        # kill: def $al killed $al def $rax
	movq	16(%r12), %rcx
	jmp	.LBB37_30
.LBB37_31:
	addw	$1, 4(%r12)
	testq	%rcx, %rcx
	je	.LBB37_32
# %bb.33:
	movzbl	%al, %r14d
	movl	$24, %ebx
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	jmp	.LBB37_34
	.p2align	4, 0x90
.LBB37_37:                              #   in Loop: Header=BB37_34 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rcx, %rbp
	jae	.LBB37_38
.LBB37_34:                              # =>This Inner Loop Header: Depth=1
	movq	8(%r12), %rdx
	movzwl	-8(%rdx,%rbx), %esi
	cmpw	%r14w, %si
	ja	.LBB37_37
# %bb.35:                               #   in Loop: Header=BB37_34 Depth=1
	movzwl	-6(%rdx,%rbx), %edi
	addl	%esi, %edi
	cmpl	%r14d, %edi
	jbe	.LBB37_37
# %bb.36:                               #   in Loop: Header=BB37_34 Depth=1
	movq	(%rdx,%rbx), %rdi
	movzwl	%r14w, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbx)
                                        # kill: def $al killed $al def $rax
	movq	16(%r12), %rcx
	jmp	.LBB37_37
.LBB37_25:
	addl	$1, %r14d
	movw	%r14w, 4(%r12)
	xorl	%eax, %eax
.LBB37_38:
	xorb	(%r12), %al
	movb	%al, (%r12)
	movb	6(%r12), %cl
	js	.LBB37_39
.LBB37_41:
	andb	$127, %cl
	movb	%cl, 6(%r12)
	testb	%al, %al
	jne	.LBB37_40
# %bb.42:
	orb	$2, %cl
	jmp	.LBB37_43
.LBB37_32:
	xorl	%eax, %eax
	xorb	(%r12), %al
	movb	%al, (%r12)
	movb	6(%r12), %cl
	jns	.LBB37_41
.LBB37_39:
	orb	$-128, %cl
	movb	%cl, 6(%r12)
.LBB37_40:
	andb	$-3, %cl
.LBB37_43:
	movb	%cl, 6(%r12)
	movl	$5, %eax
	addq	$8, %rsp
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%r12
	.cfi_def_cfa_offset 40
	popq	%r13
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.LBB37_23:
	.cfi_def_cfa_offset 64
	movb	6(%r12), %al
	orb	$1, %al
	jmp	.LBB37_24
.Lfunc_end37:
	.size	SRE_zpg, .Lfunc_end37-SRE_zpg
	.cfi_endproc
                                        # -- End function
	.globl	SRE_zpgx                # -- Begin function SRE_zpgx
	.p2align	4, 0x90
	.type	SRE_zpgx,@function
SRE_zpgx:                               # @SRE_zpgx
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r13
	.cfi_def_cfa_offset 40
	pushq	%r12
	.cfi_def_cfa_offset 48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	pushq	%rax
	.cfi_def_cfa_offset 64
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%rdi, %r13
	movzwl	4(%rdi), %r15d
	movq	16(%rdi), %rcx
	testq	%rcx, %rcx
	je	.LBB38_1
# %bb.2:
	movzwl	%r15w, %r14d
	movl	$24, %ebx
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	jmp	.LBB38_3
	.p2align	4, 0x90
.LBB38_6:                               #   in Loop: Header=BB38_3 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rcx, %rbp
	jae	.LBB38_7
.LBB38_3:                               # =>This Inner Loop Header: Depth=1
	movq	8(%r13), %rdx
	movzwl	-8(%rdx,%rbx), %esi
	cmpw	%si, %r15w
	jb	.LBB38_6
# %bb.4:                                #   in Loop: Header=BB38_3 Depth=1
	movzwl	-6(%rdx,%rbx), %edi
	addl	%esi, %edi
	cmpl	%r14d, %edi
	jbe	.LBB38_6
# %bb.5:                                #   in Loop: Header=BB38_3 Depth=1
	movq	(%rdx,%rbx), %rdi
	movl	%r15d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbx)
                                        # kill: def $al killed $al def $rax
	movq	16(%r13), %rcx
	jmp	.LBB38_6
.LBB38_7:
	movzwl	4(%r13), %r15d
	jmp	.LBB38_8
.LBB38_1:
	xorl	%ecx, %ecx
	xorl	%eax, %eax
.LBB38_8:
	addb	1(%r13), %al
	addl	$1, %r15d
	movw	%r15w, 4(%r13)
	testq	%rcx, %rcx
	je	.LBB38_9
# %bb.11:
	movzbl	%al, %r14d
	movzwl	%r14w, %r15d
	movl	$24, %ebx
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	jmp	.LBB38_12
	.p2align	4, 0x90
.LBB38_15:                              #   in Loop: Header=BB38_12 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rcx, %rbp
	jae	.LBB38_16
.LBB38_12:                              # =>This Inner Loop Header: Depth=1
	movq	8(%r13), %r8
	movzwl	-8(%r8,%rbx), %edx
	cmpw	%r14w, %dx
	ja	.LBB38_15
# %bb.13:                               #   in Loop: Header=BB38_12 Depth=1
	movzwl	-6(%r8,%rbx), %esi
	addl	%edx, %esi
	cmpl	%r15d, %esi
	jbe	.LBB38_15
# %bb.14:                               #   in Loop: Header=BB38_12 Depth=1
	movq	(%r8,%rbx), %rdi
	movl	%r15d, %ecx
	subl	%edx, %ecx
	movzwl	%cx, %esi
	callq	*-24(%r8,%rbx)
                                        # kill: def $al killed $al def $rax
	movq	16(%r13), %rcx
	jmp	.LBB38_15
.LBB38_16:
	movq	%rax, (%rsp)            # 8-byte Spill
	movq	%rax, %r12
                                        # kill: def $r12b killed $r12b killed $r12 def $r12
	shrb	%r12b
	testq	%rcx, %rcx
	je	.LBB38_17
# %bb.18:
	movl	$24, %ebx
	xorl	%ebp, %ebp
	jmp	.LBB38_19
	.p2align	4, 0x90
.LBB38_22:                              #   in Loop: Header=BB38_19 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rcx, %rbp
	jae	.LBB38_23
.LBB38_19:                              # =>This Inner Loop Header: Depth=1
	movq	8(%r13), %rax
	movzwl	-8(%rax,%rbx), %edx
	cmpw	%r14w, %dx
	ja	.LBB38_22
# %bb.20:                               #   in Loop: Header=BB38_19 Depth=1
	movzwl	-6(%rax,%rbx), %esi
	addl	%edx, %esi
	cmpl	%r15d, %esi
	jbe	.LBB38_22
# %bb.21:                               #   in Loop: Header=BB38_19 Depth=1
	movq	(%rax,%rbx), %rdi
	movl	%r15d, %ecx
	subl	%edx, %ecx
	movzwl	%cx, %esi
	movzbl	%r12b, %edx
	callq	*-16(%rax,%rbx)
	movq	16(%r13), %rcx
	jmp	.LBB38_22
.LBB38_9:
	xorl	%ecx, %ecx
	xorl	%r12d, %r12d
	jmp	.LBB38_10
.LBB38_17:
	xorl	%ecx, %ecx
.LBB38_23:
	testb	$1, (%rsp)              # 1-byte Folded Reload
	jne	.LBB38_24
.LBB38_10:
	movb	6(%r13), %al
	andb	$-2, %al
	jmp	.LBB38_25
.LBB38_24:
	movb	6(%r13), %al
	orb	$1, %al
.LBB38_25:
	movb	%al, 6(%r13)
	andb	$124, %al
	leal	2(%rax), %edx
	testb	%r12b, %r12b
	movzbl	%al, %eax
	movzbl	%dl, %edx
	cmovnel	%eax, %edx
	movb	%dl, 6(%r13)
	movzwl	4(%r13), %r14d
	testq	%rcx, %rcx
	je	.LBB38_26
# %bb.27:
	movl	$24, %ebx
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	jmp	.LBB38_28
	.p2align	4, 0x90
.LBB38_31:                              #   in Loop: Header=BB38_28 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rcx, %rbp
	jae	.LBB38_32
.LBB38_28:                              # =>This Inner Loop Header: Depth=1
	movq	8(%r13), %rdx
	movzwl	-8(%rdx,%rbx), %esi
	cmpw	%si, %r14w
	jb	.LBB38_31
# %bb.29:                               #   in Loop: Header=BB38_28 Depth=1
	movzwl	-6(%rdx,%rbx), %edi
	addl	%esi, %edi
	cmpl	%r14d, %edi
	jbe	.LBB38_31
# %bb.30:                               #   in Loop: Header=BB38_28 Depth=1
	movq	(%rdx,%rbx), %rdi
	movl	%r14d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbx)
                                        # kill: def $al killed $al def $rax
	movq	16(%r13), %rcx
	jmp	.LBB38_31
.LBB38_32:
	addb	1(%r13), %al
	addw	$1, 4(%r13)
	testq	%rcx, %rcx
	je	.LBB38_33
# %bb.34:
	movzbl	%al, %r15d
	movzwl	%r15w, %r14d
	movl	$24, %ebx
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	jmp	.LBB38_35
	.p2align	4, 0x90
.LBB38_38:                              #   in Loop: Header=BB38_35 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rcx, %rbp
	jae	.LBB38_39
.LBB38_35:                              # =>This Inner Loop Header: Depth=1
	movq	8(%r13), %rdx
	movzwl	-8(%rdx,%rbx), %esi
	cmpw	%r15w, %si
	ja	.LBB38_38
# %bb.36:                               #   in Loop: Header=BB38_35 Depth=1
	movzwl	-6(%rdx,%rbx), %edi
	addl	%esi, %edi
	cmpl	%r14d, %edi
	jbe	.LBB38_38
# %bb.37:                               #   in Loop: Header=BB38_35 Depth=1
	movq	(%rdx,%rbx), %rdi
	movl	%r14d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbx)
                                        # kill: def $al killed $al def $rax
	movq	16(%r13), %rcx
	jmp	.LBB38_38
.LBB38_26:
	addl	$1, %r14d
	movw	%r14w, 4(%r13)
	xorl	%eax, %eax
.LBB38_39:
	xorb	(%r13), %al
	movb	%al, (%r13)
	movb	6(%r13), %cl
	js	.LBB38_40
.LBB38_42:
	andb	$127, %cl
	movb	%cl, 6(%r13)
	testb	%al, %al
	jne	.LBB38_41
# %bb.43:
	orb	$2, %cl
	jmp	.LBB38_44
.LBB38_33:
	xorl	%eax, %eax
	xorb	(%r13), %al
	movb	%al, (%r13)
	movb	6(%r13), %cl
	jns	.LBB38_42
.LBB38_40:
	orb	$-128, %cl
	movb	%cl, 6(%r13)
.LBB38_41:
	andb	$-3, %cl
.LBB38_44:
	movb	%cl, 6(%r13)
	movl	$6, %eax
	addq	$8, %rsp
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%r12
	.cfi_def_cfa_offset 40
	popq	%r13
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end38:
	.size	SRE_zpgx, .Lfunc_end38-SRE_zpgx
	.cfi_endproc
                                        # -- End function
	.globl	SRE_abss                # -- Begin function SRE_abss
	.p2align	4, 0x90
	.type	SRE_abss,@function
SRE_abss:                               # @SRE_abss
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r13
	.cfi_def_cfa_offset 40
	pushq	%r12
	.cfi_def_cfa_offset 48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	subq	$24, %rsp
	.cfi_def_cfa_offset 80
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%rdi, %r13
	movzwl	4(%rdi), %r12d
	movq	16(%rdi), %rcx
	testq	%rcx, %rcx
	je	.LBB39_12
# %bb.1:
	movzwl	%r12w, %r14d
	movl	$24, %ebx
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	jmp	.LBB39_3
	.p2align	4, 0x90
.LBB39_2:                               #   in Loop: Header=BB39_3 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rcx, %rbp
	jae	.LBB39_6
.LBB39_3:                               # =>This Inner Loop Header: Depth=1
	movq	8(%r13), %rdx
	movzwl	-8(%rdx,%rbx), %esi
	cmpw	%si, %r12w
	jb	.LBB39_2
# %bb.4:                                #   in Loop: Header=BB39_3 Depth=1
	movzwl	-6(%rdx,%rbx), %edi
	addl	%esi, %edi
	cmpl	%r14d, %edi
	jbe	.LBB39_2
# %bb.5:                                #   in Loop: Header=BB39_3 Depth=1
	movq	(%rdx,%rbx), %rdi
	movl	%r12d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbx)
                                        # kill: def $al killed $al def $rax
	movq	16(%r13), %rcx
	jmp	.LBB39_2
.LBB39_6:
	movl	4(%r13), %r12d
	testq	%rcx, %rcx
	je	.LBB39_12
# %bb.7:
	movzbl	%al, %r14d
	addl	$1, %r12d
	movzwl	%r12w, %r15d
	movl	$24, %ebx
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	jmp	.LBB39_9
	.p2align	4, 0x90
.LBB39_8:                               #   in Loop: Header=BB39_9 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rcx, %rbp
	jae	.LBB39_32
.LBB39_9:                               # =>This Inner Loop Header: Depth=1
	movq	8(%r13), %rdx
	movzwl	-8(%rdx,%rbx), %esi
	cmpw	%si, %r12w
	jb	.LBB39_8
# %bb.10:                               #   in Loop: Header=BB39_9 Depth=1
	movzwl	-6(%rdx,%rbx), %edi
	addl	%esi, %edi
	cmpl	%r15d, %edi
	jbe	.LBB39_8
# %bb.11:                               #   in Loop: Header=BB39_9 Depth=1
	movq	(%rdx,%rbx), %rdi
	movl	%r12d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbx)
                                        # kill: def $al killed $al def $rax
	movq	16(%r13), %rcx
	jmp	.LBB39_8
.LBB39_12:
	addl	$2, %r12d
	movw	%r12w, 4(%r13)
.LBB39_13:
	xorl	%ecx, %ecx
	xorl	%ebx, %ebx
.LBB39_14:
	movb	6(%r13), %al
	andb	$-2, %al
.LBB39_15:
	movb	%al, 6(%r13)
	andb	$124, %al
	leal	2(%rax), %edx
	testb	%bl, %bl
	movzbl	%al, %eax
	movzbl	%dl, %edx
	cmovnel	%eax, %edx
	movb	%dl, 6(%r13)
	movzwl	4(%r13), %r12d
	testq	%rcx, %rcx
	je	.LBB39_27
# %bb.16:
	movzwl	%r12w, %r14d
	movl	$24, %ebx
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	jmp	.LBB39_18
	.p2align	4, 0x90
.LBB39_17:                              #   in Loop: Header=BB39_18 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rcx, %rbp
	jae	.LBB39_21
.LBB39_18:                              # =>This Inner Loop Header: Depth=1
	movq	8(%r13), %rdx
	movzwl	-8(%rdx,%rbx), %esi
	cmpw	%si, %r12w
	jb	.LBB39_17
# %bb.19:                               #   in Loop: Header=BB39_18 Depth=1
	movzwl	-6(%rdx,%rbx), %edi
	addl	%esi, %edi
	cmpl	%r14d, %edi
	jbe	.LBB39_17
# %bb.20:                               #   in Loop: Header=BB39_18 Depth=1
	movq	(%rdx,%rbx), %rdi
	movl	%r12d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbx)
                                        # kill: def $al killed $al def $rax
	movq	16(%r13), %rcx
	jmp	.LBB39_17
.LBB39_21:
	movl	4(%r13), %r12d
	testq	%rcx, %rcx
	je	.LBB39_27
# %bb.22:
	movzbl	%al, %r14d
	addl	$1, %r12d
	movzwl	%r12w, %r15d
	movl	$24, %ebx
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	jmp	.LBB39_24
	.p2align	4, 0x90
.LBB39_23:                              #   in Loop: Header=BB39_24 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rcx, %rbp
	jae	.LBB39_38
.LBB39_24:                              # =>This Inner Loop Header: Depth=1
	movq	8(%r13), %rdx
	movzwl	-8(%rdx,%rbx), %esi
	cmpw	%si, %r12w
	jb	.LBB39_23
# %bb.25:                               #   in Loop: Header=BB39_24 Depth=1
	movzwl	-6(%rdx,%rbx), %edi
	addl	%esi, %edi
	cmpl	%r15d, %edi
	jbe	.LBB39_23
# %bb.26:                               #   in Loop: Header=BB39_24 Depth=1
	movq	(%rdx,%rbx), %rdi
	movl	%r12d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbx)
                                        # kill: def $al killed $al def $rax
	movq	16(%r13), %rcx
	jmp	.LBB39_23
.LBB39_27:
	addl	$2, %r12d
	movw	%r12w, 4(%r13)
.LBB39_28:
	xorl	%eax, %eax
.LBB39_29:
	xorb	(%r13), %al
	movb	%al, (%r13)
	movb	6(%r13), %cl
	js	.LBB39_44
# %bb.30:
	andb	$127, %cl
	movb	%cl, 6(%r13)
	testb	%al, %al
	jne	.LBB39_45
# %bb.31:
	orb	$2, %cl
	jmp	.LBB39_46
.LBB39_32:
	addw	$2, 4(%r13)
	testq	%rcx, %rcx
	je	.LBB39_13
# %bb.33:
	movzbl	%al, %eax
	shll	$8, %eax
	movzwl	%r14w, %r14d
	orl	%eax, %r14d
	movzwl	%r14w, %r12d
	movl	$24, %ebx
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	jmp	.LBB39_35
	.p2align	4, 0x90
.LBB39_34:                              #   in Loop: Header=BB39_35 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rcx, %rbp
	jae	.LBB39_47
.LBB39_35:                              # =>This Inner Loop Header: Depth=1
	movq	8(%r13), %r8
	movzwl	-8(%r8,%rbx), %edx
	cmpw	%dx, %r14w
	jb	.LBB39_34
# %bb.36:                               #   in Loop: Header=BB39_35 Depth=1
	movzwl	-6(%r8,%rbx), %esi
	addl	%edx, %esi
	cmpl	%r12d, %esi
	jbe	.LBB39_34
# %bb.37:                               #   in Loop: Header=BB39_35 Depth=1
	movq	(%r8,%rbx), %rdi
	movl	%r14d, %ecx
	subl	%edx, %ecx
	movzwl	%cx, %esi
	callq	*-24(%r8,%rbx)
                                        # kill: def $al killed $al def $rax
	movq	16(%r13), %rcx
	jmp	.LBB39_34
.LBB39_38:
	addw	$2, 4(%r13)
	testq	%rcx, %rcx
	je	.LBB39_28
# %bb.39:
	movzbl	%al, %eax
	shll	$8, %eax
	movzwl	%r14w, %r15d
	orl	%eax, %r15d
	movzwl	%r15w, %r14d
	movl	$24, %ebp
	xorl	%eax, %eax
	xorl	%ebx, %ebx
	jmp	.LBB39_41
	.p2align	4, 0x90
.LBB39_40:                              #   in Loop: Header=BB39_41 Depth=1
	addq	$1, %rbx
	addq	$32, %rbp
	cmpq	%rcx, %rbx
	jae	.LBB39_29
.LBB39_41:                              # =>This Inner Loop Header: Depth=1
	movq	8(%r13), %rdx
	movzwl	-8(%rdx,%rbp), %esi
	cmpw	%si, %r15w
	jb	.LBB39_40
# %bb.42:                               #   in Loop: Header=BB39_41 Depth=1
	movzwl	-6(%rdx,%rbp), %edi
	addl	%esi, %edi
	cmpl	%r14d, %edi
	jbe	.LBB39_40
# %bb.43:                               #   in Loop: Header=BB39_41 Depth=1
	movq	(%rdx,%rbp), %rdi
	movl	%r15d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbp)
                                        # kill: def $al killed $al def $rax
	movq	16(%r13), %rcx
	jmp	.LBB39_40
.LBB39_44:
	orb	$-128, %cl
	movb	%cl, 6(%r13)
.LBB39_45:
	andb	$-3, %cl
.LBB39_46:
	movb	%cl, 6(%r13)
	movl	$6, %eax
	addq	$24, %rsp
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%r12
	.cfi_def_cfa_offset 40
	popq	%r13
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.LBB39_47:
	.cfi_def_cfa_offset 80
	movq	%rax, 16(%rsp)          # 8-byte Spill
	movl	%eax, %ebx
	shrb	%bl
	testq	%rcx, %rcx
	je	.LBB39_54
# %bb.48:
	movl	$24, %r15d
	xorl	%ebp, %ebp
	movzbl	%bl, %eax
	movl	%eax, 12(%rsp)          # 4-byte Spill
	jmp	.LBB39_50
	.p2align	4, 0x90
.LBB39_49:                              #   in Loop: Header=BB39_50 Depth=1
	addq	$1, %rbp
	addq	$32, %r15
	cmpq	%rcx, %rbp
	jae	.LBB39_55
.LBB39_50:                              # =>This Inner Loop Header: Depth=1
	movq	8(%r13), %rax
	movzwl	-8(%rax,%r15), %edx
	cmpw	%dx, %r14w
	jb	.LBB39_49
# %bb.51:                               #   in Loop: Header=BB39_50 Depth=1
	movzwl	-6(%rax,%r15), %esi
	addl	%edx, %esi
	cmpl	%r12d, %esi
	jbe	.LBB39_49
# %bb.52:                               #   in Loop: Header=BB39_50 Depth=1
	movq	(%rax,%r15), %rdi
	movl	%r14d, %ecx
	subl	%edx, %ecx
	movzwl	%cx, %esi
	movl	12(%rsp), %edx          # 4-byte Reload
	callq	*-16(%rax,%r15)
	movq	16(%r13), %rcx
	jmp	.LBB39_49
.LBB39_54:
	xorl	%ecx, %ecx
.LBB39_55:
	testb	$1, 16(%rsp)            # 1-byte Folded Reload
	je	.LBB39_14
# %bb.56:
	movb	6(%r13), %al
	orb	$1, %al
	jmp	.LBB39_15
.Lfunc_end39:
	.size	SRE_abss, .Lfunc_end39-SRE_abss
	.cfi_endproc
                                        # -- End function
	.globl	SRE_absx                # -- Begin function SRE_absx
	.p2align	4, 0x90
	.type	SRE_absx,@function
SRE_absx:                               # @SRE_absx
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r13
	.cfi_def_cfa_offset 40
	pushq	%r12
	.cfi_def_cfa_offset 48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	subq	$24, %rsp
	.cfi_def_cfa_offset 80
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%rdi, %r13
	movzwl	4(%rdi), %r12d
	movq	16(%rdi), %rcx
	testq	%rcx, %rcx
	je	.LBB40_13
# %bb.1:
	movzwl	%r12w, %r14d
	movl	$24, %ebx
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	jmp	.LBB40_3
	.p2align	4, 0x90
.LBB40_2:                               #   in Loop: Header=BB40_3 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rcx, %rbp
	jae	.LBB40_6
.LBB40_3:                               # =>This Inner Loop Header: Depth=1
	movq	8(%r13), %rdx
	movzwl	-8(%rdx,%rbx), %esi
	cmpw	%si, %r12w
	jb	.LBB40_2
# %bb.4:                                #   in Loop: Header=BB40_3 Depth=1
	movzwl	-6(%rdx,%rbx), %edi
	addl	%esi, %edi
	cmpl	%r14d, %edi
	jbe	.LBB40_2
# %bb.5:                                #   in Loop: Header=BB40_3 Depth=1
	movq	(%rdx,%rbx), %rdi
	movl	%r12d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbx)
                                        # kill: def $al killed $al def $rax
	movq	16(%r13), %rcx
	jmp	.LBB40_2
.LBB40_6:
	movzbl	%al, %r14d
	movl	4(%r13), %r12d
	testq	%rcx, %rcx
	je	.LBB40_14
# %bb.7:
	addl	$1, %r12d
	movzwl	%r12w, %r15d
	movl	$24, %ebx
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	jmp	.LBB40_9
	.p2align	4, 0x90
.LBB40_8:                               #   in Loop: Header=BB40_9 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rcx, %rbp
	jae	.LBB40_12
.LBB40_9:                               # =>This Inner Loop Header: Depth=1
	movq	8(%r13), %rdx
	movzwl	-8(%rdx,%rbx), %esi
	cmpw	%si, %r12w
	jb	.LBB40_8
# %bb.10:                               #   in Loop: Header=BB40_9 Depth=1
	movzwl	-6(%rdx,%rbx), %edi
	addl	%esi, %edi
	cmpl	%r15d, %edi
	jbe	.LBB40_8
# %bb.11:                               #   in Loop: Header=BB40_9 Depth=1
	movq	(%rdx,%rbx), %rdi
	movl	%r12d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbx)
                                        # kill: def $al killed $al def $rax
	movq	16(%r13), %rcx
	jmp	.LBB40_8
.LBB40_12:
	movzwl	4(%r13), %r12d
	jmp	.LBB40_16
.LBB40_13:
	xorl	%ecx, %ecx
	xorl	%r14d, %r14d
	jmp	.LBB40_15
.LBB40_14:
	xorl	%ecx, %ecx
.LBB40_15:
	xorl	%eax, %eax
.LBB40_16:
	movzbl	1(%r13), %edx
	addl	$2, %r12d
	movw	%r12w, 4(%r13)
	testq	%rcx, %rcx
	je	.LBB40_28
# %bb.17:
	movzbl	%al, %eax
	shll	$8, %eax
	movzwl	%r14w, %r15d
	orl	%eax, %r15d
	addl	%edx, %r15d
	movzwl	%r15w, %r12d
	movl	$24, %ebx
	xorl	%r14d, %r14d
	xorl	%ebp, %ebp
	jmp	.LBB40_19
	.p2align	4, 0x90
.LBB40_18:                              #   in Loop: Header=BB40_19 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rcx, %rbp
	jae	.LBB40_22
.LBB40_19:                              # =>This Inner Loop Header: Depth=1
	movq	8(%r13), %rdx
	movzwl	-8(%rdx,%rbx), %eax
	cmpw	%ax, %r15w
	jb	.LBB40_18
# %bb.20:                               #   in Loop: Header=BB40_19 Depth=1
	movzwl	-6(%rdx,%rbx), %esi
	addl	%eax, %esi
	cmpl	%r12d, %esi
	jbe	.LBB40_18
# %bb.21:                               #   in Loop: Header=BB40_19 Depth=1
	movq	(%rdx,%rbx), %rdi
	movl	%r15d, %ecx
	subl	%eax, %ecx
	movzwl	%cx, %esi
	callq	*-24(%rdx,%rbx)
	movl	%eax, %r14d
	movq	16(%r13), %rcx
	jmp	.LBB40_18
.LBB40_22:
	movl	%r14d, %eax
	shrb	%al
	testq	%rcx, %rcx
	movq	%rax, 16(%rsp)          # 8-byte Spill
	je	.LBB40_29
# %bb.23:
	movl	$24, %ebx
	xorl	%ebp, %ebp
	movzbl	%al, %eax
	movl	%eax, 12(%rsp)          # 4-byte Spill
	jmp	.LBB40_25
	.p2align	4, 0x90
.LBB40_24:                              #   in Loop: Header=BB40_25 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rcx, %rbp
	jae	.LBB40_30
.LBB40_25:                              # =>This Inner Loop Header: Depth=1
	movq	8(%r13), %rax
	movzwl	-8(%rax,%rbx), %edx
	cmpw	%dx, %r15w
	jb	.LBB40_24
# %bb.26:                               #   in Loop: Header=BB40_25 Depth=1
	movzwl	-6(%rax,%rbx), %esi
	addl	%edx, %esi
	cmpl	%r12d, %esi
	jbe	.LBB40_24
# %bb.27:                               #   in Loop: Header=BB40_25 Depth=1
	movq	(%rax,%rbx), %rdi
	movl	%r15d, %ecx
	subl	%edx, %ecx
	movzwl	%cx, %esi
	movl	12(%rsp), %edx          # 4-byte Reload
	callq	*-16(%rax,%rbx)
	movq	16(%r13), %rcx
	jmp	.LBB40_24
.LBB40_28:
	xorl	%ecx, %ecx
	xorl	%esi, %esi
	jmp	.LBB40_32
.LBB40_29:
	xorl	%ecx, %ecx
.LBB40_30:
	testb	$1, %r14b
	jne	.LBB40_33
# %bb.31:
	movq	16(%rsp), %rsi          # 8-byte Reload
.LBB40_32:
	movb	6(%r13), %al
	andb	$-2, %al
	movb	%al, 6(%r13)
	jmp	.LBB40_34
.LBB40_33:
	movb	6(%r13), %al
	orb	$1, %al
	movb	%al, 6(%r13)
	movq	16(%rsp), %rsi          # 8-byte Reload
.LBB40_34:
	andb	$124, %al
	leal	2(%rax), %edx
	testb	%sil, %sil
	movzbl	%al, %eax
	movzbl	%dl, %edx
	cmovnel	%eax, %edx
	movb	%dl, 6(%r13)
	movzwl	4(%r13), %r12d
	testq	%rcx, %rcx
	je	.LBB40_47
# %bb.35:
	movzwl	%r12w, %r14d
	movl	$24, %ebx
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	jmp	.LBB40_37
	.p2align	4, 0x90
.LBB40_36:                              #   in Loop: Header=BB40_37 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rcx, %rbp
	jae	.LBB40_40
.LBB40_37:                              # =>This Inner Loop Header: Depth=1
	movq	8(%r13), %rdx
	movzwl	-8(%rdx,%rbx), %esi
	cmpw	%si, %r12w
	jb	.LBB40_36
# %bb.38:                               #   in Loop: Header=BB40_37 Depth=1
	movzwl	-6(%rdx,%rbx), %edi
	addl	%esi, %edi
	cmpl	%r14d, %edi
	jbe	.LBB40_36
# %bb.39:                               #   in Loop: Header=BB40_37 Depth=1
	movq	(%rdx,%rbx), %rdi
	movl	%r12d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbx)
                                        # kill: def $al killed $al def $rax
	movq	16(%r13), %rcx
	jmp	.LBB40_36
.LBB40_40:
	movzbl	%al, %r14d
	movl	4(%r13), %r12d
	testq	%rcx, %rcx
	je	.LBB40_48
# %bb.41:
	addl	$1, %r12d
	movzwl	%r12w, %r15d
	movl	$24, %ebx
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	jmp	.LBB40_43
	.p2align	4, 0x90
.LBB40_42:                              #   in Loop: Header=BB40_43 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rcx, %rbp
	jae	.LBB40_46
.LBB40_43:                              # =>This Inner Loop Header: Depth=1
	movq	8(%r13), %rdx
	movzwl	-8(%rdx,%rbx), %esi
	cmpw	%si, %r12w
	jb	.LBB40_42
# %bb.44:                               #   in Loop: Header=BB40_43 Depth=1
	movzwl	-6(%rdx,%rbx), %edi
	addl	%esi, %edi
	cmpl	%r15d, %edi
	jbe	.LBB40_42
# %bb.45:                               #   in Loop: Header=BB40_43 Depth=1
	movq	(%rdx,%rbx), %rdi
	movl	%r12d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbx)
                                        # kill: def $al killed $al def $rax
	movq	16(%r13), %rcx
	jmp	.LBB40_42
.LBB40_46:
	movzwl	4(%r13), %r12d
	jmp	.LBB40_50
.LBB40_47:
	xorl	%ecx, %ecx
	xorl	%r14d, %r14d
	jmp	.LBB40_49
.LBB40_48:
	xorl	%ecx, %ecx
.LBB40_49:
	xorl	%eax, %eax
.LBB40_50:
	movzbl	1(%r13), %edx
	addl	$2, %r12d
	movw	%r12w, 4(%r13)
	testq	%rcx, %rcx
	je	.LBB40_56
# %bb.51:
	movzbl	%al, %eax
	shll	$8, %eax
	movzwl	%r14w, %r15d
	orl	%eax, %r15d
	addl	%edx, %r15d
	movzwl	%r15w, %r14d
	movl	$24, %ebx
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	jmp	.LBB40_53
	.p2align	4, 0x90
.LBB40_52:                              #   in Loop: Header=BB40_53 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rcx, %rbp
	jae	.LBB40_57
.LBB40_53:                              # =>This Inner Loop Header: Depth=1
	movq	8(%r13), %rdx
	movzwl	-8(%rdx,%rbx), %esi
	cmpw	%si, %r15w
	jb	.LBB40_52
# %bb.54:                               #   in Loop: Header=BB40_53 Depth=1
	movzwl	-6(%rdx,%rbx), %edi
	addl	%esi, %edi
	cmpl	%r14d, %edi
	jbe	.LBB40_52
# %bb.55:                               #   in Loop: Header=BB40_53 Depth=1
	movq	(%rdx,%rbx), %rdi
	movl	%r15d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbx)
                                        # kill: def $al killed $al def $rax
	movq	16(%r13), %rcx
	jmp	.LBB40_52
.LBB40_56:
	xorl	%eax, %eax
.LBB40_57:
	xorb	(%r13), %al
	movb	%al, (%r13)
	movb	6(%r13), %cl
	js	.LBB40_60
# %bb.58:
	andb	$127, %cl
	movb	%cl, 6(%r13)
	testb	%al, %al
	jne	.LBB40_61
# %bb.59:
	orb	$2, %cl
	jmp	.LBB40_62
.LBB40_60:
	orb	$-128, %cl
	movb	%cl, 6(%r13)
.LBB40_61:
	andb	$-3, %cl
.LBB40_62:
	movb	%cl, 6(%r13)
	movl	$7, %eax
	addq	$24, %rsp
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%r12
	.cfi_def_cfa_offset 40
	popq	%r13
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end40:
	.size	SRE_absx, .Lfunc_end40-SRE_absx
	.cfi_endproc
                                        # -- End function
	.globl	SRE_absy                # -- Begin function SRE_absy
	.p2align	4, 0x90
	.type	SRE_absy,@function
SRE_absy:                               # @SRE_absy
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r13
	.cfi_def_cfa_offset 40
	pushq	%r12
	.cfi_def_cfa_offset 48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	subq	$24, %rsp
	.cfi_def_cfa_offset 80
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%rdi, %r13
	movzwl	4(%rdi), %r12d
	movq	16(%rdi), %rcx
	testq	%rcx, %rcx
	je	.LBB41_13
# %bb.1:
	movzwl	%r12w, %r14d
	movl	$24, %ebx
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	jmp	.LBB41_3
	.p2align	4, 0x90
.LBB41_2:                               #   in Loop: Header=BB41_3 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rcx, %rbp
	jae	.LBB41_6
.LBB41_3:                               # =>This Inner Loop Header: Depth=1
	movq	8(%r13), %rdx
	movzwl	-8(%rdx,%rbx), %esi
	cmpw	%si, %r12w
	jb	.LBB41_2
# %bb.4:                                #   in Loop: Header=BB41_3 Depth=1
	movzwl	-6(%rdx,%rbx), %edi
	addl	%esi, %edi
	cmpl	%r14d, %edi
	jbe	.LBB41_2
# %bb.5:                                #   in Loop: Header=BB41_3 Depth=1
	movq	(%rdx,%rbx), %rdi
	movl	%r12d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbx)
                                        # kill: def $al killed $al def $rax
	movq	16(%r13), %rcx
	jmp	.LBB41_2
.LBB41_6:
	movzbl	%al, %r14d
	movl	4(%r13), %r12d
	testq	%rcx, %rcx
	je	.LBB41_14
# %bb.7:
	addl	$1, %r12d
	movzwl	%r12w, %r15d
	movl	$24, %ebx
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	jmp	.LBB41_9
	.p2align	4, 0x90
.LBB41_8:                               #   in Loop: Header=BB41_9 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rcx, %rbp
	jae	.LBB41_12
.LBB41_9:                               # =>This Inner Loop Header: Depth=1
	movq	8(%r13), %rdx
	movzwl	-8(%rdx,%rbx), %esi
	cmpw	%si, %r12w
	jb	.LBB41_8
# %bb.10:                               #   in Loop: Header=BB41_9 Depth=1
	movzwl	-6(%rdx,%rbx), %edi
	addl	%esi, %edi
	cmpl	%r15d, %edi
	jbe	.LBB41_8
# %bb.11:                               #   in Loop: Header=BB41_9 Depth=1
	movq	(%rdx,%rbx), %rdi
	movl	%r12d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbx)
                                        # kill: def $al killed $al def $rax
	movq	16(%r13), %rcx
	jmp	.LBB41_8
.LBB41_12:
	movzwl	4(%r13), %r12d
	jmp	.LBB41_16
.LBB41_13:
	xorl	%ecx, %ecx
	xorl	%r14d, %r14d
	jmp	.LBB41_15
.LBB41_14:
	xorl	%ecx, %ecx
.LBB41_15:
	xorl	%eax, %eax
.LBB41_16:
	movzbl	2(%r13), %edx
	addl	$2, %r12d
	movw	%r12w, 4(%r13)
	testq	%rcx, %rcx
	je	.LBB41_28
# %bb.17:
	movzbl	%al, %eax
	shll	$8, %eax
	movzwl	%r14w, %r15d
	orl	%eax, %r15d
	addl	%edx, %r15d
	movzwl	%r15w, %r12d
	movl	$24, %ebx
	xorl	%r14d, %r14d
	xorl	%ebp, %ebp
	jmp	.LBB41_19
	.p2align	4, 0x90
.LBB41_18:                              #   in Loop: Header=BB41_19 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rcx, %rbp
	jae	.LBB41_22
.LBB41_19:                              # =>This Inner Loop Header: Depth=1
	movq	8(%r13), %rdx
	movzwl	-8(%rdx,%rbx), %eax
	cmpw	%ax, %r15w
	jb	.LBB41_18
# %bb.20:                               #   in Loop: Header=BB41_19 Depth=1
	movzwl	-6(%rdx,%rbx), %esi
	addl	%eax, %esi
	cmpl	%r12d, %esi
	jbe	.LBB41_18
# %bb.21:                               #   in Loop: Header=BB41_19 Depth=1
	movq	(%rdx,%rbx), %rdi
	movl	%r15d, %ecx
	subl	%eax, %ecx
	movzwl	%cx, %esi
	callq	*-24(%rdx,%rbx)
	movl	%eax, %r14d
	movq	16(%r13), %rcx
	jmp	.LBB41_18
.LBB41_22:
	movl	%r14d, %eax
	shrb	%al
	testq	%rcx, %rcx
	movq	%rax, 16(%rsp)          # 8-byte Spill
	je	.LBB41_29
# %bb.23:
	movl	$24, %ebx
	xorl	%ebp, %ebp
	movzbl	%al, %eax
	movl	%eax, 12(%rsp)          # 4-byte Spill
	jmp	.LBB41_25
	.p2align	4, 0x90
.LBB41_24:                              #   in Loop: Header=BB41_25 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rcx, %rbp
	jae	.LBB41_30
.LBB41_25:                              # =>This Inner Loop Header: Depth=1
	movq	8(%r13), %rax
	movzwl	-8(%rax,%rbx), %edx
	cmpw	%dx, %r15w
	jb	.LBB41_24
# %bb.26:                               #   in Loop: Header=BB41_25 Depth=1
	movzwl	-6(%rax,%rbx), %esi
	addl	%edx, %esi
	cmpl	%r12d, %esi
	jbe	.LBB41_24
# %bb.27:                               #   in Loop: Header=BB41_25 Depth=1
	movq	(%rax,%rbx), %rdi
	movl	%r15d, %ecx
	subl	%edx, %ecx
	movzwl	%cx, %esi
	movl	12(%rsp), %edx          # 4-byte Reload
	callq	*-16(%rax,%rbx)
	movq	16(%r13), %rcx
	jmp	.LBB41_24
.LBB41_28:
	xorl	%ecx, %ecx
	xorl	%esi, %esi
	jmp	.LBB41_32
.LBB41_29:
	xorl	%ecx, %ecx
.LBB41_30:
	testb	$1, %r14b
	jne	.LBB41_33
# %bb.31:
	movq	16(%rsp), %rsi          # 8-byte Reload
.LBB41_32:
	movb	6(%r13), %al
	andb	$-2, %al
	movb	%al, 6(%r13)
	jmp	.LBB41_34
.LBB41_33:
	movb	6(%r13), %al
	orb	$1, %al
	movb	%al, 6(%r13)
	movq	16(%rsp), %rsi          # 8-byte Reload
.LBB41_34:
	andb	$124, %al
	leal	2(%rax), %edx
	testb	%sil, %sil
	movzbl	%al, %eax
	movzbl	%dl, %edx
	cmovnel	%eax, %edx
	movb	%dl, 6(%r13)
	movzwl	4(%r13), %r12d
	testq	%rcx, %rcx
	je	.LBB41_47
# %bb.35:
	movzwl	%r12w, %r14d
	movl	$24, %ebx
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	jmp	.LBB41_37
	.p2align	4, 0x90
.LBB41_36:                              #   in Loop: Header=BB41_37 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rcx, %rbp
	jae	.LBB41_40
.LBB41_37:                              # =>This Inner Loop Header: Depth=1
	movq	8(%r13), %rdx
	movzwl	-8(%rdx,%rbx), %esi
	cmpw	%si, %r12w
	jb	.LBB41_36
# %bb.38:                               #   in Loop: Header=BB41_37 Depth=1
	movzwl	-6(%rdx,%rbx), %edi
	addl	%esi, %edi
	cmpl	%r14d, %edi
	jbe	.LBB41_36
# %bb.39:                               #   in Loop: Header=BB41_37 Depth=1
	movq	(%rdx,%rbx), %rdi
	movl	%r12d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbx)
                                        # kill: def $al killed $al def $rax
	movq	16(%r13), %rcx
	jmp	.LBB41_36
.LBB41_40:
	movzbl	%al, %r14d
	movl	4(%r13), %r12d
	testq	%rcx, %rcx
	je	.LBB41_48
# %bb.41:
	addl	$1, %r12d
	movzwl	%r12w, %r15d
	movl	$24, %ebx
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	jmp	.LBB41_43
	.p2align	4, 0x90
.LBB41_42:                              #   in Loop: Header=BB41_43 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rcx, %rbp
	jae	.LBB41_46
.LBB41_43:                              # =>This Inner Loop Header: Depth=1
	movq	8(%r13), %rdx
	movzwl	-8(%rdx,%rbx), %esi
	cmpw	%si, %r12w
	jb	.LBB41_42
# %bb.44:                               #   in Loop: Header=BB41_43 Depth=1
	movzwl	-6(%rdx,%rbx), %edi
	addl	%esi, %edi
	cmpl	%r15d, %edi
	jbe	.LBB41_42
# %bb.45:                               #   in Loop: Header=BB41_43 Depth=1
	movq	(%rdx,%rbx), %rdi
	movl	%r12d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbx)
                                        # kill: def $al killed $al def $rax
	movq	16(%r13), %rcx
	jmp	.LBB41_42
.LBB41_46:
	movzwl	4(%r13), %r12d
	jmp	.LBB41_50
.LBB41_47:
	xorl	%ecx, %ecx
	xorl	%r14d, %r14d
	jmp	.LBB41_49
.LBB41_48:
	xorl	%ecx, %ecx
.LBB41_49:
	xorl	%eax, %eax
.LBB41_50:
	movzbl	2(%r13), %edx
	addl	$2, %r12d
	movw	%r12w, 4(%r13)
	testq	%rcx, %rcx
	je	.LBB41_56
# %bb.51:
	movzbl	%al, %eax
	shll	$8, %eax
	movzwl	%r14w, %r15d
	orl	%eax, %r15d
	addl	%edx, %r15d
	movzwl	%r15w, %r14d
	movl	$24, %ebx
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	jmp	.LBB41_53
	.p2align	4, 0x90
.LBB41_52:                              #   in Loop: Header=BB41_53 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rcx, %rbp
	jae	.LBB41_57
.LBB41_53:                              # =>This Inner Loop Header: Depth=1
	movq	8(%r13), %rdx
	movzwl	-8(%rdx,%rbx), %esi
	cmpw	%si, %r15w
	jb	.LBB41_52
# %bb.54:                               #   in Loop: Header=BB41_53 Depth=1
	movzwl	-6(%rdx,%rbx), %edi
	addl	%esi, %edi
	cmpl	%r14d, %edi
	jbe	.LBB41_52
# %bb.55:                               #   in Loop: Header=BB41_53 Depth=1
	movq	(%rdx,%rbx), %rdi
	movl	%r15d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbx)
                                        # kill: def $al killed $al def $rax
	movq	16(%r13), %rcx
	jmp	.LBB41_52
.LBB41_56:
	xorl	%eax, %eax
.LBB41_57:
	xorb	(%r13), %al
	movb	%al, (%r13)
	movb	6(%r13), %cl
	js	.LBB41_60
# %bb.58:
	andb	$127, %cl
	movb	%cl, 6(%r13)
	testb	%al, %al
	jne	.LBB41_61
# %bb.59:
	orb	$2, %cl
	jmp	.LBB41_62
.LBB41_60:
	orb	$-128, %cl
	movb	%cl, 6(%r13)
.LBB41_61:
	andb	$-3, %cl
.LBB41_62:
	movb	%cl, 6(%r13)
	movl	$7, %eax
	addq	$24, %rsp
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%r12
	.cfi_def_cfa_offset 40
	popq	%r13
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end41:
	.size	SRE_absy, .Lfunc_end41-SRE_absy
	.cfi_endproc
                                        # -- End function
	.globl	SRE_xind                # -- Begin function SRE_xind
	.p2align	4, 0x90
	.type	SRE_xind,@function
SRE_xind:                               # @SRE_xind
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r13
	.cfi_def_cfa_offset 40
	pushq	%r12
	.cfi_def_cfa_offset 48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	pushq	%rax
	.cfi_def_cfa_offset 64
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%rdi, %r12
	callq	xind
	movl	%eax, %r13d
	movq	16(%r12), %rax
	testq	%rax, %rax
	je	.LBB42_1
# %bb.2:
	movzwl	%r13w, %r15d
	movl	$24, %ebp
	xorl	%r14d, %r14d
	xorl	%ebx, %ebx
	jmp	.LBB42_3
	.p2align	4, 0x90
.LBB42_6:                               #   in Loop: Header=BB42_3 Depth=1
	addq	$1, %rbx
	addq	$32, %rbp
	cmpq	%rax, %rbx
	jae	.LBB42_7
.LBB42_3:                               # =>This Inner Loop Header: Depth=1
	movq	8(%r12), %rcx
	movzwl	-8(%rcx,%rbp), %edx
	cmpw	%dx, %r13w
	jb	.LBB42_6
# %bb.4:                                #   in Loop: Header=BB42_3 Depth=1
	movzwl	-6(%rcx,%rbp), %esi
	addl	%edx, %esi
	cmpl	%r15d, %esi
	jbe	.LBB42_6
# %bb.5:                                #   in Loop: Header=BB42_3 Depth=1
	movq	(%rcx,%rbp), %rdi
	movl	%r15d, %eax
	subl	%edx, %eax
	movzwl	%ax, %esi
	callq	*-24(%rcx,%rbp)
	movl	%eax, %r14d
	movq	16(%r12), %rax
	jmp	.LBB42_6
.LBB42_7:
	movl	%r14d, %ecx
	shrb	%cl
	movl	%ecx, (%rsp)            # 4-byte Spill
	testq	%rax, %rax
	je	.LBB42_13
# %bb.8:
	movl	$24, %ebp
	xorl	%ebx, %ebx
	movzbl	(%rsp), %ecx            # 1-byte Folded Reload
	movl	%ecx, 4(%rsp)           # 4-byte Spill
	jmp	.LBB42_9
	.p2align	4, 0x90
.LBB42_12:                              #   in Loop: Header=BB42_9 Depth=1
	addq	$1, %rbx
	addq	$32, %rbp
	cmpq	%rax, %rbx
	jae	.LBB42_13
.LBB42_9:                               # =>This Inner Loop Header: Depth=1
	movq	8(%r12), %rcx
	movzwl	-8(%rcx,%rbp), %edx
	cmpw	%dx, %r13w
	jb	.LBB42_12
# %bb.10:                               #   in Loop: Header=BB42_9 Depth=1
	movzwl	-6(%rcx,%rbp), %esi
	addl	%edx, %esi
	cmpl	%r15d, %esi
	jbe	.LBB42_12
# %bb.11:                               #   in Loop: Header=BB42_9 Depth=1
	movq	(%rcx,%rbp), %rdi
	movl	%r13d, %eax
	subl	%edx, %eax
	movzwl	%ax, %esi
	movl	4(%rsp), %edx           # 4-byte Reload
	callq	*-16(%rcx,%rbp)
	movq	16(%r12), %rax
	jmp	.LBB42_12
.LBB42_13:
	testb	$1, %r14b
	jne	.LBB42_29
# %bb.14:
	movl	(%rsp), %edx            # 4-byte Reload
	jmp	.LBB42_15
.LBB42_1:
	xorl	%edx, %edx
.LBB42_15:
	movb	6(%r12), %al
	andb	$-2, %al
	movb	%al, 6(%r12)
	jmp	.LBB42_16
.LBB42_29:
	movb	6(%r12), %al
	orb	$1, %al
	movb	%al, 6(%r12)
	movl	(%rsp), %edx            # 4-byte Reload
.LBB42_16:
	andb	$124, %al
	leal	2(%rax), %ecx
	testb	%dl, %dl
	movzbl	%al, %eax
	movzbl	%cl, %ecx
	cmovnel	%eax, %ecx
	movb	%cl, 6(%r12)
	movq	%r12, %rdi
	callq	xind
	movq	16(%r12), %rcx
	testq	%rcx, %rcx
	je	.LBB42_17
# %bb.18:
	movl	%eax, %r15d
	movzwl	%ax, %r14d
	movl	$24, %ebp
	xorl	%eax, %eax
	xorl	%ebx, %ebx
	jmp	.LBB42_19
	.p2align	4, 0x90
.LBB42_22:                              #   in Loop: Header=BB42_19 Depth=1
	addq	$1, %rbx
	addq	$32, %rbp
	cmpq	%rcx, %rbx
	jae	.LBB42_23
.LBB42_19:                              # =>This Inner Loop Header: Depth=1
	movq	8(%r12), %rdx
	movzwl	-8(%rdx,%rbp), %esi
	cmpw	%si, %r15w
	jb	.LBB42_22
# %bb.20:                               #   in Loop: Header=BB42_19 Depth=1
	movzwl	-6(%rdx,%rbp), %edi
	addl	%esi, %edi
	cmpl	%r14d, %edi
	jbe	.LBB42_22
# %bb.21:                               #   in Loop: Header=BB42_19 Depth=1
	movq	(%rdx,%rbp), %rdi
	movl	%r14d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbp)
                                        # kill: def $al killed $al def $rax
	movq	16(%r12), %rcx
	jmp	.LBB42_22
.LBB42_17:
	xorl	%eax, %eax
.LBB42_23:
	xorb	(%r12), %al
	movb	%al, (%r12)
	movb	6(%r12), %cl
	js	.LBB42_24
# %bb.26:
	andb	$127, %cl
	movb	%cl, 6(%r12)
	testb	%al, %al
	jne	.LBB42_25
# %bb.27:
	orb	$2, %cl
	jmp	.LBB42_28
.LBB42_24:
	orb	$-128, %cl
	movb	%cl, 6(%r12)
.LBB42_25:
	andb	$-3, %cl
.LBB42_28:
	movb	%cl, 6(%r12)
	movl	$8, %eax
	addq	$8, %rsp
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%r12
	.cfi_def_cfa_offset 40
	popq	%r13
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end42:
	.size	SRE_xind, .Lfunc_end42-SRE_xind
	.cfi_endproc
                                        # -- End function
	.globl	SRE_indy                # -- Begin function SRE_indy
	.p2align	4, 0x90
	.type	SRE_indy,@function
SRE_indy:                               # @SRE_indy
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r13
	.cfi_def_cfa_offset 40
	pushq	%r12
	.cfi_def_cfa_offset 48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	pushq	%rax
	.cfi_def_cfa_offset 64
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%rdi, %r12
	callq	indy
	movl	%eax, %r13d
	movq	16(%r12), %rax
	testq	%rax, %rax
	je	.LBB43_1
# %bb.2:
	movzwl	%r13w, %r15d
	movl	$24, %ebp
	xorl	%r14d, %r14d
	xorl	%ebx, %ebx
	jmp	.LBB43_3
	.p2align	4, 0x90
.LBB43_6:                               #   in Loop: Header=BB43_3 Depth=1
	addq	$1, %rbx
	addq	$32, %rbp
	cmpq	%rax, %rbx
	jae	.LBB43_7
.LBB43_3:                               # =>This Inner Loop Header: Depth=1
	movq	8(%r12), %rcx
	movzwl	-8(%rcx,%rbp), %edx
	cmpw	%dx, %r13w
	jb	.LBB43_6
# %bb.4:                                #   in Loop: Header=BB43_3 Depth=1
	movzwl	-6(%rcx,%rbp), %esi
	addl	%edx, %esi
	cmpl	%r15d, %esi
	jbe	.LBB43_6
# %bb.5:                                #   in Loop: Header=BB43_3 Depth=1
	movq	(%rcx,%rbp), %rdi
	movl	%r15d, %eax
	subl	%edx, %eax
	movzwl	%ax, %esi
	callq	*-24(%rcx,%rbp)
	movl	%eax, %r14d
	movq	16(%r12), %rax
	jmp	.LBB43_6
.LBB43_7:
	movl	%r14d, %ecx
	shrb	%cl
	movl	%ecx, (%rsp)            # 4-byte Spill
	testq	%rax, %rax
	je	.LBB43_13
# %bb.8:
	movl	$24, %ebp
	xorl	%ebx, %ebx
	movzbl	(%rsp), %ecx            # 1-byte Folded Reload
	movl	%ecx, 4(%rsp)           # 4-byte Spill
	jmp	.LBB43_9
	.p2align	4, 0x90
.LBB43_12:                              #   in Loop: Header=BB43_9 Depth=1
	addq	$1, %rbx
	addq	$32, %rbp
	cmpq	%rax, %rbx
	jae	.LBB43_13
.LBB43_9:                               # =>This Inner Loop Header: Depth=1
	movq	8(%r12), %rcx
	movzwl	-8(%rcx,%rbp), %edx
	cmpw	%dx, %r13w
	jb	.LBB43_12
# %bb.10:                               #   in Loop: Header=BB43_9 Depth=1
	movzwl	-6(%rcx,%rbp), %esi
	addl	%edx, %esi
	cmpl	%r15d, %esi
	jbe	.LBB43_12
# %bb.11:                               #   in Loop: Header=BB43_9 Depth=1
	movq	(%rcx,%rbp), %rdi
	movl	%r13d, %eax
	subl	%edx, %eax
	movzwl	%ax, %esi
	movl	4(%rsp), %edx           # 4-byte Reload
	callq	*-16(%rcx,%rbp)
	movq	16(%r12), %rax
	jmp	.LBB43_12
.LBB43_13:
	testb	$1, %r14b
	jne	.LBB43_29
# %bb.14:
	movl	(%rsp), %edx            # 4-byte Reload
	jmp	.LBB43_15
.LBB43_1:
	xorl	%edx, %edx
.LBB43_15:
	movb	6(%r12), %al
	andb	$-2, %al
	movb	%al, 6(%r12)
	jmp	.LBB43_16
.LBB43_29:
	movb	6(%r12), %al
	orb	$1, %al
	movb	%al, 6(%r12)
	movl	(%rsp), %edx            # 4-byte Reload
.LBB43_16:
	andb	$124, %al
	leal	2(%rax), %ecx
	testb	%dl, %dl
	movzbl	%al, %eax
	movzbl	%cl, %ecx
	cmovnel	%eax, %ecx
	movb	%cl, 6(%r12)
	movq	%r12, %rdi
	callq	indy
	movq	16(%r12), %rcx
	testq	%rcx, %rcx
	je	.LBB43_17
# %bb.18:
	movl	%eax, %r15d
	movzwl	%ax, %r14d
	movl	$24, %ebp
	xorl	%eax, %eax
	xorl	%ebx, %ebx
	jmp	.LBB43_19
	.p2align	4, 0x90
.LBB43_22:                              #   in Loop: Header=BB43_19 Depth=1
	addq	$1, %rbx
	addq	$32, %rbp
	cmpq	%rcx, %rbx
	jae	.LBB43_23
.LBB43_19:                              # =>This Inner Loop Header: Depth=1
	movq	8(%r12), %rdx
	movzwl	-8(%rdx,%rbp), %esi
	cmpw	%si, %r15w
	jb	.LBB43_22
# %bb.20:                               #   in Loop: Header=BB43_19 Depth=1
	movzwl	-6(%rdx,%rbp), %edi
	addl	%esi, %edi
	cmpl	%r14d, %edi
	jbe	.LBB43_22
# %bb.21:                               #   in Loop: Header=BB43_19 Depth=1
	movq	(%rdx,%rbp), %rdi
	movl	%r14d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbp)
                                        # kill: def $al killed $al def $rax
	movq	16(%r12), %rcx
	jmp	.LBB43_22
.LBB43_17:
	xorl	%eax, %eax
.LBB43_23:
	xorb	(%r12), %al
	movb	%al, (%r12)
	movb	6(%r12), %cl
	js	.LBB43_24
# %bb.26:
	andb	$127, %cl
	movb	%cl, 6(%r12)
	testb	%al, %al
	jne	.LBB43_25
# %bb.27:
	orb	$2, %cl
	jmp	.LBB43_28
.LBB43_24:
	orb	$-128, %cl
	movb	%cl, 6(%r12)
.LBB43_25:
	andb	$-3, %cl
.LBB43_28:
	movb	%cl, 6(%r12)
	movl	$8, %eax
	addq	$8, %rsp
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%r12
	.cfi_def_cfa_offset 40
	popq	%r13
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end43:
	.size	SRE_indy, .Lfunc_end43-SRE_indy
	.cfi_endproc
                                        # -- End function
	.globl	JSR                     # -- Begin function JSR
	.p2align	4, 0x90
	.type	JSR,@function
JSR:                                    # @JSR
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r13
	.cfi_def_cfa_offset 40
	pushq	%r12
	.cfi_def_cfa_offset 48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	pushq	%rax
	.cfi_def_cfa_offset 64
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%rdi, %r13
	movzwl	4(%rdi), %r15d
	movq	16(%rdi), %rcx
	testq	%rcx, %rcx
	je	.LBB44_13
# %bb.1:
	movzwl	%r15w, %r14d
	movl	$24, %ebp
	xorl	%eax, %eax
	xorl	%ebx, %ebx
	jmp	.LBB44_3
	.p2align	4, 0x90
.LBB44_2:                               #   in Loop: Header=BB44_3 Depth=1
	addq	$1, %rbx
	addq	$32, %rbp
	cmpq	%rcx, %rbx
	jae	.LBB44_6
.LBB44_3:                               # =>This Inner Loop Header: Depth=1
	movq	8(%r13), %rdx
	movzwl	-8(%rdx,%rbp), %esi
	cmpw	%si, %r15w
	jb	.LBB44_2
# %bb.4:                                #   in Loop: Header=BB44_3 Depth=1
	movzwl	-6(%rdx,%rbp), %edi
	addl	%esi, %edi
	cmpl	%r14d, %edi
	jbe	.LBB44_2
# %bb.5:                                #   in Loop: Header=BB44_3 Depth=1
	movq	(%rdx,%rbp), %rdi
	movl	%r15d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbp)
                                        # kill: def $al killed $al def $rax
	movq	16(%r13), %rcx
	jmp	.LBB44_2
.LBB44_6:
	movzbl	%al, %r14d
	movl	4(%r13), %r15d
	testq	%rcx, %rcx
	je	.LBB44_14
# %bb.7:
	addl	$1, %r15d
	movzwl	%r15w, %r12d
	movl	$24, %ebp
	xorl	%eax, %eax
	xorl	%ebx, %ebx
	jmp	.LBB44_9
	.p2align	4, 0x90
.LBB44_8:                               #   in Loop: Header=BB44_9 Depth=1
	addq	$1, %rbx
	addq	$32, %rbp
	cmpq	%rcx, %rbx
	jae	.LBB44_12
.LBB44_9:                               # =>This Inner Loop Header: Depth=1
	movq	8(%r13), %rdx
	movzwl	-8(%rdx,%rbp), %esi
	cmpw	%si, %r15w
	jb	.LBB44_8
# %bb.10:                               #   in Loop: Header=BB44_9 Depth=1
	movzwl	-6(%rdx,%rbp), %edi
	addl	%esi, %edi
	cmpl	%r12d, %edi
	jbe	.LBB44_8
# %bb.11:                               #   in Loop: Header=BB44_9 Depth=1
	movq	(%rdx,%rbp), %rdi
	movl	%r15d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbp)
                                        # kill: def $al killed $al def $rax
	movq	16(%r13), %rcx
	jmp	.LBB44_8
.LBB44_12:
	movzwl	4(%r13), %r15d
	jmp	.LBB44_16
.LBB44_13:
	xorl	%ecx, %ecx
	xorl	%r14d, %r14d
	jmp	.LBB44_15
.LBB44_14:
	xorl	%ecx, %ecx
.LBB44_15:
	xorl	%eax, %eax
.LBB44_16:
	movzbl	%al, %eax
	shll	$8, %eax
	movzwl	%r14w, %r14d
	orl	%eax, %r14d
	addl	$1, %r15d
	movw	%r15w, 4(%r13)
	movzbl	3(%r13), %r12d
	leal	-1(%r12), %eax
	movb	%al, 3(%r13)
	testq	%rcx, %rcx
	je	.LBB44_28
# %bb.17:
	shrl	$8, %r15d
	orl	$256, %r12d             # imm = 0x100
	movl	$24, %ebx
	xorl	%ebp, %ebp
	jmp	.LBB44_19
	.p2align	4, 0x90
.LBB44_18:                              #   in Loop: Header=BB44_19 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rcx, %rbp
	jae	.LBB44_22
.LBB44_19:                              # =>This Inner Loop Header: Depth=1
	movq	8(%r13), %rax
	movzwl	-8(%rax,%rbx), %edx
	cmpw	%dx, %r12w
	jb	.LBB44_18
# %bb.20:                               #   in Loop: Header=BB44_19 Depth=1
	movzwl	-6(%rax,%rbx), %esi
	addl	%edx, %esi
	cmpl	%r12d, %esi
	jbe	.LBB44_18
# %bb.21:                               #   in Loop: Header=BB44_19 Depth=1
	movq	(%rax,%rbx), %rdi
	movzwl	%r12w, %ecx
	subl	%edx, %ecx
	movzwl	%cx, %esi
	movzbl	%r15b, %edx
	callq	*-16(%rax,%rbx)
	movq	16(%r13), %rcx
	jmp	.LBB44_18
.LBB44_22:
	movb	4(%r13), %r15b
	movzbl	3(%r13), %r12d
	leal	-1(%r12), %eax
	movb	%al, 3(%r13)
	testq	%rcx, %rcx
	je	.LBB44_29
# %bb.23:
	orl	$256, %r12d             # imm = 0x100
	movl	$24, %ebx
	xorl	%ebp, %ebp
	jmp	.LBB44_25
	.p2align	4, 0x90
.LBB44_24:                              #   in Loop: Header=BB44_25 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rcx, %rbp
	jae	.LBB44_29
.LBB44_25:                              # =>This Inner Loop Header: Depth=1
	movq	8(%r13), %rax
	movzwl	-8(%rax,%rbx), %edx
	cmpw	%dx, %r12w
	jb	.LBB44_24
# %bb.26:                               #   in Loop: Header=BB44_25 Depth=1
	movzwl	-6(%rax,%rbx), %esi
	addl	%edx, %esi
	cmpl	%r12d, %esi
	jbe	.LBB44_24
# %bb.27:                               #   in Loop: Header=BB44_25 Depth=1
	movq	(%rax,%rbx), %rdi
	movzwl	%r12w, %ecx
	subl	%edx, %ecx
	movzwl	%cx, %esi
	movzbl	%r15b, %edx
	callq	*-16(%rax,%rbx)
	movq	16(%r13), %rcx
	jmp	.LBB44_24
.LBB44_28:
	leal	-2(%r12), %eax
	movb	%al, 3(%r13)
.LBB44_29:
	movw	%r14w, 4(%r13)
	movl	$6, %eax
	addq	$8, %rsp
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%r12
	.cfi_def_cfa_offset 40
	popq	%r13
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end44:
	.size	JSR, .Lfunc_end44-JSR
	.cfi_endproc
                                        # -- End function
	.globl	BIT_zpg                 # -- Begin function BIT_zpg
	.p2align	4, 0x90
	.type	BIT_zpg,@function
BIT_zpg:                                # @BIT_zpg
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	pushq	%rax
	.cfi_def_cfa_offset 48
	.cfi_offset %rbx, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%rdi, %r14
	movzwl	4(%rdi), %r15d
	movq	16(%rdi), %rcx
	testq	%rcx, %rcx
	je	.LBB45_12
# %bb.1:
	movl	$24, %ebx
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	jmp	.LBB45_3
	.p2align	4, 0x90
.LBB45_2:                               #   in Loop: Header=BB45_3 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rcx, %rbp
	jae	.LBB45_6
.LBB45_3:                               # =>This Inner Loop Header: Depth=1
	movq	8(%r14), %rdx
	movzwl	-8(%rdx,%rbx), %esi
	cmpw	%si, %r15w
	jb	.LBB45_2
# %bb.4:                                #   in Loop: Header=BB45_3 Depth=1
	movzwl	-6(%rdx,%rbx), %edi
	addl	%esi, %edi
	cmpl	%r15d, %edi
	jbe	.LBB45_2
# %bb.5:                                #   in Loop: Header=BB45_3 Depth=1
	movq	(%rdx,%rbx), %rdi
	movl	%r15d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbx)
                                        # kill: def $al killed $al def $rax
	movq	16(%r14), %rcx
	jmp	.LBB45_2
.LBB45_6:
	addw	$1, 4(%r14)
	testq	%rcx, %rcx
	je	.LBB45_13
# %bb.7:
	movzbl	%al, %r15d
	movl	$24, %ebx
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	jmp	.LBB45_9
	.p2align	4, 0x90
.LBB45_8:                               #   in Loop: Header=BB45_9 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rcx, %rbp
	jae	.LBB45_14
.LBB45_9:                               # =>This Inner Loop Header: Depth=1
	movq	8(%r14), %rdx
	movzwl	-8(%rdx,%rbx), %esi
	cmpw	%r15w, %si
	ja	.LBB45_8
# %bb.10:                               #   in Loop: Header=BB45_9 Depth=1
	movzwl	-6(%rdx,%rbx), %edi
	addl	%esi, %edi
	cmpl	%r15d, %edi
	jbe	.LBB45_8
# %bb.11:                               #   in Loop: Header=BB45_9 Depth=1
	movq	(%rdx,%rbx), %rdi
	movzwl	%r15w, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbx)
                                        # kill: def $al killed $al def $rax
	movq	16(%r14), %rcx
	jmp	.LBB45_8
.LBB45_12:
	addl	$1, %r15d
	movw	%r15w, 4(%r14)
.LBB45_13:
	xorl	%eax, %eax
.LBB45_14:
	movb	(%r14), %cl
	andb	%al, %cl
	movb	6(%r14), %dl
	movl	%edx, %ebx
	andb	$61, %bl
	orb	$2, %dl
	testb	%cl, %cl
	movzbl	%dl, %ecx
	movzbl	%bl, %edx
	cmovel	%ecx, %edx
	andb	$63, %dl
	andb	$-64, %al
	orb	%dl, %al
	movb	%al, 6(%r14)
	movl	$3, %eax
	addq	$8, %rsp
	.cfi_def_cfa_offset 40
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end45:
	.size	BIT_zpg, .Lfunc_end45-BIT_zpg
	.cfi_endproc
                                        # -- End function
	.globl	BIT_abss                # -- Begin function BIT_abss
	.p2align	4, 0x90
	.type	BIT_abss,@function
BIT_abss:                               # @BIT_abss
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r13
	.cfi_def_cfa_offset 40
	pushq	%r12
	.cfi_def_cfa_offset 48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	pushq	%rax
	.cfi_def_cfa_offset 64
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%rdi, %r12
	movzwl	4(%rdi), %r13d
	movq	16(%rdi), %rcx
	testq	%rcx, %rcx
	je	.LBB46_12
# %bb.1:
	movzwl	%r13w, %r14d
	movl	$24, %ebx
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	jmp	.LBB46_3
	.p2align	4, 0x90
.LBB46_2:                               #   in Loop: Header=BB46_3 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rcx, %rbp
	jae	.LBB46_6
.LBB46_3:                               # =>This Inner Loop Header: Depth=1
	movq	8(%r12), %rdx
	movzwl	-8(%rdx,%rbx), %esi
	cmpw	%si, %r13w
	jb	.LBB46_2
# %bb.4:                                #   in Loop: Header=BB46_3 Depth=1
	movzwl	-6(%rdx,%rbx), %edi
	addl	%esi, %edi
	cmpl	%r14d, %edi
	jbe	.LBB46_2
# %bb.5:                                #   in Loop: Header=BB46_3 Depth=1
	movq	(%rdx,%rbx), %rdi
	movl	%r13d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbx)
                                        # kill: def $al killed $al def $rax
	movq	16(%r12), %rcx
	jmp	.LBB46_2
.LBB46_6:
	movl	4(%r12), %r13d
	testq	%rcx, %rcx
	je	.LBB46_12
# %bb.7:
	movzbl	%al, %r14d
	addl	$1, %r13d
	movzwl	%r13w, %r15d
	movl	$24, %ebx
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	jmp	.LBB46_9
	.p2align	4, 0x90
.LBB46_8:                               #   in Loop: Header=BB46_9 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rcx, %rbp
	jae	.LBB46_13
.LBB46_9:                               # =>This Inner Loop Header: Depth=1
	movq	8(%r12), %rdx
	movzwl	-8(%rdx,%rbx), %esi
	cmpw	%si, %r13w
	jb	.LBB46_8
# %bb.10:                               #   in Loop: Header=BB46_9 Depth=1
	movzwl	-6(%rdx,%rbx), %edi
	addl	%esi, %edi
	cmpl	%r15d, %edi
	jbe	.LBB46_8
# %bb.11:                               #   in Loop: Header=BB46_9 Depth=1
	movq	(%rdx,%rbx), %rdi
	movl	%r13d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbx)
                                        # kill: def $al killed $al def $rax
	movq	16(%r12), %rcx
	jmp	.LBB46_8
.LBB46_12:
	addl	$2, %r13d
	movw	%r13w, 4(%r12)
.LBB46_19:
	xorl	%eax, %eax
.LBB46_20:
	movb	(%r12), %cl
	andb	%al, %cl
	movb	6(%r12), %dl
	movl	%edx, %ebx
	andb	$61, %bl
	orb	$2, %dl
	testb	%cl, %cl
	movzbl	%dl, %ecx
	movzbl	%bl, %edx
	cmovel	%ecx, %edx
	andb	$63, %dl
	andb	$-64, %al
	orb	%dl, %al
	movb	%al, 6(%r12)
	movl	$4, %eax
	addq	$8, %rsp
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%r12
	.cfi_def_cfa_offset 40
	popq	%r13
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.LBB46_13:
	.cfi_def_cfa_offset 64
	addw	$2, 4(%r12)
	testq	%rcx, %rcx
	je	.LBB46_19
# %bb.14:
	movzbl	%al, %eax
	shll	$8, %eax
	movzwl	%r14w, %r15d
	orl	%eax, %r15d
	movzwl	%r15w, %r14d
	movl	$24, %ebp
	xorl	%eax, %eax
	xorl	%ebx, %ebx
	jmp	.LBB46_16
	.p2align	4, 0x90
.LBB46_15:                              #   in Loop: Header=BB46_16 Depth=1
	addq	$1, %rbx
	addq	$32, %rbp
	cmpq	%rcx, %rbx
	jae	.LBB46_20
.LBB46_16:                              # =>This Inner Loop Header: Depth=1
	movq	8(%r12), %rdx
	movzwl	-8(%rdx,%rbp), %esi
	cmpw	%si, %r15w
	jb	.LBB46_15
# %bb.17:                               #   in Loop: Header=BB46_16 Depth=1
	movzwl	-6(%rdx,%rbp), %edi
	addl	%esi, %edi
	cmpl	%r14d, %edi
	jbe	.LBB46_15
# %bb.18:                               #   in Loop: Header=BB46_16 Depth=1
	movq	(%rdx,%rbp), %rdi
	movl	%r15d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbp)
                                        # kill: def $al killed $al def $rax
	movq	16(%r12), %rcx
	jmp	.LBB46_15
.Lfunc_end46:
	.size	BIT_abss, .Lfunc_end46-BIT_abss
	.cfi_endproc
                                        # -- End function
	.globl	AND_imm                 # -- Begin function AND_imm
	.p2align	4, 0x90
	.type	AND_imm,@function
AND_imm:                                # @AND_imm
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r12
	.cfi_def_cfa_offset 40
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset %rbx, -48
	.cfi_offset %r12, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%rdi, %r15
	movb	(%rdi), %r14b
	movzwl	4(%rdi), %r12d
	leal	1(%r12), %eax
	movw	%ax, 4(%rdi)
	movq	16(%rdi), %rcx
	testq	%rcx, %rcx
	je	.LBB47_1
# %bb.2:
	movl	$24, %ebx
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	jmp	.LBB47_3
	.p2align	4, 0x90
.LBB47_6:                               #   in Loop: Header=BB47_3 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rcx, %rbp
	jae	.LBB47_7
.LBB47_3:                               # =>This Inner Loop Header: Depth=1
	movq	8(%r15), %rdx
	movzwl	-8(%rdx,%rbx), %esi
	cmpw	%si, %r12w
	jb	.LBB47_6
# %bb.4:                                #   in Loop: Header=BB47_3 Depth=1
	movzwl	-6(%rdx,%rbx), %edi
	addl	%esi, %edi
	cmpl	%r12d, %edi
	jbe	.LBB47_6
# %bb.5:                                #   in Loop: Header=BB47_3 Depth=1
	movq	(%rdx,%rbx), %rdi
	movl	%r12d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbx)
                                        # kill: def $al killed $al def $rax
	movq	16(%r15), %rcx
	jmp	.LBB47_6
.LBB47_1:
	xorl	%eax, %eax
.LBB47_7:
	andb	%r14b, %al
	movb	%al, (%r15)
	movb	6(%r15), %cl
	js	.LBB47_8
# %bb.10:
	andb	$127, %cl
	movb	%cl, 6(%r15)
	testb	%al, %al
	jne	.LBB47_9
# %bb.11:
	orb	$2, %cl
	jmp	.LBB47_12
.LBB47_8:
	orb	$-128, %cl
	movb	%cl, 6(%r15)
.LBB47_9:
	andb	$-3, %cl
.LBB47_12:
	movb	%cl, 6(%r15)
	movl	$2, %eax
	popq	%rbx
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end47:
	.size	AND_imm, .Lfunc_end47-AND_imm
	.cfi_endproc
                                        # -- End function
	.globl	AND_zpg                 # -- Begin function AND_zpg
	.p2align	4, 0x90
	.type	AND_zpg,@function
AND_zpg:                                # @AND_zpg
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r12
	.cfi_def_cfa_offset 40
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset %rbx, -48
	.cfi_offset %r12, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%rdi, %r15
	movb	(%rdi), %r14b
	movzwl	4(%rdi), %r12d
	movq	16(%rdi), %rcx
	testq	%rcx, %rcx
	je	.LBB48_1
# %bb.2:
	movl	$24, %ebx
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	jmp	.LBB48_3
	.p2align	4, 0x90
.LBB48_6:                               #   in Loop: Header=BB48_3 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rcx, %rbp
	jae	.LBB48_7
.LBB48_3:                               # =>This Inner Loop Header: Depth=1
	movq	8(%r15), %rdx
	movzwl	-8(%rdx,%rbx), %esi
	cmpw	%si, %r12w
	jb	.LBB48_6
# %bb.4:                                #   in Loop: Header=BB48_3 Depth=1
	movzwl	-6(%rdx,%rbx), %edi
	addl	%esi, %edi
	cmpl	%r12d, %edi
	jbe	.LBB48_6
# %bb.5:                                #   in Loop: Header=BB48_3 Depth=1
	movq	(%rdx,%rbx), %rdi
	movl	%r12d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbx)
                                        # kill: def $al killed $al def $rax
	movq	16(%r15), %rcx
	jmp	.LBB48_6
.LBB48_7:
	addw	$1, 4(%r15)
	testq	%rcx, %rcx
	je	.LBB48_8
# %bb.9:
	movzbl	%al, %r12d
	movl	$24, %ebx
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	jmp	.LBB48_10
	.p2align	4, 0x90
.LBB48_13:                              #   in Loop: Header=BB48_10 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rcx, %rbp
	jae	.LBB48_14
.LBB48_10:                              # =>This Inner Loop Header: Depth=1
	movq	8(%r15), %rdx
	movzwl	-8(%rdx,%rbx), %esi
	cmpw	%r12w, %si
	ja	.LBB48_13
# %bb.11:                               #   in Loop: Header=BB48_10 Depth=1
	movzwl	-6(%rdx,%rbx), %edi
	addl	%esi, %edi
	cmpl	%r12d, %edi
	jbe	.LBB48_13
# %bb.12:                               #   in Loop: Header=BB48_10 Depth=1
	movq	(%rdx,%rbx), %rdi
	movzwl	%r12w, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbx)
                                        # kill: def $al killed $al def $rax
	movq	16(%r15), %rcx
	jmp	.LBB48_13
.LBB48_1:
	addl	$1, %r12d
	movw	%r12w, 4(%r15)
	xorl	%eax, %eax
.LBB48_14:
	andb	%r14b, %al
	movb	%al, (%r15)
	movb	6(%r15), %cl
	js	.LBB48_15
.LBB48_17:
	andb	$127, %cl
	movb	%cl, 6(%r15)
	testb	%al, %al
	jne	.LBB48_16
# %bb.18:
	orb	$2, %cl
	jmp	.LBB48_19
.LBB48_8:
	xorl	%eax, %eax
	andb	%r14b, %al
	movb	%al, (%r15)
	movb	6(%r15), %cl
	jns	.LBB48_17
.LBB48_15:
	orb	$-128, %cl
	movb	%cl, 6(%r15)
.LBB48_16:
	andb	$-3, %cl
.LBB48_19:
	movb	%cl, 6(%r15)
	movl	$3, %eax
	popq	%rbx
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end48:
	.size	AND_zpg, .Lfunc_end48-AND_zpg
	.cfi_endproc
                                        # -- End function
	.globl	AND_zpgx                # -- Begin function AND_zpgx
	.p2align	4, 0x90
	.type	AND_zpgx,@function
AND_zpgx:                               # @AND_zpgx
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r13
	.cfi_def_cfa_offset 40
	pushq	%r12
	.cfi_def_cfa_offset 48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	pushq	%rax
	.cfi_def_cfa_offset 64
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%rdi, %r13
	movb	(%rdi), %r14b
	movzwl	4(%rdi), %r12d
	movq	16(%rdi), %rcx
	testq	%rcx, %rcx
	je	.LBB49_1
# %bb.2:
	movzwl	%r12w, %r15d
	movl	$24, %ebp
	xorl	%eax, %eax
	xorl	%ebx, %ebx
	jmp	.LBB49_3
	.p2align	4, 0x90
.LBB49_6:                               #   in Loop: Header=BB49_3 Depth=1
	addq	$1, %rbx
	addq	$32, %rbp
	cmpq	%rcx, %rbx
	jae	.LBB49_7
.LBB49_3:                               # =>This Inner Loop Header: Depth=1
	movq	8(%r13), %rdx
	movzwl	-8(%rdx,%rbp), %esi
	cmpw	%si, %r12w
	jb	.LBB49_6
# %bb.4:                                #   in Loop: Header=BB49_3 Depth=1
	movzwl	-6(%rdx,%rbp), %edi
	addl	%esi, %edi
	cmpl	%r15d, %edi
	jbe	.LBB49_6
# %bb.5:                                #   in Loop: Header=BB49_3 Depth=1
	movq	(%rdx,%rbp), %rdi
	movl	%r12d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbp)
                                        # kill: def $al killed $al def $rax
	movq	16(%r13), %rcx
	jmp	.LBB49_6
.LBB49_7:
	movzwl	4(%r13), %r12d
	jmp	.LBB49_8
.LBB49_1:
	xorl	%ecx, %ecx
	xorl	%eax, %eax
.LBB49_8:
	addb	1(%r13), %al
	addl	$1, %r12d
	movw	%r12w, 4(%r13)
	testq	%rcx, %rcx
	je	.LBB49_9
# %bb.10:
	movzbl	%al, %r12d
	movzwl	%r12w, %r15d
	movl	$24, %ebp
	xorl	%eax, %eax
	xorl	%ebx, %ebx
	jmp	.LBB49_11
	.p2align	4, 0x90
.LBB49_14:                              #   in Loop: Header=BB49_11 Depth=1
	addq	$1, %rbx
	addq	$32, %rbp
	cmpq	%rcx, %rbx
	jae	.LBB49_15
.LBB49_11:                              # =>This Inner Loop Header: Depth=1
	movq	8(%r13), %rdx
	movzwl	-8(%rdx,%rbp), %esi
	cmpw	%r12w, %si
	ja	.LBB49_14
# %bb.12:                               #   in Loop: Header=BB49_11 Depth=1
	movzwl	-6(%rdx,%rbp), %edi
	addl	%esi, %edi
	cmpl	%r15d, %edi
	jbe	.LBB49_14
# %bb.13:                               #   in Loop: Header=BB49_11 Depth=1
	movq	(%rdx,%rbp), %rdi
	movl	%r15d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbp)
                                        # kill: def $al killed $al def $rax
	movq	16(%r13), %rcx
	jmp	.LBB49_14
.LBB49_9:
	xorl	%eax, %eax
.LBB49_15:
	andb	%r14b, %al
	movb	%al, (%r13)
	movb	6(%r13), %cl
	js	.LBB49_16
# %bb.18:
	andb	$127, %cl
	movb	%cl, 6(%r13)
	testb	%al, %al
	jne	.LBB49_17
# %bb.19:
	orb	$2, %cl
	jmp	.LBB49_20
.LBB49_16:
	orb	$-128, %cl
	movb	%cl, 6(%r13)
.LBB49_17:
	andb	$-3, %cl
.LBB49_20:
	movb	%cl, 6(%r13)
	movl	$4, %eax
	addq	$8, %rsp
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%r12
	.cfi_def_cfa_offset 40
	popq	%r13
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end49:
	.size	AND_zpgx, .Lfunc_end49-AND_zpgx
	.cfi_endproc
                                        # -- End function
	.globl	AND_abss                # -- Begin function AND_abss
	.p2align	4, 0x90
	.type	AND_abss,@function
AND_abss:                               # @AND_abss
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r13
	.cfi_def_cfa_offset 40
	pushq	%r12
	.cfi_def_cfa_offset 48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	pushq	%rax
	.cfi_def_cfa_offset 64
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%rdi, %r13
	movb	(%rdi), %r12b
	movzwl	4(%rdi), %r14d
	movq	16(%rdi), %rcx
	testq	%rcx, %rcx
	movb	%r12b, 7(%rsp)          # 1-byte Spill
	je	.LBB50_12
# %bb.1:
	movzwl	%r14w, %r15d
	movl	$24, %ebx
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	jmp	.LBB50_3
	.p2align	4, 0x90
.LBB50_2:                               #   in Loop: Header=BB50_3 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rcx, %rbp
	jae	.LBB50_6
.LBB50_3:                               # =>This Inner Loop Header: Depth=1
	movq	8(%r13), %rdx
	movzwl	-8(%rdx,%rbx), %esi
	cmpw	%si, %r14w
	jb	.LBB50_2
# %bb.4:                                #   in Loop: Header=BB50_3 Depth=1
	movzwl	-6(%rdx,%rbx), %edi
	addl	%esi, %edi
	cmpl	%r15d, %edi
	jbe	.LBB50_2
# %bb.5:                                #   in Loop: Header=BB50_3 Depth=1
	movq	(%rdx,%rbx), %rdi
	movl	%r14d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbx)
                                        # kill: def $al killed $al def $rax
	movq	16(%r13), %rcx
	jmp	.LBB50_2
.LBB50_6:
	movl	4(%r13), %r14d
	testq	%rcx, %rcx
	je	.LBB50_12
# %bb.7:
	movzbl	%al, %r15d
	addl	$1, %r14d
	movzwl	%r14w, %r12d
	movl	$24, %ebx
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	jmp	.LBB50_9
	.p2align	4, 0x90
.LBB50_8:                               #   in Loop: Header=BB50_9 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rcx, %rbp
	jae	.LBB50_13
.LBB50_9:                               # =>This Inner Loop Header: Depth=1
	movq	8(%r13), %rdx
	movzwl	-8(%rdx,%rbx), %esi
	cmpw	%si, %r14w
	jb	.LBB50_8
# %bb.10:                               #   in Loop: Header=BB50_9 Depth=1
	movzwl	-6(%rdx,%rbx), %edi
	addl	%esi, %edi
	cmpl	%r12d, %edi
	jbe	.LBB50_8
# %bb.11:                               #   in Loop: Header=BB50_9 Depth=1
	movq	(%rdx,%rbx), %rdi
	movl	%r14d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbx)
                                        # kill: def $al killed $al def $rax
	movq	16(%r13), %rcx
	jmp	.LBB50_8
.LBB50_12:
	addl	$2, %r14d
	movw	%r14w, 4(%r13)
.LBB50_19:
	xorl	%eax, %eax
.LBB50_20:
	andb	7(%rsp), %al            # 1-byte Folded Reload
	movb	%al, (%r13)
	movb	6(%r13), %cl
	js	.LBB50_23
# %bb.21:
	andb	$127, %cl
	movb	%cl, 6(%r13)
	testb	%al, %al
	jne	.LBB50_24
# %bb.22:
	orb	$2, %cl
	jmp	.LBB50_25
.LBB50_13:
	addw	$2, 4(%r13)
	testq	%rcx, %rcx
	je	.LBB50_19
# %bb.14:
	movzbl	%al, %eax
	shll	$8, %eax
	movzwl	%r15w, %r12d
	orl	%eax, %r12d
	movzwl	%r12w, %r15d
	movl	$24, %ebp
	xorl	%eax, %eax
	xorl	%ebx, %ebx
	jmp	.LBB50_16
	.p2align	4, 0x90
.LBB50_15:                              #   in Loop: Header=BB50_16 Depth=1
	addq	$1, %rbx
	addq	$32, %rbp
	cmpq	%rcx, %rbx
	jae	.LBB50_20
.LBB50_16:                              # =>This Inner Loop Header: Depth=1
	movq	8(%r13), %rdx
	movzwl	-8(%rdx,%rbp), %esi
	cmpw	%si, %r12w
	jb	.LBB50_15
# %bb.17:                               #   in Loop: Header=BB50_16 Depth=1
	movzwl	-6(%rdx,%rbp), %edi
	addl	%esi, %edi
	cmpl	%r15d, %edi
	jbe	.LBB50_15
# %bb.18:                               #   in Loop: Header=BB50_16 Depth=1
	movq	(%rdx,%rbp), %rdi
	movl	%r12d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbp)
                                        # kill: def $al killed $al def $rax
	movq	16(%r13), %rcx
	jmp	.LBB50_15
.LBB50_23:
	orb	$-128, %cl
	movb	%cl, 6(%r13)
.LBB50_24:
	andb	$-3, %cl
.LBB50_25:
	movb	%cl, 6(%r13)
	movl	$4, %eax
	addq	$8, %rsp
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%r12
	.cfi_def_cfa_offset 40
	popq	%r13
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end50:
	.size	AND_abss, .Lfunc_end50-AND_abss
	.cfi_endproc
                                        # -- End function
	.globl	AND_absx                # -- Begin function AND_absx
	.p2align	4, 0x90
	.type	AND_absx,@function
AND_absx:                               # @AND_absx
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r13
	.cfi_def_cfa_offset 40
	pushq	%r12
	.cfi_def_cfa_offset 48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	pushq	%rax
	.cfi_def_cfa_offset 64
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%rdi, %r13
	movb	(%rdi), %al
	movzwl	4(%rdi), %r14d
	movq	16(%rdi), %rcx
	testq	%rcx, %rcx
	movb	%al, 7(%rsp)            # 1-byte Spill
	je	.LBB51_13
# %bb.1:
	movzwl	%r14w, %r15d
	movl	$24, %ebx
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	jmp	.LBB51_3
	.p2align	4, 0x90
.LBB51_2:                               #   in Loop: Header=BB51_3 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rcx, %rbp
	jae	.LBB51_6
.LBB51_3:                               # =>This Inner Loop Header: Depth=1
	movq	8(%r13), %rdx
	movzwl	-8(%rdx,%rbx), %esi
	cmpw	%si, %r14w
	jb	.LBB51_2
# %bb.4:                                #   in Loop: Header=BB51_3 Depth=1
	movzwl	-6(%rdx,%rbx), %edi
	addl	%esi, %edi
	cmpl	%r15d, %edi
	jbe	.LBB51_2
# %bb.5:                                #   in Loop: Header=BB51_3 Depth=1
	movq	(%rdx,%rbx), %rdi
	movl	%r14d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbx)
                                        # kill: def $al killed $al def $rax
	movq	16(%r13), %rcx
	jmp	.LBB51_2
.LBB51_6:
	movzbl	%al, %r15d
	movl	4(%r13), %r14d
	testq	%rcx, %rcx
	je	.LBB51_14
# %bb.7:
	addl	$1, %r14d
	movzwl	%r14w, %r12d
	movl	$24, %ebx
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	jmp	.LBB51_9
	.p2align	4, 0x90
.LBB51_8:                               #   in Loop: Header=BB51_9 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rcx, %rbp
	jae	.LBB51_12
.LBB51_9:                               # =>This Inner Loop Header: Depth=1
	movq	8(%r13), %rdx
	movzwl	-8(%rdx,%rbx), %esi
	cmpw	%si, %r14w
	jb	.LBB51_8
# %bb.10:                               #   in Loop: Header=BB51_9 Depth=1
	movzwl	-6(%rdx,%rbx), %edi
	addl	%esi, %edi
	cmpl	%r12d, %edi
	jbe	.LBB51_8
# %bb.11:                               #   in Loop: Header=BB51_9 Depth=1
	movq	(%rdx,%rbx), %rdi
	movl	%r14d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbx)
                                        # kill: def $al killed $al def $rax
	movq	16(%r13), %rcx
	jmp	.LBB51_8
.LBB51_12:
	movzwl	4(%r13), %r14d
	jmp	.LBB51_16
.LBB51_13:
	xorl	%ecx, %ecx
	xorl	%r15d, %r15d
	jmp	.LBB51_15
.LBB51_14:
	xorl	%ecx, %ecx
.LBB51_15:
	xorl	%eax, %eax
.LBB51_16:
	movzbl	1(%r13), %edx
	addl	$2, %r14d
	movw	%r14w, 4(%r13)
	testq	%rcx, %rcx
	je	.LBB51_22
# %bb.17:
	movzbl	%al, %eax
	shll	$8, %eax
	movzwl	%r15w, %r12d
	orl	%eax, %r12d
	addl	%edx, %r12d
	movzwl	%r12w, %r15d
	movl	$24, %ebx
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	jmp	.LBB51_19
	.p2align	4, 0x90
.LBB51_18:                              #   in Loop: Header=BB51_19 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rcx, %rbp
	jae	.LBB51_23
.LBB51_19:                              # =>This Inner Loop Header: Depth=1
	movq	8(%r13), %rdx
	movzwl	-8(%rdx,%rbx), %esi
	cmpw	%si, %r12w
	jb	.LBB51_18
# %bb.20:                               #   in Loop: Header=BB51_19 Depth=1
	movzwl	-6(%rdx,%rbx), %edi
	addl	%esi, %edi
	cmpl	%r15d, %edi
	jbe	.LBB51_18
# %bb.21:                               #   in Loop: Header=BB51_19 Depth=1
	movq	(%rdx,%rbx), %rdi
	movl	%r12d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbx)
                                        # kill: def $al killed $al def $rax
	movq	16(%r13), %rcx
	jmp	.LBB51_18
.LBB51_22:
	xorl	%eax, %eax
.LBB51_23:
	andb	7(%rsp), %al            # 1-byte Folded Reload
	movb	%al, (%r13)
	movb	6(%r13), %cl
	js	.LBB51_26
# %bb.24:
	andb	$127, %cl
	movb	%cl, 6(%r13)
	testb	%al, %al
	jne	.LBB51_27
# %bb.25:
	orb	$2, %cl
	jmp	.LBB51_28
.LBB51_26:
	orb	$-128, %cl
	movb	%cl, 6(%r13)
.LBB51_27:
	andb	$-3, %cl
.LBB51_28:
	movb	%cl, 6(%r13)
	movl	$4, %eax
	addq	$8, %rsp
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%r12
	.cfi_def_cfa_offset 40
	popq	%r13
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end51:
	.size	AND_absx, .Lfunc_end51-AND_absx
	.cfi_endproc
                                        # -- End function
	.globl	AND_absy                # -- Begin function AND_absy
	.p2align	4, 0x90
	.type	AND_absy,@function
AND_absy:                               # @AND_absy
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r13
	.cfi_def_cfa_offset 40
	pushq	%r12
	.cfi_def_cfa_offset 48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	pushq	%rax
	.cfi_def_cfa_offset 64
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%rdi, %r13
	movb	(%rdi), %al
	movzwl	4(%rdi), %r14d
	movq	16(%rdi), %rcx
	testq	%rcx, %rcx
	movb	%al, 7(%rsp)            # 1-byte Spill
	je	.LBB52_13
# %bb.1:
	movzwl	%r14w, %r15d
	movl	$24, %ebx
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	jmp	.LBB52_3
	.p2align	4, 0x90
.LBB52_2:                               #   in Loop: Header=BB52_3 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rcx, %rbp
	jae	.LBB52_6
.LBB52_3:                               # =>This Inner Loop Header: Depth=1
	movq	8(%r13), %rdx
	movzwl	-8(%rdx,%rbx), %esi
	cmpw	%si, %r14w
	jb	.LBB52_2
# %bb.4:                                #   in Loop: Header=BB52_3 Depth=1
	movzwl	-6(%rdx,%rbx), %edi
	addl	%esi, %edi
	cmpl	%r15d, %edi
	jbe	.LBB52_2
# %bb.5:                                #   in Loop: Header=BB52_3 Depth=1
	movq	(%rdx,%rbx), %rdi
	movl	%r14d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbx)
                                        # kill: def $al killed $al def $rax
	movq	16(%r13), %rcx
	jmp	.LBB52_2
.LBB52_6:
	movzbl	%al, %r15d
	movl	4(%r13), %r14d
	testq	%rcx, %rcx
	je	.LBB52_14
# %bb.7:
	addl	$1, %r14d
	movzwl	%r14w, %r12d
	movl	$24, %ebx
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	jmp	.LBB52_9
	.p2align	4, 0x90
.LBB52_8:                               #   in Loop: Header=BB52_9 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rcx, %rbp
	jae	.LBB52_12
.LBB52_9:                               # =>This Inner Loop Header: Depth=1
	movq	8(%r13), %rdx
	movzwl	-8(%rdx,%rbx), %esi
	cmpw	%si, %r14w
	jb	.LBB52_8
# %bb.10:                               #   in Loop: Header=BB52_9 Depth=1
	movzwl	-6(%rdx,%rbx), %edi
	addl	%esi, %edi
	cmpl	%r12d, %edi
	jbe	.LBB52_8
# %bb.11:                               #   in Loop: Header=BB52_9 Depth=1
	movq	(%rdx,%rbx), %rdi
	movl	%r14d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbx)
                                        # kill: def $al killed $al def $rax
	movq	16(%r13), %rcx
	jmp	.LBB52_8
.LBB52_12:
	movzwl	4(%r13), %r14d
	jmp	.LBB52_16
.LBB52_13:
	xorl	%ecx, %ecx
	xorl	%r15d, %r15d
	jmp	.LBB52_15
.LBB52_14:
	xorl	%ecx, %ecx
.LBB52_15:
	xorl	%eax, %eax
.LBB52_16:
	movzbl	2(%r13), %edx
	addl	$2, %r14d
	movw	%r14w, 4(%r13)
	testq	%rcx, %rcx
	je	.LBB52_22
# %bb.17:
	movzbl	%al, %eax
	shll	$8, %eax
	movzwl	%r15w, %r12d
	orl	%eax, %r12d
	addl	%edx, %r12d
	movzwl	%r12w, %r15d
	movl	$24, %ebx
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	jmp	.LBB52_19
	.p2align	4, 0x90
.LBB52_18:                              #   in Loop: Header=BB52_19 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rcx, %rbp
	jae	.LBB52_23
.LBB52_19:                              # =>This Inner Loop Header: Depth=1
	movq	8(%r13), %rdx
	movzwl	-8(%rdx,%rbx), %esi
	cmpw	%si, %r12w
	jb	.LBB52_18
# %bb.20:                               #   in Loop: Header=BB52_19 Depth=1
	movzwl	-6(%rdx,%rbx), %edi
	addl	%esi, %edi
	cmpl	%r15d, %edi
	jbe	.LBB52_18
# %bb.21:                               #   in Loop: Header=BB52_19 Depth=1
	movq	(%rdx,%rbx), %rdi
	movl	%r12d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbx)
                                        # kill: def $al killed $al def $rax
	movq	16(%r13), %rcx
	jmp	.LBB52_18
.LBB52_22:
	xorl	%eax, %eax
.LBB52_23:
	andb	7(%rsp), %al            # 1-byte Folded Reload
	movb	%al, (%r13)
	movb	6(%r13), %cl
	js	.LBB52_26
# %bb.24:
	andb	$127, %cl
	movb	%cl, 6(%r13)
	testb	%al, %al
	jne	.LBB52_27
# %bb.25:
	orb	$2, %cl
	jmp	.LBB52_28
.LBB52_26:
	orb	$-128, %cl
	movb	%cl, 6(%r13)
.LBB52_27:
	andb	$-3, %cl
.LBB52_28:
	movb	%cl, 6(%r13)
	movl	$4, %eax
	addq	$8, %rsp
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%r12
	.cfi_def_cfa_offset 40
	popq	%r13
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end52:
	.size	AND_absy, .Lfunc_end52-AND_absy
	.cfi_endproc
                                        # -- End function
	.globl	AND_xind                # -- Begin function AND_xind
	.p2align	4, 0x90
	.type	AND_xind,@function
AND_xind:                               # @AND_xind
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r13
	.cfi_def_cfa_offset 40
	pushq	%r12
	.cfi_def_cfa_offset 48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	pushq	%rax
	.cfi_def_cfa_offset 64
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%rdi, %r13
	movb	(%rdi), %r14b
	callq	xind
	movq	16(%r13), %rcx
	testq	%rcx, %rcx
	je	.LBB53_1
# %bb.2:
	movl	%eax, %r12d
	movzwl	%ax, %r15d
	movl	$24, %ebp
	xorl	%eax, %eax
	xorl	%ebx, %ebx
	jmp	.LBB53_3
	.p2align	4, 0x90
.LBB53_6:                               #   in Loop: Header=BB53_3 Depth=1
	addq	$1, %rbx
	addq	$32, %rbp
	cmpq	%rcx, %rbx
	jae	.LBB53_7
.LBB53_3:                               # =>This Inner Loop Header: Depth=1
	movq	8(%r13), %rdx
	movzwl	-8(%rdx,%rbp), %esi
	cmpw	%si, %r12w
	jb	.LBB53_6
# %bb.4:                                #   in Loop: Header=BB53_3 Depth=1
	movzwl	-6(%rdx,%rbp), %edi
	addl	%esi, %edi
	cmpl	%r15d, %edi
	jbe	.LBB53_6
# %bb.5:                                #   in Loop: Header=BB53_3 Depth=1
	movq	(%rdx,%rbp), %rdi
	movl	%r15d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbp)
                                        # kill: def $al killed $al def $rax
	movq	16(%r13), %rcx
	jmp	.LBB53_6
.LBB53_1:
	xorl	%eax, %eax
.LBB53_7:
	andb	%r14b, %al
	movb	%al, (%r13)
	movb	6(%r13), %cl
	js	.LBB53_8
# %bb.10:
	andb	$127, %cl
	movb	%cl, 6(%r13)
	testb	%al, %al
	jne	.LBB53_9
# %bb.11:
	orb	$2, %cl
	jmp	.LBB53_12
.LBB53_8:
	orb	$-128, %cl
	movb	%cl, 6(%r13)
.LBB53_9:
	andb	$-3, %cl
.LBB53_12:
	movb	%cl, 6(%r13)
	movl	$6, %eax
	addq	$8, %rsp
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%r12
	.cfi_def_cfa_offset 40
	popq	%r13
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end53:
	.size	AND_xind, .Lfunc_end53-AND_xind
	.cfi_endproc
                                        # -- End function
	.globl	AND_indy                # -- Begin function AND_indy
	.p2align	4, 0x90
	.type	AND_indy,@function
AND_indy:                               # @AND_indy
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r13
	.cfi_def_cfa_offset 40
	pushq	%r12
	.cfi_def_cfa_offset 48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	pushq	%rax
	.cfi_def_cfa_offset 64
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%rdi, %r13
	movb	(%rdi), %r14b
	callq	indy
	movq	16(%r13), %rcx
	testq	%rcx, %rcx
	je	.LBB54_1
# %bb.2:
	movl	%eax, %r12d
	movzwl	%ax, %r15d
	movl	$24, %ebp
	xorl	%eax, %eax
	xorl	%ebx, %ebx
	jmp	.LBB54_3
	.p2align	4, 0x90
.LBB54_6:                               #   in Loop: Header=BB54_3 Depth=1
	addq	$1, %rbx
	addq	$32, %rbp
	cmpq	%rcx, %rbx
	jae	.LBB54_7
.LBB54_3:                               # =>This Inner Loop Header: Depth=1
	movq	8(%r13), %rdx
	movzwl	-8(%rdx,%rbp), %esi
	cmpw	%si, %r12w
	jb	.LBB54_6
# %bb.4:                                #   in Loop: Header=BB54_3 Depth=1
	movzwl	-6(%rdx,%rbp), %edi
	addl	%esi, %edi
	cmpl	%r15d, %edi
	jbe	.LBB54_6
# %bb.5:                                #   in Loop: Header=BB54_3 Depth=1
	movq	(%rdx,%rbp), %rdi
	movl	%r15d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbp)
                                        # kill: def $al killed $al def $rax
	movq	16(%r13), %rcx
	jmp	.LBB54_6
.LBB54_1:
	xorl	%eax, %eax
.LBB54_7:
	andb	%r14b, %al
	movb	%al, (%r13)
	movb	6(%r13), %cl
	js	.LBB54_8
# %bb.10:
	andb	$127, %cl
	movb	%cl, 6(%r13)
	testb	%al, %al
	jne	.LBB54_9
# %bb.11:
	orb	$2, %cl
	jmp	.LBB54_12
.LBB54_8:
	orb	$-128, %cl
	movb	%cl, 6(%r13)
.LBB54_9:
	andb	$-3, %cl
.LBB54_12:
	movb	%cl, 6(%r13)
	movl	$5, %eax
	addq	$8, %rsp
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%r12
	.cfi_def_cfa_offset 40
	popq	%r13
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end54:
	.size	AND_indy, .Lfunc_end54-AND_indy
	.cfi_endproc
                                        # -- End function
	.globl	ROL_zpg                 # -- Begin function ROL_zpg
	.p2align	4, 0x90
	.type	ROL_zpg,@function
ROL_zpg:                                # @ROL_zpg
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r13
	.cfi_def_cfa_offset 40
	pushq	%r12
	.cfi_def_cfa_offset 48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	pushq	%rax
	.cfi_def_cfa_offset 64
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%rdi, %r13
	movzwl	4(%rdi), %r14d
	movq	16(%rdi), %rcx
	testq	%rcx, %rcx
	je	.LBB55_1
# %bb.3:
	movl	$24, %ebx
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	jmp	.LBB55_4
	.p2align	4, 0x90
.LBB55_7:                               #   in Loop: Header=BB55_4 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rcx, %rbp
	jae	.LBB55_8
.LBB55_4:                               # =>This Inner Loop Header: Depth=1
	movq	8(%r13), %rdx
	movzwl	-8(%rdx,%rbx), %esi
	cmpw	%si, %r14w
	jb	.LBB55_7
# %bb.5:                                #   in Loop: Header=BB55_4 Depth=1
	movzwl	-6(%rdx,%rbx), %edi
	addl	%esi, %edi
	cmpl	%r14d, %edi
	jbe	.LBB55_7
# %bb.6:                                #   in Loop: Header=BB55_4 Depth=1
	movq	(%rdx,%rbx), %rdi
	movl	%r14d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbx)
                                        # kill: def $al killed $al def $rax
	movq	16(%r13), %rcx
	jmp	.LBB55_7
.LBB55_8:
	addw	$1, 4(%r13)
	testq	%rcx, %rcx
	je	.LBB55_2
# %bb.9:
	movzbl	%al, %r12d
	movl	$24, %ebx
	xorl	%r14d, %r14d
	xorl	%ebp, %ebp
	jmp	.LBB55_10
	.p2align	4, 0x90
.LBB55_13:                              #   in Loop: Header=BB55_10 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rcx, %rbp
	jae	.LBB55_14
.LBB55_10:                              # =>This Inner Loop Header: Depth=1
	movq	8(%r13), %rdx
	movzwl	-8(%rdx,%rbx), %eax
	cmpw	%r12w, %ax
	ja	.LBB55_13
# %bb.11:                               #   in Loop: Header=BB55_10 Depth=1
	movzwl	-6(%rdx,%rbx), %esi
	addl	%eax, %esi
	cmpl	%r12d, %esi
	jbe	.LBB55_13
# %bb.12:                               #   in Loop: Header=BB55_10 Depth=1
	movq	(%rdx,%rbx), %rdi
	movzwl	%r12w, %ecx
	subl	%eax, %ecx
	movzwl	%cx, %esi
	callq	*-24(%rdx,%rbx)
	movl	%eax, %r14d
	movq	16(%r13), %rcx
	jmp	.LBB55_13
.LBB55_14:
	movl	%r14d, %eax
	rolb	%al
	movb	%al, 3(%rsp)            # 1-byte Spill
	testq	%rcx, %rcx
	je	.LBB55_20
# %bb.15:
	movl	$24, %ebp
	xorl	%ebx, %ebx
	movzwl	%r12w, %eax
	movl	%eax, 4(%rsp)           # 4-byte Spill
	movzbl	3(%rsp), %r15d          # 1-byte Folded Reload
	jmp	.LBB55_16
	.p2align	4, 0x90
.LBB55_19:                              #   in Loop: Header=BB55_16 Depth=1
	addq	$1, %rbx
	addq	$32, %rbp
	cmpq	%rcx, %rbx
	jae	.LBB55_20
.LBB55_16:                              # =>This Inner Loop Header: Depth=1
	movq	8(%r13), %rax
	movzwl	-8(%rax,%rbp), %edx
	cmpw	%r12w, %dx
	ja	.LBB55_19
# %bb.17:                               #   in Loop: Header=BB55_16 Depth=1
	movzwl	-6(%rax,%rbp), %esi
	addl	%edx, %esi
	cmpl	%r12d, %esi
	jbe	.LBB55_19
# %bb.18:                               #   in Loop: Header=BB55_16 Depth=1
	movq	(%rax,%rbp), %rdi
	movl	4(%rsp), %ecx           # 4-byte Reload
	subl	%edx, %ecx
	movzwl	%cx, %esi
	movl	%r15d, %edx
	callq	*-16(%rax,%rbp)
	movq	16(%r13), %rcx
	jmp	.LBB55_19
.LBB55_20:
	movb	6(%r13), %cl
	leaq	6(%r13), %rax
	movb	3(%rsp), %dl            # 1-byte Reload
	testb	%dl, %dl
	js	.LBB55_21
# %bb.23:
	andb	$127, %cl
	movb	%cl, (%rax)
	testb	%dl, %dl
	jne	.LBB55_22
	jmp	.LBB55_24
.LBB55_1:
	addl	$1, %r14d
	movw	%r14w, 4(%r13)
.LBB55_2:
	leaq	6(%r13), %rax
	movb	6(%r13), %cl
	andb	$127, %cl
	movb	%cl, 6(%r13)
	xorl	%r14d, %r14d
.LBB55_24:
	orb	$2, %cl
	jmp	.LBB55_25
.LBB55_21:
	orb	$-128, %cl
	movb	%cl, (%rax)
.LBB55_22:
	andb	$-3, %cl
.LBB55_25:
	movl	%ecx, %edx
	andb	$-2, %dl
	orb	$1, %cl
	testb	%r14b, %r14b
	movzbl	%cl, %ecx
	movzbl	%dl, %edx
	cmovsl	%ecx, %edx
	movb	%dl, (%rax)
	movl	$5, %eax
	addq	$8, %rsp
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%r12
	.cfi_def_cfa_offset 40
	popq	%r13
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end55:
	.size	ROL_zpg, .Lfunc_end55-ROL_zpg
	.cfi_endproc
                                        # -- End function
	.globl	ROL_zpgx                # -- Begin function ROL_zpgx
	.p2align	4, 0x90
	.type	ROL_zpgx,@function
ROL_zpgx:                               # @ROL_zpgx
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r13
	.cfi_def_cfa_offset 40
	pushq	%r12
	.cfi_def_cfa_offset 48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	subq	$24, %rsp
	.cfi_def_cfa_offset 80
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%rdi, %r14
	movzwl	4(%rdi), %r15d
	movq	16(%rdi), %rcx
	testq	%rcx, %rcx
	je	.LBB56_1
# %bb.2:
	movzwl	%r15w, %r12d
	movl	$24, %ebp
	xorl	%eax, %eax
	xorl	%ebx, %ebx
	jmp	.LBB56_3
	.p2align	4, 0x90
.LBB56_6:                               #   in Loop: Header=BB56_3 Depth=1
	addq	$1, %rbx
	addq	$32, %rbp
	cmpq	%rcx, %rbx
	jae	.LBB56_7
.LBB56_3:                               # =>This Inner Loop Header: Depth=1
	movq	8(%r14), %rdx
	movzwl	-8(%rdx,%rbp), %esi
	cmpw	%si, %r15w
	jb	.LBB56_6
# %bb.4:                                #   in Loop: Header=BB56_3 Depth=1
	movzwl	-6(%rdx,%rbp), %edi
	addl	%esi, %edi
	cmpl	%r12d, %edi
	jbe	.LBB56_6
# %bb.5:                                #   in Loop: Header=BB56_3 Depth=1
	movq	(%rdx,%rbp), %rdi
	movl	%r15d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbp)
                                        # kill: def $al killed $al def $rax
	movq	16(%r14), %rcx
	jmp	.LBB56_6
.LBB56_7:
	movzwl	4(%r14), %r15d
	jmp	.LBB56_8
.LBB56_1:
	xorl	%ecx, %ecx
	xorl	%eax, %eax
.LBB56_8:
	addb	1(%r14), %al
	addl	$1, %r15d
	movw	%r15w, 4(%r14)
	testq	%rcx, %rcx
	je	.LBB56_9
# %bb.10:
	movzbl	%al, %r13d
	movzwl	%r13w, %r12d
	movl	$24, %ebp
	xorl	%eax, %eax
	xorl	%ebx, %ebx
	jmp	.LBB56_11
	.p2align	4, 0x90
.LBB56_14:                              #   in Loop: Header=BB56_11 Depth=1
	addq	$1, %rbx
	addq	$32, %rbp
	cmpq	%rcx, %rbx
	jae	.LBB56_15
.LBB56_11:                              # =>This Inner Loop Header: Depth=1
	movq	8(%r14), %r8
	movzwl	-8(%r8,%rbp), %edx
	cmpw	%r13w, %dx
	ja	.LBB56_14
# %bb.12:                               #   in Loop: Header=BB56_11 Depth=1
	movzwl	-6(%r8,%rbp), %esi
	addl	%edx, %esi
	cmpl	%r12d, %esi
	jbe	.LBB56_14
# %bb.13:                               #   in Loop: Header=BB56_11 Depth=1
	movq	(%r8,%rbp), %rdi
	movl	%r12d, %ecx
	subl	%edx, %ecx
	movzwl	%cx, %esi
	callq	*-24(%r8,%rbp)
                                        # kill: def $al killed $al def $rax
	movq	16(%r14), %rcx
	jmp	.LBB56_14
.LBB56_15:
	movq	%rax, 16(%rsp)          # 8-byte Spill
                                        # kill: def $al killed $al killed $rax
	rolb	%al
	movb	%al, 15(%rsp)           # 1-byte Spill
	testq	%rcx, %rcx
	je	.LBB56_21
# %bb.16:
	movl	$24, %ebx
	xorl	%ebp, %ebp
	movzbl	15(%rsp), %r15d         # 1-byte Folded Reload
	jmp	.LBB56_17
	.p2align	4, 0x90
.LBB56_20:                              #   in Loop: Header=BB56_17 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rcx, %rbp
	jae	.LBB56_21
.LBB56_17:                              # =>This Inner Loop Header: Depth=1
	movq	8(%r14), %rax
	movzwl	-8(%rax,%rbx), %edx
	cmpw	%r13w, %dx
	ja	.LBB56_20
# %bb.18:                               #   in Loop: Header=BB56_17 Depth=1
	movzwl	-6(%rax,%rbx), %esi
	addl	%edx, %esi
	cmpl	%r12d, %esi
	jbe	.LBB56_20
# %bb.19:                               #   in Loop: Header=BB56_17 Depth=1
	movq	(%rax,%rbx), %rdi
	movl	%r12d, %ecx
	subl	%edx, %ecx
	movzwl	%cx, %esi
	movl	%r15d, %edx
	callq	*-16(%rax,%rbx)
	movq	16(%r14), %rcx
	jmp	.LBB56_20
.LBB56_21:
	movb	6(%r14), %cl
	leaq	6(%r14), %rax
	movb	15(%rsp), %dl           # 1-byte Reload
	testb	%dl, %dl
	js	.LBB56_22
# %bb.24:
	andb	$127, %cl
	movb	%cl, (%rax)
	testb	%dl, %dl
	jne	.LBB56_23
# %bb.25:
	movq	16(%rsp), %rsi          # 8-byte Reload
	jmp	.LBB56_26
.LBB56_9:
	leaq	6(%r14), %rax
	movb	6(%r14), %cl
	andb	$127, %cl
	movb	%cl, 6(%r14)
	xorl	%esi, %esi
.LBB56_26:
	orb	$2, %cl
	jmp	.LBB56_27
.LBB56_22:
	orb	$-128, %cl
	movb	%cl, (%rax)
.LBB56_23:
	movq	16(%rsp), %rsi          # 8-byte Reload
	andb	$-3, %cl
.LBB56_27:
	movl	%ecx, %edx
	andb	$-2, %dl
	orb	$1, %cl
	testb	%sil, %sil
	movzbl	%cl, %ecx
	movzbl	%dl, %edx
	cmovsl	%ecx, %edx
	movb	%dl, (%rax)
	movl	$6, %eax
	addq	$24, %rsp
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%r12
	.cfi_def_cfa_offset 40
	popq	%r13
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end56:
	.size	ROL_zpgx, .Lfunc_end56-ROL_zpgx
	.cfi_endproc
                                        # -- End function
	.globl	ROL_abss                # -- Begin function ROL_abss
	.p2align	4, 0x90
	.type	ROL_abss,@function
ROL_abss:                               # @ROL_abss
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r13
	.cfi_def_cfa_offset 40
	pushq	%r12
	.cfi_def_cfa_offset 48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	pushq	%rax
	.cfi_def_cfa_offset 64
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%rdi, %r13
	movzwl	4(%rdi), %r12d
	movq	16(%rdi), %rcx
	testq	%rcx, %rcx
	je	.LBB57_31
# %bb.1:
	movzwl	%r12w, %r14d
	movl	$24, %ebx
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	jmp	.LBB57_2
	.p2align	4, 0x90
.LBB57_5:                               #   in Loop: Header=BB57_2 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rcx, %rbp
	jae	.LBB57_6
.LBB57_2:                               # =>This Inner Loop Header: Depth=1
	movq	8(%r13), %rdx
	movzwl	-8(%rdx,%rbx), %esi
	cmpw	%si, %r12w
	jb	.LBB57_5
# %bb.3:                                #   in Loop: Header=BB57_2 Depth=1
	movzwl	-6(%rdx,%rbx), %edi
	addl	%esi, %edi
	cmpl	%r14d, %edi
	jbe	.LBB57_5
# %bb.4:                                #   in Loop: Header=BB57_2 Depth=1
	movq	(%rdx,%rbx), %rdi
	movl	%r12d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbx)
                                        # kill: def $al killed $al def $rax
	movq	16(%r13), %rcx
	jmp	.LBB57_5
.LBB57_6:
	movl	4(%r13), %r12d
	testq	%rcx, %rcx
	je	.LBB57_31
# %bb.7:
	movzbl	%al, %r14d
	addl	$1, %r12d
	movzwl	%r12w, %r15d
	movl	$24, %ebx
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	jmp	.LBB57_8
	.p2align	4, 0x90
.LBB57_11:                              #   in Loop: Header=BB57_8 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rcx, %rbp
	jae	.LBB57_12
.LBB57_8:                               # =>This Inner Loop Header: Depth=1
	movq	8(%r13), %rdx
	movzwl	-8(%rdx,%rbx), %esi
	cmpw	%si, %r12w
	jb	.LBB57_11
# %bb.9:                                #   in Loop: Header=BB57_8 Depth=1
	movzwl	-6(%rdx,%rbx), %edi
	addl	%esi, %edi
	cmpl	%r15d, %edi
	jbe	.LBB57_11
# %bb.10:                               #   in Loop: Header=BB57_8 Depth=1
	movq	(%rdx,%rbx), %rdi
	movl	%r12d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbx)
                                        # kill: def $al killed $al def $rax
	movq	16(%r13), %rcx
	jmp	.LBB57_11
.LBB57_31:
	addl	$2, %r12d
	movw	%r12w, 4(%r13)
.LBB57_13:
	leaq	6(%r13), %rax
	movb	6(%r13), %cl
	andb	$127, %cl
	movb	%cl, 6(%r13)
	xorl	%r14d, %r14d
.LBB57_29:
	orb	$2, %cl
.LBB57_30:
	movl	%ecx, %edx
	andb	$-2, %dl
	orb	$1, %cl
	testb	%r14b, %r14b
	movzbl	%cl, %ecx
	movzbl	%dl, %edx
	cmovsl	%ecx, %edx
	movb	%dl, (%rax)
	movl	$6, %eax
	addq	$8, %rsp
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%r12
	.cfi_def_cfa_offset 40
	popq	%r13
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.LBB57_12:
	.cfi_def_cfa_offset 64
	addw	$2, 4(%r13)
	testq	%rcx, %rcx
	je	.LBB57_13
# %bb.14:
	movzbl	%al, %eax
	shll	$8, %eax
	movzwl	%r14w, %r15d
	orl	%eax, %r15d
	movzwl	%r15w, %r12d
	movl	$24, %ebx
	xorl	%r14d, %r14d
	xorl	%ebp, %ebp
	jmp	.LBB57_15
	.p2align	4, 0x90
.LBB57_18:                              #   in Loop: Header=BB57_15 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rcx, %rbp
	jae	.LBB57_19
.LBB57_15:                              # =>This Inner Loop Header: Depth=1
	movq	8(%r13), %rdx
	movzwl	-8(%rdx,%rbx), %eax
	cmpw	%ax, %r15w
	jb	.LBB57_18
# %bb.16:                               #   in Loop: Header=BB57_15 Depth=1
	movzwl	-6(%rdx,%rbx), %esi
	addl	%eax, %esi
	cmpl	%r12d, %esi
	jbe	.LBB57_18
# %bb.17:                               #   in Loop: Header=BB57_15 Depth=1
	movq	(%rdx,%rbx), %rdi
	movl	%r15d, %ecx
	subl	%eax, %ecx
	movzwl	%cx, %esi
	callq	*-24(%rdx,%rbx)
	movl	%eax, %r14d
	movq	16(%r13), %rcx
	jmp	.LBB57_18
.LBB57_19:
	movl	%r14d, %eax
	rolb	%al
	movb	%al, 3(%rsp)            # 1-byte Spill
	testq	%rcx, %rcx
	je	.LBB57_25
# %bb.20:
	movl	$24, %ebx
	xorl	%ebp, %ebp
	movzbl	3(%rsp), %eax           # 1-byte Folded Reload
	movl	%eax, 4(%rsp)           # 4-byte Spill
	jmp	.LBB57_21
	.p2align	4, 0x90
.LBB57_24:                              #   in Loop: Header=BB57_21 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rcx, %rbp
	jae	.LBB57_25
.LBB57_21:                              # =>This Inner Loop Header: Depth=1
	movq	8(%r13), %rax
	movzwl	-8(%rax,%rbx), %edx
	cmpw	%dx, %r15w
	jb	.LBB57_24
# %bb.22:                               #   in Loop: Header=BB57_21 Depth=1
	movzwl	-6(%rax,%rbx), %esi
	addl	%edx, %esi
	cmpl	%r12d, %esi
	jbe	.LBB57_24
# %bb.23:                               #   in Loop: Header=BB57_21 Depth=1
	movq	(%rax,%rbx), %rdi
	movl	%r15d, %ecx
	subl	%edx, %ecx
	movzwl	%cx, %esi
	movl	4(%rsp), %edx           # 4-byte Reload
	callq	*-16(%rax,%rbx)
	movq	16(%r13), %rcx
	jmp	.LBB57_24
.LBB57_25:
	movb	6(%r13), %cl
	leaq	6(%r13), %rax
	movb	3(%rsp), %dl            # 1-byte Reload
	testb	%dl, %dl
	js	.LBB57_26
# %bb.28:
	andb	$127, %cl
	movb	%cl, (%rax)
	testb	%dl, %dl
	jne	.LBB57_27
	jmp	.LBB57_29
.LBB57_26:
	orb	$-128, %cl
	movb	%cl, (%rax)
.LBB57_27:
	andb	$-3, %cl
	jmp	.LBB57_30
.Lfunc_end57:
	.size	ROL_abss, .Lfunc_end57-ROL_abss
	.cfi_endproc
                                        # -- End function
	.globl	ROL_absx                # -- Begin function ROL_absx
	.p2align	4, 0x90
	.type	ROL_absx,@function
ROL_absx:                               # @ROL_absx
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r13
	.cfi_def_cfa_offset 40
	pushq	%r12
	.cfi_def_cfa_offset 48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	subq	$24, %rsp
	.cfi_def_cfa_offset 80
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%rdi, %r13
	movzwl	4(%rdi), %r12d
	movq	16(%rdi), %rcx
	testq	%rcx, %rcx
	je	.LBB58_13
# %bb.1:
	movzwl	%r12w, %r14d
	movl	$24, %ebp
	xorl	%eax, %eax
	xorl	%ebx, %ebx
	jmp	.LBB58_3
	.p2align	4, 0x90
.LBB58_2:                               #   in Loop: Header=BB58_3 Depth=1
	addq	$1, %rbx
	addq	$32, %rbp
	cmpq	%rcx, %rbx
	jae	.LBB58_6
.LBB58_3:                               # =>This Inner Loop Header: Depth=1
	movq	8(%r13), %rdx
	movzwl	-8(%rdx,%rbp), %esi
	cmpw	%si, %r12w
	jb	.LBB58_2
# %bb.4:                                #   in Loop: Header=BB58_3 Depth=1
	movzwl	-6(%rdx,%rbp), %edi
	addl	%esi, %edi
	cmpl	%r14d, %edi
	jbe	.LBB58_2
# %bb.5:                                #   in Loop: Header=BB58_3 Depth=1
	movq	(%rdx,%rbp), %rdi
	movl	%r12d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbp)
                                        # kill: def $al killed $al def $rax
	movq	16(%r13), %rcx
	jmp	.LBB58_2
.LBB58_6:
	movzbl	%al, %r14d
	movl	4(%r13), %r12d
	testq	%rcx, %rcx
	je	.LBB58_14
# %bb.7:
	addl	$1, %r12d
	movzwl	%r12w, %r15d
	movl	$24, %ebp
	xorl	%eax, %eax
	xorl	%ebx, %ebx
	jmp	.LBB58_9
	.p2align	4, 0x90
.LBB58_8:                               #   in Loop: Header=BB58_9 Depth=1
	addq	$1, %rbx
	addq	$32, %rbp
	cmpq	%rcx, %rbx
	jae	.LBB58_12
.LBB58_9:                               # =>This Inner Loop Header: Depth=1
	movq	8(%r13), %rdx
	movzwl	-8(%rdx,%rbp), %esi
	cmpw	%si, %r12w
	jb	.LBB58_8
# %bb.10:                               #   in Loop: Header=BB58_9 Depth=1
	movzwl	-6(%rdx,%rbp), %edi
	addl	%esi, %edi
	cmpl	%r15d, %edi
	jbe	.LBB58_8
# %bb.11:                               #   in Loop: Header=BB58_9 Depth=1
	movq	(%rdx,%rbp), %rdi
	movl	%r12d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbp)
                                        # kill: def $al killed $al def $rax
	movq	16(%r13), %rcx
	jmp	.LBB58_8
.LBB58_12:
	movzwl	4(%r13), %r12d
	jmp	.LBB58_16
.LBB58_13:
	xorl	%ecx, %ecx
	xorl	%r14d, %r14d
	jmp	.LBB58_15
.LBB58_14:
	xorl	%ecx, %ecx
.LBB58_15:
	xorl	%eax, %eax
.LBB58_16:
	movzbl	1(%r13), %edx
	addl	$2, %r12d
	movw	%r12w, 4(%r13)
	testq	%rcx, %rcx
	je	.LBB58_31
# %bb.17:
	movzbl	%al, %eax
	shll	$8, %eax
	movzwl	%r14w, %r14d
	orl	%eax, %r14d
	addl	%edx, %r14d
	movzwl	%r14w, %r12d
	movl	$24, %ebx
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	jmp	.LBB58_19
	.p2align	4, 0x90
.LBB58_18:                              #   in Loop: Header=BB58_19 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rcx, %rbp
	jae	.LBB58_22
.LBB58_19:                              # =>This Inner Loop Header: Depth=1
	movq	8(%r13), %r8
	movzwl	-8(%r8,%rbx), %edx
	cmpw	%dx, %r14w
	jb	.LBB58_18
# %bb.20:                               #   in Loop: Header=BB58_19 Depth=1
	movzwl	-6(%r8,%rbx), %esi
	addl	%edx, %esi
	cmpl	%r12d, %esi
	jbe	.LBB58_18
# %bb.21:                               #   in Loop: Header=BB58_19 Depth=1
	movq	(%r8,%rbx), %rdi
	movl	%r14d, %ecx
	subl	%edx, %ecx
	movzwl	%cx, %esi
	callq	*-24(%r8,%rbx)
                                        # kill: def $al killed $al def $rax
	movq	16(%r13), %rcx
	jmp	.LBB58_18
.LBB58_22:
	movq	%rax, 16(%rsp)          # 8-byte Spill
                                        # kill: def $al killed $al killed $rax
	rolb	%al
	movb	%al, 15(%rsp)           # 1-byte Spill
	testq	%rcx, %rcx
	je	.LBB58_28
# %bb.23:
	movl	$24, %ebp
	xorl	%ebx, %ebx
	movzbl	15(%rsp), %r15d         # 1-byte Folded Reload
	jmp	.LBB58_25
	.p2align	4, 0x90
.LBB58_24:                              #   in Loop: Header=BB58_25 Depth=1
	addq	$1, %rbx
	addq	$32, %rbp
	cmpq	%rcx, %rbx
	jae	.LBB58_28
.LBB58_25:                              # =>This Inner Loop Header: Depth=1
	movq	8(%r13), %rax
	movzwl	-8(%rax,%rbp), %edx
	cmpw	%dx, %r14w
	jb	.LBB58_24
# %bb.26:                               #   in Loop: Header=BB58_25 Depth=1
	movzwl	-6(%rax,%rbp), %esi
	addl	%edx, %esi
	cmpl	%r12d, %esi
	jbe	.LBB58_24
# %bb.27:                               #   in Loop: Header=BB58_25 Depth=1
	movq	(%rax,%rbp), %rdi
	movl	%r14d, %ecx
	subl	%edx, %ecx
	movzwl	%cx, %esi
	movl	%r15d, %edx
	callq	*-16(%rax,%rbp)
	movq	16(%r13), %rcx
	jmp	.LBB58_24
.LBB58_28:
	movb	6(%r13), %cl
	leaq	6(%r13), %rax
	movb	15(%rsp), %dl           # 1-byte Reload
	testb	%dl, %dl
	js	.LBB58_33
# %bb.29:
	andb	$127, %cl
	movb	%cl, (%rax)
	testb	%dl, %dl
	jne	.LBB58_34
# %bb.30:
	movq	16(%rsp), %rsi          # 8-byte Reload
	jmp	.LBB58_32
.LBB58_31:
	leaq	6(%r13), %rax
	movb	6(%r13), %cl
	andb	$127, %cl
	movb	%cl, 6(%r13)
	xorl	%esi, %esi
.LBB58_32:
	orb	$2, %cl
	jmp	.LBB58_35
.LBB58_33:
	orb	$-128, %cl
	movb	%cl, (%rax)
.LBB58_34:
	movq	16(%rsp), %rsi          # 8-byte Reload
	andb	$-3, %cl
.LBB58_35:
	movl	%ecx, %edx
	andb	$-2, %dl
	orb	$1, %cl
	testb	%sil, %sil
	movzbl	%cl, %ecx
	movzbl	%dl, %edx
	cmovsl	%ecx, %edx
	movb	%dl, (%rax)
	movl	$7, %eax
	addq	$24, %rsp
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%r12
	.cfi_def_cfa_offset 40
	popq	%r13
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end58:
	.size	ROL_absx, .Lfunc_end58-ROL_absx
	.cfi_endproc
                                        # -- End function
	.globl	ROLA                    # -- Begin function ROLA
	.p2align	4, 0x90
	.type	ROLA,@function
ROLA:                                   # @ROLA
	.cfi_startproc
# %bb.0:
	movb	(%rdi), %al
	movb	6(%rdi), %cl
	movl	%eax, %edx
	rolb	%dl
	movb	%dl, (%rdi)
	testb	%dl, %dl
	js	.LBB59_1
# %bb.3:
	andb	$127, %cl
	movb	%cl, 6(%rdi)
	testb	%dl, %dl
	jne	.LBB59_2
# %bb.4:
	orb	$2, %cl
	jmp	.LBB59_5
.LBB59_1:
	orb	$-128, %cl
	movb	%cl, 6(%rdi)
.LBB59_2:
	andb	$-3, %cl
.LBB59_5:
	movl	%ecx, %edx
	andb	$-2, %dl
	orb	$1, %cl
	testb	%al, %al
	movzbl	%cl, %eax
	movzbl	%dl, %ecx
	cmovsl	%eax, %ecx
	movb	%cl, 6(%rdi)
	movl	$2, %eax
	retq
.Lfunc_end59:
	.size	ROLA, .Lfunc_end59-ROLA
	.cfi_endproc
                                        # -- End function
	.globl	JMP_abss                # -- Begin function JMP_abss
	.p2align	4, 0x90
	.type	JMP_abss,@function
JMP_abss:                               # @JMP_abss
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r13
	.cfi_def_cfa_offset 40
	pushq	%r12
	.cfi_def_cfa_offset 48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	pushq	%rax
	.cfi_def_cfa_offset 64
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%rdi, %r12
	movq	16(%rdi), %rcx
	testq	%rcx, %rcx
	je	.LBB60_12
# %bb.1:
	movzwl	4(%r12), %r14d
	movl	$24, %ebx
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	jmp	.LBB60_3
	.p2align	4, 0x90
.LBB60_2:                               #   in Loop: Header=BB60_3 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rcx, %rbp
	jae	.LBB60_6
.LBB60_3:                               # =>This Inner Loop Header: Depth=1
	movq	8(%r12), %rdx
	movzwl	-8(%rdx,%rbx), %esi
	cmpw	%si, %r14w
	jb	.LBB60_2
# %bb.4:                                #   in Loop: Header=BB60_3 Depth=1
	movzwl	-6(%rdx,%rbx), %edi
	addl	%esi, %edi
	cmpl	%r14d, %edi
	jbe	.LBB60_2
# %bb.5:                                #   in Loop: Header=BB60_3 Depth=1
	movq	(%rdx,%rbx), %rdi
	movl	%r14d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbx)
                                        # kill: def $al killed $al def $rax
	movq	16(%r12), %rcx
	jmp	.LBB60_2
.LBB60_6:
	movzbl	%al, %r14d
	testq	%rcx, %rcx
	je	.LBB60_13
# %bb.7:
	movl	4(%r12), %r13d
	addl	$1, %r13d
	movzwl	%r13w, %r15d
	movl	$24, %ebx
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	jmp	.LBB60_9
	.p2align	4, 0x90
.LBB60_8:                               #   in Loop: Header=BB60_9 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rcx, %rbp
	jae	.LBB60_14
.LBB60_9:                               # =>This Inner Loop Header: Depth=1
	movq	8(%r12), %rdx
	movzwl	-8(%rdx,%rbx), %esi
	cmpw	%si, %r13w
	jb	.LBB60_8
# %bb.10:                               #   in Loop: Header=BB60_9 Depth=1
	movzwl	-6(%rdx,%rbx), %edi
	addl	%esi, %edi
	cmpl	%r15d, %edi
	jbe	.LBB60_8
# %bb.11:                               #   in Loop: Header=BB60_9 Depth=1
	movq	(%rdx,%rbx), %rdi
	movl	%r13d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbx)
                                        # kill: def $al killed $al def $rax
	movq	16(%r12), %rcx
	jmp	.LBB60_8
.LBB60_12:
	xorl	%r14d, %r14d
.LBB60_13:
	xorl	%eax, %eax
.LBB60_14:
	movzbl	%al, %eax
	shll	$8, %eax
	movzwl	%r14w, %ecx
	orl	%eax, %ecx
	movw	%cx, 4(%r12)
	movl	$3, %eax
	addq	$8, %rsp
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%r12
	.cfi_def_cfa_offset 40
	popq	%r13
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end60:
	.size	JMP_abss, .Lfunc_end60-JMP_abss
	.cfi_endproc
                                        # -- End function
	.globl	JMP_ind                 # -- Begin function JMP_ind
	.p2align	4, 0x90
	.type	JMP_ind,@function
JMP_ind:                                # @JMP_ind
	.cfi_startproc
# %bb.0:
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset %rbx, -16
	movq	%rdi, %rbx
	callq	ind
	movw	%ax, 4(%rbx)
	movl	$5, %eax
	popq	%rbx
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end61:
	.size	JMP_ind, .Lfunc_end61-JMP_ind
	.cfi_endproc
                                        # -- End function
	.globl	LSR_zpg                 # -- Begin function LSR_zpg
	.p2align	4, 0x90
	.type	LSR_zpg,@function
LSR_zpg:                                # @LSR_zpg
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r13
	.cfi_def_cfa_offset 40
	pushq	%r12
	.cfi_def_cfa_offset 48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	pushq	%rax
	.cfi_def_cfa_offset 64
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%rdi, %r13
	movzwl	4(%rdi), %r14d
	movq	16(%rdi), %rcx
	testq	%rcx, %rcx
	je	.LBB62_20
# %bb.1:
	movl	$24, %ebx
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	jmp	.LBB62_3
	.p2align	4, 0x90
.LBB62_2:                               #   in Loop: Header=BB62_3 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rcx, %rbp
	jae	.LBB62_6
.LBB62_3:                               # =>This Inner Loop Header: Depth=1
	movq	8(%r13), %rdx
	movzwl	-8(%rdx,%rbx), %esi
	cmpw	%si, %r14w
	jb	.LBB62_2
# %bb.4:                                #   in Loop: Header=BB62_3 Depth=1
	movzwl	-6(%rdx,%rbx), %edi
	addl	%esi, %edi
	cmpl	%r14d, %edi
	jbe	.LBB62_2
# %bb.5:                                #   in Loop: Header=BB62_3 Depth=1
	movq	(%rdx,%rbx), %rdi
	movl	%r14d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbx)
                                        # kill: def $al killed $al def $rax
	movq	16(%r13), %rcx
	jmp	.LBB62_2
.LBB62_6:
	addw	$1, 4(%r13)
	testq	%rcx, %rcx
	je	.LBB62_21
# %bb.7:
	movzbl	%al, %r12d
	movl	$24, %ebx
	xorl	%r14d, %r14d
	xorl	%ebp, %ebp
	jmp	.LBB62_9
	.p2align	4, 0x90
.LBB62_8:                               #   in Loop: Header=BB62_9 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rcx, %rbp
	jae	.LBB62_12
.LBB62_9:                               # =>This Inner Loop Header: Depth=1
	movq	8(%r13), %rdx
	movzwl	-8(%rdx,%rbx), %eax
	cmpw	%r12w, %ax
	ja	.LBB62_8
# %bb.10:                               #   in Loop: Header=BB62_9 Depth=1
	movzwl	-6(%rdx,%rbx), %esi
	addl	%eax, %esi
	cmpl	%r12d, %esi
	jbe	.LBB62_8
# %bb.11:                               #   in Loop: Header=BB62_9 Depth=1
	movq	(%rdx,%rbx), %rdi
	movzwl	%r12w, %ecx
	subl	%eax, %ecx
	movzwl	%cx, %esi
	callq	*-24(%rdx,%rbx)
	movl	%eax, %r14d
	movq	16(%r13), %rcx
	jmp	.LBB62_8
.LBB62_12:
	movl	%r14d, %eax
	shrb	%al
	movb	%al, 3(%rsp)            # 1-byte Spill
	testq	%rcx, %rcx
	je	.LBB62_18
# %bb.13:
	movl	$24, %ebp
	xorl	%ebx, %ebx
	movzwl	%r12w, %eax
	movl	%eax, 4(%rsp)           # 4-byte Spill
	movzbl	3(%rsp), %r15d          # 1-byte Folded Reload
	jmp	.LBB62_15
	.p2align	4, 0x90
.LBB62_14:                              #   in Loop: Header=BB62_15 Depth=1
	addq	$1, %rbx
	addq	$32, %rbp
	cmpq	%rcx, %rbx
	jae	.LBB62_18
.LBB62_15:                              # =>This Inner Loop Header: Depth=1
	movq	8(%r13), %rax
	movzwl	-8(%rax,%rbp), %edx
	cmpw	%r12w, %dx
	ja	.LBB62_14
# %bb.16:                               #   in Loop: Header=BB62_15 Depth=1
	movzwl	-6(%rax,%rbp), %esi
	addl	%edx, %esi
	cmpl	%r12d, %esi
	jbe	.LBB62_14
# %bb.17:                               #   in Loop: Header=BB62_15 Depth=1
	movq	(%rax,%rbp), %rdi
	movl	4(%rsp), %ecx           # 4-byte Reload
	subl	%edx, %ecx
	movzwl	%cx, %esi
	movl	%r15d, %edx
	callq	*-16(%rax,%rbp)
	movq	16(%r13), %rcx
	jmp	.LBB62_14
.LBB62_18:
	movb	6(%r13), %dl
	movl	%edx, %ecx
	andb	$127, %cl
	movb	%cl, 6(%r13)
	leaq	6(%r13), %rax
	cmpb	$0, 3(%rsp)             # 1-byte Folded Reload
	je	.LBB62_22
# %bb.19:
	andb	$125, %dl
	movl	%edx, %ecx
	jmp	.LBB62_23
.LBB62_20:
	addl	$1, %r14d
	movw	%r14w, 4(%r13)
.LBB62_21:
	leaq	6(%r13), %rax
	movb	6(%r13), %cl
	andb	$127, %cl
	movb	%cl, 6(%r13)
	xorl	%r14d, %r14d
.LBB62_22:
	orb	$2, %cl
.LBB62_23:
	movl	%ecx, %edx
	andb	$126, %dl
	orb	$1, %cl
	testb	$1, %r14b
	movzbl	%dl, %edx
	movzbl	%cl, %ecx
	cmovel	%edx, %ecx
	movb	%cl, (%rax)
	movl	$3, %eax
	addq	$8, %rsp
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%r12
	.cfi_def_cfa_offset 40
	popq	%r13
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end62:
	.size	LSR_zpg, .Lfunc_end62-LSR_zpg
	.cfi_endproc
                                        # -- End function
	.globl	LSR_zpgx                # -- Begin function LSR_zpgx
	.p2align	4, 0x90
	.type	LSR_zpgx,@function
LSR_zpgx:                               # @LSR_zpgx
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r13
	.cfi_def_cfa_offset 40
	pushq	%r12
	.cfi_def_cfa_offset 48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	subq	$24, %rsp
	.cfi_def_cfa_offset 80
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%rdi, %r14
	movzwl	4(%rdi), %r15d
	movq	16(%rdi), %rcx
	testq	%rcx, %rcx
	je	.LBB63_7
# %bb.1:
	movzwl	%r15w, %r12d
	movl	$24, %ebp
	xorl	%eax, %eax
	xorl	%ebx, %ebx
	jmp	.LBB63_3
	.p2align	4, 0x90
.LBB63_2:                               #   in Loop: Header=BB63_3 Depth=1
	addq	$1, %rbx
	addq	$32, %rbp
	cmpq	%rcx, %rbx
	jae	.LBB63_6
.LBB63_3:                               # =>This Inner Loop Header: Depth=1
	movq	8(%r14), %rdx
	movzwl	-8(%rdx,%rbp), %esi
	cmpw	%si, %r15w
	jb	.LBB63_2
# %bb.4:                                #   in Loop: Header=BB63_3 Depth=1
	movzwl	-6(%rdx,%rbp), %edi
	addl	%esi, %edi
	cmpl	%r12d, %edi
	jbe	.LBB63_2
# %bb.5:                                #   in Loop: Header=BB63_3 Depth=1
	movq	(%rdx,%rbp), %rdi
	movl	%r15d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbp)
                                        # kill: def $al killed $al def $rax
	movq	16(%r14), %rcx
	jmp	.LBB63_2
.LBB63_6:
	movzwl	4(%r14), %r15d
	jmp	.LBB63_8
.LBB63_7:
	xorl	%ecx, %ecx
	xorl	%eax, %eax
.LBB63_8:
	addb	1(%r14), %al
	addl	$1, %r15d
	movw	%r15w, 4(%r14)
	testq	%rcx, %rcx
	je	.LBB63_22
# %bb.9:
	movzbl	%al, %r13d
	movzwl	%r13w, %r12d
	movl	$24, %ebp
	xorl	%eax, %eax
	xorl	%ebx, %ebx
	jmp	.LBB63_11
	.p2align	4, 0x90
.LBB63_10:                              #   in Loop: Header=BB63_11 Depth=1
	addq	$1, %rbx
	addq	$32, %rbp
	cmpq	%rcx, %rbx
	jae	.LBB63_14
.LBB63_11:                              # =>This Inner Loop Header: Depth=1
	movq	8(%r14), %r8
	movzwl	-8(%r8,%rbp), %edx
	cmpw	%r13w, %dx
	ja	.LBB63_10
# %bb.12:                               #   in Loop: Header=BB63_11 Depth=1
	movzwl	-6(%r8,%rbp), %esi
	addl	%edx, %esi
	cmpl	%r12d, %esi
	jbe	.LBB63_10
# %bb.13:                               #   in Loop: Header=BB63_11 Depth=1
	movq	(%r8,%rbp), %rdi
	movl	%r12d, %ecx
	subl	%edx, %ecx
	movzwl	%cx, %esi
	callq	*-24(%r8,%rbp)
                                        # kill: def $al killed $al def $rax
	movq	16(%r14), %rcx
	jmp	.LBB63_10
.LBB63_14:
	movq	%rax, 16(%rsp)          # 8-byte Spill
                                        # kill: def $al killed $al killed $rax
	shrb	%al
	movb	%al, 15(%rsp)           # 1-byte Spill
	testq	%rcx, %rcx
	je	.LBB63_20
# %bb.15:
	movl	$24, %ebx
	xorl	%ebp, %ebp
	movzbl	15(%rsp), %r15d         # 1-byte Folded Reload
	jmp	.LBB63_17
	.p2align	4, 0x90
.LBB63_16:                              #   in Loop: Header=BB63_17 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rcx, %rbp
	jae	.LBB63_20
.LBB63_17:                              # =>This Inner Loop Header: Depth=1
	movq	8(%r14), %rax
	movzwl	-8(%rax,%rbx), %edx
	cmpw	%r13w, %dx
	ja	.LBB63_16
# %bb.18:                               #   in Loop: Header=BB63_17 Depth=1
	movzwl	-6(%rax,%rbx), %esi
	addl	%edx, %esi
	cmpl	%r12d, %esi
	jbe	.LBB63_16
# %bb.19:                               #   in Loop: Header=BB63_17 Depth=1
	movq	(%rax,%rbx), %rdi
	movl	%r12d, %ecx
	subl	%edx, %ecx
	movzwl	%cx, %esi
	movl	%r15d, %edx
	callq	*-16(%rax,%rbx)
	movq	16(%r14), %rcx
	jmp	.LBB63_16
.LBB63_20:
	movb	6(%r14), %dl
	movl	%edx, %ecx
	andb	$127, %cl
	movb	%cl, 6(%r14)
	leaq	6(%r14), %rax
	cmpb	$0, 15(%rsp)            # 1-byte Folded Reload
	je	.LBB63_23
# %bb.21:
	andb	$125, %dl
	movl	%edx, %ecx
	movq	16(%rsp), %rsi          # 8-byte Reload
	jmp	.LBB63_25
.LBB63_22:
	leaq	6(%r14), %rax
	movb	6(%r14), %cl
	andb	$127, %cl
	movb	%cl, 6(%r14)
	xorl	%esi, %esi
	jmp	.LBB63_24
.LBB63_23:
	movq	16(%rsp), %rsi          # 8-byte Reload
.LBB63_24:
	orb	$2, %cl
.LBB63_25:
	movl	%ecx, %edx
	andb	$126, %dl
	orb	$1, %cl
	testb	$1, %sil
	movzbl	%dl, %edx
	movzbl	%cl, %ecx
	cmovel	%edx, %ecx
	movb	%cl, (%rax)
	movl	$4, %eax
	addq	$24, %rsp
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%r12
	.cfi_def_cfa_offset 40
	popq	%r13
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end63:
	.size	LSR_zpgx, .Lfunc_end63-LSR_zpgx
	.cfi_endproc
                                        # -- End function
	.globl	LSR_abss                # -- Begin function LSR_abss
	.p2align	4, 0x90
	.type	LSR_abss,@function
LSR_abss:                               # @LSR_abss
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r13
	.cfi_def_cfa_offset 40
	pushq	%r12
	.cfi_def_cfa_offset 48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	pushq	%rax
	.cfi_def_cfa_offset 64
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%rdi, %r13
	movzwl	4(%rdi), %r12d
	movq	16(%rdi), %rcx
	testq	%rcx, %rcx
	je	.LBB64_12
# %bb.1:
	movzwl	%r12w, %r14d
	movl	$24, %ebx
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	jmp	.LBB64_3
	.p2align	4, 0x90
.LBB64_2:                               #   in Loop: Header=BB64_3 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rcx, %rbp
	jae	.LBB64_6
.LBB64_3:                               # =>This Inner Loop Header: Depth=1
	movq	8(%r13), %rdx
	movzwl	-8(%rdx,%rbx), %esi
	cmpw	%si, %r12w
	jb	.LBB64_2
# %bb.4:                                #   in Loop: Header=BB64_3 Depth=1
	movzwl	-6(%rdx,%rbx), %edi
	addl	%esi, %edi
	cmpl	%r14d, %edi
	jbe	.LBB64_2
# %bb.5:                                #   in Loop: Header=BB64_3 Depth=1
	movq	(%rdx,%rbx), %rdi
	movl	%r12d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbx)
                                        # kill: def $al killed $al def $rax
	movq	16(%r13), %rcx
	jmp	.LBB64_2
.LBB64_6:
	movl	4(%r13), %r12d
	testq	%rcx, %rcx
	je	.LBB64_12
# %bb.7:
	movzbl	%al, %r14d
	addl	$1, %r12d
	movzwl	%r12w, %r15d
	movl	$24, %ebx
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	jmp	.LBB64_9
	.p2align	4, 0x90
.LBB64_8:                               #   in Loop: Header=BB64_9 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rcx, %rbp
	jae	.LBB64_16
.LBB64_9:                               # =>This Inner Loop Header: Depth=1
	movq	8(%r13), %rdx
	movzwl	-8(%rdx,%rbx), %esi
	cmpw	%si, %r12w
	jb	.LBB64_8
# %bb.10:                               #   in Loop: Header=BB64_9 Depth=1
	movzwl	-6(%rdx,%rbx), %edi
	addl	%esi, %edi
	cmpl	%r15d, %edi
	jbe	.LBB64_8
# %bb.11:                               #   in Loop: Header=BB64_9 Depth=1
	movq	(%rdx,%rbx), %rdi
	movl	%r12d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbx)
                                        # kill: def $al killed $al def $rax
	movq	16(%r13), %rcx
	jmp	.LBB64_8
.LBB64_12:
	addl	$2, %r12d
	movw	%r12w, 4(%r13)
.LBB64_13:
	leaq	6(%r13), %rax
	movb	6(%r13), %cl
	andb	$127, %cl
	movb	%cl, 6(%r13)
	xorl	%r14d, %r14d
.LBB64_14:
	orb	$2, %cl
.LBB64_15:
	movl	%ecx, %edx
	andb	$126, %dl
	orb	$1, %cl
	testb	$1, %r14b
	movzbl	%dl, %edx
	movzbl	%cl, %ecx
	cmovel	%edx, %ecx
	movb	%cl, (%rax)
	movl	$4, %eax
	addq	$8, %rsp
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%r12
	.cfi_def_cfa_offset 40
	popq	%r13
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.LBB64_16:
	.cfi_def_cfa_offset 64
	addw	$2, 4(%r13)
	testq	%rcx, %rcx
	je	.LBB64_13
# %bb.17:
	movzbl	%al, %eax
	shll	$8, %eax
	movzwl	%r14w, %r15d
	orl	%eax, %r15d
	movzwl	%r15w, %r12d
	movl	$24, %ebx
	xorl	%r14d, %r14d
	xorl	%ebp, %ebp
	jmp	.LBB64_19
	.p2align	4, 0x90
.LBB64_18:                              #   in Loop: Header=BB64_19 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rcx, %rbp
	jae	.LBB64_22
.LBB64_19:                              # =>This Inner Loop Header: Depth=1
	movq	8(%r13), %rdx
	movzwl	-8(%rdx,%rbx), %eax
	cmpw	%ax, %r15w
	jb	.LBB64_18
# %bb.20:                               #   in Loop: Header=BB64_19 Depth=1
	movzwl	-6(%rdx,%rbx), %esi
	addl	%eax, %esi
	cmpl	%r12d, %esi
	jbe	.LBB64_18
# %bb.21:                               #   in Loop: Header=BB64_19 Depth=1
	movq	(%rdx,%rbx), %rdi
	movl	%r15d, %ecx
	subl	%eax, %ecx
	movzwl	%cx, %esi
	callq	*-24(%rdx,%rbx)
	movl	%eax, %r14d
	movq	16(%r13), %rcx
	jmp	.LBB64_18
.LBB64_22:
	movl	%r14d, %eax
	shrb	%al
	movb	%al, 3(%rsp)            # 1-byte Spill
	testq	%rcx, %rcx
	je	.LBB64_28
# %bb.23:
	movl	$24, %ebx
	xorl	%ebp, %ebp
	movzbl	3(%rsp), %eax           # 1-byte Folded Reload
	movl	%eax, 4(%rsp)           # 4-byte Spill
	jmp	.LBB64_25
	.p2align	4, 0x90
.LBB64_24:                              #   in Loop: Header=BB64_25 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rcx, %rbp
	jae	.LBB64_28
.LBB64_25:                              # =>This Inner Loop Header: Depth=1
	movq	8(%r13), %rax
	movzwl	-8(%rax,%rbx), %edx
	cmpw	%dx, %r15w
	jb	.LBB64_24
# %bb.26:                               #   in Loop: Header=BB64_25 Depth=1
	movzwl	-6(%rax,%rbx), %esi
	addl	%edx, %esi
	cmpl	%r12d, %esi
	jbe	.LBB64_24
# %bb.27:                               #   in Loop: Header=BB64_25 Depth=1
	movq	(%rax,%rbx), %rdi
	movl	%r15d, %ecx
	subl	%edx, %ecx
	movzwl	%cx, %esi
	movl	4(%rsp), %edx           # 4-byte Reload
	callq	*-16(%rax,%rbx)
	movq	16(%r13), %rcx
	jmp	.LBB64_24
.LBB64_28:
	movb	6(%r13), %dl
	movl	%edx, %ecx
	andb	$127, %cl
	movb	%cl, 6(%r13)
	leaq	6(%r13), %rax
	cmpb	$0, 3(%rsp)             # 1-byte Folded Reload
	je	.LBB64_14
# %bb.29:
	andb	$125, %dl
	movl	%edx, %ecx
	jmp	.LBB64_15
.Lfunc_end64:
	.size	LSR_abss, .Lfunc_end64-LSR_abss
	.cfi_endproc
                                        # -- End function
	.globl	LSR_absx                # -- Begin function LSR_absx
	.p2align	4, 0x90
	.type	LSR_absx,@function
LSR_absx:                               # @LSR_absx
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r13
	.cfi_def_cfa_offset 40
	pushq	%r12
	.cfi_def_cfa_offset 48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	subq	$24, %rsp
	.cfi_def_cfa_offset 80
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%rdi, %r13
	movzwl	4(%rdi), %r12d
	movq	16(%rdi), %rcx
	testq	%rcx, %rcx
	je	.LBB65_13
# %bb.1:
	movzwl	%r12w, %r14d
	movl	$24, %ebp
	xorl	%eax, %eax
	xorl	%ebx, %ebx
	jmp	.LBB65_3
	.p2align	4, 0x90
.LBB65_2:                               #   in Loop: Header=BB65_3 Depth=1
	addq	$1, %rbx
	addq	$32, %rbp
	cmpq	%rcx, %rbx
	jae	.LBB65_6
.LBB65_3:                               # =>This Inner Loop Header: Depth=1
	movq	8(%r13), %rdx
	movzwl	-8(%rdx,%rbp), %esi
	cmpw	%si, %r12w
	jb	.LBB65_2
# %bb.4:                                #   in Loop: Header=BB65_3 Depth=1
	movzwl	-6(%rdx,%rbp), %edi
	addl	%esi, %edi
	cmpl	%r14d, %edi
	jbe	.LBB65_2
# %bb.5:                                #   in Loop: Header=BB65_3 Depth=1
	movq	(%rdx,%rbp), %rdi
	movl	%r12d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbp)
                                        # kill: def $al killed $al def $rax
	movq	16(%r13), %rcx
	jmp	.LBB65_2
.LBB65_6:
	movzbl	%al, %r14d
	movl	4(%r13), %r12d
	testq	%rcx, %rcx
	je	.LBB65_14
# %bb.7:
	addl	$1, %r12d
	movzwl	%r12w, %r15d
	movl	$24, %ebp
	xorl	%eax, %eax
	xorl	%ebx, %ebx
	jmp	.LBB65_9
	.p2align	4, 0x90
.LBB65_8:                               #   in Loop: Header=BB65_9 Depth=1
	addq	$1, %rbx
	addq	$32, %rbp
	cmpq	%rcx, %rbx
	jae	.LBB65_12
.LBB65_9:                               # =>This Inner Loop Header: Depth=1
	movq	8(%r13), %rdx
	movzwl	-8(%rdx,%rbp), %esi
	cmpw	%si, %r12w
	jb	.LBB65_8
# %bb.10:                               #   in Loop: Header=BB65_9 Depth=1
	movzwl	-6(%rdx,%rbp), %edi
	addl	%esi, %edi
	cmpl	%r15d, %edi
	jbe	.LBB65_8
# %bb.11:                               #   in Loop: Header=BB65_9 Depth=1
	movq	(%rdx,%rbp), %rdi
	movl	%r12d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbp)
                                        # kill: def $al killed $al def $rax
	movq	16(%r13), %rcx
	jmp	.LBB65_8
.LBB65_12:
	movzwl	4(%r13), %r12d
	jmp	.LBB65_16
.LBB65_13:
	xorl	%ecx, %ecx
	xorl	%r14d, %r14d
	jmp	.LBB65_15
.LBB65_14:
	xorl	%ecx, %ecx
.LBB65_15:
	xorl	%eax, %eax
.LBB65_16:
	movzbl	1(%r13), %edx
	addl	$2, %r12d
	movw	%r12w, 4(%r13)
	testq	%rcx, %rcx
	je	.LBB65_30
# %bb.17:
	movzbl	%al, %eax
	shll	$8, %eax
	movzwl	%r14w, %r14d
	orl	%eax, %r14d
	addl	%edx, %r14d
	movzwl	%r14w, %r12d
	movl	$24, %ebx
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	jmp	.LBB65_19
	.p2align	4, 0x90
.LBB65_18:                              #   in Loop: Header=BB65_19 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rcx, %rbp
	jae	.LBB65_22
.LBB65_19:                              # =>This Inner Loop Header: Depth=1
	movq	8(%r13), %r8
	movzwl	-8(%r8,%rbx), %edx
	cmpw	%dx, %r14w
	jb	.LBB65_18
# %bb.20:                               #   in Loop: Header=BB65_19 Depth=1
	movzwl	-6(%r8,%rbx), %esi
	addl	%edx, %esi
	cmpl	%r12d, %esi
	jbe	.LBB65_18
# %bb.21:                               #   in Loop: Header=BB65_19 Depth=1
	movq	(%r8,%rbx), %rdi
	movl	%r14d, %ecx
	subl	%edx, %ecx
	movzwl	%cx, %esi
	callq	*-24(%r8,%rbx)
                                        # kill: def $al killed $al def $rax
	movq	16(%r13), %rcx
	jmp	.LBB65_18
.LBB65_22:
	movq	%rax, 16(%rsp)          # 8-byte Spill
                                        # kill: def $al killed $al killed $rax
	shrb	%al
	movb	%al, 15(%rsp)           # 1-byte Spill
	testq	%rcx, %rcx
	je	.LBB65_28
# %bb.23:
	movl	$24, %ebp
	xorl	%ebx, %ebx
	movzbl	15(%rsp), %r15d         # 1-byte Folded Reload
	jmp	.LBB65_25
	.p2align	4, 0x90
.LBB65_24:                              #   in Loop: Header=BB65_25 Depth=1
	addq	$1, %rbx
	addq	$32, %rbp
	cmpq	%rcx, %rbx
	jae	.LBB65_28
.LBB65_25:                              # =>This Inner Loop Header: Depth=1
	movq	8(%r13), %rax
	movzwl	-8(%rax,%rbp), %edx
	cmpw	%dx, %r14w
	jb	.LBB65_24
# %bb.26:                               #   in Loop: Header=BB65_25 Depth=1
	movzwl	-6(%rax,%rbp), %esi
	addl	%edx, %esi
	cmpl	%r12d, %esi
	jbe	.LBB65_24
# %bb.27:                               #   in Loop: Header=BB65_25 Depth=1
	movq	(%rax,%rbp), %rdi
	movl	%r14d, %ecx
	subl	%edx, %ecx
	movzwl	%cx, %esi
	movl	%r15d, %edx
	callq	*-16(%rax,%rbp)
	movq	16(%r13), %rcx
	jmp	.LBB65_24
.LBB65_28:
	movb	6(%r13), %dl
	movl	%edx, %ecx
	andb	$127, %cl
	movb	%cl, 6(%r13)
	leaq	6(%r13), %rax
	cmpb	$0, 15(%rsp)            # 1-byte Folded Reload
	je	.LBB65_31
# %bb.29:
	andb	$125, %dl
	movl	%edx, %ecx
	movq	16(%rsp), %rsi          # 8-byte Reload
	jmp	.LBB65_33
.LBB65_30:
	leaq	6(%r13), %rax
	movb	6(%r13), %cl
	andb	$127, %cl
	movb	%cl, 6(%r13)
	xorl	%esi, %esi
	jmp	.LBB65_32
.LBB65_31:
	movq	16(%rsp), %rsi          # 8-byte Reload
.LBB65_32:
	orb	$2, %cl
.LBB65_33:
	movl	%ecx, %edx
	andb	$126, %dl
	orb	$1, %cl
	testb	$1, %sil
	movzbl	%dl, %edx
	movzbl	%cl, %ecx
	cmovel	%edx, %ecx
	movb	%cl, (%rax)
	movl	$5, %eax
	addq	$24, %rsp
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%r12
	.cfi_def_cfa_offset 40
	popq	%r13
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end65:
	.size	LSR_absx, .Lfunc_end65-LSR_absx
	.cfi_endproc
                                        # -- End function
	.globl	LSRA                    # -- Begin function LSRA
	.p2align	4, 0x90
	.type	LSRA,@function
LSRA:                                   # @LSRA
	.cfi_startproc
# %bb.0:
	movb	(%rdi), %al
	movb	6(%rdi), %cl
	movl	%eax, %edx
	shrb	%dl
	movb	%dl, (%rdi)
	andb	$125, %cl
	leal	2(%rcx), %esi
	testb	%dl, %dl
	movzbl	%cl, %ecx
	movzbl	%sil, %edx
	cmovnel	%ecx, %edx
	movl	%edx, %ecx
	andb	$126, %cl
	orb	$1, %dl
	testb	$1, %al
	movzbl	%cl, %eax
	movzbl	%dl, %ecx
	cmovel	%eax, %ecx
	movb	%cl, 6(%rdi)
	movl	$2, %eax
	retq
.Lfunc_end66:
	.size	LSRA, .Lfunc_end66-LSRA
	.cfi_endproc
                                        # -- End function
	.globl	EOR_imm                 # -- Begin function EOR_imm
	.p2align	4, 0x90
	.type	EOR_imm,@function
EOR_imm:                                # @EOR_imm
	.cfi_startproc
# %bb.0:
	pushq	%r15
	.cfi_def_cfa_offset 16
	pushq	%r14
	.cfi_def_cfa_offset 24
	pushq	%r12
	.cfi_def_cfa_offset 32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	pushq	%rax
	.cfi_def_cfa_offset 48
	.cfi_offset %rbx, -40
	.cfi_offset %r12, -32
	.cfi_offset %r14, -24
	.cfi_offset %r15, -16
	movq	%rdi, %r14
	movzwl	4(%rdi), %r15d
	leal	1(%r15), %eax
	movw	%ax, 4(%rdi)
	movq	16(%rdi), %rcx
	testq	%rcx, %rcx
	je	.LBB67_1
# %bb.2:
	movl	$24, %ebx
	xorl	%eax, %eax
	xorl	%r12d, %r12d
	jmp	.LBB67_3
	.p2align	4, 0x90
.LBB67_6:                               #   in Loop: Header=BB67_3 Depth=1
	addq	$1, %r12
	addq	$32, %rbx
	cmpq	%rcx, %r12
	jae	.LBB67_7
.LBB67_3:                               # =>This Inner Loop Header: Depth=1
	movq	8(%r14), %rdx
	movzwl	-8(%rdx,%rbx), %esi
	cmpw	%si, %r15w
	jb	.LBB67_6
# %bb.4:                                #   in Loop: Header=BB67_3 Depth=1
	movzwl	-6(%rdx,%rbx), %edi
	addl	%esi, %edi
	cmpl	%r15d, %edi
	jbe	.LBB67_6
# %bb.5:                                #   in Loop: Header=BB67_3 Depth=1
	movq	(%rdx,%rbx), %rdi
	movl	%r15d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbx)
                                        # kill: def $al killed $al def $rax
	movq	16(%r14), %rcx
	jmp	.LBB67_6
.LBB67_1:
	xorl	%eax, %eax
.LBB67_7:
	xorb	(%r14), %al
	movb	%al, (%r14)
	movb	6(%r14), %cl
	js	.LBB67_8
# %bb.10:
	andb	$127, %cl
	movb	%cl, 6(%r14)
	testb	%al, %al
	jne	.LBB67_9
# %bb.11:
	orb	$2, %cl
	jmp	.LBB67_12
.LBB67_8:
	orb	$-128, %cl
	movb	%cl, 6(%r14)
.LBB67_9:
	andb	$-3, %cl
.LBB67_12:
	movb	%cl, 6(%r14)
	movl	$2, %eax
	addq	$8, %rsp
	.cfi_def_cfa_offset 40
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%r12
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end67:
	.size	EOR_imm, .Lfunc_end67-EOR_imm
	.cfi_endproc
                                        # -- End function
	.globl	EOR_zpg                 # -- Begin function EOR_zpg
	.p2align	4, 0x90
	.type	EOR_zpg,@function
EOR_zpg:                                # @EOR_zpg
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	pushq	%rax
	.cfi_def_cfa_offset 48
	.cfi_offset %rbx, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%rdi, %r14
	movzwl	4(%rdi), %r15d
	movq	16(%rdi), %rcx
	testq	%rcx, %rcx
	je	.LBB68_1
# %bb.2:
	movl	$24, %ebx
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	jmp	.LBB68_3
	.p2align	4, 0x90
.LBB68_6:                               #   in Loop: Header=BB68_3 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rcx, %rbp
	jae	.LBB68_7
.LBB68_3:                               # =>This Inner Loop Header: Depth=1
	movq	8(%r14), %rdx
	movzwl	-8(%rdx,%rbx), %esi
	cmpw	%si, %r15w
	jb	.LBB68_6
# %bb.4:                                #   in Loop: Header=BB68_3 Depth=1
	movzwl	-6(%rdx,%rbx), %edi
	addl	%esi, %edi
	cmpl	%r15d, %edi
	jbe	.LBB68_6
# %bb.5:                                #   in Loop: Header=BB68_3 Depth=1
	movq	(%rdx,%rbx), %rdi
	movl	%r15d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbx)
                                        # kill: def $al killed $al def $rax
	movq	16(%r14), %rcx
	jmp	.LBB68_6
.LBB68_7:
	addw	$1, 4(%r14)
	testq	%rcx, %rcx
	je	.LBB68_8
# %bb.9:
	movzbl	%al, %r15d
	movl	$24, %ebx
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	jmp	.LBB68_10
	.p2align	4, 0x90
.LBB68_13:                              #   in Loop: Header=BB68_10 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rcx, %rbp
	jae	.LBB68_14
.LBB68_10:                              # =>This Inner Loop Header: Depth=1
	movq	8(%r14), %rdx
	movzwl	-8(%rdx,%rbx), %esi
	cmpw	%r15w, %si
	ja	.LBB68_13
# %bb.11:                               #   in Loop: Header=BB68_10 Depth=1
	movzwl	-6(%rdx,%rbx), %edi
	addl	%esi, %edi
	cmpl	%r15d, %edi
	jbe	.LBB68_13
# %bb.12:                               #   in Loop: Header=BB68_10 Depth=1
	movq	(%rdx,%rbx), %rdi
	movzwl	%r15w, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbx)
                                        # kill: def $al killed $al def $rax
	movq	16(%r14), %rcx
	jmp	.LBB68_13
.LBB68_1:
	addl	$1, %r15d
	movw	%r15w, 4(%r14)
	xorl	%eax, %eax
.LBB68_14:
	xorb	(%r14), %al
	movb	%al, (%r14)
	movb	6(%r14), %cl
	js	.LBB68_15
.LBB68_17:
	andb	$127, %cl
	movb	%cl, 6(%r14)
	testb	%al, %al
	jne	.LBB68_16
# %bb.18:
	orb	$2, %cl
	jmp	.LBB68_19
.LBB68_8:
	xorl	%eax, %eax
	xorb	(%r14), %al
	movb	%al, (%r14)
	movb	6(%r14), %cl
	jns	.LBB68_17
.LBB68_15:
	orb	$-128, %cl
	movb	%cl, 6(%r14)
.LBB68_16:
	andb	$-3, %cl
.LBB68_19:
	movb	%cl, 6(%r14)
	movl	$3, %eax
	addq	$8, %rsp
	.cfi_def_cfa_offset 40
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end68:
	.size	EOR_zpg, .Lfunc_end68-EOR_zpg
	.cfi_endproc
                                        # -- End function
	.globl	EOR_zpgx                # -- Begin function EOR_zpgx
	.p2align	4, 0x90
	.type	EOR_zpgx,@function
EOR_zpgx:                               # @EOR_zpgx
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r12
	.cfi_def_cfa_offset 40
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset %rbx, -48
	.cfi_offset %r12, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%rdi, %r12
	movzwl	4(%rdi), %r15d
	movq	16(%rdi), %rcx
	testq	%rcx, %rcx
	je	.LBB69_1
# %bb.2:
	movzwl	%r15w, %r14d
	movl	$24, %ebp
	xorl	%eax, %eax
	xorl	%ebx, %ebx
	jmp	.LBB69_3
	.p2align	4, 0x90
.LBB69_6:                               #   in Loop: Header=BB69_3 Depth=1
	addq	$1, %rbx
	addq	$32, %rbp
	cmpq	%rcx, %rbx
	jae	.LBB69_7
.LBB69_3:                               # =>This Inner Loop Header: Depth=1
	movq	8(%r12), %rdx
	movzwl	-8(%rdx,%rbp), %esi
	cmpw	%si, %r15w
	jb	.LBB69_6
# %bb.4:                                #   in Loop: Header=BB69_3 Depth=1
	movzwl	-6(%rdx,%rbp), %edi
	addl	%esi, %edi
	cmpl	%r14d, %edi
	jbe	.LBB69_6
# %bb.5:                                #   in Loop: Header=BB69_3 Depth=1
	movq	(%rdx,%rbp), %rdi
	movl	%r15d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbp)
                                        # kill: def $al killed $al def $rax
	movq	16(%r12), %rcx
	jmp	.LBB69_6
.LBB69_7:
	movzwl	4(%r12), %r15d
	jmp	.LBB69_8
.LBB69_1:
	xorl	%ecx, %ecx
	xorl	%eax, %eax
.LBB69_8:
	addb	1(%r12), %al
	addl	$1, %r15d
	movw	%r15w, 4(%r12)
	testq	%rcx, %rcx
	je	.LBB69_9
# %bb.10:
	movzbl	%al, %r15d
	movzwl	%r15w, %r14d
	movl	$24, %ebp
	xorl	%eax, %eax
	xorl	%ebx, %ebx
	jmp	.LBB69_11
	.p2align	4, 0x90
.LBB69_14:                              #   in Loop: Header=BB69_11 Depth=1
	addq	$1, %rbx
	addq	$32, %rbp
	cmpq	%rcx, %rbx
	jae	.LBB69_15
.LBB69_11:                              # =>This Inner Loop Header: Depth=1
	movq	8(%r12), %rdx
	movzwl	-8(%rdx,%rbp), %esi
	cmpw	%r15w, %si
	ja	.LBB69_14
# %bb.12:                               #   in Loop: Header=BB69_11 Depth=1
	movzwl	-6(%rdx,%rbp), %edi
	addl	%esi, %edi
	cmpl	%r14d, %edi
	jbe	.LBB69_14
# %bb.13:                               #   in Loop: Header=BB69_11 Depth=1
	movq	(%rdx,%rbp), %rdi
	movl	%r14d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbp)
                                        # kill: def $al killed $al def $rax
	movq	16(%r12), %rcx
	jmp	.LBB69_14
.LBB69_9:
	xorl	%eax, %eax
.LBB69_15:
	xorb	(%r12), %al
	movb	%al, (%r12)
	movb	6(%r12), %cl
	js	.LBB69_16
# %bb.18:
	andb	$127, %cl
	movb	%cl, 6(%r12)
	testb	%al, %al
	jne	.LBB69_17
# %bb.19:
	orb	$2, %cl
	jmp	.LBB69_20
.LBB69_16:
	orb	$-128, %cl
	movb	%cl, 6(%r12)
.LBB69_17:
	andb	$-3, %cl
.LBB69_20:
	movb	%cl, 6(%r12)
	movl	$4, %eax
	popq	%rbx
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end69:
	.size	EOR_zpgx, .Lfunc_end69-EOR_zpgx
	.cfi_endproc
                                        # -- End function
	.globl	EOR_abss                # -- Begin function EOR_abss
	.p2align	4, 0x90
	.type	EOR_abss,@function
EOR_abss:                               # @EOR_abss
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r13
	.cfi_def_cfa_offset 40
	pushq	%r12
	.cfi_def_cfa_offset 48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	pushq	%rax
	.cfi_def_cfa_offset 64
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%rdi, %r12
	movzwl	4(%rdi), %r13d
	movq	16(%rdi), %rcx
	testq	%rcx, %rcx
	je	.LBB70_12
# %bb.1:
	movzwl	%r13w, %r14d
	movl	$24, %ebx
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	jmp	.LBB70_3
	.p2align	4, 0x90
.LBB70_2:                               #   in Loop: Header=BB70_3 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rcx, %rbp
	jae	.LBB70_6
.LBB70_3:                               # =>This Inner Loop Header: Depth=1
	movq	8(%r12), %rdx
	movzwl	-8(%rdx,%rbx), %esi
	cmpw	%si, %r13w
	jb	.LBB70_2
# %bb.4:                                #   in Loop: Header=BB70_3 Depth=1
	movzwl	-6(%rdx,%rbx), %edi
	addl	%esi, %edi
	cmpl	%r14d, %edi
	jbe	.LBB70_2
# %bb.5:                                #   in Loop: Header=BB70_3 Depth=1
	movq	(%rdx,%rbx), %rdi
	movl	%r13d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbx)
                                        # kill: def $al killed $al def $rax
	movq	16(%r12), %rcx
	jmp	.LBB70_2
.LBB70_6:
	movl	4(%r12), %r13d
	testq	%rcx, %rcx
	je	.LBB70_12
# %bb.7:
	movzbl	%al, %r14d
	addl	$1, %r13d
	movzwl	%r13w, %r15d
	movl	$24, %ebx
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	jmp	.LBB70_9
	.p2align	4, 0x90
.LBB70_8:                               #   in Loop: Header=BB70_9 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rcx, %rbp
	jae	.LBB70_13
.LBB70_9:                               # =>This Inner Loop Header: Depth=1
	movq	8(%r12), %rdx
	movzwl	-8(%rdx,%rbx), %esi
	cmpw	%si, %r13w
	jb	.LBB70_8
# %bb.10:                               #   in Loop: Header=BB70_9 Depth=1
	movzwl	-6(%rdx,%rbx), %edi
	addl	%esi, %edi
	cmpl	%r15d, %edi
	jbe	.LBB70_8
# %bb.11:                               #   in Loop: Header=BB70_9 Depth=1
	movq	(%rdx,%rbx), %rdi
	movl	%r13d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbx)
                                        # kill: def $al killed $al def $rax
	movq	16(%r12), %rcx
	jmp	.LBB70_8
.LBB70_12:
	addl	$2, %r13d
	movw	%r13w, 4(%r12)
.LBB70_19:
	xorl	%eax, %eax
.LBB70_20:
	xorb	(%r12), %al
	movb	%al, (%r12)
	movb	6(%r12), %cl
	js	.LBB70_23
# %bb.21:
	andb	$127, %cl
	movb	%cl, 6(%r12)
	testb	%al, %al
	jne	.LBB70_24
# %bb.22:
	orb	$2, %cl
	jmp	.LBB70_25
.LBB70_13:
	addw	$2, 4(%r12)
	testq	%rcx, %rcx
	je	.LBB70_19
# %bb.14:
	movzbl	%al, %eax
	shll	$8, %eax
	movzwl	%r14w, %r15d
	orl	%eax, %r15d
	movzwl	%r15w, %r14d
	movl	$24, %ebp
	xorl	%eax, %eax
	xorl	%ebx, %ebx
	jmp	.LBB70_16
	.p2align	4, 0x90
.LBB70_15:                              #   in Loop: Header=BB70_16 Depth=1
	addq	$1, %rbx
	addq	$32, %rbp
	cmpq	%rcx, %rbx
	jae	.LBB70_20
.LBB70_16:                              # =>This Inner Loop Header: Depth=1
	movq	8(%r12), %rdx
	movzwl	-8(%rdx,%rbp), %esi
	cmpw	%si, %r15w
	jb	.LBB70_15
# %bb.17:                               #   in Loop: Header=BB70_16 Depth=1
	movzwl	-6(%rdx,%rbp), %edi
	addl	%esi, %edi
	cmpl	%r14d, %edi
	jbe	.LBB70_15
# %bb.18:                               #   in Loop: Header=BB70_16 Depth=1
	movq	(%rdx,%rbp), %rdi
	movl	%r15d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbp)
                                        # kill: def $al killed $al def $rax
	movq	16(%r12), %rcx
	jmp	.LBB70_15
.LBB70_23:
	orb	$-128, %cl
	movb	%cl, 6(%r12)
.LBB70_24:
	andb	$-3, %cl
.LBB70_25:
	movb	%cl, 6(%r12)
	movl	$4, %eax
	addq	$8, %rsp
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%r12
	.cfi_def_cfa_offset 40
	popq	%r13
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end70:
	.size	EOR_abss, .Lfunc_end70-EOR_abss
	.cfi_endproc
                                        # -- End function
	.globl	EOR_absx                # -- Begin function EOR_absx
	.p2align	4, 0x90
	.type	EOR_absx,@function
EOR_absx:                               # @EOR_absx
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r13
	.cfi_def_cfa_offset 40
	pushq	%r12
	.cfi_def_cfa_offset 48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	pushq	%rax
	.cfi_def_cfa_offset 64
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%rdi, %r12
	movzwl	4(%rdi), %r13d
	movq	16(%rdi), %rcx
	testq	%rcx, %rcx
	je	.LBB71_13
# %bb.1:
	movzwl	%r13w, %r14d
	movl	$24, %ebx
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	jmp	.LBB71_3
	.p2align	4, 0x90
.LBB71_2:                               #   in Loop: Header=BB71_3 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rcx, %rbp
	jae	.LBB71_6
.LBB71_3:                               # =>This Inner Loop Header: Depth=1
	movq	8(%r12), %rdx
	movzwl	-8(%rdx,%rbx), %esi
	cmpw	%si, %r13w
	jb	.LBB71_2
# %bb.4:                                #   in Loop: Header=BB71_3 Depth=1
	movzwl	-6(%rdx,%rbx), %edi
	addl	%esi, %edi
	cmpl	%r14d, %edi
	jbe	.LBB71_2
# %bb.5:                                #   in Loop: Header=BB71_3 Depth=1
	movq	(%rdx,%rbx), %rdi
	movl	%r13d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbx)
                                        # kill: def $al killed $al def $rax
	movq	16(%r12), %rcx
	jmp	.LBB71_2
.LBB71_6:
	movzbl	%al, %r14d
	movl	4(%r12), %r13d
	testq	%rcx, %rcx
	je	.LBB71_14
# %bb.7:
	addl	$1, %r13d
	movzwl	%r13w, %r15d
	movl	$24, %ebx
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	jmp	.LBB71_9
	.p2align	4, 0x90
.LBB71_8:                               #   in Loop: Header=BB71_9 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rcx, %rbp
	jae	.LBB71_12
.LBB71_9:                               # =>This Inner Loop Header: Depth=1
	movq	8(%r12), %rdx
	movzwl	-8(%rdx,%rbx), %esi
	cmpw	%si, %r13w
	jb	.LBB71_8
# %bb.10:                               #   in Loop: Header=BB71_9 Depth=1
	movzwl	-6(%rdx,%rbx), %edi
	addl	%esi, %edi
	cmpl	%r15d, %edi
	jbe	.LBB71_8
# %bb.11:                               #   in Loop: Header=BB71_9 Depth=1
	movq	(%rdx,%rbx), %rdi
	movl	%r13d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbx)
                                        # kill: def $al killed $al def $rax
	movq	16(%r12), %rcx
	jmp	.LBB71_8
.LBB71_12:
	movzwl	4(%r12), %r13d
	jmp	.LBB71_16
.LBB71_13:
	xorl	%ecx, %ecx
	xorl	%r14d, %r14d
	jmp	.LBB71_15
.LBB71_14:
	xorl	%ecx, %ecx
.LBB71_15:
	xorl	%eax, %eax
.LBB71_16:
	movzbl	1(%r12), %edx
	addl	$2, %r13d
	movw	%r13w, 4(%r12)
	testq	%rcx, %rcx
	je	.LBB71_22
# %bb.17:
	movzbl	%al, %eax
	shll	$8, %eax
	movzwl	%r14w, %r15d
	orl	%eax, %r15d
	addl	%edx, %r15d
	movzwl	%r15w, %r14d
	movl	$24, %ebx
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	jmp	.LBB71_19
	.p2align	4, 0x90
.LBB71_18:                              #   in Loop: Header=BB71_19 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rcx, %rbp
	jae	.LBB71_23
.LBB71_19:                              # =>This Inner Loop Header: Depth=1
	movq	8(%r12), %rdx
	movzwl	-8(%rdx,%rbx), %esi
	cmpw	%si, %r15w
	jb	.LBB71_18
# %bb.20:                               #   in Loop: Header=BB71_19 Depth=1
	movzwl	-6(%rdx,%rbx), %edi
	addl	%esi, %edi
	cmpl	%r14d, %edi
	jbe	.LBB71_18
# %bb.21:                               #   in Loop: Header=BB71_19 Depth=1
	movq	(%rdx,%rbx), %rdi
	movl	%r15d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbx)
                                        # kill: def $al killed $al def $rax
	movq	16(%r12), %rcx
	jmp	.LBB71_18
.LBB71_22:
	xorl	%eax, %eax
.LBB71_23:
	xorb	(%r12), %al
	movb	%al, (%r12)
	movb	6(%r12), %cl
	js	.LBB71_26
# %bb.24:
	andb	$127, %cl
	movb	%cl, 6(%r12)
	testb	%al, %al
	jne	.LBB71_27
# %bb.25:
	orb	$2, %cl
	jmp	.LBB71_28
.LBB71_26:
	orb	$-128, %cl
	movb	%cl, 6(%r12)
.LBB71_27:
	andb	$-3, %cl
.LBB71_28:
	movb	%cl, 6(%r12)
	movl	$4, %eax
	addq	$8, %rsp
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%r12
	.cfi_def_cfa_offset 40
	popq	%r13
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end71:
	.size	EOR_absx, .Lfunc_end71-EOR_absx
	.cfi_endproc
                                        # -- End function
	.globl	EOR_absy                # -- Begin function EOR_absy
	.p2align	4, 0x90
	.type	EOR_absy,@function
EOR_absy:                               # @EOR_absy
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r13
	.cfi_def_cfa_offset 40
	pushq	%r12
	.cfi_def_cfa_offset 48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	pushq	%rax
	.cfi_def_cfa_offset 64
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%rdi, %r12
	movzwl	4(%rdi), %r13d
	movq	16(%rdi), %rcx
	testq	%rcx, %rcx
	je	.LBB72_13
# %bb.1:
	movzwl	%r13w, %r14d
	movl	$24, %ebx
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	jmp	.LBB72_3
	.p2align	4, 0x90
.LBB72_2:                               #   in Loop: Header=BB72_3 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rcx, %rbp
	jae	.LBB72_6
.LBB72_3:                               # =>This Inner Loop Header: Depth=1
	movq	8(%r12), %rdx
	movzwl	-8(%rdx,%rbx), %esi
	cmpw	%si, %r13w
	jb	.LBB72_2
# %bb.4:                                #   in Loop: Header=BB72_3 Depth=1
	movzwl	-6(%rdx,%rbx), %edi
	addl	%esi, %edi
	cmpl	%r14d, %edi
	jbe	.LBB72_2
# %bb.5:                                #   in Loop: Header=BB72_3 Depth=1
	movq	(%rdx,%rbx), %rdi
	movl	%r13d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbx)
                                        # kill: def $al killed $al def $rax
	movq	16(%r12), %rcx
	jmp	.LBB72_2
.LBB72_6:
	movzbl	%al, %r14d
	movl	4(%r12), %r13d
	testq	%rcx, %rcx
	je	.LBB72_14
# %bb.7:
	addl	$1, %r13d
	movzwl	%r13w, %r15d
	movl	$24, %ebx
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	jmp	.LBB72_9
	.p2align	4, 0x90
.LBB72_8:                               #   in Loop: Header=BB72_9 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rcx, %rbp
	jae	.LBB72_12
.LBB72_9:                               # =>This Inner Loop Header: Depth=1
	movq	8(%r12), %rdx
	movzwl	-8(%rdx,%rbx), %esi
	cmpw	%si, %r13w
	jb	.LBB72_8
# %bb.10:                               #   in Loop: Header=BB72_9 Depth=1
	movzwl	-6(%rdx,%rbx), %edi
	addl	%esi, %edi
	cmpl	%r15d, %edi
	jbe	.LBB72_8
# %bb.11:                               #   in Loop: Header=BB72_9 Depth=1
	movq	(%rdx,%rbx), %rdi
	movl	%r13d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbx)
                                        # kill: def $al killed $al def $rax
	movq	16(%r12), %rcx
	jmp	.LBB72_8
.LBB72_12:
	movzwl	4(%r12), %r13d
	jmp	.LBB72_16
.LBB72_13:
	xorl	%ecx, %ecx
	xorl	%r14d, %r14d
	jmp	.LBB72_15
.LBB72_14:
	xorl	%ecx, %ecx
.LBB72_15:
	xorl	%eax, %eax
.LBB72_16:
	movzbl	2(%r12), %edx
	addl	$2, %r13d
	movw	%r13w, 4(%r12)
	testq	%rcx, %rcx
	je	.LBB72_22
# %bb.17:
	movzbl	%al, %eax
	shll	$8, %eax
	movzwl	%r14w, %r15d
	orl	%eax, %r15d
	addl	%edx, %r15d
	movzwl	%r15w, %r14d
	movl	$24, %ebx
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	jmp	.LBB72_19
	.p2align	4, 0x90
.LBB72_18:                              #   in Loop: Header=BB72_19 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rcx, %rbp
	jae	.LBB72_23
.LBB72_19:                              # =>This Inner Loop Header: Depth=1
	movq	8(%r12), %rdx
	movzwl	-8(%rdx,%rbx), %esi
	cmpw	%si, %r15w
	jb	.LBB72_18
# %bb.20:                               #   in Loop: Header=BB72_19 Depth=1
	movzwl	-6(%rdx,%rbx), %edi
	addl	%esi, %edi
	cmpl	%r14d, %edi
	jbe	.LBB72_18
# %bb.21:                               #   in Loop: Header=BB72_19 Depth=1
	movq	(%rdx,%rbx), %rdi
	movl	%r15d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbx)
                                        # kill: def $al killed $al def $rax
	movq	16(%r12), %rcx
	jmp	.LBB72_18
.LBB72_22:
	xorl	%eax, %eax
.LBB72_23:
	xorb	(%r12), %al
	movb	%al, (%r12)
	movb	6(%r12), %cl
	js	.LBB72_26
# %bb.24:
	andb	$127, %cl
	movb	%cl, 6(%r12)
	testb	%al, %al
	jne	.LBB72_27
# %bb.25:
	orb	$2, %cl
	jmp	.LBB72_28
.LBB72_26:
	orb	$-128, %cl
	movb	%cl, 6(%r12)
.LBB72_27:
	andb	$-3, %cl
.LBB72_28:
	movb	%cl, 6(%r12)
	movl	$4, %eax
	addq	$8, %rsp
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%r12
	.cfi_def_cfa_offset 40
	popq	%r13
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end72:
	.size	EOR_absy, .Lfunc_end72-EOR_absy
	.cfi_endproc
                                        # -- End function
	.globl	EOR_xind                # -- Begin function EOR_xind
	.p2align	4, 0x90
	.type	EOR_xind,@function
EOR_xind:                               # @EOR_xind
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r12
	.cfi_def_cfa_offset 40
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset %rbx, -48
	.cfi_offset %r12, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%rdi, %r12
	callq	xind
	movq	16(%r12), %rcx
	testq	%rcx, %rcx
	je	.LBB73_1
# %bb.2:
	movl	%eax, %r15d
	movzwl	%ax, %r14d
	movl	$24, %ebp
	xorl	%eax, %eax
	xorl	%ebx, %ebx
	jmp	.LBB73_3
	.p2align	4, 0x90
.LBB73_6:                               #   in Loop: Header=BB73_3 Depth=1
	addq	$1, %rbx
	addq	$32, %rbp
	cmpq	%rcx, %rbx
	jae	.LBB73_7
.LBB73_3:                               # =>This Inner Loop Header: Depth=1
	movq	8(%r12), %rdx
	movzwl	-8(%rdx,%rbp), %esi
	cmpw	%si, %r15w
	jb	.LBB73_6
# %bb.4:                                #   in Loop: Header=BB73_3 Depth=1
	movzwl	-6(%rdx,%rbp), %edi
	addl	%esi, %edi
	cmpl	%r14d, %edi
	jbe	.LBB73_6
# %bb.5:                                #   in Loop: Header=BB73_3 Depth=1
	movq	(%rdx,%rbp), %rdi
	movl	%r14d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbp)
                                        # kill: def $al killed $al def $rax
	movq	16(%r12), %rcx
	jmp	.LBB73_6
.LBB73_1:
	xorl	%eax, %eax
.LBB73_7:
	xorb	(%r12), %al
	movb	%al, (%r12)
	movb	6(%r12), %cl
	js	.LBB73_8
# %bb.10:
	andb	$127, %cl
	movb	%cl, 6(%r12)
	testb	%al, %al
	jne	.LBB73_9
# %bb.11:
	orb	$2, %cl
	jmp	.LBB73_12
.LBB73_8:
	orb	$-128, %cl
	movb	%cl, 6(%r12)
.LBB73_9:
	andb	$-3, %cl
.LBB73_12:
	movb	%cl, 6(%r12)
	movl	$6, %eax
	popq	%rbx
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end73:
	.size	EOR_xind, .Lfunc_end73-EOR_xind
	.cfi_endproc
                                        # -- End function
	.globl	EOR_indy                # -- Begin function EOR_indy
	.p2align	4, 0x90
	.type	EOR_indy,@function
EOR_indy:                               # @EOR_indy
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r12
	.cfi_def_cfa_offset 40
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset %rbx, -48
	.cfi_offset %r12, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%rdi, %r12
	callq	indy
	movq	16(%r12), %rcx
	testq	%rcx, %rcx
	je	.LBB74_1
# %bb.2:
	movl	%eax, %r15d
	movzwl	%ax, %r14d
	movl	$24, %ebp
	xorl	%eax, %eax
	xorl	%ebx, %ebx
	jmp	.LBB74_3
	.p2align	4, 0x90
.LBB74_6:                               #   in Loop: Header=BB74_3 Depth=1
	addq	$1, %rbx
	addq	$32, %rbp
	cmpq	%rcx, %rbx
	jae	.LBB74_7
.LBB74_3:                               # =>This Inner Loop Header: Depth=1
	movq	8(%r12), %rdx
	movzwl	-8(%rdx,%rbp), %esi
	cmpw	%si, %r15w
	jb	.LBB74_6
# %bb.4:                                #   in Loop: Header=BB74_3 Depth=1
	movzwl	-6(%rdx,%rbp), %edi
	addl	%esi, %edi
	cmpl	%r14d, %edi
	jbe	.LBB74_6
# %bb.5:                                #   in Loop: Header=BB74_3 Depth=1
	movq	(%rdx,%rbp), %rdi
	movl	%r14d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbp)
                                        # kill: def $al killed $al def $rax
	movq	16(%r12), %rcx
	jmp	.LBB74_6
.LBB74_1:
	xorl	%eax, %eax
.LBB74_7:
	xorb	(%r12), %al
	movb	%al, (%r12)
	movb	6(%r12), %cl
	js	.LBB74_8
# %bb.10:
	andb	$127, %cl
	movb	%cl, 6(%r12)
	testb	%al, %al
	jne	.LBB74_9
# %bb.11:
	orb	$2, %cl
	jmp	.LBB74_12
.LBB74_8:
	orb	$-128, %cl
	movb	%cl, 6(%r12)
.LBB74_9:
	andb	$-3, %cl
.LBB74_12:
	movb	%cl, 6(%r12)
	movl	$5, %eax
	popq	%rbx
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end74:
	.size	EOR_indy, .Lfunc_end74-EOR_indy
	.cfi_endproc
                                        # -- End function
	.globl	ADC_imm                 # -- Begin function ADC_imm
	.p2align	4, 0x90
	.type	ADC_imm,@function
ADC_imm:                                # @ADC_imm
	.cfi_startproc
# %bb.0:
	pushq	%r15
	.cfi_def_cfa_offset 16
	pushq	%r14
	.cfi_def_cfa_offset 24
	pushq	%r12
	.cfi_def_cfa_offset 32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	pushq	%rax
	.cfi_def_cfa_offset 48
	.cfi_offset %rbx, -40
	.cfi_offset %r12, -32
	.cfi_offset %r14, -24
	.cfi_offset %r15, -16
	movq	%rdi, %r14
	movzwl	4(%rdi), %r15d
	leal	1(%r15), %eax
	movw	%ax, 4(%rdi)
	movq	16(%rdi), %rcx
	testq	%rcx, %rcx
	je	.LBB75_1
# %bb.2:
	movl	$24, %ebx
	xorl	%eax, %eax
	xorl	%r12d, %r12d
	jmp	.LBB75_3
	.p2align	4, 0x90
.LBB75_6:                               #   in Loop: Header=BB75_3 Depth=1
	addq	$1, %r12
	addq	$32, %rbx
	cmpq	%rcx, %r12
	jae	.LBB75_7
.LBB75_3:                               # =>This Inner Loop Header: Depth=1
	movq	8(%r14), %rdx
	movzwl	-8(%rdx,%rbx), %esi
	cmpw	%si, %r15w
	jb	.LBB75_6
# %bb.4:                                #   in Loop: Header=BB75_3 Depth=1
	movzwl	-6(%rdx,%rbx), %edi
	addl	%esi, %edi
	cmpl	%r15d, %edi
	jbe	.LBB75_6
# %bb.5:                                #   in Loop: Header=BB75_3 Depth=1
	movq	(%rdx,%rbx), %rdi
	movl	%r15d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbx)
                                        # kill: def $al killed $al def $rax
	movq	16(%r14), %rcx
	jmp	.LBB75_6
.LBB75_1:
	xorl	%eax, %eax
.LBB75_7:
	movzbl	%al, %eax
	movzbl	(%r14), %ecx
	leal	(%rcx,%rax), %esi
	movzbl	6(%r14), %edi
	movl	%edi, %edx
	andl	$1, %edx
	addl	%esi, %edx
	movl	%edi, %ebx
	andb	$127, %bl
	orb	$-128, %dil
	movzbl	%dil, %esi
	movzbl	%bl, %edi
	testb	%dl, %dl
	cmovsl	%esi, %edi
	movl	%edi, %ebx
	andb	$-3, %bl
	orb	$2, %dil
	testb	%dl, %dl
	movzbl	%dil, %esi
	movzbl	%bl, %edi
	cmovel	%esi, %edi
	movb	%dl, (%r14)
	xorb	%al, %cl
	xorb	$-128, %cl
	movl	%edi, %ebx
	andb	$-2, %bl
	orb	$1, %dil
	testl	$256, %edx              # imm = 0x100
	movzbl	%bl, %esi
	movzbl	%dil, %edi
	cmovel	%esi, %edi
	xorb	%dl, %al
	movl	%edi, %edx
	andb	$-65, %dl
	orb	$64, %dil
	testb	%cl, %al
	movzbl	%dil, %eax
	movzbl	%dl, %ecx
	cmovsl	%eax, %ecx
	movb	%cl, 6(%r14)
	movl	$2, %eax
	addq	$8, %rsp
	.cfi_def_cfa_offset 40
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%r12
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end75:
	.size	ADC_imm, .Lfunc_end75-ADC_imm
	.cfi_endproc
                                        # -- End function
	.globl	ADC_zpg                 # -- Begin function ADC_zpg
	.p2align	4, 0x90
	.type	ADC_zpg,@function
ADC_zpg:                                # @ADC_zpg
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	pushq	%rax
	.cfi_def_cfa_offset 48
	.cfi_offset %rbx, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%rdi, %r14
	movzwl	4(%rdi), %r15d
	movq	16(%rdi), %rcx
	testq	%rcx, %rcx
	je	.LBB76_12
# %bb.1:
	movl	$24, %ebx
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	jmp	.LBB76_3
	.p2align	4, 0x90
.LBB76_2:                               #   in Loop: Header=BB76_3 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rcx, %rbp
	jae	.LBB76_6
.LBB76_3:                               # =>This Inner Loop Header: Depth=1
	movq	8(%r14), %rdx
	movzwl	-8(%rdx,%rbx), %esi
	cmpw	%si, %r15w
	jb	.LBB76_2
# %bb.4:                                #   in Loop: Header=BB76_3 Depth=1
	movzwl	-6(%rdx,%rbx), %edi
	addl	%esi, %edi
	cmpl	%r15d, %edi
	jbe	.LBB76_2
# %bb.5:                                #   in Loop: Header=BB76_3 Depth=1
	movq	(%rdx,%rbx), %rdi
	movl	%r15d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbx)
                                        # kill: def $al killed $al def $rax
	movq	16(%r14), %rcx
	jmp	.LBB76_2
.LBB76_6:
	addw	$1, 4(%r14)
	testq	%rcx, %rcx
	je	.LBB76_13
# %bb.7:
	movzbl	%al, %r15d
	movl	$24, %ebx
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	jmp	.LBB76_9
	.p2align	4, 0x90
.LBB76_8:                               #   in Loop: Header=BB76_9 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rcx, %rbp
	jae	.LBB76_14
.LBB76_9:                               # =>This Inner Loop Header: Depth=1
	movq	8(%r14), %rdx
	movzwl	-8(%rdx,%rbx), %esi
	cmpw	%r15w, %si
	ja	.LBB76_8
# %bb.10:                               #   in Loop: Header=BB76_9 Depth=1
	movzwl	-6(%rdx,%rbx), %edi
	addl	%esi, %edi
	cmpl	%r15d, %edi
	jbe	.LBB76_8
# %bb.11:                               #   in Loop: Header=BB76_9 Depth=1
	movq	(%rdx,%rbx), %rdi
	movzwl	%r15w, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbx)
                                        # kill: def $al killed $al def $rax
	movq	16(%r14), %rcx
	jmp	.LBB76_8
.LBB76_12:
	addl	$1, %r15d
	movw	%r15w, 4(%r14)
.LBB76_13:
	xorl	%eax, %eax
.LBB76_14:
	movzbl	%al, %eax
	movzbl	(%r14), %ecx
	leal	(%rcx,%rax), %esi
	movzbl	6(%r14), %edi
	movl	%edi, %edx
	andl	$1, %edx
	addl	%esi, %edx
	movl	%edi, %ebx
	andb	$127, %bl
	orb	$-128, %dil
	movzbl	%dil, %esi
	movzbl	%bl, %edi
	testb	%dl, %dl
	cmovsl	%esi, %edi
	movl	%edi, %ebx
	andb	$-3, %bl
	orb	$2, %dil
	testb	%dl, %dl
	movzbl	%dil, %esi
	movzbl	%bl, %edi
	cmovel	%esi, %edi
	movb	%dl, (%r14)
	xorb	%al, %cl
	xorb	$-128, %cl
	movl	%edi, %ebx
	andb	$-2, %bl
	orb	$1, %dil
	testl	$256, %edx              # imm = 0x100
	movzbl	%bl, %esi
	movzbl	%dil, %edi
	cmovel	%esi, %edi
	xorb	%dl, %al
	movl	%edi, %edx
	andb	$-65, %dl
	orb	$64, %dil
	testb	%cl, %al
	movzbl	%dil, %eax
	movzbl	%dl, %ecx
	cmovsl	%eax, %ecx
	movb	%cl, 6(%r14)
	movl	$3, %eax
	addq	$8, %rsp
	.cfi_def_cfa_offset 40
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end76:
	.size	ADC_zpg, .Lfunc_end76-ADC_zpg
	.cfi_endproc
                                        # -- End function
	.globl	ADC_zpgx                # -- Begin function ADC_zpgx
	.p2align	4, 0x90
	.type	ADC_zpgx,@function
ADC_zpgx:                               # @ADC_zpgx
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r12
	.cfi_def_cfa_offset 40
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset %rbx, -48
	.cfi_offset %r12, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%rdi, %r15
	movzwl	4(%rdi), %r12d
	movq	16(%rdi), %rcx
	testq	%rcx, %rcx
	je	.LBB77_1
# %bb.2:
	movzwl	%r12w, %r14d
	movl	$24, %ebx
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	jmp	.LBB77_3
	.p2align	4, 0x90
.LBB77_6:                               #   in Loop: Header=BB77_3 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rcx, %rbp
	jae	.LBB77_7
.LBB77_3:                               # =>This Inner Loop Header: Depth=1
	movq	8(%r15), %rdx
	movzwl	-8(%rdx,%rbx), %esi
	cmpw	%si, %r12w
	jb	.LBB77_6
# %bb.4:                                #   in Loop: Header=BB77_3 Depth=1
	movzwl	-6(%rdx,%rbx), %edi
	addl	%esi, %edi
	cmpl	%r14d, %edi
	jbe	.LBB77_6
# %bb.5:                                #   in Loop: Header=BB77_3 Depth=1
	movq	(%rdx,%rbx), %rdi
	movl	%r12d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbx)
                                        # kill: def $al killed $al def $rax
	movq	16(%r15), %rcx
	jmp	.LBB77_6
.LBB77_7:
	movzwl	4(%r15), %r12d
	jmp	.LBB77_8
.LBB77_1:
	xorl	%ecx, %ecx
	xorl	%eax, %eax
.LBB77_8:
	addb	1(%r15), %al
	addl	$1, %r12d
	movw	%r12w, 4(%r15)
	testq	%rcx, %rcx
	je	.LBB77_9
# %bb.10:
	movzbl	%al, %r12d
	movzwl	%r12w, %r14d
	movl	$24, %ebx
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	jmp	.LBB77_11
	.p2align	4, 0x90
.LBB77_14:                              #   in Loop: Header=BB77_11 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rcx, %rbp
	jae	.LBB77_15
.LBB77_11:                              # =>This Inner Loop Header: Depth=1
	movq	8(%r15), %rdx
	movzwl	-8(%rdx,%rbx), %esi
	cmpw	%r12w, %si
	ja	.LBB77_14
# %bb.12:                               #   in Loop: Header=BB77_11 Depth=1
	movzwl	-6(%rdx,%rbx), %edi
	addl	%esi, %edi
	cmpl	%r14d, %edi
	jbe	.LBB77_14
# %bb.13:                               #   in Loop: Header=BB77_11 Depth=1
	movq	(%rdx,%rbx), %rdi
	movl	%r14d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbx)
                                        # kill: def $al killed $al def $rax
	movq	16(%r15), %rcx
	jmp	.LBB77_14
.LBB77_9:
	xorl	%eax, %eax
.LBB77_15:
	movzbl	%al, %eax
	movzbl	(%r15), %ecx
	leal	(%rcx,%rax), %esi
	movzbl	6(%r15), %edi
	movl	%edi, %edx
	andl	$1, %edx
	addl	%esi, %edx
	movl	%edi, %ebx
	andb	$127, %bl
	orb	$-128, %dil
	movzbl	%dil, %esi
	movzbl	%bl, %edi
	testb	%dl, %dl
	cmovsl	%esi, %edi
	movl	%edi, %ebx
	andb	$-3, %bl
	orb	$2, %dil
	testb	%dl, %dl
	movzbl	%dil, %esi
	movzbl	%bl, %edi
	cmovel	%esi, %edi
	movb	%dl, (%r15)
	xorb	%al, %cl
	xorb	$-128, %cl
	movl	%edi, %ebx
	andb	$-2, %bl
	orb	$1, %dil
	testl	$256, %edx              # imm = 0x100
	movzbl	%bl, %esi
	movzbl	%dil, %edi
	cmovel	%esi, %edi
	xorb	%dl, %al
	movl	%edi, %edx
	andb	$-65, %dl
	orb	$64, %dil
	testb	%cl, %al
	movzbl	%dil, %eax
	movzbl	%dl, %ecx
	cmovsl	%eax, %ecx
	movb	%cl, 6(%r15)
	movl	$4, %eax
	popq	%rbx
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end77:
	.size	ADC_zpgx, .Lfunc_end77-ADC_zpgx
	.cfi_endproc
                                        # -- End function
	.globl	ADC_abss                # -- Begin function ADC_abss
	.p2align	4, 0x90
	.type	ADC_abss,@function
ADC_abss:                               # @ADC_abss
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r13
	.cfi_def_cfa_offset 40
	pushq	%r12
	.cfi_def_cfa_offset 48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	pushq	%rax
	.cfi_def_cfa_offset 64
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%rdi, %r12
	movzwl	4(%rdi), %r13d
	movq	16(%rdi), %rcx
	testq	%rcx, %rcx
	je	.LBB78_12
# %bb.1:
	movzwl	%r13w, %r14d
	movl	$24, %ebx
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	jmp	.LBB78_3
	.p2align	4, 0x90
.LBB78_2:                               #   in Loop: Header=BB78_3 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rcx, %rbp
	jae	.LBB78_6
.LBB78_3:                               # =>This Inner Loop Header: Depth=1
	movq	8(%r12), %rdx
	movzwl	-8(%rdx,%rbx), %esi
	cmpw	%si, %r13w
	jb	.LBB78_2
# %bb.4:                                #   in Loop: Header=BB78_3 Depth=1
	movzwl	-6(%rdx,%rbx), %edi
	addl	%esi, %edi
	cmpl	%r14d, %edi
	jbe	.LBB78_2
# %bb.5:                                #   in Loop: Header=BB78_3 Depth=1
	movq	(%rdx,%rbx), %rdi
	movl	%r13d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbx)
                                        # kill: def $al killed $al def $rax
	movq	16(%r12), %rcx
	jmp	.LBB78_2
.LBB78_6:
	movl	4(%r12), %r13d
	testq	%rcx, %rcx
	je	.LBB78_12
# %bb.7:
	movzbl	%al, %r14d
	addl	$1, %r13d
	movzwl	%r13w, %r15d
	movl	$24, %ebx
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	jmp	.LBB78_9
	.p2align	4, 0x90
.LBB78_8:                               #   in Loop: Header=BB78_9 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rcx, %rbp
	jae	.LBB78_13
.LBB78_9:                               # =>This Inner Loop Header: Depth=1
	movq	8(%r12), %rdx
	movzwl	-8(%rdx,%rbx), %esi
	cmpw	%si, %r13w
	jb	.LBB78_8
# %bb.10:                               #   in Loop: Header=BB78_9 Depth=1
	movzwl	-6(%rdx,%rbx), %edi
	addl	%esi, %edi
	cmpl	%r15d, %edi
	jbe	.LBB78_8
# %bb.11:                               #   in Loop: Header=BB78_9 Depth=1
	movq	(%rdx,%rbx), %rdi
	movl	%r13d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbx)
                                        # kill: def $al killed $al def $rax
	movq	16(%r12), %rcx
	jmp	.LBB78_8
.LBB78_12:
	addl	$2, %r13d
	movw	%r13w, 4(%r12)
.LBB78_19:
	xorl	%eax, %eax
.LBB78_20:
	movzbl	%al, %eax
	movzbl	(%r12), %ecx
	leal	(%rcx,%rax), %esi
	movzbl	6(%r12), %edi
	movl	%edi, %edx
	andl	$1, %edx
	addl	%esi, %edx
	movl	%edi, %ebx
	andb	$127, %bl
	orb	$-128, %dil
	movzbl	%dil, %esi
	movzbl	%bl, %edi
	testb	%dl, %dl
	cmovsl	%esi, %edi
	movl	%edi, %ebx
	andb	$-3, %bl
	orb	$2, %dil
	testb	%dl, %dl
	movzbl	%dil, %esi
	movzbl	%bl, %edi
	cmovel	%esi, %edi
	movb	%dl, (%r12)
	xorb	%al, %cl
	xorb	$-128, %cl
	movl	%edi, %ebx
	andb	$-2, %bl
	orb	$1, %dil
	testl	$256, %edx              # imm = 0x100
	movzbl	%bl, %esi
	movzbl	%dil, %edi
	cmovel	%esi, %edi
	xorb	%dl, %al
	movl	%edi, %edx
	andb	$-65, %dl
	orb	$64, %dil
	testb	%cl, %al
	movzbl	%dil, %eax
	movzbl	%dl, %ecx
	cmovsl	%eax, %ecx
	movb	%cl, 6(%r12)
	movl	$4, %eax
	addq	$8, %rsp
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%r12
	.cfi_def_cfa_offset 40
	popq	%r13
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.LBB78_13:
	.cfi_def_cfa_offset 64
	addw	$2, 4(%r12)
	testq	%rcx, %rcx
	je	.LBB78_19
# %bb.14:
	movzbl	%al, %eax
	shll	$8, %eax
	movzwl	%r14w, %r15d
	orl	%eax, %r15d
	movzwl	%r15w, %r14d
	movl	$24, %ebp
	xorl	%eax, %eax
	xorl	%ebx, %ebx
	jmp	.LBB78_16
	.p2align	4, 0x90
.LBB78_15:                              #   in Loop: Header=BB78_16 Depth=1
	addq	$1, %rbx
	addq	$32, %rbp
	cmpq	%rcx, %rbx
	jae	.LBB78_20
.LBB78_16:                              # =>This Inner Loop Header: Depth=1
	movq	8(%r12), %rdx
	movzwl	-8(%rdx,%rbp), %esi
	cmpw	%si, %r15w
	jb	.LBB78_15
# %bb.17:                               #   in Loop: Header=BB78_16 Depth=1
	movzwl	-6(%rdx,%rbp), %edi
	addl	%esi, %edi
	cmpl	%r14d, %edi
	jbe	.LBB78_15
# %bb.18:                               #   in Loop: Header=BB78_16 Depth=1
	movq	(%rdx,%rbp), %rdi
	movl	%r15d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbp)
                                        # kill: def $al killed $al def $rax
	movq	16(%r12), %rcx
	jmp	.LBB78_15
.Lfunc_end78:
	.size	ADC_abss, .Lfunc_end78-ADC_abss
	.cfi_endproc
                                        # -- End function
	.globl	ADC_absx                # -- Begin function ADC_absx
	.p2align	4, 0x90
	.type	ADC_absx,@function
ADC_absx:                               # @ADC_absx
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r13
	.cfi_def_cfa_offset 40
	pushq	%r12
	.cfi_def_cfa_offset 48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	pushq	%rax
	.cfi_def_cfa_offset 64
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%rdi, %r12
	movzwl	4(%rdi), %r13d
	movq	16(%rdi), %rcx
	testq	%rcx, %rcx
	je	.LBB79_13
# %bb.1:
	movzwl	%r13w, %r14d
	movl	$24, %ebx
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	jmp	.LBB79_3
	.p2align	4, 0x90
.LBB79_2:                               #   in Loop: Header=BB79_3 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rcx, %rbp
	jae	.LBB79_6
.LBB79_3:                               # =>This Inner Loop Header: Depth=1
	movq	8(%r12), %rdx
	movzwl	-8(%rdx,%rbx), %esi
	cmpw	%si, %r13w
	jb	.LBB79_2
# %bb.4:                                #   in Loop: Header=BB79_3 Depth=1
	movzwl	-6(%rdx,%rbx), %edi
	addl	%esi, %edi
	cmpl	%r14d, %edi
	jbe	.LBB79_2
# %bb.5:                                #   in Loop: Header=BB79_3 Depth=1
	movq	(%rdx,%rbx), %rdi
	movl	%r13d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbx)
                                        # kill: def $al killed $al def $rax
	movq	16(%r12), %rcx
	jmp	.LBB79_2
.LBB79_6:
	movzbl	%al, %r14d
	movl	4(%r12), %r13d
	testq	%rcx, %rcx
	je	.LBB79_14
# %bb.7:
	addl	$1, %r13d
	movzwl	%r13w, %r15d
	movl	$24, %ebx
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	jmp	.LBB79_9
	.p2align	4, 0x90
.LBB79_8:                               #   in Loop: Header=BB79_9 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rcx, %rbp
	jae	.LBB79_12
.LBB79_9:                               # =>This Inner Loop Header: Depth=1
	movq	8(%r12), %rdx
	movzwl	-8(%rdx,%rbx), %esi
	cmpw	%si, %r13w
	jb	.LBB79_8
# %bb.10:                               #   in Loop: Header=BB79_9 Depth=1
	movzwl	-6(%rdx,%rbx), %edi
	addl	%esi, %edi
	cmpl	%r15d, %edi
	jbe	.LBB79_8
# %bb.11:                               #   in Loop: Header=BB79_9 Depth=1
	movq	(%rdx,%rbx), %rdi
	movl	%r13d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbx)
                                        # kill: def $al killed $al def $rax
	movq	16(%r12), %rcx
	jmp	.LBB79_8
.LBB79_12:
	movzwl	4(%r12), %r13d
	jmp	.LBB79_16
.LBB79_13:
	xorl	%ecx, %ecx
	xorl	%r14d, %r14d
	jmp	.LBB79_15
.LBB79_14:
	xorl	%ecx, %ecx
.LBB79_15:
	xorl	%eax, %eax
.LBB79_16:
	movzbl	1(%r12), %edx
	addl	$2, %r13d
	movw	%r13w, 4(%r12)
	testq	%rcx, %rcx
	je	.LBB79_22
# %bb.17:
	movzbl	%al, %eax
	shll	$8, %eax
	movzwl	%r14w, %r15d
	orl	%eax, %r15d
	addl	%edx, %r15d
	movzwl	%r15w, %r14d
	movl	$24, %ebx
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	jmp	.LBB79_19
	.p2align	4, 0x90
.LBB79_18:                              #   in Loop: Header=BB79_19 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rcx, %rbp
	jae	.LBB79_23
.LBB79_19:                              # =>This Inner Loop Header: Depth=1
	movq	8(%r12), %rdx
	movzwl	-8(%rdx,%rbx), %esi
	cmpw	%si, %r15w
	jb	.LBB79_18
# %bb.20:                               #   in Loop: Header=BB79_19 Depth=1
	movzwl	-6(%rdx,%rbx), %edi
	addl	%esi, %edi
	cmpl	%r14d, %edi
	jbe	.LBB79_18
# %bb.21:                               #   in Loop: Header=BB79_19 Depth=1
	movq	(%rdx,%rbx), %rdi
	movl	%r15d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbx)
                                        # kill: def $al killed $al def $rax
	movq	16(%r12), %rcx
	jmp	.LBB79_18
.LBB79_22:
	xorl	%eax, %eax
.LBB79_23:
	movzbl	%al, %eax
	movzbl	(%r12), %ecx
	leal	(%rcx,%rax), %esi
	movzbl	6(%r12), %edi
	movl	%edi, %edx
	andl	$1, %edx
	addl	%esi, %edx
	movl	%edi, %ebx
	andb	$127, %bl
	orb	$-128, %dil
	movzbl	%dil, %esi
	movzbl	%bl, %edi
	testb	%dl, %dl
	cmovsl	%esi, %edi
	movl	%edi, %ebx
	andb	$-3, %bl
	orb	$2, %dil
	testb	%dl, %dl
	movzbl	%dil, %esi
	movzbl	%bl, %edi
	cmovel	%esi, %edi
	movb	%dl, (%r12)
	xorb	%al, %cl
	xorb	$-128, %cl
	movl	%edi, %ebx
	andb	$-2, %bl
	orb	$1, %dil
	testl	$256, %edx              # imm = 0x100
	movzbl	%bl, %esi
	movzbl	%dil, %edi
	cmovel	%esi, %edi
	xorb	%dl, %al
	movl	%edi, %edx
	andb	$-65, %dl
	orb	$64, %dil
	testb	%cl, %al
	movzbl	%dil, %eax
	movzbl	%dl, %ecx
	cmovsl	%eax, %ecx
	movb	%cl, 6(%r12)
	movl	$4, %eax
	addq	$8, %rsp
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%r12
	.cfi_def_cfa_offset 40
	popq	%r13
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end79:
	.size	ADC_absx, .Lfunc_end79-ADC_absx
	.cfi_endproc
                                        # -- End function
	.globl	ADC_absy                # -- Begin function ADC_absy
	.p2align	4, 0x90
	.type	ADC_absy,@function
ADC_absy:                               # @ADC_absy
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r13
	.cfi_def_cfa_offset 40
	pushq	%r12
	.cfi_def_cfa_offset 48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	pushq	%rax
	.cfi_def_cfa_offset 64
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%rdi, %r12
	movzwl	4(%rdi), %r13d
	movq	16(%rdi), %rcx
	testq	%rcx, %rcx
	je	.LBB80_13
# %bb.1:
	movzwl	%r13w, %r14d
	movl	$24, %ebx
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	jmp	.LBB80_3
	.p2align	4, 0x90
.LBB80_2:                               #   in Loop: Header=BB80_3 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rcx, %rbp
	jae	.LBB80_6
.LBB80_3:                               # =>This Inner Loop Header: Depth=1
	movq	8(%r12), %rdx
	movzwl	-8(%rdx,%rbx), %esi
	cmpw	%si, %r13w
	jb	.LBB80_2
# %bb.4:                                #   in Loop: Header=BB80_3 Depth=1
	movzwl	-6(%rdx,%rbx), %edi
	addl	%esi, %edi
	cmpl	%r14d, %edi
	jbe	.LBB80_2
# %bb.5:                                #   in Loop: Header=BB80_3 Depth=1
	movq	(%rdx,%rbx), %rdi
	movl	%r13d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbx)
                                        # kill: def $al killed $al def $rax
	movq	16(%r12), %rcx
	jmp	.LBB80_2
.LBB80_6:
	movzbl	%al, %r14d
	movl	4(%r12), %r13d
	testq	%rcx, %rcx
	je	.LBB80_14
# %bb.7:
	addl	$1, %r13d
	movzwl	%r13w, %r15d
	movl	$24, %ebx
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	jmp	.LBB80_9
	.p2align	4, 0x90
.LBB80_8:                               #   in Loop: Header=BB80_9 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rcx, %rbp
	jae	.LBB80_12
.LBB80_9:                               # =>This Inner Loop Header: Depth=1
	movq	8(%r12), %rdx
	movzwl	-8(%rdx,%rbx), %esi
	cmpw	%si, %r13w
	jb	.LBB80_8
# %bb.10:                               #   in Loop: Header=BB80_9 Depth=1
	movzwl	-6(%rdx,%rbx), %edi
	addl	%esi, %edi
	cmpl	%r15d, %edi
	jbe	.LBB80_8
# %bb.11:                               #   in Loop: Header=BB80_9 Depth=1
	movq	(%rdx,%rbx), %rdi
	movl	%r13d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbx)
                                        # kill: def $al killed $al def $rax
	movq	16(%r12), %rcx
	jmp	.LBB80_8
.LBB80_12:
	movzwl	4(%r12), %r13d
	jmp	.LBB80_16
.LBB80_13:
	xorl	%ecx, %ecx
	xorl	%r14d, %r14d
	jmp	.LBB80_15
.LBB80_14:
	xorl	%ecx, %ecx
.LBB80_15:
	xorl	%eax, %eax
.LBB80_16:
	movzbl	2(%r12), %edx
	addl	$2, %r13d
	movw	%r13w, 4(%r12)
	testq	%rcx, %rcx
	je	.LBB80_22
# %bb.17:
	movzbl	%al, %eax
	shll	$8, %eax
	movzwl	%r14w, %r15d
	orl	%eax, %r15d
	addl	%edx, %r15d
	movzwl	%r15w, %r14d
	movl	$24, %ebx
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	jmp	.LBB80_19
	.p2align	4, 0x90
.LBB80_18:                              #   in Loop: Header=BB80_19 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rcx, %rbp
	jae	.LBB80_23
.LBB80_19:                              # =>This Inner Loop Header: Depth=1
	movq	8(%r12), %rdx
	movzwl	-8(%rdx,%rbx), %esi
	cmpw	%si, %r15w
	jb	.LBB80_18
# %bb.20:                               #   in Loop: Header=BB80_19 Depth=1
	movzwl	-6(%rdx,%rbx), %edi
	addl	%esi, %edi
	cmpl	%r14d, %edi
	jbe	.LBB80_18
# %bb.21:                               #   in Loop: Header=BB80_19 Depth=1
	movq	(%rdx,%rbx), %rdi
	movl	%r15d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbx)
                                        # kill: def $al killed $al def $rax
	movq	16(%r12), %rcx
	jmp	.LBB80_18
.LBB80_22:
	xorl	%eax, %eax
.LBB80_23:
	movzbl	%al, %eax
	movzbl	(%r12), %ecx
	leal	(%rcx,%rax), %esi
	movzbl	6(%r12), %edi
	movl	%edi, %edx
	andl	$1, %edx
	addl	%esi, %edx
	movl	%edi, %ebx
	andb	$127, %bl
	orb	$-128, %dil
	movzbl	%dil, %esi
	movzbl	%bl, %edi
	testb	%dl, %dl
	cmovsl	%esi, %edi
	movl	%edi, %ebx
	andb	$-3, %bl
	orb	$2, %dil
	testb	%dl, %dl
	movzbl	%dil, %esi
	movzbl	%bl, %edi
	cmovel	%esi, %edi
	movb	%dl, (%r12)
	xorb	%al, %cl
	xorb	$-128, %cl
	movl	%edi, %ebx
	andb	$-2, %bl
	orb	$1, %dil
	testl	$256, %edx              # imm = 0x100
	movzbl	%bl, %esi
	movzbl	%dil, %edi
	cmovel	%esi, %edi
	xorb	%dl, %al
	movl	%edi, %edx
	andb	$-65, %dl
	orb	$64, %dil
	testb	%cl, %al
	movzbl	%dil, %eax
	movzbl	%dl, %ecx
	cmovsl	%eax, %ecx
	movb	%cl, 6(%r12)
	movl	$4, %eax
	addq	$8, %rsp
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%r12
	.cfi_def_cfa_offset 40
	popq	%r13
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end80:
	.size	ADC_absy, .Lfunc_end80-ADC_absy
	.cfi_endproc
                                        # -- End function
	.globl	ADC_xind                # -- Begin function ADC_xind
	.p2align	4, 0x90
	.type	ADC_xind,@function
ADC_xind:                               # @ADC_xind
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r12
	.cfi_def_cfa_offset 40
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset %rbx, -48
	.cfi_offset %r12, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%rdi, %r15
	callq	xind
	movq	16(%r15), %rcx
	testq	%rcx, %rcx
	je	.LBB81_1
# %bb.2:
	movl	%eax, %r12d
	movzwl	%ax, %r14d
	movl	$24, %ebx
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	jmp	.LBB81_3
	.p2align	4, 0x90
.LBB81_6:                               #   in Loop: Header=BB81_3 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rcx, %rbp
	jae	.LBB81_7
.LBB81_3:                               # =>This Inner Loop Header: Depth=1
	movq	8(%r15), %rdx
	movzwl	-8(%rdx,%rbx), %esi
	cmpw	%si, %r12w
	jb	.LBB81_6
# %bb.4:                                #   in Loop: Header=BB81_3 Depth=1
	movzwl	-6(%rdx,%rbx), %edi
	addl	%esi, %edi
	cmpl	%r14d, %edi
	jbe	.LBB81_6
# %bb.5:                                #   in Loop: Header=BB81_3 Depth=1
	movq	(%rdx,%rbx), %rdi
	movl	%r14d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbx)
                                        # kill: def $al killed $al def $rax
	movq	16(%r15), %rcx
	jmp	.LBB81_6
.LBB81_1:
	xorl	%eax, %eax
.LBB81_7:
	movzbl	%al, %eax
	movzbl	(%r15), %ecx
	leal	(%rcx,%rax), %esi
	movzbl	6(%r15), %edi
	movl	%edi, %edx
	andl	$1, %edx
	addl	%esi, %edx
	movl	%edi, %ebx
	andb	$127, %bl
	orb	$-128, %dil
	movzbl	%dil, %esi
	movzbl	%bl, %edi
	testb	%dl, %dl
	cmovsl	%esi, %edi
	movl	%edi, %ebx
	andb	$-3, %bl
	orb	$2, %dil
	testb	%dl, %dl
	movzbl	%dil, %esi
	movzbl	%bl, %edi
	cmovel	%esi, %edi
	movb	%dl, (%r15)
	xorb	%al, %cl
	xorb	$-128, %cl
	movl	%edi, %ebx
	andb	$-2, %bl
	orb	$1, %dil
	testl	$256, %edx              # imm = 0x100
	movzbl	%bl, %esi
	movzbl	%dil, %edi
	cmovel	%esi, %edi
	xorb	%dl, %al
	movl	%edi, %edx
	andb	$-65, %dl
	orb	$64, %dil
	testb	%cl, %al
	movzbl	%dil, %eax
	movzbl	%dl, %ecx
	cmovsl	%eax, %ecx
	movb	%cl, 6(%r15)
	movl	$6, %eax
	popq	%rbx
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end81:
	.size	ADC_xind, .Lfunc_end81-ADC_xind
	.cfi_endproc
                                        # -- End function
	.globl	ADC_indy                # -- Begin function ADC_indy
	.p2align	4, 0x90
	.type	ADC_indy,@function
ADC_indy:                               # @ADC_indy
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r12
	.cfi_def_cfa_offset 40
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset %rbx, -48
	.cfi_offset %r12, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%rdi, %r15
	callq	indy
	movq	16(%r15), %rcx
	testq	%rcx, %rcx
	je	.LBB82_1
# %bb.2:
	movl	%eax, %r12d
	movzwl	%ax, %r14d
	movl	$24, %ebx
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	jmp	.LBB82_3
	.p2align	4, 0x90
.LBB82_6:                               #   in Loop: Header=BB82_3 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rcx, %rbp
	jae	.LBB82_7
.LBB82_3:                               # =>This Inner Loop Header: Depth=1
	movq	8(%r15), %rdx
	movzwl	-8(%rdx,%rbx), %esi
	cmpw	%si, %r12w
	jb	.LBB82_6
# %bb.4:                                #   in Loop: Header=BB82_3 Depth=1
	movzwl	-6(%rdx,%rbx), %edi
	addl	%esi, %edi
	cmpl	%r14d, %edi
	jbe	.LBB82_6
# %bb.5:                                #   in Loop: Header=BB82_3 Depth=1
	movq	(%rdx,%rbx), %rdi
	movl	%r14d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbx)
                                        # kill: def $al killed $al def $rax
	movq	16(%r15), %rcx
	jmp	.LBB82_6
.LBB82_1:
	xorl	%eax, %eax
.LBB82_7:
	movzbl	%al, %eax
	movzbl	(%r15), %ecx
	leal	(%rcx,%rax), %esi
	movzbl	6(%r15), %edi
	movl	%edi, %edx
	andl	$1, %edx
	addl	%esi, %edx
	movl	%edi, %ebx
	andb	$127, %bl
	orb	$-128, %dil
	movzbl	%dil, %esi
	movzbl	%bl, %edi
	testb	%dl, %dl
	cmovsl	%esi, %edi
	movl	%edi, %ebx
	andb	$-3, %bl
	orb	$2, %dil
	testb	%dl, %dl
	movzbl	%dil, %esi
	movzbl	%bl, %edi
	cmovel	%esi, %edi
	movb	%dl, (%r15)
	xorb	%al, %cl
	xorb	$-128, %cl
	movl	%edi, %ebx
	andb	$-2, %bl
	orb	$1, %dil
	testl	$256, %edx              # imm = 0x100
	movzbl	%bl, %esi
	movzbl	%dil, %edi
	cmovel	%esi, %edi
	xorb	%dl, %al
	movl	%edi, %edx
	andb	$-65, %dl
	orb	$64, %dil
	testb	%cl, %al
	movzbl	%dil, %eax
	movzbl	%dl, %ecx
	cmovsl	%eax, %ecx
	movb	%cl, 6(%r15)
	movl	$5, %eax
	popq	%rbx
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end82:
	.size	ADC_indy, .Lfunc_end82-ADC_indy
	.cfi_endproc
                                        # -- End function
	.globl	SBC_imm                 # -- Begin function SBC_imm
	.p2align	4, 0x90
	.type	SBC_imm,@function
SBC_imm:                                # @SBC_imm
	.cfi_startproc
# %bb.0:
	pushq	%r15
	.cfi_def_cfa_offset 16
	pushq	%r14
	.cfi_def_cfa_offset 24
	pushq	%r12
	.cfi_def_cfa_offset 32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	pushq	%rax
	.cfi_def_cfa_offset 48
	.cfi_offset %rbx, -40
	.cfi_offset %r12, -32
	.cfi_offset %r14, -24
	.cfi_offset %r15, -16
	movq	%rdi, %r14
	movzwl	4(%rdi), %r15d
	leal	1(%r15), %eax
	movw	%ax, 4(%rdi)
	movq	16(%rdi), %rcx
	testq	%rcx, %rcx
	je	.LBB83_1
# %bb.2:
	movl	$24, %ebx
	xorl	%eax, %eax
	xorl	%r12d, %r12d
	jmp	.LBB83_3
	.p2align	4, 0x90
.LBB83_6:                               #   in Loop: Header=BB83_3 Depth=1
	addq	$1, %r12
	addq	$32, %rbx
	cmpq	%rcx, %r12
	jae	.LBB83_7
.LBB83_3:                               # =>This Inner Loop Header: Depth=1
	movq	8(%r14), %rdx
	movzwl	-8(%rdx,%rbx), %esi
	cmpw	%si, %r15w
	jb	.LBB83_6
# %bb.4:                                #   in Loop: Header=BB83_3 Depth=1
	movzwl	-6(%rdx,%rbx), %edi
	addl	%esi, %edi
	cmpl	%r15d, %edi
	jbe	.LBB83_6
# %bb.5:                                #   in Loop: Header=BB83_3 Depth=1
	movq	(%rdx,%rbx), %rdi
	movl	%r15d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbx)
                                        # kill: def $al killed $al def $rax
	movq	16(%r14), %rcx
	jmp	.LBB83_6
.LBB83_1:
	xorl	%eax, %eax
.LBB83_7:
	movzbl	(%r14), %edx
	movl	%eax, %ecx
	notb	%cl
	movzbl	%cl, %esi
	addl	%edx, %esi
	movzbl	6(%r14), %edi
	movl	%edi, %ecx
	andl	$1, %ecx
	addl	%esi, %ecx
	movl	%edi, %ebx
	andb	$127, %bl
	orb	$-128, %dil
	movzbl	%dil, %esi
	movzbl	%bl, %edi
	testb	%cl, %cl
	cmovsl	%esi, %edi
	movl	%edi, %ebx
	andb	$-3, %bl
	orb	$2, %dil
	testb	%cl, %cl
	movzbl	%dil, %esi
	movzbl	%bl, %edi
	cmovel	%esi, %edi
	movl	%edi, %ebx
	andb	$-2, %bl
	orb	$1, %dil
	testl	$256, %ecx              # imm = 0x100
	movzbl	%bl, %ebx
	movzbl	%dil, %esi
	cmovel	%ebx, %esi
	movb	%sil, 6(%r14)
	testb	%al, %al
	js	.LBB83_8
# %bb.10:
	cmpb	%cl, %dl
	jge	.LBB83_9
.LBB83_11:
	orb	$64, %sil
	jmp	.LBB83_12
.LBB83_8:
	cmpb	%cl, %dl
	jg	.LBB83_11
.LBB83_9:
	andb	$-65, %sil
.LBB83_12:
	movb	%sil, 6(%r14)
	movb	%cl, (%r14)
	movl	$2, %eax
	addq	$8, %rsp
	.cfi_def_cfa_offset 40
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%r12
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end83:
	.size	SBC_imm, .Lfunc_end83-SBC_imm
	.cfi_endproc
                                        # -- End function
	.globl	SBC_zpg                 # -- Begin function SBC_zpg
	.p2align	4, 0x90
	.type	SBC_zpg,@function
SBC_zpg:                                # @SBC_zpg
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	pushq	%rax
	.cfi_def_cfa_offset 48
	.cfi_offset %rbx, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%rdi, %r14
	movzwl	4(%rdi), %r15d
	movq	16(%rdi), %rcx
	testq	%rcx, %rcx
	je	.LBB84_12
# %bb.1:
	movl	$24, %ebx
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	jmp	.LBB84_3
	.p2align	4, 0x90
.LBB84_2:                               #   in Loop: Header=BB84_3 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rcx, %rbp
	jae	.LBB84_6
.LBB84_3:                               # =>This Inner Loop Header: Depth=1
	movq	8(%r14), %rdx
	movzwl	-8(%rdx,%rbx), %esi
	cmpw	%si, %r15w
	jb	.LBB84_2
# %bb.4:                                #   in Loop: Header=BB84_3 Depth=1
	movzwl	-6(%rdx,%rbx), %edi
	addl	%esi, %edi
	cmpl	%r15d, %edi
	jbe	.LBB84_2
# %bb.5:                                #   in Loop: Header=BB84_3 Depth=1
	movq	(%rdx,%rbx), %rdi
	movl	%r15d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbx)
                                        # kill: def $al killed $al def $rax
	movq	16(%r14), %rcx
	jmp	.LBB84_2
.LBB84_6:
	addw	$1, 4(%r14)
	testq	%rcx, %rcx
	je	.LBB84_13
# %bb.7:
	movzbl	%al, %r15d
	movl	$24, %ebx
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	jmp	.LBB84_9
	.p2align	4, 0x90
.LBB84_8:                               #   in Loop: Header=BB84_9 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rcx, %rbp
	jae	.LBB84_14
.LBB84_9:                               # =>This Inner Loop Header: Depth=1
	movq	8(%r14), %rdx
	movzwl	-8(%rdx,%rbx), %esi
	cmpw	%r15w, %si
	ja	.LBB84_8
# %bb.10:                               #   in Loop: Header=BB84_9 Depth=1
	movzwl	-6(%rdx,%rbx), %edi
	addl	%esi, %edi
	cmpl	%r15d, %edi
	jbe	.LBB84_8
# %bb.11:                               #   in Loop: Header=BB84_9 Depth=1
	movq	(%rdx,%rbx), %rdi
	movzwl	%r15w, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbx)
                                        # kill: def $al killed $al def $rax
	movq	16(%r14), %rcx
	jmp	.LBB84_8
.LBB84_12:
	addl	$1, %r15d
	movw	%r15w, 4(%r14)
.LBB84_13:
	xorl	%eax, %eax
.LBB84_14:
	movzbl	(%r14), %edx
	movl	%eax, %ecx
	notb	%cl
	movzbl	%cl, %esi
	addl	%edx, %esi
	movzbl	6(%r14), %edi
	movl	%edi, %ecx
	andl	$1, %ecx
	addl	%esi, %ecx
	movl	%edi, %ebx
	andb	$127, %bl
	orb	$-128, %dil
	movzbl	%dil, %esi
	movzbl	%bl, %edi
	testb	%cl, %cl
	cmovsl	%esi, %edi
	movl	%edi, %ebx
	andb	$-3, %bl
	orb	$2, %dil
	testb	%cl, %cl
	movzbl	%dil, %esi
	movzbl	%bl, %edi
	cmovel	%esi, %edi
	movl	%edi, %ebx
	andb	$-2, %bl
	orb	$1, %dil
	testl	$256, %ecx              # imm = 0x100
	movzbl	%bl, %ebp
	movzbl	%dil, %esi
	cmovel	%ebp, %esi
	movb	%sil, 6(%r14)
	testb	%al, %al
	js	.LBB84_17
# %bb.15:
	cmpb	%cl, %dl
	jge	.LBB84_18
.LBB84_16:
	orb	$64, %sil
	jmp	.LBB84_19
.LBB84_17:
	cmpb	%cl, %dl
	jg	.LBB84_16
.LBB84_18:
	andb	$-65, %sil
.LBB84_19:
	movb	%sil, 6(%r14)
	movb	%cl, (%r14)
	movl	$3, %eax
	addq	$8, %rsp
	.cfi_def_cfa_offset 40
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end84:
	.size	SBC_zpg, .Lfunc_end84-SBC_zpg
	.cfi_endproc
                                        # -- End function
	.globl	SBC_zpgx                # -- Begin function SBC_zpgx
	.p2align	4, 0x90
	.type	SBC_zpgx,@function
SBC_zpgx:                               # @SBC_zpgx
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r12
	.cfi_def_cfa_offset 40
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset %rbx, -48
	.cfi_offset %r12, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%rdi, %r15
	movzwl	4(%rdi), %r12d
	movq	16(%rdi), %rcx
	testq	%rcx, %rcx
	je	.LBB85_1
# %bb.2:
	movzwl	%r12w, %r14d
	movl	$24, %ebx
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	jmp	.LBB85_3
	.p2align	4, 0x90
.LBB85_6:                               #   in Loop: Header=BB85_3 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rcx, %rbp
	jae	.LBB85_7
.LBB85_3:                               # =>This Inner Loop Header: Depth=1
	movq	8(%r15), %rdx
	movzwl	-8(%rdx,%rbx), %esi
	cmpw	%si, %r12w
	jb	.LBB85_6
# %bb.4:                                #   in Loop: Header=BB85_3 Depth=1
	movzwl	-6(%rdx,%rbx), %edi
	addl	%esi, %edi
	cmpl	%r14d, %edi
	jbe	.LBB85_6
# %bb.5:                                #   in Loop: Header=BB85_3 Depth=1
	movq	(%rdx,%rbx), %rdi
	movl	%r12d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbx)
                                        # kill: def $al killed $al def $rax
	movq	16(%r15), %rcx
	jmp	.LBB85_6
.LBB85_7:
	movzwl	4(%r15), %r12d
	jmp	.LBB85_8
.LBB85_1:
	xorl	%ecx, %ecx
	xorl	%eax, %eax
.LBB85_8:
	addb	1(%r15), %al
	addl	$1, %r12d
	movw	%r12w, 4(%r15)
	testq	%rcx, %rcx
	je	.LBB85_9
# %bb.10:
	movzbl	%al, %r12d
	movzwl	%r12w, %r14d
	movl	$24, %ebx
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	jmp	.LBB85_11
	.p2align	4, 0x90
.LBB85_14:                              #   in Loop: Header=BB85_11 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rcx, %rbp
	jae	.LBB85_15
.LBB85_11:                              # =>This Inner Loop Header: Depth=1
	movq	8(%r15), %rdx
	movzwl	-8(%rdx,%rbx), %esi
	cmpw	%r12w, %si
	ja	.LBB85_14
# %bb.12:                               #   in Loop: Header=BB85_11 Depth=1
	movzwl	-6(%rdx,%rbx), %edi
	addl	%esi, %edi
	cmpl	%r14d, %edi
	jbe	.LBB85_14
# %bb.13:                               #   in Loop: Header=BB85_11 Depth=1
	movq	(%rdx,%rbx), %rdi
	movl	%r14d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbx)
                                        # kill: def $al killed $al def $rax
	movq	16(%r15), %rcx
	jmp	.LBB85_14
.LBB85_9:
	xorl	%eax, %eax
.LBB85_15:
	movzbl	(%r15), %edx
	movl	%eax, %ecx
	notb	%cl
	movzbl	%cl, %esi
	addl	%edx, %esi
	movzbl	6(%r15), %edi
	movl	%edi, %ecx
	andl	$1, %ecx
	addl	%esi, %ecx
	movl	%edi, %ebx
	andb	$127, %bl
	orb	$-128, %dil
	movzbl	%dil, %esi
	movzbl	%bl, %edi
	testb	%cl, %cl
	cmovsl	%esi, %edi
	movl	%edi, %ebx
	andb	$-3, %bl
	orb	$2, %dil
	testb	%cl, %cl
	movzbl	%dil, %esi
	movzbl	%bl, %edi
	cmovel	%esi, %edi
	movl	%edi, %ebx
	andb	$-2, %bl
	orb	$1, %dil
	testl	$256, %ecx              # imm = 0x100
	movzbl	%bl, %ebp
	movzbl	%dil, %esi
	cmovel	%ebp, %esi
	movb	%sil, 6(%r15)
	testb	%al, %al
	js	.LBB85_16
# %bb.18:
	cmpb	%cl, %dl
	jge	.LBB85_17
.LBB85_19:
	orb	$64, %sil
	jmp	.LBB85_20
.LBB85_16:
	cmpb	%cl, %dl
	jg	.LBB85_19
.LBB85_17:
	andb	$-65, %sil
.LBB85_20:
	movb	%sil, 6(%r15)
	movb	%cl, (%r15)
	movl	$4, %eax
	popq	%rbx
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end85:
	.size	SBC_zpgx, .Lfunc_end85-SBC_zpgx
	.cfi_endproc
                                        # -- End function
	.globl	SBC_abss                # -- Begin function SBC_abss
	.p2align	4, 0x90
	.type	SBC_abss,@function
SBC_abss:                               # @SBC_abss
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r13
	.cfi_def_cfa_offset 40
	pushq	%r12
	.cfi_def_cfa_offset 48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	pushq	%rax
	.cfi_def_cfa_offset 64
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%rdi, %r12
	movzwl	4(%rdi), %r13d
	movq	16(%rdi), %rcx
	testq	%rcx, %rcx
	je	.LBB86_12
# %bb.1:
	movzwl	%r13w, %r14d
	movl	$24, %ebx
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	jmp	.LBB86_3
	.p2align	4, 0x90
.LBB86_2:                               #   in Loop: Header=BB86_3 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rcx, %rbp
	jae	.LBB86_6
.LBB86_3:                               # =>This Inner Loop Header: Depth=1
	movq	8(%r12), %rdx
	movzwl	-8(%rdx,%rbx), %esi
	cmpw	%si, %r13w
	jb	.LBB86_2
# %bb.4:                                #   in Loop: Header=BB86_3 Depth=1
	movzwl	-6(%rdx,%rbx), %edi
	addl	%esi, %edi
	cmpl	%r14d, %edi
	jbe	.LBB86_2
# %bb.5:                                #   in Loop: Header=BB86_3 Depth=1
	movq	(%rdx,%rbx), %rdi
	movl	%r13d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbx)
                                        # kill: def $al killed $al def $rax
	movq	16(%r12), %rcx
	jmp	.LBB86_2
.LBB86_6:
	movl	4(%r12), %r13d
	testq	%rcx, %rcx
	je	.LBB86_12
# %bb.7:
	movzbl	%al, %r14d
	addl	$1, %r13d
	movzwl	%r13w, %r15d
	movl	$24, %ebx
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	jmp	.LBB86_9
	.p2align	4, 0x90
.LBB86_8:                               #   in Loop: Header=BB86_9 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rcx, %rbp
	jae	.LBB86_13
.LBB86_9:                               # =>This Inner Loop Header: Depth=1
	movq	8(%r12), %rdx
	movzwl	-8(%rdx,%rbx), %esi
	cmpw	%si, %r13w
	jb	.LBB86_8
# %bb.10:                               #   in Loop: Header=BB86_9 Depth=1
	movzwl	-6(%rdx,%rbx), %edi
	addl	%esi, %edi
	cmpl	%r15d, %edi
	jbe	.LBB86_8
# %bb.11:                               #   in Loop: Header=BB86_9 Depth=1
	movq	(%rdx,%rbx), %rdi
	movl	%r13d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbx)
                                        # kill: def $al killed $al def $rax
	movq	16(%r12), %rcx
	jmp	.LBB86_8
.LBB86_12:
	addl	$2, %r13d
	movw	%r13w, 4(%r12)
.LBB86_19:
	xorl	%eax, %eax
.LBB86_20:
	movzbl	(%r12), %edx
	movl	%eax, %ecx
	notb	%cl
	movzbl	%cl, %esi
	addl	%edx, %esi
	movzbl	6(%r12), %edi
	movl	%edi, %ecx
	andl	$1, %ecx
	addl	%esi, %ecx
	movl	%edi, %ebx
	andb	$127, %bl
	orb	$-128, %dil
	movzbl	%dil, %esi
	movzbl	%bl, %edi
	testb	%cl, %cl
	cmovsl	%esi, %edi
	movl	%edi, %ebx
	andb	$-3, %bl
	orb	$2, %dil
	testb	%cl, %cl
	movzbl	%dil, %esi
	movzbl	%bl, %edi
	cmovel	%esi, %edi
	movl	%edi, %ebx
	andb	$-2, %bl
	orb	$1, %dil
	testl	$256, %ecx              # imm = 0x100
	movzbl	%bl, %ebp
	movzbl	%dil, %esi
	cmovel	%ebp, %esi
	movb	%sil, 6(%r12)
	testb	%al, %al
	js	.LBB86_23
# %bb.21:
	cmpb	%cl, %dl
	jge	.LBB86_24
.LBB86_22:
	orb	$64, %sil
	jmp	.LBB86_25
.LBB86_13:
	addw	$2, 4(%r12)
	testq	%rcx, %rcx
	je	.LBB86_19
# %bb.14:
	movzbl	%al, %eax
	shll	$8, %eax
	movzwl	%r14w, %r15d
	orl	%eax, %r15d
	movzwl	%r15w, %r14d
	movl	$24, %ebp
	xorl	%eax, %eax
	xorl	%ebx, %ebx
	jmp	.LBB86_16
	.p2align	4, 0x90
.LBB86_15:                              #   in Loop: Header=BB86_16 Depth=1
	addq	$1, %rbx
	addq	$32, %rbp
	cmpq	%rcx, %rbx
	jae	.LBB86_20
.LBB86_16:                              # =>This Inner Loop Header: Depth=1
	movq	8(%r12), %rdx
	movzwl	-8(%rdx,%rbp), %esi
	cmpw	%si, %r15w
	jb	.LBB86_15
# %bb.17:                               #   in Loop: Header=BB86_16 Depth=1
	movzwl	-6(%rdx,%rbp), %edi
	addl	%esi, %edi
	cmpl	%r14d, %edi
	jbe	.LBB86_15
# %bb.18:                               #   in Loop: Header=BB86_16 Depth=1
	movq	(%rdx,%rbp), %rdi
	movl	%r15d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbp)
                                        # kill: def $al killed $al def $rax
	movq	16(%r12), %rcx
	jmp	.LBB86_15
.LBB86_23:
	cmpb	%cl, %dl
	jg	.LBB86_22
.LBB86_24:
	andb	$-65, %sil
.LBB86_25:
	movb	%sil, 6(%r12)
	movb	%cl, (%r12)
	movl	$4, %eax
	addq	$8, %rsp
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%r12
	.cfi_def_cfa_offset 40
	popq	%r13
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end86:
	.size	SBC_abss, .Lfunc_end86-SBC_abss
	.cfi_endproc
                                        # -- End function
	.globl	SBC_absx                # -- Begin function SBC_absx
	.p2align	4, 0x90
	.type	SBC_absx,@function
SBC_absx:                               # @SBC_absx
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r13
	.cfi_def_cfa_offset 40
	pushq	%r12
	.cfi_def_cfa_offset 48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	pushq	%rax
	.cfi_def_cfa_offset 64
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%rdi, %r12
	movzwl	4(%rdi), %r13d
	movq	16(%rdi), %rcx
	testq	%rcx, %rcx
	je	.LBB87_13
# %bb.1:
	movzwl	%r13w, %r14d
	movl	$24, %ebx
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	jmp	.LBB87_3
	.p2align	4, 0x90
.LBB87_2:                               #   in Loop: Header=BB87_3 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rcx, %rbp
	jae	.LBB87_6
.LBB87_3:                               # =>This Inner Loop Header: Depth=1
	movq	8(%r12), %rdx
	movzwl	-8(%rdx,%rbx), %esi
	cmpw	%si, %r13w
	jb	.LBB87_2
# %bb.4:                                #   in Loop: Header=BB87_3 Depth=1
	movzwl	-6(%rdx,%rbx), %edi
	addl	%esi, %edi
	cmpl	%r14d, %edi
	jbe	.LBB87_2
# %bb.5:                                #   in Loop: Header=BB87_3 Depth=1
	movq	(%rdx,%rbx), %rdi
	movl	%r13d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbx)
                                        # kill: def $al killed $al def $rax
	movq	16(%r12), %rcx
	jmp	.LBB87_2
.LBB87_6:
	movzbl	%al, %r14d
	movl	4(%r12), %r13d
	testq	%rcx, %rcx
	je	.LBB87_14
# %bb.7:
	addl	$1, %r13d
	movzwl	%r13w, %r15d
	movl	$24, %ebx
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	jmp	.LBB87_9
	.p2align	4, 0x90
.LBB87_8:                               #   in Loop: Header=BB87_9 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rcx, %rbp
	jae	.LBB87_12
.LBB87_9:                               # =>This Inner Loop Header: Depth=1
	movq	8(%r12), %rdx
	movzwl	-8(%rdx,%rbx), %esi
	cmpw	%si, %r13w
	jb	.LBB87_8
# %bb.10:                               #   in Loop: Header=BB87_9 Depth=1
	movzwl	-6(%rdx,%rbx), %edi
	addl	%esi, %edi
	cmpl	%r15d, %edi
	jbe	.LBB87_8
# %bb.11:                               #   in Loop: Header=BB87_9 Depth=1
	movq	(%rdx,%rbx), %rdi
	movl	%r13d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbx)
                                        # kill: def $al killed $al def $rax
	movq	16(%r12), %rcx
	jmp	.LBB87_8
.LBB87_12:
	movzwl	4(%r12), %r13d
	jmp	.LBB87_16
.LBB87_13:
	xorl	%ecx, %ecx
	xorl	%r14d, %r14d
	jmp	.LBB87_15
.LBB87_14:
	xorl	%ecx, %ecx
.LBB87_15:
	xorl	%eax, %eax
.LBB87_16:
	movzbl	1(%r12), %edx
	addl	$2, %r13d
	movw	%r13w, 4(%r12)
	testq	%rcx, %rcx
	je	.LBB87_22
# %bb.17:
	movzbl	%al, %eax
	shll	$8, %eax
	movzwl	%r14w, %r15d
	orl	%eax, %r15d
	addl	%edx, %r15d
	movzwl	%r15w, %r14d
	movl	$24, %ebx
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	jmp	.LBB87_19
	.p2align	4, 0x90
.LBB87_18:                              #   in Loop: Header=BB87_19 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rcx, %rbp
	jae	.LBB87_23
.LBB87_19:                              # =>This Inner Loop Header: Depth=1
	movq	8(%r12), %rdx
	movzwl	-8(%rdx,%rbx), %esi
	cmpw	%si, %r15w
	jb	.LBB87_18
# %bb.20:                               #   in Loop: Header=BB87_19 Depth=1
	movzwl	-6(%rdx,%rbx), %edi
	addl	%esi, %edi
	cmpl	%r14d, %edi
	jbe	.LBB87_18
# %bb.21:                               #   in Loop: Header=BB87_19 Depth=1
	movq	(%rdx,%rbx), %rdi
	movl	%r15d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbx)
                                        # kill: def $al killed $al def $rax
	movq	16(%r12), %rcx
	jmp	.LBB87_18
.LBB87_22:
	xorl	%eax, %eax
.LBB87_23:
	movzbl	(%r12), %edx
	movl	%eax, %ecx
	notb	%cl
	movzbl	%cl, %esi
	addl	%edx, %esi
	movzbl	6(%r12), %edi
	movl	%edi, %ecx
	andl	$1, %ecx
	addl	%esi, %ecx
	movl	%edi, %ebx
	andb	$127, %bl
	orb	$-128, %dil
	movzbl	%dil, %esi
	movzbl	%bl, %edi
	testb	%cl, %cl
	cmovsl	%esi, %edi
	movl	%edi, %ebx
	andb	$-3, %bl
	orb	$2, %dil
	testb	%cl, %cl
	movzbl	%dil, %esi
	movzbl	%bl, %edi
	cmovel	%esi, %edi
	movl	%edi, %ebx
	andb	$-2, %bl
	orb	$1, %dil
	testl	$256, %ecx              # imm = 0x100
	movzbl	%bl, %ebp
	movzbl	%dil, %esi
	cmovel	%ebp, %esi
	movb	%sil, 6(%r12)
	testb	%al, %al
	js	.LBB87_26
# %bb.24:
	cmpb	%cl, %dl
	jge	.LBB87_27
.LBB87_25:
	orb	$64, %sil
	jmp	.LBB87_28
.LBB87_26:
	cmpb	%cl, %dl
	jg	.LBB87_25
.LBB87_27:
	andb	$-65, %sil
.LBB87_28:
	movb	%sil, 6(%r12)
	movb	%cl, (%r12)
	movl	$4, %eax
	addq	$8, %rsp
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%r12
	.cfi_def_cfa_offset 40
	popq	%r13
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end87:
	.size	SBC_absx, .Lfunc_end87-SBC_absx
	.cfi_endproc
                                        # -- End function
	.globl	SBC_absy                # -- Begin function SBC_absy
	.p2align	4, 0x90
	.type	SBC_absy,@function
SBC_absy:                               # @SBC_absy
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r13
	.cfi_def_cfa_offset 40
	pushq	%r12
	.cfi_def_cfa_offset 48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	pushq	%rax
	.cfi_def_cfa_offset 64
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%rdi, %r12
	movzwl	4(%rdi), %r13d
	movq	16(%rdi), %rcx
	testq	%rcx, %rcx
	je	.LBB88_13
# %bb.1:
	movzwl	%r13w, %r14d
	movl	$24, %ebx
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	jmp	.LBB88_3
	.p2align	4, 0x90
.LBB88_2:                               #   in Loop: Header=BB88_3 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rcx, %rbp
	jae	.LBB88_6
.LBB88_3:                               # =>This Inner Loop Header: Depth=1
	movq	8(%r12), %rdx
	movzwl	-8(%rdx,%rbx), %esi
	cmpw	%si, %r13w
	jb	.LBB88_2
# %bb.4:                                #   in Loop: Header=BB88_3 Depth=1
	movzwl	-6(%rdx,%rbx), %edi
	addl	%esi, %edi
	cmpl	%r14d, %edi
	jbe	.LBB88_2
# %bb.5:                                #   in Loop: Header=BB88_3 Depth=1
	movq	(%rdx,%rbx), %rdi
	movl	%r13d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbx)
                                        # kill: def $al killed $al def $rax
	movq	16(%r12), %rcx
	jmp	.LBB88_2
.LBB88_6:
	movzbl	%al, %r14d
	movl	4(%r12), %r13d
	testq	%rcx, %rcx
	je	.LBB88_14
# %bb.7:
	addl	$1, %r13d
	movzwl	%r13w, %r15d
	movl	$24, %ebx
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	jmp	.LBB88_9
	.p2align	4, 0x90
.LBB88_8:                               #   in Loop: Header=BB88_9 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rcx, %rbp
	jae	.LBB88_12
.LBB88_9:                               # =>This Inner Loop Header: Depth=1
	movq	8(%r12), %rdx
	movzwl	-8(%rdx,%rbx), %esi
	cmpw	%si, %r13w
	jb	.LBB88_8
# %bb.10:                               #   in Loop: Header=BB88_9 Depth=1
	movzwl	-6(%rdx,%rbx), %edi
	addl	%esi, %edi
	cmpl	%r15d, %edi
	jbe	.LBB88_8
# %bb.11:                               #   in Loop: Header=BB88_9 Depth=1
	movq	(%rdx,%rbx), %rdi
	movl	%r13d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbx)
                                        # kill: def $al killed $al def $rax
	movq	16(%r12), %rcx
	jmp	.LBB88_8
.LBB88_12:
	movzwl	4(%r12), %r13d
	jmp	.LBB88_16
.LBB88_13:
	xorl	%ecx, %ecx
	xorl	%r14d, %r14d
	jmp	.LBB88_15
.LBB88_14:
	xorl	%ecx, %ecx
.LBB88_15:
	xorl	%eax, %eax
.LBB88_16:
	movzbl	2(%r12), %edx
	addl	$2, %r13d
	movw	%r13w, 4(%r12)
	testq	%rcx, %rcx
	je	.LBB88_22
# %bb.17:
	movzbl	%al, %eax
	shll	$8, %eax
	movzwl	%r14w, %r15d
	orl	%eax, %r15d
	addl	%edx, %r15d
	movzwl	%r15w, %r14d
	movl	$24, %ebx
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	jmp	.LBB88_19
	.p2align	4, 0x90
.LBB88_18:                              #   in Loop: Header=BB88_19 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rcx, %rbp
	jae	.LBB88_23
.LBB88_19:                              # =>This Inner Loop Header: Depth=1
	movq	8(%r12), %rdx
	movzwl	-8(%rdx,%rbx), %esi
	cmpw	%si, %r15w
	jb	.LBB88_18
# %bb.20:                               #   in Loop: Header=BB88_19 Depth=1
	movzwl	-6(%rdx,%rbx), %edi
	addl	%esi, %edi
	cmpl	%r14d, %edi
	jbe	.LBB88_18
# %bb.21:                               #   in Loop: Header=BB88_19 Depth=1
	movq	(%rdx,%rbx), %rdi
	movl	%r15d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbx)
                                        # kill: def $al killed $al def $rax
	movq	16(%r12), %rcx
	jmp	.LBB88_18
.LBB88_22:
	xorl	%eax, %eax
.LBB88_23:
	movzbl	(%r12), %edx
	movl	%eax, %ecx
	notb	%cl
	movzbl	%cl, %esi
	addl	%edx, %esi
	movzbl	6(%r12), %edi
	movl	%edi, %ecx
	andl	$1, %ecx
	addl	%esi, %ecx
	movl	%edi, %ebx
	andb	$127, %bl
	orb	$-128, %dil
	movzbl	%dil, %esi
	movzbl	%bl, %edi
	testb	%cl, %cl
	cmovsl	%esi, %edi
	movl	%edi, %ebx
	andb	$-3, %bl
	orb	$2, %dil
	testb	%cl, %cl
	movzbl	%dil, %esi
	movzbl	%bl, %edi
	cmovel	%esi, %edi
	movl	%edi, %ebx
	andb	$-2, %bl
	orb	$1, %dil
	testl	$256, %ecx              # imm = 0x100
	movzbl	%bl, %ebp
	movzbl	%dil, %esi
	cmovel	%ebp, %esi
	movb	%sil, 6(%r12)
	testb	%al, %al
	js	.LBB88_26
# %bb.24:
	cmpb	%cl, %dl
	jge	.LBB88_27
.LBB88_25:
	orb	$64, %sil
	jmp	.LBB88_28
.LBB88_26:
	cmpb	%cl, %dl
	jg	.LBB88_25
.LBB88_27:
	andb	$-65, %sil
.LBB88_28:
	movb	%sil, 6(%r12)
	movb	%cl, (%r12)
	movl	$4, %eax
	addq	$8, %rsp
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%r12
	.cfi_def_cfa_offset 40
	popq	%r13
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end88:
	.size	SBC_absy, .Lfunc_end88-SBC_absy
	.cfi_endproc
                                        # -- End function
	.globl	SBC_xind                # -- Begin function SBC_xind
	.p2align	4, 0x90
	.type	SBC_xind,@function
SBC_xind:                               # @SBC_xind
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r12
	.cfi_def_cfa_offset 40
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset %rbx, -48
	.cfi_offset %r12, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%rdi, %r15
	callq	xind
	movq	16(%r15), %rcx
	testq	%rcx, %rcx
	je	.LBB89_1
# %bb.2:
	movl	%eax, %r12d
	movzwl	%ax, %r14d
	movl	$24, %ebx
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	jmp	.LBB89_3
	.p2align	4, 0x90
.LBB89_6:                               #   in Loop: Header=BB89_3 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rcx, %rbp
	jae	.LBB89_7
.LBB89_3:                               # =>This Inner Loop Header: Depth=1
	movq	8(%r15), %rdx
	movzwl	-8(%rdx,%rbx), %esi
	cmpw	%si, %r12w
	jb	.LBB89_6
# %bb.4:                                #   in Loop: Header=BB89_3 Depth=1
	movzwl	-6(%rdx,%rbx), %edi
	addl	%esi, %edi
	cmpl	%r14d, %edi
	jbe	.LBB89_6
# %bb.5:                                #   in Loop: Header=BB89_3 Depth=1
	movq	(%rdx,%rbx), %rdi
	movl	%r14d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbx)
                                        # kill: def $al killed $al def $rax
	movq	16(%r15), %rcx
	jmp	.LBB89_6
.LBB89_1:
	xorl	%eax, %eax
.LBB89_7:
	movzbl	(%r15), %edx
	movl	%eax, %ecx
	notb	%cl
	movzbl	%cl, %esi
	addl	%edx, %esi
	movzbl	6(%r15), %edi
	movl	%edi, %ecx
	andl	$1, %ecx
	addl	%esi, %ecx
	movl	%edi, %ebx
	andb	$127, %bl
	orb	$-128, %dil
	movzbl	%dil, %esi
	movzbl	%bl, %edi
	testb	%cl, %cl
	cmovsl	%esi, %edi
	movl	%edi, %ebx
	andb	$-3, %bl
	orb	$2, %dil
	testb	%cl, %cl
	movzbl	%dil, %esi
	movzbl	%bl, %edi
	cmovel	%esi, %edi
	movl	%edi, %ebx
	andb	$-2, %bl
	orb	$1, %dil
	testl	$256, %ecx              # imm = 0x100
	movzbl	%bl, %ebp
	movzbl	%dil, %esi
	cmovel	%ebp, %esi
	movb	%sil, 6(%r15)
	testb	%al, %al
	js	.LBB89_8
# %bb.10:
	cmpb	%cl, %dl
	jge	.LBB89_9
.LBB89_11:
	orb	$64, %sil
	jmp	.LBB89_12
.LBB89_8:
	cmpb	%cl, %dl
	jg	.LBB89_11
.LBB89_9:
	andb	$-65, %sil
.LBB89_12:
	movb	%sil, 6(%r15)
	movb	%cl, (%r15)
	movl	$6, %eax
	popq	%rbx
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end89:
	.size	SBC_xind, .Lfunc_end89-SBC_xind
	.cfi_endproc
                                        # -- End function
	.globl	SBC_indy                # -- Begin function SBC_indy
	.p2align	4, 0x90
	.type	SBC_indy,@function
SBC_indy:                               # @SBC_indy
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r12
	.cfi_def_cfa_offset 40
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset %rbx, -48
	.cfi_offset %r12, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%rdi, %r15
	callq	indy
	movq	16(%r15), %rcx
	testq	%rcx, %rcx
	je	.LBB90_1
# %bb.2:
	movl	%eax, %r12d
	movzwl	%ax, %r14d
	movl	$24, %ebx
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	jmp	.LBB90_3
	.p2align	4, 0x90
.LBB90_6:                               #   in Loop: Header=BB90_3 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rcx, %rbp
	jae	.LBB90_7
.LBB90_3:                               # =>This Inner Loop Header: Depth=1
	movq	8(%r15), %rdx
	movzwl	-8(%rdx,%rbx), %esi
	cmpw	%si, %r12w
	jb	.LBB90_6
# %bb.4:                                #   in Loop: Header=BB90_3 Depth=1
	movzwl	-6(%rdx,%rbx), %edi
	addl	%esi, %edi
	cmpl	%r14d, %edi
	jbe	.LBB90_6
# %bb.5:                                #   in Loop: Header=BB90_3 Depth=1
	movq	(%rdx,%rbx), %rdi
	movl	%r14d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbx)
                                        # kill: def $al killed $al def $rax
	movq	16(%r15), %rcx
	jmp	.LBB90_6
.LBB90_1:
	xorl	%eax, %eax
.LBB90_7:
	movzbl	(%r15), %edx
	movl	%eax, %ecx
	notb	%cl
	movzbl	%cl, %esi
	addl	%edx, %esi
	movzbl	6(%r15), %edi
	movl	%edi, %ecx
	andl	$1, %ecx
	addl	%esi, %ecx
	movl	%edi, %ebx
	andb	$127, %bl
	orb	$-128, %dil
	movzbl	%dil, %esi
	movzbl	%bl, %edi
	testb	%cl, %cl
	cmovsl	%esi, %edi
	movl	%edi, %ebx
	andb	$-3, %bl
	orb	$2, %dil
	testb	%cl, %cl
	movzbl	%dil, %esi
	movzbl	%bl, %edi
	cmovel	%esi, %edi
	movl	%edi, %ebx
	andb	$-2, %bl
	orb	$1, %dil
	testl	$256, %ecx              # imm = 0x100
	movzbl	%bl, %ebp
	movzbl	%dil, %esi
	cmovel	%ebp, %esi
	movb	%sil, 6(%r15)
	testb	%al, %al
	js	.LBB90_8
# %bb.10:
	cmpb	%cl, %dl
	jge	.LBB90_9
.LBB90_11:
	orb	$64, %sil
	jmp	.LBB90_12
.LBB90_8:
	cmpb	%cl, %dl
	jg	.LBB90_11
.LBB90_9:
	andb	$-65, %sil
.LBB90_12:
	movb	%sil, 6(%r15)
	movb	%cl, (%r15)
	movl	$5, %eax
	popq	%rbx
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end90:
	.size	SBC_indy, .Lfunc_end90-SBC_indy
	.cfi_endproc
                                        # -- End function
	.globl	CMP_imm                 # -- Begin function CMP_imm
	.p2align	4, 0x90
	.type	CMP_imm,@function
CMP_imm:                                # @CMP_imm
	.cfi_startproc
# %bb.0:
	pushq	%r15
	.cfi_def_cfa_offset 16
	pushq	%r14
	.cfi_def_cfa_offset 24
	pushq	%r12
	.cfi_def_cfa_offset 32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	pushq	%rax
	.cfi_def_cfa_offset 48
	.cfi_offset %rbx, -40
	.cfi_offset %r12, -32
	.cfi_offset %r14, -24
	.cfi_offset %r15, -16
	movq	%rdi, %r14
	movzwl	4(%rdi), %r15d
	leal	1(%r15), %eax
	movw	%ax, 4(%rdi)
	movq	16(%rdi), %rcx
	testq	%rcx, %rcx
	je	.LBB91_1
# %bb.2:
	movl	$24, %ebx
	xorl	%eax, %eax
	xorl	%r12d, %r12d
	jmp	.LBB91_3
	.p2align	4, 0x90
.LBB91_6:                               #   in Loop: Header=BB91_3 Depth=1
	addq	$1, %r12
	addq	$32, %rbx
	cmpq	%rcx, %r12
	jae	.LBB91_7
.LBB91_3:                               # =>This Inner Loop Header: Depth=1
	movq	8(%r14), %rdx
	movzwl	-8(%rdx,%rbx), %esi
	cmpw	%si, %r15w
	jb	.LBB91_6
# %bb.4:                                #   in Loop: Header=BB91_3 Depth=1
	movzwl	-6(%rdx,%rbx), %edi
	addl	%esi, %edi
	cmpl	%r15d, %edi
	jbe	.LBB91_6
# %bb.5:                                #   in Loop: Header=BB91_3 Depth=1
	movq	(%rdx,%rbx), %rdi
	movl	%r15d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbx)
                                        # kill: def $al killed $al def $rax
	movq	16(%r14), %rcx
	jmp	.LBB91_6
.LBB91_1:
	xorl	%eax, %eax
.LBB91_7:
	movzbl	(%r14), %ecx
	notb	%al
	movzbl	%al, %eax
	addl	%ecx, %eax
	addl	$1, %eax
	movb	6(%r14), %cl
	movl	%ecx, %edx
	andb	$127, %dl
	orb	$-128, %cl
	movzbl	%cl, %ecx
	movzbl	%dl, %edx
	testb	%al, %al
	cmovsl	%ecx, %edx
	movl	%edx, %ecx
	andb	$-3, %cl
	orb	$2, %dl
	testb	%al, %al
	movzbl	%dl, %edx
	movzbl	%cl, %ecx
	cmovel	%edx, %ecx
	movl	%ecx, %edx
	andb	$-2, %dl
	orb	$1, %cl
	testl	$256, %eax              # imm = 0x100
	movzbl	%dl, %eax
	movzbl	%cl, %ecx
	cmovel	%eax, %ecx
	movb	%cl, 6(%r14)
	movl	$2, %eax
	addq	$8, %rsp
	.cfi_def_cfa_offset 40
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%r12
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end91:
	.size	CMP_imm, .Lfunc_end91-CMP_imm
	.cfi_endproc
                                        # -- End function
	.globl	CMP_zpg                 # -- Begin function CMP_zpg
	.p2align	4, 0x90
	.type	CMP_zpg,@function
CMP_zpg:                                # @CMP_zpg
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	pushq	%rax
	.cfi_def_cfa_offset 48
	.cfi_offset %rbx, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%rdi, %r14
	movzwl	4(%rdi), %r15d
	movq	16(%rdi), %rcx
	testq	%rcx, %rcx
	je	.LBB92_12
# %bb.1:
	movl	$24, %ebx
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	jmp	.LBB92_3
	.p2align	4, 0x90
.LBB92_2:                               #   in Loop: Header=BB92_3 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rcx, %rbp
	jae	.LBB92_6
.LBB92_3:                               # =>This Inner Loop Header: Depth=1
	movq	8(%r14), %rdx
	movzwl	-8(%rdx,%rbx), %esi
	cmpw	%si, %r15w
	jb	.LBB92_2
# %bb.4:                                #   in Loop: Header=BB92_3 Depth=1
	movzwl	-6(%rdx,%rbx), %edi
	addl	%esi, %edi
	cmpl	%r15d, %edi
	jbe	.LBB92_2
# %bb.5:                                #   in Loop: Header=BB92_3 Depth=1
	movq	(%rdx,%rbx), %rdi
	movl	%r15d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbx)
                                        # kill: def $al killed $al def $rax
	movq	16(%r14), %rcx
	jmp	.LBB92_2
.LBB92_6:
	addw	$1, 4(%r14)
	testq	%rcx, %rcx
	je	.LBB92_13
# %bb.7:
	movzbl	%al, %r15d
	movl	$24, %ebx
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	jmp	.LBB92_9
	.p2align	4, 0x90
.LBB92_8:                               #   in Loop: Header=BB92_9 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rcx, %rbp
	jae	.LBB92_14
.LBB92_9:                               # =>This Inner Loop Header: Depth=1
	movq	8(%r14), %rdx
	movzwl	-8(%rdx,%rbx), %esi
	cmpw	%r15w, %si
	ja	.LBB92_8
# %bb.10:                               #   in Loop: Header=BB92_9 Depth=1
	movzwl	-6(%rdx,%rbx), %edi
	addl	%esi, %edi
	cmpl	%r15d, %edi
	jbe	.LBB92_8
# %bb.11:                               #   in Loop: Header=BB92_9 Depth=1
	movq	(%rdx,%rbx), %rdi
	movzwl	%r15w, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbx)
                                        # kill: def $al killed $al def $rax
	movq	16(%r14), %rcx
	jmp	.LBB92_8
.LBB92_12:
	addl	$1, %r15d
	movw	%r15w, 4(%r14)
.LBB92_13:
	xorl	%eax, %eax
.LBB92_14:
	movzbl	(%r14), %ecx
	notb	%al
	movzbl	%al, %eax
	addl	%ecx, %eax
	addl	$1, %eax
	movb	6(%r14), %cl
	movl	%ecx, %edx
	andb	$127, %dl
	orb	$-128, %cl
	movzbl	%cl, %ecx
	movzbl	%dl, %edx
	testb	%al, %al
	cmovsl	%ecx, %edx
	movl	%edx, %ecx
	andb	$-3, %cl
	orb	$2, %dl
	testb	%al, %al
	movzbl	%dl, %edx
	movzbl	%cl, %ecx
	cmovel	%edx, %ecx
	movl	%ecx, %edx
	andb	$-2, %dl
	orb	$1, %cl
	testl	$256, %eax              # imm = 0x100
	movzbl	%dl, %eax
	movzbl	%cl, %ecx
	cmovel	%eax, %ecx
	movb	%cl, 6(%r14)
	movl	$3, %eax
	addq	$8, %rsp
	.cfi_def_cfa_offset 40
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end92:
	.size	CMP_zpg, .Lfunc_end92-CMP_zpg
	.cfi_endproc
                                        # -- End function
	.globl	CMP_zpgx                # -- Begin function CMP_zpgx
	.p2align	4, 0x90
	.type	CMP_zpgx,@function
CMP_zpgx:                               # @CMP_zpgx
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r12
	.cfi_def_cfa_offset 40
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset %rbx, -48
	.cfi_offset %r12, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%rdi, %r15
	movzwl	4(%rdi), %r12d
	movq	16(%rdi), %rcx
	testq	%rcx, %rcx
	je	.LBB93_1
# %bb.2:
	movzwl	%r12w, %r14d
	movl	$24, %ebx
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	jmp	.LBB93_3
	.p2align	4, 0x90
.LBB93_6:                               #   in Loop: Header=BB93_3 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rcx, %rbp
	jae	.LBB93_7
.LBB93_3:                               # =>This Inner Loop Header: Depth=1
	movq	8(%r15), %rdx
	movzwl	-8(%rdx,%rbx), %esi
	cmpw	%si, %r12w
	jb	.LBB93_6
# %bb.4:                                #   in Loop: Header=BB93_3 Depth=1
	movzwl	-6(%rdx,%rbx), %edi
	addl	%esi, %edi
	cmpl	%r14d, %edi
	jbe	.LBB93_6
# %bb.5:                                #   in Loop: Header=BB93_3 Depth=1
	movq	(%rdx,%rbx), %rdi
	movl	%r12d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbx)
                                        # kill: def $al killed $al def $rax
	movq	16(%r15), %rcx
	jmp	.LBB93_6
.LBB93_7:
	movzwl	4(%r15), %r12d
	jmp	.LBB93_8
.LBB93_1:
	xorl	%ecx, %ecx
	xorl	%eax, %eax
.LBB93_8:
	addb	1(%r15), %al
	addl	$1, %r12d
	movw	%r12w, 4(%r15)
	testq	%rcx, %rcx
	je	.LBB93_9
# %bb.10:
	movzbl	%al, %r12d
	movzwl	%r12w, %r14d
	movl	$24, %ebx
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	jmp	.LBB93_11
	.p2align	4, 0x90
.LBB93_14:                              #   in Loop: Header=BB93_11 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rcx, %rbp
	jae	.LBB93_15
.LBB93_11:                              # =>This Inner Loop Header: Depth=1
	movq	8(%r15), %rdx
	movzwl	-8(%rdx,%rbx), %esi
	cmpw	%r12w, %si
	ja	.LBB93_14
# %bb.12:                               #   in Loop: Header=BB93_11 Depth=1
	movzwl	-6(%rdx,%rbx), %edi
	addl	%esi, %edi
	cmpl	%r14d, %edi
	jbe	.LBB93_14
# %bb.13:                               #   in Loop: Header=BB93_11 Depth=1
	movq	(%rdx,%rbx), %rdi
	movl	%r14d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbx)
                                        # kill: def $al killed $al def $rax
	movq	16(%r15), %rcx
	jmp	.LBB93_14
.LBB93_9:
	xorl	%eax, %eax
.LBB93_15:
	movzbl	(%r15), %ecx
	notb	%al
	movzbl	%al, %eax
	addl	%ecx, %eax
	addl	$1, %eax
	movb	6(%r15), %cl
	movl	%ecx, %edx
	andb	$127, %dl
	orb	$-128, %cl
	movzbl	%cl, %ecx
	movzbl	%dl, %edx
	testb	%al, %al
	cmovsl	%ecx, %edx
	movl	%edx, %ecx
	andb	$-3, %cl
	orb	$2, %dl
	testb	%al, %al
	movzbl	%dl, %edx
	movzbl	%cl, %ecx
	cmovel	%edx, %ecx
	movl	%ecx, %edx
	andb	$-2, %dl
	orb	$1, %cl
	testl	$256, %eax              # imm = 0x100
	movzbl	%dl, %eax
	movzbl	%cl, %ecx
	cmovel	%eax, %ecx
	movb	%cl, 6(%r15)
	movl	$4, %eax
	popq	%rbx
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end93:
	.size	CMP_zpgx, .Lfunc_end93-CMP_zpgx
	.cfi_endproc
                                        # -- End function
	.globl	CMP_abss                # -- Begin function CMP_abss
	.p2align	4, 0x90
	.type	CMP_abss,@function
CMP_abss:                               # @CMP_abss
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r13
	.cfi_def_cfa_offset 40
	pushq	%r12
	.cfi_def_cfa_offset 48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	pushq	%rax
	.cfi_def_cfa_offset 64
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%rdi, %r12
	movzwl	4(%rdi), %r13d
	movq	16(%rdi), %rcx
	testq	%rcx, %rcx
	je	.LBB94_12
# %bb.1:
	movzwl	%r13w, %r14d
	movl	$24, %ebx
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	jmp	.LBB94_3
	.p2align	4, 0x90
.LBB94_2:                               #   in Loop: Header=BB94_3 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rcx, %rbp
	jae	.LBB94_6
.LBB94_3:                               # =>This Inner Loop Header: Depth=1
	movq	8(%r12), %rdx
	movzwl	-8(%rdx,%rbx), %esi
	cmpw	%si, %r13w
	jb	.LBB94_2
# %bb.4:                                #   in Loop: Header=BB94_3 Depth=1
	movzwl	-6(%rdx,%rbx), %edi
	addl	%esi, %edi
	cmpl	%r14d, %edi
	jbe	.LBB94_2
# %bb.5:                                #   in Loop: Header=BB94_3 Depth=1
	movq	(%rdx,%rbx), %rdi
	movl	%r13d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbx)
                                        # kill: def $al killed $al def $rax
	movq	16(%r12), %rcx
	jmp	.LBB94_2
.LBB94_6:
	movl	4(%r12), %r13d
	testq	%rcx, %rcx
	je	.LBB94_12
# %bb.7:
	movzbl	%al, %r14d
	addl	$1, %r13d
	movzwl	%r13w, %r15d
	movl	$24, %ebx
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	jmp	.LBB94_9
	.p2align	4, 0x90
.LBB94_8:                               #   in Loop: Header=BB94_9 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rcx, %rbp
	jae	.LBB94_13
.LBB94_9:                               # =>This Inner Loop Header: Depth=1
	movq	8(%r12), %rdx
	movzwl	-8(%rdx,%rbx), %esi
	cmpw	%si, %r13w
	jb	.LBB94_8
# %bb.10:                               #   in Loop: Header=BB94_9 Depth=1
	movzwl	-6(%rdx,%rbx), %edi
	addl	%esi, %edi
	cmpl	%r15d, %edi
	jbe	.LBB94_8
# %bb.11:                               #   in Loop: Header=BB94_9 Depth=1
	movq	(%rdx,%rbx), %rdi
	movl	%r13d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbx)
                                        # kill: def $al killed $al def $rax
	movq	16(%r12), %rcx
	jmp	.LBB94_8
.LBB94_12:
	addl	$2, %r13d
	movw	%r13w, 4(%r12)
.LBB94_19:
	xorl	%eax, %eax
.LBB94_20:
	movzbl	(%r12), %ecx
	notb	%al
	movzbl	%al, %eax
	addl	%ecx, %eax
	addl	$1, %eax
	movb	6(%r12), %cl
	movl	%ecx, %edx
	andb	$127, %dl
	orb	$-128, %cl
	movzbl	%cl, %ecx
	movzbl	%dl, %edx
	testb	%al, %al
	cmovsl	%ecx, %edx
	movl	%edx, %ecx
	andb	$-3, %cl
	orb	$2, %dl
	testb	%al, %al
	movzbl	%dl, %edx
	movzbl	%cl, %ecx
	cmovel	%edx, %ecx
	movl	%ecx, %edx
	andb	$-2, %dl
	orb	$1, %cl
	testl	$256, %eax              # imm = 0x100
	movzbl	%dl, %eax
	movzbl	%cl, %ecx
	cmovel	%eax, %ecx
	movb	%cl, 6(%r12)
	movl	$4, %eax
	addq	$8, %rsp
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%r12
	.cfi_def_cfa_offset 40
	popq	%r13
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.LBB94_13:
	.cfi_def_cfa_offset 64
	addw	$2, 4(%r12)
	testq	%rcx, %rcx
	je	.LBB94_19
# %bb.14:
	movzbl	%al, %eax
	shll	$8, %eax
	movzwl	%r14w, %r15d
	orl	%eax, %r15d
	movzwl	%r15w, %r14d
	movl	$24, %ebp
	xorl	%eax, %eax
	xorl	%ebx, %ebx
	jmp	.LBB94_16
	.p2align	4, 0x90
.LBB94_15:                              #   in Loop: Header=BB94_16 Depth=1
	addq	$1, %rbx
	addq	$32, %rbp
	cmpq	%rcx, %rbx
	jae	.LBB94_20
.LBB94_16:                              # =>This Inner Loop Header: Depth=1
	movq	8(%r12), %rdx
	movzwl	-8(%rdx,%rbp), %esi
	cmpw	%si, %r15w
	jb	.LBB94_15
# %bb.17:                               #   in Loop: Header=BB94_16 Depth=1
	movzwl	-6(%rdx,%rbp), %edi
	addl	%esi, %edi
	cmpl	%r14d, %edi
	jbe	.LBB94_15
# %bb.18:                               #   in Loop: Header=BB94_16 Depth=1
	movq	(%rdx,%rbp), %rdi
	movl	%r15d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbp)
                                        # kill: def $al killed $al def $rax
	movq	16(%r12), %rcx
	jmp	.LBB94_15
.Lfunc_end94:
	.size	CMP_abss, .Lfunc_end94-CMP_abss
	.cfi_endproc
                                        # -- End function
	.globl	CMP_absx                # -- Begin function CMP_absx
	.p2align	4, 0x90
	.type	CMP_absx,@function
CMP_absx:                               # @CMP_absx
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r13
	.cfi_def_cfa_offset 40
	pushq	%r12
	.cfi_def_cfa_offset 48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	pushq	%rax
	.cfi_def_cfa_offset 64
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%rdi, %r12
	movzwl	4(%rdi), %r13d
	movq	16(%rdi), %rcx
	testq	%rcx, %rcx
	je	.LBB95_13
# %bb.1:
	movzwl	%r13w, %r14d
	movl	$24, %ebx
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	jmp	.LBB95_3
	.p2align	4, 0x90
.LBB95_2:                               #   in Loop: Header=BB95_3 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rcx, %rbp
	jae	.LBB95_6
.LBB95_3:                               # =>This Inner Loop Header: Depth=1
	movq	8(%r12), %rdx
	movzwl	-8(%rdx,%rbx), %esi
	cmpw	%si, %r13w
	jb	.LBB95_2
# %bb.4:                                #   in Loop: Header=BB95_3 Depth=1
	movzwl	-6(%rdx,%rbx), %edi
	addl	%esi, %edi
	cmpl	%r14d, %edi
	jbe	.LBB95_2
# %bb.5:                                #   in Loop: Header=BB95_3 Depth=1
	movq	(%rdx,%rbx), %rdi
	movl	%r13d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbx)
                                        # kill: def $al killed $al def $rax
	movq	16(%r12), %rcx
	jmp	.LBB95_2
.LBB95_6:
	movzbl	%al, %r14d
	movl	4(%r12), %r13d
	testq	%rcx, %rcx
	je	.LBB95_14
# %bb.7:
	addl	$1, %r13d
	movzwl	%r13w, %r15d
	movl	$24, %ebx
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	jmp	.LBB95_9
	.p2align	4, 0x90
.LBB95_8:                               #   in Loop: Header=BB95_9 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rcx, %rbp
	jae	.LBB95_12
.LBB95_9:                               # =>This Inner Loop Header: Depth=1
	movq	8(%r12), %rdx
	movzwl	-8(%rdx,%rbx), %esi
	cmpw	%si, %r13w
	jb	.LBB95_8
# %bb.10:                               #   in Loop: Header=BB95_9 Depth=1
	movzwl	-6(%rdx,%rbx), %edi
	addl	%esi, %edi
	cmpl	%r15d, %edi
	jbe	.LBB95_8
# %bb.11:                               #   in Loop: Header=BB95_9 Depth=1
	movq	(%rdx,%rbx), %rdi
	movl	%r13d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbx)
                                        # kill: def $al killed $al def $rax
	movq	16(%r12), %rcx
	jmp	.LBB95_8
.LBB95_12:
	movzwl	4(%r12), %r13d
	jmp	.LBB95_16
.LBB95_13:
	xorl	%ecx, %ecx
	xorl	%r14d, %r14d
	jmp	.LBB95_15
.LBB95_14:
	xorl	%ecx, %ecx
.LBB95_15:
	xorl	%eax, %eax
.LBB95_16:
	movzbl	1(%r12), %edx
	addl	$2, %r13d
	movw	%r13w, 4(%r12)
	testq	%rcx, %rcx
	je	.LBB95_22
# %bb.17:
	movzbl	%al, %eax
	shll	$8, %eax
	movzwl	%r14w, %r15d
	orl	%eax, %r15d
	addl	%edx, %r15d
	movzwl	%r15w, %r14d
	movl	$24, %ebx
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	jmp	.LBB95_19
	.p2align	4, 0x90
.LBB95_18:                              #   in Loop: Header=BB95_19 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rcx, %rbp
	jae	.LBB95_23
.LBB95_19:                              # =>This Inner Loop Header: Depth=1
	movq	8(%r12), %rdx
	movzwl	-8(%rdx,%rbx), %esi
	cmpw	%si, %r15w
	jb	.LBB95_18
# %bb.20:                               #   in Loop: Header=BB95_19 Depth=1
	movzwl	-6(%rdx,%rbx), %edi
	addl	%esi, %edi
	cmpl	%r14d, %edi
	jbe	.LBB95_18
# %bb.21:                               #   in Loop: Header=BB95_19 Depth=1
	movq	(%rdx,%rbx), %rdi
	movl	%r15d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbx)
                                        # kill: def $al killed $al def $rax
	movq	16(%r12), %rcx
	jmp	.LBB95_18
.LBB95_22:
	xorl	%eax, %eax
.LBB95_23:
	movzbl	(%r12), %ecx
	notb	%al
	movzbl	%al, %eax
	addl	%ecx, %eax
	addl	$1, %eax
	movb	6(%r12), %cl
	movl	%ecx, %edx
	andb	$127, %dl
	orb	$-128, %cl
	movzbl	%cl, %ecx
	movzbl	%dl, %edx
	testb	%al, %al
	cmovsl	%ecx, %edx
	movl	%edx, %ecx
	andb	$-3, %cl
	orb	$2, %dl
	testb	%al, %al
	movzbl	%dl, %edx
	movzbl	%cl, %ecx
	cmovel	%edx, %ecx
	movl	%ecx, %edx
	andb	$-2, %dl
	orb	$1, %cl
	testl	$256, %eax              # imm = 0x100
	movzbl	%dl, %eax
	movzbl	%cl, %ecx
	cmovel	%eax, %ecx
	movb	%cl, 6(%r12)
	movl	$4, %eax
	addq	$8, %rsp
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%r12
	.cfi_def_cfa_offset 40
	popq	%r13
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end95:
	.size	CMP_absx, .Lfunc_end95-CMP_absx
	.cfi_endproc
                                        # -- End function
	.globl	CMP_absy                # -- Begin function CMP_absy
	.p2align	4, 0x90
	.type	CMP_absy,@function
CMP_absy:                               # @CMP_absy
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r13
	.cfi_def_cfa_offset 40
	pushq	%r12
	.cfi_def_cfa_offset 48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	pushq	%rax
	.cfi_def_cfa_offset 64
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%rdi, %r12
	movzwl	4(%rdi), %r13d
	movq	16(%rdi), %rcx
	testq	%rcx, %rcx
	je	.LBB96_13
# %bb.1:
	movzwl	%r13w, %r14d
	movl	$24, %ebx
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	jmp	.LBB96_3
	.p2align	4, 0x90
.LBB96_2:                               #   in Loop: Header=BB96_3 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rcx, %rbp
	jae	.LBB96_6
.LBB96_3:                               # =>This Inner Loop Header: Depth=1
	movq	8(%r12), %rdx
	movzwl	-8(%rdx,%rbx), %esi
	cmpw	%si, %r13w
	jb	.LBB96_2
# %bb.4:                                #   in Loop: Header=BB96_3 Depth=1
	movzwl	-6(%rdx,%rbx), %edi
	addl	%esi, %edi
	cmpl	%r14d, %edi
	jbe	.LBB96_2
# %bb.5:                                #   in Loop: Header=BB96_3 Depth=1
	movq	(%rdx,%rbx), %rdi
	movl	%r13d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbx)
                                        # kill: def $al killed $al def $rax
	movq	16(%r12), %rcx
	jmp	.LBB96_2
.LBB96_6:
	movzbl	%al, %r14d
	movl	4(%r12), %r13d
	testq	%rcx, %rcx
	je	.LBB96_14
# %bb.7:
	addl	$1, %r13d
	movzwl	%r13w, %r15d
	movl	$24, %ebx
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	jmp	.LBB96_9
	.p2align	4, 0x90
.LBB96_8:                               #   in Loop: Header=BB96_9 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rcx, %rbp
	jae	.LBB96_12
.LBB96_9:                               # =>This Inner Loop Header: Depth=1
	movq	8(%r12), %rdx
	movzwl	-8(%rdx,%rbx), %esi
	cmpw	%si, %r13w
	jb	.LBB96_8
# %bb.10:                               #   in Loop: Header=BB96_9 Depth=1
	movzwl	-6(%rdx,%rbx), %edi
	addl	%esi, %edi
	cmpl	%r15d, %edi
	jbe	.LBB96_8
# %bb.11:                               #   in Loop: Header=BB96_9 Depth=1
	movq	(%rdx,%rbx), %rdi
	movl	%r13d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbx)
                                        # kill: def $al killed $al def $rax
	movq	16(%r12), %rcx
	jmp	.LBB96_8
.LBB96_12:
	movzwl	4(%r12), %r13d
	jmp	.LBB96_16
.LBB96_13:
	xorl	%ecx, %ecx
	xorl	%r14d, %r14d
	jmp	.LBB96_15
.LBB96_14:
	xorl	%ecx, %ecx
.LBB96_15:
	xorl	%eax, %eax
.LBB96_16:
	movzbl	2(%r12), %edx
	addl	$2, %r13d
	movw	%r13w, 4(%r12)
	testq	%rcx, %rcx
	je	.LBB96_22
# %bb.17:
	movzbl	%al, %eax
	shll	$8, %eax
	movzwl	%r14w, %r15d
	orl	%eax, %r15d
	addl	%edx, %r15d
	movzwl	%r15w, %r14d
	movl	$24, %ebx
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	jmp	.LBB96_19
	.p2align	4, 0x90
.LBB96_18:                              #   in Loop: Header=BB96_19 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rcx, %rbp
	jae	.LBB96_23
.LBB96_19:                              # =>This Inner Loop Header: Depth=1
	movq	8(%r12), %rdx
	movzwl	-8(%rdx,%rbx), %esi
	cmpw	%si, %r15w
	jb	.LBB96_18
# %bb.20:                               #   in Loop: Header=BB96_19 Depth=1
	movzwl	-6(%rdx,%rbx), %edi
	addl	%esi, %edi
	cmpl	%r14d, %edi
	jbe	.LBB96_18
# %bb.21:                               #   in Loop: Header=BB96_19 Depth=1
	movq	(%rdx,%rbx), %rdi
	movl	%r15d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbx)
                                        # kill: def $al killed $al def $rax
	movq	16(%r12), %rcx
	jmp	.LBB96_18
.LBB96_22:
	xorl	%eax, %eax
.LBB96_23:
	movzbl	(%r12), %ecx
	notb	%al
	movzbl	%al, %eax
	addl	%ecx, %eax
	addl	$1, %eax
	movb	6(%r12), %cl
	movl	%ecx, %edx
	andb	$127, %dl
	orb	$-128, %cl
	movzbl	%cl, %ecx
	movzbl	%dl, %edx
	testb	%al, %al
	cmovsl	%ecx, %edx
	movl	%edx, %ecx
	andb	$-3, %cl
	orb	$2, %dl
	testb	%al, %al
	movzbl	%dl, %edx
	movzbl	%cl, %ecx
	cmovel	%edx, %ecx
	movl	%ecx, %edx
	andb	$-2, %dl
	orb	$1, %cl
	testl	$256, %eax              # imm = 0x100
	movzbl	%dl, %eax
	movzbl	%cl, %ecx
	cmovel	%eax, %ecx
	movb	%cl, 6(%r12)
	movl	$4, %eax
	addq	$8, %rsp
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%r12
	.cfi_def_cfa_offset 40
	popq	%r13
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end96:
	.size	CMP_absy, .Lfunc_end96-CMP_absy
	.cfi_endproc
                                        # -- End function
	.globl	CMP_xind                # -- Begin function CMP_xind
	.p2align	4, 0x90
	.type	CMP_xind,@function
CMP_xind:                               # @CMP_xind
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r12
	.cfi_def_cfa_offset 40
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset %rbx, -48
	.cfi_offset %r12, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%rdi, %r15
	callq	xind
	movq	16(%r15), %rcx
	testq	%rcx, %rcx
	je	.LBB97_1
# %bb.2:
	movl	%eax, %r12d
	movzwl	%ax, %r14d
	movl	$24, %ebx
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	jmp	.LBB97_3
	.p2align	4, 0x90
.LBB97_6:                               #   in Loop: Header=BB97_3 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rcx, %rbp
	jae	.LBB97_7
.LBB97_3:                               # =>This Inner Loop Header: Depth=1
	movq	8(%r15), %rdx
	movzwl	-8(%rdx,%rbx), %esi
	cmpw	%si, %r12w
	jb	.LBB97_6
# %bb.4:                                #   in Loop: Header=BB97_3 Depth=1
	movzwl	-6(%rdx,%rbx), %edi
	addl	%esi, %edi
	cmpl	%r14d, %edi
	jbe	.LBB97_6
# %bb.5:                                #   in Loop: Header=BB97_3 Depth=1
	movq	(%rdx,%rbx), %rdi
	movl	%r14d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbx)
                                        # kill: def $al killed $al def $rax
	movq	16(%r15), %rcx
	jmp	.LBB97_6
.LBB97_1:
	xorl	%eax, %eax
.LBB97_7:
	movzbl	(%r15), %ecx
	notb	%al
	movzbl	%al, %eax
	addl	%ecx, %eax
	addl	$1, %eax
	movb	6(%r15), %cl
	movl	%ecx, %edx
	andb	$127, %dl
	orb	$-128, %cl
	movzbl	%cl, %ecx
	movzbl	%dl, %edx
	testb	%al, %al
	cmovsl	%ecx, %edx
	movl	%edx, %ecx
	andb	$-3, %cl
	orb	$2, %dl
	testb	%al, %al
	movzbl	%dl, %edx
	movzbl	%cl, %ecx
	cmovel	%edx, %ecx
	movl	%ecx, %edx
	andb	$-2, %dl
	orb	$1, %cl
	testl	$256, %eax              # imm = 0x100
	movzbl	%dl, %eax
	movzbl	%cl, %ecx
	cmovel	%eax, %ecx
	movb	%cl, 6(%r15)
	movl	$6, %eax
	popq	%rbx
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end97:
	.size	CMP_xind, .Lfunc_end97-CMP_xind
	.cfi_endproc
                                        # -- End function
	.globl	CMP_indy                # -- Begin function CMP_indy
	.p2align	4, 0x90
	.type	CMP_indy,@function
CMP_indy:                               # @CMP_indy
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r12
	.cfi_def_cfa_offset 40
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset %rbx, -48
	.cfi_offset %r12, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%rdi, %r15
	callq	indy
	movq	16(%r15), %rcx
	testq	%rcx, %rcx
	je	.LBB98_1
# %bb.2:
	movl	%eax, %r12d
	movzwl	%ax, %r14d
	movl	$24, %ebx
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	jmp	.LBB98_3
	.p2align	4, 0x90
.LBB98_6:                               #   in Loop: Header=BB98_3 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rcx, %rbp
	jae	.LBB98_7
.LBB98_3:                               # =>This Inner Loop Header: Depth=1
	movq	8(%r15), %rdx
	movzwl	-8(%rdx,%rbx), %esi
	cmpw	%si, %r12w
	jb	.LBB98_6
# %bb.4:                                #   in Loop: Header=BB98_3 Depth=1
	movzwl	-6(%rdx,%rbx), %edi
	addl	%esi, %edi
	cmpl	%r14d, %edi
	jbe	.LBB98_6
# %bb.5:                                #   in Loop: Header=BB98_3 Depth=1
	movq	(%rdx,%rbx), %rdi
	movl	%r14d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbx)
                                        # kill: def $al killed $al def $rax
	movq	16(%r15), %rcx
	jmp	.LBB98_6
.LBB98_1:
	xorl	%eax, %eax
.LBB98_7:
	movzbl	(%r15), %ecx
	notb	%al
	movzbl	%al, %eax
	addl	%ecx, %eax
	addl	$1, %eax
	movb	6(%r15), %cl
	movl	%ecx, %edx
	andb	$127, %dl
	orb	$-128, %cl
	movzbl	%cl, %ecx
	movzbl	%dl, %edx
	testb	%al, %al
	cmovsl	%ecx, %edx
	movl	%edx, %ecx
	andb	$-3, %cl
	orb	$2, %dl
	testb	%al, %al
	movzbl	%dl, %edx
	movzbl	%cl, %ecx
	cmovel	%edx, %ecx
	movl	%ecx, %edx
	andb	$-2, %dl
	orb	$1, %cl
	testl	$256, %eax              # imm = 0x100
	movzbl	%dl, %eax
	movzbl	%cl, %ecx
	cmovel	%eax, %ecx
	movb	%cl, 6(%r15)
	movl	$5, %eax
	popq	%rbx
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end98:
	.size	CMP_indy, .Lfunc_end98-CMP_indy
	.cfi_endproc
                                        # -- End function
	.globl	CPX_imm                 # -- Begin function CPX_imm
	.p2align	4, 0x90
	.type	CPX_imm,@function
CPX_imm:                                # @CPX_imm
	.cfi_startproc
# %bb.0:
	pushq	%r15
	.cfi_def_cfa_offset 16
	pushq	%r14
	.cfi_def_cfa_offset 24
	pushq	%r12
	.cfi_def_cfa_offset 32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	pushq	%rax
	.cfi_def_cfa_offset 48
	.cfi_offset %rbx, -40
	.cfi_offset %r12, -32
	.cfi_offset %r14, -24
	.cfi_offset %r15, -16
	movq	%rdi, %r14
	movzwl	4(%rdi), %r15d
	leal	1(%r15), %eax
	movw	%ax, 4(%rdi)
	movq	16(%rdi), %rcx
	testq	%rcx, %rcx
	je	.LBB99_1
# %bb.2:
	movl	$24, %ebx
	xorl	%eax, %eax
	xorl	%r12d, %r12d
	jmp	.LBB99_3
	.p2align	4, 0x90
.LBB99_6:                               #   in Loop: Header=BB99_3 Depth=1
	addq	$1, %r12
	addq	$32, %rbx
	cmpq	%rcx, %r12
	jae	.LBB99_7
.LBB99_3:                               # =>This Inner Loop Header: Depth=1
	movq	8(%r14), %rdx
	movzwl	-8(%rdx,%rbx), %esi
	cmpw	%si, %r15w
	jb	.LBB99_6
# %bb.4:                                #   in Loop: Header=BB99_3 Depth=1
	movzwl	-6(%rdx,%rbx), %edi
	addl	%esi, %edi
	cmpl	%r15d, %edi
	jbe	.LBB99_6
# %bb.5:                                #   in Loop: Header=BB99_3 Depth=1
	movq	(%rdx,%rbx), %rdi
	movl	%r15d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbx)
                                        # kill: def $al killed $al def $rax
	movq	16(%r14), %rcx
	jmp	.LBB99_6
.LBB99_1:
	xorl	%eax, %eax
.LBB99_7:
	movzbl	1(%r14), %ecx
	notb	%al
	movzbl	%al, %eax
	addl	%ecx, %eax
	addl	$1, %eax
	movb	6(%r14), %cl
	movl	%ecx, %edx
	andb	$127, %dl
	orb	$-128, %cl
	movzbl	%cl, %ecx
	movzbl	%dl, %edx
	testb	%al, %al
	cmovsl	%ecx, %edx
	movl	%edx, %ecx
	andb	$-3, %cl
	orb	$2, %dl
	testb	%al, %al
	movzbl	%dl, %edx
	movzbl	%cl, %ecx
	cmovel	%edx, %ecx
	movl	%ecx, %edx
	andb	$-2, %dl
	orb	$1, %cl
	testl	$256, %eax              # imm = 0x100
	movzbl	%dl, %eax
	movzbl	%cl, %ecx
	cmovel	%eax, %ecx
	movb	%cl, 6(%r14)
	movl	$2, %eax
	addq	$8, %rsp
	.cfi_def_cfa_offset 40
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%r12
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end99:
	.size	CPX_imm, .Lfunc_end99-CPX_imm
	.cfi_endproc
                                        # -- End function
	.globl	CPX_zpg                 # -- Begin function CPX_zpg
	.p2align	4, 0x90
	.type	CPX_zpg,@function
CPX_zpg:                                # @CPX_zpg
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	pushq	%rax
	.cfi_def_cfa_offset 48
	.cfi_offset %rbx, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%rdi, %r14
	movzwl	4(%rdi), %r15d
	movq	16(%rdi), %rcx
	testq	%rcx, %rcx
	je	.LBB100_12
# %bb.1:
	movl	$24, %ebx
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	jmp	.LBB100_3
	.p2align	4, 0x90
.LBB100_2:                              #   in Loop: Header=BB100_3 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rcx, %rbp
	jae	.LBB100_6
.LBB100_3:                              # =>This Inner Loop Header: Depth=1
	movq	8(%r14), %rdx
	movzwl	-8(%rdx,%rbx), %esi
	cmpw	%si, %r15w
	jb	.LBB100_2
# %bb.4:                                #   in Loop: Header=BB100_3 Depth=1
	movzwl	-6(%rdx,%rbx), %edi
	addl	%esi, %edi
	cmpl	%r15d, %edi
	jbe	.LBB100_2
# %bb.5:                                #   in Loop: Header=BB100_3 Depth=1
	movq	(%rdx,%rbx), %rdi
	movl	%r15d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbx)
                                        # kill: def $al killed $al def $rax
	movq	16(%r14), %rcx
	jmp	.LBB100_2
.LBB100_6:
	addw	$1, 4(%r14)
	testq	%rcx, %rcx
	je	.LBB100_13
# %bb.7:
	movzbl	%al, %r15d
	movl	$24, %ebx
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	jmp	.LBB100_9
	.p2align	4, 0x90
.LBB100_8:                              #   in Loop: Header=BB100_9 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rcx, %rbp
	jae	.LBB100_14
.LBB100_9:                              # =>This Inner Loop Header: Depth=1
	movq	8(%r14), %rdx
	movzwl	-8(%rdx,%rbx), %esi
	cmpw	%r15w, %si
	ja	.LBB100_8
# %bb.10:                               #   in Loop: Header=BB100_9 Depth=1
	movzwl	-6(%rdx,%rbx), %edi
	addl	%esi, %edi
	cmpl	%r15d, %edi
	jbe	.LBB100_8
# %bb.11:                               #   in Loop: Header=BB100_9 Depth=1
	movq	(%rdx,%rbx), %rdi
	movzwl	%r15w, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbx)
                                        # kill: def $al killed $al def $rax
	movq	16(%r14), %rcx
	jmp	.LBB100_8
.LBB100_12:
	addl	$1, %r15d
	movw	%r15w, 4(%r14)
.LBB100_13:
	xorl	%eax, %eax
.LBB100_14:
	movzbl	1(%r14), %ecx
	notb	%al
	movzbl	%al, %eax
	addl	%ecx, %eax
	addl	$1, %eax
	movb	6(%r14), %cl
	movl	%ecx, %edx
	andb	$127, %dl
	orb	$-128, %cl
	movzbl	%cl, %ecx
	movzbl	%dl, %edx
	testb	%al, %al
	cmovsl	%ecx, %edx
	movl	%edx, %ecx
	andb	$-3, %cl
	orb	$2, %dl
	testb	%al, %al
	movzbl	%dl, %edx
	movzbl	%cl, %ecx
	cmovel	%edx, %ecx
	movl	%ecx, %edx
	andb	$-2, %dl
	orb	$1, %cl
	testl	$256, %eax              # imm = 0x100
	movzbl	%dl, %eax
	movzbl	%cl, %ecx
	cmovel	%eax, %ecx
	movb	%cl, 6(%r14)
	movl	$3, %eax
	addq	$8, %rsp
	.cfi_def_cfa_offset 40
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end100:
	.size	CPX_zpg, .Lfunc_end100-CPX_zpg
	.cfi_endproc
                                        # -- End function
	.globl	CPX_abss                # -- Begin function CPX_abss
	.p2align	4, 0x90
	.type	CPX_abss,@function
CPX_abss:                               # @CPX_abss
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r13
	.cfi_def_cfa_offset 40
	pushq	%r12
	.cfi_def_cfa_offset 48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	pushq	%rax
	.cfi_def_cfa_offset 64
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%rdi, %r12
	movzwl	4(%rdi), %r13d
	movq	16(%rdi), %rcx
	testq	%rcx, %rcx
	je	.LBB101_12
# %bb.1:
	movzwl	%r13w, %r14d
	movl	$24, %ebx
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	jmp	.LBB101_3
	.p2align	4, 0x90
.LBB101_2:                              #   in Loop: Header=BB101_3 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rcx, %rbp
	jae	.LBB101_6
.LBB101_3:                              # =>This Inner Loop Header: Depth=1
	movq	8(%r12), %rdx
	movzwl	-8(%rdx,%rbx), %esi
	cmpw	%si, %r13w
	jb	.LBB101_2
# %bb.4:                                #   in Loop: Header=BB101_3 Depth=1
	movzwl	-6(%rdx,%rbx), %edi
	addl	%esi, %edi
	cmpl	%r14d, %edi
	jbe	.LBB101_2
# %bb.5:                                #   in Loop: Header=BB101_3 Depth=1
	movq	(%rdx,%rbx), %rdi
	movl	%r13d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbx)
                                        # kill: def $al killed $al def $rax
	movq	16(%r12), %rcx
	jmp	.LBB101_2
.LBB101_6:
	movl	4(%r12), %r13d
	testq	%rcx, %rcx
	je	.LBB101_12
# %bb.7:
	movzbl	%al, %r14d
	addl	$1, %r13d
	movzwl	%r13w, %r15d
	movl	$24, %ebx
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	jmp	.LBB101_9
	.p2align	4, 0x90
.LBB101_8:                              #   in Loop: Header=BB101_9 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rcx, %rbp
	jae	.LBB101_13
.LBB101_9:                              # =>This Inner Loop Header: Depth=1
	movq	8(%r12), %rdx
	movzwl	-8(%rdx,%rbx), %esi
	cmpw	%si, %r13w
	jb	.LBB101_8
# %bb.10:                               #   in Loop: Header=BB101_9 Depth=1
	movzwl	-6(%rdx,%rbx), %edi
	addl	%esi, %edi
	cmpl	%r15d, %edi
	jbe	.LBB101_8
# %bb.11:                               #   in Loop: Header=BB101_9 Depth=1
	movq	(%rdx,%rbx), %rdi
	movl	%r13d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbx)
                                        # kill: def $al killed $al def $rax
	movq	16(%r12), %rcx
	jmp	.LBB101_8
.LBB101_12:
	addl	$2, %r13d
	movw	%r13w, 4(%r12)
.LBB101_19:
	xorl	%eax, %eax
.LBB101_20:
	movzbl	1(%r12), %ecx
	notb	%al
	movzbl	%al, %eax
	addl	%ecx, %eax
	addl	$1, %eax
	movb	6(%r12), %cl
	movl	%ecx, %edx
	andb	$127, %dl
	orb	$-128, %cl
	movzbl	%cl, %ecx
	movzbl	%dl, %edx
	testb	%al, %al
	cmovsl	%ecx, %edx
	movl	%edx, %ecx
	andb	$-3, %cl
	orb	$2, %dl
	testb	%al, %al
	movzbl	%dl, %edx
	movzbl	%cl, %ecx
	cmovel	%edx, %ecx
	movl	%ecx, %edx
	andb	$-2, %dl
	orb	$1, %cl
	testl	$256, %eax              # imm = 0x100
	movzbl	%dl, %eax
	movzbl	%cl, %ecx
	cmovel	%eax, %ecx
	movb	%cl, 6(%r12)
	movl	$4, %eax
	addq	$8, %rsp
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%r12
	.cfi_def_cfa_offset 40
	popq	%r13
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.LBB101_13:
	.cfi_def_cfa_offset 64
	addw	$2, 4(%r12)
	testq	%rcx, %rcx
	je	.LBB101_19
# %bb.14:
	movzbl	%al, %eax
	shll	$8, %eax
	movzwl	%r14w, %r15d
	orl	%eax, %r15d
	movzwl	%r15w, %r14d
	movl	$24, %ebp
	xorl	%eax, %eax
	xorl	%ebx, %ebx
	jmp	.LBB101_16
	.p2align	4, 0x90
.LBB101_15:                             #   in Loop: Header=BB101_16 Depth=1
	addq	$1, %rbx
	addq	$32, %rbp
	cmpq	%rcx, %rbx
	jae	.LBB101_20
.LBB101_16:                             # =>This Inner Loop Header: Depth=1
	movq	8(%r12), %rdx
	movzwl	-8(%rdx,%rbp), %esi
	cmpw	%si, %r15w
	jb	.LBB101_15
# %bb.17:                               #   in Loop: Header=BB101_16 Depth=1
	movzwl	-6(%rdx,%rbp), %edi
	addl	%esi, %edi
	cmpl	%r14d, %edi
	jbe	.LBB101_15
# %bb.18:                               #   in Loop: Header=BB101_16 Depth=1
	movq	(%rdx,%rbp), %rdi
	movl	%r15d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbp)
                                        # kill: def $al killed $al def $rax
	movq	16(%r12), %rcx
	jmp	.LBB101_15
.Lfunc_end101:
	.size	CPX_abss, .Lfunc_end101-CPX_abss
	.cfi_endproc
                                        # -- End function
	.globl	CPY_imm                 # -- Begin function CPY_imm
	.p2align	4, 0x90
	.type	CPY_imm,@function
CPY_imm:                                # @CPY_imm
	.cfi_startproc
# %bb.0:
	pushq	%r15
	.cfi_def_cfa_offset 16
	pushq	%r14
	.cfi_def_cfa_offset 24
	pushq	%r12
	.cfi_def_cfa_offset 32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	pushq	%rax
	.cfi_def_cfa_offset 48
	.cfi_offset %rbx, -40
	.cfi_offset %r12, -32
	.cfi_offset %r14, -24
	.cfi_offset %r15, -16
	movq	%rdi, %r14
	movzwl	4(%rdi), %r15d
	leal	1(%r15), %eax
	movw	%ax, 4(%rdi)
	movq	16(%rdi), %rcx
	testq	%rcx, %rcx
	je	.LBB102_1
# %bb.2:
	movl	$24, %ebx
	xorl	%eax, %eax
	xorl	%r12d, %r12d
	jmp	.LBB102_3
	.p2align	4, 0x90
.LBB102_6:                              #   in Loop: Header=BB102_3 Depth=1
	addq	$1, %r12
	addq	$32, %rbx
	cmpq	%rcx, %r12
	jae	.LBB102_7
.LBB102_3:                              # =>This Inner Loop Header: Depth=1
	movq	8(%r14), %rdx
	movzwl	-8(%rdx,%rbx), %esi
	cmpw	%si, %r15w
	jb	.LBB102_6
# %bb.4:                                #   in Loop: Header=BB102_3 Depth=1
	movzwl	-6(%rdx,%rbx), %edi
	addl	%esi, %edi
	cmpl	%r15d, %edi
	jbe	.LBB102_6
# %bb.5:                                #   in Loop: Header=BB102_3 Depth=1
	movq	(%rdx,%rbx), %rdi
	movl	%r15d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbx)
                                        # kill: def $al killed $al def $rax
	movq	16(%r14), %rcx
	jmp	.LBB102_6
.LBB102_1:
	xorl	%eax, %eax
.LBB102_7:
	movzbl	2(%r14), %ecx
	notb	%al
	movzbl	%al, %eax
	addl	%ecx, %eax
	addl	$1, %eax
	movb	6(%r14), %cl
	movl	%ecx, %edx
	andb	$127, %dl
	orb	$-128, %cl
	movzbl	%cl, %ecx
	movzbl	%dl, %edx
	testb	%al, %al
	cmovsl	%ecx, %edx
	movl	%edx, %ecx
	andb	$-3, %cl
	orb	$2, %dl
	testb	%al, %al
	movzbl	%dl, %edx
	movzbl	%cl, %ecx
	cmovel	%edx, %ecx
	movl	%ecx, %edx
	andb	$-2, %dl
	orb	$1, %cl
	testl	$256, %eax              # imm = 0x100
	movzbl	%dl, %eax
	movzbl	%cl, %ecx
	cmovel	%eax, %ecx
	movb	%cl, 6(%r14)
	movl	$2, %eax
	addq	$8, %rsp
	.cfi_def_cfa_offset 40
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%r12
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end102:
	.size	CPY_imm, .Lfunc_end102-CPY_imm
	.cfi_endproc
                                        # -- End function
	.globl	CPY_zpg                 # -- Begin function CPY_zpg
	.p2align	4, 0x90
	.type	CPY_zpg,@function
CPY_zpg:                                # @CPY_zpg
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	pushq	%rax
	.cfi_def_cfa_offset 48
	.cfi_offset %rbx, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%rdi, %r14
	movzwl	4(%rdi), %r15d
	movq	16(%rdi), %rcx
	testq	%rcx, %rcx
	je	.LBB103_12
# %bb.1:
	movl	$24, %ebx
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	jmp	.LBB103_3
	.p2align	4, 0x90
.LBB103_2:                              #   in Loop: Header=BB103_3 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rcx, %rbp
	jae	.LBB103_6
.LBB103_3:                              # =>This Inner Loop Header: Depth=1
	movq	8(%r14), %rdx
	movzwl	-8(%rdx,%rbx), %esi
	cmpw	%si, %r15w
	jb	.LBB103_2
# %bb.4:                                #   in Loop: Header=BB103_3 Depth=1
	movzwl	-6(%rdx,%rbx), %edi
	addl	%esi, %edi
	cmpl	%r15d, %edi
	jbe	.LBB103_2
# %bb.5:                                #   in Loop: Header=BB103_3 Depth=1
	movq	(%rdx,%rbx), %rdi
	movl	%r15d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbx)
                                        # kill: def $al killed $al def $rax
	movq	16(%r14), %rcx
	jmp	.LBB103_2
.LBB103_6:
	addw	$1, 4(%r14)
	testq	%rcx, %rcx
	je	.LBB103_13
# %bb.7:
	movzbl	%al, %r15d
	movl	$24, %ebx
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	jmp	.LBB103_9
	.p2align	4, 0x90
.LBB103_8:                              #   in Loop: Header=BB103_9 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rcx, %rbp
	jae	.LBB103_14
.LBB103_9:                              # =>This Inner Loop Header: Depth=1
	movq	8(%r14), %rdx
	movzwl	-8(%rdx,%rbx), %esi
	cmpw	%r15w, %si
	ja	.LBB103_8
# %bb.10:                               #   in Loop: Header=BB103_9 Depth=1
	movzwl	-6(%rdx,%rbx), %edi
	addl	%esi, %edi
	cmpl	%r15d, %edi
	jbe	.LBB103_8
# %bb.11:                               #   in Loop: Header=BB103_9 Depth=1
	movq	(%rdx,%rbx), %rdi
	movzwl	%r15w, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbx)
                                        # kill: def $al killed $al def $rax
	movq	16(%r14), %rcx
	jmp	.LBB103_8
.LBB103_12:
	addl	$1, %r15d
	movw	%r15w, 4(%r14)
.LBB103_13:
	xorl	%eax, %eax
.LBB103_14:
	movzbl	2(%r14), %ecx
	notb	%al
	movzbl	%al, %eax
	addl	%ecx, %eax
	addl	$1, %eax
	movb	6(%r14), %cl
	movl	%ecx, %edx
	andb	$127, %dl
	orb	$-128, %cl
	movzbl	%cl, %ecx
	movzbl	%dl, %edx
	testb	%al, %al
	cmovsl	%ecx, %edx
	movl	%edx, %ecx
	andb	$-3, %cl
	orb	$2, %dl
	testb	%al, %al
	movzbl	%dl, %edx
	movzbl	%cl, %ecx
	cmovel	%edx, %ecx
	movl	%ecx, %edx
	andb	$-2, %dl
	orb	$1, %cl
	testl	$256, %eax              # imm = 0x100
	movzbl	%dl, %eax
	movzbl	%cl, %ecx
	cmovel	%eax, %ecx
	movb	%cl, 6(%r14)
	movl	$3, %eax
	addq	$8, %rsp
	.cfi_def_cfa_offset 40
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end103:
	.size	CPY_zpg, .Lfunc_end103-CPY_zpg
	.cfi_endproc
                                        # -- End function
	.globl	CPY_abss                # -- Begin function CPY_abss
	.p2align	4, 0x90
	.type	CPY_abss,@function
CPY_abss:                               # @CPY_abss
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r13
	.cfi_def_cfa_offset 40
	pushq	%r12
	.cfi_def_cfa_offset 48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	pushq	%rax
	.cfi_def_cfa_offset 64
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%rdi, %r12
	movzwl	4(%rdi), %r13d
	movq	16(%rdi), %rcx
	testq	%rcx, %rcx
	je	.LBB104_12
# %bb.1:
	movzwl	%r13w, %r14d
	movl	$24, %ebx
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	jmp	.LBB104_3
	.p2align	4, 0x90
.LBB104_2:                              #   in Loop: Header=BB104_3 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rcx, %rbp
	jae	.LBB104_6
.LBB104_3:                              # =>This Inner Loop Header: Depth=1
	movq	8(%r12), %rdx
	movzwl	-8(%rdx,%rbx), %esi
	cmpw	%si, %r13w
	jb	.LBB104_2
# %bb.4:                                #   in Loop: Header=BB104_3 Depth=1
	movzwl	-6(%rdx,%rbx), %edi
	addl	%esi, %edi
	cmpl	%r14d, %edi
	jbe	.LBB104_2
# %bb.5:                                #   in Loop: Header=BB104_3 Depth=1
	movq	(%rdx,%rbx), %rdi
	movl	%r13d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbx)
                                        # kill: def $al killed $al def $rax
	movq	16(%r12), %rcx
	jmp	.LBB104_2
.LBB104_6:
	movl	4(%r12), %r13d
	testq	%rcx, %rcx
	je	.LBB104_12
# %bb.7:
	movzbl	%al, %r14d
	addl	$1, %r13d
	movzwl	%r13w, %r15d
	movl	$24, %ebx
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	jmp	.LBB104_9
	.p2align	4, 0x90
.LBB104_8:                              #   in Loop: Header=BB104_9 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rcx, %rbp
	jae	.LBB104_13
.LBB104_9:                              # =>This Inner Loop Header: Depth=1
	movq	8(%r12), %rdx
	movzwl	-8(%rdx,%rbx), %esi
	cmpw	%si, %r13w
	jb	.LBB104_8
# %bb.10:                               #   in Loop: Header=BB104_9 Depth=1
	movzwl	-6(%rdx,%rbx), %edi
	addl	%esi, %edi
	cmpl	%r15d, %edi
	jbe	.LBB104_8
# %bb.11:                               #   in Loop: Header=BB104_9 Depth=1
	movq	(%rdx,%rbx), %rdi
	movl	%r13d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbx)
                                        # kill: def $al killed $al def $rax
	movq	16(%r12), %rcx
	jmp	.LBB104_8
.LBB104_12:
	addl	$2, %r13d
	movw	%r13w, 4(%r12)
.LBB104_19:
	xorl	%eax, %eax
.LBB104_20:
	movzbl	2(%r12), %ecx
	notb	%al
	movzbl	%al, %eax
	addl	%ecx, %eax
	addl	$1, %eax
	movb	6(%r12), %cl
	movl	%ecx, %edx
	andb	$127, %dl
	orb	$-128, %cl
	movzbl	%cl, %ecx
	movzbl	%dl, %edx
	testb	%al, %al
	cmovsl	%ecx, %edx
	movl	%edx, %ecx
	andb	$-3, %cl
	orb	$2, %dl
	testb	%al, %al
	movzbl	%dl, %edx
	movzbl	%cl, %ecx
	cmovel	%edx, %ecx
	movl	%ecx, %edx
	andb	$-2, %dl
	orb	$1, %cl
	testl	$256, %eax              # imm = 0x100
	movzbl	%dl, %eax
	movzbl	%cl, %ecx
	cmovel	%eax, %ecx
	movb	%cl, 6(%r12)
	movl	$4, %eax
	addq	$8, %rsp
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%r12
	.cfi_def_cfa_offset 40
	popq	%r13
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.LBB104_13:
	.cfi_def_cfa_offset 64
	addw	$2, 4(%r12)
	testq	%rcx, %rcx
	je	.LBB104_19
# %bb.14:
	movzbl	%al, %eax
	shll	$8, %eax
	movzwl	%r14w, %r15d
	orl	%eax, %r15d
	movzwl	%r15w, %r14d
	movl	$24, %ebp
	xorl	%eax, %eax
	xorl	%ebx, %ebx
	jmp	.LBB104_16
	.p2align	4, 0x90
.LBB104_15:                             #   in Loop: Header=BB104_16 Depth=1
	addq	$1, %rbx
	addq	$32, %rbp
	cmpq	%rcx, %rbx
	jae	.LBB104_20
.LBB104_16:                             # =>This Inner Loop Header: Depth=1
	movq	8(%r12), %rdx
	movzwl	-8(%rdx,%rbp), %esi
	cmpw	%si, %r15w
	jb	.LBB104_15
# %bb.17:                               #   in Loop: Header=BB104_16 Depth=1
	movzwl	-6(%rdx,%rbp), %edi
	addl	%esi, %edi
	cmpl	%r14d, %edi
	jbe	.LBB104_15
# %bb.18:                               #   in Loop: Header=BB104_16 Depth=1
	movq	(%rdx,%rbp), %rdi
	movl	%r15d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbp)
                                        # kill: def $al killed $al def $rax
	movq	16(%r12), %rcx
	jmp	.LBB104_15
.Lfunc_end104:
	.size	CPY_abss, .Lfunc_end104-CPY_abss
	.cfi_endproc
                                        # -- End function
	.globl	ROR_zpg                 # -- Begin function ROR_zpg
	.p2align	4, 0x90
	.type	ROR_zpg,@function
ROR_zpg:                                # @ROR_zpg
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r13
	.cfi_def_cfa_offset 40
	pushq	%r12
	.cfi_def_cfa_offset 48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	pushq	%rax
	.cfi_def_cfa_offset 64
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%rdi, %r15
	movzwl	4(%rdi), %r14d
	movq	16(%rdi), %rcx
	testq	%rcx, %rcx
	je	.LBB105_12
# %bb.1:
	movl	$24, %ebx
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	jmp	.LBB105_3
	.p2align	4, 0x90
.LBB105_2:                              #   in Loop: Header=BB105_3 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rcx, %rbp
	jae	.LBB105_6
.LBB105_3:                              # =>This Inner Loop Header: Depth=1
	movq	8(%r15), %rdx
	movzwl	-8(%rdx,%rbx), %esi
	cmpw	%si, %r14w
	jb	.LBB105_2
# %bb.4:                                #   in Loop: Header=BB105_3 Depth=1
	movzwl	-6(%rdx,%rbx), %edi
	addl	%esi, %edi
	cmpl	%r14d, %edi
	jbe	.LBB105_2
# %bb.5:                                #   in Loop: Header=BB105_3 Depth=1
	movq	(%rdx,%rbx), %rdi
	movl	%r14d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbx)
                                        # kill: def $al killed $al def $rax
	movq	16(%r15), %rcx
	jmp	.LBB105_2
.LBB105_6:
	addw	$1, 4(%r15)
	movzbl	%al, %r12d
	testq	%rcx, %rcx
	je	.LBB105_13
# %bb.7:
	movl	$24, %ebx
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	jmp	.LBB105_9
	.p2align	4, 0x90
.LBB105_8:                              #   in Loop: Header=BB105_9 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rcx, %rbp
	jae	.LBB105_15
.LBB105_9:                              # =>This Inner Loop Header: Depth=1
	movq	8(%r15), %rdx
	movzwl	-8(%rdx,%rbx), %esi
	cmpw	%r12w, %si
	ja	.LBB105_8
# %bb.10:                               #   in Loop: Header=BB105_9 Depth=1
	movzwl	-6(%rdx,%rbx), %edi
	addl	%esi, %edi
	cmpl	%r12d, %edi
	jbe	.LBB105_8
# %bb.11:                               #   in Loop: Header=BB105_9 Depth=1
	movq	(%rdx,%rbx), %rdi
	movzwl	%r12w, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbx)
                                        # kill: def $al killed $al def $rax
	movq	16(%r15), %rcx
	jmp	.LBB105_8
.LBB105_12:
	addl	$1, %r14d
	movw	%r14w, 4(%r15)
	xorl	%ecx, %ecx
	xorl	%r12d, %r12d
	jmp	.LBB105_14
.LBB105_13:
	xorl	%ecx, %ecx
.LBB105_14:
	xorl	%eax, %eax
.LBB105_15:
	movb	6(%r15), %dl
	movl	%edx, %ebx
	shlb	$7, %bl
	movl	%eax, %r14d
	shrb	%r14b
	orb	%bl, %r14b
	js	.LBB105_18
# %bb.16:
	andb	$127, %dl
	movb	%dl, 6(%r15)
	testb	%r14b, %r14b
	jne	.LBB105_19
# %bb.17:
	orb	$2, %dl
	jmp	.LBB105_20
.LBB105_18:
	orb	$-128, %dl
	movb	%dl, 6(%r15)
.LBB105_19:
	andb	$-3, %dl
.LBB105_20:
	movl	%edx, %ebx
	andb	$-2, %bl
	orb	$1, %dl
	testb	$1, %al
	movzbl	%bl, %eax
	movzbl	%dl, %edx
	cmovel	%eax, %edx
	movb	%dl, 6(%r15)
	testq	%rcx, %rcx
	je	.LBB105_26
# %bb.21:
	movzwl	%r12w, %r13d
	movl	$24, %ebp
	xorl	%ebx, %ebx
	jmp	.LBB105_23
	.p2align	4, 0x90
.LBB105_22:                             #   in Loop: Header=BB105_23 Depth=1
	addq	$1, %rbx
	addq	$32, %rbp
	cmpq	%rcx, %rbx
	jae	.LBB105_26
.LBB105_23:                             # =>This Inner Loop Header: Depth=1
	movq	8(%r15), %rax
	movzwl	-8(%rax,%rbp), %edx
	cmpw	%dx, %r12w
	jb	.LBB105_22
# %bb.24:                               #   in Loop: Header=BB105_23 Depth=1
	movzwl	-6(%rax,%rbp), %esi
	addl	%edx, %esi
	cmpl	%r13d, %esi
	jbe	.LBB105_22
# %bb.25:                               #   in Loop: Header=BB105_23 Depth=1
	movq	(%rax,%rbp), %rdi
	movl	%r13d, %ecx
	subl	%edx, %ecx
	movzwl	%cx, %esi
	movzbl	%r14b, %edx
	callq	*-16(%rax,%rbp)
	movq	16(%r15), %rcx
	jmp	.LBB105_22
.LBB105_26:
	movl	$5, %eax
	addq	$8, %rsp
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%r12
	.cfi_def_cfa_offset 40
	popq	%r13
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end105:
	.size	ROR_zpg, .Lfunc_end105-ROR_zpg
	.cfi_endproc
                                        # -- End function
	.globl	ROR_zpgx                # -- Begin function ROR_zpgx
	.p2align	4, 0x90
	.type	ROR_zpgx,@function
ROR_zpgx:                               # @ROR_zpgx
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r13
	.cfi_def_cfa_offset 40
	pushq	%r12
	.cfi_def_cfa_offset 48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	pushq	%rax
	.cfi_def_cfa_offset 64
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%rdi, %r13
	movzwl	4(%rdi), %r15d
	movq	16(%rdi), %rcx
	testq	%rcx, %rcx
	je	.LBB106_1
# %bb.2:
	movzwl	%r15w, %r14d
	movl	$24, %ebp
	xorl	%eax, %eax
	xorl	%ebx, %ebx
	jmp	.LBB106_3
	.p2align	4, 0x90
.LBB106_6:                              #   in Loop: Header=BB106_3 Depth=1
	addq	$1, %rbx
	addq	$32, %rbp
	cmpq	%rcx, %rbx
	jae	.LBB106_7
.LBB106_3:                              # =>This Inner Loop Header: Depth=1
	movq	8(%r13), %rdx
	movzwl	-8(%rdx,%rbp), %esi
	cmpw	%si, %r15w
	jb	.LBB106_6
# %bb.4:                                #   in Loop: Header=BB106_3 Depth=1
	movzwl	-6(%rdx,%rbp), %edi
	addl	%esi, %edi
	cmpl	%r14d, %edi
	jbe	.LBB106_6
# %bb.5:                                #   in Loop: Header=BB106_3 Depth=1
	movq	(%rdx,%rbp), %rdi
	movl	%r15d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbp)
                                        # kill: def $al killed $al def $rax
	movq	16(%r13), %rcx
	jmp	.LBB106_6
.LBB106_7:
	movzwl	4(%r13), %r15d
	jmp	.LBB106_8
.LBB106_1:
	xorl	%ecx, %ecx
	xorl	%eax, %eax
.LBB106_8:
	addb	1(%r13), %al
	addl	$1, %r15d
	movw	%r15w, 4(%r13)
	movzbl	%al, %r12d
	movzwl	%r12w, %r14d
	testq	%rcx, %rcx
	je	.LBB106_9
# %bb.10:
	movl	$24, %ebp
	xorl	%eax, %eax
	xorl	%ebx, %ebx
	jmp	.LBB106_11
	.p2align	4, 0x90
.LBB106_14:                             #   in Loop: Header=BB106_11 Depth=1
	addq	$1, %rbx
	addq	$32, %rbp
	cmpq	%rcx, %rbx
	jae	.LBB106_15
.LBB106_11:                             # =>This Inner Loop Header: Depth=1
	movq	8(%r13), %rdx
	movzwl	-8(%rdx,%rbp), %esi
	cmpw	%r12w, %si
	ja	.LBB106_14
# %bb.12:                               #   in Loop: Header=BB106_11 Depth=1
	movzwl	-6(%rdx,%rbp), %edi
	addl	%esi, %edi
	cmpl	%r14d, %edi
	jbe	.LBB106_14
# %bb.13:                               #   in Loop: Header=BB106_11 Depth=1
	movq	(%rdx,%rbp), %rdi
	movl	%r14d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbp)
                                        # kill: def $al killed $al def $rax
	movq	16(%r13), %rcx
	jmp	.LBB106_14
.LBB106_9:
	xorl	%ecx, %ecx
	xorl	%eax, %eax
.LBB106_15:
	movb	6(%r13), %dl
	movl	%edx, %ebx
	shlb	$7, %bl
	movl	%eax, %r15d
	shrb	%r15b
	orb	%bl, %r15b
	js	.LBB106_16
# %bb.18:
	andb	$127, %dl
	movb	%dl, 6(%r13)
	testb	%r15b, %r15b
	jne	.LBB106_17
# %bb.19:
	orb	$2, %dl
	jmp	.LBB106_20
.LBB106_16:
	orb	$-128, %dl
	movb	%dl, 6(%r13)
.LBB106_17:
	andb	$-3, %dl
.LBB106_20:
	movl	%edx, %ebx
	andb	$-2, %bl
	orb	$1, %dl
	testb	$1, %al
	movzbl	%bl, %eax
	movzbl	%dl, %edx
	cmovel	%eax, %edx
	movb	%dl, 6(%r13)
	testq	%rcx, %rcx
	je	.LBB106_26
# %bb.21:
	movl	$24, %ebx
	xorl	%ebp, %ebp
	jmp	.LBB106_22
	.p2align	4, 0x90
.LBB106_25:                             #   in Loop: Header=BB106_22 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rcx, %rbp
	jae	.LBB106_26
.LBB106_22:                             # =>This Inner Loop Header: Depth=1
	movq	8(%r13), %rax
	movzwl	-8(%rax,%rbx), %edx
	cmpw	%r12w, %dx
	ja	.LBB106_25
# %bb.23:                               #   in Loop: Header=BB106_22 Depth=1
	movzwl	-6(%rax,%rbx), %esi
	addl	%edx, %esi
	cmpl	%r14d, %esi
	jbe	.LBB106_25
# %bb.24:                               #   in Loop: Header=BB106_22 Depth=1
	movq	(%rax,%rbx), %rdi
	movl	%r14d, %ecx
	subl	%edx, %ecx
	movzwl	%cx, %esi
	movzbl	%r15b, %edx
	callq	*-16(%rax,%rbx)
	movq	16(%r13), %rcx
	jmp	.LBB106_25
.LBB106_26:
	movl	$6, %eax
	addq	$8, %rsp
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%r12
	.cfi_def_cfa_offset 40
	popq	%r13
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end106:
	.size	ROR_zpgx, .Lfunc_end106-ROR_zpgx
	.cfi_endproc
                                        # -- End function
	.globl	ROR_abss                # -- Begin function ROR_abss
	.p2align	4, 0x90
	.type	ROR_abss,@function
ROR_abss:                               # @ROR_abss
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r13
	.cfi_def_cfa_offset 40
	pushq	%r12
	.cfi_def_cfa_offset 48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	pushq	%rax
	.cfi_def_cfa_offset 64
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%rdi, %r12
	movzwl	4(%rdi), %r13d
	movq	16(%rdi), %rcx
	testq	%rcx, %rcx
	je	.LBB107_1
# %bb.3:
	movzwl	%r13w, %r14d
	movl	$24, %ebx
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	jmp	.LBB107_4
	.p2align	4, 0x90
.LBB107_7:                              #   in Loop: Header=BB107_4 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rcx, %rbp
	jae	.LBB107_8
.LBB107_4:                              # =>This Inner Loop Header: Depth=1
	movq	8(%r12), %rdx
	movzwl	-8(%rdx,%rbx), %esi
	cmpw	%si, %r13w
	jb	.LBB107_7
# %bb.5:                                #   in Loop: Header=BB107_4 Depth=1
	movzwl	-6(%rdx,%rbx), %edi
	addl	%esi, %edi
	cmpl	%r14d, %edi
	jbe	.LBB107_7
# %bb.6:                                #   in Loop: Header=BB107_4 Depth=1
	movq	(%rdx,%rbx), %rdi
	movl	%r13d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbx)
                                        # kill: def $al killed $al def $rax
	movq	16(%r12), %rcx
	jmp	.LBB107_7
.LBB107_8:
	movzbl	%al, %r14d
	movl	4(%r12), %r13d
	testq	%rcx, %rcx
	je	.LBB107_2
# %bb.9:
	addl	$1, %r13d
	movzwl	%r13w, %r15d
	movl	$24, %ebx
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	jmp	.LBB107_10
	.p2align	4, 0x90
.LBB107_13:                             #   in Loop: Header=BB107_10 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rcx, %rbp
	jae	.LBB107_14
.LBB107_10:                             # =>This Inner Loop Header: Depth=1
	movq	8(%r12), %rdx
	movzwl	-8(%rdx,%rbx), %esi
	cmpw	%si, %r13w
	jb	.LBB107_13
# %bb.11:                               #   in Loop: Header=BB107_10 Depth=1
	movzwl	-6(%rdx,%rbx), %edi
	addl	%esi, %edi
	cmpl	%r15d, %edi
	jbe	.LBB107_13
# %bb.12:                               #   in Loop: Header=BB107_10 Depth=1
	movq	(%rdx,%rbx), %rdi
	movl	%r13d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbx)
                                        # kill: def $al killed $al def $rax
	movq	16(%r12), %rcx
	jmp	.LBB107_13
.LBB107_14:
	movzbl	%al, %eax
	shll	$8, %eax
	movzwl	%r14w, %r14d
	orl	%eax, %r14d
	addw	$2, 4(%r12)
	testq	%rcx, %rcx
	je	.LBB107_15
# %bb.16:
	movzwl	%r14w, %r15d
	movl	$24, %ebx
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	jmp	.LBB107_17
	.p2align	4, 0x90
.LBB107_20:                             #   in Loop: Header=BB107_17 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rcx, %rbp
	jae	.LBB107_21
.LBB107_17:                             # =>This Inner Loop Header: Depth=1
	movq	8(%r12), %rdx
	movzwl	-8(%rdx,%rbx), %esi
	cmpw	%si, %r14w
	jb	.LBB107_20
# %bb.18:                               #   in Loop: Header=BB107_17 Depth=1
	movzwl	-6(%rdx,%rbx), %edi
	addl	%esi, %edi
	cmpl	%r15d, %edi
	jbe	.LBB107_20
# %bb.19:                               #   in Loop: Header=BB107_17 Depth=1
	movq	(%rdx,%rbx), %rdi
	movl	%r14d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbx)
                                        # kill: def $al killed $al def $rax
	movq	16(%r12), %rcx
	jmp	.LBB107_20
.LBB107_1:
	xorl	%r14d, %r14d
.LBB107_2:
	addl	$2, %r13d
	movw	%r13w, 4(%r12)
.LBB107_15:
	xorl	%ecx, %ecx
	xorl	%eax, %eax
.LBB107_21:
	movb	6(%r12), %dl
	movl	%edx, %ebx
	shlb	$7, %bl
	movl	%eax, %r15d
	shrb	%r15b
	orb	%bl, %r15b
	js	.LBB107_22
# %bb.24:
	andb	$127, %dl
	movb	%dl, 6(%r12)
	testb	%r15b, %r15b
	jne	.LBB107_23
# %bb.25:
	orb	$2, %dl
	jmp	.LBB107_26
.LBB107_22:
	orb	$-128, %dl
	movb	%dl, 6(%r12)
.LBB107_23:
	andb	$-3, %dl
.LBB107_26:
	movl	%edx, %ebx
	andb	$-2, %bl
	orb	$1, %dl
	testb	$1, %al
	movzbl	%bl, %eax
	movzbl	%dl, %edx
	cmovel	%eax, %edx
	movb	%dl, 6(%r12)
	testq	%rcx, %rcx
	je	.LBB107_32
# %bb.27:
	movzwl	%r14w, %r13d
	movl	$24, %ebp
	xorl	%ebx, %ebx
	jmp	.LBB107_28
	.p2align	4, 0x90
.LBB107_31:                             #   in Loop: Header=BB107_28 Depth=1
	addq	$1, %rbx
	addq	$32, %rbp
	cmpq	%rcx, %rbx
	jae	.LBB107_32
.LBB107_28:                             # =>This Inner Loop Header: Depth=1
	movq	8(%r12), %rax
	movzwl	-8(%rax,%rbp), %edx
	cmpw	%dx, %r14w
	jb	.LBB107_31
# %bb.29:                               #   in Loop: Header=BB107_28 Depth=1
	movzwl	-6(%rax,%rbp), %esi
	addl	%edx, %esi
	cmpl	%r13d, %esi
	jbe	.LBB107_31
# %bb.30:                               #   in Loop: Header=BB107_28 Depth=1
	movq	(%rax,%rbp), %rdi
	movl	%r14d, %ecx
	subl	%edx, %ecx
	movzwl	%cx, %esi
	movzbl	%r15b, %edx
	callq	*-16(%rax,%rbp)
	movq	16(%r12), %rcx
	jmp	.LBB107_31
.LBB107_32:
	movl	$6, %eax
	addq	$8, %rsp
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%r12
	.cfi_def_cfa_offset 40
	popq	%r13
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end107:
	.size	ROR_abss, .Lfunc_end107-ROR_abss
	.cfi_endproc
                                        # -- End function
	.globl	ROR_absx                # -- Begin function ROR_absx
	.p2align	4, 0x90
	.type	ROR_absx,@function
ROR_absx:                               # @ROR_absx
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r13
	.cfi_def_cfa_offset 40
	pushq	%r12
	.cfi_def_cfa_offset 48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	pushq	%rax
	.cfi_def_cfa_offset 64
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%rdi, %r13
	movzwl	4(%rdi), %r14d
	movq	16(%rdi), %rcx
	testq	%rcx, %rcx
	je	.LBB108_13
# %bb.1:
	movzwl	%r14w, %r15d
	movl	$24, %ebp
	xorl	%eax, %eax
	xorl	%ebx, %ebx
	jmp	.LBB108_3
	.p2align	4, 0x90
.LBB108_2:                              #   in Loop: Header=BB108_3 Depth=1
	addq	$1, %rbx
	addq	$32, %rbp
	cmpq	%rcx, %rbx
	jae	.LBB108_6
.LBB108_3:                              # =>This Inner Loop Header: Depth=1
	movq	8(%r13), %rdx
	movzwl	-8(%rdx,%rbp), %esi
	cmpw	%si, %r14w
	jb	.LBB108_2
# %bb.4:                                #   in Loop: Header=BB108_3 Depth=1
	movzwl	-6(%rdx,%rbp), %edi
	addl	%esi, %edi
	cmpl	%r15d, %edi
	jbe	.LBB108_2
# %bb.5:                                #   in Loop: Header=BB108_3 Depth=1
	movq	(%rdx,%rbp), %rdi
	movl	%r14d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbp)
                                        # kill: def $al killed $al def $rax
	movq	16(%r13), %rcx
	jmp	.LBB108_2
.LBB108_6:
	movzbl	%al, %r15d
	movl	4(%r13), %r14d
	testq	%rcx, %rcx
	je	.LBB108_14
# %bb.7:
	addl	$1, %r14d
	movzwl	%r14w, %r12d
	movl	$24, %ebp
	xorl	%eax, %eax
	xorl	%ebx, %ebx
	jmp	.LBB108_9
	.p2align	4, 0x90
.LBB108_8:                              #   in Loop: Header=BB108_9 Depth=1
	addq	$1, %rbx
	addq	$32, %rbp
	cmpq	%rcx, %rbx
	jae	.LBB108_12
.LBB108_9:                              # =>This Inner Loop Header: Depth=1
	movq	8(%r13), %rdx
	movzwl	-8(%rdx,%rbp), %esi
	cmpw	%si, %r14w
	jb	.LBB108_8
# %bb.10:                               #   in Loop: Header=BB108_9 Depth=1
	movzwl	-6(%rdx,%rbp), %edi
	addl	%esi, %edi
	cmpl	%r12d, %edi
	jbe	.LBB108_8
# %bb.11:                               #   in Loop: Header=BB108_9 Depth=1
	movq	(%rdx,%rbp), %rdi
	movl	%r14d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbp)
                                        # kill: def $al killed $al def $rax
	movq	16(%r13), %rcx
	jmp	.LBB108_8
.LBB108_12:
	movzwl	4(%r13), %r14d
	jmp	.LBB108_16
.LBB108_13:
	xorl	%ecx, %ecx
	xorl	%r15d, %r15d
	jmp	.LBB108_15
.LBB108_14:
	xorl	%ecx, %ecx
.LBB108_15:
	xorl	%eax, %eax
.LBB108_16:
	movzbl	%al, %eax
	shll	$8, %eax
	movzwl	%r15w, %edx
	orl	%eax, %edx
	movzbl	1(%r13), %r12d
	addl	%edx, %r12d
	addl	$2, %r14d
	movw	%r14w, 4(%r13)
	movzwl	%r12w, %r14d
	testq	%rcx, %rcx
	je	.LBB108_22
# %bb.17:
	movl	$24, %ebp
	xorl	%eax, %eax
	xorl	%ebx, %ebx
	jmp	.LBB108_19
	.p2align	4, 0x90
.LBB108_18:                             #   in Loop: Header=BB108_19 Depth=1
	addq	$1, %rbx
	addq	$32, %rbp
	cmpq	%rcx, %rbx
	jae	.LBB108_23
.LBB108_19:                             # =>This Inner Loop Header: Depth=1
	movq	8(%r13), %rdx
	movzwl	-8(%rdx,%rbp), %esi
	cmpw	%si, %r12w
	jb	.LBB108_18
# %bb.20:                               #   in Loop: Header=BB108_19 Depth=1
	movzwl	-6(%rdx,%rbp), %edi
	addl	%esi, %edi
	cmpl	%r14d, %edi
	jbe	.LBB108_18
# %bb.21:                               #   in Loop: Header=BB108_19 Depth=1
	movq	(%rdx,%rbp), %rdi
	movl	%r12d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbp)
                                        # kill: def $al killed $al def $rax
	movq	16(%r13), %rcx
	jmp	.LBB108_18
.LBB108_22:
	xorl	%ecx, %ecx
	xorl	%eax, %eax
.LBB108_23:
	movb	6(%r13), %dl
	movl	%edx, %ebx
	shlb	$7, %bl
	movl	%eax, %r15d
	shrb	%r15b
	orb	%bl, %r15b
	js	.LBB108_26
# %bb.24:
	andb	$127, %dl
	movb	%dl, 6(%r13)
	testb	%r15b, %r15b
	jne	.LBB108_27
# %bb.25:
	orb	$2, %dl
	jmp	.LBB108_28
.LBB108_26:
	orb	$-128, %dl
	movb	%dl, 6(%r13)
.LBB108_27:
	andb	$-3, %dl
.LBB108_28:
	movl	%edx, %ebx
	andb	$-2, %bl
	orb	$1, %dl
	testb	$1, %al
	movzbl	%bl, %eax
	movzbl	%dl, %edx
	cmovel	%eax, %edx
	movb	%dl, 6(%r13)
	testq	%rcx, %rcx
	je	.LBB108_34
# %bb.29:
	movl	$24, %ebx
	xorl	%ebp, %ebp
	jmp	.LBB108_31
	.p2align	4, 0x90
.LBB108_30:                             #   in Loop: Header=BB108_31 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rcx, %rbp
	jae	.LBB108_34
.LBB108_31:                             # =>This Inner Loop Header: Depth=1
	movq	8(%r13), %rax
	movzwl	-8(%rax,%rbx), %edx
	cmpw	%dx, %r12w
	jb	.LBB108_30
# %bb.32:                               #   in Loop: Header=BB108_31 Depth=1
	movzwl	-6(%rax,%rbx), %esi
	addl	%edx, %esi
	cmpl	%r14d, %esi
	jbe	.LBB108_30
# %bb.33:                               #   in Loop: Header=BB108_31 Depth=1
	movq	(%rax,%rbx), %rdi
	movl	%r12d, %ecx
	subl	%edx, %ecx
	movzwl	%cx, %esi
	movzbl	%r15b, %edx
	callq	*-16(%rax,%rbx)
	movq	16(%r13), %rcx
	jmp	.LBB108_30
.LBB108_34:
	movl	$7, %eax
	addq	$8, %rsp
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%r12
	.cfi_def_cfa_offset 40
	popq	%r13
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end108:
	.size	ROR_absx, .Lfunc_end108-ROR_absx
	.cfi_endproc
                                        # -- End function
	.globl	RORA                    # -- Begin function RORA
	.p2align	4, 0x90
	.type	RORA,@function
RORA:                                   # @RORA
	.cfi_startproc
# %bb.0:
	movb	(%rdi), %sil
	movb	6(%rdi), %cl
	movl	%ecx, %edx
	shlb	$7, %dl
	movl	%esi, %eax
	shrb	%al
	orb	%dl, %al
	js	.LBB109_1
# %bb.3:
	andb	$127, %cl
	movb	%cl, 6(%rdi)
	testb	%al, %al
	jne	.LBB109_2
# %bb.4:
	orb	$2, %cl
	jmp	.LBB109_5
.LBB109_1:
	orb	$-128, %cl
	movb	%cl, 6(%rdi)
.LBB109_2:
	andb	$-3, %cl
.LBB109_5:
	movl	%ecx, %edx
	andb	$-2, %dl
	orb	$1, %cl
	testb	$1, %sil
	movzbl	%dl, %edx
	movzbl	%cl, %ecx
	cmovel	%edx, %ecx
	movb	%cl, 6(%rdi)
	movb	%al, (%rdi)
	movl	$2, %eax
	retq
.Lfunc_end109:
	.size	RORA, .Lfunc_end109-RORA
	.cfi_endproc
                                        # -- End function
	.globl	STA_zpg                 # -- Begin function STA_zpg
	.p2align	4, 0x90
	.type	STA_zpg,@function
STA_zpg:                                # @STA_zpg
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r12
	.cfi_def_cfa_offset 40
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset %rbx, -48
	.cfi_offset %r12, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%rdi, %r14
	movzwl	4(%rdi), %r15d
	movq	16(%rdi), %rcx
	testq	%rcx, %rcx
	je	.LBB110_1
# %bb.2:
	movl	$24, %ebx
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	jmp	.LBB110_3
	.p2align	4, 0x90
.LBB110_6:                              #   in Loop: Header=BB110_3 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rcx, %rbp
	jae	.LBB110_7
.LBB110_3:                              # =>This Inner Loop Header: Depth=1
	movq	8(%r14), %rdx
	movzwl	-8(%rdx,%rbx), %esi
	cmpw	%si, %r15w
	jb	.LBB110_6
# %bb.4:                                #   in Loop: Header=BB110_3 Depth=1
	movzwl	-6(%rdx,%rbx), %edi
	addl	%esi, %edi
	cmpl	%r15d, %edi
	jbe	.LBB110_6
# %bb.5:                                #   in Loop: Header=BB110_3 Depth=1
	movq	(%rdx,%rbx), %rdi
	movl	%r15d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbx)
                                        # kill: def $al killed $al def $rax
	movq	16(%r14), %rcx
	jmp	.LBB110_6
.LBB110_7:
	addw	$1, 4(%r14)
	testq	%rcx, %rcx
	je	.LBB110_13
# %bb.8:
	movzbl	%al, %r12d
	movl	$24, %ebp
	xorl	%ebx, %ebx
	movzbl	(%r14), %r15d
	jmp	.LBB110_9
	.p2align	4, 0x90
.LBB110_12:                             #   in Loop: Header=BB110_9 Depth=1
	addq	$1, %rbx
	addq	$32, %rbp
	cmpq	%rcx, %rbx
	jae	.LBB110_13
.LBB110_9:                              # =>This Inner Loop Header: Depth=1
	movq	8(%r14), %rax
	movzwl	-8(%rax,%rbp), %edx
	cmpw	%r12w, %dx
	ja	.LBB110_12
# %bb.10:                               #   in Loop: Header=BB110_9 Depth=1
	movzwl	-6(%rax,%rbp), %esi
	addl	%edx, %esi
	cmpl	%r12d, %esi
	jbe	.LBB110_12
# %bb.11:                               #   in Loop: Header=BB110_9 Depth=1
	movq	(%rax,%rbp), %rdi
	movzwl	%r12w, %ecx
	subl	%edx, %ecx
	movzwl	%cx, %esi
	movl	%r15d, %edx
	callq	*-16(%rax,%rbp)
	movq	16(%r14), %rcx
	jmp	.LBB110_12
.LBB110_1:
	addl	$1, %r15d
	movw	%r15w, 4(%r14)
.LBB110_13:
	movl	$3, %eax
	popq	%rbx
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end110:
	.size	STA_zpg, .Lfunc_end110-STA_zpg
	.cfi_endproc
                                        # -- End function
	.globl	STA_zpgx                # -- Begin function STA_zpgx
	.p2align	4, 0x90
	.type	STA_zpgx,@function
STA_zpgx:                               # @STA_zpgx
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r13
	.cfi_def_cfa_offset 40
	pushq	%r12
	.cfi_def_cfa_offset 48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	pushq	%rax
	.cfi_def_cfa_offset 64
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%rdi, %r12
	movzwl	4(%rdi), %r15d
	movq	16(%rdi), %rcx
	testq	%rcx, %rcx
	je	.LBB111_1
# %bb.2:
	movzwl	%r15w, %r14d
	movl	$24, %ebp
	xorl	%eax, %eax
	xorl	%ebx, %ebx
	jmp	.LBB111_3
	.p2align	4, 0x90
.LBB111_6:                              #   in Loop: Header=BB111_3 Depth=1
	addq	$1, %rbx
	addq	$32, %rbp
	cmpq	%rcx, %rbx
	jae	.LBB111_7
.LBB111_3:                              # =>This Inner Loop Header: Depth=1
	movq	8(%r12), %rdx
	movzwl	-8(%rdx,%rbp), %esi
	cmpw	%si, %r15w
	jb	.LBB111_6
# %bb.4:                                #   in Loop: Header=BB111_3 Depth=1
	movzwl	-6(%rdx,%rbp), %edi
	addl	%esi, %edi
	cmpl	%r14d, %edi
	jbe	.LBB111_6
# %bb.5:                                #   in Loop: Header=BB111_3 Depth=1
	movq	(%rdx,%rbp), %rdi
	movl	%r15d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbp)
                                        # kill: def $al killed $al def $rax
	movq	16(%r12), %rcx
	jmp	.LBB111_6
.LBB111_7:
	movzwl	4(%r12), %r15d
	jmp	.LBB111_8
.LBB111_1:
	xorl	%ecx, %ecx
	xorl	%eax, %eax
.LBB111_8:
	addb	1(%r12), %al
	addl	$1, %r15d
	movw	%r15w, 4(%r12)
	testq	%rcx, %rcx
	je	.LBB111_14
# %bb.9:
	movzbl	%al, %r13d
	movzwl	%r13w, %r15d
	movl	$24, %ebx
	xorl	%ebp, %ebp
	movzbl	(%r12), %r14d
	jmp	.LBB111_10
	.p2align	4, 0x90
.LBB111_13:                             #   in Loop: Header=BB111_10 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rcx, %rbp
	jae	.LBB111_14
.LBB111_10:                             # =>This Inner Loop Header: Depth=1
	movq	8(%r12), %rax
	movzwl	-8(%rax,%rbx), %edx
	cmpw	%r13w, %dx
	ja	.LBB111_13
# %bb.11:                               #   in Loop: Header=BB111_10 Depth=1
	movzwl	-6(%rax,%rbx), %esi
	addl	%edx, %esi
	cmpl	%r15d, %esi
	jbe	.LBB111_13
# %bb.12:                               #   in Loop: Header=BB111_10 Depth=1
	movq	(%rax,%rbx), %rdi
	movl	%r15d, %ecx
	subl	%edx, %ecx
	movzwl	%cx, %esi
	movl	%r14d, %edx
	callq	*-16(%rax,%rbx)
	movq	16(%r12), %rcx
	jmp	.LBB111_13
.LBB111_14:
	movl	$4, %eax
	addq	$8, %rsp
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%r12
	.cfi_def_cfa_offset 40
	popq	%r13
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end111:
	.size	STA_zpgx, .Lfunc_end111-STA_zpgx
	.cfi_endproc
                                        # -- End function
	.globl	STA_abss                # -- Begin function STA_abss
	.p2align	4, 0x90
	.type	STA_abss,@function
STA_abss:                               # @STA_abss
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r13
	.cfi_def_cfa_offset 40
	pushq	%r12
	.cfi_def_cfa_offset 48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	pushq	%rax
	.cfi_def_cfa_offset 64
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%rdi, %r13
	movzwl	4(%rdi), %r12d
	movq	16(%rdi), %rcx
	testq	%rcx, %rcx
	je	.LBB112_13
# %bb.1:
	movzwl	%r12w, %r14d
	movl	$24, %ebp
	xorl	%eax, %eax
	xorl	%ebx, %ebx
	jmp	.LBB112_3
	.p2align	4, 0x90
.LBB112_2:                              #   in Loop: Header=BB112_3 Depth=1
	addq	$1, %rbx
	addq	$32, %rbp
	cmpq	%rcx, %rbx
	jae	.LBB112_6
.LBB112_3:                              # =>This Inner Loop Header: Depth=1
	movq	8(%r13), %rdx
	movzwl	-8(%rdx,%rbp), %esi
	cmpw	%si, %r12w
	jb	.LBB112_2
# %bb.4:                                #   in Loop: Header=BB112_3 Depth=1
	movzwl	-6(%rdx,%rbp), %edi
	addl	%esi, %edi
	cmpl	%r14d, %edi
	jbe	.LBB112_2
# %bb.5:                                #   in Loop: Header=BB112_3 Depth=1
	movq	(%rdx,%rbp), %rdi
	movl	%r12d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbp)
                                        # kill: def $al killed $al def $rax
	movq	16(%r13), %rcx
	jmp	.LBB112_2
.LBB112_6:
	movzbl	%al, %r14d
	movl	4(%r13), %r12d
	testq	%rcx, %rcx
	je	.LBB112_14
# %bb.7:
	addl	$1, %r12d
	movzwl	%r12w, %r15d
	movl	$24, %ebp
	xorl	%eax, %eax
	xorl	%ebx, %ebx
	jmp	.LBB112_9
	.p2align	4, 0x90
.LBB112_8:                              #   in Loop: Header=BB112_9 Depth=1
	addq	$1, %rbx
	addq	$32, %rbp
	cmpq	%rcx, %rbx
	jae	.LBB112_12
.LBB112_9:                              # =>This Inner Loop Header: Depth=1
	movq	8(%r13), %rdx
	movzwl	-8(%rdx,%rbp), %esi
	cmpw	%si, %r12w
	jb	.LBB112_8
# %bb.10:                               #   in Loop: Header=BB112_9 Depth=1
	movzwl	-6(%rdx,%rbp), %edi
	addl	%esi, %edi
	cmpl	%r15d, %edi
	jbe	.LBB112_8
# %bb.11:                               #   in Loop: Header=BB112_9 Depth=1
	movq	(%rdx,%rbp), %rdi
	movl	%r12d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbp)
                                        # kill: def $al killed $al def $rax
	movq	16(%r13), %rcx
	jmp	.LBB112_8
.LBB112_12:
	movzwl	4(%r13), %r12d
	addl	$2, %r12d
	movw	%r12w, 4(%r13)
	testq	%rcx, %rcx
	jne	.LBB112_16
	jmp	.LBB112_21
.LBB112_13:
	xorl	%ecx, %ecx
	xorl	%r14d, %r14d
	jmp	.LBB112_15
.LBB112_14:
	xorl	%ecx, %ecx
.LBB112_15:
	xorl	%eax, %eax
	addl	$2, %r12d
	movw	%r12w, 4(%r13)
	testq	%rcx, %rcx
	je	.LBB112_21
.LBB112_16:
	movzbl	%al, %eax
	shll	$8, %eax
	movzwl	%r14w, %r12d
	orl	%eax, %r12d
	movzwl	%r12w, %r15d
	movl	$24, %ebx
	xorl	%ebp, %ebp
	movzbl	(%r13), %r14d
	jmp	.LBB112_18
	.p2align	4, 0x90
.LBB112_17:                             #   in Loop: Header=BB112_18 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rcx, %rbp
	jae	.LBB112_21
.LBB112_18:                             # =>This Inner Loop Header: Depth=1
	movq	8(%r13), %rax
	movzwl	-8(%rax,%rbx), %edx
	cmpw	%dx, %r12w
	jb	.LBB112_17
# %bb.19:                               #   in Loop: Header=BB112_18 Depth=1
	movzwl	-6(%rax,%rbx), %esi
	addl	%edx, %esi
	cmpl	%r15d, %esi
	jbe	.LBB112_17
# %bb.20:                               #   in Loop: Header=BB112_18 Depth=1
	movq	(%rax,%rbx), %rdi
	movl	%r12d, %ecx
	subl	%edx, %ecx
	movzwl	%cx, %esi
	movl	%r14d, %edx
	callq	*-16(%rax,%rbx)
	movq	16(%r13), %rcx
	jmp	.LBB112_17
.LBB112_21:
	movl	$4, %eax
	addq	$8, %rsp
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%r12
	.cfi_def_cfa_offset 40
	popq	%r13
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end112:
	.size	STA_abss, .Lfunc_end112-STA_abss
	.cfi_endproc
                                        # -- End function
	.globl	STA_absx                # -- Begin function STA_absx
	.p2align	4, 0x90
	.type	STA_absx,@function
STA_absx:                               # @STA_absx
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r13
	.cfi_def_cfa_offset 40
	pushq	%r12
	.cfi_def_cfa_offset 48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	pushq	%rax
	.cfi_def_cfa_offset 64
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%rdi, %r13
	movzwl	4(%rdi), %r12d
	movq	16(%rdi), %rcx
	testq	%rcx, %rcx
	je	.LBB113_13
# %bb.1:
	movzwl	%r12w, %r14d
	movl	$24, %ebp
	xorl	%eax, %eax
	xorl	%ebx, %ebx
	jmp	.LBB113_3
	.p2align	4, 0x90
.LBB113_2:                              #   in Loop: Header=BB113_3 Depth=1
	addq	$1, %rbx
	addq	$32, %rbp
	cmpq	%rcx, %rbx
	jae	.LBB113_6
.LBB113_3:                              # =>This Inner Loop Header: Depth=1
	movq	8(%r13), %rdx
	movzwl	-8(%rdx,%rbp), %esi
	cmpw	%si, %r12w
	jb	.LBB113_2
# %bb.4:                                #   in Loop: Header=BB113_3 Depth=1
	movzwl	-6(%rdx,%rbp), %edi
	addl	%esi, %edi
	cmpl	%r14d, %edi
	jbe	.LBB113_2
# %bb.5:                                #   in Loop: Header=BB113_3 Depth=1
	movq	(%rdx,%rbp), %rdi
	movl	%r12d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbp)
                                        # kill: def $al killed $al def $rax
	movq	16(%r13), %rcx
	jmp	.LBB113_2
.LBB113_6:
	movzbl	%al, %r14d
	movl	4(%r13), %r12d
	testq	%rcx, %rcx
	je	.LBB113_14
# %bb.7:
	addl	$1, %r12d
	movzwl	%r12w, %r15d
	movl	$24, %ebp
	xorl	%eax, %eax
	xorl	%ebx, %ebx
	jmp	.LBB113_9
	.p2align	4, 0x90
.LBB113_8:                              #   in Loop: Header=BB113_9 Depth=1
	addq	$1, %rbx
	addq	$32, %rbp
	cmpq	%rcx, %rbx
	jae	.LBB113_12
.LBB113_9:                              # =>This Inner Loop Header: Depth=1
	movq	8(%r13), %rdx
	movzwl	-8(%rdx,%rbp), %esi
	cmpw	%si, %r12w
	jb	.LBB113_8
# %bb.10:                               #   in Loop: Header=BB113_9 Depth=1
	movzwl	-6(%rdx,%rbp), %edi
	addl	%esi, %edi
	cmpl	%r15d, %edi
	jbe	.LBB113_8
# %bb.11:                               #   in Loop: Header=BB113_9 Depth=1
	movq	(%rdx,%rbp), %rdi
	movl	%r12d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbp)
                                        # kill: def $al killed $al def $rax
	movq	16(%r13), %rcx
	jmp	.LBB113_8
.LBB113_12:
	movzwl	4(%r13), %r12d
	jmp	.LBB113_16
.LBB113_13:
	xorl	%ecx, %ecx
	xorl	%r14d, %r14d
	jmp	.LBB113_15
.LBB113_14:
	xorl	%ecx, %ecx
.LBB113_15:
	xorl	%eax, %eax
.LBB113_16:
	movzbl	1(%r13), %edx
	addl	$2, %r12d
	movw	%r12w, 4(%r13)
	testq	%rcx, %rcx
	je	.LBB113_22
# %bb.17:
	movzbl	%al, %eax
	shll	$8, %eax
	movzwl	%r14w, %r12d
	orl	%eax, %r12d
	addl	%edx, %r12d
	movzwl	%r12w, %r15d
	movl	$24, %ebx
	xorl	%ebp, %ebp
	movzbl	(%r13), %r14d
	jmp	.LBB113_19
	.p2align	4, 0x90
.LBB113_18:                             #   in Loop: Header=BB113_19 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rcx, %rbp
	jae	.LBB113_22
.LBB113_19:                             # =>This Inner Loop Header: Depth=1
	movq	8(%r13), %rax
	movzwl	-8(%rax,%rbx), %edx
	cmpw	%dx, %r12w
	jb	.LBB113_18
# %bb.20:                               #   in Loop: Header=BB113_19 Depth=1
	movzwl	-6(%rax,%rbx), %esi
	addl	%edx, %esi
	cmpl	%r15d, %esi
	jbe	.LBB113_18
# %bb.21:                               #   in Loop: Header=BB113_19 Depth=1
	movq	(%rax,%rbx), %rdi
	movl	%r12d, %ecx
	subl	%edx, %ecx
	movzwl	%cx, %esi
	movl	%r14d, %edx
	callq	*-16(%rax,%rbx)
	movq	16(%r13), %rcx
	jmp	.LBB113_18
.LBB113_22:
	movl	$5, %eax
	addq	$8, %rsp
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%r12
	.cfi_def_cfa_offset 40
	popq	%r13
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end113:
	.size	STA_absx, .Lfunc_end113-STA_absx
	.cfi_endproc
                                        # -- End function
	.globl	STA_absy                # -- Begin function STA_absy
	.p2align	4, 0x90
	.type	STA_absy,@function
STA_absy:                               # @STA_absy
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r13
	.cfi_def_cfa_offset 40
	pushq	%r12
	.cfi_def_cfa_offset 48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	pushq	%rax
	.cfi_def_cfa_offset 64
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%rdi, %r13
	movzwl	4(%rdi), %r12d
	movq	16(%rdi), %rcx
	testq	%rcx, %rcx
	je	.LBB114_13
# %bb.1:
	movzwl	%r12w, %r14d
	movl	$24, %ebp
	xorl	%eax, %eax
	xorl	%ebx, %ebx
	jmp	.LBB114_3
	.p2align	4, 0x90
.LBB114_2:                              #   in Loop: Header=BB114_3 Depth=1
	addq	$1, %rbx
	addq	$32, %rbp
	cmpq	%rcx, %rbx
	jae	.LBB114_6
.LBB114_3:                              # =>This Inner Loop Header: Depth=1
	movq	8(%r13), %rdx
	movzwl	-8(%rdx,%rbp), %esi
	cmpw	%si, %r12w
	jb	.LBB114_2
# %bb.4:                                #   in Loop: Header=BB114_3 Depth=1
	movzwl	-6(%rdx,%rbp), %edi
	addl	%esi, %edi
	cmpl	%r14d, %edi
	jbe	.LBB114_2
# %bb.5:                                #   in Loop: Header=BB114_3 Depth=1
	movq	(%rdx,%rbp), %rdi
	movl	%r12d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbp)
                                        # kill: def $al killed $al def $rax
	movq	16(%r13), %rcx
	jmp	.LBB114_2
.LBB114_6:
	movzbl	%al, %r14d
	movl	4(%r13), %r12d
	testq	%rcx, %rcx
	je	.LBB114_14
# %bb.7:
	addl	$1, %r12d
	movzwl	%r12w, %r15d
	movl	$24, %ebp
	xorl	%eax, %eax
	xorl	%ebx, %ebx
	jmp	.LBB114_9
	.p2align	4, 0x90
.LBB114_8:                              #   in Loop: Header=BB114_9 Depth=1
	addq	$1, %rbx
	addq	$32, %rbp
	cmpq	%rcx, %rbx
	jae	.LBB114_12
.LBB114_9:                              # =>This Inner Loop Header: Depth=1
	movq	8(%r13), %rdx
	movzwl	-8(%rdx,%rbp), %esi
	cmpw	%si, %r12w
	jb	.LBB114_8
# %bb.10:                               #   in Loop: Header=BB114_9 Depth=1
	movzwl	-6(%rdx,%rbp), %edi
	addl	%esi, %edi
	cmpl	%r15d, %edi
	jbe	.LBB114_8
# %bb.11:                               #   in Loop: Header=BB114_9 Depth=1
	movq	(%rdx,%rbp), %rdi
	movl	%r12d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbp)
                                        # kill: def $al killed $al def $rax
	movq	16(%r13), %rcx
	jmp	.LBB114_8
.LBB114_12:
	movzwl	4(%r13), %r12d
	jmp	.LBB114_16
.LBB114_13:
	xorl	%ecx, %ecx
	xorl	%r14d, %r14d
	jmp	.LBB114_15
.LBB114_14:
	xorl	%ecx, %ecx
.LBB114_15:
	xorl	%eax, %eax
.LBB114_16:
	movzbl	2(%r13), %edx
	addl	$2, %r12d
	movw	%r12w, 4(%r13)
	testq	%rcx, %rcx
	je	.LBB114_22
# %bb.17:
	movzbl	%al, %eax
	shll	$8, %eax
	movzwl	%r14w, %r12d
	orl	%eax, %r12d
	addl	%edx, %r12d
	movzwl	%r12w, %r15d
	movl	$24, %ebx
	xorl	%ebp, %ebp
	movzbl	(%r13), %r14d
	jmp	.LBB114_19
	.p2align	4, 0x90
.LBB114_18:                             #   in Loop: Header=BB114_19 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rcx, %rbp
	jae	.LBB114_22
.LBB114_19:                             # =>This Inner Loop Header: Depth=1
	movq	8(%r13), %rax
	movzwl	-8(%rax,%rbx), %edx
	cmpw	%dx, %r12w
	jb	.LBB114_18
# %bb.20:                               #   in Loop: Header=BB114_19 Depth=1
	movzwl	-6(%rax,%rbx), %esi
	addl	%edx, %esi
	cmpl	%r15d, %esi
	jbe	.LBB114_18
# %bb.21:                               #   in Loop: Header=BB114_19 Depth=1
	movq	(%rax,%rbx), %rdi
	movl	%r12d, %ecx
	subl	%edx, %ecx
	movzwl	%cx, %esi
	movl	%r14d, %edx
	callq	*-16(%rax,%rbx)
	movq	16(%r13), %rcx
	jmp	.LBB114_18
.LBB114_22:
	movl	$5, %eax
	addq	$8, %rsp
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%r12
	.cfi_def_cfa_offset 40
	popq	%r13
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end114:
	.size	STA_absy, .Lfunc_end114-STA_absy
	.cfi_endproc
                                        # -- End function
	.globl	STA_xind                # -- Begin function STA_xind
	.p2align	4, 0x90
	.type	STA_xind,@function
STA_xind:                               # @STA_xind
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r13
	.cfi_def_cfa_offset 40
	pushq	%r12
	.cfi_def_cfa_offset 48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	pushq	%rax
	.cfi_def_cfa_offset 64
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%rdi, %r13
	callq	xind
	movl	%eax, %r12d
	movq	16(%r13), %rax
	testq	%rax, %rax
	je	.LBB115_6
# %bb.1:
	movzwl	%r12w, %r15d
	movl	$24, %ebp
	xorl	%ebx, %ebx
	movzbl	(%r13), %r14d
	jmp	.LBB115_2
	.p2align	4, 0x90
.LBB115_5:                              #   in Loop: Header=BB115_2 Depth=1
	addq	$1, %rbx
	addq	$32, %rbp
	cmpq	%rax, %rbx
	jae	.LBB115_6
.LBB115_2:                              # =>This Inner Loop Header: Depth=1
	movq	8(%r13), %rcx
	movzwl	-8(%rcx,%rbp), %edx
	cmpw	%dx, %r12w
	jb	.LBB115_5
# %bb.3:                                #   in Loop: Header=BB115_2 Depth=1
	movzwl	-6(%rcx,%rbp), %esi
	addl	%edx, %esi
	cmpl	%r15d, %esi
	jbe	.LBB115_5
# %bb.4:                                #   in Loop: Header=BB115_2 Depth=1
	movq	(%rcx,%rbp), %rdi
	movl	%r15d, %eax
	subl	%edx, %eax
	movzwl	%ax, %esi
	movl	%r14d, %edx
	callq	*-16(%rcx,%rbp)
	movq	16(%r13), %rax
	jmp	.LBB115_5
.LBB115_6:
	movl	$6, %eax
	addq	$8, %rsp
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%r12
	.cfi_def_cfa_offset 40
	popq	%r13
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end115:
	.size	STA_xind, .Lfunc_end115-STA_xind
	.cfi_endproc
                                        # -- End function
	.globl	STA_indy                # -- Begin function STA_indy
	.p2align	4, 0x90
	.type	STA_indy,@function
STA_indy:                               # @STA_indy
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r13
	.cfi_def_cfa_offset 40
	pushq	%r12
	.cfi_def_cfa_offset 48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	pushq	%rax
	.cfi_def_cfa_offset 64
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%rdi, %r13
	callq	indy
	movl	%eax, %r12d
	movq	16(%r13), %rax
	testq	%rax, %rax
	je	.LBB116_6
# %bb.1:
	movzwl	%r12w, %r15d
	movl	$24, %ebp
	xorl	%ebx, %ebx
	movzbl	(%r13), %r14d
	jmp	.LBB116_2
	.p2align	4, 0x90
.LBB116_5:                              #   in Loop: Header=BB116_2 Depth=1
	addq	$1, %rbx
	addq	$32, %rbp
	cmpq	%rax, %rbx
	jae	.LBB116_6
.LBB116_2:                              # =>This Inner Loop Header: Depth=1
	movq	8(%r13), %rcx
	movzwl	-8(%rcx,%rbp), %edx
	cmpw	%dx, %r12w
	jb	.LBB116_5
# %bb.3:                                #   in Loop: Header=BB116_2 Depth=1
	movzwl	-6(%rcx,%rbp), %esi
	addl	%edx, %esi
	cmpl	%r15d, %esi
	jbe	.LBB116_5
# %bb.4:                                #   in Loop: Header=BB116_2 Depth=1
	movq	(%rcx,%rbp), %rdi
	movl	%r15d, %eax
	subl	%edx, %eax
	movzwl	%ax, %esi
	movl	%r14d, %edx
	callq	*-16(%rcx,%rbp)
	movq	16(%r13), %rax
	jmp	.LBB116_5
.LBB116_6:
	movl	$6, %eax
	addq	$8, %rsp
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%r12
	.cfi_def_cfa_offset 40
	popq	%r13
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end116:
	.size	STA_indy, .Lfunc_end116-STA_indy
	.cfi_endproc
                                        # -- End function
	.globl	STX_zpg                 # -- Begin function STX_zpg
	.p2align	4, 0x90
	.type	STX_zpg,@function
STX_zpg:                                # @STX_zpg
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r12
	.cfi_def_cfa_offset 40
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset %rbx, -48
	.cfi_offset %r12, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%rdi, %r14
	movzwl	4(%rdi), %r15d
	movq	16(%rdi), %rcx
	testq	%rcx, %rcx
	je	.LBB117_1
# %bb.2:
	movl	$24, %ebx
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	jmp	.LBB117_3
	.p2align	4, 0x90
.LBB117_6:                              #   in Loop: Header=BB117_3 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rcx, %rbp
	jae	.LBB117_7
.LBB117_3:                              # =>This Inner Loop Header: Depth=1
	movq	8(%r14), %rdx
	movzwl	-8(%rdx,%rbx), %esi
	cmpw	%si, %r15w
	jb	.LBB117_6
# %bb.4:                                #   in Loop: Header=BB117_3 Depth=1
	movzwl	-6(%rdx,%rbx), %edi
	addl	%esi, %edi
	cmpl	%r15d, %edi
	jbe	.LBB117_6
# %bb.5:                                #   in Loop: Header=BB117_3 Depth=1
	movq	(%rdx,%rbx), %rdi
	movl	%r15d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbx)
                                        # kill: def $al killed $al def $rax
	movq	16(%r14), %rcx
	jmp	.LBB117_6
.LBB117_7:
	addw	$1, 4(%r14)
	testq	%rcx, %rcx
	je	.LBB117_13
# %bb.8:
	movzbl	%al, %r12d
	movl	$24, %ebp
	xorl	%ebx, %ebx
	movzbl	1(%r14), %r15d
	jmp	.LBB117_9
	.p2align	4, 0x90
.LBB117_12:                             #   in Loop: Header=BB117_9 Depth=1
	addq	$1, %rbx
	addq	$32, %rbp
	cmpq	%rcx, %rbx
	jae	.LBB117_13
.LBB117_9:                              # =>This Inner Loop Header: Depth=1
	movq	8(%r14), %rax
	movzwl	-8(%rax,%rbp), %edx
	cmpw	%r12w, %dx
	ja	.LBB117_12
# %bb.10:                               #   in Loop: Header=BB117_9 Depth=1
	movzwl	-6(%rax,%rbp), %esi
	addl	%edx, %esi
	cmpl	%r12d, %esi
	jbe	.LBB117_12
# %bb.11:                               #   in Loop: Header=BB117_9 Depth=1
	movq	(%rax,%rbp), %rdi
	movzwl	%r12w, %ecx
	subl	%edx, %ecx
	movzwl	%cx, %esi
	movl	%r15d, %edx
	callq	*-16(%rax,%rbp)
	movq	16(%r14), %rcx
	jmp	.LBB117_12
.LBB117_1:
	addl	$1, %r15d
	movw	%r15w, 4(%r14)
.LBB117_13:
	movl	$3, %eax
	popq	%rbx
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end117:
	.size	STX_zpg, .Lfunc_end117-STX_zpg
	.cfi_endproc
                                        # -- End function
	.globl	STX_zpgy                # -- Begin function STX_zpgy
	.p2align	4, 0x90
	.type	STX_zpgy,@function
STX_zpgy:                               # @STX_zpgy
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r13
	.cfi_def_cfa_offset 40
	pushq	%r12
	.cfi_def_cfa_offset 48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	pushq	%rax
	.cfi_def_cfa_offset 64
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%rdi, %r12
	movzwl	4(%rdi), %r15d
	movq	16(%rdi), %rcx
	testq	%rcx, %rcx
	je	.LBB118_1
# %bb.2:
	movzwl	%r15w, %r14d
	movl	$24, %ebp
	xorl	%eax, %eax
	xorl	%ebx, %ebx
	jmp	.LBB118_3
	.p2align	4, 0x90
.LBB118_6:                              #   in Loop: Header=BB118_3 Depth=1
	addq	$1, %rbx
	addq	$32, %rbp
	cmpq	%rcx, %rbx
	jae	.LBB118_7
.LBB118_3:                              # =>This Inner Loop Header: Depth=1
	movq	8(%r12), %rdx
	movzwl	-8(%rdx,%rbp), %esi
	cmpw	%si, %r15w
	jb	.LBB118_6
# %bb.4:                                #   in Loop: Header=BB118_3 Depth=1
	movzwl	-6(%rdx,%rbp), %edi
	addl	%esi, %edi
	cmpl	%r14d, %edi
	jbe	.LBB118_6
# %bb.5:                                #   in Loop: Header=BB118_3 Depth=1
	movq	(%rdx,%rbp), %rdi
	movl	%r15d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbp)
                                        # kill: def $al killed $al def $rax
	movq	16(%r12), %rcx
	jmp	.LBB118_6
.LBB118_7:
	movzwl	4(%r12), %r15d
	jmp	.LBB118_8
.LBB118_1:
	xorl	%ecx, %ecx
	xorl	%eax, %eax
.LBB118_8:
	addb	2(%r12), %al
	addl	$1, %r15d
	movw	%r15w, 4(%r12)
	testq	%rcx, %rcx
	je	.LBB118_14
# %bb.9:
	movzbl	%al, %r13d
	movzwl	%r13w, %r15d
	movl	$24, %ebx
	xorl	%ebp, %ebp
	movzbl	1(%r12), %r14d
	jmp	.LBB118_10
	.p2align	4, 0x90
.LBB118_13:                             #   in Loop: Header=BB118_10 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rcx, %rbp
	jae	.LBB118_14
.LBB118_10:                             # =>This Inner Loop Header: Depth=1
	movq	8(%r12), %rax
	movzwl	-8(%rax,%rbx), %edx
	cmpw	%r13w, %dx
	ja	.LBB118_13
# %bb.11:                               #   in Loop: Header=BB118_10 Depth=1
	movzwl	-6(%rax,%rbx), %esi
	addl	%edx, %esi
	cmpl	%r15d, %esi
	jbe	.LBB118_13
# %bb.12:                               #   in Loop: Header=BB118_10 Depth=1
	movq	(%rax,%rbx), %rdi
	movl	%r15d, %ecx
	subl	%edx, %ecx
	movzwl	%cx, %esi
	movl	%r14d, %edx
	callq	*-16(%rax,%rbx)
	movq	16(%r12), %rcx
	jmp	.LBB118_13
.LBB118_14:
	movl	$4, %eax
	addq	$8, %rsp
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%r12
	.cfi_def_cfa_offset 40
	popq	%r13
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end118:
	.size	STX_zpgy, .Lfunc_end118-STX_zpgy
	.cfi_endproc
                                        # -- End function
	.globl	STX_abss                # -- Begin function STX_abss
	.p2align	4, 0x90
	.type	STX_abss,@function
STX_abss:                               # @STX_abss
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r13
	.cfi_def_cfa_offset 40
	pushq	%r12
	.cfi_def_cfa_offset 48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	pushq	%rax
	.cfi_def_cfa_offset 64
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%rdi, %r13
	movzwl	4(%rdi), %r12d
	movq	16(%rdi), %rcx
	testq	%rcx, %rcx
	je	.LBB119_13
# %bb.1:
	movzwl	%r12w, %r14d
	movl	$24, %ebp
	xorl	%eax, %eax
	xorl	%ebx, %ebx
	jmp	.LBB119_3
	.p2align	4, 0x90
.LBB119_2:                              #   in Loop: Header=BB119_3 Depth=1
	addq	$1, %rbx
	addq	$32, %rbp
	cmpq	%rcx, %rbx
	jae	.LBB119_6
.LBB119_3:                              # =>This Inner Loop Header: Depth=1
	movq	8(%r13), %rdx
	movzwl	-8(%rdx,%rbp), %esi
	cmpw	%si, %r12w
	jb	.LBB119_2
# %bb.4:                                #   in Loop: Header=BB119_3 Depth=1
	movzwl	-6(%rdx,%rbp), %edi
	addl	%esi, %edi
	cmpl	%r14d, %edi
	jbe	.LBB119_2
# %bb.5:                                #   in Loop: Header=BB119_3 Depth=1
	movq	(%rdx,%rbp), %rdi
	movl	%r12d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbp)
                                        # kill: def $al killed $al def $rax
	movq	16(%r13), %rcx
	jmp	.LBB119_2
.LBB119_6:
	movzbl	%al, %r14d
	movl	4(%r13), %r12d
	testq	%rcx, %rcx
	je	.LBB119_14
# %bb.7:
	addl	$1, %r12d
	movzwl	%r12w, %r15d
	movl	$24, %ebp
	xorl	%eax, %eax
	xorl	%ebx, %ebx
	jmp	.LBB119_9
	.p2align	4, 0x90
.LBB119_8:                              #   in Loop: Header=BB119_9 Depth=1
	addq	$1, %rbx
	addq	$32, %rbp
	cmpq	%rcx, %rbx
	jae	.LBB119_12
.LBB119_9:                              # =>This Inner Loop Header: Depth=1
	movq	8(%r13), %rdx
	movzwl	-8(%rdx,%rbp), %esi
	cmpw	%si, %r12w
	jb	.LBB119_8
# %bb.10:                               #   in Loop: Header=BB119_9 Depth=1
	movzwl	-6(%rdx,%rbp), %edi
	addl	%esi, %edi
	cmpl	%r15d, %edi
	jbe	.LBB119_8
# %bb.11:                               #   in Loop: Header=BB119_9 Depth=1
	movq	(%rdx,%rbp), %rdi
	movl	%r12d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbp)
                                        # kill: def $al killed $al def $rax
	movq	16(%r13), %rcx
	jmp	.LBB119_8
.LBB119_12:
	movzwl	4(%r13), %r12d
	addl	$2, %r12d
	movw	%r12w, 4(%r13)
	testq	%rcx, %rcx
	jne	.LBB119_16
	jmp	.LBB119_21
.LBB119_13:
	xorl	%ecx, %ecx
	xorl	%r14d, %r14d
	jmp	.LBB119_15
.LBB119_14:
	xorl	%ecx, %ecx
.LBB119_15:
	xorl	%eax, %eax
	addl	$2, %r12d
	movw	%r12w, 4(%r13)
	testq	%rcx, %rcx
	je	.LBB119_21
.LBB119_16:
	movzbl	%al, %eax
	shll	$8, %eax
	movzwl	%r14w, %r12d
	orl	%eax, %r12d
	movzwl	%r12w, %r15d
	movl	$24, %ebx
	xorl	%ebp, %ebp
	movzbl	1(%r13), %r14d
	jmp	.LBB119_18
	.p2align	4, 0x90
.LBB119_17:                             #   in Loop: Header=BB119_18 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rcx, %rbp
	jae	.LBB119_21
.LBB119_18:                             # =>This Inner Loop Header: Depth=1
	movq	8(%r13), %rax
	movzwl	-8(%rax,%rbx), %edx
	cmpw	%dx, %r12w
	jb	.LBB119_17
# %bb.19:                               #   in Loop: Header=BB119_18 Depth=1
	movzwl	-6(%rax,%rbx), %esi
	addl	%edx, %esi
	cmpl	%r15d, %esi
	jbe	.LBB119_17
# %bb.20:                               #   in Loop: Header=BB119_18 Depth=1
	movq	(%rax,%rbx), %rdi
	movl	%r12d, %ecx
	subl	%edx, %ecx
	movzwl	%cx, %esi
	movl	%r14d, %edx
	callq	*-16(%rax,%rbx)
	movq	16(%r13), %rcx
	jmp	.LBB119_17
.LBB119_21:
	movl	$4, %eax
	addq	$8, %rsp
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%r12
	.cfi_def_cfa_offset 40
	popq	%r13
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end119:
	.size	STX_abss, .Lfunc_end119-STX_abss
	.cfi_endproc
                                        # -- End function
	.globl	STY_zpg                 # -- Begin function STY_zpg
	.p2align	4, 0x90
	.type	STY_zpg,@function
STY_zpg:                                # @STY_zpg
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r12
	.cfi_def_cfa_offset 40
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset %rbx, -48
	.cfi_offset %r12, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%rdi, %r14
	movzwl	4(%rdi), %r15d
	movq	16(%rdi), %rcx
	testq	%rcx, %rcx
	je	.LBB120_1
# %bb.2:
	movl	$24, %ebx
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	jmp	.LBB120_3
	.p2align	4, 0x90
.LBB120_6:                              #   in Loop: Header=BB120_3 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rcx, %rbp
	jae	.LBB120_7
.LBB120_3:                              # =>This Inner Loop Header: Depth=1
	movq	8(%r14), %rdx
	movzwl	-8(%rdx,%rbx), %esi
	cmpw	%si, %r15w
	jb	.LBB120_6
# %bb.4:                                #   in Loop: Header=BB120_3 Depth=1
	movzwl	-6(%rdx,%rbx), %edi
	addl	%esi, %edi
	cmpl	%r15d, %edi
	jbe	.LBB120_6
# %bb.5:                                #   in Loop: Header=BB120_3 Depth=1
	movq	(%rdx,%rbx), %rdi
	movl	%r15d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbx)
                                        # kill: def $al killed $al def $rax
	movq	16(%r14), %rcx
	jmp	.LBB120_6
.LBB120_7:
	addw	$1, 4(%r14)
	testq	%rcx, %rcx
	je	.LBB120_13
# %bb.8:
	movzbl	%al, %r12d
	movl	$24, %ebp
	xorl	%ebx, %ebx
	movzbl	2(%r14), %r15d
	jmp	.LBB120_9
	.p2align	4, 0x90
.LBB120_12:                             #   in Loop: Header=BB120_9 Depth=1
	addq	$1, %rbx
	addq	$32, %rbp
	cmpq	%rcx, %rbx
	jae	.LBB120_13
.LBB120_9:                              # =>This Inner Loop Header: Depth=1
	movq	8(%r14), %rax
	movzwl	-8(%rax,%rbp), %edx
	cmpw	%r12w, %dx
	ja	.LBB120_12
# %bb.10:                               #   in Loop: Header=BB120_9 Depth=1
	movzwl	-6(%rax,%rbp), %esi
	addl	%edx, %esi
	cmpl	%r12d, %esi
	jbe	.LBB120_12
# %bb.11:                               #   in Loop: Header=BB120_9 Depth=1
	movq	(%rax,%rbp), %rdi
	movzwl	%r12w, %ecx
	subl	%edx, %ecx
	movzwl	%cx, %esi
	movl	%r15d, %edx
	callq	*-16(%rax,%rbp)
	movq	16(%r14), %rcx
	jmp	.LBB120_12
.LBB120_1:
	addl	$1, %r15d
	movw	%r15w, 4(%r14)
.LBB120_13:
	movl	$3, %eax
	popq	%rbx
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end120:
	.size	STY_zpg, .Lfunc_end120-STY_zpg
	.cfi_endproc
                                        # -- End function
	.globl	STY_zpgx                # -- Begin function STY_zpgx
	.p2align	4, 0x90
	.type	STY_zpgx,@function
STY_zpgx:                               # @STY_zpgx
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r13
	.cfi_def_cfa_offset 40
	pushq	%r12
	.cfi_def_cfa_offset 48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	pushq	%rax
	.cfi_def_cfa_offset 64
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%rdi, %r12
	movzwl	4(%rdi), %r15d
	movq	16(%rdi), %rcx
	testq	%rcx, %rcx
	je	.LBB121_1
# %bb.2:
	movzwl	%r15w, %r14d
	movl	$24, %ebp
	xorl	%eax, %eax
	xorl	%ebx, %ebx
	jmp	.LBB121_3
	.p2align	4, 0x90
.LBB121_6:                              #   in Loop: Header=BB121_3 Depth=1
	addq	$1, %rbx
	addq	$32, %rbp
	cmpq	%rcx, %rbx
	jae	.LBB121_7
.LBB121_3:                              # =>This Inner Loop Header: Depth=1
	movq	8(%r12), %rdx
	movzwl	-8(%rdx,%rbp), %esi
	cmpw	%si, %r15w
	jb	.LBB121_6
# %bb.4:                                #   in Loop: Header=BB121_3 Depth=1
	movzwl	-6(%rdx,%rbp), %edi
	addl	%esi, %edi
	cmpl	%r14d, %edi
	jbe	.LBB121_6
# %bb.5:                                #   in Loop: Header=BB121_3 Depth=1
	movq	(%rdx,%rbp), %rdi
	movl	%r15d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbp)
                                        # kill: def $al killed $al def $rax
	movq	16(%r12), %rcx
	jmp	.LBB121_6
.LBB121_7:
	movzwl	4(%r12), %r15d
	jmp	.LBB121_8
.LBB121_1:
	xorl	%ecx, %ecx
	xorl	%eax, %eax
.LBB121_8:
	addb	1(%r12), %al
	addl	$1, %r15d
	movw	%r15w, 4(%r12)
	testq	%rcx, %rcx
	je	.LBB121_14
# %bb.9:
	movzbl	%al, %r13d
	movzwl	%r13w, %r15d
	movl	$24, %ebx
	xorl	%ebp, %ebp
	movzbl	2(%r12), %r14d
	jmp	.LBB121_10
	.p2align	4, 0x90
.LBB121_13:                             #   in Loop: Header=BB121_10 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rcx, %rbp
	jae	.LBB121_14
.LBB121_10:                             # =>This Inner Loop Header: Depth=1
	movq	8(%r12), %rax
	movzwl	-8(%rax,%rbx), %edx
	cmpw	%r13w, %dx
	ja	.LBB121_13
# %bb.11:                               #   in Loop: Header=BB121_10 Depth=1
	movzwl	-6(%rax,%rbx), %esi
	addl	%edx, %esi
	cmpl	%r15d, %esi
	jbe	.LBB121_13
# %bb.12:                               #   in Loop: Header=BB121_10 Depth=1
	movq	(%rax,%rbx), %rdi
	movl	%r15d, %ecx
	subl	%edx, %ecx
	movzwl	%cx, %esi
	movl	%r14d, %edx
	callq	*-16(%rax,%rbx)
	movq	16(%r12), %rcx
	jmp	.LBB121_13
.LBB121_14:
	movl	$4, %eax
	addq	$8, %rsp
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%r12
	.cfi_def_cfa_offset 40
	popq	%r13
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end121:
	.size	STY_zpgx, .Lfunc_end121-STY_zpgx
	.cfi_endproc
                                        # -- End function
	.globl	STY_abss                # -- Begin function STY_abss
	.p2align	4, 0x90
	.type	STY_abss,@function
STY_abss:                               # @STY_abss
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r13
	.cfi_def_cfa_offset 40
	pushq	%r12
	.cfi_def_cfa_offset 48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	pushq	%rax
	.cfi_def_cfa_offset 64
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%rdi, %r13
	movzwl	4(%rdi), %r12d
	movq	16(%rdi), %rcx
	testq	%rcx, %rcx
	je	.LBB122_13
# %bb.1:
	movzwl	%r12w, %r14d
	movl	$24, %ebp
	xorl	%eax, %eax
	xorl	%ebx, %ebx
	jmp	.LBB122_3
	.p2align	4, 0x90
.LBB122_2:                              #   in Loop: Header=BB122_3 Depth=1
	addq	$1, %rbx
	addq	$32, %rbp
	cmpq	%rcx, %rbx
	jae	.LBB122_6
.LBB122_3:                              # =>This Inner Loop Header: Depth=1
	movq	8(%r13), %rdx
	movzwl	-8(%rdx,%rbp), %esi
	cmpw	%si, %r12w
	jb	.LBB122_2
# %bb.4:                                #   in Loop: Header=BB122_3 Depth=1
	movzwl	-6(%rdx,%rbp), %edi
	addl	%esi, %edi
	cmpl	%r14d, %edi
	jbe	.LBB122_2
# %bb.5:                                #   in Loop: Header=BB122_3 Depth=1
	movq	(%rdx,%rbp), %rdi
	movl	%r12d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbp)
                                        # kill: def $al killed $al def $rax
	movq	16(%r13), %rcx
	jmp	.LBB122_2
.LBB122_6:
	movzbl	%al, %r14d
	movl	4(%r13), %r12d
	testq	%rcx, %rcx
	je	.LBB122_14
# %bb.7:
	addl	$1, %r12d
	movzwl	%r12w, %r15d
	movl	$24, %ebp
	xorl	%eax, %eax
	xorl	%ebx, %ebx
	jmp	.LBB122_9
	.p2align	4, 0x90
.LBB122_8:                              #   in Loop: Header=BB122_9 Depth=1
	addq	$1, %rbx
	addq	$32, %rbp
	cmpq	%rcx, %rbx
	jae	.LBB122_12
.LBB122_9:                              # =>This Inner Loop Header: Depth=1
	movq	8(%r13), %rdx
	movzwl	-8(%rdx,%rbp), %esi
	cmpw	%si, %r12w
	jb	.LBB122_8
# %bb.10:                               #   in Loop: Header=BB122_9 Depth=1
	movzwl	-6(%rdx,%rbp), %edi
	addl	%esi, %edi
	cmpl	%r15d, %edi
	jbe	.LBB122_8
# %bb.11:                               #   in Loop: Header=BB122_9 Depth=1
	movq	(%rdx,%rbp), %rdi
	movl	%r12d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbp)
                                        # kill: def $al killed $al def $rax
	movq	16(%r13), %rcx
	jmp	.LBB122_8
.LBB122_12:
	movzwl	4(%r13), %r12d
	addl	$2, %r12d
	movw	%r12w, 4(%r13)
	testq	%rcx, %rcx
	jne	.LBB122_16
	jmp	.LBB122_21
.LBB122_13:
	xorl	%ecx, %ecx
	xorl	%r14d, %r14d
	jmp	.LBB122_15
.LBB122_14:
	xorl	%ecx, %ecx
.LBB122_15:
	xorl	%eax, %eax
	addl	$2, %r12d
	movw	%r12w, 4(%r13)
	testq	%rcx, %rcx
	je	.LBB122_21
.LBB122_16:
	movzbl	%al, %eax
	shll	$8, %eax
	movzwl	%r14w, %r12d
	orl	%eax, %r12d
	movzwl	%r12w, %r15d
	movl	$24, %ebx
	xorl	%ebp, %ebp
	movzbl	2(%r13), %r14d
	jmp	.LBB122_18
	.p2align	4, 0x90
.LBB122_17:                             #   in Loop: Header=BB122_18 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rcx, %rbp
	jae	.LBB122_21
.LBB122_18:                             # =>This Inner Loop Header: Depth=1
	movq	8(%r13), %rax
	movzwl	-8(%rax,%rbx), %edx
	cmpw	%dx, %r12w
	jb	.LBB122_17
# %bb.19:                               #   in Loop: Header=BB122_18 Depth=1
	movzwl	-6(%rax,%rbx), %esi
	addl	%edx, %esi
	cmpl	%r15d, %esi
	jbe	.LBB122_17
# %bb.20:                               #   in Loop: Header=BB122_18 Depth=1
	movq	(%rax,%rbx), %rdi
	movl	%r12d, %ecx
	subl	%edx, %ecx
	movzwl	%cx, %esi
	movl	%r14d, %edx
	callq	*-16(%rax,%rbx)
	movq	16(%r13), %rcx
	jmp	.LBB122_17
.LBB122_21:
	movl	$4, %eax
	addq	$8, %rsp
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%r12
	.cfi_def_cfa_offset 40
	popq	%r13
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end122:
	.size	STY_abss, .Lfunc_end122-STY_abss
	.cfi_endproc
                                        # -- End function
	.globl	SAX_zpg                 # -- Begin function SAX_zpg
	.p2align	4, 0x90
	.type	SAX_zpg,@function
SAX_zpg:                                # @SAX_zpg
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r13
	.cfi_def_cfa_offset 40
	pushq	%r12
	.cfi_def_cfa_offset 48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	pushq	%rax
	.cfi_def_cfa_offset 64
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%rdi, %r12
	movzwl	4(%rdi), %r15d
	movq	16(%rdi), %rcx
	testq	%rcx, %rcx
	je	.LBB123_1
# %bb.2:
	movzwl	%r15w, %r14d
	movl	$24, %ebp
	xorl	%eax, %eax
	xorl	%ebx, %ebx
	jmp	.LBB123_3
	.p2align	4, 0x90
.LBB123_6:                              #   in Loop: Header=BB123_3 Depth=1
	addq	$1, %rbx
	addq	$32, %rbp
	cmpq	%rcx, %rbx
	jae	.LBB123_7
.LBB123_3:                              # =>This Inner Loop Header: Depth=1
	movq	8(%r12), %rdx
	movzwl	-8(%rdx,%rbp), %esi
	cmpw	%si, %r15w
	jb	.LBB123_6
# %bb.4:                                #   in Loop: Header=BB123_3 Depth=1
	movzwl	-6(%rdx,%rbp), %edi
	addl	%esi, %edi
	cmpl	%r14d, %edi
	jbe	.LBB123_6
# %bb.5:                                #   in Loop: Header=BB123_3 Depth=1
	movq	(%rdx,%rbp), %rdi
	movl	%r15d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbp)
                                        # kill: def $al killed $al def $rax
	movq	16(%r12), %rcx
	jmp	.LBB123_6
.LBB123_7:
	movzwl	4(%r12), %r15d
	addl	$1, %r15d
	movw	%r15w, 4(%r12)
	testq	%rcx, %rcx
	jne	.LBB123_9
	jmp	.LBB123_14
.LBB123_1:
	xorl	%ecx, %ecx
	xorl	%eax, %eax
	addl	$1, %r15d
	movw	%r15w, 4(%r12)
	testq	%rcx, %rcx
	je	.LBB123_14
.LBB123_9:
	movzbl	%al, %r13d
	movb	1(%r12), %al
	andb	(%r12), %al
	movzwl	%r13w, %r15d
	movl	$24, %ebx
	xorl	%ebp, %ebp
	movzbl	%al, %r14d
	jmp	.LBB123_10
	.p2align	4, 0x90
.LBB123_13:                             #   in Loop: Header=BB123_10 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rcx, %rbp
	jae	.LBB123_14
.LBB123_10:                             # =>This Inner Loop Header: Depth=1
	movq	8(%r12), %rax
	movzwl	-8(%rax,%rbx), %edx
	cmpw	%r13w, %dx
	ja	.LBB123_13
# %bb.11:                               #   in Loop: Header=BB123_10 Depth=1
	movzwl	-6(%rax,%rbx), %esi
	addl	%edx, %esi
	cmpl	%r15d, %esi
	jbe	.LBB123_13
# %bb.12:                               #   in Loop: Header=BB123_10 Depth=1
	movq	(%rax,%rbx), %rdi
	movl	%r15d, %ecx
	subl	%edx, %ecx
	movzwl	%cx, %esi
	movl	%r14d, %edx
	callq	*-16(%rax,%rbx)
	movq	16(%r12), %rcx
	jmp	.LBB123_13
.LBB123_14:
	movl	$3, %eax
	addq	$8, %rsp
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%r12
	.cfi_def_cfa_offset 40
	popq	%r13
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end123:
	.size	SAX_zpg, .Lfunc_end123-SAX_zpg
	.cfi_endproc
                                        # -- End function
	.globl	SAX_xind                # -- Begin function SAX_xind
	.p2align	4, 0x90
	.type	SAX_xind,@function
SAX_xind:                               # @SAX_xind
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r13
	.cfi_def_cfa_offset 40
	pushq	%r12
	.cfi_def_cfa_offset 48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	pushq	%rax
	.cfi_def_cfa_offset 64
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%rdi, %r13
	callq	xind
	movl	%eax, %r12d
	movq	16(%r13), %rax
	testq	%rax, %rax
	je	.LBB124_6
# %bb.1:
	movb	1(%r13), %cl
	andb	(%r13), %cl
	movzwl	%r12w, %r15d
	movl	$24, %ebp
	xorl	%ebx, %ebx
	movzbl	%cl, %r14d
	jmp	.LBB124_2
	.p2align	4, 0x90
.LBB124_5:                              #   in Loop: Header=BB124_2 Depth=1
	addq	$1, %rbx
	addq	$32, %rbp
	cmpq	%rax, %rbx
	jae	.LBB124_6
.LBB124_2:                              # =>This Inner Loop Header: Depth=1
	movq	8(%r13), %rcx
	movzwl	-8(%rcx,%rbp), %edx
	cmpw	%dx, %r12w
	jb	.LBB124_5
# %bb.3:                                #   in Loop: Header=BB124_2 Depth=1
	movzwl	-6(%rcx,%rbp), %esi
	addl	%edx, %esi
	cmpl	%r15d, %esi
	jbe	.LBB124_5
# %bb.4:                                #   in Loop: Header=BB124_2 Depth=1
	movq	(%rcx,%rbp), %rdi
	movl	%r15d, %eax
	subl	%edx, %eax
	movzwl	%ax, %esi
	movl	%r14d, %edx
	callq	*-16(%rcx,%rbp)
	movq	16(%r13), %rax
	jmp	.LBB124_5
.LBB124_6:
	movl	$3, %eax
	addq	$8, %rsp
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%r12
	.cfi_def_cfa_offset 40
	popq	%r13
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end124:
	.size	SAX_xind, .Lfunc_end124-SAX_xind
	.cfi_endproc
                                        # -- End function
	.globl	SAX_abss                # -- Begin function SAX_abss
	.p2align	4, 0x90
	.type	SAX_abss,@function
SAX_abss:                               # @SAX_abss
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r13
	.cfi_def_cfa_offset 40
	pushq	%r12
	.cfi_def_cfa_offset 48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	pushq	%rax
	.cfi_def_cfa_offset 64
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%rdi, %r13
	movzwl	4(%rdi), %r12d
	movq	16(%rdi), %rcx
	testq	%rcx, %rcx
	je	.LBB125_13
# %bb.1:
	movzwl	%r12w, %r14d
	movl	$24, %ebp
	xorl	%eax, %eax
	xorl	%ebx, %ebx
	jmp	.LBB125_3
	.p2align	4, 0x90
.LBB125_2:                              #   in Loop: Header=BB125_3 Depth=1
	addq	$1, %rbx
	addq	$32, %rbp
	cmpq	%rcx, %rbx
	jae	.LBB125_6
.LBB125_3:                              # =>This Inner Loop Header: Depth=1
	movq	8(%r13), %rdx
	movzwl	-8(%rdx,%rbp), %esi
	cmpw	%si, %r12w
	jb	.LBB125_2
# %bb.4:                                #   in Loop: Header=BB125_3 Depth=1
	movzwl	-6(%rdx,%rbp), %edi
	addl	%esi, %edi
	cmpl	%r14d, %edi
	jbe	.LBB125_2
# %bb.5:                                #   in Loop: Header=BB125_3 Depth=1
	movq	(%rdx,%rbp), %rdi
	movl	%r12d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbp)
                                        # kill: def $al killed $al def $rax
	movq	16(%r13), %rcx
	jmp	.LBB125_2
.LBB125_6:
	movzbl	%al, %r14d
	movl	4(%r13), %r12d
	testq	%rcx, %rcx
	je	.LBB125_14
# %bb.7:
	addl	$1, %r12d
	movzwl	%r12w, %r15d
	movl	$24, %ebp
	xorl	%eax, %eax
	xorl	%ebx, %ebx
	jmp	.LBB125_9
	.p2align	4, 0x90
.LBB125_8:                              #   in Loop: Header=BB125_9 Depth=1
	addq	$1, %rbx
	addq	$32, %rbp
	cmpq	%rcx, %rbx
	jae	.LBB125_12
.LBB125_9:                              # =>This Inner Loop Header: Depth=1
	movq	8(%r13), %rdx
	movzwl	-8(%rdx,%rbp), %esi
	cmpw	%si, %r12w
	jb	.LBB125_8
# %bb.10:                               #   in Loop: Header=BB125_9 Depth=1
	movzwl	-6(%rdx,%rbp), %edi
	addl	%esi, %edi
	cmpl	%r15d, %edi
	jbe	.LBB125_8
# %bb.11:                               #   in Loop: Header=BB125_9 Depth=1
	movq	(%rdx,%rbp), %rdi
	movl	%r12d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbp)
                                        # kill: def $al killed $al def $rax
	movq	16(%r13), %rcx
	jmp	.LBB125_8
.LBB125_12:
	movzwl	4(%r13), %r12d
	addl	$2, %r12d
	movw	%r12w, 4(%r13)
	testq	%rcx, %rcx
	jne	.LBB125_16
	jmp	.LBB125_21
.LBB125_13:
	xorl	%ecx, %ecx
	xorl	%r14d, %r14d
	jmp	.LBB125_15
.LBB125_14:
	xorl	%ecx, %ecx
.LBB125_15:
	xorl	%eax, %eax
	addl	$2, %r12d
	movw	%r12w, 4(%r13)
	testq	%rcx, %rcx
	je	.LBB125_21
.LBB125_16:
	movzbl	%al, %eax
	shll	$8, %eax
	movzwl	%r14w, %r12d
	orl	%eax, %r12d
	movb	1(%r13), %al
	andb	(%r13), %al
	movzwl	%r12w, %r15d
	movl	$24, %ebx
	xorl	%ebp, %ebp
	movzbl	%al, %r14d
	jmp	.LBB125_18
	.p2align	4, 0x90
.LBB125_17:                             #   in Loop: Header=BB125_18 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rcx, %rbp
	jae	.LBB125_21
.LBB125_18:                             # =>This Inner Loop Header: Depth=1
	movq	8(%r13), %rax
	movzwl	-8(%rax,%rbx), %edx
	cmpw	%dx, %r12w
	jb	.LBB125_17
# %bb.19:                               #   in Loop: Header=BB125_18 Depth=1
	movzwl	-6(%rax,%rbx), %esi
	addl	%edx, %esi
	cmpl	%r15d, %esi
	jbe	.LBB125_17
# %bb.20:                               #   in Loop: Header=BB125_18 Depth=1
	movq	(%rax,%rbx), %rdi
	movl	%r12d, %ecx
	subl	%edx, %ecx
	movzwl	%cx, %esi
	movl	%r14d, %edx
	callq	*-16(%rax,%rbx)
	movq	16(%r13), %rcx
	jmp	.LBB125_17
.LBB125_21:
	movl	$3, %eax
	addq	$8, %rsp
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%r12
	.cfi_def_cfa_offset 40
	popq	%r13
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end125:
	.size	SAX_abss, .Lfunc_end125-SAX_abss
	.cfi_endproc
                                        # -- End function
	.globl	SAX_zpgy                # -- Begin function SAX_zpgy
	.p2align	4, 0x90
	.type	SAX_zpgy,@function
SAX_zpgy:                               # @SAX_zpgy
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r13
	.cfi_def_cfa_offset 40
	pushq	%r12
	.cfi_def_cfa_offset 48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	pushq	%rax
	.cfi_def_cfa_offset 64
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%rdi, %r12
	movzwl	4(%rdi), %r15d
	movq	16(%rdi), %rcx
	testq	%rcx, %rcx
	je	.LBB126_1
# %bb.2:
	movzwl	%r15w, %r14d
	movl	$24, %ebp
	xorl	%eax, %eax
	xorl	%ebx, %ebx
	jmp	.LBB126_3
	.p2align	4, 0x90
.LBB126_6:                              #   in Loop: Header=BB126_3 Depth=1
	addq	$1, %rbx
	addq	$32, %rbp
	cmpq	%rcx, %rbx
	jae	.LBB126_7
.LBB126_3:                              # =>This Inner Loop Header: Depth=1
	movq	8(%r12), %rdx
	movzwl	-8(%rdx,%rbp), %esi
	cmpw	%si, %r15w
	jb	.LBB126_6
# %bb.4:                                #   in Loop: Header=BB126_3 Depth=1
	movzwl	-6(%rdx,%rbp), %edi
	addl	%esi, %edi
	cmpl	%r14d, %edi
	jbe	.LBB126_6
# %bb.5:                                #   in Loop: Header=BB126_3 Depth=1
	movq	(%rdx,%rbp), %rdi
	movl	%r15d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbp)
                                        # kill: def $al killed $al def $rax
	movq	16(%r12), %rcx
	jmp	.LBB126_6
.LBB126_7:
	movzwl	4(%r12), %r15d
	jmp	.LBB126_8
.LBB126_1:
	xorl	%ecx, %ecx
	xorl	%eax, %eax
.LBB126_8:
	addb	2(%r12), %al
	addl	$1, %r15d
	movw	%r15w, 4(%r12)
	testq	%rcx, %rcx
	je	.LBB126_14
# %bb.9:
	movzbl	%al, %r13d
	movb	1(%r12), %al
	andb	(%r12), %al
	movzwl	%r13w, %r15d
	movl	$24, %ebx
	xorl	%ebp, %ebp
	movzbl	%al, %r14d
	jmp	.LBB126_10
	.p2align	4, 0x90
.LBB126_13:                             #   in Loop: Header=BB126_10 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rcx, %rbp
	jae	.LBB126_14
.LBB126_10:                             # =>This Inner Loop Header: Depth=1
	movq	8(%r12), %rax
	movzwl	-8(%rax,%rbx), %edx
	cmpw	%r13w, %dx
	ja	.LBB126_13
# %bb.11:                               #   in Loop: Header=BB126_10 Depth=1
	movzwl	-6(%rax,%rbx), %esi
	addl	%edx, %esi
	cmpl	%r15d, %esi
	jbe	.LBB126_13
# %bb.12:                               #   in Loop: Header=BB126_10 Depth=1
	movq	(%rax,%rbx), %rdi
	movl	%r15d, %ecx
	subl	%edx, %ecx
	movzwl	%cx, %esi
	movl	%r14d, %edx
	callq	*-16(%rax,%rbx)
	movq	16(%r12), %rcx
	jmp	.LBB126_13
.LBB126_14:
	movl	$3, %eax
	addq	$8, %rsp
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%r12
	.cfi_def_cfa_offset 40
	popq	%r13
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end126:
	.size	SAX_zpgy, .Lfunc_end126-SAX_zpgy
	.cfi_endproc
                                        # -- End function
	.globl	SXA_absy                # -- Begin function SXA_absy
	.p2align	4, 0x90
	.type	SXA_absy,@function
SXA_absy:                               # @SXA_absy
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r13
	.cfi_def_cfa_offset 40
	pushq	%r12
	.cfi_def_cfa_offset 48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	pushq	%rax
	.cfi_def_cfa_offset 64
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%rdi, %r13
	movzwl	4(%rdi), %r12d
	movq	16(%rdi), %rcx
	testq	%rcx, %rcx
	je	.LBB127_13
# %bb.1:
	movzwl	%r12w, %r14d
	movl	$24, %ebp
	xorl	%eax, %eax
	xorl	%ebx, %ebx
	jmp	.LBB127_3
	.p2align	4, 0x90
.LBB127_2:                              #   in Loop: Header=BB127_3 Depth=1
	addq	$1, %rbx
	addq	$32, %rbp
	cmpq	%rcx, %rbx
	jae	.LBB127_6
.LBB127_3:                              # =>This Inner Loop Header: Depth=1
	movq	8(%r13), %rdx
	movzwl	-8(%rdx,%rbp), %esi
	cmpw	%si, %r12w
	jb	.LBB127_2
# %bb.4:                                #   in Loop: Header=BB127_3 Depth=1
	movzwl	-6(%rdx,%rbp), %edi
	addl	%esi, %edi
	cmpl	%r14d, %edi
	jbe	.LBB127_2
# %bb.5:                                #   in Loop: Header=BB127_3 Depth=1
	movq	(%rdx,%rbp), %rdi
	movl	%r12d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbp)
                                        # kill: def $al killed $al def $rax
	movq	16(%r13), %rcx
	jmp	.LBB127_2
.LBB127_6:
	movzbl	%al, %r14d
	movl	4(%r13), %r12d
	testq	%rcx, %rcx
	je	.LBB127_14
# %bb.7:
	addl	$1, %r12d
	movzwl	%r12w, %r15d
	movl	$24, %ebp
	xorl	%eax, %eax
	xorl	%ebx, %ebx
	jmp	.LBB127_9
	.p2align	4, 0x90
.LBB127_8:                              #   in Loop: Header=BB127_9 Depth=1
	addq	$1, %rbx
	addq	$32, %rbp
	cmpq	%rcx, %rbx
	jae	.LBB127_12
.LBB127_9:                              # =>This Inner Loop Header: Depth=1
	movq	8(%r13), %rdx
	movzwl	-8(%rdx,%rbp), %esi
	cmpw	%si, %r12w
	jb	.LBB127_8
# %bb.10:                               #   in Loop: Header=BB127_9 Depth=1
	movzwl	-6(%rdx,%rbp), %edi
	addl	%esi, %edi
	cmpl	%r15d, %edi
	jbe	.LBB127_8
# %bb.11:                               #   in Loop: Header=BB127_9 Depth=1
	movq	(%rdx,%rbp), %rdi
	movl	%r12d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbp)
                                        # kill: def $al killed $al def $rax
	movq	16(%r13), %rcx
	jmp	.LBB127_8
.LBB127_12:
	movzwl	4(%r13), %r12d
	jmp	.LBB127_16
.LBB127_13:
	xorl	%ecx, %ecx
	xorl	%r14d, %r14d
	jmp	.LBB127_15
.LBB127_14:
	xorl	%ecx, %ecx
.LBB127_15:
	xorl	%eax, %eax
.LBB127_16:
	movzbl	2(%r13), %edx
	addl	$2, %r12d
	movw	%r12w, 4(%r13)
	testq	%rcx, %rcx
	je	.LBB127_22
# %bb.17:
	movzbl	%al, %eax
	shll	$8, %eax
	movzwl	%r14w, %r12d
	orl	%eax, %r12d
	addl	%edx, %r12d
	movl	%r12d, %r14d
	shrl	$8, %r14d
	addb	$1, %r14b
	andb	1(%r13), %r14b
	movzwl	%r12w, %r15d
	movl	$24, %ebx
	xorl	%ebp, %ebp
	jmp	.LBB127_19
	.p2align	4, 0x90
.LBB127_18:                             #   in Loop: Header=BB127_19 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rcx, %rbp
	jae	.LBB127_22
.LBB127_19:                             # =>This Inner Loop Header: Depth=1
	movq	8(%r13), %rax
	movzwl	-8(%rax,%rbx), %edx
	cmpw	%dx, %r12w
	jb	.LBB127_18
# %bb.20:                               #   in Loop: Header=BB127_19 Depth=1
	movzwl	-6(%rax,%rbx), %esi
	addl	%edx, %esi
	cmpl	%r15d, %esi
	jbe	.LBB127_18
# %bb.21:                               #   in Loop: Header=BB127_19 Depth=1
	movq	(%rax,%rbx), %rdi
	movl	%r12d, %ecx
	subl	%edx, %ecx
	movzwl	%cx, %esi
	movzbl	%r14b, %edx
	callq	*-16(%rax,%rbx)
	movq	16(%r13), %rcx
	jmp	.LBB127_18
.LBB127_22:
	movl	$5, %eax
	addq	$8, %rsp
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%r12
	.cfi_def_cfa_offset 40
	popq	%r13
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end127:
	.size	SXA_absy, .Lfunc_end127-SXA_absy
	.cfi_endproc
                                        # -- End function
	.globl	SYA_absx                # -- Begin function SYA_absx
	.p2align	4, 0x90
	.type	SYA_absx,@function
SYA_absx:                               # @SYA_absx
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r13
	.cfi_def_cfa_offset 40
	pushq	%r12
	.cfi_def_cfa_offset 48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	pushq	%rax
	.cfi_def_cfa_offset 64
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%rdi, %r13
	movzwl	4(%rdi), %r12d
	movq	16(%rdi), %rcx
	testq	%rcx, %rcx
	je	.LBB128_13
# %bb.1:
	movzwl	%r12w, %r14d
	movl	$24, %ebp
	xorl	%eax, %eax
	xorl	%ebx, %ebx
	jmp	.LBB128_3
	.p2align	4, 0x90
.LBB128_2:                              #   in Loop: Header=BB128_3 Depth=1
	addq	$1, %rbx
	addq	$32, %rbp
	cmpq	%rcx, %rbx
	jae	.LBB128_6
.LBB128_3:                              # =>This Inner Loop Header: Depth=1
	movq	8(%r13), %rdx
	movzwl	-8(%rdx,%rbp), %esi
	cmpw	%si, %r12w
	jb	.LBB128_2
# %bb.4:                                #   in Loop: Header=BB128_3 Depth=1
	movzwl	-6(%rdx,%rbp), %edi
	addl	%esi, %edi
	cmpl	%r14d, %edi
	jbe	.LBB128_2
# %bb.5:                                #   in Loop: Header=BB128_3 Depth=1
	movq	(%rdx,%rbp), %rdi
	movl	%r12d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbp)
                                        # kill: def $al killed $al def $rax
	movq	16(%r13), %rcx
	jmp	.LBB128_2
.LBB128_6:
	movzbl	%al, %r14d
	movl	4(%r13), %r12d
	testq	%rcx, %rcx
	je	.LBB128_14
# %bb.7:
	addl	$1, %r12d
	movzwl	%r12w, %r15d
	movl	$24, %ebp
	xorl	%eax, %eax
	xorl	%ebx, %ebx
	jmp	.LBB128_9
	.p2align	4, 0x90
.LBB128_8:                              #   in Loop: Header=BB128_9 Depth=1
	addq	$1, %rbx
	addq	$32, %rbp
	cmpq	%rcx, %rbx
	jae	.LBB128_12
.LBB128_9:                              # =>This Inner Loop Header: Depth=1
	movq	8(%r13), %rdx
	movzwl	-8(%rdx,%rbp), %esi
	cmpw	%si, %r12w
	jb	.LBB128_8
# %bb.10:                               #   in Loop: Header=BB128_9 Depth=1
	movzwl	-6(%rdx,%rbp), %edi
	addl	%esi, %edi
	cmpl	%r15d, %edi
	jbe	.LBB128_8
# %bb.11:                               #   in Loop: Header=BB128_9 Depth=1
	movq	(%rdx,%rbp), %rdi
	movl	%r12d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbp)
                                        # kill: def $al killed $al def $rax
	movq	16(%r13), %rcx
	jmp	.LBB128_8
.LBB128_12:
	movzwl	4(%r13), %r12d
	jmp	.LBB128_16
.LBB128_13:
	xorl	%ecx, %ecx
	xorl	%r14d, %r14d
	jmp	.LBB128_15
.LBB128_14:
	xorl	%ecx, %ecx
.LBB128_15:
	xorl	%eax, %eax
.LBB128_16:
	movzbl	1(%r13), %edx
	addl	$2, %r12d
	movw	%r12w, 4(%r13)
	testq	%rcx, %rcx
	je	.LBB128_22
# %bb.17:
	movzbl	%al, %eax
	shll	$8, %eax
	movzwl	%r14w, %r12d
	orl	%eax, %r12d
	addl	%edx, %r12d
	movl	%r12d, %r14d
	shrl	$8, %r14d
	addb	$1, %r14b
	andb	2(%r13), %r14b
	movzwl	%r12w, %r15d
	movl	$24, %ebx
	xorl	%ebp, %ebp
	jmp	.LBB128_19
	.p2align	4, 0x90
.LBB128_18:                             #   in Loop: Header=BB128_19 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rcx, %rbp
	jae	.LBB128_22
.LBB128_19:                             # =>This Inner Loop Header: Depth=1
	movq	8(%r13), %rax
	movzwl	-8(%rax,%rbx), %edx
	cmpw	%dx, %r12w
	jb	.LBB128_18
# %bb.20:                               #   in Loop: Header=BB128_19 Depth=1
	movzwl	-6(%rax,%rbx), %esi
	addl	%edx, %esi
	cmpl	%r15d, %esi
	jbe	.LBB128_18
# %bb.21:                               #   in Loop: Header=BB128_19 Depth=1
	movq	(%rax,%rbx), %rdi
	movl	%r12d, %ecx
	subl	%edx, %ecx
	movzwl	%cx, %esi
	movzbl	%r14b, %edx
	callq	*-16(%rax,%rbx)
	movq	16(%r13), %rcx
	jmp	.LBB128_18
.LBB128_22:
	movl	$5, %eax
	addq	$8, %rsp
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%r12
	.cfi_def_cfa_offset 40
	popq	%r13
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end128:
	.size	SYA_absx, .Lfunc_end128-SYA_absx
	.cfi_endproc
                                        # -- End function
	.globl	TAX                     # -- Begin function TAX
	.p2align	4, 0x90
	.type	TAX,@function
TAX:                                    # @TAX
	.cfi_startproc
# %bb.0:
	movb	(%rdi), %cl
	movb	6(%rdi), %al
	movb	%cl, 1(%rdi)
	testb	%cl, %cl
	js	.LBB129_1
# %bb.3:
	andb	$127, %al
	movb	%al, 6(%rdi)
	testb	%cl, %cl
	jne	.LBB129_2
# %bb.4:
	orb	$2, %al
	movb	%al, 6(%rdi)
	movl	$2, %eax
	retq
.LBB129_1:
	orb	$-128, %al
	movb	%al, 6(%rdi)
.LBB129_2:
	andb	$-3, %al
	movb	%al, 6(%rdi)
	movl	$2, %eax
	retq
.Lfunc_end129:
	.size	TAX, .Lfunc_end129-TAX
	.cfi_endproc
                                        # -- End function
	.globl	TAY                     # -- Begin function TAY
	.p2align	4, 0x90
	.type	TAY,@function
TAY:                                    # @TAY
	.cfi_startproc
# %bb.0:
	movb	(%rdi), %cl
	movb	6(%rdi), %al
	movb	%cl, 2(%rdi)
	testb	%cl, %cl
	js	.LBB130_1
# %bb.3:
	andb	$127, %al
	movb	%al, 6(%rdi)
	testb	%cl, %cl
	jne	.LBB130_2
# %bb.4:
	orb	$2, %al
	movb	%al, 6(%rdi)
	movl	$2, %eax
	retq
.LBB130_1:
	orb	$-128, %al
	movb	%al, 6(%rdi)
.LBB130_2:
	andb	$-3, %al
	movb	%al, 6(%rdi)
	movl	$2, %eax
	retq
.Lfunc_end130:
	.size	TAY, .Lfunc_end130-TAY
	.cfi_endproc
                                        # -- End function
	.globl	TSPX                    # -- Begin function TSPX
	.p2align	4, 0x90
	.type	TSPX,@function
TSPX:                                   # @TSPX
	.cfi_startproc
# %bb.0:
	movb	3(%rdi), %cl
	movb	6(%rdi), %al
	movb	%cl, 1(%rdi)
	testb	%cl, %cl
	js	.LBB131_1
# %bb.3:
	andb	$127, %al
	movb	%al, 6(%rdi)
	testb	%cl, %cl
	jne	.LBB131_2
# %bb.4:
	orb	$2, %al
	movb	%al, 6(%rdi)
	movl	$2, %eax
	retq
.LBB131_1:
	orb	$-128, %al
	movb	%al, 6(%rdi)
.LBB131_2:
	andb	$-3, %al
	movb	%al, 6(%rdi)
	movl	$2, %eax
	retq
.Lfunc_end131:
	.size	TSPX, .Lfunc_end131-TSPX
	.cfi_endproc
                                        # -- End function
	.globl	TXA                     # -- Begin function TXA
	.p2align	4, 0x90
	.type	TXA,@function
TXA:                                    # @TXA
	.cfi_startproc
# %bb.0:
	movb	1(%rdi), %cl
	movb	6(%rdi), %al
	movb	%cl, (%rdi)
	testb	%cl, %cl
	js	.LBB132_1
# %bb.3:
	andb	$127, %al
	movb	%al, 6(%rdi)
	testb	%cl, %cl
	jne	.LBB132_2
# %bb.4:
	orb	$2, %al
	movb	%al, 6(%rdi)
	movl	$2, %eax
	retq
.LBB132_1:
	orb	$-128, %al
	movb	%al, 6(%rdi)
.LBB132_2:
	andb	$-3, %al
	movb	%al, 6(%rdi)
	movl	$2, %eax
	retq
.Lfunc_end132:
	.size	TXA, .Lfunc_end132-TXA
	.cfi_endproc
                                        # -- End function
	.globl	TYA                     # -- Begin function TYA
	.p2align	4, 0x90
	.type	TYA,@function
TYA:                                    # @TYA
	.cfi_startproc
# %bb.0:
	movb	2(%rdi), %cl
	movb	6(%rdi), %al
	movb	%cl, (%rdi)
	testb	%cl, %cl
	js	.LBB133_1
# %bb.3:
	andb	$127, %al
	movb	%al, 6(%rdi)
	testb	%cl, %cl
	jne	.LBB133_2
# %bb.4:
	orb	$2, %al
	movb	%al, 6(%rdi)
	movl	$2, %eax
	retq
.LBB133_1:
	orb	$-128, %al
	movb	%al, 6(%rdi)
.LBB133_2:
	andb	$-3, %al
	movb	%al, 6(%rdi)
	movl	$2, %eax
	retq
.Lfunc_end133:
	.size	TYA, .Lfunc_end133-TYA
	.cfi_endproc
                                        # -- End function
	.globl	TXS                     # -- Begin function TXS
	.p2align	4, 0x90
	.type	TXS,@function
TXS:                                    # @TXS
	.cfi_startproc
# %bb.0:
	movb	1(%rdi), %al
	movb	%al, 3(%rdi)
	movl	$2, %eax
	retq
.Lfunc_end134:
	.size	TXS, .Lfunc_end134-TXS
	.cfi_endproc
                                        # -- End function
	.globl	LDA_imm                 # -- Begin function LDA_imm
	.p2align	4, 0x90
	.type	LDA_imm,@function
LDA_imm:                                # @LDA_imm
	.cfi_startproc
# %bb.0:
	pushq	%r15
	.cfi_def_cfa_offset 16
	pushq	%r14
	.cfi_def_cfa_offset 24
	pushq	%r12
	.cfi_def_cfa_offset 32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	pushq	%rax
	.cfi_def_cfa_offset 48
	.cfi_offset %rbx, -40
	.cfi_offset %r12, -32
	.cfi_offset %r14, -24
	.cfi_offset %r15, -16
	movq	%rdi, %r14
	movzwl	4(%rdi), %r15d
	leal	1(%r15), %eax
	movw	%ax, 4(%rdi)
	movq	16(%rdi), %rcx
	testq	%rcx, %rcx
	je	.LBB135_1
# %bb.2:
	movl	$24, %ebx
	xorl	%eax, %eax
	xorl	%r12d, %r12d
	jmp	.LBB135_3
	.p2align	4, 0x90
.LBB135_6:                              #   in Loop: Header=BB135_3 Depth=1
	addq	$1, %r12
	addq	$32, %rbx
	cmpq	%rcx, %r12
	jae	.LBB135_7
.LBB135_3:                              # =>This Inner Loop Header: Depth=1
	movq	8(%r14), %rdx
	movzwl	-8(%rdx,%rbx), %esi
	cmpw	%si, %r15w
	jb	.LBB135_6
# %bb.4:                                #   in Loop: Header=BB135_3 Depth=1
	movzwl	-6(%rdx,%rbx), %edi
	addl	%esi, %edi
	cmpl	%r15d, %edi
	jbe	.LBB135_6
# %bb.5:                                #   in Loop: Header=BB135_3 Depth=1
	movq	(%rdx,%rbx), %rdi
	movl	%r15d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbx)
                                        # kill: def $al killed $al def $rax
	movq	16(%r14), %rcx
	jmp	.LBB135_6
.LBB135_7:
	movb	%al, (%r14)
	movb	6(%r14), %cl
	leaq	6(%r14), %rdx
	testb	%al, %al
	js	.LBB135_8
# %bb.10:
	andb	$127, %cl
	movb	%cl, (%rdx)
	testb	%al, %al
	jne	.LBB135_9
	jmp	.LBB135_11
.LBB135_1:
	movb	$0, (%r14)
	leaq	6(%r14), %rdx
	movb	6(%r14), %cl
	andb	$127, %cl
	movb	%cl, 6(%r14)
.LBB135_11:
	orb	$2, %cl
	jmp	.LBB135_12
.LBB135_8:
	orb	$-128, %cl
	movb	%cl, (%rdx)
.LBB135_9:
	andb	$-3, %cl
.LBB135_12:
	movb	%cl, (%rdx)
	movl	$2, %eax
	addq	$8, %rsp
	.cfi_def_cfa_offset 40
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%r12
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end135:
	.size	LDA_imm, .Lfunc_end135-LDA_imm
	.cfi_endproc
                                        # -- End function
	.globl	LDA_zpg                 # -- Begin function LDA_zpg
	.p2align	4, 0x90
	.type	LDA_zpg,@function
LDA_zpg:                                # @LDA_zpg
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	pushq	%rax
	.cfi_def_cfa_offset 48
	.cfi_offset %rbx, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%rdi, %r14
	movzwl	4(%rdi), %r15d
	movq	16(%rdi), %rcx
	testq	%rcx, %rcx
	je	.LBB136_1
# %bb.3:
	movl	$24, %ebx
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	jmp	.LBB136_4
	.p2align	4, 0x90
.LBB136_7:                              #   in Loop: Header=BB136_4 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rcx, %rbp
	jae	.LBB136_8
.LBB136_4:                              # =>This Inner Loop Header: Depth=1
	movq	8(%r14), %rdx
	movzwl	-8(%rdx,%rbx), %esi
	cmpw	%si, %r15w
	jb	.LBB136_7
# %bb.5:                                #   in Loop: Header=BB136_4 Depth=1
	movzwl	-6(%rdx,%rbx), %edi
	addl	%esi, %edi
	cmpl	%r15d, %edi
	jbe	.LBB136_7
# %bb.6:                                #   in Loop: Header=BB136_4 Depth=1
	movq	(%rdx,%rbx), %rdi
	movl	%r15d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbx)
                                        # kill: def $al killed $al def $rax
	movq	16(%r14), %rcx
	jmp	.LBB136_7
.LBB136_8:
	addw	$1, 4(%r14)
	testq	%rcx, %rcx
	je	.LBB136_2
# %bb.9:
	movzbl	%al, %r15d
	movl	$24, %ebx
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	jmp	.LBB136_10
	.p2align	4, 0x90
.LBB136_13:                             #   in Loop: Header=BB136_10 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rcx, %rbp
	jae	.LBB136_14
.LBB136_10:                             # =>This Inner Loop Header: Depth=1
	movq	8(%r14), %rdx
	movzwl	-8(%rdx,%rbx), %esi
	cmpw	%r15w, %si
	ja	.LBB136_13
# %bb.11:                               #   in Loop: Header=BB136_10 Depth=1
	movzwl	-6(%rdx,%rbx), %edi
	addl	%esi, %edi
	cmpl	%r15d, %edi
	jbe	.LBB136_13
# %bb.12:                               #   in Loop: Header=BB136_10 Depth=1
	movq	(%rdx,%rbx), %rdi
	movzwl	%r15w, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbx)
                                        # kill: def $al killed $al def $rax
	movq	16(%r14), %rcx
	jmp	.LBB136_13
.LBB136_14:
	movb	%al, (%r14)
	movb	6(%r14), %cl
	leaq	6(%r14), %rdx
	testb	%al, %al
	js	.LBB136_15
# %bb.17:
	andb	$127, %cl
	movb	%cl, (%rdx)
	testb	%al, %al
	jne	.LBB136_16
	jmp	.LBB136_18
.LBB136_1:
	addl	$1, %r15d
	movw	%r15w, 4(%r14)
.LBB136_2:
	movb	$0, (%r14)
	leaq	6(%r14), %rdx
	movb	6(%r14), %cl
	andb	$127, %cl
	movb	%cl, 6(%r14)
.LBB136_18:
	orb	$2, %cl
	jmp	.LBB136_19
.LBB136_15:
	orb	$-128, %cl
	movb	%cl, (%rdx)
.LBB136_16:
	andb	$-3, %cl
.LBB136_19:
	movb	%cl, (%rdx)
	movl	$3, %eax
	addq	$8, %rsp
	.cfi_def_cfa_offset 40
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end136:
	.size	LDA_zpg, .Lfunc_end136-LDA_zpg
	.cfi_endproc
                                        # -- End function
	.globl	LDA_zpgx                # -- Begin function LDA_zpgx
	.p2align	4, 0x90
	.type	LDA_zpgx,@function
LDA_zpgx:                               # @LDA_zpgx
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r12
	.cfi_def_cfa_offset 40
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset %rbx, -48
	.cfi_offset %r12, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%rdi, %r12
	movzwl	4(%rdi), %r15d
	movq	16(%rdi), %rcx
	testq	%rcx, %rcx
	je	.LBB137_1
# %bb.2:
	movzwl	%r15w, %r14d
	movl	$24, %ebp
	xorl	%eax, %eax
	xorl	%ebx, %ebx
	jmp	.LBB137_3
	.p2align	4, 0x90
.LBB137_6:                              #   in Loop: Header=BB137_3 Depth=1
	addq	$1, %rbx
	addq	$32, %rbp
	cmpq	%rcx, %rbx
	jae	.LBB137_7
.LBB137_3:                              # =>This Inner Loop Header: Depth=1
	movq	8(%r12), %rdx
	movzwl	-8(%rdx,%rbp), %esi
	cmpw	%si, %r15w
	jb	.LBB137_6
# %bb.4:                                #   in Loop: Header=BB137_3 Depth=1
	movzwl	-6(%rdx,%rbp), %edi
	addl	%esi, %edi
	cmpl	%r14d, %edi
	jbe	.LBB137_6
# %bb.5:                                #   in Loop: Header=BB137_3 Depth=1
	movq	(%rdx,%rbp), %rdi
	movl	%r15d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbp)
                                        # kill: def $al killed $al def $rax
	movq	16(%r12), %rcx
	jmp	.LBB137_6
.LBB137_7:
	movzwl	4(%r12), %r15d
	jmp	.LBB137_8
.LBB137_1:
	xorl	%ecx, %ecx
	xorl	%eax, %eax
.LBB137_8:
	addb	1(%r12), %al
	addl	$1, %r15d
	movw	%r15w, 4(%r12)
	testq	%rcx, %rcx
	je	.LBB137_9
# %bb.10:
	movzbl	%al, %r15d
	movzwl	%r15w, %r14d
	movl	$24, %ebp
	xorl	%eax, %eax
	xorl	%ebx, %ebx
	jmp	.LBB137_11
	.p2align	4, 0x90
.LBB137_14:                             #   in Loop: Header=BB137_11 Depth=1
	addq	$1, %rbx
	addq	$32, %rbp
	cmpq	%rcx, %rbx
	jae	.LBB137_15
.LBB137_11:                             # =>This Inner Loop Header: Depth=1
	movq	8(%r12), %rdx
	movzwl	-8(%rdx,%rbp), %esi
	cmpw	%r15w, %si
	ja	.LBB137_14
# %bb.12:                               #   in Loop: Header=BB137_11 Depth=1
	movzwl	-6(%rdx,%rbp), %edi
	addl	%esi, %edi
	cmpl	%r14d, %edi
	jbe	.LBB137_14
# %bb.13:                               #   in Loop: Header=BB137_11 Depth=1
	movq	(%rdx,%rbp), %rdi
	movl	%r14d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbp)
                                        # kill: def $al killed $al def $rax
	movq	16(%r12), %rcx
	jmp	.LBB137_14
.LBB137_15:
	movb	%al, (%r12)
	movb	6(%r12), %cl
	leaq	6(%r12), %rdx
	testb	%al, %al
	js	.LBB137_16
# %bb.18:
	andb	$127, %cl
	movb	%cl, (%rdx)
	testb	%al, %al
	jne	.LBB137_17
	jmp	.LBB137_19
.LBB137_9:
	movb	$0, (%r12)
	leaq	6(%r12), %rdx
	movb	6(%r12), %cl
	andb	$127, %cl
	movb	%cl, 6(%r12)
.LBB137_19:
	orb	$2, %cl
	jmp	.LBB137_20
.LBB137_16:
	orb	$-128, %cl
	movb	%cl, (%rdx)
.LBB137_17:
	andb	$-3, %cl
.LBB137_20:
	movb	%cl, (%rdx)
	movl	$4, %eax
	popq	%rbx
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end137:
	.size	LDA_zpgx, .Lfunc_end137-LDA_zpgx
	.cfi_endproc
                                        # -- End function
	.globl	LDA_abss                # -- Begin function LDA_abss
	.p2align	4, 0x90
	.type	LDA_abss,@function
LDA_abss:                               # @LDA_abss
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r13
	.cfi_def_cfa_offset 40
	pushq	%r12
	.cfi_def_cfa_offset 48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	pushq	%rax
	.cfi_def_cfa_offset 64
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%rdi, %r12
	movzwl	4(%rdi), %r13d
	movq	16(%rdi), %rcx
	testq	%rcx, %rcx
	je	.LBB138_25
# %bb.1:
	movzwl	%r13w, %r14d
	movl	$24, %ebx
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	jmp	.LBB138_2
	.p2align	4, 0x90
.LBB138_5:                              #   in Loop: Header=BB138_2 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rcx, %rbp
	jae	.LBB138_6
.LBB138_2:                              # =>This Inner Loop Header: Depth=1
	movq	8(%r12), %rdx
	movzwl	-8(%rdx,%rbx), %esi
	cmpw	%si, %r13w
	jb	.LBB138_5
# %bb.3:                                #   in Loop: Header=BB138_2 Depth=1
	movzwl	-6(%rdx,%rbx), %edi
	addl	%esi, %edi
	cmpl	%r14d, %edi
	jbe	.LBB138_5
# %bb.4:                                #   in Loop: Header=BB138_2 Depth=1
	movq	(%rdx,%rbx), %rdi
	movl	%r13d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbx)
                                        # kill: def $al killed $al def $rax
	movq	16(%r12), %rcx
	jmp	.LBB138_5
.LBB138_6:
	movl	4(%r12), %r13d
	testq	%rcx, %rcx
	je	.LBB138_25
# %bb.7:
	movzbl	%al, %r14d
	addl	$1, %r13d
	movzwl	%r13w, %r15d
	movl	$24, %ebx
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	jmp	.LBB138_8
	.p2align	4, 0x90
.LBB138_11:                             #   in Loop: Header=BB138_8 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rcx, %rbp
	jae	.LBB138_12
.LBB138_8:                              # =>This Inner Loop Header: Depth=1
	movq	8(%r12), %rdx
	movzwl	-8(%rdx,%rbx), %esi
	cmpw	%si, %r13w
	jb	.LBB138_11
# %bb.9:                                #   in Loop: Header=BB138_8 Depth=1
	movzwl	-6(%rdx,%rbx), %edi
	addl	%esi, %edi
	cmpl	%r15d, %edi
	jbe	.LBB138_11
# %bb.10:                               #   in Loop: Header=BB138_8 Depth=1
	movq	(%rdx,%rbx), %rdi
	movl	%r13d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbx)
                                        # kill: def $al killed $al def $rax
	movq	16(%r12), %rcx
	jmp	.LBB138_11
.LBB138_25:
	addl	$2, %r13d
	movw	%r13w, 4(%r12)
.LBB138_13:
	movb	$0, (%r12)
	leaq	6(%r12), %rdx
	movb	6(%r12), %cl
	andb	$127, %cl
	movb	%cl, 6(%r12)
.LBB138_23:
	orb	$2, %cl
.LBB138_24:
	movb	%cl, (%rdx)
	movl	$4, %eax
	addq	$8, %rsp
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%r12
	.cfi_def_cfa_offset 40
	popq	%r13
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.LBB138_12:
	.cfi_def_cfa_offset 64
	addw	$2, 4(%r12)
	testq	%rcx, %rcx
	je	.LBB138_13
# %bb.14:
	movzbl	%al, %eax
	shll	$8, %eax
	movzwl	%r14w, %r15d
	orl	%eax, %r15d
	movzwl	%r15w, %r14d
	movl	$24, %ebx
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	jmp	.LBB138_15
	.p2align	4, 0x90
.LBB138_18:                             #   in Loop: Header=BB138_15 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rcx, %rbp
	jae	.LBB138_19
.LBB138_15:                             # =>This Inner Loop Header: Depth=1
	movq	8(%r12), %rdx
	movzwl	-8(%rdx,%rbx), %esi
	cmpw	%si, %r15w
	jb	.LBB138_18
# %bb.16:                               #   in Loop: Header=BB138_15 Depth=1
	movzwl	-6(%rdx,%rbx), %edi
	addl	%esi, %edi
	cmpl	%r14d, %edi
	jbe	.LBB138_18
# %bb.17:                               #   in Loop: Header=BB138_15 Depth=1
	movq	(%rdx,%rbx), %rdi
	movl	%r15d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbx)
                                        # kill: def $al killed $al def $rax
	movq	16(%r12), %rcx
	jmp	.LBB138_18
.LBB138_19:
	movb	%al, (%r12)
	movb	6(%r12), %cl
	leaq	6(%r12), %rdx
	testb	%al, %al
	js	.LBB138_20
# %bb.22:
	andb	$127, %cl
	movb	%cl, (%rdx)
	testb	%al, %al
	jne	.LBB138_21
	jmp	.LBB138_23
.LBB138_20:
	orb	$-128, %cl
	movb	%cl, (%rdx)
.LBB138_21:
	andb	$-3, %cl
	jmp	.LBB138_24
.Lfunc_end138:
	.size	LDA_abss, .Lfunc_end138-LDA_abss
	.cfi_endproc
                                        # -- End function
	.globl	LDA_absx                # -- Begin function LDA_absx
	.p2align	4, 0x90
	.type	LDA_absx,@function
LDA_absx:                               # @LDA_absx
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r13
	.cfi_def_cfa_offset 40
	pushq	%r12
	.cfi_def_cfa_offset 48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	pushq	%rax
	.cfi_def_cfa_offset 64
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%rdi, %r13
	movzwl	4(%rdi), %r12d
	movq	16(%rdi), %rcx
	testq	%rcx, %rcx
	je	.LBB139_13
# %bb.1:
	movzwl	%r12w, %r14d
	movl	$24, %ebp
	xorl	%eax, %eax
	xorl	%ebx, %ebx
	jmp	.LBB139_3
	.p2align	4, 0x90
.LBB139_2:                              #   in Loop: Header=BB139_3 Depth=1
	addq	$1, %rbx
	addq	$32, %rbp
	cmpq	%rcx, %rbx
	jae	.LBB139_6
.LBB139_3:                              # =>This Inner Loop Header: Depth=1
	movq	8(%r13), %rdx
	movzwl	-8(%rdx,%rbp), %esi
	cmpw	%si, %r12w
	jb	.LBB139_2
# %bb.4:                                #   in Loop: Header=BB139_3 Depth=1
	movzwl	-6(%rdx,%rbp), %edi
	addl	%esi, %edi
	cmpl	%r14d, %edi
	jbe	.LBB139_2
# %bb.5:                                #   in Loop: Header=BB139_3 Depth=1
	movq	(%rdx,%rbp), %rdi
	movl	%r12d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbp)
                                        # kill: def $al killed $al def $rax
	movq	16(%r13), %rcx
	jmp	.LBB139_2
.LBB139_6:
	movzbl	%al, %r14d
	movl	4(%r13), %r12d
	testq	%rcx, %rcx
	je	.LBB139_14
# %bb.7:
	addl	$1, %r12d
	movzwl	%r12w, %r15d
	movl	$24, %ebp
	xorl	%eax, %eax
	xorl	%ebx, %ebx
	jmp	.LBB139_9
	.p2align	4, 0x90
.LBB139_8:                              #   in Loop: Header=BB139_9 Depth=1
	addq	$1, %rbx
	addq	$32, %rbp
	cmpq	%rcx, %rbx
	jae	.LBB139_12
.LBB139_9:                              # =>This Inner Loop Header: Depth=1
	movq	8(%r13), %rdx
	movzwl	-8(%rdx,%rbp), %esi
	cmpw	%si, %r12w
	jb	.LBB139_8
# %bb.10:                               #   in Loop: Header=BB139_9 Depth=1
	movzwl	-6(%rdx,%rbp), %edi
	addl	%esi, %edi
	cmpl	%r15d, %edi
	jbe	.LBB139_8
# %bb.11:                               #   in Loop: Header=BB139_9 Depth=1
	movq	(%rdx,%rbp), %rdi
	movl	%r12d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbp)
                                        # kill: def $al killed $al def $rax
	movq	16(%r13), %rcx
	jmp	.LBB139_8
.LBB139_12:
	movzwl	4(%r13), %r12d
	jmp	.LBB139_16
.LBB139_13:
	xorl	%ecx, %ecx
	xorl	%r14d, %r14d
	jmp	.LBB139_15
.LBB139_14:
	xorl	%ecx, %ecx
.LBB139_15:
	xorl	%eax, %eax
.LBB139_16:
	movzbl	1(%r13), %edx
	addl	$2, %r12d
	movw	%r12w, 4(%r13)
	testq	%rcx, %rcx
	je	.LBB139_24
# %bb.17:
	movzbl	%al, %eax
	shll	$8, %eax
	movzwl	%r14w, %r15d
	orl	%eax, %r15d
	addl	%edx, %r15d
	movzwl	%r15w, %r14d
	movl	$24, %ebx
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	jmp	.LBB139_19
	.p2align	4, 0x90
.LBB139_18:                             #   in Loop: Header=BB139_19 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rcx, %rbp
	jae	.LBB139_22
.LBB139_19:                             # =>This Inner Loop Header: Depth=1
	movq	8(%r13), %rdx
	movzwl	-8(%rdx,%rbx), %esi
	cmpw	%si, %r15w
	jb	.LBB139_18
# %bb.20:                               #   in Loop: Header=BB139_19 Depth=1
	movzwl	-6(%rdx,%rbx), %edi
	addl	%esi, %edi
	cmpl	%r14d, %edi
	jbe	.LBB139_18
# %bb.21:                               #   in Loop: Header=BB139_19 Depth=1
	movq	(%rdx,%rbx), %rdi
	movl	%r15d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbx)
                                        # kill: def $al killed $al def $rax
	movq	16(%r13), %rcx
	jmp	.LBB139_18
.LBB139_22:
	movb	%al, (%r13)
	movb	6(%r13), %cl
	leaq	6(%r13), %rdx
	testb	%al, %al
	js	.LBB139_26
# %bb.23:
	andb	$127, %cl
	movb	%cl, (%rdx)
	testb	%al, %al
	jne	.LBB139_27
	jmp	.LBB139_25
.LBB139_24:
	movb	$0, (%r13)
	leaq	6(%r13), %rdx
	movb	6(%r13), %cl
	andb	$127, %cl
	movb	%cl, 6(%r13)
.LBB139_25:
	orb	$2, %cl
	jmp	.LBB139_28
.LBB139_26:
	orb	$-128, %cl
	movb	%cl, (%rdx)
.LBB139_27:
	andb	$-3, %cl
.LBB139_28:
	movb	%cl, (%rdx)
	movl	$4, %eax
	addq	$8, %rsp
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%r12
	.cfi_def_cfa_offset 40
	popq	%r13
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end139:
	.size	LDA_absx, .Lfunc_end139-LDA_absx
	.cfi_endproc
                                        # -- End function
	.globl	LDA_absy                # -- Begin function LDA_absy
	.p2align	4, 0x90
	.type	LDA_absy,@function
LDA_absy:                               # @LDA_absy
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r13
	.cfi_def_cfa_offset 40
	pushq	%r12
	.cfi_def_cfa_offset 48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	pushq	%rax
	.cfi_def_cfa_offset 64
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%rdi, %r13
	movzwl	4(%rdi), %r12d
	movq	16(%rdi), %rcx
	testq	%rcx, %rcx
	je	.LBB140_13
# %bb.1:
	movzwl	%r12w, %r14d
	movl	$24, %ebp
	xorl	%eax, %eax
	xorl	%ebx, %ebx
	jmp	.LBB140_3
	.p2align	4, 0x90
.LBB140_2:                              #   in Loop: Header=BB140_3 Depth=1
	addq	$1, %rbx
	addq	$32, %rbp
	cmpq	%rcx, %rbx
	jae	.LBB140_6
.LBB140_3:                              # =>This Inner Loop Header: Depth=1
	movq	8(%r13), %rdx
	movzwl	-8(%rdx,%rbp), %esi
	cmpw	%si, %r12w
	jb	.LBB140_2
# %bb.4:                                #   in Loop: Header=BB140_3 Depth=1
	movzwl	-6(%rdx,%rbp), %edi
	addl	%esi, %edi
	cmpl	%r14d, %edi
	jbe	.LBB140_2
# %bb.5:                                #   in Loop: Header=BB140_3 Depth=1
	movq	(%rdx,%rbp), %rdi
	movl	%r12d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbp)
                                        # kill: def $al killed $al def $rax
	movq	16(%r13), %rcx
	jmp	.LBB140_2
.LBB140_6:
	movzbl	%al, %r14d
	movl	4(%r13), %r12d
	testq	%rcx, %rcx
	je	.LBB140_14
# %bb.7:
	addl	$1, %r12d
	movzwl	%r12w, %r15d
	movl	$24, %ebp
	xorl	%eax, %eax
	xorl	%ebx, %ebx
	jmp	.LBB140_9
	.p2align	4, 0x90
.LBB140_8:                              #   in Loop: Header=BB140_9 Depth=1
	addq	$1, %rbx
	addq	$32, %rbp
	cmpq	%rcx, %rbx
	jae	.LBB140_12
.LBB140_9:                              # =>This Inner Loop Header: Depth=1
	movq	8(%r13), %rdx
	movzwl	-8(%rdx,%rbp), %esi
	cmpw	%si, %r12w
	jb	.LBB140_8
# %bb.10:                               #   in Loop: Header=BB140_9 Depth=1
	movzwl	-6(%rdx,%rbp), %edi
	addl	%esi, %edi
	cmpl	%r15d, %edi
	jbe	.LBB140_8
# %bb.11:                               #   in Loop: Header=BB140_9 Depth=1
	movq	(%rdx,%rbp), %rdi
	movl	%r12d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbp)
                                        # kill: def $al killed $al def $rax
	movq	16(%r13), %rcx
	jmp	.LBB140_8
.LBB140_12:
	movzwl	4(%r13), %r12d
	jmp	.LBB140_16
.LBB140_13:
	xorl	%ecx, %ecx
	xorl	%r14d, %r14d
	jmp	.LBB140_15
.LBB140_14:
	xorl	%ecx, %ecx
.LBB140_15:
	xorl	%eax, %eax
.LBB140_16:
	movzbl	2(%r13), %edx
	addl	$2, %r12d
	movw	%r12w, 4(%r13)
	testq	%rcx, %rcx
	je	.LBB140_24
# %bb.17:
	movzbl	%al, %eax
	shll	$8, %eax
	movzwl	%r14w, %r15d
	orl	%eax, %r15d
	addl	%edx, %r15d
	movzwl	%r15w, %r14d
	movl	$24, %ebx
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	jmp	.LBB140_19
	.p2align	4, 0x90
.LBB140_18:                             #   in Loop: Header=BB140_19 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rcx, %rbp
	jae	.LBB140_22
.LBB140_19:                             # =>This Inner Loop Header: Depth=1
	movq	8(%r13), %rdx
	movzwl	-8(%rdx,%rbx), %esi
	cmpw	%si, %r15w
	jb	.LBB140_18
# %bb.20:                               #   in Loop: Header=BB140_19 Depth=1
	movzwl	-6(%rdx,%rbx), %edi
	addl	%esi, %edi
	cmpl	%r14d, %edi
	jbe	.LBB140_18
# %bb.21:                               #   in Loop: Header=BB140_19 Depth=1
	movq	(%rdx,%rbx), %rdi
	movl	%r15d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbx)
                                        # kill: def $al killed $al def $rax
	movq	16(%r13), %rcx
	jmp	.LBB140_18
.LBB140_22:
	movb	%al, (%r13)
	movb	6(%r13), %cl
	leaq	6(%r13), %rdx
	testb	%al, %al
	js	.LBB140_26
# %bb.23:
	andb	$127, %cl
	movb	%cl, (%rdx)
	testb	%al, %al
	jne	.LBB140_27
	jmp	.LBB140_25
.LBB140_24:
	movb	$0, (%r13)
	leaq	6(%r13), %rdx
	movb	6(%r13), %cl
	andb	$127, %cl
	movb	%cl, 6(%r13)
.LBB140_25:
	orb	$2, %cl
	jmp	.LBB140_28
.LBB140_26:
	orb	$-128, %cl
	movb	%cl, (%rdx)
.LBB140_27:
	andb	$-3, %cl
.LBB140_28:
	movb	%cl, (%rdx)
	movl	$4, %eax
	addq	$8, %rsp
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%r12
	.cfi_def_cfa_offset 40
	popq	%r13
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end140:
	.size	LDA_absy, .Lfunc_end140-LDA_absy
	.cfi_endproc
                                        # -- End function
	.globl	LDA_xind                # -- Begin function LDA_xind
	.p2align	4, 0x90
	.type	LDA_xind,@function
LDA_xind:                               # @LDA_xind
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r12
	.cfi_def_cfa_offset 40
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset %rbx, -48
	.cfi_offset %r12, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%rdi, %r12
	callq	xind
	movq	16(%r12), %rcx
	testq	%rcx, %rcx
	je	.LBB141_1
# %bb.2:
	movl	%eax, %r15d
	movzwl	%ax, %r14d
	movl	$24, %ebp
	xorl	%eax, %eax
	xorl	%ebx, %ebx
	jmp	.LBB141_3
	.p2align	4, 0x90
.LBB141_6:                              #   in Loop: Header=BB141_3 Depth=1
	addq	$1, %rbx
	addq	$32, %rbp
	cmpq	%rcx, %rbx
	jae	.LBB141_7
.LBB141_3:                              # =>This Inner Loop Header: Depth=1
	movq	8(%r12), %rdx
	movzwl	-8(%rdx,%rbp), %esi
	cmpw	%si, %r15w
	jb	.LBB141_6
# %bb.4:                                #   in Loop: Header=BB141_3 Depth=1
	movzwl	-6(%rdx,%rbp), %edi
	addl	%esi, %edi
	cmpl	%r14d, %edi
	jbe	.LBB141_6
# %bb.5:                                #   in Loop: Header=BB141_3 Depth=1
	movq	(%rdx,%rbp), %rdi
	movl	%r14d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbp)
                                        # kill: def $al killed $al def $rax
	movq	16(%r12), %rcx
	jmp	.LBB141_6
.LBB141_7:
	movb	%al, (%r12)
	movb	6(%r12), %cl
	leaq	6(%r12), %rdx
	testb	%al, %al
	js	.LBB141_8
# %bb.10:
	andb	$127, %cl
	movb	%cl, (%rdx)
	testb	%al, %al
	jne	.LBB141_9
	jmp	.LBB141_11
.LBB141_1:
	movb	$0, (%r12)
	leaq	6(%r12), %rdx
	movb	6(%r12), %cl
	andb	$127, %cl
	movb	%cl, 6(%r12)
.LBB141_11:
	orb	$2, %cl
	jmp	.LBB141_12
.LBB141_8:
	orb	$-128, %cl
	movb	%cl, (%rdx)
.LBB141_9:
	andb	$-3, %cl
.LBB141_12:
	movb	%cl, (%rdx)
	movl	$6, %eax
	popq	%rbx
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end141:
	.size	LDA_xind, .Lfunc_end141-LDA_xind
	.cfi_endproc
                                        # -- End function
	.globl	LDA_indy                # -- Begin function LDA_indy
	.p2align	4, 0x90
	.type	LDA_indy,@function
LDA_indy:                               # @LDA_indy
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r12
	.cfi_def_cfa_offset 40
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset %rbx, -48
	.cfi_offset %r12, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%rdi, %r12
	callq	indy
	movq	16(%r12), %rcx
	testq	%rcx, %rcx
	je	.LBB142_1
# %bb.2:
	movl	%eax, %r15d
	movzwl	%ax, %r14d
	movl	$24, %ebp
	xorl	%eax, %eax
	xorl	%ebx, %ebx
	jmp	.LBB142_3
	.p2align	4, 0x90
.LBB142_6:                              #   in Loop: Header=BB142_3 Depth=1
	addq	$1, %rbx
	addq	$32, %rbp
	cmpq	%rcx, %rbx
	jae	.LBB142_7
.LBB142_3:                              # =>This Inner Loop Header: Depth=1
	movq	8(%r12), %rdx
	movzwl	-8(%rdx,%rbp), %esi
	cmpw	%si, %r15w
	jb	.LBB142_6
# %bb.4:                                #   in Loop: Header=BB142_3 Depth=1
	movzwl	-6(%rdx,%rbp), %edi
	addl	%esi, %edi
	cmpl	%r14d, %edi
	jbe	.LBB142_6
# %bb.5:                                #   in Loop: Header=BB142_3 Depth=1
	movq	(%rdx,%rbp), %rdi
	movl	%r14d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbp)
                                        # kill: def $al killed $al def $rax
	movq	16(%r12), %rcx
	jmp	.LBB142_6
.LBB142_7:
	movb	%al, (%r12)
	movb	6(%r12), %cl
	leaq	6(%r12), %rdx
	testb	%al, %al
	js	.LBB142_8
# %bb.10:
	andb	$127, %cl
	movb	%cl, (%rdx)
	testb	%al, %al
	jne	.LBB142_9
	jmp	.LBB142_11
.LBB142_1:
	movb	$0, (%r12)
	leaq	6(%r12), %rdx
	movb	6(%r12), %cl
	andb	$127, %cl
	movb	%cl, 6(%r12)
.LBB142_11:
	orb	$2, %cl
	jmp	.LBB142_12
.LBB142_8:
	orb	$-128, %cl
	movb	%cl, (%rdx)
.LBB142_9:
	andb	$-3, %cl
.LBB142_12:
	movb	%cl, (%rdx)
	movl	$5, %eax
	popq	%rbx
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end142:
	.size	LDA_indy, .Lfunc_end142-LDA_indy
	.cfi_endproc
                                        # -- End function
	.globl	LDX_imm                 # -- Begin function LDX_imm
	.p2align	4, 0x90
	.type	LDX_imm,@function
LDX_imm:                                # @LDX_imm
	.cfi_startproc
# %bb.0:
	pushq	%r15
	.cfi_def_cfa_offset 16
	pushq	%r14
	.cfi_def_cfa_offset 24
	pushq	%r12
	.cfi_def_cfa_offset 32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	pushq	%rax
	.cfi_def_cfa_offset 48
	.cfi_offset %rbx, -40
	.cfi_offset %r12, -32
	.cfi_offset %r14, -24
	.cfi_offset %r15, -16
	movq	%rdi, %r14
	movzwl	4(%rdi), %r15d
	leal	1(%r15), %eax
	movw	%ax, 4(%rdi)
	movq	16(%rdi), %rcx
	testq	%rcx, %rcx
	je	.LBB143_1
# %bb.2:
	movl	$24, %ebx
	xorl	%eax, %eax
	xorl	%r12d, %r12d
	jmp	.LBB143_3
	.p2align	4, 0x90
.LBB143_6:                              #   in Loop: Header=BB143_3 Depth=1
	addq	$1, %r12
	addq	$32, %rbx
	cmpq	%rcx, %r12
	jae	.LBB143_7
.LBB143_3:                              # =>This Inner Loop Header: Depth=1
	movq	8(%r14), %rdx
	movzwl	-8(%rdx,%rbx), %esi
	cmpw	%si, %r15w
	jb	.LBB143_6
# %bb.4:                                #   in Loop: Header=BB143_3 Depth=1
	movzwl	-6(%rdx,%rbx), %edi
	addl	%esi, %edi
	cmpl	%r15d, %edi
	jbe	.LBB143_6
# %bb.5:                                #   in Loop: Header=BB143_3 Depth=1
	movq	(%rdx,%rbx), %rdi
	movl	%r15d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbx)
                                        # kill: def $al killed $al def $rax
	movq	16(%r14), %rcx
	jmp	.LBB143_6
.LBB143_7:
	movb	%al, 1(%r14)
	movb	6(%r14), %cl
	leaq	6(%r14), %rdx
	testb	%al, %al
	js	.LBB143_8
# %bb.10:
	andb	$127, %cl
	movb	%cl, (%rdx)
	testb	%al, %al
	jne	.LBB143_9
	jmp	.LBB143_11
.LBB143_1:
	movb	$0, 1(%r14)
	leaq	6(%r14), %rdx
	movb	6(%r14), %cl
	andb	$127, %cl
	movb	%cl, 6(%r14)
.LBB143_11:
	orb	$2, %cl
	jmp	.LBB143_12
.LBB143_8:
	orb	$-128, %cl
	movb	%cl, (%rdx)
.LBB143_9:
	andb	$-3, %cl
.LBB143_12:
	movb	%cl, (%rdx)
	movl	$2, %eax
	addq	$8, %rsp
	.cfi_def_cfa_offset 40
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%r12
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end143:
	.size	LDX_imm, .Lfunc_end143-LDX_imm
	.cfi_endproc
                                        # -- End function
	.globl	LDX_zpg                 # -- Begin function LDX_zpg
	.p2align	4, 0x90
	.type	LDX_zpg,@function
LDX_zpg:                                # @LDX_zpg
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	pushq	%rax
	.cfi_def_cfa_offset 48
	.cfi_offset %rbx, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%rdi, %r14
	movzwl	4(%rdi), %r15d
	movq	16(%rdi), %rcx
	testq	%rcx, %rcx
	je	.LBB144_1
# %bb.3:
	movl	$24, %ebx
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	jmp	.LBB144_4
	.p2align	4, 0x90
.LBB144_7:                              #   in Loop: Header=BB144_4 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rcx, %rbp
	jae	.LBB144_8
.LBB144_4:                              # =>This Inner Loop Header: Depth=1
	movq	8(%r14), %rdx
	movzwl	-8(%rdx,%rbx), %esi
	cmpw	%si, %r15w
	jb	.LBB144_7
# %bb.5:                                #   in Loop: Header=BB144_4 Depth=1
	movzwl	-6(%rdx,%rbx), %edi
	addl	%esi, %edi
	cmpl	%r15d, %edi
	jbe	.LBB144_7
# %bb.6:                                #   in Loop: Header=BB144_4 Depth=1
	movq	(%rdx,%rbx), %rdi
	movl	%r15d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbx)
                                        # kill: def $al killed $al def $rax
	movq	16(%r14), %rcx
	jmp	.LBB144_7
.LBB144_8:
	addw	$1, 4(%r14)
	testq	%rcx, %rcx
	je	.LBB144_2
# %bb.9:
	movzbl	%al, %r15d
	movl	$24, %ebx
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	jmp	.LBB144_10
	.p2align	4, 0x90
.LBB144_13:                             #   in Loop: Header=BB144_10 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rcx, %rbp
	jae	.LBB144_14
.LBB144_10:                             # =>This Inner Loop Header: Depth=1
	movq	8(%r14), %rdx
	movzwl	-8(%rdx,%rbx), %esi
	cmpw	%r15w, %si
	ja	.LBB144_13
# %bb.11:                               #   in Loop: Header=BB144_10 Depth=1
	movzwl	-6(%rdx,%rbx), %edi
	addl	%esi, %edi
	cmpl	%r15d, %edi
	jbe	.LBB144_13
# %bb.12:                               #   in Loop: Header=BB144_10 Depth=1
	movq	(%rdx,%rbx), %rdi
	movzwl	%r15w, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbx)
                                        # kill: def $al killed $al def $rax
	movq	16(%r14), %rcx
	jmp	.LBB144_13
.LBB144_14:
	movb	%al, 1(%r14)
	movb	6(%r14), %cl
	leaq	6(%r14), %rdx
	testb	%al, %al
	js	.LBB144_15
# %bb.17:
	andb	$127, %cl
	movb	%cl, (%rdx)
	testb	%al, %al
	jne	.LBB144_16
	jmp	.LBB144_18
.LBB144_1:
	addl	$1, %r15d
	movw	%r15w, 4(%r14)
.LBB144_2:
	movb	$0, 1(%r14)
	leaq	6(%r14), %rdx
	movb	6(%r14), %cl
	andb	$127, %cl
	movb	%cl, 6(%r14)
.LBB144_18:
	orb	$2, %cl
	jmp	.LBB144_19
.LBB144_15:
	orb	$-128, %cl
	movb	%cl, (%rdx)
.LBB144_16:
	andb	$-3, %cl
.LBB144_19:
	movb	%cl, (%rdx)
	movl	$3, %eax
	addq	$8, %rsp
	.cfi_def_cfa_offset 40
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end144:
	.size	LDX_zpg, .Lfunc_end144-LDX_zpg
	.cfi_endproc
                                        # -- End function
	.globl	LDX_zpgy                # -- Begin function LDX_zpgy
	.p2align	4, 0x90
	.type	LDX_zpgy,@function
LDX_zpgy:                               # @LDX_zpgy
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r12
	.cfi_def_cfa_offset 40
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset %rbx, -48
	.cfi_offset %r12, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%rdi, %r12
	movzwl	4(%rdi), %r15d
	movq	16(%rdi), %rcx
	testq	%rcx, %rcx
	je	.LBB145_1
# %bb.2:
	movzwl	%r15w, %r14d
	movl	$24, %ebp
	xorl	%eax, %eax
	xorl	%ebx, %ebx
	jmp	.LBB145_3
	.p2align	4, 0x90
.LBB145_6:                              #   in Loop: Header=BB145_3 Depth=1
	addq	$1, %rbx
	addq	$32, %rbp
	cmpq	%rcx, %rbx
	jae	.LBB145_7
.LBB145_3:                              # =>This Inner Loop Header: Depth=1
	movq	8(%r12), %rdx
	movzwl	-8(%rdx,%rbp), %esi
	cmpw	%si, %r15w
	jb	.LBB145_6
# %bb.4:                                #   in Loop: Header=BB145_3 Depth=1
	movzwl	-6(%rdx,%rbp), %edi
	addl	%esi, %edi
	cmpl	%r14d, %edi
	jbe	.LBB145_6
# %bb.5:                                #   in Loop: Header=BB145_3 Depth=1
	movq	(%rdx,%rbp), %rdi
	movl	%r15d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbp)
                                        # kill: def $al killed $al def $rax
	movq	16(%r12), %rcx
	jmp	.LBB145_6
.LBB145_7:
	movzwl	4(%r12), %r15d
	jmp	.LBB145_8
.LBB145_1:
	xorl	%ecx, %ecx
	xorl	%eax, %eax
.LBB145_8:
	addb	2(%r12), %al
	addl	$1, %r15d
	movw	%r15w, 4(%r12)
	testq	%rcx, %rcx
	je	.LBB145_9
# %bb.10:
	movzbl	%al, %r15d
	movzwl	%r15w, %r14d
	movl	$24, %ebp
	xorl	%eax, %eax
	xorl	%ebx, %ebx
	jmp	.LBB145_11
	.p2align	4, 0x90
.LBB145_14:                             #   in Loop: Header=BB145_11 Depth=1
	addq	$1, %rbx
	addq	$32, %rbp
	cmpq	%rcx, %rbx
	jae	.LBB145_15
.LBB145_11:                             # =>This Inner Loop Header: Depth=1
	movq	8(%r12), %rdx
	movzwl	-8(%rdx,%rbp), %esi
	cmpw	%r15w, %si
	ja	.LBB145_14
# %bb.12:                               #   in Loop: Header=BB145_11 Depth=1
	movzwl	-6(%rdx,%rbp), %edi
	addl	%esi, %edi
	cmpl	%r14d, %edi
	jbe	.LBB145_14
# %bb.13:                               #   in Loop: Header=BB145_11 Depth=1
	movq	(%rdx,%rbp), %rdi
	movl	%r14d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbp)
                                        # kill: def $al killed $al def $rax
	movq	16(%r12), %rcx
	jmp	.LBB145_14
.LBB145_15:
	movb	%al, 1(%r12)
	movb	6(%r12), %cl
	leaq	6(%r12), %rdx
	testb	%al, %al
	js	.LBB145_16
# %bb.18:
	andb	$127, %cl
	movb	%cl, (%rdx)
	testb	%al, %al
	jne	.LBB145_17
	jmp	.LBB145_19
.LBB145_9:
	movb	$0, 1(%r12)
	leaq	6(%r12), %rdx
	movb	6(%r12), %cl
	andb	$127, %cl
	movb	%cl, 6(%r12)
.LBB145_19:
	orb	$2, %cl
	jmp	.LBB145_20
.LBB145_16:
	orb	$-128, %cl
	movb	%cl, (%rdx)
.LBB145_17:
	andb	$-3, %cl
.LBB145_20:
	movb	%cl, (%rdx)
	movl	$4, %eax
	popq	%rbx
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end145:
	.size	LDX_zpgy, .Lfunc_end145-LDX_zpgy
	.cfi_endproc
                                        # -- End function
	.globl	LDX_abss                # -- Begin function LDX_abss
	.p2align	4, 0x90
	.type	LDX_abss,@function
LDX_abss:                               # @LDX_abss
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r13
	.cfi_def_cfa_offset 40
	pushq	%r12
	.cfi_def_cfa_offset 48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	pushq	%rax
	.cfi_def_cfa_offset 64
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%rdi, %r12
	movzwl	4(%rdi), %r13d
	movq	16(%rdi), %rcx
	testq	%rcx, %rcx
	je	.LBB146_25
# %bb.1:
	movzwl	%r13w, %r14d
	movl	$24, %ebx
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	jmp	.LBB146_2
	.p2align	4, 0x90
.LBB146_5:                              #   in Loop: Header=BB146_2 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rcx, %rbp
	jae	.LBB146_6
.LBB146_2:                              # =>This Inner Loop Header: Depth=1
	movq	8(%r12), %rdx
	movzwl	-8(%rdx,%rbx), %esi
	cmpw	%si, %r13w
	jb	.LBB146_5
# %bb.3:                                #   in Loop: Header=BB146_2 Depth=1
	movzwl	-6(%rdx,%rbx), %edi
	addl	%esi, %edi
	cmpl	%r14d, %edi
	jbe	.LBB146_5
# %bb.4:                                #   in Loop: Header=BB146_2 Depth=1
	movq	(%rdx,%rbx), %rdi
	movl	%r13d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbx)
                                        # kill: def $al killed $al def $rax
	movq	16(%r12), %rcx
	jmp	.LBB146_5
.LBB146_6:
	movl	4(%r12), %r13d
	testq	%rcx, %rcx
	je	.LBB146_25
# %bb.7:
	movzbl	%al, %r14d
	addl	$1, %r13d
	movzwl	%r13w, %r15d
	movl	$24, %ebx
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	jmp	.LBB146_8
	.p2align	4, 0x90
.LBB146_11:                             #   in Loop: Header=BB146_8 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rcx, %rbp
	jae	.LBB146_12
.LBB146_8:                              # =>This Inner Loop Header: Depth=1
	movq	8(%r12), %rdx
	movzwl	-8(%rdx,%rbx), %esi
	cmpw	%si, %r13w
	jb	.LBB146_11
# %bb.9:                                #   in Loop: Header=BB146_8 Depth=1
	movzwl	-6(%rdx,%rbx), %edi
	addl	%esi, %edi
	cmpl	%r15d, %edi
	jbe	.LBB146_11
# %bb.10:                               #   in Loop: Header=BB146_8 Depth=1
	movq	(%rdx,%rbx), %rdi
	movl	%r13d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbx)
                                        # kill: def $al killed $al def $rax
	movq	16(%r12), %rcx
	jmp	.LBB146_11
.LBB146_25:
	addl	$2, %r13d
	movw	%r13w, 4(%r12)
.LBB146_13:
	movb	$0, 1(%r12)
	leaq	6(%r12), %rdx
	movb	6(%r12), %cl
	andb	$127, %cl
	movb	%cl, 6(%r12)
.LBB146_23:
	orb	$2, %cl
.LBB146_24:
	movb	%cl, (%rdx)
	movl	$4, %eax
	addq	$8, %rsp
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%r12
	.cfi_def_cfa_offset 40
	popq	%r13
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.LBB146_12:
	.cfi_def_cfa_offset 64
	addw	$2, 4(%r12)
	testq	%rcx, %rcx
	je	.LBB146_13
# %bb.14:
	movzbl	%al, %eax
	shll	$8, %eax
	movzwl	%r14w, %r15d
	orl	%eax, %r15d
	movzwl	%r15w, %r14d
	movl	$24, %ebx
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	jmp	.LBB146_15
	.p2align	4, 0x90
.LBB146_18:                             #   in Loop: Header=BB146_15 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rcx, %rbp
	jae	.LBB146_19
.LBB146_15:                             # =>This Inner Loop Header: Depth=1
	movq	8(%r12), %rdx
	movzwl	-8(%rdx,%rbx), %esi
	cmpw	%si, %r15w
	jb	.LBB146_18
# %bb.16:                               #   in Loop: Header=BB146_15 Depth=1
	movzwl	-6(%rdx,%rbx), %edi
	addl	%esi, %edi
	cmpl	%r14d, %edi
	jbe	.LBB146_18
# %bb.17:                               #   in Loop: Header=BB146_15 Depth=1
	movq	(%rdx,%rbx), %rdi
	movl	%r15d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbx)
                                        # kill: def $al killed $al def $rax
	movq	16(%r12), %rcx
	jmp	.LBB146_18
.LBB146_19:
	movb	%al, 1(%r12)
	movb	6(%r12), %cl
	leaq	6(%r12), %rdx
	testb	%al, %al
	js	.LBB146_20
# %bb.22:
	andb	$127, %cl
	movb	%cl, (%rdx)
	testb	%al, %al
	jne	.LBB146_21
	jmp	.LBB146_23
.LBB146_20:
	orb	$-128, %cl
	movb	%cl, (%rdx)
.LBB146_21:
	andb	$-3, %cl
	jmp	.LBB146_24
.Lfunc_end146:
	.size	LDX_abss, .Lfunc_end146-LDX_abss
	.cfi_endproc
                                        # -- End function
	.globl	LDX_absy                # -- Begin function LDX_absy
	.p2align	4, 0x90
	.type	LDX_absy,@function
LDX_absy:                               # @LDX_absy
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r13
	.cfi_def_cfa_offset 40
	pushq	%r12
	.cfi_def_cfa_offset 48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	pushq	%rax
	.cfi_def_cfa_offset 64
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%rdi, %r13
	movzwl	4(%rdi), %r12d
	movq	16(%rdi), %rcx
	testq	%rcx, %rcx
	je	.LBB147_13
# %bb.1:
	movzwl	%r12w, %r14d
	movl	$24, %ebp
	xorl	%eax, %eax
	xorl	%ebx, %ebx
	jmp	.LBB147_3
	.p2align	4, 0x90
.LBB147_2:                              #   in Loop: Header=BB147_3 Depth=1
	addq	$1, %rbx
	addq	$32, %rbp
	cmpq	%rcx, %rbx
	jae	.LBB147_6
.LBB147_3:                              # =>This Inner Loop Header: Depth=1
	movq	8(%r13), %rdx
	movzwl	-8(%rdx,%rbp), %esi
	cmpw	%si, %r12w
	jb	.LBB147_2
# %bb.4:                                #   in Loop: Header=BB147_3 Depth=1
	movzwl	-6(%rdx,%rbp), %edi
	addl	%esi, %edi
	cmpl	%r14d, %edi
	jbe	.LBB147_2
# %bb.5:                                #   in Loop: Header=BB147_3 Depth=1
	movq	(%rdx,%rbp), %rdi
	movl	%r12d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbp)
                                        # kill: def $al killed $al def $rax
	movq	16(%r13), %rcx
	jmp	.LBB147_2
.LBB147_6:
	movzbl	%al, %r14d
	movl	4(%r13), %r12d
	testq	%rcx, %rcx
	je	.LBB147_14
# %bb.7:
	addl	$1, %r12d
	movzwl	%r12w, %r15d
	movl	$24, %ebp
	xorl	%eax, %eax
	xorl	%ebx, %ebx
	jmp	.LBB147_9
	.p2align	4, 0x90
.LBB147_8:                              #   in Loop: Header=BB147_9 Depth=1
	addq	$1, %rbx
	addq	$32, %rbp
	cmpq	%rcx, %rbx
	jae	.LBB147_12
.LBB147_9:                              # =>This Inner Loop Header: Depth=1
	movq	8(%r13), %rdx
	movzwl	-8(%rdx,%rbp), %esi
	cmpw	%si, %r12w
	jb	.LBB147_8
# %bb.10:                               #   in Loop: Header=BB147_9 Depth=1
	movzwl	-6(%rdx,%rbp), %edi
	addl	%esi, %edi
	cmpl	%r15d, %edi
	jbe	.LBB147_8
# %bb.11:                               #   in Loop: Header=BB147_9 Depth=1
	movq	(%rdx,%rbp), %rdi
	movl	%r12d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbp)
                                        # kill: def $al killed $al def $rax
	movq	16(%r13), %rcx
	jmp	.LBB147_8
.LBB147_12:
	movzwl	4(%r13), %r12d
	jmp	.LBB147_16
.LBB147_13:
	xorl	%ecx, %ecx
	xorl	%r14d, %r14d
	jmp	.LBB147_15
.LBB147_14:
	xorl	%ecx, %ecx
.LBB147_15:
	xorl	%eax, %eax
.LBB147_16:
	movzbl	2(%r13), %edx
	addl	$2, %r12d
	movw	%r12w, 4(%r13)
	testq	%rcx, %rcx
	je	.LBB147_24
# %bb.17:
	movzbl	%al, %eax
	shll	$8, %eax
	movzwl	%r14w, %r15d
	orl	%eax, %r15d
	addl	%edx, %r15d
	movzwl	%r15w, %r14d
	movl	$24, %ebx
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	jmp	.LBB147_19
	.p2align	4, 0x90
.LBB147_18:                             #   in Loop: Header=BB147_19 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rcx, %rbp
	jae	.LBB147_22
.LBB147_19:                             # =>This Inner Loop Header: Depth=1
	movq	8(%r13), %rdx
	movzwl	-8(%rdx,%rbx), %esi
	cmpw	%si, %r15w
	jb	.LBB147_18
# %bb.20:                               #   in Loop: Header=BB147_19 Depth=1
	movzwl	-6(%rdx,%rbx), %edi
	addl	%esi, %edi
	cmpl	%r14d, %edi
	jbe	.LBB147_18
# %bb.21:                               #   in Loop: Header=BB147_19 Depth=1
	movq	(%rdx,%rbx), %rdi
	movl	%r15d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbx)
                                        # kill: def $al killed $al def $rax
	movq	16(%r13), %rcx
	jmp	.LBB147_18
.LBB147_22:
	movb	%al, 1(%r13)
	movb	6(%r13), %cl
	leaq	6(%r13), %rdx
	testb	%al, %al
	js	.LBB147_26
# %bb.23:
	andb	$127, %cl
	movb	%cl, (%rdx)
	testb	%al, %al
	jne	.LBB147_27
	jmp	.LBB147_25
.LBB147_24:
	movb	$0, 1(%r13)
	leaq	6(%r13), %rdx
	movb	6(%r13), %cl
	andb	$127, %cl
	movb	%cl, 6(%r13)
.LBB147_25:
	orb	$2, %cl
	jmp	.LBB147_28
.LBB147_26:
	orb	$-128, %cl
	movb	%cl, (%rdx)
.LBB147_27:
	andb	$-3, %cl
.LBB147_28:
	movb	%cl, (%rdx)
	movl	$4, %eax
	addq	$8, %rsp
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%r12
	.cfi_def_cfa_offset 40
	popq	%r13
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end147:
	.size	LDX_absy, .Lfunc_end147-LDX_absy
	.cfi_endproc
                                        # -- End function
	.globl	LDY_imm                 # -- Begin function LDY_imm
	.p2align	4, 0x90
	.type	LDY_imm,@function
LDY_imm:                                # @LDY_imm
	.cfi_startproc
# %bb.0:
	pushq	%r15
	.cfi_def_cfa_offset 16
	pushq	%r14
	.cfi_def_cfa_offset 24
	pushq	%r12
	.cfi_def_cfa_offset 32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	pushq	%rax
	.cfi_def_cfa_offset 48
	.cfi_offset %rbx, -40
	.cfi_offset %r12, -32
	.cfi_offset %r14, -24
	.cfi_offset %r15, -16
	movq	%rdi, %r14
	movzwl	4(%rdi), %r15d
	leal	1(%r15), %eax
	movw	%ax, 4(%rdi)
	movq	16(%rdi), %rcx
	testq	%rcx, %rcx
	je	.LBB148_1
# %bb.2:
	movl	$24, %ebx
	xorl	%eax, %eax
	xorl	%r12d, %r12d
	jmp	.LBB148_3
	.p2align	4, 0x90
.LBB148_6:                              #   in Loop: Header=BB148_3 Depth=1
	addq	$1, %r12
	addq	$32, %rbx
	cmpq	%rcx, %r12
	jae	.LBB148_7
.LBB148_3:                              # =>This Inner Loop Header: Depth=1
	movq	8(%r14), %rdx
	movzwl	-8(%rdx,%rbx), %esi
	cmpw	%si, %r15w
	jb	.LBB148_6
# %bb.4:                                #   in Loop: Header=BB148_3 Depth=1
	movzwl	-6(%rdx,%rbx), %edi
	addl	%esi, %edi
	cmpl	%r15d, %edi
	jbe	.LBB148_6
# %bb.5:                                #   in Loop: Header=BB148_3 Depth=1
	movq	(%rdx,%rbx), %rdi
	movl	%r15d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbx)
                                        # kill: def $al killed $al def $rax
	movq	16(%r14), %rcx
	jmp	.LBB148_6
.LBB148_7:
	movb	%al, 2(%r14)
	movb	6(%r14), %cl
	leaq	6(%r14), %rdx
	testb	%al, %al
	js	.LBB148_8
# %bb.10:
	andb	$127, %cl
	movb	%cl, (%rdx)
	testb	%al, %al
	jne	.LBB148_9
	jmp	.LBB148_11
.LBB148_1:
	movb	$0, 2(%r14)
	leaq	6(%r14), %rdx
	movb	6(%r14), %cl
	andb	$127, %cl
	movb	%cl, 6(%r14)
.LBB148_11:
	orb	$2, %cl
	jmp	.LBB148_12
.LBB148_8:
	orb	$-128, %cl
	movb	%cl, (%rdx)
.LBB148_9:
	andb	$-3, %cl
.LBB148_12:
	movb	%cl, (%rdx)
	movl	$2, %eax
	addq	$8, %rsp
	.cfi_def_cfa_offset 40
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%r12
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end148:
	.size	LDY_imm, .Lfunc_end148-LDY_imm
	.cfi_endproc
                                        # -- End function
	.globl	LDY_zpg                 # -- Begin function LDY_zpg
	.p2align	4, 0x90
	.type	LDY_zpg,@function
LDY_zpg:                                # @LDY_zpg
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	pushq	%rax
	.cfi_def_cfa_offset 48
	.cfi_offset %rbx, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%rdi, %r14
	movzwl	4(%rdi), %r15d
	movq	16(%rdi), %rcx
	testq	%rcx, %rcx
	je	.LBB149_1
# %bb.3:
	movl	$24, %ebx
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	jmp	.LBB149_4
	.p2align	4, 0x90
.LBB149_7:                              #   in Loop: Header=BB149_4 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rcx, %rbp
	jae	.LBB149_8
.LBB149_4:                              # =>This Inner Loop Header: Depth=1
	movq	8(%r14), %rdx
	movzwl	-8(%rdx,%rbx), %esi
	cmpw	%si, %r15w
	jb	.LBB149_7
# %bb.5:                                #   in Loop: Header=BB149_4 Depth=1
	movzwl	-6(%rdx,%rbx), %edi
	addl	%esi, %edi
	cmpl	%r15d, %edi
	jbe	.LBB149_7
# %bb.6:                                #   in Loop: Header=BB149_4 Depth=1
	movq	(%rdx,%rbx), %rdi
	movl	%r15d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbx)
                                        # kill: def $al killed $al def $rax
	movq	16(%r14), %rcx
	jmp	.LBB149_7
.LBB149_8:
	addw	$1, 4(%r14)
	testq	%rcx, %rcx
	je	.LBB149_2
# %bb.9:
	movzbl	%al, %r15d
	movl	$24, %ebx
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	jmp	.LBB149_10
	.p2align	4, 0x90
.LBB149_13:                             #   in Loop: Header=BB149_10 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rcx, %rbp
	jae	.LBB149_14
.LBB149_10:                             # =>This Inner Loop Header: Depth=1
	movq	8(%r14), %rdx
	movzwl	-8(%rdx,%rbx), %esi
	cmpw	%r15w, %si
	ja	.LBB149_13
# %bb.11:                               #   in Loop: Header=BB149_10 Depth=1
	movzwl	-6(%rdx,%rbx), %edi
	addl	%esi, %edi
	cmpl	%r15d, %edi
	jbe	.LBB149_13
# %bb.12:                               #   in Loop: Header=BB149_10 Depth=1
	movq	(%rdx,%rbx), %rdi
	movzwl	%r15w, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbx)
                                        # kill: def $al killed $al def $rax
	movq	16(%r14), %rcx
	jmp	.LBB149_13
.LBB149_14:
	movb	%al, 2(%r14)
	movb	6(%r14), %cl
	leaq	6(%r14), %rdx
	testb	%al, %al
	js	.LBB149_15
# %bb.17:
	andb	$127, %cl
	movb	%cl, (%rdx)
	testb	%al, %al
	jne	.LBB149_16
	jmp	.LBB149_18
.LBB149_1:
	addl	$1, %r15d
	movw	%r15w, 4(%r14)
.LBB149_2:
	movb	$0, 2(%r14)
	leaq	6(%r14), %rdx
	movb	6(%r14), %cl
	andb	$127, %cl
	movb	%cl, 6(%r14)
.LBB149_18:
	orb	$2, %cl
	jmp	.LBB149_19
.LBB149_15:
	orb	$-128, %cl
	movb	%cl, (%rdx)
.LBB149_16:
	andb	$-3, %cl
.LBB149_19:
	movb	%cl, (%rdx)
	movl	$3, %eax
	addq	$8, %rsp
	.cfi_def_cfa_offset 40
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end149:
	.size	LDY_zpg, .Lfunc_end149-LDY_zpg
	.cfi_endproc
                                        # -- End function
	.globl	LDY_zpgx                # -- Begin function LDY_zpgx
	.p2align	4, 0x90
	.type	LDY_zpgx,@function
LDY_zpgx:                               # @LDY_zpgx
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r12
	.cfi_def_cfa_offset 40
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset %rbx, -48
	.cfi_offset %r12, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%rdi, %r12
	movzwl	4(%rdi), %r15d
	movq	16(%rdi), %rcx
	testq	%rcx, %rcx
	je	.LBB150_1
# %bb.2:
	movzwl	%r15w, %r14d
	movl	$24, %ebp
	xorl	%eax, %eax
	xorl	%ebx, %ebx
	jmp	.LBB150_3
	.p2align	4, 0x90
.LBB150_6:                              #   in Loop: Header=BB150_3 Depth=1
	addq	$1, %rbx
	addq	$32, %rbp
	cmpq	%rcx, %rbx
	jae	.LBB150_7
.LBB150_3:                              # =>This Inner Loop Header: Depth=1
	movq	8(%r12), %rdx
	movzwl	-8(%rdx,%rbp), %esi
	cmpw	%si, %r15w
	jb	.LBB150_6
# %bb.4:                                #   in Loop: Header=BB150_3 Depth=1
	movzwl	-6(%rdx,%rbp), %edi
	addl	%esi, %edi
	cmpl	%r14d, %edi
	jbe	.LBB150_6
# %bb.5:                                #   in Loop: Header=BB150_3 Depth=1
	movq	(%rdx,%rbp), %rdi
	movl	%r15d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbp)
                                        # kill: def $al killed $al def $rax
	movq	16(%r12), %rcx
	jmp	.LBB150_6
.LBB150_7:
	movzwl	4(%r12), %r15d
	jmp	.LBB150_8
.LBB150_1:
	xorl	%ecx, %ecx
	xorl	%eax, %eax
.LBB150_8:
	addb	1(%r12), %al
	addl	$1, %r15d
	movw	%r15w, 4(%r12)
	testq	%rcx, %rcx
	je	.LBB150_9
# %bb.10:
	movzbl	%al, %r15d
	movzwl	%r15w, %r14d
	movl	$24, %ebp
	xorl	%eax, %eax
	xorl	%ebx, %ebx
	jmp	.LBB150_11
	.p2align	4, 0x90
.LBB150_14:                             #   in Loop: Header=BB150_11 Depth=1
	addq	$1, %rbx
	addq	$32, %rbp
	cmpq	%rcx, %rbx
	jae	.LBB150_15
.LBB150_11:                             # =>This Inner Loop Header: Depth=1
	movq	8(%r12), %rdx
	movzwl	-8(%rdx,%rbp), %esi
	cmpw	%r15w, %si
	ja	.LBB150_14
# %bb.12:                               #   in Loop: Header=BB150_11 Depth=1
	movzwl	-6(%rdx,%rbp), %edi
	addl	%esi, %edi
	cmpl	%r14d, %edi
	jbe	.LBB150_14
# %bb.13:                               #   in Loop: Header=BB150_11 Depth=1
	movq	(%rdx,%rbp), %rdi
	movl	%r14d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbp)
                                        # kill: def $al killed $al def $rax
	movq	16(%r12), %rcx
	jmp	.LBB150_14
.LBB150_15:
	movb	%al, 2(%r12)
	movb	6(%r12), %cl
	leaq	6(%r12), %rdx
	testb	%al, %al
	js	.LBB150_16
# %bb.18:
	andb	$127, %cl
	movb	%cl, (%rdx)
	testb	%al, %al
	jne	.LBB150_17
	jmp	.LBB150_19
.LBB150_9:
	movb	$0, 2(%r12)
	leaq	6(%r12), %rdx
	movb	6(%r12), %cl
	andb	$127, %cl
	movb	%cl, 6(%r12)
.LBB150_19:
	orb	$2, %cl
	jmp	.LBB150_20
.LBB150_16:
	orb	$-128, %cl
	movb	%cl, (%rdx)
.LBB150_17:
	andb	$-3, %cl
.LBB150_20:
	movb	%cl, (%rdx)
	movl	$4, %eax
	popq	%rbx
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end150:
	.size	LDY_zpgx, .Lfunc_end150-LDY_zpgx
	.cfi_endproc
                                        # -- End function
	.globl	LDY_abss                # -- Begin function LDY_abss
	.p2align	4, 0x90
	.type	LDY_abss,@function
LDY_abss:                               # @LDY_abss
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r13
	.cfi_def_cfa_offset 40
	pushq	%r12
	.cfi_def_cfa_offset 48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	pushq	%rax
	.cfi_def_cfa_offset 64
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%rdi, %r12
	movzwl	4(%rdi), %r13d
	movq	16(%rdi), %rcx
	testq	%rcx, %rcx
	je	.LBB151_25
# %bb.1:
	movzwl	%r13w, %r14d
	movl	$24, %ebx
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	jmp	.LBB151_2
	.p2align	4, 0x90
.LBB151_5:                              #   in Loop: Header=BB151_2 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rcx, %rbp
	jae	.LBB151_6
.LBB151_2:                              # =>This Inner Loop Header: Depth=1
	movq	8(%r12), %rdx
	movzwl	-8(%rdx,%rbx), %esi
	cmpw	%si, %r13w
	jb	.LBB151_5
# %bb.3:                                #   in Loop: Header=BB151_2 Depth=1
	movzwl	-6(%rdx,%rbx), %edi
	addl	%esi, %edi
	cmpl	%r14d, %edi
	jbe	.LBB151_5
# %bb.4:                                #   in Loop: Header=BB151_2 Depth=1
	movq	(%rdx,%rbx), %rdi
	movl	%r13d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbx)
                                        # kill: def $al killed $al def $rax
	movq	16(%r12), %rcx
	jmp	.LBB151_5
.LBB151_6:
	movl	4(%r12), %r13d
	testq	%rcx, %rcx
	je	.LBB151_25
# %bb.7:
	movzbl	%al, %r14d
	addl	$1, %r13d
	movzwl	%r13w, %r15d
	movl	$24, %ebx
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	jmp	.LBB151_8
	.p2align	4, 0x90
.LBB151_11:                             #   in Loop: Header=BB151_8 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rcx, %rbp
	jae	.LBB151_12
.LBB151_8:                              # =>This Inner Loop Header: Depth=1
	movq	8(%r12), %rdx
	movzwl	-8(%rdx,%rbx), %esi
	cmpw	%si, %r13w
	jb	.LBB151_11
# %bb.9:                                #   in Loop: Header=BB151_8 Depth=1
	movzwl	-6(%rdx,%rbx), %edi
	addl	%esi, %edi
	cmpl	%r15d, %edi
	jbe	.LBB151_11
# %bb.10:                               #   in Loop: Header=BB151_8 Depth=1
	movq	(%rdx,%rbx), %rdi
	movl	%r13d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbx)
                                        # kill: def $al killed $al def $rax
	movq	16(%r12), %rcx
	jmp	.LBB151_11
.LBB151_25:
	addl	$2, %r13d
	movw	%r13w, 4(%r12)
.LBB151_13:
	movb	$0, 2(%r12)
	leaq	6(%r12), %rdx
	movb	6(%r12), %cl
	andb	$127, %cl
	movb	%cl, 6(%r12)
.LBB151_23:
	orb	$2, %cl
.LBB151_24:
	movb	%cl, (%rdx)
	movl	$4, %eax
	addq	$8, %rsp
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%r12
	.cfi_def_cfa_offset 40
	popq	%r13
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.LBB151_12:
	.cfi_def_cfa_offset 64
	addw	$2, 4(%r12)
	testq	%rcx, %rcx
	je	.LBB151_13
# %bb.14:
	movzbl	%al, %eax
	shll	$8, %eax
	movzwl	%r14w, %r15d
	orl	%eax, %r15d
	movzwl	%r15w, %r14d
	movl	$24, %ebx
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	jmp	.LBB151_15
	.p2align	4, 0x90
.LBB151_18:                             #   in Loop: Header=BB151_15 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rcx, %rbp
	jae	.LBB151_19
.LBB151_15:                             # =>This Inner Loop Header: Depth=1
	movq	8(%r12), %rdx
	movzwl	-8(%rdx,%rbx), %esi
	cmpw	%si, %r15w
	jb	.LBB151_18
# %bb.16:                               #   in Loop: Header=BB151_15 Depth=1
	movzwl	-6(%rdx,%rbx), %edi
	addl	%esi, %edi
	cmpl	%r14d, %edi
	jbe	.LBB151_18
# %bb.17:                               #   in Loop: Header=BB151_15 Depth=1
	movq	(%rdx,%rbx), %rdi
	movl	%r15d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbx)
                                        # kill: def $al killed $al def $rax
	movq	16(%r12), %rcx
	jmp	.LBB151_18
.LBB151_19:
	movb	%al, 2(%r12)
	movb	6(%r12), %cl
	leaq	6(%r12), %rdx
	testb	%al, %al
	js	.LBB151_20
# %bb.22:
	andb	$127, %cl
	movb	%cl, (%rdx)
	testb	%al, %al
	jne	.LBB151_21
	jmp	.LBB151_23
.LBB151_20:
	orb	$-128, %cl
	movb	%cl, (%rdx)
.LBB151_21:
	andb	$-3, %cl
	jmp	.LBB151_24
.Lfunc_end151:
	.size	LDY_abss, .Lfunc_end151-LDY_abss
	.cfi_endproc
                                        # -- End function
	.globl	LDY_absx                # -- Begin function LDY_absx
	.p2align	4, 0x90
	.type	LDY_absx,@function
LDY_absx:                               # @LDY_absx
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r13
	.cfi_def_cfa_offset 40
	pushq	%r12
	.cfi_def_cfa_offset 48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	pushq	%rax
	.cfi_def_cfa_offset 64
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%rdi, %r13
	movzwl	4(%rdi), %r12d
	movq	16(%rdi), %rcx
	testq	%rcx, %rcx
	je	.LBB152_13
# %bb.1:
	movzwl	%r12w, %r14d
	movl	$24, %ebp
	xorl	%eax, %eax
	xorl	%ebx, %ebx
	jmp	.LBB152_3
	.p2align	4, 0x90
.LBB152_2:                              #   in Loop: Header=BB152_3 Depth=1
	addq	$1, %rbx
	addq	$32, %rbp
	cmpq	%rcx, %rbx
	jae	.LBB152_6
.LBB152_3:                              # =>This Inner Loop Header: Depth=1
	movq	8(%r13), %rdx
	movzwl	-8(%rdx,%rbp), %esi
	cmpw	%si, %r12w
	jb	.LBB152_2
# %bb.4:                                #   in Loop: Header=BB152_3 Depth=1
	movzwl	-6(%rdx,%rbp), %edi
	addl	%esi, %edi
	cmpl	%r14d, %edi
	jbe	.LBB152_2
# %bb.5:                                #   in Loop: Header=BB152_3 Depth=1
	movq	(%rdx,%rbp), %rdi
	movl	%r12d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbp)
                                        # kill: def $al killed $al def $rax
	movq	16(%r13), %rcx
	jmp	.LBB152_2
.LBB152_6:
	movzbl	%al, %r14d
	movl	4(%r13), %r12d
	testq	%rcx, %rcx
	je	.LBB152_14
# %bb.7:
	addl	$1, %r12d
	movzwl	%r12w, %r15d
	movl	$24, %ebp
	xorl	%eax, %eax
	xorl	%ebx, %ebx
	jmp	.LBB152_9
	.p2align	4, 0x90
.LBB152_8:                              #   in Loop: Header=BB152_9 Depth=1
	addq	$1, %rbx
	addq	$32, %rbp
	cmpq	%rcx, %rbx
	jae	.LBB152_12
.LBB152_9:                              # =>This Inner Loop Header: Depth=1
	movq	8(%r13), %rdx
	movzwl	-8(%rdx,%rbp), %esi
	cmpw	%si, %r12w
	jb	.LBB152_8
# %bb.10:                               #   in Loop: Header=BB152_9 Depth=1
	movzwl	-6(%rdx,%rbp), %edi
	addl	%esi, %edi
	cmpl	%r15d, %edi
	jbe	.LBB152_8
# %bb.11:                               #   in Loop: Header=BB152_9 Depth=1
	movq	(%rdx,%rbp), %rdi
	movl	%r12d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbp)
                                        # kill: def $al killed $al def $rax
	movq	16(%r13), %rcx
	jmp	.LBB152_8
.LBB152_12:
	movzwl	4(%r13), %r12d
	jmp	.LBB152_16
.LBB152_13:
	xorl	%ecx, %ecx
	xorl	%r14d, %r14d
	jmp	.LBB152_15
.LBB152_14:
	xorl	%ecx, %ecx
.LBB152_15:
	xorl	%eax, %eax
.LBB152_16:
	movzbl	1(%r13), %edx
	addl	$2, %r12d
	movw	%r12w, 4(%r13)
	testq	%rcx, %rcx
	je	.LBB152_24
# %bb.17:
	movzbl	%al, %eax
	shll	$8, %eax
	movzwl	%r14w, %r15d
	orl	%eax, %r15d
	addl	%edx, %r15d
	movzwl	%r15w, %r14d
	movl	$24, %ebx
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	jmp	.LBB152_19
	.p2align	4, 0x90
.LBB152_18:                             #   in Loop: Header=BB152_19 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rcx, %rbp
	jae	.LBB152_22
.LBB152_19:                             # =>This Inner Loop Header: Depth=1
	movq	8(%r13), %rdx
	movzwl	-8(%rdx,%rbx), %esi
	cmpw	%si, %r15w
	jb	.LBB152_18
# %bb.20:                               #   in Loop: Header=BB152_19 Depth=1
	movzwl	-6(%rdx,%rbx), %edi
	addl	%esi, %edi
	cmpl	%r14d, %edi
	jbe	.LBB152_18
# %bb.21:                               #   in Loop: Header=BB152_19 Depth=1
	movq	(%rdx,%rbx), %rdi
	movl	%r15d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbx)
                                        # kill: def $al killed $al def $rax
	movq	16(%r13), %rcx
	jmp	.LBB152_18
.LBB152_22:
	movb	%al, 2(%r13)
	movb	6(%r13), %cl
	leaq	6(%r13), %rdx
	testb	%al, %al
	js	.LBB152_26
# %bb.23:
	andb	$127, %cl
	movb	%cl, (%rdx)
	testb	%al, %al
	jne	.LBB152_27
	jmp	.LBB152_25
.LBB152_24:
	movb	$0, 2(%r13)
	leaq	6(%r13), %rdx
	movb	6(%r13), %cl
	andb	$127, %cl
	movb	%cl, 6(%r13)
.LBB152_25:
	orb	$2, %cl
	jmp	.LBB152_28
.LBB152_26:
	orb	$-128, %cl
	movb	%cl, (%rdx)
.LBB152_27:
	andb	$-3, %cl
.LBB152_28:
	movb	%cl, (%rdx)
	movl	$4, %eax
	addq	$8, %rsp
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%r12
	.cfi_def_cfa_offset 40
	popq	%r13
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end152:
	.size	LDY_absx, .Lfunc_end152-LDY_absx
	.cfi_endproc
                                        # -- End function
	.globl	LAX_xind                # -- Begin function LAX_xind
	.p2align	4, 0x90
	.type	LAX_xind,@function
LAX_xind:                               # @LAX_xind
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r12
	.cfi_def_cfa_offset 40
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset %rbx, -48
	.cfi_offset %r12, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%rdi, %r12
	callq	xind
	movq	16(%r12), %rcx
	testq	%rcx, %rcx
	je	.LBB153_1
# %bb.2:
	movl	%eax, %r15d
	movzwl	%ax, %r14d
	movl	$24, %ebp
	xorl	%eax, %eax
	xorl	%ebx, %ebx
	jmp	.LBB153_3
	.p2align	4, 0x90
.LBB153_6:                              #   in Loop: Header=BB153_3 Depth=1
	addq	$1, %rbx
	addq	$32, %rbp
	cmpq	%rcx, %rbx
	jae	.LBB153_7
.LBB153_3:                              # =>This Inner Loop Header: Depth=1
	movq	8(%r12), %rdx
	movzwl	-8(%rdx,%rbp), %esi
	cmpw	%si, %r15w
	jb	.LBB153_6
# %bb.4:                                #   in Loop: Header=BB153_3 Depth=1
	movzwl	-6(%rdx,%rbp), %edi
	addl	%esi, %edi
	cmpl	%r14d, %edi
	jbe	.LBB153_6
# %bb.5:                                #   in Loop: Header=BB153_3 Depth=1
	movq	(%rdx,%rbp), %rdi
	movl	%r14d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbp)
                                        # kill: def $al killed $al def $rax
	movq	16(%r12), %rcx
	jmp	.LBB153_6
.LBB153_1:
	xorl	%eax, %eax
.LBB153_7:
	movb	%al, (%r12)
	movb	%al, 1(%r12)
	movb	6(%r12), %cl
	testb	%al, %al
	js	.LBB153_8
# %bb.10:
	andb	$127, %cl
	movb	%cl, 6(%r12)
	testb	%al, %al
	jne	.LBB153_9
# %bb.11:
	orb	$2, %cl
	jmp	.LBB153_12
.LBB153_8:
	orb	$-128, %cl
	movb	%cl, 6(%r12)
.LBB153_9:
	andb	$-3, %cl
.LBB153_12:
	movb	%cl, 6(%r12)
	movl	$6, %eax
	popq	%rbx
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end153:
	.size	LAX_xind, .Lfunc_end153-LAX_xind
	.cfi_endproc
                                        # -- End function
	.globl	LAX_zpg                 # -- Begin function LAX_zpg
	.p2align	4, 0x90
	.type	LAX_zpg,@function
LAX_zpg:                                # @LAX_zpg
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	pushq	%rax
	.cfi_def_cfa_offset 48
	.cfi_offset %rbx, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%rdi, %r14
	movzwl	4(%rdi), %r15d
	movq	16(%rdi), %rcx
	testq	%rcx, %rcx
	je	.LBB154_12
# %bb.1:
	movl	$24, %ebx
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	jmp	.LBB154_3
	.p2align	4, 0x90
.LBB154_2:                              #   in Loop: Header=BB154_3 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rcx, %rbp
	jae	.LBB154_6
.LBB154_3:                              # =>This Inner Loop Header: Depth=1
	movq	8(%r14), %rdx
	movzwl	-8(%rdx,%rbx), %esi
	cmpw	%si, %r15w
	jb	.LBB154_2
# %bb.4:                                #   in Loop: Header=BB154_3 Depth=1
	movzwl	-6(%rdx,%rbx), %edi
	addl	%esi, %edi
	cmpl	%r15d, %edi
	jbe	.LBB154_2
# %bb.5:                                #   in Loop: Header=BB154_3 Depth=1
	movq	(%rdx,%rbx), %rdi
	movl	%r15d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbx)
                                        # kill: def $al killed $al def $rax
	movq	16(%r14), %rcx
	jmp	.LBB154_2
.LBB154_6:
	addw	$1, 4(%r14)
	testq	%rcx, %rcx
	je	.LBB154_13
# %bb.7:
	movzbl	%al, %r15d
	movl	$24, %ebx
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	jmp	.LBB154_9
	.p2align	4, 0x90
.LBB154_8:                              #   in Loop: Header=BB154_9 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rcx, %rbp
	jae	.LBB154_14
.LBB154_9:                              # =>This Inner Loop Header: Depth=1
	movq	8(%r14), %rdx
	movzwl	-8(%rdx,%rbx), %esi
	cmpw	%r15w, %si
	ja	.LBB154_8
# %bb.10:                               #   in Loop: Header=BB154_9 Depth=1
	movzwl	-6(%rdx,%rbx), %edi
	addl	%esi, %edi
	cmpl	%r15d, %edi
	jbe	.LBB154_8
# %bb.11:                               #   in Loop: Header=BB154_9 Depth=1
	movq	(%rdx,%rbx), %rdi
	movzwl	%r15w, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbx)
                                        # kill: def $al killed $al def $rax
	movq	16(%r14), %rcx
	jmp	.LBB154_8
.LBB154_12:
	addl	$1, %r15d
	movw	%r15w, 4(%r14)
.LBB154_13:
	xorl	%eax, %eax
.LBB154_14:
	movb	%al, (%r14)
	movb	%al, 1(%r14)
	movb	6(%r14), %cl
	testb	%al, %al
	js	.LBB154_17
# %bb.15:
	andb	$127, %cl
	movb	%cl, 6(%r14)
	testb	%al, %al
	jne	.LBB154_18
# %bb.16:
	orb	$2, %cl
	jmp	.LBB154_19
.LBB154_17:
	orb	$-128, %cl
	movb	%cl, 6(%r14)
.LBB154_18:
	andb	$-3, %cl
.LBB154_19:
	movb	%cl, 6(%r14)
	movl	$3, %eax
	addq	$8, %rsp
	.cfi_def_cfa_offset 40
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end154:
	.size	LAX_zpg, .Lfunc_end154-LAX_zpg
	.cfi_endproc
                                        # -- End function
	.globl	LAX_abss                # -- Begin function LAX_abss
	.p2align	4, 0x90
	.type	LAX_abss,@function
LAX_abss:                               # @LAX_abss
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r13
	.cfi_def_cfa_offset 40
	pushq	%r12
	.cfi_def_cfa_offset 48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	pushq	%rax
	.cfi_def_cfa_offset 64
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%rdi, %r12
	movzwl	4(%rdi), %r13d
	movq	16(%rdi), %rcx
	testq	%rcx, %rcx
	je	.LBB155_12
# %bb.1:
	movzwl	%r13w, %r14d
	movl	$24, %ebx
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	jmp	.LBB155_3
	.p2align	4, 0x90
.LBB155_2:                              #   in Loop: Header=BB155_3 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rcx, %rbp
	jae	.LBB155_6
.LBB155_3:                              # =>This Inner Loop Header: Depth=1
	movq	8(%r12), %rdx
	movzwl	-8(%rdx,%rbx), %esi
	cmpw	%si, %r13w
	jb	.LBB155_2
# %bb.4:                                #   in Loop: Header=BB155_3 Depth=1
	movzwl	-6(%rdx,%rbx), %edi
	addl	%esi, %edi
	cmpl	%r14d, %edi
	jbe	.LBB155_2
# %bb.5:                                #   in Loop: Header=BB155_3 Depth=1
	movq	(%rdx,%rbx), %rdi
	movl	%r13d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbx)
                                        # kill: def $al killed $al def $rax
	movq	16(%r12), %rcx
	jmp	.LBB155_2
.LBB155_6:
	movl	4(%r12), %r13d
	testq	%rcx, %rcx
	je	.LBB155_12
# %bb.7:
	movzbl	%al, %r14d
	addl	$1, %r13d
	movzwl	%r13w, %r15d
	movl	$24, %ebx
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	jmp	.LBB155_9
	.p2align	4, 0x90
.LBB155_8:                              #   in Loop: Header=BB155_9 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rcx, %rbp
	jae	.LBB155_13
.LBB155_9:                              # =>This Inner Loop Header: Depth=1
	movq	8(%r12), %rdx
	movzwl	-8(%rdx,%rbx), %esi
	cmpw	%si, %r13w
	jb	.LBB155_8
# %bb.10:                               #   in Loop: Header=BB155_9 Depth=1
	movzwl	-6(%rdx,%rbx), %edi
	addl	%esi, %edi
	cmpl	%r15d, %edi
	jbe	.LBB155_8
# %bb.11:                               #   in Loop: Header=BB155_9 Depth=1
	movq	(%rdx,%rbx), %rdi
	movl	%r13d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbx)
                                        # kill: def $al killed $al def $rax
	movq	16(%r12), %rcx
	jmp	.LBB155_8
.LBB155_12:
	addl	$2, %r13d
	movw	%r13w, 4(%r12)
.LBB155_19:
	xorl	%eax, %eax
.LBB155_20:
	movb	%al, (%r12)
	movb	%al, 1(%r12)
	movb	6(%r12), %cl
	testb	%al, %al
	js	.LBB155_23
# %bb.21:
	andb	$127, %cl
	movb	%cl, 6(%r12)
	testb	%al, %al
	jne	.LBB155_24
# %bb.22:
	orb	$2, %cl
	jmp	.LBB155_25
.LBB155_13:
	addw	$2, 4(%r12)
	testq	%rcx, %rcx
	je	.LBB155_19
# %bb.14:
	movzbl	%al, %eax
	shll	$8, %eax
	movzwl	%r14w, %r15d
	orl	%eax, %r15d
	movzwl	%r15w, %r14d
	movl	$24, %ebp
	xorl	%eax, %eax
	xorl	%ebx, %ebx
	jmp	.LBB155_16
	.p2align	4, 0x90
.LBB155_15:                             #   in Loop: Header=BB155_16 Depth=1
	addq	$1, %rbx
	addq	$32, %rbp
	cmpq	%rcx, %rbx
	jae	.LBB155_20
.LBB155_16:                             # =>This Inner Loop Header: Depth=1
	movq	8(%r12), %rdx
	movzwl	-8(%rdx,%rbp), %esi
	cmpw	%si, %r15w
	jb	.LBB155_15
# %bb.17:                               #   in Loop: Header=BB155_16 Depth=1
	movzwl	-6(%rdx,%rbp), %edi
	addl	%esi, %edi
	cmpl	%r14d, %edi
	jbe	.LBB155_15
# %bb.18:                               #   in Loop: Header=BB155_16 Depth=1
	movq	(%rdx,%rbp), %rdi
	movl	%r15d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbp)
                                        # kill: def $al killed $al def $rax
	movq	16(%r12), %rcx
	jmp	.LBB155_15
.LBB155_23:
	orb	$-128, %cl
	movb	%cl, 6(%r12)
.LBB155_24:
	andb	$-3, %cl
.LBB155_25:
	movb	%cl, 6(%r12)
	movl	$4, %eax
	addq	$8, %rsp
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%r12
	.cfi_def_cfa_offset 40
	popq	%r13
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end155:
	.size	LAX_abss, .Lfunc_end155-LAX_abss
	.cfi_endproc
                                        # -- End function
	.globl	LAX_indy                # -- Begin function LAX_indy
	.p2align	4, 0x90
	.type	LAX_indy,@function
LAX_indy:                               # @LAX_indy
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r12
	.cfi_def_cfa_offset 40
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset %rbx, -48
	.cfi_offset %r12, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%rdi, %r12
	callq	indy
	movq	16(%r12), %rcx
	testq	%rcx, %rcx
	je	.LBB156_1
# %bb.2:
	movl	%eax, %r15d
	movzwl	%ax, %r14d
	movl	$24, %ebp
	xorl	%eax, %eax
	xorl	%ebx, %ebx
	jmp	.LBB156_3
	.p2align	4, 0x90
.LBB156_6:                              #   in Loop: Header=BB156_3 Depth=1
	addq	$1, %rbx
	addq	$32, %rbp
	cmpq	%rcx, %rbx
	jae	.LBB156_7
.LBB156_3:                              # =>This Inner Loop Header: Depth=1
	movq	8(%r12), %rdx
	movzwl	-8(%rdx,%rbp), %esi
	cmpw	%si, %r15w
	jb	.LBB156_6
# %bb.4:                                #   in Loop: Header=BB156_3 Depth=1
	movzwl	-6(%rdx,%rbp), %edi
	addl	%esi, %edi
	cmpl	%r14d, %edi
	jbe	.LBB156_6
# %bb.5:                                #   in Loop: Header=BB156_3 Depth=1
	movq	(%rdx,%rbp), %rdi
	movl	%r14d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbp)
                                        # kill: def $al killed $al def $rax
	movq	16(%r12), %rcx
	jmp	.LBB156_6
.LBB156_1:
	xorl	%eax, %eax
.LBB156_7:
	movb	%al, (%r12)
	movb	%al, 1(%r12)
	movb	6(%r12), %cl
	testb	%al, %al
	js	.LBB156_8
# %bb.10:
	andb	$127, %cl
	movb	%cl, 6(%r12)
	testb	%al, %al
	jne	.LBB156_9
# %bb.11:
	orb	$2, %cl
	jmp	.LBB156_12
.LBB156_8:
	orb	$-128, %cl
	movb	%cl, 6(%r12)
.LBB156_9:
	andb	$-3, %cl
.LBB156_12:
	movb	%cl, 6(%r12)
	movl	$4, %eax
	popq	%rbx
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end156:
	.size	LAX_indy, .Lfunc_end156-LAX_indy
	.cfi_endproc
                                        # -- End function
	.globl	LAX_zpgy                # -- Begin function LAX_zpgy
	.p2align	4, 0x90
	.type	LAX_zpgy,@function
LAX_zpgy:                               # @LAX_zpgy
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r12
	.cfi_def_cfa_offset 40
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset %rbx, -48
	.cfi_offset %r12, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%rdi, %r12
	movzwl	4(%rdi), %r15d
	movq	16(%rdi), %rcx
	testq	%rcx, %rcx
	je	.LBB157_1
# %bb.2:
	movzwl	%r15w, %r14d
	movl	$24, %ebp
	xorl	%eax, %eax
	xorl	%ebx, %ebx
	jmp	.LBB157_3
	.p2align	4, 0x90
.LBB157_6:                              #   in Loop: Header=BB157_3 Depth=1
	addq	$1, %rbx
	addq	$32, %rbp
	cmpq	%rcx, %rbx
	jae	.LBB157_7
.LBB157_3:                              # =>This Inner Loop Header: Depth=1
	movq	8(%r12), %rdx
	movzwl	-8(%rdx,%rbp), %esi
	cmpw	%si, %r15w
	jb	.LBB157_6
# %bb.4:                                #   in Loop: Header=BB157_3 Depth=1
	movzwl	-6(%rdx,%rbp), %edi
	addl	%esi, %edi
	cmpl	%r14d, %edi
	jbe	.LBB157_6
# %bb.5:                                #   in Loop: Header=BB157_3 Depth=1
	movq	(%rdx,%rbp), %rdi
	movl	%r15d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbp)
                                        # kill: def $al killed $al def $rax
	movq	16(%r12), %rcx
	jmp	.LBB157_6
.LBB157_7:
	movzwl	4(%r12), %r15d
	jmp	.LBB157_8
.LBB157_1:
	xorl	%ecx, %ecx
	xorl	%eax, %eax
.LBB157_8:
	addb	2(%r12), %al
	addl	$1, %r15d
	movw	%r15w, 4(%r12)
	testq	%rcx, %rcx
	je	.LBB157_9
# %bb.10:
	movzbl	%al, %r15d
	movzwl	%r15w, %r14d
	movl	$24, %ebp
	xorl	%eax, %eax
	xorl	%ebx, %ebx
	jmp	.LBB157_11
	.p2align	4, 0x90
.LBB157_14:                             #   in Loop: Header=BB157_11 Depth=1
	addq	$1, %rbx
	addq	$32, %rbp
	cmpq	%rcx, %rbx
	jae	.LBB157_15
.LBB157_11:                             # =>This Inner Loop Header: Depth=1
	movq	8(%r12), %rdx
	movzwl	-8(%rdx,%rbp), %esi
	cmpw	%r15w, %si
	ja	.LBB157_14
# %bb.12:                               #   in Loop: Header=BB157_11 Depth=1
	movzwl	-6(%rdx,%rbp), %edi
	addl	%esi, %edi
	cmpl	%r14d, %edi
	jbe	.LBB157_14
# %bb.13:                               #   in Loop: Header=BB157_11 Depth=1
	movq	(%rdx,%rbp), %rdi
	movl	%r14d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbp)
                                        # kill: def $al killed $al def $rax
	movq	16(%r12), %rcx
	jmp	.LBB157_14
.LBB157_9:
	xorl	%eax, %eax
.LBB157_15:
	movb	%al, (%r12)
	movb	%al, 1(%r12)
	movb	6(%r12), %cl
	testb	%al, %al
	js	.LBB157_16
# %bb.18:
	andb	$127, %cl
	movb	%cl, 6(%r12)
	testb	%al, %al
	jne	.LBB157_17
# %bb.19:
	orb	$2, %cl
	jmp	.LBB157_20
.LBB157_16:
	orb	$-128, %cl
	movb	%cl, 6(%r12)
.LBB157_17:
	andb	$-3, %cl
.LBB157_20:
	movb	%cl, 6(%r12)
	movl	$4, %eax
	popq	%rbx
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end157:
	.size	LAX_zpgy, .Lfunc_end157-LAX_zpgy
	.cfi_endproc
                                        # -- End function
	.globl	LAX_absy                # -- Begin function LAX_absy
	.p2align	4, 0x90
	.type	LAX_absy,@function
LAX_absy:                               # @LAX_absy
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r13
	.cfi_def_cfa_offset 40
	pushq	%r12
	.cfi_def_cfa_offset 48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	pushq	%rax
	.cfi_def_cfa_offset 64
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%rdi, %r12
	movzwl	4(%rdi), %r13d
	movq	16(%rdi), %rcx
	testq	%rcx, %rcx
	je	.LBB158_13
# %bb.1:
	movzwl	%r13w, %r14d
	movl	$24, %ebx
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	jmp	.LBB158_3
	.p2align	4, 0x90
.LBB158_2:                              #   in Loop: Header=BB158_3 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rcx, %rbp
	jae	.LBB158_6
.LBB158_3:                              # =>This Inner Loop Header: Depth=1
	movq	8(%r12), %rdx
	movzwl	-8(%rdx,%rbx), %esi
	cmpw	%si, %r13w
	jb	.LBB158_2
# %bb.4:                                #   in Loop: Header=BB158_3 Depth=1
	movzwl	-6(%rdx,%rbx), %edi
	addl	%esi, %edi
	cmpl	%r14d, %edi
	jbe	.LBB158_2
# %bb.5:                                #   in Loop: Header=BB158_3 Depth=1
	movq	(%rdx,%rbx), %rdi
	movl	%r13d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbx)
                                        # kill: def $al killed $al def $rax
	movq	16(%r12), %rcx
	jmp	.LBB158_2
.LBB158_6:
	movzbl	%al, %r14d
	movl	4(%r12), %r13d
	testq	%rcx, %rcx
	je	.LBB158_14
# %bb.7:
	addl	$1, %r13d
	movzwl	%r13w, %r15d
	movl	$24, %ebx
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	jmp	.LBB158_9
	.p2align	4, 0x90
.LBB158_8:                              #   in Loop: Header=BB158_9 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rcx, %rbp
	jae	.LBB158_12
.LBB158_9:                              # =>This Inner Loop Header: Depth=1
	movq	8(%r12), %rdx
	movzwl	-8(%rdx,%rbx), %esi
	cmpw	%si, %r13w
	jb	.LBB158_8
# %bb.10:                               #   in Loop: Header=BB158_9 Depth=1
	movzwl	-6(%rdx,%rbx), %edi
	addl	%esi, %edi
	cmpl	%r15d, %edi
	jbe	.LBB158_8
# %bb.11:                               #   in Loop: Header=BB158_9 Depth=1
	movq	(%rdx,%rbx), %rdi
	movl	%r13d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbx)
                                        # kill: def $al killed $al def $rax
	movq	16(%r12), %rcx
	jmp	.LBB158_8
.LBB158_12:
	movzwl	4(%r12), %r13d
	jmp	.LBB158_16
.LBB158_13:
	xorl	%ecx, %ecx
	xorl	%r14d, %r14d
	jmp	.LBB158_15
.LBB158_14:
	xorl	%ecx, %ecx
.LBB158_15:
	xorl	%eax, %eax
.LBB158_16:
	movzbl	2(%r12), %edx
	addl	$2, %r13d
	movw	%r13w, 4(%r12)
	testq	%rcx, %rcx
	je	.LBB158_22
# %bb.17:
	movzbl	%al, %eax
	shll	$8, %eax
	movzwl	%r14w, %r15d
	orl	%eax, %r15d
	addl	%edx, %r15d
	movzwl	%r15w, %r14d
	movl	$24, %ebx
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	jmp	.LBB158_19
	.p2align	4, 0x90
.LBB158_18:                             #   in Loop: Header=BB158_19 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rcx, %rbp
	jae	.LBB158_23
.LBB158_19:                             # =>This Inner Loop Header: Depth=1
	movq	8(%r12), %rdx
	movzwl	-8(%rdx,%rbx), %esi
	cmpw	%si, %r15w
	jb	.LBB158_18
# %bb.20:                               #   in Loop: Header=BB158_19 Depth=1
	movzwl	-6(%rdx,%rbx), %edi
	addl	%esi, %edi
	cmpl	%r14d, %edi
	jbe	.LBB158_18
# %bb.21:                               #   in Loop: Header=BB158_19 Depth=1
	movq	(%rdx,%rbx), %rdi
	movl	%r15d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbx)
                                        # kill: def $al killed $al def $rax
	movq	16(%r12), %rcx
	jmp	.LBB158_18
.LBB158_22:
	xorl	%eax, %eax
.LBB158_23:
	movb	%al, (%r12)
	movb	%al, 1(%r12)
	movb	6(%r12), %cl
	testb	%al, %al
	js	.LBB158_26
# %bb.24:
	andb	$127, %cl
	movb	%cl, 6(%r12)
	testb	%al, %al
	jne	.LBB158_27
# %bb.25:
	orb	$2, %cl
	jmp	.LBB158_28
.LBB158_26:
	orb	$-128, %cl
	movb	%cl, 6(%r12)
.LBB158_27:
	andb	$-3, %cl
.LBB158_28:
	movb	%cl, 6(%r12)
	movl	$4, %eax
	addq	$8, %rsp
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%r12
	.cfi_def_cfa_offset 40
	popq	%r13
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end158:
	.size	LAX_absy, .Lfunc_end158-LAX_absy
	.cfi_endproc
                                        # -- End function
	.globl	BCC                     # -- Begin function BCC
	.p2align	4, 0x90
	.type	BCC,@function
BCC:                                    # @BCC
	.cfi_startproc
# %bb.0:
	pushq	%r15
	.cfi_def_cfa_offset 16
	pushq	%r14
	.cfi_def_cfa_offset 24
	pushq	%r12
	.cfi_def_cfa_offset 32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	pushq	%rax
	.cfi_def_cfa_offset 48
	.cfi_offset %rbx, -40
	.cfi_offset %r12, -32
	.cfi_offset %r14, -24
	.cfi_offset %r15, -16
	movq	%rdi, %r14
	movzwl	4(%rdi), %r15d
	leal	1(%r15), %edx
	movw	%dx, 4(%rdi)
	movq	16(%rdi), %rcx
	testq	%rcx, %rcx
	je	.LBB159_1
# %bb.2:
	movl	$24, %ebx
	xorl	%eax, %eax
	xorl	%r12d, %r12d
	jmp	.LBB159_3
	.p2align	4, 0x90
.LBB159_6:                              #   in Loop: Header=BB159_3 Depth=1
	addq	$1, %r12
	addq	$32, %rbx
	cmpq	%rcx, %r12
	jae	.LBB159_7
.LBB159_3:                              # =>This Inner Loop Header: Depth=1
	movq	8(%r14), %rdx
	movzwl	-8(%rdx,%rbx), %esi
	cmpw	%si, %r15w
	jb	.LBB159_6
# %bb.4:                                #   in Loop: Header=BB159_3 Depth=1
	movzwl	-6(%rdx,%rbx), %edi
	addl	%esi, %edi
	cmpl	%r15d, %edi
	jbe	.LBB159_6
# %bb.5:                                #   in Loop: Header=BB159_3 Depth=1
	movq	(%rdx,%rbx), %rdi
	movl	%r15d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbx)
                                        # kill: def $al killed $al def $rax
	movq	16(%r14), %rcx
	jmp	.LBB159_6
.LBB159_7:
	movzwl	4(%r14), %edx
	testb	$1, 6(%r14)
	jne	.LBB159_10
.LBB159_9:
	movsbl	%al, %eax
	addl	%eax, %edx
	movw	%dx, 4(%r14)
.LBB159_10:
	movl	$2, %eax
	addq	$8, %rsp
	.cfi_def_cfa_offset 40
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%r12
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	retq
.LBB159_1:
	.cfi_def_cfa_offset 48
	xorl	%eax, %eax
	testb	$1, 6(%r14)
	je	.LBB159_9
	jmp	.LBB159_10
.Lfunc_end159:
	.size	BCC, .Lfunc_end159-BCC
	.cfi_endproc
                                        # -- End function
	.globl	BCS                     # -- Begin function BCS
	.p2align	4, 0x90
	.type	BCS,@function
BCS:                                    # @BCS
	.cfi_startproc
# %bb.0:
	pushq	%r15
	.cfi_def_cfa_offset 16
	pushq	%r14
	.cfi_def_cfa_offset 24
	pushq	%r12
	.cfi_def_cfa_offset 32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	pushq	%rax
	.cfi_def_cfa_offset 48
	.cfi_offset %rbx, -40
	.cfi_offset %r12, -32
	.cfi_offset %r14, -24
	.cfi_offset %r15, -16
	movq	%rdi, %r14
	movzwl	4(%rdi), %r15d
	leal	1(%r15), %edx
	movw	%dx, 4(%rdi)
	movq	16(%rdi), %rcx
	testq	%rcx, %rcx
	je	.LBB160_1
# %bb.2:
	movl	$24, %ebx
	xorl	%eax, %eax
	xorl	%r12d, %r12d
	jmp	.LBB160_3
	.p2align	4, 0x90
.LBB160_6:                              #   in Loop: Header=BB160_3 Depth=1
	addq	$1, %r12
	addq	$32, %rbx
	cmpq	%rcx, %r12
	jae	.LBB160_7
.LBB160_3:                              # =>This Inner Loop Header: Depth=1
	movq	8(%r14), %rdx
	movzwl	-8(%rdx,%rbx), %esi
	cmpw	%si, %r15w
	jb	.LBB160_6
# %bb.4:                                #   in Loop: Header=BB160_3 Depth=1
	movzwl	-6(%rdx,%rbx), %edi
	addl	%esi, %edi
	cmpl	%r15d, %edi
	jbe	.LBB160_6
# %bb.5:                                #   in Loop: Header=BB160_3 Depth=1
	movq	(%rdx,%rbx), %rdi
	movl	%r15d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbx)
                                        # kill: def $al killed $al def $rax
	movq	16(%r14), %rcx
	jmp	.LBB160_6
.LBB160_7:
	movzwl	4(%r14), %edx
	testb	$1, 6(%r14)
	je	.LBB160_10
.LBB160_9:
	movsbl	%al, %eax
	addl	%eax, %edx
	movw	%dx, 4(%r14)
.LBB160_10:
	movl	$2, %eax
	addq	$8, %rsp
	.cfi_def_cfa_offset 40
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%r12
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	retq
.LBB160_1:
	.cfi_def_cfa_offset 48
	xorl	%eax, %eax
	testb	$1, 6(%r14)
	jne	.LBB160_9
	jmp	.LBB160_10
.Lfunc_end160:
	.size	BCS, .Lfunc_end160-BCS
	.cfi_endproc
                                        # -- End function
	.globl	BZC                     # -- Begin function BZC
	.p2align	4, 0x90
	.type	BZC,@function
BZC:                                    # @BZC
	.cfi_startproc
# %bb.0:
	pushq	%r15
	.cfi_def_cfa_offset 16
	pushq	%r14
	.cfi_def_cfa_offset 24
	pushq	%r12
	.cfi_def_cfa_offset 32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	pushq	%rax
	.cfi_def_cfa_offset 48
	.cfi_offset %rbx, -40
	.cfi_offset %r12, -32
	.cfi_offset %r14, -24
	.cfi_offset %r15, -16
	movq	%rdi, %r14
	movzwl	4(%rdi), %r15d
	leal	1(%r15), %edx
	movw	%dx, 4(%rdi)
	movq	16(%rdi), %rcx
	testq	%rcx, %rcx
	je	.LBB161_1
# %bb.2:
	movl	$24, %ebx
	xorl	%eax, %eax
	xorl	%r12d, %r12d
	jmp	.LBB161_3
	.p2align	4, 0x90
.LBB161_6:                              #   in Loop: Header=BB161_3 Depth=1
	addq	$1, %r12
	addq	$32, %rbx
	cmpq	%rcx, %r12
	jae	.LBB161_7
.LBB161_3:                              # =>This Inner Loop Header: Depth=1
	movq	8(%r14), %rdx
	movzwl	-8(%rdx,%rbx), %esi
	cmpw	%si, %r15w
	jb	.LBB161_6
# %bb.4:                                #   in Loop: Header=BB161_3 Depth=1
	movzwl	-6(%rdx,%rbx), %edi
	addl	%esi, %edi
	cmpl	%r15d, %edi
	jbe	.LBB161_6
# %bb.5:                                #   in Loop: Header=BB161_3 Depth=1
	movq	(%rdx,%rbx), %rdi
	movl	%r15d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbx)
                                        # kill: def $al killed $al def $rax
	movq	16(%r14), %rcx
	jmp	.LBB161_6
.LBB161_7:
	movzwl	4(%r14), %edx
	testb	$2, 6(%r14)
	jne	.LBB161_10
.LBB161_9:
	movsbl	%al, %eax
	addl	%eax, %edx
	movw	%dx, 4(%r14)
.LBB161_10:
	movl	$2, %eax
	addq	$8, %rsp
	.cfi_def_cfa_offset 40
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%r12
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	retq
.LBB161_1:
	.cfi_def_cfa_offset 48
	xorl	%eax, %eax
	testb	$2, 6(%r14)
	je	.LBB161_9
	jmp	.LBB161_10
.Lfunc_end161:
	.size	BZC, .Lfunc_end161-BZC
	.cfi_endproc
                                        # -- End function
	.globl	BZS                     # -- Begin function BZS
	.p2align	4, 0x90
	.type	BZS,@function
BZS:                                    # @BZS
	.cfi_startproc
# %bb.0:
	pushq	%r15
	.cfi_def_cfa_offset 16
	pushq	%r14
	.cfi_def_cfa_offset 24
	pushq	%r12
	.cfi_def_cfa_offset 32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	pushq	%rax
	.cfi_def_cfa_offset 48
	.cfi_offset %rbx, -40
	.cfi_offset %r12, -32
	.cfi_offset %r14, -24
	.cfi_offset %r15, -16
	movq	%rdi, %r14
	movzwl	4(%rdi), %r15d
	leal	1(%r15), %edx
	movw	%dx, 4(%rdi)
	movq	16(%rdi), %rcx
	testq	%rcx, %rcx
	je	.LBB162_1
# %bb.2:
	movl	$24, %ebx
	xorl	%eax, %eax
	xorl	%r12d, %r12d
	jmp	.LBB162_3
	.p2align	4, 0x90
.LBB162_6:                              #   in Loop: Header=BB162_3 Depth=1
	addq	$1, %r12
	addq	$32, %rbx
	cmpq	%rcx, %r12
	jae	.LBB162_7
.LBB162_3:                              # =>This Inner Loop Header: Depth=1
	movq	8(%r14), %rdx
	movzwl	-8(%rdx,%rbx), %esi
	cmpw	%si, %r15w
	jb	.LBB162_6
# %bb.4:                                #   in Loop: Header=BB162_3 Depth=1
	movzwl	-6(%rdx,%rbx), %edi
	addl	%esi, %edi
	cmpl	%r15d, %edi
	jbe	.LBB162_6
# %bb.5:                                #   in Loop: Header=BB162_3 Depth=1
	movq	(%rdx,%rbx), %rdi
	movl	%r15d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbx)
                                        # kill: def $al killed $al def $rax
	movq	16(%r14), %rcx
	jmp	.LBB162_6
.LBB162_7:
	movzwl	4(%r14), %edx
	testb	$2, 6(%r14)
	je	.LBB162_10
.LBB162_9:
	movsbl	%al, %eax
	addl	%eax, %edx
	movw	%dx, 4(%r14)
.LBB162_10:
	movl	$2, %eax
	addq	$8, %rsp
	.cfi_def_cfa_offset 40
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%r12
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	retq
.LBB162_1:
	.cfi_def_cfa_offset 48
	xorl	%eax, %eax
	testb	$2, 6(%r14)
	jne	.LBB162_9
	jmp	.LBB162_10
.Lfunc_end162:
	.size	BZS, .Lfunc_end162-BZS
	.cfi_endproc
                                        # -- End function
	.globl	BVC                     # -- Begin function BVC
	.p2align	4, 0x90
	.type	BVC,@function
BVC:                                    # @BVC
	.cfi_startproc
# %bb.0:
	pushq	%r15
	.cfi_def_cfa_offset 16
	pushq	%r14
	.cfi_def_cfa_offset 24
	pushq	%r12
	.cfi_def_cfa_offset 32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	pushq	%rax
	.cfi_def_cfa_offset 48
	.cfi_offset %rbx, -40
	.cfi_offset %r12, -32
	.cfi_offset %r14, -24
	.cfi_offset %r15, -16
	movq	%rdi, %r14
	movzwl	4(%rdi), %r15d
	leal	1(%r15), %edx
	movw	%dx, 4(%rdi)
	movq	16(%rdi), %rcx
	testq	%rcx, %rcx
	je	.LBB163_1
# %bb.2:
	movl	$24, %ebx
	xorl	%eax, %eax
	xorl	%r12d, %r12d
	jmp	.LBB163_3
	.p2align	4, 0x90
.LBB163_6:                              #   in Loop: Header=BB163_3 Depth=1
	addq	$1, %r12
	addq	$32, %rbx
	cmpq	%rcx, %r12
	jae	.LBB163_7
.LBB163_3:                              # =>This Inner Loop Header: Depth=1
	movq	8(%r14), %rdx
	movzwl	-8(%rdx,%rbx), %esi
	cmpw	%si, %r15w
	jb	.LBB163_6
# %bb.4:                                #   in Loop: Header=BB163_3 Depth=1
	movzwl	-6(%rdx,%rbx), %edi
	addl	%esi, %edi
	cmpl	%r15d, %edi
	jbe	.LBB163_6
# %bb.5:                                #   in Loop: Header=BB163_3 Depth=1
	movq	(%rdx,%rbx), %rdi
	movl	%r15d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbx)
                                        # kill: def $al killed $al def $rax
	movq	16(%r14), %rcx
	jmp	.LBB163_6
.LBB163_7:
	movzwl	4(%r14), %edx
	testb	$64, 6(%r14)
	jne	.LBB163_10
.LBB163_9:
	movsbl	%al, %eax
	addl	%eax, %edx
	movw	%dx, 4(%r14)
.LBB163_10:
	movl	$2, %eax
	addq	$8, %rsp
	.cfi_def_cfa_offset 40
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%r12
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	retq
.LBB163_1:
	.cfi_def_cfa_offset 48
	xorl	%eax, %eax
	testb	$64, 6(%r14)
	je	.LBB163_9
	jmp	.LBB163_10
.Lfunc_end163:
	.size	BVC, .Lfunc_end163-BVC
	.cfi_endproc
                                        # -- End function
	.globl	BVS                     # -- Begin function BVS
	.p2align	4, 0x90
	.type	BVS,@function
BVS:                                    # @BVS
	.cfi_startproc
# %bb.0:
	pushq	%r15
	.cfi_def_cfa_offset 16
	pushq	%r14
	.cfi_def_cfa_offset 24
	pushq	%r12
	.cfi_def_cfa_offset 32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	pushq	%rax
	.cfi_def_cfa_offset 48
	.cfi_offset %rbx, -40
	.cfi_offset %r12, -32
	.cfi_offset %r14, -24
	.cfi_offset %r15, -16
	movq	%rdi, %r14
	movzwl	4(%rdi), %r15d
	leal	1(%r15), %edx
	movw	%dx, 4(%rdi)
	movq	16(%rdi), %rcx
	testq	%rcx, %rcx
	je	.LBB164_1
# %bb.2:
	movl	$24, %ebx
	xorl	%eax, %eax
	xorl	%r12d, %r12d
	jmp	.LBB164_3
	.p2align	4, 0x90
.LBB164_6:                              #   in Loop: Header=BB164_3 Depth=1
	addq	$1, %r12
	addq	$32, %rbx
	cmpq	%rcx, %r12
	jae	.LBB164_7
.LBB164_3:                              # =>This Inner Loop Header: Depth=1
	movq	8(%r14), %rdx
	movzwl	-8(%rdx,%rbx), %esi
	cmpw	%si, %r15w
	jb	.LBB164_6
# %bb.4:                                #   in Loop: Header=BB164_3 Depth=1
	movzwl	-6(%rdx,%rbx), %edi
	addl	%esi, %edi
	cmpl	%r15d, %edi
	jbe	.LBB164_6
# %bb.5:                                #   in Loop: Header=BB164_3 Depth=1
	movq	(%rdx,%rbx), %rdi
	movl	%r15d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbx)
                                        # kill: def $al killed $al def $rax
	movq	16(%r14), %rcx
	jmp	.LBB164_6
.LBB164_7:
	movzwl	4(%r14), %edx
	testb	$64, 6(%r14)
	je	.LBB164_10
.LBB164_9:
	movsbl	%al, %eax
	addl	%eax, %edx
	movw	%dx, 4(%r14)
.LBB164_10:
	movl	$2, %eax
	addq	$8, %rsp
	.cfi_def_cfa_offset 40
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%r12
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	retq
.LBB164_1:
	.cfi_def_cfa_offset 48
	xorl	%eax, %eax
	testb	$64, 6(%r14)
	jne	.LBB164_9
	jmp	.LBB164_10
.Lfunc_end164:
	.size	BVS, .Lfunc_end164-BVS
	.cfi_endproc
                                        # -- End function
	.globl	BNC                     # -- Begin function BNC
	.p2align	4, 0x90
	.type	BNC,@function
BNC:                                    # @BNC
	.cfi_startproc
# %bb.0:
	pushq	%r15
	.cfi_def_cfa_offset 16
	pushq	%r14
	.cfi_def_cfa_offset 24
	pushq	%r12
	.cfi_def_cfa_offset 32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	pushq	%rax
	.cfi_def_cfa_offset 48
	.cfi_offset %rbx, -40
	.cfi_offset %r12, -32
	.cfi_offset %r14, -24
	.cfi_offset %r15, -16
	movq	%rdi, %r14
	movzwl	4(%rdi), %r15d
	leal	1(%r15), %edx
	movw	%dx, 4(%rdi)
	movq	16(%rdi), %rcx
	testq	%rcx, %rcx
	je	.LBB165_1
# %bb.2:
	movl	$24, %ebx
	xorl	%eax, %eax
	xorl	%r12d, %r12d
	jmp	.LBB165_3
	.p2align	4, 0x90
.LBB165_6:                              #   in Loop: Header=BB165_3 Depth=1
	addq	$1, %r12
	addq	$32, %rbx
	cmpq	%rcx, %r12
	jae	.LBB165_7
.LBB165_3:                              # =>This Inner Loop Header: Depth=1
	movq	8(%r14), %rdx
	movzwl	-8(%rdx,%rbx), %esi
	cmpw	%si, %r15w
	jb	.LBB165_6
# %bb.4:                                #   in Loop: Header=BB165_3 Depth=1
	movzwl	-6(%rdx,%rbx), %edi
	addl	%esi, %edi
	cmpl	%r15d, %edi
	jbe	.LBB165_6
# %bb.5:                                #   in Loop: Header=BB165_3 Depth=1
	movq	(%rdx,%rbx), %rdi
	movl	%r15d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbx)
                                        # kill: def $al killed $al def $rax
	movq	16(%r14), %rcx
	jmp	.LBB165_6
.LBB165_7:
	movzwl	4(%r14), %edx
	cmpb	$0, 6(%r14)
	js	.LBB165_10
.LBB165_9:
	movsbl	%al, %eax
	addl	%eax, %edx
	movw	%dx, 4(%r14)
.LBB165_10:
	movl	$2, %eax
	addq	$8, %rsp
	.cfi_def_cfa_offset 40
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%r12
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	retq
.LBB165_1:
	.cfi_def_cfa_offset 48
	xorl	%eax, %eax
	cmpb	$0, 6(%r14)
	jns	.LBB165_9
	jmp	.LBB165_10
.Lfunc_end165:
	.size	BNC, .Lfunc_end165-BNC
	.cfi_endproc
                                        # -- End function
	.globl	BNS                     # -- Begin function BNS
	.p2align	4, 0x90
	.type	BNS,@function
BNS:                                    # @BNS
	.cfi_startproc
# %bb.0:
	pushq	%r15
	.cfi_def_cfa_offset 16
	pushq	%r14
	.cfi_def_cfa_offset 24
	pushq	%r12
	.cfi_def_cfa_offset 32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	pushq	%rax
	.cfi_def_cfa_offset 48
	.cfi_offset %rbx, -40
	.cfi_offset %r12, -32
	.cfi_offset %r14, -24
	.cfi_offset %r15, -16
	movq	%rdi, %r14
	movzwl	4(%rdi), %r15d
	leal	1(%r15), %edx
	movw	%dx, 4(%rdi)
	movq	16(%rdi), %rcx
	testq	%rcx, %rcx
	je	.LBB166_1
# %bb.2:
	movl	$24, %ebx
	xorl	%eax, %eax
	xorl	%r12d, %r12d
	jmp	.LBB166_3
	.p2align	4, 0x90
.LBB166_6:                              #   in Loop: Header=BB166_3 Depth=1
	addq	$1, %r12
	addq	$32, %rbx
	cmpq	%rcx, %r12
	jae	.LBB166_7
.LBB166_3:                              # =>This Inner Loop Header: Depth=1
	movq	8(%r14), %rdx
	movzwl	-8(%rdx,%rbx), %esi
	cmpw	%si, %r15w
	jb	.LBB166_6
# %bb.4:                                #   in Loop: Header=BB166_3 Depth=1
	movzwl	-6(%rdx,%rbx), %edi
	addl	%esi, %edi
	cmpl	%r15d, %edi
	jbe	.LBB166_6
# %bb.5:                                #   in Loop: Header=BB166_3 Depth=1
	movq	(%rdx,%rbx), %rdi
	movl	%r15d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbx)
                                        # kill: def $al killed $al def $rax
	movq	16(%r14), %rcx
	jmp	.LBB166_6
.LBB166_7:
	movzwl	4(%r14), %edx
	cmpb	$0, 6(%r14)
	jns	.LBB166_10
.LBB166_9:
	movsbl	%al, %eax
	addl	%eax, %edx
	movw	%dx, 4(%r14)
.LBB166_10:
	movl	$2, %eax
	addq	$8, %rsp
	.cfi_def_cfa_offset 40
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%r12
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	retq
.LBB166_1:
	.cfi_def_cfa_offset 48
	xorl	%eax, %eax
	cmpb	$0, 6(%r14)
	jns	.LBB166_10
	jmp	.LBB166_9
.Lfunc_end166:
	.size	BNS, .Lfunc_end166-BNS
	.cfi_endproc
                                        # -- End function
	.globl	INC_zpg                 # -- Begin function INC_zpg
	.p2align	4, 0x90
	.type	INC_zpg,@function
INC_zpg:                                # @INC_zpg
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r13
	.cfi_def_cfa_offset 40
	pushq	%r12
	.cfi_def_cfa_offset 48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	pushq	%rax
	.cfi_def_cfa_offset 64
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%rdi, %r15
	movzwl	4(%rdi), %r14d
	movq	16(%rdi), %rcx
	testq	%rcx, %rcx
	je	.LBB167_1
# %bb.3:
	movl	$24, %ebx
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	jmp	.LBB167_4
	.p2align	4, 0x90
.LBB167_7:                              #   in Loop: Header=BB167_4 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rcx, %rbp
	jae	.LBB167_8
.LBB167_4:                              # =>This Inner Loop Header: Depth=1
	movq	8(%r15), %rdx
	movzwl	-8(%rdx,%rbx), %esi
	cmpw	%si, %r14w
	jb	.LBB167_7
# %bb.5:                                #   in Loop: Header=BB167_4 Depth=1
	movzwl	-6(%rdx,%rbx), %edi
	addl	%esi, %edi
	cmpl	%r14d, %edi
	jbe	.LBB167_7
# %bb.6:                                #   in Loop: Header=BB167_4 Depth=1
	movq	(%rdx,%rbx), %rdi
	movl	%r14d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbx)
                                        # kill: def $al killed $al def $rax
	movq	16(%r15), %rcx
	jmp	.LBB167_7
.LBB167_8:
	addw	$1, 4(%r15)
	movzbl	%al, %r12d
	testq	%rcx, %rcx
	je	.LBB167_2
# %bb.9:
	movl	$24, %ebx
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	jmp	.LBB167_10
	.p2align	4, 0x90
.LBB167_13:                             #   in Loop: Header=BB167_10 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rcx, %rbp
	jae	.LBB167_14
.LBB167_10:                             # =>This Inner Loop Header: Depth=1
	movq	8(%r15), %rdx
	movzwl	-8(%rdx,%rbx), %esi
	cmpw	%r12w, %si
	ja	.LBB167_13
# %bb.11:                               #   in Loop: Header=BB167_10 Depth=1
	movzwl	-6(%rdx,%rbx), %edi
	addl	%esi, %edi
	cmpl	%r12d, %edi
	jbe	.LBB167_13
# %bb.12:                               #   in Loop: Header=BB167_10 Depth=1
	movq	(%rdx,%rbx), %rdi
	movzwl	%r12w, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbx)
                                        # kill: def $al killed $al def $rax
	movq	16(%r15), %rcx
	jmp	.LBB167_13
.LBB167_14:
	leaq	6(%r15), %rsi
	incb	%al
	movb	6(%r15), %dl
	js	.LBB167_15
# %bb.17:
	andb	$127, %dl
	movb	%dl, (%rsi)
	testb	%al, %al
	jne	.LBB167_16
# %bb.18:
	orb	$2, %dl
	xorl	%eax, %eax
	movb	%dl, (%rsi)
	testq	%rcx, %rcx
	jne	.LBB167_20
	jmp	.LBB167_25
.LBB167_1:
	addl	$1, %r14d
	movw	%r14w, 4(%r15)
	xorl	%r12d, %r12d
.LBB167_2:
	leaq	6(%r15), %rsi
	movb	6(%r15), %dl
	andb	$127, %dl
	movb	%dl, 6(%r15)
	movb	$1, %al
	xorl	%ecx, %ecx
	andb	$-3, %dl
	movb	%dl, (%rsi)
	testq	%rcx, %rcx
	jne	.LBB167_20
	jmp	.LBB167_25
.LBB167_15:
	orb	$-128, %dl
	movb	%dl, (%rsi)
.LBB167_16:
	andb	$-3, %dl
	movb	%dl, (%rsi)
	testq	%rcx, %rcx
	je	.LBB167_25
.LBB167_20:
	movzwl	%r12w, %r13d
	movl	$24, %ebp
	xorl	%ebx, %ebx
	movzbl	%al, %r14d
	jmp	.LBB167_21
	.p2align	4, 0x90
.LBB167_24:                             #   in Loop: Header=BB167_21 Depth=1
	addq	$1, %rbx
	addq	$32, %rbp
	cmpq	%rcx, %rbx
	jae	.LBB167_25
.LBB167_21:                             # =>This Inner Loop Header: Depth=1
	movq	8(%r15), %rax
	movzwl	-8(%rax,%rbp), %edx
	cmpw	%dx, %r12w
	jb	.LBB167_24
# %bb.22:                               #   in Loop: Header=BB167_21 Depth=1
	movzwl	-6(%rax,%rbp), %esi
	addl	%edx, %esi
	cmpl	%r13d, %esi
	jbe	.LBB167_24
# %bb.23:                               #   in Loop: Header=BB167_21 Depth=1
	movq	(%rax,%rbp), %rdi
	movl	%r13d, %ecx
	subl	%edx, %ecx
	movzwl	%cx, %esi
	movl	%r14d, %edx
	callq	*-16(%rax,%rbp)
	movq	16(%r15), %rcx
	jmp	.LBB167_24
.LBB167_25:
	movl	$5, %eax
	addq	$8, %rsp
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%r12
	.cfi_def_cfa_offset 40
	popq	%r13
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end167:
	.size	INC_zpg, .Lfunc_end167-INC_zpg
	.cfi_endproc
                                        # -- End function
	.globl	INC_zpgx                # -- Begin function INC_zpgx
	.p2align	4, 0x90
	.type	INC_zpgx,@function
INC_zpgx:                               # @INC_zpgx
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r13
	.cfi_def_cfa_offset 40
	pushq	%r12
	.cfi_def_cfa_offset 48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	pushq	%rax
	.cfi_def_cfa_offset 64
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%rdi, %r13
	movzwl	4(%rdi), %r15d
	movq	16(%rdi), %rcx
	testq	%rcx, %rcx
	je	.LBB168_1
# %bb.2:
	movzwl	%r15w, %r14d
	movl	$24, %ebp
	xorl	%eax, %eax
	xorl	%ebx, %ebx
	jmp	.LBB168_3
	.p2align	4, 0x90
.LBB168_6:                              #   in Loop: Header=BB168_3 Depth=1
	addq	$1, %rbx
	addq	$32, %rbp
	cmpq	%rcx, %rbx
	jae	.LBB168_7
.LBB168_3:                              # =>This Inner Loop Header: Depth=1
	movq	8(%r13), %rdx
	movzwl	-8(%rdx,%rbp), %esi
	cmpw	%si, %r15w
	jb	.LBB168_6
# %bb.4:                                #   in Loop: Header=BB168_3 Depth=1
	movzwl	-6(%rdx,%rbp), %edi
	addl	%esi, %edi
	cmpl	%r14d, %edi
	jbe	.LBB168_6
# %bb.5:                                #   in Loop: Header=BB168_3 Depth=1
	movq	(%rdx,%rbp), %rdi
	movl	%r15d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbp)
                                        # kill: def $al killed $al def $rax
	movq	16(%r13), %rcx
	jmp	.LBB168_6
.LBB168_7:
	movzwl	4(%r13), %r15d
	jmp	.LBB168_8
.LBB168_1:
	xorl	%ecx, %ecx
	xorl	%eax, %eax
.LBB168_8:
	addb	1(%r13), %al
	addl	$1, %r15d
	movw	%r15w, 4(%r13)
	movzbl	%al, %r12d
	movzwl	%r12w, %r15d
	testq	%rcx, %rcx
	je	.LBB168_9
# %bb.10:
	movl	$24, %ebp
	xorl	%eax, %eax
	xorl	%ebx, %ebx
	jmp	.LBB168_11
	.p2align	4, 0x90
.LBB168_14:                             #   in Loop: Header=BB168_11 Depth=1
	addq	$1, %rbx
	addq	$32, %rbp
	cmpq	%rcx, %rbx
	jae	.LBB168_15
.LBB168_11:                             # =>This Inner Loop Header: Depth=1
	movq	8(%r13), %rdx
	movzwl	-8(%rdx,%rbp), %esi
	cmpw	%r12w, %si
	ja	.LBB168_14
# %bb.12:                               #   in Loop: Header=BB168_11 Depth=1
	movzwl	-6(%rdx,%rbp), %edi
	addl	%esi, %edi
	cmpl	%r15d, %edi
	jbe	.LBB168_14
# %bb.13:                               #   in Loop: Header=BB168_11 Depth=1
	movq	(%rdx,%rbp), %rdi
	movl	%r15d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbp)
                                        # kill: def $al killed $al def $rax
	movq	16(%r13), %rcx
	jmp	.LBB168_14
.LBB168_15:
	leaq	6(%r13), %rsi
	incb	%al
	movb	6(%r13), %dl
	js	.LBB168_16
# %bb.18:
	andb	$127, %dl
	movb	%dl, (%rsi)
	testb	%al, %al
	jne	.LBB168_17
# %bb.19:
	orb	$2, %dl
	xorl	%eax, %eax
	movb	%dl, (%rsi)
	testq	%rcx, %rcx
	jne	.LBB168_21
	jmp	.LBB168_26
.LBB168_9:
	leaq	6(%r13), %rsi
	movb	6(%r13), %dl
	andb	$127, %dl
	movb	%dl, 6(%r13)
	movb	$1, %al
	xorl	%ecx, %ecx
	andb	$-3, %dl
	movb	%dl, (%rsi)
	testq	%rcx, %rcx
	jne	.LBB168_21
	jmp	.LBB168_26
.LBB168_16:
	orb	$-128, %dl
	movb	%dl, (%rsi)
.LBB168_17:
	andb	$-3, %dl
	movb	%dl, (%rsi)
	testq	%rcx, %rcx
	je	.LBB168_26
.LBB168_21:
	movl	$24, %ebx
	xorl	%ebp, %ebp
	movzbl	%al, %r14d
	jmp	.LBB168_22
	.p2align	4, 0x90
.LBB168_25:                             #   in Loop: Header=BB168_22 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rcx, %rbp
	jae	.LBB168_26
.LBB168_22:                             # =>This Inner Loop Header: Depth=1
	movq	8(%r13), %rax
	movzwl	-8(%rax,%rbx), %edx
	cmpw	%r12w, %dx
	ja	.LBB168_25
# %bb.23:                               #   in Loop: Header=BB168_22 Depth=1
	movzwl	-6(%rax,%rbx), %esi
	addl	%edx, %esi
	cmpl	%r15d, %esi
	jbe	.LBB168_25
# %bb.24:                               #   in Loop: Header=BB168_22 Depth=1
	movq	(%rax,%rbx), %rdi
	movl	%r15d, %ecx
	subl	%edx, %ecx
	movzwl	%cx, %esi
	movl	%r14d, %edx
	callq	*-16(%rax,%rbx)
	movq	16(%r13), %rcx
	jmp	.LBB168_25
.LBB168_26:
	movl	$6, %eax
	addq	$8, %rsp
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%r12
	.cfi_def_cfa_offset 40
	popq	%r13
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end168:
	.size	INC_zpgx, .Lfunc_end168-INC_zpgx
	.cfi_endproc
                                        # -- End function
	.globl	INC_abss                # -- Begin function INC_abss
	.p2align	4, 0x90
	.type	INC_abss,@function
INC_abss:                               # @INC_abss
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r13
	.cfi_def_cfa_offset 40
	pushq	%r12
	.cfi_def_cfa_offset 48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	pushq	%rax
	.cfi_def_cfa_offset 64
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%rdi, %r12
	movzwl	4(%rdi), %r13d
	movq	16(%rdi), %rcx
	testq	%rcx, %rcx
	je	.LBB169_18
# %bb.1:
	movzwl	%r13w, %r14d
	movl	$24, %ebx
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	jmp	.LBB169_3
	.p2align	4, 0x90
.LBB169_2:                              #   in Loop: Header=BB169_3 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rcx, %rbp
	jae	.LBB169_6
.LBB169_3:                              # =>This Inner Loop Header: Depth=1
	movq	8(%r12), %rdx
	movzwl	-8(%rdx,%rbx), %esi
	cmpw	%si, %r13w
	jb	.LBB169_2
# %bb.4:                                #   in Loop: Header=BB169_3 Depth=1
	movzwl	-6(%rdx,%rbx), %edi
	addl	%esi, %edi
	cmpl	%r14d, %edi
	jbe	.LBB169_2
# %bb.5:                                #   in Loop: Header=BB169_3 Depth=1
	movq	(%rdx,%rbx), %rdi
	movl	%r13d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbx)
                                        # kill: def $al killed $al def $rax
	movq	16(%r12), %rcx
	jmp	.LBB169_2
.LBB169_6:
	movzbl	%al, %r15d
	movl	4(%r12), %r13d
	testq	%rcx, %rcx
	je	.LBB169_19
# %bb.7:
	addl	$1, %r13d
	movzwl	%r13w, %r14d
	movl	$24, %ebx
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	jmp	.LBB169_9
	.p2align	4, 0x90
.LBB169_8:                              #   in Loop: Header=BB169_9 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rcx, %rbp
	jae	.LBB169_12
.LBB169_9:                              # =>This Inner Loop Header: Depth=1
	movq	8(%r12), %rdx
	movzwl	-8(%rdx,%rbx), %esi
	cmpw	%si, %r13w
	jb	.LBB169_8
# %bb.10:                               #   in Loop: Header=BB169_9 Depth=1
	movzwl	-6(%rdx,%rbx), %edi
	addl	%esi, %edi
	cmpl	%r14d, %edi
	jbe	.LBB169_8
# %bb.11:                               #   in Loop: Header=BB169_9 Depth=1
	movq	(%rdx,%rbx), %rdi
	movl	%r13d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbx)
                                        # kill: def $al killed $al def $rax
	movq	16(%r12), %rcx
	jmp	.LBB169_8
.LBB169_12:
	movzbl	%al, %eax
	shll	$8, %eax
	movzwl	%r15w, %r15d
	orl	%eax, %r15d
	addw	$2, 4(%r12)
	testq	%rcx, %rcx
	je	.LBB169_20
# %bb.13:
	movzwl	%r15w, %r14d
	movl	$24, %ebx
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	jmp	.LBB169_15
	.p2align	4, 0x90
.LBB169_14:                             #   in Loop: Header=BB169_15 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rcx, %rbp
	jae	.LBB169_29
.LBB169_15:                             # =>This Inner Loop Header: Depth=1
	movq	8(%r12), %rdx
	movzwl	-8(%rdx,%rbx), %esi
	cmpw	%si, %r15w
	jb	.LBB169_14
# %bb.16:                               #   in Loop: Header=BB169_15 Depth=1
	movzwl	-6(%rdx,%rbx), %edi
	addl	%esi, %edi
	cmpl	%r14d, %edi
	jbe	.LBB169_14
# %bb.17:                               #   in Loop: Header=BB169_15 Depth=1
	movq	(%rdx,%rbx), %rdi
	movl	%r15d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbx)
                                        # kill: def $al killed $al def $rax
	movq	16(%r12), %rcx
	jmp	.LBB169_14
.LBB169_18:
	xorl	%r15d, %r15d
.LBB169_19:
	addl	$2, %r13d
	movw	%r13w, 4(%r12)
.LBB169_20:
	leaq	6(%r12), %rsi
	movb	6(%r12), %dl
	andb	$127, %dl
	movb	%dl, 6(%r12)
	movb	$1, %al
	xorl	%ecx, %ecx
.LBB169_21:
	andb	$-3, %dl
	movb	%dl, (%rsi)
	testq	%rcx, %rcx
	je	.LBB169_28
.LBB169_23:
	movzwl	%r15w, %r13d
	movl	$24, %ebp
	xorl	%ebx, %ebx
	movzbl	%al, %r14d
	jmp	.LBB169_25
	.p2align	4, 0x90
.LBB169_24:                             #   in Loop: Header=BB169_25 Depth=1
	addq	$1, %rbx
	addq	$32, %rbp
	cmpq	%rcx, %rbx
	jae	.LBB169_28
.LBB169_25:                             # =>This Inner Loop Header: Depth=1
	movq	8(%r12), %rax
	movzwl	-8(%rax,%rbp), %edx
	cmpw	%dx, %r15w
	jb	.LBB169_24
# %bb.26:                               #   in Loop: Header=BB169_25 Depth=1
	movzwl	-6(%rax,%rbp), %esi
	addl	%edx, %esi
	cmpl	%r13d, %esi
	jbe	.LBB169_24
# %bb.27:                               #   in Loop: Header=BB169_25 Depth=1
	movq	(%rax,%rbp), %rdi
	movl	%r15d, %ecx
	subl	%edx, %ecx
	movzwl	%cx, %esi
	movl	%r14d, %edx
	callq	*-16(%rax,%rbp)
	movq	16(%r12), %rcx
	jmp	.LBB169_24
.LBB169_29:
	leaq	6(%r12), %rsi
	incb	%al
	movb	6(%r12), %dl
	js	.LBB169_32
# %bb.30:
	andb	$127, %dl
	movb	%dl, (%rsi)
	testb	%al, %al
	jne	.LBB169_21
# %bb.31:
	orb	$2, %dl
	xorl	%eax, %eax
	movb	%dl, (%rsi)
	testq	%rcx, %rcx
	jne	.LBB169_23
	jmp	.LBB169_28
.LBB169_32:
	orb	$-128, %dl
	movb	%dl, (%rsi)
	andb	$-3, %dl
	movb	%dl, (%rsi)
	testq	%rcx, %rcx
	jne	.LBB169_23
.LBB169_28:
	movl	$6, %eax
	addq	$8, %rsp
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%r12
	.cfi_def_cfa_offset 40
	popq	%r13
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end169:
	.size	INC_abss, .Lfunc_end169-INC_abss
	.cfi_endproc
                                        # -- End function
	.globl	INC_absx                # -- Begin function INC_absx
	.p2align	4, 0x90
	.type	INC_absx,@function
INC_absx:                               # @INC_absx
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r13
	.cfi_def_cfa_offset 40
	pushq	%r12
	.cfi_def_cfa_offset 48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	pushq	%rax
	.cfi_def_cfa_offset 64
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%rdi, %r13
	movzwl	4(%rdi), %r14d
	movq	16(%rdi), %rcx
	testq	%rcx, %rcx
	je	.LBB170_13
# %bb.1:
	movzwl	%r14w, %r15d
	movl	$24, %ebp
	xorl	%eax, %eax
	xorl	%ebx, %ebx
	jmp	.LBB170_3
	.p2align	4, 0x90
.LBB170_2:                              #   in Loop: Header=BB170_3 Depth=1
	addq	$1, %rbx
	addq	$32, %rbp
	cmpq	%rcx, %rbx
	jae	.LBB170_6
.LBB170_3:                              # =>This Inner Loop Header: Depth=1
	movq	8(%r13), %rdx
	movzwl	-8(%rdx,%rbp), %esi
	cmpw	%si, %r14w
	jb	.LBB170_2
# %bb.4:                                #   in Loop: Header=BB170_3 Depth=1
	movzwl	-6(%rdx,%rbp), %edi
	addl	%esi, %edi
	cmpl	%r15d, %edi
	jbe	.LBB170_2
# %bb.5:                                #   in Loop: Header=BB170_3 Depth=1
	movq	(%rdx,%rbp), %rdi
	movl	%r14d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbp)
                                        # kill: def $al killed $al def $rax
	movq	16(%r13), %rcx
	jmp	.LBB170_2
.LBB170_6:
	movzbl	%al, %r15d
	movl	4(%r13), %r14d
	testq	%rcx, %rcx
	je	.LBB170_14
# %bb.7:
	addl	$1, %r14d
	movzwl	%r14w, %r12d
	movl	$24, %ebp
	xorl	%eax, %eax
	xorl	%ebx, %ebx
	jmp	.LBB170_9
	.p2align	4, 0x90
.LBB170_8:                              #   in Loop: Header=BB170_9 Depth=1
	addq	$1, %rbx
	addq	$32, %rbp
	cmpq	%rcx, %rbx
	jae	.LBB170_12
.LBB170_9:                              # =>This Inner Loop Header: Depth=1
	movq	8(%r13), %rdx
	movzwl	-8(%rdx,%rbp), %esi
	cmpw	%si, %r14w
	jb	.LBB170_8
# %bb.10:                               #   in Loop: Header=BB170_9 Depth=1
	movzwl	-6(%rdx,%rbp), %edi
	addl	%esi, %edi
	cmpl	%r12d, %edi
	jbe	.LBB170_8
# %bb.11:                               #   in Loop: Header=BB170_9 Depth=1
	movq	(%rdx,%rbp), %rdi
	movl	%r14d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbp)
                                        # kill: def $al killed $al def $rax
	movq	16(%r13), %rcx
	jmp	.LBB170_8
.LBB170_12:
	movzwl	4(%r13), %r14d
	jmp	.LBB170_16
.LBB170_13:
	xorl	%ecx, %ecx
	xorl	%r15d, %r15d
	jmp	.LBB170_15
.LBB170_14:
	xorl	%ecx, %ecx
.LBB170_15:
	xorl	%eax, %eax
.LBB170_16:
	movzbl	%al, %eax
	shll	$8, %eax
	movzwl	%r15w, %edx
	orl	%eax, %edx
	movzbl	1(%r13), %r12d
	addl	%edx, %r12d
	addl	$2, %r14d
	movw	%r14w, 4(%r13)
	movzwl	%r12w, %r15d
	testq	%rcx, %rcx
	je	.LBB170_25
# %bb.17:
	movl	$24, %ebp
	xorl	%eax, %eax
	xorl	%ebx, %ebx
	jmp	.LBB170_19
	.p2align	4, 0x90
.LBB170_18:                             #   in Loop: Header=BB170_19 Depth=1
	addq	$1, %rbx
	addq	$32, %rbp
	cmpq	%rcx, %rbx
	jae	.LBB170_22
.LBB170_19:                             # =>This Inner Loop Header: Depth=1
	movq	8(%r13), %rdx
	movzwl	-8(%rdx,%rbp), %esi
	cmpw	%si, %r12w
	jb	.LBB170_18
# %bb.20:                               #   in Loop: Header=BB170_19 Depth=1
	movzwl	-6(%rdx,%rbp), %edi
	addl	%esi, %edi
	cmpl	%r15d, %edi
	jbe	.LBB170_18
# %bb.21:                               #   in Loop: Header=BB170_19 Depth=1
	movq	(%rdx,%rbp), %rdi
	movl	%r12d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbp)
                                        # kill: def $al killed $al def $rax
	movq	16(%r13), %rcx
	jmp	.LBB170_18
.LBB170_22:
	leaq	6(%r13), %rsi
	incb	%al
	movb	6(%r13), %dl
	js	.LBB170_26
# %bb.23:
	andb	$127, %dl
	movb	%dl, (%rsi)
	testb	%al, %al
	jne	.LBB170_27
# %bb.24:
	orb	$2, %dl
	xorl	%eax, %eax
	movb	%dl, (%rsi)
	testq	%rcx, %rcx
	jne	.LBB170_28
	jmp	.LBB170_33
.LBB170_25:
	leaq	6(%r13), %rsi
	movb	6(%r13), %dl
	andb	$127, %dl
	movb	%dl, 6(%r13)
	movb	$1, %al
	xorl	%ecx, %ecx
	andb	$-3, %dl
	movb	%dl, (%rsi)
	testq	%rcx, %rcx
	jne	.LBB170_28
	jmp	.LBB170_33
.LBB170_26:
	orb	$-128, %dl
	movb	%dl, (%rsi)
.LBB170_27:
	andb	$-3, %dl
	movb	%dl, (%rsi)
	testq	%rcx, %rcx
	je	.LBB170_33
.LBB170_28:
	movl	$24, %ebx
	xorl	%ebp, %ebp
	movzbl	%al, %r14d
	jmp	.LBB170_30
	.p2align	4, 0x90
.LBB170_29:                             #   in Loop: Header=BB170_30 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rcx, %rbp
	jae	.LBB170_33
.LBB170_30:                             # =>This Inner Loop Header: Depth=1
	movq	8(%r13), %rax
	movzwl	-8(%rax,%rbx), %edx
	cmpw	%dx, %r12w
	jb	.LBB170_29
# %bb.31:                               #   in Loop: Header=BB170_30 Depth=1
	movzwl	-6(%rax,%rbx), %esi
	addl	%edx, %esi
	cmpl	%r15d, %esi
	jbe	.LBB170_29
# %bb.32:                               #   in Loop: Header=BB170_30 Depth=1
	movq	(%rax,%rbx), %rdi
	movl	%r12d, %ecx
	subl	%edx, %ecx
	movzwl	%cx, %esi
	movl	%r14d, %edx
	callq	*-16(%rax,%rbx)
	movq	16(%r13), %rcx
	jmp	.LBB170_29
.LBB170_33:
	movl	$7, %eax
	addq	$8, %rsp
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%r12
	.cfi_def_cfa_offset 40
	popq	%r13
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end170:
	.size	INC_absx, .Lfunc_end170-INC_absx
	.cfi_endproc
                                        # -- End function
	.globl	INX                     # -- Begin function INX
	.p2align	4, 0x90
	.type	INX,@function
INX:                                    # @INX
	.cfi_startproc
# %bb.0:
	movb	1(%rdi), %cl
	movb	6(%rdi), %al
	incb	%cl
	movb	%cl, 1(%rdi)
	js	.LBB171_1
# %bb.3:
	andb	$127, %al
	movb	%al, 6(%rdi)
	testb	%cl, %cl
	jne	.LBB171_2
# %bb.4:
	orb	$2, %al
	movb	%al, 6(%rdi)
	movl	$2, %eax
	retq
.LBB171_1:
	orb	$-128, %al
	movb	%al, 6(%rdi)
.LBB171_2:
	andb	$-3, %al
	movb	%al, 6(%rdi)
	movl	$2, %eax
	retq
.Lfunc_end171:
	.size	INX, .Lfunc_end171-INX
	.cfi_endproc
                                        # -- End function
	.globl	INY                     # -- Begin function INY
	.p2align	4, 0x90
	.type	INY,@function
INY:                                    # @INY
	.cfi_startproc
# %bb.0:
	movb	2(%rdi), %cl
	movb	6(%rdi), %al
	incb	%cl
	movb	%cl, 2(%rdi)
	js	.LBB172_1
# %bb.3:
	andb	$127, %al
	movb	%al, 6(%rdi)
	testb	%cl, %cl
	jne	.LBB172_2
# %bb.4:
	orb	$2, %al
	movb	%al, 6(%rdi)
	movl	$2, %eax
	retq
.LBB172_1:
	orb	$-128, %al
	movb	%al, 6(%rdi)
.LBB172_2:
	andb	$-3, %al
	movb	%al, 6(%rdi)
	movl	$2, %eax
	retq
.Lfunc_end172:
	.size	INY, .Lfunc_end172-INY
	.cfi_endproc
                                        # -- End function
	.globl	DEC_zpg                 # -- Begin function DEC_zpg
	.p2align	4, 0x90
	.type	DEC_zpg,@function
DEC_zpg:                                # @DEC_zpg
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r13
	.cfi_def_cfa_offset 40
	pushq	%r12
	.cfi_def_cfa_offset 48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	pushq	%rax
	.cfi_def_cfa_offset 64
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%rdi, %r12
	movzwl	4(%rdi), %r14d
	movq	16(%rdi), %rcx
	testq	%rcx, %rcx
	je	.LBB173_1
# %bb.3:
	movl	$24, %ebx
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	jmp	.LBB173_4
	.p2align	4, 0x90
.LBB173_7:                              #   in Loop: Header=BB173_4 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rcx, %rbp
	jae	.LBB173_8
.LBB173_4:                              # =>This Inner Loop Header: Depth=1
	movq	8(%r12), %rdx
	movzwl	-8(%rdx,%rbx), %esi
	cmpw	%si, %r14w
	jb	.LBB173_7
# %bb.5:                                #   in Loop: Header=BB173_4 Depth=1
	movzwl	-6(%rdx,%rbx), %edi
	addl	%esi, %edi
	cmpl	%r14d, %edi
	jbe	.LBB173_7
# %bb.6:                                #   in Loop: Header=BB173_4 Depth=1
	movq	(%rdx,%rbx), %rdi
	movl	%r14d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbx)
                                        # kill: def $al killed $al def $rax
	movq	16(%r12), %rcx
	jmp	.LBB173_7
.LBB173_8:
	addw	$1, 4(%r12)
	testq	%rcx, %rcx
	je	.LBB173_2
# %bb.9:
	movzbl	%al, %r13d
	movl	$24, %ebx
	xorl	%r14d, %r14d
	xorl	%ebp, %ebp
	jmp	.LBB173_10
	.p2align	4, 0x90
.LBB173_13:                             #   in Loop: Header=BB173_10 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rcx, %rbp
	jae	.LBB173_14
.LBB173_10:                             # =>This Inner Loop Header: Depth=1
	movq	8(%r12), %rdx
	movzwl	-8(%rdx,%rbx), %eax
	cmpw	%r13w, %ax
	ja	.LBB173_13
# %bb.11:                               #   in Loop: Header=BB173_10 Depth=1
	movzwl	-6(%rdx,%rbx), %esi
	addl	%eax, %esi
	cmpl	%r13d, %esi
	jbe	.LBB173_13
# %bb.12:                               #   in Loop: Header=BB173_10 Depth=1
	movq	(%rdx,%rbx), %rdi
	movzwl	%r13w, %ecx
	subl	%eax, %ecx
	movzwl	%cx, %esi
	callq	*-24(%rdx,%rbx)
	movl	%eax, %r14d
	movq	16(%r12), %rcx
	jmp	.LBB173_13
.LBB173_14:
	addb	$-1, %r14b
	testq	%rcx, %rcx
	je	.LBB173_20
# %bb.15:
	movl	$24, %ebx
	xorl	%ebp, %ebp
	movzwl	%r13w, %eax
	movl	%eax, 4(%rsp)           # 4-byte Spill
	movzbl	%r14b, %r15d
	jmp	.LBB173_16
	.p2align	4, 0x90
.LBB173_19:                             #   in Loop: Header=BB173_16 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rcx, %rbp
	jae	.LBB173_20
.LBB173_16:                             # =>This Inner Loop Header: Depth=1
	movq	8(%r12), %rax
	movzwl	-8(%rax,%rbx), %edx
	cmpw	%r13w, %dx
	ja	.LBB173_19
# %bb.17:                               #   in Loop: Header=BB173_16 Depth=1
	movzwl	-6(%rax,%rbx), %esi
	addl	%edx, %esi
	cmpl	%r13d, %esi
	jbe	.LBB173_19
# %bb.18:                               #   in Loop: Header=BB173_16 Depth=1
	movq	(%rax,%rbx), %rdi
	movl	4(%rsp), %ecx           # 4-byte Reload
	subl	%edx, %ecx
	movzwl	%cx, %esi
	movl	%r15d, %edx
	callq	*-16(%rax,%rbx)
	movq	16(%r12), %rcx
	jmp	.LBB173_19
.LBB173_20:
	movb	6(%r12), %al
	addq	$6, %r12
	testb	%r14b, %r14b
	js	.LBB173_21
# %bb.23:
	andb	$127, %al
	movb	%al, (%r12)
	testb	%r14b, %r14b
	jne	.LBB173_22
# %bb.24:
	orb	$2, %al
	jmp	.LBB173_25
.LBB173_1:
	addl	$1, %r14d
	movw	%r14w, 4(%r12)
.LBB173_2:
	movb	6(%r12), %al
	addq	$6, %r12
.LBB173_21:
	orb	$-128, %al
	movb	%al, (%r12)
.LBB173_22:
	andb	$-3, %al
.LBB173_25:
	movb	%al, (%r12)
	movl	$5, %eax
	addq	$8, %rsp
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%r12
	.cfi_def_cfa_offset 40
	popq	%r13
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end173:
	.size	DEC_zpg, .Lfunc_end173-DEC_zpg
	.cfi_endproc
                                        # -- End function
	.globl	DEC_zpgx                # -- Begin function DEC_zpgx
	.p2align	4, 0x90
	.type	DEC_zpgx,@function
DEC_zpgx:                               # @DEC_zpgx
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r13
	.cfi_def_cfa_offset 40
	pushq	%r12
	.cfi_def_cfa_offset 48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	pushq	%rax
	.cfi_def_cfa_offset 64
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%rdi, %r13
	movzwl	4(%rdi), %r15d
	movq	16(%rdi), %rcx
	testq	%rcx, %rcx
	je	.LBB174_1
# %bb.2:
	movzwl	%r15w, %r14d
	movl	$24, %ebx
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	jmp	.LBB174_3
	.p2align	4, 0x90
.LBB174_6:                              #   in Loop: Header=BB174_3 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rcx, %rbp
	jae	.LBB174_7
.LBB174_3:                              # =>This Inner Loop Header: Depth=1
	movq	8(%r13), %rdx
	movzwl	-8(%rdx,%rbx), %esi
	cmpw	%si, %r15w
	jb	.LBB174_6
# %bb.4:                                #   in Loop: Header=BB174_3 Depth=1
	movzwl	-6(%rdx,%rbx), %edi
	addl	%esi, %edi
	cmpl	%r14d, %edi
	jbe	.LBB174_6
# %bb.5:                                #   in Loop: Header=BB174_3 Depth=1
	movq	(%rdx,%rbx), %rdi
	movl	%r15d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbx)
                                        # kill: def $al killed $al def $rax
	movq	16(%r13), %rcx
	jmp	.LBB174_6
.LBB174_7:
	movzwl	4(%r13), %r15d
	jmp	.LBB174_8
.LBB174_1:
	xorl	%ecx, %ecx
	xorl	%eax, %eax
.LBB174_8:
	addb	1(%r13), %al
	addl	$1, %r15d
	movw	%r15w, 4(%r13)
	testq	%rcx, %rcx
	je	.LBB174_9
# %bb.10:
	movzbl	%al, %r15d
	movzwl	%r15w, %r12d
	movl	$24, %ebx
	xorl	%r14d, %r14d
	xorl	%ebp, %ebp
	jmp	.LBB174_11
	.p2align	4, 0x90
.LBB174_14:                             #   in Loop: Header=BB174_11 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rcx, %rbp
	jae	.LBB174_15
.LBB174_11:                             # =>This Inner Loop Header: Depth=1
	movq	8(%r13), %rdx
	movzwl	-8(%rdx,%rbx), %eax
	cmpw	%r15w, %ax
	ja	.LBB174_14
# %bb.12:                               #   in Loop: Header=BB174_11 Depth=1
	movzwl	-6(%rdx,%rbx), %esi
	addl	%eax, %esi
	cmpl	%r12d, %esi
	jbe	.LBB174_14
# %bb.13:                               #   in Loop: Header=BB174_11 Depth=1
	movq	(%rdx,%rbx), %rdi
	movl	%r12d, %ecx
	subl	%eax, %ecx
	movzwl	%cx, %esi
	callq	*-24(%rdx,%rbx)
	movl	%eax, %r14d
	movq	16(%r13), %rcx
	jmp	.LBB174_14
.LBB174_15:
	addb	$-1, %r14b
	testq	%rcx, %rcx
	je	.LBB174_21
# %bb.16:
	movl	$24, %ebp
	xorl	%ebx, %ebx
	movzbl	%r14b, %eax
	movl	%eax, 4(%rsp)           # 4-byte Spill
	jmp	.LBB174_17
	.p2align	4, 0x90
.LBB174_20:                             #   in Loop: Header=BB174_17 Depth=1
	addq	$1, %rbx
	addq	$32, %rbp
	cmpq	%rcx, %rbx
	jae	.LBB174_21
.LBB174_17:                             # =>This Inner Loop Header: Depth=1
	movq	8(%r13), %rax
	movzwl	-8(%rax,%rbp), %edx
	cmpw	%r15w, %dx
	ja	.LBB174_20
# %bb.18:                               #   in Loop: Header=BB174_17 Depth=1
	movzwl	-6(%rax,%rbp), %esi
	addl	%edx, %esi
	cmpl	%r12d, %esi
	jbe	.LBB174_20
# %bb.19:                               #   in Loop: Header=BB174_17 Depth=1
	movq	(%rax,%rbp), %rdi
	movl	%r12d, %ecx
	subl	%edx, %ecx
	movzwl	%cx, %esi
	movl	4(%rsp), %edx           # 4-byte Reload
	callq	*-16(%rax,%rbp)
	movq	16(%r13), %rcx
	jmp	.LBB174_20
.LBB174_21:
	movb	6(%r13), %al
	addq	$6, %r13
	testb	%r14b, %r14b
	js	.LBB174_22
# %bb.24:
	andb	$127, %al
	movb	%al, (%r13)
	testb	%r14b, %r14b
	jne	.LBB174_23
# %bb.25:
	orb	$2, %al
	jmp	.LBB174_26
.LBB174_9:
	movb	6(%r13), %al
	addq	$6, %r13
.LBB174_22:
	orb	$-128, %al
	movb	%al, (%r13)
.LBB174_23:
	andb	$-3, %al
.LBB174_26:
	movb	%al, (%r13)
	movl	$6, %eax
	addq	$8, %rsp
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%r12
	.cfi_def_cfa_offset 40
	popq	%r13
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end174:
	.size	DEC_zpgx, .Lfunc_end174-DEC_zpgx
	.cfi_endproc
                                        # -- End function
	.globl	DEC_abss                # -- Begin function DEC_abss
	.p2align	4, 0x90
	.type	DEC_abss,@function
DEC_abss:                               # @DEC_abss
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r13
	.cfi_def_cfa_offset 40
	pushq	%r12
	.cfi_def_cfa_offset 48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	pushq	%rax
	.cfi_def_cfa_offset 64
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%rdi, %r13
	movzwl	4(%rdi), %r12d
	movq	16(%rdi), %rcx
	testq	%rcx, %rcx
	je	.LBB175_31
# %bb.1:
	movzwl	%r12w, %r14d
	movl	$24, %ebx
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	jmp	.LBB175_2
	.p2align	4, 0x90
.LBB175_5:                              #   in Loop: Header=BB175_2 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rcx, %rbp
	jae	.LBB175_6
.LBB175_2:                              # =>This Inner Loop Header: Depth=1
	movq	8(%r13), %rdx
	movzwl	-8(%rdx,%rbx), %esi
	cmpw	%si, %r12w
	jb	.LBB175_5
# %bb.3:                                #   in Loop: Header=BB175_2 Depth=1
	movzwl	-6(%rdx,%rbx), %edi
	addl	%esi, %edi
	cmpl	%r14d, %edi
	jbe	.LBB175_5
# %bb.4:                                #   in Loop: Header=BB175_2 Depth=1
	movq	(%rdx,%rbx), %rdi
	movl	%r12d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbx)
                                        # kill: def $al killed $al def $rax
	movq	16(%r13), %rcx
	jmp	.LBB175_5
.LBB175_6:
	movl	4(%r13), %r12d
	testq	%rcx, %rcx
	je	.LBB175_31
# %bb.7:
	movzbl	%al, %r14d
	addl	$1, %r12d
	movzwl	%r12w, %r15d
	movl	$24, %ebx
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	jmp	.LBB175_8
	.p2align	4, 0x90
.LBB175_11:                             #   in Loop: Header=BB175_8 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rcx, %rbp
	jae	.LBB175_12
.LBB175_8:                              # =>This Inner Loop Header: Depth=1
	movq	8(%r13), %rdx
	movzwl	-8(%rdx,%rbx), %esi
	cmpw	%si, %r12w
	jb	.LBB175_11
# %bb.9:                                #   in Loop: Header=BB175_8 Depth=1
	movzwl	-6(%rdx,%rbx), %edi
	addl	%esi, %edi
	cmpl	%r15d, %edi
	jbe	.LBB175_11
# %bb.10:                               #   in Loop: Header=BB175_8 Depth=1
	movq	(%rdx,%rbx), %rdi
	movl	%r12d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbx)
                                        # kill: def $al killed $al def $rax
	movq	16(%r13), %rcx
	jmp	.LBB175_11
.LBB175_31:
	addl	$2, %r12d
	movw	%r12w, 4(%r13)
.LBB175_13:
	movb	6(%r13), %al
	addq	$6, %r13
.LBB175_26:
	orb	$-128, %al
	movb	%al, (%r13)
.LBB175_27:
	andb	$-3, %al
.LBB175_30:
	movb	%al, (%r13)
	movl	$6, %eax
	addq	$8, %rsp
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%r12
	.cfi_def_cfa_offset 40
	popq	%r13
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.LBB175_12:
	.cfi_def_cfa_offset 64
	addw	$2, 4(%r13)
	testq	%rcx, %rcx
	je	.LBB175_13
# %bb.14:
	movzbl	%al, %eax
	shll	$8, %eax
	movzwl	%r14w, %r15d
	orl	%eax, %r15d
	movzwl	%r15w, %r12d
	movl	$24, %ebx
	xorl	%r14d, %r14d
	xorl	%ebp, %ebp
	jmp	.LBB175_15
	.p2align	4, 0x90
.LBB175_18:                             #   in Loop: Header=BB175_15 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rcx, %rbp
	jae	.LBB175_19
.LBB175_15:                             # =>This Inner Loop Header: Depth=1
	movq	8(%r13), %rdx
	movzwl	-8(%rdx,%rbx), %eax
	cmpw	%ax, %r15w
	jb	.LBB175_18
# %bb.16:                               #   in Loop: Header=BB175_15 Depth=1
	movzwl	-6(%rdx,%rbx), %esi
	addl	%eax, %esi
	cmpl	%r12d, %esi
	jbe	.LBB175_18
# %bb.17:                               #   in Loop: Header=BB175_15 Depth=1
	movq	(%rdx,%rbx), %rdi
	movl	%r15d, %ecx
	subl	%eax, %ecx
	movzwl	%cx, %esi
	callq	*-24(%rdx,%rbx)
	movl	%eax, %r14d
	movq	16(%r13), %rcx
	jmp	.LBB175_18
.LBB175_19:
	addb	$-1, %r14b
	testq	%rcx, %rcx
	je	.LBB175_25
# %bb.20:
	movl	$24, %ebp
	xorl	%ebx, %ebx
	movzbl	%r14b, %eax
	movl	%eax, 4(%rsp)           # 4-byte Spill
	jmp	.LBB175_21
	.p2align	4, 0x90
.LBB175_24:                             #   in Loop: Header=BB175_21 Depth=1
	addq	$1, %rbx
	addq	$32, %rbp
	cmpq	%rcx, %rbx
	jae	.LBB175_25
.LBB175_21:                             # =>This Inner Loop Header: Depth=1
	movq	8(%r13), %rax
	movzwl	-8(%rax,%rbp), %edx
	cmpw	%dx, %r15w
	jb	.LBB175_24
# %bb.22:                               #   in Loop: Header=BB175_21 Depth=1
	movzwl	-6(%rax,%rbp), %esi
	addl	%edx, %esi
	cmpl	%r12d, %esi
	jbe	.LBB175_24
# %bb.23:                               #   in Loop: Header=BB175_21 Depth=1
	movq	(%rax,%rbp), %rdi
	movl	%r15d, %ecx
	subl	%edx, %ecx
	movzwl	%cx, %esi
	movl	4(%rsp), %edx           # 4-byte Reload
	callq	*-16(%rax,%rbp)
	movq	16(%r13), %rcx
	jmp	.LBB175_24
.LBB175_25:
	movb	6(%r13), %al
	addq	$6, %r13
	testb	%r14b, %r14b
	js	.LBB175_26
# %bb.28:
	andb	$127, %al
	movb	%al, (%r13)
	testb	%r14b, %r14b
	jne	.LBB175_27
# %bb.29:
	orb	$2, %al
	jmp	.LBB175_30
.Lfunc_end175:
	.size	DEC_abss, .Lfunc_end175-DEC_abss
	.cfi_endproc
                                        # -- End function
	.globl	DEC_absx                # -- Begin function DEC_absx
	.p2align	4, 0x90
	.type	DEC_absx,@function
DEC_absx:                               # @DEC_absx
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r13
	.cfi_def_cfa_offset 40
	pushq	%r12
	.cfi_def_cfa_offset 48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	pushq	%rax
	.cfi_def_cfa_offset 64
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%rdi, %r13
	movzwl	4(%rdi), %r12d
	movq	16(%rdi), %rcx
	testq	%rcx, %rcx
	je	.LBB176_13
# %bb.1:
	movzwl	%r12w, %r14d
	movl	$24, %ebx
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	jmp	.LBB176_3
	.p2align	4, 0x90
.LBB176_2:                              #   in Loop: Header=BB176_3 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rcx, %rbp
	jae	.LBB176_6
.LBB176_3:                              # =>This Inner Loop Header: Depth=1
	movq	8(%r13), %rdx
	movzwl	-8(%rdx,%rbx), %esi
	cmpw	%si, %r12w
	jb	.LBB176_2
# %bb.4:                                #   in Loop: Header=BB176_3 Depth=1
	movzwl	-6(%rdx,%rbx), %edi
	addl	%esi, %edi
	cmpl	%r14d, %edi
	jbe	.LBB176_2
# %bb.5:                                #   in Loop: Header=BB176_3 Depth=1
	movq	(%rdx,%rbx), %rdi
	movl	%r12d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbx)
                                        # kill: def $al killed $al def $rax
	movq	16(%r13), %rcx
	jmp	.LBB176_2
.LBB176_6:
	movzbl	%al, %r14d
	movl	4(%r13), %r12d
	testq	%rcx, %rcx
	je	.LBB176_14
# %bb.7:
	addl	$1, %r12d
	movzwl	%r12w, %r15d
	movl	$24, %ebx
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	jmp	.LBB176_9
	.p2align	4, 0x90
.LBB176_8:                              #   in Loop: Header=BB176_9 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rcx, %rbp
	jae	.LBB176_12
.LBB176_9:                              # =>This Inner Loop Header: Depth=1
	movq	8(%r13), %rdx
	movzwl	-8(%rdx,%rbx), %esi
	cmpw	%si, %r12w
	jb	.LBB176_8
# %bb.10:                               #   in Loop: Header=BB176_9 Depth=1
	movzwl	-6(%rdx,%rbx), %edi
	addl	%esi, %edi
	cmpl	%r15d, %edi
	jbe	.LBB176_8
# %bb.11:                               #   in Loop: Header=BB176_9 Depth=1
	movq	(%rdx,%rbx), %rdi
	movl	%r12d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbx)
                                        # kill: def $al killed $al def $rax
	movq	16(%r13), %rcx
	jmp	.LBB176_8
.LBB176_12:
	movzwl	4(%r13), %r12d
	jmp	.LBB176_16
.LBB176_13:
	xorl	%ecx, %ecx
	xorl	%r14d, %r14d
	jmp	.LBB176_15
.LBB176_14:
	xorl	%ecx, %ecx
.LBB176_15:
	xorl	%eax, %eax
.LBB176_16:
	movzbl	1(%r13), %edx
	addl	$2, %r12d
	movw	%r12w, 4(%r13)
	testq	%rcx, %rcx
	je	.LBB176_31
# %bb.17:
	movzbl	%al, %eax
	shll	$8, %eax
	movzwl	%r14w, %r15d
	orl	%eax, %r15d
	addl	%edx, %r15d
	movzwl	%r15w, %r12d
	movl	$24, %ebx
	xorl	%r14d, %r14d
	xorl	%ebp, %ebp
	jmp	.LBB176_19
	.p2align	4, 0x90
.LBB176_18:                             #   in Loop: Header=BB176_19 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rcx, %rbp
	jae	.LBB176_22
.LBB176_19:                             # =>This Inner Loop Header: Depth=1
	movq	8(%r13), %rdx
	movzwl	-8(%rdx,%rbx), %eax
	cmpw	%ax, %r15w
	jb	.LBB176_18
# %bb.20:                               #   in Loop: Header=BB176_19 Depth=1
	movzwl	-6(%rdx,%rbx), %esi
	addl	%eax, %esi
	cmpl	%r12d, %esi
	jbe	.LBB176_18
# %bb.21:                               #   in Loop: Header=BB176_19 Depth=1
	movq	(%rdx,%rbx), %rdi
	movl	%r15d, %ecx
	subl	%eax, %ecx
	movzwl	%cx, %esi
	callq	*-24(%rdx,%rbx)
	movl	%eax, %r14d
	movq	16(%r13), %rcx
	jmp	.LBB176_18
.LBB176_22:
	addb	$-1, %r14b
	testq	%rcx, %rcx
	je	.LBB176_28
# %bb.23:
	movl	$24, %ebp
	xorl	%ebx, %ebx
	movzbl	%r14b, %eax
	movl	%eax, 4(%rsp)           # 4-byte Spill
	jmp	.LBB176_25
	.p2align	4, 0x90
.LBB176_24:                             #   in Loop: Header=BB176_25 Depth=1
	addq	$1, %rbx
	addq	$32, %rbp
	cmpq	%rcx, %rbx
	jae	.LBB176_28
.LBB176_25:                             # =>This Inner Loop Header: Depth=1
	movq	8(%r13), %rax
	movzwl	-8(%rax,%rbp), %edx
	cmpw	%dx, %r15w
	jb	.LBB176_24
# %bb.26:                               #   in Loop: Header=BB176_25 Depth=1
	movzwl	-6(%rax,%rbp), %esi
	addl	%edx, %esi
	cmpl	%r12d, %esi
	jbe	.LBB176_24
# %bb.27:                               #   in Loop: Header=BB176_25 Depth=1
	movq	(%rax,%rbp), %rdi
	movl	%r15d, %ecx
	subl	%edx, %ecx
	movzwl	%cx, %esi
	movl	4(%rsp), %edx           # 4-byte Reload
	callq	*-16(%rax,%rbp)
	movq	16(%r13), %rcx
	jmp	.LBB176_24
.LBB176_28:
	movb	6(%r13), %al
	addq	$6, %r13
	testb	%r14b, %r14b
	js	.LBB176_32
# %bb.29:
	andb	$127, %al
	movb	%al, (%r13)
	testb	%r14b, %r14b
	jne	.LBB176_33
# %bb.30:
	orb	$2, %al
	jmp	.LBB176_34
.LBB176_31:
	movb	6(%r13), %al
	addq	$6, %r13
.LBB176_32:
	orb	$-128, %al
	movb	%al, (%r13)
.LBB176_33:
	andb	$-3, %al
.LBB176_34:
	movb	%al, (%r13)
	movl	$7, %eax
	addq	$8, %rsp
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%r12
	.cfi_def_cfa_offset 40
	popq	%r13
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end176:
	.size	DEC_absx, .Lfunc_end176-DEC_absx
	.cfi_endproc
                                        # -- End function
	.globl	DEX                     # -- Begin function DEX
	.p2align	4, 0x90
	.type	DEX,@function
DEX:                                    # @DEX
	.cfi_startproc
# %bb.0:
	movb	1(%rdi), %cl
	movb	6(%rdi), %al
	addb	$-1, %cl
	movb	%cl, 1(%rdi)
	js	.LBB177_1
# %bb.3:
	andb	$127, %al
	movb	%al, 6(%rdi)
	testb	%cl, %cl
	jne	.LBB177_2
# %bb.4:
	orb	$2, %al
	movb	%al, 6(%rdi)
	movl	$2, %eax
	retq
.LBB177_1:
	orb	$-128, %al
	movb	%al, 6(%rdi)
.LBB177_2:
	andb	$-3, %al
	movb	%al, 6(%rdi)
	movl	$2, %eax
	retq
.Lfunc_end177:
	.size	DEX, .Lfunc_end177-DEX
	.cfi_endproc
                                        # -- End function
	.globl	DEY                     # -- Begin function DEY
	.p2align	4, 0x90
	.type	DEY,@function
DEY:                                    # @DEY
	.cfi_startproc
# %bb.0:
	movb	2(%rdi), %cl
	movb	6(%rdi), %al
	addb	$-1, %cl
	movb	%cl, 2(%rdi)
	js	.LBB178_1
# %bb.3:
	andb	$127, %al
	movb	%al, 6(%rdi)
	testb	%cl, %cl
	jne	.LBB178_2
# %bb.4:
	orb	$2, %al
	movb	%al, 6(%rdi)
	movl	$2, %eax
	retq
.LBB178_1:
	orb	$-128, %al
	movb	%al, 6(%rdi)
.LBB178_2:
	andb	$-3, %al
	movb	%al, 6(%rdi)
	movl	$2, %eax
	retq
.Lfunc_end178:
	.size	DEY, .Lfunc_end178-DEY
	.cfi_endproc
                                        # -- End function
	.globl	DCP_zpg                 # -- Begin function DCP_zpg
	.p2align	4, 0x90
	.type	DCP_zpg,@function
DCP_zpg:                                # @DCP_zpg
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r13
	.cfi_def_cfa_offset 40
	pushq	%r12
	.cfi_def_cfa_offset 48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	pushq	%rax
	.cfi_def_cfa_offset 64
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%rdi, %r15
	movzwl	4(%rdi), %r14d
	movq	16(%rdi), %rcx
	testq	%rcx, %rcx
	je	.LBB179_1
# %bb.2:
	movl	$24, %ebx
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	jmp	.LBB179_3
	.p2align	4, 0x90
.LBB179_6:                              #   in Loop: Header=BB179_3 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rcx, %rbp
	jae	.LBB179_7
.LBB179_3:                              # =>This Inner Loop Header: Depth=1
	movq	8(%r15), %rdx
	movzwl	-8(%rdx,%rbx), %esi
	cmpw	%si, %r14w
	jb	.LBB179_6
# %bb.4:                                #   in Loop: Header=BB179_3 Depth=1
	movzwl	-6(%rdx,%rbx), %edi
	addl	%esi, %edi
	cmpl	%r14d, %edi
	jbe	.LBB179_6
# %bb.5:                                #   in Loop: Header=BB179_3 Depth=1
	movq	(%rdx,%rbx), %rdi
	movl	%r14d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbx)
                                        # kill: def $al killed $al def $rax
	movq	16(%r15), %rcx
	jmp	.LBB179_6
.LBB179_7:
	addw	$1, 4(%r15)
	testq	%rcx, %rcx
	je	.LBB179_19
# %bb.8:
	movzbl	%al, %r12d
	movl	$24, %ebx
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	jmp	.LBB179_9
	.p2align	4, 0x90
.LBB179_12:                             #   in Loop: Header=BB179_9 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rcx, %rbp
	jae	.LBB179_13
.LBB179_9:                              # =>This Inner Loop Header: Depth=1
	movq	8(%r15), %rdx
	movzwl	-8(%rdx,%rbx), %esi
	cmpw	%r12w, %si
	ja	.LBB179_12
# %bb.10:                               #   in Loop: Header=BB179_9 Depth=1
	movzwl	-6(%rdx,%rbx), %edi
	addl	%esi, %edi
	cmpl	%r12d, %edi
	jbe	.LBB179_12
# %bb.11:                               #   in Loop: Header=BB179_9 Depth=1
	movq	(%rdx,%rbx), %rdi
	movzwl	%r12w, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbx)
                                        # kill: def $al killed $al def $rax
	movq	16(%r15), %rcx
	jmp	.LBB179_12
.LBB179_1:
	addl	$1, %r14d
	movw	%r14w, 4(%r15)
	jmp	.LBB179_19
.LBB179_13:
	testq	%rcx, %rcx
	je	.LBB179_19
# %bb.14:
	addb	$-1, %al
	movl	$24, %ebx
	xorl	%ebp, %ebp
	movzwl	%r12w, %r13d
	movzbl	%al, %r14d
	jmp	.LBB179_15
	.p2align	4, 0x90
.LBB179_18:                             #   in Loop: Header=BB179_15 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rcx, %rbp
	jae	.LBB179_19
.LBB179_15:                             # =>This Inner Loop Header: Depth=1
	movq	8(%r15), %rax
	movzwl	-8(%rax,%rbx), %edx
	cmpw	%r12w, %dx
	ja	.LBB179_18
# %bb.16:                               #   in Loop: Header=BB179_15 Depth=1
	movzwl	-6(%rax,%rbx), %esi
	addl	%edx, %esi
	cmpl	%r12d, %esi
	jbe	.LBB179_18
# %bb.17:                               #   in Loop: Header=BB179_15 Depth=1
	movq	(%rax,%rbx), %rdi
	movl	%r13d, %ecx
	subl	%edx, %ecx
	movzwl	%cx, %esi
	movl	%r14d, %edx
	callq	*-16(%rax,%rbx)
	movq	16(%r15), %rcx
	jmp	.LBB179_18
.LBB179_19:
	movb	6(%r15), %al
	movl	%eax, %ecx
	andb	$127, %cl
	orb	$-128, %al
	movzbl	%al, %eax
	movzbl	%cl, %ecx
	movb	(%r15), %dl
	testb	%dl, %dl
	cmovsl	%eax, %ecx
	movl	%ecx, %eax
	andb	$-4, %al
	orb	$2, %cl
	testb	%dl, %dl
	movzbl	%cl, %ecx
	movzbl	%al, %eax
	cmovel	%ecx, %eax
	andb	$-2, %al
	movb	%al, 6(%r15)
	movl	$5, %eax
	addq	$8, %rsp
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%r12
	.cfi_def_cfa_offset 40
	popq	%r13
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end179:
	.size	DCP_zpg, .Lfunc_end179-DCP_zpg
	.cfi_endproc
                                        # -- End function
	.globl	DCP_zpgx                # -- Begin function DCP_zpgx
	.p2align	4, 0x90
	.type	DCP_zpgx,@function
DCP_zpgx:                               # @DCP_zpgx
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r13
	.cfi_def_cfa_offset 40
	pushq	%r12
	.cfi_def_cfa_offset 48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	pushq	%rax
	.cfi_def_cfa_offset 64
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%rdi, %r13
	movzwl	4(%rdi), %r15d
	movq	16(%rdi), %rcx
	testq	%rcx, %rcx
	je	.LBB180_1
# %bb.2:
	movzwl	%r15w, %r14d
	movl	$24, %ebp
	xorl	%eax, %eax
	xorl	%ebx, %ebx
	jmp	.LBB180_3
	.p2align	4, 0x90
.LBB180_6:                              #   in Loop: Header=BB180_3 Depth=1
	addq	$1, %rbx
	addq	$32, %rbp
	cmpq	%rcx, %rbx
	jae	.LBB180_7
.LBB180_3:                              # =>This Inner Loop Header: Depth=1
	movq	8(%r13), %rdx
	movzwl	-8(%rdx,%rbp), %esi
	cmpw	%si, %r15w
	jb	.LBB180_6
# %bb.4:                                #   in Loop: Header=BB180_3 Depth=1
	movzwl	-6(%rdx,%rbp), %edi
	addl	%esi, %edi
	cmpl	%r14d, %edi
	jbe	.LBB180_6
# %bb.5:                                #   in Loop: Header=BB180_3 Depth=1
	movq	(%rdx,%rbp), %rdi
	movl	%r15d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbp)
                                        # kill: def $al killed $al def $rax
	movq	16(%r13), %rcx
	jmp	.LBB180_6
.LBB180_7:
	movzwl	4(%r13), %r15d
	jmp	.LBB180_8
.LBB180_1:
	xorl	%ecx, %ecx
	xorl	%eax, %eax
.LBB180_8:
	addb	1(%r13), %al
	addl	$1, %r15d
	movw	%r15w, 4(%r13)
	testq	%rcx, %rcx
	je	.LBB180_20
# %bb.9:
	movzbl	%al, %r12d
	movzwl	%r12w, %r15d
	movl	$24, %ebp
	xorl	%eax, %eax
	xorl	%ebx, %ebx
	jmp	.LBB180_10
	.p2align	4, 0x90
.LBB180_13:                             #   in Loop: Header=BB180_10 Depth=1
	addq	$1, %rbx
	addq	$32, %rbp
	cmpq	%rcx, %rbx
	jae	.LBB180_14
.LBB180_10:                             # =>This Inner Loop Header: Depth=1
	movq	8(%r13), %rdx
	movzwl	-8(%rdx,%rbp), %esi
	cmpw	%r12w, %si
	ja	.LBB180_13
# %bb.11:                               #   in Loop: Header=BB180_10 Depth=1
	movzwl	-6(%rdx,%rbp), %edi
	addl	%esi, %edi
	cmpl	%r15d, %edi
	jbe	.LBB180_13
# %bb.12:                               #   in Loop: Header=BB180_10 Depth=1
	movq	(%rdx,%rbp), %rdi
	movl	%r15d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbp)
                                        # kill: def $al killed $al def $rax
	movq	16(%r13), %rcx
	jmp	.LBB180_13
.LBB180_14:
	testq	%rcx, %rcx
	je	.LBB180_20
# %bb.15:
	addb	$-1, %al
	movl	$24, %ebx
	xorl	%ebp, %ebp
	movzbl	%al, %r14d
	jmp	.LBB180_16
	.p2align	4, 0x90
.LBB180_19:                             #   in Loop: Header=BB180_16 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rcx, %rbp
	jae	.LBB180_20
.LBB180_16:                             # =>This Inner Loop Header: Depth=1
	movq	8(%r13), %rax
	movzwl	-8(%rax,%rbx), %edx
	cmpw	%r12w, %dx
	ja	.LBB180_19
# %bb.17:                               #   in Loop: Header=BB180_16 Depth=1
	movzwl	-6(%rax,%rbx), %esi
	addl	%edx, %esi
	cmpl	%r15d, %esi
	jbe	.LBB180_19
# %bb.18:                               #   in Loop: Header=BB180_16 Depth=1
	movq	(%rax,%rbx), %rdi
	movl	%r15d, %ecx
	subl	%edx, %ecx
	movzwl	%cx, %esi
	movl	%r14d, %edx
	callq	*-16(%rax,%rbx)
	movq	16(%r13), %rcx
	jmp	.LBB180_19
.LBB180_20:
	movb	6(%r13), %al
	movl	%eax, %ecx
	andb	$127, %cl
	orb	$-128, %al
	movzbl	%al, %eax
	movzbl	%cl, %ecx
	movb	(%r13), %dl
	testb	%dl, %dl
	cmovsl	%eax, %ecx
	movl	%ecx, %eax
	andb	$-4, %al
	orb	$2, %cl
	testb	%dl, %dl
	movzbl	%cl, %ecx
	movzbl	%al, %eax
	cmovel	%ecx, %eax
	andb	$-2, %al
	movb	%al, 6(%r13)
	movl	$6, %eax
	addq	$8, %rsp
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%r12
	.cfi_def_cfa_offset 40
	popq	%r13
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end180:
	.size	DCP_zpgx, .Lfunc_end180-DCP_zpgx
	.cfi_endproc
                                        # -- End function
	.globl	DCP_abss                # -- Begin function DCP_abss
	.p2align	4, 0x90
	.type	DCP_abss,@function
DCP_abss:                               # @DCP_abss
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r13
	.cfi_def_cfa_offset 40
	pushq	%r12
	.cfi_def_cfa_offset 48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	pushq	%rax
	.cfi_def_cfa_offset 64
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%rdi, %r12
	movzwl	4(%rdi), %r13d
	movq	16(%rdi), %rcx
	testq	%rcx, %rcx
	je	.LBB181_25
# %bb.1:
	movzwl	%r13w, %r14d
	movl	$24, %ebx
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	jmp	.LBB181_2
	.p2align	4, 0x90
.LBB181_5:                              #   in Loop: Header=BB181_2 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rcx, %rbp
	jae	.LBB181_6
.LBB181_2:                              # =>This Inner Loop Header: Depth=1
	movq	8(%r12), %rdx
	movzwl	-8(%rdx,%rbx), %esi
	cmpw	%si, %r13w
	jb	.LBB181_5
# %bb.3:                                #   in Loop: Header=BB181_2 Depth=1
	movzwl	-6(%rdx,%rbx), %edi
	addl	%esi, %edi
	cmpl	%r14d, %edi
	jbe	.LBB181_5
# %bb.4:                                #   in Loop: Header=BB181_2 Depth=1
	movq	(%rdx,%rbx), %rdi
	movl	%r13d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbx)
                                        # kill: def $al killed $al def $rax
	movq	16(%r12), %rcx
	jmp	.LBB181_5
.LBB181_6:
	movl	4(%r12), %r13d
	testq	%rcx, %rcx
	je	.LBB181_25
# %bb.7:
	movzbl	%al, %r14d
	addl	$1, %r13d
	movzwl	%r13w, %r15d
	movl	$24, %ebx
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	jmp	.LBB181_8
	.p2align	4, 0x90
.LBB181_11:                             #   in Loop: Header=BB181_8 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rcx, %rbp
	jae	.LBB181_12
.LBB181_8:                              # =>This Inner Loop Header: Depth=1
	movq	8(%r12), %rdx
	movzwl	-8(%rdx,%rbx), %esi
	cmpw	%si, %r13w
	jb	.LBB181_11
# %bb.9:                                #   in Loop: Header=BB181_8 Depth=1
	movzwl	-6(%rdx,%rbx), %edi
	addl	%esi, %edi
	cmpl	%r15d, %edi
	jbe	.LBB181_11
# %bb.10:                               #   in Loop: Header=BB181_8 Depth=1
	movq	(%rdx,%rbx), %rdi
	movl	%r13d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbx)
                                        # kill: def $al killed $al def $rax
	movq	16(%r12), %rcx
	jmp	.LBB181_11
.LBB181_25:
	addl	$2, %r13d
	movw	%r13w, 4(%r12)
.LBB181_24:
	movb	6(%r12), %al
	movl	%eax, %ecx
	andb	$127, %cl
	orb	$-128, %al
	movzbl	%al, %eax
	movzbl	%cl, %ecx
	movb	(%r12), %dl
	testb	%dl, %dl
	cmovsl	%eax, %ecx
	movl	%ecx, %eax
	andb	$-4, %al
	orb	$2, %cl
	testb	%dl, %dl
	movzbl	%cl, %ecx
	movzbl	%al, %eax
	cmovel	%ecx, %eax
	andb	$-2, %al
	movb	%al, 6(%r12)
	movl	$6, %eax
	addq	$8, %rsp
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%r12
	.cfi_def_cfa_offset 40
	popq	%r13
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.LBB181_12:
	.cfi_def_cfa_offset 64
	addw	$2, 4(%r12)
	testq	%rcx, %rcx
	je	.LBB181_24
# %bb.13:
	movzbl	%al, %eax
	shll	$8, %eax
	movzwl	%r14w, %r13d
	orl	%eax, %r13d
	movzwl	%r13w, %r15d
	movl	$24, %ebx
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	jmp	.LBB181_14
	.p2align	4, 0x90
.LBB181_17:                             #   in Loop: Header=BB181_14 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rcx, %rbp
	jae	.LBB181_18
.LBB181_14:                             # =>This Inner Loop Header: Depth=1
	movq	8(%r12), %rdx
	movzwl	-8(%rdx,%rbx), %esi
	cmpw	%si, %r13w
	jb	.LBB181_17
# %bb.15:                               #   in Loop: Header=BB181_14 Depth=1
	movzwl	-6(%rdx,%rbx), %edi
	addl	%esi, %edi
	cmpl	%r15d, %edi
	jbe	.LBB181_17
# %bb.16:                               #   in Loop: Header=BB181_14 Depth=1
	movq	(%rdx,%rbx), %rdi
	movl	%r13d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbx)
                                        # kill: def $al killed $al def $rax
	movq	16(%r12), %rcx
	jmp	.LBB181_17
.LBB181_18:
	testq	%rcx, %rcx
	je	.LBB181_24
# %bb.19:
	addb	$-1, %al
	movl	$24, %ebx
	xorl	%ebp, %ebp
	movzbl	%al, %r14d
	jmp	.LBB181_20
	.p2align	4, 0x90
.LBB181_23:                             #   in Loop: Header=BB181_20 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rcx, %rbp
	jae	.LBB181_24
.LBB181_20:                             # =>This Inner Loop Header: Depth=1
	movq	8(%r12), %rax
	movzwl	-8(%rax,%rbx), %edx
	cmpw	%dx, %r13w
	jb	.LBB181_23
# %bb.21:                               #   in Loop: Header=BB181_20 Depth=1
	movzwl	-6(%rax,%rbx), %esi
	addl	%edx, %esi
	cmpl	%r15d, %esi
	jbe	.LBB181_23
# %bb.22:                               #   in Loop: Header=BB181_20 Depth=1
	movq	(%rax,%rbx), %rdi
	movl	%r13d, %ecx
	subl	%edx, %ecx
	movzwl	%cx, %esi
	movl	%r14d, %edx
	callq	*-16(%rax,%rbx)
	movq	16(%r12), %rcx
	jmp	.LBB181_23
.Lfunc_end181:
	.size	DCP_abss, .Lfunc_end181-DCP_abss
	.cfi_endproc
                                        # -- End function
	.globl	DCP_absx                # -- Begin function DCP_absx
	.p2align	4, 0x90
	.type	DCP_absx,@function
DCP_absx:                               # @DCP_absx
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r13
	.cfi_def_cfa_offset 40
	pushq	%r12
	.cfi_def_cfa_offset 48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	pushq	%rax
	.cfi_def_cfa_offset 64
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%rdi, %r13
	movzwl	4(%rdi), %r12d
	movq	16(%rdi), %rcx
	testq	%rcx, %rcx
	je	.LBB182_13
# %bb.1:
	movzwl	%r12w, %r14d
	movl	$24, %ebp
	xorl	%eax, %eax
	xorl	%ebx, %ebx
	jmp	.LBB182_3
	.p2align	4, 0x90
.LBB182_2:                              #   in Loop: Header=BB182_3 Depth=1
	addq	$1, %rbx
	addq	$32, %rbp
	cmpq	%rcx, %rbx
	jae	.LBB182_6
.LBB182_3:                              # =>This Inner Loop Header: Depth=1
	movq	8(%r13), %rdx
	movzwl	-8(%rdx,%rbp), %esi
	cmpw	%si, %r12w
	jb	.LBB182_2
# %bb.4:                                #   in Loop: Header=BB182_3 Depth=1
	movzwl	-6(%rdx,%rbp), %edi
	addl	%esi, %edi
	cmpl	%r14d, %edi
	jbe	.LBB182_2
# %bb.5:                                #   in Loop: Header=BB182_3 Depth=1
	movq	(%rdx,%rbp), %rdi
	movl	%r12d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbp)
                                        # kill: def $al killed $al def $rax
	movq	16(%r13), %rcx
	jmp	.LBB182_2
.LBB182_6:
	movzbl	%al, %r14d
	movl	4(%r13), %r12d
	testq	%rcx, %rcx
	je	.LBB182_14
# %bb.7:
	addl	$1, %r12d
	movzwl	%r12w, %r15d
	movl	$24, %ebp
	xorl	%eax, %eax
	xorl	%ebx, %ebx
	jmp	.LBB182_9
	.p2align	4, 0x90
.LBB182_8:                              #   in Loop: Header=BB182_9 Depth=1
	addq	$1, %rbx
	addq	$32, %rbp
	cmpq	%rcx, %rbx
	jae	.LBB182_12
.LBB182_9:                              # =>This Inner Loop Header: Depth=1
	movq	8(%r13), %rdx
	movzwl	-8(%rdx,%rbp), %esi
	cmpw	%si, %r12w
	jb	.LBB182_8
# %bb.10:                               #   in Loop: Header=BB182_9 Depth=1
	movzwl	-6(%rdx,%rbp), %edi
	addl	%esi, %edi
	cmpl	%r15d, %edi
	jbe	.LBB182_8
# %bb.11:                               #   in Loop: Header=BB182_9 Depth=1
	movq	(%rdx,%rbp), %rdi
	movl	%r12d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbp)
                                        # kill: def $al killed $al def $rax
	movq	16(%r13), %rcx
	jmp	.LBB182_8
.LBB182_12:
	movzwl	4(%r13), %r12d
	jmp	.LBB182_16
.LBB182_13:
	xorl	%ecx, %ecx
	xorl	%r14d, %r14d
	jmp	.LBB182_15
.LBB182_14:
	xorl	%ecx, %ecx
.LBB182_15:
	xorl	%eax, %eax
.LBB182_16:
	movzbl	1(%r13), %edx
	addl	$2, %r12d
	movw	%r12w, 4(%r13)
	testq	%rcx, %rcx
	je	.LBB182_28
# %bb.17:
	movzbl	%al, %eax
	shll	$8, %eax
	movzwl	%r14w, %r12d
	orl	%eax, %r12d
	addl	%edx, %r12d
	movzwl	%r12w, %r15d
	movl	$24, %ebx
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	jmp	.LBB182_19
	.p2align	4, 0x90
.LBB182_18:                             #   in Loop: Header=BB182_19 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rcx, %rbp
	jae	.LBB182_22
.LBB182_19:                             # =>This Inner Loop Header: Depth=1
	movq	8(%r13), %rdx
	movzwl	-8(%rdx,%rbx), %esi
	cmpw	%si, %r12w
	jb	.LBB182_18
# %bb.20:                               #   in Loop: Header=BB182_19 Depth=1
	movzwl	-6(%rdx,%rbx), %edi
	addl	%esi, %edi
	cmpl	%r15d, %edi
	jbe	.LBB182_18
# %bb.21:                               #   in Loop: Header=BB182_19 Depth=1
	movq	(%rdx,%rbx), %rdi
	movl	%r12d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbx)
                                        # kill: def $al killed $al def $rax
	movq	16(%r13), %rcx
	jmp	.LBB182_18
.LBB182_22:
	testq	%rcx, %rcx
	je	.LBB182_28
# %bb.23:
	addb	$-1, %al
	movl	$24, %ebx
	xorl	%ebp, %ebp
	movzbl	%al, %r14d
	jmp	.LBB182_25
	.p2align	4, 0x90
.LBB182_24:                             #   in Loop: Header=BB182_25 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rcx, %rbp
	jae	.LBB182_28
.LBB182_25:                             # =>This Inner Loop Header: Depth=1
	movq	8(%r13), %rax
	movzwl	-8(%rax,%rbx), %edx
	cmpw	%dx, %r12w
	jb	.LBB182_24
# %bb.26:                               #   in Loop: Header=BB182_25 Depth=1
	movzwl	-6(%rax,%rbx), %esi
	addl	%edx, %esi
	cmpl	%r15d, %esi
	jbe	.LBB182_24
# %bb.27:                               #   in Loop: Header=BB182_25 Depth=1
	movq	(%rax,%rbx), %rdi
	movl	%r12d, %ecx
	subl	%edx, %ecx
	movzwl	%cx, %esi
	movl	%r14d, %edx
	callq	*-16(%rax,%rbx)
	movq	16(%r13), %rcx
	jmp	.LBB182_24
.LBB182_28:
	movb	6(%r13), %al
	movl	%eax, %ecx
	andb	$127, %cl
	orb	$-128, %al
	movzbl	%al, %eax
	movzbl	%cl, %ecx
	movb	(%r13), %dl
	testb	%dl, %dl
	cmovsl	%eax, %ecx
	movl	%ecx, %eax
	andb	$-4, %al
	orb	$2, %cl
	testb	%dl, %dl
	movzbl	%cl, %ecx
	movzbl	%al, %eax
	cmovel	%ecx, %eax
	andb	$-2, %al
	movb	%al, 6(%r13)
	movl	$7, %eax
	addq	$8, %rsp
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%r12
	.cfi_def_cfa_offset 40
	popq	%r13
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end182:
	.size	DCP_absx, .Lfunc_end182-DCP_absx
	.cfi_endproc
                                        # -- End function
	.globl	DCP_absy                # -- Begin function DCP_absy
	.p2align	4, 0x90
	.type	DCP_absy,@function
DCP_absy:                               # @DCP_absy
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r13
	.cfi_def_cfa_offset 40
	pushq	%r12
	.cfi_def_cfa_offset 48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	pushq	%rax
	.cfi_def_cfa_offset 64
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%rdi, %r13
	movzwl	4(%rdi), %r12d
	movq	16(%rdi), %rcx
	testq	%rcx, %rcx
	je	.LBB183_13
# %bb.1:
	movzwl	%r12w, %r14d
	movl	$24, %ebp
	xorl	%eax, %eax
	xorl	%ebx, %ebx
	jmp	.LBB183_3
	.p2align	4, 0x90
.LBB183_2:                              #   in Loop: Header=BB183_3 Depth=1
	addq	$1, %rbx
	addq	$32, %rbp
	cmpq	%rcx, %rbx
	jae	.LBB183_6
.LBB183_3:                              # =>This Inner Loop Header: Depth=1
	movq	8(%r13), %rdx
	movzwl	-8(%rdx,%rbp), %esi
	cmpw	%si, %r12w
	jb	.LBB183_2
# %bb.4:                                #   in Loop: Header=BB183_3 Depth=1
	movzwl	-6(%rdx,%rbp), %edi
	addl	%esi, %edi
	cmpl	%r14d, %edi
	jbe	.LBB183_2
# %bb.5:                                #   in Loop: Header=BB183_3 Depth=1
	movq	(%rdx,%rbp), %rdi
	movl	%r12d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbp)
                                        # kill: def $al killed $al def $rax
	movq	16(%r13), %rcx
	jmp	.LBB183_2
.LBB183_6:
	movzbl	%al, %r14d
	movl	4(%r13), %r12d
	testq	%rcx, %rcx
	je	.LBB183_14
# %bb.7:
	addl	$1, %r12d
	movzwl	%r12w, %r15d
	movl	$24, %ebp
	xorl	%eax, %eax
	xorl	%ebx, %ebx
	jmp	.LBB183_9
	.p2align	4, 0x90
.LBB183_8:                              #   in Loop: Header=BB183_9 Depth=1
	addq	$1, %rbx
	addq	$32, %rbp
	cmpq	%rcx, %rbx
	jae	.LBB183_12
.LBB183_9:                              # =>This Inner Loop Header: Depth=1
	movq	8(%r13), %rdx
	movzwl	-8(%rdx,%rbp), %esi
	cmpw	%si, %r12w
	jb	.LBB183_8
# %bb.10:                               #   in Loop: Header=BB183_9 Depth=1
	movzwl	-6(%rdx,%rbp), %edi
	addl	%esi, %edi
	cmpl	%r15d, %edi
	jbe	.LBB183_8
# %bb.11:                               #   in Loop: Header=BB183_9 Depth=1
	movq	(%rdx,%rbp), %rdi
	movl	%r12d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbp)
                                        # kill: def $al killed $al def $rax
	movq	16(%r13), %rcx
	jmp	.LBB183_8
.LBB183_12:
	movzwl	4(%r13), %r12d
	jmp	.LBB183_16
.LBB183_13:
	xorl	%ecx, %ecx
	xorl	%r14d, %r14d
	jmp	.LBB183_15
.LBB183_14:
	xorl	%ecx, %ecx
.LBB183_15:
	xorl	%eax, %eax
.LBB183_16:
	movzbl	2(%r13), %edx
	addl	$2, %r12d
	movw	%r12w, 4(%r13)
	testq	%rcx, %rcx
	je	.LBB183_28
# %bb.17:
	movzbl	%al, %eax
	shll	$8, %eax
	movzwl	%r14w, %r12d
	orl	%eax, %r12d
	addl	%edx, %r12d
	movzwl	%r12w, %r15d
	movl	$24, %ebx
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	jmp	.LBB183_19
	.p2align	4, 0x90
.LBB183_18:                             #   in Loop: Header=BB183_19 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rcx, %rbp
	jae	.LBB183_22
.LBB183_19:                             # =>This Inner Loop Header: Depth=1
	movq	8(%r13), %rdx
	movzwl	-8(%rdx,%rbx), %esi
	cmpw	%si, %r12w
	jb	.LBB183_18
# %bb.20:                               #   in Loop: Header=BB183_19 Depth=1
	movzwl	-6(%rdx,%rbx), %edi
	addl	%esi, %edi
	cmpl	%r15d, %edi
	jbe	.LBB183_18
# %bb.21:                               #   in Loop: Header=BB183_19 Depth=1
	movq	(%rdx,%rbx), %rdi
	movl	%r12d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbx)
                                        # kill: def $al killed $al def $rax
	movq	16(%r13), %rcx
	jmp	.LBB183_18
.LBB183_22:
	testq	%rcx, %rcx
	je	.LBB183_28
# %bb.23:
	addb	$-1, %al
	movl	$24, %ebx
	xorl	%ebp, %ebp
	movzbl	%al, %r14d
	jmp	.LBB183_25
	.p2align	4, 0x90
.LBB183_24:                             #   in Loop: Header=BB183_25 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rcx, %rbp
	jae	.LBB183_28
.LBB183_25:                             # =>This Inner Loop Header: Depth=1
	movq	8(%r13), %rax
	movzwl	-8(%rax,%rbx), %edx
	cmpw	%dx, %r12w
	jb	.LBB183_24
# %bb.26:                               #   in Loop: Header=BB183_25 Depth=1
	movzwl	-6(%rax,%rbx), %esi
	addl	%edx, %esi
	cmpl	%r15d, %esi
	jbe	.LBB183_24
# %bb.27:                               #   in Loop: Header=BB183_25 Depth=1
	movq	(%rax,%rbx), %rdi
	movl	%r12d, %ecx
	subl	%edx, %ecx
	movzwl	%cx, %esi
	movl	%r14d, %edx
	callq	*-16(%rax,%rbx)
	movq	16(%r13), %rcx
	jmp	.LBB183_24
.LBB183_28:
	movb	6(%r13), %al
	movl	%eax, %ecx
	andb	$127, %cl
	orb	$-128, %al
	movzbl	%al, %eax
	movzbl	%cl, %ecx
	movb	(%r13), %dl
	testb	%dl, %dl
	cmovsl	%eax, %ecx
	movl	%ecx, %eax
	andb	$-4, %al
	orb	$2, %cl
	testb	%dl, %dl
	movzbl	%cl, %ecx
	movzbl	%al, %eax
	cmovel	%ecx, %eax
	andb	$-2, %al
	movb	%al, 6(%r13)
	movl	$7, %eax
	addq	$8, %rsp
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%r12
	.cfi_def_cfa_offset 40
	popq	%r13
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end183:
	.size	DCP_absy, .Lfunc_end183-DCP_absy
	.cfi_endproc
                                        # -- End function
	.globl	DCP_xind                # -- Begin function DCP_xind
	.p2align	4, 0x90
	.type	DCP_xind,@function
DCP_xind:                               # @DCP_xind
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r13
	.cfi_def_cfa_offset 40
	pushq	%r12
	.cfi_def_cfa_offset 48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	pushq	%rax
	.cfi_def_cfa_offset 64
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%rdi, %r13
	callq	xind
	movq	16(%r13), %rcx
	testq	%rcx, %rcx
	je	.LBB184_12
# %bb.1:
	movl	%eax, %r12d
	movzwl	%ax, %r15d
	movl	$24, %ebp
	xorl	%eax, %eax
	xorl	%ebx, %ebx
	jmp	.LBB184_2
	.p2align	4, 0x90
.LBB184_5:                              #   in Loop: Header=BB184_2 Depth=1
	addq	$1, %rbx
	addq	$32, %rbp
	cmpq	%rcx, %rbx
	jae	.LBB184_6
.LBB184_2:                              # =>This Inner Loop Header: Depth=1
	movq	8(%r13), %rdx
	movzwl	-8(%rdx,%rbp), %esi
	cmpw	%si, %r12w
	jb	.LBB184_5
# %bb.3:                                #   in Loop: Header=BB184_2 Depth=1
	movzwl	-6(%rdx,%rbp), %edi
	addl	%esi, %edi
	cmpl	%r15d, %edi
	jbe	.LBB184_5
# %bb.4:                                #   in Loop: Header=BB184_2 Depth=1
	movq	(%rdx,%rbp), %rdi
	movl	%r15d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbp)
                                        # kill: def $al killed $al def $rax
	movq	16(%r13), %rcx
	jmp	.LBB184_5
.LBB184_6:
	testq	%rcx, %rcx
	je	.LBB184_12
# %bb.7:
	addb	$-1, %al
	movl	$24, %ebx
	xorl	%ebp, %ebp
	movzbl	%al, %r14d
	jmp	.LBB184_8
	.p2align	4, 0x90
.LBB184_11:                             #   in Loop: Header=BB184_8 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rcx, %rbp
	jae	.LBB184_12
.LBB184_8:                              # =>This Inner Loop Header: Depth=1
	movq	8(%r13), %rax
	movzwl	-8(%rax,%rbx), %edx
	cmpw	%dx, %r12w
	jb	.LBB184_11
# %bb.9:                                #   in Loop: Header=BB184_8 Depth=1
	movzwl	-6(%rax,%rbx), %esi
	addl	%edx, %esi
	cmpl	%r15d, %esi
	jbe	.LBB184_11
# %bb.10:                               #   in Loop: Header=BB184_8 Depth=1
	movq	(%rax,%rbx), %rdi
	movl	%r12d, %ecx
	subl	%edx, %ecx
	movzwl	%cx, %esi
	movl	%r14d, %edx
	callq	*-16(%rax,%rbx)
	movq	16(%r13), %rcx
	jmp	.LBB184_11
.LBB184_12:
	movb	6(%r13), %al
	movl	%eax, %ecx
	andb	$127, %cl
	orb	$-128, %al
	movzbl	%al, %eax
	movzbl	%cl, %ecx
	movb	(%r13), %dl
	testb	%dl, %dl
	cmovsl	%eax, %ecx
	movl	%ecx, %eax
	andb	$-4, %al
	orb	$2, %cl
	testb	%dl, %dl
	movzbl	%cl, %ecx
	movzbl	%al, %eax
	cmovel	%ecx, %eax
	andb	$-2, %al
	movb	%al, 6(%r13)
	movl	$8, %eax
	addq	$8, %rsp
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%r12
	.cfi_def_cfa_offset 40
	popq	%r13
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end184:
	.size	DCP_xind, .Lfunc_end184-DCP_xind
	.cfi_endproc
                                        # -- End function
	.globl	DCP_indy                # -- Begin function DCP_indy
	.p2align	4, 0x90
	.type	DCP_indy,@function
DCP_indy:                               # @DCP_indy
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r13
	.cfi_def_cfa_offset 40
	pushq	%r12
	.cfi_def_cfa_offset 48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	pushq	%rax
	.cfi_def_cfa_offset 64
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%rdi, %r13
	callq	indy
	movq	16(%r13), %rcx
	testq	%rcx, %rcx
	je	.LBB185_12
# %bb.1:
	movl	%eax, %r12d
	movzwl	%ax, %r15d
	movl	$24, %ebp
	xorl	%eax, %eax
	xorl	%ebx, %ebx
	jmp	.LBB185_2
	.p2align	4, 0x90
.LBB185_5:                              #   in Loop: Header=BB185_2 Depth=1
	addq	$1, %rbx
	addq	$32, %rbp
	cmpq	%rcx, %rbx
	jae	.LBB185_6
.LBB185_2:                              # =>This Inner Loop Header: Depth=1
	movq	8(%r13), %rdx
	movzwl	-8(%rdx,%rbp), %esi
	cmpw	%si, %r12w
	jb	.LBB185_5
# %bb.3:                                #   in Loop: Header=BB185_2 Depth=1
	movzwl	-6(%rdx,%rbp), %edi
	addl	%esi, %edi
	cmpl	%r15d, %edi
	jbe	.LBB185_5
# %bb.4:                                #   in Loop: Header=BB185_2 Depth=1
	movq	(%rdx,%rbp), %rdi
	movl	%r15d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbp)
                                        # kill: def $al killed $al def $rax
	movq	16(%r13), %rcx
	jmp	.LBB185_5
.LBB185_6:
	testq	%rcx, %rcx
	je	.LBB185_12
# %bb.7:
	addb	$-1, %al
	movl	$24, %ebx
	xorl	%ebp, %ebp
	movzbl	%al, %r14d
	jmp	.LBB185_8
	.p2align	4, 0x90
.LBB185_11:                             #   in Loop: Header=BB185_8 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rcx, %rbp
	jae	.LBB185_12
.LBB185_8:                              # =>This Inner Loop Header: Depth=1
	movq	8(%r13), %rax
	movzwl	-8(%rax,%rbx), %edx
	cmpw	%dx, %r12w
	jb	.LBB185_11
# %bb.9:                                #   in Loop: Header=BB185_8 Depth=1
	movzwl	-6(%rax,%rbx), %esi
	addl	%edx, %esi
	cmpl	%r15d, %esi
	jbe	.LBB185_11
# %bb.10:                               #   in Loop: Header=BB185_8 Depth=1
	movq	(%rax,%rbx), %rdi
	movl	%r12d, %ecx
	subl	%edx, %ecx
	movzwl	%cx, %esi
	movl	%r14d, %edx
	callq	*-16(%rax,%rbx)
	movq	16(%r13), %rcx
	jmp	.LBB185_11
.LBB185_12:
	movb	6(%r13), %al
	movl	%eax, %ecx
	andb	$127, %cl
	orb	$-128, %al
	movzbl	%al, %eax
	movzbl	%cl, %ecx
	movb	(%r13), %dl
	testb	%dl, %dl
	cmovsl	%eax, %ecx
	movl	%ecx, %eax
	andb	$-4, %al
	orb	$2, %cl
	testb	%dl, %dl
	movzbl	%cl, %ecx
	movzbl	%al, %eax
	cmovel	%ecx, %eax
	andb	$-2, %al
	movb	%al, 6(%r13)
	movl	$8, %eax
	addq	$8, %rsp
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%r12
	.cfi_def_cfa_offset 40
	popq	%r13
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end185:
	.size	DCP_indy, .Lfunc_end185-DCP_indy
	.cfi_endproc
                                        # -- End function
	.globl	PLA                     # -- Begin function PLA
	.p2align	4, 0x90
	.type	PLA,@function
PLA:                                    # @PLA
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r12
	.cfi_def_cfa_offset 40
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset %rbx, -48
	.cfi_offset %r12, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%rdi, %r12
	movb	3(%rdi), %al
	addb	$1, %al
	movb	%al, 3(%rdi)
	movq	16(%rdi), %rcx
	testq	%rcx, %rcx
	je	.LBB186_1
# %bb.2:
	movzbl	%al, %r15d
	orl	$256, %r15d             # imm = 0x100
	movzwl	%r15w, %r14d
	movl	$24, %ebp
	xorl	%eax, %eax
	xorl	%ebx, %ebx
	jmp	.LBB186_3
	.p2align	4, 0x90
.LBB186_6:                              #   in Loop: Header=BB186_3 Depth=1
	addq	$1, %rbx
	addq	$32, %rbp
	cmpq	%rcx, %rbx
	jae	.LBB186_7
.LBB186_3:                              # =>This Inner Loop Header: Depth=1
	movq	8(%r12), %rdx
	movzwl	-8(%rdx,%rbp), %esi
	cmpw	%si, %r15w
	jb	.LBB186_6
# %bb.4:                                #   in Loop: Header=BB186_3 Depth=1
	movzwl	-6(%rdx,%rbp), %edi
	addl	%esi, %edi
	cmpl	%r14d, %edi
	jbe	.LBB186_6
# %bb.5:                                #   in Loop: Header=BB186_3 Depth=1
	movq	(%rdx,%rbp), %rdi
	movl	%r14d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbp)
                                        # kill: def $al killed $al def $rax
	movq	16(%r12), %rcx
	jmp	.LBB186_6
.LBB186_7:
	movb	%al, (%r12)
	movb	6(%r12), %cl
	leaq	6(%r12), %rdx
	testb	%al, %al
	js	.LBB186_8
# %bb.10:
	andb	$127, %cl
	movb	%cl, (%rdx)
	testb	%al, %al
	jne	.LBB186_9
	jmp	.LBB186_11
.LBB186_1:
	movb	$0, (%r12)
	leaq	6(%r12), %rdx
	movb	6(%r12), %cl
	andb	$127, %cl
	movb	%cl, 6(%r12)
.LBB186_11:
	orb	$2, %cl
	jmp	.LBB186_12
.LBB186_8:
	orb	$-128, %cl
	movb	%cl, (%rdx)
.LBB186_9:
	andb	$-3, %cl
.LBB186_12:
	movb	%cl, (%rdx)
	movl	$4, %eax
	popq	%rbx
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end186:
	.size	PLA, .Lfunc_end186-PLA
	.cfi_endproc
                                        # -- End function
	.globl	PHA                     # -- Begin function PHA
	.p2align	4, 0x90
	.type	PHA,@function
PHA:                                    # @PHA
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r12
	.cfi_def_cfa_offset 40
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset %rbx, -48
	.cfi_offset %r12, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movb	(%rdi), %r14b
	movzbl	3(%rdi), %r12d
	leal	-1(%r12), %eax
	movb	%al, 3(%rdi)
	movq	16(%rdi), %rax
	testq	%rax, %rax
	je	.LBB187_6
# %bb.1:
	movq	%rdi, %r15
	orl	$256, %r12d             # imm = 0x100
	movl	$24, %ebx
	xorl	%ebp, %ebp
	jmp	.LBB187_2
	.p2align	4, 0x90
.LBB187_5:                              #   in Loop: Header=BB187_2 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rax, %rbp
	jae	.LBB187_6
.LBB187_2:                              # =>This Inner Loop Header: Depth=1
	movq	8(%r15), %rcx
	movzwl	-8(%rcx,%rbx), %edx
	cmpw	%dx, %r12w
	jb	.LBB187_5
# %bb.3:                                #   in Loop: Header=BB187_2 Depth=1
	movzwl	-6(%rcx,%rbx), %esi
	addl	%edx, %esi
	cmpl	%r12d, %esi
	jbe	.LBB187_5
# %bb.4:                                #   in Loop: Header=BB187_2 Depth=1
	movq	(%rcx,%rbx), %rdi
	movzwl	%r12w, %eax
	subl	%edx, %eax
	movzwl	%ax, %esi
	movzbl	%r14b, %edx
	callq	*-16(%rcx,%rbx)
	movq	16(%r15), %rax
	jmp	.LBB187_5
.LBB187_6:
	movl	$3, %eax
	popq	%rbx
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end187:
	.size	PHA, .Lfunc_end187-PHA
	.cfi_endproc
                                        # -- End function
	.globl	PLP                     # -- Begin function PLP
	.p2align	4, 0x90
	.type	PLP,@function
PLP:                                    # @PLP
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r12
	.cfi_def_cfa_offset 40
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset %rbx, -48
	.cfi_offset %r12, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%rdi, %r12
	movb	3(%rdi), %al
	addb	$1, %al
	movb	%al, 3(%rdi)
	movq	16(%rdi), %rcx
	testq	%rcx, %rcx
	je	.LBB188_1
# %bb.2:
	movzbl	%al, %r15d
	orl	$256, %r15d             # imm = 0x100
	movzwl	%r15w, %r14d
	movl	$24, %ebp
	xorl	%eax, %eax
	xorl	%ebx, %ebx
	jmp	.LBB188_3
	.p2align	4, 0x90
.LBB188_6:                              #   in Loop: Header=BB188_3 Depth=1
	addq	$1, %rbx
	addq	$32, %rbp
	cmpq	%rcx, %rbx
	jae	.LBB188_7
.LBB188_3:                              # =>This Inner Loop Header: Depth=1
	movq	8(%r12), %rdx
	movzwl	-8(%rdx,%rbp), %esi
	cmpw	%si, %r15w
	jb	.LBB188_6
# %bb.4:                                #   in Loop: Header=BB188_3 Depth=1
	movzwl	-6(%rdx,%rbp), %edi
	addl	%esi, %edi
	cmpl	%r14d, %edi
	jbe	.LBB188_6
# %bb.5:                                #   in Loop: Header=BB188_3 Depth=1
	movq	(%rdx,%rbp), %rdi
	movl	%r14d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbp)
                                        # kill: def $al killed $al def $rax
	movq	16(%r12), %rcx
	jmp	.LBB188_6
.LBB188_1:
	xorl	%eax, %eax
.LBB188_7:
	andb	$-49, %al
	movb	6(%r12), %cl
	andb	$48, %cl
	orb	%al, %cl
	movb	%cl, 6(%r12)
	movl	$4, %eax
	popq	%rbx
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end188:
	.size	PLP, .Lfunc_end188-PLP
	.cfi_endproc
                                        # -- End function
	.globl	PHP                     # -- Begin function PHP
	.p2align	4, 0x90
	.type	PHP,@function
PHP:                                    # @PHP
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r12
	.cfi_def_cfa_offset 40
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset %rbx, -48
	.cfi_offset %r12, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movb	6(%rdi), %r14b
	movzbl	3(%rdi), %r12d
	leal	-1(%r12), %eax
	movb	%al, 3(%rdi)
	movq	16(%rdi), %rax
	testq	%rax, %rax
	je	.LBB189_6
# %bb.1:
	movq	%rdi, %r15
	orb	$48, %r14b
	orl	$256, %r12d             # imm = 0x100
	movl	$24, %ebx
	xorl	%ebp, %ebp
	jmp	.LBB189_2
	.p2align	4, 0x90
.LBB189_5:                              #   in Loop: Header=BB189_2 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rax, %rbp
	jae	.LBB189_6
.LBB189_2:                              # =>This Inner Loop Header: Depth=1
	movq	8(%r15), %rcx
	movzwl	-8(%rcx,%rbx), %edx
	cmpw	%dx, %r12w
	jb	.LBB189_5
# %bb.3:                                #   in Loop: Header=BB189_2 Depth=1
	movzwl	-6(%rcx,%rbx), %esi
	addl	%edx, %esi
	cmpl	%r12d, %esi
	jbe	.LBB189_5
# %bb.4:                                #   in Loop: Header=BB189_2 Depth=1
	movq	(%rcx,%rbx), %rdi
	movzwl	%r12w, %eax
	subl	%edx, %eax
	movzwl	%ax, %esi
	movzbl	%r14b, %edx
	callq	*-16(%rcx,%rbx)
	movq	16(%r15), %rax
	jmp	.LBB189_5
.LBB189_6:
	movl	$3, %eax
	popq	%rbx
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end189:
	.size	PHP, .Lfunc_end189-PHP
	.cfi_endproc
                                        # -- End function
	.globl	RTI                     # -- Begin function RTI
	.p2align	4, 0x90
	.type	RTI,@function
RTI:                                    # @RTI
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r12
	.cfi_def_cfa_offset 40
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset %rbx, -48
	.cfi_offset %r12, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%rdi, %r12
	movb	3(%rdi), %dl
	addb	$1, %dl
	movb	%dl, 3(%rdi)
	movq	16(%rdi), %rcx
	testq	%rcx, %rcx
	je	.LBB190_1
# %bb.2:
	movzbl	%dl, %r15d
	orl	$256, %r15d             # imm = 0x100
	movzwl	%r15w, %r14d
	movl	$24, %ebp
	xorl	%eax, %eax
	xorl	%ebx, %ebx
	jmp	.LBB190_3
	.p2align	4, 0x90
.LBB190_6:                              #   in Loop: Header=BB190_3 Depth=1
	addq	$1, %rbx
	addq	$32, %rbp
	cmpq	%rcx, %rbx
	jae	.LBB190_7
.LBB190_3:                              # =>This Inner Loop Header: Depth=1
	movq	8(%r12), %rdx
	movzwl	-8(%rdx,%rbp), %esi
	cmpw	%si, %r15w
	jb	.LBB190_6
# %bb.4:                                #   in Loop: Header=BB190_3 Depth=1
	movzwl	-6(%rdx,%rbp), %edi
	addl	%esi, %edi
	cmpl	%r14d, %edi
	jbe	.LBB190_6
# %bb.5:                                #   in Loop: Header=BB190_3 Depth=1
	movq	(%rdx,%rbp), %rdi
	movl	%r14d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbp)
                                        # kill: def $al killed $al def $rax
	movq	16(%r12), %rcx
	jmp	.LBB190_6
.LBB190_7:
	movb	3(%r12), %dl
	jmp	.LBB190_8
.LBB190_1:
	xorl	%ecx, %ecx
	xorl	%eax, %eax
.LBB190_8:
	orb	$32, %al
	movb	%al, 6(%r12)
	addb	$1, %dl
	movb	%dl, 3(%r12)
	testq	%rcx, %rcx
	je	.LBB190_9
# %bb.10:
	movzbl	%dl, %r15d
	orl	$256, %r15d             # imm = 0x100
	movzwl	%r15w, %r14d
	movl	$24, %ebp
	xorl	%eax, %eax
	xorl	%ebx, %ebx
	jmp	.LBB190_11
	.p2align	4, 0x90
.LBB190_14:                             #   in Loop: Header=BB190_11 Depth=1
	addq	$1, %rbx
	addq	$32, %rbp
	cmpq	%rcx, %rbx
	jae	.LBB190_15
.LBB190_11:                             # =>This Inner Loop Header: Depth=1
	movq	8(%r12), %rdx
	movzwl	-8(%rdx,%rbp), %esi
	cmpw	%si, %r15w
	jb	.LBB190_14
# %bb.12:                               #   in Loop: Header=BB190_11 Depth=1
	movzwl	-6(%rdx,%rbp), %edi
	addl	%esi, %edi
	cmpl	%r14d, %edi
	jbe	.LBB190_14
# %bb.13:                               #   in Loop: Header=BB190_11 Depth=1
	movq	(%rdx,%rbp), %rdi
	movl	%r14d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbp)
                                        # kill: def $al killed $al def $rax
	movq	16(%r12), %rcx
	jmp	.LBB190_14
.LBB190_15:
	movb	3(%r12), %dl
	jmp	.LBB190_16
.LBB190_9:
	xorl	%ecx, %ecx
	xorl	%eax, %eax
.LBB190_16:
	movzbl	%al, %esi
	movw	%si, 4(%r12)
	addb	$1, %dl
	movb	%dl, 3(%r12)
	testq	%rcx, %rcx
	je	.LBB190_17
# %bb.18:
	movzbl	%dl, %r15d
	orl	$256, %r15d             # imm = 0x100
	movzwl	%r15w, %r14d
	movl	$24, %ebp
	xorl	%eax, %eax
	xorl	%ebx, %ebx
	jmp	.LBB190_19
	.p2align	4, 0x90
.LBB190_22:                             #   in Loop: Header=BB190_19 Depth=1
	addq	$1, %rbx
	addq	$32, %rbp
	cmpq	%rcx, %rbx
	jae	.LBB190_23
.LBB190_19:                             # =>This Inner Loop Header: Depth=1
	movq	8(%r12), %rdx
	movzwl	-8(%rdx,%rbp), %esi
	cmpw	%si, %r15w
	jb	.LBB190_22
# %bb.20:                               #   in Loop: Header=BB190_19 Depth=1
	movzwl	-6(%rdx,%rbp), %edi
	addl	%esi, %edi
	cmpl	%r14d, %edi
	jbe	.LBB190_22
# %bb.21:                               #   in Loop: Header=BB190_19 Depth=1
	movq	(%rdx,%rbp), %rdi
	movl	%r14d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbp)
                                        # kill: def $al killed $al def $rax
	movq	16(%r12), %rcx
	jmp	.LBB190_22
.LBB190_23:
	movzwl	4(%r12), %esi
	jmp	.LBB190_24
.LBB190_17:
	xorl	%eax, %eax
.LBB190_24:
	movzbl	%al, %eax
	shll	$8, %eax
	addl	%eax, %esi
	movw	%si, 4(%r12)
	movl	$6, %eax
	popq	%rbx
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end190:
	.size	RTI, .Lfunc_end190-RTI
	.cfi_endproc
                                        # -- End function
	.globl	RTS                     # -- Begin function RTS
	.p2align	4, 0x90
	.type	RTS,@function
RTS:                                    # @RTS
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r12
	.cfi_def_cfa_offset 40
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset %rbx, -48
	.cfi_offset %r12, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%rdi, %r12
	movb	3(%rdi), %dl
	addb	$1, %dl
	movb	%dl, 3(%rdi)
	movq	16(%rdi), %rcx
	testq	%rcx, %rcx
	je	.LBB191_1
# %bb.2:
	movzbl	%dl, %r15d
	orl	$256, %r15d             # imm = 0x100
	movzwl	%r15w, %r14d
	movl	$24, %ebp
	xorl	%eax, %eax
	xorl	%ebx, %ebx
	jmp	.LBB191_3
	.p2align	4, 0x90
.LBB191_6:                              #   in Loop: Header=BB191_3 Depth=1
	addq	$1, %rbx
	addq	$32, %rbp
	cmpq	%rcx, %rbx
	jae	.LBB191_7
.LBB191_3:                              # =>This Inner Loop Header: Depth=1
	movq	8(%r12), %rdx
	movzwl	-8(%rdx,%rbp), %esi
	cmpw	%si, %r15w
	jb	.LBB191_6
# %bb.4:                                #   in Loop: Header=BB191_3 Depth=1
	movzwl	-6(%rdx,%rbp), %edi
	addl	%esi, %edi
	cmpl	%r14d, %edi
	jbe	.LBB191_6
# %bb.5:                                #   in Loop: Header=BB191_3 Depth=1
	movq	(%rdx,%rbp), %rdi
	movl	%r14d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbp)
                                        # kill: def $al killed $al def $rax
	movq	16(%r12), %rcx
	jmp	.LBB191_6
.LBB191_7:
	movb	3(%r12), %dl
	jmp	.LBB191_8
.LBB191_1:
	xorl	%ecx, %ecx
	xorl	%eax, %eax
.LBB191_8:
	movzbl	%al, %esi
	addl	$1, %esi
	movw	%si, 4(%r12)
	addb	$1, %dl
	movb	%dl, 3(%r12)
	testq	%rcx, %rcx
	je	.LBB191_9
# %bb.10:
	movzbl	%dl, %r15d
	orl	$256, %r15d             # imm = 0x100
	movzwl	%r15w, %r14d
	movl	$24, %ebp
	xorl	%eax, %eax
	xorl	%ebx, %ebx
	jmp	.LBB191_11
	.p2align	4, 0x90
.LBB191_14:                             #   in Loop: Header=BB191_11 Depth=1
	addq	$1, %rbx
	addq	$32, %rbp
	cmpq	%rcx, %rbx
	jae	.LBB191_15
.LBB191_11:                             # =>This Inner Loop Header: Depth=1
	movq	8(%r12), %rdx
	movzwl	-8(%rdx,%rbp), %esi
	cmpw	%si, %r15w
	jb	.LBB191_14
# %bb.12:                               #   in Loop: Header=BB191_11 Depth=1
	movzwl	-6(%rdx,%rbp), %edi
	addl	%esi, %edi
	cmpl	%r14d, %edi
	jbe	.LBB191_14
# %bb.13:                               #   in Loop: Header=BB191_11 Depth=1
	movq	(%rdx,%rbp), %rdi
	movl	%r14d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbp)
                                        # kill: def $al killed $al def $rax
	movq	16(%r12), %rcx
	jmp	.LBB191_14
.LBB191_15:
	movzwl	4(%r12), %esi
	jmp	.LBB191_16
.LBB191_9:
	xorl	%eax, %eax
.LBB191_16:
	movzbl	%al, %eax
	shll	$8, %eax
	addl	%eax, %esi
	movw	%si, 4(%r12)
	movl	$6, %eax
	popq	%rbx
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end191:
	.size	RTS, .Lfunc_end191-RTS
	.cfi_endproc
                                        # -- End function
	.globl	ERR                     # -- Begin function ERR
	.p2align	4, 0x90
	.type	ERR,@function
ERR:                                    # @ERR
	.cfi_startproc
# %bb.0:
	pushq	%rax
	.cfi_def_cfa_offset 16
	movq	stdin(%rip), %rdi
	callq	getc
	movl	$10000000, %eax         # imm = 0x989680
	popq	%rcx
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end192:
	.size	ERR, .Lfunc_end192-ERR
	.cfi_endproc
                                        # -- End function
	.globl	NOP                     # -- Begin function NOP
	.p2align	4, 0x90
	.type	NOP,@function
NOP:                                    # @NOP
	.cfi_startproc
# %bb.0:
	movl	$2, %eax
	retq
.Lfunc_end193:
	.size	NOP, .Lfunc_end193-NOP
	.cfi_endproc
                                        # -- End function
	.globl	NOP_imm                 # -- Begin function NOP_imm
	.p2align	4, 0x90
	.type	NOP_imm,@function
NOP_imm:                                # @NOP_imm
	.cfi_startproc
# %bb.0:
	addw	$1, 4(%rdi)
	movl	$2, %eax
	retq
.Lfunc_end194:
	.size	NOP_imm, .Lfunc_end194-NOP_imm
	.cfi_endproc
                                        # -- End function
	.globl	NOP_zpg                 # -- Begin function NOP_zpg
	.p2align	4, 0x90
	.type	NOP_zpg,@function
NOP_zpg:                                # @NOP_zpg
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r12
	.cfi_def_cfa_offset 40
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset %rbx, -48
	.cfi_offset %r12, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%rdi, %r15
	movzwl	4(%rdi), %r12d
	movq	16(%rdi), %rax
	testq	%rax, %rax
	je	.LBB195_7
# %bb.1:
	movzwl	%r12w, %r14d
	movl	$24, %ebx
	xorl	%ebp, %ebp
	jmp	.LBB195_2
	.p2align	4, 0x90
.LBB195_5:                              #   in Loop: Header=BB195_2 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rax, %rbp
	jae	.LBB195_6
.LBB195_2:                              # =>This Inner Loop Header: Depth=1
	movq	8(%r15), %rcx
	movzwl	-8(%rcx,%rbx), %edx
	cmpw	%dx, %r12w
	jb	.LBB195_5
# %bb.3:                                #   in Loop: Header=BB195_2 Depth=1
	movzwl	-6(%rcx,%rbx), %esi
	addl	%edx, %esi
	cmpl	%r14d, %esi
	jbe	.LBB195_5
# %bb.4:                                #   in Loop: Header=BB195_2 Depth=1
	movq	(%rcx,%rbx), %rdi
	movl	%r12d, %eax
	subl	%edx, %eax
	movzwl	%ax, %esi
	callq	*-24(%rcx,%rbx)
	movq	16(%r15), %rax
	jmp	.LBB195_5
.LBB195_6:
	movzwl	4(%r15), %r12d
.LBB195_7:
	addl	$1, %r12d
	movw	%r12w, 4(%r15)
	movl	$3, %eax
	popq	%rbx
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end195:
	.size	NOP_zpg, .Lfunc_end195-NOP_zpg
	.cfi_endproc
                                        # -- End function
	.globl	NOP_zpgx                # -- Begin function NOP_zpgx
	.p2align	4, 0x90
	.type	NOP_zpgx,@function
NOP_zpgx:                               # @NOP_zpgx
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r12
	.cfi_def_cfa_offset 40
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset %rbx, -48
	.cfi_offset %r12, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%rdi, %r15
	movzwl	4(%rdi), %r12d
	movq	16(%rdi), %rax
	testq	%rax, %rax
	je	.LBB196_7
# %bb.1:
	movzwl	%r12w, %r14d
	movl	$24, %ebx
	xorl	%ebp, %ebp
	jmp	.LBB196_2
	.p2align	4, 0x90
.LBB196_5:                              #   in Loop: Header=BB196_2 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rax, %rbp
	jae	.LBB196_6
.LBB196_2:                              # =>This Inner Loop Header: Depth=1
	movq	8(%r15), %rcx
	movzwl	-8(%rcx,%rbx), %edx
	cmpw	%dx, %r12w
	jb	.LBB196_5
# %bb.3:                                #   in Loop: Header=BB196_2 Depth=1
	movzwl	-6(%rcx,%rbx), %esi
	addl	%edx, %esi
	cmpl	%r14d, %esi
	jbe	.LBB196_5
# %bb.4:                                #   in Loop: Header=BB196_2 Depth=1
	movq	(%rcx,%rbx), %rdi
	movl	%r12d, %eax
	subl	%edx, %eax
	movzwl	%ax, %esi
	callq	*-24(%rcx,%rbx)
	movq	16(%r15), %rax
	jmp	.LBB196_5
.LBB196_6:
	movzwl	4(%r15), %r12d
.LBB196_7:
	addl	$1, %r12d
	movw	%r12w, 4(%r15)
	movl	$4, %eax
	popq	%rbx
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end196:
	.size	NOP_zpgx, .Lfunc_end196-NOP_zpgx
	.cfi_endproc
                                        # -- End function
	.globl	NOP_abss                # -- Begin function NOP_abss
	.p2align	4, 0x90
	.type	NOP_abss,@function
NOP_abss:                               # @NOP_abss
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r12
	.cfi_def_cfa_offset 40
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset %rbx, -48
	.cfi_offset %r12, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%rdi, %r15
	movzwl	4(%rdi), %r12d
	movq	16(%rdi), %rax
	testq	%rax, %rax
	je	.LBB197_13
# %bb.1:
	movzwl	%r12w, %r14d
	movl	$24, %ebx
	xorl	%ebp, %ebp
	jmp	.LBB197_2
	.p2align	4, 0x90
.LBB197_5:                              #   in Loop: Header=BB197_2 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rax, %rbp
	jae	.LBB197_6
.LBB197_2:                              # =>This Inner Loop Header: Depth=1
	movq	8(%r15), %rcx
	movzwl	-8(%rcx,%rbx), %edx
	cmpw	%dx, %r12w
	jb	.LBB197_5
# %bb.3:                                #   in Loop: Header=BB197_2 Depth=1
	movzwl	-6(%rcx,%rbx), %esi
	addl	%edx, %esi
	cmpl	%r14d, %esi
	jbe	.LBB197_5
# %bb.4:                                #   in Loop: Header=BB197_2 Depth=1
	movq	(%rcx,%rbx), %rdi
	movl	%r12d, %eax
	subl	%edx, %eax
	movzwl	%ax, %esi
	callq	*-24(%rcx,%rbx)
	movq	16(%r15), %rax
	jmp	.LBB197_5
.LBB197_6:
	movl	4(%r15), %r12d
	testq	%rax, %rax
	je	.LBB197_13
# %bb.7:
	addl	$1, %r12d
	movzwl	%r12w, %r14d
	movl	$24, %ebx
	xorl	%ebp, %ebp
	jmp	.LBB197_8
	.p2align	4, 0x90
.LBB197_11:                             #   in Loop: Header=BB197_8 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rax, %rbp
	jae	.LBB197_12
.LBB197_8:                              # =>This Inner Loop Header: Depth=1
	movq	8(%r15), %rcx
	movzwl	-8(%rcx,%rbx), %edx
	cmpw	%dx, %r12w
	jb	.LBB197_11
# %bb.9:                                #   in Loop: Header=BB197_8 Depth=1
	movzwl	-6(%rcx,%rbx), %esi
	addl	%edx, %esi
	cmpl	%r14d, %esi
	jbe	.LBB197_11
# %bb.10:                               #   in Loop: Header=BB197_8 Depth=1
	movq	(%rcx,%rbx), %rdi
	movl	%r12d, %eax
	subl	%edx, %eax
	movzwl	%ax, %esi
	callq	*-24(%rcx,%rbx)
	movq	16(%r15), %rax
	jmp	.LBB197_11
.LBB197_12:
	movzwl	4(%r15), %r12d
.LBB197_13:
	addl	$2, %r12d
	movw	%r12w, 4(%r15)
	movl	$4, %eax
	popq	%rbx
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end197:
	.size	NOP_abss, .Lfunc_end197-NOP_abss
	.cfi_endproc
                                        # -- End function
	.globl	NOP_absx                # -- Begin function NOP_absx
	.p2align	4, 0x90
	.type	NOP_absx,@function
NOP_absx:                               # @NOP_absx
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r12
	.cfi_def_cfa_offset 40
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset %rbx, -48
	.cfi_offset %r12, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%rdi, %r15
	movzwl	4(%rdi), %r12d
	movq	16(%rdi), %rax
	testq	%rax, %rax
	je	.LBB198_13
# %bb.1:
	movzwl	%r12w, %r14d
	movl	$24, %ebx
	xorl	%ebp, %ebp
	jmp	.LBB198_2
	.p2align	4, 0x90
.LBB198_5:                              #   in Loop: Header=BB198_2 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rax, %rbp
	jae	.LBB198_6
.LBB198_2:                              # =>This Inner Loop Header: Depth=1
	movq	8(%r15), %rcx
	movzwl	-8(%rcx,%rbx), %edx
	cmpw	%dx, %r12w
	jb	.LBB198_5
# %bb.3:                                #   in Loop: Header=BB198_2 Depth=1
	movzwl	-6(%rcx,%rbx), %esi
	addl	%edx, %esi
	cmpl	%r14d, %esi
	jbe	.LBB198_5
# %bb.4:                                #   in Loop: Header=BB198_2 Depth=1
	movq	(%rcx,%rbx), %rdi
	movl	%r12d, %eax
	subl	%edx, %eax
	movzwl	%ax, %esi
	callq	*-24(%rcx,%rbx)
	movq	16(%r15), %rax
	jmp	.LBB198_5
.LBB198_6:
	movl	4(%r15), %r12d
	testq	%rax, %rax
	je	.LBB198_13
# %bb.7:
	addl	$1, %r12d
	movzwl	%r12w, %r14d
	movl	$24, %ebx
	xorl	%ebp, %ebp
	jmp	.LBB198_8
	.p2align	4, 0x90
.LBB198_11:                             #   in Loop: Header=BB198_8 Depth=1
	addq	$1, %rbp
	addq	$32, %rbx
	cmpq	%rax, %rbp
	jae	.LBB198_12
.LBB198_8:                              # =>This Inner Loop Header: Depth=1
	movq	8(%r15), %rcx
	movzwl	-8(%rcx,%rbx), %edx
	cmpw	%dx, %r12w
	jb	.LBB198_11
# %bb.9:                                #   in Loop: Header=BB198_8 Depth=1
	movzwl	-6(%rcx,%rbx), %esi
	addl	%edx, %esi
	cmpl	%r14d, %esi
	jbe	.LBB198_11
# %bb.10:                               #   in Loop: Header=BB198_8 Depth=1
	movq	(%rcx,%rbx), %rdi
	movl	%r12d, %eax
	subl	%edx, %eax
	movzwl	%ax, %esi
	callq	*-24(%rcx,%rbx)
	movq	16(%r15), %rax
	jmp	.LBB198_11
.LBB198_12:
	movzwl	4(%r15), %r12d
.LBB198_13:
	addl	$2, %r12d
	movw	%r12w, 4(%r15)
	movl	$4, %eax
	popq	%rbx
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end198:
	.size	NOP_absx, .Lfunc_end198-NOP_absx
	.cfi_endproc
                                        # -- End function
	.globl	stepCpu                 # -- Begin function stepCpu
	.p2align	4, 0x90
	.type	stepCpu,@function
stepCpu:                                # @stepCpu
	.cfi_startproc
# %bb.0:
	pushq	%r15
	.cfi_def_cfa_offset 16
	pushq	%r14
	.cfi_def_cfa_offset 24
	pushq	%r12
	.cfi_def_cfa_offset 32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	pushq	%rax
	.cfi_def_cfa_offset 48
	.cfi_offset %rbx, -40
	.cfi_offset %r12, -32
	.cfi_offset %r14, -24
	.cfi_offset %r15, -16
	movq	%rdi, %r14
	movzwl	4(%rdi), %r15d
	leal	1(%r15), %eax
	movw	%ax, 4(%rdi)
	movq	16(%rdi), %rcx
	testq	%rcx, %rcx
	je	.LBB199_1
# %bb.2:
	movl	$24, %ebx
	xorl	%eax, %eax
	xorl	%r12d, %r12d
	jmp	.LBB199_3
	.p2align	4, 0x90
.LBB199_6:                              #   in Loop: Header=BB199_3 Depth=1
	addq	$1, %r12
	addq	$32, %rbx
	cmpq	%rcx, %r12
	jae	.LBB199_7
.LBB199_3:                              # =>This Inner Loop Header: Depth=1
	movq	8(%r14), %rdx
	movzwl	-8(%rdx,%rbx), %esi
	cmpw	%si, %r15w
	jb	.LBB199_6
# %bb.4:                                #   in Loop: Header=BB199_3 Depth=1
	movzwl	-6(%rdx,%rbx), %edi
	addl	%esi, %edi
	cmpl	%r15d, %edi
	jbe	.LBB199_6
# %bb.5:                                #   in Loop: Header=BB199_3 Depth=1
	movq	(%rdx,%rbx), %rdi
	movl	%r15d, %eax
	subl	%esi, %eax
	movzwl	%ax, %esi
	callq	*-24(%rdx,%rbx)
                                        # kill: def $al killed $al def $rax
	movq	16(%r14), %rcx
	jmp	.LBB199_6
.LBB199_1:
	xorl	%eax, %eax
.LBB199_7:
	movzbl	%al, %eax
	movq	%r14, %rdi
	addq	$8, %rsp
	.cfi_def_cfa_offset 40
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%r12
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	jmpq	*cpuopmap(,%rax,8)      # TAILCALL
.Lfunc_end199:
	.size	stepCpu, .Lfunc_end199-stepCpu
	.cfi_endproc
                                        # -- End function
	.type	.L.str,@object          # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"CREATED CPU\n"
	.size	.L.str, 13

	.type	.L.str.1,@object        # @.str.1
.L.str.1:
	.asciz	"PAGE %02x\n"
	.size	.L.str.1, 11

	.type	.L.str.2,@object        # @.str.2
.L.str.2:
	.asciz	"%02X "
	.size	.L.str.2, 6

	.type	.L.str.4,@object        # @.str.4
.L.str.4:
	.asciz	"CPU REGISTERS:\n-- A    =0x%02X\n-- X    =0x%02X\n-- Y    =0x%02x\n-- SP   =0x%02X\n-- PC   =0x%04X\n-- FLAGS=0x%02X\n"
	.size	.L.str.4, 112

	.type	.L.str.5,@object        # @.str.5
.L.str.5:
	.asciz	"BRK"
	.size	.L.str.5, 4

	.type	.L.str.6,@object        # @.str.6
.L.str.6:
	.asciz	"ORA_xind"
	.size	.L.str.6, 9

	.type	.L.str.7,@object        # @.str.7
.L.str.7:
	.asciz	"ERR"
	.size	.L.str.7, 4

	.type	.L.str.8,@object        # @.str.8
.L.str.8:
	.asciz	"SLO_xind"
	.size	.L.str.8, 9

	.type	.L.str.9,@object        # @.str.9
.L.str.9:
	.asciz	"NOP_zpg"
	.size	.L.str.9, 8

	.type	.L.str.10,@object       # @.str.10
.L.str.10:
	.asciz	"ORA_zpg"
	.size	.L.str.10, 8

	.type	.L.str.11,@object       # @.str.11
.L.str.11:
	.asciz	"ASL_zpg"
	.size	.L.str.11, 8

	.type	.L.str.12,@object       # @.str.12
.L.str.12:
	.asciz	"SLO_zpg"
	.size	.L.str.12, 8

	.type	.L.str.13,@object       # @.str.13
.L.str.13:
	.asciz	"PHP"
	.size	.L.str.13, 4

	.type	.L.str.14,@object       # @.str.14
.L.str.14:
	.asciz	"ORA_imm"
	.size	.L.str.14, 8

	.type	.L.str.15,@object       # @.str.15
.L.str.15:
	.asciz	"ASLA"
	.size	.L.str.15, 5

	.type	.L.str.16,@object       # @.str.16
.L.str.16:
	.asciz	"NOP_abss"
	.size	.L.str.16, 9

	.type	.L.str.17,@object       # @.str.17
.L.str.17:
	.asciz	"ORA_abss"
	.size	.L.str.17, 9

	.type	.L.str.18,@object       # @.str.18
.L.str.18:
	.asciz	"ASL_abss"
	.size	.L.str.18, 9

	.type	.L.str.19,@object       # @.str.19
.L.str.19:
	.asciz	"SLO_abss"
	.size	.L.str.19, 9

	.type	.L.str.20,@object       # @.str.20
.L.str.20:
	.asciz	"BNC"
	.size	.L.str.20, 4

	.type	.L.str.21,@object       # @.str.21
.L.str.21:
	.asciz	"ORA_indy"
	.size	.L.str.21, 9

	.type	.L.str.22,@object       # @.str.22
.L.str.22:
	.asciz	"SLO_indy"
	.size	.L.str.22, 9

	.type	.L.str.23,@object       # @.str.23
.L.str.23:
	.asciz	"NOP_zpgx"
	.size	.L.str.23, 9

	.type	.L.str.24,@object       # @.str.24
.L.str.24:
	.asciz	"ORA_zpgx"
	.size	.L.str.24, 9

	.type	.L.str.25,@object       # @.str.25
.L.str.25:
	.asciz	"ASL_zpgx"
	.size	.L.str.25, 9

	.type	.L.str.26,@object       # @.str.26
.L.str.26:
	.asciz	"SLO_zpgx"
	.size	.L.str.26, 9

	.type	.L.str.27,@object       # @.str.27
.L.str.27:
	.asciz	"CLC"
	.size	.L.str.27, 4

	.type	.L.str.28,@object       # @.str.28
.L.str.28:
	.asciz	"ORA_absy"
	.size	.L.str.28, 9

	.type	.L.str.29,@object       # @.str.29
.L.str.29:
	.asciz	"NOP"
	.size	.L.str.29, 4

	.type	.L.str.30,@object       # @.str.30
.L.str.30:
	.asciz	"SLO_absy"
	.size	.L.str.30, 9

	.type	.L.str.31,@object       # @.str.31
.L.str.31:
	.asciz	"NOP_absx"
	.size	.L.str.31, 9

	.type	.L.str.32,@object       # @.str.32
.L.str.32:
	.asciz	"ORA_absx"
	.size	.L.str.32, 9

	.type	.L.str.33,@object       # @.str.33
.L.str.33:
	.asciz	"ASL_absx"
	.size	.L.str.33, 9

	.type	.L.str.34,@object       # @.str.34
.L.str.34:
	.asciz	"SLO_absx"
	.size	.L.str.34, 9

	.type	.L.str.35,@object       # @.str.35
.L.str.35:
	.asciz	"JSR"
	.size	.L.str.35, 4

	.type	.L.str.36,@object       # @.str.36
.L.str.36:
	.asciz	"AND_xind"
	.size	.L.str.36, 9

	.type	.L.str.37,@object       # @.str.37
.L.str.37:
	.asciz	"BIT_zpg"
	.size	.L.str.37, 8

	.type	.L.str.38,@object       # @.str.38
.L.str.38:
	.asciz	"AND_zpg"
	.size	.L.str.38, 8

	.type	.L.str.39,@object       # @.str.39
.L.str.39:
	.asciz	"ROL_zpg"
	.size	.L.str.39, 8

	.type	.L.str.40,@object       # @.str.40
.L.str.40:
	.asciz	"PLP"
	.size	.L.str.40, 4

	.type	.L.str.41,@object       # @.str.41
.L.str.41:
	.asciz	"AND_imm"
	.size	.L.str.41, 8

	.type	.L.str.42,@object       # @.str.42
.L.str.42:
	.asciz	"ROLA"
	.size	.L.str.42, 5

	.type	.L.str.43,@object       # @.str.43
.L.str.43:
	.asciz	"BIT_abss"
	.size	.L.str.43, 9

	.type	.L.str.44,@object       # @.str.44
.L.str.44:
	.asciz	"AND_abss"
	.size	.L.str.44, 9

	.type	.L.str.45,@object       # @.str.45
.L.str.45:
	.asciz	"ROL_abss"
	.size	.L.str.45, 9

	.type	.L.str.46,@object       # @.str.46
.L.str.46:
	.asciz	"BNS"
	.size	.L.str.46, 4

	.type	.L.str.47,@object       # @.str.47
.L.str.47:
	.asciz	"AND_indy"
	.size	.L.str.47, 9

	.type	.L.str.48,@object       # @.str.48
.L.str.48:
	.asciz	"AND_zpgx"
	.size	.L.str.48, 9

	.type	.L.str.49,@object       # @.str.49
.L.str.49:
	.asciz	"ROL_zpgx"
	.size	.L.str.49, 9

	.type	.L.str.50,@object       # @.str.50
.L.str.50:
	.asciz	"SEC"
	.size	.L.str.50, 4

	.type	.L.str.51,@object       # @.str.51
.L.str.51:
	.asciz	"AND_absy"
	.size	.L.str.51, 9

	.type	.L.str.52,@object       # @.str.52
.L.str.52:
	.asciz	"AND_absx"
	.size	.L.str.52, 9

	.type	.L.str.53,@object       # @.str.53
.L.str.53:
	.asciz	"ROL_absx"
	.size	.L.str.53, 9

	.type	.L.str.54,@object       # @.str.54
.L.str.54:
	.asciz	"RTI"
	.size	.L.str.54, 4

	.type	.L.str.55,@object       # @.str.55
.L.str.55:
	.asciz	"EOR_xind"
	.size	.L.str.55, 9

	.type	.L.str.56,@object       # @.str.56
.L.str.56:
	.asciz	"SRE_xind"
	.size	.L.str.56, 9

	.type	.L.str.57,@object       # @.str.57
.L.str.57:
	.asciz	"EOR_zpg"
	.size	.L.str.57, 8

	.type	.L.str.58,@object       # @.str.58
.L.str.58:
	.asciz	"LSR_zpg"
	.size	.L.str.58, 8

	.type	.L.str.59,@object       # @.str.59
.L.str.59:
	.asciz	"SRE_zpg"
	.size	.L.str.59, 8

	.type	.L.str.60,@object       # @.str.60
.L.str.60:
	.asciz	"PHA"
	.size	.L.str.60, 4

	.type	.L.str.61,@object       # @.str.61
.L.str.61:
	.asciz	"EOR_imm"
	.size	.L.str.61, 8

	.type	.L.str.62,@object       # @.str.62
.L.str.62:
	.asciz	"LSRA"
	.size	.L.str.62, 5

	.type	.L.str.63,@object       # @.str.63
.L.str.63:
	.asciz	"JMP_abss"
	.size	.L.str.63, 9

	.type	.L.str.64,@object       # @.str.64
.L.str.64:
	.asciz	"EOR_abss"
	.size	.L.str.64, 9

	.type	.L.str.65,@object       # @.str.65
.L.str.65:
	.asciz	"LSR_abss"
	.size	.L.str.65, 9

	.type	.L.str.66,@object       # @.str.66
.L.str.66:
	.asciz	"SRE_abss"
	.size	.L.str.66, 9

	.type	.L.str.67,@object       # @.str.67
.L.str.67:
	.asciz	"BVC"
	.size	.L.str.67, 4

	.type	.L.str.68,@object       # @.str.68
.L.str.68:
	.asciz	"EOR_indy"
	.size	.L.str.68, 9

	.type	.L.str.69,@object       # @.str.69
.L.str.69:
	.asciz	"SRE_indy"
	.size	.L.str.69, 9

	.type	.L.str.70,@object       # @.str.70
.L.str.70:
	.asciz	"EOR_zpgx"
	.size	.L.str.70, 9

	.type	.L.str.71,@object       # @.str.71
.L.str.71:
	.asciz	"LSR_zpgx"
	.size	.L.str.71, 9

	.type	.L.str.72,@object       # @.str.72
.L.str.72:
	.asciz	"SRE_zpgx"
	.size	.L.str.72, 9

	.type	.L.str.73,@object       # @.str.73
.L.str.73:
	.asciz	"CLI"
	.size	.L.str.73, 4

	.type	.L.str.74,@object       # @.str.74
.L.str.74:
	.asciz	"EOR_absy"
	.size	.L.str.74, 9

	.type	.L.str.75,@object       # @.str.75
.L.str.75:
	.asciz	"SRE_absy"
	.size	.L.str.75, 9

	.type	.L.str.76,@object       # @.str.76
.L.str.76:
	.asciz	"EOR_absx"
	.size	.L.str.76, 9

	.type	.L.str.77,@object       # @.str.77
.L.str.77:
	.asciz	"LSR_absx"
	.size	.L.str.77, 9

	.type	.L.str.78,@object       # @.str.78
.L.str.78:
	.asciz	"SRE_absx"
	.size	.L.str.78, 9

	.type	.L.str.79,@object       # @.str.79
.L.str.79:
	.asciz	"RTS"
	.size	.L.str.79, 4

	.type	.L.str.80,@object       # @.str.80
.L.str.80:
	.asciz	"ADC_xind"
	.size	.L.str.80, 9

	.type	.L.str.81,@object       # @.str.81
.L.str.81:
	.asciz	"ADC_zpg"
	.size	.L.str.81, 8

	.type	.L.str.82,@object       # @.str.82
.L.str.82:
	.asciz	"ROR_zpg"
	.size	.L.str.82, 8

	.type	.L.str.83,@object       # @.str.83
.L.str.83:
	.asciz	"PLA"
	.size	.L.str.83, 4

	.type	.L.str.84,@object       # @.str.84
.L.str.84:
	.asciz	"ADC_imm"
	.size	.L.str.84, 8

	.type	.L.str.85,@object       # @.str.85
.L.str.85:
	.asciz	"RORA"
	.size	.L.str.85, 5

	.type	.L.str.86,@object       # @.str.86
.L.str.86:
	.asciz	"JMP_ind"
	.size	.L.str.86, 8

	.type	.L.str.87,@object       # @.str.87
.L.str.87:
	.asciz	"ADC_abss"
	.size	.L.str.87, 9

	.type	.L.str.88,@object       # @.str.88
.L.str.88:
	.asciz	"ROR_abss"
	.size	.L.str.88, 9

	.type	.L.str.89,@object       # @.str.89
.L.str.89:
	.asciz	"BVS"
	.size	.L.str.89, 4

	.type	.L.str.90,@object       # @.str.90
.L.str.90:
	.asciz	"ADC_indy"
	.size	.L.str.90, 9

	.type	.L.str.91,@object       # @.str.91
.L.str.91:
	.asciz	"ADC_zpgx"
	.size	.L.str.91, 9

	.type	.L.str.92,@object       # @.str.92
.L.str.92:
	.asciz	"ROR_zpgx"
	.size	.L.str.92, 9

	.type	.L.str.93,@object       # @.str.93
.L.str.93:
	.asciz	"SEI"
	.size	.L.str.93, 4

	.type	.L.str.94,@object       # @.str.94
.L.str.94:
	.asciz	"ADC_absy"
	.size	.L.str.94, 9

	.type	.L.str.95,@object       # @.str.95
.L.str.95:
	.asciz	"ADC_absx"
	.size	.L.str.95, 9

	.type	.L.str.96,@object       # @.str.96
.L.str.96:
	.asciz	"ROR_absx"
	.size	.L.str.96, 9

	.type	.L.str.97,@object       # @.str.97
.L.str.97:
	.asciz	"NOP_imm"
	.size	.L.str.97, 8

	.type	.L.str.98,@object       # @.str.98
.L.str.98:
	.asciz	"STA_xind"
	.size	.L.str.98, 9

	.type	.L.str.99,@object       # @.str.99
.L.str.99:
	.asciz	"SAX_xind"
	.size	.L.str.99, 9

	.type	.L.str.100,@object      # @.str.100
.L.str.100:
	.asciz	"STY_zpg"
	.size	.L.str.100, 8

	.type	.L.str.101,@object      # @.str.101
.L.str.101:
	.asciz	"STA_zpg"
	.size	.L.str.101, 8

	.type	.L.str.102,@object      # @.str.102
.L.str.102:
	.asciz	"STX_zpg"
	.size	.L.str.102, 8

	.type	.L.str.103,@object      # @.str.103
.L.str.103:
	.asciz	"SAX_zpg"
	.size	.L.str.103, 8

	.type	.L.str.104,@object      # @.str.104
.L.str.104:
	.asciz	"DEY"
	.size	.L.str.104, 4

	.type	.L.str.105,@object      # @.str.105
.L.str.105:
	.asciz	"TXA"
	.size	.L.str.105, 4

	.type	.L.str.106,@object      # @.str.106
.L.str.106:
	.asciz	"STY_abss"
	.size	.L.str.106, 9

	.type	.L.str.107,@object      # @.str.107
.L.str.107:
	.asciz	"STA_abss"
	.size	.L.str.107, 9

	.type	.L.str.108,@object      # @.str.108
.L.str.108:
	.asciz	"STX_abss"
	.size	.L.str.108, 9

	.type	.L.str.109,@object      # @.str.109
.L.str.109:
	.asciz	"SAX_abss"
	.size	.L.str.109, 9

	.type	.L.str.110,@object      # @.str.110
.L.str.110:
	.asciz	"BCC"
	.size	.L.str.110, 4

	.type	.L.str.111,@object      # @.str.111
.L.str.111:
	.asciz	"STA_indy"
	.size	.L.str.111, 9

	.type	.L.str.112,@object      # @.str.112
.L.str.112:
	.asciz	"STY_zpgx"
	.size	.L.str.112, 9

	.type	.L.str.113,@object      # @.str.113
.L.str.113:
	.asciz	"STA_zpgx"
	.size	.L.str.113, 9

	.type	.L.str.114,@object      # @.str.114
.L.str.114:
	.asciz	"STX_zpgy"
	.size	.L.str.114, 9

	.type	.L.str.115,@object      # @.str.115
.L.str.115:
	.asciz	"SAX_zpgy"
	.size	.L.str.115, 9

	.type	.L.str.116,@object      # @.str.116
.L.str.116:
	.asciz	"TYA"
	.size	.L.str.116, 4

	.type	.L.str.117,@object      # @.str.117
.L.str.117:
	.asciz	"STA_absy"
	.size	.L.str.117, 9

	.type	.L.str.118,@object      # @.str.118
.L.str.118:
	.asciz	"TXS"
	.size	.L.str.118, 4

	.type	.L.str.119,@object      # @.str.119
.L.str.119:
	.asciz	"SYA_absx"
	.size	.L.str.119, 9

	.type	.L.str.120,@object      # @.str.120
.L.str.120:
	.asciz	"STA_absx"
	.size	.L.str.120, 9

	.type	.L.str.121,@object      # @.str.121
.L.str.121:
	.asciz	"SXA_absy"
	.size	.L.str.121, 9

	.type	.L.str.122,@object      # @.str.122
.L.str.122:
	.asciz	"LDY_imm"
	.size	.L.str.122, 8

	.type	.L.str.123,@object      # @.str.123
.L.str.123:
	.asciz	"LDA_xind"
	.size	.L.str.123, 9

	.type	.L.str.124,@object      # @.str.124
.L.str.124:
	.asciz	"LDX_imm"
	.size	.L.str.124, 8

	.type	.L.str.125,@object      # @.str.125
.L.str.125:
	.asciz	"LAX_xind"
	.size	.L.str.125, 9

	.type	.L.str.126,@object      # @.str.126
.L.str.126:
	.asciz	"LDY_zpg"
	.size	.L.str.126, 8

	.type	.L.str.127,@object      # @.str.127
.L.str.127:
	.asciz	"LDA_zpg"
	.size	.L.str.127, 8

	.type	.L.str.128,@object      # @.str.128
.L.str.128:
	.asciz	"LDX_zpg"
	.size	.L.str.128, 8

	.type	.L.str.129,@object      # @.str.129
.L.str.129:
	.asciz	"LAX_zpg"
	.size	.L.str.129, 8

	.type	.L.str.130,@object      # @.str.130
.L.str.130:
	.asciz	"TAY"
	.size	.L.str.130, 4

	.type	.L.str.131,@object      # @.str.131
.L.str.131:
	.asciz	"LDA_imm"
	.size	.L.str.131, 8

	.type	.L.str.132,@object      # @.str.132
.L.str.132:
	.asciz	"TAX"
	.size	.L.str.132, 4

	.type	.L.str.133,@object      # @.str.133
.L.str.133:
	.asciz	"LDY_abss"
	.size	.L.str.133, 9

	.type	.L.str.134,@object      # @.str.134
.L.str.134:
	.asciz	"LDA_abss"
	.size	.L.str.134, 9

	.type	.L.str.135,@object      # @.str.135
.L.str.135:
	.asciz	"LDX_abss"
	.size	.L.str.135, 9

	.type	.L.str.136,@object      # @.str.136
.L.str.136:
	.asciz	"LAX_abss"
	.size	.L.str.136, 9

	.type	.L.str.137,@object      # @.str.137
.L.str.137:
	.asciz	"BCS"
	.size	.L.str.137, 4

	.type	.L.str.138,@object      # @.str.138
.L.str.138:
	.asciz	"LDA_indy"
	.size	.L.str.138, 9

	.type	.L.str.139,@object      # @.str.139
.L.str.139:
	.asciz	"LAX_indy"
	.size	.L.str.139, 9

	.type	.L.str.140,@object      # @.str.140
.L.str.140:
	.asciz	"LDY_zpgx"
	.size	.L.str.140, 9

	.type	.L.str.141,@object      # @.str.141
.L.str.141:
	.asciz	"LDA_zpgx"
	.size	.L.str.141, 9

	.type	.L.str.142,@object      # @.str.142
.L.str.142:
	.asciz	"LDX_zpgy"
	.size	.L.str.142, 9

	.type	.L.str.143,@object      # @.str.143
.L.str.143:
	.asciz	"LAX_zpgy"
	.size	.L.str.143, 9

	.type	.L.str.144,@object      # @.str.144
.L.str.144:
	.asciz	"CLV"
	.size	.L.str.144, 4

	.type	.L.str.145,@object      # @.str.145
.L.str.145:
	.asciz	"LDA_absy"
	.size	.L.str.145, 9

	.type	.L.str.146,@object      # @.str.146
.L.str.146:
	.asciz	"TSPX"
	.size	.L.str.146, 5

	.type	.L.str.147,@object      # @.str.147
.L.str.147:
	.asciz	"LDY_absx"
	.size	.L.str.147, 9

	.type	.L.str.148,@object      # @.str.148
.L.str.148:
	.asciz	"LDA_absx"
	.size	.L.str.148, 9

	.type	.L.str.149,@object      # @.str.149
.L.str.149:
	.asciz	"LDX_absy"
	.size	.L.str.149, 9

	.type	.L.str.150,@object      # @.str.150
.L.str.150:
	.asciz	"LAX_absy"
	.size	.L.str.150, 9

	.type	.L.str.151,@object      # @.str.151
.L.str.151:
	.asciz	"CPY_imm"
	.size	.L.str.151, 8

	.type	.L.str.152,@object      # @.str.152
.L.str.152:
	.asciz	"CMP_xind"
	.size	.L.str.152, 9

	.type	.L.str.153,@object      # @.str.153
.L.str.153:
	.asciz	"DCP_xind"
	.size	.L.str.153, 9

	.type	.L.str.154,@object      # @.str.154
.L.str.154:
	.asciz	"CPY_zpg"
	.size	.L.str.154, 8

	.type	.L.str.155,@object      # @.str.155
.L.str.155:
	.asciz	"CMP_zpg"
	.size	.L.str.155, 8

	.type	.L.str.156,@object      # @.str.156
.L.str.156:
	.asciz	"DEC_zpg"
	.size	.L.str.156, 8

	.type	.L.str.157,@object      # @.str.157
.L.str.157:
	.asciz	"DCP_zpg"
	.size	.L.str.157, 8

	.type	.L.str.158,@object      # @.str.158
.L.str.158:
	.asciz	"INY"
	.size	.L.str.158, 4

	.type	.L.str.159,@object      # @.str.159
.L.str.159:
	.asciz	"CMP_imm"
	.size	.L.str.159, 8

	.type	.L.str.160,@object      # @.str.160
.L.str.160:
	.asciz	"DEX"
	.size	.L.str.160, 4

	.type	.L.str.161,@object      # @.str.161
.L.str.161:
	.asciz	"CPY_abss"
	.size	.L.str.161, 9

	.type	.L.str.162,@object      # @.str.162
.L.str.162:
	.asciz	"CMP_abss"
	.size	.L.str.162, 9

	.type	.L.str.163,@object      # @.str.163
.L.str.163:
	.asciz	"DEC_abss"
	.size	.L.str.163, 9

	.type	.L.str.164,@object      # @.str.164
.L.str.164:
	.asciz	"DCP_abss"
	.size	.L.str.164, 9

	.type	.L.str.165,@object      # @.str.165
.L.str.165:
	.asciz	"BZC"
	.size	.L.str.165, 4

	.type	.L.str.166,@object      # @.str.166
.L.str.166:
	.asciz	"CMP_indy"
	.size	.L.str.166, 9

	.type	.L.str.167,@object      # @.str.167
.L.str.167:
	.asciz	"DCP_indy"
	.size	.L.str.167, 9

	.type	.L.str.168,@object      # @.str.168
.L.str.168:
	.asciz	"CMP_zpgx"
	.size	.L.str.168, 9

	.type	.L.str.169,@object      # @.str.169
.L.str.169:
	.asciz	"DEC_zpgx"
	.size	.L.str.169, 9

	.type	.L.str.170,@object      # @.str.170
.L.str.170:
	.asciz	"DCP_zpgx"
	.size	.L.str.170, 9

	.type	.L.str.171,@object      # @.str.171
.L.str.171:
	.asciz	"CLD"
	.size	.L.str.171, 4

	.type	.L.str.172,@object      # @.str.172
.L.str.172:
	.asciz	"CMP_absy"
	.size	.L.str.172, 9

	.type	.L.str.173,@object      # @.str.173
.L.str.173:
	.asciz	"DCP_absy"
	.size	.L.str.173, 9

	.type	.L.str.174,@object      # @.str.174
.L.str.174:
	.asciz	"CMP_absx"
	.size	.L.str.174, 9

	.type	.L.str.175,@object      # @.str.175
.L.str.175:
	.asciz	"DEC_absx"
	.size	.L.str.175, 9

	.type	.L.str.176,@object      # @.str.176
.L.str.176:
	.asciz	"DCP_absx"
	.size	.L.str.176, 9

	.type	.L.str.177,@object      # @.str.177
.L.str.177:
	.asciz	"CPX_imm"
	.size	.L.str.177, 8

	.type	.L.str.178,@object      # @.str.178
.L.str.178:
	.asciz	"SBC_xind"
	.size	.L.str.178, 9

	.type	.L.str.179,@object      # @.str.179
.L.str.179:
	.asciz	"CPX_zpg"
	.size	.L.str.179, 8

	.type	.L.str.180,@object      # @.str.180
.L.str.180:
	.asciz	"SBC_zpg"
	.size	.L.str.180, 8

	.type	.L.str.181,@object      # @.str.181
.L.str.181:
	.asciz	"INC_zpg"
	.size	.L.str.181, 8

	.type	.L.str.182,@object      # @.str.182
.L.str.182:
	.asciz	"INX"
	.size	.L.str.182, 4

	.type	.L.str.183,@object      # @.str.183
.L.str.183:
	.asciz	"SBC_imm"
	.size	.L.str.183, 8

	.type	.L.str.184,@object      # @.str.184
.L.str.184:
	.asciz	"CPX_abss"
	.size	.L.str.184, 9

	.type	.L.str.185,@object      # @.str.185
.L.str.185:
	.asciz	"SBC_abss"
	.size	.L.str.185, 9

	.type	.L.str.186,@object      # @.str.186
.L.str.186:
	.asciz	"INC_abss"
	.size	.L.str.186, 9

	.type	.L.str.187,@object      # @.str.187
.L.str.187:
	.asciz	"BZS"
	.size	.L.str.187, 4

	.type	.L.str.188,@object      # @.str.188
.L.str.188:
	.asciz	"SBC_indy"
	.size	.L.str.188, 9

	.type	.L.str.189,@object      # @.str.189
.L.str.189:
	.asciz	"SBC_zpgx"
	.size	.L.str.189, 9

	.type	.L.str.190,@object      # @.str.190
.L.str.190:
	.asciz	"INC_zpgx"
	.size	.L.str.190, 9

	.type	.L.str.191,@object      # @.str.191
.L.str.191:
	.asciz	"SED"
	.size	.L.str.191, 4

	.type	.L.str.192,@object      # @.str.192
.L.str.192:
	.asciz	"SBC_absy"
	.size	.L.str.192, 9

	.type	.L.str.193,@object      # @.str.193
.L.str.193:
	.asciz	"SBC_absx"
	.size	.L.str.193, 9

	.type	.L.str.194,@object      # @.str.194
.L.str.194:
	.asciz	"INC_absx"
	.size	.L.str.194, 9

	.type	instructions,@object    # @instructions
	.data
	.globl	instructions
	.p2align	4
instructions:
	.quad	.L.str.5
	.quad	.L.str.6
	.quad	.L.str.7
	.quad	.L.str.8
	.quad	.L.str.9
	.quad	.L.str.10
	.quad	.L.str.11
	.quad	.L.str.12
	.quad	.L.str.13
	.quad	.L.str.14
	.quad	.L.str.15
	.quad	.L.str.7
	.quad	.L.str.16
	.quad	.L.str.17
	.quad	.L.str.18
	.quad	.L.str.19
	.quad	.L.str.20
	.quad	.L.str.21
	.quad	.L.str.7
	.quad	.L.str.22
	.quad	.L.str.23
	.quad	.L.str.24
	.quad	.L.str.25
	.quad	.L.str.26
	.quad	.L.str.27
	.quad	.L.str.28
	.quad	.L.str.29
	.quad	.L.str.30
	.quad	.L.str.31
	.quad	.L.str.32
	.quad	.L.str.33
	.quad	.L.str.34
	.quad	.L.str.35
	.quad	.L.str.36
	.quad	.L.str.7
	.quad	.L.str.7
	.quad	.L.str.37
	.quad	.L.str.38
	.quad	.L.str.39
	.quad	.L.str.7
	.quad	.L.str.40
	.quad	.L.str.41
	.quad	.L.str.42
	.quad	.L.str.7
	.quad	.L.str.43
	.quad	.L.str.44
	.quad	.L.str.45
	.quad	.L.str.7
	.quad	.L.str.46
	.quad	.L.str.47
	.quad	.L.str.7
	.quad	.L.str.7
	.quad	.L.str.23
	.quad	.L.str.48
	.quad	.L.str.49
	.quad	.L.str.7
	.quad	.L.str.50
	.quad	.L.str.51
	.quad	.L.str.29
	.quad	.L.str.7
	.quad	.L.str.31
	.quad	.L.str.52
	.quad	.L.str.53
	.quad	.L.str.7
	.quad	.L.str.54
	.quad	.L.str.55
	.quad	.L.str.7
	.quad	.L.str.56
	.quad	.L.str.9
	.quad	.L.str.57
	.quad	.L.str.58
	.quad	.L.str.59
	.quad	.L.str.60
	.quad	.L.str.61
	.quad	.L.str.62
	.quad	.L.str.7
	.quad	.L.str.63
	.quad	.L.str.64
	.quad	.L.str.65
	.quad	.L.str.66
	.quad	.L.str.67
	.quad	.L.str.68
	.quad	.L.str.7
	.quad	.L.str.69
	.quad	.L.str.23
	.quad	.L.str.70
	.quad	.L.str.71
	.quad	.L.str.72
	.quad	.L.str.73
	.quad	.L.str.74
	.quad	.L.str.29
	.quad	.L.str.75
	.quad	.L.str.31
	.quad	.L.str.76
	.quad	.L.str.77
	.quad	.L.str.78
	.quad	.L.str.79
	.quad	.L.str.80
	.quad	.L.str.7
	.quad	.L.str.7
	.quad	.L.str.9
	.quad	.L.str.81
	.quad	.L.str.82
	.quad	.L.str.7
	.quad	.L.str.83
	.quad	.L.str.84
	.quad	.L.str.85
	.quad	.L.str.7
	.quad	.L.str.86
	.quad	.L.str.87
	.quad	.L.str.88
	.quad	.L.str.7
	.quad	.L.str.89
	.quad	.L.str.90
	.quad	.L.str.7
	.quad	.L.str.7
	.quad	.L.str.23
	.quad	.L.str.91
	.quad	.L.str.92
	.quad	.L.str.7
	.quad	.L.str.93
	.quad	.L.str.94
	.quad	.L.str.29
	.quad	.L.str.7
	.quad	.L.str.31
	.quad	.L.str.95
	.quad	.L.str.96
	.quad	.L.str.7
	.quad	.L.str.97
	.quad	.L.str.98
	.quad	.L.str.7
	.quad	.L.str.99
	.quad	.L.str.100
	.quad	.L.str.101
	.quad	.L.str.102
	.quad	.L.str.103
	.quad	.L.str.104
	.quad	.L.str.7
	.quad	.L.str.105
	.quad	.L.str.7
	.quad	.L.str.106
	.quad	.L.str.107
	.quad	.L.str.108
	.quad	.L.str.109
	.quad	.L.str.110
	.quad	.L.str.111
	.quad	.L.str.7
	.quad	.L.str.7
	.quad	.L.str.112
	.quad	.L.str.113
	.quad	.L.str.114
	.quad	.L.str.115
	.quad	.L.str.116
	.quad	.L.str.117
	.quad	.L.str.118
	.quad	.L.str.7
	.quad	.L.str.119
	.quad	.L.str.120
	.quad	.L.str.121
	.quad	.L.str.7
	.quad	.L.str.122
	.quad	.L.str.123
	.quad	.L.str.124
	.quad	.L.str.125
	.quad	.L.str.126
	.quad	.L.str.127
	.quad	.L.str.128
	.quad	.L.str.129
	.quad	.L.str.130
	.quad	.L.str.131
	.quad	.L.str.132
	.quad	.L.str.7
	.quad	.L.str.133
	.quad	.L.str.134
	.quad	.L.str.135
	.quad	.L.str.136
	.quad	.L.str.137
	.quad	.L.str.138
	.quad	.L.str.7
	.quad	.L.str.139
	.quad	.L.str.140
	.quad	.L.str.141
	.quad	.L.str.142
	.quad	.L.str.143
	.quad	.L.str.144
	.quad	.L.str.145
	.quad	.L.str.146
	.quad	.L.str.7
	.quad	.L.str.147
	.quad	.L.str.148
	.quad	.L.str.149
	.quad	.L.str.150
	.quad	.L.str.151
	.quad	.L.str.152
	.quad	.L.str.7
	.quad	.L.str.153
	.quad	.L.str.154
	.quad	.L.str.155
	.quad	.L.str.156
	.quad	.L.str.157
	.quad	.L.str.158
	.quad	.L.str.159
	.quad	.L.str.160
	.quad	.L.str.7
	.quad	.L.str.161
	.quad	.L.str.162
	.quad	.L.str.163
	.quad	.L.str.164
	.quad	.L.str.165
	.quad	.L.str.166
	.quad	.L.str.7
	.quad	.L.str.167
	.quad	.L.str.23
	.quad	.L.str.168
	.quad	.L.str.169
	.quad	.L.str.170
	.quad	.L.str.171
	.quad	.L.str.172
	.quad	.L.str.29
	.quad	.L.str.173
	.quad	.L.str.31
	.quad	.L.str.174
	.quad	.L.str.175
	.quad	.L.str.176
	.quad	.L.str.177
	.quad	.L.str.178
	.quad	.L.str.7
	.quad	.L.str.7
	.quad	.L.str.179
	.quad	.L.str.180
	.quad	.L.str.181
	.quad	.L.str.7
	.quad	.L.str.182
	.quad	.L.str.183
	.quad	.L.str.29
	.quad	.L.str.183
	.quad	.L.str.184
	.quad	.L.str.185
	.quad	.L.str.186
	.quad	.L.str.7
	.quad	.L.str.187
	.quad	.L.str.188
	.quad	.L.str.7
	.quad	.L.str.7
	.quad	.L.str.23
	.quad	.L.str.189
	.quad	.L.str.190
	.quad	.L.str.7
	.quad	.L.str.191
	.quad	.L.str.192
	.quad	.L.str.29
	.quad	.L.str.7
	.quad	.L.str.31
	.quad	.L.str.193
	.quad	.L.str.194
	.quad	.L.str.7
	.size	instructions, 2048

	.type	counter,@object         # @counter
	.bss
	.globl	counter
	.p2align	2
counter:
	.long	0                       # 0x0
	.size	counter, 4

	.type	cpuopmap,@object        # @cpuopmap
	.section	.rodata,"a",@progbits
	.p2align	4
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
	.quad	DCP_xind
	.quad	CPY_zpg
	.quad	CMP_zpg
	.quad	DEC_zpg
	.quad	DCP_zpg
	.quad	INY
	.quad	CMP_imm
	.quad	DEX
	.quad	ERR
	.quad	CPY_abss
	.quad	CMP_abss
	.quad	DEC_abss
	.quad	DCP_abss
	.quad	BZC
	.quad	CMP_indy
	.quad	ERR
	.quad	DCP_indy
	.quad	NOP_zpgx
	.quad	CMP_zpgx
	.quad	DEC_zpgx
	.quad	DCP_zpgx
	.quad	CLD
	.quad	CMP_absy
	.quad	NOP
	.quad	DCP_absy
	.quad	NOP_absx
	.quad	CMP_absx
	.quad	DEC_absx
	.quad	DCP_absx
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
	.size	cpuopmap, 2048

	.type	pc_expected,@object     # @pc_expected
	.comm	pc_expected,17984,16
	.type	opcode_expected,@object # @opcode_expected
	.comm	opcode_expected,8992,16
	.type	a_expected,@object      # @a_expected
	.comm	a_expected,8992,16
	.type	x_expected,@object      # @x_expected
	.comm	x_expected,8992,16
	.type	y_expected,@object      # @y_expected
	.comm	y_expected,8992,16
	.type	flag_expected,@object   # @flag_expected
	.comm	flag_expected,8992,16
	.type	sp_expected,@object     # @sp_expected
	.comm	sp_expected,8992,16
	.ident	"clang version 10.0.0-4ubuntu1 "
	.section	".note.GNU-stack","",@progbits
	.addrsig
	.addrsig_sym BRK
	.addrsig_sym CLC
	.addrsig_sym CLI
	.addrsig_sym CLV
	.addrsig_sym CLD
	.addrsig_sym SEC
	.addrsig_sym SEI
	.addrsig_sym SED
	.addrsig_sym ORA_imm
	.addrsig_sym ORA_zpg
	.addrsig_sym ORA_zpgx
	.addrsig_sym ORA_abss
	.addrsig_sym ORA_absx
	.addrsig_sym ORA_absy
	.addrsig_sym ORA_xind
	.addrsig_sym ORA_indy
	.addrsig_sym ASL_zpg
	.addrsig_sym ASL_zpgx
	.addrsig_sym ASL_abss
	.addrsig_sym ASL_absx
	.addrsig_sym ASLA
	.addrsig_sym SLO_zpg
	.addrsig_sym SLO_zpgx
	.addrsig_sym SLO_abss
	.addrsig_sym SLO_absx
	.addrsig_sym SLO_absy
	.addrsig_sym SLO_xind
	.addrsig_sym SLO_indy
	.addrsig_sym SRE_zpg
	.addrsig_sym SRE_zpgx
	.addrsig_sym SRE_abss
	.addrsig_sym SRE_absx
	.addrsig_sym SRE_absy
	.addrsig_sym SRE_xind
	.addrsig_sym SRE_indy
	.addrsig_sym JSR
	.addrsig_sym BIT_zpg
	.addrsig_sym BIT_abss
	.addrsig_sym AND_imm
	.addrsig_sym AND_zpg
	.addrsig_sym AND_zpgx
	.addrsig_sym AND_abss
	.addrsig_sym AND_absx
	.addrsig_sym AND_absy
	.addrsig_sym AND_xind
	.addrsig_sym AND_indy
	.addrsig_sym ROL_zpg
	.addrsig_sym ROL_zpgx
	.addrsig_sym ROL_abss
	.addrsig_sym ROL_absx
	.addrsig_sym ROLA
	.addrsig_sym JMP_abss
	.addrsig_sym JMP_ind
	.addrsig_sym LSR_zpg
	.addrsig_sym LSR_zpgx
	.addrsig_sym LSR_abss
	.addrsig_sym LSR_absx
	.addrsig_sym LSRA
	.addrsig_sym EOR_imm
	.addrsig_sym EOR_zpg
	.addrsig_sym EOR_zpgx
	.addrsig_sym EOR_abss
	.addrsig_sym EOR_absx
	.addrsig_sym EOR_absy
	.addrsig_sym EOR_xind
	.addrsig_sym EOR_indy
	.addrsig_sym ADC_imm
	.addrsig_sym ADC_zpg
	.addrsig_sym ADC_zpgx
	.addrsig_sym ADC_abss
	.addrsig_sym ADC_absx
	.addrsig_sym ADC_absy
	.addrsig_sym ADC_xind
	.addrsig_sym ADC_indy
	.addrsig_sym SBC_imm
	.addrsig_sym SBC_zpg
	.addrsig_sym SBC_zpgx
	.addrsig_sym SBC_abss
	.addrsig_sym SBC_absx
	.addrsig_sym SBC_absy
	.addrsig_sym SBC_xind
	.addrsig_sym SBC_indy
	.addrsig_sym CMP_imm
	.addrsig_sym CMP_zpg
	.addrsig_sym CMP_zpgx
	.addrsig_sym CMP_abss
	.addrsig_sym CMP_absx
	.addrsig_sym CMP_absy
	.addrsig_sym CMP_xind
	.addrsig_sym CMP_indy
	.addrsig_sym CPX_imm
	.addrsig_sym CPX_zpg
	.addrsig_sym CPX_abss
	.addrsig_sym CPY_imm
	.addrsig_sym CPY_zpg
	.addrsig_sym CPY_abss
	.addrsig_sym ROR_zpg
	.addrsig_sym ROR_zpgx
	.addrsig_sym ROR_abss
	.addrsig_sym ROR_absx
	.addrsig_sym RORA
	.addrsig_sym STA_zpg
	.addrsig_sym STA_zpgx
	.addrsig_sym STA_abss
	.addrsig_sym STA_absx
	.addrsig_sym STA_absy
	.addrsig_sym STA_xind
	.addrsig_sym STA_indy
	.addrsig_sym STX_zpg
	.addrsig_sym STX_zpgy
	.addrsig_sym STX_abss
	.addrsig_sym STY_zpg
	.addrsig_sym STY_zpgx
	.addrsig_sym STY_abss
	.addrsig_sym SAX_zpg
	.addrsig_sym SAX_xind
	.addrsig_sym SAX_abss
	.addrsig_sym SAX_zpgy
	.addrsig_sym SXA_absy
	.addrsig_sym SYA_absx
	.addrsig_sym TAX
	.addrsig_sym TAY
	.addrsig_sym TSPX
	.addrsig_sym TXA
	.addrsig_sym TYA
	.addrsig_sym TXS
	.addrsig_sym LDA_imm
	.addrsig_sym LDA_zpg
	.addrsig_sym LDA_zpgx
	.addrsig_sym LDA_abss
	.addrsig_sym LDA_absx
	.addrsig_sym LDA_absy
	.addrsig_sym LDA_xind
	.addrsig_sym LDA_indy
	.addrsig_sym LDX_imm
	.addrsig_sym LDX_zpg
	.addrsig_sym LDX_zpgy
	.addrsig_sym LDX_abss
	.addrsig_sym LDX_absy
	.addrsig_sym LDY_imm
	.addrsig_sym LDY_zpg
	.addrsig_sym LDY_zpgx
	.addrsig_sym LDY_abss
	.addrsig_sym LDY_absx
	.addrsig_sym LAX_xind
	.addrsig_sym LAX_zpg
	.addrsig_sym LAX_abss
	.addrsig_sym LAX_indy
	.addrsig_sym LAX_zpgy
	.addrsig_sym LAX_absy
	.addrsig_sym BCC
	.addrsig_sym BCS
	.addrsig_sym BZC
	.addrsig_sym BZS
	.addrsig_sym BVC
	.addrsig_sym BVS
	.addrsig_sym BNC
	.addrsig_sym BNS
	.addrsig_sym INC_zpg
	.addrsig_sym INC_zpgx
	.addrsig_sym INC_abss
	.addrsig_sym INC_absx
	.addrsig_sym INX
	.addrsig_sym INY
	.addrsig_sym DEC_zpg
	.addrsig_sym DEC_zpgx
	.addrsig_sym DEC_abss
	.addrsig_sym DEC_absx
	.addrsig_sym DEX
	.addrsig_sym DEY
	.addrsig_sym DCP_zpg
	.addrsig_sym DCP_zpgx
	.addrsig_sym DCP_abss
	.addrsig_sym DCP_absx
	.addrsig_sym DCP_absy
	.addrsig_sym DCP_xind
	.addrsig_sym DCP_indy
	.addrsig_sym PLA
	.addrsig_sym PHA
	.addrsig_sym PLP
	.addrsig_sym PHP
	.addrsig_sym RTI
	.addrsig_sym RTS
	.addrsig_sym ERR
	.addrsig_sym NOP
	.addrsig_sym NOP_imm
	.addrsig_sym NOP_zpg
	.addrsig_sym NOP_zpgx
	.addrsig_sym NOP_abss
	.addrsig_sym NOP_absx

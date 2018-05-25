	.file	"semantic_function_2.cpp"
	.text
	.globl	op2_nop
	.type	op2_nop, @function
op2_nop:
.LFB1809:
	.cfi_startproc
	rep ret
	.cfi_endproc
.LFE1809:
	.size	op2_nop, .-op2_nop
	.globl	op2_push
	.type	op2_push, @function
op2_push:
.LFB1810:
	.cfi_startproc
	movsd	%xmm0, 8(%rdi)
	pxor	%xmm0, %xmm0
	cvtsi2sd	%esi, %xmm0
	ret
	.cfi_endproc
.LFE1810:
	.size	op2_push, .-op2_push
	.globl	op2_add
	.type	op2_add, @function
op2_add:
.LFB1811:
	.cfi_startproc
	addsd	(%rdi), %xmm0
	ret
	.cfi_endproc
.LFE1811:
	.size	op2_add, .-op2_add
	.globl	op2_mul
	.type	op2_mul, @function
op2_mul:
.LFB1812:
	.cfi_startproc
	mulsd	(%rdi), %xmm0
	ret
	.cfi_endproc
.LFE1812:
	.size	op2_mul, .-op2_mul
	.globl	op2_sub
	.type	op2_sub, @function
op2_sub:
.LFB1813:
	.cfi_startproc
	movsd	(%rdi), %xmm1
	subsd	%xmm0, %xmm1
	movapd	%xmm1, %xmm0
	ret
	.cfi_endproc
.LFE1813:
	.size	op2_sub, .-op2_sub
	.globl	op2_div
	.type	op2_div, @function
op2_div:
.LFB1814:
	.cfi_startproc
	movsd	(%rdi), %xmm1
	divsd	%xmm0, %xmm1
	movapd	%xmm1, %xmm0
	ret
	.cfi_endproc
.LFE1814:
	.size	op2_div, .-op2_div
	.globl	op2_pow
	.type	op2_pow, @function
op2_pow:
.LFB1815:
	.cfi_startproc
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	movapd	%xmm0, %xmm1
	movsd	(%rdi), %xmm0
	call	pow@PLT
	addq	$8, %rsp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE1815:
	.size	op2_pow, .-op2_pow
	.globl	op2_sqrt
	.type	op2_sqrt, @function
op2_sqrt:
.LFB1816:
	.cfi_startproc
	subq	$24, %rsp
	.cfi_def_cfa_offset 32
	sqrtsd	%xmm0, %xmm2
	movsd	%xmm2, 8(%rsp)
	pxor	%xmm1, %xmm1
	ucomisd	%xmm0, %xmm1
	ja	.L12
.L9:
	movsd	8(%rsp), %xmm0
	addq	$24, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.L12:
	.cfi_restore_state
	call	sqrt@PLT
	jmp	.L9
	.cfi_endproc
.LFE1816:
	.size	op2_sqrt, .-op2_sqrt
	.globl	op2_out
	.type	op2_out, @function
op2_out:
.LFB1817:
	.cfi_startproc
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	movq	%rdi, %r12
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZNSo9_M_insertIdEERSoT_@PLT
	movq	%rax, %rbp
	movq	(%rax), %rax
	movq	-24(%rax), %rax
	movq	240(%rbp,%rax), %rbx
	testq	%rbx, %rbx
	je	.L18
	cmpb	$0, 56(%rbx)
	je	.L15
	movzbl	67(%rbx), %eax
.L16:
	movsbl	%al, %esi
	movq	%rbp, %rdi
	call	_ZNSo3putEc@PLT
	movq	%rax, %rdi
	call	_ZNSo5flushEv@PLT
	movsd	(%r12), %xmm0
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
.L18:
	.cfi_restore_state
	call	_ZSt16__throw_bad_castv@PLT
.L15:
	movq	%rbx, %rdi
	call	_ZNKSt5ctypeIcE13_M_widen_initEv@PLT
	movq	(%rbx), %rax
	movl	$10, %esi
	movq	%rbx, %rdi
	call	*48(%rax)
	jmp	.L16
	.cfi_endproc
.LFE1817:
	.size	op2_out, .-op2_out
	.globl	op2_je
	.type	op2_je, @function
op2_je:
.LFB1818:
	.cfi_startproc
	ucomisd	(%rdi), %xmm0
	setnp	%al
	movl	$0, %edx
	cmovne	%edx, %eax
	ret
	.cfi_endproc
.LFE1818:
	.size	op2_je, .-op2_je
	.globl	op2_jne
	.type	op2_jne, @function
op2_jne:
.LFB1819:
	.cfi_startproc
	ucomisd	(%rdi), %xmm0
	setp	%al
	movl	$1, %edx
	cmovne	%edx, %eax
	ret
	.cfi_endproc
.LFE1819:
	.size	op2_jne, .-op2_jne
	.globl	op2_ja
	.type	op2_ja, @function
op2_ja:
.LFB1820:
	.cfi_startproc
	movsd	(%rdi), %xmm1
	ucomisd	%xmm0, %xmm1
	seta	%al
	ret
	.cfi_endproc
.LFE1820:
	.size	op2_ja, .-op2_ja
	.globl	op2_jae
	.type	op2_jae, @function
op2_jae:
.LFB1821:
	.cfi_startproc
	movsd	(%rdi), %xmm1
	ucomisd	%xmm0, %xmm1
	setnb	%al
	ret
	.cfi_endproc
.LFE1821:
	.size	op2_jae, .-op2_jae
	.globl	op2_jb
	.type	op2_jb, @function
op2_jb:
.LFB1822:
	.cfi_startproc
	ucomisd	(%rdi), %xmm0
	seta	%al
	ret
	.cfi_endproc
.LFE1822:
	.size	op2_jb, .-op2_jb
	.globl	op2_jbe
	.type	op2_jbe, @function
op2_jbe:
.LFB1823:
	.cfi_startproc
	ucomisd	(%rdi), %xmm0
	setnb	%al
	ret
	.cfi_endproc
.LFE1823:
	.size	op2_jbe, .-op2_jbe
	.globl	op2_pop_ax
	.type	op2_pop_ax, @function
op2_pop_ax:
.LFB1824:
	.cfi_startproc
	movsd	%xmm0, 88+cpu(%rip)
	movsd	(%rdi), %xmm0
	ret
	.cfi_endproc
.LFE1824:
	.size	op2_pop_ax, .-op2_pop_ax
	.globl	op2_pop_bx
	.type	op2_pop_bx, @function
op2_pop_bx:
.LFB1825:
	.cfi_startproc
	movsd	%xmm0, 96+cpu(%rip)
	movsd	(%rdi), %xmm0
	ret
	.cfi_endproc
.LFE1825:
	.size	op2_pop_bx, .-op2_pop_bx
	.globl	op2_pop_cx
	.type	op2_pop_cx, @function
op2_pop_cx:
.LFB1826:
	.cfi_startproc
	movsd	%xmm0, 104+cpu(%rip)
	movsd	(%rdi), %xmm0
	ret
	.cfi_endproc
.LFE1826:
	.size	op2_pop_cx, .-op2_pop_cx
	.globl	op2_pop_dx
	.type	op2_pop_dx, @function
op2_pop_dx:
.LFB1827:
	.cfi_startproc
	movsd	%xmm0, 112+cpu(%rip)
	movsd	(%rdi), %xmm0
	ret
	.cfi_endproc
.LFE1827:
	.size	op2_pop_dx, .-op2_pop_dx
	.globl	op2_push_ax
	.type	op2_push_ax, @function
op2_push_ax:
.LFB1828:
	.cfi_startproc
	movsd	%xmm0, 8(%rdi)
	movsd	88+cpu(%rip), %xmm0
	ret
	.cfi_endproc
.LFE1828:
	.size	op2_push_ax, .-op2_push_ax
	.globl	op2_push_bx
	.type	op2_push_bx, @function
op2_push_bx:
.LFB1829:
	.cfi_startproc
	movsd	%xmm0, 8(%rdi)
	movsd	96+cpu(%rip), %xmm0
	ret
	.cfi_endproc
.LFE1829:
	.size	op2_push_bx, .-op2_push_bx
	.globl	op2_push_cx
	.type	op2_push_cx, @function
op2_push_cx:
.LFB1830:
	.cfi_startproc
	movsd	%xmm0, 8(%rdi)
	movsd	104+cpu(%rip), %xmm0
	ret
	.cfi_endproc
.LFE1830:
	.size	op2_push_cx, .-op2_push_cx
	.globl	op2_push_dx
	.type	op2_push_dx, @function
op2_push_dx:
.LFB1831:
	.cfi_startproc
	movsd	%xmm0, 8(%rdi)
	movsd	112+cpu(%rip), %xmm0
	ret
	.cfi_endproc
.LFE1831:
	.size	op2_push_dx, .-op2_push_dx
	.globl	op2_ld
	.type	op2_ld, @function
op2_ld:
.LFB1832:
	.cfi_startproc
	cvttsd2si	%xmm0, %eax
	cltq
	leaq	cpu(%rip), %rdx
	movsd	4216(%rdx,%rax,8), %xmm0
	ret
	.cfi_endproc
.LFE1832:
	.size	op2_ld, .-op2_ld
	.globl	op2_st
	.type	op2_st, @function
op2_st:
.LFB1833:
	.cfi_startproc
	cvttsd2si	(%rdi), %eax
	cltq
	leaq	cpu(%rip), %rdx
	movsd	%xmm0, 4216(%rdx,%rax,8)
	movsd	-16(%rdi), %xmm0
	ret
	.cfi_endproc
.LFE1833:
	.size	op2_st, .-op2_st
	.globl	op2_halt
	.type	op2_halt, @function
op2_halt:
.LFB1834:
	.cfi_startproc
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	movl	$0, %edi
	call	exit@PLT
	.cfi_endproc
.LFE1834:
	.size	op2_halt, .-op2_halt
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC1:
	.string	"VVedite chislo : "
	.text
	.globl	op2_in
	.type	op2_in, @function
op2_in:
.LFB1835:
	.cfi_startproc
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	subq	$16, %rsp
	.cfi_def_cfa_offset 32
	movq	%fs:40, %rax
	movq	%rax, 8(%rsp)
	xorl	%eax, %eax
	movsd	%xmm0, 8(%rdi)
	movl	$0, 4(%rsp)
	movl	$17, %edx
	leaq	.LC1(%rip), %rsi
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	leaq	4(%rsp), %rsi
	leaq	_ZSt3cin(%rip), %rdi
	call	_ZNSirsERi@PLT
	movq	_ZSt4cout(%rip), %rax
	movq	-24(%rax), %rax
	leaq	_ZSt4cout(%rip), %rdx
	movq	240(%rdx,%rax), %rbx
	testq	%rbx, %rbx
	je	.L43
	cmpb	$0, 56(%rbx)
	je	.L39
	movzbl	67(%rbx), %eax
.L40:
	movsbl	%al, %esi
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZNSo3putEc@PLT
	movq	%rax, %rdi
	call	_ZNSo5flushEv@PLT
	pxor	%xmm0, %xmm0
	cvtsi2sd	4(%rsp), %xmm0
	movq	8(%rsp), %rax
	xorq	%fs:40, %rax
	jne	.L44
	addq	$16, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 16
	popq	%rbx
	.cfi_def_cfa_offset 8
	ret
.L43:
	.cfi_restore_state
	call	_ZSt16__throw_bad_castv@PLT
.L39:
	movq	%rbx, %rdi
	call	_ZNKSt5ctypeIcE13_M_widen_initEv@PLT
	movq	(%rbx), %rax
	movl	$10, %esi
	movq	%rbx, %rdi
	call	*48(%rax)
	jmp	.L40
.L44:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE1835:
	.size	op2_in, .-op2_in
	.section	.rodata.str1.1
.LC2:
	.string	"end"
	.text
	.globl	op2_end
	.type	op2_end, @function
op2_end:
.LFB1836:
	.cfi_startproc
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	subq	$16, %rsp
	.cfi_def_cfa_offset 32
	movsd	%xmm0, 8(%rsp)
	movl	$3, %edx
	leaq	.LC2(%rip), %rsi
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	movq	_ZSt4cout(%rip), %rax
	movq	-24(%rax), %rax
	leaq	_ZSt4cout(%rip), %rdx
	movq	240(%rdx,%rax), %rbx
	testq	%rbx, %rbx
	je	.L50
	cmpb	$0, 56(%rbx)
	je	.L47
	movzbl	67(%rbx), %eax
.L48:
	movsbl	%al, %esi
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZNSo3putEc@PLT
	movq	%rax, %rdi
	call	_ZNSo5flushEv@PLT
	movsd	8(%rsp), %xmm0
	addq	$16, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 16
	popq	%rbx
	.cfi_def_cfa_offset 8
	ret
.L50:
	.cfi_restore_state
	call	_ZSt16__throw_bad_castv@PLT
.L47:
	movq	%rbx, %rdi
	call	_ZNKSt5ctypeIcE13_M_widen_initEv@PLT
	movq	(%rbx), %rax
	movl	$10, %esi
	movq	%rbx, %rdi
	call	*48(%rax)
	jmp	.L48
	.cfi_endproc
.LFE1836:
	.size	op2_end, .-op2_end
	.section	.rodata.str1.1
.LC3:
	.string	"no roots"
	.text
	.globl	op2_no_roots
	.type	op2_no_roots, @function
op2_no_roots:
.LFB1837:
	.cfi_startproc
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	subq	$16, %rsp
	.cfi_def_cfa_offset 32
	movsd	%xmm0, 8(%rsp)
	movl	$8, %edx
	leaq	.LC3(%rip), %rsi
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	movq	_ZSt4cout(%rip), %rax
	movq	-24(%rax), %rax
	leaq	_ZSt4cout(%rip), %rdx
	movq	240(%rdx,%rax), %rbx
	testq	%rbx, %rbx
	je	.L56
	cmpb	$0, 56(%rbx)
	je	.L53
	movzbl	67(%rbx), %eax
.L54:
	movsbl	%al, %esi
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZNSo3putEc@PLT
	movq	%rax, %rdi
	call	_ZNSo5flushEv@PLT
	movsd	8(%rsp), %xmm0
	addq	$16, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 16
	popq	%rbx
	.cfi_def_cfa_offset 8
	ret
.L56:
	.cfi_restore_state
	call	_ZSt16__throw_bad_castv@PLT
.L53:
	movq	%rbx, %rdi
	call	_ZNKSt5ctypeIcE13_M_widen_initEv@PLT
	movq	(%rbx), %rax
	movl	$10, %esi
	movq	%rbx, %rdi
	call	*48(%rax)
	jmp	.L54
	.cfi_endproc
.LFE1837:
	.size	op2_no_roots, .-op2_no_roots
	.section	.rodata.str1.1
.LC4:
	.string	"inf"
	.text
	.globl	op2_inf
	.type	op2_inf, @function
op2_inf:
.LFB1838:
	.cfi_startproc
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	subq	$16, %rsp
	.cfi_def_cfa_offset 32
	movsd	%xmm0, 8(%rsp)
	movl	$3, %edx
	leaq	.LC4(%rip), %rsi
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	movq	_ZSt4cout(%rip), %rax
	movq	-24(%rax), %rax
	leaq	_ZSt4cout(%rip), %rdx
	movq	240(%rdx,%rax), %rbx
	testq	%rbx, %rbx
	je	.L62
	cmpb	$0, 56(%rbx)
	je	.L59
	movzbl	67(%rbx), %eax
.L60:
	movsbl	%al, %esi
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZNSo3putEc@PLT
	movq	%rax, %rdi
	call	_ZNSo5flushEv@PLT
	movsd	8(%rsp), %xmm0
	addq	$16, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 16
	popq	%rbx
	.cfi_def_cfa_offset 8
	ret
.L62:
	.cfi_restore_state
	call	_ZSt16__throw_bad_castv@PLT
.L59:
	movq	%rbx, %rdi
	call	_ZNKSt5ctypeIcE13_M_widen_initEv@PLT
	movq	(%rbx), %rax
	movl	$10, %esi
	movq	%rbx, %rdi
	call	*48(%rax)
	jmp	.L60
	.cfi_endproc
.LFE1838:
	.size	op2_inf, .-op2_inf
	.globl	_Z12get_elem_ptrPdi
	.type	_Z12get_elem_ptrPdi, @function
_Z12get_elem_ptrPdi:
.LFB1839:
	.cfi_startproc
	movslq	%esi, %rsi
	negq	%rsi
	leaq	16(%rdi,%rsi,8), %rax
	ret
	.cfi_endproc
.LFE1839:
	.size	_Z12get_elem_ptrPdi, .-_Z12get_elem_ptrPdi
	.globl	op2_push_deep
	.type	op2_push_deep, @function
op2_push_deep:
.LFB1840:
	.cfi_startproc
	movapd	%xmm0, %xmm1
	cmpl	$1, %esi
	je	.L65
	movslq	%esi, %rsi
	negq	%rsi
	movsd	16(%rdi,%rsi,8), %xmm0
.L65:
	movsd	%xmm1, 8(%rdi)
	ret
	.cfi_endproc
.LFE1840:
	.size	op2_push_deep, .-op2_push_deep
	.globl	op2_pop_deep
	.type	op2_pop_deep, @function
op2_pop_deep:
.LFB1841:
	.cfi_startproc
	movl	$2, %eax
	subl	%esi, %eax
	cltq
	movsd	%xmm0, (%rdi,%rax,8)
	movsd	(%rdi), %xmm0
	ret
	.cfi_endproc
.LFE1841:
	.size	op2_pop_deep, .-op2_pop_deep
	.section	.rodata.str1.1
.LC5:
	.string	" :"
.LC6:
	.string	" "
	.text
	.globl	print_dump2
	.type	print_dump2, @function
print_dump2:
.LFB1842:
	.cfi_startproc
	pushq	%r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	pushq	%r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	pushq	%r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	pushq	%rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	subq	$16, %rsp
	.cfi_def_cfa_offset 64
	movsd	%xmm0, 8(%rsp)
	movq	%rsi, %rbx
	testq	%rdi, %rdi
	je	.L78
	movq	%rdi, %r8
	movq	$-1, %rcx
	movl	$0, %eax
	repnz scasb
	notq	%rcx
	leaq	-1(%rcx), %rdx
	movq	%r8, %rsi
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
.L70:
	movl	$2, %edx
	leaq	.LC5(%rip), %rsi
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	movq	%rbx, %r13
	cmpq	16+cpu(%rip), %rbx
	js	.L71
	movl	$0, %ebx
	leaq	.LC6(%rip), %r14
	leaq	_ZSt4cout(%rip), %r12
	leaq	cpu(%rip), %rbp
.L72:
	movl	$1, %edx
	movq	%r14, %rsi
	movq	%r12, %rdi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	movslq	%ebx, %rdx
	movq	16(%rbp), %rax
	movsd	(%rax,%rdx,8), %xmm0
	movq	%r12, %rdi
	call	_ZNSo9_M_insertIdEERSoT_@PLT
	addl	$1, %ebx
	movslq	%ebx, %rdx
	movq	%r13, %rax
	subq	16(%rbp), %rax
	sarq	$3, %rax
	cmpq	%rax, %rdx
	jle	.L72
.L71:
	movl	$1, %edx
	leaq	.LC6(%rip), %rsi
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	movsd	8(%rsp), %xmm0
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZNSo9_M_insertIdEERSoT_@PLT
	movq	%rax, %rbp
	movq	(%rax), %rax
	movq	-24(%rax), %rax
	movq	240(%rbp,%rax), %rbx
	testq	%rbx, %rbx
	je	.L79
	cmpb	$0, 56(%rbx)
	je	.L74
	movzbl	67(%rbx), %eax
.L75:
	movsbl	%al, %esi
	movq	%rbp, %rdi
	call	_ZNSo3putEc@PLT
	movq	%rax, %rdi
	call	_ZNSo5flushEv@PLT
	addq	$16, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 48
	popq	%rbx
	.cfi_def_cfa_offset 40
	popq	%rbp
	.cfi_def_cfa_offset 32
	popq	%r12
	.cfi_def_cfa_offset 24
	popq	%r13
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	ret
.L78:
	.cfi_restore_state
	leaq	_ZSt4cout(%rip), %rdi
	movq	_ZSt4cout(%rip), %rax
	addq	-24(%rax), %rdi
	movl	32(%rdi), %esi
	orl	$1, %esi
	call	_ZNSt9basic_iosIcSt11char_traitsIcEE5clearESt12_Ios_Iostate@PLT
	jmp	.L70
.L79:
	call	_ZSt16__throw_bad_castv@PLT
.L74:
	movq	%rbx, %rdi
	call	_ZNKSt5ctypeIcE13_M_widen_initEv@PLT
	movq	(%rbx), %rax
	movl	$10, %esi
	movq	%rbx, %rdi
	call	*48(%rax)
	jmp	.L75
	.cfi_endproc
.LFE1842:
	.size	print_dump2, .-print_dump2
	.type	_GLOBAL__sub_I_cpu, @function
_GLOBAL__sub_I_cpu:
.LFB2332:
	.cfi_startproc
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	leaq	_ZStL8__ioinit(%rip), %rdi
	call	_ZNSt8ios_base4InitC1Ev@PLT
	leaq	__dso_handle(%rip), %rdx
	leaq	_ZStL8__ioinit(%rip), %rsi
	movq	_ZNSt8ios_base4InitD1Ev@GOTPCREL(%rip), %rdi
	call	__cxa_atexit@PLT
	movl	$0, cpu(%rip)
	movsd	.LC7(%rip), %xmm0
	movsd	%xmm0, 8+cpu(%rip)
	movsd	%xmm0, 40+cpu(%rip)
	movl	$0, 48+cpu(%rip)
	movsd	%xmm0, 56+cpu(%rip)
	movsd	%xmm0, 80+cpu(%rip)
	movq	$0x000000000, 88+cpu(%rip)
	movq	$0x000000000, 96+cpu(%rip)
	movq	$0x000000000, 104+cpu(%rip)
	movq	$0x000000000, 112+cpu(%rip)
	addq	$8, %rsp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE2332:
	.size	_GLOBAL__sub_I_cpu, .-_GLOBAL__sub_I_cpu
	.section	.init_array,"aw"
	.align 8
	.quad	_GLOBAL__sub_I_cpu
	.globl	cpu
	.bss
	.align 32
	.type	cpu, @object
	.size	cpu, 12408
cpu:
	.zero	12408
	.local	_ZStL8__ioinit
	.comm	_ZStL8__ioinit,1,1
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC7:
	.long	2736971219
	.long	1072968632
	.hidden	__dso_handle
	.ident	"GCC: (Ubuntu 7.3.0-16ubuntu3) 7.3.0"
	.section	.note.GNU-stack,"",@progbits

		.text
.op_code_name_nop:
		.string "nop"
.op_code_name_push:
		.string "push"
.op_code_name_add:
		.string "add"
.op_code_name_mul:
		.string "mul"
.op_code_name_sub:
		.string "sub"
.op_code_name_div:
		.string "div"
.op_code_name_pow:
		.string "pow"
.op_code_name_sqrt:
		.string "sqrt"
.op_code_name_out:
		.string "out"
.op_code_name_jmp:
		.string "jmp"
.op_code_name_je:
		.string "je"
.op_code_name_jne:
		.string "jne"
.op_code_name_ja:
		.string "ja"
.op_code_name_jae:
		.string "jae"
.op_code_name_jb:
		.string "jb"
.op_code_name_jbe:
		.string "jbe"
.op_code_name_pop_ax:
		.string "pop_ax"
.op_code_name_pop_bx:
		.string "pop_bx"
.op_code_name_pop_cx:
		.string "pop_cx"
.op_code_name_pop_dx:
		.string "pop_dx"
.op_code_name_push_ax:
		.string "push_ax"
.op_code_name_push_bx:
		.string "push_bx"
.op_code_name_push_cx:
		.string "push_cx"
.op_code_name_push_dx:
		.string "push_dx"
.op_code_name_call:
		.string "call"
.op_code_name_ret:
		.string "ret"
.op_code_name_ld:
		.string "ld"
.op_code_name_st:
		.string "st"
.op_code_name_halt:
		.string "halt"
.op_code_name_in:
		.string "in"
.op_code_name_end:
		.string "end"
.op_code_name_no_roots:
		.string "no_roots"
.op_code_name_inf:
		.string "inf"
.op_code_name_push_deep:
		.string "push_deep"
.op_code_name_pop_deep:
		.string "pop_deep"
.op_code_name_drop:
		.string "drop"
		.global func3_0
func3_0:
		pushq	%rbx
		movq	%rdi, %rbx
lb0:	movq	%rbx, %rdi
		call	op2_push_ax@PLT
		leaq	8(%rbx), %rbx
lb1:	movq	%rbx, %rdi
		call	op2_push_bx@PLT
		leaq	8(%rbx), %rbx
lb2:	movq	%rbx, %rdi
		call	op2_push_cx@PLT
		leaq	8(%rbx), %rbx
lb3:	movq	%rbx, %rdi
		call	func3_7
		movq	%rax, %rbx
		movsd	8(%rax), %xmm0
lb5:	movq	%rbx, %rdi
		call	op2_out@PLT
		leaq	-8(%rbx), %rbx
lb6:	movq	%rbx, %rdi
		call	op2_halt@PLT
		leaq	0(%rbx), %rbx

		.global func3_7
func3_7:
		pushq	%rbx
		movq	%rdi, %rbx
lb7:
lb8:	movl	$0, %esi
		movsd	%xmm0, 8(%rbx)
		pxor	%xmm0, %xmm0
		cvtsi2sd	 %esi, %xmm0
		leaq	8(%rbx), %rbx
lb10:	movl	$1, %esi
		movsd	%xmm0, 8(%rbx)
		pxor	%xmm0, %xmm0
		cvtsi2sd	 %esi, %xmm0
		leaq	8(%rbx), %rbx
lb12:	movq	%xmm0, -8(%rbx)
		movsd	(%rbx), %xmm0
		leaq	-8(%rbx), %rbx
lb14:	movl	$1, %esi
		movsd	%xmm0, 8(%rbx)
		pxor	%xmm0, %xmm0
		cvtsi2sd	 %esi, %xmm0
		leaq	8(%rbx), %rbx
lb16:	movq	%xmm0, 8(%rbx)
		movq	-24(%rbx), %xmm0
		leaq	8(%rbx), %rbx
lb18:	movsd	(%rbx), %xmm1
		divsd	%xmm0, %xmm1
		movapd	%xmm1, %xmm0
		leaq	-8(%rbx), %rbx
lb19:	movq	%xmm0, 0(%rbx)
		movsd	(%rbx), %xmm0
		leaq	-8(%rbx), %rbx
lb21:
lb22:	movq	%xmm0, 8(%rbx)
		movq	-16(%rbx), %xmm0
		leaq	8(%rbx), %rbx
lb24:	movl	$0, %esi
		movsd	%xmm0, 8(%rbx)
		pxor	%xmm0, %xmm0
		cvtsi2sd	 %esi, %xmm0
		leaq	8(%rbx), %rbx
lb26:	ucomisd	(%rbx), %xmm0
		movsd	-8(%rbx), %xmm0
		leaq	-16(%rbx), %rbx
		jae		lb47
lb28:	movq	%xmm0, 8(%rbx)
		movq	0(%rbx), %xmm0
		leaq	8(%rbx), %rbx
lb30:	movq	%xmm0, 8(%rbx)
		movq	-8(%rbx), %xmm0
		leaq	8(%rbx), %rbx
lb32:	movq	%xmm0, 8(%rbx)
		movq	-8(%rbx), %xmm0
		leaq	8(%rbx), %rbx
lb34:	mulsd	(%rbx), %xmm0
		leaq	-8(%rbx), %rbx
lb35:	addsd	(%rbx), %xmm0
		leaq	-8(%rbx), %rbx
lb36:	movq	%xmm0, -8(%rbx)
		movsd	(%rbx), %xmm0
		leaq	-8(%rbx), %rbx
lb38:	movq	%xmm0, 8(%rbx)
		movq	-16(%rbx), %xmm0
		leaq	8(%rbx), %rbx
lb40:	movl	$1, %esi
		movsd	%xmm0, 8(%rbx)
		pxor	%xmm0, %xmm0
		cvtsi2sd	 %esi, %xmm0
		leaq	8(%rbx), %rbx
lb42:	movsd	(%rbx), %xmm1
		subsd	%xmm0, %xmm1
		movapd	%xmm1, %xmm0
		leaq	-8(%rbx), %rbx
lb43:	movq	%xmm0, -24(%rbx)
		movsd	(%rbx), %xmm0
		leaq	-8(%rbx), %rbx
lb45:		jmp		lb21
lb47:
lb48:	movq	%xmm0, 8(%rbx)
		movq	0(%rbx), %xmm0
		leaq	8(%rbx), %rbx
lb50:	movq	%rbx, %rdi
		call	op2_out@PLT
		leaq	-8(%rbx), %rbx
lb51:	movq	%xmm0, 8(%rbx)
		movq	0(%rbx), %xmm0
		leaq	8(%rbx), %rbx
lb53:	leaq	-32(%rbx), %rbx
lb55:	movsd	%xmm0, 8(%rbx)
		movq	%rbx, %rax
		popq	%rbx
		ret


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
		call	op2_in@PLT
		leaq	8(%rbx), %rbx
lb1:	movq	%rbx, %rdi
		call	op2_in@PLT
		leaq	8(%rbx), %rbx
lb2:	movq	%rbx, %rdi
		call	op2_in@PLT
		leaq	8(%rbx), %rbx
lb3:	movq	%rbx, %rdi
		call	op2_pop_cx@PLT
		leaq	-8(%rbx), %rbx
lb4:	movq	%rbx, %rdi
		call	op2_pop_bx@PLT
		leaq	-8(%rbx), %rbx
lb5:	movq	%rbx, %rdi
		call	op2_pop_ax@PLT
		leaq	-8(%rbx), %rbx
lb6:	movq	%rbx, %rdi
		call	op2_push_bx@PLT
		leaq	8(%rbx), %rbx
lb7:	movq	%rbx, %rdi
		call	op2_push_bx@PLT
		leaq	8(%rbx), %rbx
lb8:	mulsd	(%rbx), %xmm0
		leaq	-8(%rbx), %rbx
lb9:	movq	%rbx, %rdi
		call	op2_push_ax@PLT
		leaq	8(%rbx), %rbx
lb10:	movq	%rbx, %rdi
		call	op2_push_cx@PLT
		leaq	8(%rbx), %rbx
lb11:	movl	$4, %esi
		movsd	%xmm0, 8(%rbx)
		pxor	%xmm0, %xmm0
		cvtsi2sd	 %esi, %xmm0
		leaq	8(%rbx), %rbx
lb13:	mulsd	(%rbx), %xmm0
		leaq	-8(%rbx), %rbx
lb14:	mulsd	(%rbx), %xmm0
		leaq	-8(%rbx), %rbx
lb15:	movsd	(%rbx), %xmm1
		subsd	%xmm0, %xmm1
		movapd	%xmm1, %xmm0
		leaq	-8(%rbx), %rbx
lb16:	movq	%rbx, %rdi
		call	op2_pop_dx@PLT
		leaq	-8(%rbx), %rbx
lb17:	movl	$0, %esi
		movsd	%xmm0, 8(%rbx)
		pxor	%xmm0, %xmm0
		cvtsi2sd	 %esi, %xmm0
		leaq	8(%rbx), %rbx
lb19:	movq	%rbx, %rdi
		call	op2_push_dx@PLT
		leaq	8(%rbx), %rbx
lb20:	ucomisd	(%rbx), %xmm0
		movsd	-8(%rbx), %xmm0
		leaq	-16(%rbx), %rbx
		jb		lb84
lb22:	movl	$0, %esi
		movsd	%xmm0, 8(%rbx)
		pxor	%xmm0, %xmm0
		cvtsi2sd	 %esi, %xmm0
		leaq	8(%rbx), %rbx
lb24:	movq	%rbx, %rdi
		call	op2_push_dx@PLT
		leaq	8(%rbx), %rbx
lb25:	ucomisd	(%rbx), %xmm0
		movsd	-8(%rbx), %xmm0
		leaq	-16(%rbx), %rbx
		je		lb64
lb27:	movl	$0, %esi
		movsd	%xmm0, 8(%rbx)
		pxor	%xmm0, %xmm0
		cvtsi2sd	 %esi, %xmm0
		leaq	8(%rbx), %rbx
lb29:	movq	%rbx, %rdi
		call	op2_push_dx@PLT
		leaq	8(%rbx), %rbx
lb30:	ucomisd	(%rbx), %xmm0
		movsd	-8(%rbx), %xmm0
		leaq	-16(%rbx), %rbx
		ja		lb33
lb32:	movq	%rbx, %rdi
		call	op2_halt@PLT
		leaq	0(%rbx), %rbx
lb33:
lb34:	movl	$2, %esi
		movsd	%xmm0, 8(%rbx)
		pxor	%xmm0, %xmm0
		cvtsi2sd	 %esi, %xmm0
		leaq	8(%rbx), %rbx
lb36:	movq	%rbx, %rdi
		call	op2_out@PLT
		leaq	-8(%rbx), %rbx
lb37:	movq	%rbx, %rdi
		call	op2_push_bx@PLT
		leaq	8(%rbx), %rbx
lb38:	movl	$-1, %esi
		movsd	%xmm0, 8(%rbx)
		pxor	%xmm0, %xmm0
		cvtsi2sd	 %esi, %xmm0
		leaq	8(%rbx), %rbx
lb40:	mulsd	(%rbx), %xmm0
		leaq	-8(%rbx), %rbx
lb41:	movq	%rbx, %rdi
		call	op2_push_dx@PLT
		leaq	8(%rbx), %rbx
lb42:	movq	%rbx, %rdi
		call	op2_sqrt@PLT
		leaq	0(%rbx), %rbx
lb43:	addsd	(%rbx), %xmm0
		leaq	-8(%rbx), %rbx
lb44:	movq	%rbx, %rdi
		call	op2_push_ax@PLT
		leaq	8(%rbx), %rbx
lb45:	movl	$2, %esi
		movsd	%xmm0, 8(%rbx)
		pxor	%xmm0, %xmm0
		cvtsi2sd	 %esi, %xmm0
		leaq	8(%rbx), %rbx
lb47:	mulsd	(%rbx), %xmm0
		leaq	-8(%rbx), %rbx
lb48:	movsd	(%rbx), %xmm1
		divsd	%xmm0, %xmm1
		movapd	%xmm1, %xmm0
		leaq	-8(%rbx), %rbx
lb49:	movq	%rbx, %rdi
		call	op2_out@PLT
		leaq	-8(%rbx), %rbx
lb50:	movq	%rbx, %rdi
		call	op2_push_bx@PLT
		leaq	8(%rbx), %rbx
lb51:	movl	$-1, %esi
		movsd	%xmm0, 8(%rbx)
		pxor	%xmm0, %xmm0
		cvtsi2sd	 %esi, %xmm0
		leaq	8(%rbx), %rbx
lb53:	mulsd	(%rbx), %xmm0
		leaq	-8(%rbx), %rbx
lb54:	movq	%rbx, %rdi
		call	op2_push_dx@PLT
		leaq	8(%rbx), %rbx
lb55:	movq	%rbx, %rdi
		call	op2_sqrt@PLT
		leaq	0(%rbx), %rbx
lb56:	movsd	(%rbx), %xmm1
		subsd	%xmm0, %xmm1
		movapd	%xmm1, %xmm0
		leaq	-8(%rbx), %rbx
lb57:	movq	%rbx, %rdi
		call	op2_push_ax@PLT
		leaq	8(%rbx), %rbx
lb58:	movl	$2, %esi
		movsd	%xmm0, 8(%rbx)
		pxor	%xmm0, %xmm0
		cvtsi2sd	 %esi, %xmm0
		leaq	8(%rbx), %rbx
lb60:	mulsd	(%rbx), %xmm0
		leaq	-8(%rbx), %rbx
lb61:	movsd	(%rbx), %xmm1
		divsd	%xmm0, %xmm1
		movapd	%xmm1, %xmm0
		leaq	-8(%rbx), %rbx
lb62:	movq	%rbx, %rdi
		call	op2_out@PLT
		leaq	-8(%rbx), %rbx
lb63:	movq	%rbx, %rdi
		call	op2_halt@PLT
		leaq	0(%rbx), %rbx
lb64:
lb65:	movq	%rbx, %rdi
		call	op2_push_ax@PLT
		leaq	8(%rbx), %rbx
lb66:	movl	$0, %esi
		movsd	%xmm0, 8(%rbx)
		pxor	%xmm0, %xmm0
		cvtsi2sd	 %esi, %xmm0
		leaq	8(%rbx), %rbx
lb68:	ucomisd	(%rbx), %xmm0
		movsd	-8(%rbx), %xmm0
		leaq	-16(%rbx), %rbx
		je		lb90
lb70:	movl	$1, %esi
		movsd	%xmm0, 8(%rbx)
		pxor	%xmm0, %xmm0
		cvtsi2sd	 %esi, %xmm0
		leaq	8(%rbx), %rbx
lb72:	movq	%rbx, %rdi
		call	op2_out@PLT
		leaq	-8(%rbx), %rbx
lb73:	movq	%rbx, %rdi
		call	op2_push_ax@PLT
		leaq	8(%rbx), %rbx
lb74:	movl	$2, %esi
		movsd	%xmm0, 8(%rbx)
		pxor	%xmm0, %xmm0
		cvtsi2sd	 %esi, %xmm0
		leaq	8(%rbx), %rbx
lb76:	mulsd	(%rbx), %xmm0
		leaq	-8(%rbx), %rbx
lb77:	movq	%rbx, %rdi
		call	op2_push_bx@PLT
		leaq	8(%rbx), %rbx
lb78:	movsd	(%rbx), %xmm1
		divsd	%xmm0, %xmm1
		movapd	%xmm1, %xmm0
		leaq	-8(%rbx), %rbx
lb79:	movl	$-1, %esi
		movsd	%xmm0, 8(%rbx)
		pxor	%xmm0, %xmm0
		cvtsi2sd	 %esi, %xmm0
		leaq	8(%rbx), %rbx
lb81:	mulsd	(%rbx), %xmm0
		leaq	-8(%rbx), %rbx
lb82:	movq	%rbx, %rdi
		call	op2_out@PLT
		leaq	-8(%rbx), %rbx
lb83:	movq	%rbx, %rdi
		call	op2_halt@PLT
		leaq	0(%rbx), %rbx
lb84:
lb85:	movl	$0, %esi
		movsd	%xmm0, 8(%rbx)
		pxor	%xmm0, %xmm0
		cvtsi2sd	 %esi, %xmm0
		leaq	8(%rbx), %rbx
lb87:	movq	%rbx, %rdi
		call	op2_out@PLT
		leaq	-8(%rbx), %rbx
lb88:	movq	%rbx, %rdi
		call	op2_no_roots@PLT
		leaq	0(%rbx), %rbx
lb89:	movq	%rbx, %rdi
		call	op2_halt@PLT
		leaq	0(%rbx), %rbx
lb90:
lb91:	movl	$0, %esi
		movsd	%xmm0, 8(%rbx)
		pxor	%xmm0, %xmm0
		cvtsi2sd	 %esi, %xmm0
		leaq	8(%rbx), %rbx
lb93:	movq	%rbx, %rdi
		call	op2_out@PLT
		leaq	-8(%rbx), %rbx
lb94:	movq	%rbx, %rdi
		call	op2_inf@PLT
		leaq	0(%rbx), %rbx
lb95:	movq	%rbx, %rdi
		call	op2_halt@PLT
		leaq	0(%rbx), %rbx


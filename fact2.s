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
		.global func2_0
func2_0:
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
		call	func2_33
		movq	%rax, %rbx
		movsd	8(%rax), %xmm0
lb5:	movq	%rbx, %rdi
		call	op2_out@PLT
		leaq	-8(%rbx), %rbx
lb6:	movq	%rbx, %rdi
		call	op2_halt@PLT
		leaq	0(%rbx), %rbx

		.global func2_7
func2_7:
		pushq	%rbx
		movq	%rdi, %rbx
lb7:	movq	%rbx, %rdi
		call	op2_nop@PLT
		leaq	0(%rbx), %rbx
lb8:	movq	%rbx, %rdi
		movl	$1, %esi
		call	op2_push_deep@PLT
		leaq	8(%rbx), %rbx
lb10:	movq	%rbx, %rdi
		movl	$0, %esi
		call	op2_push@PLT
		leaq	8(%rbx), %rbx
lb12:	movq	%rbx, %rdi
		call	op2_jbe
		movsd	-8(%rbx), %xmm0
		leaq	-16(%rbx), %rbx
		testb	%al, %al
		jne	lb27
lb14:	movq	%rbx, %rdi
		movl	$1, %esi
		call	op2_push_deep@PLT
		leaq	8(%rbx), %rbx
lb16:	movq	%rbx, %rdi
		movl	$2, %esi
		call	op2_push_deep@PLT
		leaq	8(%rbx), %rbx
lb18:	movq	%rbx, %rdi
		movl	$1, %esi
		call	op2_push@PLT
		leaq	8(%rbx), %rbx
lb20:	movq	%rbx, %rdi
		call	op2_sub@PLT
		leaq	-8(%rbx), %rbx
lb21:	movq	%rbx, %rdi
		call	func2_7
		movq	%rax, %rbx
		movsd	8(%rax), %xmm0
lb23:	movq	%rbx, %rdi
		call	op2_mul@PLT
		leaq	-8(%rbx), %rbx
lb24:	leaq	-8(%rbx), %rbx
lb26:	movsd	%xmm0, 8(%rbx)
		movq	%rbx, %rax
		popq	%rbx
		ret
lb27:	movq	%rbx, %rdi
		call	op2_nop@PLT
		leaq	0(%rbx), %rbx
lb28:	movq	%rbx, %rdi
		movl	$1, %esi
		call	op2_push@PLT
		leaq	8(%rbx), %rbx
lb30:	leaq	-8(%rbx), %rbx
lb32:	movsd	%xmm0, 8(%rbx)
		movq	%rbx, %rax
		popq	%rbx
		ret

		.global func2_33
func2_33:
		pushq	%rbx
		movq	%rdi, %rbx
lb33:	movq	%rbx, %rdi
		call	op2_nop@PLT
		leaq	0(%rbx), %rbx
lb34:	movq	%rbx, %rdi
		movl	$3, %esi
		call	op2_push_deep@PLT
		leaq	8(%rbx), %rbx
lb36:	movq	%rbx, %rdi
		call	func2_7
		movq	%rax, %rbx
		movsd	8(%rax), %xmm0
lb38:	leaq	-24(%rbx), %rbx
lb40:	movsd	%xmm0, 8(%rbx)
		movq	%rbx, %rax
		popq	%rbx
		ret


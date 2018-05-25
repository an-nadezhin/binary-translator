#include "semantic_function_2.h"

extern "C" {
double* func_0(double top, double* stack);
double* func_7(double top, double* stack);
}

double* func_0(double top, double* stack) {
bool cond;
lb0:	 top = op2_push_ax(top, stack); stack += 1;
lb1:	 top = op2_push_bx(top, stack); stack += 1;
lb2:	 top = op2_push_cx(top, stack); stack += 1;
lb3:	 stack = func_7(top, stack); top = stack[1];
lb5:	 top = op2_out(top, stack); stack += -1;
lb6:	 top = op2_halt(top, stack); stack += 0;
}


double* func_7(double top, double* stack) {
bool cond;
lb7:	 top = op2_nop(top, stack); stack += 0;
lb8:	 top = op2_push(top, stack, 0); stack += 1;
lb10:	 top = op2_push(top, stack, 1); stack += 1;
lb12:	 top = op2_pop_deep(top, stack, 2); stack += -1;
lb14:	 top = op2_push(top, stack, 1); stack += 1;
lb16:	 top = op2_push_deep(top, stack, 5); stack += 1;
lb18:	 top = op2_div(top, stack); stack += -1;
lb19:	 top = op2_pop_deep(top, stack, 1); stack += -1;
lb21:	 top = op2_nop(top, stack); stack += 0;
lb22:	 top = op2_push_deep(top, stack, 4); stack += 1;
lb24:	 top = op2_push(top, stack, 0); stack += 1;
lb26:	 cond = op2_jbe(top, stack); top = stack[-1]; stack -= 2; if(cond) goto lb47;
lb28:	 top = op2_push_deep(top, stack, 2); stack += 1;
lb30:	 top = op2_push_deep(top, stack, 3); stack += 1;
lb32:	 top = op2_push_deep(top, stack, 3); stack += 1;
lb34:	 top = op2_mul(top, stack); stack += -1;
lb35:	 top = op2_add(top, stack); stack += -1;
lb36:	 top = op2_pop_deep(top, stack, 2); stack += -1;
lb38:	 top = op2_push_deep(top, stack, 4); stack += 1;
lb40:	 top = op2_push(top, stack, 1); stack += 1;
lb42:	 top = op2_sub(top, stack); stack += -1;
lb43:	 top = op2_pop_deep(top, stack, 4); stack += -1;
lb45:	 top = op2_jmp(top, stack, 21); stack += 0;
lb47:	 top = op2_nop(top, stack); stack += 0;
lb48:	 top = op2_push_deep(top, stack, 2); stack += 1;
lb50:	 top = op2_out(top, stack); stack += -1;
lb51:	 top = op2_push_deep(top, stack, 2); stack += 1;
lb53:	 stack += -4;
lb55:	 stack[1] = top; return stack;
}


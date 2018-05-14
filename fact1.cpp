#include "semantic_function_2.h"

extern "C" {
double* func_0(double top, double* stack);
double* func_7(double top, double* stack);
double* func_33(double top, double* stack);
}

double* func_0(double top, double* stack) {
bool cond;
lb0:	 top = op2_push_ax(top, stack); stack += 1;
lb1:	 top = op2_push_bx(top, stack); stack += 1;
lb2:	 top = op2_push_cx(top, stack); stack += 1;
lb3:	 stack = func_33(top, stack); top = stack[1];
lb5:	 top = op2_out(top, stack); stack += -1;
lb6:	 top = op2_halt(top, stack); stack += 0;
}


double* func_7(double top, double* stack) {
bool cond;
lb7:	 top = op2_nop(top, stack); stack += 0;
lb8:	 top = op2_push_deep(top, stack, 1); stack += 1;
lb10:	 top = op2_push(top, stack, 0); stack += 1;
lb12:	 cond = op2_jbe(top, stack); top = stack[-1]; stack -= 2; if(cond) goto lb27;
lb14:	 top = op2_push_deep(top, stack, 1); stack += 1;
lb16:	 top = op2_push_deep(top, stack, 2); stack += 1;
lb18:	 top = op2_push(top, stack, 1); stack += 1;
lb20:	 top = op2_sub(top, stack); stack += -1;
lb21:	 stack = func_7(top, stack); top = stack[1];
lb23:	 top = op2_mul(top, stack); stack += -1;
lb24:	 stack += -1;
lb26:	 stack[1] = top; return stack;
lb27:	 top = op2_nop(top, stack); stack += 0;
lb28:	 top = op2_push(top, stack, 1); stack += 1;
lb30:	 stack += -1;
lb32:	 stack[1] = top; return stack;
}


double* func_33(double top, double* stack) {
bool cond;
lb33:	 top = op2_nop(top, stack); stack += 0;
lb34:	 top = op2_push_deep(top, stack, 3); stack += 1;
lb36:	 stack = func_7(top, stack); top = stack[1];
lb38:	 stack += -3;
lb40:	 stack[1] = top; return stack;
}


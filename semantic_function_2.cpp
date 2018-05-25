//
// Created by andrew on 13.05.18.
//

#include "semantic_function_2.h"

#define READ_EL StackElem_t res = 0;                      \
                StackElem_t num_1 = StackPop(&cpu->stack);\
                StackElem_t num_2 = StackPop(&cpu->stack);\

#define SPUSH StackPush(&cpu->stack, res);

#define SPOP StackPop(&cpu->stack)

#define DEST pc = cpu->rom[pc];

CPU cpu;

clock_t start_time;

double op2_nop(double top, double* stack) {
    return top;
}
//todo stack++
double op2_push(double top, double* stack, prog_ad arg) {
    *++stack = top;
    return arg;
}

double op2_add(double top, double* stack) {
    return *stack + top;
}

double op2_mul(double top, double* stack) {
    return *stack * top;
}

double op2_sub(double top, double* stack) {
    return *stack - top;
}

double op2_div(double top, double* stack) {
    return *stack / top;
}

double op2_pow(double top, double* stack) {
    return pow(*stack, top);
}

double op2_sqrt(double top, double* stack) {
    return sqrt(top);
}

double op2_out(double top, double* stack) {
    std::cout << top << std::endl;
    return *stack;
}
/*
int op2_jmp(double top, double* stack, int pc) {
    return DEST;
}
*/

bool op2_je(double top, double* stack) {
    return *stack == top;
}

bool op2_jne(double top, double* stack) {
    return *stack != top;
}

bool op2_ja(double top, double* stack) {
    return *stack > top;
}

bool op2_jae(double top, double* stack) {
    return *stack >= top;
}

bool op2_jb(double top, double* stack) {
    return *stack < top;
}

bool op2_jbe(double top, double* stack) {
    return *stack <= top;
}

double op2_pop_ax(double top, double* stack) {
    cpu.ax = top;
    return *stack;
}

double op2_pop_bx(double top, double* stack) {
    cpu.bx = top;
    return *stack;
}

double op2_pop_cx(double top, double* stack) {
    cpu.cx = top;
    return *stack;
}

double op2_pop_dx(double top, double* stack) {
    cpu.dx = top;
    return *stack;
}

double op2_push_ax(double top, double* stack) {
    *++stack = top;
    return cpu.ax;
}

double op2_push_bx(double top, double* stack) {
    *++stack = top;
    return cpu.bx;
}

double op2_push_cx(double top, double* stack) {
    *++stack = top;
    return cpu.cx;
}

double op2_push_dx(double top, double* stack) {
    *++stack = top;
    return cpu.dx;
}


/*
double op2_ret(double top, double* stack) {
    print_dump2("op2_ret", cpu);
    // int pc = StackPop(&cpu->call_st);
}
*/

double op2_ld(double top, double* stack) {
    return cpu.ram[(int)top];
}

double op2_st(double top, double* stack) {
    cpu.ram[(int)*stack] = top;
    return stack[-2];
}

double op2_halt(double top, double* stack) {
    clock_t t = clock() - start_time;
    printf("clock : %d\ntime : %f\n", t, (float) t/CLOCKS_PER_SEC);
    exit(0);
}


double op2_in(double top, double* stack) {
    *++stack = top;
    int in_num = 0;
    std::cout << "VVedite chislo : ";
    std::cin >> in_num;
    std::cout << std::endl;
    return (double) in_num;
}

double op2_end(double top, double* stack) {
    std::cout << "end" << std::endl;
    return top;
}

double op2_no_roots(double top, double* stack) {
    std::cout << "no roots" << std::endl;
    return top;
}

double op2_inf(double top, double* stack) {
    std::cout << "inf" << std::endl;
    return top;
}

double *get_elem_ptr(double *stack, int deep) {
    return stack + 2 - deep;
    //return &str1->data[str1->count - deep];
}


double op2_push_deep(double top, double* stack, prog_ad arg) {
    int dep = arg;
    StackElem_t res = (dep != 1) ? *get_elem_ptr(stack, dep) : top;
    stack[1] = top;
    return res;
}


double op2_pop_deep(double top, double* stack, prog_ad arg) {
    stack[1-arg] = top;
    return *stack--;

}

void print_dump2(const char* name, double top, double* stack) {
    std::cout << name << " :";
 //   std::cout << (long) stack << "\n" << (long) cpu.stack.data << std::endl;
    for(int i = 0; i <= stack - cpu.stack.data; i++)
        std::cout << " " << cpu.stack.data[i];
    std::cout << " " << top << std::endl;
}
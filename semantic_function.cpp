//
// Created by andrew on 12.05.18.
//
#include "semantic_function.h"

#define READ_EL StackElem_t res = 0;                      \
                StackElem_t num_1 = StackPop(&cpu->stack);\
                StackElem_t num_2 = StackPop(&cpu->stack);\

#define SPUSH StackPush(&cpu->stack, res);

#define SPOP StackPop(&cpu->stack)

#define DEST pc = cpu->rom[pc];

void op_nop(CPU * cpu) {
    print_dump("op_nop", cpu);
}

void op_push(CPU* cpu, prog_ad arg) {
    print_dump("op_push", cpu);
    StackPush(&cpu->stack, (StackElem_t) arg);
}

void op_add(CPU* cpu) {
    print_dump("op_add", cpu);
    READ_EL res = num_2 + num_1;  SPUSH
}

void op_mul(CPU* cpu) {
    print_dump("op_mul", cpu);
    READ_EL res = num_2 * num_1; SPUSH
}

void op_sub(CPU* cpu) {
    print_dump("op_sub", cpu);
    READ_EL res = num_2 - num_1; SPUSH
}

void op_div(CPU* cpu) {
    READ_EL res = num_2 / num_1; SPUSH
}

void op_pow(CPU* cpu) {
    READ_EL res = pow(num_2, num_1); SPUSH
}

void op_sqrt(CPU* cpu) {
    StackElem_t arg = SPOP; StackPush(&cpu->stack, sqrt(arg));
}

void op_out(CPU* cpu) {
    print_dump("op_out", cpu);
    std::cout << SPOP << std::endl;
}

int op_jmp(CPU* cpu, int pc) {
    return DEST;
}


bool op_je(CPU* cpu) {
    print_dump("op_je", cpu);
    READ_EL
    return num_2 == num_1;
}

bool op_jne(CPU* cpu) {
    print_dump("op_jne", cpu);
    READ_EL
    return num_2 != num_1;
}

bool op_ja(CPU* cpu) {
    print_dump("op_ja", cpu);
    READ_EL
    return num_2 > num_1;
}

bool op_jae(CPU* cpu) {
    print_dump("op_jae", cpu);
    READ_EL
    return num_2 >= num_1;
}

bool op_jb(CPU* cpu) {
    print_dump("op_jb", cpu);
    READ_EL
    return num_2 < num_1;
}

bool op_jbe(CPU* cpu) {
    print_dump("op_jbe", cpu);
    READ_EL
    return num_2 <= num_1;
}

void op_pop_ax(CPU* cpu) {
    print_dump("op_pop_ax", cpu);
    cpu->ax = SPOP;
}

void op_pop_bx(CPU* cpu) {
    print_dump("op_pop_bx", cpu);
    cpu->bx = SPOP;
}

void op_pop_cx(CPU* cpu) {
    print_dump("op_pop_cx", cpu);
    cpu->cx = SPOP;
}

void op_pop_dx(CPU* cpu) {
    cpu->dx = SPOP;
}

void op_push_ax(CPU* cpu) {
    print_dump("op_push_ax", cpu);
    StackPush(&cpu->stack, cpu->ax);
}

void op_push_bx(CPU* cpu) {
    print_dump("op_push_bx", cpu);
    StackPush(&cpu->stack, cpu->bx);
}

void op_push_cx(CPU* cpu) {
    print_dump("op_push_cx", cpu);
    StackPush(&cpu->stack, cpu->cx);
}

void op_push_dx(CPU* cpu) {
    StackPush(&cpu->stack, cpu->dx);
}

int op_call(CPU* cpu, int pc) {
    print_dump("op_call", cpu);
    //StackPush(&cpu->call_st, pc + 1);
    //DEST
    return pc;
}

void op_ret(CPU* cpu) {
    print_dump("op_ret", cpu);
   // int pc = StackPop(&cpu->call_st);
}

void op_ld(CPU* cpu) {
    int a = (int) SPOP; StackPush(&cpu->stack, cpu->ram[a]);
}

void op_st(CPU* cpu) {
    StackElem_t value = SPOP; int a = (int) SPOP; cpu->ram[a] = value;
}

void op_halt(CPU* cpu) {
    print_dump("op_halt", cpu);
    exit(0);
}


void op_in(CPU* cpu) {
    int in_num = 0;
    std::cout << "VVedite chislo : ";
    std::cin >> in_num;
    std::cout << std::endl;
    StackPush(&cpu->stack, (StackElem_t) in_num);
}

void op_end(CPU* cpu) {
    print_dump("op_end", cpu);
    std::cout << "end" << std::endl;
}

void op_no_roots(CPU* cpu) {
    std::cout << "no roots" << std::endl;
}

void op_inf(CPU* cpu) {
    std::cout << "inf" << std::endl;
}

void op_push_deep(CPU* cpu, prog_ad arg) {
    print_dump("op_push_deep", cpu);
    int dep = arg; StackElem_t res = *get_elem_ptr(&cpu->stack, dep); SPUSH
}

void op_pop_deep(CPU* cpu, prog_ad arg) {
    print_dump("op_pop_deep", cpu);
    int dep = arg; StackElem_t  nu = SPOP; *get_elem_ptr(&cpu->stack, dep) = nu;
}

void op_drop(CPU* cpu, prog_ad arg) {
    print_dump("op_drop", cpu);
    int miss = arg; StackElem_t res = SPOP; while(miss-- > 0) SPOP; SPUSH
}


void print_dump(const char* name, CPU* cpu) {
    std::cout << name;
    std:: cout << " :";
    for(int i = 0; i < cpu->stack.count; i++)
        std::cout << " " << cpu->stack.data[i];
    std::cout << std::endl;
}
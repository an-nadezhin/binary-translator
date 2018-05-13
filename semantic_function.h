//
// Created by andrew on 12.05.18.
//

#ifndef TRANSLATOR_SEMANTIC_FUNCTION_H
#define TRANSLATOR_SEMANTIC_FUNCTION_H

#include "CPU.h"

void op_nop(CPU * cpu);

void op_push(CPU* cpu, prog_ad arg);

void op_add(CPU* cpu);

void op_mul(CPU* cpu);

void op_sub(CPU* cpu);

void op_div(CPU* cpu);

void op_pow(CPU* cpu);

void op_sqrt(CPU* cpu);

void op_out(CPU* cpu);

int op_jmp(CPU* cpu, int pc);

bool op_je(CPU* cpu);

bool op_jne(CPU* cpu);

bool op_ja(CPU* cpu);

bool op_jae(CPU* cpu);

bool op_jb(CPU* cpu);

bool op_jbe(CPU* cpu);

void op_pop_ax(CPU* cpu);

void op_pop_bx(CPU* cpu);

void op_pop_cx(CPU* cpu);

void op_pop_dx(CPU* cpu);

void op_push_ax(CPU* cpu);

void op_push_bx(CPU* cpu);

void op_push_cx(CPU* cpu);

void op_push_dx(CPU* cpu);

int op_call(CPU* cpu, int pc);

void op_ret(CPU* cpu);

void op_ld(CPU* cpu);

void op_st(CPU* cpu);

void op_halt(CPU* cpu);

void op_in(CPU* cpu);

void op_end(CPU* cpu);

void op_no_roots(CPU* cpu);

void op_inf(CPU* cpu);

void op_push_deep(CPU* cpu, prog_ad arg);

void op_pop_deep(CPU* cpu, prog_ad arg);

void op_drop(CPU* cpu, prog_ad arg);

void print_dump(const char* name, CPU* cpu);

#endif //TRANSLATOR_SEMANTIC_FUNCTION_H

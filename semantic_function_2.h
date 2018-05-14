//
// Created by andrew on 13.05.18.
//

#ifndef TRANSLATOR_SEMANTIC_FUNCTION_2_H
#define TRANSLATOR_SEMANTIC_FUNCTION_2_H

#include "CPU.h"

extern CPU cpu;

extern "C" {

double op2_nop(double top, double* stack);

double op2_push(double top, double* stack, prog_ad arg);

double op2_add(double top, double* stack);

double op2_mul(double top, double* stack);

double op2_sub(double top, double* stack);

double op2_div(double top, double* stack);

double op2_pow(double top, double* stack);

double op2_sqrt(double top, double* stack);

double op2_out(double top, double* stack);

bool op2_je(double top, double* stack);

bool op2_jne(double top, double* stack);

bool op2_ja(double top, double* stack);

bool op2_jae(double top, double* stack);

bool op2_jb(double top, double* stack);

bool op2_jbe(double top, double* stack);

double op2_pop_ax(double top, double* stack);

double op2_pop_bx(double top, double* stack);

double op2_pop_cx(double top, double* stack);

double op2_pop_dx(double top, double* stack);

double op2_push_ax(double top, double* stack);

double op2_push_bx(double top, double* stack);

double op2_push_cx(double top, double* stack);

double op2_push_dx(double top, double* stack);
/*
void op2_ret(CPU* cpu);
*/
double op2_ld(double top, double* stack);

double op2_st(double top, double* stack);

double op2_halt(double top, double* stack);

double op2_in(double top, double* stack);

double op2_end(double top, double* stack);

double op2_no_roots(double top, double* stack);

double op2_inf(double top, double* stack);

double op2_push_deep(double top, double* stack, prog_ad arg);

double op2_pop_deep(double top, double* stack, prog_ad arg);

void print_dump2(const char* name, double top, double* stack);

}

#endif //TRANSLATOR_SEMANTIC_FUNCTION_2_H

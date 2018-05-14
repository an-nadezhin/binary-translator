//
// Created by andrew on 12.05.18.
//

#include <iostream>
#include "binary-translator.h"
#include "assembler.h"
#include "CPU.h"

#define DEBUG 0

Function::Function(int start, int end, ivec vec) : start_(start), vec_(end - start) {
    int i = 0;
    while (i < end - start) {
        vec_[i] = vec[start + i];
        i++;
    }
    //std::cout << "start : " << start << " -- " << end << std::endl;
}

void Function::print_code() {
    printf("void func_%d(CPU* cpu) {\n", start_);
    int pc = start_;
    while (pc < start_ + vec_.size()) {
        int num = vec_[pc - start_];
        std::cout << pc << ") " << num;
        pc++;
        const char *name = names[num];
        int amount_of_args = num_args[num];

        while (amount_of_args) {
            num = vec_[pc - start_];
            pc++;
            std::cout << " " << num;
            amount_of_args--;
        }
        std::cout << " & " << name;
        std::cout << std::endl;
    }
    std::cout << "}\n";
}

void Function::gen_decl(FILE *out) {
    fprintf(out, "void func_%d(CPU* cpu);\n", start_);
}

void Function::gen_code1(FILE *out) {
    int pc = start_;

    fprintf(out, "\nvoid func_%d(CPU* cpu) {\n", start_);

//    fprintf(out, "  int pc = %d;\n"
    //               "  for(;;) {\n"
    //               "    switch (pc) {\n", start_);

    while (pc < start_ + vec_.size()) {
        int op_code = vec_[pc - start_];
        const char *name = names[op_code];
        int amount_of_args = num_args[op_code];

        //    fprintf(out, "      case %d:\n", pc);


        switch (op_code) {
            case CALL:
                fprintf(out, "lb%d:\tprint_dump(\"call_%d\", cpu);", pc, start_);
                fprintf(out, " func_%d(cpu);\n", vec_[pc + 1 - start_]);
                break;
            case RET:
                fprintf(out, "lb%d:\tprint_dump(\"ret_%d\", cpu);"
                             " return;\n", pc, start_);
                break;
            case JBE:
            case JE:
            case JA:
            case JAE:
            case JNE:
            case JB:
                fprintf(out, "lb%d:\tif(op_jbe(cpu)) goto lb%d;\n", pc, vec_[pc + 1 - start_]);
                break;
            default:
                if (amount_of_args == 0) {
                    fprintf(out, "lb%d:\top_%s(cpu);\n", pc, names[op_code]);
                } else {
                    fprintf(out, "lb%d:\top_%s(cpu", pc, names[op_code]);
                    for (int i = 0; i < amount_of_args; i++) {
                        int arg = vec_[pc + 1 + i - start_];
                        fprintf(out, ", %d", arg);
                    }
                    fprintf(out, ");\n");
                }
        }
        pc += amount_of_args + 1;
    }
    fprintf(out, "}\n");
}


void Function::gen_code2(FILE *out) {
    int pc = start_;
    fprintf(out, "\ndouble* func_%d(double top, double* stack) {\nbool cond;\n", start_);

    while (pc < start_ + vec_.size()) {
        int op_code = vec_[pc - start_];
        const char *name = names[op_code];
        int amount_of_args = num_args[op_code];

        fprintf(out, "lb%d:\t", pc);
        if (DEBUG)
            fprintf(out, "print_dump2(\"%s\", top, stack);", name);

        switch (op_code) {
            case CALL:
                fprintf(out, " stack = func_%d(top, stack);"
                             " top = stack[1];\n", vec_[pc + 1 - start_]);
                break;
            case RET:
                fprintf(out, " stack[1] = top;"
                             " return stack;\n");
                break;
            case DROP:
                fprintf(out, " stack += %d;\n", -vec_[pc + 1 - start_]);
                break;
            case JBE:
            case JE:
            case JA:
            case JAE:
            case JNE:
            case JB:
                fprintf(out, " cond = op2_%s(top, stack);"
                             " top = stack[-1];"
                             " stack -= 2;"
                             " if(cond) goto lb%d;\n", name, vec_[pc + 1 - start_]);
                break;
            default:
                fprintf(out, " top = op2_%s(top, stack", name);
                for (int i = 0; i < amount_of_args; i++) {
                    int arg = vec_[pc + 1 + i - start_];
                    fprintf(out, ", %d", arg);
                }
                fprintf(out, "); stack += %d;\n", stack_incrs[op_code]);

        }
        pc += amount_of_args + 1;
    }
    fprintf(out, "}\n");
}

void Function::gen_decl2(FILE *out) {
    fprintf(out, "double* func_%d(double top, double* stack);\n", start_);
}

void Function::gen_code3(FILE *out) {
    int pc = start_;
    fprintf(out, "\t\t.global func2_%d\n", start_);
    fprintf(out, "func2_%d:\n", start_);
    fprintf(out, "\t\tpushq\t%%rbx\n");
    fprintf(out, "\t\tmovq\t%%rdi, %%rbx\n");

    while (pc < start_ + vec_.size()) {
        int op_code = vec_[pc - start_];
        const char *name = names[op_code];
        int amount_of_args = num_args[op_code];

        fprintf(out, "lb%d:", pc);
        if (DEBUG) {
            //    fprintf(out, "print_dump2(\"%s\", top, stack);", name);
            fprintf(out, "\tmovq\t%%xmm0, %%r12\n");
            fprintf(out, "\t\tleaq\t.op_code_name_%s(%%rip), %%rdi\n", name);
            fprintf(out, "\t\tmovq\t%%rbx, %%rsi\n");
            fprintf(out, "\t\tcall\tprint_dump2@PLT\n");
            fprintf(out, "\t\tmovq\t%%r12, %%xmm0\n\t");
        }
        switch (op_code) {
            case CALL:
                fprintf(out, "\tmovq\t%%rbx, %%rdi\n");
                fprintf(out, "\t\tcall\tfunc2_%d\n", vec_[pc + 1 - start_]);
                fprintf(out, "\t\tmovq\t%%rax, %%rbx\n");
                fprintf(out, "\t\tmovsd\t8(%%rax), %%xmm0\n");
                break;
            case RET:
                fprintf(out, "\tmovsd\t%%xmm0, 8(%%rbx)\n");
                fprintf(out, "\t\tmovq\t%%rbx, %%rax\n");
                fprintf(out, "\t\tpopq\t%%rbx\n");
                fprintf(out, "\t\tret\n");
                break;
            case DROP:
                fprintf(out, "\tleaq\t%d(%%rbx), %%rbx\n", -vec_[pc + 1 - start_] * 8);
                break;
            case JBE:
            case JE:
            case JA:
            case JAE:
            case JNE:
            case JB:
                fprintf(out, "\tmovq\t%%rbx, %%rdi\n");
                fprintf(out, "\t\tcall\top2_%s\n", name);
                fprintf(out, "\t\tmovsd\t-8(%%rbx), %%xmm0\n");
                fprintf(out, "\t\tleaq\t-16(%%rbx), %%rbx\n");
                fprintf(out, "\t\ttestb\t%%al, %%al\n");
                fprintf(out, "\t\tjne\tlb%d\n", vec_[pc + 1 - start_]);
                break;
            default:
                fprintf(out, "\tmovq\t%%rbx, %%rdi\n");
                for (int i = 0; i < amount_of_args; i++) {
                    assert(i == 0);
                    int arg = vec_[pc + 1 + i - start_];
                    fprintf(out, "\t\tmovl\t$%d, %%esi\n", arg);
                }
                fprintf(out, "\t\tcall\top2_%s@PLT\n", name);
                fprintf(out, "\t\tleaq\t%d(%%rbx), %%rbx\n", stack_incrs[op_code] * 8);
        }
        pc += amount_of_args + 1;
    }
    //  fprintf(out, "}\n");
}


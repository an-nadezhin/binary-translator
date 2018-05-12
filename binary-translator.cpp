//
// Created by andrew on 12.05.18.
//

#include <iostream>
#include "binary-translator.h"
#include "assembler.h"

Function::Function(int start, int end, ivec vec) : start_(start), vec_(end-start){
    int  i = 0 ;
    while(i < end-start) {
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

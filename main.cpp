#include <iostream>
#include "CPU.h"
#include <vector>
#include "binary-translator.h"
#include "semantic_function_2.h"
#include <algorithm>
#include "time.h"

extern "C" double *func3_0(double, double *);

std::vector<Function *> *find_functions(ivec &vec);

std::vector<int> *read_code(char* filename);

void test(int n);

void gen_code4(std::vector<Function *> *funcs, const char *filename);


int main(int argc, char *argv[]) {
    std::vector<int> *vec = read_code(argv[1]); // code in our architecture (fact.out)
    std::vector<Function *> *functions = find_functions(*vec);
    gen_code4(functions, "../generated.s");

    test(atoi(argv[2])); // argument push in ax, but may not be used
}

void test(int n) {
    CPU_init(&cpu);
    cpu.ax = n;
    func3_0(NAN, cpu.stack.data - 2);
}

std::vector<Function *> *find_functions(ivec &vec) {
    ivec vec_call;
    int i = 0;
    while (i < vec.size()) {
        int num = vec[i];
        if (num == CALL) {
            vec_call.push_back(vec[i + 1]);
        }
        i += num_args[num] + 1;
    }
    std::sort(vec_call.begin(), vec_call.end());
    ivec vec_func;
    int last_call = -1;
    for (i = 0; i < vec_call.size(); i++) {
        int this_call = vec_call[i];
        if (this_call != last_call) {
            vec_func.push_back(this_call);
            last_call = this_call;
        }
    }

    std::vector<Function *> *functions = new std::vector<Function *>(vec_func.size() + 1);

    if (vec_func.empty()) {
        (*functions)[0] = new Function(0, vec.size(), vec);
    } else {
        (*functions)[0] = new Function(0, vec_func[0], vec);
        for (i = 1; i < vec_func.size(); i++) {
            (*functions)[i] = new Function(vec_func[i - 1], vec_func[i], vec);
        }
        (*functions)[vec_func.size()] = new Function(vec_func[vec_func.size() - 1], vec.size(), vec);
    }
    return functions;
}

std::vector<int> *read_code(char *filename) {
    FILE *in = fopen(filename, "r");
    int num = 0;
    std::vector<int> *vec = new std::vector<int>();
    while (fscanf(in, "%d", &num) != EOF) {
        vec->push_back(num);
    }
    fclose(in);
    return vec;
}


void gen_code4(std::vector<Function *> *funcs, const char *filename) {
    FILE *out = fopen(filename, "w+");
    fprintf(out, "\t\t.text\n");

    for (int k = 0; k < amount_of_operation(); k++) {
        fprintf(out, ".op_code_name_%s:\n", names[k]);
        fprintf(out, "\t\t.string \"%s\"\n", names[k]);
    }
    for (int i = 0; i < funcs->size(); i++) {
        (*funcs)[i]->gen_code4(out);
        fprintf(out, "\n");
    }

    fclose(out);
}
#include <iostream>
#include "CPU.h"
#include <vector>
#include "binary-translator.h"
#include "semantic_function_2.h"
#include <algorithm>
#include "time.h"

extern "C" double *func2_0(double, double *);

extern "C" double *func_0(double, double *);

extern "C" double *func3_0(double, double *);

void gen_code3(std::vector<Function *> *funcs, const char *filename);

void print_code(std::vector<Function *> *funcs);

std::vector<Function *> *find_functions(ivec &vec);

void gen_code2(std::vector<Function *> *funcs, const char *filename);

std::vector<int> *read_code(char* filename);

void test_fact(int n);

void test_fact2(int n);

void test_fact3(int n);

void gen_code(std::vector<Function *> *funcs, const char *filename);

void gen_code4(std::vector<Function *> *funcs, const char *filename);


int main(int argc, char *argv[]) {
//    old_main(argc, argv);
    std::vector<int> *vec = read_code(argv[2]);
    std::vector<Function *> *functions = find_functions(*vec);
    gen_code2(functions, "../generated.cpp");
    gen_code3(functions, "../fact2.s");
    gen_code4(functions, "../generated.s");

  //  clock_t t;
 //  t = clock();
    test_fact3(atoi(argv[3]));
  //  test_fact2(atoi(argv[3]));
//    return old_main(argc, argv);
 //   t = clock() - t;
 //   printf("clock : %d\ntime : %f\n", t, (float) t/CLOCKS_PER_SEC);
}


void test_fact2(int n) {
    CPU_init(&cpu);
    cpu.ax = n;

//    func2_0(NAN, cpu.stack.data - 2);
}

void test_fact3(int n) {
    CPU_init(&cpu);
    cpu.ax = n;

    start_time = clock();
    func3_0(NAN, cpu.stack.data - 2);

}


/*
void test_fact(int n) {
    CPU cpu;
    CPU_init(&cpu);
    cpu.ax = n;
//    func_0(NAN, cpu.stack.data - 2);
}
*/

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


void print_code(std::vector<Function *> *funcs) {
    for (int i = 0; i < funcs->size(); i++) {
        (*funcs)[i]->print_code();
        std::cout << std::endl;
    }
}

void gen_code(std::vector<Function *> *funcs, const char *filename) {
    FILE *out = fopen(filename, "w+");
    fprintf(out, "#include \"semantic_function.h\"\n\n");
    for (int i = 0; i < funcs->size(); i++) {
        (*funcs)[i]->gen_decl(out);
    }
    for (int i = 0; i < funcs->size(); i++) {
        (*funcs)[i]->gen_code1(out);
        fprintf(out, "\n");
    }
    fclose(out);
}


void gen_code1(std::vector<Function *> *funcs, const char *filename) {
    FILE *out = fopen(filename, "w+");
    fprintf(out, "#include \"semantic_function.h\"\n\n");
    for (int i = 0; i < funcs->size(); i++) {
        (*funcs)[i]->gen_decl(out);
    }
    for (int i = 0; i < funcs->size(); i++) {
        (*funcs)[i]->gen_code1(out);
        fprintf(out, "\n");
    }
    fclose(out);
}


void gen_code2(std::vector<Function *> *funcs, const char *filename) {
    FILE *out = fopen(filename, "w+");
    fprintf(out, "#include \"semantic_function_2.h\"\n\n");
    fprintf(out, "extern \"C\" {\n");
    for (int i = 0; i < funcs->size(); i++) {
        (*funcs)[i]->gen_decl2(out);
    }
    fprintf(out, "}\n");
    for (int i = 0; i < funcs->size(); i++) {
        (*funcs)[i]->gen_code2(out);
        fprintf(out, "\n");
    }

    fclose(out);
}


void gen_code3(std::vector<Function *> *funcs, const char *filename) {
    FILE *out = fopen(filename, "w+");
    fprintf(out, "\t\t.text\n");

    for (int k = 0; k < amount_of_operation(); k++) {
        fprintf(out, ".op_code_name_%s:\n", names[k]);
        fprintf(out, "\t\t.string \"%s\"\n", names[k]);
    }
    for (int i = 0; i < funcs->size(); i++) {
        (*funcs)[i]->gen_code3(out);
        fprintf(out, "\n");
    }

    fclose(out);
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
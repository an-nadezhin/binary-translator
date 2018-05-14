#include <cstring>
#include "CPU.h"

#define DEF_CMD(num, name, num_arg, code, stack_incr)  name,

const char *names[] = {
#include "commands.h"
};

#undef DEF_CMD


#define DEF_CMD(num, name, num_arg, code, stack_incr) num_arg,

int num_args[] = {
#include "commands.h"
};

#undef DEF_CMD

#define DEF_CMD(num, name, num_arg, code, stack_incr) stack_incr,

int stack_incrs[] = {
#include "commands.h"
};

#undef DEF_CMD


bool assembler(const char *filenameIN, const char *filenameOUT) {

    FILE *IN = fopen(filenameIN, "r");
    FILE *OUT = fopen(filenameOUT, "w+");

    char name[10] = {0};
    int pc = 0;
    int pos = 0;
    int labels[10] = {0};

    if (IN == NULL) {
        std::cout << filenameIN << " not found" << std::endl;
        return true;
    }

    if (OUT == NULL) {
        std::cout << filenameOUT << " failure " << std::endl;
        return true;
    }

    while (fscanf(IN, "%s", name) != EOF) {
        char *ptr = strchr(name, ':');
        if (ptr) {
            *ptr = '\0';
            labels[atoi(name)] = pos;
        }
        pos++;
    }

    fseek(IN, 0, SEEK_SET);

    while (fscanf(IN, "%s", name) != EOF) {
        if (strchr(name, ':')) {
            fprintf(OUT, "%d\n", NOP);
            pc++;
            continue;
        }
        int op = find_name(name);
        if (op == -1) {
            return true;
        }
        fprintf(OUT, "%d", op);
        pc++;
        if (num_args[op]) {
            fscanf(IN, "%s", name);
            char *ptr = strchr(name, '$');
            int number = 0;
            if (ptr) {
                *ptr = '\0';
                number = labels[atoi(name)];
            } else {
                number = atoi(name);
            }
            fprintf(OUT, " %d", number);
            pc++;
        }
        fprintf(OUT, "\n");
    }
    fclose(IN);
    fclose(OUT);
    return false;
}


int find_name(const char *name) {
    for (int op = 0; op < amount_of_operation(); op++) {
        if (!strcasecmp(name, names[op]))
            return op;
    }
    return -1;
}

int amount_of_operation() {
return sizeof(names)/sizeof(names[0]);
}

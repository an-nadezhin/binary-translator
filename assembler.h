//
// Created by andrew on 05.11.17.
//

#ifndef CPU_ASSEMBLER_H
#define CPU_ASSEMBLER_H

extern int num_args[];
extern const char * names [];
extern int stack_incrs[];

bool assembler(const char *filenameIN, const char *filenameOUT);

int find_name(const char *name);

#endif //CPU_ASSEMBLER_H

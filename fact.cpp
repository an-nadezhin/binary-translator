#include "semantic_function.h"

void func_0(CPU* cpu);
void func_7(CPU* cpu);
void func_33(CPU* cpu);



void func_0(CPU* cpu) {
  int pc = 0;
  for(;;) {
     switch (pc) {
	case 0:
	op_push_ax(cpu);
	case 1:
	op_push_bx(cpu);
	case 2:
	op_push_cx(cpu);
	case 3:
	    print_dump("call", cpu);
	func_33(cpu);

	case 5:
	op_out(cpu);
	case 6:
	op_halt(cpu);
	return;
     }
  }
}

void func_7(CPU* cpu) {
  int pc = 7;
  for(;;) {
    switch (pc) {
      case 7:
        op_nop(cpu);
      case 8:
        op_push_deep(cpu, 1);
      case 10:
        op_push(cpu, 0);
      case 12:
        pc = op_jbe (cpu, 27, 14);   ///?????????
        break;
      case 14:
        op_push_deep(cpu, 1);
      case 16:
        op_push_deep(cpu, 2);
      case 18:
	op_push(cpu, 1); 
      case 20:
	op_sub(cpu);
      case 21:
          print_dump("call", cpu);
	func_7(cpu);
      case 23:
	op_mul(cpu);
      case 24:
	op_drop(cpu, 1);
      case 26:
          print_dump("ret", cpu);
	op_ret(cpu);
        return;
      case 27:
	op_nop(cpu);
      case 28:
	op_push(cpu, 1);
      case 30:
	op_drop(cpu, 1);
      case 32:
          print_dump("ret", cpu);
	op_ret(cpu);
	return;
    }
   }
}

void func_33(CPU* cpu) {
  int pc = 33;
    for(;;) {
      switch (pc) {
	case 33:
	op_nop(cpu);
	case 34:
	op_push_deep(cpu, 3);
	case 36:
        print_dump("call", cpu);
	func_7(cpu);	
	case 38:
	op_drop(cpu, 3);
	case 40:
        print_dump("ret", cpu);
	op_ret(cpu);
	return;
    }
  }
}




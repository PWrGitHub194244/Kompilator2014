/**************
Machine Language
**************/

enum assm_ops {READ, WRITE , LOAD, STORE,
	ADD, SUB, SHR, SHL, INC, RESET,
	JUMP, JZERO,  JODD, HALT};

char *op_name[] = {"READ", "WRITE", "LOAD", "STORE",
	"ADD", "SUB", "SHR", "SHL", "INC", "RESET",
	"JUMP", "JZERO",  "JODD", "HALT"};

struct instruction{
	enum assm_ops op;
	int arg;
};

struct instruction code[9997];

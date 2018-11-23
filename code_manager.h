/**************
Code Placer
**************/

int data_offset = 4;

//allocates space for one symbol
int data_locate(){
	return data_offset++;
}

int code_offset = 0;

//returns current offset
int get_label(){
	return code_offset;
}
//allocates space for one line of code
int code_allocate(){
	if(code_offset+1==888 || code_offset+1==8888 || code_offset+1==8889)
		code_offset+=2;
		else
	return code_offset++;
}

//generates code at current location
void gen_code(enum assm_ops operation, int arg){
	code[code_offset].op = operation;
	code[code_offset++].arg = arg;
}

//generates code at previously reserved location
void back_patch(int addr, enum assm_ops operation, int arg){
	code[addr].op = operation;
	code[addr].arg = arg;
}

//prints machine code to given file
void print_code(FILE* out){
	for(int i=0; i<code_offset; i++)
		if(code[i].arg < 0)
			fprintf(out,"%-10s\n",op_name[code[i].op]);
		else
			fprintf(out,"%-10s%4d\n",op_name[code[i].op], code[i].arg);
}

/* Lista das instruções a serem utilizadas no simulador:
 * Tomando como base o instruction set do MIPS32 existem 3 formatos de instruções (tamano 32 bits):
 * tipo R: opcode (6) rs (5) rt (5) rd (5) shamt (5) funct (6) # 3 operandos, s(first)/t(second)/d(destination)/shift/function
 * tipo I: opcode (6) rs (5) rt (5) imediato (16) # 2 operandos
 * típo J: opcode (6) endereço (26) # jump
 * Vetor de poteiros de função para armazenar a isntrucao
 * THE ROAD SO FAR:
 * So algumas instrucoes adicionadas
 * Confirmar com o tio depois as que precisam
 */ 
 
 //definicao dos tokens

 #define i_ADD 0
 #define i_ADDU 1
 #define i_ADDI 2
 #define i_AND 3
 #define i_ANDI 4
 #define i_DIV 5
 #define i_DIVU 6
 #define i_MULT 7
 #define i_MULTU 8
 #define i_OR 9
 #define i_NOR 10
 #define i_ORI 11
 #define i_SLL 12
 #define i_SLLV 13
 #define i_SRA 14
 #define i_SRAV 15
 #define i_SRL 16
 #define i_SRLV 17
 #define i_SUB 18
 #define i_SUBU 19
 #define i_XOR 20
 #define i_XORI 21
 #define i_LHI 22
 #define i_LLO 23
 #define i_SLT 24
 #define i_SLTU 25
 #define i_SLTI 26
 #define i_SLTIU 27
 #define i_BEQ 28
 #define i_BGTZ 29
 #define i_BLEZ 30
 #define i_BNE 31
 #define i_J 32

 typedef void(*instFunc)(void);

 // Declaracao:

 void f_ADD(){printf("EVERY BODY GETS HIGH SOMETIMES Ya KNOW\n");};
 void f_ADDU(){};
 void f_ADDI(){};
 void f_AND(){};
 void f_ANDI(){};
 void f_DIV(){};
 void f_DIVU(){};
 void f_MULT(){};
 void f_MULTU(){};
 void f_OR(){};
 void f_NOR(){};
 void f_ORI(){};
 void f_SLL(){};
 void f_SLLV(){};
 void f_SRA(){};
 void f_SRAV(){};
 void f_SRL(){};
 void f_SRLV(){};
 void f_SUB(){};
 void f_SUBU(){};
 void f_XOR(){};
 void f_XORI(){};
 void f_LHI(){};
 void f_LLO(){};
 void f_SLT(){};
 void f_SLTU(){};
 void f_SLTI(){};
 void f_SLTIU(){};
 void f_BEQ(){};
 void f_BGTZ(){};
 void f_BLEZ(){};
 void f_BNE(){};
 void f_J(){};

 instFunc instSet[] =
 {
	 f_ADD,
	 f_ADDU/*
	 f_ADDI,
	 f_AND,
	 f_ANDI,
	 f_DIV,
	 f_DIVU,
	 f_MULT,
	 f_MULTU,
	 f_OR,
	 f_NOR,
	 f_ORI,
	 f_SLL,
	 f_SLLV,
	 f_SRA,
	 f_SRAV,
	 f_SRL,
	 f_SRLV,
	 f_SUB,
	 f_SUBU,
	 f_XOR,
	 f_XORI,
	 f_LHI,
	 f_LLO,
	 f_SLT,
	 f_SLTU,
	 f_SLTI,
	 f_SLTIU,
	 f_BEQ,
	 f_BGTZ,
	 f_BLEZ,
	 f_BNE,
	 f_J,
	 f_BLEZ*/
 };

/* Register set para o simulador
 * Definicao e mapeamento dos registradores utlidaos
 * Contem os 32 registradores, de acordo com o datasheet de james r.larus
 */

 // Definicao dos tokens:

 #define r_ZERO 0
 #define r_AT 1
 #define r_V0 2
 #define r_V1 3
 #define r_A0 4
 #define r_A1 5
 #define r_A2 6
 #define r_A3 7
 #define r_T0 8
 #define r_T1 9
 #define r_T2 10
 #define r_T3 11
 #define r_T4 12
 #define r_T5 13
 #define r_T6 14
 #define r_T7 15
 #define r_T8 16
 #define r_T9 17
 #define r_S0 18
 #define r_S1 19
 #define r_S2 20
 #define r_S3 21
 #define r_S4 22
 #define r_S5 23
 #define r_S6 24
 #define r_S7 25
 #define r_K0 26
 #define r_K1 27
 #define r_GP 28
 #define r_SP 29
 #define r_FP 30
 #define r_RA 31

 

 typedef void(*regFunc)(int);

 // DEFINICAO:

 void f_ZERO(int index){};
 void f_AT(int index){};
 void f_V0(int index){};
 void f_V1(int index){};
 void f_A0(int index){};
 void f_A1(int index){};
 void f_A2(int index){};
 void f_A3(int index){};
 void f_T0(int index){};
 void f_T1(int index){};
 void f_T2(int index){};
 void f_T3(int index){};
 void f_T4(int index){printf("EEHHH ESSE TOM DE VOZ EU RECONHECO\n");};
 void f_T5(int index){};
 void f_T6(int index){};
 void f_T7(int index){};
 void f_T8(int index){};
 void f_T9(int index){};
 void f_S0(int index){};
 void f_S1(int index){};
 void f_S2(int index){};
 void f_S3(int index){};
 void f_S4(int index){};
 void f_S5(int index){};
 void f_S6(int index){};
 void f_S7(int index){};
 void f_K0(int index){};
 void f_K1(int index){};
 void f_GP(int index){};
 void f_SP(int index){};
 void f_FP(int index){};
 void f_RA(int index){};


 // Vetor para mapeamento dos registradores - MAPEAMENTO:

 regFunc regSet[] =
 {
	 f_ZERO,
	 f_AT,
	 f_V0,
	 f_V1,
	 f_A0,
	 f_A1,
	 f_A2,
	 f_A3,
	 f_T0,
	 f_T1,
	 f_T2,
	 f_T3,
	 f_T4,
	 f_T5,
	 f_T6,
	 f_T7,
	 f_T8,
	 f_T9,
	 f_S0,
	 f_S1,
	 f_S2,
	 f_S3,
	 f_S4,
	 f_S5,
	 f_S6,
	 f_S7,
	 f_K0,
	 f_K1,
	 f_GP,
	 f_SP,
	 f_FP,
	 f_RA
 };


 
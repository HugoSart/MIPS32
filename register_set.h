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

 

 typedef void(*regFunc)(void);

 // DEFINICAO:

 void f_ZERO(){};
 void f_AT(){};
 void f_V0(){};
 void f_V1(){};
 void f_A0(){};
 void f_A1(){};
 void f_A2(){};
 void f_A3(){};
 void f_T0(){};
 void f_T1(){};
 void f_T2(){};
 void f_T3(){};
 void f_T4(){};
 void f_T5(){};
 void f_T6(){};
 void f_T7(){};
 void f_T8(){};
 void f_T9(){};
 void f_S0(){};
 void f_S1(){};
 void f_S2(){};
 void f_S3(){};
 void f_S4(){};
 void f_S5(){};
 void f_S6(){};
 void f_S7(){};
 void f_K0(){};
 void f_K1(){};
 void f_GP(){};
 void f_SP(){printf("OLA\n");};
 void f_FP(){};
 void f_RA(){};


 // Vetor para mapeamento dos registradores - MAPEAMENTO:

 regFunc regSet[32] =
 {
	 [r_ZERO] = f_ZERO,
	 [r_AT] = f_AT,
	 [r_V0] = f_V0,
	 [r_V1] = f_V1,
	 [r_A0] = f_A0,
	 [r_A1] = f_A1,
	 [r_A2] = f_A2,
	 [r_A3] = f_A3,
	 [r_T0] = f_T0,
	 [r_T1] = f_T1,
	 [r_T2] = f_T2,
	 [r_T3] = f_T3,
	 [r_T4] = f_T4,
	 [r_T5] = f_T5,
	 [r_T6] = f_T6,
	 [r_T7] = f_T7,
	 [r_T8] = f_T8,
	 [r_T9] = f_T9,
	 [r_S0] = f_S0,
	 [r_S1] = f_S1,
	 [r_S2] = f_S2,
	 [r_S3] = f_S3,
	 [r_S4] = f_S4,
	 [r_S5] = f_S5,
	 [r_S6] = f_S6,
	 [r_S7] = f_S7,
	 [r_K0] = f_K0,
	 [r_K1] = f_K1,
	 [r_GP] = f_GP,
	 [r_SP] = f_SP,
	 [r_FP] = f_FP,
	 [r_RA] = f_RA
 };


 
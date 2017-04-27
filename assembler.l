%{
	#include "assembler.tab.h"
	int yylval;
%}


%%


"ADD" { return 6;}
"SUB" {fprintf(yyout, "MNEMONICO"); itob(22, 31); return MNEMONICO;}
"MOVN" {fprintf(yyout, "MNEMONICO"); itob(11, 31); return MNEMONICO;}
"AND" {fprintf(yyout, "MNEMONICO"); itob(36, 31); return MNEMONICO;}
"BEQ" {fprintf(yyout, "MNEMONICO"); itob(4, 5); return MNEMONICO;}
"MADDU" {fprintf(yyout, "MNEMONICO");itob(28, 5); itob(1, 31); return MNEMONICO;}
"J" {fprintf(yyout, "MNEMONICO"); itob(2, 5); BEGIN JUMP; return MNEMONICO;}
[0-9]+|"-"[0-9]+ {yylval = atoi(yytext); return IMEDIATO;}
"$zero" {yylval = r_ZERO; return REGISTRADOR;}
"$at" {yylval = r_AT; return REGISTRADOR;}	
"$v0" {yylval = r_V0; return REGISTRADOR;}
"$v1" {yylval = r_V1; return REGISTRADOR;}
"$a0" {yylval = r_A0; return REGISTRADOR;}
"$a1" {yylval = r_A1; return REGISTRADOR;}
"$a2" {yylval = r_A2; return REGISTRADOR;}
"$a3" {yylval = r_A3; return REGISTRADOR;}
"$t0" {yylval = r_T0; return REGISTRADOR;}
"$t1" {yylval = r_T1; return REGISTRADOR;}
"$t2" {yylval = r_T2; return REGISTRADOR;}
"$t3" {yylval = r_T3; return REGISTRADOR;}
"$t4" {yylval = r_T4; return REGISTRADOR;}
"$t5" {yylval = r_T5; return REGISTRADOR;}
"$t6" {yylval = r_T6; return REGISTRADOR;}
"$t7" {yylval = r_T7; return REGISTRADOR;}
"$t8" {yylval = r_T8; return REGISTRADOR;}
"$t9" {yylval = r_T9; return REGISTRADOR;}
"$s0" {yylval = r_S0); return REGISTRADOR;}
"$s1" {yylval = r_S1); return REGISTRADOR;}
"$s2" {yylval = r_S2); return REGISTRADOR;}
"$s3" {yylval = r_S3); return REGISTRADOR;}
"$s4" {yylval = r_S4); return REGISTRADOR;}
"$s5" {yylval = r_S5); return REGISTRADOR;}
"$s6" {yylval = r_S6); return REGISTRADOR;}
"$s7" {yylval = r_S7); return REGISTRADOR;}
"$k"[0-1] {fprintf(yyout, "REGISTRADOR"); return REGISTRADOR;}
"$gp" {fprintf(yyout, "REGISTRADOR"); return REGISTRADOR;}
"$sp" {fprintf(yyout, "REGISTRADOR"); return REGISTRADOR;}
"$fp" {fprintf(yyout, "REGISTRADOR"); return REGISTRADOR;}
"$ra" {fprintf(yyout, "REGISTRADOR"); return REGISTRADOR;}
^[A-Z]+":" {fprintf(yyout, "ROTULO"); return ROTULO;}
"," {fprintf(yyout, " VRGLA "); return VIRGULA;}
"(" {fprintf(yyout, " OP "); return OP;}
")" {fprintf(yyout, " CP "); return CP;}
. {fprintf(yyout, " - ");}

<JUMP>{
[a-zA-z]+ {fprintf(yyout, "ROTULO"); BEGIN TEXTO; return ROTULO;}
[0-9]+ {fprintf(yyout, "IMEDIATO" ); BEGIN TEXTO; return IMEDIATO;}
}

%%
%{
	#include "assembler.tab.h"
	int yylval;
%}

%x DADOS
%x TEXTO
%x JUMP

%%

".data" {fprintf(yyout, "AREA DE DADOS: "); BEGIN DADOS;}
".text" {fprintf(yyout, "AREA DE TEXTO: "); BEGIN TEXTO;}

<DADOS>{
^[a-zA-Z]+":" {fprintf(yyout, "DECLARACAO VARIAVEL"); return DECLARACAO;}
".text" {fprintf(yyout, "AREA DE TEXTO: "); BEGIN TEXTO;}
. {fprintf(yyout, "-");}
}


<TEXTO>{
"ADD" {fprintf(yyout, "MNEMONICO"); return 6;}
"SUB" {fprintf(yyout, "MNEMONICO"); itob(22, 31); return MNEMONICO;}
"MOVN" {fprintf(yyout, "MNEMONICO"); itob(11, 31); return MNEMONICO;}
"AND" {fprintf(yyout, "MNEMONICO"); itob(36, 31); return MNEMONICO;}
"BEQ" {fprintf(yyout, "MNEMONICO"); itob(4, 5); return MNEMONICO;}
"MADDU" {fprintf(yyout, "MNEMONICO");itob(28, 5); itob(1, 31); return MNEMONICO;}
"J" {fprintf(yyout, "MNEMONICO"); itob(2, 5); BEGIN JUMP; return MNEMONICO;}
[0-9]+|"-"[0-9]+ {fprintf(yyout, "IMEDIATO"); return IMEDIATO;}
[a-z]+ {fprintf(yyout, "VARIAVEL"); return VARIAVEL;}
"$zero" {fprintf(yyout, "REGISTRADOR"); return REGISTRADOR;}
"$at" {fprintf(yyout, "REGISTRADOR"); return REGISTRADOR;}	
"$v"[0-1] {fprintf(yyout, "REGISTRADOR"); return REGISTRADOR;}
"$a"[0-3] {fprintf(yyout, "REGISTRADOR"); return REGISTRADOR;}
"$t"[0-9] {fprintf(yyout, "REGISTRADOR"); return REGISTRADOR;}
"$s"[0-7] {fprintf(yyout, "REGISTRADOR"); return REGISTRADOR;}
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
}

<JUMP>{
[a-zA-z]+ {fprintf(yyout, "ROTULO"); BEGIN TEXTO; return ROTULO;}
[0-9]+ {fprintf(yyout, "IMEDIATO" ); BEGIN TEXTO; return IMEDIATO;}
}

%%
/* Modulo: Tradutor assembly -> inteiro
 * Realiza a leitura de um arquivo de entrada contendo codigo assembly
 * Traduz para um arquivo de saida contendo a traducao em codigo binario (representado por inteiro)
 * Tomando como base o simulador MIPS32, o tamanho da palavra será de 32bits
 * As instrucoes podem seguir 3 tipos de formato: tipo R, J e I:
 * tipo R: opcode (6) rs (5) rt (5) rd (5) shamt (5) funct (6) # 3 operandos, s(first)/t(second)/d(destination)/shift/function
 * 		Instrucoes do tipo R sao utilizadas quando os dados a serem utilizados estao alocados em registradores
 * tipo I: opcode (6) rs (5) rt (5) imediato (16) # 2 operandos
 * 		Instrucoes do tipo I operam valores imediatos e registradores
 * típo J: opcode (6) endereço (26) # jump
 * RESTRICOES ATE AGORA:
 * Sem label
 * Sem variavel
 * Portanto sem alguns formatos de instrucao
 * Sem area de data
 * Confirmar com o tio depois
 */

%{
 	extern char buffer[33] = {[0 ... 31] = '0', [32] = '\0'};
	#include <stdlib.h>
	#include <stdio.h>
	#include <string.h>
	#include "dec2bin.h"
	extern FILE* yyin, *yyout;


	yyerror(char *s)
	{
  		fprintf(stderr, "ERROU NO CODIGO, IDIOTA: %s\n", s);
	}

%}

%token MNEMONICO
%token REGISTRADOR
%token IMEDIATO
%token OP
%token CP
%token VIRGULA
%token ROTULO

%%

texto: 
	| texto instrucao
 	| texto ROTULO
	;

instrucao:  MNEMONICO REGISTRADOR VIRGULA REGISTRADOR VIRGULA REGISTRADOR 
	| MNEMONICO REGISTRADOR VIRGULA REGISTRADOR VIRGULA IMEDIATO
	| MNEMONICO REGISTRADOR VIRGULA REGISTRADOR
	| MNEMONICO REGISTRADOR VIRGULA IMEDIATO OP REGISTRADOR CP 
	| MNEMONICO REGISTRADOR VIRGULA REGISTRADOR VIRGULA VARIAVEL 
	| MNEMONICO ROTULO 
	| MNEMONICO IMEDIATO 
	;


%%

	int main()
	{
		yyin = fopen("exemplo", "r");
		yyout = fopen("bin_output", "w+");
		yyparse();
		fclose(yyout);
		fclose(yyin);
		printf("\n");
		return 0;
	}

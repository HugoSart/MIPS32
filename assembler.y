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
 */

%{
 	extern char buffer[33] = {[0 ... 31] = '0', [32] = '\0'};
	#include <stdlib.h>
	#include <stdio.h>
	#include <string.h>
	#include "dec2bin.h"
	extern FILE* yyin, *yyout,;
	int count = 0;


	yyerror(char *s)
	{
  		fprintf(stderr, "ERROU NO CODIGO, IDIOTA: %s\n", s);
	}
%}

%token MNEMONICO
%token REGISTRADOR
%token IMEDIATO
%token VARIAVEL
%token OP
%token CP
%token ROTULO
%token VIRGULA
%token COMENTARIO
%token DECLARACAO

%%

arquivo: 
	| dado texto
	;

texto: 
	| texto instrucao
 	| texto ROTULO
	;

instrucao:  MNEMONICO REGISTRADOR VIRGULA REGISTRADOR VIRGULA REGISTRADOR {instSet[$1]();printf(%s, buffer), flush}
	| MNEMONICO REGISTRADOR VIRGULA REGISTRADOR VIRGULA IMEDIATO {$$ = buffer; printf("%s\n", $$); memset(buffer, '-', 32);}
	| MNEMONICO REGISTRADOR VIRGULA REGISTRADOR{$$ = buffer; printf("%s\n", $$); memset(buffer, '-', 32);}
	| MNEMONICO REGISTRADOR VIRGULA IMEDIATO OP REGISTRADOR CP {$$ = buffer; printf("%s\n", $$); memset(buffer, '-', 32);}
	| MNEMONICO REGISTRADOR VIRGULA REGISTRADOR VIRGULA VARIAVEL {$$ = buffer; printf("%s\n", $$); memset(buffer, '-', 32);}
	| MNEMONICO REGISTRADOR{$$ = buffer; printf("%s\n", $$); memset(buffer, '-', 32);}
	| MNEMONICO ROTULO {$$ = buffer; printf("%s\n", $$); memset(buffer, '-', 32);}
	| MNEMONICO IMEDIATO {$$ = buffer; printf("%s\n", $$); memset(buffer, '-', 32);}
	;


dado: dado dado
	| DECLARACAO
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

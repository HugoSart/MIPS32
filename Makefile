assembler:	assembler.l assembler.y
	bison -d assembler.y
	flex assembler.l
	cc -o $@ assembler.tab.c lex.yy.c -lfl

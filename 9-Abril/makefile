calc: notas.l notas.y
	flex notas.l
	yacc notas.y
	cc -o notas y.tab.c -ly -lm

clean:
	rm -f y.tab.c lex.yy.c calc
%option noyywrap

%%
[0-9]+(\.[0-9]+)?  {yylval.n = atof(yytext); return NUM; }
(Curso)            { return CURSO;}
[a-zA-Z]+          { yylval.c=strdup(yytext); return TXT;}
[(),:]     { return yytext[0];}

[ \t\n\r]     {}
.             { yyerror("Carater inválido"); }
%%
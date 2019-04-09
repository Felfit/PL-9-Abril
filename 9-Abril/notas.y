%code{
 #include <stdio.h>
 #include <math.h>
 int yyerror(char *s){ fprintf(stderr,"Erro:%s\n",s);}
 int yylex();
 int cont = 0;
}
%token  NUM TXT CURSO
%union{ double n;  
        char* c;
      }

%type <n> notas NUM
%type <c> TXT
%%

ax      : uni
        ;

uni     : uni curso
        | curso
        ;

curso   : CURSO ':' TXT NUM {
                    printf("\\section{%s  %d}\n",$3,(int)$4);
                    printf("\\begin{tabular}{|l|r|r|}\n\\hline\n");
                    printf("Nome&Média&Número de Notas\\\\\n");
        }alunos {printf("\\hline\n\\end{tabular}\n");}
        ;


alunos  : alunos TXT '(' notas ')'      {
            printf("%s&%.1f&%d\\\\\n", $2,($4/cont),cont);                                    
                                    }
        |
        ;

notas   : NUM ',' notas         {$$ = $1+$3;cont++;}
        | NUM                   {$$ = $1;cont=1;}
        ;

%%
#include "lex.yy.c"
int main(){
   yyparse();
   return 0;
}
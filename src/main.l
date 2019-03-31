    /* Rafael S. M. Santos, 186154, JSON Parser */

%{
#include <stdlib.h>

#include "y.tab.h"


void yyerror(char *);
%}

DIGITO  [0-9]

%%

[{] {
    return ABRE_CHAVE;
}

[}] {
    return FECHA_CHAVE;
}

[[] {
    return ABRE_COLCHETE;
}

[]] {
    return FECHA_COLCHETE;
}

[,] {
    return VIRGULA;
}

[:] {
    return DOIS_PONTOS;
}

(\"[^\"]*\") {
    return STRING;
}

([-]?{DIGITO}+) {
    return INTEIRO;
}

([-]?{DIGITO}+(\.{DIGITO}+)?) {
    return FLOAT;
}

    /* ignoramos espaços */
[\t\n ]+ ;

.   {
    yyerror("Token desconhecido!\n");
}

%%

int yywrap() {
    return 1;
}

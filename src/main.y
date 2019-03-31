    /* Rafael S. M. Santos, 186154, JSON Parser */

%{
#include <stdio.h>
#include <stdlib.h>

int ocorreu_erro = 0;

void yyerror(char *c);
int yylex(void);

%}

%token ABRE_CHAVE FECHA_CHAVE ABRE_COLCHETE FECHA_COLCHETE VIRGULA DOIS_PONTOS STRING INTEIRO FLOAT

%%

JSON:
    DICIONARIO
    ;


DICIONARIO:
    ABRE_CHAVE MEMBROS FECHA_CHAVE
    ;


MEMBROS:
    | MEMBRO
    | MEMBRO VIRGULA MEMBROS
    ;


MEMBRO:
    STRING DOIS_PONTOS VALOR
    ;


VALOR:
    DICIONARIO
    | LISTA
    | STRING
    | INTEIRO
    | FLOAT
    ;


LISTA:
    ABRE_COLCHETE ITENS FECHA_COLCHETE
    | ABRE_COLCHETE FECHA_COLCHETE
    ;


ITENS:
    ITEM
    | ITEM VIRGULA ITENS
    ;


ITEM:
    VALOR
    ;


%%

void yyerror(char *s) {
    /*fprintf(stderr, s);*/
    if (!ocorreu_erro) {
        printf("INVALIDO\n");
        ocorreu_erro = 1;
    }
}

int main() {
    yyparse();
    if (!ocorreu_erro) {
        printf("VALIDO\n");
    }
    return 0;
}

%{
#include "goianinha.tab.h"
int string_start_line = 0;
%}

%option yylineno

%%

"programa"          { return PROGRAMA; }
"car"               { return CAR; }
"int"               { return INT; }
"retorne"           { return RETORNE; }
"leia"              { return LEIA; }
"escreva"           { return ESCREVA; }
"novalinha"         { return NOVALINHA; }
"se"                { return SE; }
"entao"             { return ENTAO; }
"senao"             { return SENAO; }
"enquanto"          { return ENQUANTO; }
"execute"           { return EXECUTE; }

[a-zA-Z_][a-zA-Z0-9_]*    { return ID; }
[0-9]+                  { return INTCONST; }

'[^']'                  { return CARCONST; }

\"[^"\n]*\"             { return CONSTSTRING; /* String completa em uma linha */ }

\"[^"\n]*$              { printf("ERRO: CADEIA DE CARACTERES NAO TERMINADA na linha %d\n", yylineno); return 0; }

\"[^"]*\n[^"]*\"        { printf("ERRO: CADEIA DE CARACTERES OCUPA MAIS DE UMA LINHA na linha %d\n", yylineno); return 0; }

"+"                 { return MAIS; }
"-"                 { return MENOS; }
"*"                 { return MULT; }
"/"                 { return DIV; }
"=="                { return IGUAL_COMPARACAO; }
"!="                { return DIFERENTE; }
"<"                 { return MENOR; }
">"                 { return MAIOR; }
"<="                { return MENORIGUAL; }
">="                { return MAIORIGUAL; }
"&&"                { return E_LOGICO; }
"||"                { return OU_LOGICO; }
"!"                 { return EXCLAMACAO; }
"="                 { return IGUAL; }
"("                 { return ABRE_PAR; }
")"                 { return FECHA_PAR; }
"{"                 { return ABRE_CHAVE; }
"}"                 { return FECHA_CHAVE; }
";"                 { return PONTO_VIRGULA; }
","                 { return VIRGULA; }

[ \t]+             { /* ignorar espaços e tabs */ }
\n                 { /* ignorar quebras de linha */ }

\/\*([^*]|\*+[^*/])*\*+\/    { /* ignorar comentários corretos */ }

\/\*([^*\/]|\*[^/])*$          { printf("ERRO: COMENTÁRIO NAO TERMINA na linha %d\n", yylineno); return 0; }

.                            { printf("ERRO: CARACTERE INVÁLIDO na linha %d\n", yylineno); return 0; }

%%

int yywrap() {
    return 1;
}
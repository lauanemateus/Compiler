%{
#include "goianinha.tab.h"
int string_start_line = 0;
%}

%option yylineno
%x STR

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

'[^']'                  { return CARCONST; /* [^] é um conjunto negado. Ele significa: qualquer caractere que NÃO seja aspas simples ' */} 

\"                      { string_start_line = yylineno; BEGIN(STR); /* aqui está se referindo literalmente à aspas duplas. 
                        A barra invertida é necessário porque as aspas duplas é um dos caracteres especiais
                        Inicia o scanner no estado STR */}

<STR>[^"\n]*            { /* consumir conteúdo da string. <STR> => esta regra só é considerada quando o scanner está no estado STR
                        O regex significa que vai consumuir várias vezes tudo que não é 
                        aspas duplas, \n (regex entende \n como uma única coisa nos conjuntos)
                        }

<STR>\"                { BEGIN(INITIAL); return CONSTSTRING; /* Consome aspas duplas e volta ao estado inicial do programa */}

<STR><<EOF>>           { printf("ERRO: CADEIA DE CARACTERES NAO TERMINADA %d\n", string_start_line); return 0; }

<STR>\n                { printf("ERRO: CADEIA DE CARACTERES OCUPA MAIS DE UMA LINHA %d\n", string_start_line); yylineno++; return 0; }

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

\/\*([^*]|\*+[^/])*\*+\/    { /* ignorar comentários corretos.
                            comentários C que podem ser multilinha.
                            Descrição do regex:
                            - (barra e asterisco; barra foi escapada)
                            - zero ou mais repetições de:
                            - qualquer caractere que não seja *, ou
                            - uma ou mais * seguidas de um caractere que não seja / (isso evita fechar comentario por engano).
                            - uma ou mais * seguidas de / (fecha o comentário).
                            - Essa regex permite que o comentário contenha * internos e texto
                            */}

\/\*([^*]|\*[^//])*             { 
                                  printf("ERRO: COMENTÁRIO NAO TERMINA %d\n", yylineno); 
                                  return 0;
                                }

.                               { 
                                  printf("ERRO: CARACTERE INVÁLIDO %d\n", yylineno); 
                                  return 0;
                                }

%%

int yywrap();

int yywrap() {
    return 1;
}
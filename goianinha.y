/* Secao de declaracao (delcaration section)*/

%{
#include <stdio.h>
#include <stdlib.h>
extern int yylex();
extern FILE *yyin;
void yyerror(char const *);
extern int yylineno;

%}

/* Bison Declarations 
Os operadores que são declarados primeiro tem menos prioridade
*/

%token CAR 
%token INT 
%token RETORNE 
%token LEIA 
%token ESCREVA 
%token NOVALINHA 
%token SE 
%token ENTAO 
%token SENAO 
%token ENQUANTO 
%token EXECUTE 
%token ID 
%token INTCONST 
%token CARCONST 
%token CONSTSTRING 
%token MAIS 
%token MENOS 
%token MULT 
%token DIV 
%token IGUAL 
%token IGUAL_COMPARACAO
%token DIFERENTE 
%token MENOR 
%token MAIOR 
%token MENORIGUAL 
%token MAIORIGUAL 
%token E_LOGICO 
%token OU_LOGICO 
%right EXCLAMACAO 
%nonassoc ENTAO
%nonassoc SENAO
%token ABRE_PAR 
%token FECHA_PAR 
%token ABRE_CHAVE 
%token FECHA_CHAVE 
%token PONTO_VIRGULA 
%token VIRGULA 
%token PROGRAMA
%verbose

%start Programa

%% /*Grammar rules*/
Programa:                DeclFuncVar DeclProg
;

DeclFuncVar:             Tipo ID DeclVar PONTO_VIRGULA DeclFuncVar
                         |Tipo ID DeclFunc DeclFuncVar
                         |/*vazio*/                        
;

DeclProg:                PROGRAMA Bloco
;

DeclVar:                 VIRGULA ID DeclVar
                         |/*vazio*/
;

DeclFunc:                ABRE_PAR ListaParametros FECHA_PAR Bloco
;

ListaParametros:         /*vazio*/
                         |ListaParametrosCont
;

ListaParametrosCont:     Tipo ID
                         |Tipo ID VIRGULA ListaParametrosCont
;

Bloco:                   ABRE_CHAVE ListaDeclVar ListaComando FECHA_CHAVE
                         |ABRE_CHAVE ListaDeclVar FECHA_CHAVE
;

ListaDeclVar:            /*vazio*/
                         |Tipo ID DeclVar PONTO_VIRGULA ListaDeclVar
;

Tipo:                    INT
                         |CAR
;

ListaComando:            Comando   
                         |Comando ListaComando
;

Comando:                 PONTO_VIRGULA
                         |Expr PONTO_VIRGULA
                         |RETORNE Expr PONTO_VIRGULA
                         |LEIA LValueExpr PONTO_VIRGULA
                         |ESCREVA Expr PONTO_VIRGULA
                         |ESCREVA CONSTSTRING PONTO_VIRGULA
                         |NOVALINHA PONTO_VIRGULA
                         |SE ABRE_PAR Expr FECHA_PAR ENTAO Comando 
                         |SE ABRE_PAR Expr FECHA_PAR ENTAO Comando SENAO Comando
                         |ENQUANTO ABRE_PAR Expr FECHA_PAR EXECUTE Comando
                         |Bloco              
;

Expr:                    OrExpr
                         |LValueExpr IGUAL Expr
                         |LValueExpr IGUAL AssignExpr  
;

OrExpr:                   OrExpr OU_LOGICO AndExpr
                         |AndExpr
;

AndExpr:                 AndExpr E_LOGICO EqExpr
                         |EqExpr
;

EqExpr:                  EqExpr IGUAL_COMPARACAO DesigExpr
                         |EqExpr DIFERENTE DesigExpr
                         |DesigExpr
;

DesigExpr:               DesigExpr MENOR AddExpr
                         |DesigExpr MAIOR AddExpr
                         |DesigExpr MAIORIGUAL AddExpr
                         |DesigExpr MENORIGUAL AddExpr
                         |AddExpr
;

AddExpr:                 AddExpr MAIS MulExpr
                         |AddExpr MENOS MulExpr
                         |MulExpr
;

MulExpr:                 MulExpr MULT UnExpr
                         |MulExpr DIV UnExpr
                         |UnExpr
;

UnExpr:                  MENOS PrimExpr
                         |EXCLAMACAO PrimExpr
                         |PrimExpr
;

LValueExpr:              ID
;

PrimExpr:                ID ABRE_PAR ListExpr FECHA_PAR
                         |ID ABRE_PAR FECHA_PAR
                         |ID
                         |CARCONST
                         |INTCONST
                         |ABRE_PAR Expr FECHA_PAR
;

ListExpr:                Expr
                         |ListExpr VIRGULA Expr
;

AssignExpr:              OrExpr
                         |AddExpr
                         |MulExpr
                         |UnExpr
;
               
%% /*Epilogue*/
void yyerror(char const* msg){
printf("ERRO: %s %d\n", msg, yylineno); 
}
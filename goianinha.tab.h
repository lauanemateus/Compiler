/* A Bison parser, made by GNU Bison 3.8.2.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015, 2018-2021 Free Software Foundation,
   Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <https://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

/* DO NOT RELY ON FEATURES THAT ARE NOT DOCUMENTED in the manual,
   especially those whose name start with YY_ or yy_.  They are
   private implementation details that can be changed or removed.  */

#ifndef YY_YY_GOIANINHA_TAB_H_INCLUDED
# define YY_YY_GOIANINHA_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token kinds.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    YYEMPTY = -2,
    YYEOF = 0,                     /* "end of file"  */
    YYerror = 256,                 /* error  */
    YYUNDEF = 257,                 /* "invalid token"  */
    CAR = 258,                     /* CAR  */
    INT = 259,                     /* INT  */
    RETORNE = 260,                 /* RETORNE  */
    LEIA = 261,                    /* LEIA  */
    ESCREVA = 262,                 /* ESCREVA  */
    NOVALINHA = 263,               /* NOVALINHA  */
    SE = 264,                      /* SE  */
    ENTAO = 265,                   /* ENTAO  */
    SENAO = 266,                   /* SENAO  */
    ENQUANTO = 267,                /* ENQUANTO  */
    EXECUTE = 268,                 /* EXECUTE  */
    ID = 269,                      /* ID  */
    INTCONST = 270,                /* INTCONST  */
    CARCONST = 271,                /* CARCONST  */
    CONSTSTRING = 272,             /* CONSTSTRING  */
    MAIS = 273,                    /* MAIS  */
    MENOS = 274,                   /* MENOS  */
    MULT = 275,                    /* MULT  */
    DIV = 276,                     /* DIV  */
    IGUAL = 277,                   /* IGUAL  */
    IGUAL_COMPARACAO = 278,        /* IGUAL_COMPARACAO  */
    DIFERENTE = 279,               /* DIFERENTE  */
    MENOR = 280,                   /* MENOR  */
    MAIOR = 281,                   /* MAIOR  */
    MENORIGUAL = 282,              /* MENORIGUAL  */
    MAIORIGUAL = 283,              /* MAIORIGUAL  */
    E_LOGICO = 284,                /* E_LOGICO  */
    OU_LOGICO = 285,               /* OU_LOGICO  */
    EXCLAMACAO = 286,              /* EXCLAMACAO  */
    ABRE_PAR = 287,                /* ABRE_PAR  */
    FECHA_PAR = 288,               /* FECHA_PAR  */
    ABRE_CHAVE = 289,              /* ABRE_CHAVE  */
    FECHA_CHAVE = 290,             /* FECHA_CHAVE  */
    PONTO_VIRGULA = 291,           /* PONTO_VIRGULA  */
    VIRGULA = 292,                 /* VIRGULA  */
    PROGRAMA = 293                 /* PROGRAMA  */
  };
  typedef enum yytokentype yytoken_kind_t;
#endif

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef int YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;


int yyparse (void);


#endif /* !YY_YY_GOIANINHA_TAB_H_INCLUDED  */

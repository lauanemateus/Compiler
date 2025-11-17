#include <stdio.h>
#include <string.h>
#include <stdlib.h>

extern int yyparse();  // Analisador sintático (gerado pelo Bison)
extern FILE *yyin;     // Arquivo de entrada para o lexer

int main(int argc, char** argv){
    if(argc != 2){
        printf("Uso correto: programaPrincipal arquivo_de_teste\n");
        exit(1);
    }
    
    yyin = fopen(argv[1], "r");
    if(!yyin){
        printf("ERRO: Não foi possível abrir o arquivo %s\n", argv[1]);
        exit(1);
    }
    
    // Chama o analisador sintático
    // Se retornar 0, a análise foi bem-sucedida
    // Se retornar diferente de 0, houve erro sintático
    int resultado = yyparse();
    
    fclose(yyin);
    
    if(resultado == 0){
        printf("Análise sintática concluída com sucesso!\n");
    } else {
        printf("Erro(s) sintático(s) encontrado(s).\n");
    }
    
    return resultado;
}
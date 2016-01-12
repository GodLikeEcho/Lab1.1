%{
//**************************************
// lang.l
//
// Scanner definition file for CST 320 project
//
// Author: Phil Howard 
// phil.howard@oit.edu
//
// Date: Nov. 23, 2015
//

#include "tokens.h"

#define DO_RETURN(a) return (a)
//#define DO_RETURN(a) return Return(a)
int Return(int val);

%}

%option noyywrap
%option noinput
%option nounput
%option yylineno


    /* definitions go here. period is an example. */
leftparen       ['(']
rightparen      [')']
leftcurly       ['{']
rightcurly      ['}']
leftbracket     ['[']
rightbracket    ['\]']
semicolon       [';']
comma           [',']
period          ['.']
plus            ['+']
minus           ['\-']
star            ['*']
forwardslash    ['/']
modulus         ['%']
equals          ['=']

%%

    // token definitions go here. "if" is an example.
"if"                        DO_RETURN(IF);
"endif"                     DO_RETURN(ENDIF);
"else"                      DO_RETURN(ELSE);
"while"                     DO_RETURN(WHILE);
"print"                     DO_RETURN(PRINT);
"int"                       DO_RETURN(INT);
"float"                     DO_RETURN(FLOAT);
"char"                      DO_RETURN(CHAR);
"struct"                    DO_RETURN(STRUCT);
"return"                    DO_RETURN(RETURN);
[1-9][0-9]*                 DO_RETURN(INT_VAL);
[1-9][0-9]*\.[0-9]*[1-9]    DO_RETURN(FLOAT_VAL);
[a-zA-Z][a-zA-Z0-9]*        DO_RETURN(IDENTIFIER);
"=="                        DO_RETURN(EQUALS);
"&&"                        DO_RETURN(AND);
"||"                        DO_RETURN(OR);

{leftparen}                 DO_RETURN(yytext[0]);
{rightparen}                DO_RETURN(yytext[0]);
{leftcurly}                 DO_RETURN(yytext[0]);
{rightcurly}                DO_RETURN(yytext[0]);
{leftbracket}               DO_RETURN(yytext[0]);
{rightbracket}              DO_RETURN(yytext[0]);
{semicolon}                 DO_RETURN(yytext[0]);
{comma}                     DO_RETURN(yytext[0]);
{period}                    DO_RETURN(yytext[0]);
{plus}                      DO_RETURN(yytext[0]);
{minus}                     DO_RETURN(yytext[0]);
{star}                      DO_RETURN(yytext[0]);
{forwardslash}              DO_RETURN(yytext[0]);
{modulus}                   DO_RETURN(yytext[0]);
{equals}                    DO_RETURN(yytext[0]);
[ \t\r\n]                   {};
"//".*$                     {};
.                           DO_RETURN(JUNK_TOKEN);
%%

// This function allows us to do extra processing on each token
int Return(int val)
{
    printf("Scanned '%s': %d\n", yytext, val);
    return val;
}
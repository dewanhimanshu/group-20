#!/bin/bash
lex sql.l 
yacc sql.y -d
cc lex.yy.c y.tab.c -ll 
./a.out < input.txt 


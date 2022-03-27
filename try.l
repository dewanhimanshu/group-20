%{
    
%}
%%

[a-z]+[a-zA-Z0-9_]* {  prinf("Got");  }

%%
int main()
{
    yyin = fopen("input.txt","r");
    yylex();
    fclose(yyin);
    return 0;
}
int yywrap(){
    return -1;
}
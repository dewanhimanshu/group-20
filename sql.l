%{
    #include <stdio.h>
    #include "y.tab.h"
%}

digit [0-9]  

%%

[iI][nN][sS][eE][rR][tT] { return insert; }  // Pattern to generate token insert (case insensitive) 

[iI][nN][tT][oO] { return into; } // Pattern to generate token into (case insensitive) 

[vV][aA][lL][uU][eE][sS] { return values; } // Pattern to generate token values (case insensitive)

[nN][uU][lL][lL] {return null;} // Pattern to generate token null (case insensitive)

[a-zA-Z_]+[a-zA-Z0-9_]* { return id; } //  identifier token (Identifier begin with aphplabets and underscore followed by aplhanumeric)  

[a-zA-Z0-9_]+ { return literal; } // literal without quotes can be aplhanumeric + underscore when unquoted

\".*\"  { return literal; } // literal with  double quotes can contain anything  (Can contain single quotes in betwwen )

\'.*\'  { return literal; }  // literal with  single  quotes can contain anything (Can contain double quotes in betwwen )

{digit}+(\.{digit}+)?([Ee][+-]?{digit}+)?    { return number; } //Number with digits optionalFraction OptionalExponent 

\( {   return opening_bracket; } //Opening Bracket 

\) {   return closing_bracket; } //Closing Bracket 

, { return comma; } //Comma

.|[\n]   { return  *yytext;} //Others

%%

int yywrap(){
    return -1;
}

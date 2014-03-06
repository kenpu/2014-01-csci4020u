lexer grammar BooleanLexer;

WS: [ \t] -> skip;
NEWLINE : '\r'?'\n';

TRUE: 'true';
FALSE: 'false';
AND: '&';
OR: '|';
NOT: '~';
LPARENT: '(';
RPARENT: ')';
EQUAL: '=';
PRINT: 'print';

ID: CHAR (CHAR | DIGIT)*;
fragment CHAR: [_a-zA-Z];
fragment DIGIT: [0-9];

lexer grammar BooleanLexer; // Lexer part for Boolean grammar. 
                            // Remember to append the "Lexer" suffix to the grammar name.

WS: [ \t\r\n] -> skip;  // Skip white space, tabs and new line.

TRUE: 'true';
FALSE: 'false';
AND: '&';
OR: '|';
NOT: '~';
LPARENT: '(';
RPARENT: ')';

ID: CHAR (CHAR | DIGIT)*; // An ID should start with a character
fragment CHAR: [_a-zA-Z];
fragment DIGIT: [0-9];

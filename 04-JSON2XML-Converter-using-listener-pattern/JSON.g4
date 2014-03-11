grammar JSON;

// Lexer part
WS: [ \r\n\t] -> skip;

NUMBER : '-'? INT ('.' INT)? EXP?;
fragment INT: '0' | [1-9] [0-9]*;
fragment EXP: [Ee] [+-]? INT;

STRING : '"' (ESC| ~["\\])* '"' 
  { setText(getText().substring(1, getText().length() - 1));};
  
fragment ESC: '\\' (["\\/bfnrt]) | UNICODE;
fragment UNICODE: 'u' HEX HEX HEX HEX;
fragment HEX: [0-9a-fA-F];

TRUE : 'true' {setText("True");};
FALSE : 'false' { setText("False");};
NULL : 'null' { setText("");};

// Parser part
parse: object;

object: '{' member* '}';
member: pair (',' pair)*;
pair: STRING ':' value;
value
  : term
  | object
  | array
  ;

term
  : STRING
  | NUMBER
  | TRUE
  | FALSE
  | NULL
  ;

array: '[' elementList? ']';
elementList: element (',' element)*;
element: value;
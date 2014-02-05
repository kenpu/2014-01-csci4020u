grammar JSON; // As defined in www.json.org

// Lexer part
WS: [ \r\n\t] -> skip; // Skipping white space, tabs and new lines.

NUMBER : '-'? INT ('.' INT)? EXP?; 
fragment INT: '0' | [1-9] [0-9]*; // Avoiding leading zeros
fragment EXP: [Ee] [+-]? INT;

STRING: '"' (ESC| ~["\\])* '"';
fragment ESC: '\\' (["\\/bfnrt]) | UNICODE;
fragment UNICODE: 'u' HEX HEX HEX HEX;
fragment HEX: [0-9a-fA-F];

// Parser part
object: '{' member* '}';

member: pair (',' pair)*;

pair: STRING ':' value;

value
  : STRING
  | NUMBER
  | object
  | array
  | 'true'
  | 'false'
  | 'null'
  ;

array: '[' element* ']';

element: value (',' element)*;

grammar CSV;

// Lexer part
TEXT: ~[",\r\n]+; // Text is everything but a comma (field separator), end of line (row separator)
                  // and quotation mark (string delimitator).

STRING: '"' .*? '"'; // String. Anything inside quotation mark. 
                     // Featuring the non-gready behavior of the star operator

ENDL: '\r'? '\n';  // End of line with optional carrier return

// Parser part
file: header row+; // The first row is called header

header: row; // A header is also a row.

row: field (',' field)* ENDL; // A row is a list of comma-separated fields.

field: TEXT | STRING |; // A field is either TEXT, STRING or EMPTY

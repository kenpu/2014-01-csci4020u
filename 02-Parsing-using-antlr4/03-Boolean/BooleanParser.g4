// This is the version 1.0 to our Boolean grammar, it will be improved in the next class

parser grammar BooleanParser; // Parser part for the Boolean grammar
                              // Remember to append the "Parser" suffix to the grammar name.

options {tokenVocab=BooleanLexer;} // This way you can specify where to get the tokens from.

parse: boolExp*;  // Start rule for testing several boolean expresion at a time.

boolExp                      // Remember the order of precesence is importante here
  : LPARENT boolExp RPARENT
  | NOT boolExp
  | boolExp AND boolExp
  | boolExp OR boolExp
  | atom
  ;

atom 
  : TRUE
  | FALSE
  | ID
  ;

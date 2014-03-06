parser grammar BooleanParser;

options {tokenVocab=BooleanLexer;}

parse: expr+ EOF;

expr
  : boolExp NEWLINE            # boolExpr
  | ID EQUAL boolExp NEWLINE    # assignExpr
  | PRINT boolExp NEWLINE       # printExpr
  | NEWLINE                     # empty    // allow blanks lines
  ;

boolExp
  : LPARENT boolExp RPARENT     # parentExpr
  | NOT boolExp                 # notExpr
  | boolExp AND boolExp         # andExpr
  | boolExp OR boolExp          # orExpr
  | atom                        # value
  ;

atom 
  : TRUE                        # constantTrue
  | FALSE                       # constantFalse
  | ID                          # variable
  ;


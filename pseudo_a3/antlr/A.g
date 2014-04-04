grammar A;

@header {
    import java.io.*;
}

@members {
    public static void main(String[] args) throws Exception {
        ANTLRInputStream in = new ANTLRFileStream(args[0]); 
        ALexer lexer = new ALexer(in);
        CommonTokenStream tokens = new CommonTokenStream(lexer);
        AParser parser = new AParser(tokens);

        parser.prog();
    }
}

prog        : expr_list
            ;

expr_list   : expr
            | (expr ';')+ expr
            ;

expr        : NUM
            | ID
            | '(' 'set' ID expr ')'
            | '(' '+' expr expr ')'
            | '(' '*' expr expr ')'
            | '(' '^' expr_list ')'
            | loop
            ;

loop        : 'for' ID expr '->' expr body
            ;

body        : expr
            | '{' expr_list '}'
            ;

NUM         : [0-9]+
            ;

ID          : [a-zA-Z-_]+
            ;

WS          : [ \t\n]+ { skip(); }
            ;

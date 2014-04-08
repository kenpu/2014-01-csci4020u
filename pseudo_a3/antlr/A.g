grammar A;

@header {
    import java.io.*;
    import java.util.*;
}

@members {
    public StringBuffer program = new StringBuffer();
    public Map<String, Integer> sym = new HashMap<String, Integer>();

    public void appendFile(String filename) throws IOException {
        BufferedReader reader = new BufferedReader(new FileReader(filename));
        String line = reader.readLine();
        while(line != null) {
            program.append(line + "\n");
            line = reader.readLine();
        }
        reader.close();
    }

    public void I(String line) {
        this.program.append(line + "\n");
    }

    public void saveFile(String filename) throws IOException {
        PrintWriter out = new PrintWriter(new FileOutputStream(filename));
        out.println(this.program);
        out.close();
    }

    public int lookup(String varname) {
        int i = 0;
        if(sym.containsKey(varname)) {
            i = sym.get(varname);
        } else {
            i = sym.size();
            sym.put(varname, i);
        }

        return i+3;
    }

    public static void main(String[] args) throws Exception {
        ANTLRInputStream in = new ANTLRFileStream(args[0]); 
        ALexer lexer = new ALexer(in);
        CommonTokenStream tokens = new CommonTokenStream(lexer);
        AParser parser = new AParser(tokens);

        parser.appendFile("header.j");
        parser.prog();
        parser.appendFile("footer.j");

        parser.saveFile(args[0] + ".j");
    }

    public void expr_Num(String NUM) {
        I("ldc " + NUM);
    }
    public void expr_ID(String ID) {
        I("iload " + lookup(ID));
    }
    public void expr_set(String ID) {
        I("istore " + lookup(ID));
        I("iload " + lookup(ID));
    }
    public void expr_print(int length) {
        if(length > 3) {
            System.out.println("Hacked together... you caught me.");
            System.exit(0);
        }
        // save the top of the stack to print registers
        for(int i=0; i < length; i++) {
            I("istore " + i);
        }
        I("getstatic java/lang/System/out Ljava/io/PrintStream;");
        I("new java/lang/StringBuilder");
        I("dup");
        I("invokespecial java/lang/StringBuilder/<init>()V");
        for(int i=length-1; i >= 0; i--) {
            I("iload " + i);
            I("invokevirtual java/lang/StringBuilder/append(I)Ljava/lang/StringBuilder;");
            I("ldc \" \"");
            I("invokevirtual java/lang/StringBuilder/append(Ljava/lang/String;)Ljava/lang/StringBuilder;"); 
        }
        I("invokevirtual java/lang/StringBuilder/toString()Ljava/lang/String;");
        I("invokevirtual java/io/PrintStream/println(Ljava/lang/String;)V");
    }
}

prog        : expr_list
            ;

expr_list returns [int length]
            @init{ $length = 0; }
            : expr { $length = 1; }
            | (expr ';' {$length++;} )+ expr {$length++;}
            ;

expr        : NUM { expr_Num($NUM.text); }
            | id=ID  { expr_ID($id.text); }
            | '(' 'set' id=ID e=expr ')' { expr_set($id.text); }
            | '(' '+' expr expr ')'
            | '(' '*' expr expr ')'
            | '(' '^' el=expr_list ')' { expr_print($el.length); }
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


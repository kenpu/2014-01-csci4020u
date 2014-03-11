import org.antlr.v4.runtime.*;
import org.antlr.v4.runtime.tree.*;
import java.io.FileInputStream;
import java.io.InputStream;

public class ConvertJSON2XML{

  public static void main(String[] args) throws Exception{
    String inputFile = null;
    if ( args.length>0 ) inputFile = args[0];
    InputStream is = System.in;
    
    if ( inputFile!=null ) is = new FileInputStream(inputFile);

    ANTLRInputStream input = new ANTLRInputStream(is);
    JSONLexer lexer = new JSONLexer(input);
    CommonTokenStream tokens = new CommonTokenStream(lexer);
    JSONParser parser = new JSONParser(tokens);

    ParseTree tree = parser.parse(); // parse; start at prog
    
    ParseTreeWalker walker = new ParseTreeWalker(); // create standard walker
    JSONBaseListener listener = new ConvertJSON2XMLListener();
    walker.walk(listener, tree); // initiate walk of tree with listener
  }
}

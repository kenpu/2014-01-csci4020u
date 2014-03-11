import org.antlr.v4.runtime.*;

class ConvertJSON2XMLListener extends JSONBaseListener{
  int level = 0;
  
  @Override 
  public void enterParse(JSONParser.ParseContext ctx) {
    print("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
    print("<root>");
    level++;
  }

  @Override 
  public void exitParse(JSONParser.ParseContext ctx) {
    level--;
    print("</root>");
  }
  
  @Override
  public void enterPair(JSONParser.PairContext ctx) {   
    String id = ctx.STRING().getText();
    print("<"+id+">");
    level++;
  }
  
  @Override 
  public void exitPair(JSONParser.PairContext ctx) { 
    level--;
    String id = ctx.STRING().getText();
    print("</"+id+">");
  }
  
  @Override 
  public void enterTerm(JSONParser.TermContext ctx) { 
    print(ctx.getText());
  }
  
  @Override 
  public void enterElement(JSONParser.ElementContext ctx) { 
    print("<element>");
    level++;
  }

  @Override 
  public void exitElement(JSONParser.ElementContext ctx) {
    level--;
    print("</element>");
  }
  
  private void print(String s){
    for (int i = 0; i < level; i++) System.out.print("    ");
    System.out.println(s);
  }
}
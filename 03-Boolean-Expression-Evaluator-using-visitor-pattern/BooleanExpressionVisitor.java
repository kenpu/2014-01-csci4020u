import java.util.HashMap;
import java.util.Map;

public class BooleanExpressionVisitor extends BooleanParserBaseVisitor<Boolean> {
    /** "memory" for our evaluator; variable/value pairs go here */
    Map<String, Boolean> memory = new HashMap<String, Boolean>();

    /** boolExp DELIMITER */
    @Override
    public Boolean visitBoolExpr(BooleanParser.BoolExprContext ctx) {
      Boolean value = visit(ctx.boolExp());
      return value;
    }

    /** ID EQUAL boolExp DELIMITER*/
    @Override
    public Boolean visitAssignExpr(BooleanParser.AssignExprContext ctx) {
      String id = ctx.ID().getText();
      Boolean value = visit(ctx.boolExp());
      memory.put(id, value);
      return value;
    }

    /** PRINT boolExp DELIMITER */
    @Override
    public Boolean visitPrintExpr(BooleanParser.PrintExprContext ctx) {
      Boolean value = visit(ctx.boolExp());
      System.out.println(value);      // print the result
      return value;
    }

    /** LPARENT boolExp RPARENT*/
    @Override
      public Boolean visitParentExpr(BooleanParser.ParentExprContext ctx){
      return visit(ctx.boolExp());
    }

    /** NOT boolExp */
    @Override
    public Boolean visitNotExpr(BooleanParser.NotExprContext ctx){
      return !visit(ctx.boolExp());
    }

    /** boolExp AND boolExp */
    @Override
    public Boolean visitAndExpr(BooleanParser.AndExprContext ctx){
      Boolean left = visit(ctx.boolExp(0)); // get value of left subexpression
      Boolean right = visit(ctx.boolExp(1)); // get value of right subexpression
      return left && right;
    }

    /** boolExp OR boolExp */
    @Override
    public Boolean visitOrExpr(BooleanParser.OrExprContext ctx){
      Boolean left = visit(ctx.boolExp(0)); // get value of left subexpression
      Boolean right = visit(ctx.boolExp(1)); // get value of right subexpression
      return left || right;
    }

    /** atom */
    @Override
    public Boolean visitValue(BooleanParser.ValueContext ctx){
      return visit(ctx.atom());
    }

    /** TRUE */
    @Override
    public Boolean visitConstantTrue(BooleanParser.ConstantTrueContext ctx){
      return true;
    }

    /** FALSE */
    @Override
    public Boolean visitConstantFalse(BooleanParser.ConstantFalseContext ctx){
      return false;
    }

    /** ID */
    @Override
      public Boolean visitVariable(BooleanParser.VariableContext ctx){
      String id = ctx.ID().getText();
      if ( memory.containsKey(id) ) return memory.get(id);

      throw new RuntimeException("Unknown variable: "+id );
    }

}

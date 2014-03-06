BINARY = BooleanExpressionEvaluator
TEST_FILE = test.txt

JAR_FILE = ../antlr-4.1-complete.jar 
ANTLR4 = java -cp $(JAR_FILE) org.antlr.v4.Tool
ANTLR4_ARGS= -visitor -no-listener

all:
	$(ANTLR4) $(ANTLR4_ARGS) *.g4
	javac -cp .:$(JAR_FILE) *.java

test:
	java -cp .:$(JAR_FILE) $(BINARY) $(TEST_FILE)

clean:
	rm -f *.class BooleanLexer*.java BooleanParser*.java *.tokens


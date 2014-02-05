GRAMMAR = JSON
START_RULE = object
TEST_FILE = test.json

JAR_FILE = ../../antlr-4.1-complete.jar 
ANTLR4 = java -cp $(JAR_FILE) org.antlr.v4.Tool
GRUN  = java -cp .:$(JAR_FILE) org.antlr.v4.runtime.misc.TestRig
GRUN_OPTIONS = -tokens -gui

all:
	$(ANTLR4) *.g4
	javac -cp .:$(JAR_FILE) *.java

test:
	$(GRUN) $(GRAMMAR) $(START_RULE) $(GRUN_OPTIONS) < $(TEST_FILE)

clean:
	rm -f *.class *.java *.tokens


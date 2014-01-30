ANTLR = java -jar ../antlr-4.1-complete.jar
GRUN  = java org.antlr.v4.runtime.misc.TestRig

all:
	$(ANTLR) *.g
	javac *.java

test:
	$(GRUN) HelloGrammarRules start -tokens < test.txt

clean:
	rm -f *.class *.java *.tokens


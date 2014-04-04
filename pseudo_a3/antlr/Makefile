ANTLR = ../../antlr-4.1-complete.jar

grammar:
	java -jar $(ANTLR) *.g

class:
	javac -cp $(ANTLR):. *.java

run:
	java -cp $(ANTLR):. AParser test1.src

all: grammar class run
	
clean:
	rm -f ABaseListener.java ALexer* AListener* AParser* A.tokens *.class

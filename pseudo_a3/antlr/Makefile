ANTLR = ../../antlr-4.1-complete.jar

grammar:
	java -jar $(ANTLR) *.g

class:
	javac -cp $(ANTLR):. *.java

run:
	rm -f test1.src.j HelloWorld.*
	java -cp $(ANTLR):. AParser test1.src
	java -jar ../../jasmin.jar test1.src.j
	java HelloWorld

all: grammar class run
	
clean:
	rm -f ABaseListener.java ALexer* AListener* AParser* A.tokens *.class

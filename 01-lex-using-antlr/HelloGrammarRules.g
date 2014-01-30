grammar HelloGrammarRules;

start: Name;	// just a dummy start rule for now.

Name:		[a-zA-Z]+;
Variable:	[a-zA-Z0-9]+;
Number:		[0-9]+;
NL:		'\r'? '\n';
WS:		[ \t]+ -> skip;


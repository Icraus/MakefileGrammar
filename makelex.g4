lexer grammar makelex;
COMMENT: '#' ~('\r' | '\n')* '\r'? '\n' -> skip;

WS: [ \r\n] -> skip;
INCLUDE: 'include';
DASH: '-';
DEFINE: 'define';
ENDEF: 'endef';
EQUAL: '=';
TARGETSEP: ':';

VARSEP: ':=';

PLUSEQUAL: '+=';
ELEQUAL: '?=';
ENDIF: 'endif';
ELSE: 'else';
IF: 'ifeq';
IFNEQ: 'ifneq';
IFDEF: 'ifdef';
LBRACE: '(';
RBRACE: ')';
PIPE: '|';
VARTOKEN: '$';
COMMA: ',';
STRING: '"' ~('"')* '"';
ID: ('_' | '.' | '*' | [0-9] | [a-zA-Z])+;
BODYLNSTART: '\t' ~('\t'| '\r' | '\n')+;

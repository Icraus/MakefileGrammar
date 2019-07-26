lexer grammar makelex;
COMMENT: '#' ~('\r' | '\n')* '\r'? '\n' -> skip;

WS: [ \r\n] -> skip;
INCLUDE: 'include';
DASH: '-';
DEFINE: 'define';
ENDEF: 'endef';
EQUAL: '=';
TARGETSEP: ':';

VARSEP: ':''=';

PLUSEQUAL: '+' '=';
ENDIF: 'endif';
ELSE: 'else';
IF: 'ifeq';
IFNEQ: 'ifneq';
IFDEF: 'ifdef';
LBRACE: '(';
RBRACE: ')';
VARTOKEN: '$';
COMMA: ',';
ID: ('_' | [a-zA-Z])+;
BODYLNSTART: '\t' ~('\t'| '\r' | '\n')+;

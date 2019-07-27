lexer grammar makelex;
COMMENT: '#' ~('\r' | '\n')* '\r'? '\n' -> skip;

WS: [ \r\n] -> skip;
INCLUDE: 'include';
DASH: '-';
DEFINE: 'define';
ENDEF: 'endef';
EQUAL: '=';
TARGETSEP: ':' ':'?;

VARSEP: ':' ':'? '=';
VARNOT: '!=';

PLUSEQUAL: '+=';
ELEQUAL: '?=';
EXPORT: 'export';
UNEXPORT: 'unexport';
VPATH: 'vpath';
OVERRIDE: 'override';
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
SSTRING: '\'' ~('\'')* '\'';
ID: ('_' | [\\/] | '-' | '.' | '*' | '%' | [0-9] | [a-zA-Z])+;

BODYLNSTART: '\t' ~('\t'| '\r' | '\n')+;

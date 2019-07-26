grammar make;
options { tokenVocab=makelex; }

makeFile : (nonblocks)* EOF;

nonblocks : includeDirective | varDeclare | target | ifdefblock| defineBlock | ifblock;
includeDirective : DASH ? INCLUDE name+ ;

varDeclare: name PLUSEQUAL (name | qstring)+
		  | name (EQUAL | VARSEP | ELEQUAL) (name | qstring);

target: name+ TARGETSEP (prequesite)? (PIPE orderPrequesites)? makeRule ;
prequesite: name+;
orderPrequesites : name+;
defineBlock: DEFINE name makeRule ENDEF;
ifblock : ifimpl  elseimpl? ENDIF;
ifimpl : (IF | IFNEQ)  condition (nonblocks)* ;
condition : LBRACE name COMMA name? RBRACE;
elseimpl: ELSE nonblocks;
ifdefblock : IFDEF name nonblocks ENDEF;
name: VARTOKEN  LBRACE  ID RBRACE | ID; //deal with names, files, strings later
qstring : STRING;
makeRule: BODYLNSTART+;

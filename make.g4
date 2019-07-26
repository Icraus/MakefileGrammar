grammar make;
options { tokenVocab=makelex; }

makeFile : (nonblocks)* EOF;

nonblocks : includeDirective | varDeclare | target | ifdefblock| defineBlock | ifblock;
includeDirective : DASH ? INCLUDE name+ ;
varDeclare: name (EQUAL | PLUSEQUAL | VARSEP) ID+;

target: name TARGETSEP prequesite makeRule ;
prequesite: name+;

defineBlock: DEFINE name makeRule ENDEF;
ifblock : ifimpl  elseimpl? ENDIF;
ifimpl : (IF | IFNEQ)  condition (nonblocks)* ;
condition : LBRACE name COMMA name? RBRACE;
elseimpl: ELSE nonblocks;
ifdefblock : IFDEF name nonblocks ENDEF;
name: VARTOKEN ? LBRACE ? ID RBRACE?; //deal with names, files, strings later

makeRule: BODYLNSTART+;

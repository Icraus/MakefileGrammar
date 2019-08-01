grammar make;
options { tokenVocab=makelex; }

makeFile : (nonblocks)* EOF;

nonblocks : directives | varDeclare | target | ifdefblock| defineBlock | ifblock | nl;
directives: export | unexport | includeDirective | vpath | overrideD ;
nl : (NL TAB*)+;
includeDirective : DASH ? INCLUDE name+ ;
export: EXPORT (name | varDeclare?);
unexport : UNEXPORT name;
vpath: VPATH name+;
overrideD: OVERRIDE (name | varDeclare?);

varDeclare: ID (PLUSEQUAL | EQUAL | VARSEP | ELEQUAL | VARNOT) (raw_string | qstring)+;

target: name+ TARGETSEP (prequesite)? (PIPE orderPrequesites)? NL  makeRule? ;

prequesite: name+;
orderPrequesites : name+;
defineBlock: DEFINE name NL makeRule ENDEF;

ifblock : ifimpl elseIfImpl* elseimpl? ENDIF;

ifimpl : (IF | IFNEQ)  condition  (nonblocks)* ;

elseIfImpl: ELSE ifimpl;

condition : LBRACE name COMMA raw_string? RBRACE
			| qstring qstring
			| sqstring sqstring;

elseimpl: ELSE nonblocks*;
ifdefblock : (IFDEF|IFNDEF) name nonblocks* (ENDEF | ENDIF);
name:  VARTOKEN LBRACE ID raw_string* (COMMA raw_string)* RBRACE
	| VARTOKEN ID
	 | ID ; //deal with names, files, strings later
qstring : STRING;
sqstring : SSTRING;
raw_string : ( name | EQUAL | TARGETSEP | VARTOKEN | PLUS| DASH | COMMA)+ ;
makeRule: ((TAB | SEMICOL)+ raw_string NL)+ | NL+;
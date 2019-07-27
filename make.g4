grammar make;
options { tokenVocab=makelex; }

makeFile : (nonblocks)* EOF;

nonblocks : directives | varDeclare | target | ifdefblock| defineBlock | ifblock;
directives: export | unexport | includeDirective | vpath ;

includeDirective : DASH ? INCLUDE name+ ;
export: EXPORT (name | varDeclare?);
unexport : UNEXPORT name;
vpath: VPATH name+;

varDeclare: name PLUSEQUAL (name | qstring)+
		  | name (EQUAL | VARSEP | ELEQUAL | VARNOT) (name | qstring);

target: name+ TARGETSEP (prequesite)? (PIPE orderPrequesites)? makeRule ;

prequesite: name+;
orderPrequesites : name+;
defineBlock: DEFINE name makeRule ENDEF;
ifblock : ifimpl  elseimpl? ENDIF;
ifimpl : (IF | IFNEQ)  condition (nonblocks)* ;
condition : LBRACE name COMMA name? RBRACE;
elseimpl: ELSE nonblocks;
ifdefblock : IFDEF name nonblocks ENDEF;
name: VARTOKEN+  LBRACE  ID (COMMA name)* RBRACE | ID (SLASHES name)*; //deal with names, files, strings later
qstring : STRING;
makeRule: BODYLNSTART+;

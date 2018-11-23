%{
#include <string.h>
#include "label.h"
#include "error_handler.h"
#include "compiler.tab.h"	//tokens
%}
%x comment_block
%%

"(*"									BEGIN(comment_block);	
<comment_block>"*"*[^("*/")]*						/* ignore */
<comment_block>"*"+")"							BEGIN(INITIAL);

[0-9]+	{ yylval.intval = atoi(yytext);
			return(NUMBER);		}
IN	{ return(_IN);		}

DECLARE	{ return(DECLARE);			}
PLUS	{ return(PLUS);			}
MINUS	{ return(MINUS);			}
DIV	{ return(DIV);			}
MOD	{ return(MOD);			}
TIMES	{ return(TIMES);			}
EQ	{ return(EQ);		}
DIFF	{ return(DIFF);		}
LE	{ return(LE);		}
GE	{ return(GE);		}
LEQ	{ return(LEQ);		}
GEQ	{ return(GEQ);		}
ASSIGN	{ return(ASSGNOP);		}
IF		{ return(IF);			}
THEN	{ return(THEN);			}
ENDWHILE		{ return(ENDWHILE);			}
END\nEND { yyerror("\"END\" error");}

END		{ return(END);			}
ENDIF		{ return(ENDIF);			}
ELSE	{ return(ELSE);			}
WHILE	{ return(WHILE);		}
DO		{ return(DO);			}
GET	{ return(GET);			}
PUT	{ return(PUT);		}

[_a-z]+	{ yylval.id = (char*) strdup(yytext);
			return(IDENTIFIER);	}

[ \t]+
\n		{ lines++;				}
.		{ return(yytext[0]);	}
%%
int yywrap(void){}

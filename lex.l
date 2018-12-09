digit [0-9]
identifier [_a-zA-Z][_a-zA-Z0-9]*
keywords auto|break|case|char|const|continue|default|do|double|else|enum|extern|float|for|goto|if|int|long|register|return|short|signed|sizeof|static|struct|switch|typedef|union|unsigned|void|volatile|while
operator [+|-|/|*|=|%|&|?]
relational "=="|">"|">="|"<"|"<="|"||"|"&&"
formatspec ["%d"|"%s"|"%c"|"%f"|"%e"]
symbols "["|"]"|"("|")"|"#"|"'"|"."|"\""|"\\"|";"|","


%%
"{" {printf ("%s block begins\n", yytext);} 
"}" {printf ("%s block ends\n", yytext);} 
"/*"([^*]|\*+[^*/])*\*+"/"	 {printf ("%s is a comment\n", yytext);}
"//"(.*)"" {printf ("%s is a comment\n", yytext);}
#.* {printf("%s is a preprocessor directive\n",yytext);}
{identifier}\(.* {printf ("%s is function\n", yytext);} 
{keywords} {printf ("%s is a keyword\n", yytext);}
{relational} {printf ("%s is a relational operator\n", yytext);} 
{operator}+ {printf ("%s is an operator\n", yytext);}
{symbols} {printf ("%s is a special symbol\n", yytext);}
{formatspec} {printf ("%s is a format specifier\n", yytext);}
{digit}+ {printf("%s is a digit\n", yytext);}
{identifier} {printf("%s is an identifier\n", yytext);}
[ \t\n] ;
%%
int yywrap()  
{  
 	return 1;  
}  
int main(int argc, char *argv[])
{
	FILE *file;
	file=fopen(argv[1],"r");
	if(!file)
	{
	printf("could not open the file");
	exit(0);
	}
	yyin=file;
	yylex();
	printf("\n");
	return(0);
}

#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <ctype.h>

void E();
void E_();
void T();
void T_();
void F();
int i; int error; 
char str[10];

void main()
{
	
	i = 0;
	error = 0;
	printf("Enter arithmetic expression:");
	scanf("%s",str);
	E();
	if(strlen(str) == i && error == 0)
		printf("\nParsing successful\n");
	else
		printf("\nError\n");
}

void E()
{
	T();
	E_();
}

void E_()
{
	if (str[i]=='+')
	{
		i++;
		T();
		E_();
	}
}

void T()
{
	F();
	T_();
}

void T_()
{
	if(str[i]=='*')
	{
		i++;
		F();
		T_();
	}
}

void F()
{
	if (isalnum(str[i]))
		i++;
	else if (str[i]=='(')
	{
		i++;
		E();
		if (str[i]==')')
			i++;
		else
			error = 1;
	}
	else
		error = 1;
}

#include<stdio.h>
#include<string.h>

char * mystrupr(char *pStr);
int main()
{
	char str[20];

	printf("\n\nEnter The String:\t");
	gets(str);

	mystrupr(str);

	printf("\nString In Upper Case Is:\t");
	puts(str);

	return 0;
}

char * mystrupr(char *pStr)
{
	char * pTemp = pStr;	//to store base address

	while((*pStr)!='\0')
	{	
		if((*pStr)>='a' && (*pStr)<='z')	//a to z
			*pStr = (*pStr)-32;
		
		pStr++;
	}
	
	return pTemp;	//return base address which points to updated string
}
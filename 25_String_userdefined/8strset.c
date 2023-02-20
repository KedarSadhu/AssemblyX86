#include<stdio.h>
#include<string.h>

char * mystrset(char *pStr,int val);
int main()
{
	char str[20],ch;
	
	printf("\n\nEnter The String:\t");
	gets(str);
	
	printf("\n\nEnter The Character To Set:\t");
	scanf("%c",&ch);
	
	printf("mystrset :: %s",mystrset(str,ch));
	
	printf("\n\nNow String Is:\t");
	puts(str);
	
	return 0;
}

char * mystrset(char *pStr,int val)
{
	char * pTemp = pStr;	//to store base address
	
	while((*pStr)!= '\0')
	{
		*pStr = (char)val;
		pStr++;
	}

	return pTemp;	//return base address which points to updated string
}

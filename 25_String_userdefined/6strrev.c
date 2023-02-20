#include<stdio.h>
#include<string.h>

char * mystrrev(char * pStr);

int main()
{
	char string[20];
	printf("\n\nEnter The String:\t");
	gets(string);

	mystrrev(string);

	printf("\n\nReverse String Is:\t");
	puts(string);

	return 0;
}

char * mystrrev(char * pStr)
{
	char ch;
	char *pBase= pStr;
	char *pTemp = pStr;

	while((*pTemp)!= '\0')
	{
		pTemp++;
	}
	
	pTemp--;

	while(pStr<=pTemp)
	{
		ch = *pStr;
		*pStr = *pTemp;
		*pTemp = ch;

		pStr++;
		pTemp--;
	}

	return pBase;

}
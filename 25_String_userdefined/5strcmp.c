#include<stdio.h>
#include<string.h>

int mystrcmp(const char *pStr1,const char *pStr2);

int main()
{
	char string1[20],string2[20];
	int ch;

	printf("\n\nEnter String1:\t");
	gets(string1);

	printf("\n\nEnter String2:\t");
	gets(string2);

	ch=mystrcmp(string1,string2);

	if(ch==0)
		printf("\n\nBoth Strings Are Same\n");

	else
		printf("\n\nBoth Strings Are Diffrent\n");
	
	return 0;
}

int mystrcmp(const char *pStr1,const char *pStr2)
{
	//if(strlen(pStr1)!=strlen(pStr2))
	//	return -1;

	while((*pStr1)!= '\0' || (*pStr2)!= '\0' )
	{
		if((*pStr1) != (*pStr2))
			break;

		pStr1++;
		pStr2++;
	}
	
	return ((*pStr1) - (*pStr2));
}
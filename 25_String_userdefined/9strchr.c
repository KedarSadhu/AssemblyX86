#include<stdio.h>
#include<string.h>

char * mystrchr(const char *pStr, int c);

int main()
{
	char str[20],ch;
	char *ptr;

	printf("\n\nEnter The String:\t");
	gets(str);

	printf("\n\nEnter Character To Be Found:\t");
	scanf("%c",&ch);

	ptr=mystrchr(str,ch);

	if(ptr==NULL)
		printf("\n\nCharacter Is Not Found\n");
	else
		printf("\n\nCharacter Is Found At %d Location\n",(ptr-str)+1);
	
	return 0;
}

char * mystrchr(const char *pStr, int c)
{
	while((*pStr) != '\0')
	{
		if ((*pStr) == (char)c)
			return pStr;

		pStr++;
	}

	return NULL;
}

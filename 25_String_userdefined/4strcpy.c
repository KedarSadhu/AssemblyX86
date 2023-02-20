#include<stdio.h>
#include<string.h>

char * mystrcpy(char *pDest,const char * pSrc);

int main()
{
	char source[20];
	char destination[20];

	printf("\n\nEnter Source String:\t");
	gets(source);

	printf("\n\nSource String Is:\t");
	puts(source);

	mystrcpy(destination,source);

	printf("\n\nDestination String Is:\t");
	puts(destination);

	return 0;
}

char * mystrcpy(char *pDest,const char * pSrc)
{
	int iCounter = 0;

	while(pSrc[iCounter]!= '\0')
	{
		pDest[iCounter] = pSrc[iCounter];
		iCounter++;
	}
	pDest[iCounter] = '\0';
	return pDest;
}
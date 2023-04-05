#include<stdio.h>

int main()
{
	FILE *fp = NULL;

	char chChar;

	fp = fopen("print_charecters.txt","r");

	if(NULL == fp)
	{
		printf("\nCant Open File \n");
		return -1;
	}

	while(1)
	{
	  if((chChar = fgetc(fp)) == EOF)
	  	break;
	  else
	    printf("%c",chChar);
	}

	fclose(fp);
	fp = NULL;

	exit(0);
}
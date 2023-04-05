#include<stdio.h>
int main()
{
	FILE *fpSource = NULL,
	FILE *fpDestination = NULL;

	char chChar;

	fpSource = fopen(argv[1],"r");
	if(NULL == fpSource)
	{
		printf("\nCant Open Source File\n");
		return -1;
	}

	fpDestination = fopen(argv[2],"w");
	if(NULL == fpDestination)
	{
		printf("\nCant Open destination File\n");
		fclose(fpSource);
		fpSource = NULL;
		return -1;
	}

	while(1)
	{
		chChar = fgetc(fpSource);
		if(chChar == EOF)
		break;
		fputc(chChar,fpDestination);
	}

	fclose(fpSource);

	fpSource = NULL;
	
	fclose(fpDestination);
	
	fpDestination = NULL;
	
	printf("\nCopied Successfully\n");
	
	return 0;
}
#include<stdio.h>
#include<string.h>

int main()
{
	FILE *fp = NULL;
	char szText[50];
	int val = 0;
	fp = fopen("keyboard_to_file.txt","w");
	if(NULL == fp)
	{
		printf("\nCant Open File\n");
		return -1;
	}

	printf("\nEnter strings:\n");

	while((val = strlen(gets(szText))) > 0)//'\n' ala tr 
	{
		printf("here :: %d\n",val);
		fputs(szText,fp);
		fputs("\n",fp);
	}

	fclose(fp);
	fp = NULL;
	return 0;
}
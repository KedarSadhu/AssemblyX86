#include<stdio.h>
int main()
{
	FILE *fp = NULL;
	char szText[50];

	fp = fopen("keyboard_to_file.txt","r");
	if(NULL == fp)
	{
		printf("\nCant Open File\n");
		return -1;
	}

	while(fgets(szText,49,fp) != NULL)
		printf("%s",szText);
	
	fclose(fp);
	fp = NULL;
	
	return 0;
}
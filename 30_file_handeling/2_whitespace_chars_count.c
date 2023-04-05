#include<stdio.h>
#include<stdlib.h>

int main()
{
	FILE *fp = NULL;

	int iNoOfChars = 0;
	int iNoOfSpaces = 0;
	int iNoOfTabs = 0;
	int iNoOfLines = 0;

	char chChar;

	fp = fopen("chars_space_tabs_nl_count.txt","r");

	if(NULL == fp)
	{
		printf("\nCant Open File \n");
		return -1;
	}

	while(1)
	{
	  if((chChar = fgetc(fp)) == EOF)
	  	break;
 
 	  iNoOfChars++;

	  if(chChar == ' ')
	  	iNoOfSpaces++;

	  else if(chChar == '\t')
	  	iNoOfTabs++;

	  if(chChar == '\n')
	  	iNoOfLines++;
	}

	fclose(fp);
	fp = NULL;

	printf("\n No of charecters are :\t%d\n",iNoOfChars);
	printf("\n No of spaces are :\t%d\n",iNoOfSpaces);
	printf("\n No of tabs are :\t%d\n",iNoOfTabs);
	printf("\n No of lines are :\t%d\n",iNoOfLines);

	exit(0);


}
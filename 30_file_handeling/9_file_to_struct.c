#include<stdio.h>

int main()
{
	FILE *fp = NULL;
	struct student
	{
		char szName[40];
		int iRollNo;
		float fPerc;
	};

	struct student s;

	fp = fopen("file_to_struct.txt","r");
	if(NULL == fp)
	{
		printf("\nCant Open File\n");
		return -1;
	}

	while(fscanf(fp,"%s %d %f",s.szName,&s.iRollNo,&s.fPerc) != EOF)
	//while(fread(&s,sizeof(s),1,fp)==1) when structure changes
		printf("%s %d %f\n",s.szName,s.iRollNo,s.fPerc);
	
	fclose(fp);
	fp = NULL;
	
	return 0;
}
#include<stdio.h>

int main()
{
	FILE *fp = NULL;
	char chChar = 'Y';
	
	struct student
	{
		char szName[40];
		int iRollNo;
		float fPerc;
	};
	struct student s;
	
	printf("Sizeof :: %d \n ",sizeof(s));
	char chTemp;
	
	fp = fopen("student_structure_from_keyboard_to_file.txt","w");
	if(NULL == fp)
	{
		printf("\nCant Open File\n");
		return -1;
	}
	
	while(chChar == 'Y' || chChar == 'y')
	{
		printf("\n\nEnter name,roll no. and percentage:\n");
		scanf("%s %d %f",s.szName,&s.iRollNo,&s.fPerc);
		fprintf(fp,"%s %d %f\n",s.szName,s.iRollNo,s.fPerc); //fwrite(&s,sizeof(s),1,fp);
		printf("\nAdd another record (Y/N)");
		scanf("%c%c", &chTemp, &chChar);
	}

	fclose(fp);
	fp = NULL;
	return 0;
}
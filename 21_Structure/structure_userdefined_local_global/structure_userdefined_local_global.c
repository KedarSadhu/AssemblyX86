#include<stdio.h>
#include<stdlib.h>

struct demo
{
	char chChar;
	int iNo;
	short int shiNo;
}obj1;

int main()
{
	struct demo obj2;
	char t;
	
	printf("Enter obj1 values, \n");
	
	printf("Enter chChar\t:");
	scanf("%c", &obj1.chChar);
	
	printf("Enter iNo\t:");
	scanf("%d", &obj1.iNo);
	
	printf("Enter shiNo\t:");
	scanf("%hd", &obj1.shiNo);
	
	printf("Enter obj2 values,\n"); 
	
	printf("Enter chChar\t:");
	scanf("%c%c", &t, &obj2.chChar); 
	
	printf("Enter iNo\t:");
	scanf("%c%d", &t, &obj2.iNo); 

	printf("Enter shiNo\t:");
	scanf("%c%hd", &t, &obj2.shiNo);
	
	printf("obj1 is\n");
	printf("chChar=%c, iNo = %d, shiNo=%hd\n\n", obj1.chChar, obj1.iNo, obj1.shiNo);
	
	printf("obj2 is\n"); 
	printf("chChar=%c, iNo = %d, shiNo = %hd\n", obj2.chChar, obj2.iNo, obj2.shiNo);
	
	exit(0);
}
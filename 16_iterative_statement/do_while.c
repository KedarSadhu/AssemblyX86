#include<stdio.h>
#include<stdlib.h>

int main(void)
{
	int iNo;
	int iCounter 0;

	printf("Enter number : \t");
	scanf("%d",&iNo);

	do
	{
		printf("%d\n",&iCounter );
		iCounter++;
	}while(iCounter<iNo);

	exit(0);
}
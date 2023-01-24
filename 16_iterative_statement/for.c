#include<stdio.h>
#include<stdlib.h>

int main(void)
{
	int iNo;
	int iCounter;

	printf("Enter number : \t");
	scanf("%d",&iNo);

	for(iCounter = 0;iCounter < iNo; iCounter++)
	{
		printf("%d\n",&iCounter );
	}

	exit(0);
}
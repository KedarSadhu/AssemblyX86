#include<stdio.h>
#include<stdlib.h>

int main(void)
{
	int iNo;

	printf("Enter number : ");
	scanf("%d",&iNo)

	if(iNo < 2)
	{
		printf("\nNumber is less than 2\n");
	}
	else if(iNo > 2)
	{
		printf("\nNumber is greater than 2\n");	
	}
	else
	{
		printf("\nNumber is equal to 2\n");
	}

	exit(0);
}
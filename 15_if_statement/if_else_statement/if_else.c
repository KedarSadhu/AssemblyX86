#include<stdio.h>
#include<stdlib.h>

int main(void)
{
	int iNo;

	printf("Enter number : ");
	scanf("%d",&iNo)

	if(iNo % 2 == 0)
	{
		printf("\nNumber is even\n");
	}
	else
	{
		printf("\nNumber is odd\n");	
	}

	exit(0);
}
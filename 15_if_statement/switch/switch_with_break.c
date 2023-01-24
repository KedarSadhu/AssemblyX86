#include<stdio.h>
#include<stdlib.h>

int main(void)
{
	int choice;

	printf("1.Addition\n2.subtraction\n3.Multiplication\n4.Division\n");

	printf("Enter choice : ");
	scanf("%d",&choice);

	switch(choice)
	{
		case 1:
			printf("Addition\n");
			break;

		case 2:
			printf("Subtraction\n");
			break;

		case 3:
			printf("Multiplication\n");	
			break;

		case 4:
			printf("Division\n");
			break;
		
		default: 
			printf("Invalid choice\n");
	}

	exit(0);
}
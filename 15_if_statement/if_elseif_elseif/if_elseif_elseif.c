#include<stdio.h>
#include<stdlib.h>

int main(void)
{
	int choice;

	printf("1.Addition\n2.subtraction\n3.Multiplication\n4.Division\n");

	printf("Enter choice : ");
	scanf("%d",&choice);

	if(choice == 1)
		printf("Addition\n");

	else if(choice == 2)
		printf("Subtraction\n");

	else if(choice == 3)
		printf("Multiplication\n");	

	else if(choice == 4)
		printf("Division\n");
	
	else 
		printf("Invalid choice\n");

	exit(0);
}
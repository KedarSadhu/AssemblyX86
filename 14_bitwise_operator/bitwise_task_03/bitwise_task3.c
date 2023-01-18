#include<stdio.h>
#include<stdlib.h>

#define GREATOR_THAN_BIT 				1
#define GREATOR_THAN_OR_EQUAL_TO_BIT 	2
#define LESS_THAN_BIT 					4
#define LESS_THAN_OR_EQUAL_TO_BIT 		8
#define NOT_EQUAL_BIT					16

void compare(int,int,char *);

int main(void)
{
	int iNo1;
	int iNo2;
	char op = op ^ op;

	printf("Enter two number : ");
	scanf("%d%d",&iNo1,&iNo2);

	compare(iNo1,iNo2,&op);

	printf("\n************\n");

	if((op & GREATOR_THAN_BIT) == GREATOR_THAN_BIT)
	{	
		printf("%d is greater than %d\n",iNo1,iNo2);
		printf("%d is greater than or equal to %d\n",iNo1,iNo2);
		printf("%d is not equal to %d\n",iNo1,iNo2);		
	}
	else if((op & LESS_THAN_BIT) == LESS_THAN_BIT)
	{
		printf("%d is less than %d\n",iNo1,iNo2);
		printf("%d is less than or equal to %d\n",iNo1,iNo2);
		printf("%d is not equal to %d\n",iNo1,iNo2);
	}
	else
	{
		printf("%d is less than or equal to %d\n",iNo1,iNo2);
		printf("%d is greater than or equal to %d\n",iNo1,iNo2);
	}

	printf("\n************\n");

	exit(0);
}

void compare(int iNo1,int iNo2,char *op)
{
	
	if(iNo1 > iNo2)  // mhnjech no1>=no2 -->1 ,no1!=no2 --> 1 
	{
		(*op) = (*op) | GREATOR_THAN_BIT ;
		(*op) = (*op) | GREATOR_THAN_OR_EQUAL_TO_BIT ;
		(*op) = (*op) | NOT_EQUAL_BIT ;
	}

	else if(iNo1 < iNo2)
	{
		(*op) = (*op) | LESS_THAN_BIT ;
		(*op) = (*op) | LESS_THAN_OR_EQUAL_TO_BIT ;
		(*op) = (*op) | NOT_EQUAL_BIT ;
	}

	else
	{
		(*op) = (*op) | LESS_THAN_OR_EQUAL_TO_BIT ;
		(*op) = (*op) | GREATOR_THAN_OR_EQUAL_TO_BIT ;
	}
	
}
#include<stdio.h>
#include<stdlib.h>

int Addition(int,int);
int Subtraction(int,int);
int Multiplication(int,int);
int Division(int,int);

int main(void)
{
	int iNo1;
	int iNo2;
	int iAns;
	int iCh;

	do
	{
		printf("\n1.Addition\n2.Subtraction\n3.Multiplication\n4.Division\n5.Exit\n");

		printf("Enter your choice :");
		scanf("%d",&iCh);

		if(iCh>0 && iCh<5)
		{
			printf("Enter two numbers :");
			scanf("%d%d",&iNo1,&iNo2);
		}

		switch(iCh)
		{
			case 1:
				iAns = Addition(iNo1,iNo2);
				break;
			case 2:
				iAns = Subtraction(iNo1,iNo2);
				break;
			case 3:
				iAns = Multiplication(iNo1,iNo2);
				break;
			case 4:
				iAns = Division(iNo1,iNo2);
				break;
			case 5:
				exit(0);
			default:
				printf("Enter valid choice \n");
				iCh = 1;
				continue;
		}

		printf("\nAnswer is %d \n\n",iAns);

		printf("Are you want to enter more choice ? (1/0) : ");
		scanf("%d",&iCh);

	}while(iCh == 1);

	exit(0);
}
int Addition(int iNo1,int iNo2)
{
	return iNo1+iNo2;
}
int Subtraction(int iNo1,int iNo2)
{
	return iNo1-iNo2;
}
int Multiplication(int iNo1,int iNo2)
{
	return iNo1*iNo2;
}
int Division(int iNo1,int iNo2)
{
	return iNo1/iNo2;
}
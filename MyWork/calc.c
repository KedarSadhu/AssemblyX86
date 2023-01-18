#include<stdio.h>
#include<stdlib.h>

int add(int,int);
int sub(int,int);
int mult(int,int);
int mydiv(int,int);

int main(void)
{
	int no1,no2,ans;

	printf("Enter two numbers : ");
	scanf("%d%d",&no1,&no2);

	ans = add(no1,no2);
	printf("\nAddition is : %d\n",ans);

	ans = sub(no1,no2);
	printf("Subtraction is : %d\n",ans);

	ans = mult(no1,no2);
	printf("Multiplication is : %d\n",ans);

	ans = div(no1,no2);
	printf("Division is : %d\n",ans);

	exit(0);
}

int add(int no1,int no2)
{
	return (no1+no2);
}

int sub(int no1,int no2)
{
	return (no1 - no2);
}

int mydiv(int no1,int no2)
{
	return (no1 / no2);
}

int mult(int no1,int no2)
{
	return (no1 * no2);
}
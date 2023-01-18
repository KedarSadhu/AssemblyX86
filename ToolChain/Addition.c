#include<stdio.h>
#include<stdlib.h>

int addition(int,int);

int main(void)
{
	int no1;
	int no2;
	int ans;

	printf("Enter two numbers : ");
	scanf("%d%d",&no1,&no2);

	ans = addition(no1,no2);

	printf("Answer is : %d",ans);

	exit(0); 
}

int addition(int no1,int no2)
{
	int ans;

	ans = no1 + no2;

	return ans;
}
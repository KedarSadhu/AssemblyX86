#include<stdio.h>
#include<stdlib.h>

int iNo1 =10;
int iNo2;

void fun1();

int main()
{
	int iNo3;

	printf("Enter two number ::  ");
	scanf("%d%d",&iNo2,&iNo3);//90 80
	printf("In main iNo1 = %d\tiNo2 = %d\tiNo3 = %d",
		iNo1,iNo2,iNo3);//10 90 80
	fun1();

	exit(0);
}
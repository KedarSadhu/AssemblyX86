#include<stdio.h>

static int iNo1;
static int iNo2 =40;

void fun1()
{
	printf("Enter number :: ");
	scanf("%d",&iNo1);//70

	printf("In fun1 , iNo1 = %d and iNo2 = %d\n",iNo1,iNo2);//70 40

	fun2();
}

static void fun2()
{
	printf("In fun2");
}
#include<stdio.h>
#include<stdlib.h>

void fun();
int main(void)
{
	register int iNo1 =10;
	printf("iNo1 : %d\n",iNo1);

	fun();

	exit(0);
}

void fun()
{
	register int iNo1 = 20;
	printf("iNo1 : %d\n",iNo1);	
}
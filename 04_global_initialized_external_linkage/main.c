#include<stdio.h>
#include<stdlib.h>

void fun();

int main(void)
{
	extern int g_iNo;
	printf("In main , no :: %d\n",g_iNo);
	fun();
	exit(0);
}
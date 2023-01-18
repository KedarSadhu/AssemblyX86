#include<stdio.h>
#include<stdlib.h>

void fun();

int g_iNo;
int main(void)
{
	printf("In main , no :: %d\n",g_iNo);
	fun();
	exit(0);
}
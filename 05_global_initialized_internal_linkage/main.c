#include<stdio.h>
#include<stdlib.h>

void fun();

int g_iNo =20;

int main()
{
	
	fun();
	printf("In main g_iNo :: %d",g_iNo);
	
	exit(0);
}
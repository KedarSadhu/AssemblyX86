#include<stdio.h>
#include<stdlib.h>

int g_iNo;

int main()
{
	printf("g_iNo = %d\n",g_iNo);
	printf("Enter no :: ");
	scanf("%d",&g_iNo);
	printf("\ng_iNo :: %d",g_iNo);
	exit(0);
}
#include<stdio.h>
#include<stdlib>

int main(void)
{
	int iNo1 = 10;
	int iNo2 = 20;

	int iAns1;
	int iAns2;

	iAns1 = ++ iNo1;
	iAns2 = iNo2 ++;

	printf("iNo1=%d\niNo2=%d\niAns1=%d\niAns2=%d\n",
		iNo1,iNo2,iAns1,iAns2);

	exit(0);
}
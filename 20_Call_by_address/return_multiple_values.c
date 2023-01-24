#include<stdio.h>
#include<stdlib.h>

void sumDiff(int iNo1,int iNo2,int* pSum,int* pDiff);

int main(void)
{
	int iNo1;
	int iNo2;
	int iSum;
	int iDiff;

	printf("Enter 2 numbers :: ");
	scanf("%d%d",&iNo1,&iNo2);

	sumDiff(iNo1,iNo2,&iSum,&iDiff);

	printf("Sum is : %d\n",iSum);
	printf("Diff is : %d\n",iDiff);

	exit(0);
}

void sumDiff(int iNo1,int iNo2,int* pSum,int* pDiff)
{
	*pSum = iNo1 + iNo2;
	*pDiff = iNo1 - iNo2;
}
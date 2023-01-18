#include<stdio.h>
#include<stdlib.h>

#define MAX 10

int arr[]={10,20,30};
int arr[MAX];

int main()
{
	int iMax;
	int iCounter;

	printf("Enter value of n (< %d):\t",MAX);
	scanf("%d",&iMax);

	for(iCounter = 0;iCounter < iMax; iCounter++)
	{
		printf("Enter %d value : \t",iCounter);
		scanf("%d",&arr[iCounter]);
	}
	printf("arr1 is :\n");

	for(iCounter = 0;iCounter<iMax;iCounter++)
		printf("%d value is :\t%d\n",iCounter,arr1[iCounter]);

		printf("arr2 is :\n");

	for(iCounter = 0;iCounter<iMax;iCounter++)
		printf("%d value is :\t%d\n",iCounter,arr2[iCounter]);

	exit(0);
}	

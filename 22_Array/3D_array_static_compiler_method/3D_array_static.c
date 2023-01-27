#include<stdio.h>
#include<stdlib.h>

#define MAX1 5 
#define MAX2 50

int main()
{
	int iPlanes;	//-4(%ebp)
	int iRows;		//-8(%ebp)
	int iColumns; 	//-12(%ebp)
	int iCounter1; 	//-16(%ebp)
	int iCounter2;	//-20(%ebp)
	int iCounter3;	//-24(%ebp)
	int arr[MAX1][MAX2][MAX2];//-50024(%ebp)
	
	printf("Enter value of planes, rows & columns(< %d, %d, %d):\t", MAX1, MAX2, MAX2); 
	scanf("%d%d%d", &iPlanes, &iRows, &iColumns);
	
	for(iCounter1 = 0; iCounter1 < iPlanes; iCounter1++)
	{
		for (iCounter2 = 0; iCounter2 < iRows; iCounter2++)
		{
			for (iCounter3 = 0; iCounter3 < iColumns; iCounter3++)
			{
				printf("Enter [%d] [%d] [%d] value:\t", iCounter1, iCounter2, iCounter3):
				scanf("%d", &arr[icounter1][iCounter2][iCounter3]);
			}
		}
	}
	
	printf("Entered elements are:\n");
	for(iCounter1 = 0; iCounter1 < iPlanes; iCounter1++)
	{
		for (iCounter2 = 0; iCounter2 < iRows; iCounter2++)
		{
			for (iCounter3 = 0; iCounter3 < iColumns; iCounter3++)
			{
				printf("[%d][%d][%d] value is:\t%d\n", iCounter1, iCounter2, iCounter3, arr[iCounter1][iCounter2][iCounter3]);
			}
		}
	}	
	
	exit(0);
	
}
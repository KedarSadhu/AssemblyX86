#include<stdio.h>
#include<stdlib.h>

int main(void)
{
	int iNumerator;
	int iDenomenator;

	int iQuotient;
	int iRemender;

	printf("Enter numrator :");
	scanf ("%d",&iNumerator);

	printf("Enter denominator :");
	scanf ("%d",&iDenomenator);

	iQuotient = iNumerator / iDenomenator;
	iRemender = iNumerator % iDenomenator;

	printf ("iQuotient =%d\niRemender = %d\n",
		iQuotient,iRemender);

	exit(0);

}
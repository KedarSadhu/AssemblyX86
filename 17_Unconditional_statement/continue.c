#include<stdio.h>
#include<stdlib.h>

int main(void)
{
	int iNo;
	int iCounter;

	for(iCounter = 1; iCounter < iNo;iNo++)
	{
		if(iCounter%2 == 0)
			continue;

		printf("%d\n",iCounter);
	}

	exit(0);
}

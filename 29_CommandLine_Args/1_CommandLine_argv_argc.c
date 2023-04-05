#include<stdio.h>
#include<stdlib.h>

int main(int argc,char* argv[])
{
    int iCounter;
    int iSum;

    printf("argc is : %d\n\n",argc);

    if(argc!=3)
    {
        puts("Invalid arguments : prog_name arg1 arg2");
        exit(-1);
    }

    puts("Values are :");

    for(iCounter = 0;iCounter <argc;iCounter++)
        puts(argv[iCounter]);
    
    printf("\n");

    iSum = atoi(argv[1]) + atoi(argv[2]);

    printf("Sum is %d\n",iSum);

    exit(0);
}

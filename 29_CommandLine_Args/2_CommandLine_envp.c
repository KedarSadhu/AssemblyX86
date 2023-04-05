#include<stdio.h>
#include<stdlib.h>

int main(int argc,char* argv[],char *envp[])
{
    int iCounter;

    if(argc!=1)
    {
        puts("Invalid arguments : prog_name");
        exit(-1);
    }

    puts("Envp Values are :");

    for(iCounter = 0;envp[iCounter] != NULL;iCounter++)
        puts(envp[iCounter]);

    exit(0);
}

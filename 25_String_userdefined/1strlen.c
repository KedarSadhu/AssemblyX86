#include<stdio.h>

int mystrlen(const char *);

int main()
{
    char *ptr="Hello";
    char str[]="Good";
  
    printf("\nThe Length Of Hello Is %d\n",mystrlen(ptr));
    printf("The Length Of Good Is %d\n",mystrlen(str));
    printf("The Length Of Morning Is %d\n",mystrlen("Morning"));
  
    return 0;
}

int mystrlen(const char * pStr)
{
    int len = 0;
    while((*pStr) != '\0')
    {
        len++;
        pStr++;
    }
    return len;
}

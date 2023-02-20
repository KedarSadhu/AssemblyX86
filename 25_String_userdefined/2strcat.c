#include<stdio.h>
#include<string.h>

char * mystrcat(char *pDest,const char * pSrc);

int main()
{
    char source[20],destination[40];

    printf("\n\nEnter Destination String:\t");
    gets(destination);
   
    printf("\n\nEnter Source String:\t");
    gets(source);
   
    mystrcat(destination,source);
    printf("\n\nConcatenated String Is:\t");

    puts(destination);
    return 0;
}

char * mystrcat(char *pDest,const char * pSrc)
{
    int iDestCounter = 0;
    int iSrcCounter = 0;

    while(pDest[iDestCounter]!='\0')
        iDestCounter++;
    
    while(pSrc[iSrcCounter]!='\0')
    {
        pDest[iDestCounter] = pSrc[iSrcCounter];
        iDestCounter++;
        iSrcCounter++;
    }
    
    pDest[iDestCounter] = '\0';
    
    return pDest;
}
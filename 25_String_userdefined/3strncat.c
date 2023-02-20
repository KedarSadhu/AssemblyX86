#include<stdio.h>
#include<string.h>

char * mystrncat(char *pDest,const char * pSrc,int n);

int main()
{
    char source[20],destination[40];
    int n;

    printf("\n\nEnter Destination String:\t");
    gets(destination);

    printf("\n\nEnter Source String:\t");
    gets(source);

    printf("\n\nEnter Value Of n:\t");
    scanf("%d",&n);

    mystrncat(destination,source,n);
    printf("\n\nConcatenated String Is:\t");
    puts(destination);

    return 0;
}

char * mystrncat(char *pDest,const char * pSrc,int n)
{
    int iDestCounter = 0;
    int iSrcCounter = 0;

    while(pDest[iDestCounter]!='\0')
        iDestCounter++;
    
    while(pSrc[iSrcCounter]!='\0' && iSrcCounter < n)
    {
        pDest[iDestCounter] = pSrc[iSrcCounter];
        iDestCounter++;
        iSrcCounter++;
    }
    
    pDest[iDestCounter] = '\0';
    
    return pDest;
}
#include<stdio.h>
#include<string.h>

char* mystrstr(const char *pStr1,const char *pSubStr);

int main()
{
	char string1[20],string2[20],*ptr;

	printf("\n\nEnter The String:\t");
	gets(string1);

	printf("\n\nEnter String To Be Found:\t");
	gets(string2);

	ptr=mystrstr(string1,string2);
	if(ptr==NULL)
	{
		puts("\n\nString Not Found\n");
	}
	else
	{
		printf("\n\nString Is Found At %d Location\n",(ptr-string1)+1);
		printf("\n\nString Found In '%s'\n",ptr);
	}
	
	return 0;
}

char *mystrstr(const char *pStr1,const char *pSubStr)
{
	const char * pTemp = pStr1;
	const char * pTempsubstr = pSubStr;

	int flag = 0;
	while((*pStr1) != '\0')
	{
		if((*pTemp) == (*pSubStr))//first matching char
		{
			pTemp++;
			pSubStr++;
			while((*pSubStr)!= '\0')
			{
				if((*pTemp) == (*pSubStr))
				{
					pTemp++;
					pSubStr++;
					flag = 1;
				}
				else 
				{
					flag = 0;
					break;
				}
			}
			//not found setting orignal positions
			pTemp = pStr1;
			pSubStr = pTempsubstr;
		}

		if(flag)	//sub str found
			break;
		
		pStr1++;
		pTemp++;
		
	}

	if (flag == 0)
		return NULL;
	
	return pStr1;
}
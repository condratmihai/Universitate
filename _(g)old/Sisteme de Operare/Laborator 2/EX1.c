#include <unistd.h>
#include<stdlib.h>
#include<stdio.h>
 
int main()
{
	write(1, "Hello world! \n", 14);
	
    exit(0);
}

#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <errno.h> 
#include <fcntl.h>
#include <string.h>
#include <pthread.h>

void* reverse(void *v)
{
    char *str = (char*)v;
    
    int len = strlen(str);

    for(int i = len - 1; i >= 0; i--)
        printf("%c", str[i]);
    
    printf("\n");

    return NULL;
}

int main(int argc, char **argv)
{

    //printf("%s\n", argv[1]);

    pthread_t thr;

    if(pthread_create(&thr, NULL, reverse, argv[1]))
    {
        perror(NULL);
        return errno;
    }

    if(pthread_join(thr, NULL))
    {
        perror(NULL);
        return errno;
    }

   return 0;
}
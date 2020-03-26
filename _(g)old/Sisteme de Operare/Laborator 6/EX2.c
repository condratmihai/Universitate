#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <errno.h> 
#include <fcntl.h>
#include <string.h>
#include <pthread.h>

int A[2][2] = {{1,2}, {2,1}};
int B[2][2] = {{3,4}, {4,3}};
int C[2][2];

struct parametru
{
    int row;
    int col;
};

void* multiply(void *prm)
{
    struct parametru *param = (struct parametru *)prm;
    
    int i, j, r, c;

    r = param->row;
    c = param->col;

    int suma = 0;
    for(int k = 0; k < 2; k++)
        suma += (A[r][k]*B[k][c]);

    C[r][c] = suma;

    return NULL;
}

int main(int argc, char **argv)
{

    int i, j;

    struct parametru *RC = malloc(1);
    
    pthread_t thr;

    for(i = 0; i < 2; i++)
    {
        RC->row = i;

        for(j = 0; j < 2; j++)
        {
            RC->col = j;

            if(pthread_create(&thr, NULL, multiply, RC))
            {
                perror(NULL);
                return errno;
            }

            if(pthread_join(thr, NULL))
            {
                perror(NULL);
                return errno;
            }
        }
    }

    for(i = 0; i < 2; i++)
    {
        for(j = 0; j < 2; j++)
            printf("%d ",C[i][j]);
        printf("\n");
    }
    

   return 0;
}
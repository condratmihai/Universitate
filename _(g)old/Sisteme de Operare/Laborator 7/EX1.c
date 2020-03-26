#include <stdlib.h>
#include <stdio.h>
#include <errno.h>
#include <pthread.h>
#define MAX_RESOURCES 5

int available_resources = MAX_RESOURCES;
pthread_mutex_t mtx;

int decrease(int count) 
{ 
	pthread_mutex_lock(&mtx);
	if (available_resources<count)
		{ 
		pthread_mutex_unlock(&mtx); 
		return -1;
		}
	else 
		available_resources -= count ;
	printf("Get %d resources, remaining %d resources\n",count,available_resources);
	pthread_mutex_unlock(&mtx);
	return 0; 
}

int increase(int count) 
{ 
	pthread_mutex_lock(&mtx);
	available_resources += count;
	printf("Release %d resources, remaining %d resources\n",count,available_resources);
	pthread_mutex_unlock(&mtx);
	return 0; 
}

void *fct(void *k)
{
	int* n = (int*) malloc(1); 
	*n = *((int *)k);
	if(*n > available_resources)
		increase(*n);
	else decrease(*n);
	return n;
}

int main()
{
	if ( pthread_mutex_init(&mtx, NULL))
	{ 
	      perror (NULL);
	      return errno ; 
	}
	pthread_t tid[20];
	int i;
	int *result;
	for(i=0;i<10;++i)
	{
	   int *p=(int *)malloc(1);
	   *p=i%4+1;
	   pthread_create(&tid[i],NULL,fct,p);
	}

	for(i=0;i<10;++i)
		pthread_join(tid[i],NULL);
		
	return 0;
}







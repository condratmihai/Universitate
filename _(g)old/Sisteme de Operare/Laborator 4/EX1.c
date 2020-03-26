#include<stdio.h>
#include<stdlib.h>
#include<unistd.h>
#include<sys/types.h>
#include<sys/wait.h>

int main()
{
   pid_t pid = fork();
   
   if(pid == 0)
   {
   	char *argv[] = {"ls",NULL};
    execve("/bin/ls", argv, NULL);
    perror(NULL);
   }
   else if(pid > 0)
   {
  	printf("My PID = %d, Child PID = %d", getpid(), pid);
    wait(NULL);
	printf("\nChild %d finished \n", pid);
   }
   
   return 0;
}

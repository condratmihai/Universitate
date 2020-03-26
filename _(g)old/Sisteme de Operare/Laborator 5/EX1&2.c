#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <sys/mman.h>
#include <sys/stat.h>
#include <errno.h> 
#include <fcntl.h>

int main(int argc, char **argv)
{
   printf("Starting parent: %d\n", getpid());
   pid_t pid = fork();
   int v[100], i, shm_fd, n = argc - 1, x, offset;
   char shm_name[] = "collatz";
   shm_fd = shm_open(shm_name, O_CREAT|O_RDWR, S_IRUSR|S_IWUSR); 
   
   if(shm_fd < 0)
   {
	perror(NULL);
    return errno;
   }
   
   size_t shm_size = getpagesize() * n;
   for(i = 1; i <= n; i++)
		v[i] = atoi(argv[i]);
  
   if(ftruncate(shm_fd, shm_size) == -1)
   {
	perror(NULL);
	shm_unlink(shm_name);
	return errno;
   }

   for(i = 1; i <= n; i++)
   {
    if(pid == 0)
	{	
		char *shm_ptr_child = mmap(0, getpagesize(),PROT_READ|PROT_WRITE, MAP_SHARED, shm_fd, (i-1) * getpagesize());
		x = v[i];
		
        while(x != 1)
		{
			offset = sprintf(shm_ptr_child, "%d ", x);
			shm_ptr_child += offset;
			
            if(x % 2) x = 3 * x + 1;
            else x = x / 2;
        }
		
        printf("Done Parent: %d. Child: %d\n", getppid(), getpid());
        munmap(shm_ptr_child, getpagesize());
		
        return 0;
    }
    else if(pid > 0)
	  {
        wait(NULL);
        pid = fork();
      }   
   }

   if(pid > 0)
   {
        for(i = 1; i <= n; i++)
		{
           char *shm_ptr = mmap(0, getpagesize(), PROT_READ, MAP_SHARED, shm_fd, (i - 1) * getpagesize());
           printf("%s\n", shm_ptr);
		   munmap(shm_ptr, getpagesize());
        }
		
        printf("Done Parent %d. Child: %d\n", getppid(), getpid());
   }
   
   return 0;
}

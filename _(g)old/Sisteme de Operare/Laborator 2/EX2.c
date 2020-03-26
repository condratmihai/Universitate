#include <unistd.h>
#include <stdlib.h>
#include <stdio.h>
#include <errno.h>
#include <sys/types.h>

int main(int argc, char ** argv)
{
	int foo, bar;
	ssize_t reader; 
	char buffer[100];

	foo = open(argv[1], O_RDONLY | O_CREAT, S_IRUSR);
	bar = open(argv[2], O_RDONLY | O_WRONLY | O_CREAT, S_IRUSR);

	if(foo == -1)
	{
		perror(NULL);
		return errno;
	}
	
	if(bar == -1)
	{
		perror(NULL);
		return errno;
	}
	
	while (reader = read(foo, buffer, 1))
	{
		write(bar, buffer, 1);
	}
	
	close(foo);
	close(bar);

	return 0;
}

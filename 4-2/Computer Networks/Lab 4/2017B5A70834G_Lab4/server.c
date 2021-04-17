#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <fcntl.h>
#include <string.h>
#include <limits.h>
#include <errno.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <sys/types.h>
#include <sys/wait.h>

#define SEND_PIPE "/tmp/PIPE1"
#define RCV_PIPE "/tmp/PIPE2"

int main( int argc, char *argv[])
{

	
	int nbytes; 
	int n = 0;
	int dummyfifo; 
	int comm_pipe; 
	static char buffer[PIPE_BUF];
	
	mkfifo(SEND_PIPE, 0666) ;
	mkfifo(RCV_PIPE, 0666) ;
	char text[PIPE_BUF];
	int pid;
	pid = fork();

	if(pid==0)
	{
		


		if ( (comm_pipe = open(SEND_PIPE, O_WRONLY) ) == -1) {
		 
		 exit(1);
		} 

		while (1) {
		memset(text, 0x0, PIPE_BUF); 
		nbytes = read(fileno(stdin), text, PIPE_BUF);
		if ( !strncmp("exit", text, nbytes-1))
		 break;
		 write(comm_pipe, text, nbytes);
		}

		close(comm_pipe);
		exit(0);
	}
	else
	{
		 
		int n = 0;
		int dummyfifo; 
		int comm_pipe; 
		static char buffer[PIPE_BUF];

		if ( (comm_pipe = open(RCV_PIPE, O_RDONLY) ) == -1 ||
		( dummyfifo = open(RCV_PIPE, O_WRONLY | O_NDELAY )) == -1 ) {

		exit(1);
		}

		while ( 1 ) { 
			memset(buffer, 0, PIPE_BUF);
			if ( ( nbytes = read( comm_pipe, buffer, PIPE_BUF)) > 0 ) {
			buffer[nbytes] = '\0';
			n++;
			if ( !strncmp("exit", buffer, nbytes-1))
		 		break;
			printf("Message %d received by server: %s",n, buffer);
			fflush(stdout);
			}
			else
			break;
		}

		while(wait(NULL)!=-1);
	}
	 
} 
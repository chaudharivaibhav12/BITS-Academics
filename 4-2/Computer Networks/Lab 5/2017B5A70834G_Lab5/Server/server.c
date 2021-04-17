#include <stdio.h>
#include <sys/types.h> 
#include <sys/socket.h>
#include <netinet/in.h>
#include <stdlib.h>
#include <strings.h>
#include <unistd.h>
#include <string.h>
 
void solve(int); 

void error_msg(char *msg)
{
    perror(msg);
    exit(1);
}
 
int main(int argc, char *argv[])
{
    int sockfd, newsockfd, portno, client_len, pid;
    struct sockaddr_in server_addr, client_addr;

    if(argc < 2) 
    {
        fprintf(stderr,"ERROR, no port provided\n");
        exit(1);
    }

    sockfd = socket(AF_INET, SOCK_STREAM, 0);

    if(sockfd < 0) 
    {
        error_msg("ERROR opening socket");
    }

    bzero((char *) &server_addr, sizeof(server_addr));
    portno = atoi(argv[1]);
    server_addr.sin_family = AF_INET;
    server_addr.sin_addr.s_addr = INADDR_ANY;
    server_addr.sin_port = htons(portno);

    if(bind(sockfd, (struct sockaddr *) &server_addr, sizeof(server_addr)) < 0) 
    {
        error_msg("ERROR on binding");
    }
    listen(sockfd,5);
    client_len = sizeof(client_addr);

    while (1) 
    {
        newsockfd = accept(sockfd, (struct sockaddr *) &client_addr, &client_len);

        if (newsockfd < 0) 
        {
            error_msg("ERROR on accept");
        }

        pid = fork();

        if (pid < 0)
        {
            error_msg("ERROR on fork");
        }

        if (pid == 0)  
        {
            close(sockfd);
            solve(newsockfd);
            exit(0);
        }
        else 
        {
            close(newsockfd);
        }
    } 
    return 0;
}
 
void solve (int sock)
{
   int n;
   char buffer[256];
   char buffer_out[15];

   FILE *fp;
 
    while(1)
    {
        bzero(buffer,256);
        bzero(buffer_out,15);

        n = read(sock,buffer,255);

        if (n < 0) 
        {
            error_msg("ERROR reading from socket");
        }

        size_t len = strlen(buffer)-1;
        
        if(*buffer && buffer[len]=='\n') 
        {
            buffer[len] = '\0';
        }
    
        fp=NULL;
        fp = fopen(buffer,"r");

        if(fp==NULL)
        {
           
            n = write(sock,"FILE NOT FOUND",15);
            if (n < 0) 
            {
                error_msg("ERROR writing to socket");
            }
        }
        else
        {
            fread(buffer_out, 1, 10 , fp);
            n = write(sock,buffer_out,strlen(buffer_out));
        }

    }
    fclose(fp);
   
}
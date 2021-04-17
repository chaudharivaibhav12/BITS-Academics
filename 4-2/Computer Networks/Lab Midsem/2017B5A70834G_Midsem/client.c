#include <stdio.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <netdb.h> 
#include <stdlib.h>
#include <strings.h>
#include <unistd.h>
#include <string.h>
 
void error_msg(char *msg)
{
    perror(msg);
    exit(0);
}
 
int main(int argc, char *argv[])
{
    int sockfd, portno, n;
 
    struct sockaddr_in serv_addr;
    struct hostent *server;
 
    char buffer[1025];

    if (argc < 3) 
    {
       fprintf(stderr,"Please input hostname and portname as CL argument\n");
       exit(0);
    }

    portno = atoi(argv[2]);
    sockfd = socket(AF_INET, SOCK_STREAM, 0);

    if (sockfd < 0) 
    {
        error_msg("ERROR opening socket");
    }

    server = gethostbyname(argv[1]);
    if (server == NULL) 
    {
        fprintf(stderr,"ERROR, no such host\n");
        exit(0);
    }

    bzero((char *) &serv_addr, sizeof(serv_addr));
    serv_addr.sin_family = AF_INET;
    bcopy((char *)server->h_addr, (char *)&serv_addr.sin_addr.s_addr, server->h_length);
    serv_addr.sin_port = htons(portno);

    if (connect(sockfd,(struct sockaddr *)&serv_addr,sizeof(serv_addr)) < 0) 
    {
        error_msg("ERROR connecting");
    }

    printf("Please enter the message: ");
    bzero(buffer,1025);
    fgets(buffer,1024,stdin);
    
    n = write(sockfd,buffer,strlen(buffer));
    if (n < 0) 
    {
        error_msg("ERROR writing to socket");
    }

    bzero(buffer,1025);
    n = read(sockfd,buffer,1024);

    if (n < 0)
    { 
         error_msg("ERROR reading from socket");
    }

    char rev[1025];

        int count=strlen(buffer);
        int j=count-1;

        for(int i=0; i<count; i++)
        {
            rev[i]=buffer[j--];
        }

        rev[count] = '\0';

    printf("Server response %s\n",rev);
    
    char exit[5];
    exit[0] = 'e';
    exit[1] = 'x';
    exit[2] = 'i';
    exit[3] = 't';
    exit[4] = '\0';
    
    n = write(sockfd,exit,strlen(exit));
   
    return 0;
}
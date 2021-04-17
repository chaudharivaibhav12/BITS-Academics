#include <stdio.h>
#include <sys/types.h> 
#include <sys/socket.h>
#include <netinet/in.h>
#include <stdlib.h>
#include <strings.h>
#include <unistd.h>
#include <string.h>
 
void solve(int, int); 

void error_msg(char *msg)
{
    perror(msg);
    exit(1);
}

int checkExit(char *str)
{
    if(str[0]=='e' && str[1]=='x' && str[2]=='i' && str[3]=='t')
        return 1;
    return 0; 
}
 
int main(int argc, char *argv[])
{
    int sockfd, newsockfd, portno, client_len, pid;
    struct sockaddr_in server_addr, client_addr;
    int cnt = 0;

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

        cnt++;

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
            solve(newsockfd, cnt);
            exit(0);
        }
        else 
        {
            close(newsockfd);
        }
    } 
    return 0;
}
 
void solve (int sock, int cnt)
{
    while(1)
    {
        int n;
        char buffer[1025];
        bzero(buffer,1025);

        n = read(sock,buffer,1024);

        if(checkExit(buffer))
        return ; 

        if (n < 0) 
        {
            error_msg("ERROR reading from socket");
        }

        buffer[strlen(buffer)-1] = '\0';

        char rev[1025];

        int count=strlen(buffer);
        int j=count-1;

        for(int i=0; i<count; i++)
        {
            rev[i]=buffer[j--];
        }

        rev[count] = '\0';

        printf("Client %d: %s\n", cnt, rev);

        char clientValue[1025];
        gets(clientValue);

        n = write(sock,clientValue,strlen(clientValue));

        if (n < 0) 
        {
            error_msg("ERROR writing to socket");
        }
    } 
}
#include <stdio.h>
#include <sys/types.h> 
#include <sys/socket.h>
#include <netinet/in.h>
#include <stdlib.h>
#include <strings.h>
#include <unistd.h>
#include <string.h>
#include <sys/ipc.h>
#include <sys/shm.h>

//Shared Memory
struct clientLimit{
    int cnt;
};

struct clientLimit *limit;
 
void solve(int, struct clientLimit *, int); 

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
	//Shared Memory
    int shmid_limit = shmget(IPC_PRIVATE, sizeof(struct clientLimit), 0666|IPC_CREAT);
    
    limit= (struct clientLimit *)shmat(shmid_limit, 0, 0);


    int sockfd, newsockfd, portno, client_len, pid;
    struct sockaddr_in server_addr, client_addr;
    limit->cnt=0;
    int cnt=0;

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
        //Number of client gets updated.
        limit->cnt++;
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
            //If Client >=5 , they will be rejected.
            if(limit->cnt >= 5)
            {
                printf("Client %d Request is Rejected!\n", limit->cnt);
                int k;
                k=write(newsockfd,"Request Denied: 4 Client Limit Reached",38);
                limit->cnt--;
                return 0;
            }

            solve(newsockfd, limit, cnt);
            printf("Client %d died!\n", cnt); //When exit typed, client dies.
            exit(0);
        }
        else 
        {
            close(newsockfd);
        }
    } 
    return 0;
}
 
void solve (int sock, struct clientLimit *limit, int cnt)
{
    while(1)
    {
        int n;
        char buffer[1025];
        bzero(buffer,1025);

        n = read(sock,buffer,1024);
        //Check if exit was written so decrease the active count of clients by 1 and exit the this function
        if(checkExit(buffer))
        {
            limit->cnt--;
            return ; 
        }

        if (n < 0) 
        {
            error_msg("ERROR reading from socket");
        }

        buffer[strlen(buffer)-1] = '\0';
        //Code to reverse
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
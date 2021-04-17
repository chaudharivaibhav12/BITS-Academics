#include <stdio.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <netdb.h> 
#include <stdlib.h>
#include <strings.h>
#include <unistd.h>
#include<string.h>
 
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
 
    char buffer[256];

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

    while(1)
    {
       
        printf("Please enter the file you want data from: ");
        //bzero(buffer,256);
        for(int i=0;i<256;i++)
        {
            buffer[i]='\0';
        }

        fgets(buffer,255,stdin);
        int buffer_len=strlen(buffer);
        char filename[buffer_len+1];

        for(int i=0; i<buffer_len; i++)
        {
        	filename[i]=buffer[i];
        }

        filename[buffer_len]='\0';

        n = write(sockfd,buffer,strlen(buffer));

        if (n < 0)
        { 
            error_msg("ERROR writing to socket");
        }
        bzero(buffer,256);
        n = read(sockfd,buffer,255);
        if (n < 0) 
        {
            error_msg("ERROR reading from socket");
        }
        
        FILE *fp;
    	fp=fopen(filename,"w");
    	if(strcmp(buffer,"FILE NOT FOUND")==0)
        {
        	fputs("",fp);
        }
    	else
    	{
    		fputs(buffer,fp);
    	}
    	fclose(fp);
        printf("%s\n",buffer);
    }
   
    return 0;
}
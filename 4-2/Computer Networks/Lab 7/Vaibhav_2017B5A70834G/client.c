#include <stdio.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <netdb.h> 
#include <stdlib.h>
#include <strings.h>
#include <unistd.h>
#include <string.h>
#include <arpa/inet.h>
#include <errno.h>
#include <openssl/ssl.h>
#include <openssl/bio.h>
#include <openssl/err.h>

void error_msg(char *msg)
{
    //perror(msg);
    printf("%s",msg);
    exit(0);
}

//For HTTPS servers

void httpsURL(char domain[], char path[], char fileName[]) 
{
	SSL_CTX *ssl_ctx = SSL_CTX_new(TLS_client_method());
 
	if (ssl_ctx == NULL) 
        error_msg("CTX is null\n");
 
	BIO *Bio = BIO_new_ssl_connect(ssl_ctx);
    
    SSL *ssl;
    BIO_get_ssl(Bio, &ssl);
    SSL_set_mode(ssl, SSL_MODE_AUTO_RETRY);
    
	char buffer[1024];
	snprintf(buffer, sizeof(buffer), "%s:https", domain);
    BIO_set_conn_hostname(Bio, buffer);
    
    if(BIO_do_connect(Bio)<=0) 
    {
        BIO_free_all(Bio);
        error_msg("ERROR Unable to connect.\n");
    }
	
	char sendRequest[1024];
 
	snprintf(sendRequest, sizeof(sendRequest), "GET /%s HTTP/1.1\r\nHost: %s\r\nConnection: Close\r\n\r\n", path, domain);
 
    if(BIO_puts(Bio, sendRequest) <= 0) 
    {
        BIO_free_all(Bio);
        error_msg("ERROR Could not send request\n");
    }
 
	char receiveData[1024];
 
	FILE* fp = fopen(fileName, "wb");
	    
    while (1) 
    {
        int bytesReceived = BIO_read(Bio, receiveData, 1024);
        if (bytesReceived == 0) 
            break;
        else if (bytesReceived < 0) 
        {
            if (!BIO_should_retry(Bio)) 
                error_msg("ERROR Could not read file\n");
        }
        else 
        {
            receiveData[bytesReceived] = '\0';
			fwrite(receiveData, bytesReceived, 1, fp);
        }
    }
 
	fclose(fp);    
    BIO_free_all(Bio);
 
	printf("\n\nDone\n\n");

	exit(0);
}
 
int main(int argc, char *argv[])
{
	int sockfd, portno;
	struct in_addr ip_addr;
 
    struct sockaddr_in serv_addr;
    struct hostent *server;
 
    char send_request[1024], buffer[1024];

    //To check if URL given as CL Argument
    if (argc<2) 
    {
       fprintf(stderr,"Please input URL as CL argument\n");
    }

    //Extracting the Protocol, Domain, Path and the File Name from the URL

    char protocol[6];
    char str[500];
    strcpy(str,argv[1]);
    char domain[100];
    char path[500];
    char fileName[1024];

    int i;
 
	for(i=0; i<strlen(str) && str[i]!=':'; i++) 
	{
		protocol[i] = str[i];
	}

	printf("Protocol: %s\n", protocol);
	i+=3;
	
 
	for(int j=0; i<strlen(str) && str[i]!='/'; i++, j++) 
	{
		domain[j] = str[i];
	}

	printf("Domain: %s\n", domain);
	i++;
	
	for(int j=0; j<strlen(str); i++, j++) 
	{
		path[j] = str[i];
	}

	printf("Path: %s\n", path);
 
	int k;
	for(k=strlen(path)-1; k>=0 && path[k]!='/'; k--);
		k++;

	for(int j=0; k<strlen(str); j++, k++) 
	{
		fileName[j] = path[k];
	}

	//To check if URL exists

    server = gethostbyname(domain);

    if (!server) 
    {
        error_msg("The URL was not resolved. Please type the correct URL.\n");
        exit(0);	
    }

    //Get the IP Address of the URL
    ip_addr = *(struct in_addr*)(server -> h_addr);
	printf("Hostname: %s was resolved to: %s\n", domain, inet_ntoa(ip_addr));

    if ((sockfd = socket(AF_INET, SOCK_STREAM, 0)) == -1) 
    {
		error_msg("ERROR Opening Socket");
	}

    serv_addr.sin_family = AF_INET;
	serv_addr.sin_port = htons(80);
	serv_addr.sin_addr = *((struct in_addr*)(server -> h_addr));

    printf("Connecting...\n");

    if (connect(sockfd,(struct sockaddr *)&serv_addr,sizeof(struct sockaddr)) < 0) 
    {
        error_msg("ERROR connecting");
    }

    //Check if HTTPS is used in the url

    if (!strncmp(protocol, "https", 5)) 
		httpsURL(domain, path, fileName);

    printf("Sending data...\n");

    //Send the GET request
    snprintf(send_request, sizeof(send_request), "GET /%s HTTP/1.0\r\nHost: %s\r\n\r\n", path, domain);

    printf("%s\n", send_request);

    if (send(sockfd, send_request, strlen(send_request), 0) == -1) 
    {
		error_msg("ERROR Sending Data");
	}
 
	printf("Data sent\n");

	//Put data received in a file
	FILE *fp;

	fp= fopen(fileName, "wb");
	printf("Receiving Data... \n");

	//Receiving Data
	int bytesReceived;

	while ((bytesReceived=recv(sockfd, buffer, 1024, 0)) > 0) 
	{
		if (bytesReceived==-1) 
		{
			error_msg("ERROR Receiving Data");
		}
	
		buffer[bytesReceived]='\0';
 
		fwrite(buffer, bytesReceived, 1, fp);
	}
   	
   	close(sockfd);
	fclose(fp);
	printf("\nDone\n");

    return 0;
}
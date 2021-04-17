
To run the code, use the following commands on two different terminal:

Server-
gcc server.c -o server
./server 10005 
Hello Client, this is the server

NOTE: Here 10005 is the port number we will be using. You can use any port above this also.

Client-
gcc client.c -o client 
./client localhost 10005 
Hello this is the client



NOTE: Here localhost is the IP Address and 10005 is the port number. You can use any port above this also but it has to be the same as the port used while running the executable.

We can write anything within 1024 bytes and can transfer it from server to client and vice-versa




Important Points to be taken care of:


1. Always run the server executable before the client executable so that we can give a port number for the server.

2. Since in this we have to test out the functionality of at most 4 clients running at a time, run the Client side commands on 4 different terminals to see how 4 clients interact with a server.

3. To test the functionality of server rejecting client run client code on a separate 5th terminal as shown in pdf. We can then exit from any of the earlier 4 clients and rerun the client command on the 5th terminal and that client gets accepted as the total number of active clients are still 4.

4. I have used a shared memory to keep track of the number of active clients as I am using processes. The code is self explanatory.

NOTE: Please see the last 2 points of the PDF side by side for better understanding.

To run the code, use the following commands on two different terminal:

Server-
gcc server.c -o server
./server 10005 

NOTE: Here 10005 is the port number we will be using. You can use any port above this also.

Client-
gcc client.c -o client 
./client localhost 10005


NOTE: Here localhost is the IP Address and 10005 is the port number. You can use any port above this also but it has to be the same as the port used while running the executable.



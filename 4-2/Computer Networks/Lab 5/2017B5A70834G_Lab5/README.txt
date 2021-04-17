Important Points to be taken care of:

1. The name of the file should always be given with the extension for eg. if we want to read from file Networkingtrends.txt then in the client terminal after running the program, when it asks to enter the file from which we want the data from we will enter Networkingtrends.txt and NOT Networkingtrends

2. The code for Server and Client are there in different directories. The Server DIrectory has few files that can be used to read the data. The Client Directory has some text files which were created after the commands were run.

3. ALways run the server executable before the client executable so that we can give a port number for the server.

4. Words in () are not to be written on the terminal. They are for the understanding.

To run the code, use the following commands on two different terminal:

Server-
gcc server.c -o server
./server 9000 

NOTE: Here 9000 is the port number we will be using. You can use any port above this also.

Client-
gcc client.c -o client 
./client localhost 9000
Networkingtrends.txt
(Now you can type the name of the file you want data from for eg: Networkingtrends.txt and the server will return the first 10 bytes of the file and store it in a new file in the Client Directory with the same name)
Vaibhav.txt
(Since no file with the name exist on the Server DIrectory, FILE NOT FOUND message will be displayed in the terminal and an empty file with the same name will be created in the Client Directory)


NOTE: Here localhost is the IP Address and 9000 is the port number. You can use any port above this also but it has to be the same as the port used while running the executable.



from socket import *
client=socket(AF_INET, SOCK_STREAM)
client.connect(("192.168.1.1", 22222))
client.send("Testing Client Connection")
server_data=client.recv(100)
print(server_data)
client.close()

from socket import *
server=socket(AF_INET, SOCK_STREAM)
server.bind(("192.168.1.1", 22222))
server.listen(10)
client,address=server.accept()
client_data=client.recv(100)
print(client_data)
client.send=("Testing Socket from Server")
server.close()

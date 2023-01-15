#!/usr/bin/python
import socket
sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
socket.defaulttimeout(2)

host = raw_input("!x! Enter Host To Scan: !x!")
port = int(raw_input("!x! Enter Port To Scan: !x!")
           
def scan(port)
  if sock.connect_ex((host,port)):
           print("!x! Port %d is closed !x!" % (port))
  else:
           print("!x!Port %d is Open !x!" % (port)
scan(port)                

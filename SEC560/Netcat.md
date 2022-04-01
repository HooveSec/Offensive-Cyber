# Netcat
## Syntax
- nc 10.10.10.10 80
### Banner grab
- echo "" | nc -nvz -w2 10.10.10.60 20-80
### Listen
- nc -nlvp 8080
### Windows listen harder(if connection die recreate)
- nc -Lvp  8080
### move files 
- C:\tools\nc.exe -nlvp 8080 < C:\files\capture.pcap
- nc -nv 10.10.10.101 8080 > capture.pcap 
- nc -nlvp 9090 < /etc/password 
## Optimized Live Host Detection
- nmap -PS21,22,23,25,53,80,110,111,135,137,139,143,443,445,502,993,995,1433,1434,1723,3306,3389,5900,8080 -PE -iL hosts.txt
- alternates: 
- - MSSQL(1433,1434)
- - Oracle(1521,1630)
- - DB2(50000,50001)
- - SAP(3200,3300)
- - Postgres(5432)
- - MariaDB/MySQL(3306)
- - Informix(9088,9089)
- - ICS(502,20000,44818)
## IPv6
### Ping hosts 
- ping6 ff02::1
### Ping routers 
- ping6 ff02::1
### check neighbors table
- ip neigh
### nmap target
- nmap -Pn -sV -6 fe80::20c0 --packet-trace 
### Scan target subnet
- sudo nmap -n -sP 10.10.10.1-255 --packet-trace
## Nmap OS Fingerprinting
- sudo nmap -A 10.10.10.50 -Pn 
- sudo nmap -sV 10.10.10.50 -Pn 
# NEVER US -sV or -A ON AN ICS SCADA SYSTEM!@#!@#!@#!@#!@#!@#!@#
## NMAP Scripting Engine(NSE) - Auth,Broadcast,Brute,Discovery,Exploit,External,Fuzzer,Intrusive,Malware,Safe,Version,Vuln
- nmap -sC  10.10.10.50 -p 80
- vim /usr/share/nmap/scripts/script.db
### robots.txt
- nmap -n --script=http-robots.txt 10.10.10.60 -p 80
### nbtstat 
- nmap -n --script=nbtstat 10.10.10.10
### search for scripts 
- ls /usr/share/nmap/scripts/script/smb*.nse*
- nmap -n --script=smb-enum-users -p 139 10.10.10.10
- grep intrusive /usr/share/nmap/scripts/script/script.db 
- grep discovery /usr/share/nmap/scripts/script/script.db 
### ssh auth 
- nmap -n --script=ssh-auth-methods 10.10.10.10
### SNMP Servers
- nmap 10.10.1.1-255 -sU -p 161
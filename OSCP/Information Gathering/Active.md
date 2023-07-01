# DNS

query for MX ot TXT record 
```
host -t mx megacorpone.com
host -t txt megacorpone.com
```
Scan for subdomains from list
```
for ip in $(cat hostnames.txt); do host $ip.megacorpone.com; done
```
Scan IP range 
```
for ip in $(seq 200 254); do host 51.222.169.$ip; done | grep -v "not found"
```
DNS recon & with list
```
dnsrecon -d megacorpone.com -t std
dnsrecon -d megacorpone.com -D hostnames.txt -t brt
```
DNSENUM
``` 
dnsenum megacorpone.com
```
NSLOOKUP
``` 
nslookup mail.megacorptwo.com 
nslookup -type=TXT info.megacorptwo.com 192.168.50.151
```

# TCP/UDP/NMAP

NC Scanning
```
nc -nvv -w 1 -z 192.168.50.152 3388-3390
```
UDP NC Scan
```
nc -nv -u -z -w 1 192.168.50.149 120-123
```

# SMB 
NMAP
```
nmap -v -p 139,445 -oG smb.txt 192.168.241.1-254
nmap -v -p 139,445 --script smb-os-discovery 192.167.241.152
ls /usr/share/nmap/scripts/smb/*
```
NBTSCAN
```
nbtscan -r 192.168.241.0/24
```
Net View
```
Net view \\dc01 /all
```
smbclient
```

```
enum4linux
```
enum4linux 192.168.241.9 
```
crackmapexec
```
crackmapexec smb 192.167.241.13 --shares -u '' -p ''
```





# SMTP
script
```
python3 smtp.py root 192.168.241.8
```
manual
```
VRFY ROOT
```
# SNMP
nmap
```
sudo nmap -sU --open -p 161 192.168.241.1-254 -oG open-snmp.txt
```
snmp walk
```
snmpwalk -c public -v1 -t 10 192.168.241.151
snmpwalk -c public -v1 192.168.241.151 -Oa
```
# Scan with windows
Powershell
```
test-netconnection -port 25 192.168.241.50
```
Telnet
```
dism /online /enable-feature /featurename:telnetclient
```
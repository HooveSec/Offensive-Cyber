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


nmap --script smb-enum-shares -p139,445 192.168.250.10
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
smbclient -N -L \\\\192.168.250.10
smbclient -U "anonymous" \\\\192.168.250.10\offsec
```
enum4linux
```
enum4linux 192.168.241.9 -A
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
swaks
```
swaks -s 192.168.220.199 -p 25 -t test@supermagicorg.com -f off.sec@supermagicorg.com --header "Subject:re" --protocol ESMTP -a -au test@supermagicorg.com -ap test --body "body" --attach automatic_configuration.lnk --attach config.Library-ms --suppress-data
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
#account names
snmpwalk -c public -v1 -t 10 192.168.241.151 1.3.6.1.4.1.77.1.2.25
# processes
snmpwalk -c public -v1 -t 10 192.168.241.151 1.3.6.1.2.1.25.4.2.1.2
# tcp listening ports
snmpwalk -c public -v1 -t 10 192.168.241.151 1.3.6.1.2.1.6.13.1.3
```
onesixtyone 
```
onesixtyone -c community -i ips 
```
Make your strings
```
echo public > community
echo private >> community
echo manager >> community
```

# RPC 
rpcmap
impacket

rpcclient
	enumdomusers
	enumlsgroups domain|builtin
	lsaenumsid
	lookupnames <name/sid>
	lookupsids <sid>
	srvinfo






# Scan with windows
Powershell
```
test-netconnection -port 25 192.168.241.50
```
Telnet
```
dism /online /enable-feature /featurename:telnetclient
```















# NMAP NSE Vuln Scans
location
```
/usr/share/nmap/scripts/script.db
```
script
```
sudo nmap -sV -p 443 --script "vuln" 192.168.241.151
```
Download new script
```
vim /usr/share/nmap/scripts/http-vuln-cve2021-41773.nse
sudo nmap --script-updatedb
```
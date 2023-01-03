## Information Gathering

## Network Services
	## Scanning 
		Banner grab - nc -nv 10.129.42.253 21 
		All Ports - nmap -sV -sC -p- 10.129.42.253
	## SMB
		SMB Shares(no pass) - smbclient -N -L \\\\10.129.42.253
		Connect to SMB Share - smbclient \\\\10.129.42.253\\users
		Connect to SMB with user - smbclient -U bob \\\\10.129.42.253\\users
	## SNMP  
		SNMP Public - snmpwalk -v 2c -c public 10.129.42.253 1.3.6.1.2.1.1.5.0
		SNMP Private - snmpwalk -v 2c -c private  10.129.42.253 
		SNMP Bruteforce - onesixtyone -c dict.txt 10.129.42.254
	## Web
		Gobuster - gobuster dir -u http://10.10.10.121/ -w usr/share/dirb/wordlists/common.txt
		Nikto - nikto -host http://10.10.10.121
		Banner Grab - curl -IL https://www.inlanefreight.com
		Webserver version/framework/application - whatweb 10.10.10.121
		^^ but network - whatweb --no-errors 10.10.10.0/24
	## DNS
		Get Seclists - git clone https://github.com/danielmiessler/SecLists
		^^ - sudo apt install seclists -y
		add dns server such as 1.1.1.1 to /etc/resolv.conf
		gobuster dns - gobuster dns -d inlanefreight.com -w usr/share/SecLists/Discovery/DNS/namelist.txt
		
### CVE Scans
	Eternalblue - nmap --script smb-os-discovery.nse -p445 10.10.10.40


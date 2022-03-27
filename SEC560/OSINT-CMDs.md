# OSINT command-line 

## DIG
- dig sans.org
### Specify DNS Server
- dig @8.8.8.8 sans.org 
### Specify Record
- dig @8.8.8.8 sans.org MX
- dig @8.8.8.8 sans.org A
- dig @8.8.8.8 sans.org PTR
### DNS Zone Transfer(Quite rare but possible inside)
- dig @10.10.10.60 sans.org -t AXFR
## DNSRecon
- dnsrecon -d sans.org -t type
### Output to XML or SQLite database
- dnsrecon -d sans.org -t type --xml
- dnsrecon -d sans.org -t type --db
### Perform deep whois and reverse lookup
- dnsrecon -d sans.org -n 8.8.8.8 -w
### Reverse Lookup
- dnsrecon -d sans.org -n 8.8.8.8 -r 204.51.94.0/24
## DNSdumpster(group by ASN)
- https://dnsdumpster.com 
## Shodan.io 
- https://shodan.io
## Hunter.io
- https://hunter.io 
## Builtwith(identify underlying OS ie wordpress/sharepoint)
- https://builtwith.com
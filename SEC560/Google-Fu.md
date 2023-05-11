# GoogleFu

## Company Jobs/Applicable Hardware/Software
- site:[domain] careers
- site:[domain] jobs
- site:[domain] openings
- search monster.com

## Sites and links
### Within the domain 
- site:sans.org "web app"
### Page title matching search critera
- intitle:index.of passwd
- intitle:index.of viewtopic.php 
### URL matches search criteria 
- inurl:viewtopic.php
### File types
- site:counterhack.net filetype:ppt
- site:counterhack.net filetype:ppt[x]
- site:counterhack.net ppt 

## Google-Hacking-Database
- https://www.exploit-db.com/google-hacking-database



**Footholds**
Consider GHDB-ID: 6364 as it uses the query intitle:"index of" "nginx.log" to discover Nginx logs and might reveal server misconfigurations that can be exploited.
**Files Containing Usernames**
For example, GHDB-ID: 7047 uses the search term intitle:"index of" "contacts.txt" to discover files that leak juicy information.
**Sensitive Directories**
For example, consider GHDB-ID: 6768, which uses the search term inurl:/certs/server.key to find out if a private RSA key is exposed.
**Web Server Detection**
Consider GHDB-ID: 6876, which detects GlassFish Server information using the query intitle:"GlassFish Server - Server Running".
**Vulnerable Files**
For example, we can try to locate PHP files using the query intitle:"index of" "*.php", as provided by GHDB-ID: 7786.
**Vulnerable Servers**
For instance, to discover SolarWinds Orion web consoles, GHDB-ID: 6728 uses the query intext:"user name" intext:"orion core" -solarwinds.com.
**Error Messages**
Plenty of useful information can be extracted from error messages. One example is GHDB-ID: 5963, which uses the query intitle:"index of" errors.log to find log files related to errors.

filetype:xls site:clinic.thmredteam.com

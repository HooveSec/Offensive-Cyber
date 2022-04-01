# Masscan
- masscan -p22,445,3389 --rate 15000 10.0.0.0/8
- masscan -p22,445,3389 --rate 10000 10.0.0.0/8
## Scan into Binary
- masscan -p0-65535 --rate 15000 -oB myscan.mass 10.0.0.0/8
### Convert to xml then
- masscan --readscan myscan.mass -oX myscan.xml
## Extract live hosts and ports
- masscan --open --readscan myscan.mass -oG myscan.grep
### Live hosts 
- grep /open/ myscan.grep | cut -d ' ' -f 2 | sort -uV > myscan-hosts.txt
### All ports 
- grep /open/ myscan.grep | cut -d ' ' -f 4 | cut -d / -f 1 | sort -nk 1 | uniq > myscan-ports.txt 
### All systems with port 80 
- grep ' 80/open' myscan.grep | cut -d' ' -f 2 | sort -uV > myscan-80.txt 
### All live and open ports/hosts 
- grep /open/myscan.grep | cut -d/ -f 1 | cut -d ' '  -f 2,4 | sed -e 's//:/g' | sort -uV > myscan-host-port.txt 
## Exercise 
### Block reset packets 
- sudo iptables -A INPUT -p tcp --dport 55555 -j DROP
### Scan 
- sudo masscan --ports 0-65535 --rate 15000 --src-port=55555 -oB local.masscan 127.0.0.1
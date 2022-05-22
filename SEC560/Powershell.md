# Powershell

## Commands
	ls -recurse or ls -r 
	ps | format-list -property name, id, starttime 
	ps | format-list -property *
	ps -name nc | % { Write-host "PID is: " $_.ID }
	100, 200, 500 | % {$_ * 50}
	get-service | ? {$_.status -eq "running"}
	get-service | select servicename,displayname | gm
	get-childitem -recurse C:\ "password.txt" | % {echo $_.fullname}
	ls -r C:\windows hosts | % {echo $_.fullname}
	echo $Home
	echo $env:PROCESSOR_ARCHITECTURE
	select-string -path  C:\users\*.txt -pattern password
	ls -r C:\isers | % {select-stromg -path $_ -pattern password} 2>$null
	(1..10).count 
	(ls).count 
	1..10 | % {echo $_}
	1..255 | % {ping -n 1 10.10.10.$_ | sls ttl}
	1..1024 | % {echo ((new-object Net.Sockets.TcpClient).Connect("10.10.10.10".$_)) "Port $_ is open" } 2>$null 
### Ping Sweep 
	1..60 | % { echo $_; ping -n 1 -w 100 10.10.10.$_ | select-string ttl }
### Ping Sweep then port scan
	70..90 | % {echo $_; echo ((new-object Net.Sockets.TcpClient).Connectt("10.10.10.50", $_)) "Port $_ is open } 2>$null
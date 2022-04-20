# Remote Schtasks
- schtasks /create /tn callback /s 127.0.0.1 /u user /p password /sc hour /st 02:00:00 /sd 04/21/2022 /tr cmd.exe
- schtasks /query /s 127.0.0.1
# Windows Survey
```
whoami
whoami /groups
powershell -c get-localuser
powershell -c get-localgroup
powershell -c get-localgroupmember administrators
systeminfo 
ipconfig /all
route print
netstat -ano 
# powershell 
Get-ItemProperty "HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\*" | select displayname

Get-ItemProperty "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\*" | select displayname"

get-process
get-rpocess -name "nonstandardprocess" | format-list * 
# Keepass/PW Database files
powershell -c "gci -path C:\ -Include *.kdbx -File -Recurse -ErrorAction SilentlyContinue"
# xampp
powershell -c "gci -path C:\xampp -Include *.txt,*.ini -File -Recurse -ErrorAction SilentlyContinue"
# Search user for stuff
powershell -c "gci -Path C:\Users\ -Include *.txt,*.pdf.*.xls,*.xlsx,*.doc.*.docx -File -Recurse -ErrorAction SilentlyContinue"
net user steve
## recheck what you can access


# PS History
get-history
(get-psreadlineoption).HistorySavePath

```
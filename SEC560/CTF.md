10.130.9.0/24
10.130.10.0/24
10.130.11.0/24
10.130.12.0/24
10.130.13.0/24



# Nine Network 

## Lay of land - Web
	nmap -sV -oA initial 10.130.9.0/24
	2 web hosts
## Web Recon
	http://10.130.9.39/robots.txt
	http://10.130.9.39/robots.txt
## Find U ser
	SEC560{UseTheSourceErik}
	inspect element
## Lay of Land - SMB & SSH
		nmap -sV -oA initial 10.130.9.0/24
## Where is hte DC?
	10.130.9.10 
	ldap, 3389, 445, 389
## Valid Credentials
	hydra -L users.txt -P passwords.txt 10.130.9.10 smb2
## SPN

## SQL Account Password

## Access the Server

## Darn Defaults

## Who is Real

## To the cloud

## M365 Email 2

## M365 Email 3

## On the DC

## On Desktop

## On desktop

## Dev server

## admin access on web server 

## Shell on web server

## Another Database Server (root)

## Another Database Server (data)

## Backup Server

## db03

## Question 1
	10.130.x.x
## Question 2
	23
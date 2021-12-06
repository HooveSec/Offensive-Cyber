#!/bin/bash
## Version 1.0 doesn't prompt for user input
##for i in {1..254} ;do (ping -c 1 192.168.1.$i | grep "bytes from" &) ;done

##Version 2.0
echo "Enter Network Address First 3 Octets"
read net
for i in {1..254} ;do (ping -c 1 $net.$i | grep "bytes from" &) ;done

##Version 3.0 enter range to ping from
##TBT

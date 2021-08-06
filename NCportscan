#!/bin/bash
echo "Enter network address first 3 octets (e.g.192.168.0.):"

read net

echo "Enter starting host range (e.g. 10):"

read start

echo "Enter ending host range (e.g. 254):"

read end

echo "Enter ports space delimited (e.g. 20 22 23):"

read ports

for ((i=$start; $i<=$end; i++))

do

	nc -nvzw1 $net.$i $ports 2>&1 |grep open

done



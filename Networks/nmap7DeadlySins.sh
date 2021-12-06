#!/bin/bash

echo "Enter Network Addresses First 3 Octets: IE 192.168.1"
read net

echo "Reply V for Version, U for UDP, S for SYN, T for Connect, F for FIN STEALTH, X for XMAS TREE, P for PING"
read choice

if [ $choice="V" ]
        then
                nmap -sV $net.0/24 --version-light -O -oN nmapVER.txt
        fi
if [ $choice="U" ]
        then
                nmap -sU $net.0/24 --version-light -O -oN nmapUDP.txt
        fi
if [ $choice="S" ]
        then
                nmap -sS $net.0/24 --version-light -O -oN nmapSYN.txt
        fi
if [ $choice="P" ]
        then
                nmap -sP $net.0/24 --version-light -O -oN nmapPING.txt
        fi

if [ $choice="X" ]
        then
                nmap -sX $net.0/24 --version-light -O -oN nmapTREE.txt
        fi

if [ $choice="F" ]
        then
                nmap -sF $net.0/24 --version-light -O -oN nmapFIN.txt
        fi

if [ $choice="T" ]
        then
                nmap -sT $net.0/24 --version-light -O -oN nmapCNCT.txt
        fi

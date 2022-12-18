function PortScanner($ip, $ports) {
    # Loop through the list of ports
    foreach ($port in $ports) {
        # Try to create a TCP connection to the target IP and port
        try {
            $tcpClient = New-Object System.Net.Sockets.TcpClient
            $tcpClient.Connect($ip, $port)
            # If the connection is successful, the port is open
            Write-Output "Port $port is open"
            # Close the connection
            $tcpClient.Close()
        }
        catch {
            # If there is an error, the port is likely closed
            continue
        }
    }
}

# Test the port scanner

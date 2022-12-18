package main

import (
	"fmt"
	"net"
	"time"
)

func main() {
	// Set the IP address and port range to scan
	ip := "TARGET_IP_ADDRESS"
	startPort := 1
	endPort := 65535

	// Loop through the port range and try to establish a connection to each port
	for port := startPort; port <= endPort; port++ {
		// Create a connection string in the format "IP:PORT"
		connString := fmt.Sprintf("%s:%d", ip, port)

		// Try to establish a connection to the current port
		conn, err := net.DialTimeout("tcp", connString, time.Millisecond*100)
		if err == nil {
			// The connection was successful, so the port is open
			fmt.Printf("Port %d is open\n", port)
			conn.Close()
		}
	}
}

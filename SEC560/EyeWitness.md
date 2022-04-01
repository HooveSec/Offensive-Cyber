# Eyewitness
- https://github.com/fortynorthsecurity/eyewitness
## Targets(One per line) 
- -f <filename>
- -x <file.xml>
## Usage
- nmap -PS80,443,8080 -p 80,443,8080 10.10.10.0/24 -oA webservers
- /opt/Eyewitness/Python/Eyewitness.py --web -x webservers.xml 

# binary transfers
- cat file | base64 
- cat file | gzip | base64 
- echo "64" | base64 -d | gzip -d > file
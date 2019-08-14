Set WshShell = CreateObject("WScript.Shell") 
WshShell.Run chr(34) & "H:\path\to\autoSyncDirectories.bat" & Chr(34), 0
Set WshShell = Nothing
# autoSyncDirectories

Use `Rsync` in windows to mirror directories. (Require bash for windows)

## Bash file: `.sh`

This file contain the commands to run `Rsync`:

```{shell}
#!/bin/bash
while inotifywait -r -e modify,create,delete /source; do
    rsync -vvha --no-p --omit-dir-times --max-size=100m --exclude-from='path/to/excludedFiles.txt' --delete --delete-excluded /source /destination
done
```

## Batch file: `.bat`

This file launch `bash` and execute the previous file.

```{batch}
@ECHO OFF
bash /path/to/file/linux/format/autoSyncDirectories.sh
```

To access to windows file from bash: `/mnt/c/` (for the `C:` disk)

## VBScript file: `.Vbs`

This file launch the `bat` file in background.

```{Vbs}
Set WshShell = CreateObject("WScript.Shell") 
WshShell.Run chr(34) & "path\to\file\windows\format\autoSyncDirectories.bat" & Chr(34), 0
Set WshShell = Nothing
```

This file can be placed in the `startup` folder so that it will be executed at the start of the computer.

## Exclude certain files

List of exclusion can be found in the file `excludedFiles.txt`.
All files finishing by `_excl` will be excluded.

```{}
*_excl
.Rproj.user
.git
```

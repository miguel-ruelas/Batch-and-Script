REM Action.exe begins download of excel file in another computer and saves it to network drive, wait loop till done
ECHO
start /wait "C:\Action(s).exe" "C:\OtherAction.exe"
:WAITLOOP
tasklist /FI "IMAGENAME eq ProcessName.exe" 2>NUL | find /I /N "ProcessName.exe">NUL
if "%ERRORLEVEL%"=="0" goto RUNNING
goto NOTRUNNING

:RUNNING
ping 127.0.0.1 -n 30
goto WAITLOOP

REM Acess the network drive, prepare excel file for import
:NOTRUNNING
echo its over
"C:\ChangedDirNetFolder\MoveImportFile.CMD"
net use Y: "\\SERVER1\Map\NetworkFolder"
y:

REM Rename the file to be name needed by powershell script
for %%f in (*.xls) do rename "%%f" "import.xls"

@set /p ScriptName=What's the name of your PowerShell script? : 
powershell -command "Z:\ED.ps1"

ping 127.0.0.1 -n 30

REM Excel is ready for import, run the Import Script
"C:\IMPORT.CMD"
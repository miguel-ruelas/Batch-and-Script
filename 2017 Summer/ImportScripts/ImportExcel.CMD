net use Y: "\\SERVER1\Map\NetworkFolder"
move "Y:\import.xls" ""Y:\Edited"
ping 127.0.0.1 -n 5

"C:\Import.exe"

ping 127.0.0.1 -n 10
Y:
CD Y:\Edited\

for /F "tokens=2" %%i in ('date /t') do set mydate=%%i
set mytime=%time::=%
set M=%mytime:.=%
ping 127.0.0.1 -n 5

set "D=%date%"
echo "%D%"
set "DAY=%D:~0,3%"
echo "%DAY%"
set "MONTH=%D:~4,2%"
echo "%MONTH%"
set "DAYM=%D:~7,2%"
echo "%DAYM%"
set "YEAR=%D:~10,4%"
echo "%YEAR%"




rename "import.xls" "%MONTH%-%DAYM%-%YEAR%-%M%-imported.xls"

move "Y:\Edited\*.xls" ""Y:\Edited\imported"

@echo off
exit
@echo off
echo.
REM display path used to search for executables in their own line
for %%G in ("%path:;=" "%") do @echo %%G 
echo.
pause
echo.
REM display the ip address of FIU.EDU
nslookup fiu.edu | findstr/n ^^| findstr "^[4-5]: " 
echo.
pause
echo.
REM Display active connections
netstat -a 
echo.
pause
echo.
REM Display all routers used to get to google.com
tracert google.com
echo.
pause
echo.
REM Display local IP Addresses
ipconfig |find "IPv4" 
ipconfig |find "IPv6" 
echo.
pause


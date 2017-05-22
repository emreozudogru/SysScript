@echo off
TITLE IZU DOMAIN SCRIPT
cls

echo.
:START
dsquery * DC=izu,DC=edu,DC=tr -filter "(objectcategory=computer)" -limit 999999 -attr name > domaincomputers3.txt

:LABFOR
FOR /f %%i IN ( domaincomputers3.txt ) DO (
set ERRORLEVEL=
ping %%i.izu.edu.tr -n 1 -w 100 >>PING.txt 
if not ERRORLEVEL == 1 (
echo. 
echo %%i Ayarlaniyor...
echo.
START /min C:\FILE\SCRIPT\PsExec64.exe \\%%i.izu.edu.tr -s -d cleanmgr /verylowdisk
)
)
)

:END
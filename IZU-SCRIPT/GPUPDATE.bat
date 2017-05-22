@echo off
TITLE IZU LAB LOGICY INSTALL
cls
echo.
SET TUR=R
SET SURE=0
dsquery * DC=izu,DC=edu,DC=tr -filter "(objectcategory=computer)" -limit 999999 -attr name > domaincomputers.txt
FOR /f %%i IN ( domaincomputers.txt ) DO (
set ERRORLEVEL=
ping %%i.izu.edu.tr -n 1 -w 100 >>PING.txt 
if not ERRORLEVEL == 1 (
echo %%i Ayarlaniyor...
echo %%i ACIK %date%-%time% >>acik.txt
rem C:\FILE\SCRIPT\PsExec64.exe \\%%i.izu.edu.tr -d -s gpupdate /force /boot /logoff
START /MIN C:\FILE\SCRIPT\PsExec64.exe \\%%i.izu.edu.tr -d -s gpupdate
  )
  )

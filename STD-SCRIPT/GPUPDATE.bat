@echo off
TITLE IZU LAB LOGICY INSTALL
cls
echo.
SET TUR=R
SET SURE=0
rem dsquery * OU=LAB1,OU=Bilgisayar,OU=Ogrenci,DC=std,DC=izu,DC=edu,DC=tr -filter "(objectcategory=computer)" -limit 999999 -attr name > domaincomputers.txt
dsquery * DC=std,DC=izu,DC=edu,DC=tr -filter "(objectcategory=computer)" -limit 999999 -attr name > domaincomputers.txt
FOR /f %%i IN ( domaincomputers.txt ) DO (
set ERRORLEVEL=
ping %%i.std.izu.edu.tr -n 1 -w 100 >>PING.txt 
if not ERRORLEVEL == 1 (
echo %%i Ayarlaniyor...
echo %%i ACIK %date%-%time% >>acik.txt
start /min C:\FILE\SCRIPT\PsExec64.exe \\%%i.std.izu.edu.tr -d -s gpupdate /force /boot /logoff
  )
  )

@echo off
TITLE IZU DOMAIN SCRIPT
cls
echo.
:START
dsquery * OU=PUBLIC,OU=Bilgisayar,OU=Ogrenci,DC=std,DC=izu,DC=edu,DC=tr -filter "(objectcategory=computer)" -limit 999999 -attr name > domaincomputers2.txt
:LABFOR
FOR /f %%i IN ( domaincomputers2.txt ) DO (
set ERRORLEVEL=
ping %%i.std.izu.edu.tr -n 1 -w 1000 >>PING.txt 
if not ERRORLEVEL == 1 (
echo. 
echo %%i Ayarlaniyor...
echo.
start /min C:\FILE\SCRIPT\DelProf2.exe -u -c:\\%%i.std.izu.edu.tr
)
)
)
rem GOTO START
:END
@echo off
TITLE IZU DOMAIN SCRIPT
cls
SET TUR=R
SET SURE=0
echo.
:START
dsquery * OU=Bilgisayar,OU=Ogrenci,DC=std,DC=izu,DC=edu,DC=tr -filter "(objectcategory=computer)" -limit 999999 -attr name > domaincomputers2.txt
:LABFOR
FOR /f %%i IN ( domaincomputers2.txt ) DO (
set ERRORLEVEL=
ping %%i.std.izu.edu.tr -n 1 -w 1000 >>PING.txt 
if not ERRORLEVEL == 1 (
echo. 
echo %%i Ayarlaniyor...
echo.
SHUTDOWN -%TUR% -T %SURE% -M \\%%i.std.izu.edu.tr
)
)
)
REM GOTO START
:END
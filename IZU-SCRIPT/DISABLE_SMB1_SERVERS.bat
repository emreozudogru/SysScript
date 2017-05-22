@echo off
TITLE IZU DOMAIN SCRIPT
cls

echo.
:START
dsquery * OU=Sunucu,OU=BT,DC=izu,DC=edu,DC=tr -filter "(objectcategory=computer)" -limit 999999 -attr name > domaincomputers2.txt

:PRERESTART
FOR /f %%i IN ( domaincomputers2.txt ) DO (
set ERRORLEVEL=
ping %%i.izu.edu.tr -n 1 -w 1000 >>PING.txt 
if not ERRORLEVEL == 1 (
echo. 
echo %%i Ayarlaniyor...
echo.
SHUTDOWN -R -T 0 -M \\%%i.izu.edu.tr 
)
)
)

:INSTALL
FOR /f %%i IN ( domaincomputers2.txt ) DO (
set ERRORLEVEL=
ping %%i.izu.edu.tr -n 1 -w 1000 >>PING.txt 
if not ERRORLEVEL == 1 (
echo. 
echo %%i Ayarlaniyor...
echo.
C:\FILE\SCRIPT\PsExec64.exe \\%%i.izu.edu.tr -s Dism /Online /Disable-Feature /FeatureName:SMB1Protocol /Quiet
)
)
)



:END
@echo off
TITLE IZU DOMAIN SCRIPT
cls

echo.
:START
dsquery * OU=Bilgisayarlar,DC=izu,DC=edu,DC=tr -filter "(objectcategory=computer)" -limit 999999 -attr name > domaincomputers2.txt


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

:LABFOR
FOR /f %%i IN ( domaincomputers2.txt ) DO (
set ERRORLEVEL=
ping %%i.izu.edu.tr -n 1 -w 1000 >>PING.txt 
if not ERRORLEVEL == 1 (
echo. 
echo %%i Ayarlaniyor...
echo.
C:\FILE\SCRIPT\PsExec64.exe \\%%i.izu.edu.tr -s \\elma.izu.edu.tr\AutoDeploy\Windows_Update\UpdateInstaller.cmd
timeout 120
)
)
)

:END
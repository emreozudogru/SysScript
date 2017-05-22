@echo off
TITLE IZU DOMAIN SCRIPT
cls

echo.
:START
dsquery * DC=std,DC=izu,DC=edu,DC=tr -filter "(objectcategory=computer)" -limit 999999 -attr name > domaincomputers2.txt



:DETECT
FOR /f %%i IN ( domaincomputers2.txt ) DO (
set ERRORLEVEL=
ping %%i.std.izu.edu.tr -n 1 -w 100 >>PING.txt 
if not ERRORLEVEL == 1 (
echo. 
echo %%i Ayarlaniyor...
echo.

C:\FILE\SCRIPT\PsExec64.exe \\%%i.std.izu.edu.tr -s wuauclt /detectnow
)
)
)



:REPORT
FOR /f %%i IN ( domaincomputers2.txt ) DO (
set ERRORLEVEL=
ping %%i.std.izu.edu.tr -n 1 -w 100 >>PING.txt 
if not ERRORLEVEL == 1 (
echo. 
echo %%i Ayarlaniyor...
echo.
C:\FILE\SCRIPT\PsExec64.exe \\%%i.std.izu.edu.tr -s wuauclt /reportnow
)
)
)

:UPDATE
FOR /f %%i IN ( domaincomputers2.txt ) DO (
set ERRORLEVEL=
ping %%i.std.izu.edu.tr -n 1 -w 100 >>PING.txt 
if not ERRORLEVEL == 1 (
echo. 
echo %%i Ayarlaniyor...
echo.
C:\FILE\SCRIPT\PsExec64.exe \\%%i.std.izu.edu.tr -s wuauclt /updatenow
)
)
)
:END
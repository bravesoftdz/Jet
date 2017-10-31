@echo off
:A
cls
echo.................
echo......MSN........
echo.................
set /p n=User:
set /p m=Message:
net send %n% %m%
pause
Goto A
:: Turning echo off to do not display command itself on terminal
@echo OFF
:: dont put spaces between variable and value
SET name=Harsh

ECHO %name%

SETLOCAL
SET var2=var2 is a local variable
echo %var2%
ENDLOCAL
PAUSE
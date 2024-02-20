@echo off

CALL :greetings
CALL :greetings Hello

CALL :square a b
echo The parameter list is %a%, %b%

EXIT /B %ERRORLEVEL%


:greetings
SET n=%~1%
IF NOT DEFINED n (SET n=Harsh)
ECHO My name is %n%

:: termination or proper exit of the functions.
EXIT /B 0


:square
SET %~1%=10
SET %~2%=20
EXIT /B 0
@echo off

:: Shutdown in 0 seconds
SHUTDOWN /s /f /t 0
SHUTDOWN /p

:: Log off
SHUTDOWN /l

:: Hibernate
SHUTDOWN /h

:: Reboot
SHUTDOWN -r -t 10

ECHO "Choose an option .."
ECHO "1 = Logoff"
ECHO "2 = Reboot"
ECHO "3 = Hibernate"
ECHO "4 = Shutdown"

SET /p option=Choose one option -

IF %option%==1 SHUTDOWN /l
IF %option%==2 SHUTDOWN -r -t 10
IF %option%==3 SHUTDOWN /h
IF %option%==4 SHUTDOWN /s /f /t 0

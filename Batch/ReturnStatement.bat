@echo off

::  Exit Code/Error Code	Details/Description
::  0	                    Program successfully executed.
::  1	                    Incorrect function. Indicates that Action has attempted to execute non-recognized command in Windows command prompt cmd.exe.
::  2	                    Indicates that the system cannot find the file in that specified location.
::  3	                    Indicates that the system cannot find the specified path.
::  5	                    Access is denied. So the user has no access right to specified resource.
::  9009
::  0x2331	                Program is not recognized as an internal or external command, operable program or batch file. Indicates that command, application name or path has been misspelled when configuring the Action.
::  3221225477
::  0xC0000005
::  -1073741819	            Access violation. Indicates that the executed program has terminated abnormally or crashed.
::  3221225495
::  0xC0000017
::  -1073741801	            Not enough virtual memory is available. Indicates that Windows has run out of memory.
::  3221225786
::  0xC000013A
::  -1073741510	            The application terminated as a result of a CTRL+C. Indicates that the application has been terminated either by user’s keyboard input CTRL+C or CTRL+Break or closing command prompt window.
::  3221225794
::  0xC0000142
::  -1073741502	            The application failed to initialize properly. Indicates that the application has been launched on a Desktop to which current user has no access rights. Another possible cause is that either gdi32.dll or user32.dll has failed to initialize.
::  221225495
::  0xC0000017
::  -1073741801	            Not enough virtual memory is available. It indicates that Windows has run out of memory.
::
::  3221226505
::  0xC0000409
::  -1073740791	            Stack buffer overflow / overrun. Error can indicate a bug in the executed software that causes stack overflow, leading to abnormal termination of the software.
::  3762507597
::  0xE0434F4D
::  -532459699	            Unhandled exception in .NET application. More details may be available in Windows Event log.

IF %ERRORLEVEL% NEQ 0 Echo An error was found
IF %ERRORLEVEL% EQU 0 Echo No error found

:: Return 0 if file is found, otherwise return 9
IF EXIST D:/abc.txt EXIT 9
EXIT 0
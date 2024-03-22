rem 1.	Create a menu and display it. The user will select one of the menu option depending on the option selected a DOS command should be executed. Menu should contain the following:
rem o	List all files.
rem o	Create a directory.
rem o	Display today’s date and time.
rem o	Make abc.txt file as read-only
rem o	Exit from menu

@echo off
:Menu
cls

echo Menu:
echo a. List all files.
echo b. Create a directory.
echo c. Display today's date and time.
echo d. Make abc.txt file as read-only.
echo e. Exit from menu

setlocal enabledelayedexpansion

set /p choice=Enter Your choice:
set dirname=

if "%choice%"=="a" (dir
) else if "%choice%"=="b" (set /p dirname=Enter directory name:
	if not exist "!dirname!" (mkdir "!dirname!"
	    echo Directory "!dirname!" created successfully.
	) else (echo Directory "!dirname!" already exists.)
) else if "%choice%"=="c" (echo %date% %time%
) else if "%choice%"=="d" (attrib +r abc.txt
) else if "%choice%"=="e" (exit
) else (echo Invalid choice. Please try again.
)

endlocal
pause
goto Menu

rem 2.	Execute a C program from batch code
@echo Off
gcc.exe prog.c –o prog.exe

rem 3.	Display the arithmetic table
@echo off

:start

rem Get user input for N
echo Enter a positive integer for the arithmetic table:
set /p N=
echo Multiplication Table for %N%

:loop
set /a i=i+1
set /a result=i*%N%

echo %N% * %i% = %result%
if %i% lss 10 (goto loop)
echo.

:end

rem 4.	Create an employee table in database and insert records in it. This should be done by calling the SQL script from the batch code.
@echo off
REM Check if SQL*Plus is installed or not installed
where sqlplus> nul 2>&1
if %errorlevel% equ 0 (
    echo Executing SQL script...
    sqlplus darshil/darshil @script.sql
) else (echo SQL*Plus for Oracle is not installed.)

rem 5.	Call a batch program2 from another batch program1. Batch program2 should be creating a user MCA201 and also create its home path as C:\MCA2\MCA201.
rem userCreationCall.bat
@echo off
call userCreation.bat

rem userCreation.bat
@echo off
echo Creating user MCA201 and home path...
net user MCA201 /add
md C:\MCA2\MCA201

rem 6.	Copy all the .txt files from C:\D1 to three directories D:\D1, D:\D2, D:\D3.
@echo off
xcopy C:\D1\*.txt D:\D1\
xcopy C:\D1\*.txt D:\D2\
xcopy C:\D1\*.txt D:\D3\

rem 7.	Your current directory is C:\D1, which contains some batch code which involves another batch file lying in D:\D1 from batch program1 go to path of batch program2, execute it and come back to original path.
rem customCall.bat
@echo off
cd /d D:\D1
call custom.bat
cd /d C:\D1

rem custom.bat
@echo off
echo This is custom bat file in different path

rem 8.	Execute a batch code from a C program.
#include <stdlib.h>
int main() {
    system("demo.bat");
    return 0;
}

rem demo.bat
@echo off
echo This is demo batch file running from c code.

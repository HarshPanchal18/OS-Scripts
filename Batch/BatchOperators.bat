@echo off

REM ~	Tilde operator for shortening the long directory names.
REM !	Boolean NOT operator (negation)
REM –	unary minus operator

:: Arithmetic operators
REM +	Addition operator	Set /A 5+5 = 10
REM –	Subtraction operator	Set /A 10-5 = 5
REM %	Modulus operator	Set /A 5%2 = 1
REM /	Division operator	Set /A 20/2 = 10
REM *	Multiplication operator	Set /A 2*2 = 4
REM Precedenc of operators -> /  *  %  +  -

SET /A a = 2
SET /A b = 4
Set /A s = %a% + %b%
echo Sum = %s%

:: Relative operators
REM EQU	equal to	                x EQU y - Returns true if x is equal to y
REM NEQ	not equal to	            x NEQ y - Returns true if x is not equal to y
REM LSS	less than	                x LSS y - Returns true if x is less than y
REM LEQ	less than or equal to	    x LEQ y - Returns true if x is less than or equal to y
REM GTR	greater than	            x GTR y - Returns true if x is greater than y
REM GEQ	greater than or equal to	x GEQ y - Returns true if x is greater than or equal to y

SET /A m = 3
SET /A n = 4

if %m% EQU %n% echo m is equal to n
if %m% NEQ %n% echo m is not equal to n
if %m% LSS %n% echo m is less than n
if %m% LEQ %n% echo m is less than or equal to n
if %m% GTR %n% echo m is greater than n
if %m% GEQ %n% echo m is greater than or equal to n

:: Logical shift and re directional Operators
REM >>	Logical shift operator	command > filename - Append the output to a file
REM >	Re directional operator	command > filename - Redirect the output to a file
REM <	Re directional operator	command < filename - Redirect text to command

echo Writing to the test.txt file > Batch/test.txt
ping google.com >> Batch/googlePings.txt
sort < Batch/Numbers.txt

:: Bitwise Operators
REM &	Bitwise and operator
REM |	Bitwise or operator
REM ^	Bitwise exclusive or operator

:: Assignment Operators
REM +=	Set /A x = 4
REM -=	Set /A x = 4
REM *=	Set /A x = 4
REM /=	Set /A x = 4
REM %=	Set /A x = 4

:: Remaining Batch File Programming Operators
REM ,	Separator
REM &&	For using Multiple Commands
REM ||	For executing one from many commands
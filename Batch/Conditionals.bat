@echo off

SET /A a=2
SET /A b=3
SET name1=Rolls
SET name2=Royce

IF %a% EQU 2 echo The value is 2
IF %name2% EQU Royce echo Hi this is Royce

IF %a% EQU %b% (echo Numbers are equal) ELSE (echo Numbers are not equal)
IF %name1% EQU %name1% (echo Name is not same) ELSE (echo Name is not equal)

IF NOT DEFINED f (SET f=6)
echo %f%

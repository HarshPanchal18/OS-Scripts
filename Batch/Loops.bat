@echo off

FOR %%x in (1,2,3,4,5,6) DO ECHO %%x
FOR %%x in (1 2 3) DO ECHO %%x

:: (Lowerlimit, Step, Upperlimit)
FOR /L %%x IN (0,2,8) DO ECHO %%x

:: Reading file contents
FOR /F %%q IN (D:\TextBatch.txt) DO @ECHO %%q

:: Reading directory names
FOR /D %%y IN (D:\Books\*) DO @ECHO %%y
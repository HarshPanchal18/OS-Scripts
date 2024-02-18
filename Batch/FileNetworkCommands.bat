@echo off

:: Troubleshooting local network
NET

:: Create a new user
NET USER username password /add

:: Changing password
NET USER username *

:: Delete a user
NET USER username /delete

:: Information about the user
NET USER username

:: Asigning administrator role to the user
NET localgroup administrator username /add

:: Starting, stopping specific services(i.e. spooler) supported by the user
NET START service_name
NET STOP service_name

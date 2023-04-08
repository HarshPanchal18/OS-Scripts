#!/bin/bash

printf "Files and Directories:\n"
printf "%s\n" * # display the files and directories that are in current directory

printf "\n"

printf "display only directories:\n"
printf "%s\n" */ # display only directories of the curr. dir

printf "\n"

printf "%s\n" *.{txt,sh} # display files of given extension(s), remove { } if a single filetype

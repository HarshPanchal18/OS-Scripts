#!/bin/bash

if [[ -r array.sh ]]; then
    echo "Readable"
fi
if [[ -x array.sh ]]; then
    echo "Executable"
fi
if [[ -w array.sh ]]; then
    echo "Variable"
fi
if [[ -a array.sh ]];then
    echo "Appendable"
fi

#Looping through a file line by line

<<desc
Parameter       Details
IFS         Internal field separator
file        A file name/path
-r          Prevents backslash interpretation when used with read
-t          Removes a trailing newline from each line read by readarray
-d          DELIM Continue until the first character of DELIM is read (with read ), rather than newline
desc

while IFS= read -r line
do
    echo "$line"
done <Hello.txt

#If file may not include a newline at the end, then:

while IFS= read -r line || [ -n "$line" ]
do
    echo "$line"
done <Hello.txt

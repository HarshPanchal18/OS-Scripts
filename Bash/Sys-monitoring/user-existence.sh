#!/bin/bash

echo -e "Enter the username to check: \c"
read user

grep $user /etc/passwd > /dev/null

if [ $? -eq 0 ]
then
    grep $user /etc/passwd
    echo "$user exists on this machine "
else
    echo "Invalid username"
fi

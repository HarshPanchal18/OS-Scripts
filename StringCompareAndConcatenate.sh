#!/bin/bash

read -p "Enter string1: " str1

read -p "Enter string2: " str2

if [[ "$str1" == "$str2" ]]
then
    echo "$str1" and "$str2" are same
else
    echo "$str1" and "$str2" are not same
fi

str1+=$str2
echo Concatenated String is $str1

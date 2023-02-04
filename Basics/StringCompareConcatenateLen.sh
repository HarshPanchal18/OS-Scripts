#!/bin/bash

read -p "Enter string1: " str1

read -p "Enter string2: " str2

if [[ "$str1" == "$str2" ]]
then
    echo "$str1" and "$str2" are same
else
    echo "$str1" and "$str2" are different
fi

len1="${#str1}"
len2="${#str2}"

[[ "$len1" -eq "$len2" ]] && echo "$str1" and "$str2" have same lengths && exit

[[ "$len1" -ge "$len2" ]] &&  echo "$str1" is longer than "$str2" || echo "$str2" is longer than "$s1"

str1+=$str2
echo Concatenated String is $str1

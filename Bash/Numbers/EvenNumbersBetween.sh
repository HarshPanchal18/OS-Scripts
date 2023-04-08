#!/bin/bash

read -p "Enter first number:" n1

read -p "Enter second number:" n2

if [[ `expr $n1 % 2` == 1  ]]
then
    ((n1++))
else
    ((n1+=2))
fi

if [[ `expr $n2 % 2` == 1 ]]
then
    ((n2++))
fi

echo Even Numbers between $1 and $2 are
while [[ $n1 -lt $n2 ]]
do
    echo $n1
    ((n1+=2))
done

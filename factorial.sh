#!/bin/bash

echo Enter a number:
read num

b=1
i=1

while [ $i -le $num ]
do
    b=$[$b * $i]
    ((i++))
done
echo factorial of $num is $b                             

#!/bin/bash

echo "What's your name"
read name

echo "I'm $name"


echo "Enter a number: "
read no

if (("$no" + 5 > 91 )); then
        echo "$no is greater than 86"
elif (( "$no" + 5 < 86 )); then
        echo "$no is less than 86"
else
        echo "You entered 86"
fi

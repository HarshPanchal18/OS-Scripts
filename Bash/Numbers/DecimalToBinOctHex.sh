#!/bin/bash

read -p "Enter a Decimal: " n

echo 1 for Binary
echo 2 for Binary
echo 3 for Binary
echo

read -p "Enter your Choice: " ch

case $ch in
    1)
        b=$(echo "obase=2;$n" | bc)
        echo Binary format of $n is $b
        ;;
    2)
        o=$(echo "obase=8;$n" | bc)
        echo Octal format of $n is $o
        ;;
    3)
        h=$(echo "obase=16;$n" | bc)
        echo Hexa format of $n is $h
        ;;
    *)
        echo Invalid Choice...
        ;;
esac

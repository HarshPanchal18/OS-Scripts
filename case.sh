#!/bin/bash

var=1

case $var in
    1)
        echo "Antartica"
        ;;
    2)
        echo "Brazil"
        ;;
    3)
        echo "Canada"
        ;;
esac

#Antartica

#Case statement with fall through

var=1
case $var in
    1)
        echo "Antartica"
        ;&
    2)
        echo "Brazil"
        ;&
    3)
        echo "Canada"
        ;&
esac

#continue statement in case statement
<<op
Antartica
Brazil
Canada
op

#Fall through only if subsequent pattern(s) match

var=abs
case $var in
    a*)
        echo "Antartica"
        ;;&
    xyz)
        echo "Brazil"
        ;;&
    *b*)
        echo "Canada"
        ;;&
esac

#In the below example, the abc matches both first and third case but not the second case. So, second case is not executed.
<<op
Antartica
Canada
op

echo "Are you more than 18 years old??"
read age
case $age in
    y|Y|Yes|yes)
        echo "You're able to voting"
        ;;
    n|N|No|no)
        echo "You're not able to voting"
        ;;
esac

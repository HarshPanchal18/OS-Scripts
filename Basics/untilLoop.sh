#!/bin/bash

i=0

arr=(a b c d e f g h)

until [ $i -ge ${#arr[@]} ] ;
do
        echo ${arr[$i]}
        i=$((i+1))
done

i=0

printf "\n"

until (($i>= ${#arr[@]}));
do
        echo ${arr[$i]}
        ((i++))
done

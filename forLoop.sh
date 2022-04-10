#!/bin/bash

arr=( a,b,c,d,e ) # No space between var_name and var_value

for i in "${arr[@]}";
do
        echo "$i"
done

for((i=0;i<${#arr[@]};i++));
do
        echo "${arr[$i]}"
done

for i in {1..10};
do
#       echo "$i"
        printf "%d " "$i"
done                      

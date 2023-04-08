#!/bin/bash

arr=(a b c d e)
for i in "${arr[@]}";
do
        echo "$i"
        for j in "${arr[@]}";
        do
                echo "$j"
                break 2
        done
done


i=0


while [[ $i -lt 11 ]]  # -lt = less than
do
        if [[ "$i" == '5' ]] # space is mandatory
        then 
                echo "Loop Broken on Number $i"
                break
        fi
        echo $i
        ((i++))
done
echo "Done!"

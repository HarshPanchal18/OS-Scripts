#!/bin/bash

i=0

while [ $i -lt 10 ]
do
        echo "i is now $i"
        i=$[$i+1]
done


i=0
while [[ $i -lt 11 ]]
do      # -lt = less than
        if [[ "$i" == '5' ]] # space is mandatory
        then 
                echo "Loop Broken on Number $i"
                break
        fi
        echo $i
        ((i++))
done
echo "Done!"

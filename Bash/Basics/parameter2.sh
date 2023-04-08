#!/bin/bash

# loop through all arguments and check if they are files
for item in "$@"
do
if [[ -f $item  ]];then
    echo "$item is a file"
else
    echo "$item is not a file"
fi
done

<<op
./parameter.sh bash.sh array.sh para.sh      
bash.sh is a file
array.sh is a file
para.sh is not a file

./parameter.sh bash.sh array.sh whileLoop3.sh
bash.sh is a file
array.sh is a file
whileLoop3.sh is a file

op

#method 2
for (( i=1;i<=$#;++i))
do
    item=${@:$i:1}
    if [[ -f $item ]]
    then
        echo "$item is a file"
    else
        echo "$item is not a file"
    fi
done

<<op
./parameter.sh bash.sh array.sh para.sh
bash.sh is a file
array.sh is a file
para.sh is not a file
op

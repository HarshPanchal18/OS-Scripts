#!/bin/bash

#------------------------------------------
# Purpose: 
# Created Date:  Tuesday 24 May 2022 11:08:56 AM IST
# Author: Harsh Panchal

# Usage: 
#------------------------------------------

separator="--------------------------------------------------------------------"

help (){
    cat << EOF
    Show Detailed Information of file.
    Usage
    ----
    $0
    -i
        Show information
    -h
        Show this Help
EOF

}

checkNullInput(){
    if [ $# -eq 0 ]
    then
        echo "Error => No input"
        echo $separator
        help
        exit 1
    fi
}

checkInvalidInput(){
    if [[ ! $1 =~ ^\-.+  ]]
    then
        echo "Error -> Invalid input. Use flags"
        echo "$separator"
        exit 1
    fi
}

file_info(){
    file $file
    echo "$separator"
}

wcInfo(){
    echo "lines/words/characters"
    wc $file
    echo $separator
}

statInfo(){
  stat $file
  echo $separator
}

all_info(){
    echo "File info"
    echo $separator

    file_info
    wcInfo
    statInfo
}

main(){
    while getopts 'i:h' flag
    do
        case "${flag}" in
            i)
                file=${OPTARG}
                all_info $file ;;
            h)
                help ;;
        esac
    done
}

checkNullInput "$@"

checkInvalidInput "$@"

main "$@"

exit 0

# Usage
# ./fileInfo.sh -i Hello.txt

<<outputExample
File info
--------------------------------------------------------------------
Hello.txt: ASCII text
--------------------------------------------------------------------
lines-words-characters-filename
 4  4 26 Hello.txt
--------------------------------------------------------------------
  File: Hello.txt
  Size: 26              Blocks: 8          IO Block: 4096   regular file
Device: 801h/2049d      Inode: 1325270     Links: 1
Access: (0644/-rw-r--r--)  Uid: (    0/    root)   Gid: (    0/    root)
Access: 2022-05-27 11:42:33.100284135 +0530
Modify: 2022-05-04 13:55:41.303132242 +0530
Change: 2022-05-04 13:55:41.307134242 +0530
 Birth: 2022-05-04 13:55:41.303132242 +0530
--------------------------------------------------------------------

outputExample

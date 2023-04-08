#!/bin/bash

#------------------------------------------
# Purpose:
# Created Date:  Sunday 31 July 2022 05:51:43 PM IST
# © Author: Harsh Panchal

# Usage:
#------------------------------------------

#Safely delete file

FILES=$*
TRASHDIR=~/TRASH
[[ -d $TRASHDIR ]] || mkdir $TRASHDIR

#Archive a single file to the $TRASHDIR, gzipping if necessary
archive_file(){
    myfile=$1
    mimetype=$(file $myfile | awk '{print $2}')
    if [[ "$mimetype" != "application/x-gzip" ]]
    then
        gzip -c $myfile > $TRASHDIR/$(basename $myfile).gz
        rm -r $myfile
    else
        mv $myfile $TRASHDIR
    fi
}

delete_old_files(){
    find $TRASHDIR -mtime +2 -exec rm -vf '{}' \;
}

# for each argument passed as input,
# test if it's a file or directory, and if
# so, archive

for arg in $FILES
do
    # handle directories by creating a tar archive first,
    # so we can operate on it as a single file
    if [[ -d "$arg" ]]
    then
        tar -zvcf "$arg".tgz "$arg"
        archive_file "$arg".tgz
    elif [[ -f "$arg" ]]
    then
        archive_file "$arg".tgz
    else
        echo $arg is not  a file
    fi
done

delete_old_files

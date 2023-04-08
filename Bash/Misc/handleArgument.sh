#!/bin/bash

deploy=true
uglify=true

while (($1>1))
do 
    case $1 in
        --deploy) deploy="$2";;
        --uglify) uglify="$2";;
        *) break;
    esac;
done

$deploy && echo "Will deploy...= $deploy"
$uglify && echo "Will uglify...= $uglify"

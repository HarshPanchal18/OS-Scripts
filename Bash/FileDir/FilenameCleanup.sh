#!/bin/bash

usage="$(basename "$0") [-s <seperator>] [-d <textToDelete>] -p <pathToFile> -f <formatOfFiles>"

if [ "$1" == "-h" -o "$1" == "--help" ]; then
    echo "Usage: $usage"
    exit 1
fi

while [[ $# -gt 1 ]]; do
    key="$1"
    case "$key" in
        -s|--separator)
            SEPERATOR="$2"
            shift
            ;;
        -d|--delete)
            DELETE="$2"
            shift
            ;;
        -p|--path)
            PATH="$2"
            shift
            ;;
        -f|--format)
            FORMAT="$2"
            shift
            ;;
        *)
        ;;
    esac
    shift
done

for file in $FILES/*.$FORMAT
do
    echo $file
    new_name="${file/$DELETE/}"
    new_name="${new_name/\[*\]/}"
    new_name="${new_name//.$FORMAT/}"
    new_name="${new_name//$SEPARATOR/ }.$FORMAT"
    echo $new_name
    echo "---"
done

echo "Looks good? (Y/n):"
read answer

if [[ "$answer" == "Y" ]]; then
    for file in $FILES/*.$FORMAT
    do
        new_name="${file/$DELETE/}"
        new_name="${new_name/\[*\]/}"
        new_name="${new_name//.$FORMAT/}"
        new_name="${new_name//$SEPARATOR/ }.$FORMAT"
        mv "$file" "$new_name"
    done
    echo "Done!"
else
    echo 'Aborting...'
fi

<<README
A small bash script to clean up filenames.

usage
./cleanup.sh [-s <separator>] [-d <text to delete>] -p <path to files> -f <format of files>

example
$ ./cleanup.sh -s "_" -d "-archive" -p "~/dev/project" -f ".rb"
/Users/andrew/dev/file_1-archive[Dropbox].rb
/Users/andrew/dev/file 1.rb
---
/Users/andrew/dev/file_2-archive.rb
/Users/andrew/dev/file 2.rb
---
Looks good? (Y/n):
Y
Done!
README

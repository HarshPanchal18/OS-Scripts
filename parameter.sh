#!/bin/bash


# lead the userdefined parameters
while [[ $# > 0 ]]
do
    case $1 in
       -a|--valueA)
           valA="$2"
           shift
           ;;

       -b|--valueB)
           valB="$2"
           shift
           ;;

       --help|*)
           echo "Usage:"
           echo "  --valueA \"value\""
           echo "  --valueB \"value\""
           echo "  --help"
            exit 1
            ;;
    esac
    shift
done

echo "A: $valA"
echo "B: $valB"

<<op
./parameter.sh
A:
B:

./parameter.sh --valueB 4
A:
B: 4

./parameter.sh --valueB 4 --valueA "hello"
A: hello world
B: 4
op


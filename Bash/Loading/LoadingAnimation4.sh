#!/bin/bash

spinner=( Ooooo oOooo ooOoo oooOo ooooO )

copy() {
#    echo -ne ""
echo -ne  "Loading"
    spin &     # &  -run spin in background
    pid=$!     # PID of the last command

    for i in `seq 1 10`
    do
        sleep 1
    done

    kill $pid   # kill the spin process
    echo ""     # required in bash-shell
}

spin() {
    while [ 1 ]
    do
            echo -ne "." # -ne flag to avoid newline
            sleep 0.2
    done
}

#echo -ne "Loading"
copy # bouncing 'o' for 10 seconds

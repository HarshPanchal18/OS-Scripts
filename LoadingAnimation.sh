#!/bin/bash

spinner=( Ooooo oOooo ooOoo oooOo ooooO )

spin() {
    j=1
    while [[ $j -lt 11 ]]
    do
        for i in "${spinner[@]}"
        do
            echo -ne "\r$i" 
            sleep 0.2
        done
        ((j++))
        sleep 0.2
    done
}

spin

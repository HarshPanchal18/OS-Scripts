#!/bin/bash

# Purpose:
# Created Date:  Monday 23 May 2022 04:58:29 PM IST
# Author: Harsh Panchal

# Note

# START #

help(){
cat << EOF

usage: $(basename "$0") [enable | disable]

EOF
}

disableKeyboard(){
    xinput float "$keyboard_id"
}

enableKeyborad()
{
    xinput reattach "$keyboard_id" "$slave_pointer"
}

main()
{
    #Get the keyboard ID
    keyboard_id=$(xinput list | grep "AT Translated" | awk -F"=" '{print $2}' | awk '{print $1}')
    #Slave pointer to attach the keyboard on enable
    #Hard Coded bcoz it is not visible when the keyboard is disabled
    slave_pointer=3

    var="$1"
    if [[ $var == "disable" ]]
    then
        disableKeyboard
    elif [[ $var == "enable" ]]
    then
        enableKeyborad
    else
        echo "Unknown command"
        help
    fi
}

main "$@"
exit 0

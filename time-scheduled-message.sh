# A simple bash script to remind yourself of your goals/motivational quotes to keep yourself motivated.
# Additionally, you can even add this file to startup applications so that you won't have to start this script everytime.

#!/bin/bash

# Make a list of all your messages/quotes
declare -a arr=("message1/quote1" "message2/quote2")

# Find length of array
len=${#arr[@]}

# Specify the index of message from where you'd like to start
index=$((len-1))

# Specify the time delay between two consecutive reminders
sleep_time=3000

while true
do
    # Display the message/quote
    notify-send "${arr[$index]}"

    # Increment counter in circular way
    (( index=(index+1)%len ))

    sleep $sleep_time
done

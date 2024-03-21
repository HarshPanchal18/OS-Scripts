#!/bin/bash

# Display menu
echo "Shell Script Assignments Menu:"
echo "1. List files in current directory"
echo "2. Current username"
echo "3. Current date"
echo "4. Current time"
echo "5. Calendar"

read -p "Enter your choice (1-n): " choice # Get user choice

# Validate user input
if [[ ! $choice =~ ^[1-9]$ ]]; then
  echo "Invalid choice. Please enter a number between 1 and n."
  exit 1
fi

# Execute chosen script based on selection
case $choice in
  1)
    ls
    ;;
  2)
    whoami
    ;;
  3)
    date
    ;;
  4)
    date +%H:%M:%S
    ;;
  5)
    cal
    ;;
  *)
    echo "Invalid choice."
    ;;
esac

# Display the current date and time.
date

# Display the current date in words.
date +"Year: %y Month: %m Day: %d"

# Display the greetings message according to the system time.
current_hour=$(date +%H)
if [ $current_hour -ge 5 ] && [ $current_hour -lt 12 ]; then
    echo "Good morning!"
elif [ $current_hour -ge 12 ] && [ $current_hour -lt 17 ]; then
    echo "Good afternoon!"
else
    echo "Good evening!"
fi

# Display the list of files in the current directory.
ls

# Display the list of files in the directory as given by the user input
echo "Enter directory"
read dir
ls $dir

#	Display the list of files in the
#	Ascending order of filename
#	Descending order of size of file
#	Ascending order of time of time of creation

ls
ls -S
ls –t

# Given the file name, check whether it is a directory or an ordinary file or a system file or link to a file.
echo "Enter filename: "
read filename

if [ ! -e "$filename" ]; then
    echo "File '$filename' does not exist."
    exit 1
fi

if [ -f "$filename" ]; then
    echo "Regular file"
elif [ -d "$filename" ]; then
    echo "Directory"
elif [ -G "$filename" ]; then
    echo "System file"
elif [ -L "$filename" ]; then
    echo "Linked file"
fi;

# If a file is a link to a file. Display whether it is a hard link or soft link.
echo "Enter filename: "
read filename

if [[ -L "$filename" ]]; then
    if [[ -f "$filename" ]]; then
        echo "$filename is a soft link"
    else
        echo "$filename is a hard link"
    fi
else
    echo "$filename is not a link"
fi

# Display the name and size of file, which occupies
# Maximum diskspace
# Minimum diskspace
echo "Minimum"
ls -l | awk '{print $5, $9}' | sort -n | head -n 2 | tail -n 1 # Minimum
echo "Maximum"
ls -l | awk '{print $5, $9}' | sort -n | tail -n 1 # Maximum

# Given the filename, display the list of files which are
#	Hard link to the given file
#	Soft link to the given file
echo "Enter file name: "
read filename

if [[ ! -f "$filename" ]]; then
  echo "Error: File '$filename' does not exist."
  exit 1
fi

# Find hard links
find . -samefile "$filename" | grep -v "$filename"

#find . -type l -inum $(ls -i $filename | awk '{print $1}')


# Given the filename, the access privilege, the access privilege group, add or remove the access privilege on the given file for a given group.
echo "Enter filename: "
read filename

echo "Enter access privilege: "
read access_privilege

echo "Enter access privilege group: "
read access_privilege_group

echo "Enter add or remove: "
read add_or_remove

sudo chmod $add_or_remove $access_privilege $access_privilege_group $filename

# Display the list of users who are currently logged in.
who

# Given the username, find out whether the user is currently logged in or not.
echo “Enter username: “
read username
echo "Enter username: "
read username

user_listed=$(whoami | grep -w "$username")

if [[ -z "$user_listed" ]]; then
  echo "$username is not currently logged in."
else
  echo "$username is logged in."
fi

# Given the username, display the time elapsed, since the user is logged in.
echo "Enter username: "
read username

# Get the last login timestamp for the user (epoch seconds)
last_login_timestamp=$(who -b | grep "$username" | awk '{print $3,$4}')
last_login_timestamp=$(date +%s -d "$last_login_timestamp")

current_timestamp=$(date +%s)
elapsed_seconds=$((current_timestamp - last_login_timestamp))
days=$((elapsed_seconds / 86400))
hours=$(( (elapsed_seconds % 86400) / 3600 ))
minutes=$(( (elapsed_seconds % 3600) / 60 ))
seconds=$((elapsed_seconds % 60))

if [[ $days -gt 0 ]]; then
  echo "$username has been logged in for $days days, $hours hours, $minutes minutes, and $seconds seconds."
else
  echo "$username has been logged in for $hours hours, $minutes minutes, and $seconds seconds."
fi

# Display the count of users who are currently logged in.
user_count=$(whoami | head -n 1 | awk '{print $NF}')
echo "There are $user_count users currently logged in."

# Given the shell script. Make the shell script available to all the users of the system.
echo "Enter filename: "
read filename

sudo chmod ugo+r $filename
# or
sudo cp $filename /usr/share/public/

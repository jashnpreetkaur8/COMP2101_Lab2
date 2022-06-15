#!/bin/bash
#
# This script produces a dynamic welcome message
# it should look like
#   Welcome to planet hostname, title name!

# Task 1: Use the variable $USER instead of the myname variable to get your name
# Task 2: Dynamically generate the value for your hostname variable using the hostname command - e.g. $(hostname)
# Task 3: Add the time and day of the week to the welcome message using the format shown below
#   Use a format like this:
#   It is weekday at HH:MM AM.
# Task 4: Set the title using the day of the week
#   e.g. On Monday it might be Optimist, Tuesday might be Realist, Wednesday might be Pessimist, etc.
#   You will need multiple tests to set a title
#   Invent your own titles, do not use the ones from this example

###############
# Variables   #
###############
echo "Enter Your name : "
read user
hostname=$(hostname)
weekday=$(date +%A)
time=$(date +'%I:%M %p')
###############
# Main        #
case $weekday in  
    Sunday)  
        title="DJ !" 
        ;;  
    Monday)  
        title="Novice" 
        ;;  
    Tuesday)  
        title="Associate"
        ;;  
    Wednesday)  
        title="Competent" 
        ;;  
    Thursday)  
        title="Proficient"
        ;;  
    Friday)  
        title="Expert" 
        ;;         
    Saturday)  
        title="Master" 
        ;;     
    *)  
        echo 
        ;;  
esac  

###############

cat <<EOF

Welcome to planet $hostname, "$title $user!"

It is $weekday at $time.

EOF

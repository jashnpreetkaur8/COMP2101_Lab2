#!/bin/bash

####### Variables #########

#Fetching hostname with hostname command 
hostname=$(hostname)

#Fetching fully qualified domain name with the help of --fqdn flag
fqdn=$(hostname --fqdn)

#Fetching operating system name by splitting the line containing Operating keyword and then splitting by ':' delimeter to fetch the 
#	required output
os=$(hostnamectl | sed -n '/Operating/p' | cut -d ':' -f 2)

#Fetching ip address with the help of ip route to 1.1.1.1 through active connection adapter and the splitting the output with the help of #	"src" keyword from output. Again filtering it further to print the first set of text (i.e ip) with the help of awk.
ip=$(ip route get 1.1.1.1 | sed -n '/src/{s/.*src *//p;q}' | awk '{print $1}')

#Fetching the free space of /root directory with the help of stat command using %S flag to get its size in bytes. Later converting those #	bytes into GB and limiting it to 1 decimal place with the help of %.1f 
freespace=$(printf '%s' $(($(stat -f --format='%f*%S' /root))) | awk '{printf("%.1fG",$1/1024/1024/1024)}')

###########################
cat <<EOF

Report for $hostname
===============
FQDN: $fqdn
Operating System name and version: $os 
IP Address: $ip
Root Filesystem Free Space: $freespace
===============

EOF

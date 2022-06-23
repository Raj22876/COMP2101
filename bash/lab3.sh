#!/bin/bash 

# [1] Installing lxd if necessary

if [ -e /var/snap/lxd ] ;
then 
echo "lxd is already installed." 
else 
(echo "lxd is not installed, installing lxd now.") ;
sudo snap install lxd
fi

# [2] Running lxd init –auto if no lxdbr0 exists

if ip address show lxdbr0 ;
then 
echo "lxdbr0 already exists"
else 
(echo "lxdbr0 does not exists, innitializing") ;
sudo lxd init --auto
fi

# [3] Launch a container running Ubuntu server named COMP2101-S22 if necessary

if lxc info COMP2101-S22 2>/dev/null ;
then 
echo "The Instance COMP2101-S22 is already running"
else 
(echo "Container COMP2101-S22 is not present,") ;
lxc launch ubuntu:20.04 COMP2101-S22
fi

lxc exec COMP2101-S22 -- apt update 
lxc exec COMP2101-S22 -- apt upgrade 

# [4] Associate the name COMP2101-S22 with the container’s IP address in /etc/hosts if necessary

if grep -x "10.138.211.169 COMP2101-S22" /etc/hosts ;
then 
echo "Entry already exists"
else 
IPadd=$(lxc list | grep COMP2101-S22 | egrep -o "[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+") 
echo "$IPadd COMP2101-S22" | sudo tee -a /etc/hosts 1>/dev/null
fi

# [5] Install Apache2 in the container if necessary

if lxc exec COMP2101-S22 service apache2 status 1>/dev/null ;
then 
echo "Apache2 is already installed"
else 
(echo "Apache2 is not present, installing now") ;
lxc exec COMP2101-S22 -- apt install apache2 
fi 

# [6] Retrieve the default web page from the web service with curl and notify the user of success or failure

if curl -s COMP2101-S22 >/dev/null;
then 
echo "Accessing of COMP2101-S22's default web page was a SUCCESS"
else 
echo "Accessing of COMP2101-S22's default web page was a FAILURE"
fi


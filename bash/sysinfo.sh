# System Information 

# Hostname
echo "Hostname -"
hostname

echo " "

#DNS domain name
echo "Domain name -"
domainname -d

echo " "

#operating system name and version, identifying the Linux distro in use
echo "OS -"
grep PRETTY /etc/os-release

echo " "

# Ip address used by the machine 
echo "IP Address -"
domainname -I

echo " "
    
#amount of space available in the root filesystem 
echo "Capacity of root directory -"
df -h /root

exit

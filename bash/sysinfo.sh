# System Information 

# FQDN (Fully qualified domain name)
object1=$(hostname --fqdn)
#
# Operating System name and version
object2=$(source /etc/os-release ; echo $NAME $VERSION)
#
# Ip address used by the machine 
object3=$(domainname -I)
#
#Free Space available in Root Filesystem
object4=$(df -h /root --output=avail | tail -1)

cat <<exit

--------------------System Information for $(hostname)-----------------------
===========================================================================
FDQN                                   : $object1
Operating System                       : $object2
Ip address                             : $object3
Free Space available in Root Filesystem: $object4
===========================================================================

exit

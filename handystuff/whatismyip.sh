#!/bin/bash

# Created Aug 06, 2015 - PPKDS

# Gateway IP
routerip=$(ip r | grep 'default' | awk '{print $3}')
# Subnet mask from router
subnetmask=$(ip r | grep 'scope' | awk '{print $1}')
# Internal IP
internalip=$(ip r | grep 'scope' | grep -v 'vir' | awk '{print $9}')
# External IP
externalip=$(curl -s https://icanhazip.com) # Alternatives: https://checkip.amazonaws.com; https://ipinfo.io/ip; https://ident.me
# Connected client device
clientdevice=$(ip r | grep 'default' | awk '{print $5}')
# connected client MAC
connecteddevicemac=$(ip a | grep -A 1 -e 'state UP' | grep -e 'link/ether' | awk '{print $2}')

# Echo output to stdout
echo
echo "Gateway IP    : ${routerip}"
# echo "Subnet/mask   : ${subnetmask}"
echo "Internal IP   : ${internalip}"
echo "External IP   : ${externalip}"
echo "Interface     : ${clientdevice}"
echo "Device MAC    : ${connecteddevicemac}"
exit 0

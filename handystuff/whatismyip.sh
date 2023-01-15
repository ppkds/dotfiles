#!/bin/bash

# Created Aug 06, 2015 - PPKDS

# Gateway IP
routerip=$(ip r | grep 'default' | awk '{print $3}')
# Subnet mask from router
subnetmask=$(ip r | grep 'scope' | awk '{print $1}')
# Internal IP
internalip=$(ip r | grep 'scope' | awk '{print $9}')
# External IP
externalip=$(curl -s https://icanhazip.com) # Alternative: https://checkip.amazonaws.com; https://ipinfo.io/ip
# Connected client device
clientdevice=$(ip r | grep 'default' | awk '{print $5}')

# Echo output to stdout
echo "Gateway IP    : ${routerip}"
echo "Subnet/mask   : ${subnetmask}"
echo "Internal IP   : ${internalip}"
echo "External IP   : ${externalip}"
echo "Interface     : ${clientdevice}"
exit 0

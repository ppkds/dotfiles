#!/bin/bash
# +-----------------------------------------+
# |Created: Thu Aug 06 23:46:13 CST 2015    |
# +-----------------------------------------+

# Get Gateway IP
routerip=$(ip r | grep 'default' | awk '{print $3}')
# Get subnet mask from router
subnetmask=$(ip r | grep 'scope' | awk '{print $1}')
# Get internal IP
internalip=$(ip r | grep 'scope' | awk '{print $9}')
# Get external IP
externalip=$(curl -s https://icanhazip.com) # Other sites | https://checkip.amazonaws.com | https://ipinfo.io/ip |
# Get Connected client device
clientdevice=$(ip r | grep 'default' | awk '{print $5}')

# Echo output to stdout
echo
echo "Gateway IP    : ${routerip}"
echo "Subnet mask   : ${subnetmask}"
echo "Internal IP   : ${internalip}"
echo "External IP   : ${externalip}"
echo "Interface     : ${clientdevice}"
exit 0

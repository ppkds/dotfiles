#!/bin/bash
# +-----------------------------------------+
# |Created: Thu Aug 06 23:46:13 CST 2015    |
# |Modified: Tue Dec 21 20:07:52 CST 2021   |   
# +-----------------------------------------+

# Get external IP
# Other sites | https://checkip.amazonaws.com | https://ipinfo.io/ip |
externalip=$(curl -s https://icanhazip.com)
# Get internal IP
# Internalip=$(ifconfig | grep 'inet ' | grep -v '127.0.0.1' | awk '{print $2 "/" $4}')	# Use this to display subnet mask
internalip=$(hostname -I) 																# Use this to display without subnet mask
# Get Gateway IP - updated: Mon Sep 03 11:59:41 CDT 2018
routerip=$(ip r | grep 'default' | awk '{print $3}')
# Get Connected client device - updated: Sat Aug 14 17:04:36 CDT 2021
connectedclientdevice=$(ip r | grep 'default' | awk '{print $5}')

# Echo output to stdout
echo
echo --------
echo "Connection: ${connectedclientdevice} || Gateway: ${routerip}"
echo --------
echo "Internal IP":" ${internalip}"
echo "External IP":" ${externalip}"
echo --------
echo
exit 0

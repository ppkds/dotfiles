#!/bin/bash
#############################################################
# ppkds@outlook.com - Fri May 22 13:01:23 CDT 2015          #
# Modified: Sat Apr 13 03:57:53 CDT 2019                    #
# Updated: Sat Aug 14 17:04:36 CDT 2021                     #
#############################################################

# Get external IP 
# Other sites | https://checkip.amazonaws.com | https://ipinfo.io/ip | 
externalip=$(curl -s https://icanhazip.com)
# Get internal IP
# Internalip=$(ifconfig | grep 'inet ' | grep -v '127.0.0.1' | awk '{print $2 "/" $4}')	# Use this to display subnet mask
internalip=$(hostname -I) 																# Use this to display without subnet mask
# Get Gateway IP - updated: Mon Sep 03 11:59:41 CDT 2018
routerip=$(ip r | grep 'default' | awk '{print "Gateway: " $3}')
# Get Conneclient device - updated: Sat Aug 14 17:04:36 CDT 2021
connectedclientdevice=$(ip r | grep 'default' | awk '{print $5}')

# Echo output to stdout
echo
echo "Connection | ${connectedclientdevice} | ${routerip}"
echo
echo "Internal IP":" ${internalip}"
echo "External IP":" ${externalip}"
echo
exit 0

#!/bin/bash

# Created Aug 06, 2015 - Pappukant Dansale 
# Modernized edition

# Identify active default interface and gateway in a single pass
read -r routerip clientdevice < <(ip route show default | awk '{print $3, $5}')

# Internal IP directly assigned to the gateway interface
internalip=$(ip -4 addr show dev "$clientdevice" | awk '/inet / {print $2}' | cut -d/ -f1)

# MAC address bound directly to the gateway interface
connecteddevicemac=$(ip link show dev "$clientdevice" | awk '/link\/ether/ {print $2}')

# Subnet/network block assigned to the active interface
subnetmask=$(ip route show dev "$clientdevice" | awk '/proto kernel/ {print $1}')

# External IP via DNS query (Fastest / No HTTP overhead)
externalip=$(dig +short +time=2 myip.opendns.com @208.67.220.220 2>/dev/null)

# HTTP Backup Option:
# externalip=$(curl -s --max-time 5 https://icanhazip.com || echo "Unavailable")
# Alternatives: https://checkip.amazonaws.com; https://ipinfo.io/ip; https://ident.me

# Connected client device

# Output
echo
echo "Gateway IP    : ${routerip} / ${subnetmask}"
echo "Internal IP   : ${internalip}"
echo "External IP   : ${externalip:-Unavailable}"
echo "Interface     : ${clientdevice}"
echo "Device MAC    : ${connecteddevicemac}"

exit 0

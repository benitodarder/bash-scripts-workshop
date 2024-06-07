#!/bin/bash

if [ "$#" -lt 2 ]; then
	echo "usage: "$0".sh <Profile> <VPNs list. Space separated between quotes> <Optional arguments>"
	exit 1
fi 

set -x  

PROFILE="$1"
shift 
VPN_IDS="$1"
shift 

aws ec2  describe-vpn-connections --profile "$PROFILE" --vpn-connection-ids $VPN_IDS --no-cli-pager "$@"
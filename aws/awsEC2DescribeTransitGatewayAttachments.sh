#!/bin/bash

if [ "$#" -lt 2 ]; then
	echo "usage: "$0".sh <Profile> <Transit gateays attachment list. Space separated between quotes> <Optional arguments>"
	exit 1
fi 

set -x  

PROFILE="$1"
shift 
TGW_ATTACH_IDS="$1"
shift 

aws ec2  describe-transit-gateway-attachments --profile "$PROFILE" --transit-gateway-attachment-ids $TGW_ATTACH_IDS --no-cli-pager "$@"
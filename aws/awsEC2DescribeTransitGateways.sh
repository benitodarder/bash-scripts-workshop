#!/bin/bash

if [ "$#" -lt 2 ]; then
	echo "usage: "$0".sh <Profile> <Transit gateays list. Space separated between quotes> <Optional arguments>"
	exit 1
fi 

set -x  

PROFILE="$1"
shift 
TGW_IDS="$1"
shift 

aws ec2  describe-transit-gateways --profile "$PROFILE" --transit-gateway-ids $TGW_IDS --no-cli-pager "$@"
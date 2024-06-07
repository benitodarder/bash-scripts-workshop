#!/bin/bash

if [ "$#" -lt 2 ]; then
	echo "usage: "$0".sh <Profile> <Customer gateays ids. list. Space separated between quotes> <Optional arguments>"
	exit 1
fi 

set -x  

PROFILE="$1"
shift 
CGW_IDS="$1"
shift 

aws ec2  describe-customer-gateways --profile "$PROFILE" --customer-gateway-ids $CGW_IDS --no-cli-pager "$@"
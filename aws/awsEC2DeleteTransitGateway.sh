#!/bin/bash

if [ "$#" -lt 2 ]; then
	echo "usage: "$0".sh <Profile> <Transit gateway id.> <Optional arguments>"
	exit 1
fi 

set -x  

PROFILE=$1
shift
TGW_ID=$1
shift

aws ec2  delete-transit-gateway --profile "$PROFILE" --transit-gateway-id "$TGW_ID" "$@" --no-cli-pager
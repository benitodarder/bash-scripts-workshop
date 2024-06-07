#!/bin/bash

if [ "$#" -lt 2 ]; then
	echo "usage: "$0".sh <Profile> <Customer gateway id.> <Optional arguments>"
	exit 1
fi 

set -x  

PROFILE=$1
shift
CUSTOMER_GATEWAY_ID=$1
shift

aws ec2  delete-customer-gateway --profile "$PROFILE" --customer-gateway-id "$CUSTOMER_GATEWAY_ID" "$@"
#!/bin/bash

if [ "$#" -lt 2 ]; then
	echo "usage: "$0".sh <Profile> <Transit gateway route table id.> <Optional arguments>"
	exit 1
fi 

set -x  

PROFILE=$1
shift
TGW_ROUTE_TABLE_ID=$1
shift

aws ec2  delete-transit-gateway-route-table --profile "$PROFILE" --transit-gateway-route-table-id "$TGW_ROUTE_TABLE_ID" "$@"
#!/bin/bash

if [ "$#" -lt 2 ]; then
	echo "usage: "$0".sh <Profile> <Route table id.> <Optional arguments>"
	exit 1
fi 

set -x  

PROFILE=$1
shift
ROUTE_TABLE_ID=$1
shift

aws ec2  delete-route-table --profile "$PROFILE" --route-table-id "$ROUTE_TABLE_ID" "$@"
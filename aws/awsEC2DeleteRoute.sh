#!/bin/bash

if [ "$#" -lt 2 ]; then
	echo "usage: "$0".sh <Profile> <Route table id.> <Optional arguments: --destination-cidr-block, --destination-ipv6-cidr-block, --destination-prefix-list-id>"
	exit 1
fi 

set -x  

PROFILE=$1
shift
ROUTE_TABLE_ID=$1
shift

aws ec2  delete-route --profile "$PROFILE" --route-table-id "$ROUTE_TABLE_ID" "$@"
#!/bin/bash

if [ "$#" -lt 2 ]; then
	echo "usage: "$0".sh <Profile> <Security group id.> <Optional arguments>"
	exit 1
fi 

set -x  

PROFILE=$1
shift
SG_ID=$1
shift

aws ec2  delete-security-group --profile "$PROFILE" --group-id "$SG_ID" "$@"
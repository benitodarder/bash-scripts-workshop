#!/bin/bash

if [ "$#" -lt 2 ]; then
	echo "usage: "$0".sh <Profile> <Security group id.> <Rules>"
	exit 1
fi 

set -x  

PROFILE=$1
shift
SG_ID=$1
shift

aws ec2 revoke-security-group-ingress --profile $PROFILE --group-id $SG_ID --security-group-rule-ids "$@"
#!/bin/bash

if [ "$#" -lt 2 ]; then
	echo "usage: "$0".sh <Profile> <Subnet id.> <Optional arguments>"
	exit 1
fi 

set -x  

PROFILE=$1
shift
SUBNET_ID=$1
shift
KEY_ID=$1
shift

aws ec2  delete-subnet --profile "$PROFILE" --subnet-id "$SUBNET_ID" "$@"
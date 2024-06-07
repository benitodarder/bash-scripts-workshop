#!/bin/bash

if [ "$#" -lt 2 ]; then
	echo "usage: "$0".sh <Profile> <VPC id.> <Optional arguments>"
	exit 1
fi 

set -x  

PROFILE=$1
shift
VPC_ID=$1
shift

aws ec2  delete-vpc --profile "$PROFILE" --vpc-id "$VPC_ID" "$@"
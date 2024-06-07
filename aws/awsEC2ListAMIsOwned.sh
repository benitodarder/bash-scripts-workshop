#!/bin/bash

if [ "$#" -lt 2 ]; then
	echo "usage: "$0".sh <Profile> <AMI Owner> <Optional arguments>"
	exit 1
fi 

set -x  

PROFILE=$1
shift
OWNER=$1
shift 
aws ec2 describe-images --profile "$PROFILE" --owners $OWNER "$@" 
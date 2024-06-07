#!/bin/bash

if [ "$#" -lt 2 ]; then
	echo "usage: "$0".sh <Profile> <Instance id.> <Optional arguments>"
	exit 1
fi 

set -x  

PROFILE="$1"
shift 
INSTACE_ID="$1"
shift 

 aws ec2 get-console-output --instance-id $INSTACE_ID --profile $PROFILE --no-cli-pager "$@"
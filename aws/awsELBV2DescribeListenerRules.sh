#!/bin/bash

if [ "$#" -lt 1 ]; then
	echo "usage: "$0".sh <Profile. Mandatory> <Listener ARN. Mandatory> <Optional arguments>"
	exit 1
fi 

set -x  

PROFILE=$1
shift 
LISTENER_ARN=$1
shift

aws elbv2 describe-rules --listener-arn $LISTENER_ARN --profile $PROFILE --no-cli-pager "$@"
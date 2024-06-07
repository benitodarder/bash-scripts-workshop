#!/bin/bash

if [ "$#" -lt 1 ]; then
	echo "usage: "$0".sh <Profile. Mandatory> <ALB ARN. Mandatory> <Optional arguments>"
	exit 1
fi 

set -x  

PROFILE=$1
shift 
LB_ARN=$1
shift

aws elbv2 describe-listeners --load-balancer-arn $LB_ARN --profile $PROFILE --no-cli-pager "$@"
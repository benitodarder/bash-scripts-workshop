#!/bin/bash

if [ "$#" -lt 2 ]; then
	echo "usage: "$0".sh <Profile, mandatory> <ALB ARN, mandatory> <Optional arguments>"
	exit 1
fi 

set -x

PROFILE=$1
shift
ALB_ARN=$1
shift

 aws elbv2 describe-load-balancers --load-balancer-arns "$ALB_ARN" --profile $PROFILE --no-cli-pager "$@"
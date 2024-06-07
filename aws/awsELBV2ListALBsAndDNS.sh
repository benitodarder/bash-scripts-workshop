#!/bin/bash

if [ "$#" -lt 1 ]; then
	echo "usage: "$0".sh <Profile> <Optional arguments>"
	exit 1
fi 

set -x  

PROFILE=$1
shift 

aws elbv2 describe-load-balancers --profile "$PROFILE" --query 'LoadBalancers[].[LoadBalancerArn, DNSName]'
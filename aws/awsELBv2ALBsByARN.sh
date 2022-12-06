#!/bin/bash

if [ "$#" -ne 1 ]; then
	echo "usage: "$0".sh <Profile>"
	exit 1
fi 

for LOADBALANCERNAME in $(aws elbv2 describe-load-balancers --profile $1 | jq .LoadBalancers[].LoadBalancerArn); do
  CLEANLOADBALANCERNAME=$(echo "$LOADBALANCERNAME" | sed -e 's/^"//' -e 's/"$//')
  aws elbv2 describe-tags --resource-arns $CLEANLOADBALANCERNAME --profile $1 --no-cli-pager
done
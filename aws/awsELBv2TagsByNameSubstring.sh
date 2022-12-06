#!/bin/bash

if [ "$#" -ne 2 ]; then
	echo "usage: "$0".sh <Profile> <Substring>"
	exit 1
fi 

for ELB_ARN in $(aws elbv2 describe-load-balancers --profile $1 | jq .LoadBalancers[].LoadBalancerArn); do
  CLEANELB_ARN=$(echo "$ELB_ARN" | sed -e 's/^"//' -e 's/"$//')
  ELB_DATA=$(aws elbv2 describe-tags --resource-arns $CLEANELB_ARN --profile $1 --no-cli-pager)
  TAG_NAME=$(echo $ELB_DATA | jq '.TagDescriptions[] | .Tags[] | select(.Key == "Name").Value' | sed -e 's/^"//' -e 's/"$//')
  if [[ "$TAG_NAME" =~ "$2" ]]; then
    ELB_TAGS=$(echo $ELB_DATA | jq '.TagDescriptions[] | .Tags ')
    echo "Found:"
    echo "  ELB ARN: "$CLEANELB_ARN
    echo "  ELB tags: "$ELB_TAGS
  fi
done
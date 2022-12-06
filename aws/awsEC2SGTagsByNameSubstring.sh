#!/bin/bash

if [ "$#" -ne 2 ]; then
	echo "usage: "$0".sh <Profile> <Substring>"
	exit 1
fi 

for SG_NAME in $(aws ec2 describe-security-groups --profile $1 --no-cli-pager | jq '.SecurityGroups[] | .GroupName'); do
  CLEAN_SG_NAME=$(echo "$SG_NAME" | sed -e 's/^"//' -e 's/"$//')
  if [[ "$CLEAN_SG_NAME" =~ "$2" ]]; then
    CLEAN_SG_ID=$(aws ec2 describe-security-groups --profile $1 --no-cli-pager | jq '.SecurityGroups[] | select(.GroupName == "'"$CLEAN_SG_NAME"'") | .GroupId' | sed -e 's/^"//' -e 's/"$//')
    SG_TAGS=$(aws ec2 describe-security-groups --group-ids $CLEAN_SG_ID --profile $1 --no-cli-pager | jq '.SecurityGroups[] |  .Tags')
    echo "Found:"
    echo "  SG id: "$CLEAN_SG_ID
    echo "  SG name: "$CLEAN_SG_NAME
    echo "  SG tags: "$SG_TAGS
  fi
done
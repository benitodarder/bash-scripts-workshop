#!/bin/bash

if [ "$#" -ne 2 ]; then
	echo "usage: "$0".sh <Profile> <Substring>"
	exit 1
fi 

for ROLE_NAME in $(aws iam list-roles --profile $1 --no-cli-pager | jq '.Roles[] | .RoleName'); do
  CLEANROLE_NAME=$(echo "$ROLE_NAME" | sed -e 's/^"//' -e 's/"$//')
  if [[ "$CLEANROLE_NAME" =~ "$2" ]]; then
    ROLE_TAGS=$(aws iam list-role-tags --role-name "$CLEANROLE_NAME" --profile $1 --no-cli-pager | jq '.Tags')
    echo "Found:"
    echo "  Role name: "$CLEANROLE_NAME
    echo "  Role tags: "$ROLE_TAGS
  fi
done
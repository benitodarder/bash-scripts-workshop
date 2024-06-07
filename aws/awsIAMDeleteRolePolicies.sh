#!/bin/bash

if [ "$#" -lt 3 ]; then
	echo "usage: "$0".sh <Profile> <Role name> <Policy ARN>"
	exit 1
fi 

set -x

PROFILE="$1"
shift
ROLE="$1"
shift
POLICY="$1"
shift

aws iam  detach-role-policy --role-name $ROLE --policy-arn $POLICY --profile $PROFILE

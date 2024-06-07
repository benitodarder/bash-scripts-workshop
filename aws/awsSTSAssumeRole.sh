#!/bin/bash

if [ "$#" -ne 4 ]; then
	echo "usage: "$0".sh <Profile> <Account id.> <Role name> <Session name>"
	exit 1
fi 

PROFILE=$1
shift
ACCOUNT=$1
shift
ROLE=$1
shift
SESSION_NAME=$1
shift

set -x

aws_credentials=$(aws sts assume-role --role-arn arn:aws:iam::$ACCOUNT:role/$ROLE --role-session-name $SESSION_NAME --output json --profile $PROFILE)

set +x

echo "export AWS_ACCESS_KEY_ID=$(echo $aws_credentials|jq '.Credentials.AccessKeyId'|tr -d '"') \\
export AWS_SECRET_ACCESS_KEY=$(echo $aws_credentials|jq '.Credentials.SecretAccessKey'|tr -d '"') \\
export AWS_SESSION_TOKEN=$(echo $aws_credentials|jq '.Credentials.SessionToken'|tr -d '"')"
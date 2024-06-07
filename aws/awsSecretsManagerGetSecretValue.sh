#!/bin/bash

if [ "$#" -lt 2 ]; then
	echo "usage: "$0".sh <Profile> <Secret name/arn> <Optional arguments>"
	exit 1
fi 
set -x

PROFILE=$1
shift
SECRET_ID=$1
shift

aws  secretsmanager get-secret-value --secret-id "$SECRET_ID" --profile "$PROFILE" "$@"
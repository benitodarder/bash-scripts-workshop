#!/bin/bash

if [ "$#" -ne 2 ]; then
	echo "usage: "$0".sh <Profile> <Secret name/arn>"
	exit 1
fi 
set -x

aws  secretsmanager get-secret-value --secret-id $2 --profile $1

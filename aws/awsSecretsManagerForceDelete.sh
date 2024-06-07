#!/bin/bash

if [ "$#" -ne 2 ]; then
	echo "usage: "$0".sh <Profile> <Secret name/arn>"
	exit 1
fi 
set -x

aws secretsmanager delete-secret --secret-id $2 --force-delete-without-recovery  --profile $1
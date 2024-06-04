#!/bin/bash

if [ "$#" -ne 3 ]; then
	echo "usage: "$0".sh <Profile> <Secret id.> <Secret string file>"
	exit 1
fi 
set -x

aws secretsmanager put-secret-value --secret-id $2 --secret-string file://$3 --profile $1

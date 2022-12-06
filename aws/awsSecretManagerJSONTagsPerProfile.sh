#!/bin/bash

if [ "$#" -ne 3 ]; then
	echo "usage: "$0".sh <Profile> <Secret id.> <Tags file>"
	exit 1
fi 
set -x

aws  secretsmanager tag-resource --tags file://$3 --secret-id $2 --profile $1

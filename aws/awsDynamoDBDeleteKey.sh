#!/bin/bash

if [ "$#" -lt 3 ]; then
	echo "usage: "$0".sh <Profile> <Table name> <Key> <Optional arguments>"
	exit 1
fi 

set -x  

PROFILE=$1
shift
TABLE_NAME=$1
shift
KEY=$1
shift

aws dynamodb   delete-item --profile "$PROFILE" --table-name "$TABLE_NAME" --key "$KEY"
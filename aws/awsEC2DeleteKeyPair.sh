#!/bin/bash

if [ "$#" -lt 3 ]; then
	echo "usage: "$0".sh <Profile> <Key Name> <Key id.> <Optional arguments>"
	exit 1
fi 

set -x  

PROFILE=$1
shift
KEY_NAME=$1
shift
KEY_ID=$1
shift

aws ec2  delete-key-pair --profile "$PROFILE" --key-name "$KEY_NAME" --key-pair-id "$KEY_ID"
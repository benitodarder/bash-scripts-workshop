#!/bin/bash

if [ "$#" -ne 4 ]; then
	echo "usage: "$0".sh <Profile> <Bucket name> <Key prefix> <Folder>"
	exit 1
fi 
set -x

PROFILE=$1
shift 
BUCKET=$1
shift
KEY_PREFIX=$1
shift
DESTINATION=$1
shift

aws s3 cp s3://$BUCKET/$KEY_PREFIX $DESTINATION --recursive --profile $PROFILE
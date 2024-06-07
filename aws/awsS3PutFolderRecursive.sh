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
SOURCE=$1
shift

aws s3 cp $SOURCE s3://$BUCKET/$KEY_PREFIX --recursive --profile $PROFILE
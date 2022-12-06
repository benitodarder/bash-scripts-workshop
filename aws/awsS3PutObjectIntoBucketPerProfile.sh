#!/bin/bash

if [ "$#" -ne 4 ]; then
	echo "usage: "$0".sh <Profile> <Bucket name> <Key> <File to upload>"
	exit 1
fi 
set -x

aws s3api put-object --bucket $2 --key $3 --body $4 --profile $1

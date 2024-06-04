#!/bin/bash

if [ "$#" -ne 4 ]; then
	echo "usage: "$0".sh <Profile> <Bucket name> <Key> <Local name>"
	exit 1
fi 
set -x

aws s3api get-object --bucket $2 --key $3 --profile $1 $4

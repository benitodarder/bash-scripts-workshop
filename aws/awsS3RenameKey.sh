#!/bin/bash

if [ "$#" -ne 4 ]; then
	echo "usage: "$0".sh <Profile> <Bucket name>  <From key> <To key>"
	exit 1
fi 
set -x

aws s3 cp s3://$2/$3 s3://$2/$4 --profile $1
aws s3 rm s3://$2/$3  --profile $1

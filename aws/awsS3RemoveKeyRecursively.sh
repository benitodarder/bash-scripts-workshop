#!/bin/bash

if [ "$#" -ne 3 ]; then
	echo "usage: "$0".sh <Profile> <Bucket name> <Key>"
	exit 1
fi 
set -x

aws s3 rm s3://$2/$3 --recursive --profile $1
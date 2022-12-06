#!/bin/bash

if [ "$#" -ne 2 ]; then
	echo "usage: "$0".sh <Profile> <Bucket name> "
	exit 1
fi 
set -x

aws s3api list-objects-v2 --bucket  $2 --profile  $1

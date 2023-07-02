#!/bin/bash

if [ "$#" -lt 2 ]; then
	echo "usage: "$0".sh <Profile, mandatory> <Bucket, required> <Optional arguments>"
	exit 1
fi 

set -x

PROFILE=$1
shift
BUCKET=$1
shift

set +x

read -p "About to wipe out "$BUCKET"? (yes/*) " INPUT
if [ "$INPUT" != "yes" ]; then
  echo "Aborting deletion."
else
  set -x
  aws  s3 rm s3://$BUCKET --recursive --profile $PROFILE
fi

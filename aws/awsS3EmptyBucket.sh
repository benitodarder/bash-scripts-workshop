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
  read -p "Think about it... Are you really really sure to wipe out "$BUCKET"? (yes/*) " INPUT
  if [ "$INPUT" != "yes" ]; then
    echo "Aborting deletion."  
  else 
    set -x
    aws  s3 rm s3://$BUCKET --recursive --profile $PROFILE
    aws s3api delete-objects --bucket $BUCKET --delete "$(aws s3api list-object-versions --bucket ${BUCKET} --query='{Objects: Versions[].{Key:Key,VersionId:VersionId}}' --profile $PROFILE)" --profile $PROFILE
    aws s3api delete-objects --bucket $BUCKET --delete "$(aws s3api list-object-versions --bucket ${BUCKET} --query='{Objects: DeleteMarkers[].{Key:Key,VersionId:VersionId}}' --profile $PROFILE)" --profile $PROFILE 
  fi
fi

#!/bin/bash

if [ "$#" -lt 5 ]; then
	echo "usage: "$0".sh <Profile> <Origin bucket name> <Origin key> <Destination bucket name> <Destination key> <Optional arguments as --recursive>"
	exit 1
fi 
set -x

PROFILE=$1
shift
BUCKET_ORIGIN=$1
shift
KEY_ORIGIN=$1
shift
BUCKET_DESTINATION=$1
shift
KEY_DESTINATION=$1
shift

aws s3 cp s3://$BUCKET_ORIGIN/$KEY_ORIGIN  s3://$BUCKET_DESTINATION/$KEY_DESTINATION --profile $PROFILE "$@"
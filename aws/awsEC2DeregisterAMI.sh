#!/bin/bash

if [ "$#" -lt 2 ]; then
	echo "usage: "$0".sh <Profile> <Image id.> <Optional arguments>"
	exit 1
fi 

set -x  

PROFILE=$1
shift
IMAGE_ID=$1
shift

aws ec2  deregister-image --profile "$PROFILE" --image-id "$IMAGE_ID" "$@"
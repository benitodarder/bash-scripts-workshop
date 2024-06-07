#!/bin/bash

if [ "$#" -lt 1 ]; then
	echo "usage: "$0".sh <Profile> <Optional arguments>"
	exit 1
fi 
set -x  

PROFILE="$1"
shift 

aws ec2 describe-images --profile "$PROFILE" --owners $(aws sts get-caller-identity --query "Account" --output text --profile "$PROFILE") --no-cli-pager --query 'Images[].[Architecture, ImageId, PlatformDetails, Name, State]' --output table 
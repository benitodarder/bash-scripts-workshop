#!/bin/bash

if [ "$#" -lt 2 ]; then
	echo "usage: "$0".sh <Profile, mandatory> <Security group id., mandatory> <Optional arguments>"
	exit 1
fi 

set -x

PROFILE=$1
shift
SG_ID=$1
shift

 aws ec2 describe-security-groups --group-ids $SG_ID --profile $PROFILE --no-cli-pager "$@"
#!/bin/bash

if [ "$#" -lt 2 ]; then
	echo "usage: "$0".sh <Profile, mandatory> <Cloudfront distribution id., mandatory> <Optional arguments>"
	exit 1
fi 

set -x

PROFILE=$1
shift
DISTRIBUTION_ID=$1
shift

aws cloudfront get-distribution --id $DISTRIBUTION_ID --profile $PROFILE --no-cli-pager "$@"
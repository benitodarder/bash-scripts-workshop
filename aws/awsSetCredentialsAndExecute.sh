#!/bin/bash

if [ "$#" -lt 4 ]; then
	echo "usage: "$0".sh <Acces key> <Secret> <AWS Region> <Command and arguments>"
	exit 1
fi 

set +x 

export AWS_ACCESS_KEY_ID="$1"
shift
export AWS_SECRET_ACCESS_KEY="$1"
shift
export AWS_DEFAULT_REGION="$1"
export AWS_REGION="$1"
shift

set -x

"$@"
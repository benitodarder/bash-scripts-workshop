#!/bin/bash

if [ "$#" -lt 2 ]; then
	echo "usage: "$0".sh <Profile, mandatory> <Namespace, mandatory> <Optional arguments>"
	exit 1
fi 

set -x

PROFILE=$1
shift
NAMESPACE=$1
shift

aws cloudwatch list-metrics --profile $PROFILE --namespace $NAMESPACE --no-cli-pager "$@"
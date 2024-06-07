#!/bin/bash

if [ "$#" -lt 2 ]; then
	echo "usage: "$0".sh <Profile> <Autoscaling group name> <Optional arguments>"
	exit 1
fi 

set -x  

PROFILE=$1
shift
ASG=$1
shift

aws autoscaling start-instance-refresh --auto-scaling-group-name $ASG --profile $PROFILE "$@"
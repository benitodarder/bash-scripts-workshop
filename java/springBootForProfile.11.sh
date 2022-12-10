#!/bin/bash

if [ "$#" -lt 2 ]; then
	echo "usage: "$0" <Mandatory profile> <Mandatory jar path> <Optional application arguments>"
	exit 1
fi 

set -x

SPRING_PROFILE=$1
shift 
java -Dspring.profiles.active=$SPRING_PROFILE -jar "$@"

#!/bin/bash

if [ "$#" -lt 3 ]; then
	echo "usage: "$0" <Profile> <Debug port> <Path to JAR>"
	exit 1
fi 

set -x

SPRING_PROFILE=$1
shift
DEBUG_PORT=$1
shift
java -agentlib:jdwp=transport=dt_socket,server=y,suspend=y,address=$DEBUG_PORT -Dspring.profiles.active=$SPRING_PROFILE -jar "$@"

#!/bin/bash

if [ "$#" -lt 2 ]; then
	echo "usage: "$0" <Profile> <Debug port>"
	exit 1
fi 

set -x

SPRING_PROFILE=$1
shift
DEBUG_PORT=$1
shift

mvn spring-boot:run -Dspring-boot.run.jvmArguments="-Xdebug -Xrunjdwp:transport=dt_socket,server=y,suspend=y,address=$DEBUG_PORT -Dspring.profiles.active=$SPRING_PROFILE $@"

#!/bin/bash

if [ "$#" -lt 3 ]; then
	echo "usage: "$0" <Profile> <Debug port> <JMX Port> <Path to JAR and arguments>"
	exit 1
fi 

set -x

SPRING_PROFILE=$1
shift
DEBUG_PORT=$1
shift
JMX_PORT=$1
shift
java -agentlib:jdwp=transport=dt_socket,server=y,suspend=y,address=$DEBUG_PORT \
      -Dspring.profiles.active=$SPRING_PROFILE \
      -Dcom.sun.management.jmxremote=true \
      -Dcom.sun.management.jmxremote.port=$JMX_PORT \
      -Dcom.sun.management.jmxremote.local.only=false \
      -Dcom.sun.management.jmxremote.authenticate=false \
      -Dcom.sun.management.jmxremote.ssl=false \
      -jar "$@"

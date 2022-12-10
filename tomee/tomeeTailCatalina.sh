#!/bin/bash

if [ "$#" -ne 1 ]; then
	echo "usage: "$0".sh <Webapp folder index: 01, 02...>"
	exit 1
fi 

CATALINA_BASE=/home/benitodarder/Development/webapps/

set -x

tail -f $CATALINA_BASE$1/logs/catalina.out

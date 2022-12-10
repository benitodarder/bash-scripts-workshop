#!/bin/bash

if [ "$#" -ne 2 ]; then
	echo "usage: "$0".sh <Webapp folder index: 01, 02...> <Patter>"
	exit 1
fi 

# Set accordingly with trailing folder separator:
#
# CATALINA_BASE=<Path to CATALINA_BASE>

set -x

tail -f $CATALINA_BASE$1/logs/catalina.out | grep $2

#!/bin/bash

if [ "$#" -ne 1 ]; then
	echo "usage: "$0" <Webapp folder index: 01, 02...>"
	exit 1
fi 

# Set accordingly with trailing folder separator:
#
# CATALINA_BASE=<Path to CATALINA_BASE>

set -x

$CATALINA_BASE$1/bin/catalina.sh stop -force

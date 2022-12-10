#!/bin/bash

if [ "$#" -lt 3 ]; then
	echo "usage: "$0" <username:password> <Local name> <Nexus URL>"
	exit 1
fi 

set -x

curl -X GET -u $1 $3 -o $2

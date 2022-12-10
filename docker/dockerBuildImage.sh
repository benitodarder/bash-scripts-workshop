#!/bin/bash

if [ "$#" -lt 2 ]; then
	echo "usage: "$0" <Image name> <Version>"
	exit 1
fi 

set -x

docker build -t $1:$2 .
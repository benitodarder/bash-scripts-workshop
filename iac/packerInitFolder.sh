#!/bin/bash

if [ "$#" -lt 1 ]; then
	echo "usage: "$0" <Packer folder> <Optional arguments>"
	exit 1
fi 


set -x
PACKER_FILE=$1
shift

packer fmt .
packer init --upgrade "$PACKER_FILE" "$@"

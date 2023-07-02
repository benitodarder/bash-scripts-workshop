#!/bin/bash

echo "Please check script is called within Packer config files folder..."

if [ "$#" -lt 1 ]; then
	echo "usage: "$0" <Variables file> <Optional arguments>"
	exit 1
fi 


set -x

VARIABLES_FILE=$1
shift
packer fmt .
packer validate -var-file="$VARIABLES_FILE" "$@" .
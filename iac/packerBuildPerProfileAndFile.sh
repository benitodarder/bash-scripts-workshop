#!/bin/bash

echo "Please check script is called within Packer config files folder..."

if [ "$#" -lt 2 ]; then
	echo "usage: "$0" <AWS profile>  <Variables file> <Optional arguments>"
	exit 1
fi 


set -x

export AWS_PROFILE=$1
shift
VARIABLES_FILE=$1
shift
packer fmt .
packer build -var-file="$VARIABLES_FILE" "$@" .
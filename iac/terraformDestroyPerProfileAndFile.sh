#!/bin/bash

echo "Please check script is called within iac repository..."

if [ "$#" -lt 2 ]; then
	echo "usage: "$0" <AWS profile, madatory> <Variables file> <Other optional arguments>"
	exit 1
fi 


set -x

export AWS_PROFILE=$1
shift
VARS_PATH=$1
shift
terraform destroy -var-file=$VARS_PATH "$@"

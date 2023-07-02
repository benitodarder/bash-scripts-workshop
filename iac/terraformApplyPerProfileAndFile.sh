#!/bin/bash

echo "Please check script is called within iac repository..."

if [ "$#" -lt 2 ]; then
	echo "usage: "$0" <AWS profile, madatory> <Other optional arguments>"
	exit 1
fi 


set -x

export AWS_PROFILE=$1
shift	
export CONFIG_FILE=$1
shift

terraform fmt
terraform apply -var-file=$CONFIG_FILE "$@"

#!/bin/bash

if [ "$#" -ne 3 ]; then
	echo "usage: "$0".sh <Profile> <ELB ARN> <Tags file>"
	exit 1
fi 
set -x

aws elbv2 add-tags --resource-arns $2 --tags file://$3 --profile $1

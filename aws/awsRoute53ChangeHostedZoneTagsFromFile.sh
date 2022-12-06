#!/bin/bash

if [ "$#" -ne 3 ]; then
	echo "usage: "$0".sh <Profile> <Record id.> <Tags file>"
	exit 1
fi 
set -x

aws route53  change-tags-for-resource --resource-type hostedzone --resource-id $2 --add-tags file://$3 --profile $1

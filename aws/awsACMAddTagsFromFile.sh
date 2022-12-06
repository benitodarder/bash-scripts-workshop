#!/bin/bash

if [ "$#" -ne 3 ]; then
	echo "usage: "$0".sh <Profile> <ACM ARN> <Tags file>"
	exit 1
fi 

set -x

aws  acm add-tags-to-certificate --certificate-arn $2 --tags file://$3 --profile $1

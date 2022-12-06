#!/bin/bash

if [ "$#" -ne 3 ]; then
	echo "usage: "$0".sh <Profile> <EC2 id.> <Tags file>"
	exit 1
fi 
set -x

aws  ec2 create-tags --resources $2 --tags file://$3 --profile $1

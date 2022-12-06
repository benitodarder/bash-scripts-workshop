#!/bin/bash

if [ "$#" -ne 3 ]; then
	echo "usage: "$0".sh <Profile> <Role name> <Tags file>"
	exit 1
fi 
set -x

aws iam tag-role --role-name $2 --tags file://$3 --profile $1

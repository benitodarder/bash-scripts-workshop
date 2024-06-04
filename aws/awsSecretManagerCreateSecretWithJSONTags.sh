#!/bin/bash

if [ "$#" -ne 4 ]; then
	echo "usage: "$0".sh <Profile> <Secret name> <Secret string file> <Tags file>"
	exit 1
fi 
set -x

aws  secretsmanager create-secret --tags file://$4 --name $2 --secret-string file://$3 --profile $1

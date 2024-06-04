#!/bin/bash

if [ "$#" -ne 3 ]; then
	echo "usage: "$0".sh <Profile> <Secret name> <Secret string file>"
	exit 1
fi 
set -x

aws  secretsmanager create-secret --name $2 --secret-string file://$3 --profile $1

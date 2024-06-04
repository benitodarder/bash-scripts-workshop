#!/bin/bash

if [ "$#" -ne 1 ]; then
	echo "usage: "$0".sh <Profile>"
	exit 1
fi 
set -x

aws rds describe-db-instances --profile $1 --query "DBInstances[].[DBInstanceIdentifier, DeletionProtection]"

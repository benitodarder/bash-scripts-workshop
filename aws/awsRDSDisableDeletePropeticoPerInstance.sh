#!/bin/bash

if [ "$#" -ne 2 ]; then
	echo "usage: "$0".sh <Profile> <DB instance identifier>"
	exit 1
fi 
set -x

aws rds modify-db-instance --db-instance-identifier $2 --profile $1 --no-deletion-protection

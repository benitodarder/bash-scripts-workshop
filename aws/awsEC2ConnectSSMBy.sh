#!/bin/bash

if [ "$#" -ne 2 ]; then
	echo "usage: "$0".sh <Profile> <Instance Id.>"
	exit 1
fi 
set -x  


aws ssm start-session --target $2 --profile $1
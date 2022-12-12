#!/bin/bash

if [ "$#" -lt 2 ]; then
	echo "usage: "$0" <User name> <User email>"
	exit 1
fi 

set -x

git config user.name $1
git config user.email $2
git config credentials.helper store

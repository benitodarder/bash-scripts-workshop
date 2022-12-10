#!/bin/bash

if [ "$#" -lt 1 ]; then
	echo "usage: "$0" <TAG>"
	exit 1
fi 

set -x

git push origin :$1

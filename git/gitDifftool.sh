#!/bin/bash

if [ "$#" -lt 3 ]; then
	echo "usage: "$0" <One branch> <Another branch> <File>"
	exit 1
fi 

set -x

git difftool $1:$3 $2:$3

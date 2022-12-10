#!/bin/bash

if [ "$#" -lt 2]; then
	echo "usage: "$0" <Files name regex> <Regex to find>"
	exit 1
fi 

set -x

find . -iname "$1" -exec grep -Hn "$2" {} \;

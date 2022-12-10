#!/bin/bash

if [ "$#" -lt 2 ]; then
	echo "usage: "$0" <One file/folder> <Another file/folder>"
	exit 1
fi 

set -x

meld $1 $2 

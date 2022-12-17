#!/bin/bash

if [ "$#" -lt 1 ]; then
	echo "usage: "$0" <Branch to keep>"
  echo "  -For multiple matches:  'dev$\|stage$\|pro$'"
	exit 1
fi 

set -x

git branch | grep -v $1 | xargs git branch -D

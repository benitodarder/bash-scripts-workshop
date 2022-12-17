#!/bin/bash

if [ "$#" -lt 1 ]; then
	echo "usage: "$0" <Branch to merge from>"
	exit 1
fi 


CURRENT_BRANCH=$(git symbolic-ref --short -q HEAD)

set -x 

git stash
git checkout $1
git pull
git checkout $CURRENT_BRANCH
git merge --no-ff --no-commit $1
git stash pop

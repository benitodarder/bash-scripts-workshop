#!/bin/bash

if [ "$#" -ne 2 ]; then
	echo "usage: "$0".sh <Profile> <Cluster name> "
	exit 1
fi 
set -x

aws eks update-kubeconfig --name  $2 --profile  $1


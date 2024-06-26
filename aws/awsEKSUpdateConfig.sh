#!/bin/bash

if [ "$#" -ne 2 ]; then
	echo "usage: "$0".sh <Profile> <Cluster name> "
	exit 1
fi 


PROFILE="$1"
shift
CLUSTER_NAME="$1"
shift

set -x

aws eks update-kubeconfig --name  "$CLUSTER_NAME" --profile  "$PROFILE"


#!/bin/bash

if [ "$#" -ne 2 ]; then
	echo "usage: "$0".sh <Profile> <Cluster name> "
	exit 1
fi 
set -x

PROFILE="$1"
shift
CLUSTER_NAME="$1"
shift

aws eks describe-cluster --name "$CLUSTER_NAME" --query "cluster.identity.oidc.issuer" --output text --profile "$PROFILE"
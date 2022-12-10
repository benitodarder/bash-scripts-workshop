#!/bin/bash

declare -A contexts=( ["1"]="<k8s context name>" ["2"]="<k8s context name>" ["3"]="<k8s context name>" ["4"]="<k8s context name>" ["5"]="<k8s context name>" )

if [ "$#" -ne 1 ]; then
	echo "usage: "$0" <Context id.>"
	echo "Currently using:"
	kubectl config current-context
	echo "Available contexts:"
	for contextId in "${!contexts[@]}"; do echo "$contextId - ${contexts[$contextId]}"; done
	exit 1
fi 

set -x

kubectl config use-context ${contexts[$1]}

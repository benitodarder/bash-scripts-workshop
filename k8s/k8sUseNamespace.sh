#!/bin/bash

if [ "$#" -ne 1 ]; then
	echo "usage: "$0" <Namespace>"
	echo "Currently using:"
	kubectl config view --minify | grep namespace:
	echo "Available namespaces:"
	kubectl get namespaces
	exit 1
fi 

set -x

kubectl config set-context --current --namespace=$1

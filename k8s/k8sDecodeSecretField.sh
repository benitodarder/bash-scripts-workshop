#!/bin/bash

if [ "$#" -ne 2 ]; then
	echo "usage: "$0" <Secret name> <Key>"
	echo "Currently using:"
	kubectl config view --minify | grep current-context:
	kubectl config view --minify | grep namespace:
	exit 1
fi 

set -x

set -x
echo $(kubectl get secret -n argocd $1 -o jsonpath='{.data}' | jq -r .$2 | base64 --decode)

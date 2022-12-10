#!/bin/bash

if [ "$#" -ne 1 ]; then
	echo "usage: "$0" <Pod name>"
	echo "Currently using:"
	kubectl config view --minify | grep current-context:
	kubectl config view --minify | grep namespace:
	exit 1
fi 

set -x

kubectl exec --stdin --tty $1 -- /bin/bash 

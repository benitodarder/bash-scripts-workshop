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

(
NAMESPACE=$1
kubectl proxy &
kubectl get namespace $NAMESPACE -o json |jq '.spec = {"finalizers":[]}' >temp.json
curl -k -H "Content-Type: application/json" -X PUT --data-binary @temp.json 127.0.0.1:8001/api/v1/namespaces/$NAMESPACE/finalize
)
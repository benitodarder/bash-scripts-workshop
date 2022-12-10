#!/bin/bash


if [ "$#" -ne 1 ]; then
	echo "usage: "$0" <Namespace>"
	exit 1
fi 

set -x

 kubectl get pod -n $1 | grep Evicted | awk '{print $1}' | xargs kubectl delete pod -n $1

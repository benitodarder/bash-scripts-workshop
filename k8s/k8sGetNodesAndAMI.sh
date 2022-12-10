#!/bin/bash

echo "Currently using:"
set -x
kubectl config current-context

kubectl get nodes -o jsonpath='{range.items[*]}{.metadata.labels.kubernetes\.io/hostname}{" // "}{.metadata.labels.eks\.amazonaws\.com/nodegroup-image}{" // "}{.metadata.labels.eks\.amazonaws\.com/nodegroup}{"\n"}{end}'
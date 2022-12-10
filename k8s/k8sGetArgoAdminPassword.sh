#!/bin/bash


echo "Currently using:"
echo "   "$(kubectl config view --minify | grep current-context:)
echo "   "$(kubectl config view --minify | grep namespace:)

set -x
echo $(kubectl get secret -n argocd argocd-initial-admin-secret -o jsonpath='{.data}' | jq -r .password | base64 --decode)

#!/bin/bash

if [ "$#" -ne 2 ]; then
        echo "usage: "$0".sh <Profile> <ARN/Name substring>"
        exit 1
fi
set -x

aws secretsmanager list-secrets --profile $1 --query 'SecretList[].ARN' | jq .[] | tr -d '"' | grep $2
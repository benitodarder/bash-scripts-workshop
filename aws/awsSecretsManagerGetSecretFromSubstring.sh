#!/bin/bash

if [ "$#" -ne 2 ]; then
        echo "usage: "$0".sh <Profile> <ARN/Name substring>"
        exit 1
fi
set -x


awsSecretManagerGetARNFromSubstringPerProfile.sh $1 $2 | xargs -I {} awsSecretManagerGetSecretPerProfile.sh $1 {}

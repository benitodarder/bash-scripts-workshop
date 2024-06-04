#!/bin/bash

if [ "$#" -ne 1 ]; then
	echo "usage: "$0".sh <Profile>"
	exit 1
fi 

for REPOSITORYNAME in $(aws ecr describe-repositories --profile $1 | jq -r '.[] | .[] | .repositoryName'); do
  echo $REPOSITORYNAME
  aws ecr list-images --repository-name $REPOSITORYNAME --profile $1 --no-cli-pager
done
#!/bin/bash

if [ "$#" -ne 1 ]; then
	echo "usage: "$0".sh <Profile>"
	exit 1
fi 

set -x  

PROFILE=$1
shift

aws ec2 describe-vpcs --profile $PROFILE --query "Vpcs[].[CidrBlock, VpcId,Tags[?Key=='Name']| [0].Value, State]" --output table --no-cli-pager
#!/bin/bash

if [ "$#" -ne 2 ]; then
	echo "usage: "$0".sh <Profile> <VPC id.>"
	exit 1
fi 
set -x

PROFILE="$1"
shift 
VPC_ID="$1"
shift 


aws ec2 describe-subnets --profile $PROFILE --filters Name=vpc-id,Values=$VPC_ID --query "Subnets[].[VpcId, SubnetId, CidrBlock, Tags[?Key=='Name']| [0].Value]" --output table --no-cli-pager
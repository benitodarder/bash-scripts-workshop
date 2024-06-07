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


aws ec2 describe-route-tables --profile $PROFILE --filters Name=vpc-id,Values=$VPC_ID --query "RouteTables[].[VpcId, RouteTableId, Tags[?Key=='Name']| [0].Value]" --output table --no-cli-pager
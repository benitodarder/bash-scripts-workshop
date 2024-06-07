#!/bin/bash

if [ "$#" -ne 2 ]; then
	echo "usage: "$0".sh <Profile> <Subnet id.>"
	exit 1
fi 
set -x

PROFILE="$1"
shift 
SUBNET_ID="$1"
shift 


aws ec2 describe-network-interfaces --filters Name=subnet-id,Values=$SUBNET_ID --profile $PROFILE  --query "NetworkInterfaces[].Attachment[].[AttachmentId,InstanceId, Status]" --output table --no-cli-pager
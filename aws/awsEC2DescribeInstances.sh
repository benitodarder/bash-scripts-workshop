#!/bin/bash

if [ "$#" -ne 1 ]; then
	echo "usage: "$0".sh <Profile>"
	exit 1
fi 
set -x  

aws ec2 describe-instances --query 'Reservations[].Instances[].[LaunchTime,ImageId,PrivateIpAddress,InstanceId,InstanceType,Tags[?Key==`Name`]| [0].Value,State.Name]' --output table --profile $1 --no-cli-pager

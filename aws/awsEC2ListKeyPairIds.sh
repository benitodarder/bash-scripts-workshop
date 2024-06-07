#!/bin/bash

if [ "$#" -lt 1 ]; then
	echo "usage: "$0".sh <Profile>"
	exit 1
fi 

set -x  

PROFILE=$1

aws ec2  describe-key-pairs --profile "$PROFILE" --query 'KeyPairs[].[KeyPairId, KeyName]'
#!/bin/bash

if [ "$#" -lt 3 ]; then
	echo "usage: "$0".sh <Profile> <Key Name> <Path to public key> <Optional arguments>"
	exit 1
fi 

set -x  

PROFILE=$1
shift
KEY_NAME=$1
shift
PATH_TO_KEY=$1
shift

aws ec2 create-key-pair --profile "$PROFILE" --key-name "$KEY_NAME" ---query "KeyMaterial"  "--output text > "$PATH_TO_KEY".pem
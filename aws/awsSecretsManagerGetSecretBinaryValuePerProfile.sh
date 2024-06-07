#!/bin/bash

if [ "$#" -lt 3 ]; then
	echo "usage: "$0".sh <Profile> <Secret name/arn> <Output file> <Optional arguments>"
	exit 1
fi 
set -x

PROFILE="$1"
shift
SECRET_ID="$1"
shift
OUTPUT_FILE="$1"
shift 

aws secretsmanager get-secret-value --secret-id "$SECRET_ID"  --query SecretBinary --output text --profile "$PROFILE" "$@" | base64 --decode -i > "$OUTPUT_FILE"
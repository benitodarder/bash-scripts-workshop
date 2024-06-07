#!/bin/bash

if [ "$#" -lt 4 ]; then
	echo "usage: "$0".sh <Profile> <Certificate> <Private key> <Path to tags JSON file> <Optional arguments>"
	exit 1
fi 

set -x  

PROFILE="$1"
shift
PATH_TO_CERTIFICATE="$1"
shift
PATH_TO_KEY="$1"
shift
PATH_TO_TAGS="$1"
shift 

aws acm import-certificate --profile "$PROFILE" --certificate fileb://"$PATH_TO_CERTIFICATE" --private-key fileb://"$PATH_TO_KEY" --tags file://"$PATH_TO_TAGS" "$@"
#!/bin/bash

if [ "$#" -lt 2 ]; then
	echo "usage: "$0".sh <Profile> <Virtual inteface id.> <Optional arguments>"
	exit 1
fi 

set -x  

PROFILE="$1"
shift 
VIRTUAL_INTERFACE_ID="$1"
shift 

aws directconnect  describe-virtual-interfaces --profile "$PROFILE" --virtual-interface-id $VIRTUAL_INTERFACE_ID --no-cli-pager "$@"
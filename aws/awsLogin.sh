#!/bin/bash

if [ "$#" -lt 1 ]; then
	echo "usage: "$0".sh <Profile>"
	exit 1
fi 

set -x

PROFILE=$1
shift

if type yawsso > /dev/null; then
  set -x
  yawsso login --profile $PROFILE "$@"
  set +x
else
  set -x
  aws sso login --profile $PROFILE "$@"
  set +x
fi


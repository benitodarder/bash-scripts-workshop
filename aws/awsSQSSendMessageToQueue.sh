#!/bin/bash

if [ "$#" -ne 3 ]; then
	echo "usage: "$0".sh <Profile> <SQS URL> <Message, in double quotes>"
	exit 1
fi 

set -x

aws sqs send-message --queue-url $2 --message-body "$3" --profile $1 
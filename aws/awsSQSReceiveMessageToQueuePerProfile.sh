#!/bin/bash

if [ "$#" -ne 2 ]; then
	echo "usage: "$0".sh <Profile> <SQS URL> <Message, in double quotes>"
	exit 1
fi 

aws sqs  receive-message --queue-url $2 --profile $1 
#!/bin/bash

if [ "$#" -ne 1 ]; then
	echo "usage: "$0".sh <Profile>"
	exit 1
fi 

for QUEUEURL in $(aws sqs list-queues --profile $1 | jq .QueueUrls[]); do
  CLEANQUEUEURL=$(echo "$QUEUEURL" | sed -e 's/^"//' -e 's/"$//')
  aws sqs get-queue-attributes --queue-url $CLEANQUEUEURL --attribute-names QueueArn SqsManagedSseEnabled  KmsMasterKeyId KmsDataKeyReusePeriodSeconds  --profile $1
done
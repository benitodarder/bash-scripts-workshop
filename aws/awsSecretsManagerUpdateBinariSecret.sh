#!/bin/bash

SLEEP_DELAY=30

if [ "$#" -ne 4 ]; then
	echo "usage: "$0".sh <Profile> <Secret name> <Secret string file> <Tags file>"
	exit 1
fi 

set -x

aws secretsmanager delete-secret --secret-id $2 --force-delete-without-recovery  --profile $1

echo "Sleeping for $SLEEP_DELAY secons..."
sleep $SLEEP_DELAY
echo "Sleep is over..."

aws  secretsmanager create-secret --tags file://$4 --name $2 --secret-binary fileb://$3 --profile $1


#!/bin/bash

if [ "$#" -ne 2 ]; then
	echo "usage: "$0".sh <Profile> <Substring>"
	exit 1
fi 

ORIGINAL_IFS=$(echo -n "$IFS")

IFS=$'\n'
for HOSTED_ZONE_DATA in $(aws route53 list-hosted-zones --profile $1 --no-cli-pager | jq -cr '.HostedZones[] | {Id: .Id,Name: .Name,Type: .Config.Comment}'); do
  CLEAN_HOSTED_ZONE_ID=$(echo -n "$HOSTED_ZONE_DATA" | jq '.Id' | cut -d / -f 3 | sed -e 's/^"//' -e 's/"$//')
  CLEAN_RECORD=$(echo -n "$HOSTED_ZONE_DATA" | jq '.Name' |  sed -e 's/^"//' -e 's/"$//')
  ZONE_TYPE=$(echo -n "$HOSTED_ZONE_DATA" | jq '.Type' |  sed -e 's/^"//' -e 's/"$//')
  if [[ "$CLEAN_RECORD" =~ "$2" ]]; then
    RECORD_TAGS=$(aws route53 list-tags-for-resource --resource-type hostedzone --resource-id $CLEAN_HOSTED_ZONE_ID --profile $1 --no-cli-pager  | jq '.ResourceTagSet | .Tags')
    echo "Found:"
    echo "  Record id: "$CLEAN_HOSTED_ZONE_ID
    echo "  Record name: "$CLEAN_RECORD
    echo "  Record zone type: "$ZONE_TYPE
    echo "  Record tags: "$RECORD_TAGS
  fi
done
IFS=$ORIGINAL_IFS
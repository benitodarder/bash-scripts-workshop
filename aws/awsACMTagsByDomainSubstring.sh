#!/bin/bash

if [ "$#" -ne 2 ]; then
	echo "usage: "$0".sh <Profile> <Substring>"
	exit 1
fi 

for CERTIFICATE in $(aws acm list-certificates --profile $1 --no-cli-pager | jq -c '.CertificateSummaryList[] '); do
  CERTIFICATE_DOMAIN_NAME=$(echo "$CERTIFICATE" | jq '.DomainName' | sed -e 's/^"//' -e 's/"$//')
  CERTIFICATE_ARN=$(echo "$CERTIFICATE" | jq '.CertificateArn' | sed -e 's/^"//' -e 's/"$//')
  if [[ "$CERTIFICATE_DOMAIN_NAME" =~ "$2" ]]; then
    ACM_TAGS=$(aws acm  list-tags-for-certificate --certificate-arn $CERTIFICATE_ARN --profile $1 --no-cli-pager | jq '.Tags')
    echo "Found:"
    echo "  ACM ARN: "$CERTIFICATE_ARN
    echo "  ACM domain name: "$CERTIFICATE_DOMAIN_NAME
    echo "  ACM tags: "$ACM_TAGS
  fi
done
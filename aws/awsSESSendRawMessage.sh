#!/bin/bash

if [ "$#" -lt 5 ]; then
  echo "usage: "$0" <Profile> <From.> <To> <Subject> <Body file path>" 

PROFILE=$1
shift
FROM=$1
shift
TO=$1
shift
SUBJET=$1
shift
BODY=$1
shift

set -x

aws ses send-raw-email --profile $PROFILE --source $FROM --destinations $TO --subject $SUBJECT --raw-message file://$BODY "$@"


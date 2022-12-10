#!/bin/bash

# Set accordingly :
#
# REGION=<AWS region>
# PROFILE=<Profile authorized to push images>
# ACCOUNT=<AWS account id.>
set -x

aws --region $REGION ecr get-login-password --profile $PROFILE | docker login --username AWS --password-stdin $ACCOUNT.dkr.ecr.$REGION.amazonaws.com

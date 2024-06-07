#!/bin/bash

if [ "$#" -lt 2 ]; then
	echo "usage: "$0".sh <Profile> <VPC id.>"
	exit 1
fi 

set -x  

PROFILE=$1
shift
VPC=$1
shift

export AWS_PROFILE=$PROFILE

aws ec2 describe-internet-gateways --filters 'Name=attachment.vpc-id,Values='$VPC | grep InternetGatewayId
aws ec2 describe-subnets --filters 'Name=vpc-id,Values='$VPC | grep SubnetId
aws ec2 describe-route-tables --filters 'Name=vpc-id,Values='$VPC | grep RouteTableId
aws ec2 describe-network-acls --filters 'Name=vpc-id,Values='$VPC | grep NetworkAclId
aws ec2 describe-vpc-peering-connections --filters 'Name=requester-vpc-info.vpc-id,Values='$VPC | grep VpcPeeringConnectionId
aws ec2 describe-vpc-endpoints --filters 'Name=vpc-id,Values='$VPC | grep VpcEndpointId
aws ec2 describe-nat-gateways --filter 'Name=vpc-id,Values='$VPC | grep NatGatewayId
aws ec2 describe-security-groups --filters 'Name=vpc-id,Values='$VPC | grep GroupId
aws ec2 describe-instances --filters 'Name=vpc-id,Values='$VPC | grep InstanceId
aws ec2 describe-vpn-connections --filters 'Name=vpc-id,Values='$VPC | grep VpnConnectionId
aws ec2 describe-vpn-gateways --filters 'Name=attachment.vpc-id,Values='$VPC | grep VpnGatewayId
aws ec2 describe-network-interfaces --filters 'Name=vpc-id,Values='$VPC | grep NetworkInterfaceId
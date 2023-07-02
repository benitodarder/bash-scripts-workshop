#!/bin/bash

echo "Please check script is called within iac repository..."

if [ "$#" -lt 2 ]; then
	echo "usage: "$0" <Input plan> <Output text file. Extension added by script.>"
	exit 1
fi 


set -x

export INPUT=$1
shift	
export OUTPUT=$1
shift


terraform show -no-color $INPUT > $OUTPUT.txt

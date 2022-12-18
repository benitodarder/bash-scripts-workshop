#!/bin/bash

if [ "$#" -lt 2 ]; then
	echo "usage: "$0" <File id.> <Output file>"
   echo ""
   echo "   From Google Drive 'Get Link' option, with access 'Anyone with the link':"
   echo ""
   echo "       https://drive.google.com/file/d/<File id.>/view?usp=sharing"
	exit 1
fi 

set -x

curl -L -v  -o "$2" "https://drive.google.com/uc?id=$1&export=download"
 

#!/bin/bash

if [ "$#" -lt 1 ]; then
	echo "usage: "$0" <Database>"
	exit 1
fi 

# Set accordingly:
#
# USER=<User name>
# PASSWORD=<Password>
# HOST=<Server name>


if [[ "$1" != "information_schema" ]] && [[ "$1" != "performance_schema" ]] && [[ "$1" != "mysql" ]] && [[ "$1" != _* ]] ; then
    echo "Dumping database: $1"
    mysqldump -u $USER -p$PASSWORD --host=$HOST $1 > `date +%Y%m%d`.$1.sql
fi

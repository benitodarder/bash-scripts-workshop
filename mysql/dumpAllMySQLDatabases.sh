#!/bin/bash

# Set accordingly:
#
# USER=<User name>
# PASSWORD=<Password>
# HOST=<Server name>

databases=`mysql -u $USER -p$PASSWORD -h $HOST -e "SHOW DATABASES;" | tr -d "| " | grep -v Database`
for db in $databases; do
    if [[ "$db" != "information_schema" ]] && [[ "$db" != "performance_schema" ]] && [[ "$db" != "mysql" ]] && [[ "$db" != _* ]] ; then
        echo "Dumping database: $db"
        mysqldump -u $USER -p$PASSWORD --host=$HOST --databases $db > `date +%Y%m%d`.$db.sql
    fi
Done

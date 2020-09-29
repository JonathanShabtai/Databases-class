#!/bin/bash
# note, run this: sh p3.sh shabtai course-psql-4.cs.uchicago.edu
# password: mae2Nohd

if [ $# -lt 2 ]; then
    echo "You should call this script via $0 <cnetID> <assignedServerHost>"
    exit
fi

cmd="psql -h $2 -P pager=off  -U $1 $1 -f "
for i in "drop_tables.sql" "create_db.sql" "populate_db.sql" "query.sql"
do
    var=${cmd}${i}
    echo "Trying to run:"
    echo $var
    $var
done


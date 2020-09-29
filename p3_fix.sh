#!/bin/bash
cmd="psql -h course-psql-4.cs.uchicago.edu -P pager=off  -U shabtai shabtai -f "
for i in "drop_tables.sql" "create_db.sql" "populate_db.sql" "query.sql"
do
    var=${cmd}${i}
    echo $var
    $var
done
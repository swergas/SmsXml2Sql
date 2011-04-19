#!/bin/sh
for i in $*; do
	echo "Importing file $i"
	./sms_xml2sql.sh $i > $i.sql
	mysql --user=root --password=testouille test < $i.sql
	rm $i.sql
done

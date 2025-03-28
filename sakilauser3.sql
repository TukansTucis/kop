#!/bin/bash

DB_USER=""
DB_PASS=""
DB_NAME=""

mysql -u$DB_USER -p$DB_PASS -e "SOURCE ~/Downloads/school/sakila-db/sakila-schema.sql;"
mysql -u$DB_USER -p$DB_PASS -e "SOURCE ~/Downloads/school/sakila-db/sakila-data.sql;"

mysql -u$DB_USER -p$DB_PASS -e "CREATE USER 'user3'@'%' IDENTIFIED BY 'Password!23';"
mysql -u$DB_USER -p$DB_PASS -e "GRANT ALL PRIVILEGES ON sakila.* TO 'user3'@'%';"
mysql -u$DB_USER -p$DB_PASS -e "FLUSH PRIVILEGES;"

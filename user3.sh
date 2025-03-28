#!/bin/bash

DB_USER="root"
DB_PASS="your_password"
SAKILA_SQL_PATH="/path/to/sakila-data.sql"

mariadb -u$DB_USER -p$DB_PASS < $SAKILA_SQL_PATH

USER_PASS="Password!23"
mariadb -u$DB_USER -p$DB_PASS -e "CREATE USER 'user3'@'localhost' IDENTIFIED BY '$USER_PASS';"

mariadb -u$DB_USER -p$DB_PASS -e "GRANT ALL PRIVILEGES ON sakila.* TO 'user3'@'localhost';"

mariadb -u$DB_USER -p$DB_PASS -e "FLUSH PRIVILEGES;"

echo "Sakila database imported and user3 created with full privileges on sakila."

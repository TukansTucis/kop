#!/bin/bash

read -p "Enter MySQL username: " DB_USER
read -sp "Enter MySQL password: " DB_PASS
echo

mysql -u$DB_USER -p$DB_PASS -e "SHOW DATABASES;"

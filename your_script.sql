#!/bin/bash

DB_USER="root"
DB_PASS="your_password"
DB_NAME="sakila"

mysql -u$DB_USER -p$DB_PASS $DB_NAME < your_script.sql

#!/bin/bash

DB_USER="root"
DB_PASS="your_password"

USER_PASSWORDS=("Password!1" "Password!2" "Password!3" "Password!4" "Password!5" "Password!6" "Password!7" "Password!8" "Password!9" "Password!10")

for i in {1..10}
do
    USERNAME="user$i"
    DB_NAME="db_user$i"
    USER_PASS="${USER_PASSWORDS[$i-1]}"
    
    mariadb -u$DB_USER -p$DB_PASS -e "CREATE USER '$USERNAME'@'localhost' IDENTIFIED BY '$USER_PASS';"
    
    mariadb -u$DB_USER -p$DB_PASS -e "CREATE DATABASE $DB_NAME;"
    
    mariadb -u$DB_USER -p$DB_PASS -e "CREATE TABLE $DB_NAME.table1 (id INT AUTO_INCREMENT PRIMARY KEY, name VARCHAR(100), age INT);"
    
    mariadb -u$DB_USER -p$DB_PASS -e "GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$USERNAME'@'localhost' WITH GRANT OPTION;"
    
    mariadb -u$DB_USER -p$DB_PASS -e "REVOKE DROP ON $DB_NAME.* FROM '$USERNAME'@'localhost';"
    
    mariadb -u$DB_USER -p$DB_PASS -e "GRANT SELECT ON sakila.* TO '$USERNAME'@'localhost';"
    
    mariadb -u$DB_USER -p$DB_PASS -e "FLUSH PRIVILEGES;"
done

echo "10 users created with their unique databases and privileges!"

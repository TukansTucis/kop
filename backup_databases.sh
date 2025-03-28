#!/bin/bash

read -p "Enter MySQL/MariaDB username: " DB_USER
read -sp "Enter MySQL/MariaDB password: " DB_PASS
echo
read -p "Enter backup directory path (e.g., /home/user/backups): " BACKUP_DIR
read -p "Enter process log file path (e.g., /home/user/processes_status.log): " PROCESS_LOG

mkdir -p "$BACKUP_DIR"

for DB in $(mysql -u$DB_USER -p$DB_PASS -e "SHOW DATABASES;" | grep -Ev "(information_schema|performance_schema|mysql|sys)"); do
    mysqldump -u$DB_USER -p$DB_PASS --databases $DB > "$BACKUP_DIR/$DB-$(date +\%F).sql"
done

find "$BACKUP_DIR" -type f -name "*.sql" -mtime +7 -exec rm {} \;

echo "Process list:" > "$PROCESS_LOG"
mysqladmin -u$DB_USER -p$DB_PASS processlist >> "$PROCESS_LOG"
echo "Server status:" >> "$PROCESS_LOG"
mysqladmin -u$DB_USER -p$DB_PASS status >> "$PROCESS_LOG"

echo "Backup and server status tasks completed."

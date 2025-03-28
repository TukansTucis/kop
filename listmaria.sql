SHOW DATABASES;

SELECT user, host FROM mysql.user;

SELECT CONCAT('SHOW GRANTS FOR ''', user, '''@''', host, ''';') 
FROM mysql.user;

SELECT CONCAT('USE ', table_schema, '; SHOW TABLES;') 
FROM information_schema.tables 
WHERE table_schema NOT IN ('information_schema', 'performance_schema', 'mysql', 'sys');

SELECT user, host, authentication_string FROM mysql.user;

SELECT CONCAT('SELECT GRANTEE, TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, PRIVILEGE_TYPE FROM information_schema.column_privileges WHERE TABLE_SCHEMA = ''', table_schema, ''';') 
FROM information_schema.tables 
WHERE table_schema NOT IN ('information_schema', 'performance_schema', 'mysql', 'sys');

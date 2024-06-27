#!/bin/bash

/etc/init.d/mariadb start

#making admin user and database if they don't already exist
mariadb -u root -e "CREATE DATABASE IF NOT EXISTS ${MYSQL_DATABASE};";
mariadb -u root -e "CREATE USER IF NOT EXISTS '${MYSQL_ADMIN_USER}'@'%' IDENTIFIED BY '${MYSQL_ADMIN_PASSWORD}'";
mariadb -u root -e "GRANT ALL PRIVILEGES ON ${MYSQL_DATABASE}.* TO '${MYSQL_ADMIN_USER}'@'%' WITH GRANT OPTION";
#mariadb -u root -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}'";
flush privileges;
mariadb -u root -e "FLUSH PRIVILEGES";

/etc/init.d/mariadb stop
mysqld --user=mysql
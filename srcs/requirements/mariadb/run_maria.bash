#!/bin/bash

export MYSQL_ADMIN_PASSWORD=$(cat /run/secrets/admin_pw)
export MYSQL_PASSWORD=$(cat /run/secrets/user_pw)

#mariadb-install-db
/etc/init.d/mariadb start

mariadb -u root -e "CREATE DATABASE IF NOT EXISTS ${MYSQL_DATABASE};";
mariadb -u root -e "CREATE USER IF NOT EXISTS '${MYSQL_ADMIN_USER}'@'%' IDENTIFIED BY '${MYSQL_ADMIN_PASSWORD}'";
mariadb -u root -e "GRANT ALL PRIVILEGES ON ${MYSQL_DATABASE}.* TO '${MYSQL_ADMIN_USER}'@'%' WITH GRANT OPTION";
mariadb -u root -e "FLUSH PRIVILEGES";


/etc/init.d/mariadb stop
mysqld --user=mysql


# if statement if already run?!
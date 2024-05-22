#!/bin/bash
#stops script when any command fails
#set -e

#mariadb-install-db
/etc/init.d/mariadb start
#mariadb < create_users.sql

#mysql -u mysql -p${MYSQL_ROOT_PASSWORD} -e "CREATE DATABASE wordpress_db;";
#mysql -u mysql -p${MYSQL_ROOT_PASSWORD} -e "CREATE USER 'lisa'@'%' IDENTIFIED BY 'root_password'";
#mysql -u mysql -p${MYSQL_ROOT_PASSWORD} -e "GRANT ALL PRIVILEGES ON *.* TO 'lisa'@'%' WITH GRANT OPTION";
#mysql -u mysql -p${MYSQL_ROOT_PASSWORD} -e "FLUSH PRIVILEGES";
echo "1"
mariadb -u root -e "CREATE DATABASE IF NOT EXISTS wordpress_db;";
echo "2"
mariadb -u root -e "CREATE USER IF NOT EXISTS 'lisa'@'%' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}'";
echo "3"
mariadb -u root -e "GRANT ALL PRIVILEGES ON *.* TO 'lisa'@'%' WITH GRANT OPTION";
echo "4"
mariadb -u root -e "FLUSH PRIVILEGES";
echo "5"


/etc/init.d/mariadb stop
echo "6"
mysqld --user=mysql


# if statement if already run?!
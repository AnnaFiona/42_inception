#!/bin/bash
#stops script when any command fails
#set -e

#mariadb-install-db
/etc/init.d/mariadb start

#mysql -u mysql -p${MYSQL_ROOT_PASSWORD} -e "CREATE DATABASE wordpress_db;";
#mysql -u mysql -p${MYSQL_ROOT_PASSWORD} -e "CREATE USER 'lisa'@'%' IDENTIFIED BY 'root_password'";
#mysql -u mysql -p${MYSQL_ROOT_PASSWORD} -e "GRANT ALL PRIVILEGES ON *.* TO 'lisa'@'%' WITH GRANT OPTION";
#mysql -u mysql -p${MYSQL_ROOT_PASSWORD} -e "FLUSH PRIVILEGES";
mariadb -u root -e "CREATE DATABASE IF NOT EXISTS ${MYSQL_DATABASE};";
mariadb -u root -e "CREATE USER IF NOT EXISTS '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}'";
mariadb -u root -e "GRANT ALL PRIVILEGES ON ${MYSQL_DATABASE}.* TO '${MYSQL_USER}'@'%' WITH GRANT OPTION";
mariadb -u root -e "FLUSH PRIVILEGES";


/etc/init.d/mariadb stop
mysqld --user=mysql


# if statement if already run?!
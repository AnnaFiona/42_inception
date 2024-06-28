#!/bin/bash

#setting up mariadb-users if not done before (script won't leave the block when it enters, but it only happens the first time the script is run)
if ! [ -f "create_users.sql" ]; then
    #creating sql script
    echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';
    CREATE DATABASE IF NOT EXISTS ${MYSQL_DATABASE};
    CREATE USER IF NOT EXISTS '${MYSQL_ADMIN_USER}'@'%' IDENTIFIED BY '${MYSQL_ADMIN_PASSWORD}';
    GRANT ALL PRIVILEGES ON ${MYSQL_DATABASE}.* TO '${MYSQL_ADMIN_USER}'@'%' WITH GRANT OPTION;
    FLUSH PRIVILEGES;" > create_users.sql

    #making mysqld dir and giving ownership to mysql user
    mkdir /run/mysqld
    chown mysql:mysql /run/mysqld
    chown mysql:mysql create_users.sql

    #starting the db with the sql script; this only needs to happen the first time it starts
    echo "* start mariadb with init file"
    mysqld --user=mysql --init-file=/usr/src/create_users.sql
fi

echo "* start mariadb"
mysqld --user=mysql
#!/bin/bash
#stops script when any command fails
#set -e

#mariadb-install-db
/etc/init.d/mariadb start
mariadb < create_users.sql
/etc/init.d/mariadb stop
mysqld --user=mysql


# if statement if already run?!
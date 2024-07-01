#!/bin/bash
set -e

#making directory for volume if it doesn't exist
if ! [ -d "/var/www/html" ]; then
    mkdir /var/www/html
    echo "* made /var/www/html"
fi

#installing wordpress if it isn't installed
if ! [ -d "/var/www/html/wordpress" ]; then
    wget -q -P /var/www/html/ http://wordpress.org/latest.tar.gz
    tar xfz /var/www/html/latest.tar.gz -C /var/www/html/
    rm -f /var/www/html/latest.tar.gz
    chown -R www-data:www-data /var/www/html/wordpress/
    echo "* downloaded wordpress"
fi

#installing wp-cli if it isn't installed already
if ! [ -f "/usr/local/bin/wp/wp-cli.phar" ]; then
    wget -q https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
    chmod +x wp-cli.phar
    mv wp-cli.phar /usr/local/bin/wp
    echo "* installed wp-cli"
fi

#creating wp-config.php file if it isn't already there
if ! [ -f "/var/www/html/wordpress/wp-config.php" ]; then
    wp config create --quiet --allow-root --path=/var/www/html/wordpress \
        --dbname=${MYSQL_DATABASE} \
        --dbuser=${MYSQL_ADMIN_USER} \
        --dbpass=${MYSQL_ADMIN_PASSWORD} \
        --dbhost=${MYSQL_DATABASE_HOST} \
        --dbprefix=wp_ 
    echo "* created wp-config.php"
fi

#doing wp core install and adding admin wp user if not done already
#the if displayes error, but it's just to check if we need to do core install so it is expected
if ! wp user get "${MYSQL_ADMIN_USER}" --quiet --allow-root --path=/var/www/html/wordpress; then
    wp core install --allow-root --path=/var/www/html/wordpress \
        --url=https://aplank.42.fr \
        --title="Site Title" \
        --admin_user=${MYSQL_ADMIN_USER} \
        --admin_password=${MYSQL_ADMIN_PASSWORD} \
        --admin_email=${MYSQL_ADMIN_USER}@example.com \
        --skip-email
    echo "* did wp core install (made wp admin)"
fi

#adding normal wp user if not already there
#the if displayes error, but it's just to check if the user exists so it is expected
if ! wp user get "${MYSQL_USER}" --quiet --allow-root --path=/var/www/html/wordpress; then
    wp user create "${MYSQL_USER}" ${MYSQL_USER}@example.com --user_pass=${MYSQL_USER_PASSWORD} --allow-root --path=/var/www/html/wordpress
    echo "* made wp user"
fi

if ! [ -d "/run/php" ]; then
    mkdir /run/php
fi

echo "* starting wp"
/usr/sbin/php-fpm7.4 -F
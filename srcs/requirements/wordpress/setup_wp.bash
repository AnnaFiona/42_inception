#!/bin/bash
set -e #?

#exporting secrets
export MYSQL_ADMIN_PASSWORD=$(cat /run/secrets/admin_pw)
export MYSQL_USER_PASSWORD=$(cat /run/secrets/user_pw)

#making directory for volume if it doesn't exist
if ! [ -d "/var/www/html" ]; then
    mkdir /var/www/html
    echo "made /var/www/html"
fi

#installing wordpress if it isn't installed
if ! [ -d "/var/www/html/wordpress" ]; then
    wget -q -P /var/www/html/ http://wordpress.org/latest.tar.gz
    tar xfz /var/www/html/latest.tar.gz -C /var/www/html/
    rm -f /var/www/html/latest.tar.gz
    chown -R www-data:www-data /var/www/html/wordpress/
    echo "downloaded wordpress"
fi

#copying modified wp-config.php file if it isn't already there
if ! [ -f "/var/www/html/wordpress/wp-config.php" ]; then
    cp wp-config.php /var/www/html/wordpress
    echo "copied wp-config.php"
fi

#installing wp-cli if it isn't installed already
if ! [ -f "/usr/local/bin/wp/wp-cli.phar" ]; then
    curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
    chmod +x wp-cli.phar
    mv wp-cli.phar /usr/local/bin/wp
    echo "installed wp-cli"
fi

#doing wp core install and adding admin wp user if not done already
if ! wp user get "${MYSQL_ADMIN_USER}" --quiet --allow-root --path=/var/www/html/wordpress; then
    wp core install --allow-root --path=/var/www/html/wordpress \
        --url=https://aplank.42.fr \
        --title="Site Title" \
        --admin_user=${MYSQL_ADMIN_USER} \
        --admin_password=${MYSQL_ADMIN_PASSWORD} \
        --admin_email=${MYSQL_ADMIN_USER}@example.com
    echo "did wp core install (made wp admin)"
fi

#adding normal wp user if not already there
if ! wp user get "${MYSQL_USER}" --quiet --allow-root --path=/var/www/html/wordpress; then
    wp user create "${MYSQL_USER}" ${MYSQL_USER}@example.com --user_pass=${MYSQL_USER_PASSWORD} --allow-root --path=/var/www/html/wordpress
    echo "made wp user"
fi

echo "starting wp"
/usr/sbin/php-fpm8.2 -F
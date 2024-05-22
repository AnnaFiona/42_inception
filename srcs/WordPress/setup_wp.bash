#!/bin/bash
if ! [ -d "/var/www/html" ]; then
    mkdir /var/www/html
    echo "made /var/www/html"
fi

if ! [ -d "/var/www/html/wordpress" ]; then
    wget -q -P /var/www/html/ http://wordpress.org/latest.tar.gz
    tar xfz /var/www/html/latest.tar.gz -C /var/www/html/
    #mv /var/www/html/wordpress/* /var/www/html/
    rm -f /var/www/html/latest.tar.gz
    chown -R www-data:www-data /var/www/html/wordpress/
    #rm /var/www/html/index.html
    # rm wordpress ?
    echo "downloaded wordpress"
fi

if ! [ -f "/var/www/html/wordpress/wp-config.php" ]; then
    cp wp-config.php /var/www/html/wordpress
fi

/etc/init.d/php8.2-fpm start
sleep infinity
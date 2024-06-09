#!/bin/bash

#making ssl-certificates directory if it doesn't exist yet
if ! [ -d /var/www/html/ssl-certificates/ ]; then
	mkdir /var/www/html/ssl-certificates/;
	echo "made ssl-certificates directory"
fi

#making self-signed ssl/tls-certificate if it doesn't exist
if ! [ -f "/var/www/html/ssl-certificates/aplank.42.fr.crt" ]; then
	openssl req -x509 -nodes -new -sha256 -days 1024 -newkey rsa:2048 -keyout /var/www/html/ssl-certificates/aplank.42.fr.key -out /var/www/html/ssl-certificates/aplank.42.fr.pem -subj "/CN=aplank.42.fr";
	openssl x509 -outform pem -in /var/www/html/ssl-certificates/aplank.42.fr.pem -out /var/www/html/ssl-certificates/aplank.42.fr.crt;
	echo "made ssl/tls-certificate"
fi

#starting nginx
echo "starting nginx"
nginx -g 'daemon off;'
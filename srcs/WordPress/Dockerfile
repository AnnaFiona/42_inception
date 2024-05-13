FROM debian:12.5

RUN apt-get -qq update
RUN apt-get install -yqq wordpress php php-fpm wget

WORKDIR /var/www/html/

COPY setup_wp.bash /var/www/html/setup_wp.bash

EXPOSE 3306 9000

ENTRYPOINT ["/var/www/html/setup_wp.bash"]
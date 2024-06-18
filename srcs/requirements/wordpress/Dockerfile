FROM debian:bullseye

RUN apt-get -qq update
RUN apt-get install -yqq wordpress php php-fpm wget coreutils

WORKDIR /usr/src/

COPY setup_wp.bash .
COPY www.conf /etc/php/7.4/fpm/pool.d/
RUN chmod 777 setup_wp.bash

EXPOSE 9000

ENTRYPOINT ["./setup_wp.bash"]
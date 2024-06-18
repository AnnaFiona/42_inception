FROM debian:12.5

RUN apt-get -qq update
RUN apt-get install -yqq wordpress php php-fpm wget coreutils curl

WORKDIR /usr/src/

COPY setup_wp.bash .
COPY www.conf /etc/php/8.2/fpm/pool.d/
RUN chmod 777 setup_wp.bash

EXPOSE 9000

ENTRYPOINT ["./setup_wp.bash"]
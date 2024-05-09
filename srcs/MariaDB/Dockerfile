FROM debian:12.5

RUN apt-get -qq update
RUN apt-get install -yqq mariadb-server

EXPOSE 3306

HEALTHCHECK --start-period=5m \
  CMD mariadb -e 'SELECT @@datadir;' || exit 1

CMD ["mariadb"]
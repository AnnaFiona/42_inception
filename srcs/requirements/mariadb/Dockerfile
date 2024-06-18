FROM debian:bullseye

RUN apt-get -qq update
RUN apt-get install -yqq mariadb-server

WORKDIR /usr/src/

COPY run_maria.bash .
COPY 50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

EXPOSE 3306

ENTRYPOINT ["./run_maria.bash"]
FROM debian:12.5

RUN apt-get -qq update
RUN apt-get install -yqq mariadb-server
#RUN mysql_secure_installation

WORKDIR /usr/src/

COPY run_maria.bash .
COPY create_users.sql .
COPY 50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

EXPOSE 3306

#HEALTHCHECK --start-period=5m \
#  CMD mariadb -e 'SELECT @@datadir;' || exit 1

ENTRYPOINT ["./run_maria.bash"]
#CMD ["mariadb"]
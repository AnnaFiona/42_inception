FROM debian:12.5

RUN apt-get -qq update
RUN apt-get install -yqq mariadb-server
#RUN mysql_secure_installation

WORKDIR /usr/src/

COPY run_maria.bash .

EXPOSE 3306

#HEALTHCHECK --start-period=5m \
#  CMD mariadb -e 'SELECT @@datadir;' || exit 1

ENTRYPOINT ["./run_maria.bash"]
CMD ["mariadb"]